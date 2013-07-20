Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6932A6B255
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 15:08:15 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so2943962eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 08:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=OLKGm0vB6M4RqmshoO5dCwavIvpY9NTjhZPvBVAFlec=;
	b=Uv5Y8Xb65kzE99qxpEGmAGoDQUcse1S08HQbLTYn6WmgVpN/bjNwAx2SrwZbTxpXVd
	yUg33QEZ8mITvpjX+1w5uquY/Je5++DEXXaAoe4+H/STOlnoCStwdBu3dUvtKOdawyUH
	6A6/Jk1aiVLZDvtr2rxqQ0hfbKyjovoQYiPZM3FB9/Zxi2P9/SYuK7s6v0RZeA/RxOiS
	5w7BQ08qwlc9WBR0Gb0WxgUFbhwCsTc5QaO1yjkPkUWPX+okxzBVNroch9AwhCeHHBTU
	5mRyITn9sAVdsYT9PKShMA+TNea/F6BRlcsKAAcjtIb7NSIh6J89VHbuqVL3xX/DvGtS
	AfdA==
X-Received: by 10.15.95.4 with SMTP id bc4mr20275758eeb.40.1374332895695;
	Sat, 20 Jul 2013 08:08:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	w43sm35946484eez.6.2013.07.20.08.08.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 08:08:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jul 2013 17:08:24 +0200
Message-Id: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1374332866.git.Martin.Jansa@gmail.com>
References: <cover.1374332866.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 01/11] lcdproc5: add PACKAGECONFIG for libftdi, libusb
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
X-List-Received-Date: Sat, 20 Jul 2013 15:08:15 -0000

* drivers for lis, ula200 and i2500vfd weren't deterministicly enabled

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/lcdproc/lcdproc5.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
index f5a1f3c..d1a45ca 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
@@ -4,7 +4,7 @@ SUMMARY = "Drivers for character-based LCD displays"
 HOMEPAGE = "http://lcdproc.org"
 SECTION = "utils"
 LICENSE = "GPLv2+"
-DEPENDS = "virtual/libusb0 ncurses"
+DEPENDS = "ncurses"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
                     file://README;beginline=60;md5=637e042cdd3671ba00e78b58ede45d3b"
@@ -16,7 +16,11 @@ inherit autotools update-rc.d
 LCD_DRIVERS ?= "all"
 LCD_DEFAULT_DRIVER ?= "curses"
 
-EXTRA_OECONF = "--enable-drivers=${LCD_DRIVERS} --enable-libusb"
+PACKAGECONFIG ??= "usb"
+PACKAGECONFIG[usb] = "--enable-libusb,--disable-libusb,virtual/libusb0"
+PACKAGECONFIG[ftdi] = "--enable-libftdi,--disable-libftdi,libftdi"
+
+EXTRA_OECONF = "--enable-drivers=${LCD_DRIVERS}"
 
 do_install () {
     # binaries
-- 
1.8.3.2


