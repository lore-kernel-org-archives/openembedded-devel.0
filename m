Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34330.1794851714375585872
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=tkSKzDvj;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so4891437eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851714; x=1795456514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+y5J+OjPzkU0PLYL5qGTgWXDCSnrwznFllD2OUdoQV0=;
        b=tkSKzDvj+IjBuWVF2wlH8L1UZmADJCev2K6JZ/9oC9xTKVR3bsbCTF2QlanGiO5BcV
         PxQ4pbeBQUt4ntvsWxchAh83zwWtDcJaHpypgw8E+/xThRKSXXKaIoLEu9n3DIKeq8YB
         EshIk+SPsw1UB0LSQtrhdFAkdgh6OIWTBmXAo3Cf0IdZfs2Lf4Ua1onl5t4xNkp22dz2
         kTQ6RLCgI/f1YiEv0AdzNsXyq+9WW4Hqq0NBraIgTKrLmO8BXjKgT45MOpwj13GBqGXe
         30a5+pqXX39kmW99BzzgyFqpUqqPGQt6FvJ07z009DGln6X/FrWzpKFEH4tTKmNNxedv
         ne0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851714; x=1795456514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+y5J+OjPzkU0PLYL5qGTgWXDCSnrwznFllD2OUdoQV0=;
        b=2cLLvEd7fEkN6dAbFKra3DtM5SD5suCpHAnppfkM7h0Qeijt1obaPcUHbmOF9vUe/2
         hRdGCB6dXA4sbi8VKzo/Myz4/vmuOCvALawG6dcAQwIYV8hIVwfG3wm1SVYgXP+ZHdOJ
         Zhgn8dykBlgCN0CbWj1OSgRXxFkLa5VDG3cnUzUZb0r6gXIAXM3NmtaIL6eh+fcIJKCF
         QVLj4eNzDAnO2dxnniSR7n9+B09eNLThU56Hmrq7Z6G5QnQg3AoWEnmcu49xUZT6OpK6
         fvDY+Nb7NywAltwANgQXHSWY2c/VNu1V7ibeOZHq4p79fKBXnnFqerFa2SZJYhbu9Dmw
         DMDA==
X-Gm-Message-State: APuU4Z+L+te26bNBM/wuqdey2yUpyw2ZCTSmAmSgP2iHl5B4DStY2yUp
	OlpxmL3V4UsqsWeGUsiuQ1DXV27eebE5urAVY3nqE2Fo69z3cJCQlKcsFseEa6Wh
X-Gm-Gg: AYBFou3OeqNtnVD73R1aqp8Uk1m57kazVky9zr9H8Ri2IGkbqXCTAiw+mv4T/bpij9n
	A3fFxu5HKXJ0yjiojcRL9Cko7IpGGUVv9p6qp1uvSbOD+Nyh93Fep4T0GSZn6SoSHhbHE4GcsiH
	KuebOKzWyw1GKAluQdST35fBgUmtUnMyr2fhGHlFOM0gsO9AxPnffW2WAwKzkavvk33DXuoh4w6
	BJiA5sopyh14O2358/elcNcxLhckf+fMlYJInEj3B3UdmXRitrPz1ZoVfJ/zGyx8wy5lH50VBjo
	Tw2drPaoGR7wKc/RCIYOFF3HcnKJz5EGlz70P3SSbbLnya8N0zSNWq0mJGB1hh7bw1Lb+YS9iqT
	ofR+5nIxhV3eM62BAgei+lx5NoGo3fSwC3KvaQerz85oNXyRpfPWCv7UdwMh2T73GSDCWuIZKb9
	KId9sIdn5lnmcq9dRxfMrrPevFXq8yjm9UQ16yKIaHKk8yOnvxUsLPHpStAYFhChPmZCY11j4LB
	bTu72mrTqM55KwduiSq9wtN2mJqn7dXp5cCh8S1C7nXmTuwTaicFRhmNvzjZ0u2RgikhG+gCKoQ
	dEWe0CtJqTW+PDh8Svm7TheOW7Gh0G+CC41wq8oV3eNYN7DyTgXoNohtnTtVxJpGJ13lRvbxqcJ
	DyUmZ1dgloxC2gjTGMoSpOEr/45BoFfC9IDgDRkyeeF/RI6pRYa4OLV1YPiJhjYrzX0/7o3MEOU
	NMisoOLdlSSK6v03nJZeRSF59Dyi3WZqBYDUyU3c3G1c20MvpTjLIgD1ECJJezHeIk0AS9nUvnY
	Pnedb5ERSjnQ8N9P3ujl6YBuaUKfFeNfi6fN3ayCE6HgbXst9sV4NQyB9lCIQBud8fXxJ+d9yC0
	9wlj
X-Received: by 2002:a05:7300:d40d:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37966e3a7cfmr12251186eec.11.1794851713532;
        Mon, 16 Nov 2026 09:55:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 049/105] python3-luma-core: upgrade 2.4.2 -> 2.6.0
Date: Mon, 16 Nov 2026 09:53:01 -0800
Message-ID: <20261116175359.342679-49-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132505
Content-Type: text/plain; charset="utf-8"

License-Update: Copyright year bump.

Changes:
- BREAKING (2.5.1): GPIO/SPI/FTDI dependencies are now optional extras
  (pip install luma.core[gpio]); RPi.GPIO replaced by rpi-lgpio.
- Drop Python 3.7 (2.5.1) and 3.8 (2.6.0); remove Python 2 compat code.
- Add AiP31068 and PCA9633 support; raise UnsupportedPlatform on any
  RPi.GPIO RuntimeError; skip redundant viewport refreshes.
- cmdline.create_parser() accepts a pre-created parser.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ython3-luma-core_2.4.2.bb => python3-luma-core_2.6.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_2.4.2.bb => python3-luma-core_2.6.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.6.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_2.6.0.bb
index 70964ce17b..b0dbde6920 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.6.0.bb
@@ -2,16 +2,16 @@ SUMMARY = "A component library to support SBC display drivers"
 DESCRIPTION = "A component library to support SBC display drivers"
 HOMEPAGE = "https://github.com/rm-hull/luma.core"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2083293a38df91b8d470d3fe30069262"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=a22ee4610fe68b60c67e2ea3cc8e2613"
 
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
 
-SRC_URI[sha256sum] = "963c264164d4374f549d57db09599e0ca458cea1bd05e16939897619be4e6dbd"
+SRC_URI[sha256sum] = "3ddb673f9699a148d3ccfee2985451b01ddd4b4ea66b65a9664ce36806cf411c"
 
 PYPI_PACKAGE = "luma.core"
-PYPI_PACKAGE_SDIST = "luma.core"
+PYPI_PACKAGE_SDIST = "luma_core"
 
 RDEPENDS:${PN} += " \
 	python3-pillow \
