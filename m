Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0049C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 20:11:02 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.4437.1737144653881582327
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 12:10:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H5BghZVz;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e573136107bso4397496276.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 12:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737144653; x=1737749453; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hMLGzxNkmEELEBeGWroLxtGToGeu5YiGQUVFe6sYsYs=;
        b=H5BghZVzNyliHpLdU+/bCCfpRXJ2Q4RMSS5KZxNFptHivKDdo6NNJVbPDZ7kWTF0Tt
         Y1B477jl8LEyYRjncFoDC/BphrOqzdeL//FhdQ6tYIxkenT4GlFl9VkaXmnD2TxR0DVm
         mBOQOsixGzZn1ZYecU935iUroMMm1dQP9MaC95Q60IbPLF8tNgnS47yJfua8yvyJDTGE
         AU4ELgG+Vm/CpwWFAu0SDLF0n5zS3Rf8+O0QVT5S4PuXOBkdH4NrVBMHAepw8lo1S2WH
         9zaxwkPJYVjcc6qY9uY9qI7mlYFBIktzR1jeHTmAgWIcfe0QuEKCJdKCkT1R9b6A3bTB
         3gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737144653; x=1737749453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMLGzxNkmEELEBeGWroLxtGToGeu5YiGQUVFe6sYsYs=;
        b=AW3uycOfxxmP5E3iF12Pmj6bNy0E/V8ihtvcH80pnVPllSV1SjGMNyhasa/G7aq13l
         Vvk8lbhuqqexlc8hezlxnMeV/pU4BfbiOMVVn/xq/a8Gy5KJ9RXgCqd8O5L7IseKyEA+
         KqYk0tUjNoURL5OUJyo8RWev0YEuhoRACl4VMdvwWvgyY6WCGnxzDH0twE49bNwFzMth
         eru/DUINjW1VxEVJJ1vAJiJPpmU4TzlEJviQl/+41m78wj9DPiAi9v1gRNBd1yac9uiq
         E3busGJDCT7CmYEsLSnQ0dEskazOhbPaso6t2u6MXWG4qhlV6GcRg9gNIbAm9CXs37Nw
         QriQ==
X-Gm-Message-State: AOJu0Yxa/gDzYaydCEl68m7R455z+rJ6q8IRc9y4TTRVI1ALzQXkWLRE
	G/4SHEtRux8w2jUbPU9t7gj8DsZyeVwRHDXefIuppOdx2yZLn4yMZUfOGDCv
X-Gm-Gg: ASbGncv0m1AyWgFGksTspXuybIHLHeL1Uz10LxmB/dDFSb1NKiGPU27HmrpkM7m01ch
	5ZgsYA3LZRyfT9HZ0ByVFhd8C2mPX2g9FdONpd9Wd5Rh4/fKYYV9suj8OkBAU8Fw+sREoDE1BPe
	1IltPNtjFWqDFkM//1TvUgJ74BfskFgUTM5r9JbosW3KyMXaWOXFMnWL+XDgas+vcSTycSuU6kb
	q6VfVjjSc2fEz7YVIlj2dRqujRd/mqnLACl+EWFZ5TRATqa0OSAS5ywmKzGLfrqMeX59yv5k12M
	/BHpG40/nwGI39s=
X-Google-Smtp-Source: AGHT+IGhSvcyWKf3lx+cYUsey0PFD1K/MHhExd2JbpAO3DoK5WdwvyjaqILB3UbBVu470J17rKWsjg==
X-Received: by 2002:a05:690c:4c13:b0:6ef:8e0b:8c63 with SMTP id 00721157ae682-6f6eb677dddmr32666677b3.14.1737144652280;
        Fri, 17 Jan 2025 12:10:52 -0800 (PST)
Received: from localhost.localdomain (71-208-20-57.ftmy.qwest.net. [71.208.20.57])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f6e66f8d84sm5476617b3.115.2025.01.17.12.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 12:10:51 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] xrdp: upgrade 0.9.19 -> 0.9.20
Date: Fri, 17 Jan 2025 15:10:13 -0500
Message-ID: <20250117201013.371962-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 20:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114933

Patches updated with devtool

