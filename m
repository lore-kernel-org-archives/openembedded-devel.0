Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 418397887A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2018 03:08:03 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id n10-v6so4276620plp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 20:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ScezCUW+tO0oKFZZ6EngBxlepwmdgO1oXSsRAssEpBU=;
	b=kym2Z1PaG4oMkVJNEow9PndzSGCXlb2NpR/e/EJEkx37n8/8+6K+wJM0ogtME3Y/03
	qCr9mPILWVbD5l+pInUlKztovqaPSyfeOjuLHAF1gpxMVVwVKTs8anKW0xXWBdH4xAh4
	OupbrFti9FNOuXPnlW5VNKvwZUBwcG1/kJ4STBbrgFmwStDvxFvgw03DY8aWFryD6HdT
	trkVVqqS3cYaN35U3QHWE4/Lqi2P2TqudDXWbfDKds/+nDn9K0bPH4bsDSfbGOZp14Qx
	4+/MZD3SNKbQrP2qhIqqDh0iQtQzblZfQSXO2jgLrnK0bXSsnkURY6rWkurvJvdg1y6V
	Jm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ScezCUW+tO0oKFZZ6EngBxlepwmdgO1oXSsRAssEpBU=;
	b=J9abEahAz4y6PJtEoxWfurprPy6dw0ylADLD7r+VM7TzsDX++xOVe61DaET2GfqJu4
	0Sr3W3MgU7V6BO92gejoAeB/XYjng+Ifo/5/9G/bL2qXtvDq+kwP2ziMoPX+8gY3ehPY
	X4vNkiv0T2uTgHwEtNg5bVC3ms/ySg6W6ZacA9jRk3SYaL+m4Q0DE3CGHwfQAxY4RF57
	ESWCpAP6Ux8p6PXNQSpLWPLNO1erv9RvNHrjgF2Wthfzx2JkAyZTtkBUZL4LLj/gBFuY
	j8h+32lorafv73LCupg8iaG8WNFt7O2I5tKGacQmhkwVf+F1HHtnKHAxyz3coNe00Je6
	aVUA==
X-Gm-Message-State: ALKqPwdoyY7GZhrFkBfKI2+CgJJy+IDL7NPHUmDU3aYbjldC/3dBXXph
	eqHwq/YKTdfRBgccQ8IInStPNQ==
X-Google-Smtp-Source: AB8JxZohmGD6m1rXegbkW9FCd4o4K9TvzmhSQv1Lz77cfFaVy21+37Bkriuf1QDyqBS18FYqQQMLDw==
X-Received: by 2002:a17:902:988b:: with SMTP id
	s11-v6mr719785plp.304.1526094484565; 
	Fri, 11 May 2018 20:08:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	d4-v6sm6440933pgv.73.2018.05.11.20.08.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 20:08:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 20:07:54 -0700
Message-Id: <20180512030758.31409-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180512030758.31409-1-raj.khem@gmail.com>
References: <20180512030758.31409-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/8] flashrom: Fix build with libusb 1.0.22
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 May 2018 03:08:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...pi-Avoid-deprecated-libusb-functions.patch | 39 +++++++++++++++++++
 meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-ch341a_spi-Avoid-deprecated-libusb-functions.patch

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-ch341a_spi-Avoid-deprecated-libusb-functions.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-ch341a_spi-Avoid-deprecated-libusb-functions.patch
new file mode 100644
index 0000000000..df8028627a
--- /dev/null
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0001-ch341a_spi-Avoid-deprecated-libusb-functions.patch
@@ -0,0 +1,39 @@
+From e5f68189ab3602b1042cc8423fd6a3a23abd5455 Mon Sep 17 00:00:00 2001
+From: Alex James <theracermaster@gmail.com>
+Date: Sat, 14 Apr 2018 22:59:57 -0500
+Subject: [PATCH] ch341a_spi: Avoid deprecated libusb functions
+
+libusb 1.0.22 marked libusb_set_debug as deprecated. For such versions
+of libusb, use libusb_set_option instead.
+
+Change-Id: Ib71ebe812316eaf49136979a942a946ef9e4d487
+Signed-off-by: Alex James <theracermaster@gmail.com>
+Reviewed-on: https://review.coreboot.org/25681
+Tested-by: Nico Huber <nico.h@gmx.de>
+Reviewed-by: David Hendricks <david.hendricks@gmail.com>
+---
+Upstream-Status: Backport
+ ch341a_spi.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/ch341a_spi.c b/ch341a_spi.c
+index 6eb2804..d880510 100644
+--- a/ch341a_spi.c
++++ b/ch341a_spi.c
+@@ -444,7 +444,12 @@ int ch341a_spi_init(void)
+ 		return -1;
+ 	}
+ 
+-	libusb_set_debug(NULL, 3); // Enable information, warning and error messages (only).
++	/* Enable information, warning, and error messages (only). */
++#if LIBUSB_API_VERSION < 0x01000106
++	libusb_set_debug(NULL, 3);
++#else
++	libusb_set_option(NULL, LIBUSB_OPTION_LOG_LEVEL, LIBUSB_LOG_LEVEL_INFO);
++#endif
+ 
+ 	uint16_t vid = devs_ch341a_spi[0].vendor_id;
+ 	uint16_t pid = devs_ch341a_spi[0].device_id;
+-- 
+2.17.0
+
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb
index 9eac876ba1..1c17246681 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb
@@ -8,6 +8,7 @@ DEPENDS = "pciutils libusb libusb-compat"
 SRC_URI = "https://download.flashrom.org/releases/flashrom-${PV}.tar.bz2 \
            file://sst26.patch \
            file://0001-platform-Add-riscv-to-known-platforms.patch \
+           file://0001-ch341a_spi-Avoid-deprecated-libusb-functions.patch \
            "
 SRC_URI[md5sum] = "42d999990c735d88653627cefcc13b9a"
 SRC_URI[sha256sum] = "3702fa215ba5fb5af8e54c852d239899cfa1389194c1e51cb2a170c4dc9dee64"
-- 
2.17.0


