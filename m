Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF18E9E2EA
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:00:46 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17414.1770811245839830874
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=la/x7sEL;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-824a9348603so30261b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 04:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770811245; x=1771416045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjFe/UkBeuZkkCP1TJKHRZW9mWPZvt0DcBW0hd0O7Sw=;
        b=la/x7sELHAsb0H7WnbfB23cxrRI48x6QpvPXlVy8Q1tzsqzUVU9Mi1gxi+lM7dX/II
         Rbxjz/5m6Rsr/qD4iXx5DN5zRWUuGAkDj3VfKPoCSDrax1LyQIusub/uSHU6f014RaaG
         5ekwllp48+aW/hG6dQ8SzAzPliQwzKgdKgEzHJSXpmov8wHDsENVm/lBqsji5ISHAQEq
         fRbJyapxibtE1FIVdCWFOVxCMTFShttWCA03TlAz6R3TSmuED3o0zavYLttnZb2DRcuW
         82NalbBrxuIjB4ofcByRbo8V3A8qQ+Rpb5W+lbs7HsPMTsxrnNj67l5ic2ctG/kRvy2I
         zwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770811245; x=1771416045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YjFe/UkBeuZkkCP1TJKHRZW9mWPZvt0DcBW0hd0O7Sw=;
        b=s+fiNLe9HOq+95RhjhQePU7sBiAMLCSII6VugGhbuiXNzuvuhW2Zi7TjgiMoEw36+A
         z+KtxQ+gY1+U40ss7U+4Irbfweg/hJDPSpKRjDlsN8KRqt59YgbWXC7KWCjWBh/QfFG/
         tcIRt6KP6w0pEagEL/wEWfbT3mbnhPymfAo1G6kAT7ueddVq/I7igRo/ExKBITWCu05M
         0FAEyqaCeit8QMYNOAlf2nqiYi+UMtIPusz7U/Ta1IG1A0bn9FDzUxJVp7nXM3pXgYdU
         MPdRERNJGYf0DOVrRJWQUE2oOJ6FrnQP63Z7tRaCQkwoaYqD0l6/H+FXgMQTh/t/lc4n
         hLWg==
X-Gm-Message-State: AOJu0Yy/XfIswJS1ra2fuB9Y2URpsl+I2W4skcJo4hwTrp8Sm+mjLD9Y
	qy6DzGQyytSQ4H1dYdD9FQNQAQK3aI0CzPOjV5SL1+htgYBJnv5MVJx0Ih1YuA==
X-Gm-Gg: AZuq6aL1jaVII0570ognt7e9F8nSaCESrxIIh9uDxolfWUTxCLeXYQn/Q3qMO+HLZfJ
	mzSXuoRZl3JP+9asS6uYqb1kaNmtQycuN3RIO3J5vqQqkp3edoxgm1FAZw30NxqQxuKeFi69Ugv
	NVIXqYdJANfne/xZvWMU6Nu/CnAjrpeSPYNG1Ipi7DzPnJtFrKDvGftZbN+prJCkL4UuLVmE9yr
	8ccXGLUUgEik8Yn0Nw4smk1ZDsu1H8T7CyZvU4u8jtLoS3GHElPILVEAHYMuqPcBMrbzMOOUTvL
	Yb3UikVQt2glXCTXcAy9xqgxMFvCYRcqE7REOiZTmb8ifyydvFIhWhBniqbRXjC4ff5UASiJtyJ
	4oRcymtuqsln/CeyGezNZ/x7QVNh0n31X1mIS0xFfcJm1QQqhC69pPrt/AYbeOejrvCmJMURoOE
	0EdmcqGASShR8yQP0N3D5K6lCwnD56GSc5ui78CKxWAfP+4w==
X-Received: by 2002:a05:6a00:348b:b0:824:a8a9:e08b with SMTP id d2e1a72fcca58-824a8aa009fmr232238b3a.5.1770811244824;
        Wed, 11 Feb 2026 04:00:44 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3669d8sm1805831b3a.2.2026.02.11.04.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 04:00:44 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 2/8] libsdl2-compat: update 2.32.58 -> 2.32.62
Date: Thu, 12 Feb 2026 01:00:19 +1300
Message-ID: <20260211120025.4190831-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 12:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124330

From: Markus Volk <f_l_k@t-online.de>

Changelog:

2.32.62:
This is a stable bugfix release, with the following changes:
Improved support for GNU/Hurd
Fixed crash if hidapi strings are not available

2.32.60:
This is a stable bugfix release, with the following changes:
Fixed crash at startup in Dwarf Fortress
Fixed crash at startup in Stellaris
Fixed mouse stuttering in Amiberry
Fixed the viewport not being reset when the window is resized

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

Adapted for Whinlatter to keep x11 in REQUIRED_DISTRO_FEATURES
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{libsdl2-compat_2.32.58.bb => libsdl2-compat_2.32.62.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl2-compat_2.32.58.bb => libsdl2-compat_2.32.62.bb} (91%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.58.bb b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.62.bb
similarity index 91%
rename from meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.58.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.62.bb
index 8bbc23fde4..6a7df6b2a9 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.58.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.62.bb
@@ -11,7 +11,7 @@ LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=98241180d857fe975e4b60d44d6c01a5"
 
 SRC_URI = "http://www.libsdl.org/release/sdl2-compat-${PV}.tar.gz"
-SRC_URI[sha256sum] = "ae85222c007f7e2acb927c7a47c12726f56478c6f3f35ee0da1ac929f8beb53e"
+SRC_URI[sha256sum] = "23019a3b0825e2fd3411901df3e1ae24c595cd57e20a345509f77472bd9000e0"
 S = "${UNPACKDIR}/sdl2-compat-${PV}"
 
 DEPENDS += "libsdl3"

