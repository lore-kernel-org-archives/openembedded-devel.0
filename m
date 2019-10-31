Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF937FA40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 16:54:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 473ryG0Gy6z7x
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 17:54:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572540854;
	bh=DE6H6ohRcNvSKbmJhEKjUnsE3lGZ5wILp/nvXIlpah0=;
	h=From:To:Subject:Date:From;
	b=nf4ou9OjUwpyD14nsC9YfAtRa3iYdO6oxxLOB/DaO3Fe4DGb0kl+fWA3/rQVl45qy
	HE8olC6Ec0tVHCx0n4Ya/W4334EP8UqvtcyvvQZhu1gtrRnZdxbANkWsu7dg1PrISU
	+QF4XhKTb0ISIIKAAGCXAIInAeSlCBM3k8vRKwXwXetldad3m2ssH4APnUOkPNP/JN
	0t8WFiLLCKFzBXvL2cJ76MtzkZ+jIkGXdaoW0io9Uf0VwBMd/E90X2pRN4iRDPaxkp
	YIQ9Jtck/A50SXt0rmTyzmweWZCq99EY+Chrvs0R+EVMlXQQW5jdB8loU4aAf0Qsfr
	r0A9Fb0uoy1YmGXLJhExLVAUeC8hVm3gtv6eJ/+Eygt8xkGx+chjCp88OFml+WJscQ
	hRl3qf61SJRSjNcxZ+KSa6fe1mkfEy5g4IrY9LqH016a9vEBFiLOJWVgoyRAderQeG
	UJwuMnctUrydS8AajGq2auysfzLaqjleB6FMepeHEXVCzDdbdTmuGC3XWkwsyw4Ehm
	YZDYF8jUo5T21I99Spz04d5CaHTergdTXckWQkcg+H77LI6EhfHbNa+CTWBZ0tTxwr
	oELsVGFqnTDrsAwEHCQMBb68jH9mdccPfpcqk6tKfjZ7OrQ3+xd1syxFxvpACWbDO6
	G/urwGliYjBof4E4+oWiRLWA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Oct 2019 18:54:12 +0200
Message-Id: <20191031165412.24745-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][warrior][PATCH] gpsd: Fix shared memory function gps_waiting() failing indefinitely
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
X-List-Received-Date: Thu, 31 Oct 2019 16:54:13 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
Already fixed in gpsd 3.19 in zeus and master.
---
 ...-bug-53846-gps_shm_open-should-reset.patch | 28 +++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb  |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-Address-Savannah-bug-53846-gps_shm_open-should-reset.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-Address-Savannah-bug-53846-gps_shm_open-should-reset.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-Address-Savannah-bug-53846-gps_shm_open-should-reset.patch
new file mode 100644
index 000000000..33b251e3a
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-Address-Savannah-bug-53846-gps_shm_open-should-reset.patch
@@ -0,0 +1,28 @@
+From 20e7553d8e7e716e8365958e75957216dd41cd4d Mon Sep 17 00:00:00 2001
+From: "Eric S. Raymond" <esr@thyrsus.com>
+Date: Wed, 26 Dec 2018 09:23:57 -0500
+Subject: Address Savannah bug #53846, gps_shm_open() should
+ reset...PRIVATE(gpsdata)->tick
+
+Upstream-Status: Backport
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+
+---
+ libgps_shm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libgps_shm.c b/libgps_shm.c
+index 755f63c73..8510c0f1c 100644
+--- a/libgps_shm.c
++++ b/libgps_shm.c
+@@ -59,6 +59,7 @@ int gps_shm_open(struct gps_data_t *gpsdata)
+     if (gpsdata->privdata == NULL)
+ 	return -1;
+ 
++    PRIVATE(gpsdata)->tick = 0;
+     PRIVATE(gpsdata)->shmseg = shmat(shmid, 0, 0);
+     if (PRIVATE(gpsdata)->shmseg == (void *) -1) {
+ 	/* attach failed for sume unknown reason */
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
index f4e018055..deafe0d64 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0001-include-sys-ttydefaults.h.patch \
     file://0001-Add-bounds-check-in-in_escape-state-of-JSON-parser.patch \
     file://0001-gps_shm_close-Free-privdata.patch \
+    file://0001-Address-Savannah-bug-53846-gps_shm_open-should-reset.patch \
 "
 SRC_URI[md5sum] = "e0cfadcf4a65dfbdd2afb11c58f4e4a1"
 SRC_URI[sha256sum] = "68e0dbecfb5831997f8b3d6ba48aed812eb465d8c0089420ab68f9ce4d85e77a"
-- 
2.17.1


