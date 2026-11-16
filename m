Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33672.1794851724307446045
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VcTtysit;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37071c0f42aso5534111eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851724; x=1795456524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BYLH6xD4tXwXjatWbD0AZoP47Bq/vanh0fEYpMxnCfw=;
        b=VcTtysitNaN9VfwbUpxoaHUzdL1Ml/b+WVHumMdp1hhZRORihNXvslFGBAEHFEUsXk
         O6uyyx1lJaPFxSE7d9rEUGZaBkH3oUm3aBExdLl60QpAiceTOk9vxfE75cTZnLSE77x4
         Ooa107qbHTVbrSAwv0sCx05/OPVGnoyqQTxfpsd6huYEO86rIZLoaoBuj1yLvV8B1D9P
         5PfDMZxxBc8scj764Y8K/xVr+V7LaZ0XvlJxznm/FvQ18rrE2J3W/eXZ+GdFBmex51Ok
         qGffW+URkGrzAxHdCCKOBrYGaYL46XnVBKvZ6fzzI6drRb04qOB003JwDkQmAk8LIrUM
         hi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851724; x=1795456524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BYLH6xD4tXwXjatWbD0AZoP47Bq/vanh0fEYpMxnCfw=;
        b=fLOnkrKMkxk7xqhaV/018O2sN26q4Bpks+9849lPRvNfak71LXiIzgr+1K4a3b9VgB
         pLgey9210lNUZcv61uEoJ4dkpyBBAc+FoQkyRSJGJNtE/wELP9hgf/xpeOWXz7UMLeGq
         S/7rsl5kRc6vJWv+aoKlIQBJpt1x5kiSgu8T35kOi39Qhv8b2Kdepf3wGOSKwBqk2QuV
         j/nYPqNX3rls9VroA6JHIS+re16RFzLYJRFTErq2IXLDnGnDvMNLlBdDTLnAoG4Ohalg
         2yjJKj2FVq+XY5D/8a/rjMKJtqdDTwimTBvBbwCi1CUEnks0gExXK1XFQyqwp/INyHrd
         MdIg==
X-Gm-Message-State: APuU4Z+g1nEVS7DXt4Aac3Vivt0pHZH+5NT6470sm4FcDL1qWMSeHrZ9
	vK48hxQ2VDiknxyw2QVym0B1j8+GuF8lw0F2XUqt251tZVGQ7wMv//6fnWov5rUg
X-Gm-Gg: AYBFou2zZfuo7pnzWgvPN9ITrkwOx+uHKiDbQutMOb2mtBtRnJ4GQNvHp1wRO+iDd43
	gLo/xSpqsbYLiQxq1pkBPUCY9mEm8V8YWnFtx4qbUJyONLPtf3TFzer8+Wv4jlzloK5zYP+z4e/
	MosQZ7iSIlZIIhlPG6gR6ZB9/YaatLNmicNWziDfGr1+z0FtL5oxVeaa+HBjOVdNofYdUIt1kfm
	Yodvxz2URytb239EuopeEOYbLSl+jZbcRb4m+xXSGkCuhnFngKxl1zP/GQ2SanEybTPEPpprzEx
	y2axfLZfK8rMvzCvA3sHjnFk9xlegVMVG9n/I3ZcPcOrbFG2n1cqfIXIeuV4DG/qaecakLXP1fK
	2iF7zFoDUcQaLk59PcChM+4cd41j3W/lLemUQMXfalN51xodaTpo4ZNKt49bskvZ6+iR5SByD6I
	xHCu6ulzzJ4vMUfsgZpDT3B2hn73KhjvxdUD3NARNOK8xOVOZmxG/yWJiv8AtBN4i9FXQ3csC+Q
	Zz/UdtBlsYgjH3hHRpDl8R4aztiiqs2AwreBn7/Uy7549MiteTPOkljVguauxxLbRX2ABbf5FFl
	viZI6IyIm9jgstryIlvsBuwwl8lpiFRtYvKQ4VBYhWe8xa9WtzvfEilrnlIH96o5f/YkcEw+G6+
	YIfujZk8BzNLbj/BcFnsp4b6fjHbMzDzRzd3ku7Ro/BvpL0Bt4gMl/B8hrKM7fGOAzqyWXxWjyk
	5GnGPZc+NLOEfXdWB1tBxsdY/bmhRrR+h7RlOTP7MD/3UlL2BrErIkd9DVlHx6Ej8tkyIhjRl7U
	aYaS3s/FZHM+gDirohhM5iV3kSzr72I+8XzQlrQRwv7VRgwFoP1NOj+tWEsYcSrXf0vSHWaLC/0
	eKDy
X-Received: by 2002:a05:7301:2a9c:b0:372:79a0:e8a3 with SMTP id 5a478bee46e88-37963374fdemr11342874eec.1.1794851723551;
        Mon, 16 Nov 2026 09:55:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 056/105] python3-periphery: upgrade 2.4.2 -> 2.5.0
Date: Mon, 16 Nov 2026 09:53:08 -0800
Message-ID: <20261116175359.342679-56-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132512
Content-Type: text/plain; charset="utf-8"

2.5.0 is only published as a wheel on PyPI; fetch the tagged release
from GitHub instead.

Changes:
- I2C and SPI transfer() can read in place; add SPI transfer_advanced()
  for multiple messages with deselect and delay options.
- Add MMIO read64()/write64(), GPIO event_clock and debounce_us
  properties, and LED trigger/triggers properties.
- Fix blocking Serial poll() with timeout=None.
- 2.4.3 was a re-release with a fixed wheel.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-periphery_2.4.2.bb => python3-periphery_2.5.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-periphery_2.4.2.bb => python3-periphery_2.5.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.4.2.bb b/meta-python/recipes-devtools/python/python3-periphery_2.5.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-periphery_2.4.2.bb
rename to meta-python/recipes-devtools/python/python3-periphery_2.5.0.bb
index 3a3372d9dc..f777bd6e1d 100644
--- a/meta-python/recipes-devtools/python/python3-periphery_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-periphery_2.5.0.bb
@@ -4,7 +4,8 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bf8adf497db13d58fece90db6850816c"
 
-SRC_URI[sha256sum] = "9b334a31832ba64f74aa72700ee5fd6452d79d1d1fa6a0b48333bdb716d91575"
+SRCREV = "e82b08df1cd0f438d8a88d7b82b58dc8afade531"
+PYPI_SRC_URI = "git://github.com/vsergeev/python-periphery;protocol=https;branch=master;tag=v${PV};destsuffix=${PYPI_PACKAGE_SDIST}-${PV}"
 
 inherit pypi setuptools3
 
