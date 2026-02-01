Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B58E65283
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 14:30:11 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30439.1769956208995990291
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 06:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ECUj+e3W;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so30457075e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 06:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769956207; x=1770561007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wmpYMm2S40DIB5tRsZw0uuzwqyzMlMfdZzWVtfAKv5w=;
        b=ECUj+e3W6vPVoS/sv1nQn+seuIarenCex4xGIuRySqEqLGK4fUATlUaPYmJg+kN8tC
         c+D2dMBYp61Zwi8/VMWTLy+Mqt7Jnd3fV3yih3doGbqG6XbWpAuPuwY0QIuinOpHFjRg
         goOXgUi2ynkca9vINXOv4V3+NYqy3Azxv/21osr6ImirOTbKtmS9g47Mss588dxk0YPs
         s50PAUE5pyDsYe+lOVZWFojcV5L3Gz2DdGCAJyD/czfz3RW6Gottm42WqomoN3w+8Q0B
         AMZDaA15c0QP5XhGmU9rF11WaLB0NypUG1Dxwog6FrIlxHZXv8qCIwZCLKaSpyEfpFfT
         qd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769956207; x=1770561007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmpYMm2S40DIB5tRsZw0uuzwqyzMlMfdZzWVtfAKv5w=;
        b=ikL2G9QGAtAEfpT4KPL+CdMiMUMS4J49p9ioWFM2+b6OTaXbfGAbN5zYlxDuAjcMRQ
         VzsN8Msi3YkAsZRrkR2a/Nzfm+welTmk2OxcAf5i25SHm9b25XH88NbQdchUAqj9Im6n
         qMNn4yI6xDAV+7Mq04TAtmjBar9vSS4dsYRhRIQmCTPQ1vIBYRpNLKp/0z4Qgf31bJHk
         IxNvM4gMYWPfCqz/ksmEHDpn5qpHxkieaWdR9U03j+cHiJCHlkQ7XgndbXgQOYiH0mkw
         MsJJf/yDhiyICGbhMVLw0AHE/Zg/wdTWP2KKJeR1JMaL6vb63eupqzqHdELdayuvtW18
         acPQ==
X-Gm-Message-State: AOJu0YyUtr18+Jbt5qVypTjQiXbXnIv5yT03OCNZz+TfhEJvjRCDu3qN
	afmrbwNOvHCqLPsPp6stZAZW7tvJ59lTUnPD6cEGhewj5UIlF4pRmiieipwvvg==
X-Gm-Gg: AZuq6aLhgY0JrwAfZPmmXY6y8PRMb/XTsDKQtqut7ghsA15KSSDU24a9nHajrT+rvct
	zLX5eruhUves2cFGWTrx2DNJZFW27jrZdufLFDFXHEYNKDnhr+Q8O7peUpj/Y6D1hF5JzSPmTbm
	moT9iv4btQFmGGRmpAPEmteNtbVsjI+dWhRcVfpgUy19bjq5KW7Ikx/dtsPkw6VtV/6q0fXd5cY
	Oawh+O+qzUsWXunwxfglRqyF7OR42ctWORpoN22ytFuBtltylPdGndVtEedyAtlysFsHXWWfSnO
	cP93/TzoWds4GEHpFgWeq7eFGtwfOYT0aZ9KdAtlIq2rHRkLQ1LzLbrMiycRBDMjlq8RUeBDM1y
	o2ZO5kxdG6rSAMsx/jPNbvRqCsu1wsJvBqwj1QY6nECvDbOuv+pe4o/SEh/1Wv5SeD9oCRsEjIK
	kdIPdvQSoh/WAbQBuE6Zs=
X-Received: by 2002:a05:600c:2305:b0:471:793:e795 with SMTP id 5b1f17b1804b1-48079af6674mr113422295e9.0.1769956207067;
        Sun, 01 Feb 2026 06:30:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e483asm35218875f8f.3.2026.02.01.06.30.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 06:30:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] faad2: patch CVE-2021-32276
Date: Sun,  1 Feb 2026 15:30:05 +0100
Message-ID: <20260201143005.771680-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 14:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124040

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-32276

Pick the patches from the PR[1] that resolved the issue[2] referenced by
the NVD advisory.

[1]: https://github.com/knik0/faad2/pull/66
[2]: https://github.com/knik0/faad2/issues/58

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../faad2/faad2/CVE-2021-32276-1.patch        | 83 +++++++++++++++++++
 .../faad2/faad2/CVE-2021-32276-2.patch        | 36 ++++++++
 .../recipes-multimedia/faad2/faad2_2.8.8.bb   |  2 +
 3 files changed, 121 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/CVE-2021-32276-1.patch
 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/CVE-2021-32276-2.patch

