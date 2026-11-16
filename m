Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34355.1794851744740206503
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Kk9OAzsF;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so4635895c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851744; x=1795456544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6gKC3q14jgq20dGgcUN5/vZ+NZZoF4hoQ3YiIp8uAI=;
        b=Kk9OAzsFmyzaRwJ7wN+YWjo5Yc91f6nkH1bVHOxpyEyBrhbFYRZrvUDlDcQGpJQrkB
         PRen3yioA7vFxsVqhCyPDW3nDud5oypV222HwUAImBe+SYRjqTAk5NX+Ld/PVmxSGXia
         jg3/bwzFLzQf4GlLlZ1juCSkVLxYQ5bBVfocK5dJCspZhU+ZV/xB3OZg29XlXMpDVQ3j
         QCp63P6ktTCS2qMAqPFnYYecTK1LrFcasVYuC3lnaKPRgTeCVByty28o/uTFezb8uBs5
         OoqeGWb+EbtU3WaHL79Hz6KtfkLK8L5yCTns7VkruIBKjQLGfUUMPIW3zfD+aZikCwlo
         n55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851744; x=1795456544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d6gKC3q14jgq20dGgcUN5/vZ+NZZoF4hoQ3YiIp8uAI=;
        b=nZxPiPpqtRGLZVUPn8P/gET7hT6Gw/64DqpMMkX0FrbqmtmM0QZpQg4I6uWg9N1oGB
         2Hb0XXNE04Ikf6HTL8HMKoU3GfHP2ZrKnV9HmoB5Hj505BATTwoWzt+xDZcGAHGyJGdF
         LO6RFY9yXV+kbJBg1dc34oLuWFrLGJl6ct13BfDrALxIO1XAc0HPXxPjJyy8VbLy5zy4
         zYKiPNvXG4cSw3pAfS4rRFFiZmJ2sNtaZVDn1ffso8A/9HiboSma7f3iatnQq1YK86JS
         U5PaImfeBHZBjJ4CmMZtjTnhwwsDoLT0ZI6jkPphuX+uLiFc2B6nLfd1CIYTtmiyKV2Q
         ysEw==
X-Gm-Message-State: APuU4Z/ek1vkRbj9o6lp9NdOvppZ4hsX2bjA28Pz4+gE0Owr40Jkq0/B
	/fcoUMriVculZB18zQeR1tCAf0zUy8qXOnaKvaHuf7Q8mzTgKM4X86Fs+NK878KE
X-Gm-Gg: AYBFou2f5ATxWePy18PPiY6k7E3AfyKT/kM1WhAgdvy67mIk5q7g/eHl8nsrBumjY8N
	+MaQ2hrlP6X+4hfX3CMXew4HT2eeE+vIs7wPXoerpthkveCjnS38hvBID5QzUBxOHslmfEHS+UQ
	BMY0ID+xMW6R2dYPgW5HUVXJEsqMibElY8jtFO5cpc/BWNgEAhDd6d1MuhuI5F7WVbxO0FE3B8a
	lQKaKJowEmY1pCNpLhLgixL600hiW6HeRFG40zSzuJCj+VeJu4KkDkaSXpHRCcKhLl6D8YSu8Zn
	BzZBYGM9S/t3uJlJqrLTOqWGR7wiRPgDil1XPEBwuA2GZAoz03WMvFGWK/9ESbZlCYmW6i5dXfF
	mZTIBALj8oGyubLSAxMNgp1L+EgWags4IuxPS3nR9IlOi96ZaPgklcXBrI83D87OFxz9EwmPu1s
	pAQ+gwdmSB6kv47o2y9GEUCXgDGQsHqTiDiLuMVVfjvgXMIizepPwX4kNCXGMqw7Umg1/uZLs+L
	ILJTiktl8yaCKqm7oHF70Se0wv8aQnleTzASeh9jbZDU7iTeIn68ZT3vQr9Hc7Ll6YSZE2lBDd1
	Ll2Sju+Dwqej0TwwYS2XN6HYL2U41+0eIwcEd79pKuuQyM0CCWZK9trLpea8pF11Rocvsua29fj
	Eb9kCvvr1fOzphdbS8ytdRwPuDq9KIAiREFHelWVXhqVpc5ZwxMOMP+pKTwh39+G+DRBPljLj+N
	BM+6BZ/zeySmuysSSUX//oh86Ql5SjB+T9HbxkozBNN6XzW+ax4m+KMsddZtS/5xUFaleCYRcOu
	puIDY/MdjUEstGxDcaWzjtEIgkEqqn/dDLSFtdNgUr7T0LWot4ZVRCg2NOFRp0f8P0pSjx2uew4
	e7SPXpv2X7Wy5Y2AOvMuPkIgOw==
X-Received: by 2002:a05:7022:282:20b0:149:1feb:6da4 with SMTP id a92af1059eb24-1b5031244a9mr10143557c88.32.1794851743915;
        Mon, 16 Nov 2026 09:55:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 074/105] python3-pytest-env: upgrade 1.8.1 -> 1.8.5
Date: Mon, 16 Nov 2026 09:53:26 -0800
Message-ID: <20261116175359.342679-74-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132530
Content-Type: text/plain; charset="utf-8"

Add hatch-fancy-pypi-readme to DEPENDS, now required by the build.

Changes:
- 1.8.4: honor an empty native TOML environment section over INI
  "env" settings.
- 1.8.2: package metadata and PyPI link fixes.
- 1.8.3 and 1.8.5: no functional changes noted upstream.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ython3-pytest-env_1.8.1.bb => python3-pytest-env_1.8.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-env_1.8.1.bb => python3-pytest-env_1.8.5.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-env_1.8.1.bb b/meta-python/recipes-devtools/python/python3-pytest-env_1.8.5.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-pytest-env_1.8.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-env_1.8.5.bb
index c42da7c67e..9be0154347 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-env_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-env_1.8.5.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b70ef84b3d8d608b13b0287ed49df651"
 RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
 
-DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
-SRC_URI[sha256sum] = "996f86ad78b6c7b5335e0d493f9e9ecd3e421174e056742856f91da439e1cbd9"
+DEPENDS = "python3-hatch-fancy-pypi-readme-native python3-hatch-vcs-native python3-hatchling-native"
+SRC_URI[sha256sum] = "992c37efdc1bde2f0783975080ac4cdcea85f36df9d6fe3a835edd01a7e06584"
 
 inherit pypi python_hatchling ptest-python-pytest
 
