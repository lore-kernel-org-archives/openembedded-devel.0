Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 925977FC38
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 21:34:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47WxL96gyyz3H
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 22:34:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575927298;
	bh=y8BvOuf8B+XNgrH0S5P593H0Zn5c0/j5gh6WdS3tLHM=;
	h=From:To:Subject:Date:From;
	b=PLF2TO3LAj7quDIOTOAOMg0oh6ocJ4PJd4Je3+9+EDuMvjWm19MKisjFWgwGnm68x
	cJ2ExNJFgBsVd/LqQ/MpOF4kiZ9qX1RJzV+jB6VKAKTwCtHaGwEp/KZR3VCwHJODq9
	ZIfYLipSXVjCNOUv3/XaPu21TJ2LzbxgGGcyVshY9Agw95puZX0ZRvdMPIT/GX8Z5+
	AeDRSVHQsrvfakQe8j9v+njUFmRpPVW1jMUeWC/86c2PdATrjJg/YEta5Bz2QciPMM
	pbvRCjgdJvqk/DGqKajOzsBwOXk0jyfEeylTMp36aRpPmNz/UT/b2uI+FCjUsGED2V
	/73IF1V/JshEQwgG42TOLoKGAIgmIl01BF8+pfwkpL3POXbiH4+LxazA7hFKTWvTNw
	519R1/ukql7ljiAUQEQx4cOCzWWvGse5UPoYabDf4SQk2YcJNvRjWHX66MaAZOK1vJ
	pUYVJgDPY38z92hW/6sN01H8O8TsZuGfhwEfyrhodJlUOowd0ifIzjDj/5AM2VDZX1
	iIABW/GH0CyOXf0AiaMq3ozkKZSmcJZkTOaN1/NHbJ4NVeOPGogb3dETU58SaZkeCs
	O55PugEroR1wVBB675ZecqpVo9OTm2nmxX+KaXyRSpZZV39pGqPj3CfGkXioLE44+p
	WJ6f2vGuzMxj6g4qPonIAEIw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 23:34:56 +0200
Message-Id: <20191209213456.9593-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][zeus][PATCH v2] gpsd: Backport a memory leak fix
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
X-List-Received-Date: Mon, 09 Dec 2019 21:34:58 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


