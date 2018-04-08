Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 91C89745AB
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:27 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id e22-v6so1443194plj.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RTFmoIDuqEORnd4j6xDsKt0jBqG1Vjlce2TV88ZbGPE=;
	b=aE/f6qiy4two7mJjTjyJfo5f43I/zxfur4TH3p1HWKGKdknbZ1DFP+2FER+DkCfmvX
	sxZU2/WTg2trGZ6XS6sBby57UOQuWQ24I9a+VW+J51z2EsfCTjP53kr5K0LsTsNkdm1b
	1xcrV7Xs+ce/B18ifZeWkRXPEacodzri1KhmkFdqtbk24pO7MUIY8a3SbA5xJIEco6uo
	G4dXtUH+xyevF0V/R5B6nYJExfL2VJGzVqmNHg1MwGuUazCENBGQO+S9MmtSkJIG+pW3
	N5XGDKA3Qm/tlMhDfxey59eAM/A+F6GW0pOax1tAxKo0/3zEQryAfKMir5DqkYyvr9HG
	TrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RTFmoIDuqEORnd4j6xDsKt0jBqG1Vjlce2TV88ZbGPE=;
	b=FVzegubgpK3LWjoIwNFvDCmTdeDtHE6op36NN/W0R6kVebVLw7tG7KbMdIlvmLLncB
	a1fwbWOf803ZX+St43L8R9+dMGKQ5CyroXocj9hXR1sq8ty6DSqEpnf0JzoQXL+bH8x8
	zybTmjFyJ526FsD+zsJMuJi0n5y78DKQnG/RXd/e2S+HBvJbm+fVw0YGHFuzOloTQIOX
	NNP7HHkPQ97qXVdTyZPyhNGwDvRCHFS1LTRkNkAN+RikhM09u2VBxKSGrjlRrii1fg/j
	1W9gkrqIEQ9bo40GnjnBTcij8bk95BmCMQzaMSaN9ZA7ktOCXLZ7Ag/vG9qKWJsA9LRu
	4jtQ==
X-Gm-Message-State: ALQs6tB5pmp5FRo7GyP4jptyBAxeUjWy8cnJBn7rQw99McDzFw7+1JQ+
	7mouu6Obk+A9apzWtYm/N8g=
X-Google-Smtp-Source: AIpwx49aYJvTz6s8357JOq70sArb2H4+vMk39cwEJPGMeviJRitFG9uEGtIwo/89xsq5MkkrdMDBlA==
X-Received: by 2002:a17:902:6b04:: with SMTP id
	o4-v6mr15526227plk.332.1523170768908; 
	Sat, 07 Apr 2018 23:59:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:49 -0700
Message-Id: <1523170729-26321-37-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 37/37] openhpi: refresh patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Apr 2018 06:59:27 -0000

WARNING: openhpi-3.6.1-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch openhpi-use-serial-tests-config-needed-by-ptest.patch
patching file configure.ac
Hunk #1 succeeded at 7 with fuzz 2.

Now at patch openhpi-use-serial-tests-config-needed-by-ptest.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openhpi/files/openhpi-fix-host-gcc.patch           | 10 +++++-----
 .../openhpi/files/openhpi-fix-testfail-errors.patch    | 18 ++++++++++--------
 .../openhpi/files/openhpi-hpi-shell-thread-fix.patch   | 10 +++++-----
 .../openhpi/files/openhpi-libxml2-cross-compile.patch  | 10 +++++-----
 ...enhpi-use-serial-tests-config-needed-by-ptest.patch | 15 ++++++---------
 5 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-host-gcc.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-host-gcc.patch
index 029b857..97c515e 100644
--- a/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-host-gcc.patch
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-host-gcc.patch
@@ -6,11 +6,11 @@ Upstream-Status: Pending
 
 Signed-of-by: Aws Ismail <aws.ismail@windriver.com>
 
-diff --git a/configure.ac b/configure.ac
-index f5a5b74..4a20154 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -605,11 +605,6 @@ AC_ARG_ENABLE([werror],
+Index: openhpi-3.6.1/configure.ac
+===================================================================
+--- openhpi-3.6.1.orig/configure.ac
++++ openhpi-3.6.1/configure.ac
+@@ -656,11 +656,6 @@ AC_ARG_ENABLE([werror],
      fi],
      [])
  
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch
index 205696e..60e2e79 100644
--- a/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch
@@ -4,10 +4,11 @@ Upstream-Status: Pending
 
 Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
 
