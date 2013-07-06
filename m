Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 52C086204F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jul 2013 19:33:26 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so2110026eak.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jul 2013 12:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iBgcvrByI6C/BcSOJUvB9su4V2DWsYr+GkOrWlISUGw=;
	b=nFCeuHAIP/EIgRpgX/xXpFYLXrprXm5RrAvXS8g1LVleUi9k9r9pTk1bgKjn2RIQGq
	mRiUqlDtu1CWuQ02kKHh870is92NXgxrOGct+6lK6KbCWtjZxPwJulYzQmEOjNRKmZK9
	V1IkGeCBbv77x88SU8riB4k0ISoE65BH06Lxv0CcS3LkYQInX3y9w27yL9TWle3G5YCy
	4Oo8L+Y6SdzmoQn75w3w5RTuzwXLf13tGA5wYqlGjzk3HgV/5qu2Iw8oP6RJyOkU14qf
	P2tM8gjRM8wVTDyxpWdmPb575Zwf+Mt4TrBrB9UTdfCArnKtvI0iqGqacBIJB3ICLF9O
	vpZw==
X-Received: by 10.14.224.201 with SMTP id x49mr17667943eep.6.1373139207084;
	Sat, 06 Jul 2013 12:33:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b7sm26207504eef.16.2013.07.06.12.33.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 12:33:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Jul 2013 21:33:21 +0200
Message-Id: <5f6a17279e50da1b59bc9d0c637c6715053055fb.1373139082.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <5d905be3007b8c80144f011101a2c999b7b6011a.1373139082.git.Martin.Jansa@gmail.com>
References: <5d905be3007b8c80144f011101a2c999b7b6011a.1373139082.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1373139082.git.Martin.Jansa@gmail.com>
References: <cover.1373139082.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] llvm2: don't install llvm-config to bindir
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Jul 2013 19:33:26 -0000

* there is llvm-config in binconfig/LLVM_RELEASE
* this one was creating conflict between different llvm*-dev versions
  installed on target:
  ./llvm2.9/2.9-r3/packages-split/llvm2.9-dev/usr/bin/llvm2.9/llvm-config
  ./llvm2.9/2.9-r3/packages-split/llvm2.9-dev/usr/bin/llvm-config
  ./llvm2.8/2.8-r3/packages-split/llvm2.8-dev/usr/bin/llvm2.8/llvm-config
  ./llvm2.8/2.8-r3/packages-split/llvm2.8-dev/usr/bin/llvm-config

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm2.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-oe/recipes-core/llvm/llvm2.inc b/meta-oe/recipes-core/llvm/llvm2.inc
index b5bad45..5ae993a 100644
--- a/meta-oe/recipes-core/llvm/llvm2.inc
+++ b/meta-oe/recipes-core/llvm/llvm2.inc
@@ -110,11 +110,6 @@ do_install() {
 
     # LLVM does not install this by default.
     install bin/tblgen ${D}${bindir}/${LLVM_DIR}
-
-    # we install it here unmodified for native and none native and overwrite it
-    # later for native case
-    install -d ${D}${bindir}
-    install -m 0755 bin/llvm-config ${D}${bindir}
 }
 
 SYSROOT_PREPROCESS_FUNCS_append_class-target = " llvm_sysroot_preprocess"
-- 
1.8.2.1


