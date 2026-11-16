Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33625.1794851657186315882
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GHxKGtkU;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37071c0f42aso5532400eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851657; x=1795456457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1iOKp/LICdzKX/x/PQIpFa8CnI0bmYs9tO0ziI1NsLs=;
        b=GHxKGtkUhdulAl5kQ9Qt0hfsR3lonJ5gQTBTGhSP8IdGfCOhqezLaZSGGn59FCWTRF
         pUHAC058lz0MdZOnwAUS4b8LXXZ56zhGFzVX/v4iVyKvW6/Sni577roLCePbWEcMFCbe
         XjG0C87GIK6ysTfJt9TQny+ZV+GJj28eL5WZ6TdkgzLGQEBHck6zw5yN+hokcjp9Fwt+
         RQ/6YmUHb/L27qgcf0racFWOCdDOfanIh98zalx/Ci09ypYZhk9KrX58Git71QFI6GKH
         yhcqr2Qo8zxpfgDnY7hFT0Zu2z/LpxoJ+a0CtIC85taAckB9x3PU/vRZ2xWnYmrMbEe1
         LmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851657; x=1795456457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1iOKp/LICdzKX/x/PQIpFa8CnI0bmYs9tO0ziI1NsLs=;
        b=LX4ILkPpbkPZSXJeHK5F++JQkQJK3W5H/Sf5ggxCH17Zi3O+2OkQgTNQiP6NwoTlfQ
         oDvSpYkcwUd9XaEfHZ1akYrxC5x2yU7EQxU8Y30ULWAqD8OMUvU1Obsq6B0nmgvTRs52
         4lcf0J9qJnrV4DD7+/VlpRrAdfa0FkyayJ8hSzs92muCq7r6FdQass5UvIeUJ7ABUlLC
         QNKWW3OW3SRwB0XNOJPTmV3h/uLuC0bfbWCp00An4ARvcu3UFMivzSJ20hApDPM2ac6w
         LkLkIbcNF/NV/X9M5GIJak3EbirXpeEAAJDwdcO9GYTcN+01neZk0KLhvEcGiCIt7aoj
         CABg==
X-Gm-Message-State: APuU4Z/GfiVA0+F1vzM50gH64OT9ElIdbv/abGmPuMbpq89DrJooBPUt
	4yZbTahcGnQW6l/LtJsA8PVjgd5cu+0CGLaczWD6G66Jnnp+B+pJmUS83aKgFS4T
X-Gm-Gg: AZFdTZcpOmmR1UHJTg8CPBlN2gloJKo5X5AnmPt/O249c5P3EvTTtFtLMGNC1f96ZSd
	xU9OCHqzs5C0EwAexyd5/VMOEnairGd0ccGT7YsUb7fhpAZMQRcujWtmUP4Zsy2T7cEmpoOmQDX
	SdCr/i08Dp6igtWeJAyF67val0DpMRF/ejjHugPuuMqMAPWcgo8zKAszAap+XAJlzHoWLhnfXSD
	d2KlGI7wCP6NY2iDMPv9hHjl6gNe3CtsnNd1JadStNnAvGS6xZ1CQR2+gjKT4hWGOxH4jwN4ho0
	2Q2IneiHUOdx/UgoU1somqJ+N4gPXlREcWEXOohLpAwUq18NWgReyYaqghubpvQc7KI0LSeJkwU
	huTNfsPxke2vyNl2hIfpQCv7Ta9+AJ3PxL43yilkUCBaTwDsV7XB5ZfMVJeg5Rtq99Mdzc1MZZv
	8JzUyZMbvvOHVj8/bNE51dBDWCFrHUv2uWiipMsIC0+QjTMCS5eoXTqHFCxM1XlGDZlqhXxHhZW
	mA1DYPIGfrxO+Vbu2AlTh3F/Q6d/aP5mUU9g9vc+u/37Ah8ZDqP/QB0bg9vYpHhdbMUEBumV7Gi
	rOOInjT2as9cxxScDvmS5wUW8R8AO2whAAMjjFUhhE5gbmRhxaBpKEBwK1Wyt/CCcFdfGN1TWqp
	lr78vdHnsFOweDl7+b370CBZk5ocEiopmt8v/zB1pYJ2pa4DAeCGMs7Yl6RqVO88HipmKvMTkhc
	KvQg9yQFlU1clQBfsPU+t+FJBz3Z2E5ZvGMNkx0BbuwfBWUL9r09a/5PTlCu03edJs0A7oACNHo
	8NXeuq1kOSjyRMmen+8oG4WP71aLmLZcFv1j8pIDO57sDuOuaD3G6StnELUcRO7nITZF7uq+kKc
	yvB7pg==
