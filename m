Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2207CCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:18 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17223.1777546212179282997
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FT+g1VUb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546213; x=1809082213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ik83Z0Q9PQwwq3ozNtEhVCPPWw3XlKIB9aRQcgxS2X4=;
  b=FT+g1VUbIZzG69mpBJVxdq9zqIW4DKVy30sjsoFsql8VvIVvjQs/YrWB
   bWSXa2r8JodOxNy3WY5beTsrVRP6fahCRRw94OC2oQmcVfd048G89Jthf
   djkzfY4beM/ZHQnKKqrfvfx4UZSO6iPFMcTRovLlkkxzMeW9TbI8GbZat
   E4zYGUp3Gwup+ULSXYDU29P57+Iav7cKascaPPBxflKhj3zeqXfO5yKyb
   Qm019vmQ46KjaFr/jzDr9oeEuvkjeyM5v5QoHoe9YGAJcKupFdDjPj0e+
   SXYCso3ksYafGhRG5Bfr8/prAsLMcnOD7GzhTFPue/9iiF2kzEqmQJ9vI
   w==;
X-CSE-ConnectionGUID: fZweOE6MRoGBxVY0CPDp/w==
X-CSE-MsgGUID: 93LEmqT3QvumiXeHXAz6CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="243116214"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="243116214"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:12 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D90A51C1C706
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:11 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9045D92674E
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 341DA1801130;
	Thu, 30 Apr 2026 10:50:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 24/64] neatvnc: upgrade 0.9.5 -> 0.9.6
Date: Thu, 30 Apr 2026 18:48:43 +0800
Message-ID: <20260430104924.1106-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126695

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Use-aml-v1.patch
refreshed for 0.9.6

Changelog:
===========
- auth: rsa-aes: Fix potential buffer overflow
- auth: vencrypt: Reject excessively long usernames and passwords

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../neatvnc/neatvnc/0001-Use-aml-v1.patch     | 21 ++++++++-----------
 .../{neatvnc_0.9.5.bb => neatvnc_0.9.6.bb}    |  2 +-
 2 files changed, 10 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-graphics/neatvnc/{neatvnc_0.9.5.bb => neatvnc_0.9.6.bb} (96%)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-aml-v1.patch b/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-aml-v1.patch
index 26c3a0230c..7413316bcc 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-aml-v1.patch
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc/0001-Use-aml-v1.patch
@@ -1,4 +1,4 @@
-From a4b238241f3f3016ef3ddcd260c1490a9c9e8168 Mon Sep 17 00:00:00 2001
+From 8b95d3c1d5f475668d53cc21a7abf431d9a9822b Mon Sep 17 00:00:00 2001
 From: Andri Yngvason <andri@yngvason.is>
 Date: Sun, 23 Mar 2025 15:55:11 +0000
 Subject: [PATCH] Use aml v1
@@ -15,13 +15,13 @@ Upstream-Status: Backport [https://github.com/any1/neatvnc/commit/a4b238241f3f30
  src/server.c                |  6 ++----
  src/stream/gnutls.c         |  6 +++---
  src/stream/tcp.c            |  6 +++---
- 11 files changed, 35 insertions(+), 41 deletions(-)
+ 10 files changed, 34 insertions(+), 39 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 1017ffd..e731886 100644
+index a0d7401..b094d9b 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -71,7 +71,7 @@ libavcodec = dependency('libavcodec', required: get_option('h264'))
+@@ -63,7 +63,7 @@ libavcodec = dependency('libavcodec', required: get_option('h264'))
  libavfilter = dependency('libavfilter', required: get_option('h264'))
  libavutil = dependency('libavutil', required: get_option('h264'))
  
@@ -159,10 +159,10 @@ index a361974..441df19 100644
  	struct encoded_frame* result;
  	result = encoded_frame_new(self->dst.data, self->dst.len, self->n_rects,
 diff --git a/src/enc/zrle.c b/src/enc/zrle.c
-index 42044dc..e775f34 100644
+index 503c738..c043983 100644
 --- a/src/enc/zrle.c
 +++ b/src/enc/zrle.c
-@@ -315,9 +315,9 @@ static int zrle_encode_frame(struct zrle_encoder* self,
+@@ -340,9 +340,9 @@ static int zrle_encode_frame(struct zrle_encoder* self, z_stream* zs,
  	return 0;
  }
  
@@ -174,7 +174,7 @@ index 42044dc..e775f34 100644
  	int rc __attribute__((unused));
  
  	struct nvnc_fb* fb = self->current_fb;
-@@ -349,9 +349,9 @@ static void zrle_encoder_do_work(void* obj)
+@@ -374,9 +374,9 @@ static void zrle_encoder_do_work(void* obj)
  	assert(self->current_result);
  }
  
@@ -215,7 +215,7 @@ index e24798b..8f4cfa0 100644
  }
  
 diff --git a/src/server.c b/src/server.c
-index f172658..61da4dd 100644
+index a4f0ad9..099be28 100644
 --- a/src/server.c
 +++ b/src/server.c
 @@ -210,9 +210,8 @@ static void client_close(struct nvnc_client* client)
@@ -229,7 +229,7 @@ index f172658..61da4dd 100644
  	struct nvnc_client* client = aml_get_userdata(idle);
  	client->close_task = NULL;
  	aml_stop(aml_get_default(), idle);
-@@ -2033,9 +2032,8 @@ static void on_client_event(struct stream* stream, enum stream_event event)
+@@ -2013,9 +2012,8 @@ static void on_client_event(struct stream* stream, enum stream_event event)
  	client->buffer_index = 0;
  }
  
@@ -276,6 +276,3 @@ index 37f139a..95f5aa8 100644
  
  	// We hold a reference here in case the stream gets destroyed inside
  	// callback.
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.9.5.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.9.6.bb
similarity index 96%
rename from meta-oe/recipes-graphics/neatvnc/neatvnc_0.9.5.bb
rename to meta-oe/recipes-graphics/neatvnc/neatvnc_0.9.6.bb
index b83a886f11..34cfbf18cc 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.9.5.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.9.6.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/any1/neatvnc;branch=v0.9;protocol=https \
            file://0001-Use-aml-v1.patch \
           "
 
-SRCREV = "36ef59a83291368d72f471700702a8b6a76f763b"
+SRCREV = "3295c11b934a83dbcb44beabf3f21a8b885a2d11"
 
 
 DEPENDS = "libdrm pixman aml zlib"
-- 
2.43.0


