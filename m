Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 54C1265DED
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 May 2014 19:02:07 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id hr17so4207902lab.31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 May 2014 12:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sbx7u6xOeAK8zhVvHW698DV3MXirdTHMIdLa69z52Ho=;
	b=RsMTSGZockqtKpR08fuWTvdQ6+N5DAVdCdsJXp3Uc5+djw2txINLBNMOrWVZ9kBL0a
	oLqPDF4HSwOyu9fgsJ+m8ehJ7gPajhylYqeyekKPc6BIF+h+dMiEsS7ePY1seRyLXZlJ
	giZCPOHNiqKe3vAw0di55i9EgB0Aw4CqTSk0HlbqxsFvdloB/bTrdkdmoL41u2y15vJC
	MkW5KIltYXVckdBVUplPPPIeLDGEyPsA9SOpRQV2lVcZtnSiiFtxtOp2YNOyOR/0ax5q
	uE4M0njZq+5be33/CoQGi4IUpL65adLo0a7p7+sLRriV6gDgvf5H9EOcI4GOWIsu6U8V
	oePQ==
X-Received: by 10.152.27.134 with SMTP id t6mr2733013lag.41.1399230128604;
	Sun, 04 May 2014 12:02:08 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bm3sm6862010lbb.12.2014.05.04.12.02.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 May 2014 12:02:07 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 May 2014 21:02:16 +0200
Message-Id: <1399230136-12456-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1399230136-12456-1-git-send-email-Martin.Jansa@gmail.com>
References: <1399230136-12456-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 4/4] devicekit-power: add libusb-compat dependency
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
X-List-Received-Date: Sun, 04 May 2014 19:02:09 -0000

* otherwise do_configure fails with:
  | configure:14379: result: no
  | configure:14379: checking for usb.h
  | configure:14379: result: no
  | configure:14386: error: Can't find usb.h. Please install libusb.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/devicekit/devicekit-power_014.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb b/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
index 7c40fbc..9484887 100644
--- a/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
+++ b/meta-oe/recipes-support/devicekit/devicekit-power_014.bb
@@ -2,7 +2,7 @@ SUMMARY = "Devicekit power"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=756cf97871f77233638937da21b025d3"
 
-DEPENDS = "libusb1 udev glib-2.0 dbus-glib polkit"
+DEPENDS = "libusb-compat libusb1 udev glib-2.0 dbus-glib polkit"
 
 SRC_URI = "http://upower.freedesktop.org/releases/DeviceKit-power-${PV}.tar.gz;name=archive"
 SRC_URI[archive.md5sum] = "935d37f1e14b3c8a1d6dabcd9a38d3ca"
-- 
1.9.1


