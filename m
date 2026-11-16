Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1.1794851750091973676
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pcXwWjgF;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-372bdb942dbso3344587eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851749; x=1795456549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTErs2H0//8Biv1BNsTMIQGAh4Ij7inDf9ttvC89LLQ=;
        b=pcXwWjgFz2t1G67REsguGmRNg0Pp+wbiv1I837st2x8lsSFSjr6cqqsxemjBEGh+Qp
         7mlpeARan2dtpwBmIa/1M8rMWzU8Bb02cnf6/XLmUQVKm37p9bxN+coBFGtUABwBra9P
         dsrF5kphgpwdN0mUWA5ym9glv0isovATq5xAXckZ73lJW4J9YCLoaZuxTOF2jVFZWGG4
         2/7UBkHcdpYDTTlVCVtQ+zckm52rXvSAM3bzKireT3eOAGUZXTGjPkr7nVie99odgOb/
         RkaYQO09PiIZb9UCUWq8JkvtSwfTwFbOSkGhyWRPO6hAEpVReBjTHXV3vdEA7sNnzGkH
         agqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851749; x=1795456549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zTErs2H0//8Biv1BNsTMIQGAh4Ij7inDf9ttvC89LLQ=;
        b=KMsOZIy6q+fRNsCfuQ+k9WbuD7wFpeuZyn5BJgreIfGg4tDUlY6i7iY50Y98C9yosE
         CdykeiWsJA4RiZBAuM/Vy7yweBDdx2motloPcv5QPdeysJmToevXxJy2VGrwOsGbs8zm
         HeJPx59u93mP0XQcTLH6jKZUThL3ugTsZJ4HbLYB5MKmDC1X/NqMHzPwmXTbu6necclv
         uuvzBA+IhSA2jnnqakMxLriLqZTI21cmg0cxb98CpcD94X6aRPVdHDClZIC/UIUoTPLK
         /NdJx1MCmVAyZQn1GHXvKfySAUUpww64Fl0y36OoF0/v5Q3lXEH0zgdxfYX0WVfiMEWO
         UfBA==
X-Gm-Message-State: APuU4Z/vZGuDK2mLyBfnGorjA89QSWRYHt70y9x8KRE56cIHZlABoA7U
	86sGHlPung+TQOjczIWOiClmOCxu7v2BKKnh/BphLPIjurhCQUFNiTgY0WlJMPWZ
X-Gm-Gg: AYBFou0nDaE36K9vAaRaXYucowdOuUdpAhqlAnXWgNyldHRyvlX3OoSxbJ6zVw/85VB
	7QXonFe1U4aX5Ds6TsuLu59FniThEjx3FLuMAmKuKbycl9oyPMOq2KmPGpmDTSfpn31scfI0+5u
	WdpeLE1hZqBwjzHRTQnwZTvcenWy942Lghx2lMOOlDOArveaj8eoA1Fz9K7QyVjLzYycXEso0bJ
	c2fua89oByo3a4cWMZN2o/bb8vCDLFQtS7yn/Qbw5y1wJnh6SZMXTRKhsHjtrbtDDY35LqnYFfL
	zL/GHvonUtkR+ZTBSzZeZg9UJgq51CgwyE8vU43Ptx7a7mkMudOrtjmB4Tyl0wVMXfV2h8HHBYA
	Ksy2cZaADa8XwhQygrFlJvOudD4mIZG/oQty+a7Gj8z3mdO0JkcWrPzKGBPxHN++LPPt5qe2+WS
	EJGbvS+7kYVbwamlAyucpnzUztvqR7ndqxn/ALALleQfPXS5iJghS56TJi+5ExApU/s4BYjiGWE
	jqeYOGPqjV7j5rGcWb4j0nouBpk5tULkLmG7Cjl/2Lf52jX8svJYe4+6k4PsMesbz6pDq/q19xY
	LPjuPt3nMLiEvpGv+hglzTp5FouM9R23zUTpiaFHzk8dO2H4NOQyXGSNf2gE469QZE6zoEDLjcz
	EJnCDXAX2nOC4ULs4SjiA0AezXvwQ2UVub0cueIKqgOgbv+kXqkrKoOI+pcrJpCEVDWK9j53Op3
	wE1cUzAU8z2UAotco5KRD4MfO12P/VFAlY8JXE9I/Z62Fv5LAf3d1IJ8dYyKDGYrzitG+5meQ99
	yZBr8r1VcfP//Nx4kZsRMxZ9D2kEKo4KeMWTKYrcCsL7Fw+Xo0NWY0vEcw/lHbQrHF/mQ3UdKEW
	YPN4
X-Received: by 2002:a05:7300:d40d:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37966e3a7cfmr12252479eec.11.1794851749437;
        Mon, 16 Nov 2026 09:55:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 079/105] python3-pyudev: upgrade 0.24.4 -> 0.24.5
Date: Mon, 16 Nov 2026 09:53:31 -0800
Message-ID: <20261116175359.342679-79-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132534
Content-Type: text/plain; charset="utf-8"

Drop the setup.py version hack; upstream dropped setup.py.

Changes:
- Breaking: require at least Python 3.10; Python 2 leftovers and
  PyQt4 support removed.
- Project metadata now exclusively in pyproject.toml.
- Use the returned error code for udev_monitor functions.
- Docs: clarify binary nature of sysfs attributes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-pyudev_0.24.4.bb => python3-pyudev_0.24.5.bb} | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyudev_0.24.4.bb => python3-pyudev_0.24.5.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.24.4.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.24.5.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-pyudev_0.24.4.bb
rename to meta-python/recipes-devtools/python/python3-pyudev_0.24.5.bb
index c75d822c48..54a39e7212 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.24.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.24.5.bb
@@ -3,15 +3,10 @@ SUMMARY = "A libudev binding"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[sha256sum] = "e788bb983700b1a84efc2e88862b0a51af2a995d5b86bc9997546505cf7b36bc"
+SRC_URI[sha256sum] = "4e7faaec419b81a902d057568101819f448972c0cf448bb9c22203e4fc6a8eb9"
 
 inherit pypi python_setuptools_build_meta
 
-do_configure:prepend() {
-    sed -i "/import pyudev/d" ${S}/setup.py
-    sed -i "s/str(pyudev.__version__)/'${PV}'/g" ${S}/setup.py
-}
-
 RDEPENDS:${PN} = "\
     python3-ctypes \
     python3-misc \
