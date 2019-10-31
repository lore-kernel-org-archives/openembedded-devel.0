Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A6F307F9BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 16:53:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 473rx11X5fz40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 17:53:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572540789;
	bh=y8BvOuf8B+XNgrH0S5P593H0Zn5c0/j5gh6WdS3tLHM=;
	h=From:To:Subject:Date:From;
	b=RKcY6fDlQDmcRu+idpvPFQ/jtt+TZzoyJCuA5fzgr9RPJBXnC3fFXKYgJNmGzxma8
	ybbCU1YmbkpUjnTS8qSKzPOsUrjUS6EPqXqcWBdp3vb3zTeQ2r4SVL7rINthuOMbS+
	QFDJl6yFp0fGZ1IMalt0wXucAQJgkKaCDHKXG2gA1Ph/9k7VKffXwdkFwqRzR50pX7
	xsmAWwIh65BgYHZ2Qxx88WScwPlBzhrtqtE0H/O3KFNiNpKU0FuzQyFZESD0wJ2AdM
	6FuZEw+nErRzdHpkDK0nARrfloayRYTEyEBzQ0ELxZrACE0TzQDadzLHr0wdVSi++S
	tLsCuBoOQjEqht40oiixxpL1BqhqduQwdKzjWDuN63ggFlutTGknsGzzrai5cn/qCH
	CHuVY7nZi+SOyLhG/NZgg3BOzpG2SFXiMlRApTfF+vEOFs6xC01+S81tlEgw5HN55B
	7rNDjVwzD8Kr9PbJJ5DVsDoxiVfqBHFzipHltkuKJq3oeCd6JW/o13XPPVsx21Bi8W
	QFhpw2UGZj57WjnELceWMYoLjF/OrksSy1I0jcEHHVW6Reb6kMFXY9DLOoHWCcxzRF
	cWL2uK/qV86dIRdMLiAjBeVwyuwzGmUSqgQIz01HJ7WjGfqTxXWazO0HKCoocXtp60
	kOMDDxFHOOUwyQuzhKpmdMek=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Oct 2019 18:53:08 +0200
Message-Id: <20191031165308.24633-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][zeus][PATCH] gpsd: Backport a memory leak fix
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
X-List-Received-Date: Thu, 31 Oct 2019 16:53:11 -0000

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


