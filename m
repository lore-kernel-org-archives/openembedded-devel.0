Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0F9FB7FA41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 16:54:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 473ryF4Rhxz5h
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 17:54:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572540853;
	bh=juJ4UoS2UaoFr5rQOoIclByrtG+bn+t0CqnPN23U5NM=;
	h=From:To:Subject:Date:From;
	b=Xs3MjGgfLw3ZNINfglkgwZgggy/WWeHQ9aI1vaOsBxARpUFB95ZeaiIPFyDHeIYJJ
	pE7ZcXuBRvvgXWTCQS74KDpUqxDWsWNwxUFu+tq52GtL6hwSOEwL4Bv5m6oXwSCeE3
	EAqYvTt95SOeKQVxvCwYJdHrelw8ZTTRj5Z7oj3KBFpdxS1/qEqjxF/a6KhG9vVLYl
	S0qa4yMsA+5rBL354hVtVUXTlysK/S+xR6bM4ztq+CpifHzlRKeTfvCd+z7v0fSIkE
	1/JF/5Y98SxLIRzo95v/+ecqjz47TTL85UZeaix6pe4IxgCAkZx133WJb5REeNK2UC
	Oe7ZGpiie6UOo6cz2lo9TkYvIl0EojeDcM1xifAJJWTP2c+8YiAep681SerdYSRSaP
	ge+837u+T9BR44ZTze2fPLMbN/cebU6Rs55RfeGkf/7+b4MMSw41vzCi+VhTmgllfX
	oSf2gXyvMlKaWZzTjLyu3vASK5g3Wpxmj6isFN30KbOGLhScaKL30QgjEbxdthG1Pr
	nnRtZcMjSJnyMpShcPfXHVbEFJY4SeuRxucsocSpxGMgDuWQdYsL2WW+OkyvTgAgWc
	5aDJxRvWjgnxCziRO7GA1IVK+cCRwFZ6nwOQtiCdzCzze8VvzI6jrrwTRb7OQYpr0i
	DiJro4lYhTPhtcqYqeV6Vg/w=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Oct 2019 18:54:11 +0200
Message-Id: <20191031165412.24745-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][warrior][PATCH] gpsd: Backport a memory leak fix
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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-gps_shm_close-Free-privdata.patch    | 37 +++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-gps_shm_close-Free-privdata.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-gps_shm_close-Free-privdata.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-gps_shm_close-Free-privdata.patch
new file mode 100644
index 000000000..9b3801580
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-gps_shm_close-Free-privdata.patch
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
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
index 488fa3a52..f4e018055 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
@@ -12,6 +12,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0004-SConstruct-disable-html-and-man-docs-building-becaus.patch \
     file://0001-include-sys-ttydefaults.h.patch \
     file://0001-Add-bounds-check-in-in_escape-state-of-JSON-parser.patch \
+    file://0001-gps_shm_close-Free-privdata.patch \
 "
 SRC_URI[md5sum] = "e0cfadcf4a65dfbdd2afb11c58f4e4a1"
 SRC_URI[sha256sum] = "68e0dbecfb5831997f8b3d6ba48aed812eb465d8c0089420ab68f9ce4d85e77a"
-- 
2.17.1


