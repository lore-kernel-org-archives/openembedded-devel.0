Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A2AC54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 15:14:03 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.54504.1748358837294677894
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 May 2025 08:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UgWfWBvS;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so46532985e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 08:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748358835; x=1748963635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3+1gzy5mSiY82LmPCIjLlLs+XZsryMxbrMHxPFalio=;
        b=UgWfWBvSQBf0Vh5zAYvvG7HlnCDyvHc6bwAW67iWnQsV0a17gBLIbl1dLhQ52DR3/p
         qwHuW6mrmA5xO+qXu6EvHMmgA5jrDVqReY7B7h/pLQr/Sy5nQB/NCjWn/vpJrlew+FSY
         F+5Aam65+epSN4Z6PmsyTWO3GJQHHXr0167JM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358835; x=1748963635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3+1gzy5mSiY82LmPCIjLlLs+XZsryMxbrMHxPFalio=;
        b=jjZYGQvHcXvmTd4wPB5GO3yRxE5DwV0bjluVdhIN722XsYVnwK5tmvmg/PBXDIdd8I
         nScXQABmcAxh+JfizA1as6aRFpsTQX3eESbkTi8H3WgcOXRGg+m2S2HUY6cro9ptix+M
         7o33LCEa3N36zH7CZ7FFzMy2DvDwrj5Tk5M4h41sDsIwrjSakB4QSN6jrqhHfouD/PNM
         9xUqgi6WWgA3LiczxFoPM1y4kfJ1GAvZ4M72oFU1VhoNtk3ax5LePLNece2s8acm/0+a
         y6KS39VuMX8RSK/9mXGniJUHpn5RFQTTzN51BitaT3v6XPU+3Urku/FAGIHKZzYbcAO/
         hO+g==
X-Gm-Message-State: AOJu0YzKMLUcSTatJQKId2kqAqT3LTwWDvcjwKbubKwiSeKJzJGccQJ2
	deq3MENr4Ob+LrFs4cmrP74xKPwuNenpAGrQlXxsoQaUdrbup/O7NBP23oee7/CEvDaVh/RY/+L
	kbyPC
X-Gm-Gg: ASbGncu8Vr3hl3Am2LqGFVcpR/Y7yejCpSwHphJflny1EupHUKqojyK0FO6vhFv1ODC
	a0U8N63Db/eO/YbzoxpSFovWS6YhvhESqYu/NIB7a0A6aZoN9vggSKClwYG64XF1R86iKuKYdam
	WJJ6r1IOixa3yXmp7tVo4rE35BEH9f7mnsr4oiwdksXP4yWMllZOr+Q46TqDRijurDR/VvNB2+K
	mbWMY2arS1+GiF6FqR9bYyErNxKLMNw4Hc8tfCdrILqUsG2QAdIHQLYMtt7XbU06r5+Tytd//He
	RfKXnPPP++oCLLpGnbSFXQTJXqPTaVxoi3nwEeRgviR/Vpzq8G4TuKS643l1+Xn4r6s1hTCoUxe
	h
X-Google-Smtp-Source: AGHT+IElTtuTxDlyeyEMxL68+hPr2ZUBOil1lRMnyR+/JhQRhJTqqEnq+4v/FV0WFUvPiUE5nd3J4g==
X-Received: by 2002:a05:600c:34d3:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-44c91ad6cc6mr156541565e9.10.1748358835396;
        Tue, 27 May 2025 08:13:55 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f18251c7sm272493175e9.3.2025.05.27.08.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:13:55 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-multimedia][scarthgap][PATCH 2/2] python3-pillow-heif: Add recipe
Date: Tue, 27 May 2025 18:13:51 +0300
Message-Id: <20250527151351.564987-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250527151351.564987-1-leon.anavi@konsulko.com>
References: <20250527151351.564987-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 15:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117638

Add recipe for release 0.22.0 to meta-multimedia which depends on
layer meta-python:

