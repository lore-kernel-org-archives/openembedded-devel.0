Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 075E67702B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:45 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id v13-v6so17779468wrp.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zeZrM5sXgaahawOk+8KJpSiP9m6CTHV55uzCuZpADak=;
	b=HqQ6PVkSMsKr4gfu6C164FcvSnCqzaEikmgSWrzyM5pQQxNij/lr+Qz/TChAat6vI9
	OU3KVjKtcburvDGsr9DHXiir9HSfZ48v7G+V1dWUU+Hg1JtEoP6ec5D8tHLFnEJ+omkO
	qmhzY3QxYxnWVR4JNzIQGAdGSr3j1dGMEumTTUG9PKJXxLgxtF1LoMS3SFSizszpjutd
	kN+v5dOpfu8j8AvBoFAbcxJT7B/1mGAuE36t4yxUf+QxAyj98k1j2irpvsp/Z6wjXBi1
	SoOoo/ALRDjdEfHGA35WOWQe51BcKC5whoCVMo0FwBlYMRWY6WUfqYbKb4tgT7u6Mli6
	YpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zeZrM5sXgaahawOk+8KJpSiP9m6CTHV55uzCuZpADak=;
	b=o0InE4ahSZBja3Xc5za9GrJdA/XtQ4pwcm/NXYSgGAl2wedAau9h1lSbog1Wz6h3/3
	TcQ7HHQasweaKWURzLFQqh9g0zz1OReMeAO3UvB6nwiLyufhnkTrxhx3yu757SpuPfRF
	7DM2cBs4GT7Bnh1yiVOu3LOOmPDsbDRhIFOjttZGKhSx+uSEkSS7J1xOln7/iigeGJi3
	N6fTBALjl9iCM3zZ9SqpQowvEXezT37UGb85kr9CnUuqZGuY3BD3e8ktWXvS68JzppUZ
	02acUp1RjoR3ejZq7yk8QMECRBDOhnTvkjNi3iISJdRBitR+iUn76n4qYwPlhisB3paG
	HV0w==
X-Gm-Message-State: APt69E3D7s++tp6zGMp+nLMB1x10QH1zSbNYo1Blf8ewknPhIGB0J1QJ
	hwZf6FAdKJniWskQqfqpRR38YA==
X-Google-Smtp-Source: ADUXVKKFtHxYwybz/yAEkREfc0x4fCNhcpumJEDkvPVmT0xrQLnR5DrH4vip3eBCT8dum7v4A9oL2A==
X-Received: by 2002:adf:9924:: with SMTP id
	x33-v6mr11065678wrb.29.1528643326212; 
	Sun, 10 Jun 2018 08:08:46 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:06 +0200
Message-Id: <20180610150821.9536-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 04/19] xfce4-mixer: fix build after update of xfconf
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
X-List-Received-Date: Sun, 10 Jun 2018 15:08:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-Fix-build-after-update-of-xfconf.patch    | 61 ++++++++++++++++++++++
 .../recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb |  5 +-
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-mixer/files/0001-Fix-build-after-update-of-xfconf.patch

diff --git a/meta-xfce/recipes-apps/xfce4-mixer/files/0001-Fix-build-after-update-of-xfconf.patch b/meta-xfce/recipes-apps/xfce4-mixer/files/0001-Fix-build-after-update-of-xfconf.patch
new file mode 100644
index 000000000..31216c038
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-mixer/files/0001-Fix-build-after-update-of-xfconf.patch
@@ -0,0 +1,61 @@
+From 6ecaeced291f935a9d41e9bc33411358c95a5e91 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 22 Jan 2018 15:35:08 +0100
+Subject: [PATCH] Fix build after update of xfconf
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+xfconf stopped using dbus-glib so required flags must be included here
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ panel-plugin/Makefile.am | 2 ++
+ xfce4-mixer/Makefile.am  | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
+index a494682..b094472 100644
+--- a/panel-plugin/Makefile.am
++++ b/panel-plugin/Makefile.am
+@@ -27,6 +27,7 @@ libmixer_la_CFLAGS =							\
+ 	$(LIBXFCE4UI_CFLAGS)						\
+ 	$(LIBXFCE4PANEL_CFLAGS)						\
+ 	$(XFCONF_CFLAGS)						\
++	$(DBUS_GLIB_CFLAGS)						\
+ 	$(GST_PLUGINS_BASE_CFLAGS)					\
+ 	$(KEYBINDER_CFLAGS)
+ 
+@@ -48,6 +49,7 @@ libmixer_la_LIBADD =							\
+ 	$(LIBXFCE4UI_LIBS)						\
+ 	$(LIBXFCE4PANEL_LIBS)						\
+ 	$(XFCONF_LIBS)							\
++	$(DBUS_GLIB_LIBS)						\
+ 	$(GST_PLUGINS_BASE_LIBS)					\
+ 	-lgstaudio-0.10							\
+ 	-lgstinterfaces-0.10						\
+diff --git a/xfce4-mixer/Makefile.am b/xfce4-mixer/Makefile.am
+index 4af69e9..e076fc8 100644
+--- a/xfce4-mixer/Makefile.am
++++ b/xfce4-mixer/Makefile.am
+@@ -32,6 +32,7 @@ xfce4_mixer_CFLAGS = 							\
+ 	$(UNIQUE_CFLAGS)						\
+ 	$(LIBXFCE4UTIL_CFLAGS)						\
+ 	$(LIBXFCE4UI_CFLAGS)						\
++	$(DBUS_GLIB_CFLAGS)						\
+ 	$(XFCONF_CFLAGS)						\
+ 	$(GST_PLUGINS_BASE_CFLAGS)
+ 
+@@ -46,6 +47,7 @@ xfce4_mixer_LDFLAGS = 							\
+ 	$(UNIQUE_LIBS)							\
+ 	$(LIBXFCE4UTIL_LIBS)						\
+ 	$(LIBXFCE4UI_LIBS)						\
++	$(DBUS_GLIB_LIBS)						\
+ 	$(XFCONF_LIBS)							\
+ 	$(GST_PLUGINS_BASE_LIBS)					\
+ 	-lgstaudio-0.10							\
+-- 
+2.14.3
+
diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
index bdbec458b..6c057d884 100644
--- a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
@@ -6,7 +6,10 @@ inherit xfce-panel-plugin
 
 DEPENDS += "glib-2.0 gst-plugins-base gtk+ xfconf libunique"
 
-SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
+SRC_URI = " \
+    http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2 \
+    file://0001-Fix-build-after-update-of-xfconf.patch \
+"
 
 SRC_URI[md5sum] = "1b3753b91224867a3a2dfddda239c28d"
 SRC_URI[sha256sum] = "fb0c1df201ed1130f54f15b914cbe5a59286e994a137acda5609570c57112de2"
-- 
2.14.3


