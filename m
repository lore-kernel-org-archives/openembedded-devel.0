Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBBBD715D9
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 09:04:44 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1624.1769191452528167496
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 10:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Zyypmswv;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88a3d2f3299so28977296d6.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 10:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769191451; x=1769796251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nHdJ9LNs3WvTs4RfkwK37gwZheD3u4y4byc9fDNdaeU=;
        b=ZyypmswvCfEU1rm6e6qcEF8jQlkavgUvaHtwA1wPu2Mx/LNFm5DFvzWjkZkcqX2TG5
         y9MtXl7QUKPj39pqmf5ZdjbV5hClYvMSJe+qkTywhDeFbwbPMQZY9eb6fqmHrxHu1Qj2
         2QA18h7jT+uQCUwNUYU7UDLcqNZE71ibC2NQHDQIgTgpzn3iHdAhjNPdSCmmxPxbw/vi
         fQiSH9YegpA+O0xY2rIyxA9PCUWZNcWw6Xw1s5ldx1WJwxpD05753Uaq2R5547mtybkb
         vDomjl1ZfQGe1Kx2QAZJWV9YsWaU2K39OO7m/DvSpa3hjEMZw7bXxPBv0N89eKeUHHjL
         0UOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769191451; x=1769796251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHdJ9LNs3WvTs4RfkwK37gwZheD3u4y4byc9fDNdaeU=;
        b=WtDJS1rNBEWJ6G1wZOS9zxURSphAD1mRmo8W6KHeWlmUPif8VB9IoCTHQj923f3Nev
         DdvjUZ3aOXkjzLKY+7fS88pR+fv63K4NSqOlBRgak4VG5OGKl6W4Bs6VRHYbTe72EXGq
         FfPQ+xY+yMN9f0a7QPS2EfHUpN/GAq9xwJ0J8pvaQRFZTGq/KTSBYMO0MV5mgM0HnV2r
         r+cjtGwFepFZqr48Y/v4OhgneN0HsiPNN10svrpSg/kBqoYdvvbBwS22VF3kNsC6g4Zj
         C4CckbC0ME8XY1Swkhlfc+1rwO2srZOOx7l7qofdCIbvrc2VpbWFVE8t31gLkOSxQ223
         T/6Q==
X-Gm-Message-State: AOJu0YwyBluVSpPDSafsWXM1njO7UmQtvDJgA/kqmWfM77I9ay2W6LRk
	enHNaP8OrlDqbskfGOKhBHNWlPfEat2XU3KZuO8LsLJflnrSjw93cbq8I29zkhd0YCYQ+ccw3lP
	XD25t
X-Gm-Gg: AZuq6aLz1+BKgWhJnHe9OHla6ACoDKlqFwvwAZ5pJDSz2+YTAFv/sIqnoLfO3mM1DTb
	P4Jl+QSHxL84Go75lS9OrYODgoDa4PIY1745qU+wlfYJN5RLAXUoOKZPPLVNUOdewI2+q78S0sL
	nXahGGIr5mAtl/FZNdolIVrR2Zb46h+3SimcXyDJBCfjtUFRzOvHxoZQbcyve+mLRvLenLMIP2O
	/AYoICzPWnyIJAy5PjCCUzKsYyPC4erbVTBkapLH+udhe0/f5E1rGXWMEw720wpop4U/NtxoVJg
	F3bSAVh9nhBp4OA3Kb3hxljcwPitm0joFTtpNp4BcgPk/QTT2bTGvnAX/aVM39djo0comOCAU7t
	sXNiA004L92CAfeAatxaAljBPUizvsgxPE3WBHbX+3YaHrGmWwE7YifulJH5/DFQP3vmUvuFasa
	eUKWa0+9AZ4GgEZo8=
X-Received: by 2002:a05:6214:224a:b0:86b:9167:b0e9 with SMTP id 6a1803df08f44-89497df8dfamr26681636d6.4.1769191450762;
        Fri, 23 Jan 2026 10:04:10 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89491937381sm23668056d6.43.2026.01.23.10.04.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:04:10 -0800 (PST)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-geojson: fix build with python 3.14
