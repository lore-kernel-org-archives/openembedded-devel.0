Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2528.1794961620744233011
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:27:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WiqBFGhl;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-381d542bc29so871312eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 16:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961620; x=1795566420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26vA+Uw1JP8y1DyWkGiIqYnA2NWKWZ8jKRVAmGk8A1E=;
        b=WiqBFGhl8X+G6RGHJUAmzoYwxKYmn2JOaLDzepG+88rWeQkUDAwKczdfJNm0JYrf9j
         9pZ1k8AjeANacKOMqseL+TTJpQV4g9O6h5p2xOQHslZImGA8+pJXN+k/gDtp9kJtex1D
         XWXCbI0diEW4gHmUD3ITl3miSuDVFDVjiXO5SCGO7fvXLWhu7tEnhPhKyT6o0tcW6GSt
         uHqqiev9PVH7FUKJTu9a2VwBsM2fk71lqee7Ho1Bw0FQNMSj1ZXlKTfGPRH6gp4GbjyH
         8O+AnntyHFkbp9LLqRRkcPHAJ7YnabHuh5qj/SIpXrNS5/WtnCw56V87u4azAh8Rt2/p
         YfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961620; x=1795566420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26vA+Uw1JP8y1DyWkGiIqYnA2NWKWZ8jKRVAmGk8A1E=;
        b=LOxwRz/31QTuCmOSxV+4nRwMXdVsq/GbhVyLMGlrjLIXep4CKmKH8pAUB6vh/JScmB
         6x+OrZA/ZxfL1xPPK7Iu7GUjGc8qJ1I2xjoyqeUrauSC1I+IZAKOgaXmFWYqOM1Gp3wZ
         3alyhZ4vvwYXucSkCdyCvAB1c0kOjYfVEzrv+Qov64RgLOUAR+14L2t7OOouVOsEOo1C
         xjOD44vqMOq6KQ1dE6eaduT3QeZ6iyOO0Ko21sbfHfHmhYZP3EpOlZMSbAIj9Ad7ODzN
         ZlQJ84OCDMdR4tw/56JjgPhoB/hKHHnPcIpUD6uv3wqrIZ/hSVQS6D3PXW3okB0ejo1z
         3V6A==
X-Gm-Message-State: APuU4Z8cxSipD8U2s0uYNXk88MxZ10Olz6XJbOtsx8gvk5tzKGrmOz0X
	+OKeME01LXJXfIgjzs3YnWfaQLQNor5jRsBEAsXV9QuKYkReN/3c/gqNYSJryB3A
X-Gm-Gg: AZFdTZdynIbIfmEg9c6wzSlK9pNTOgnfj92oBFZNsWxO+vvJUNhuwdDoUAtaLnDf6PD
	g+6Eu/Oe0PuD6e954rJAt1FEO3LMmsqtuaYJNARa+wEC7mic5idh2tHKUv/IgxUsMBF84BGPyJC
	MwJ+gcIfFmxeZu9dBSXwhWqR4w6SwheqkORB2/yeJIfRO/Q+fs1EOjjD6P4Dk8dtbyV5iqyUJA9
	v2sGNjZmQlxpa1sD/x+iaOx1ebNYmBf1hEDEJOv6GE1ypvdkEXhDLVF9/sCh7KmgKWQdVRMi4um
	gMODgi+P51gk6qhN5qHVLE4xRRyjVdNqVVFFge3SbHSQbHGdk9dKOAjvtxUQzoLFOVJo/7zBEMD
	jeeWZXSRy5C5Tf5wiNWZSjWvqepVabL6yifvlAzU2+kChCns0dfZje9ih7GS0QFmnUz7NloxoSm
	z1H4zSqQE39a78LzjWQd3YtJszDbywcRLVlUU3EBu+UmMrgl/WM2ZrcbxKOx8euOHYwFYVQKA37
	71g9ZvEbpniZy3VY7XnhqNW/7JN6aiAzWJbIfpZkJnYDkkVifHL/RfYXKuFsqPTVlww8ZQnz8/A
	JVuOG+Z8fs6dOJe9X4dTClQ5SndBfbZfsTO961M3kxJXfVRt3iyg5ed/Y0PKtndAeM1JmFr/igY
	u2ZgQ3RnfiE1wJN8IJ+GbdUAgZEOsw0SzGwi0GdkXP87t/M7jFeyhPBSiTsfs0nnML+CYqnwcCf
	E9BmD8SjvZq6SD9rpQncSKM/eFSy+5017dXYfttYxqv42z7apz6pXQRlPatyC3mIcEsWbe+H8oW
	sK+62TyOEbsNEsIWLtwZBRtgwg/GX2+/xTOd6rOu5AcGVb/HLBiWTL5S1giZLYD+6jRADDR1663
	/tJe
X-Received: by 2002:a05:693c:415c:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3827dd05a3emr1134030eec.5.1794961620014;
        Tue, 17 Nov 2026 16:27:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm1697015eec.28.2026.11.17.16.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:26:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 13/14] ttf-fonts: Use SPDX license identifiers
Date: Tue, 17 Nov 2026 16:26:41 -0800
Message-ID: <20261118002643.29829-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
References: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 00:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132614
Content-Type: text/plain; charset="utf-8"

The layer-local Arphic-Public-License and UFL texts are identical to the
SPDX Arphic-1999 and Ubuntu-font-1.0 licenses in oe-core.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb | 2 +-
 .../recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
index 1fb4cdcf78..080e5ac775 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Unicode Mingti (printed) TrueType Font"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/CJKUnifonts"
-LICENSE = "LicenseRef-Arphic-Public-License"
+LICENSE = "Arphic-1999"
 LIC_FILES_CHKSUM = "file://license/english/ARPHICPL.TXT;md5=4555ed88e9a72fc9562af379d07c3350"
 
 RPROVIDES:${PN} = "virtual-chinese-font"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
index 0387d53ff1..d33130c35d 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb
@@ -2,7 +2,7 @@ require ttf.inc
 
 SUMMARY = "Ubuntu Font Family - TTF Version"
 HOMEPAGE = "http://font.ubuntu.com"
-LICENSE = "LicenseRef-UFL"
+LICENSE = "Ubuntu-font-1.0"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=325a1a9029112a2405e743c7f816427b"
 
 SHA1SUM = "0cef8205"
