Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3098.1794685057753462577
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 11:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bJ4Bazk4;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f8cdd30beso2414697eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 11:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794685057; x=1795289857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+a2KOXtpgJsdCt2n0JPWLdBbl7Dg/8f4REK96dN9Mw=;
        b=bJ4Bazk4Euysjg1JLTUIqIIyNaZBCtIZYsmbNBG3+YCH89+UldBwV1xzQJZD1GZRA3
         FltDXmPzFQOaeJAkKYn5PGrZivITuAv/+n+2LxaV9zcXvNT2q/FXuPpwde/nKbOPaaBT
         48rK8zv/We6jgMQnMzTi0YzFvl5rIUptGQFzkyOc9hkjWGEcKvg5FIx7zjsMiKuj5dz9
         s6nmqQnR5clx4inedO0LCLO6mZBHzKNi3WesckQ0155jNSX6q6a+Oa4+SBTspqOB6xR3
         DzWVscOtDIp6nrL1X/sw8LShXCmZx7R/4nJXC9piDH9UnRNGrzugclCWGuRaNw73mz+N
         yiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685057; x=1795289857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+a2KOXtpgJsdCt2n0JPWLdBbl7Dg/8f4REK96dN9Mw=;
        b=kWfVkj5pJqZzkCLYCJcFekLgf0pI75X+ybSpYrTVu/PXNPopGA29dW8EskAUMtxAj5
         fqfAyhaBZWdEk+Vh0EGB+kf6+rrDvm0KE0ZFG6MN0lfuCFCZePKdrdFYWYWJzBEmptoK
         5BD33yBMh+TFXhj1cG11PSlp1LXf1Q2Urp+//NTDx2m/VdU/c3kWzFpXMQggVwZLF1Cj
         nGYC3x5dxHJ98DtlwFgmsrHooHtRACpkIPqVC0EQOlKMTMbqrOtiFRC9MNEszQeg1CSk
         Nqbkqxyq/V9CGJpzomNkxO5/jfgsvYCuFsC9uSYL7Kdh7oUTx/AG6HqhsR296sPQqESi
         E8Pw==
X-Gm-Message-State: APuU4Z833+9Xf+yWDTXp9oN3C60Qe+nDoCAtsTfoaEimW6YLywu/5sAJ
	MabXczADOZMsGuDt157UlxFGWa5Jp8YvYonXL1O+E8wiFFddIIfcAeyPe6LRUFa7
X-Gm-Gg: AYBFou1cXRl1eQpNF5R8z6ts9iM2mWrDTBRB5joslLQcPaZ7MTi+LsCNrao2A/JqvJN
	VRha7XycojlKBXBJXft7OX8/E18+YyHDGpytk/ZBVxIfC3Ft/kEzrIEC3q+328rbFEIgem5iqxf
	+DHxehzg86//FlK/Igc6tAYKEYXkc5S3+bTwzkF9jr9ICBlwH6LHakU2hjuqKvmZX5WMq/3QXzB
	T4jsVQvzIi52aVniQcOjzz6hAv1Gg2hHBIJolzvhoP6B9tE/1vMk0Fi5NKrS0LmFZv0H1Zblihi
	mAMPxS62Z8b3xKdv++Zal9WjY76Ypnm4nTSiTXbcN8axamR7WIr3vkLp+TSpl1J4me6ma12051S
	CcTwomKt2wr3RsrpwSGMsaDA8rI6dtes2UZKI+Jk9BWtR83mHw310aRB2NayN3PsUZq9wSwClQq
	x3ftWZF2rkuXB/5gMnC3F6Oked+KwRexEZxewtXaseucOd6UBBj306aAXsOeAHBCv2lmEtcr/sH
	HMDRqjrpku1NBg4JKL3Un6qU5qHl2q5Hxx7JI+Jvsvw8Tvl4YJchFly2wrgprLPLigf2ML7mw0G
	jAZAnzB6aa3JTN1ARfhvb3IMVeTEJ93GXciLhz+ZbKMUvbkUeRLz7ranLYextu4XwORH+VcbKJf
	A8dCUVabrv+vJO7svYCHuAVg5f7wj84ZcgUlGVlXVKWVVDxvI6B5AgP5sSo2ypS8XgwKGSS6av2
	4esvgTImLFshLiyYnXPdPIu58C7aYaQAYhL0bS4J5N/mHxVzjb8h0WrXxg5jAA9WKUU6ChlMm3i
	S8N8Pp1NPvGJAAK5CJd3aRPWCyzcCTz6ykCWuGpFtgVm0YmpL6b+T5vULjfJfVmdKXIV372SAJb
	1k0+
