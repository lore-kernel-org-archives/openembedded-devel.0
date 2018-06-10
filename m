Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 680B8744AA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:51 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id 69-v6so11810039wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RABMPYgn5kPU6dYi9JlEiatsA0qUbsjF9aRR9G771S0=;
	b=Rpbr2gGfcMF79fPVGIz3GSFoJd45bnq3WRUObOJsKlgzVmL7uHG7oMnTUY45hm3A05
	EO1ln19bvg5tVd6lhgh2wY9Xe/es4exMV8ZbFRe9i4HjSv/w9DQiK7CUs7n3Wb5OE0j/
	8FHRAgCGDHkU06uXEV5sZi08x7csNRsgL0IGonGUR94pUws/YqF4clnqFAnfcOV/hMWB
	sdSHBLPj2ccer1oyVQNE9zleG8qEFqX8KXYLmVFKBdGG0+RKmTo3uBTdXUUR3o30Fk2F
	J5+NlOJrcyO4Zr2T1zXtb49Eegx5Ng7a2Gi1yM/etafQ10mQGy7SB/D5YncChY1D5h21
	QdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RABMPYgn5kPU6dYi9JlEiatsA0qUbsjF9aRR9G771S0=;
	b=lyUp1BCIkZhJLwaz1qiALzNmxbDT4pkPNWvAwTWTuhXYGjNcBIPQUQ1Qf+PQFPwnpg
	BBHhmEoSun447PLCnuxUM/tlZyIDmGnneAYJ2K93oS96RDVE3sOkD4fFX+uh34KOZOeM
	MW8K+pDURTwg3BYsfgbLlBDzDsMO1lAsYXsjDyu3lW+fPo3K1D7WACQy1pYABbWyQLhU
	rv4KkV/3NBDBHPiQFdLgX0wBixCPufLdJR26uHLKFI64OGtqgRY3xSvTwPbbQoKJroGb
	eZJm7I1nY6Jl3YHf9Lx0T1x2Xz6lZQV/BUUIEdHDGCyEmSqf1xWki12R63cbFPJvJYAh
	4WzA==
X-Gm-Message-State: APt69E3TdHTXFwtdH0RQBXZpnh+Tivv3UH69C1UtiSWoKKG1R1x1Ke0P
	IgM/9bjKHhw4h6k5jHh9/4I0jA==
X-Google-Smtp-Source: ADUXVKJozw0ZJUbxAe9koH5oXCPIuvLrYs8sz95FBrKnBpKXAdshRrGuA7Q6ISGGzoMp++KrgyIJHg==
X-Received: by 2002:a1c:9189:: with SMTP id
	t131-v6mr6590686wmd.89.1528643331865; 
	Sun, 10 Jun 2018 08:08:51 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:11 +0200
Message-Id: <20180610150821.9536-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 09/19] thunar-volman: update 0.8.1 -> 0.9.0
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
X-List-Received-Date: Sun, 10 Jun 2018 15:08:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* remove gtk+ dependency: Thunar moved to gkt3 and depending on libxfce4u* is
  good enough
* it is a development release but no stoppers could be found.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...with-no-value-in-function-returning-non-v.patch | 26 ----------------------
 ...unar-volman_0.8.1.bb => thunar-volman_0.9.0.bb} |  7 +++---
 2 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/thunar-volman/thunar-volman/0001-Fix-return-with-no-value-in-function-returning-non-v.patch
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.8.1.bb => thunar-volman_0.9.0.bb} (55%)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman/0001-Fix-return-with-no-value-in-function-returning-non-v.patch b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman/0001-Fix-return-with-no-value-in-function-returning-non-v.patch
deleted file mode 100644
index 7233ea7ba..000000000
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman/0001-Fix-return-with-no-value-in-function-returning-non-v.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 2e295e9ce8f7f60a271adf004588b0d8db88db09 Mon Sep 17 00:00:00 2001
-From: Matt Thirtytwo <matt.59491@gmail.com>
-Date: Sat, 7 Mar 2015 22:50:32 +0100
-Subject: [PATCH] Fix return with no value in function returning non-void (bug
- #11656)
-
----
- thunar-volman/tvm-block-device.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/thunar-volman/tvm-block-device.c b/thunar-volman/tvm-block-device.c
-index da31efa..edb6cad 100644
---- a/thunar-volman/tvm-block-device.c
-+++ b/thunar-volman/tvm-block-device.c
-@@ -714,7 +714,7 @@ tvm_block_device_mount (TvmContext *context)
-   GMountOperation *mount_operation;
-   GVolume         *volume;
- 
--  g_return_if_fail (context != NULL);
-+  g_return_val_if_fail ((context != NULL), FALSE);
- 
-   /* determine the GVolume corresponding to the udev device */
-   volume = 
--- 
-1.9.0
-
diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.0.bb
similarity index 55%
rename from meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb
rename to meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.0.bb
index c61d4512d..5a37b69bd 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.0.bb
@@ -2,15 +2,14 @@ SUMMARY = "Automatic management of removable drives and media for thunar"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo glib-2.0 gtk+ libxfce4ui libxfce4util xfconf libnotify libgudev"
+DEPENDS = "exo glib-2.0 libxfce4ui libxfce4util xfconf libnotify libgudev"
 
 inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += "file://0001-Fix-return-with-no-value-in-function-returning-non-v.patch"
-SRC_URI[md5sum] = "65ab6e05b2e808d1dcc8d36683a59b7e"
-SRC_URI[sha256sum] = "5a08bb5ce32c296a64dfbdb2406d4e45a208b2c91e4efa831dc28f1d6c2ac2bd"
+SRC_URI[md5sum] = "3b403a4f846927391ea4bee765a055df"
+SRC_URI[sha256sum] = "e4bffcfee15530e277fa80865eb1de31e63c7effaf8835c9fa7c71e5a0076b2e"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.14.3


