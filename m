Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UHN5s-0000zy-SY
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 00:34:26 +0100
Received: by mail-ee0-f47.google.com with SMTP id e52so2304614eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Mar 2013 16:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=bpN5Y01M37lAEOLX1w1Mf9QWBjJQ/3Uh3lr9TRaVOIg=;
	b=bJu+HTZ8SD1Mt1v9hcUK6omiIk4m5eQe5m7bU0i3nQQIWihSd1bobqyF+sSjjtW68n
	XqO4sMGxE3eo0qh4H5kHXT37dQzcf4er1AcO/sYjBeR5xlaDSOqXqoz8AUwaqZYys2f/
	V3aKkXU9BefRT5WpstRBFHUX5KAv4EuZgBoY9U6kx1j+3gSfjXQGsoB7SWhK+6U5ojjQ
	ulzqwH3gucs1v914JuEnJZM/87/wxoERXBDLqPec5kkugEM9SSwNuMwNcIQiggKtFYrP
	M6vEdIL0lyE4TDutcPe5P668+2OBPfOdAZJmYGBy4ac06Kdmbbd8kvJKKkchU8Jb1PcT
	0vUQ==
X-Received: by 10.14.210.132 with SMTP id u4mr42798613eeo.19.1363562257983;
	Sun, 17 Mar 2013 16:17:37 -0700 (PDT)
Received: from mizar.localdomain
	(host195-251-dynamic.8-87-r.retail.telecomitalia.it. [87.8.251.195])
	by mx.google.com with ESMTPS id z45sm23918077eeu.10.2013.03.17.16.17.36
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 17 Mar 2013 16:17:37 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Mar 2013 00:17:15 +0100
Message-Id: <89d36bb154774d675e4ffc65e2064ac9cd0c31f6.1363561878.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1363561878.git.andrea.adami@gmail.com>
References: <cover.1363561878.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1363561878.git.andrea.adami@gmail.com>
References: <cover.1363561878.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/5] linux-yocto_3.2: match the exact NOR on collie
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Mar 2013 23:34:26 -0000

* Zaurus 5500 contains 2 LH28F640BFHE-PTTL90 (64M 4Mx16)
* as seen  at http://www.tekprosystems.com/zaurus/internals.htm
* the LH28F640BFHE-PTTL90.pdf datasheet available on the net shows
* the exact erasesize and the OTP support.
* At the moment only jedec_probe can discover the chip and
* the NO is mounted read only probably because of wrong vpp
* (kernel 3.8.1 seems fixing the issue for sa1100)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux-yocto-3.2/collie/collie-eraseinfo.patch  | 28 ++++++++++++++++++----
 .../linux/linux-yocto-3.2/collie/collie.cfg        |  4 ++--
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.2/collie/collie-eraseinfo.patch b/recipes-kernel/linux/linux-yocto-3.2/collie/collie-eraseinfo.patch
index 47e814d..6aba29e 100644
--- a/recipes-kernel/linux/linux-yocto-3.2/collie/collie-eraseinfo.patch
+++ b/recipes-kernel/linux/linux-yocto-3.2/collie/collie-eraseinfo.patch
@@ -1,11 +1,31 @@
 --- a/drivers/mtd/chips/jedec_probe.c
 +++ b/drivers/mtd/chips/jedec_probe.c
-@@ -1305,7 +1305,7 @@
- 		.cmd_set	= P_ID_INTEL_STD,
- 		.nr_regions	= 1,
+@@ -120,7 +120,7 @@
+ #define PM49FL008	0x006A
+ 
+ /* Sharp */
+-#define LH28F640BF	0x00b0
++#define LH28F640BF	0x00B0
+ 
+ /* ST - www.st.com */
+ #define M29F800AB	0x0058
+@@ -1299,13 +1299,14 @@
+ 		.mfr_id		= CFI_MFR_SHARP,
+ 		.dev_id		= LH28F640BF,
+ 		.name		= "LH28F640BF",
+-		.devtypes	= CFI_DEVICETYPE_X8,
++		.devtypes	= CFI_DEVICETYPE_X16,
+ 		.uaddr		= MTD_UADDR_UNNECESSARY,
+-		.dev_size	= SIZE_4MiB,
+-		.cmd_set	= P_ID_INTEL_STD,
+-		.nr_regions	= 1,
++		.dev_size	= SIZE_8MiB,
++		.cmd_set	= P_ID_INTEL_EXT,
++		.nr_regions	= 2,
  		.regions	= {
 -			ERASEINFO(0x40000,16),
-+			ERASEINFO(0x08000,128),
++			ERASEINFO(0x10000, 127),
++			ERASEINFO(0x02000, 8),
  		}
  	}, {
  		.mfr_id		= CFI_MFR_SST,
diff --git a/recipes-kernel/linux/linux-yocto-3.2/collie/collie.cfg b/recipes-kernel/linux/linux-yocto-3.2/collie/collie.cfg
index a47461e..9d484bd 100644
--- a/recipes-kernel/linux/linux-yocto-3.2/collie/collie.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.2/collie/collie.cfg
@@ -840,8 +840,8 @@ CONFIG_MTD_MAP_BANK_WIDTH_4=y
 # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
 # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
 # CONFIG_MTD_CFI_I1 is not set
-# CONFIG_MTD_CFI_I2 is not set
-CONFIG_MTD_CFI_I4=y
+CONFIG_MTD_CFI_I2=y
+# CONFIG_MTD_CFI_I4 is not set
 # CONFIG_MTD_CFI_I8 is not set
 # CONFIG_MTD_OTP is not set
 CONFIG_MTD_CFI_INTELEXT=y
-- 
1.7.12.4



