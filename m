Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24.1794851782755157040
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KObGSkKY;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380b40312e2so1305986eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851782; x=1795456582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W7xXphLpBn1DH3EDb5eTpg9KnM/5FdljOOIAvZQ3Iq0=;
        b=KObGSkKYwsaYY+8zC5c3Vs1g2tnbCZlRuYQs0lXXwVYu2WXDAMeMYNA8QqI2cU1+bg
         KAdhbiRO1eZFWfSMOyXG2uc1SoV28kcbCWsxyKLFzeKToNN2qrucJQrkBglmk+GKE94t
         ZO7qrMhqKgkS5/tnUwSVABbWbWDVadLN4WTDRsBp6bd5IU79vKBaRbO2qIAwVWRXefRI
         1L6cyoMx438VxHySXXWlJ0rDLqbOc1boObvmZuG/wh+G3cJiSFsf14ubgNiLPNuLXLNr
         KxU9a8dNeTAPjYGDiyxGBYBqIGwMDPfxNp1IgMCKIbdm7e+sb741CfNEV5a4zaRmTkpR
         Cc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851782; x=1795456582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W7xXphLpBn1DH3EDb5eTpg9KnM/5FdljOOIAvZQ3Iq0=;
        b=AZ3ZoqeGa1oQfzBPlONq6TapSIovXFcy2FxKaRuD0y5BEtjPuRAiGf7iuFl7N1K24f
         e/Hbt41oxDVZ0sgkmtSQxXU95v7hAniGiw3N6QROEIRc+R5Kxn5yreTEdAT0so9Dq86c
         3bfbz5ZDKhA3p80g+JYNVutQMO8TeS0NWkLZd4k5TwrDm+tBFymbkijh/GPM0RFn5JDj
         oPnpccBGx7kWSvEdggocTf1Mkh+30Aq6mrZYGEO8fJeKHm5lVNAoOfZmnyppvtl32UOY
         +A87YrmmlsmoqMIMrOjxX4ZmXakGQnrXl7Pv1oMkv9huw9kZTWhDboLM3O3+50fZHdQ7
         QEPg==
X-Gm-Message-State: APuU4Z86ZUNK5KJUG93np+lze282bMM959kPgKY80T/aVDQBEoDxl3D8
	lpvfdAjsKWhmF4GnUOFFgAlIrVan8Q3q6TnghmdarhRn+XZjo/u5zTo7wOkbukwh
X-Gm-Gg: AZFdTZexBuojVvV28V0/zEkDIvsUADMwOlFRSrhroFgVpnznlu7oMKiO3mpuXJjSy9V
	BXqjNQDihAaHR/75GULwYKnn+3sQJZTCDIrUjwaMKmpRqhqMP1aJtHqnaEfCAwctLtFVoDAtt12
	g1Oh17opQbd5+TRJ/QlA2Vb20MGWN/fBXmR4VF9LONcChYG8QdBqkx0zRWM40WffXzBFRtnuepN
	ppZz1f/s+TyrDZHf3B8nvS6Cx89v6nIYyii5LV7D5BpUqxAGz9UYkEuAAIQ5W7iAluhVX/XdkuR
	vGnCzsWntuBRo+UnpdLN+fCdFv1XigjpIT5QBaJXwCjRp7rDG5wfoktbJwpyfsZrvuqELAlUhmT
	NPQqMI1NeD+SGIXleFWOr6DalCgzNjkdnQTW5rxcyfFy1p+zZel+zQmYrWMS8RIk+hAjTqCgqXI
	oYBVHyocLUKHhrUyvAupgrIJI/hvEVZBwKNa7mv63FMNQDACPgkqOF+qeFo7h/8+6Ft5RoICxE0
	nqITbuHnYbYqznckmxbshzb47xUt7+cY30OEXm1PkffLLNeerRz1be79q1fC2QZculI/IpzyDtX
	oUdg/2f8xIqlftiG1Xyvdw8DlhlKUGZdUku2mlIQe/xSCwECgUFurm3+GAJ6hOvfLVTf80n0mh5
	aWFfy7Qt29xu00mxWUpJ0/QL3eJsBieci3lrH6bCYCs3C5H5GF0tRBOG8gZ/oIotjPglWGDeouJ
	+sbqLu0AyuYcS980MBg0lEg75twasblk5k4vQe0bi36qlA7lQ5rBBdA1/MpMOs6ba7mlaOqq7Xn
	07S7R6O4cIahAUPquNBX//ZMl0puEwZt/vM/WqVZb3r5vc9FlsxMKC59vzidDAp8bm7u4AbFVWv
	0afY
X-Received: by 2002:a05:693c:80cb:b0:36a:1bd4:628a with SMTP id 5a478bee46e88-379655d4342mr10744870eec.9.1794851782040;
        Mon, 16 Nov 2026 09:56:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 104/105] python3-xlsxwriter: upgrade 3.2.1 -> 3.3.1
Date: Mon, 16 Nov 2026 09:53:56 -0800
Message-ID: <20261116175359.342679-104-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132559
Content-Type: text/plain; charset="utf-8"

Upstream dropped setup.py; inherit python_setuptools_build_meta.

License-Update: Copyright year bump.

Changes:
- 3.3.0 migrated packaging from setup.py to pyproject.toml (PEP 639
  SPDX license); 3.2.3 dropped Python 3.6/3.7 (minimum is now 3.8).
- New: insert_checkbox(), Color() type with theme colors, chartsheet
  set_zoom_to_fit(), use_custom_theme() for .thmx/.xlsx themes, table
  alt text, data label positioning, chart title formatting.
- Image() and use_custom_theme() raise TypeError (was ValueError) for
  unsupported source/theme types.
- Fixes: autofilter range limits, conditional format priorities and
  "future" function prefixes, autofit hiding columns, set_column()
  widths, add_table() duplicate headers, GIF/BMP size detection,
  object positioning performance, Excel string length checks.
- py.typed removed in 3.2.9; typing annotations added in 3.2.x.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...on3-xlsxwriter_3.2.1.bb => python3-xlsxwriter_3.3.1.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.2.1.bb => python3-xlsxwriter_3.3.1.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.3.1.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.3.1.bb
index e3a8cab12e..ce21db265d 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.3.1.bb
@@ -2,11 +2,10 @@ SUMMARY = "Python 2 and 3 compatibility library"
 HOMEPAGE = "https://xlsxwriter.readthedocs.io"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a4bab8df34a9a138b4e0ca56b8559a05"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5249ec013d324b4f1e23d5b019e679ca"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-PYPI_PACKAGE_SDIST = "XlsxWriter"
 
 RDEPENDS:${PN} += " \
 	python3-crypt \
@@ -16,6 +15,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "97618759cb264fb6a93397f660cca156ffa9561743b1823dafb60dc4474e1902"
+SRC_URI[sha256sum] = "0867761912cceac76f97ffa76eeda18c623ae9217f601be8512f55b1af4bdb6e"
 
 BBCLASSEXTEND = "native nativesdk"
