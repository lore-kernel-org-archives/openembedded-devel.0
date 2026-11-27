Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11828.1795763027718124409
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=nsg/7FIp;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f052ae3c86so41951735ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763027; x=1796367827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zeDD8OdTtpFDTTuwkJVLisD1I7993bWUhMGukOjalVc=;
        b=nsg/7FIpzrL57lyK8x9B0sXRDMbVSis84MJ9puBLxq+iisB9prwxl1hXl5eEfPUXF9
         knzQCrOACE6ozIZMzcq4N+nHMQa6758P55BTU3e+8mhINvgByGnCza/qceS0u0zHoKS6
         bPO1/nd6P/Pdg8wFTswhNjJXgMSGDMjcZFYykInAg9l5Lu4cdhUYZIbNVVn2DfwbGvT8
         zll6JcO4NRqoBsmEQvo8NC5ovgjqMWx5IUuvK0XRnJmUHRt/cWHu2OyyF4rlp2AsNu2O
         1CTv8nb8OAfxxkGNYgn3V8v9VVoaJ3HmFsytv/QY+hK5l4f+9/L8MTuu6ZjifUPWMr1d
         vlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763027; x=1796367827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zeDD8OdTtpFDTTuwkJVLisD1I7993bWUhMGukOjalVc=;
        b=dYreYZw8cio+DXgidSyJUnkd5rU4F/zZdmUCTDMXK7jUZ0OS52XqwJYcLSoPD6X9oE
         jPAiJ0TVVhtc6+v6bOnGhVZDCBK51bZ6+MkQ8h/hJlAHui8oUo1/tL055TZYU1FumvA8
         s0sh+40uONmcA/TRHjsdv1e5qepWt2DNlgwAAdO2FNAIySsuUWyrDShp7B/oWBIvjgPv
         9GjIE8cZHOxOUrOGS+44zJGQw0PdYF3pz0b7H1kXEPLuN46s1e1tY3kb8lxnv80MQX2f
         ZLEgi6C2NidslCobhAHt4U0AO1qrx8WD8mjcLZ0DNg/EXPXIGffURTrNsKWYUhLxI7gi
         ZDng==
X-Gm-Message-State: APuU4Z8nvs8Ykbwm30WGKqL3Ygyq1vnuV9XaA7r/PPhDIVO6zAgcqh97
	xfKkxDFTVdV0Fj+KgF5aEYvhonNFS34d1cG6jkxbmaRf2lcMldPcq9vupAc8eCLr
X-Gm-Gg: AZFdTZfHO2BQO3oR/JAEr6PYdjet6K6hfW/Ef/UJ9AQ1lv7B2xwx4MztdzYDD5RsJjX
	8W/IJpkx8VpsuOQZDtKrtB8hMik2zok4Y4a7mM63c4T5RpfmjAlnLWrt2dSZ/hSCsoh6UyjK//Q
	/Ke2B/oTmpIsHSsyoxoTzGPzBh1HvHyWE11RM55xpBcaMLG844gxvniVb8H/xRTkJIbzA+yy2u/
	KYfD9jGzjvuFftfc+j9PduJa94zMPkwSHYAnHuQH6bKK0xddayklUVBJx54P8vK6ka2OcY2irp7
	KQkqLuP/O+AJXygkhLVNAaINuFHweiai4T8g2nQn6Fr5+O7+7NW9o2Fmyg/zgBCubqk84m+CkIk
	yJhM8CUa0kQxtsikIh+vAq+5dQ7n/QuNUIN7ogG4DkylaWj1JXoh5v1vZJhX0rqBaKCCpPhfWJh
	WZJ2xoFwoQCnQPtZGCqkQo3bRvq5SsAkZNf+hf5R4vftW83E5LagFOUToC4lgEvqfXVq2LBKYCZ
	KnNSN/MRiCfqvNJ5OMR7BZ7Ywo0KDTpyYaSVtDuAsUsqYNJCgltzW1MduZi+J/fF42ImZ+n/ssG
	t2HZzasmavgqAqDEdR0VropePZd18ve6R1nULBV1ZybdUOAxVs3E+wZ2jelaGejambvtBk9vLQP
	e4cXA/vyflOIn5eK3ycLZedxxjo5glTKsZq3ND3wUcXYNgkMN7HPzj0pcfudLM20qJpkh55+34T
	TtmEnxLdg7YOCuHMZkXkXmre5VPRVFwofyxP46YkR1aBoquOea5RgTrFTVtMBGjXRLLIIeNIvFd
	GBkXO9e38QMzdcNlyhUrhRzat27OpDRsmDgjR2SizFjS/vVy+h/OJHRicXCR3fhngwbu2X7fF7y
	oH0j
X-Received: by 2002:a17:903:298d:b0:2e9:740c:36c with SMTP id d9443c01a7336-2f03f1ba67amr233939605ad.41.1795763026967;
        Thu, 26 Nov 2026 23:03:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1482c3sm112292155ad.73.2026.11.26.23.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:03:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 2/4] fcgiwrap: Fix upstream version check
Date: Thu, 26 Nov 2026 23:03:40 -0800
Message-ID: <20261127070342.2403582-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070342.2403582-1-khem.raj@oss.qualcomm.com>
References: <20261127070342.2403582-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133366
Content-Type: text/plain; charset="utf-8"

The recipe tracks the master branch, 18 commits past the last tag
(1.1.0), and has no numeric PV, so the tag check gave no usable
result. Check for new commits on master instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb b/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
index 7aa28885e4..d27d93037e 100644
--- a/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
+++ b/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
@@ -13,6 +13,8 @@ SRC_URI = "git://github.com/gnosek/fcgiwrap.git;protocol=https;branch=${BRANCH}
 BRANCH = "master"
 SRCREV = "99c942c90063c73734e56bacaa65f947772d9186"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 CFLAGS =+ "-I${B}"
 EXTRA_OEMAKE = "VPATH=${S}"
 
