Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33661.1794851704329708651
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=j0m0hI0f;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so7090134eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851704; x=1795456504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0PkJ9UHCBavZGOFDlEnWcjOCqt5xZmJUGMByMFuFGM=;
        b=j0m0hI0fus0io3kB0ZVL149jYtcZkbPFo4TqInO7873Q/EBDNj6vhyEkr+gzRyJYWm
         fmO3qmFPnThB2KyzKfoVNy86/gMy5F+wM4WppJSAdQZKDtiR8oXjAvcOS3inPm8Bj4NT
         BZrtTS3pAIRaeAY3ho1uWQadkvkya+gkRg9RsHp6X/MIhIOWhaS9fxqkuGu65OjHbnRh
         XCW2IuQFJEEV+fS2+mHIJWSYfjVTNTsg0ZAAeXLkbYxD1IbgRIlMP/DCDB+WX4QXDho4
         JrBZg0dISM6V98UOKAlR52tZv3urH2CPKFsJ/RnSKvFMCOYzONNOgNiEYdLs7sKVSW0/
         M7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851704; x=1795456504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C0PkJ9UHCBavZGOFDlEnWcjOCqt5xZmJUGMByMFuFGM=;
        b=JwLzzOlUtXX8RlZN9OOeauHFKokoSafTkqYf4hiNDFJmeOCUfNd4PFxRVL8Ycp58+4
         zqJw2bj82ys+G7BX2YhCBO2c5B2OyU0hiA+ONJfcl463Uv79f+3CI3q7h4Is7C8lpV3v
         Mlx/DQ00HpTdsZc+Sx+7hboG8OGdaYE1iYPtAjbKgR5VnUDq3/Hn+ThSRxMqOtB721W1
         hhnOnLiOi2SfinY7YYZgI4wLxzXGpyNLWNrhr/yjMdbjwr7ZGCIcidVr3v2WvA8G6YBU
         hF6xrLdTYgnob+WgsgFdd2Zst1Mceg0SF0FSyqJX3VPBXDtObAuna6n0dBqkuwlfSE6I
         sxPg==
X-Gm-Message-State: APuU4Z9yI1UMQbxa/BChtVvp5/zJYu1L+JobNXi/WXnkVcdT3c7XiVy/
	t1AI3Htpwt7tA5Qa48WSb3qeirBltJHjWeoU3R6kSeBMUI6hVCNpIw+SchHGq6As
X-Gm-Gg: AYBFou1VwkI7hcivuvZnG+wDuQSgKwIeVyAuBIBB/dwsKXlvKvjxuAyK4jTACkxOUvR
	NQHf1TPB3+fADs5G37ebSCmsXx8R5UB3fSZV7AtokL9A6GGrF+yS7wYSXT5SUOI+sK35RZEAmyT
	EhacqasRXmJCwTxRFkXocPeeUUbvXAxi1VouSbLi5ZSpgdTgUqnlmCCwf1GnXR7qiqyP/J/kRLO
	hJSjmGjvqCSdRzi75qRT0/l0pwTrGtqSRzHdISj4HsEVMu/WZyiAp7t7t73cod518v3XOWKNZHr
	IJIktIuuBgc8dzvtsDsGwgeuFMU1LsoyEG3MYawD+sopQ2tvnFOJPhrLswc8t5gkGxIJzn4yiyb
	1b0rUcPKTj14e9FOcV5G0IGCYE4R+jtRnpgGkw2gUn95ys+jNooe4YJ6qvc6HPlFE4ew7vWCvZD
	IfCnP/NjGSNj/ziJphVFaq3FU6sC8yxikzdDH+AeRy0VgSW660AcplVXWstbuHRHT4dwUE7hOjz
	+xPabi18+5nDmU4LMN/ydNfcjdBE/fBesSxiRrd5X06a42bVu3eavHFf285IuRV1c4w7re+xBMu
	DkDR7MgKCSOs0H7kWqZASwDZ99X3LXDjgRZkPMBmFafyPHlntNeObtCY58i5Fvl27X3htLE2anZ
	FeeKJB4CCiN/+kHS/othRjz0lYA7c+LeAty7ZjSnB0qYcTw0a1e8DE7EQbSnu87jc/abyaYLJDI
	KSomTjsAvEJWSEWNpc/SU9O/f5OFMkEB9z1Q7g8W8lcQ3bH3hFrxi/ZGN/lQm7t3IEIBryVOHU2
	s1HsSqkZwjkVtxicF613eGiWJH5J0jkqBmJ21lTHmpOJa4xnpA5PYHbaI0jEbYAxwquohPemtD9
	rgauDg==
X-Received: by 2002:a05:693c:2a18:b0:36c:a44c:1763 with SMTP id 5a478bee46e88-37967316347mr9720242eec.32.1794851703575;
        Mon, 16 Nov 2026 09:55:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 043/105] python3-isort: upgrade 8.0.1 -> 9.0.2
Date: Mon, 16 Nov 2026 09:52:55 -0800
Message-ID: <20261116175359.342679-43-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132499
Content-Type: text/plain; charset="utf-8"

The build requires hatch-mypyc although the mypyc hook is disabled by
default; drop it from the build requirements. isort now imports
mypy_extensions at runtime; add python3-mypy-extensions to RDEPENDS.

Changes:
- BREAKING (9.0.0): remove logic for deprecated options; add Python
  3.15 support including sorting of lazy imports.
- Build: now compiled with mypyc; build requires gain hatch-mypyc
  (hatchling backend unchanged). 9.0.1 restores "python -m isort" by
  excluding __main__ from compilation.
- Add separate_packages option and --forced-separate CLI flag; treat
  private stdlib modules as stdlib.
- Many fixes for comment placement, wrap modes (NOQA, multi_line_output
  3/5/10), float_to_top, CRLF handling, reexport sorting and config
  discovery stopping at Git worktree boundaries.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-isort_8.0.1.bb => python3-isort_9.0.2.bb}    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_8.0.1.bb => python3-isort_9.0.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_8.0.1.bb b/meta-python/recipes-devtools/python/python3-isort_9.0.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-isort_8.0.1.bb
rename to meta-python/recipes-devtools/python/python3-isort_9.0.2.bb
index b8e32a5563..ed0bf770cc 100644
--- a/meta-python/recipes-devtools/python/python3-isort_8.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_9.0.2.bb
@@ -4,17 +4,23 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=197c46995787b46a2dbf0d519c1754cf"
 
-SRC_URI[sha256sum] = "171ac4ff559cdc060bcfff550bc8404a486fee0caab245679c2abe7cb253c78d"
+SRC_URI[sha256sum] = "d2298980ce44350f11d9d24c8150eaef1883431ec203dddbb4e9b5c3ceb54c70"
 
 inherit pypi python_hatchling
 
 DEPENDS += "python3-hatch-vcs-native python3-hatchling-native"
 
+# The mypyc build hook is disabled by default; don't require its plugin
+do_configure:prepend() {
+    sed -i -e '/^requires = /s/, "hatch-mypyc"//' ${S}/pyproject.toml
+}
+
 RDEPENDS:${PN} += " \
     python3-compression \
     python3-datetime \
     python3-difflib \
     python3-email \
+    python3-mypy-extensions \
     python3-numbers \
     python3-pprint \
     python3-profile \
