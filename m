Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35866.1792987104727083772
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2026 20:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g3Q1G+jq;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-354ba08cfd1so4707234eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 20:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987104; x=1793591904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pq9Cd9JckRRn1FAKHf5S5DGp5sbKP3dsTU0sxdo4opU=;
        b=g3Q1G+jqYNp5zz/JvtZK37o1t2YPIHby++HamFpjQ/8TNqk+Tf95N9qkh3idajRA1/
         DnERtizdkd3b3OCIKzy866u+sW2FdEQqTHqdR2tPDcN0E7gbrcs9FRXCl8aiw3ARNsPf
         rqi4/CXdI12NykHjTWQ2foxZeOzPhX2ynkljL0LnuzQjcf6PUh/Bqsk/5KXUbM0rNx4a
         zVih1HMZq5oy0HAWkykJfbPHIx0FP0y42pMz5o8Xzx197INUozLyhNN+4BW/fH2hMN77
         ghD49Vw/AR0WPIvfzHKCiNa1SrDgrOAjQrzSjTZ6OncAcb9ZkvWGVgpi0e7sxHw+E5jm
         oSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987104; x=1793591904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pq9Cd9JckRRn1FAKHf5S5DGp5sbKP3dsTU0sxdo4opU=;
        b=ppHaQs7GHNpw7PfcGieeEBt9UoIRqV+90lefE4FSW5RlmJUN94G5kctNuMt9rSWgie
         WC7lp/dXO3XX9ZzKcyHPFlCwEpEl1AePhXtkdWi159jD2lEdYNb1HegmD0LQFRlx/n2g
         vRHJ08bOuvSJCJX/uAbJCa5bjvDecRK3dq+923LbZA4mjjGWoBb8OzOyl9RvM+0czzRC
         49KxPmB0nSLd2LLS3oEp83IPjlZccBVEq3bbkfvO1Rkd0b3PUnq7EhrmXJDq20ujZJ2p
         sERCgqdJW8ChRS6VPlY/ohOHEy6pajBHrhqDvHJ3Ji9Y2VIAplMDfzZ/kp5/CNArXvwm
         iVTg==
X-Gm-Message-State: AFq9FYLNtsEaXff4ONsiNQJtJ3XT0C5icnYMxtCdLTZaWkXckBtbhaQU
	zR2/yTc7kBQH1wESFmwyWFKRbQ85uwbBsfjllBwlwKBbrX6xCaC6nJtRBMMHF5A9hjY=
X-Gm-Gg: AYBFou3jrIt8NfX3r+KGjAsiOsPAhSNfo73eYqOMx7Tnp/PRDafYbTiMQbxRdMi9ZLF
	gIkNIQm9ND/b7uy2bteOfjrw5Cz9HV+McG9ZSQyBa150ai610jveC36S5lfcMJ9WcLnurt3lrx2
	UDVtXFj4QZ/j/1c48ANiCJk5R54ZcTjvpzZ0dBvdk9Xy1mPC2voikLPsckT5AhhxZdLy2r2Wtk5
	aw+8g5+Iw4vYRwgSQKGGq9/QQnCye6vE5MGovK0vnV07RiyffxUy9kehJAeKqaV4zr0JxTsiB8g
	Lxc8m0/Zw4H80vRjuN4nwVJ1Yw4JeyxbzZX5JlVDxcjyVaLJsEpSJdkCZGeODOmKFMXSbT+c8XG
	HthFjMa2FZxDi7dFIG1vTIwT+jcPOF6nO43sR7ZoEzBCFZEsJUpBZR9UoA170JxmLniNVqy49PS
	WRk7O7/6shDLgwKU2kHwrTHs0lurarCzVrFT43OIi2U5KInaeSH73Qw8EMoaBRfmXZnHAKLp3te
	aEJ+ULGZ2cyDRdNBWLq/DVr7KANhdXfk+pB2+/93AVoPlHX/0GrXa1hPnwBcgdpIURRiVRW621z
	i0MTc+7MmbWe5aBbUQ/4gmrOJsH05GuPXiLLh4Qooz0S13WgdBz6kR/UJxX3MVt3Z2ipkDO/2N7
	Ipi4QpVGAtXRh569yXWES5eZXvfiAGtP0JKvp67HIsZRL9kjR6riUjwvP/5ph3xzAJXUT36vy+0
	4IMbzk8sVyzmJFztHC1UykGlT7oyYzmO1kiVDvWLtEjtwJh+xw3NwBqgJ3kH9d93+6T3a9J2QYN
	DExfc4ZfPSMwOAvc//Nb104unN/rcQ=
X-Received: by 2002:a05:693c:66d2:10b0:35d:2633:ff79 with SMTP id 5a478bee46e88-369e8620108mr8075142eec.40.1792987103925;
        Sun, 25 Oct 2026 20:58:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm13277417eec.15.2026.10.25.20.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:58:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 5/8] hdf5: Add PACKAGECONFIG for the C++ library
Date: Sun, 25 Oct 2026 20:58:11 -0700
Message-ID: <20261026035814.55254-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026035814.55254-1-khem.raj@oss.qualcomm.com>
References: <20261026035814.55254-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131417
Content-Type: text/plain; charset="utf-8"

Since 1.14.0 upstream no longer builds the C++ library (libhdf5_cpp,
libhdf5_hl_cpp) by default, so recipes that need it fail to find it.
Add a "cpp" PACKAGECONFIG to turn on HDF5_BUILD_CPP_LIB, keeping it
disabled by default.

The C++ build also installs the h5c++ compiler wrapper, which needs the
same RECIPE_SYSROOT_NATIVE cleanup and multilib script handling as h5cc.

Fixes: https://github.com/openembedded/meta-openembedded/issues/814

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index a0eb5eb155..4e493f0aa7 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -35,6 +35,10 @@ EXTRA_OECMAKE = " \
     -DCMAKE_INSTALL_PREFIX='${prefix}' \
     -DHDF5_INSTALL_LIB_DIR='${baselib}' \
 "
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[cpp] = "-DHDF5_BUILD_CPP_LIB=ON,-DHDF5_BUILD_CPP_LIB=OFF"
+
 EXTRA_OECMAKE:prepend:class-target = "-DCMAKE_CROSSCOMPILING_EMULATOR=${WORKDIR}/qemuwrapper "
 
 gen_emu() {
@@ -60,9 +64,14 @@ do_install:append() {
     # Used for generating config files on target
     oe_multilib_header H5pubconf.h
     sed -i -e 's|${RECIPE_SYSROOT_NATIVE}||g' ${D}${bindir}/h5cc
+    if ${@bb.utils.contains('PACKAGECONFIG', 'cpp', 'true', 'false', d)}; then
+        sed -i -e 's|${RECIPE_SYSROOT_NATIVE}||g' ${D}${bindir}/h5c++
+    fi
 }
 
-MULTILIB_SCRIPTS += "${PN}:${bindir}/h5cc"
+MULTILIB_SCRIPTS += "${PN}:${bindir}/h5cc \
+                     ${@bb.utils.contains('PACKAGECONFIG', 'cpp', '${PN}:${bindir}/h5c++', '', d)} \
+"
 
 BBCLASSEXTEND = "native"
 
