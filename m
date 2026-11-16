Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15.1794851772308569168
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mER/ltsy;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so4893266eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851772; x=1795456572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1mWXvO24+hQ1dWUBEM/Ch0YEFG3LZjMjkJ9eUo6fwJs=;
        b=mER/ltsyzJIOuM6JitdW2pdTZWqqEEaK7viYSHRjpyQ3wOyuOHnVhhjz9XPhaxVlF0
         9NHWCOTJNkoNbI1P5yYFLbMkGUT8LAHD73mhPgtamgspiOxP1KfgevFjlzSIwSTsvP0H
         otC9fdraqDAok/L7b4S2BXuINKkLvfJSEz2GC5l4HC8A1tIJpME+Npyn/vVfCvG01HGS
         dq35o8GKix+drJ2cdEPQJ5BTRT/qNDtYwa+KG5cwCDIB9L5rbfzvBlYA1sm8NNtEEOlZ
         PdS4tYOV5+L2Av/DOeeFrODaWqX3bJyJy64R1XcdS+JHmsAqoaQpI+R3Y7avsZB3JvsC
         Rhdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851772; x=1795456572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1mWXvO24+hQ1dWUBEM/Ch0YEFG3LZjMjkJ9eUo6fwJs=;
        b=JpnBK/5nSey25ZpkdMID1Rd5DT0hicgAHlbe41ViIaYCrl6dLfsSkXnhAw6fbNPsIR
         HyVAnONEghCv8Y3KFDqkq6VRCZxnfuEkm2qNm+Owhohd1A1eu7lJIad/OB4OoBgGgDL7
         W01L6gy7UKv7ETJmotUfUXD1Y6ldd2sSruuaw1WWyxFV9Hj7NtM2Ni92KLYnHZqTHYlt
         UGODbeD+Dq9HgerQTQD1gNteJxWb+yYCB469Bt3zsvnrTSSNFDjy6JodyYuCawTT/eTC
         /NBbRZV6fT5JARu/XueSXPczeDRg+mwhx3fCHzPsxBmXqAkm/RTWyn1s2uiFce6RNSu3
         A6Mg==
X-Gm-Message-State: APuU4Z/LH6qIcc8McKj+WdNozHnEoefT75EjHNykhtdToHqDlPiFYYaw
	maebxI2teRtDPHzhm8uzAXVFV/kqkRwwbTO8mSQcEx9gh8+ROtrQ98yQ3fmvpt1r
X-Gm-Gg: AYBFou2Q3I+ol5WE5XelOD7iLJBSnB3heDWDC6RXT34xElPz96fpI2bnoKJ58em/EKq
	if+WgMFWHetGv6hg0K5+nV2lthRs7QKTjLcFvrDFLC5Kj7BhXMKLg3ElQkseNMwTM1F6xu4uJXt
	EyiRnjs6L96g4Xz/nkh4kSI5JIKNu8qy7UHbPnTM5TbMpKIhQ7W8IF0UA6FFi+0qZa2himkmoIx
	Dyx5fXwX9Lgk1AAjuWeR1KrzLUO+wKZSbGjltNYFLDAHmubFQk3/ObmrvnWhazDMdZLKgUMIHHG
	H9bHArFPdpFQFBDs+0snmxdkpEU24V9WBIGmPEQKsF1WwL2pNzYzSC2RBNSvcwlJ3Pbj8U/y+Os
	bcZiFtXPhRpz5Kd3jHG4MIpfC2cm1ViwkgzK9JwiWMgH9xpTWP9kgPfmdPjpYVSDglatrBV3Ry8
	81M5eLfwX8LQihHgEwKv4AMt2DZXV5vNiDpJUHWLtYfBqJWzQD41cJ/4A19M/qnQjbk/ZxFMPVw
	YxMzI1pdWHa9TaF9HUH2E6ZsuRxj5KAzpRzR3oiJdm7h+w5Suc1kRF9zF4DlIfva81rpSjC86R4
	we9lSCIQOH1+jtiwXZk57ehuZ4qoIHKvPsqtxyNW3HfBtu/yjRdSmrF/Cy7dR++dw1gaFR3egGM
	WKPcf0oAStKRJ679Akjg+ESenucft5387F/EzSGNf/JXWwya83dml1WAQLU+ABjxPYjlTlLGuLe
	hNNoE+nd+bd+7EpIPDaIlhc1ZB4LMSZSGcjgmQL28TlNDcHeU+M7Xou2bIcBoqbOSijJuYyCcrh
	461v8Y2eVApeJKN96rmxOgxu5qFWzUjBsNAH5X5qu5wCbTntRhO7kf0MQDJ/L7N5ikVRJSEcqtc
	ndiH
X-Received: by 2002:a05:7300:72cc:b0:372:598d:c0bb with SMTP id 5a478bee46e88-37966e3ad18mr17429378eec.13.1794851771559;
        Mon, 16 Nov 2026 09:56:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 096/105] python3-types-python-dateutil: upgrade 2.9.0.20241003 -> 2.9.0.20261104
Date: Mon, 16 Nov 2026 09:53:48 -0800
Message-ID: <20261116175359.342679-96-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132551
Content-Type: text/plain; charset="utf-8"

Upstream dropped setup.py; inherit python_setuptools_build_meta.

License-Update: PKG-INFO line 6 is now "License-Expression: Apache-2.0"
(metadata 2.4).

Changes:
- Typing stubs only: stubs completed (parser, rrule/rrulestr, gettz
  cache control, relativedelta fixes, UnknownTimezoneWarning).
- parser.parse(fuzzy_with_tokens=True) now returns a tuple; ISO
  parsers accept bytearray; datetime stubs generic over tzinfo.
- Added __slots__ and missing parameter annotations.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python3-types-python-dateutil_2.9.0.20241003.bb    | 10 ----------
 .../python3-types-python-dateutil_2.9.0.20261104.bb    |  9 +++++++++
 2 files changed, 9 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20241003.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261104.bb

diff --git a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20241003.bb b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20241003.bb
deleted file mode 100644
index 17c710aeca..0000000000
--- a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20241003.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Typing stubs for python-dateutil"
-HOMEPAGE = "https://github.com/python/typeshed"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462545aeb1356ad23"
-
-SRC_URI[sha256sum] = "58cb85449b2a56d6684e41aeefb4c4280631246a0da1a719bdbe6f3fb0317446"
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE_SDIST = "types-python-dateutil"
diff --git a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261104.bb b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261104.bb
new file mode 100644
index 0000000000..6b027a8492
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20261104.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Typing stubs for python-dateutil"
+HOMEPAGE = "https://github.com/python/typeshed"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=320eb2c24b8d2e890b6800000ce9352c"
+
+SRC_URI[sha256sum] = "5d0495702a5f7343741f5d842c531bcd1c941da8b4a85307d52ef43ba80252db"
+
+inherit pypi python_setuptools_build_meta
+
