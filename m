Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F3DD715D1
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 06:30:13 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14203.1769236211458848341
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 22:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NjqeQ8LY;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso21926205e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 22:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769236210; x=1769841010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+16SN5hSC4C8Ynhjm3hyn1oRfFSY6XAK5p06M7KCLpY=;
        b=NjqeQ8LY3iJDnyTsKZ9wil+P8tKwit1/27MuBQwELV5digvXqtWYt6pKfKwM5YlA5W
         OF8FMumF+ws/eXkJkl7M3r2aNQw9Ueb0EDs2ExlAWhTqeNKjdCvId469Qv2YIG7Ku07s
         RKahx9Njj7kGInpH/QA2ReDeVFeGZxqVZ7iQ01RKb8SL5Ge+uKVzT/i4AfNBUr6ZsHKl
         wGv9rMNQF8Mf9ft4iZVALmTGPbRLIdGi7lb7pnv1ytFfjJ6IBYY48476TObvcayqAosU
         N0Q0Vh0NI/l1skquzMPbo2Oa+OKoOtFOILxuBYg6ExuoSZwl6QpsjKEh8fNsqyv9Ytrx
         l7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769236210; x=1769841010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+16SN5hSC4C8Ynhjm3hyn1oRfFSY6XAK5p06M7KCLpY=;
        b=O0K15n6fKrWM/nFpW1d6c0CHwJWkr5wImPkOgJb/9AN2KeD/e02y5Gd0sBAl1HqaEp
         4jgFjWAtUvds72xifQXj8cQRjTEayU1iKKVZtQeW+28XUF3omdeT155wRSA33AhgnOiT
         /72Lcit6iwzIeFJZpwKurLAibjnzLIn9ZZJvor0Dkxqyb5PAvQV1WFF42UK72znFnz8P
         ZoxD7LjObwAML1BOKrVaWsWUhc98iLLZRVw6q4pW1wIwr8Wu5iFcSifgUSFo9zLgo/ch
         0zCKscHJO08AwkVY5B0bu5NNvmw04XhOviwnDC63RwtaRw1MabMpyySo5e3ViHc9fU5f
         D8KQ==
X-Gm-Message-State: AOJu0YwQtkQ9AyNNQpOi4t3fcnau1zA28ZCAvnLhl8zBZuVMZCFydRhD
	E17DHaRjGWSCDPu/l//5yQAMoke1DX5lomTPKnxgnP6YUZKIpm8clP8yOA7V0g==
X-Gm-Gg: AZuq6aKRE7xWclcRft4WmOmVIY/muaLqVAXPzioDDcQQJm+ZTXZFwiPkjhb0BTjYH3Y
	jjhDdsKbJl2XuWpbgmA2Oc1ZiJFcjQug4lO47svxTNapsG7Rvo4F8QcfaGXw50kwnTKpjC9AWs4
	bM8Qp+IyYB5C/3IJB1AJHYwvi7q0B1vzPr7N0IwSQsaM+m7d/Fxidg3DDyExvYqVnweFa4juKOh
	kyhgHR6odW4ONbjuWPtLj/HIpek3mOrkPH958ALvH6Tm+BMhzSAfB1VSo8WjOa8aO1OIu4ksoqk
	G2tVQk/FJycXcvPQnthBo4hWqw8PtVu9pbp12lXpbxqufxweSjadUAN6uI0lsbhnJ6RocS909WY
	Qt63U1qN9NY6wKk2rsLVk86KVedboioIVDaejNvtwYYP4z7q754//UqH6m9m7z2KfXgQV3OYHlM
	aYT/NTgB07
X-Received: by 2002:a05:600c:811a:b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-48055c1e691mr12361665e9.34.1769236209720;
        Fri, 23 Jan 2026 22:30:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm265354385e9.2.2026.01.23.22.30.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 22:30:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 03/13] xrdp: patch CVE-2022-23477
Date: Sat, 24 Jan 2026 07:29:57 +0100
Message-ID: <20260124063007.28313-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124063007.28313-1-skandigraun@gmail.com>
References: <20260124063007.28313-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 06:30:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123809

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23477

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit a6efc5b2850036cadb044eb8de8bde2e54c97c28)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23477.patch            | 38 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
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
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index d2527950d5..a953342910 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            file://0001-mark-count-with-unused-attribute.patch \
            file://CVE-2022-23468.patch \
+           file://CVE-2022-23477.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

