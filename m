Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2LSB-0003Jr-2H
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 13:47:21 +0100
Received: by mail-da0-f42.google.com with SMTP id z17so2662385dal.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2013 04:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Djn0fF4WRggB1IgiOqswaM4ffogRy3Z7hQQWUHSwjaI=;
	b=KLlZ5gC9TMyAjuKnmqYJT/8wcavdYXznXwoExhZ6oVVsYJ017S69k9QIX/lI4Phyzd
	Cx8ADWd+0HxJTh4TIwTlVUbPXCFajUMmrcJCNf8hWnf/ut4CeP3+7HvrCbmy0nU+Sbvt
	gokv2zKgC+BgTyj5rWGJKAhR/fwhReic/EsMlFkMEgcg7IFciMMfn49lKGQHKYbzSewH
	cYPpl2wyMQfz4a2eT4jAUyvS+IhtFH562TdF3sZrn+55CukZsQI+HT7BP3nNxFYPJUnc
	0tO2UM0MijLzWXAz/f+po6v0tlWNZS56vDNXN9K19Z1NYYaF4n4UWuYA6WEoaUM+tXSZ
	5aQg==
X-Received: by 10.66.75.133 with SMTP id c5mr11226009paw.31.1359981090218;
	Mon, 04 Feb 2013 04:31:30 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x2sm21047235paw.8.2013.02.04.04.31.27
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 04:31:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 12:31:03 +0100
Message-Id: <1359977464-19529-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1359977464-19529-1-git-send-email-Martin.Jansa@gmail.com>
References: <keem7q@ger.gmane.org>
	<1359977464-19529-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] nodejs-0.8.18: prefix CC/CXX with STAGING_BINDIR_TOOLCHAIN
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
X-List-Received-Date: Mon, 04 Feb 2013 12:47:22 -0000

* this way there is smaller chance that gcc/g++/ld wrapper will cause fork bomb

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
index 1a1c66b..63c9660 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
@@ -21,15 +21,26 @@ ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '-
 ARCHFLAGS ?= ""
 
 # Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
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
 
   echo '#!/bin/sh' > ${WORKDIR}/ld
-  echo '${CXX} $@'>> ${WORKDIR}/ld
+  echo "${TOOLCHAIN_CXX_PREFIX}/${CXX} \$@" >> ${WORKDIR}/ld
 
   chmod +x ${WORKDIR}/gcc ${WORKDIR}/g++ ${WORKDIR}/ld
 
-- 
1.8.1.2



