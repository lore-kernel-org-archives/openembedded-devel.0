Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E77ACCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 20:19:00 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13152.1762633130247825335
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 12:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G8g6VCXL;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b312a089fso246505f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 12:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762633129; x=1763237929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PnhEqQqU3sjblvLZ9La5eVhpt3kNPlSukV3j+jeOzOg=;
        b=G8g6VCXLEUh0Qcepvaeu05H708YJmKMQsYtlxqJ4is6xN1g5MVF5pX4e6WxOgVAlIg
         W5qAAgO5nZD74aR/dwzCfVKIs5dFitL6MthpZYbB3gJcBiXeD02vAv4RdXGYXAsVT8PY
         9tVyqgGcgwJWSOKiiqorztrJa2P3bVzW9gGnRjulNbcTUdND7+wB+kMfTX6to2JGMSQB
         AqWdsxwQVrxLIpg6B5kXqGsOtHzWQ3QgydYQucuntau3OEl6q5pvL+iFK4FnvZcfFWC9
         0u0WerhP/5NSs9K/TFxZUOW6p6ggdt84wrnnkk8RfMa9LPuSIMcssRUjEBqCeJcLpoeF
         xTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762633129; x=1763237929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnhEqQqU3sjblvLZ9La5eVhpt3kNPlSukV3j+jeOzOg=;
        b=UO0OK9PY7VuabgFeyX4NCsRV37yhnW3GuSBhtLyX5N2A8AU0xPd6bA8DTl+FfgYWML
         /5eSOn4LCmFNy5BFWBXnMNSRgER5NSVBT3g465tjYLQEles6I1AFM2+C/oX3nw7GEGa+
         FQZoWZwnDe1sX6RpcAV87kWhTrXouOV5uoHzfHUfoiLZVGpH0Q2JkLsj421fSWthoaM7
         CsDvtpR+YxM/Ah3ol5+slTt20c7NwjIkWFv30WBn+fMngHfNSh5lw0czGkCCD6HpGXcp
         ryicg++G5aXqEYabdNU3SGQyKUCQeqC26wUNVcdVy7B7g0Y2/5MMDDUL1Fk0yA2OC+rX
         V4bw==
X-Gm-Message-State: AOJu0YwPhNCiVIoz/x9M0fqlMiky3sQUljCEGJ0Ot7NpDfMywAp/uhmd
	9Atz4X/tdVe6UWYB+bY2EhVGUgzpJ5Kn94iP+ANY9Ht96bitq5aVstzrIj3jNpAg
X-Gm-Gg: ASbGnctCUR2tQN1VRYgBVS205kkj3ldK1i/GSGTZkmlO2gv5O6h8Qel7+US7X/bNVtS
	DhymRobCdC4Bgt4bS9KQXLDTxIt248ypFBaajJ/yX7ZimZKwWqHzLVh9YqI1ch1rC2Rx5Icny9Z
	xZIrBcssHw5D3a1GtzQUl0rLzow/dfUx56tdFXdFZjIAAS+Orzj3nKHlLSZVcXzAcLDt+2JQ2iy
	xraFmAIah1DTt29vSVBCBDaLVT7UJRHmHS2JFj9F38S5G1stIfZlklPjA6HDRZDrdFBTYFh2zet
	ikmiV8rtJW50wKC6PC0cxcyC0a4x1RtNeSWdqemZEKH9UZiMasX3SlUGy59Dz1KOiW94m6OKg6H
	BqiiAbNvgiJCysyR78GdIHHaTRSnDIRdDl0HH+NSlSX5baJ8vZ58C4QsDRxozmWtMIUhJr4huPA
	==
X-Google-Smtp-Source: AGHT+IFOxXJOSDwj/b9GYPndHX6HOG+ofeeb7lcRemE/kdWhuUJnwTvrbqMeTr74l9d3Nqy5+2Ta1Q==
X-Received: by 2002:a05:6000:2506:b0:429:dde3:6583 with SMTP id ffacd0b85a97d-42b2dc03ba4mr2770898f8f.23.1762633128316;
        Sat, 08 Nov 2025 12:18:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62bf40sm12806684f8f.9.2025.11.08.12.18.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 12:18:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] minizip: fix SRC_URI
Date: Sat,  8 Nov 2025 21:18:47 +0100
Message-ID: <20251108201847.3581402-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 20:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121406

The sourceforge url stopped working, the used version seems to be deleted
(which is the latest version). Instead switch to github releases.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-core/minizip/minizip_1.3.1.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb b/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
index 56cd28c9ae..51a74d039b 100644
--- a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
+++ b/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
@@ -6,12 +6,13 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://zip.h;beginline=14;endline=30;md5=8eaa8535a3a1a2296b303f40f75385e7"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/zlib/${PV}/zlib-${PV}.tar.gz"
-UPSTREAM_CHECK_URI = "http://zlib.net/"
+GITHUB_BASE_URI ?= "https://github.com/madler/zlib/releases/"
+
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/zlib-${PV}.tar.xz"
 
 S = "${UNPACKDIR}/zlib-${PV}/contrib/minizip"
 
-SRC_URI[sha256sum] = "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23"
+SRC_URI[sha256sum] = "38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32"
 
 PACKAGECONFIG ??= "demos"
 PACKAGECONFIG[demos] = "--enable-demos=yes,,,"
@@ -20,6 +21,6 @@ RCONFLICTS:${PN} += "minizip-ng"
 
 DEPENDS = "zlib"
 
-inherit autotools
+inherit autotools github-releases
 
 BBCLASSEXTEND = "native nativesdk"

