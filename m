Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C53C7EE2C
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 16:54:38 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.2159.1692377672160596428
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Aug 2023 09:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KAoQncDa;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6889288a31fso796055b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 09:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692377671; x=1692982471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lLfcb62G9FXsEeU4kdvprkn70bGbERkvQ3SedSIiyYc=;
        b=KAoQncDacrFX1lWh+zsADf6CCAYb/LvG4+T9qSoq70hOk+gEw/bwO2+dC7QPcr3/6q
         VrHuZgUrVpRz6BOKgGm+SOP/V5scGoLx0cwwIy4uaZcrE0C7NYDhh75gp1+jIM4+aR0B
         /S4kxGAW2lXYeWwTDaSHfin58/8f7Ol/CIdevaLKS45q/GdV7V1lK4U19Eg4p1KOagDo
         9QcAC02IYC601XhYFRhHFxBxpZ6ffn4TvvPfYKtu7O6FxnlIS2RMH3fYEP9D9wA5Bfri
         HNxJOf8jbp7y1JRb95v1FJzAtj1kyjR4H7zzGlu0c8fCemmCSxajvJxxf4OCwH/y+2lh
         TWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692377671; x=1692982471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLfcb62G9FXsEeU4kdvprkn70bGbERkvQ3SedSIiyYc=;
        b=RVVV0FDOm3yrFa34lJHOEC5nfxpReboWGaxZ5MeQAYMtJOMhsQ8THKvdQmrt/rlq9m
         7aW8NYVI2N2pJIET5qAlMyYRoFTOKikHwnvwHW6OGX0M6mdyeMNvOoXzOZX4tB8Ygz6U
         2nqz+03j3TSHD4ka99o1W1ggH+6oM7d7CNgt6WJ0uL7o9uxhelBcyNkImIb8NYiXRgVm
         Uxb41Hqn0lhe6/IEvm1Fz38oCO0SN2v1zlu/6R1JoxOU804zNuNDO8N/5esXDIEO93QT
         /5bb45uYY4Mp4jmdqixeH0rXTDsBhuoAUs9YGG4gntOwHNfIgRxhAnTBDv24BgiDfZZ2
         +utg==
X-Gm-Message-State: AOJu0YxPDf4dcZh8QhgOFARfE5wRbemGYnQNKFawARrF51LBp7cv7/Ki
	SZQ4PIgZSm7tq2QOmsif8jQiAr5jEZuz7w==
X-Google-Smtp-Source: AGHT+IHFTdbztum/2TyM3NNOMg7nknk8TBV6Pk6yNsoo7shbukb2UyxHVjjDjyDYSbEhpUrScXyB9Q==
X-Received: by 2002:a05:6a00:847:b0:67a:72d5:3365 with SMTP id q7-20020a056a00084700b0067a72d53365mr9815220pfk.6.1692377671222;
        Fri, 18 Aug 2023 09:54:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::e31a])
        by smtp.gmail.com with ESMTPSA id e12-20020a62aa0c000000b00689f8dc26bdsm1768228pff.109.2023.08.18.09.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 09:54:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] librelp: Add packageconfigs for TLS implementations
Date: Fri, 18 Aug 2023 09:54:28 -0700
Message-ID: <20230818165428.2277167-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 16:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104492

valgrind is not available on all arches e.g. riscv so enable it
conditionally

Enable openSSL TLS by default and add option to enable gnuTLS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...piler-warnings-with-enable-tls-opens.patch | 88 +++++++++++++++++++
 .../rsyslog/librelp_1.11.0.bb                 | 14 ++-
 2 files changed, 100 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-tcp-fix-some-compiler-warnings-with-enable-tls-opens.patch

diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-tcp-fix-some-compiler-warnings-with-enable-tls-opens.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-tcp-fix-some-compiler-warnings-with-enable-tls-opens.patch
new file mode 100644
index 0000000000..3ce5926333
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/librelp/0001-tcp-fix-some-compiler-warnings-with-enable-tls-opens.patch
@@ -0,0 +1,88 @@
+From 6e9b27f04132287463c89d3be0ce4f506944920d Mon Sep 17 00:00:00 2001
+From: Patrick Williams <patrick@stwcx.xyz>
+Date: Fri, 3 Feb 2023 16:11:29 -0600
+Subject: [PATCH] tcp: fix some compiler warnings with enable-tls-openssl
+
+When --enable-tls=no and --enable-tls-openssl=yes, the following
+compiler errors are reported:
+
+```
+| ../../git/src/tcp.c:3765:1: error: no previous declaration for 'relpTcpGetRtryDirection_gtls' [-Werror=missing-declarations]
+|  3765 | relpTcpGetRtryDirection_gtls(LIBRELP_ATTR_UNUSED relpTcp_t *const pThis)
+|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
+| ../../git/src/tcp.c:3583:1: error: 'relpTcpChkPeerName' defined but not used [-Werror=unused-function]
+|  3583 | relpTcpChkPeerName(NOTLS_UNUSED relpTcp_t *const pThis, NOTLS_UNUSED void* cert)
+|       | ^~~~~~~~~~~~~~~~~~
+```
+
+Fix these by:
+    1. Add static on the openssl path for relpTcpGetRtryDirection_gtls.
+    2. Move the relpTcpChkPeerName forward declaration to another ifdef
+       leg.
+    3. Wrap relpTcpChkPeerName in gnutls-based ifdef.
+    4. Remove relpTcpChkPeerName_gtls from openssl path.
+
+Upstream-Status: Backport [https://github.com/rsyslog/librelp/pull/255]
+Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
+---
+ src/tcp.c | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/src/tcp.c b/src/tcp.c
+index 7a75cc4..18cffda 100644
+--- a/src/tcp.c
++++ b/src/tcp.c
+@@ -132,12 +132,12 @@ callOnErr(const relpTcp_t *__restrict__ const pThis,
+ static int LIBRELP_ATTR_NONNULL() relpTcpGetCN(char *const namebuf, const size_t lenNamebuf, const char *const szDN);
+ #ifdef HAVE_GNUTLS_CERTIFICATE_SET_VERIFY_FUNCTION
+ static int relpTcpVerifyCertificateCallback(gnutls_session_t session);
++static int relpTcpChkPeerName(relpTcp_t *const pThis, void* cert);
+ #endif /* #ifdef HAVE_GNUTLS_CERTIFICATE_SET_VERIFY_FUNCTION */
+ #if defined(HAVE_GNUTLS_CERTIFICATE_SET_VERIFY_FUNCTION) || defined(ENABLE_TLS_OPENSSL)
+ static void relpTcpChkOnePeerName(relpTcp_t *const pThis, char *peername, int *pbFoundPositiveMatch);
+ static int relpTcpAddToCertNamesBuffer(relpTcp_t *const pThis, char *const buf,
+ 	const size_t buflen, int *p_currIdx, const char *const certName);
+-static int relpTcpChkPeerName(relpTcp_t *const pThis, void* cert);
+ #endif /* defined(HAVE_GNUTLS_CERTIFICATE_SET_VERIFY_FUNCTION) || defined(ENABLE_TLS_OPENSSL) */
+ 
+ 
+@@ -2820,11 +2820,6 @@ relpTcpLstnInitTLS_gtls(LIBRELP_ATTR_UNUSED relpTcp_t *const pThis)
+ {
+ 	return RELP_RET_ERR_INTERNAL;
+ }
+-static int
+-relpTcpChkPeerName_gtls(LIBRELP_ATTR_UNUSED relpTcp_t *const pThis, LIBRELP_ATTR_UNUSED void *vcert)
+-{
+-	return RELP_RET_ERR_INTERNAL;
+-}
+ #endif /* defined(ENABLE_TLS)*/
+ 
+ 
+@@ -3579,6 +3574,7 @@ finalize_it:
+ 
+ }
+ 
++#ifdef HAVE_GNUTLS_CERTIFICATE_SET_VERIFY_FUNCTION
+ static int
+ relpTcpChkPeerName(NOTLS_UNUSED relpTcp_t *const pThis, NOTLS_UNUSED void* cert)
+ {
+@@ -3592,6 +3588,7 @@ relpTcpChkPeerName(NOTLS_UNUSED relpTcp_t *const pThis, NOTLS_UNUSED void* cert)
+ 	#endif /* #ifdef  WITH_TLS*/
+ 	LEAVE_RELPFUNC;
+ }
++#endif
+ 
+ static relpRetVal LIBRELP_ATTR_NONNULL()
+ relpTcpAcceptConnReqInitTLS(NOTLS_UNUSED relpTcp_t *const pThis, NOTLS_UNUSED relpSrv_t *const pSrv)
+@@ -3761,7 +3758,7 @@ relpTcpGetRtryDirection_gtls(relpTcp_t *const pThis)
+ 	return gnutls_record_get_direction(pThis->session);
+ }
+ #else /* #ifdef ENABLE_TLS */
+-relpRetVal LIBRELP_ATTR_NONNULL()
++static relpRetVal LIBRELP_ATTR_NONNULL()
+ relpTcpGetRtryDirection_gtls(LIBRELP_ATTR_UNUSED relpTcp_t *const pThis)
+ {
+ 	return RELP_RET_ERR_INTERNAL;
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
index eebfece3f2..c64eaf2c48 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -4,11 +4,12 @@ HOMEPAGE = "https://github.com/rsyslog/librelp"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1fb9c10ed9fd6826757615455ca893a9"
 
-DEPENDS = "gmp nettle libidn zlib gnutls openssl"
+DEPENDS = "gmp libidn zlib"
 
 SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https;branch=stable \
            file://0001-Fix-function-inline-errors-in-debug-optimization-Og.patch \
            file://0001-tests-Fix-callback-prototype.patch \
+           file://0001-tcp-fix-some-compiler-warnings-with-enable-tls-opens.patch \
            file://run-ptest \
 "
 
@@ -18,6 +19,15 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig ptest
 
+PACKAGECONFIG ?= "tls-openssl valgrind"
+# Valgrind is not available for RISCV yet
+PACKAGECONFIG:remove:riscv64 = "valgrind"
+PACKAGECONFIG:remove:riscv32 = "valgrind"
+
+PACKAGECONFIG[tls] = "--enable-tls,--disable-tls,gnutls nettle"
+PACKAGECONFIG[tls-openssl] = "--enable-tls-openssl,--disable-tls-openssl,openssl"
+PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,"
+
 # For ptests, copy source tests/*.sh scripts, Makefile and 
 # executables and run them with make on target.
 TESTDIR = "tests"
@@ -71,5 +81,5 @@ RDEPENDS:${PN}-ptest += "\
   make bash coreutils libgcc util-linux gawk grep \
   python3-core python3-io \
 "
+RRECOMMENDS:${PN}-ptest += "${@bb.utils.filter('PACKAGECONFIG', 'valgrind', d)}"
 
-RRECOMMENDS:${PN}-ptest += " valgrind"
-- 
2.41.0