Date: Fri, 23 Jan 2026 13:04:08 -0500
Message-ID: <20260123180408.1950735-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 09:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123820

Backport parts of an upstream PR that enables 3.14 in setup.py.

ptests look OK:

|============================================================================
|Testsuite summary
|# TOTAL: 68
|# PASS: 68
|# SKIP: 0
|# XFAIL: 0
|# FAIL: 0
|# XPASS: 0
|# ERROR: 0
|DURATION: 0
|END: /usr/lib/python3-geojson/ptest
|2026-01-23T18:03
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...1-Allow-install-over-python-3.14-329.patch | 56 +++++++++++++++++++
 .../python/python3-geojson_3.2.0.bb           |  4 ++
 2 files changed, 60 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-geojson/0001-Allow-install-over-python-3.14-329.patch

diff --git a/meta-python/recipes-devtools/python/python3-geojson/0001-Allow-install-over-python-3.14-329.patch b/meta-python/recipes-devtools/python/python3-geojson/0001-Allow-install-over-python-3.14-329.patch
new file mode 100644
index 0000000000..c0022bcad7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-geojson/0001-Allow-install-over-python-3.14-329.patch
@@ -0,0 +1,56 @@
+From 2584c0de5651bd694499449f9da5321b15597270 Mon Sep 17 00:00:00 2001
+From: adelplanque <alaindelplanque@mailoo.org>
+Date: Wed, 17 Dec 2025 22:22:28 +0100
+Subject: [PATCH] Allow install over python 3.14 (#329)
+
+All tests pass over python 3.14.2
+
+Upstream-Status: Submitted [https://github.com/jazzband/geojson/pull/240]
+
+Backport the relevant parts of an upstream PR to allow build with Python 3.14.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ README.rst                 | 2 +-
+ setup.py                   | 5 +++--
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/README.rst b/README.rst
+index 26dc790..e3ac38a 100644
+--- a/README.rst
++++ b/README.rst
+@@ -29,7 +29,7 @@ This Python library contains:
+ Installation
+ ------------
+ 
+-geojson is compatible with Python 3.7 - 3.13. The recommended way to install is via pip_:
++geojson is compatible with Python 3.7 - 3.14. The recommended way to install is via pip_:
+ 
+ .. code::
+ 
+diff --git a/setup.py b/setup.py
+index 004d3eb..db277f1 100644
+--- a/setup.py
++++ b/setup.py
+@@ -17,8 +17,8 @@ else:
+ 
+ 
+ major_version, minor_version = sys.version_info[:2]
+-if not (major_version == 3 and 7 <= minor_version <= 13):
+-    sys.stderr.write("Sorry, only Python 3.7 - 3.13 are "
++if not (major_version == 3 and 7 <= minor_version <= 14):
++    sys.stderr.write("Sorry, only Python 3.7 - 3.14 are "
+                      "supported at this time.\n")
+     exit(1)
+ 
+@@ -54,6 +54,7 @@ setup(
+         "Programming Language :: Python :: 3.11",
+         "Programming Language :: Python :: 3.12",
+         "Programming Language :: Python :: 3.13",
++        "Programming Language :: Python :: 3.14",
+         "Topic :: Scientific/Engineering :: GIS",
+     ]
+ )
+-- 
+2.52.0
+
diff --git a/meta-python/recipes-devtools/python/python3-geojson_3.2.0.bb b/meta-python/recipes-devtools/python/python3-geojson_3.2.0.bb
index 9ee6d580b2..cdb019ebd5 100644
--- a/meta-python/recipes-devtools/python/python3-geojson_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geojson_3.2.0.bb
@@ -5,6 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=f77f2ed49768c8d4c79ba874c0f94d8a"
 
 SRC_URI[sha256sum] = "b860baba1e8c6f71f8f5f6e3949a694daccf40820fa8f138b3f712bd85804903"
 
+SRC_URI += " \
+    file://0001-Allow-install-over-python-3.14-329.patch \
+"
+
 inherit pypi setuptools3 ptest-python-pytest
 
 RDEPENDS:${PN} += "python3-simplejson python3-math"
-- 
2.52.0


