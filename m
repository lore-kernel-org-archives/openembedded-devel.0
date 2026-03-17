Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E6CFED9F9
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 17:24:02 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81495.1773768233294135507
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 10:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PIkCFXVQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486507134e4so11396665e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 10:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768232; x=1774373032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtMHQlzaV2n7GWaSHYrOpUPde5/8uZCNPGo0nZcPF+Y=;
        b=PIkCFXVQk9OpBgD1FWuX2q99hogmJYCnVzsyMpHcUFDOfN1mV6sttNB3OTYP6t/3Fv
         ZV4X/nT1+HaETGMIL+JCm643ftgNRVEHIExGi/FPIs6Egau5zLZ0vctMkZWrWhvXgTHr
         mnWPx0UoJG5e6e6Sc0KhNGf5G6zBjIkaFrN710fHR0CIqhT7hOkpNVItTjZTV/f8dhwh
         RXUJK+ISl0rTXE0USxloZ7ABqR/MoZiJHo9/6RriM12Mb5z6SEhzV36QNBMMG/T0J4e8
         WwGKX+9TFoOdqMXULEy8S8A8lXQCW/moWcxgQnTSOSKAJMDZGM1o9WxDD3lktF8T9NTA
         1b+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768232; x=1774373032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dtMHQlzaV2n7GWaSHYrOpUPde5/8uZCNPGo0nZcPF+Y=;
        b=O8cZBRD4pGRmyj54mZ+BSaaNb6vqrHZ0ecPSnesbXS68alGBz7QOxyKo7B88mZfHEr
         RKa3egc0gQEvsbKcv2gtL0CknLcQ3WsVA2+l5QduChus1LgJ4iSeMl+gi15zeAEtwto9
         MKPqGN4lRaJdugPM0Q5GpuCEOL88AfUBreNK7iGgrH0FrqyJJjR1EjnJjqjRmIUgQG6D
         GVWkh1xsqJoZaF3D0fSaySMOsWGHwa18Oo60cQjH3/1zZLFLt1iVhol6HtfEWdqG2PhX
         ul3W2fQS01IV2MHL56oOpb00PuIL+kGUPSfUW3XvVszY5ekDnJ8UtX/2iwZ8l6bA+/FM
         f58Q==
X-Gm-Message-State: AOJu0Yz20JPL+i1/zKwn11G8BdoGGJ6HKyLLmxFaqYmu7QU3AnQhqOzi
	JAOILd6UWR/VbSKpAj6jCNg78u8cI4Eg73ZA+32rfWDxBmLAAZbNH6wD+wEfvg==
X-Gm-Gg: ATEYQzw/d7Eq/FUDsJ69bKWE5FppupcoxR7to7oAEmZGECJt+v/7Wh6heFQYxvx2QWb
	2zHW269/HwjpqKy2JmvBBwuEWwUJmCdfi1P/H4HY3PynjiRhDjn3ff2j/odj1wWRnTfEN468dHV
	733Ngka//uKI3otXzhtPLXlYnAaVPDLCud0oIEjCTObB3f0+WUp1YpCc2MqB6+RrKSe8z+5ByPz
	/WxEpfszOwYPXxpv0lKc9Qz63avXd6ALGiGhyhXBmoG4RG0dCsPUqx7udZRIF3xNoomNYy9cQW+
	h3cX6L+FI1fVgBj5dbl7rwQpsaO2NGQnHRL+hFu5W5/wLFezzqz0EuYlax1Q2SEfE1Lp+uUKKg6
	VAi51FlfsPdWOGSZqzx5AS8F+VHWuQbctz+sCuOvLc2LFZoRZli4sNaM8jWsai1M7jvdXh9wOFB
	lhFzNoU6aSnOblUiXubhIv
X-Received: by 2002:a05:600c:8518:b0:485:4328:407a with SMTP id 5b1f17b1804b1-486f44435d3mr5709785e9.19.1773768231348;
        Tue, 17 Mar 2026 10:23:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48634a7ac93sm61717385e9.2.2026.03.17.10.23.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:23:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 7/7] libheif: CVE-2026-3949
Date: Tue, 17 Mar 2026 18:23:46 +0100
Message-ID: <20260317172346.2862459-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317172346.2862459-1-skandigraun@gmail.com>
References: <20260317172346.2862459-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 17:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125329

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-3949

Backport the patch that is referenced by the NVD report (in the description)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libheif/libheif/CVE-2026-3949.patch       | 50 +++++++++++++++++++
 .../libheif/libheif_1.21.2.bb                 |  4 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-3949.patch

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-3949.patch b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-3949.patch
new file mode 100644
index 0000000000..ef5d9c1ee4
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-3949.patch
@@ -0,0 +1,50 @@
+From cba59e7671a36a78e31c0490efe74ec226918580 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Tue, 24 Feb 2026 00:32:48 +0100
+Subject: [PATCH] vvdec: check that NAL size does not exceed data size (#1712)
+
+CVE: CVE-2026-3949
+Upstream-Status: Backport [https://github.com/strukturag/libheif/commit/b97c8b5f198b27f375127cd597a35f2113544d03]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libheif/plugins/decoder_vvdec.cc | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/libheif/plugins/decoder_vvdec.cc b/libheif/plugins/decoder_vvdec.cc
+index 09515720..14b3e9fd 100644
+--- a/libheif/plugins/decoder_vvdec.cc
++++ b/libheif/plugins/decoder_vvdec.cc
+@@ -55,6 +55,7 @@ struct vvdec_decoder
+   std::string error_message;
+ };
+ 
++static const char kEmptyString[] = "";
+ static const char kSuccess[] = "Success";
+ 
+ static const int VVDEC_PLUGIN_PRIORITY = 100;
+@@ -179,9 +180,25 @@ heif_error vvdec_push_data2(void* decoder_raw, const void* frame_data, size_t fr
+ 
+   const auto* data = (const uint8_t*) frame_data;
+ 
++  if (frame_size < 4) {
++    return {
++      heif_error_Decoder_plugin_error,
++      heif_suberror_End_of_data,
++      kEmptyString
++    };
++  }
++
+   for (;;) {
+     uint32_t size = four_bytes_to_uint32(data[0], data[1], data[2], data[3]);
+ 
++    if (frame_size < 4 + size) {
++      return {
++        heif_error_Decoder_plugin_error,
++        heif_suberror_End_of_data,
++        kEmptyString
++      };
++    }
++
+     data += 4;
+ 
+     std::vector<uint8_t> nalu;
diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
index 7ccac771dc..ab29fa3b02 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
@@ -6,7 +6,9 @@ LICENSE_FLAGS = "commercial"
 
 COMPATIBLE_MACHINE:powerpc64le = "null"
 
-SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;tag=v${PV}"
+SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;tag=v${PV} \
+           file://CVE-2026-3949.patch \
+           "
 
 SRCREV = "62f1b8c76ed4d8305071fdacbe74ef9717bacac5"
 

