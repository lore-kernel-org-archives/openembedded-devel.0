Return-Path: <jkv@unixcluster.dk>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id A595977070
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 20:50:51 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so913523wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jud+ndpiWmQ4TQKi/B9aEVvfMpGzm1qGxYPS8M57BcE=;
	b=lOxiKUYFopST2yEhSH59xY9vlsso692m+vsdgd0+vxLRDuFiFsZimJiDku6BOsWC9Q
	D6Z1LMLT+v84dAXxFnW3N7AwHRpOLd+Br9a5cbsgzNGtYmnOOCT8Bzo1/vyIKLr4ILCi
	RlaPju4MwohCechfnuS8W37tB+sa+4Kp+zcR9J5KEeRYEFBCjFenJnT/kCQEJ5xdKk/v
	Vmd7VG2w723H40glijd1rx8BxjXIlS/wCQT+fERDxXpKR1G3Cm7bc/UIs1fHRQEJnwj1
	oMN7EvWkQl4AqP8rno68Sz3aAiJGFEAjQYHoJBbqm4tGaVD/o3XGXXJjDtSyK28wQRaz
	mxFw==
X-Gm-Message-State: ALoCoQmN4C7rsCHo/vEi7SM2Wuou7+9I36dT8G4SmTJEQ9PMMCIMRSRzY12k3AAGMv5MZZv0HivD
X-Received: by 10.180.12.145 with SMTP id y17mr7305086wib.83.1443646250961;
	Wed, 30 Sep 2015 13:50:50 -0700 (PDT)
Received: from localhost.localdomain (d40a9f94.rev.stofanet.dk.
	[212.10.159.148]) by smtp.gmail.com with ESMTPSA id
	gt4sm31471642wib.21.2015.09.30.13.50.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Sep 2015 13:50:50 -0700 (PDT)
From: Johnny Vestergaard <jkv@unixcluster.dk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Sep 2015 22:50:35 +0200
Message-Id: <1443646235-9298-1-git-send-email-jkv@unixcluster.dk>
X-Mailer: git-send-email 2.6.0
Subject: [meta-oe][PATCH] mongodb: receipe fixed, removed from blacklist and now cross compiles to arm.
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
X-List-Received-Date: Wed, 30 Sep 2015 20:50:52 -0000

Removed the dependencies on system boost.

Signed-off-by: Johnny Vestergaard <jkv@unixcluster.dk>
---
 meta-oe/recipes-support/mongodb/mongodb_git.bb | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
index 879fc7c..7348978 100644
--- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
@@ -3,7 +3,7 @@ LICENSE = "AGPL-3.0 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://GNU-AGPL-3.0.txt;md5=73f1eb20517c55bf9493b7dd6e480788 \
                     file://APACHE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-DEPENDS = "openssl libpcre boost libpcap"
+DEPENDS = "glibc openssl libpcre boost libpcap"
 # Mongo uses tcmalloc on x86_64, which is provided by gperftools
 DEPENDS_append_x86-64 = " gperftools"
 
@@ -14,7 +14,7 @@ inherit scons
 # | scons: *** [build/linux2/disable-scripting/ld_arm-oe-linux-gnueabi-g++/ssl/use-system-boost/use-system-pcre/use-system-tcmalloc/mongo/mongod] Error 1
 # | scons: building terminated because of errors.
 # | ERROR: scons build execution failed.
-PNBLACKLIST[mongodb] ?= "Fails to build with system boost"
+#PNBLACKLIST[mongodb] ?= "Fails to build with system boost"
 
 PV = "2.6.0+git${SRCPV}"
 SRCREV = "be1905c24c7e5ea258e537fbf0d2c502c4fc6de2"
@@ -30,15 +30,12 @@ S = "${WORKDIR}/git"
 
 export OE_TARGET_ARCH="${TARGET_ARCH}"
 
-EXTRA_OESCONS = "--prefix=${D}${prefix} \
+EXTRA_OESCONS = "sysroot=${STAGING_DIR_TARGET} \
+                 --prefix=${D}${prefix} \
                  --propagate-shell-environment \
                  --cc-use-shell-environment \
                  --cxx-use-shell-environment \
-                 --ld='${TARGET_PREFIX}g++' \
                  --ssl \
-                 --use-system-pcre \ 
-                 --use-system-boost \
-                 --use-system-tcmalloc \
                  --disable-scripting \
                  --nostrip \
                  mongod mongos"
-- 
2.6.0


