Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0C08A6B7DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:20 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so183265eaj.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=OLKGm0vB6M4RqmshoO5dCwavIvpY9NTjhZPvBVAFlec=;
	b=ZMdCA5QDCzroCsbGTSGeE8QqWddLiHaeljcRfQ333RbzCWl15HM1lN8mXslx+qSNaY
	9AfUF5RRI030SpddBWegFFGvQcEQctRZEAg9TFMdDTxFlurcmPPlT0QATV0ZwlIbO1pc
	dqWG0aS4U19OAToNBurfgRnNQLQvtPfnSYFXe+yZ47u8XZuX5hvmLSjpfD4vWM6gSWrc
	oqVXOFoNcvog2WJikGGpzF/DbhO1WHO/z46AbeKAV5y7TJRjDtlAno/tKzEZy2jG5Ufa
	kd6xntQEAezEdzX153Ro67pJvOqP5TcSTxHeuNoTnWG9e3wkcmuFZhf/I7zgCoJCTdUi
	tcMQ==
X-Received: by 10.14.175.9 with SMTP id y9mr37371eel.79.1376551161446;
	Thu, 15 Aug 2013 00:19:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm69984773eei.10.2013.08.15.00.19.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:01 +0200
Message-Id: <fa95af01f2988667bcb492c511a235f6ad3dbab2.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 21/60] lcdproc5: add PACKAGECONFIG for libftdi, libusb
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:21 -0000

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


