Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8084.1795739725396156833
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KJ8VIn7d;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so4103952eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739725; x=1796344525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MgKNUAHKOSKBfgdVX9RBH0RwdWqliTw3FJlLrCnX21c=;
        b=KJ8VIn7dE+cwwOXEg3q2U6mbDKOJA/a1Aqj4S1EKKTHK8x8jlFTWhzFIhogVQ25dP2
         aB4OmFN5IdXwucp1+4bcgUlfrrv2qUuhlBVkKoS2DV+QC/wJ7jC97UiXsYr++KsxH+Nc
         p1fgnMhz9TL4ZaIrCWUwuDPFNYMWx8StK5nxMV04tpd/HAlJbmD+d73RvYDNJUuhQxks
         uGoG+Rdl0XMcjw0f3R8Nipq2vprBE1MrTI7EUxATRIdAJHSacgYAaeyyNlRvA1GFBOPR
         fY9UOLULf/z0PxyXTsWPQVWSGp0e5FwnW6eAS01VcaIpvWEz3XLvDj7/TD/b89NzsWbT
         h4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739725; x=1796344525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MgKNUAHKOSKBfgdVX9RBH0RwdWqliTw3FJlLrCnX21c=;
        b=Pm2gZEfdGAH/u2L4cHK6hr9+S2aVGYd/c87tcD11R1ZVOAxgEneodcgue3Sr+h2eEM
         thimBWViJi0uIwXbF4/4DwJ3Ix5AaO9xHkjWZ/0HLXHjUVCReKnECBjALIOGhCCIfmGr
         UGrnbRUD/wLOTkWwkhSBLntohijF6S3/ToEfzs+mwbi7i+R3+KC/gaaqImp7sAObVAXL
         ErwOoVNjCSrc3uVx7ybF86MVmxKXpWKDsvw3AIoZJZVSBOm/6slYp3JE/F4LNKHZWE2U
         e8rvwBiofkfPeridwRSbLf86zCarRjsew9+qY4GZcH10w4qHLupHY1efuUz7e7DWtfPy
         WFRQ==
X-Gm-Message-State: APuU4Z80d57T83vvdr5l2s6K83fLl3dckvZrgmzxEkZkTUJHecTgDLwX
	6HNnQe5ipb0N6JsGamV+aGhx9gXFe5UqNpKieL2hNO6jO80rMnOqxlwjhlsCyt3R
X-Gm-Gg: AZFdTZd2l/Y5JW6VqVqs9Ormce6cbfIPkzLZSoOxLI73rtkIUrXK67waaJL2SVt14Bh
	n8LdHsuh57uZF4r5LJASsMQoGwnmrdFvptFKq1zxPodO9LKXh2K0+bignNdTD22Zvy30X6PR7Mg
	KgLqB3+S2cvjpcvefp9cw8S/dLS1cpexbuhUlHzKmjS8J7BRm+LvenMaLpP3iEXyE9Wg8e7Q0ej
	26EvX0GX27tbFLvzqRxCSLcOLRV7/Ypb73u9mUHGqgUM6cZ5ZP8LKULWDcRxKCZKZxpyFUc6iSK
	tVrP6S/vHsHOLeqOMX4i2oRS1p7okdNxFdYpGSFDHKtEHatPl/amiZz+r+qw+sh1+Q8N+AfKOM+
	4uLXaJkvp3P1Lttc9LXvF8u2iuideqHiHxJkjJ+gcU/UnJWa9pYxR/H18lpi+Ym0M0knXoAed8w
	YmB/6LcdMxcno2fSgZaCJyBd/Fo/BIwrlzrL5uV6HMRDlgspbAoqNL8L4R0uLbUcmv+y6oMpEqX
	SOhOSU4h7y9nm0H1hKNOdvYlfKqOw5SbHcOW6mOwGUzfaCucVRFE6Pd7wLO5xkg4lPhQYGyIL1a
	6c27OGkdY3fVxrOCsAjdL/SLwBLKqgkxmM7AGKAap+3H5UBOZ5xOfwP+/50onDFN3jkyxQ524FX
	dCvEFivOBwJzcVoRditg3sc0Hhkkyuip7XNWHV3q93udzw1JeJnCBTnxTVdXNYZMBM5AGPaTP37
	eTcOzefJ5RUyHycpKv+7Pon25W/D0ZCCXC2VNqdDuEt5SeCuw/0mAzNZqDfheEBlyTpLbMHjS35
	/quRHEkhsh4MD9H9qWBqn14bp4U+KCIkI7dlXn+VxN22B0n3ejUzX39Wf7ZjwAGOTglA/voxFTw
	8+Y0
X-Received: by 2002:a05:7300:ce11:b0:384:fe97:8ccc with SMTP id 5a478bee46e88-3856fb58443mr25211852eec.29.1795739724735;
        Thu, 26 Nov 2026 16:35:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 52/69] libgpiod: Restrict upstream check to the 1.x series
Date: Thu, 26 Nov 2026 16:34:08 -0800
Message-ID: <20261127003425.2166632-53-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133152
Content-Type: text/plain; charset="utf-8"

The 1.6.5 recipe reported 2.3.2, which is packaged by libgpiod_2.3.2.bb.
Only match libgpiod-1.x tarballs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
index d43fe90480..c28483ff7a 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
@@ -10,6 +10,9 @@ SRC_URI += " \
 
 SRC_URI[sha256sum] = "ae280f697bf035a1fb780c9972e5c81d0d2712b7ab6124fb3fba24619daa72bc"
 
+# The 2.x series is packaged in libgpiod_2.x.bb
+UPSTREAM_CHECK_REGEX = "libgpiod-(?P<pver>1(\.\d+)+)\.tar"
+
 FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-1.x:"
 
 inherit autotools python3native
