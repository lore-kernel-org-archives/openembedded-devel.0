Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0B66093A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 06:44:43 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id s29so885470lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 23:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0yX5ciIy+ivjkG/y7vPD1BDBF3edZEVmRZ19XupQE44=;
	b=s4O/URwt1nKfdHN6dokWJqp/eFp9TxSkRGiznmx1uycJ6xPZTQKbCGkcxs75aQCRiK
	VSEsWlL1LnNnbMKZ/ISHQoz1IELUUPWhT7QllYhHN3KnrB2G+ruJI48NkbgX3H99YPu6
	xDMKtdYMf2Bj5LPBeISADlEOlC0xC6Qkn+KSwYNjoXhZVjqn/KrLJR8FsxzBtGEfSC6M
	yyMzWITPKmtvLNznj0VtqK3CSvtUIcozunTu3GbKKYPs4qecK6lTnaJuCDrexOmFSPC3
	CHFxvEB5jxl59VuPHfnWmbPH6nWHL3iRxpidBMqDWfK2VEV1xOu409k7GmgtOgHfOfvI
	xaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0yX5ciIy+ivjkG/y7vPD1BDBF3edZEVmRZ19XupQE44=;
	b=bkTxzuZp31vhYmG/QkFxGMhF4QJi6TbiBt/vPgQRHP0RLYmhl2hvcZhVA4aUtdoZDr
	+BZDlsuDPX2a9LQSBrSnW/AlMZexvBnc2Q8+retOzF9Il4MNyLzNKj+cPwsGcfVd/lDM
	z2o6d7NbmoNXsEQBzYpa/4t5RBVMNY9zDkgHQoNKWoeWjM6q0Um4zBA7CxgoSHZaWB/A
	lKTmTy2U/nCeFl5PVJWq2lFqvl9YM/kTTQMRyBrufixzqcPqQ9doYxlE+b98EEEka6RY
	YAa49xkfff8i6BoG6m3Gsemm7LXmjvGAmmAlj3+R/+L3SdF01h3nsu8O/pWUX0eXl9b4
	IVCg==
X-Gm-Message-State: AE9vXwMXEa9N7sAuT9s/bSMNlRXxVDAUInvFfdniV9W4jJWpGoewg2qP4OTsRG7Pwc/21g==
X-Received: by 10.46.32.167 with SMTP id g39mr9255655lji.33.1474958684994;
	Mon, 26 Sep 2016 23:44:44 -0700 (PDT)
Received: from localhost.localdomain (m77-218-254-22.cust.tele2.se.
	[77.218.254.22]) by smtp.gmail.com with ESMTPSA id
	k129sm142485lfg.37.2016.09.26.23.44.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Sep 2016 23:44:44 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Sep 2016 08:44:48 +0200
Message-Id: <1474958688-17357-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] libnet: fixes musl libc build
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
X-List-Received-Date: Tue, 27 Sep 2016 06:44:44 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

This patch is back ported from libnet upstream.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 ...rt-musl-libc-remove-support-for-glibc-2.1.patch | 58 ++++++++++++++++++++++
 .../recipes-connectivity/libnet/libnet_1.2-rc3.bb  |  4 +-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet/0001-Support-musl-libc-remove-support-for-glibc-2.1.patch

diff --git a/meta-oe/recipes-connectivity/libnet/libnet/0001-Support-musl-libc-remove-support-for-glibc-2.1.patch b/meta-oe/recipes-connectivity/libnet/libnet/0001-Support-musl-libc-remove-support-for-glibc-2.1.patch
new file mode 100644
index 0000000..98008db
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnet/libnet/0001-Support-musl-libc-remove-support-for-glibc-2.1.patch
@@ -0,0 +1,58 @@
+From ffd7fab744a9ad2893169a8fb6244074604d5d0d Mon Sep 17 00:00:00 2001
+From: rofl0r <retnyg@gmx.net>
+Date: Tue, 12 Aug 2014 21:51:39 +0200
+Subject: [PATCH] Support musl libc, remove support for glibc < 2.1
+
+Upstream-Status: Backport
+
+The workarounds for glibc < 2.1 (was released february 1999) break the
+build with musl libc.
+
+It is very unlikely that 2.0 or earlier is still in use, and if so,
+1) that's a big security hole
+2) code wouldnt compile anyway since noone tested build in the last decade
+3) user of it wouldn't expect anyway to get bleeding edge sw built on it,
+   so he would just use the latest version that works for him.
+
+Closes #52
+
+Signed-off-by: rofl0r <retnyg@gmx.net>
+Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
+---
+ libnet/src/libnet_link_linux.c | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/src/libnet_link_linux.c b/src/libnet_link_linux.c
+index 054458d..3c6df3c 100644
+--- a/src/libnet_link_linux.c
++++ b/src/libnet_link_linux.c
+@@ -30,26 +30,15 @@
+ #include <sys/time.h>
+ 
+ #include <net/if.h>
+-#if (__GLIBC__)
+ #include <netinet/if_ether.h>
+ #include <net/if_arp.h>
+-#else
+-#include <linux/if_arp.h>
+-#include <linux/if_ether.h>
+-#endif
+ 
+ #if (HAVE_PACKET_SOCKET)
+ #ifndef SOL_PACKET
+ #define SOL_PACKET 263
+ #endif  /* SOL_PACKET */
+-#if __GLIBC__ >= 2 && __GLIBC_MINOR >= 1
+ #include <netpacket/packet.h>
+ #include <net/ethernet.h>     /* the L2 protocols */
+-#else
+-#include <asm/types.h>
+-#include <linux/if_packet.h>
+-#include <linux/if_ether.h>   /* The L2 protocols */
+-#endif
+ #endif  /* HAVE_PACKET_SOCKET */
+ 
+ #include "../include/libnet.h"
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
index a558e80..dfc2049 100644
--- a/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
@@ -8,7 +8,9 @@ DEPENDS = "libpcap"
 # There are major API changes beween libnet v1.0 and libnet v1.1
 PROVIDES = "libnet-1.2rc2"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libnet-dev/${BPN}-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/libnet-dev/${BPN}-${PV}.tar.gz \
+           file://0001-Support-musl-libc-remove-support-for-glibc-2.1.patch \
+          "
 
 SRC_URI[md5sum] = "f051e6e5bdecddb90f77c701c2ca1804"
 SRC_URI[sha256sum] = "72c380785ad44183005e654b47cc12485ee0228d7fa6b0a87109ff7614be4a63"
-- 
1.9.1


