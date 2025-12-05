Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AEBD3399D
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 17:11:48 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25.1764954698142689857
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 09:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lqXrYxSx;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so21303195e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 09:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764954696; x=1765559496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vimt2a1rnXuyzs+Z0xUs/6kZcl5d4kIKbMVLt2cNKo=;
        b=lqXrYxSxN3OKmrnnmkIXNbbSjqH7gi8vh1jBx1yoRvQvPP2jKS1ttWzQRue3B+mOQ8
         e8QseZ5Ax+246IcW5YwYGlYnQ5sS/pOcQsQknr7lGtnigClWX/hvY+xqS0NgII67/cvy
         mN6UvIo+SBYq7D/r/yeeYMvagvtqut6Mmf5eePIaX6UehePuo97tnwrzAz7JI1hG40c5
         qzwo6jFjb0irerifUIdv+m5HXJmfQIEL2LpDKwN1h8enXQeQu4emKhqBLKxtz7hIDp9k
         UCIWHzbNzaFpWHW92TNYNLePWDlAXXit+UUbygO3e6w3qdyrsjklyOJBfHVbroCoTwS5
         /toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764954696; x=1765559496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6vimt2a1rnXuyzs+Z0xUs/6kZcl5d4kIKbMVLt2cNKo=;
        b=KYHE+H+Ii0Nv9gev7V4ktaLlfF1ul9q7g+rnLexcVkXdBglEE8ViTvDoXS89xjAVIC
         f9R0d09sLtGL9lrX3/1RrD0pKjA/QXnHwT/IXzUS98q80n64o3luZaycEYmaHQB+CZWJ
         U5XRdZmMHav4bxKzrDXsVOd6VPMzVyRtybUfK3n8FeEYVEfNs9juD8DGJwL2QJEMx87C
         cSk0H1MMz829Nyz2cwVR6k4dV3MfBHb4j2XLSSDkLr94LIUWoiR1Yf4d5ZaDmCyzWCVt
         gPVd0n0E+be2xbC1JokVj9KjBRmkw1//ZKoGI+5fXpHO0FJAuGMAzrHYTcNYmVWQ15zP
         Km+w==
X-Gm-Message-State: AOJu0Ywiiq4OAyMP/iyVOfaJv536pvDEShJss6XfjmRT5txePKOkGKIE
	jnkZgL8FrvKRx0IUJ6w0u4/isDqYKi7yVrGmnSFI4epwsQMhdcSy0ARrms2/3Q==
X-Gm-Gg: ASbGncvg+7GCxR0JzyLPtSTaEX326+eqcFk7m4R0qJhvw93tBYhmzFoliTU9mEqWPjY
	oK1vq7RwuMCCfn1YWvNfB8/W0dwVAX5EJ0MtfFCWgAioydLbjihqbO5COPpkNLUMzS4aD1TcYl5
	kBbkkEhK9q+s27uFqDw0lrHMMd7bFkeG/fsrQ/CLkNPfmBREkRUBqfY1BQYvGOnhlr3kJIU9w4z
	QUccf/xF/9sG8elLli40Z9rdJ2hvIBEGrftf1ev6fMXsoUeU1JeiQ4Tjq8VEn3TBQZtk6JwYKTo
	4W5zr0KRtLY5snA4AhwwnojkZNT1VtkaeyJmzE8cfy8LlQH9LQ/sZjtdt9A6YRDrgrz7/tfcMYN
	SBto8pmlX5C1CMMe+3V1LaNLLQ6t5Qo0ZRzkSgXnP3Dg+xRfDXhpGzVn3N6qq1WCmL9+hzKKFcE
	ThQXfe72jl
X-Google-Smtp-Source: AGHT+IFypIPOJgPBIEtjsG/P2GQRiMZsfdQQlkEecYQsIOpw+HHWsc4vbERbQtxzo1V7J786KL62bw==
X-Received: by 2002:a05:600c:4e15:b0:475:dd89:abc with SMTP id 5b1f17b1804b1-47939df80eemr231185e9.11.1764954696449;
        Fri, 05 Dec 2025 09:11:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6db3sm98563435e9.1.2025.12.05.09.11.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 09:11:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 03/10] xrdp: patch CVE-2022-23477
Date: Fri,  5 Dec 2025 18:11:27 +0100
Message-ID: <20251205171134.1346494-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205171134.1346494-1-skandigraun@gmail.com>
References: <20251205171134.1346494-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 17:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122349

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23477

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23477.patch            | 38 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23477.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23477.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23477.patch
new file mode 100644
index 0000000000..5c2b48a507
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23477.patch
@@ -0,0 +1,38 @@
+From d49f269af82be5f14b193d4edfcb63b547a16ff4 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Tue, 6 Dec 2022 11:31:31 +0000
+Subject: [PATCH] CVE-2022-23477
+
+Prevent buffer overflow for oversized audio format from client
+
+CVE: CVE-2022-23477
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/d49f269af82be5f14b193d4edfcb63b547a16ff4]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ sesman/chansrv/audin.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/sesman/chansrv/audin.c b/sesman/chansrv/audin.c
+index cd802fa519..36a8027a57 100644
+--- a/sesman/chansrv/audin.c
++++ b/sesman/chansrv/audin.c
+@@ -181,15 +181,16 @@ audin_send_open(int chan_id)
+     int error;
+     int bytes;
+     struct stream *s;
+-    struct xr_wave_format_ex *wf;
++    struct xr_wave_format_ex *wf = g_client_formats[g_current_format];
+ 
+     LOG_DEVEL(LOG_LEVEL_INFO, "audin_send_open:");
+     make_stream(s);
+-    init_stream(s, 8192);
++    /* wf->cbSize was checked when the format was received */
++    init_stream(s, wf->cbSize + 64);
++
+     out_uint8(s, MSG_SNDIN_OPEN);
+     out_uint32_le(s, 2048); /* FramesPerPacket */
+     out_uint32_le(s, g_current_format); /* initialFormat */
+-    wf = g_client_formats[g_current_format];
+     out_uint16_le(s, wf->wFormatTag);
+     out_uint16_le(s, wf->nChannels);
+     out_uint32_le(s, wf->nSamplesPerSec);
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
index 2a47b6c68f..546741969a 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-Fix-the-compile-error.patch \
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            file://CVE-2022-23468.patch \
+           file://CVE-2022-23477.patch \
            "
 
 SRC_URI[sha256sum] = "f76aa16034689bb8997e56fd554db29ba57caa1bab228a6eda28be4389dedeb9"

