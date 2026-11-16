Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17.1794851774026578659
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FQfvGmOv;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so4893311eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851773; x=1795456573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eX7/nXbcro+QxcJD/B3hSadwfeAzRyzRD7OwHvhNC+Q=;
        b=FQfvGmOvr53vfySaXMB4EQ01hmoANbrp/13o+deGCdmOrw4QaNmZjFg+udWSM5Pxn9
         S2FjDaxdarAoA5ZKwY60vIhSJ2sWAfKOQ7B57JFF3afCBFcyVXCjsn/pNmFEt3b3rqr4
         zGlQafhBR9pGzqNjuR6HqORJ06qZCGZA+08wYN/obcotTLP2olnqurwEWApcpQYm9moz
         E71Yii4xj3aBMgta+WWqVLc50vvcijqBdqzLLXJLR0KsKXhgFKq5aWot3MUZRE/OHS65
         a/He0gc5pcA8H2ENu5nH8mfgab1VEm6Dxvwy+7S8z75vm2EhQcaoaIecUtCc9nXNCRDC
         3L9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851773; x=1795456573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eX7/nXbcro+QxcJD/B3hSadwfeAzRyzRD7OwHvhNC+Q=;
        b=Jo7D2eGmQahb7C8rsKSPSDP0UInnyYsqP8WGMeblxHLSkZ94kC6GngwvX6Jj7RGWAk
         HWlogEbz9iZTOsmwGqtsYhcShRRx+EwIqM+gSPKYNWnFJeny4pHUX27oMtESei3Bxu8j
         OF9N/q49Su3U+utbjWOEitXXHvHjPex4HILs4S86pAjXkyeQ7RpUGeMf4cuoVGJDE1nS
         uKZk77LvssvsFpxHiAYpET/r7/giyEp21Vtk4dXIXG5Gt46b5nNaose4FwKuEVTEt4T7
         EzF7XLMfcwjVby+Nm8frAbyKal0quFz/Ufu1BfeZVJLISZe73R+nWNynt+pgnCfLbDB0
         3dbQ==
X-Gm-Message-State: APuU4Z/1u8nHHKJlx+3NPmvo3vt8yW/YaSlnpzUnUplrlsMMvE0zHmtu
	hdSTWN4Ve+z/cauan3ERQ5YsrAFYWLdlH5Blgpyhh1D+ixDur5bU/gfKCYf6Tf32
X-Gm-Gg: AZFdTZcT3cLjKsi5IMrHCdtm1SNiqP+enqBrXHjMPBg0Ihhf7OwX6Az2g1qrWMBEEMu
	Jv/IwgsJhkTJ6wEOSge4lFQXvoWG8oYFB6Ex1DPmoINWzFxBDY1hVpJBeW0I660YdqZvJzAzn6I
	jbNCJh/dLFV5deyOM4KYqqeFj9yto/QvZgoYp0KCvSRP9D9x4kN/SC272JFY56SzQvld6OtUJXn
	TVbftmdzkvxyO6H1+4/5HkaqY95YRgcF53cwajuOpA9eGHj7bxNTCcHcCFEB+kiIO6rgCWfv5h9
	3bcCNbF9uwNJepgtEmgMWIl+WNi9pNQs0xAlOBZfwb98XBCjks4Iq5Nsiti5vAQCqC9mztQ1XJw
	TS9XxbkeaamDtjdtKkW8jSwQrLatyKMhhEFzxXPdqXB3Zl/0VJAh4DZbsFPHqX7BXlUzB3AjtSa
	cgRt3dbJpLDYS7UNu7uMO1QGDZry/+on/+JyxO5bX0iOQFqBYZC3q0MTsWBzjo1d4Tj23W7L6Go
	Xi9NkBUCAV48DihXX0YM1+LO4KsTT9NXxY9SqxtfNbFTr2tu8bh72bfIIuwIULXlYmY4KloLgr6
	kfwl40BViyaXBu6ySgMn5oVdo1jZy2PQRo3uH3VfuQbvqpf975PsEsFViWbSEmWGoEFOgHyAI7V
	Zj7XMhfhcxw7ug5AIDCxzCTYJLC3/fHA5uXF97uzdpawE4CcbIFYHCuYXY4omkWzc0am7TN75/I
	hlvQSIbYvqDxVe/RoQDfZgE/V8+IesKvJmOMmrYkvkTaodu/x44s1xmIwv2zUtmulwjNSVhuAKZ
	4P7juynlimmmFAsyymbuTbDyAM1G2oZn/JZp9CO35QwfDnvNeIABVHmq8MjZaelOM7Kih4qSeq/
	SUFnWfSHxzp9aObc9ZIDGY/Sgg==
X-Received: by 2002:a05:7300:cc9c:b0:371:5cb0:4929 with SMTP id 5a478bee46e88-37967dd4c20mr10961598eec.25.1794851773353;
        Mon, 16 Nov 2026 09:56:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 097/105] python3-types-setuptools: upgrade 75.5.0.20241120 -> 84.2.0.20261104
Date: Mon, 16 Nov 2026 09:53:49 -0800
Message-ID: <20261116175359.342679-97-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132552
Content-Type: text/plain; charset="utf-8"

Upstream dropped setup.py; inherit python_setuptools_build_meta.

License-Update: PKG-INFO line 6 is now "License-Expression: Apache-2.0"
(metadata 2.4).

Changes:
- Typing stubs only; tracks setuptools 75.5 -> 84.2 (stubs updated
  for 75.8, 77, 79, 80, 81, 82, 83 and 84).
- Removed the setuptools/pkg_resources stubs (setuptools ships its
  own typing now); removed a problematic private compat module.
- Added install_data to the distutils stubs; added missing defaults.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python3-types-setuptools_75.5.0.20241120.bb      | 12 ------------
 .../python3-types-setuptools_84.2.0.20261104.bb      | 11 +++++++++++
 2 files changed, 11 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0.20241120.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-types-setuptools_84.2.0.20261104.bb

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0.20241120.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0.20241120.bb
deleted file mode 100644
index 41b1d0e2c0..0000000000
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0.20241120.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Typing stubs for setuptools"
-HOMEPAGE = "https://github.com/python/typeshed"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462545aeb1356ad23"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE_SDIST = "types-setuptools"
-
-SRC_URI[sha256sum] = "d3c7e95b0598bf87fede29b3b57b19f5cdcd62a85b9298a7b30f8343f6f21c4f"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_84.2.0.20261104.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_84.2.0.20261104.bb
new file mode 100644
index 0000000000..58791a5bc2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_84.2.0.20261104.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Typing stubs for setuptools"
+HOMEPAGE = "https://github.com/python/typeshed"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=320eb2c24b8d2e890b6800000ce9352c"
+
+inherit pypi python_setuptools_build_meta
+
+
+SRC_URI[sha256sum] = "1ec758bbeddf88d52f963fe663beabc2117b6aae73cf3d2902d7dd0df81bd76e"
+
+BBCLASSEXTEND = "native"
