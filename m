Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B485E7199C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 22:07:11 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u144so13496530wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 14:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=TQ7kcLlAv+KC9k92xI9Jh3YfX40hDfNIsZGxV5ABeGE=;
	b=BUNT91/OtjquTVy+dXFHdzJKoX/Mij7KnhmwpRyhL1mL2TuCDdPHaJPrFHz8wb7CAP
	+tyTXOL5KqqCFEJ8H1krSnHcSqO0oWudq8glb0+5ciYmMf4Tco53eY0NPZ25WiY/U+FS
	jxfg9o4Y0+lBh0xMRIjNvEcA7f7X+m8jNIPHknhGGkMCkj9RC9ao/kj9oE6YTh/g4FzH
	EOVLe879JyFvq7DlEx3AjT1RnuumRrULuI0x/QhUIBbkJw17j+VhHtEx9TDdlLSfTGN9
	DK3I+ns1kyXxJrgBDUECLpXnXkFcN3YdZ+5boLcVJg0r5NX7ZcD+5HJGzLwtFYwq1IMS
	gaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TQ7kcLlAv+KC9k92xI9Jh3YfX40hDfNIsZGxV5ABeGE=;
	b=alEtxKRIwQo5qG2tEuUwbv1wvO8aPaBvOCyxhXZszZqQv4BTmLr4WO4jOTR75g6KYo
	5ZO8Sv78GG15m8WISD7oZlNNRqL884gM8b2zI6n17zvY6+p9+TaIvkMe4Lt6/erMN0hW
	UnudFL8u1Ufmv+EO8yvDcEtab2mU7oqGhvtw9a5lZYUC9jkojwTDSUYDhdi7vrBpVZPk
	L96AdS6qcCsR/tFR+7RpqJBARoOlEYwi7PojaLi1w76gxk1rccbVzZpq23k1+EPVvNOu
	hAIW+SEYwOuBKoCDq4ORHhia7YuZJ8bJmBitb7U+VXkDyPwKk7v79ED3AXpAcG4KNOmv
	e4Fw==
X-Gm-Message-State: ABUngveneGe65tB0I9c4DOWELQN7UfB1fhBv8yq9lwhx/1kfdK/p3u7M5b9tUnPaTIc/ww==
X-Received: by 10.28.129.81 with SMTP id c78mr3746782wmd.94.1478470032373;
	Sun, 06 Nov 2016 14:07:12 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D71.dip0.t-ipconnect.de.
	[79.223.29.113]) by smtp.googlemail.com with ESMTPSA id
	k2sm16044363wjv.11.2016.11.06.14.07.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 14:07:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:06:40 +0100
Message-Id: <1478470013-27247-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 02/15] xfce4-battery-plugin: update to 1.1.0
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
X-List-Received-Date: Sun, 06 Nov 2016 22:07:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix-build-on-aarch64.patch was a backport and is now included upstream

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../fix-build-on-aarch64.patch                     | 34 ----------------------
 ...ugin_1.0.5.bb => xfce4-battery-plugin_1.1.0.bb} |  6 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin/fix-build-on-aarch64.patch
 rename meta-xfce/recipes-panel-plugins/battery/{xfce4-battery-plugin_1.0.5.bb => xfce4-battery-plugin_1.1.0.bb} (59%)

diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin/fix-build-on-aarch64.patch b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin/fix-build-on-aarch64.patch
deleted file mode 100644
index ed4eec0..0000000
--- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin/fix-build-on-aarch64.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Backport from 
-
-http://git.xfce.org/panel-plugins/xfce4-battery-plugin/commit/?id=0f6926479728ca784a20b63d7c146a91e37d98fb
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 0f6926479728ca784a20b63d7c146a91e37d98fb Mon Sep 17 00:00:00 2001
-From: Landry Breuil <landry@xfce.org>
-Date: Thu, 19 Mar 2015 20:42:24 +0100
-Subject: Fix build on aarch64 (bug #11724)
-
-
-diff --git a/panel-plugin/libacpi.c b/panel-plugin/libacpi.c
-index 530194d..efb5c9c 100644
---- a/panel-plugin/libacpi.c
-+++ b/panel-plugin/libacpi.c
-@@ -29,6 +29,7 @@
- #include <sys/types.h>
- #include <dirent.h>
- #include <glob.h>
-+#include <unistd.h>
- 
- #ifdef __FreeBSD__
- #include <fcntl.h>
-@@ -52,7 +53,6 @@ static int      acpifd;
- #include <sys/sysctl.h>
- #include <err.h>
- #include <errno.h>
--#include <unistd.h>
- 
- #endif
- 
--- 
-cgit v0.10.1
diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.0.bb
similarity index 59%
rename from meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb
rename to meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.0.bb
index 5293c9e..9d2d954 100644
--- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.0.bb
@@ -5,7 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
-SRC_URI += "file://fix-build-on-aarch64.patch"
-
-SRC_URI[md5sum] = "ca2d394e411a20442a519efa0d14f8ec"
-SRC_URI[sha256sum] = "f659b1af40ab72c93448affaa693ab551827a5600ce9b97a799b7c2419bdeb11"
+SRC_URI[md5sum] = "f78d8d0cc13d40753a207a836869b953"
+SRC_URI[sha256sum] = "8c9deec8d95da4cc39d6d9091433e5822b6bbe07d80117045dd4dd3480427ece"
-- 
2.5.5


