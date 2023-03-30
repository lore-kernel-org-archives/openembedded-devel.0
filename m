Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74DDC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 05:44:49 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.18310.1680155079611239603
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Mar 2023 22:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IMG73MXh;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: yashinde145@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so18489972pjl.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 22:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680155079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J/KI+22mxlLgDrHfx1tr1chLnxtEwyNUxoXYYl99+OE=;
        b=IMG73MXhhPt+nxc7AMyJ9g4zo2WdabtGRuZMWtbW00e4siPZLQeiDaEDfKoI0bOogM
         HSyZM7BZRvGgppQ8ofhbx6FEQtFJSjimy7bfGDxyFBltO1NTkeh5UoktTPP0NmjkGt1l
         x2G0IZLuBUJu7UCGneROU2ADdX8QOaaLaVSA6DX5Alor+QpK6i28jAmsLhp0kD2bG8nq
         D3bCEwiszalILjHAcAtbjifJXKJu75AcmabKdYg2rHqgVQa2t8+pxX78NU5pntKG57UK
         w5vYi5qgu/LPprNsXWUj+X/iVBL9mIp3lKYglEw9QPTooYy5XXIfM0Q29GZHik89Psf7
         lBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680155079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/KI+22mxlLgDrHfx1tr1chLnxtEwyNUxoXYYl99+OE=;
        b=28Q547QlgpANIKUHd0sIPrexNJENcYr/miHZ/PmGPtnti0eY8kXqWvHDsHMC13s/Ax
         jUcq0Sr6KoQYa80vvsjjSPMSAlG4SdPEqDx9iNX1PkSVPF6SYql5Pwfx09do8AEGmR0d
         Lb4gBc5qNK2+Zh98cJOPXHBPmwewC3I2Wtiif5YmdptWtvsKDOH8apAo4XJPEUzNIiTr
         +A2EpCeVJsdXA5yAQi+U9NqrmTd/SB5ZP79xZ384pDpE7wxbqCl3QWLSXfTROP4p0KLd
         wRkIjmXA2pZqL68L6fs40HCN1sUeRj1eRdNjQqUkkylI9lt6ZqZuoX/zqENuqkBrrOQj
         QtBw==
X-Gm-Message-State: AAQBX9dvVpZxFDyzG0g1jwNeyBOAFTdytvhWtl/MDLEuUNGre2TWpi65
	79k/cmKSL5q4E7DrScfj2X6dLMvb2MlaVA==
X-Google-Smtp-Source: AKy350Zu371i4DyTeCKkSnXEWzH2lr/vQlIelNEy2sUGQAh0CsfumB7n9p+2JzfuLyVXZmlRX90m6w==
X-Received: by 2002:a17:90b:4d11:b0:23f:e32:7e62 with SMTP id mw17-20020a17090b4d1100b0023f0e327e62mr26261429pjb.12.1680155078490;
        Wed, 29 Mar 2023 22:44:38 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id cc10-20020a17090af10a00b0023d1976cd34sm2422980pjb.17.2023.03.29.22.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 22:44:34 -0700 (PDT)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com,
	Sundeep.Kokkonda@windriver.com,
	Yash.Shinde@windriver.com
Subject: [meta-oe][PATCH v2] librelp: fix function inline errors in debug build
Date: Thu, 30 Mar 2023 11:14:14 +0530
Message-Id: <20230330054414.15931-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 05:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101828

With DEBUG_BUILD = "1", the following errors occur:

   src/relpsess.c:95:1: error:
      inlining failed in call to 'relpSessFreePermittedPeers': function not considered for inlining [-Werror=inline]

   src/tcp.c:146:1: error:
      inlining failed in call to 'relpTcpFreePermittedPeers': function not considered for inlining [-Werror=inline]

   src/tcp.c:158:1: error:
      inlining failed in call to 'callOnAuthErr': function not considered for inlining [-Werror=inline]

