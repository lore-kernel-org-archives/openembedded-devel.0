Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FC1C5516F
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:56 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13602.1785620746750484036
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ysy7UyCf;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c998fd549a8so1704623a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620746; x=1786225546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cf7ro5rfUT/Zxr9HKpD1DwAEk8UVa7g0wQJ16P79rWU=;
        b=Ysy7UyCfdspYIAfcZ3/NL03Sb8SEi0ExOc1Bye/mJPdhQPnDM/1lc2wnslsyufkuDF
         HerFgsTinVMkGuD5PihydtRzxDlxrD7kOJl7yBOhxL5zL1w9Pz8vrc8omNRE1+7Eqryr
         bd4CsT96JKeEAHeUT1sWMcsShdPzQVvhGJpaKYUGIhMtH6eX6TA+Q8wll9GH9GImmcIs
         BKABde9xZ0s5/iN7dClt9nnnkeuZGCMS/kENPAhM9/aTMCtwDTcZ5t1WbipvFrdGfwMI
         jxsnDBJiEo4ibqPTbBrepM8W2KTeh7cnBG7txV/IGT6neAGjRpXOAYfjyXzMU2iNkCdX
         zBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620746; x=1786225546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cf7ro5rfUT/Zxr9HKpD1DwAEk8UVa7g0wQJ16P79rWU=;
        b=eSBHUwIsyVLCXU1eEeGjeA3VD87S6NQRQWLniyS34cHXzhZJ1dIsFGInXo5pcMwfLZ
         ISTH36ywxJovUOzblybU0SzhdASc+lZr28WUG+8Ry18GGVpOd96P4U4uclpEIIohctH2
         tbb2REfrWI+haFg7rDwK9Mw8S2vgOwuJeP1z6htPhFQQPDlUhb9iw0X+1SFg7+P8fiQ5
         ddOJdlnV2sNZ52uqiq1BIr75LyBkKM9qXiai8NGfDygw+Wsz/5m/OJW+y12Asfo2NCS9
         cW1EcFX7AR41VA/ifTEp/zhScoXNOKdbU+PHER/+4i0KoqQ1p7MtsjR1EUl3XpQWlT9U
         CJyg==
X-Gm-Message-State: AOJu0Yy2cX9aEnXT+KA7fDBRcN2dyEOFS56Av8+Wc0A0UBqI9EtAYBBZ
	Mol8ZwZTUckq23ziNazVKpmeLgRiiJQGamHrjbV60MUWI2mjI6KVx4Iw/rfc5t2y
X-Gm-Gg: AR+sD10cUcLXAvyQXPYiHsGDPa43fb8tLqHm8J5JzEeuINFAQ3/q/MlWDY93xrKpgiJ
	BrWv211Y/qzRLLKGMEmhdFgJS643qAkN/vytfO/VzPcE0Vjn6/h/14FUOuyaUyiqJ2Ys6HosxZS
	R2FURZQPhP/HT3KNMN5g+za8yiXOWLa2OyCEThLlw3jdQTqQiIrywJ8zjbOZBZnX2g82xFDpMaI
	bejlcI7ElPBXxE41QzrrAOsCw0dGOGdgC3N7x01SIZEkX6TDdy46y0ysJkvT0PilTFW6tdOC+Lq
	zGfsD9u/e/t3EyT8Z3rk+rT2YsihQy1o5qHrjeeG0vq//PwykyCf9pmScTWXFmzhVqL1+icJHQ/
	zx48OkcxIFtQRflRrL+PLoYwQ9/FVwPT66R5GSpEJqT7ij4JY0Hh8QvR82LW4UzxewQcLO7OMZ6
	MIyoBQHLa8uze3pf/e5sWKA3mNivIVQilFpeWdc960xHjOjsJB3TkfK9n0jj80kzRt4VjcPS7Cw
	LswDnMErstUzJ0dZhXi4SPfNymUFGiJWoXPeY5flFrB5JqwPmJE89CSdtkBuxNwF56oesAtczrk
	9Dq1wVIhHBuzXjkFivABd1frQzmEmqtm8GPYK61Q4jIn7ZwDx19FtEnX/S6F8+GzXbR/PgqDqTm
	dfw==