X-Received: by 2002:a05:693c:805c:b0:376:9323:22b8 with SMTP id 5a478bee46e88-37965da96e5mr7097702eec.10.1794685056834;
        Sat, 14 Nov 2026 11:37:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm16855164eec.4.2026.11.14.11.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:37:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 01/13] frame: Fix build with lld without x11
Date: Sat, 14 Nov 2026 11:37:21 -0800
Message-ID: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 19:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132258
Content-Type: text/plain; charset="utf-8"

The frame_x11_* functions are only built with the X11 backend, but the
version script always lists them, so lld fails without x11 with:

  error: version script assignment of 'FRAME_2.2' to symbol 'frame_x11_new' failed: symbol not defined

Generate a version script without them when the X11 backend is disabled.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...bols-from-the-version-script-without.patch | 50 +++++++++++++++++++
 .../canonical-multitouch/frame_2.5.0.bb       |  4 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/canonical-multitouch/frame/0001-Drop-the-X11-symbols-from-the-version-script-without.patch

diff --git a/meta-oe/recipes-support/canonical-multitouch/frame/0001-Drop-the-X11-symbols-from-the-version-script-without.patch b/meta-oe/recipes-support/canonical-multitouch/frame/0001-Drop-the-X11-symbols-from-the-version-script-without.patch
new file mode 100644
index 0000000000..816f6bcf76
--- /dev/null
+++ b/meta-oe/recipes-support/canonical-multitouch/frame/0001-Drop-the-X11-symbols-from-the-version-script-without.patch
@@ -0,0 +1,50 @@
+From ef439367ab9ead953b128971cf85349669802441 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 9 Nov 2026 08:37:30 -0800
+Subject: [PATCH] Drop the X11 symbols from the version script without X11
+
+When the X11 backend is disabled, the frame_x11_* functions are not
+built, and linkers that check the version script, like lld, fail with:
+
+  error: version script assignment of 'FRAME_2.2' to symbol 'frame_x11_new' failed: symbol not defined
+
+Generate a version script without them in that case.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/Makefile.am | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 0d1f547..3664644 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,4 +1,12 @@
++if HAVE_XINPUT
+ version_script = $(srcdir)/libframe.ver
++else
++# The X11 backend is not built, so its symbols must not be in the version script
++version_script = libframe-nox11.ver
++libframe-nox11.ver: $(srcdir)/libframe.ver
++	$(AM_V_GEN)sed -e '/frame_x11_/d' $(srcdir)/libframe.ver > $@
++CLEANFILES = libframe-nox11.ver
++endif
+ 
+ lib_LTLIBRARIES = libframe.la
+ 
+@@ -7,6 +15,8 @@ libframe_la_LDFLAGS = \
+ 	-Wl,-z,defs -Wl,--as-needed \
+ 	-Wl,--version-script=$(version_script)
+ 
++libframe_la_DEPENDENCIES = $(version_script)
++
+ libframe_la_LIBADD = \
+ 	-lm \
+ 	$(COVERAGE_LIBS) \
+@@ -69,4 +79,4 @@ libframe_la_SOURCES += \
+ 	x11/window_x11.cpp
+ endif
+ 
+-EXTRA_DIST = $(version_script)
++EXTRA_DIST = $(srcdir)/libframe.ver
diff --git a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
index 3afc9c0b31..57ad7a85db 100644
--- a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
@@ -13,7 +13,9 @@ inherit autotools pkgconfig features_check
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 
 SRC_URI = "https://launchpad.net/${BPN}/trunk/v${PV}/+download/${BPN}-${PV}.tar.gz \
-           file://pessimizing-move.patch"
+           file://pessimizing-move.patch \
+           file://0001-Drop-the-X11-symbols-from-the-version-script-without.patch \
+           "
 
 UPSTREAM_CHECK_URI = "https://launchpad.net/frame/trunk"
 
