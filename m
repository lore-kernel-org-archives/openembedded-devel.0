Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2523.1794961613217173100
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:26:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ETfo6WKd;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1234406eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 16:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961613; x=1795566413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JERzyE1wlqZi5idLVbxiRBupDAQ6sDSMDXq/MGvaLyY=;
        b=ETfo6WKdMFPNbnSS1Ru6AGC5pBvM2KYOIaQFvgZy6aKRgrA8LviuEWwbdWjzT7/hTv
         WKLC5rzP7Hys1XdDP9vNr8U+vU8Qziu8uRWI0NTvtWQCTQAikDzPGxBn4pm5prH3BCVv
         HnJNOZjWgshy0jhYB9HSYIoYzPXopMm/jGM1vI9tLtvyppwt7yMtkZgtQfC6gAb51FSr
         6byL4feED4NhC22oAuEd6bikUC02gjP3ob2PUeUhod98L+qanA1sLrkgroWMtZCRBjDs
         l/T+1IWS0m/+7re7SMvKSUh3Yz4VO9ul44Hggqj+Sw5655W5GZIyCdCuoGkTKe4yioaq
         Z17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961613; x=1795566413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JERzyE1wlqZi5idLVbxiRBupDAQ6sDSMDXq/MGvaLyY=;
        b=a5VvgN+zR6wsBpZzKFGP8Mj/k06pEnDYMUYtvbMxRSw//GsZZKmu3zttrkNoKkiNqB
         CzH80QA/OqWArtBRzlFIWYX3c5/Ubp/C+NWP+WWH+FmUQPyhzglzRUhealmGsa8uyrzd
         xL1RLuvJBA4ehpl9Q+0jwXoLT0mrVUIljUb9vWjvSfkN7F1OhsQ7VQiJGVYWcJ3z+8x4
         zKT0hLGOouj/jRURU4CJsRrXurKg+u8jGMkEEhvIKilRRUTPnvktQKVMJPD2jE0UQ3nk
         BHd/UE94u0JXwEBqU5WHPeysvx/P+uXN0NsNQRNLBhLtVNpg10QRMMpvTpIWWS5rQn/t
         qzBA==
X-Gm-Message-State: APuU4Z97vTtluI5J2jfazVGw/G9OTmUsbfWL0jElVLme20xE0E0gPo8p
	HIaMlRqdl/69df9tDDHir5aIhC3L/XIZkV7MtX7fM8GlVT7XihS48ff2iyUl6OnM
X-Gm-Gg: AZFdTZdQWr0G0FIYmhM0Crv8SnAIRqxcYyBnCt4ARrER17MK68zL3a3MH04vfWkBOUO
	1FYGsZ1jqkJVsdpNgfoaBiNczijqUk6dDJimQm/abUNlp2rWXtIDnqWssVinZFrMoCjohhl5uUn
	ITPGQwqxMEFFx/ymNg6k39UZvMmohGEj3X+sZpwV7P5UYxmrL06ZqWm0NTgXAS8/z0K8KWCu2c2
	jlHbAYEpIeE/4pD/ZwUz8OVnIJ7MJtomKrEGQIo/yqBCNwBRazEzJ2Uf8cp00eivSLNnClDB/Fr
	OGgPcX3YjqrGxg3kSb91dyK5p0xHl0WNyL0DKQsyYsy9fBgEJkBS8U+iAti9gKoYkb1M2Y8qJ8c
	LJ+kjBm2lcMcHXg+7ZruQ/O9LVyjk51iIZ65KkmsWBtomqwxu7xwHmhagL7OPegbJDGoOmFTnSs
	4CumiqzxBMu0v7p1DB4rv2EG3r9mIbEBK/gEmKTbw3NIqrYolR2wHq+JgnTbFFT0HbTUadIndOc
	2N9C21ohwI6sKRdp+rnChGqotyH0ZFCL1G/wREZqUyfzlmx5RYKmwzyTNkMALr1P9mtZmBEC5ah
	ykRABw3ZO7Cc791TZOxpdEfN4rEelQO7XQPYdXfl3mgIE9U5aY9cUQvaX+geHZD/jfL24kASl+O
	TccrS7R35qgLyh1VHkvlCxOZ8FKlPULotKoOORONvPdoxe7cGKR/GyI80UK4tTuXiFi1tMmNkBR
	oRl1Cf0qW7Bo3NsaPHDgXWEqbkIv37oSXLBqSZ5/Nqzfyn9Ufp6Bjn8yw3TAdRmFxCeL0bcoOwH
	hXtV/TnUg85U1rN5V9gR8X/WeJ491n+5e6/vI/uKRTyC9zyD4bKtbPLYG1XrrX455Yasq4YNVnE
	LC+fRLb/I4o1E+FSj327PsrSNw==
X-Received: by 2002:a05:7300:fe09:b0:381:8a71:5446 with SMTP id 5a478bee46e88-3828101e95fmr1019471eec.27.1794961612497;
        Tue, 17 Nov 2026 16:26:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm1697015eec.28.2026.11.17.16.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:26:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 06/14] evemu-tools: Fix LICENSE
Date: Tue, 17 Nov 2026 16:26:34 -0800
Message-ID: <20261118002643.29829-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
References: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 00:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132607
Content-Type: text/plain; charset="utf-8"

The evemu library is LGPL-3.0-only (COPYING is the LGPL-3.0 text) and
the tools are GPL-3.0-only. Add COPYING.GPL3 to LIC_FILES_CHKSUM.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
index 225d15cc7f..f34fdc70e9 100644
--- a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
+++ b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
@@ -2,8 +2,9 @@ SUMMARY = "Kernel evdev device emulation"
 DESCRIPTION = "The evemu library and tools are used to describe devices, record data, create devices and replay data from kernel evdev devices."
 HOMEPAGE = "https://www.freedesktop.org/wiki/Evemu"
 
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
+LICENSE = "GPL-3.0-only AND LGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+                    file://COPYING.GPL3;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 DEPENDS = "libevdev"
 
