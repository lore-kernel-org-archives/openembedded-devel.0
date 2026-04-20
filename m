Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52C4F55804
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 09:33:34 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15572.1776677606880741998
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 02:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kh7p7DrO;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43eada6d900so2831366f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 02:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776677605; x=1777282405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQgUYEuRuf9IFHHKNyIKspWOfhWfPTntWK3aRczPoC0=;
        b=Kh7p7DrOHuAcu4b0xJ71ijPF7Xm+qh2ea8M2AIa+md/ONhKImbWPqv9bsWnM6nEeFY
         R5qRJ207UhGZOyACesTaD8+a71o/mzT59/L0ySwC6qqbnkzWk5JqWsDmIHGZIaVJCc+J
         FxeNdAc1+GHIqHaWnuvpOcneMz3k8lnlezvFqAxmzxoVROiFoxPDl7NHGT9ndgW1goce
         /E3BLOZX+l0xrVgV6Mzpy5OvyFqXRYwXWFrtI+dK1pzuCqD0G7UAiUdMjmyd/RQlVwu0
         P5xvss1puQ8nZekx+jnbMs2T4VLzdp1tA+6Jn0KWLLL9B+apAG1faBAIlsVXi/GF8e3n
         ZSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776677605; x=1777282405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQgUYEuRuf9IFHHKNyIKspWOfhWfPTntWK3aRczPoC0=;
        b=AD2llurU4hEwsJ5CjNyrvBL/dahA49A7u7wSsH0+cud9TE9itgTb3b9zYW/hNpUlZC
         VtjNjyK6OTiwwHOoMTOVmlAeC+QLRr1GQgW1wJkeXytbZrg/Z2T+KhSglhc/TOZvpbmG
         /gpOD6nV7v7veu5uttQpEbsa6oloXCpg4xyEiPVvGj+Y0PlDFxnAq+znEgQYpJj52c+j
         wOpIXGQCcXgtU2p1sY3Qb17ZtDDsvL7Kk8DoGePZYJJUSRD1E5Al77H2j3w4Lwh+JHXV
         rvY6TtDTC7RJPhWnbSTShXl+zv3xpH5o6aFx2m8LIo6MfClMUAVJVHO1kzVzIQ23yhul
         pNbQ==
X-Gm-Message-State: AOJu0YxkoCBTkjjyqfxdBL1Dwq+RYnlaxEnH6czqX1R/HTK8t+VEGyV/
	umnP5Vi/HyFD7PNQvaczzPO3d1rcLknvGcXeSBy7nsEu0QW/LUrJgVi2B8ImGg==
X-Gm-Gg: AeBDiet4hK2aAT37Dy56lgpBgoxgLd6tuiGGrYZTSPcgXMKQMIBFi0Idj//oBN8/Ono
	luq7msNKmjzC5bAVSrkRCJnWOBlaxDtUC1glaKhBcphtmuG96LkLTNb4i4/D+Aw+eg5h9/sNmBJ
	LuKsFvN+aIETQwXXnaWh7s3MUp+OJaMSJ3aZkvEQj7B0RF1CCjbiusco0+evfXo6LxBoDfDgnfy
	tgQBcnt46hQTmpbxC66bA90VaBkiHIxM09Phknpuu+VPTJa8cv7M4g1XfJBxNt1Sa3fs7FHvpPV
	KMWeMdxmfQbwkpn1KKAK29UMylpActDw0ZdUDY/h6H/SnIvwuJ0zS6PYo0tSW5WWDu8+0FMmn5k
	DOHQz+FVow4MHhQd026QZGtQ96IUHNGu9O62JxM4lJacXHCix14FXvxbQlNWGC0NlgfLw92PphJ
	/Qi2m4qDgR5QPTJ246Iy0xUn09h+Mh7d8=
X-Received: by 2002:a05:6000:2212:b0:43d:68dc:9ca6 with SMTP id ffacd0b85a97d-43fe3dc7b4bmr19566145f8f.18.1776677604841;
        Mon, 20 Apr 2026 02:33:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4eec9sm26577488f8f.34.2026.04.20.02.33.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 02:33:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/8] ngtcp2: upgrade 1.22.0 -> 1.22.1
Date: Mon, 20 Apr 2026 11:33:16 +0200
Message-ID: <20260420093323.357053-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 09:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126487

Contains fix for CVE-2026-40170 (which is tracked without version
by NVD, so also mark explicitly as patched).

Changelog: https://github.com/ngtcp2/ngtcp2/releases/tag/v1.22.1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ngtcp2/{ngtcp2_1.22.0.bb => ngtcp2_1.22.1.bb}           | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/ngtcp2/{ngtcp2_1.22.0.bb => ngtcp2_1.22.1.bb} (84%)

diff --git a/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.22.0.bb b/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.22.1.bb
similarity index 84%
rename from meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.22.0.bb
rename to meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.22.1.bb
index f7c0ee0d4f..acff7b548b 100644
--- a/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.22.0.bb
+++ b/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.22.1.bb
@@ -4,8 +4,8 @@ BUGTRACKER = "https://github.com/ngtcp2/ngtcp2/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de0966c8ff4f62661a3da92967a75434"
 
-SRC_URI = "gitsm://github.com/ngtcp2/ngtcp2;protocol=https;branch=main;tag=v${PV};name=ngtcp2"
-SRCREV = "2a441e8540d192b0707989b146ce80efcae5f0d6"
+SRC_URI = "gitsm://github.com/ngtcp2/ngtcp2;protocol=https;branch=release-1.22;tag=v${PV}"
+SRCREV = "716e64b05f4a3709dfc0b0522cf9fd4456d055e5"
 
 DEPENDS = "brotli libev nghttp3"
 
@@ -18,3 +18,5 @@ PACKAGECONFIG[shared] = "-DENABLE_SHARED_LIB=ON, -DENABLE_SHARED_LIB=OFF"
 PACKAGECONFIG[build-lib-only] = "-DENABLE_LIB_ONLY=ON, -DENABLE_LIB_ONLY=OFF"
 PACKAGECONFIG[openssl] = "-DENABLE_OPENSSL=ON, -DENABLE_OPENSSL=OFF, openssl"
 PACKAGECONFIG[gnutls] = "-DENABLE_GNUTLS=ON, -DENABLE_GNUTLS=OFF, gnutls"
+
+CVE_STATUS[CVE-2026-40170] = "fixed-version: fixed in 1.22.1"

