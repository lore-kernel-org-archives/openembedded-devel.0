Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471B8C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:00 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24393.1786747619790067642
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V2l8tR5z;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1321148a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747619; x=1787352419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nlY8ZEjBZnDAfuTH0QFZ15JiXCmUQ8D04aIgTLfvQFE=;
        b=V2l8tR5zQIb+byDEwXximAJc5yYSVlxnOurIukJqyq3qJR5kGW1aiFI2q4zK0voLDl
         NDb0YaAtUBFHCaW0P0fBooGk/VsU0v0eVX5LvIvhQR4xn8XcxFeRYCt49vqAJJnsHroi
         SrOUnlG/m4/vNHKzI1TWUHrfaAeRcDHHzTkIG3P0glJpnqtsTFN2/JSfGfoLpoFuo828
         ty9b2GM5NPaC5ZVklqyu6DtoKZhGvM4i3kzBobrV0pwzo497E4I60BU7wwjw0K7WF2rH
         d9sVY/wu3DZahGpwmFzLCA5tuLz9XaC4ZfawMjah3HuloW/4mUSG/do3SSswoUF8Q2Ll
         4ImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747619; x=1787352419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nlY8ZEjBZnDAfuTH0QFZ15JiXCmUQ8D04aIgTLfvQFE=;
        b=P5W+tYJykJQSTf0qOxtyVsFufg5251L5oY++Qn7MRuqjjZyNOf+dmAIy3Qd1JkWr9+
         gLoXYJpdRDeP5pXE7EKiYmfyY0lc6qpxbVz8eyh8Ip0pnqthVFDt5v7TuYRuwi086eyJ
         QhLmMKcUhNNNIMVdEut9s7awyr4eagGSyJ4qj8PXwfEK/JkmdrLBspAUypq3ZO80vqd3
         wdyssPljn5XxxRjx7qtzMkijoUWsG3ZwGhrHhapUttHi2hxITX5aLojmOX/70WCoxCxf
         SGhrNX49YfV7SNL4uLHaK+L7lZ8OcNmByMntPMARrci4A5pzTW3zfC3ivMr4gjRG6vjV
         zCVQ==
X-Gm-Message-State: AOJu0YzznSKj3ymmJpL8mCj2pP4K2geKr+YcygwrMH8piJar1O1GvGuz
	jSAkXxzfp5qjsQ9N68OAl/TnUV63tRtCBLOh1zs0DRVuhrUXPxXyJwh0PPFQq04B
X-Gm-Gg: AR+sD12ULq6Xi6xNv6WYAzoT4v/COA1FqTwMBIPFSto+WISFyJcVv735ceYnEwXxFlo
	L5Y7R9KCzAU7uT+W/tpwIWY+9rRVH+pCtddMLzQpXBXz0VtNwR1v3fhj/5MFVWJ+0j0idyR3IIP
	qkMxL0LoDsVXm4hbzug2Qi/uDO6Hc9nZyxajHQvZN1EsI42dSR4YiTrRmx7ZQoUo14tgu00V0NV
	5SaArXxJ4w3I2vdJcLsqEGQx/3xDKofCgJn+sAlZX1v4pKKXZjdYg8TFNVhlOEp8CKhPubPzEBS
	mnPlGmBie65XGwZ06YthuJfG7cNckIZLCaF0W/rsbzN6T6BhZw718ZoRFbYALGFI/rDEpAAQIrL
	dNj3+I6TgEkNKgEf0un+ylfJxFvVoO8atGqYrCIeFIYsptL5k9KAJbOg9Cg2V8xZ5HSfWRTCyGE
	Q4laGhNSOQU6R+/GS7G7tky9XerO3c+k9SgEdsVu5X2YKwOJl0bpS6UqwC0Rp1sSZimWQDXIm9Z
	ZERRX14eC9bXRBOkrn83E76sjV8/ycRnvi8jrjV6LvqpbzJHl36VN0W6tdO+Ni/CFDMkn7DRgkK
	u53mJ/gIdWd1kqhgHcAOgAk/7ttSPZAfm3V8ekyEl3Ei6UBjrIZZftoP87sxSBA584LHHlky7rd
	Ati/4sggQbykEu+pYwhUFZPWVrWphAyI/UJ4EpRIUg33Le/c=
X-Received: by 2002:a17:90b:540c:b0:381:5a08:6291 with SMTP id 98e67ed59e1d1-3933baa0136mr10721604a91.20.1786747619127;
        Fri, 14 Aug 2026 15:46:59 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 069/109] glibmm: upgrade 2.66.8 -> 2.66.9
Date: Fri, 14 Aug 2026 15:44:55 -0700
Message-ID: <20260814224539.1523174-69-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129133

Point release. LIC_FILES_CHKSUM md5 updated for COPYING and COPYING.tools (upstream re-encoding, license text unchanged).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../glib-2.0/{glibmm_2.66.8.bb => glibmm_2.66.9.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.66.8.bb => glibmm_2.66.9.bb} (74%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.8.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.9.bb
similarity index 74%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.66.8.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.66.9.bb
index 2e7864852e..49cc40a813 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.8.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.9.bb
@@ -2,8 +2,8 @@ SUMMARY = "C++ bindings for the glib library"
 HOMEPAGE = "http://www.gtkmm.org/"
 SECTION = "libs"
 LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
-                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
+                    file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce"
 
 DEPENDS = "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
 
@@ -12,7 +12,7 @@ inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "64f11d3b95a24e2a8d4166ecff518730f79ecc27222ef41faf7c7e0340fc9329"
+SRC_URI[archive.sha256sum] = "5a026e5602085307c7dcb72b71b07261c40f80914277bef5f8d7f2ecab739bec"
 
 FILES:${PN} = "${libdir}/lib*.so.*"
 FILES:${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"

