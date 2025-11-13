Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2C2CD4F4B
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:19:45 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17700.1763014778878940719
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ie4Dkn1v;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-794e300e20dso1092373b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014778; x=1763619578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LroJkZV6JOdEljiQ6jNQYEyHjgVQQhr4bllTYElVizE=;
        b=Ie4Dkn1vMYd3lLV0kUjyfpa2AgJQ704d9TDw+EP8a4cQd2+z8yDySZP89xMkftvwf9
         yrfdO0OcJ6Nuxm1PQKsAsAhqHilnGgx7c07Ear4fksjrYZhjCJC5KaguyXcHcUVMc7M0
         dIFNTFswysToEV9b9R/YKbo54BlYLFQWfAsdkNzggQdP4MmfiCz+C7v2lHYHq8wSHlPk
         2GWOHp5D1PLuHfYu2oDHauawB1g8aCqEc8opsJ9BsD0jY+YNAX9RdKoHDSbMCsUEtJ0f
         gTOA1rU/6SH64WxkKeXTpIm0pOkq6oSd2sbQV2kIbThZX2WAM+5ltkWmfEkXdJSFln4R
         5VIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014778; x=1763619578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LroJkZV6JOdEljiQ6jNQYEyHjgVQQhr4bllTYElVizE=;
        b=CEWgOPI5c50Vh6RfL2uMRGvmKvz7Mk1LpAFI+LpPblNRkqEf5PH+aScyjcqr9U4vAZ
         gLIfknHuWLNQshwbwM8dQx9z52YC4KPoPVmN9ziI1gDR1FQVCc1JAFLLHTv7sVYzR3t4
         yQgttxSwuGdMtTD3AqW4b6vCd6H42cMeYnTBnr+uWmc3IcQYYazYAE9iUwesxKP+NiK0
         hvmzwIryvkLqB8xz2KeZgNSIHHcXuRtUwumQ8YO0fOlTfOgxtWUxNl8krkigkcb18BPu
         jGvBv+u0RmQyNXmNiN+2rg9aImGfqHbgIIdTas2sv4omwOx8P4WM1c2RNfBmslKuXDRx
         CPyg==
X-Gm-Message-State: AOJu0Yy/XnNcWwTA+/64w79iOBQTDTJJcKmQdJ4LSzVAd9jB3Oz4avUw
	FdLNmHlF9g+GPqyGfrT4kOzUHNZuYKLl1TkfU0Ca3PrnLIA4LAzodQqNURWCwA==
X-Gm-Gg: ASbGnctH7PnQe9vMVceNPXqtNxi1Ol3HERyAwxB37VXUCZFlR2o95RuXzJQ5aQQ4Efw
	aB68ZDzkt5TOwpOuRxBMlrf84CShVEAw1h63YlPLoWz5cLirgEJPUBF50Sh5G0MXx+RwO6iscPD
	S2varL/R0R5ZKNJHvaHfd7xe2N0PwhGLPtk74qzRF2RmcK7QVTy0Fk/w6+NjnHGoh7khcvn2U8n
	BavcHrkRY28nt1ZGvTGPPY3qFzmZlsXzWRWeNyPAKKxk7VhIYowpH00Tnnk2Znp9VsqQ9+qk6e7
	1qXEoHMnylCplZpGXH8C5p/+eOFtppUjTJN0sB1hIsMdi8M+YSvhQnqIiYZQ1tgAy+rFPbN3OoP
	v13WFn4HoSP5bWYlTjv6hvbxP+J+3qDvK0LjXBG78tWKSavZ7t1mFcFtXaWB7PZmQMPKb0m964g
	woLg4/2Z+hwOcsnw==
X-Google-Smtp-Source: AGHT+IF1o0C7L/uqQpLjA7djf0szO/ey97wyL0IcXlEyLCmDck9TlFdGKqG/mtCYwYNrKa46hyAxNw==
X-Received: by 2002:a05:6a20:1584:b0:263:57a:bb46 with SMTP id adf61e73a8af0-35a4fb73ecfmr2866156637.13.1763014778047;
        Wed, 12 Nov 2025 22:19:38 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:19:37 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 02/38] xrdp: upgrade 0.9.19 -> 0.9.20
Date: Thu, 13 Nov 2025 19:18:37 +1300
Message-ID: <20251113061914.3756301-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121600

From: Jason Schonberg <schonm@gmail.com>

Patches updated with devtool

Changelog: https://github.com/neutrinolabs/xrdp/releases/tag/v0.9.20

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 63e4df52f2187caa85a7e6b827f700ad9fa514a9)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ..._distinguished_name-in-etc-xrdp-openssl.con.patch |  7 ++-----
 .../xrdp/xrdp/0001-Fix-the-compile-error.patch       | 12 ++++++------
 .../0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch    |  9 +++------
 .../xrdp/0001-mark-count-with-unused-attribute.patch |  9 +++------
 .../xrdp/{xrdp_0.9.19.bb => xrdp_0.9.20.bb}          |  2 +-
 5 files changed, 15 insertions(+), 24 deletions(-)
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.19.bb => xrdp_0.9.20.bb} (97%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch
index 05803266cb..926ad93bbe 100644
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
index e8b4ffa6bf..1bb84001f3 100644
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
index ea3eb11f0a..01449e2a5f 100644
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
index 77a394d556..2559ab7b31 100644
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
index b839a68294..363ab3ff8b 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-mark-count-with-unused-attribute.patch \
            "
 
-SRC_URI[sha256sum] = "94017d30e475c6d7a24f651e16791551862ae46f82d8de62385e63393f5f93d0"
+SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"
 
 CFLAGS += " -Wno-deprecated-declarations"
 

