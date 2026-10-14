Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11C5CC6B2C
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:25:37 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9251.1791969936901072195
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C9feAMIi;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-88834d30002so1858570b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969936; x=1792574736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gh83cfskHLvKV1uwY+k6XSG1tepLn+dpLgGtGNQHReE=;
        b=C9feAMIi+JlckcTBh3JdOYzcaiiz3gbLdYUxTE9bTZv2Hxx3TTbcH5K/xy3Rb2yt19
         hB3BKcS3GM1JqOQg/CYXiM3MyxVjMpCPEHSqErGv5br/2x8pb5P+ccXbVco/q32VK0lV
         xNRpN9aPA98nYkuxxR0WWOn6t5Mb4kuVvgWmlNLfTEcP5by6YnCnC9XcF3leIy2r4QZC
         ifLILI0NPPUeAx47TrZDhK/+H456Y9cVa1/1/wAmHWrUaG7bT/hhdzv2Yl/icfw8mgyB
         +jl3Ase427qtbW3Mw5rHaCM5HtAaYJTw6szf5P/6f+SFx0o3keng0HITeQRCuF3uY7RT
         BY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969936; x=1792574736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gh83cfskHLvKV1uwY+k6XSG1tepLn+dpLgGtGNQHReE=;
        b=WtIN/P0QqdAV0xg9bIHgzAx2IkTnmkcXyNiZYTpU2PtfTfXF2gSrex25E9uOGNwa66
         iSMGnSfD/nT6MDrJ5896PbYuM1uHfpEiZwhaQEuU/zoEYu61uQEcZFF8cFCZt/REI1Vh
         5S3E7hnB4bV+4XYliwQm7XfO7vpE7PPHe6/o3OOsvL0uIShFW3eVYl7i9bofviQ+4L6v
         RrI2JrUHXFRBIbStgpli7/X7QCawf3BTuJCU+/sOhogLNjRS/3GLIfFIOSnQ7xV9keoP
         EIen6RLUK3Yq4S24xSaafp6WIrASpMX2O/WA6nq3Ew2NTuT95RkvCK7VOF1sLcg/2Fq3
         cROg==
X-Gm-Message-State: AFq9FYKPHAAr8X/Twq1vsYOJTSXs/84KTbJ3yljLkVi4Z5ZZOSCcuhDt
	/mVsBwJg5d3BnD2xeOqBixz8CCXt5DS9o62/rDaA2INZz5kP5yGThFD0jtRsqA==
X-Gm-Gg: AYBFou1sv8X5fyqk4dD5qg24+LAUnsWIatxeXeRxf68tzCB7Y4Za4VoyjPDdq9M0i8r
	CWJ3tfeSHeRTRayS1mz2aL7r3IvWXIBsDPb6eCJdGofU9h8UWR0ZoWtk5qLoEkP3POwocMm6+ow
	AKopDtM1Yko7fQPlW+tc5haGdpZhwZgGrm9LOEz+JRHFcavdbjPv8GwHKAcda+FWCgyli+dnx+p
	qlGtsvJbnoCKwOEBDGQxn4yGC6lhssYxtvlO47Px7VLO6WT8BqEsfhaJekE43VkAcfmmSfE1H9I
	BxmE2H16c+OF5zdpjO8QOBsvCEBwd3XKVz5UF8Y+nmyPt7p83sHifl/1+pzspdx0I5bT9IKCyHO
	cyjkX5H7aAGUmoW3bmLvs8BpuSHO4lX9VIC63Lq9JkgaGQ+qjc4xD5WgnjrpKmfW6LSusu7AyPm
	qnym7ivRyfMZ/YYDN+kZQmjKHhdhuJhJ+XH/GGhp2g4CMh5ujjPBe17m/W9wX+Qa7QyzKFObXmw
	nnA7iNjMY4nWUlSCm0iApuvKtMRbtDbWFXWPN0=
X-Received: by 2002:a05:6a00:4f84:b0:89e:32a:b474 with SMTP id d2e1a72fcca58-89e032ab64cmr287428b3a.19.1791969936197;
        Wed, 14 Oct 2026 02:25:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:25:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/17] flatpak: upgrade 1.18.0 -> 1.18.4
Date: Wed, 14 Oct 2026 22:25:01 +1300
Message-ID: <20261014092514.454505-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130873

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/flatpak/flatpak/blob/1.18.4/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../flatpak/{flatpak_1.18.0.bb => flatpak_1.18.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.18.0.bb => flatpak_1.18.4.bb} (94%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb
similarity index 94%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb
index 879455f63c..74bfb89e62 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.18.4.bb
@@ -4,11 +4,11 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = " \
-    git://github.com/flatpak/flatpak;protocol=https;branch=main;tag=${PV} \
+    git://github.com/flatpak/flatpak;protocol=https;branch=flatpak-1.18.x;tag=${PV} \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
 
-SRCREV = "5de2b58bdafde88515d9d6b9189bd1cfd3b88c46"
+SRCREV = "a02d0ba48abe9aacc377de15699e5d8c024b5669"
 
 
 inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection python3native mime features_check useradd

