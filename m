Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 581C37FA7D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 22:57:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 471YCl2LNwz3P
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:57:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572217075;
	bh=tXEItfqUA9LATKQeZ1bvVrZtyIxo2vpHLYcT4b3ig2E=;
	h=From:To:Subject:Date:From;
	b=I7nTjWFJKqVA2zm2TY/yADZ7CoSIV096/o893c/FXVJVydxMDWhXoQdTDY67xJUZc
	HS/Bciwx7h/ierdVL857v+JgBrFOceFY/VAavuXSafojZ5me1oHkC4ujhuGJyU4f2J
	CMV313+xkJXLmbCYbvPCcUXaTxYHJ1VBZ0fNNFGEA6cFS3KcKt/yhHYAmDzyMQO+NV
	EWFzzJTDiXYR+dk55Nq2ebr5wWZYYuiVRw9iS8yA+9cR7JEyAzPEg1Vgr69L9nrnb4
	/3J+s04jNwfjUGtNMsFGuLjN5eAI50+53Cgmv3Ct1XtcacTQ6byy7Hdi6yGKYlRWH/
	LU02QT6PzTRhNpFXmD40jfWr8mS9nOxF53PDuYPImRMvTqlzGudbeUNhPy6QsTx+gz
	Cg3YLeecp9Krrnr9CknE2W5pHuU4KaMbQtJyPYgTwdaECWAEYEe365KxqR7JwO0sTV
	lJEehVu0i3LMYyYUBs9ITUMD7WD8bpB4bXdIG7DoHWmm7SLqLiQ98k/LysKB0f4GlI
	hMw9NJMCY3b6vZi9kdKZ4pPxANUX8hvAcV20F8Bfwj/BPIEqOjpL/JkYCgmW7o+FRd
	1+oFf/1LnNHLOqDCuOoMKHfN53yKD9lah/lxkW2ZchDGR5RHjaPm+H6PswIQN5Cx6d
	lkhn9WWykBoxffk7P1jt2fBg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:57:54 +0200
Message-Id: <20191027225754.16055-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] gpsd: Backport a memory leak fix
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
X-List-Received-Date: Sun, 27 Oct 2019 22:57:56 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../0001-gps_shm_close-Free-privdata.patch    | 37 +++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-gps_shm_close-Free-privdata.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0001-gps_shm_close-Free-privdata.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0001-gps_shm_close-Free-privdata.patch
new file mode 100644
index 000000000..9b3801580
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/0001-gps_shm_close-Free-privdata.patch
@@ -0,0 +1,37 @@
+From 2a4b3bcde0d73a3a4a6644d5f944ac9d16023ba9 Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@stusta.de>
+Date: Mon, 21 Oct 2019 13:53:25 +0300
+Subject: gps_shm_close: Free privdata
+
+Previously every open/close cycle leaked privdata.
+
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+Signed-off-by: Gary E. Miller <gem@rellim.com>
+
+Upstream-Status: Backport
+---
+ libgps_shm.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/libgps_shm.c b/libgps_shm.c
+index d93972bba..12bb3760b 100644
+--- a/libgps_shm.c
++++ b/libgps_shm.c
+@@ -163,8 +163,12 @@ int gps_shm_read(struct gps_data_t *gpsdata)
+ 
+ void gps_shm_close(struct gps_data_t *gpsdata)
+ {
+-    if (PRIVATE(gpsdata) && PRIVATE(gpsdata)->shmseg != NULL)
+-	(void)shmdt((const void *)PRIVATE(gpsdata)->shmseg);
++    if (PRIVATE(gpsdata)) {
++        if (PRIVATE(gpsdata)->shmseg != NULL)
++	    (void)shmdt((const void *)PRIVATE(gpsdata)->shmseg);
++        free(PRIVATE(gpsdata));
++        gpsdata->privdata = NULL;
++    }
+ }
+ 
+ int gps_shm_mainloop(struct gps_data_t *gpsdata, int timeout,
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
index a28d59dce..054af4082 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
@@ -9,6 +9,7 @@ EXTRANATIVEPATH += "chrpath-native"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
+    file://0001-gps_shm_close-Free-privdata.patch \
 "
 SRC_URI[md5sum] = "b3bf88706794eb8e5f2c2543bf7ba87b"
 SRC_URI[sha256sum] = "27dd24d45b2ac69baab7933da2bf6ae5fb0be90130f67e753c110a3477155f39"
-- 
2.17.1


