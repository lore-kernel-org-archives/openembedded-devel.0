Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11806.1795762977626174358
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jw1Adbih;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b487f44ee0so3201980a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762977; x=1796367777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipkA1ufUuF2sW8ezXXkPjbiVpRu8jYSAzX+zpu1cNLk=;
        b=jw1Adbih8z1b3leqzolEEO9i5tj7x4MACdi1lm6TF3Sl+QldiQQubKsorIo1XbpBL+
         I8rw9E+KA2yMPXeWZJFKIlstXWB99S3c76B1l5J1Vk+F23uBk2aEzkbV8KojO9Y/39xJ
         b+bD2BBXEwCa26QHWUYoclXcEZa+NkTPJtSZUj8ZbTVWKwYdEIqKdWQmnkI5SiiFvl8H
         1xJsD2tLUXFmMwoAi27z9pAZgAvEbHVQ3PvS9jIPMQKgNnBsTblDsF+Ah3+KHDIzFQpL
         o+s+DzMhjjJv3lDr59OQ89W+tszPd9zVWpkex5I9uINB/22ELvu8CGhA8915nPpSiJx1
         ZVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762977; x=1796367777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipkA1ufUuF2sW8ezXXkPjbiVpRu8jYSAzX+zpu1cNLk=;
        b=ETUuxJFO0nMOH61YWmaImbvw/SUDppllIRz6WdkRX5PI0KKRInOUNGyeJ2CKcHvcLL
         b8wndWoVCP6ZqhIsKb3uzlE2iEZte/Y45GvqjWh8pT8lqlsbndLytK7kPUEqrbLLiCJ2
         gAx8rKMbz98QbzR6Ddhf0filVCV8eO1N/aGrPRmtakLiBgDsGe37aKy4PslNQ6GqQn/D
         /V2J3/p6nzKnQIXEf/n49uwODEmiR/yBcgd4weA4Ya6C7UnC+mVk4Fg81TwVbNGNlJaF
         VN186tsMNpFq8P4wRYaJY1th9kKGvlrIo52GTk9jVHxwx28xSScvcifooTJwGPWOM0Y5
         N3lg==
X-Gm-Message-State: APuU4Z8TWFxYsBZaY0XNtrE99MI5e7yW94tVBl/xQNf+1pFkLC5bBJr+
	PWUBnprmdmqUYVsOvSfAdpik6A9+YbGJCoxzjXNoj36anGMYn3gId4uppFE9Qzw+
X-Gm-Gg: AZFdTZcAFTwxn7P/GBy8qRg6RgSJTKif81LjakQ3Hv6FwLtIlPKtwBPSBnXcGIsXcC0
	zdLm2+UxhxuiwktbBkxRQr2iFUSBvA5bO9jg56Tfurejyz/iU4rwlmimVT8NSM7zVJnZJR+7JAr
	KfIpONYcB4fb+6yPydIqFAj+f5gPSSJlIh0PctgoDES4rTQ0bUVvk+knVZNP4bjjDAG0MZOOfgD
	KueG7p+oQtHoOo2iaw08m+UwPiiCUNvYXXpSx1ZW5EMvYBglepSeMxZOgcsWpDVNIsNdDuyh8be
	G32p/0tuh1UYnpEQqV9J3ePt5jSmNY4QikrNaGkJL6DM9/w9pMOi7sHKCqbNVKPKPmzAO4Oi3/v
	fyCMm/9x9BjZEzk8/0NIOpY1TBdxwrbaCKExdb54WSGhI1mqz8i6ugRHEHiDfm0NOKG5GPeON+F
	UmhFMlQDr5ivurZQwgp9Gia/1EjB2o+8XMu0MPchvhabei8p2oH2T+X2Ct44OVjkImRm5NQUkfi
	Il3tvwnsaeHc/bsGgc0uJRdhPXY/vK5LQuOiC7yI9PUvU04JT4T+2j1G+mec0uCK4V7HBX6IheA
	TEdDyGiwwbRi1MjA2Qo2RbXl5k1ilXjSTkfsERnDEk76bUI+QNAtRmDxAnFRZDIgjP4VmwhZ6/B
	qvRQHRw469ryVCHpZMBmwV7q4Yk0rQAUR4aEBk2DkoAtAl3ORGbiEtN7a9su4FslFH5xmz4WTBd
	xWrJpSOTdjg+HPBqN485nGoS6UsFmSWmdU0Tg3CyvwmLVXBPPlyDun3jxBIZgMONMNR065Oa7VB
	Q3J2940/ZDOpjtPlHmpOfYDpFP808/NyCQvhMKjpnx1L7nnHbpLunC3E8nHyMwqOv21px6YBQgh
	fXvi
X-Received: by 2002:a17:90b:250f:b0:3b4:f648:c416 with SMTP id 98e67ed59e1d1-3b4f648c518mr5978547a91.46.1795762976819;
        Thu, 26 Nov 2026 23:02:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm36464914a91.15.2026.11.26.23.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 1/5] libisoburn: Fix upstream version check
Date: Thu, 26 Nov 2026 23:02:48 -0800
Message-ID: <20261127070252.2364951-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070252.2364951-1-khem.raj@oss.qualcomm.com>
References: <20261127070252.2364951-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133350
Content-Type: text/plain; charset="utf-8"

The default regex stopped at the patchlevel suffix of
libisoburn-1.5.8.pl02.tar.gz and reported "02". Match the full version
including an optional .plNN suffix.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-filesystems/burnia/libisoburn_1.5.8.pl02.bb         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.8.pl02.bb b/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.8.pl02.bb
index 3b3b19fdee..83c36b73b8 100644
--- a/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.8.pl02.bb
+++ b/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.8.pl02.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
 SRC_URI = "http://files.libburnia-project.org/releases/libisoburn-${PV}.tar.gz"
 SRC_URI[sha256sum] = "a977b03dc3686d9fdca600458b1578f9cac2b875609bd5ec21f5ada55f20ec50"
 
+UPSTREAM_CHECK_REGEX = "libisoburn-(?P<pver>\d+(\.\d+)+(\.pl\d+)?)\.tar\.gz"
+
 # The patchlevel (.pl02) tarball unpacks into a directory without the
 # patchlevel suffix.
 S = "${UNPACKDIR}/libisoburn-${@d.getVar('PV').split('.pl')[0]}"
