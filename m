Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0460CC6B06
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:12:05 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5127.1791839524841476854
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eKNCURpJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso751433a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839524; x=1792444324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWYLf86a3oJDTvpkrE8P6QLke3XWX9pfxC+R93QCLPY=;
        b=eKNCURpJBOchuvVzjAE8gWyn2KYFDyKZ6uEbeDOF5TEbadZI2qcwxtanV6V5MAzw5+
         yWj0vFDbvZemCWMaJ7A2al3QcnhL2EddxoYPe7kxblb4l/jFXz7/YrS4JafXxeewLylm
         CAIkS0mBiVOa51ERlLwPtwguLhkcaS8cf9kVsGxnPu5b2MVFzEeK03FOdmvHp+8hyFwe
         DWqmhGKfuddus1NxzPmOSeczV/orlylPnvTg3AiF3CD0jucdbRicHu9obe7OW8OWbdEW
         rjyewGPVMXRwgmRggXwHLwI2eqwKnHY6kBZke0oEmkdB/+0zFt1SWE1TOXPe9FwVlMH1
         SYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839524; x=1792444324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UWYLf86a3oJDTvpkrE8P6QLke3XWX9pfxC+R93QCLPY=;
        b=k+IIvjT8tXXGA5VcRaXvlgDP66GFWt7hSEIXZ89sNMgvgFVcXf8xuxroxA+vcIEWGI
         gSOrJEr6jHvCri7w4KU0nWbhqDaYyX2iBVJXmQZWIGDXmd6B1oxAZoTft1MdClPUjoRW
         FmRcgWpY1o2xWtLEI1wpL5rSxZmljdaa2orttJ212iIVC9mfi8LImU+d1uYevVGtcjNo
         MgWOg11GGWiCncWWNWHnh8jLfrE81lMahGfd8Ulzo6vtdUebV7b18rGkwCTJcL91ouxa
         xRJ4N6n7wmw2UJBRTNp3aLni5ok/uH8b9pSXbHDcSUV9jJeAqzkOdTyiqZCqt0cVyswJ
         Yh7w==
X-Gm-Message-State: AFq9FYIGH4Zm021D9JECrmZ8SBpCP3Z7ksI9ONuR6OrVroH7pAiV/5vI
	nUVZx4XUs4390/rMili5seEOWYsIrzA5hMC48rySQ5IJLCYh5RyVFNwygDqFTA==
X-Gm-Gg: AYBFou3jZpBdoF5KQP6d7fouWqCL0SHGEDaCKTpWmpzbKxxg1ikkIaUxCezbggYZb3R
	nSJSrE/3Gd2DW7ekzM5VP3gf1609UM4Q6ZmDcSLwTN6nQp3qfNU5sO1ov+EUyYQaUifZ8WOT92X
	611sLRvugrC1lyGvLLUcMK6SruHnXcs1y1B/8Dl+AoI+BjzqhWLVvJ3xHHDxXiOm+440tZF2/Pu
	Pilxq3SotYCM0H3EImhpx3kezQOF5yLjq0WSaU1kgTSNfNxq+oXTk7uLamyCKatR2lthfrq+s4R
	XtgvqOPC050MxqDzW5s9ylP7pHTD34kwEjd8Hup9IsfRBoyf0prQuxY5g1EVgLuHkHX0F8MJ+vH
	GpwoI36wR7Mts68CdOb6ylrRvxl8L5riYdKQZrD1YBFKUyJ1w5L+tRIyQ+Krx8tXx2wgqk5zWF3
	VLkNxUzRoFufoZpDGONFzQYMicsxJIDVOkEyX8jQHsFOVkLA3ixXRXwFwURd04YP9e7QYTuo0nv
	kJVmH43HMWIGBbzSxD7tr/pHb2FAK2j8Krdgx0=
X-Received: by 2002:a17:90b:3c04:b0:3ab:2d17:51e0 with SMTP id 98e67ed59e1d1-3ab3a99b412mr8530957a91.19.1791839524181;
        Mon, 12 Oct 2026 14:12:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:12:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-python][blacksail][PATCH 42/43] python3-zeroconf: upgrade 0.151.3 -> 0.151.5
Date: Tue, 13 Oct 2026 10:10:06 +1300
Message-ID: <20261012211009.3352822-42-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130812

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/python-zeroconf/python-zeroconf/releases/tag/0.151.4
https://github.com/python-zeroconf/python-zeroconf/releases/tag/0.151.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 92fff734092811bbca94ddfa3847a49ef5bea427)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...{python3-zeroconf_0.151.3.bb => python3-zeroconf_0.151.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.151.3.bb => python3-zeroconf_0.151.5.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.151.3.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.151.5.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.151.3.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.151.5.bb
index beadc0b3edb..4111f49a11d 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.151.3.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.151.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ede793c8b5508eab1acfad7c0c4e335"
 
-SRC_URI[sha256sum] = "ce6c548e665759b6150cef4db9ab9d7bdd89857e90c513abd6b7340bdd7dbd6a"
+SRC_URI[sha256sum] = "28c2ec9d772007eedf11b41a9c9fd3d5c684c17b00721ff8f1ee31b20ad286a1"
 
 SRC_URI += "file://run-ptest"
 

