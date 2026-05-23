Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406D2CD5BB1
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:00:42 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3055.1779512441298016368
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g4JEM44j;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-83f674f978fso2945395b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512441; x=1780117241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sFCXu3/PFCNUn23aLCaAA7tmToYr1LlqAqm6315j8Y=;
        b=g4JEM44j0FDcwibgdB3seK63nksa5Og/aPIlUr7Xh34YFXagkC0+mIF5+bzj2A+vd0
         Wq8BuLV9OPsjz6YuAFx53OhD306zQ1zRCypbOr/h4crQpfgehHmX+fGDyo6cUR2HUChv
         5l/mK0hnlxh/yz2/ioNGZTMTlW/KQ4/DJfeyHfUjcVHN6ZrT7z4tEhYT2vZY+ci0h9Km
         caLv5DjSzlMOmkeYPqRtsLJaKcRAzjVQ1Gu3NMzcVCy1ioEHnTbGscUvOhB+Vio1bzFn
         Hu9j2LuRrM5Xi4PU9ZL2KIois8Dq3s5huPqPNVIG9vu7GuRR+hH+Xdya34oGdvUe+ucP
         3PIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512441; x=1780117241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0sFCXu3/PFCNUn23aLCaAA7tmToYr1LlqAqm6315j8Y=;
        b=sBJMEJRQmSkYslFYYkaM4f1XBfy7qEdJn/ei5EweTnPEV0+9d/gmLz5fkInMDWgdhA
         sdZhHiDdVt2VhQ0Q/qLECOgrKWGdAaRi56dm0NeYwouZEJCFp8twTnu4AK1MEMr4PIiE
         Wi3nm5g7sUBcJlR910NiIdPInM89PRq3F9vp0mi1bHsFSb+kR5g+mtvTd9IvstuTkPhv
         GkKbktQFnt5bug24H70ut9KyIJ9ETbXyoNSfMeEHc+hGiBGXbvLzWYEzMRTCFaEXCpZM
         3a8gBa28BFYxiVUBv5JEfNrAUonWU3Im4ERcg7kzVCShMCzxLT0bdgUDjbJAWO7fdTZ+
         SWhA==
X-Gm-Message-State: AOJu0YwXBHGEK49jq+gvxv+NXo2bYHZ1/7y65ozCg+dyEgtNvL/Bl86L
	aQLlfpFraoKcEIS3rMAvq+107WSp4T3fG++eEfJWC3VY7mupv3eZJA/5ujmOIGC7
X-Gm-Gg: Acq92OHVivrMfw6kpFC/zzvGWAk2pKnioQEeoMLR2Tj9CJ3C1nyBQGaGspDXTlq9CdE
	3QoqBZia0yZxzDJczwcm7B12lQPQtJwoaY2OS2aSsx5a+vsaIGEGiHgtleLSsbrQ8ud2zLCQO4B
	G5LAfVtwduqkQ3g4KAJUMrsR31z51IZDAep9g7lt6XCpNT6GluN0sl4/DiNTWZ1WdelBMQQGl1J
	tM/YgbVMA99X5eDsIIYnlnuLWrBEPhFifPCVAYQGlLDKsZEx8r99D59PuQfgLtM3mtJH6nslFxT
	nky4JZ6a1IWCSLKLROTvsCwX8NW2dKQKS0zvBSPqqXxk4LY8sAWfghu6rKvXsS2oGs3QTChSJvW
	YPHvVm+DY/iJyWvWbkbeXknBUO7rnZlF23lQeZM0Qkq3aDy/jtX1/pQSsnnlFRV6JEjgBXvcg3x
	3OpXxjqzigJ4hVZrEXTaNXSuoXKER3k0ptA3qB
X-Received: by 2002:a05:6a00:398a:b0:835:405a:7e6d with SMTP id d2e1a72fcca58-8415f377fb7mr6296479b3a.21.1779512440579;
        Fri, 22 May 2026 22:00:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:00:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 2/25] neatvnc: upgrade 0.9.5 -> 0.9.6
Date: Sat, 23 May 2026 17:00:04 +1200
Message-ID: <20260523050028.848327-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:00:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127152

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Use-aml-v1.patch
refreshed for 0.9.6

Changelog:
===========
- auth: rsa-aes: Fix potential buffer overflow
- auth: vencrypt: Reject excessively long usernames and passwords

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 9222ec03c3bb15a9b927cff1a744b180aa4d1dff)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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

