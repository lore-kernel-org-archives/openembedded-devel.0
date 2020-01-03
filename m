Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4967C7F9AD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:43 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id k25so22780063pgt.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qkKO+oPehmfwF4fs+EpF58snMtm2XLcD17MTf1L6uYM=;
	b=CM2mS8CYJh7s1VJaD0Ng3roJm+xdAJes6sWRLO7cF2Le7bLAfp+5LITTx6igNZccWq
	QKrQxXTke9bE1ff7kq3i/BW0XnKWeQjmCUm9SToxCZatI41zoak3NJzcJJsx90xoNWVC
	qBpln/M9gwtroX+Hf7zJGNUDllMivVa0v//kVPAPOpkwG1M7K6x+L1ANJwhUB2xOaVQ7
	EUCq7flBgNbI8VV7+M1o+LBnRMTaXpgXeIVVqRtum1QxZ8RdSrwhfsxwZk4VvrR0m7Og
	c9G1WWO9n7w2tWCpSYVaXkoZ4iCR4ITfri7Mn0zbzPmZonC7ugG2Uui2RkvPPfGP/O38
	dvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qkKO+oPehmfwF4fs+EpF58snMtm2XLcD17MTf1L6uYM=;
	b=omwvgWgeeh2GSLO7XfhsvqdCTDU8hH76efHtbh91gmSfS+3c8zU7aiR8HA5JPy6u8K
	TtPCowlDSbvgIqjb3hWTN0A3LBcepPpZXLBVH4pMH9dtQAq6yc0h48PekyVG1w7Oxcpk
	a08v/bjuynsUpNakx81Mau4J+iPWRFp6/tiFeGQvq8Hk544uLDBJTMSXx2OSO/XQ9NaS
	q5KHyrKQcdlkdvHujrfC2lU5mmhdubCe+w+de+C6nzGftj4hK/QNZugyS0aG9LlkWG3g
	1YylIer7mJXQKQH95Sd/bESKye2vEMldHhDxnJ9s0OzJwt4hflRsZcWbdqCTJLRxeHvZ
	I1oA==
X-Gm-Message-State: APjAAAUB2Sqmzt8GnmyyfwXy9AY0phaOVT+j9MI97KzxleFfejr5KJ8h
	ILCjs4BjhaQ4YVLpzk6sMMdzxMZNzhk=
X-Google-Smtp-Source: APXvYqwR9RWcPkx4rRtDKJ9YemXrdWCcQ2bZXHUWpvn5wvEQvaWVpjdcouMQ7/FbGCLtxJ8n3riO4w==
X-Received: by 2002:a63:c04a:: with SMTP id z10mr85609396pgi.441.1578019784251;
	Thu, 02 Jan 2020 18:49:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:49:12 -0800
Message-Id: <698e7d9416d99ada3b6dea115a40f2c283b26610.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 15/17] gpsd: Backport a memory leak fix
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:43 -0000

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-gps_shm_close-Free-privdata.patch    | 37 +++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0001-gps_shm_close-Free-privdata.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0001-gps_shm_close-Free-privdata.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0001-gps_shm_close-Free-privdata.patch
new file mode 100644
index 00000000000..9b38015800c
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
index a28d59dce13..054af40829e 100644
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


