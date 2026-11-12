Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3462.1794444355197236389
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 16:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jvmPr1JN;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b3b31a6290so7849227b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 16:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444354; x=1795049154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OSnTr9Dybu3fdU6MEE5JrXVNiVJsEadRvW3mJCLg8Y=;
        b=jvmPr1JNaYHOIm3OCZBCmAv/By41mAKt5cItbcUKhAGKcIm6XOyHIYagd3Ba3YOd/r
         6wvBP4FwsTGtjl3DSCrjG4htgX0MVT69M5oa7SD5X8PBHnSXudtyoJEC8IrAiU+w7XMr
         /GeMawVO8gLvCkSmUl94lBa5f6nvOU12p0nHKyaHQY4O2CSoRWS3uZLbxXK96/q+GFaa
         ZpyenfWfVz1R1npB1ZTrILt68d1UC8z3MwO3QRbTym5jMRDkUttBut+Yo1jVjs9Ew+Xv
         sgaAjOU7nXcD0GYVFVFIKLAurBWU8N58DFokn72AZ3dajcGEqg6kf5HZtehT2L6OqINn
         vyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444354; x=1795049154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OSnTr9Dybu3fdU6MEE5JrXVNiVJsEadRvW3mJCLg8Y=;
        b=tlZSwCw2/J62mFbiicTAz3vNaNFrQr2s28TcAiDXwYQZscf64fYa63sxMEWYuGeaCS
         REoPzC6wBIjD2X9e9sXDy0SITFfErPaDYDEmIusQOEfDeB9MHRkUD6D9KHBPmMMJcoiL
         202Mjs4ZK0uIB67yQmxfQVYW7yueTsI/Lpev2pbwdmZzx9mwOpzceYMbe6ZLMoETiVcM
         WZMhYJgFfxz00dyuSBfWXNQRcHWXAnXvRizp8F36U5+sJ1+rgNfC/+rddiEMt5jryQfM
         45oZteSbAktiTrrFc5qcMPfhlA401E6ql+6Og9TIbFKdd+iot9V0Yd7TbIr7lgqXFf0S
         6WYQ==
X-Gm-Message-State: APuU4Z80BtG5TJEPIffnUCJIRKKCcsFVhIbPvOod0dTNcl44xsQZOeJ2
	SwiLwmhZSqNgJ9vLYx89g4IDnykmyq1vHu1dmWlhGOJfN31MVaOYekfrejIqtYGPzcQ=
X-Gm-Gg: AYBFou2hyiNTRimZo4AcrT/0m9IAeOhYkMKEyMWrSKrrpbmN5GXGOIHw+uGVuNCEHK4
	hXIFm9Olpb/os88BfP7gZIGtUYLIo931GKy6YCj1jmj4T5db49FLd2+lolEkW4T06EUxdRuoska
	wgTsSaHIEaOCON+X/h+ld6yASHQESWCPcORAo59WNPEfBzuIIbqb9Q2RJpUNgSi2+FU9xIEbZQF
	4SmNLTWGlk+LOAtCGApahZuySqCpKPrPri/H0ZeR9hVIob1R/ww9nMQoE7dCq5DmGLlJpqs4dBi
	Leiv9F1E7Uu7NurDhzS+14ArsfXsI5zW2PIsEOY7BKc0u4T7NVPp9tbbLyuoqoS94R0+sJCk9pV
	Tntg6wfd/mbDjAJ24onSmrccRpeXEZwv8nhUhhMztJlMfkuV/uQ4HVC1Bg+k3fbL3QYhvDtlpJD
	+Se3qI0WpfcOccDNICnt7AUH08NxHcDTFko3nkbmA8LYRbUaq+57P5X7cW9vyceQe18MH2ADnM1
	FZD9BdqmOfILa/winrz/UDBZpRjGbqMPssi3VK32o4TmOzk1vo71VGfH9teTc3IzjjBajiMcsD3
	rzyppPe6YeDkYPaHDnafJkTMzo7Pc1YRxo9OYAOf0kh4f0Mt+x6ciJQhvJLG9wfBWZcdVi5oglm
	Uek7sX5OPdvUOF24HdA/3DNsCRqMfgwiWUD4b15JbXhLqyhxf9ADv
X-Received: by 2002:a05:690c:39d:b0:8b3:22c:b40e with SMTP id 00721157ae682-8b3a7db5711mr26549587b3.5.1794444353908;
        Wed, 11 Nov 2026 16:45:53 -0800 (PST)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.3.193.106])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39343e9edsm57111337b3.36.2026.11.11.16.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 16:45:53 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 24.22.2 -> 24.22.3
Date: Wed, 11 Nov 2026 19:45:48 -0500
Message-ID: <20261112004548.4996-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 00:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132142
Content-Type: text/plain; charset="utf-8"

This is the November 2026 security release.

  7 high severity issues.
  6 medium severity issues.
  3 low severity issues.

High severity issues.
  CVE-2026-123863
  CVE-2026-123864
  CVE-2026-123865
  CVE-2026-123866
  CVE-2026-126051
  CVE-2026-123872
  CVE-2026-123874

Medium severity issues.
  CVE-2026-123828
  CVE-2026-123867
  CVE-2026-123868
  CVE-2026-123871
  CVE-2026-123877
  CVE-2026-123875

Low severity issues.
  CVE-2026-123829
  CVE-2026-123862
  CVE-2026-106071

https://nodejs.org/en/blog/vulnerability/november-2026-security-releases

Changelog: https://github.com/nodejs/node/releases/tag/v24.22.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../nodejs/{nodejs_24.22.2.bb => nodejs_24.22.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_24.22.2.bb => nodejs_24.22.3.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.22.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_24.22.3.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_24.22.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_24.22.3.bb
index fc4eb60ebd..f9b4eea38e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.22.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.22.3.bb
@@ -36,7 +36,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI:append:class-target = " \
            file://0009-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "8fe2ec1723bb9f8d0b683907c82708debbeda64af21cb2aa214c4241eed0a061"
+SRC_URI[sha256sum] = "48ca3aa8a9b02133356922ef4fc80200e00598c80a4ef446f7c39a459222593d"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0

