Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089ABC624DD
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:35 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4195.1788429025015129357
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XGw8+Ffd;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-85339ed040aso1791808b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429024; x=1789033824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iT/99nukjRp0VaRHGIIqFmcgOaEPb19MCQXcmwnLYMU=;
        b=XGw8+FfdRg9jBTrzpM++xa8mp7+Gq10pxQwtiOr252HUqM0nEARl6bNIaONbRI/0AJ
         tR7cYWbRrh9rYpzNR+mTOVz/olMHl9ouERgdWyXv3lFDV6viYEYeitbdOyPS7nKfPzK5
         xRQtDww4iSzIryCsr8pjT/8BuCuz59/9rZ/SIzfcHvjhkR/q4zQ0br7F/HOqPGrP5v8w
         0cBs4pvXy92FpqAJgW9oRvU7lU+ssg1pi/aL5NaBXQL9VaCR+5hsIhmJB1kabyrMH/72
         jeF0D4OY5qJXnujgEmtopoXjCM/PQE8M+BUaL2K+YiThCb0t9seXoXKUbqIA3SntYjxs
         C5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429024; x=1789033824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iT/99nukjRp0VaRHGIIqFmcgOaEPb19MCQXcmwnLYMU=;
        b=UVPeL1vMHzIu3XEq6ubvBqZYekJtiX40/SWRBkwWm2wdayWNGyT0B46PCESMpGHmF7
         Q5gjUm+mlSBLT7olJ/d5z3aB2aGlHBFYs91o5dybP7TINg5pQ3PfLTDkmefEOYKLVkgU
         8AxIxO/CD/Mje0bVWWUocUto//qZ9Ab6Es5eaNwoMqFkSiu1/+CjeGandiLwhw/T/we7
         EFjhOJvYhgYbAlAUO+laXEjSaiANlYOKQyqIMl6iTiUD2B023eswX+F9BhjIAtY0XqlF
         8Sc/27tG2Mi4b+ySN1Q52/DpLhYCnxg18dcrhDnfFO/LipnxbPBKU9fPpiAemWw//UDu
         KdIA==
X-Gm-Message-State: AFuF++kexyVMY5Rc5ORJAej3itneDJw3rovu7X3lPb1TWT6XFNCDC2re
	mzJchofNVfMdf1GE+bCJU5Muir8Jkc4/HebtPDh6wetApD2/S+Vk1ZvtaoZ+n1t0
X-Gm-Gg: AYBFou0uyjBKgf7peIk3/tNC9zEuUMbGmQ1MY0S8h2SJQzWwE4kTJY0SU1f9FMDajza
	4awTzGSx9OQiTiuJ2GjPPqgBiFiN1ix14QxPddoh952CY7F8MTFne9bSXGB+DrKcrFV0D9i3ZYF
	m5wuIzZiQShW1PArQ0DuzT/rCIfT1L5PdNwAc+BUFYaNiefGjT3rGgdUeeHOHOT+rgkQ8fbi4Um
	pg/BkftLHq6TIByI1H/vccqsES2zPv1qCeQCFSDEtgHVilDbPIeAqKpp9lGpK3sgvkDK+lZJW5B
	pthhlryWIFS5Qd8NBF5wkNIhykS694alfy3TVYnVY/oH6HpCHsNJAhMQU45gH338h9sfQIQF8zE
	ahYa618Jn++/oQKZqLtAI7o0qaXHFNYI8JuLJlnrVPIKL2Dcc2dq6/gFAILwrMML98X+IlKIAq+
	aeRpET0a/g06CZ1pmvtRn6L2w6K9daYlx3G6HN6LxKsc7JVAoDWVk+sYYP7dpekpALSdePE/m5
X-Received: by 2002:a05:6a00:4286:b0:857:4dea:e20e with SMTP id d2e1a72fcca58-85ecef11451mr16638880b3a.0.1788429023747;
        Thu, 03 Sep 2026 02:50:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 11/22] libheif: patch CVE-2026-32741
Date: Thu,  3 Sep 2026 21:49:42 +1200
Message-ID: <20260903094954.3240723-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129727

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-32741

[1]https://security-tracker.debian.org/tracker/CVE-2026-32741

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libheif/libheif/CVE-2026-32741.patch      | 29 +++++++++++++++++++
 .../libheif/libheif_1.21.2.bb                 |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32741.patch

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32741.patch b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32741.patch
new file mode 100644
index 0000000000..cd550aafa5
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32741.patch
@@ -0,0 +1,29 @@
+From 3c38488fa2ea31928fcad8f6a5010c1f6f0c1ace Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Thu, 5 Mar 2026 19:00:57 +0100
+Subject: [PATCH] fix possible buffer overflow when reading mask image
+
+(cherry picked from commit 123694271ac02f2de68a3ccdc5d483eb8a2ae593)
+
+CVE: CVE-2026-32741
+Upstream-Status: Backport [https://github.com/strukturag/libheif/commit/123694271ac02f2de68a3ccdc5d483eb8a2ae593]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libheif/image-items/mask_image.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libheif/image-items/mask_image.cc b/libheif/image-items/mask_image.cc
+index 328d1797..1c4357ff 100644
+--- a/libheif/image-items/mask_image.cc
++++ b/libheif/image-items/mask_image.cc
+@@ -113,8 +113,8 @@ Error MaskImageCodec::decode_mask_image(const HeifContext* context,
+ 
+   size_t stride;
+   uint8_t* dst = img->get_plane(heif_channel_Y, &stride);
+-  if (((uint32_t)stride) == width) {
+-    memcpy(dst, data.data(), data.size());
++  if (stride == static_cast<size_t>(width)) {
++    memcpy(dst, data.data(), static_cast<size_t>(width) * height);
+   }
+   else
+   {
diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
index df7f0c56e1..92891cb5ef 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;
            file://CVE-2026-32738.patch \
            file://CVE-2026-32739.patch \
            file://CVE-2026-32740.patch \
+           file://CVE-2026-32741.patch \
            "
 
 SRCREV = "62f1b8c76ed4d8305071fdacbe74ef9717bacac5"

