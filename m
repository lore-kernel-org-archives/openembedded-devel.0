Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7394C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 06:09:36 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7303.1786687767951841834
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 23:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CE6A7KKA;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca88130e09aso330176a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 23:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786687767; x=1787292567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6wvz/roGBUHlhhvOpc/duPGEcCwFPlqi/15UxzXLyM=;
        b=CE6A7KKAaBcXaSOAS44XMMmadw95oLv4GPJ41hi/6WAKgda3UQh7w6mZLKCWgpTpk/
         kM89NAOAdY9JKu0yLuobsyNRBmnMu4Gz5vwr2oKgRKqXn8sl/bKKwBBN3G0LuokfPb29
         XgNTPitkDoxKaWVRFXRA2h1RPwl4ZykWgwB+pvyGahGRoH7pEvTJiT/wUmIm0a1FpY9b
         VeNvwaF8lM/LuPV7B1Wt/NM+tj+1mXCfSPPAquXBZUPGAYsnB6hHYPDEAg5Vg9KWdgWj
         9Gj4SO/jp6OxvTvBtFsO9RlvcPFkF9LuBBc9tB4hurwVfZwLGzF0rV7dMvGXmrTLPa27
         jGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786687767; x=1787292567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s6wvz/roGBUHlhhvOpc/duPGEcCwFPlqi/15UxzXLyM=;
        b=FfiCbXqk1RIsFm4/VfU6bXw8t8gL60yF16+yXULVXFwReknyGUcKHuD0ll9hAfb85y
         08rFXKc+4gYdeuckKgt6EdDk0s86F8S4Jfk/tYrNC05rBapVmPiW3mQmfHhoBzPuK727
         pbPE1wunXrWjbFChSDcfstxrCQBiD/020Cyzh3/kwxcs+T32Vip4i3uIeJYvAeBlQaGc
         B0KsZtDOfl670NBYBKitQJ2q5pOcqWT4RAT2sWUEpnE2IlHyqtcUwvSD9J0FqKIv+dun
         K6unbFpNQzqQXZ1gW1h/tIfxdt83EjciAJUp5OF9vR7FVSLrSXiCM4ResrpTNi0o/UFe
         N5GA==
X-Gm-Message-State: AOJu0YzyYPIhldliOADFVtP8p9uISmQtbdmswzSWZymHLqNbuP2OLNnE
	L7agzrAlvZajxDWc4D8LEAuV5J3k9qreYcudcBZTL+wTwnHfzj3N7tIAnBclrjMN
X-Gm-Gg: AR+sD13CE1Y/7TFe8H5RlegHgeC5KgHOa3nDhxPhhCZeQeY6XosQIMd62Q/O6Rb+dMZ
	DCpyzn77RqCKEPhJ5PzoZHSwBIiCfT3EsSOBzc/XVU/iRhvUhZe1ql5w8/P8ktj8PVaxLHuffGL
	VSXvHZdHDnykWviaiF5XCz9eNMypZat4OVIB+AtewFEO185rqJFor9yloUgEavh49QePfx60EIL
	xp7TOmX4oKZ6IYdkc5Lbn80n9DqGzGsqCU2iJI241E86+JIW97P+ZQtFlTosGI+vcW+RjYuCeea
	yanlHYFJMurJermSnPEoys4RVphRwfF291wk9evJpINoIlGhrFR40zyL9weejO+uc2b3A559xhu
	mRiUFCGyce1T1XgJNmEmbf2uL6BajhQdMfb+6JWm8wfxzYWCicPgi+ctM95oR9hg85vob3539HP
	zf0uck4aV6Qpb2+O0UQUAj20iWmr5hJ/+0baLCKbj9S0WroiLJfAVZkkflAHeAoorEKAdMphsjo
	zyjSJ6ThgN1M6k6WyHYCl/hgrBlJca3XctpeYVUaHpH+KDfHPNoFgRpaRcux/oY0Vr4nlsKNLz6
	0CW+PmJ6jTXyP4WHTjrMF1ScBgGCMcNRW5f/pWJPJIzIme8he9j41HyvK09Zi4rosFgKmy0hswy
	j05N6E8pMQAzLqpyQdEvvY1RjePgryaxrZ76wsGW7TP7erw==
X-Received: by 2002:a05:6a20:430a:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3cc71988438mr3312818637.5.1786687767071;
        Thu, 13 Aug 2026 23:09:27 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm5403326c88.0.2026.08.13.23.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 23:09:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-pandas: fix stripping of build paths from generated sources
Date: Thu, 13 Aug 2026 23:09:22 -0700
Message-ID: <20260814060922.2788021-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814060922.2788021-1-khem.raj@oss.qualcomm.com>
References: <20260814060922.2788021-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 06:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129038

do_install failed because the glob in do_install:prepend did not match
anything, leaving sed with a literal path to a non-existent file:

  sed: can't read .../build/pandas/_libs/sparse.cpython-*/pandas/_libs/sparse.pyx.c: No such file or directory

meson names the per-target private directory <target>.so.p and puts the
generated sources directly in it, so the actual file is

  ${B}/pandas/_libs/sparse.cpython-314-x86_64-linux-gnu.so.p/sparse.pyx.c

The do_compile:append hunk was meant to do the same job for every
generated source, but it searched for ${WORKDIR}/pandas-${PV}, which no
longer exists now that sources are unpacked under ${WORKDIR}/sources, so
it silently matched nothing.

Fix the remaining pass to look for ${S} and drop the redundant (and
fragile) per-file sed in do_install:prepend. Also parenthesise the -o
expression so the name filter applies to both alternatives, and use
-print0/-0.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-pandas_3.0.5.bb   | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_3.0.5.bb b/meta-python/recipes-devtools/python/python3-pandas_3.0.5.bb
index a9bae34f72..c159113a21 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_3.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_3.0.5.bb
@@ -35,13 +35,10 @@ PYTHONPATH:prepend:class-target = "${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}:"
 export PYTHONPATH

 do_compile:append() {
-    # Fix absolute paths in generated files
-    find ${B} -name "*.c" -o -name "*.cpp" | xargs -r \
-        sed -i 's|${WORKDIR}/pandas-${PV}/|${TARGET_DBGSRC_DIR}/|g'
-}
-
-do_install:prepend() {
-	sed -i -e 's;${S};;g' ${B}/pandas/_libs/sparse.cpython-*/pandas/_libs/sparse.pyx.c
+    # Cython embeds the path of the .pyx it was generated from into the
+    # generated C sources, which are shipped in the -dbg package
+    find ${B} \( -name "*.c" -o -name "*.cpp" \) -print0 | xargs -0 -r \
+        sed -i 's|${S}/|${TARGET_DBGSRC_DIR}/|g'
 }

 EXTRA_OEMESON:append:class-target = " -Dnumpy_inc_dir=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/numpy/_core/include "

