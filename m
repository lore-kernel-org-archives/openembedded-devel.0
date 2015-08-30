Return-Path: <net147@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id C3A457422C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 08:47:12 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so106404689pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 01:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gBMPAHWtDOeeJf7t525wsot9aO8EeOQiTfvrn9HQmXM=;
	b=lXKOa4E1y6oEBGCNZdHZDJBZWfR2VfU7pWJpc/WsHyjk62zrnWGty1EI3V+6H40cMY
	uAtBw5a8U5s3HL1UXcq3E7DqywRwDxo6Qs+TS3jYonkzW/Fx9+WfVPlAtMYTKZzozfIw
	C9xxYXgzOxW3iEzftv7CvQrCkrQ5KbVq3E7KZHSi3dBAB6XGoKeWY+sPH5Bn2zyfHcBq
	FwdE4VG73M5KvsAeKL/ivflRzmVi+c5Gx9CJ25pqzb+Z/fAs6u9i3R/ffnzJ8007BKvA
	dYLRN0/LQ/HI7ru+ecDlNw9zREqkUSiJh4rjN3PacIGCrjpT/JVH0bLUxHiaoSAZQOhB
	jjAA==
X-Received: by 10.66.150.66 with SMTP id ug2mr36111380pab.4.1440924432565;
	Sun, 30 Aug 2015 01:47:12 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	j17sm10718806pdl.59.2015.08.30.01.47.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Aug 2015 01:47:11 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Aug 2015 18:47:32 +1000
Message-Id: <1440924452-5208-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-qt5][PATCH] qtbase: replace ${STAGING_DIR_HOST} instead of ${STAGING_EXECPREFIXDIR}
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
X-List-Received-Date: Sun, 30 Aug 2015 08:47:14 -0000

Replacing ${STAGING_EXECPREFIXDIR} with the $$[QT_INSTALL_PREFIX] qmake
built-in variable only covers ${STAGING_DIR_HOST}/usr and misses the
following additional host paths:
${STAGING_DIR_HOST}/lib
${STAGING_DIR_HOST}

Replace ${STAGING_DIR_HOST} instead with $$[QT_SYSROOT] so that sed
replaces all the host paths contained in qconfig.pri instead of only
some of them. This avoids host paths being referenced on the SDK host
when using the Qt SDK.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 6843070..f4287cc 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -239,7 +239,7 @@ do_install_append() {
 
     # Replace host paths with qmake built-in properties
     sed -i -e 's| ${STAGING_DIR_NATIVE}${prefix_native}| $$[QT_HOST_PREFIX]|g' \
-        -e 's| ${STAGING_EXECPREFIXDIR}| $$[QT_INSTALL_PREFIX]|g' \
+        -e 's| ${STAGING_DIR_HOST}| $$[QT_SYSROOT]|g' \
         ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/qconfig.pri
 }
 
-- 
2.5.0