X-Received: by 2002:a05:7300:81:b0:378:2e89:3958 with SMTP id 5a478bee46e88-379676fc09cmr11575326eec.19.1794851656369;
        Mon, 16 Nov 2026 09:54:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 010/105] python3-cassandra-driver: upgrade 3.29.3 -> 3.30.1
Date: Mon, 16 Nov 2026 09:52:22 -0800
Message-ID: <20261116175359.342679-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132466
Content-Type: text/plain; charset="utf-8"

Drop the ez_setup patch (upstream builds with setuptools.build_meta
now), build with native Cython and tomli, and build the libev extension
against the sysroot libev instead of host paths. The driver now depends
on Deprecated; add it to RDEPENDS.

Changes:
- 3.30.0: add pyproject.toml declaring build dependencies; drop Python
  3.9, add 3.14; eventlet, gevent and Twisted event loops deprecated.
- 3.30.0: fixes for missing C extension .so files and win32 libev in
  wheels, and execute_concurrent timeout handling; remove ez_setup for
  setuptools 82 compatibility.
- 3.30.1: wheels no longer ship Cython-generated .c files, mark md5
  usage as non-security for FIPS, fix crash at interpreter exit.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...fying-the-availability-of-setuptools.patch | 34 -------------------
 ....bb => python3-cassandra-driver_3.30.1.bb} | 14 ++++++--
 2 files changed, 11 insertions(+), 37 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-cassandra-driver/0001-skip-verifying-the-availability-of-setuptools.patch
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.29.3.bb => python3-cassandra-driver_3.30.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver/0001-skip-verifying-the-availability-of-setuptools.patch b/meta-python/recipes-devtools/python/python3-cassandra-driver/0001-skip-verifying-the-availability-of-setuptools.patch
deleted file mode 100644
index b58fd04752..0000000000
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver/0001-skip-verifying-the-availability-of-setuptools.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ebee090ac020c5a4e4194788fc2f53d7a4e30b40 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Sun, 15 Mar 2026 21:28:07 +0100
-Subject: [PATCH] skip verifying the availability of setuptools
-
-The setup script checks is setuptools is available (with the correct minimum
-version), using setuptool's pkg_resouces modules. Setuptools has dropped
-this module in version 82, making this import fail.
-
-This patch skips the availability check of Setuptools, it is expected to be
-always available from oe-core - the patch itself is oe-specific.
-
-Upstream has already prepared a solution to rework their setup script to
-work with the latest Setuptools, however that patch builds on several other
-patches.
-
-Upstream-Status: Inappropriate [oe-specific]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- ez_setup.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/ez_setup.py b/ez_setup.py
-index 76e7105..c668e5d 100644
---- a/ez_setup.py
-+++ b/ez_setup.py
-@@ -107,6 +107,7 @@ def _do_download(version, download_base, to_dir, download_delay):
- 
- def use_setuptools(version=DEFAULT_VERSION, download_base=DEFAULT_URL,
-                    to_dir=os.curdir, download_delay=15):
-+    return
-     # making sure we use the absolute path
-     to_dir = os.path.abspath(to_dir)
-     was_imported = 'pkg_resources' in sys.modules or \
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.3.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.30.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.3.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.30.1.bb
index 5c15769e74..a3c7ffe0d9 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.29.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.30.1.bb
@@ -8,13 +8,19 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI += "file://0001-skip-verifying-the-availability-of-setuptools.patch"
-SRC_URI[sha256sum] = "ff6b82ee4533f6fd4474d833e693b44b984f58337173ee98ed76bce08721a636"
+SRC_URI[sha256sum] = "0c6a3e1428f7c6a9aa6c944b9c47a37cd2cdbeb5b5a82d42c33afdd56f14e398"
 
 inherit pypi python_setuptools_build_meta
 
+# Look for libev in the sysroot rather than in host directories
+do_configure:prepend() {
+    sed -i -e 's|^libev-includes = .*|libev-includes = ["${STAGING_INCDIR}"]|' \
+        -e 's|^libev-libs = .*|libev-libs = ["${STAGING_LIBDIR}"]|' ${S}/pyproject.toml
+}
+
 RDEPENDS:${PN} += "\
     python3-cython \
+    python3-deprecated \
     python3-geomet \
     python3-json \
     python3-misc \
@@ -24,5 +30,7 @@ RDEPENDS:${PN} += "\
 "
 
 DEPENDS += "\
-    python3-cython \
+    python3-cython-native \
+    python3-tomli-native \
+    libev \
 "
