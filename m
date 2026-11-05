Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28901.1793862643868814655
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:10:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Owear+1K;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2672895eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 23:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862643; x=1794467443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QPkRBnoIeJC2YhMMkmlfx8f/PKIRAZV1wZTx8U2wuk=;
        b=Owear+1KxnolFkznGm/wIAy+A/aEkLM1GR7j9xwL6VkmT7tsiSWblK6B09mqIpxZVf
         HZBY84EBDiAVKctKfx+pc+xIS2o++CPJTuSpxDEify8p9+S3sNZAmalY5UF5SJpu9QKG
         5LtbdbklbdzLDyQj/cN3bzosnn2wusTx2EHSvI8+b+HobrFozhcU8QkDxQGprFgyJ6hy
         UoxEP1piBIUxH7yhTZ5W6PvKdsv8ixOAdNWbY2TP+RJ7zE+cA8O9m1Z6IS79Fp0n7jSi
         oncbDYY8UqO91RpDGKTqo/k0wudsHuZGO+CP3uKUEpz6kg2Q/3FkN3iqgPqvgorVbz7i
         mFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862643; x=1794467443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+QPkRBnoIeJC2YhMMkmlfx8f/PKIRAZV1wZTx8U2wuk=;
        b=wYhkJ/pyb7cdEwwfMmiEVe8b3a6diesiAWQGwsDp3KfVpQTo2reFiCjbu2WxC53aRf
         HwVbYVe+Oqy6qeIjrOfMufP/cbtR3L0g/igMm0aZDFHWrv6ImJYG+Xxf6DNcSpCis0RP
         ZGwIQTCpO1qCNEM46nVmlDT8Fm9MtpwD7MBOkZgRiEQI7x+FFHKHV35UeCTPfkVDDH+I
         fmqsDUwGR+5b4C6b1RaO54hsRV0oG5Iqc0kSpRT5WKXapjz9buqNI1IKtwFyTHRdeqE3
         tOjfSDtadzE7rjfJIeKEnWII2kgHxlEG3nURQERt+RLBLd0Yolvbx2EJj1TiEGEHHJ7U
         oqCA==
X-Gm-Message-State: APuU4Z+p0o1Erw0zFBO2doVAXqdvNqJIdIR1Hr4nybjvRHpzZtn28Jmg
	yKeinPNOV74tRSNBcBl+cTK38wHV31Ace4MCAHNbCOJ8WTiWzNhdPNK399BouRDadzI=
X-Gm-Gg: AYBFou3oUHwMOigkjNf/L1HgcGrY8EuiHfmYGCA1MJ54M9kqOFM33z66gyksW9G8FRR
	kyTxpjj3WbmJ3aYVswBmjNSniVceUnrBs9GGf8oUPpM5qbVWJSKuB/qIKJsEJ2zLd5jmLAkolX0
	jkBXMuULcB/G2GGcJG/uXAODDuEN5sElyBtUJ9gstoUB/v8qLs/OW6fSQneO1PjaMjZBTl9OSxY
	qQPDza5Hx4qx1fhe+iDOxvvQT8JtWhNMqiXoLX69zEWi69Yjy+TVDXgmjoHtogOodVaWSa4kUF2
	aElAGLo9mB7FA6O3Yl0AmD63+LUw1AQiDnLorA6hvnOIkqYkGcswFVTMJoxOkj6JqxOrXR5M5FW
	mpsDAMOBRxh/JQFxoTEa+DwqwIPxPxkK/Owbz98/eIgMHkAUg67JkmZi2uJlW798U13QXAsOyKG
	NoukDajYo7h6Y6lbzUSEDhIr3NFInNh2Be4FibRkhPV87XC5XFVYtaVql3WlYio7N/uAZguo6bh
	ahcKkBHb8zVgscmlxckrTwKArE14hWbndNzX8N1TMvkn2hjDTJXG514FJqtx9FLRtGKg/3xXNmK
	BtAfq3NiczSPYZgAv8CiPSt8OxLdX0CbBvJb35OIVlnB9tA6NeUfR+eakYm1pgeDxLPAdwI4chZ
	8NHuTQK4BIzPB0FMaKnGNJe8OPg7sfG/QkuDhjq94bNytn9NXktdd8O6k/ozJjgn5R1OTvGvM9l
	bBFaWNXxaVRc8VBJ0HIZy/IJwrSHYmv/HfFd1ABWY3opgakab/lS0g8YR2pCpyCNnfQQBQ0F2hH
	IKd45vsayrCtFaJ+AgwgxXqf4HL0eBpgk3l/EntgL2j6pcBYp6EtU9br4P0gYTlbJHW38E4qg6h
	KwW8
X-Received: by 2002:a05:7301:6184:10b0:369:fdae:c9fd with SMTP id 5a478bee46e88-36a423935d2mr26579817eec.13.1793862642748;
        Wed, 04 Nov 2026 23:10:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b3b7esm13132205eec.28.2026.11.04.23.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:10:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/4] python3-pytest-benchmark: Upgrade 5.1.0 -> 5.3.1
Date: Wed,  4 Nov 2026 23:10:36 -0800
Message-ID: <20261105071038.2029943-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105071038.2029943-1-khem.raj@oss.qualcomm.com>
References: <20261105071038.2029943-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 07:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131870
Content-Type: text/plain; charset="utf-8"

The project dropped setup.py, switch to python_setuptools_build_meta.
The sdist is now named pytest_benchmark, which is the pypi class
default, so drop PYPI_PACKAGE_SDIST. License checksum change is due
to the copyright year update.

5.1.0 broke every test with pytest 9.2 and Python 3.14:

  AttributeError: 'Function' object has no attribute '_nodeid'
  PendingDeprecationWarning: FileType is deprecated.

which made ptests fail in python3-pint, python3-fastjsonschema,
python3-portion, python3-tblib, python3-construct and
python3-pydantic-core. These now all pass on qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...nchmark_5.1.0.bb => python3-pytest-benchmark_5.3.1.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-benchmark_5.1.0.bb => python3-pytest-benchmark_5.3.1.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.3.1.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-benchmark_5.3.1.bb
index 0aa2c24d30..f202424087 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.3.1.bb
@@ -1,13 +1,11 @@
 SUMMARY = "A ``pytest`` fixture for benchmarking code. It will group the tests into rounds that are calibrated to the chosen timer."
 HOMEPAGE = "https://github.com/ionelmc/pytest-benchmark"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d606e94f56c21c8e0cdde0b622dcdf57"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1d907de309286ace60c424a81666867d"

-SRC_URI[sha256sum] = "9ea661cdc292e8231f7cd4c10b0319e56a2118e2c09d9f50e1b3d150d2aca105"
+SRC_URI[sha256sum] = "c1ee70a58f9bfb1ac955cc634247a340b0df7bcb949071cfca396f16c6fc3516"

-inherit pypi setuptools3
-
-PYPI_PACKAGE_SDIST = "pytest-benchmark"
+inherit pypi python_setuptools_build_meta

 RDEPENDS:${PN} += "\
     python3-aspectlib \
