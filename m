Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33645.1794851683303375344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rzlO7IAe;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380b40319bdso864133eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851683; x=1795456483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDxw5SGIqWTDVi5WSY0q+a/53i/kOn3nX/VWLFZ/c/c=;
        b=rzlO7IAeRkroKpg67tuLd5p9KBBhLT6PQVaYs/iaxcCOn+Loovg4ndLh42rexyWX46
         QSCh7GKRSSlaTRSf0xbh3duZ1gIPwH+u5KiaZZiAxtmM9ZXfIRmrQJ8+/WfH18NiGHN0
         UklkKfdyPaa+kARQHr+fTh/8+4Ry7vennwewuoXZsX/66o+Qu4JlmxU3ipDWotdlbvAl
         qJudKxyawRv8qy/mygOaPGcYpGJ1DLTCKhk5aA6RytydwtMcE6cc4h+gFK8W9H+ufwmq
         +ICZHQU5x8a5JhcDt1CuGVmmPOoZy2srl3iPj7bwfkQIDki/cmvedB7eaHbCaGVHHpAQ
         QwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851683; x=1795456483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDxw5SGIqWTDVi5WSY0q+a/53i/kOn3nX/VWLFZ/c/c=;
        b=tBLdxGUbzhmPx8aZDDpaKhXyLeeu90wZl/rUV1Tqq28EYv87J68lfhq8J7LSzf+No+
         PQKG9NW3RTHVLasYpiDixZV+oJHeLysXEhvOBqRoKcq9gRe/7kBJiAloSEQzI0uc0YCT
         o3Y/6iG1HwH/3sTyCZxvj/lBNNCPoNJg0pd+ff7x63Oep1+RhztvneO9gpbB8x8zl7aG
         rQM4gYYffGoiln/tfnJp7T4yc9DPf8Hu2FRFKbVz+iBXOgo9dWvzpy+dIGhP7oI2QLXG
         XiOUyfi1xX5a2U28/ieZT7RA7qToXun1PuQ8LEF2o9QAns9INp9yk1s+TEDMv/FSDZQk
         YAfg==
X-Gm-Message-State: APuU4Z83iHkefgJ24dNV6wj4nmkMtJVitK13h0vczfY5frEKE/Z42CfV
	orIcFQne3tBacyX4Mx09ddXCsQk88ifN/wgBcRuLL3kiGvLRQQg+eH/vwfjt4zUk
X-Gm-Gg: AYBFou246+aGWgv+olxyaej6UdChwJkn6XNs+7fmk3xLdrlEyox4reHktjRVMoA3imh
	2QfqaEjQvtxdeUoQ9YJTmSmUzwTRzTsHGdFg7c8nZev5nkK62zQ24/FxI/+1/1GUoFcbR7jFCcr
	pi26t7ZlcifdfYz0t9ePQOlAEf0MSs1M/FuWBpp4l0+Gmw3v03EonMEWKFsEXUMNn8ypnsvyfbN
	lG8u4ls6vliyb5jYt7f8BxoUAcRP8xQBo/NlSbww33Vz2WOcSb0ZYhKZCIOlXWOmQLPVFwz2Upn
	Au/qrMCzwqvQJGUuhTIPHTSpWxBh9exudLAy//pEoUFAryB0HRZXSATNvWAyp7tSvadLrtdJ5JW
	ZZTnfkUgIRfNYEYkUF7vr69Pf4t3X9wG71VeAnerD47YYzJg9zV9Pgn98f8/1lEkmaXbyHT6Bz9
	vdHs0M8m4S1nsmuGZJklqw9oq8x7Vr18gm/PGXO/7gJ3RDN6ZvuZ1wcaH+QWya2edub5Vg6qvRu
	RMnglF0bit7eygTFHH8Pfi/7LEAgT2yM5zGEmrYFWK2KIFfpVXJ1u/a3iR3+hkr9U3eD9+SHfLu
	IdzCSBZvU2Yx8P4U4znLcAkmxWP3rX4a1VtysEE/8tH4jMJNRvaDzoOIJAY19u/1dgNYJiUy7/v
	3Fo+PAlHBd9FdzFoqMtn9g45QywQPwpc0KuwH6q+aJhHIX298ykT2Qx1JSFf7xgAnB9MXbFexUe
	tPsMlJB0DuUDiaPQ2tuNkxYXuzdCKgPEypmqV5l0kDMsB16/wUGsRTxZ/dXBKJj58iTcEyyctzg
	JL097Q7G/aYoWUcR1csZ6/f3ZqppLakKUiT6HvCVszdr+WBljO9LnbEVnfdla8llBWLVSGFglia
	h2FG
X-Received: by 2002:a05:7300:7481:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37966e3aff8mr15651047eec.25.1794851682607;
        Mon, 16 Nov 2026 09:54:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 027/105] python3-eth-keys: upgrade 0.5.0 -> 0.8.0
Date: Mon, 16 Nov 2026 09:52:39 -0800
Message-ID: <20261116175359.342679-27-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132483
Content-Type: text/plain; charset="utf-8"

Upstream dropped setup.py; build with python_setuptools_build_meta,
setuptools-scm and wheel.

License-Update: Copyright year bump.

Changes:
- 0.6.0: ecdsa_raw_recover now accepts only v values of 0 or 1
  (breaking).
- 0.7.0: drop coincurve <= 16, add coincurve 21 support (breaking);
  reduce message digest modulo before HMAC; PrivateKey.public_key made
  an explicit instance member.
- 0.8.0: drop Python 3.8 and 3.9 (breaking); add Python 3.14 support.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-eth-keys_0.5.0.bb               | 13 -------------
 .../python/python3-eth-keys_0.8.0.bb               | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-eth-keys_0.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb b/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
deleted file mode 100644
index d9014daccf..0000000000
--- a/meta-python/recipes-devtools/python/python3-eth-keys_0.5.0.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "A common API for Ethereum key operations with pluggable backends."
-HOMEPAGE = "https://github.com/ethereum/eth-keys"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
-
-SRC_URI[sha256sum] = "a0abccb83f3d84322591a2c047a1e3aa52ea86b185fa3e82ce311d120ca2791e"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE_SDIST = "eth-keys"
-
-RDEPENDS:${PN} += "python3-eth-utils"
diff --git a/meta-python/recipes-devtools/python/python3-eth-keys_0.8.0.bb b/meta-python/recipes-devtools/python/python3-eth-keys_0.8.0.bb
new file mode 100644
index 0000000000..b0c68afb2b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eth-keys_0.8.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "A common API for Ethereum key operations with pluggable backends."
+HOMEPAGE = "https://github.com/ethereum/eth-keys"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d3f53e7cc5bf80b16eff1f4a38c73182"
+
+SRC_URI[sha256sum] = "11549b251876fccd7caedd6905e494ea2309aec352ec2579b00ef9978017a964"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
+
+
+RDEPENDS:${PN} += "python3-eth-utils"
