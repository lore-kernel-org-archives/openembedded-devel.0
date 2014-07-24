Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 637D170606
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 13:25:06 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id n12so2709090wgh.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 06:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=g9e+fhznH9EcmEKQVMRWtQ5eejf32UCwRQvCfHjYgfo=;
	b=mzRmHTDcwKyXVeJvG2RnwY3uyHopMBM0yiVsFSE52oS0vi7/OPCJqAygwLTNo8Mwxx
	F0kTj4oPKum59ASR/WEAK1SKWzFuZAXSM8WQXHO8ugyxXeWpk2lB6Yv1awAPe0/hjf40
	jN8PNUbKxrzZzb+iLPHW02x13M189DxyyjxPq1cO7fVI574N5BuqhG+s7RHN3xnoBQuT
	+T7/81OoGJiwPBdxDt2JRj2oQzUSOMWu2wyKhNfgYYuwrEShekjBe/gvqtE/9oPu9xW+
	pLxb+TS11sw7+IUs/oBy+rxSpUdVjCTVMX++VkWGuors47h0Gu7wz8BUZWUmqNDHqLJz
	Sl5A==
X-Received: by 10.180.210.132 with SMTP id mu4mr12885531wic.18.1406208306277; 
	Thu, 24 Jul 2014 06:25:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fu7sm22799666wib.2.2014.07.24.06.25.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 06:25:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jul 2014 15:25:21 +0200
Message-Id: <1406208321-7832-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [meta-oe][PATCHv2] libmatroska: upgrade to 1.4.1 required by mkvtoolnix-7.0.0
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
X-List-Received-Date: Thu, 24 Jul 2014 13:25:07 -0000

* LIC_FILES_CHKSUM change only because of formating
  (unix line feeds and some alignment in header)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libmatroska/{libmatroska_1.4.0.bb => libmatroska_1.4.1.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-mkv/libmatroska/{libmatroska_1.4.0.bb => libmatroska_1.4.1.bb} (77%)

diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.0.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
similarity index 77%
rename from meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.0.bb
rename to meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
index 9644e84..95ea93d 100644
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.0.bb
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
@@ -1,12 +1,12 @@
 SUMMARY = "libmatroska is a C++ libary to parse Matroska files (.mkv and .mka)"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=f14599a2f089f6ff8c97e2baa4e3d575"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libebml"
 
 SRC_URI = "http://dl.matroska.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "5b83155019589b04a49f9db923b5bf74"
-SRC_URI[sha256sum] = "1b6d02e75cdbfb6d282dcf2a902a259c3075404885d5e8063e6652a2b3f6c11b"
+SRC_URI[md5sum] = "f61b2e5086f4bb9d24a43cc8af43a719"
+SRC_URI[sha256sum] = "086f21873e925679babdabf793c3bb85c353d0cd79423543a3355e08e8a4efb7"
 
 do_compile() {
     cd ${S}/make/linux
-- 
2.0.2


