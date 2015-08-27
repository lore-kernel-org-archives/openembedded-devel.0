Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id D84B460043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 15:59:30 +0000 (UTC)
Received: by qkbm65 with SMTP id m65so12707203qkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 08:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vPWVTNHUdsWFWHU4E2g4IdkxazGrShwH7KdY182YMaM=;
	b=NPX6Hqb94LENf77C5peTGP0MtWnoMAPdW3/dS3ijY5NLukjHhMbxX0cYV+KEdCNsY+
	RnufAqCbB5i2QNnGVgjkbaeexZg+qJwjlIPKWpCMjcp1df34GjKYviAtOh2kV0WC10D4
	gmiChmJ3XQcXITz8UfdvuXlX5EFvvKFQITSXXrpXN9QOOFPiQE8xMDJyhTVUBLX9hd+2
	2YheutugwsiB8eitpjund5Fp1XCDLX3oy+il3+ZrHNlwyWCY+qclcSwcrxF++FcZ/kz2
	Tgvzg6tAa0Foa03tMBzUpH9r2HTl5Xn3zbxjPAWRjX6Sa4DndinFLAOO3ak40Y8tg30F
	dGTw==
X-Received: by 10.55.15.3 with SMTP id z3mr7779898qkg.29.1440691170692;
	Thu, 27 Aug 2015 08:59:30 -0700 (PDT)
Received: from khem-dvm-001.sys.comcast.net (a-96-119-177-31.sys.comcast.net.
	[96.119.177.31]) by smtp.gmail.com with ESMTPSA id
	125sm1472665qht.21.2015.08.27.08.59.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Aug 2015 08:59:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2015 15:59:14 +0000
Message-Id: <1440691154-4175-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][PATCH] qtbase: Fix prefix substitution from OE to QT variable
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
X-List-Received-Date: Thu, 27 Aug 2015 15:59:31 -0000

In recent commit c0cc4ff88292d1ddd9d30007e4947342d71ae77d
it was changed to replace STAGING_DIR_NATIVE and STAGING_DIR_HOST with
qmake variables, however there is a little difference between them and
they are not one to one mapped, OE sysroot variable does not contain
prefix (/usr) at the end but QT_INSTALL_PREFIX and QT_HOST_PREFIX does,
so we need to take care of substituting the full string, so qmake can
formulate the header and library search paths correctly. It fixes the
issue where qmake started to have wrong search paths with duplicated
<sysroot>/usr/usr/include/... added to compiler commandline and which
meant that compiler did not find the headers in sysroot while building
components like qtwebkit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 006968b..18eee96 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -238,8 +238,8 @@ do_install_append() {
     rm -rf ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/macx-ios-clang
 
     # Replace host paths with qmake built-in properties
-    sed -i -e 's| ${STAGING_DIR_NATIVE}| $$[QT_HOST_PREFIX]|g' \
-        -e 's| ${STAGING_DIR_HOST}| $$[QT_INSTALL_PREFIX]|g' \
+    sed -i -e 's| ${STAGING_DIR_NATIVE}${prefix_native}| $$[QT_HOST_PREFIX]|g' \
+        -e 's| ${STAGING_EXECPREFIXDIR}| $$[QT_INSTALL_PREFIX]|g' \
         ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/qconfig.pri
 }
 
-- 
1.9.1