Compiler does not inline any functions when not optimizing unless you specify the ‘always_inline’ attribute for the function.
Add "__attribute__((always_inline))" to avoid these function inline errors.

Also revert the work-around made earlier in librelp_1.11.0.bb.

Upstream-Status: Tracked by upstream bug: https://github.com/rsyslog/librelp/issues/256

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 ...01-librelp-fix-function-inline-error.patch | 58 +++++++++++++++++++
 .../rsyslog/librelp_1.11.0.bb                 |  2 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-librelp-fix-function-inline-error.patch

diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-librelp-fix-function-inline-error.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-librelp-fix-function-inline-error.patch
new file mode 100644
index 000000000..523a8991f
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/librelp/0001-librelp-fix-function-inline-error.patch
@@ -0,0 +1,58 @@
+From dc841f01fb6167ec9a80e373c5f4d2f5e3222ed6 Mon Sep 17 00:00:00 2001
+From: Yash Shinde <Yash.Shinde@...>
+Date: Tue, 28 Mar 2023 04:06:58 +0000
+Subject: librelp: fix function inline errors in debug build
+
+With DEBUG_BUILD = "1", the following errors occur:
+
+   src/relpsess.c:95:1: error:
+      inlining failed in call to 'relpSessFreePermittedPeers': function not considered for inlining [-Werror=inline]
+
+   src/tcp.c:146:1: error:
+      inlining failed in call to 'relpTcpFreePermittedPeers': function not considered for inlining [-Werror=inline]
+
+   src/tcp.c:158:1: error:
+      inlining failed in call to 'callOnAuthErr': function not considered for inlining [-Werror=inline]
+
+Compiler does not inline any functions when not optimizing unless you specify the ‘always_inline’ attribute for the function. Add "__attribute__((always_inline))" to avoid these function inline errors.
+
+Upstream-Status: Tracked by upstream bug: https://github.com/rsyslog/librelp/issues/256
+
+Signed-off-by: Yash Shinde <Yash.Shinde@...>
+---
+
+diff --git a/src/relpsess.c b/src/relpsess.c
+index ee7b595..aa52b71 100644
+--- a/src/relpsess.c
++++ b/src/relpsess.c
+@@ -91,7 +91,7 @@ callOnErr(const relpSess_t *__restrict__ const pThis,
+
+
+ /* helper to free permittedPeer structure */
+-static inline void
++__attribute__((always_inline)) static inline void
+ relpSessFreePermittedPeers(relpSess_t *const pThis)
+ {
+        int i;
+diff --git a/src/tcp.c b/src/tcp.c
+index 7a75cc4..f4088c0 100644
+--- a/src/tcp.c
++++ b/src/tcp.c
+@@ -142,7 +142,7 @@ static int relpTcpChkPeerName(relpTcp_t *const pThis, void* cert);
+
+
+ /* helper to free permittedPeer structure */
+-static inline void
++__attribute__((always_inline)) static inline void
+ relpTcpFreePermittedPeers(relpTcp_t *const pThis)
+ {
+        int i;
+@@ -154,7 +154,7 @@ relpTcpFreePermittedPeers(relpTcp_t *const pThis)
+ }
+
+ /* helper to call onAuthErr if set */
+-static inline void
++__attribute__((always_inline)) static inline void
+ callOnAuthErr(relpTcp_t *const pThis, const char *authdata, const char *emsg, relpRetVal ecode)
+ {
+        pThis->pEngine->dbgprint((char*)"librelp: auth error: authdata:'%s', ecode %d, "
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
index e7b79ad03..a41b05a35 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1fb9c10ed9fd6826757615455ca893a9"
 DEPENDS = "gmp nettle libidn zlib gnutls openssl"
 
 SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https;branch=stable \
+           file://0001-librelp-fix-function-inline-error.patch \
 "
 
 SRCREV = "b421f56d9ee31a966058d23bd23c966221c91396"
@@ -15,6 +16,5 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-DEBUG_OPTIMIZATION:append = " -Wno-error=inline"
 
 
-- 
2.34.1


