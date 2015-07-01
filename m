Return-Path: <net147@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id D0F90607A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 07:29:41 +0000 (UTC)
Received: by pdcu2 with SMTP id u2so21292500pdc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2015 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3Icb6Ik23vJEcXqDEhJZZ7jRYsQUEDBeooqSXIXcDrM=;
	b=UA7+Mf7WQWOi949McjdL3H/gynLI0NU8syLM6OKng5/AhL2T8Di02gCaO7IZjK7ajp
	fBBYC2omWwubL+xxHm3BFDXAR9QIkc80hRf0kJ9LDwSYQoAdYDaJrGCgzlOe7Hfe3zt0
	bkKjkGLRx4YSpGwRN5VyDaR9XVykrHZC82v2w2oTLFCUbU1dbjm1krFeMFsewKhVR2fw
	HTH36m0oSsdX5juqXBY9eVMjq22Rp33YwwJ1ZFO6mepMf8Q58WyNayJbxsnp/QdrBrMY
	uZgex93TMAdn7jzcJkdIhM2/efvwciaeD0YceOzOpKC+DXynRxXyuYqCy/fslvuJ/QRe
	8wEw==
X-Received: by 10.67.4.201 with SMTP id cg9mr52365856pad.53.1435735781789;
	Wed, 01 Jul 2015 00:29:41 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id x7sm1155723pbt.16.2015.07.01.00.29.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 00:29:41 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2015 17:29:10 +1000
Message-Id: <1435735750-26252-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.4.4
Subject: [meta-qt5][PATCH] quazip: new recipe
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
X-List-Received-Date: Wed, 01 Jul 2015 07:29:44 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/quazip/quazip_0.7.1.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-qt/quazip/quazip_0.7.1.bb

diff --git a/recipes-qt/quazip/quazip_0.7.1.bb b/recipes-qt/quazip/quazip_0.7.1.bb
new file mode 100644
index 0000000..97a6e4f
--- /dev/null
+++ b/recipes-qt/quazip/quazip_0.7.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Qt/C++ wrapper for ZIP/UNZIP package"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
+DEPENDS = "qtbase"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "3b99effb2a9417707d463e6f19cf2629"
+SRC_URI[sha256sum] = "78c984103555c51e6f7ef52e3a2128e2beb9896871b2cc4d4dbd4d64bff132de"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+inherit qmake5
+
+EXTRA_QMAKEVARS_PRE += "PREFIX=${prefix}"
+EXTRA_QMAKEVARS_POST += "SUBDIRS=${BPN}"
-- 
2.4.4


