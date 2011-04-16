Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QB49t-0003Mm-V3
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 13:59:26 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2693953fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 04:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=5xiXwhHABEp76aDjae+Tn329bHWC3zxCDcehCYPB/08=;
	b=Qqsw7c9rfM4/Uy0xBCylEUKU9C7Dh3dotiRMn98jjpiK9YCWgDnkqr5l0BjiPAMnxG
	Nq9oLEnHV4RyRZYqSbpU7XFSCckMBGa/jeGCoZsFy0MhX+mOxdiFPvS8SgShbia5medj
	xGnRh0NtnN6/LgnRVXEp2De6S4VaOT2RWQwb8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NuJ/+ik6w7HarjQpxlLWiybTXh9XlFO2ACR5DDuNBg59NpVejnmdJdreHHbjLu1Gc+
	tiUHNXBhEU904GNOTJ8lghKkHXMwR6hMq+/mOJgwigc1L7Az6cMINuREqXVC3e2d9lw2
	7rXI7yXOhnGBMnwOMRDw4mVgr7JmA0Slt9V34=
Received: by 10.223.32.142 with SMTP id c14mr1638857fad.59.1302955028485;
	Sat, 16 Apr 2011 04:57:08 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm255919fau.16.2011.04.16.04.57.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Apr 2011 04:57:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Apr 2011 13:57:07 +0200
Message-Id: <852ac4b589adb186191ad70a2fa3472d5b351ec4.1302954782.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1302954782.git.Martin.Jansa@gmail.com>
References: <cover.1302954782.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] bluez-hcidump: add 2.0 version and patch to build with newer bluez
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
X-List-Received-Date: Sat, 16 Apr 2011 11:59:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../remove.ntoh64.definition.patch                 |   42 ++++++++++++++++++++
 .../bluez/bluez-hcidump_2.0.bb                     |   21 ++++++++++
 2 files changed, 63 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.0/remove.ntoh64.definition.patch
 create mode 100644 meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.0.bb

diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.0/remove.ntoh64.definition.patch b/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.0/remove.ntoh64.definition.patch
new file mode 100644
index 0000000..9943265
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bluez/bluez-hcidump-2.0/remove.ntoh64.definition.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Accepted, already in git, expected to be included in next version after 2.0
+From 95ea4ff5c9c7dbda2f3faaef4e5cd46d542a48c8 Mon Sep 17 00:00:00 2001
+From: Anderson Lizardo <anderson.lizardo@openbossa.org>
+Date: Fri, 18 Mar 2011 15:10:19 -0400
+Subject: [PATCH] Fix compilation against latest BlueZ
+
+BlueZ now has ntoh64()/hton64() functions in bluetooth.h, therefore the
+hcidump local copy is not necessary.
+---
+ src/hcidump.c |   16 ----------------
+ 1 files changed, 0 insertions(+), 16 deletions(-)
+
+diff --git a/src/hcidump.c b/src/hcidump.c
+index af086c7..2023130 100644
+--- a/src/hcidump.c
++++ b/src/hcidump.c
+@@ -50,22 +50,6 @@
+ #include "parser/parser.h"
+ #include "parser/sdp.h"
+ 
+-#if __BYTE_ORDER == __LITTLE_ENDIAN
+-static inline uint64_t ntoh64(uint64_t n)
+-{
+-	uint64_t h;
+-	uint64_t tmp = ntohl(n & 0x00000000ffffffff);
+-	h = ntohl(n >> 32);
+-	h |= tmp << 32;
+-	return h;
+-}
+-#elif __BYTE_ORDER == __BIG_ENDIAN
+-#define ntoh64(x) (x)
+-#else
+-#error "Unknown byte order"
+-#endif
+-#define hton64(x) ntoh64(x)
+-
+ #define SNAP_LEN 	HCI_MAX_FRAME_SIZE
+ #define DEFAULT_PORT	"10839";
+ 
+-- 
+1.7.4.4
+
diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.0.bb b/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.0.bb
new file mode 100644
index 0000000..7ad8eef
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Linux Bluetooth Stack HCI Debugger Tool."
+DESCRIPTION = "The hcidump tool reads raw HCI data coming from and going to a Bluetooth device \
+and displays the commands, events and data in a human-readable form."
+
+SECTION = "console"
+PRIORITY = "optional"
+DEPENDS = "bluez4"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
+                    file://src/hcidump.c;beginline=1;endline=23;md5=3bee3a162dff43a5be7470710b99fbcf"
+PR = "r0"
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${P}.tar.gz \
+           file://remove.ntoh64.definition.patch"
+
+SRC_URI[md5sum] = "5c2e3ef0a68b2845047867ba51ff8ac9"
+SRC_URI[sha256sum] = "b3b64fd0b18301df07d3aaf34c037c1e4808b4aaf702294822d62b5424f617fd"
+
+EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
+
+inherit autotools
-- 
1.7.5.rc1



