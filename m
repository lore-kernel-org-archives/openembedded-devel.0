Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A305FE6B277
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 06:11:31 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96112.1766470282826665350
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 22:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lbyrkGS8;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766470282; x=1798006282;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=b6k1jWDhAYpssWAdR0mKeZ7QjRvixQzJRROx3+NciVw=;
  b=lbyrkGS8Z+AuLX8ho+hKK+Yzk6mVu/u0bGv6gFRBqUq+Im54wvUpCSQ0
   PIJdXUH/3CqiZ8LBU3m/n8TbyzbPeVlJNcKmlKPn7DLf9sO9OSYWDpi0B
   xDU5vZKIYgE3puit01X+0r0wBrYd4IbZq9AvQg67rlKHBTSMCFVzHvgZ6
   Q2vDCAQgyUmB53Zg+uygUX+Bv6zQlQC7UBoYPEoYtenEZnfmvL9aL7BJK
   eZ+9Acr4v/zZRYEsIMKKb8h1uKfwtf/09vv+siq+94DTggZ4XWMlbwENG
   7d4AuMwwVzabxrcYLJ7eNLftFyUOkEsPDozXhms8grQMc3AP2t36t2QOW
   w==;
X-CSE-ConnectionGUID: mT4gg+1HSAuz0TZybMtf5w==
X-CSE-MsgGUID: MkX/GZB4QgazjPSaU6vhxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="212167791"
X-IronPort-AV: E=Sophos;i="6.21,170,1763391600"; 
   d="scan'208";a="212167791"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 15:11:21 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 48273C0181F
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:21 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 01DF31801FC6
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:21 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id D2ACA10005B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:18 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 4/7]  mpv: upgrade 0.40.0 -> 0.41.0
Date: Tue, 23 Dec 2025 14:10:39 +0800
Message-ID: <20251223061043.659-4-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
References: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122820

1.Changelog:
  https://github.com/mpv-player/mpv/releases/tag/v0.41.0

2.Drop 0001-mpv-fix-build-with-ffmpeg-8.0.patch as it was merged in 0.41.0.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../0001-mpv-fix-build-with-ffmpeg-8.0.patch  | 41 -------------------
 .../mplayer/{mpv_0.40.0.bb => mpv_0.41.0.bb}  |  5 +--
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-with-ffmpeg-8.0.patch
 rename meta-oe/recipes-multimedia/mplayer/{mpv_0.40.0.bb => mpv_0.41.0.bb} (95%)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-with-ffmpeg-8.0.patch b/meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-with-ffmpeg-8.0.patch
deleted file mode 100644
index ea705a4c73..0000000000
--- a/meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-with-ffmpeg-8.0.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From dd80e5841894f854e2d994601016151531521d9a Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Tue, 16 Sep 2025 09:37:48 +0200
-Subject: [PATCH] mpv: fix build with ffmpeg 8.0
-
-quick fix, only compile tested
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Pending
----
- demux/demux_mkv.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/demux/demux_mkv.c b/demux/demux_mkv.c
-index 135edcc23d..cc7ce3e98f 100644
---- a/demux/demux_mkv.c
-+++ b/demux/demux_mkv.c
-@@ -2200,16 +2200,16 @@ static int demux_mkv_open_sub(demuxer_t *demuxer, mkv_track_t *track)
-             // [0x30..0x37] are component tags utilized for
-             // non-mobile captioning service ("profile A").
-             if (component_tag >= 0x30 && component_tag <= 0x37)
--                lav->profile = FF_PROFILE_ARIB_PROFILE_A;
-+                lav->profile = AV_PROFILE_ARIB_PROFILE_A;
-             break;
-         case 0x0012:
-             // component tag 0x87 signifies a mobile/partial reception
-             // (1seg) captioning service ("profile C").
-             if (component_tag == 0x87)
--                lav->profile = FF_PROFILE_ARIB_PROFILE_C;
-+                lav->profile = AV_PROFILE_ARIB_PROFILE_C;
-             break;
-         }
--        if (lav->profile == FF_PROFILE_UNKNOWN)
-+        if (lav->profile == AV_PROFILE_UNKNOWN)
-             MP_WARN(demuxer, "ARIB caption profile %02x / %04x not supported.\n",
-                     component_tag, data_component_id);
-     }
--- 
-2.50.1
-
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
similarity index 95%
rename from meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
rename to meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
index 117395b371..ccb66adb7a 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.41.0.bb
@@ -16,9 +16,8 @@ DEPENDS = " \
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=570a9b3749dd0463a1778803b12a6dce"
 
-SRCREV = "e48ac7ce08462f5e33af6ef9deeac6fa87eef01e"
-SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim_version('${PV}', 2)};protocol=https"
-SRC_URI += "file://0001-mpv-fix-build-with-ffmpeg-8.0.patch"
+SRCREV = "41f6a645068483470267271e1d09966ca3b9f413"
+SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/${@oe.utils.trim_version('${PV}', 2)};protocol=https;tag=v${PV}"
 
 inherit meson pkgconfig mime-xdg
 
-- 
2.43.0


