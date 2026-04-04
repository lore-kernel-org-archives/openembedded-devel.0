Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F81E88D88
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 06:50:41 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11933.1775285436205440492
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 23:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XS0QrvTp;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c5b3d8eab1so1642961eec.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 23:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775285435; x=1775890235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iYwFAbOdwTPKrv51E/7ZE/WzjlaB0bSur620YclsJ5k=;
        b=XS0QrvTpcXiMAiqnkyD9CAjq9gjfr3zubAtHr3g5HEE5+g+MDqtj0phEb5C5lMPfuu
         qUuBm3ttk+52Qu+aDtz5T3E1UdauZ4qsSffQu4jAzERDf4nQrWzioV8xn2hG7aDaBwkh
         0r43i86DY+1EmptYxQ35fs8LjeoKLraWoW7vQjgPatptTfLKUR1F0QV9UfX+s1yMgijE
         AY36WkvhUSsoOrmYf/4kjF95zp8+iLWNm00TkgrWAE1o18sEaaBCRlDeiPQMPRyRTZ5k
         YOd/NOmL42a0xcjBb4ttzkar+PRbPPpuTcrFz8AhDSDXe9tirmBLZUws6/S+WpqlC5NS
         5p0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775285435; x=1775890235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYwFAbOdwTPKrv51E/7ZE/WzjlaB0bSur620YclsJ5k=;
        b=VtShqwcfBL0t+i4gWLCUq77T7UFL7fAMbI8Itmkr7E6hbRIwc4l5keXmC+GX/vc4su
         bsOFliJZl4lH3sv1A66eAmydrlVu4xCVUvvQBb8/XvI9fpI/d85cIS8D11JVNfhn1NVb
         SjO6ex12iyrc3b7hx57SDitMa/+giy3hz+aPflv5sXaIGOrO39I0miey2Sm3gNI9GH2J
         vmW79D+nCEWQv7Msk/QHo2tr0c/637eCmFqVMlcD2UHsrVwiuZOgifhPm3UYrQ4R0LkA
         Ks7jSlYgx0ipnO3lMSunm/P90AtXRv1cIiBE2tqkToPvOgr/cuBU28LKbPX0M01wF73s
         yvaQ==
X-Gm-Message-State: AOJu0Yw2vf3FpguYWbp8UIxaD46Tc5C0MQcfuXmeY4Tn+x3w/kABHB0W
	GcmKyqqLWdYawghh5dMfcFWl9AQCXKTzRkqOAqaFHTWnACdNmbw9iAgxUfsyjA==
X-Gm-Gg: AeBDiev+3fotWPl/18/sE5ZghPwpEGBwpaMMp8jw3+EcLhnxJ/1SFnfVVULHmMrjq9N
	4mqMGIhUGu2l60z0B6z7x9mH/sYIqSFmvTSA/E83hmMLHgFloGvAT50opmTlvn441CO2q1cuFRf
	g1Da4oVdYvxmFAm2Nx4tVip9pGe/A91cWdbjJd6K1GygSdR67JUNxlYn241KsUcFSfuNhfrRtAU
	tOBd6IdAQciPICjQ072Zwe+ZfHWK8Nr50Gu0W5sXkHum5aPcM34X8RLAiXBPeNRk2stDNDcURdR
	fDvviHqRL2t3jDFzB5LqW904eK0xXzT7k3o8Lc58O0tTT+pjJrj9Xp+3OOdXPpw+vjuKEY5lxmu
	Bg7h9P8ae/dRqTh1NJFa2hHJJ7WrnfWREXg/Vb0djsqVCIJJRly4IuAxBVf0nir95Sb5pbdO5ZQ
	OorduF7knCmFWI4BzO3AN5gBlqAtYD+Zr5X9rA9CIiUhkN9DpWex15M80S/rhvYvK++QsPBcEPx
	ljOZMCToIMnYwIUfymQNBLYqW2vfwEM/1SM90GlSE195U523GK1O8qejnCI
X-Received: by 2002:a05:693c:3005:b0:2c5:60d0:7031 with SMTP id 5a478bee46e88-2cbf97f57d8mr2991322eec.4.1775285435157;
        Fri, 03 Apr 2026 23:50:35 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cc6e17e0bdsm3476629eec.31.2026.04.03.23.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 23:50:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] krb5: Fix build with autotools 2.73
Date: Fri,  3 Apr 2026 23:50:29 -0700
Message-ID: <20260404065029.3247204-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2026 06:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125994

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...lace-K5_AC_INIT-with-explicit-AC_INI.patch | 37 +++++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.22.2.bb  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-configure.ac-replace-K5_AC_INIT-with-explicit-AC_INI.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-configure.ac-replace-K5_AC_INIT-with-explicit-AC_INI.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-configure.ac-replace-K5_AC_INIT-with-explicit-AC_INI.patch
new file mode 100644
index 0000000000..9fb9b38a63
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/0001-configure.ac-replace-K5_AC_INIT-with-explicit-AC_INI.patch
@@ -0,0 +1,37 @@
+From 1b54d6a42677bd4209cf5c893802c7f60dc0ad75 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 3 Apr 2026 23:43:18 -0700
+Subject: [PATCH] configure.ac: replace K5_AC_INIT with explicit AC_INIT
+
+autoreconf expects configure.ac to contain a literal AC_INIT invocation.
+krb5 currently uses the custom K5_AC_INIT wrapper, which expands to
+AC_INIT but is not recognized by autoreconf's initial sanity check,
+causing configuration to fail with:
+
+  autoreconf: error: configure.ac: AC_INIT not found
+
+Replace K5_AC_INIT([aclocal.m4]) with its explicit expansion:
+AC_INIT(...), AC_CONFIG_SRCDIR([aclocal.m4]), and build_dynobj=no.
+
+This preserves the existing behavior while allowing autoreconf-based
+builds to succeed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/configure.ac | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/configure.ac b/src/configure.ac
+index 4325fae..03e224f 100644
+--- a/src/configure.ac
++++ b/src/configure.ac
+@@ -1,4 +1,6 @@
+-K5_AC_INIT([aclocal.m4])
++AC_INIT([Kerberos 5], m4_defn([K5_VERSION]), m4_defn([K5_BUGADDR]), [krb5])
++AC_CONFIG_SRCDIR([aclocal.m4])
++build_dynobj=no
+
+ # If $runstatedir isn't set by autoconf (<2.70), set it manually.
+ if test x"$runstatedir" = x; then
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.22.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.22.2.bb
index 5d8ab2dc01..89e5502847 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.22.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.22.2.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://debian-suppress-usr-lib-in-krb5-config.patch;striplevel=2 \
            file://fix-strchr-conformance-to-C23.patch;striplevel=2 \
            file://crosscompile_nm.patch \
+           file://0001-configure.ac-replace-K5_AC_INIT-with-explicit-AC_INI.patch;striplevel=2 \
            file://etc/init.d/krb5-kdc \
            file://etc/init.d/krb5-admin-server \
            file://etc/default/krb5-kdc \

