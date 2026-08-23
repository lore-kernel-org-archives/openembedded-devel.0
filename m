Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39361C5DF81
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:18 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13147.1787485932642327441
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xta7Jwc9;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d5cad1a6baso23362225ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485932; x=1788090732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yixO4OvioHFBs8E1nSXKU88vo18VCCrV8LKKBiDW/4=;
        b=Xta7Jwc9t7s/eJteBH4OD8m9TTNyvlwGcLWS0ACRsAKBfWxUxOKWa3sAVDa0cvsWKs
         +4PKrlZU/jWXZDc1r4d+0v5dQ3H4D2q8LhEwgPs/uZsDJSwpKwQ0kKO8bYMvWxw/uSFx
         nyNMooj4hPajuZ9dXaNT5WNY6RnttamrEnuzeuaSd89fLOupFCbLxXB8TfzXFnLSM1Kh
         PQsBvE0KffzEUYN1i1q8A3jo8CYMrd9AUIuBk7VNM9BOzJhm70f2XmqZtcKCcw4PgGKh
         GEHPPONxKxrqrNezixT8vj+GZOdyvw1rzrJMOrOrIKzUFvBVyO6MRoGILpgWEFv1mbY/
         5iCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485932; x=1788090732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0yixO4OvioHFBs8E1nSXKU88vo18VCCrV8LKKBiDW/4=;
        b=H7jVm6m9Gs5hRlv7QN2yO8yBen1qKRzYgmsmy+Jj5sZd2xXddCzTgb1SnBlNtUyI7H
         S+qZBCXPNWxGMC2txiAFgqGoM6F3ndoGI88BxlbboBYarDzEFnEQyADZQC1CspP78Xlb
         moaUUuAMGyoOOsw2fOCuBa+zv8QANoMlz2S/ROtdnqSm/+bkdaSUVxykn6dIYLjN3BW8
         VJscEl65AzZIe55aVpYxyt8YTqK/CmzWwB+vhkijYymbV2PEQNgL6GtopHITwStbIGaf
         1cZwSMPV8wFzRG6cAIgaj78Z2QJ5xbYGDdUcTXQV8qJA6kx+e8kc9CZFSs3d+C0ZkhAe
         fjBA==
X-Gm-Message-State: AFuF++mLX5O+GKB+zga5RhAgGrJtAn6/66rUHcK2jNb39d+GlhcDtq2R
	ilv1zcI8brprPFyZAJYtCcb2Ci2oljAYRLrmRvAO+Czrkl76Nc6dJylnTGRirQ==
X-Gm-Gg: AR+sD12dCVt69tu2RKmrbTLm5hh5B92xyYXDMoMfd37C6AG5r2zE5ya7liVY0gXTsUQ
	ikkvZjQr/zH1RuQPQ9qJJzwkncLON09tpu/O2L5RpyjRnU+Uzomn7BEj6qONwytVPecrXZueMJy
	uflNb9ZXVGap9rajaCN89TLOaE5p0Fjk7xlLHhIHhN5H8TdaTmFyiO+ZCwqa074wJ3gJ/IBo5iT
	sPEDGk8c021tcpI2cF5E3vQpELdb0g7NqZ2LM6jRG8DusyKlQ2DdMlJn+YIewavppez3XdSAPu1
	qxOh8/+IKn6mRuwEvT+YodK7RtV4pV6bHU9b8FnYJjtNrEvwpHxgq+VXXQ/O4IweMSVFYRy+WIh
	lxPbhn7rE0jqc4dAr9+pLaGt6KFoyJmnCPIK9mRFYKOr3FoN17ed4l/ABkC7ip3OCfzW+H1PW41
	EYXfF3KrPHut1FyZWtJXRDVbpSKDMZMLYaCQQZT/8uysAI/M7xECzMLTJPKGfWbzVHqK/D+geZF
	g==
X-Received: by 2002:a17:90b:1a90:b0:37f:bfd6:8b40 with SMTP id 98e67ed59e1d1-395c33a0168mr26554192a91.5.1787485931969;
        Sun, 23 Aug 2026 04:52:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 3/20] libsdl3-image: upgrade 3.4.2 -> 3.4.4
Date: Sun, 23 Aug 2026 23:51:41 +1200
Message-ID: <20260823115158.1582363-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129437

From: Khem Raj <khem.raj@oss.qualcomm.com>

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit a1be7bcafa1db5e5ecf8e79c916034ded8526633)

Changelog:
https://github.com/libsdl-org/SDL_image/releases/tag/release-3.4.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libsdl3/{libsdl3-image_3.4.2.bb => libsdl3-image_3.4.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3-image_3.4.2.bb => libsdl3-image_3.4.4.bb} (90%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.2.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.4.bb
similarity index 90%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.2.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.4.bb
index 0f7ce92efd..3953c6314f 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.2.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=df8f4d887d3997f6e9cf81bb7f43dbf7"
 DEPENDS = "tiff zlib libpng jpeg libsdl3 libwebp libjxl"
 
 SRC_URI = "git://github.com/libsdl-org/SDL_image.git;protocol=https;branch=release-3.4.x;tag=release-${PV}"
-SRCREV = "96a73a551a857b7c8d0ca3cc553a266eabbab6a7"
+SRCREV = "bec9134a26c7d0f31b36d6083c25296e04cabff5"
 
 EXTRA_OECMAKE += "-DSDLIMAGE_JXL=ON"
 

