Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2LRC-0003GL-QA
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 13:46:19 +0100
Received: by mail-da0-f51.google.com with SMTP id i30so2623830dad.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 04:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=5lQmgPprFUSgtsfOTAz/L04L80r4choTH31Z0IIEK5k=;
	b=a9ju+bjKVLXpDkc2USKcPGZbFkAMMANqgAYqXfqr6yJTL5i2a0FYtTeCm2BUkQzfpm
	WTb8SvRJpDcw8rsbUzsluvfcLKBZDEDDrURqqSPKzSwqmCFvCHzfH3Hp/xuK4MP+9e8U
	qFDFZkkQsO7FJ6VnaZTr9RGZSHWqS3W6UPv3Jk4OAfldMgZd1DR3m8WLlDc4jFJJ2N8F
	bwrbxtC9h+MjkVj2Ej4V0wdpRVI+STqbML7L6X96JIC20E5lB28XaQAddDkX9SMGoNAb
	sjBRv85Uuni7o+mNPJdChi6sp/MctH0FSMRa/x1yMHN2P+qOW3GOolWXcpB5Gd35LmyS
	u8SA==
X-Received: by 10.66.72.97 with SMTP id c1mr52383465pav.48.1359981029627;
	Mon, 04 Feb 2013 04:30:29 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x6sm21050715paw.0.2013.02.04.04.30.26
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 04:30:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 12:30:16 +0100
Message-Id: <1359977416-19275-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1359908629-28218-1-git-send-email-Martin.Jansa@gmail.com>
References: <1359908629-28218-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH] nodejs: prefix CC/CXX with STAGING_BINDIR_TOOLCHAIN
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 12:46:20 -0000

* this way there is smaller chance that gcc/g++/ld wrapper will cause fork bomb

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.6.21.bb | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.21.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.21.bb
index 3d034f2..c027679 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.21.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.21.bb
@@ -23,12 +23,23 @@ do_configure_virtclass-native () {
 }
 
 # Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround waf+scons
+do_configure_prepend_class-target () {
+  TOOLCHAIN_CC_PREFIX="${STAGING_BINDIR_TOOLCHAIN}"
+  TOOLCHAIN_CXX_PREFIX="${STAGING_BINDIR_TOOLCHAIN}"
+}
+do_configure_prepend_class-native () {
+  NATIVE_CC=`which gcc`
+  NATIVE_CXX=`which g++`
+  TOOLCHAIN_CC_PREFIX=`dirname "${NATIVE_CC}"`
+  TOOLCHAIN_CXX_PREFIX=`dirname "${NATIVE_CXX}"`
+}
+
 do_configure () {
   echo '#!/bin/sh' > ${WORKDIR}/gcc
-  echo '${CC} $@' >> ${WORKDIR}/gcc
+  echo "${TOOLCHAIN_CC_PREFIX}/${CC} \$@" >> ${WORKDIR}/gcc
 
   echo '#!/bin/sh' > ${WORKDIR}/g++
-  echo '${CXX} $@'>> ${WORKDIR}/g++
+  echo "${TOOLCHAIN_CXX_PREFIX}/${CXX} \$@" >> ${WORKDIR}/g++
 
   chmod +x ${WORKDIR}/gcc ${WORKDIR}/g++
 
-- 
1.8.1.2