diff --git a/meta-oe/recipes-multimedia/faad2/faad2/CVE-2021-32276-1.patch b/meta-oe/recipes-multimedia/faad2/faad2/CVE-2021-32276-1.patch
new file mode 100644
index 0000000000..9e208477fc
--- /dev/null
+++ b/meta-oe/recipes-multimedia/faad2/faad2/CVE-2021-32276-1.patch
@@ -0,0 +1,83 @@
+From 586ac8cf550b63a1d87ec105ea4bf20b6f406591 Mon Sep 17 00:00:00 2001
+From: Andrew Wesie <awesie@gmail.com>
+Date: Fri, 9 Oct 2020 08:19:48 -0500
+Subject: [PATCH] Check for error after each channel decode.
+
+hInfo->error is reset within the decode_* functions. This caused the decoder
+to ignore errors for some channels in the error resilience (ER) code path.
+
+Fixes #58.
+
+CVE: CVE-2021-32276
+Upstream-Status: Backport [https://github.com/knik0/faad2/commit/b58840121d1827b4b6c7617e2431589af1776ddc]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfaad/syntax.c | 24 ++++++++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/libfaad/syntax.c b/libfaad/syntax.c
+index 4e57efd..af48cd1 100644
+--- a/libfaad/syntax.c
++++ b/libfaad/syntax.c
+@@ -523,37 +523,61 @@ void raw_data_block(NeAACDecStruct *hDecoder, NeAACDecFrameInfo *hInfo,
+             break;
+         case 3:
+             decode_sce_lfe(hDecoder, hInfo, ld, ID_SCE);
++            if (hInfo->error > 0)
++                return;
+             decode_cpe(hDecoder, hInfo, ld, ID_CPE);
+             if (hInfo->error > 0)
+                 return;
+             break;
+         case 4:
+             decode_sce_lfe(hDecoder, hInfo, ld, ID_SCE);
++            if (hInfo->error > 0)
++                return;
+             decode_cpe(hDecoder, hInfo, ld, ID_CPE);
++            if (hInfo->error > 0)
++                return;
+             decode_sce_lfe(hDecoder, hInfo, ld, ID_SCE);
+             if (hInfo->error > 0)
+                 return;
+             break;
+         case 5:
+             decode_sce_lfe(hDecoder, hInfo, ld, ID_SCE);
++            if (hInfo->error > 0)
++                return;
+             decode_cpe(hDecoder, hInfo, ld, ID_CPE);
++            if (hInfo->error > 0)
++                return;
+             decode_cpe(hDecoder, hInfo, ld, ID_CPE);
+             if (hInfo->error > 0)
+                 return;
+             break;
+         case 6:
+             decode_sce_lfe(hDecoder, hInfo, ld, ID_SCE);
++            if (hInfo->error > 0)
++                return;
+             decode_cpe(hDecoder, hInfo, ld, ID_CPE);
++            if (hInfo->error > 0)
++                return;
+             decode_cpe(hDecoder, hInfo, ld, ID_CPE);
++            if (hInfo->error > 0)
++                return;
+             decode_sce_lfe(hDecoder, hInfo, ld, ID_LFE);
+             if (hInfo->error > 0)
+                 return;
+             break;
+         case 7: /* 8 channels */
+             decode_sce_lfe(hDecoder, hInfo, ld, ID_SCE);
++            if (hInfo->error > 0)
++                return;
+             decode_cpe(hDecoder, hInfo, ld, ID_CPE);
++            if (hInfo->error > 0)
++                return;
+             decode_cpe(hDecoder, hInfo, ld, ID_CPE);
++            if (hInfo->error > 0)
++                return;
+             decode_cpe(hDecoder, hInfo, ld, ID_CPE);
++            if (hInfo->error > 0)
++                return;
+             decode_sce_lfe(hDecoder, hInfo, ld, ID_LFE);
+             if (hInfo->error > 0)
+                 return;
diff --git a/meta-oe/recipes-multimedia/faad2/faad2/CVE-2021-32276-2.patch b/meta-oe/recipes-multimedia/faad2/faad2/CVE-2021-32276-2.patch
new file mode 100644
index 0000000000..c21391ca6b
--- /dev/null
+++ b/meta-oe/recipes-multimedia/faad2/faad2/CVE-2021-32276-2.patch
@@ -0,0 +1,36 @@
+From bac3c71781465bb92286e89ef326161bd2500cb4 Mon Sep 17 00:00:00 2001
+From: Andrew Wesie <awesie@gmail.com>
+Date: Fri, 9 Oct 2020 08:55:52 -0500
+Subject: [PATCH] Check for inconsistent number of channels.
+
+The frontend does not support audio output when the number of channels
+changes between frames. Check if the number of decoded channels matches the
+number of audio output channels.
+
+It is possible that this condition should be detected in the decoder instead
+of the frontend.
+
+Fixes crash from afl-fuzz.
+
+CVE: CVE-2021-32276
+Upstream-Status: Backport [https://github.com/knik0/faad2/commit/4ed30d3d232b6a7a150cc06aed14eb47e4eda14e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ frontend/main.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/frontend/main.c b/frontend/main.c
+index 3b0850d..39d5276 100644
+--- a/frontend/main.c
++++ b/frontend/main.c
+@@ -693,6 +693,10 @@ static int decodeAACfile(char *aacfile, char *sndfile, char *adts_fn, int to_std
+         /* update buffer indices */
+         advance_buffer(&b, frameInfo.bytesconsumed);
+ 
++        /* check if the inconsistent number of channels */
++        if (aufile != NULL && frameInfo.channels != aufile->channels)
++            frameInfo.error = 12;
++
+         if (frameInfo.error > 0)
+         {
+             faad_fprintf(stderr, "Error: %s\n",
diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
index f354c99d33..311a384fc4 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
@@ -12,6 +12,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-2.8.0/${BP}.tar.gz \
            file://0001-mp4read.c-fix-stack-buffer-overflow-in-stringin-ftyp.patch \
            file://0001-Restrict-SBR-frame-length-to-960-and-1024-samples.patch \
            file://0001-Check-return-value-of-ltp_data.patch \
+           file://CVE-2021-32276-1.patch \
+           file://CVE-2021-32276-2.patch \
            "
 SRC_URI[md5sum] = "28f6116efdbe9378269f8a6221767d1f"
 SRC_URI[sha256sum] = "985c3fadb9789d2815e50f4ff714511c79c2710ac27a4aaaf5c0c2662141426d"