-diff -urpN a/openhpid/safhpi.c b/openhpid/safhpi.c
---- a/openhpid/safhpi.c
-+++ b/openhpid/safhpi.c
-@@ -1976,7 +1976,7 @@ SaErrorT SAHPI_API saHpiSensorThresholds
+Index: openhpi-3.6.1/openhpid/safhpi.c
+===================================================================
+--- openhpi-3.6.1.orig/openhpid/safhpi.c
++++ openhpi-3.6.1/openhpid/safhpi.c
+@@ -1933,7 +1933,7 @@ SaErrorT SAHPI_API saHpiSensorThresholds
          oh_release_domain(d); /* Unlock domain */
  
          OH_CALL_ABI(h, set_sensor_thresholds, SA_ERR_HPI_INVALID_CMD, rv,
@@ -16,10 +17,11 @@ diff -urpN a/openhpid/safhpi.c b/openhpid/safhpi.c
          oh_release_handler(h);
  
          return rv;
-diff -urpN a/utils/sahpi_struct_utils.c b/utils/sahpi_struct_utils.c
---- a/utils/sahpi_struct_utils.c
-+++ b/utils/sahpi_struct_utils.c
-@@ -3855,6 +3855,9 @@ SaHpiBoolT oh_valid_textbuffer(SaHpiText
+Index: openhpi-3.6.1/utils/sahpi_struct_utils.c
+===================================================================
+--- openhpi-3.6.1.orig/utils/sahpi_struct_utils.c
++++ openhpi-3.6.1/utils/sahpi_struct_utils.c
+@@ -3861,6 +3861,9 @@ SaHpiBoolT oh_valid_textbuffer(SaHpiText
                                          /* found a unpaired surrogate */
                                          return SAHPI_FALSE;
                                  }
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-hpi-shell-thread-fix.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-hpi-shell-thread-fix.patch
index 7dac453..cc21ff8 100644
--- a/meta-networking/recipes-daemons/openhpi/files/openhpi-hpi-shell-thread-fix.patch
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-hpi-shell-thread-fix.patch
@@ -14,11 +14,11 @@ Date:   Mon Dec 17 16:23:45 2012 -0500
     
     Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
 
-diff --git a/hpi_shell/session.c b/hpi_shell/session.c
-index 85c31bf..187da4c 100644
---- a/hpi_shell/session.c
-+++ b/hpi_shell/session.c
-@@ -66,7 +66,7 @@ static void* progress_bar(void *unused)
+Index: openhpi-3.6.1/hpi_shell/session.c
+===================================================================
+--- openhpi-3.6.1.orig/hpi_shell/session.c
++++ openhpi-3.6.1/hpi_shell/session.c
+@@ -73,7 +73,7 @@ static void* progress_bar(void *unused)
  		if (i < (PROGRESS_BUF_SIZE - mes_len - 1)) i++;
  		t++;
  	};
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-libxml2-cross-compile.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-libxml2-cross-compile.patch
index 6d3b664..c848b35 100644
--- a/meta-networking/recipes-daemons/openhpi/files/openhpi-libxml2-cross-compile.patch
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-libxml2-cross-compile.patch
@@ -6,11 +6,11 @@ Upstream-Status: Pending
 
 Signed-of-by: Aws Ismail <aws.ismail@windriver.com>
 
-diff --git a/configure.ac b/configure.ac
-index 30a792c..b5f5aad 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -175,7 +175,7 @@ AC_CHECK_HEADERS([openssl/md2.h openssl/md5.h openssl/bio.h openssl/ssl.h openss
+Index: openhpi-3.6.1/configure.ac
+===================================================================
+--- openhpi-3.6.1.orig/configure.ac
++++ openhpi-3.6.1/configure.ac
+@@ -177,7 +177,7 @@ AC_CHECK_HEADERS([openssl/md2.h openssl/
  
  dnl xml is used for XML-based communication in ilo2_ribcl and oa_soap
  AC_CHECK_LIB([xml2],[xmlParseMemory],[XML2_LIB=-lxml2],[XML2_LIB=])
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-use-serial-tests-config-needed-by-ptest.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-use-serial-tests-config-needed-by-ptest.patch
index 51537ef..3e09180 100644
--- a/meta-networking/recipes-daemons/openhpi/files/openhpi-use-serial-tests-config-needed-by-ptest.patch
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-use-serial-tests-config-needed-by-ptest.patch
@@ -13,19 +13,16 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  configure.ac |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 4b51971..16136b3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -7,7 +7,7 @@ dnl   various hacks by Sean Dague <http://dague.net/sean> 4/23/03
+Index: openhpi-3.6.1/configure.ac
+===================================================================
+--- openhpi-3.6.1.orig/configure.ac
++++ openhpi-3.6.1/configure.ac
+@@ -7,7 +7,7 @@ dnl   various hacks by Sean Dague <http:
  AC_PREREQ(2.57)
- AC_INIT(openhpi, 3.5.0)
+ AC_INIT(openhpi, 3.6.1)
  AC_CONFIG_SRCDIR(openhpi.spec.in)
 -AM_INIT_AUTOMAKE([1.8])
 +AM_INIT_AUTOMAKE([1.8 serial-tests])
  
  AM_CONFIG_HEADER(config.h)
  AH_TOP([#ifndef __OPENHPI_CONFIG_H
--- 
-1.7.1
-
-- 
2.7.4


