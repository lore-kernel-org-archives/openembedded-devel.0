Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F289EE0AF1
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 12:23:42 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3912.1770467017775364248
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 04:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mr2VCynU;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48327b8350dso11457105e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 04:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770467016; x=1771071816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdhbKx/uW9lws2dT59SFfILxpFxzs/cWI3ShTKUWgrQ=;
        b=Mr2VCynUMu8uglABPRV7PAlDRxSAdwLb2iT3BjCwbeNOddsfBW2WCTAEbOOHHwd4ts
         JOO3lmW2CmTS/nKAj+43j7p6wbgATYBeYA1u129xiZuf3hUEy6R5NyxbTgQp5B64mouF
         hxsKihpOOzc9F41geV7Hu55uNWKJsx+uRV2qU5QMIZm1LCKaX79Q6jN1mNwYjzOSNAmN
         71iBchPHBSKLFHNDEX0j5bNoVcaMAJs5ZI8WIIu8kH3+UZRcehYXpUzEcH4cD4qW34AP
         vIjwXLOR6yzf9aizZB6t78n/O8ZiYbcI1ddefAMUx19pKVkB5SRITMDYV9qr5ZQPrOC4
         5Njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770467016; x=1771071816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FdhbKx/uW9lws2dT59SFfILxpFxzs/cWI3ShTKUWgrQ=;
        b=XRRVcfpR3BLgjxukRze/mxrVSjUd1cih2J2CoWanD6TEErBSvgucDMoVL8gGP6i5RJ
         +2aDJkCUptIMVOBktQi78/fyFtf5e/Z3DtdU1lrJb7WfVtNCOEtrtudipD5uf6NdgjAV
         5CVbVbzHpXLO7BMFkdL3eF3PwkjAL+7qPwn5od/GOSRxsf/v7D3gBltAUdPpGNAwY22w
         x3EpxitSqR18p5iiKzlZFNPwoh64lqbm1nNMYOE/up+lH9rmvBQ4SbcA9S7jIZm0Md+x
         oPA679MFUGbT6XB4rrJ2oywLLCmYDbvsclxW+uoysNlHTili3FK7twXH9Si2GnjlQiOf
         157Q==
X-Gm-Message-State: AOJu0Yzjh7Y8/Qcm5xsxYyoQ+AH/+E2FPHsACp99ogpJHphcqXtsfFs6
	GsgUzHip2GYa0Znab3fg4K+JD7VZNJ/oThPyMZywLjfobCEr/tFwa+7dwXwTqQ==
X-Gm-Gg: AZuq6aJoCKh6rN2K3YHxXKGNYIZunhOqeoqa7fSa5adXotrOjdgXFOa7VT0AMHK0YuH
	HsoLhNzn5sKtPsQlV6g4vPt6J9V77t7mlVpyn/TPV36xbKGx4tO2uvvnKVZHlt3Z1E50zBrCEe0
	x9bVI1DLG35VXXYkv31YoqncjBNdvmMiU2NhaufDEQajYsptMuitvQ2CSfVE4uS58tcS13TswiG
	VGE611XQGy54hHSA+naZMLwfuU6ZIZTPfmQ3zAEzIRrzixiF2ulp8+yVCXyx+LPZ/JNX8L60FCC
	ypy1zDdy3CqHcdvQygnTVXFzn4S8icM02IQM7sdl2mrxYes6FeLxYVNN2zAakJPbdHwpc6s42b5
	cFxrUyoaudsuD7DqYERcOcO6+7MNeAy6Aib+DQK/CNIndbOC9/KilWrAItquACrahZkxDNkniWg
	N/yBdJ1N3Z
X-Received: by 2002:a05:600c:3b03:b0:480:1b65:b741 with SMTP id 5b1f17b1804b1-483201e3b8cmr74148755e9.15.1770467015985;
        Sat, 07 Feb 2026 04:23:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320719bf4sm112653835e9.10.2026.02.07.04.23.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 04:23:35 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 10/12] tracker-miners: upgrade 3.7.2 -> 3.7.3