X-Received: by 2002:a05:6a21:1584:b0:3bf:a0e5:999a with SMTP id adf61e73a8af0-3c92a8378femr5660526637.48.1785620745967;
        Sat, 01 Aug 2026 14:45:45 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 18/31] python3-pillow-heif: upgrade 1.1.1 -> 1.5.0
Date: Sat,  1 Aug 2026 14:45:13 -0700
Message-ID: <20260801214526.788343-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128635

Upstream changes (release notes):
 * 1.2.0: dropped Python 3.9; PREFERRED_DECODER must be a valid decoder.
 * 1.3.0: pixel-aspect-ratio (pasp) read/write; free-threaded (no-GIL)
   Python support; fix integer overflow in the encode path leading to a
   heap OOB read (CVE-2026-28231).
 * 1.4.0: track newer bundled libheif/libde265/libx265 (not used here -
   the recipe builds against the system libraries); minimum libheif
   raised to 1.19.0.
 * 1.5.0: grid (tiled) image encoding via options.GRID_TILE_SIZE /
   tile_size, info["tiling"] read-back, and PH_LIBHEIF_CMAKE_ARGS.

Refresh 0001-setup.py-support-cross-compiling.patch for 1.5.0: setup.py
context shifted, so the patch applied with fuzz and failed the patch-fuzz
QA check. Regenerated against 1.5.0 (same STAGING_INCDIR/STAGING_LIBDIR
changes).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-setup.py-support-cross-compiling.patch      | 12 +++++++-----
 ...ow-heif_1.1.1.bb => python3-pillow-heif_1.5.0.bb} |  2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)
 rename meta-multimedia/recipes-devtools/python/{python3-pillow-heif_1.1.1.bb => python3-pillow-heif_1.5.0.bb} (85%)

diff --git a/meta-multimedia/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch b/meta-multimedia/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch
index 66cf7a9244..ea6ce13e67 100644
--- a/meta-multimedia/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch
+++ b/meta-multimedia/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch
@@ -3,6 +3,8 @@ From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Mon, 5 May 2025 16:08:37 +0000
 Subject: [PATCH] setup.py: support cross compiling

+Refreshed for pillow-heif 1.5.0 (context shifted).
+
 Upstream-Status: Inappropriate [oe specific]

 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
@@ -11,10 +13,10 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 11 insertions(+), 8 deletions(-)

 diff --git a/setup.py b/setup.py
-index 68945e4..67566e8 100644
+index f6d444d..29b6b4d 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -125,12 +125,12 @@ class PillowHeifBuildExt(build_ext):
+@@ -126,12 +126,12 @@ class PillowHeifBuildExt(build_ext):
                      self._add_directory(library_dirs, match.group(1))

          # include, rpath, if set as environment variables
@@ -29,8 +31,8 @@ index 68945e4..67566e8 100644
              if k in os.environ:
                  for d in os.environ[k].split(os.path.pathsep):
                      self._add_directory(library_dirs, d)
-@@ -199,12 +199,15 @@ class PillowHeifBuildExt(build_ext):
-             self._update_extension("_pillow_heif", ["heif"], extra_compile_args=["-O3", "-Werror"])
+@@ -210,12 +210,15 @@ class PillowHeifBuildExt(build_ext):
+             )
          else:  # let's assume it's some kind of linux
              # this old code waiting for refactoring, when time comes.
 -            self._add_directory(include_dirs, "/usr/local/include")
@@ -51,6 +53,6 @@ index 68945e4..67566e8 100644

              self._update_extension("_pillow_heif", ["heif"], extra_compile_args=["-O3", "-Werror"])

+
 --
 2.39.5
-
diff --git a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.1.1.bb b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.5.0.bb
similarity index 85%
rename from meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.1.1.bb
rename to meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.5.0.bb
index c4dce72085..4558715113 100644
--- a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.1.1.bb
+++ b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.5.0.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "pillow_heif"
 inherit pypi python_setuptools_build_meta

 SRC_URI += "file://0001-setup.py-support-cross-compiling.patch"
-SRC_URI[sha256sum] = "f60e8c8a8928556104cec4fff39d43caa1da105625bdb53b11ce3c89d09b6bde"
+SRC_URI[sha256sum] = "16b11a37b762ff42da2d36527bb5cb14bd9194c24c389ee911155d6e23c53065"

 DEPENDS += "libheif"


