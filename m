Return-Path: <brendank310@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id BCD2E799F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:52 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id i15-v6so10017595qtr.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9VS8eAdPU68qylJhFE6dgiFvisG8hg2Izv/xNU97YqA=;
	b=MLDpRpsf+NIT6QPdCzvah5TwjwqtAE5lSogx6PY1lkk60YLqjZIGFQRaRcHCwt9EjJ
	SB8cSrtx+5gVDC3I8+WbjwvfLocECAjLgb1ksLYzI6cZOEOXFuRTmPIEKgNbWQfPqvsO
	5luIgAYwdlieC3ovzNjCgP/sfCc0RW2jto7HBc/CmpRhETgO/9ukjzvW6EqOCNbZdDmP
	2drfj+tkfTU8+P6k9j/o4x1N+y8B0nHiSg6nh6kQzdtuTVHhAcfQDMhbl43VFSxJ/Qrf
	sjuk1VXm8uaThItHcm8kVEPh18nKFBHO+0gRzkK2jwrbNeiYlF8RElf6lOL2Gj2MDD2Q
	alpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9VS8eAdPU68qylJhFE6dgiFvisG8hg2Izv/xNU97YqA=;
	b=QfpVDHO9hzL32oDWi1N2SO8ItbBN4X3I1h4nHSnWB/8I8nIVxnGgH3edGXGWrOpF0m
	y6NOwsrqVW4lr10NMsSP5CPHKAzWU+g0ji2I7uZnk4IjW8gpIL/VBSd1EKurHEr1TXLI
	u6ty1tlbklLCpBFQEsgKpMy3fnE3qxxMyUeR5eaCt0gL0e1QKxyJ6XQ10aDAb3RCa18w
	clCSIKl/8/xooYmGXtdGiX71NVPNeybcLB4XhFgiKhbP4auCazz1z/dhhYsVWFNynO9M
	zwujcbfHOHYTVkGLNKaJC0A6pomuPcfOzimVjo544RM/5shG9xB4jNRcUReyVHWkp25R
	zU/g==
X-Gm-Message-State: AGRZ1gIdr2ygB9ABqIFIbgUfsbFNNYdN1hLVQb+jZyesjRVwdd2NmeKE
	aZXJwsIXuRCZgCSZPGr8OX0kHG15
X-Google-Smtp-Source: AJdET5fmfrEmHNW/YvC6oAtbAQyP6MMpSNDUqdWHwZ1iowpBB53de4LNphCL7Ya1K7kbmzsI7/Emcg==
X-Received: by 2002:ac8:26a6:: with SMTP id
	35-v6mr13547832qto.281.1540831313494; 
	Mon, 29 Oct 2018 09:41:53 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:52 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:41:07 -0400
Message-Id: <4a7b04c4d262dafef02e120102f054f64bb95c69.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 10/16] dconf-native: add dconf-native recipe
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
X-List-Received-Date: Mon, 29 Oct 2018 16:41:53 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

gdm recipe requires a native dconf tool.

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 .../dconf/dconf-native_0.28.0.bb              | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/dconf/dconf-native_0.28.0.bb

diff --git a/meta-gnome/recipes-gnome/dconf/dconf-native_0.28.0.bb b/meta-gnome/recipes-gnome/dconf/dconf-native_0.28.0.bb
new file mode 100644
index 000000000..ee78fbb66
--- /dev/null
+++ b/meta-gnome/recipes-gnome/dconf/dconf-native_0.28.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "configuation database system"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+SECTION = "x11/gnome"
+
+SRC_URI[archive.md5sum] = "81faa8e68e5ea71ff0ee75050fc0759c"
+SRC_URI[archive.sha256sum] = "61d3b3865ef58b729c3b39aa0979f886c014aa8362f93dcfc74bf5648ed9c742"
+
+DEPENDS = "dbus glib-2.0 intltool-native"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gsettings bash-completion vala native
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${libdir}/gio/modules/*.so \
+    ${bindir}/dconf \
+"
-- 
2.17.1