Date: Sat,  7 Feb 2026 13:23:25 +0100
Message-ID: <20260207122327.664604-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207122327.664604-1-skandigraun@gmail.com>
References: <20260207122327.664604-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 12:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124266

From: Wang Mingyu <wangmy@fujitsu.com>

0001-fix-reproducibility.patch
refreshed for 3.7.3

Changelog:
============
* Fix possible crashes handling live changes to extractor
  configuration
* Make it easier to run tracker-extract-3 under Valgrind
* Plug a leak on misdetected JPEG files
* Many further metadata extraction tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9cc20a0203ebbf052aa70856436a6b265cd3fbeb)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tracker-miners/0001-fix-reproducibility.patch | 15 ++++++---------
 ...er-miners_3.7.2.bb => tracker-miners_3.7.3.bb} |  2 +-
 2 files changed, 7 insertions(+), 10 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.7.2.bb => tracker-miners_3.7.3.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducibility.patch b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducibility.patch
index ea239c41f9..0812e88a9e 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducibility.patch
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducibility.patch
@@ -1,4 +1,4 @@
-From 2bbd07843e8ec34311cafab35f21b40c86e0dd7f Mon Sep 17 00:00:00 2001
+From 1b7a34b7de9eb2ae776f7cf4dc6221f49b2395ee Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Tue, 12 Sep 2023 17:00:41 +0200
 Subject: [PATCH] meson: fix reproducibility
@@ -20,7 +20,7 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  5 files changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index a838344..6945f63 100644
+index 37f5148..18f4bfa 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -393,7 +393,7 @@ conf.set('PACKAGE_VERSION', '"@0@"'.format(meson.project_version()))
@@ -53,10 +53,10 @@ index a838344..6945f63 100644
  
  if get_option('tests_tap_protocol')
 diff --git a/src/libtracker-miners-common/tracker-landlock.c b/src/libtracker-miners-common/tracker-landlock.c
-index 95c652e..608cee4 100644
+index 6d4510b..189d2fb 100644
 --- a/src/libtracker-miners-common/tracker-landlock.c
 +++ b/src/libtracker-miners-common/tracker-landlock.c
-@@ -276,7 +276,7 @@ tracker_landlock_init (const gchar * const *indexed_folders)
+@@ -282,7 +282,7 @@ tracker_landlock_init (const gchar * const *indexed_folders)
  			          LANDLOCK_ACCESS_FS_READ_DIR);
  		}
  	}
@@ -65,7 +65,7 @@ index 95c652e..608cee4 100644
  	current_dir = g_get_current_dir ();
  
  	/* Detect running in-tree */
-@@ -296,7 +296,7 @@ tracker_landlock_init (const gchar * const *indexed_folders)
+@@ -302,7 +302,7 @@ tracker_landlock_init (const gchar * const *indexed_folders)
  			          in_tree_rules[i].flags);
  		}
  	}
@@ -90,7 +90,7 @@ index 6e58832..04750f8 100644
      ],
      install: true,
 diff --git a/src/tracker-extract/meson.build b/src/tracker-extract/meson.build
-index 16ce367..bbd494d 100644
+index 2e4f61d..b47581c 100644
 --- a/src/tracker-extract/meson.build
 +++ b/src/tracker-extract/meson.build
 @@ -158,7 +158,7 @@ endif
@@ -115,6 +115,3 @@ index 8c081fd..9792082 100644
  
  libtracker_miner_test_deps = [tracker_miners_common_dep, tracker_miner_dep, tracker_sparql]
  
--- 
-2.34.1
-
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.2.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.3.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.2.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.3.bb
index a1fefe6a00..2b2dc7c4b6 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.3.bb
@@ -18,7 +18,7 @@ SRC_URI:append = " \
 	file://0001-fix-reproducibility.patch \
 	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch \
 "
-SRC_URI[archive.sha256sum] = "eb4f2b288a0cbe9e614871cb0048274461cfe1cb8467ac817b102d3873dbcba5"
+SRC_URI[archive.sha256sum] = "e74388154b5c197b4b7ee42f0dce8c5fbbddd4d361093ef88d4fb303e33da5fe"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"

