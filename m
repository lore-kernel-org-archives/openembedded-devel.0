Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB14C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 09:55:16 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35699.1789638907927965409
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 02:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=f1Vye39E;
 spf=pass (domain: mvista.com, ip: 74.125.227.141, mailfrom: rsangam@mvista.com)
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso633916a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 02:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789638907; x=1790243707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kpBfJ+JJpjux//0/RKDVQ4iB8ZwzJRT/rXc/ptseVq8=;
        b=f1Vye39EFbqFPa9G8soRgMxTL2kELz9zSP77jxENYKCs6oWJ3EpvMmR4ORp3GFHcwJ
         YC5zEotcuB+cOriWm+h0SK2/W2LHqQXMlYjmIUgu8IRiVxS05WD5jq8Q6GTW+NlL8A8q
         AbMQ86Ck0CXB3WlhGNy8tns6U2j9vS492b89M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638907; x=1790243707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kpBfJ+JJpjux//0/RKDVQ4iB8ZwzJRT/rXc/ptseVq8=;
        b=XK1UCq0q2RVwlCcZBCg8hQ0pWGV5rbRdqEoYX03yrjKzkk/3oXIwJfW+gHoWjPdkQ0
         1qqFjVokzn09Oz1zZHsSOFc7PaBNatc139i0BReOoEfGEsaGNjREfwOc6j6qjuC9QOFt
         NvCHTc2BaxSJ0aWI7NVVdgE5peUSgbfb8UTNTvgtCoAhzEOVWPItSUH8N1bZ8HgwGNrA
         lPf1gfFOWk/+UdjTxU3WICWvBx+d/yiLMy0HarVkDrsTM7/qmWEQJLfIvglRP6KWQBGR
         tntm5GRkrRHkrfxwCjamPloOgDNF3VM/+dXVQFB1fSB+7tu48fmQWtv2zn9E6HfqiNa7
         879g==
X-Gm-Message-State: AFuF++mqmPkTdCr0T56EtTIP5P88u6F4X/znIOHdPtmQ49gGq0aiDgq4
	gVL/Qg6jtooHmEsNXHlRvDyt6lbw0BZwHP30tQyu980KRItmYkek4T3GU3XGkM/ze4wPAKO2QcI
	WG6K+
X-Gm-Gg: AYBFou1WRNBtR0kMtUWnnEayKN3S+iKMOssb6dmaerx5YAkheNVGAAZc+3mGES3X/8n
	4tL8o0FY/3TRHHfDdf/fj6efGyuDYj8s1NYCoN7gUOlY/QjIp//L00sKyfqiJrvG9RcgzdsNnbn
	T57F99T9hNiWVbSmnaeab6RAqoBgj1/+6O6ctaHM8Y5PXIM1dc2jXRm2dZjQAyOXrc/PnFpTcUC
	NxPwHqhXvEAIKRgiu/XJo5T2QoNMKGjadfa05sMsokf8Q786oeYyuHbb4xRS7qDDR1qV5UnlpPG
	wC9/UCz2hcpaPxqv+7LjSY9/eDlZQRTBkugdl6/874LcznH1XFdlNW5sw8E39KvsYiZ34KBqg3X
	X+kKImCZecO1G3mR45+sbHE2x9j60oWNYg+fgMYspX1Tf5dw2+xpKt66h1oYSXJcGHDNKeUMjer
	LLuPkeZB34RwY5go2siWX/GX1oJflBi56rGhpSXz0G7+3miCY1oJX6mT6S2ET/9ajJycj0T8dLM
	KTR/Ajx4bg=
X-Received: by 2002:a17:90b:4d0e:b0:39d:f5b6:ca47 with SMTP id 98e67ed59e1d1-39e1e47abbbmr17220412a91.12.1789638907099;
        Thu, 17 Sep 2026 02:55:07 -0700 (PDT)
Received: from MVIN00040.mvista.com ([2405:201:d00d:4190:4d82:51b8:3eaf:be4f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm14774556eec.15.2026.09.17.02.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:55:06 -0700 (PDT)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>
Subject: [meta-python][scarthgap][PATCH] python3-pillow: Security fix for CVE-2026-59204
Date: Thu, 17 Sep 2026 15:24:57 +0530
Message-Id: <20260917095457.17838-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 09:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130097

Pick patch from [1] also mentioned at NVD report in [2]

[1] https://github.com/python-pillow/Pillow/commit/13ada41172142f2fd9f0906f615a00ea623a11ca
[2] https://nvd.nist.gov/vuln/detail/cve-2026-59204

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
---
 .../python3-pillow/CVE-2026-59204.patch       | 37 +++++++++++++++++++
 .../python/python3-pillow_10.3.0.bb           |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59204.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59204.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59204.patch
new file mode 100644
index 0000000000..cc55b3c19f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59204.patch
@@ -0,0 +1,37 @@
+From 13ada41172142f2fd9f0906f615a00ea623a11ca Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Mon, 22 Jun 2026 10:34:18 +1000
+Subject: [PATCH] Calculate JPEG2000 total_component_width for each tile in
+ isolation (#9704)
+
+CVE: CVE-2026-59204
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/13ada41172142f2fd9f0906f615a00ea623a11ca]
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ src/libImaging/Jpeg2KDecode.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libImaging/Jpeg2KDecode.c b/src/libImaging/Jpeg2KDecode.c
+index 13f363422..9faacaca8 100644
+--- a/src/libImaging/Jpeg2KDecode.c
++++ b/src/libImaging/Jpeg2KDecode.c
+@@ -657,7 +657,6 @@ j2k_decode_entry(Imaging im, ImagingCodecState state) {
+     size_t buffer_size = 0, tile_bytes = 0;
+     unsigned n, tile_height, tile_width;
+     int subsampling;
+-    int total_component_width = 0;
+ 
+     stream = opj_stream_create(BUFFER_SIZE, OPJ_TRUE);
+ 
+@@ -863,6 +862,7 @@ j2k_decode_entry(Imaging im, ImagingCodecState state) {
+          a, and then a malicious file could have a smaller tile_bytes
+         */
+ 
++        int total_component_width = 0;
+         for (n=0; n < tile_info.nb_comps; n++) {
+             // see csize /acsize calcs
+             int csize = (image->comps[n].prec + 7) >> 3;
+-- 
+2.44.4
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
index 7e99860055..4a48210a34 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            file://CVE-2026-25990.patch \
            file://CVE-2026-40192.patch \
            file://CVE-2026-59198.patch \
+           file://CVE-2026-59204.patch \
            "
 SRCREV = "5c89d88eee199ba53f64581ea39b6a1bc52feb1a"
 
-- 
2.34.1


