Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qtxot-0005hU-Oo
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 10:19:20 +0200
Received: by mail-bw0-f47.google.com with SMTP id zu17so1460188bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 01:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kZC1TOkhIT1Iq2qBLkDIRkOHfafhOqmWbrSb043sqAs=;
	b=uDj4PiFgvTPtTq0hbAMY+wEwiBnf4NdSTwZm8P0SBXzy9rZvzh1g0FharnR23AfxED
	IORXm3GBKJwMNME6aHeRcghs5X3sKCXwLRkH5TwIrQyPl6OHGGgnd5i8sBVm11LOvLTn
	IC49HlWF+0pLgYn53Yu9UROsIS4FoEH4YmJYc=
Received: by 10.205.24.12 with SMTP id rc12mr181478bkb.200.1313655282809;
	Thu, 18 Aug 2011 01:14:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x19sm641224bkt.9.2011.08.18.01.14.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Aug 2011 01:14:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2011 10:14:22 +0200
Message-Id: <74485a2eac907bf07ff1ab5db031bbf61be8df4e.1313655217.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <b70d3308cd1493c12b7e1ba39fbfa5bb38c8ecc1.1313655217.git.Martin.Jansa@gmail.com>
References: <b70d3308cd1493c12b7e1ba39fbfa5bb38c8ecc1.1313655217.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1313655217.git.Martin.Jansa@gmail.com>
References: <cover.1313655217.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] bluez-hcidump: remove older 2.0
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
X-List-Received-Date: Thu, 18 Aug 2011 08:19:20 -0000

* there is 2.1 now in oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../remove.ntoh64.definition.patch                 |   42 --------------------
 .../bluez/bluez-hcidump_2.0.bb                     |   20 ---------
 2 files changed, 0 insertions(+), 62 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.0/remove.ntoh64.definition.patch
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.0.bb

diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.0/remove.ntoh64.definition.patch b/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.0/remove.ntoh64.definition.patch
deleted file mode 100644
index 9943265..0000000
--- a/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.0/remove.ntoh64.definition.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Accepted, already in git, expected to be included in next version after 2.0
-From 95ea4ff5c9c7dbda2f3faaef4e5cd46d542a48c8 Mon Sep 17 00:00:00 2001
-From: Anderson Lizardo <anderson.lizardo@openbossa.org>
-Date: Fri, 18 Mar 2011 15:10:19 -0400
-Subject: [PATCH] Fix compilation against latest BlueZ
-
-BlueZ now has ntoh64()/hton64() functions in bluetooth.h, therefore the
-hcidump local copy is not necessary.
----
- src/hcidump.c |   16 ----------------
- 1 files changed, 0 insertions(+), 16 deletions(-)
-
-diff --git a/src/hcidump.c b/src/hcidump.c
-index af086c7..2023130 100644
---- a/src/hcidump.c
-+++ b/src/hcidump.c
-@@ -50,22 +50,6 @@
- #include "parser/parser.h"
- #include "parser/sdp.h"
- 
--#if __BYTE_ORDER == __LITTLE_ENDIAN
--static inline uint64_t ntoh64(uint64_t n)
--{
--	uint64_t h;
--	uint64_t tmp = ntohl(n & 0x00000000ffffffff);
--	h = ntohl(n >> 32);
--	h |= tmp << 32;
--	return h;
--}
--#elif __BYTE_ORDER == __BIG_ENDIAN
--#define ntoh64(x) (x)
--#else
--#error "Unknown byte order"
--#endif
--#define hton64(x) ntoh64(x)
--
- #define SNAP_LEN 	HCI_MAX_FRAME_SIZE
- #define DEFAULT_PORT	"10839";
- 
--- 
-1.7.4.4
-
diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.0.bb b/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.0.bb
deleted file mode 100644
index f269045..0000000
--- a/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Linux Bluetooth Stack HCI Debugger Tool."
-DESCRIPTION = "The hcidump tool reads raw HCI data coming from and going to a Bluetooth device \
-and displays the commands, events and data in a human-readable form."
-
-SECTION = "console"
-DEPENDS = "bluez4"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://src/hcidump.c;beginline=1;endline=23;md5=3bee3a162dff43a5be7470710b99fbcf"
-PR = "r0"
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${P}.tar.gz \
-           file://remove.ntoh64.definition.patch"
-
-SRC_URI[md5sum] = "5c2e3ef0a68b2845047867ba51ff8ac9"
-SRC_URI[sha256sum] = "b3b64fd0b18301df07d3aaf34c037c1e4808b4aaf702294822d62b5424f617fd"
-
-EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
-
-inherit autotools
-- 
1.7.6