Changelog: https://github.com/neutrinolabs/xrdp/releases/tag/v0.9.20

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ..._distinguished_name-in-etc-xrdp-openssl.con.patch |  7 ++-----
 .../xrdp/xrdp/0001-Fix-the-compile-error.patch       | 12 ++++++------
 .../0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch    |  9 +++------
 .../xrdp/0001-mark-count-with-unused-attribute.patch |  9 +++------
 .../xrdp/{xrdp_0.9.19.bb => xrdp_0.9.20.bb}          |  2 +-
 5 files changed, 15 insertions(+), 24 deletions(-)
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.19.bb => xrdp_0.9.20.bb} (97%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch
index 05803266c..926ad93bb 100644
--- a/meta-oe/recipes-support/xrdp/xrdp/0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch
@@ -1,7 +1,7 @@
-From d705b1d666cb8713d86ea6fb2fc45c424128285a Mon Sep 17 00:00:00 2001
+From abdfa0fddeceab843ab6eabe31c7763c8719642b Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Fri, 1 Dec 2017 10:24:50 +0900
-Subject: [PATCH] Added  req_distinguished_name in /etc/xrdp/openssl.conf,
+Subject: [PATCH] Added req_distinguished_name in /etc/xrdp/openssl.conf,
  otherwise, cert.pem can't be created.
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
@@ -30,6 +30,3 @@ index 09db6c2..f077d72 100644
  
  [v3_ca]
  # Extensions for a typical CA - PKIX recommendation.
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
index e8b4ffa6b..1bb84001f 100644
--- a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-the-compile-error.patch
@@ -1,3 +1,6 @@
+From 2fa575c3171688ceb0dc867a52628046b3f60d91 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+Date: Tue, 12 Dec 2017 22:36:50 +0800
 Subject: [PATCH] Fix the make error
 
 Fix the compile error:
@@ -11,10 +14,10 @@ Upstream-Status: Pending
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/xrdp/Makefile.am b/xrdp/Makefile.am
-index a259ef3..d5505b2 100644
+index 71d0f76..f41751b 100644
 --- a/xrdp/Makefile.am
 +++ b/xrdp/Makefile.am
-@@ -23,7 +23,7 @@ endif
+@@ -21,7 +21,7 @@ XRDP_EXTRA_LIBS =
  if XRDP_RFXCODEC
  AM_CPPFLAGS += -DXRDP_RFXCODEC
  AM_CPPFLAGS += -I$(top_srcdir)/librfxcodec/include
@@ -23,7 +26,7 @@ index a259ef3..d5505b2 100644
  endif
  
  if XRDP_PIXMAN
-@@ -35,7 +35,7 @@ endif
+@@ -33,7 +33,7 @@ endif
  if XRDP_PAINTER
  AM_CPPFLAGS += -DXRDP_PAINTER
  AM_CPPFLAGS += -I$(top_srcdir)/libpainter/include
@@ -32,6 +35,3 @@ index a259ef3..d5505b2 100644
  endif
  
  sbin_PROGRAMS = \
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch
index ea3eb11f0..01449e2a5 100644
--- a/meta-oe/recipes-support/xrdp/xrdp/0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch
@@ -1,4 +1,4 @@
-From 5958db649855bfb2ada7c0ed22a00f839b9a1161 Mon Sep 17 00:00:00 2001
+From 71e8fd272a4609cf3b6a0802cee82e2861a1fa0c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 12 Mar 2021 21:40:35 -0800
 Subject: [PATCH] arch: Define NO_NEED_ALIGN on ppc64
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/common/arch.h b/common/arch.h
-index 617feb5e..6edb39db 100644
+index ec0aa05..f574656 100644
 --- a/common/arch.h
 +++ b/common/arch.h
-@@ -85,7 +85,7 @@ typedef int bool_t;
+@@ -86,7 +86,7 @@ typedef int bool_t;
  #define NEED_ALIGN
  #elif defined(__x86__) || defined(__x86_64__) || \
        defined(__AMD64__) || defined(_M_IX86) || defined (_M_AMD64) || \
@@ -22,6 +22,3 @@ index 617feb5e..6edb39db 100644
        defined(__PPC__) || defined(__LITTLE_ENDIAN__) || \
        defined(__s390__) || defined (__s390x__) || \
        defined(__riscv)
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-mark-count-with-unused-attribute.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-mark-count-with-unused-attribute.patch
index 77a394d55..2559ab7b3 100644
--- a/meta-oe/recipes-support/xrdp/xrdp/0001-mark-count-with-unused-attribute.patch
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-mark-count-with-unused-attribute.patch
@@ -1,4 +1,4 @@
-From 492f74dbea1d9a15fbc3e870e78ab52e7fc5583b Mon Sep 17 00:00:00 2001
+From 23638d0ec23c2658a4e98321c20a4a2ac9294fb2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 31 Aug 2022 20:19:32 -0700
 Subject: [PATCH] mark count with unused attribute
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sesman/chansrv/chansrv.c b/sesman/chansrv/chansrv.c
-index 4452d998..b818bff3 100644
+index d66310b..eeb5921 100644
 --- a/sesman/chansrv/chansrv.c
 +++ b/sesman/chansrv/chansrv.c
 @@ -195,7 +195,7 @@ check_timeout(void)
@@ -24,8 +24,5 @@ index 4452d998..b818bff3 100644
 -    int count;
 +    int count __attribute__((unused));
      tui32 now;
- 
+     UNUSED_VAR(count);
      LOG_DEVEL(LOG_LEVEL_DEBUG, "check_timeout:");
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
similarity index 97%
rename from meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index 7c85697d4..a60c125d0 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-mark-count-with-unused-attribute.patch \
            "
 
-SRC_URI[sha256sum] = "94017d30e475c6d7a24f651e16791551862ae46f82d8de62385e63393f5f93d0"
+SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"
 
 UPSTREAM_CHECK_URI = "https://github.com/neutrinolabs/xrdp/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


