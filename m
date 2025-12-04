Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27EBD1D88E
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 07:56:43 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38410.1764834998640272341
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 23:56:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C9/Ki8W3;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so355159f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 23:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834997; x=1765439797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZN5faVpznitiM3FwqJEgbYopESjzr/1vGq9j7cJTSU=;
        b=C9/Ki8W3uuhEHmEsly8s7lQBEzPlLjs4Kdn6gxYmMbvUSnaGPcTcN8pJp8kjh8IB8u
         U7fV9r+rHUw1MGr/1Sq7rpR2B64p5jD9NY4ra3G6j0UEEYpWHStRQaHiE5j9QI+5Xbh8
         Py4xYeG+zkEOlzDbbamWYVtciBCmM0Ne/sHmhRcstTz1tOqy+HLTmtPkZzQlfZr6C8Lp
         GtEke0JFLf4jdH0XnIMu6Jmi6iTGRoO6I/u+E60ZXrtU2czWaJ1fzHJ4ppjb6ihWCtKf
         LXl/YPSvwKxntCxYkHYaEgLAFhRofQyGj6PIUAtnvf4XCq064kOANsX0Kc/NZCXGfyh7
         +GnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834997; x=1765439797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JZN5faVpznitiM3FwqJEgbYopESjzr/1vGq9j7cJTSU=;
        b=R0DxGOXbvEy9h6g/E3p8UIObFssyv3UZtt7w28DgO5WXW9T4vL/zZasH3ExU/UUaBc
         M7zFAf5eaSEY3LKwvBGtZrSdweExnJrhN4t5kcYJ1vhqFhQFgwhdZNj/y1cmsCqx+D7O
         KRxE7a4lgWEPsaD01Th9Fcis7XtrABqTwPD70JmEJN08rKCGF7hPO+rqWS/AadnmRSaN
         K203c2o9blPuDvnJFxXPpsIAbOYeMBb7TBA3REvhXVnWkS5938FtkPU3krPsN8tkYYiZ
         Gp+q141y+X1n7EuQAZgGtGi1qJ42Uq0g0weX+QMFVvPKuPUOuXFuM7govnUvCakLTZ+m
         Rlzg==
X-Gm-Message-State: AOJu0YykpzmabjPxOYw6b7VVqd2FX/ZlWE0+dPDCSPfrpxP60JsSzzff
	rJjZV+vhMDq7t5H6WCrmL3FILQuLQye5mhowNKBeg4rqRPx+ednQItJb0Yusaw==
X-Gm-Gg: ASbGncvFRzUl59Kk22U6Mn/kvi0/G9/BSAH3vQRT0UqfATM6/jfJ/gnhqLGJ+P1cPgO
	5gCGgi53Kkh8s4ZQm7woqB2+d9JUfJ7wwjw6qEfDVpPALZdBWRzOQM1kvx6IIGu4pOn0kWVda/S
	uLhnrl1lTxSDsNplc/abu3gqJVPdbyMZ8oARIpPwapUIUOV4CM07OW3I2EGq5Nh+jt73ob1+N8i
	ppRwht+yg/Jw3IQxTWoNRST5o9lYJgzIT3DsrHKT3V0zJMn1Y6/4S9IKPDzM5p24dzHe8n8C1Ye
	HCq6mAdA6EymaFf9cst4N9VjMxDdDgGd3aElT2DzlSKF1Zz4iXenHQgtSJBboXe8LC2oF0FEU6n
	JjrrHTQGqtnUfNhnSgfRjHbhFAEFvUHUvH6H0nVo7REYl5rulDlTw3nS+cwOQ7T3zAnsMY4/izw
	lh++gSlYeU
X-Google-Smtp-Source: AGHT+IFiDyMVIKFHrNa0gQAwLArAdSHVp23kU6fa+MMfNgXimMJzcNV3iT6xhdlRR6VWBWvmLTlOVw==
X-Received: by 2002:a5d:5d02:0:b0:42b:3ab7:b8b9 with SMTP id ffacd0b85a97d-42f79800f76mr1758200f8f.20.1764834996887;
        Wed, 03 Dec 2025 23:56:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e29sm1730883f8f.32.2025.12.03.23.56.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:56:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 02/12] xrdp: patch CVE-2022-23477
Date: Thu,  4 Dec 2025 08:56:25 +0100
Message-ID: <20251204075635.1088007-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204075635.1088007-1-skandigraun@gmail.com>
References: <20251204075635.1088007-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 07:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122304

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23477

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: fix upstream-sattus formatting

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
index 5eca9d3bf6..91d4134789 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            file://0001-mark-count-with-unused-attribute.patch \
            file://CVE-2022-23468.patch \
+           file://CVE-2022-23477.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