- Boolean pillow_heif.options.DISABLE_SECURITY_LIMITS to bypass
  security limit of libheif for the image size.
- libx265 library was updated to the latest 4.1 version.
- libheif was updated from the 1.19.5 to 1.19.7 version.
- AVIF format marked as deprecated and pending for the removal.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...001-setup.py-support-cross-compiling.patch | 56 +++++++++++++++++++
 .../python/python3-pillow-heif_0.22.0.bb      | 20 +++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta-multimedia/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch
 create mode 100644 meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb

diff --git a/meta-multimedia/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch b/meta-multimedia/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch
new file mode 100644
index 0000000000..66cf7a9244
--- /dev/null
+++ b/meta-multimedia/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch
@@ -0,0 +1,56 @@
+From 98e6831754712221ce030ce8b27e100a3926c543 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 5 May 2025 16:08:37 +0000
+Subject: [PATCH] setup.py: support cross compiling
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ setup.py | 19 +++++++++++--------
+ 1 file changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 68945e4..67566e8 100644
+--- a/setup.py
++++ b/setup.py
+@@ -125,12 +125,12 @@ class PillowHeifBuildExt(build_ext):
+                     self._add_directory(library_dirs, match.group(1))
+ 
+         # include, rpath, if set as environment variables
+-        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE"):
++        for k in ("C_INCLUDE_PATH", "CPATH", "INCLUDE", "STAGING_INCDIR"):
+             if k in os.environ:
+                 for d in os.environ[k].split(os.path.pathsep):
+                     self._add_directory(include_dirs, d)
+ 
+-        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB"):
++        for k in ("LD_RUN_PATH", "LIBRARY_PATH", "LIB", "STAGING_LIBDIR"):
+             if k in os.environ:
+                 for d in os.environ[k].split(os.path.pathsep):
+                     self._add_directory(library_dirs, d)
+@@ -199,12 +199,15 @@ class PillowHeifBuildExt(build_ext):
+             self._update_extension("_pillow_heif", ["heif"], extra_compile_args=["-O3", "-Werror"])
+         else:  # let's assume it's some kind of linux
+             # this old code waiting for refactoring, when time comes.
+-            self._add_directory(include_dirs, "/usr/local/include")
+-            self._add_directory(include_dirs, "/usr/include")
+-            self._add_directory(library_dirs, "/usr/local/lib")
+-            self._add_directory(library_dirs, "/usr/lib64")
+-            self._add_directory(library_dirs, "/usr/lib")
+-            self._add_directory(library_dirs, "/lib")
++            include_os_path = os.environ.get("STAGING_INCDIR")
++            if include_os_path:
++                for path in include_os_path.split(os.pathsep):
++                    self._add_directory(include_dirs, path)
++
++            lib_os_path = os.environ.get("STAGING_LIBDIR")
++            if lib_os_path:
++                for path in lib_os_path.split(os.pathsep):
++                    self._add_directory(library_dirs, path)
+ 
+             self._update_extension("_pillow_heif", ["heif"], extra_compile_args=["-O3", "-Werror"])
+ 
+-- 
+2.39.5
+
diff --git a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
new file mode 100644
index 0000000000..7f5dfac702
--- /dev/null
+++ b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Python interface for libheif library"
+HOMEPAGE = "https://github.com/bigcat88/pillow_heif"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b6c07a92aed67c33bc346748d7c7e991"
+
+# While this item does not require it, it depends on libheif which does
+LICENSE_FLAGS = "commercial"
+
+PYPI_PACKAGE = "pillow_heif"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI += "file://0001-setup.py-support-cross-compiling.patch"
+SRC_URI[sha256sum] = "61d473929340d3073722f6316b7fbbdb11132faa6bac0242328e8436cc55b39a"
+
+DEPENDS += "libheif"
+
+RDEPENDS:${PN} += "python3-pillow"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


