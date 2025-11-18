Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA3ACEBF93
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 00:27:45 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.368.1763425662709841836
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 16:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RCPGhHGU;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-297ec50477aso35543455ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 16:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763425662; x=1764030462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCOiF4/x74rTxpZSeMjMtZhaiJ7V34nD2gZu+APBEf8=;
        b=RCPGhHGUbHK3GOyv4LLuvT6LpmB5rbcP8TVEPag4/GSW4WuCaxvxxxAanose0+11hi
         g4JrHS0leUjZaoBGHPCc7YCT3I9mL99UWAxSYFdWnqEA/ldJrPa4fXHPWp0QQBLP0aVI
         vTvQG+7c82sY9vI9dWyK6fH00IOqGIqt6369Pwai+LJ5otYtQUU7f0AduZQdHLj4YXxz
         cNJpTjXUwe+7ZXOUgtUqbZDknIVjFxNH1C0FpuGbmp9CJyJfiJegrohGwbNxyNfEgPwo
         XyzYy5tBEgPFVAcG3Xbr/p+KAgCrmbbUteG1aWQ5vQ4MlASL5FIpu7zFLoK19MzYQwnp
         u1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763425662; x=1764030462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HCOiF4/x74rTxpZSeMjMtZhaiJ7V34nD2gZu+APBEf8=;
        b=nxt/2bROb+HoqdbaDq2P7hpX5rJXVmQ6EZLy9RZNgZ2afa1JKdWcToyzdSovDPgO4C
         RpehZEePwgtnlUQruh0XJaPl5bV9MOyWj8ei2q9W7XE5ScXu6bxOVOXlS0/WmPgBsuNY
         C4iYHCznvIfGH7aOqRPIR59tkgwTZ3HCRv3br7/4yztKguZ769VNDakUZch1CaxjYs+x
         LE98x6vO8ZArMXl/G1zQkiyE82I3hk7P2kRPW5/7pZLZv2ts3pNHXNS/NcV3tU3LN9hb
         636V/2VsEGfk012eC2xhK9FEUKyYYZVYNZjijsQ4UXVdih4moI64ak8ScZh/mW1pSIXG
         ru/g==
X-Gm-Message-State: AOJu0YyP3XavMShFUUnIxT1Omj6XkDIHnlBCNHRFbJjWD4QoatOFE1Fo
	WYE1AlnHn3MUDu8AQ8xPRxEr/eb3ZbFY86CGrzFFFlQuBQT1Eqs+mxOr6moW8g==
X-Gm-Gg: ASbGncvTrlnX4Ww1uPpHSVNlG6XRKWdScllaVDAJDxRD/FQlEwC35fs27TBfyIswZcy
	gu8kThvHm4MBPefLxT4G+hkdWJj7QaD5/4ZZzxzdJb8X02t4sT4LrRBUHUoq4TYZ82KC3emnIMK
	Q2VYK8Ab08bdaVOfXld8NlWBou/x6XMNNX9PLAu0i4AhJ/JWQQyR2QsnJaoKme+agfynEBfCtST
	jKSmZeBkI+aetVa1sVoEgpaN4qc+Df3XkOnv5FR0V/XKYnl4bL0bUxzBZ7POVAWZ2y4Oa56Sc6+
	cZbcavh0RCRWuhlsZZBU1bwe9HK5CCRUA1uNFTRosGr5f7e8qAnfH2tF/j9K12d+5Biy0iEJpOI
	L56P7uj2bTYFfERK5DCKXzzeFuRXfulq5vnwVvNA6qnQEsS9TxS4UyTgEFxwN1LArP8ajQ9SYkz
	zIwAiaP+4FDDsxsQ8YPV6fWdT21hXL2eZoHw==
X-Google-Smtp-Source: AGHT+IGKOmW4xUHB3ckyU2/VLrcRgWBnzmx6Q3gJyKf/9WyT6Tc3BJBwm8/yvcaWcdrkBYYfNLDqeQ==
X-Received: by 2002:a17:902:f54e:b0:296:5ebe:8fa with SMTP id d9443c01a7336-299f55a1db8mr11556315ad.23.1763425661548;
        Mon, 17 Nov 2025 16:27:41 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm153866565ad.36.2025.11.17.16.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:27:41 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/6] xmlsec1: upgrade 1.3.7 -> 1.3.9
Date: Tue, 18 Nov 2025 13:27:23 +1300
Message-ID: <20251118002723.829508-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118002723.829508-1-ankur.tyagi85@gmail.com>
References: <20251118002723.829508-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 00:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121792

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Refreshed patches and updated ptest.

Changelog:
https://github.com/lsh123/xmlsec/releases/tag/1.3.8
https://github.com/lsh123/xmlsec/releases/tag/1.3.9

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...> 0001-force-to-use-our-own-libtool.patch} |    7 +-
 ...change-finding-path-of-nss-and-nspr.patch} |    6 +-
 ...atch => 0003-xmlsec1-add-new-recipe.patch} |    7 +-
 ...xamples-allow-build-in-separate-dir.patch} |    7 +-
 ...h => 0005-nss-nspr-fix-for-multilib.patch} |    9 +-
 ...gure-QA-error-caused-by-host-lookup.patch} |    7 +-
 ...Fix-LibXML2-deprecation-warnings-and.patch | 1190 +++++++++++++++++
 .../recipes-support/xmlsec1/xmlsec1/run-ptest |  112 +-
 .../{xmlsec1_1.3.7.bb => xmlsec1_1.3.9.bb}    |   15 +-
 9 files changed, 1296 insertions(+), 64 deletions(-)
 rename meta-oe/recipes-support/xmlsec1/xmlsec1/{fix-ltmain.sh.patch => 0001-force-to-use-our-own-libtool.patch} (81%)
 rename meta-oe/recipes-support/xmlsec1/xmlsec1/{change-finding-path-of-nss.patch => 0002-change-finding-path-of-nss-and-nspr.patch} (83%)
 rename meta-oe/recipes-support/xmlsec1/xmlsec1/{makefile-ptest.patch => 0003-xmlsec1-add-new-recipe.patch} (91%)
 rename meta-oe/recipes-support/xmlsec1/xmlsec1/{xmlsec1-examples-allow-build-in-separate-dir.patch => 0004-examples-allow-build-in-separate-dir.patch} (90%)
 rename meta-oe/recipes-support/xmlsec1/xmlsec1/{0001-nss-nspr-fix-for-multilib.patch => 0005-nss-nspr-fix-for-multilib.patch} (94%)
 rename meta-oe/recipes-support/xmlsec1/xmlsec1/{ensure-search-path-non-host.patch => 0006-xmlsec1-Fix-configure-QA-error-caused-by-host-lookup.patch} (91%)
 create mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/0007-xmlsec-examples-Fix-LibXML2-deprecation-warnings-and.patch
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.3.7.bb => xmlsec1_1.3.9.bb} (79%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/fix-ltmain.sh.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-force-to-use-our-own-libtool.patch
similarity index 81%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1/fix-ltmain.sh.patch
rename to meta-oe/recipes-support/xmlsec1/xmlsec1/0001-force-to-use-our-own-libtool.patch
index 73c6ddb027..57c0ab36ff 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/fix-ltmain.sh.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-force-to-use-our-own-libtool.patch
@@ -1,4 +1,4 @@
-From 1b9701faf22f5a17a81a2a2732794d9627499fcb Mon Sep 17 00:00:00 2001
+From 37efc0ca231363aa9161c036ba12cc2b33f51a24 Mon Sep 17 00:00:00 2001
 From: Yulong Pei <Yulong.pei@windriver.com>
 Date: Thu, 21 Jan 2010 14:11:20 +0800
 Subject: [PATCH] force to use our own libtool
@@ -6,16 +6,15 @@ Subject: [PATCH] force to use our own libtool
 Upstream-Status: Inappropriate [ OE specific ]
 
 Signed-off-by: Yulong Pei <Yulong.pei@windriver.com>
-
 ---
  ltmain.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ltmain.sh b/ltmain.sh
-index 1dea62a..bfb9784 100755
+index 7271130e..4e0925a6 100755
 --- a/ltmain.sh
 +++ b/ltmain.sh
-@@ -7225,7 +7225,7 @@ func_mode_link ()
+@@ -7377,7 +7377,7 @@ func_mode_link ()
  	dir=$func_resolve_sysroot_result
  	# We need an absolute path.
  	case $dir in
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0002-change-finding-path-of-nss-and-nspr.patch
similarity index 83%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch
rename to meta-oe/recipes-support/xmlsec1/xmlsec1/0002-change-finding-path-of-nss-and-nspr.patch
index 61c56ffc8b..4a30f483a2 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0002-change-finding-path-of-nss-and-nspr.patch
@@ -1,4 +1,4 @@
-From b43fa6bf612ee59db57573b39e357b6ca96d48b6 Mon Sep 17 00:00:00 2001
+From 75d7dc918771483a6c4354ee77bc14c2ff83f467 Mon Sep 17 00:00:00 2001
 From: Yulong Pei <Yulong.pei@windriver.com>
 Date: Wed, 21 Jul 2010 22:33:43 +0800
 Subject: [PATCH] change finding path of nss and nspr
@@ -13,10 +13,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8add879..7f137c0 100644
+index b31b8bb6..b59acc86 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -933,7 +933,7 @@ NSS_PACKAGE=mozilla-nss
+@@ -965,7 +965,7 @@ NSS_PACKAGE=mozilla-nss
  NSPR_INCLUDE_MARKER="nspr/nspr.h"
  NSPR_LIB_MARKER="libnspr4$shrext"
  NSPR_LIBS_LIST="-lnspr4 -lplds4 -lplc4"
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/makefile-ptest.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0003-xmlsec1-add-new-recipe.patch
similarity index 91%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1/makefile-ptest.patch
rename to meta-oe/recipes-support/xmlsec1/xmlsec1/0003-xmlsec1-add-new-recipe.patch
index 55ae9887f2..1b50e2ed0e 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/makefile-ptest.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0003-xmlsec1-add-new-recipe.patch
@@ -1,4 +1,4 @@
-From 83a1381e1d6bd1b5ec3df6f7c4bc1f4fe4f860b6 Mon Sep 17 00:00:00 2001
+From 2e66dbeeec7d75ed86c87b83b3ac300257363c04 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Thu, 15 Jun 2017 14:44:01 +0800
 Subject: [PATCH] xmlsec1: add new recipe
@@ -14,7 +14,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/examples/Makefile b/examples/Makefile
-index 0b352bc..de3c217 100644
+index c6a25f09..3da1cb33 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
 @@ -12,9 +12,17 @@ PROGRAMS = \
@@ -37,6 +37,3 @@ index 0b352bc..de3c217 100644
  
  all: $(PROGRAMS)
  
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/xmlsec1-examples-allow-build-in-separate-dir.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0004-examples-allow-build-in-separate-dir.patch
similarity index 90%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1/xmlsec1-examples-allow-build-in-separate-dir.patch
rename to meta-oe/recipes-support/xmlsec1/xmlsec1/0004-examples-allow-build-in-separate-dir.patch
index 50706793b2..d7188083b3 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/xmlsec1-examples-allow-build-in-separate-dir.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0004-examples-allow-build-in-separate-dir.patch
@@ -1,4 +1,4 @@
-From 0c38c6864e7ba8f53a657d87894f24374a6a4932 Mon Sep 17 00:00:00 2001
+From fab6503dca2046d32fa186c33c566c58110334a5 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Tue, 30 Dec 2014 11:18:17 +0800
 Subject: [PATCH] examples: allow build in separate dir
@@ -11,7 +11,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/examples/Makefile b/examples/Makefile
-index de3c217..2e0ab6e 100644
+index 3da1cb33..ff44cb7b 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
 @@ -16,8 +16,10 @@ ifndef CC
@@ -27,6 +27,3 @@ index de3c217..2e0ab6e 100644
  
  DESTDIR = /usr/share/xmlsec1
  install-ptest:
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0005-nss-nspr-fix-for-multilib.patch
similarity index 94%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
rename to meta-oe/recipes-support/xmlsec1/xmlsec1/0005-nss-nspr-fix-for-multilib.patch
index 9bb017b63b..a1cc4fd559 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0005-nss-nspr-fix-for-multilib.patch
@@ -1,4 +1,4 @@
-From 1d7c01467e6f510b5636c73757f302a4bd277a3c Mon Sep 17 00:00:00 2001
+From 9f1e319a5f7dcbe611d1f41a551f644c293ac3f0 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 4 Feb 2020 23:39:49 -0800
 Subject: [PATCH] nss/nspr: fix for multilib
@@ -11,10 +11,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 40e9c0d..8f42d4d 100644
+index b59acc86..b8b0542d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -966,24 +966,24 @@ fi
+@@ -990,24 +990,24 @@ fi
  dnl Priority 1: User specifies the path to installation
  if test "z$NSPR_FOUND" = "zno" -a "z$with_nspr" != "z" -a "z$with_nspr" != "zyes" ; then
      AC_MSG_CHECKING(for nspr library installation in "$with_nspr" folder)
@@ -47,6 +47,3 @@ index 40e9c0d..8f42d4d 100644
      fi
  fi
  
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0006-xmlsec1-Fix-configure-QA-error-caused-by-host-lookup.patch
similarity index 91%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
rename to meta-oe/recipes-support/xmlsec1/xmlsec1/0006-xmlsec1-Fix-configure-QA-error-caused-by-host-lookup.patch
index 7b07628e5f..de2534ef78 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0006-xmlsec1-Fix-configure-QA-error-caused-by-host-lookup.patch
@@ -1,4 +1,4 @@
-From c16d384fb64cf53351e150fb9e9b99cc6ba970b2 Mon Sep 17 00:00:00 2001
+From 67642a6bbf7261626f41b84cccf9b55b93c4cbc9 Mon Sep 17 00:00:00 2001
 From: Anatol Belski <anbelski@linux.microsoft.com>
 Date: Thu, 14 Jan 2021 17:36:23 +0000
 Subject: [PATCH] xmlsec1: Fix configure QA error caused by host lookup path
@@ -9,16 +9,15 @@ It will eventually arise after the configure QA as the configure script should o
 
 Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
-
 ---
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3d23683..baf27b7 100644
+index b8b0542d..795355af 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -286,8 +286,8 @@ fi
+@@ -306,8 +306,8 @@ fi
  dnl ==========================================================================
  dnl Common installation locations
  dnl ==========================================================================
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0007-xmlsec-examples-Fix-LibXML2-deprecation-warnings-and.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0007-xmlsec-examples-Fix-LibXML2-deprecation-warnings-and.patch
new file mode 100644
index 0000000000..156c7d8402
--- /dev/null
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0007-xmlsec-examples-Fix-LibXML2-deprecation-warnings-and.patch
@@ -0,0 +1,1190 @@
+From b68f4aa1d450b1a940dd950e1e5eadc2c91ac82f Mon Sep 17 00:00:00 2001
+From: lsh123 <aleksey@aleksey.com>
+Date: Sat, 15 Nov 2025 09:38:02 -0800
+Subject: [PATCH] (xmlsec-examples) Fix LibXML2 deprecation warnings and update
+ README to show key name use (#990)
+
+See https://github.com/lsh123/xmlsec/issues/989
+
+Upstream-Status: Backport
+(cherry picked from commit f15b6dcb5276facfbdbcd8dfe1f23026aa079e7a)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ docs/xmldsig-verifier.html                    |   5 +-
+ examples/Makefile                             |   3 +-
+ examples/README.md                            |  40 +-
+ examples/decrypt1.c                           |   4 +-
+ examples/decrypt2.c                           |   4 +-
+ examples/decrypt3.c                           |   4 +-
+ examples/encrypt1-tmpl.xml                    |   8 +-
+ examples/encrypt1.c                           |   4 +-
+ examples/encrypt2.c                           |   4 +-
+ examples/encrypt3-res.xml                     |   8 +-
+ examples/encrypt3.c                           |   7 +-
+ examples/sign1-tmpl.xml                       |   6 +-
+ examples/sign1.c                              |   4 +-
+ examples/sign2.c                              |   4 +-
+ examples/sign3.c                              |   4 +-
+ examples/sign4.c                              |   4 +-
+ examples/verify-saml.c                        |   4 +-
+ examples/verify1.c                            |   4 +-
+ examples/verify2.c                            |   4 +-
+ examples/verify3.c                            |   2 -
+ examples/verify4.c                            |   2 -
+ examples/xmldsigverify.c                      | 379 ------------------
+ .../aleksey-xmldsig-01/enveloped-gost2001.xml |   3 -
+ .../enveloped-x509-digest-sha1.tmpl           |   3 -
+ .../enveloped-x509-digest-sha1.xml            |   3 -
+ .../enveloped-x509-digest-sha224.tmpl         |   3 -
+ .../enveloped-x509-digest-sha224.xml          |   3 -
+ .../enveloped-x509-digest-sha256.tmpl         |   3 -
+ .../enveloped-x509-digest-sha256.xml          |   3 -
+ .../enveloped-x509-digest-sha384.tmpl         |   3 -
+ .../enveloped-x509-digest-sha384.xml          |   3 -
+ .../enveloped-x509-digest-sha512.tmpl         |   3 -
+ .../enveloped-x509-digest-sha512.xml          |   3 -
+ .../enveloped-x509-issuerserial.tmpl          |   3 -
+ .../enveloped-x509-issuerserial.xml           |   3 -
+ .../enveloped-x509-missing-cert.tmpl          |   3 -
+ .../enveloped-x509-missing-cert.xml           |   3 -
+ .../enveloped-x509-same-subj-cert.tmpl        |   3 -
+ .../enveloped-x509-ski.tmpl                   |   3 -
+ .../aleksey-xmldsig-01/enveloped-x509-ski.xml |   3 -
+ .../enveloped-x509-subjectname.tmpl           |   3 -
+ .../enveloped-x509-subjectname.xml            |   3 -
+ 43 files changed, 46 insertions(+), 525 deletions(-)
+ delete mode 100644 examples/xmldsigverify.c
+
+diff --git a/docs/xmldsig-verifier.html b/docs/xmldsig-verifier.html
+index befd21a6..c8381e98 100644
+--- a/docs/xmldsig-verifier.html
++++ b/docs/xmldsig-verifier.html
+@@ -47,11 +47,8 @@
+ <div align="center">
+         <h1>Online XML Digital Signature Verifer is retired as of October, 2022</h1>
+     </div>
+-<p>If you are interested in verifying an XML Digital Signature, then you should consider using
++    <p>If you are interested in verifying an XML Digital Signature, then you should consider using
+     <a href="xmlsec-man.html">the xmlsec command line tool</a>.
+-    The source code for the Online XML Digital Signature Verifer is available on
+-    <a href="https://github.com/lsh123/xmlsec/blob/master/examples/xmldsigverify.c">GitHub</a> and in the "examples/"
+-    folder of the source tarfile.
+     </p>
+ </td></tr></table></td>
+ </tr></table></body>
+diff --git a/examples/Makefile b/examples/Makefile
+index ff44cb7b..945f3dab 100644
+--- a/examples/Makefile
++++ b/examples/Makefile
+@@ -9,8 +9,7 @@ PROGRAMS = \
+ 	$(PROGRAMS_SIGN) \
+ 	$(PROGRAMS_VERIFY) \
+ 	$(PROGRAMS_ENC) \
+-	$(PROGRAMS_DEC) \
+-	xmldsigverify
++	$(PROGRAMS_DEC)
+ 
+ ifndef CC
+ CC	= gcc
+diff --git a/examples/README.md b/examples/README.md
+index f07a07cb..acf39c31 100644
+--- a/examples/README.md
++++ b/examples/README.md
+@@ -35,9 +35,10 @@ To run this example:
+ ./sign1 sign1-tmpl.xml rsakey.pem
+ ```
+ 
+-To sign a template file with `xmlsec1` command line utility (use `xmlsec` on Windows):
++To sign a template file with `xmlsec1` command line utility (use `xmlsec` on Windows).
++Note that in this example we set KeyName to be the same as the filename of the private key:
+ ```
+-xmlsec1 sign --privkey rsakey.pem --output sign1.xml sign1-tmpl.xml
++xmlsec1 sign --privkey:rsakey.pem rsakey.pem --output sign1.xml sign1-tmpl.xml
+ ```
+ 
+ ### sign2: signing a file with a dynamicaly created template
+@@ -108,10 +109,11 @@ To run this example:
+ ./verify2 sign2-res.xml rsapub.pem
+ ```
+ 
+-To verify a signed document with `xmlsec1` command line utility (use `xmlsec` on Windows):
++To verify a signed document with `xmlsec1` command line utility (use `xmlsec` on Windows).
++Note that in this example we set KeyName to be the same as the filename of the private key:
+ ```
+-xmlsec1 verify --pubkey rsapub.pem sign1-res.xml
+-xmlsec1 verify --pubkey rsapub.pem sign2-res.xml
++xmlsec1 verify --pubkey:rsakey.pem rsapub.pem sign1-res.xml
++xmlsec1 verify --pubkey:rsakey.pem rsapub.pem sign2-res.xml
+ ```
+ 
+ ### verify3: verifying an enveloped signature using X509 certificate
+@@ -185,9 +187,10 @@ To run this example:
+ ```
+ 
+ To encrypt binary data with a template file with `xmlsec1` command line
+-utility (use `xmlsec` on Windows):
++utility (use `xmlsec` on Windows). Note that in this example we set KeyName to be
++the same as the filename of the key:
+ ```
+-xmlsec1 encrypt --deskey deskey.bin  --binary-data binary.dat --output encrypt1.xml encrypt1-tmpl.xml
++xmlsec1 encrypt --deskey:deskey.bin deskey.bin  --binary-data binary.dat --output encrypt1.xml encrypt1-tmpl.xml
+ ```
+ 
+ ### encrypt2: encrypting XML file using a dynamicaly created template
+@@ -213,7 +216,8 @@ encrypt3-doc.xml    An example XML file for encryption by encrypt3.c
+ encrypt3-res.xml    The result of encryptin encrypt3-doc.xml by encrypt3.c
+ ```
+ 
+-To run this example:
++To run this example (note: we are using the private key here instead of the public
++key to make decrypt3 example work)):
+ ```
+ ./encrypt3 encrypt3-doc.xml rsakey.pem
+ ```
+@@ -244,11 +248,13 @@ To run this example:
+ ./decrypt2 encrypt2-res.xml deskey.bin
+ ```
+ 
+-To decrypt binary data with `xmlsec1` command line utility (use `xmlsec` on Windows):
++To decrypt binary data with `xmlsec1` command line utility (use `xmlsec` on Windows).
++Note that in this example we set KeyName to be the same as the filename of the
++(private) key:
+ ```
+-xmlsec1 decrypt --deskey deskey.bin encrypt1-res.xml
+-xmlsec1 decrypt --deskey deskey.bin encrypt2-res.xml
+-xmlsec1 decrypt --privkey rsakey.pem encrypt3-res.xml
++xmlsec1 decrypt --deskey:deskey.bin deskey.bin encrypt1-res.xml
++xmlsec1 decrypt --deskey:deskey.bin deskey.bin encrypt2-res.xml
++xmlsec1 decrypt --privkey:rsakey.pem rsakey.pem encrypt3-res.xml
+ ```
+ 
+ ### decrypt3: decrypting binary file using custom keys manager
+@@ -265,16 +271,6 @@ To run this example:
+ ./decrypt3 encrypt3-res.xml
+ ```
+ 
+-### xmldsigverify: CGI script for signatures verifications
+-
+-Files:
+-```
+-xmldsigverify.c     The source code
+-```
+-
+-To run this example, install compiled xmldsigverify script into
+-your web server cgi-bin directory.
+-
+ ### Keys and certificates
+ ```
+ cacert.pem          Root (trusted) certificate
+diff --git a/examples/decrypt1.c b/examples/decrypt1.c
+index e069bd7a..c9d2ec38 100644
+--- a/examples/decrypt1.c
++++ b/examples/decrypt1.c
+@@ -52,8 +52,6 @@ main(int argc, char **argv) {
+     /* Init libxml and libxslt libraries */
+     xmlInitParser();
+     LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+ 
+     /* Init libxslt */
+ #ifndef XMLSEC_NO_XSLT
+@@ -149,7 +147,7 @@ decrypt_file(const char* enc_file, const char* key_file) {
+     assert(key_file);
+ 
+     /* load template */
+-    doc = xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
++    doc = xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
+     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
+         fprintf(stderr, "Error: unable to parse file \"%s\"\n", enc_file);
+         goto done;
+diff --git a/examples/decrypt2.c b/examples/decrypt2.c
+index 522af222..49be8e60 100644
+--- a/examples/decrypt2.c
++++ b/examples/decrypt2.c
+@@ -55,8 +55,6 @@ main(int argc, char **argv) {
+     /* Init libxml and libxslt libraries */
+     xmlInitParser();
+     LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+ 
+     /* Init libxslt */
+ #ifndef XMLSEC_NO_XSLT
+@@ -232,7 +230,7 @@ decrypt_file(xmlSecKeysMngrPtr mngr, const char* enc_file) {
+     assert(enc_file);
+ 
+     /* load template */
+-    doc = xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
++    doc = xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
+     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
+         fprintf(stderr, "Error: unable to parse file \"%s\"\n", enc_file);
+         goto done;
+diff --git a/examples/decrypt3.c b/examples/decrypt3.c
+index e24effc0..8fddfa70 100644
+--- a/examples/decrypt3.c
++++ b/examples/decrypt3.c
+@@ -58,8 +58,6 @@ main(int argc, char **argv) {
+     /* Init libxml and libxslt libraries */
+     xmlInitParser();
+     LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+ 
+     /* Init libxslt */
+ #ifndef XMLSEC_NO_XSLT
+@@ -165,7 +163,7 @@ decrypt_file(xmlSecKeysMngrPtr mngr, const char* enc_file) {
+     assert(enc_file);
+ 
+     /* load template */
+-    doc = xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
++    doc = xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
+     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
+         fprintf(stderr, "Error: unable to parse file \"%s\"\n", enc_file);
+         goto done;
+diff --git a/examples/encrypt1-tmpl.xml b/examples/encrypt1-tmpl.xml
+index 3d61a901..5c1a5f3f 100644
+--- a/examples/encrypt1-tmpl.xml
++++ b/examples/encrypt1-tmpl.xml
+@@ -1,12 +1,12 @@
+ <?xml version="1.0"?>
+-<!-- 
+-XML Security Library example: Simple encryption template file for encrypt1 example. 
++<!--
++XML Security Library example: Simple encryption template file for encrypt1 example.
+ -->
+ <EncryptedData xmlns="http://www.w3.org/2001/04/xmlenc#">
+     <EncryptionMethod Algorithm="http://www.w3.org/2001/04/xmlenc#tripledes-cbc"/>
+     <KeyInfo xmlns="http://www.w3.org/2000/09/xmldsig#">
+-	<KeyName/>
+-    </KeyInfo>   
++	<KeyName>deskey.bin</KeyName>
++    </KeyInfo>
+     <CipherData>
+ 	<CipherValue></CipherValue>
+     </CipherData>
+diff --git a/examples/encrypt1.c b/examples/encrypt1.c
+index ee3eaa8b..dc52ccf5 100644
+--- a/examples/encrypt1.c
++++ b/examples/encrypt1.c
+@@ -55,8 +55,6 @@ main(int argc, char **argv) {
+     /* Init libxml and libxslt libraries */
+     xmlInitParser();
+     LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+ 
+     /* Init libxslt */
+ #ifndef XMLSEC_NO_XSLT
+@@ -156,7 +154,7 @@ encrypt_file(const char* tmpl_file, const char* key_file,
+     assert(data);
+ 
+     /* load template */
+-    doc = xmlReadFile(tmpl_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
++    doc = xmlReadFile(tmpl_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
+     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
+         fprintf(stderr, "Error: unable to parse file \"%s\"\n", tmpl_file);
+         goto done;
+diff --git a/examples/encrypt2.c b/examples/encrypt2.c
+index 14b57af9..989afec3 100644
+--- a/examples/encrypt2.c
++++ b/examples/encrypt2.c
+@@ -56,8 +56,6 @@ main(int argc, char **argv) {
+     /* Init libxml and libxslt libraries */
+     xmlInitParser();
+     LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+ 
+     /* Init libxslt */
+ #ifndef XMLSEC_NO_XSLT
+@@ -154,7 +152,7 @@ encrypt_file(const char* xml_file, const char* key_file) {
+     assert(key_file);
+ 
+     /* load template */
+-    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
++    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
+     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
+         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
+         goto done;
+diff --git a/examples/encrypt3-res.xml b/examples/encrypt3-res.xml
+index 2fca87e7..129771a6 100644
+--- a/examples/encrypt3-res.xml
++++ b/examples/encrypt3-res.xml
+@@ -11,13 +11,13 @@ XML Security Library example: Original XML doc file before encryption (encrypt3
+ <KeyName>rsakey.pem</KeyName>
+ </KeyInfo>
+ <CipherData>
+-<CipherValue>QYYKljhcX20QyP20hYmq8CSES875oIdbrsjMOxnb0VnYDn01Jk00OIPpb9gdIdZg
+-MLOtSy26mWrQ+XqfPGuyaA==</CipherValue>
++<CipherValue>pFfhaCpQfHTOJ+mRN919Ia3JimY2AS/8u9pimLEWGGjh3egy3pE2st4+YoVkpS4G
++XyUU4Ps+KRzsdJcKI4moXQ==</CipherValue>
+ </CipherData>
+ </EncryptedKey>
+ </KeyInfo>
+ <CipherData>
+-<CipherValue>+UiDv73SE8K8KwXuOmHLHK7N2hNWDakTAEu6NprbCdULC1w/LXT9FLtNRJetmwwO
+-XpBqTY56AAMeMgpxPWN3SPO0ETeQw7pR+bp0IjUvcGlFSXz6yE1qgQ==</CipherValue>
++<CipherValue>PMuoILFXjCmMg2pCzrmJYZcySLsTzgGYRX2ymYV9tLVrNSPhWV2mwMHWMchSWH9b
++8pRgdaJ3msWmN3EqqElV1Y5wEDQjB5nMz7Tsz3+QmrAxGfxj7bCPyw==</CipherValue>
+ </CipherData>
+ </EncryptedData>
+diff --git a/examples/encrypt3.c b/examples/encrypt3.c
+index e3f23104..71a6a559 100644
+--- a/examples/encrypt3.c
++++ b/examples/encrypt3.c
+@@ -7,7 +7,8 @@
+  * Usage:
+  *      ./encrypt3 <xml-doc> <rsa-pem-key-file>
+  *
+- * Example:
++ * Example (note: we are using the private key here instead of the public
++ * key to make decrypt3 example work):
+  *      ./encrypt3 encrypt3-doc.xml rsakey.pem > encrypt3-res.xml
+  *
+  * The result could be decrypted with decrypt3 example:
+@@ -58,8 +59,6 @@ main(int argc, char **argv) {
+     /* Init libxml and libxslt libraries */
+     xmlInitParser();
+     LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+ 
+     /* Init libxslt */
+ #ifndef XMLSEC_NO_XSLT
+@@ -233,7 +232,7 @@ encrypt_file(xmlSecKeysMngrPtr mngr, const char* xml_file, const char* key_name)
+     assert(key_name);
+ 
+     /* load template */
+-    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
++    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
+     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
+         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
+         goto done;
+diff --git a/examples/sign1-tmpl.xml b/examples/sign1-tmpl.xml
+index ac71a949..34b96f6f 100644
+--- a/examples/sign1-tmpl.xml
++++ b/examples/sign1-tmpl.xml
+@@ -1,6 +1,6 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!-- 
+-XML Security Library example: Simple signature template file for sign1 example. 
++<!--
++XML Security Library example: Simple signature template file for sign1 example.
+ -->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+@@ -20,7 +20,7 @@ XML Security Library example: Simple signature template file for sign1 example.
+     </SignedInfo>
+     <SignatureValue/>
+     <KeyInfo>
+-	<KeyName/>
++      <KeyName>rsakey.pem</KeyName>
+     </KeyInfo>
+   </Signature>
+ </Envelope>
+diff --git a/examples/sign1.c b/examples/sign1.c
+index be107333..e86d3604 100644
+--- a/examples/sign1.c
++++ b/examples/sign1.c
+@@ -54,8 +54,6 @@ main(int argc, char **argv) {
+     /* Init libxml and libxslt libraries */
+     xmlInitParser();
+     LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+ 
+     /* Init libxslt */
+ #ifndef XMLSEC_NO_XSLT
+@@ -150,7 +148,7 @@ sign_file(const char* tmpl_file, const char* key_file) {
+     assert(key_file);
+ 
+     /* load template */
+-    doc = xmlReadFile(tmpl_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
++    doc = xmlReadFile(tmpl_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
+     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
+         fprintf(stderr, "Error: unable to parse file \"%s\"\n", tmpl_file);
+         goto done;
+diff --git a/examples/sign2.c b/examples/sign2.c
+index 1a6ee936..a5408a0a 100644
+--- a/examples/sign2.c
++++ b/examples/sign2.c
+@@ -57,8 +57,6 @@ main(int argc, char **argv) {
+     /* Init libxml and libxslt libraries */
+     xmlInitParser();
+     LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+ 
+     /* Init libxslt */
+ #ifndef XMLSEC_NO_XSLT
+@@ -156,7 +154,7 @@ sign_file(const char* xml_file, const char* key_file) {
+     assert(key_file);
+ 
+     /* load doc file */
+-    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
++    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
+     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
+         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
+         goto done;
+diff --git a/examples/sign3.c b/examples/sign3.c
+index de372e42..c927d946 100644
+--- a/examples/sign3.c
++++ b/examples/sign3.c
+@@ -61,8 +61,6 @@ main(int argc, char **argv) {
+     /* Init libxml and libxslt libraries */
+     xmlInitParser();
+     LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+ 
+     /* Init libxslt */
+ #ifndef XMLSEC_NO_XSLT
+@@ -164,7 +162,7 @@ sign_file(const char* xml_file, const char* key_file, const char* cert_file) {
+     assert(cert_file);
+ 
+     /* load doc file */
+-    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
++    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
+     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
+         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
+         goto done;
+diff --git a/examples/sign4.c b/examples/sign4.c
+index bb5f03b3..012e4b63 100644
+--- a/examples/sign4.c
++++ b/examples/sign4.c
+@@ -60,8 +60,6 @@ main(int argc, char **argv) {
+     /* Init libxml and libxslt libraries */
+     xmlInitParser();
+     LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+ 
+     /* Init libxslt */
+ #ifndef XMLSEC_NO_XSLT
+@@ -167,7 +165,7 @@ sign_file(const char* xml_file, const char* id_attr, const char* key_file, const
+     assert(cert_file);
+ 
+     /* load doc file */
+-    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
++    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
+     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
+         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
+         goto done;
+diff --git a/examples/verify-saml.c b/examples/verify-saml.c
+index fea78a7f..95abaf0e 100644
+--- a/examples/verify-saml.c
++++ b/examples/verify-saml.c
+@@ -65,8 +65,6 @@ main(int argc, char **argv) {
+     /* Init libxml and libxslt libraries */
+     xmlInitParser();
+     LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+ 
+     /* Init libxslt */
+ #ifndef XMLSEC_NO_XSLT
+@@ -221,7 +219,7 @@ verify_file(xmlSecKeysMngrPtr mngr, const char* xml_file) {
+     assert(xml_file);
+ 
+     /* load file */
+-    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
++    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
+     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
+         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
+         goto done;
+diff --git a/examples/verify1.c b/examples/verify1.c
+index 00ad07e1..73c6063f 100644
+--- a/examples/verify1.c
++++ b/examples/verify1.c
+@@ -53,8 +53,6 @@ main(int argc, char **argv) {
+     /* Init libxml and libxslt libraries */
+     xmlInitParser();
+     LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+ 
+     /* Init libxslt */
+ #ifndef XMLSEC_NO_XSLT
+@@ -149,7 +147,7 @@ verify_file(const char* xml_file, const char* key_file) {
+     assert(key_file);
+ 
+     /* load file */
+-    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
++    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
+     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
+         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
+         goto done;
+diff --git a/examples/verify2.c b/examples/verify2.c
+index 377dccc5..f421f89f 100644
+--- a/examples/verify2.c
++++ b/examples/verify2.c
+@@ -56,8 +56,6 @@ main(int argc, char **argv) {
+     /* Init libxml and libxslt libraries */
+     xmlInitParser();
+     LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+ 
+     /* Init libxslt */
+ #ifndef XMLSEC_NO_XSLT
+@@ -232,7 +230,7 @@ verify_file(xmlSecKeysMngrPtr mngr, const char* xml_file) {
+     assert(xml_file);
+ 
+     /* load file */
+-    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
++    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
+     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
+         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
+         goto done;
+diff --git a/examples/verify3.c b/examples/verify3.c
+index 558e3290..04dd32b0 100644
+--- a/examples/verify3.c
++++ b/examples/verify3.c
+@@ -57,8 +57,6 @@ main(int argc, char **argv) {
+     /* Init libxml and libxslt libraries */
+     xmlInitParser();
+     LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+ 
+     /* Init libxslt */
+ #ifndef XMLSEC_NO_XSLT
+diff --git a/examples/verify4.c b/examples/verify4.c
+index 705d8a5f..23a96918 100644
+--- a/examples/verify4.c
++++ b/examples/verify4.c
+@@ -57,8 +57,6 @@ main(int argc, char **argv) {
+     /* Init libxml and libxslt libraries */
+     xmlInitParser();
+     LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+ 
+     /* Init libxslt */
+ #ifndef XMLSEC_NO_XSLT
+diff --git a/examples/xmldsigverify.c b/examples/xmldsigverify.c
+deleted file mode 100644
+index c6611f43..00000000
+--- a/examples/xmldsigverify.c
++++ /dev/null
+@@ -1,379 +0,0 @@
+-/**
+- * XML Security Library example: CGI verification script.
+- *
+- * This is free software; see Copyright file in the source
+- * distribution for preciese wording.
+- *
+- * Copyright (C) 2002-2024 Aleksey Sanin <aleksey@aleksey.com>. All Rights Reserved.
+- */
+-#include <stdlib.h>
+-#include <string.h>
+-#include <assert.h>
+-#include <dirent.h>
+-
+-#include <libxml/tree.h>
+-#include <libxml/xmlmemory.h>
+-#include <libxml/parser.h>
+-
+-#ifndef XMLSEC_NO_XSLT
+-#include <libxslt/xslt.h>
+-#include <libxslt/security.h>
+-#endif /* XMLSEC_NO_XSLT */
+-
+-#include <xmlsec/xmlsec.h>
+-#include <xmlsec/xmltree.h>
+-#include <xmlsec/xmldsig.h>
+-#include <xmlsec/crypto.h>
+-
+-#include <xmlsec/parser.h>
+-/* #define XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER   "/etc/httpd/conf/ssl.crt" */
+-#define XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER      "/var/www/cgi-bin/keys-certs.def"
+-#define XMLDSIGVERIFY_KEY_AND_CERTS_FOLDER              "/var/www/cgi-bin/keys-certs"
+-
+-
+-int load_keys(xmlSecKeysMngrPtr mngr, const char* path, int report_loaded_keys);
+-int load_trusted_certs(xmlSecKeysMngrPtr mngr, const char* path, int report_loaded_certs);
+-int verify_request(xmlSecKeysMngrPtr mngr);
+-int url_decode(char *buf, size_t size);
+-
+-int
+-main() {
+-    xmlSecKeysMngrPtr mngr;
+-#ifndef XMLSEC_NO_XSLT
+-    xsltSecurityPrefsPtr xsltSecPrefs = NULL;
+-#endif /* XMLSEC_NO_XSLT */
+-
+-    /* start response */
+-    fprintf(stdout, "Content-type: text/plain\n");
+-    fprintf(stdout, "\n");
+-
+-    /* Init libxml and libxslt libraries */
+-    xmlInitParser();
+-    LIBXML_TEST_VERSION
+-    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
+-    xmlSubstituteEntitiesDefault(1);
+-
+-    /* make sure that we print out everything to stdout */
+-    xmlGenericErrorContext = stdout;
+-
+-    /* Init libxslt */
+-#ifndef XMLSEC_NO_XSLT
+-    /* disable everything */
+-    xsltSecPrefs = xsltNewSecurityPrefs();
+-    xsltSetSecurityPrefs(xsltSecPrefs,  XSLT_SECPREF_READ_FILE,        xsltSecurityForbid);
+-    xsltSetSecurityPrefs(xsltSecPrefs,  XSLT_SECPREF_WRITE_FILE,       xsltSecurityForbid);
+-    xsltSetSecurityPrefs(xsltSecPrefs,  XSLT_SECPREF_CREATE_DIRECTORY, xsltSecurityForbid);
+-    xsltSetSecurityPrefs(xsltSecPrefs,  XSLT_SECPREF_READ_NETWORK,     xsltSecurityForbid);
+-    xsltSetSecurityPrefs(xsltSecPrefs,  XSLT_SECPREF_WRITE_NETWORK,    xsltSecurityForbid);
+-    xsltSetDefaultSecurityPrefs(xsltSecPrefs);
+-#endif /* XMLSEC_NO_XSLT */
+-
+-    /* Init xmlsec library */
+-    if(xmlSecInit() < 0) {
+-        fprintf(stdout, "Error: xmlsec initialization failed.\n");
+-        return(-1);
+-    }
+-
+-    /* Check loaded library version */
+-    if(xmlSecCheckVersion() != 1) {
+-        fprintf(stdout, "Error: loaded xmlsec library version is not compatible.\n");
+-        return(-1);
+-    }
+-
+-    /* Load default crypto engine if we are supporting dynamic
+-     * loading for xmlsec-crypto libraries. Use the crypto library
+-     * name ("openssl", "nss", etc.) to load corresponding
+-     * xmlsec-crypto library.
+-     */
+-#ifdef XMLSEC_CRYPTO_DYNAMIC_LOADING
+-    if(xmlSecCryptoDLLoadLibrary(NULL) < 0) {
+-        fprintf(stdout, "Error: unable to load default xmlsec-crypto library. Make sure\n"
+-                        "that you have it installed and check shared libraries path\n"
+-                        "(LD_LIBRARY_PATH and/or LTDL_LIBRARY_PATH) environment variables.\n");
+-        return(-1);
+-    }
+-#endif /* XMLSEC_CRYPTO_DYNAMIC_LOADING */
+-
+-    /* Init crypto library */
+-    if(xmlSecCryptoAppInit(XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER) < 0) {
+-        fprintf(stdout, "Error: crypto initialization failed.\n");
+-        return(-1);
+-    }
+-
+-    /* Init xmlsec-crypto library */
+-    if(xmlSecCryptoInit() < 0) {
+-        fprintf(stdout, "Error: xmlsec-crypto initialization failed.\n");
+-        return(-1);
+-    }
+-
+-    /* create keys manager */
+-    mngr = xmlSecKeysMngrCreate();
+-    if(mngr == NULL) {
+-        fprintf(stdout, "Error: failed to create keys manager.\n");
+-        return(-1);
+-    }
+-    if(xmlSecCryptoAppDefaultKeysMngrInit(mngr) < 0) {
+-        fprintf(stdout, "Error: failed to initialize keys manager.\n");
+-        return(-1);
+-    }
+-
+-    if(load_keys(mngr, XMLDSIGVERIFY_KEY_AND_CERTS_FOLDER, 0) < 0) {
+-        xmlSecKeysMngrDestroy(mngr);
+-        return(-1);
+-    }
+-
+-    if(load_trusted_certs(mngr, XMLDSIGVERIFY_KEY_AND_CERTS_FOLDER, 0) < 0) {
+-        xmlSecKeysMngrDestroy(mngr);
+-        return(-1);
+-    }
+-
+-    if(verify_request(mngr) < 0) {
+-        xmlSecKeysMngrDestroy(mngr);
+-        return(-1);
+-    }
+-
+-    /* Destroy keys manager */
+-    xmlSecKeysMngrDestroy(mngr);
+-
+-    /* Shutdown xmlsec-crypto library */
+-    xmlSecCryptoShutdown();
+-
+-    /* Shutdown crypto library */
+-    xmlSecCryptoAppShutdown();
+-
+-    /* Shutdown xmlsec library */
+-    xmlSecShutdown();
+-
+-    /* Shutdown libxslt/libxml */
+-#ifndef XMLSEC_NO_XSLT
+-    xsltFreeSecurityPrefs(xsltSecPrefs);
+-    xsltCleanupGlobals();
+-#endif /* XMLSEC_NO_XSLT */
+-
+-    xmlCleanupParser();
+-
+-    return(0);
+-}
+-
+-/**
+- * load_trusted_certs:
+- * @mngr:       the keys manager.
+- * @path:       the path to a folder that contains trusted certificates.
+- *
+- * Loads trusted certificates from @path.
+- *
+- * Returns 0 on success or a negative value if an error occurs.
+- */
+-int load_trusted_certs(xmlSecKeysMngrPtr mngr, const char* path, int report_loaded_certs) {
+-    DIR* dir;
+-    struct dirent* entry;
+-    char filename[2048];
+-    int len;
+-
+-    assert(mngr);
+-    assert(path);
+-
+-    dir = opendir(path);
+-    if(dir == NULL) {
+-        fprintf(stdout, "Error: failed to open folder \"%s\".\n", path);
+-        return(-1);
+-    }
+-    while((entry = readdir(dir)) != NULL) {
+-        assert(entry->d_name);
+-        len = strlen(entry->d_name);
+-        if((len > 4) && (strcmp(entry->d_name + len - 4, ".pem") == 0)) {
+-            snprintf(filename, sizeof(filename), "%s/%s", path, entry->d_name);
+-            if(xmlSecCryptoAppKeysMngrCertLoad(mngr, filename, xmlSecKeyDataFormatPem, xmlSecKeyDataTypeTrusted) < 0) {
+-                fprintf(stdout,"Error: failed to load pem certificate from \"%s\"\n", filename);
+-                closedir(dir);
+-                return(-1);
+-            }
+-            if(report_loaded_certs) {
+-                fprintf(stdout, "Loaded trusted certificate from \"%s\"...\n", filename);
+-            }
+-        } else if((len > 4) && (strcmp(entry->d_name + len - 4, ".der") == 0)) {
+-            snprintf(filename, sizeof(filename), "%s/%s", path, entry->d_name);
+-            if(xmlSecCryptoAppKeysMngrCertLoad(mngr, filename, xmlSecKeyDataFormatDer, xmlSecKeyDataTypeTrusted) < 0) {
+-                fprintf(stdout,"Error: failed to load der certificate from \"%s\"\n", filename);
+-                closedir(dir);
+-                return(-1);
+-            }
+-            if(report_loaded_certs) {
+-                fprintf(stdout, "Loaded trusted certificate from \"%s\"...\n", filename);
+-            }
+-        }
+-    }
+-    closedir(dir);
+-    return(0);
+-}
+-
+-int load_keys(xmlSecKeysMngrPtr mngr, const char* path, int report_loaded_keys) {
+-    char filename[256];
+-
+-    assert(mngr);
+-
+-    snprintf(filename, sizeof(filename), "%s/keys.xml", path);
+-    if(xmlSecCryptoAppDefaultKeysMngrLoad(mngr, filename) < 0) {
+-        fprintf(stdout,"Error: failed to load keys from \"%s\"\n", filename);
+-        return(-1);
+-    }
+-
+-    if(report_loaded_keys) {
+-        fprintf(stdout, "Loaded keys from \"%s\"...\n", filename);
+-    }
+-    return(0);
+-}
+-
+-
+-/**
+- * verify_request:
+- * @mng:                the keys manager
+- *
+- * Verifies XML signature in the request (stdin).
+- *
+- * Returns 0 on success or a negative value if an error occurs.
+- */
+-int
+-verify_request(xmlSecKeysMngrPtr mngr) {
+-    xmlBufferPtr buffer = NULL;
+-    xmlSecByte buf[256];
+-    xmlDocPtr doc = NULL;
+-    xmlNodePtr node = NULL;
+-    xmlSecDSigCtxPtr dsigCtx = NULL;
+-    int ret;
+-    int res = -1;
+-
+-    assert(mngr);
+-
+-    /* load request in the buffer */
+-    buffer = xmlBufferCreate();
+-    if(buffer == NULL) {
+-        fprintf(stdout,"Error: failed to create buffer\n");
+-        goto done;
+-    }
+-
+-    while(!feof(stdin)) {
+-        ret = fread(buf, 1, sizeof(buf), stdin);
+-        if(ret < 0) {
+-            fprintf(stdout,"Error: read failed\n");
+-            goto done;
+-        }
+-        xmlBufferAdd(buffer, buf, (xmlSecSize)ret);
+-    }
+-
+-    /* is the document submitted from the form? */
+-    if(strncmp((char*)xmlBufferContent(buffer), "_xmldoc=", 8) == 0) {
+-        xmlBufferShrink(buffer, 8);
+-        buffer->use = url_decode((char*)xmlBufferContent(buffer), xmlBufferLength(buffer));
+-    }
+-
+-    /**
+-     * Load doc
+-     */
+-    xmlSecParserSetDefaultOptions(XML_PARSE_NOENT | XML_PARSE_NOCDATA |
+-                        XML_PARSE_PEDANTIC | XML_PARSE_NOCDATA);
+-    doc = xmlReadMemory((const char*)xmlBufferContent(buffer), xmlBufferLength(buffer),
+-        NULL, NULL, xmlSecParserGetDefaultOptions());
+-    if (doc == NULL) {
+-        fprintf(stdout, "Error: unable to parse xml document (syntax error)\n");
+-        goto done;
+-    }
+-
+-    /*
+-     * Check the document is of the right kind
+-     */
+-    if(xmlDocGetRootElement(doc) == NULL) {
+-        fprintf(stdout,"Error: empty document\n");
+-        goto done;
+-    }
+-
+-    /* find start node */
+-    node = xmlSecFindNode(xmlDocGetRootElement(doc), xmlSecNodeSignature, xmlSecDSigNs);
+-    if(node == NULL) {
+-        fprintf(stdout, "Error: start <dsig:Signature/> node not found\n");
+-        goto done;
+-    }
+-
+-    /* create signature context */
+-    dsigCtx = xmlSecDSigCtxCreate(mngr);
+-    if(dsigCtx == NULL) {
+-        fprintf(stdout,"Error: failed to create signature context\n");
+-        goto done;
+-    }
+-
+-    /* we would like to store and print out everything */
+-    /* actually we would not because it opens a security hole
+-    dsigCtx->flags = XMLSEC_DSIG_FLAGS_STORE_SIGNEDINFO_REFERENCES |
+-                     XMLSEC_DSIG_FLAGS_STORE_MANIFEST_REFERENCES |
+-                     XMLSEC_DSIG_FLAGS_STORE_SIGNATURE;
+-    */
+-
+-    /* Verify signature */
+-    if(xmlSecDSigCtxVerify(dsigCtx, node) < 0) {
+-        fprintf(stdout,"Error: signature verification failed\n");
+-        goto done;
+-    }
+-
+-    /* print verification result to stdout */
+-    if(dsigCtx->status == xmlSecDSigStatusSucceeded) {
+-        fprintf(stdout, "RESULT: Signature is OK\n");
+-    } else {
+-        fprintf(stdout, "RESULT: Signature is INVALID\n");
+-    }
+-    fprintf(stdout, "---------------------------------------------------\n");
+-    xmlSecDSigCtxDebugDump(dsigCtx, stdout);
+-
+-    /* success */
+-    res = 0;
+-
+-done:
+-    /* cleanup */
+-    if(dsigCtx != NULL) {
+-        xmlSecDSigCtxDestroy(dsigCtx);
+-    }
+-
+-    if(doc != NULL) {
+-        xmlFreeDoc(doc);
+-    }
+-
+-    if(buffer != NULL) {
+-        xmlBufferFree(buffer);
+-    }
+-    return(res);
+-}
+-
+-/* not the best way to do it */
+-#define toHex(c) ( ( ('0' <= (c)) && ((c) <= '9') ) ? (c) - '0' : \
+-                 ( ( ('A' <= (c)) && ((c) <= 'F') ) ? (c) - 'A' + 10 : 0 ) )
+-
+-/**
+- * url_decode:
+- * @buf:        the input buffer.
+- * @size:       the input buffer size.
+- *
+- * Does url decoding in-place.
+- *
+- * Returns length of the decoded result on success or
+- * a negative value if an error occurs.
+- */
+-int url_decode(char *buf, size_t size) {
+-    size_t ii, jj;
+-    char ch;
+-
+-    assert(buf);
+-
+-    for(ii = jj = 0; ii < size; ++ii, ++jj) {
+-        ch = buf[ii];
+-        if((ch == '%') && ((ii + 2) < size)) {
+-            buf[jj] = (char)(toHex(buf[ii + 1]) * 16 + toHex(buf[ii + 2]));
+-            ii += 2;
+-        } else if(ch == '+') {
+-            buf[jj] = ' ';
+-        } else if(ii != jj){
+-            buf[jj] = buf[ii];
+-        }
+-    }
+-    return((int)jj);
+-}
+-
+-
+diff --git a/tests/aleksey-xmldsig-01/enveloped-gost2001.xml b/tests/aleksey-xmldsig-01/enveloped-gost2001.xml
+index a00b1a91..d2535e92 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-gost2001.xml
++++ b/tests/aleksey-xmldsig-01/enveloped-gost2001.xml
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!-- 
+-XML Security Library example: Simple signature template file for sign1 example. 
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.tmpl
+index b1aef672..90c53215 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.tmpl
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.tmpl
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.xml b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.xml
+index 51813562..d0b7272f 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.xml
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.xml
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.tmpl
+index fe5e8e5d..6737c0e8 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.tmpl
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.tmpl
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.xml b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.xml
+index 865770bf..06a76abd 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.xml
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.xml
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.tmpl
+index 3ccee872..86755bc8 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.tmpl
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.tmpl
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.xml b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.xml
+index 33c16f5d..283ebf57 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.xml
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.xml
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.tmpl
+index 2342efb5..f0513280 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.tmpl
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.tmpl
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.xml b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.xml
+index ca8581ce..384fcdaa 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.xml
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.xml
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.tmpl
+index 4c4d5e2c..05572e63 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.tmpl
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.tmpl
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.xml b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.xml
+index 2ff30400..c781cc0f 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.xml
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.xml
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.tmpl
+index 48160c0b..bc7f712d 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.tmpl
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.tmpl
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.xml b/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.xml
+index d7ff383f..5adbecac 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.xml
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.xml
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!-- 
+-XML Security Library example: Simple signature template file for sign1 example. 
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.tmpl
+index 915dd55c..9e1cd393 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.tmpl
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.tmpl
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.xml b/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.xml
+index 2a517e0e..3dcba72e 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.xml
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.xml
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-same-subj-cert.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-same-subj-cert.tmpl
+index 915dd55c..9e1cd393 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-same-subj-cert.tmpl
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-same-subj-cert.tmpl
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-ski.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-ski.tmpl
+index 542680a9..adf7084c 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-ski.tmpl
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-ski.tmpl
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-ski.xml b/tests/aleksey-xmldsig-01/enveloped-x509-ski.xml
+index 68b2c554..89e77f0f 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-ski.xml
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-ski.xml
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!-- 
+-XML Security Library example: Simple signature template file for sign1 example. 
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.tmpl
+index ba982e63..868540cf 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.tmpl
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.tmpl
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!--
+-XML Security Library example: Simple signature template file for sign1 example.
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
+diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.xml b/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.xml
+index daa82e85..b4cfdb85 100644
+--- a/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.xml
++++ b/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.xml
+@@ -1,7 +1,4 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+-<!-- 
+-XML Security Library example: Simple signature template file for sign1 example. 
+--->
+ <Envelope xmlns="urn:envelope">
+   <Data>
+ 	Hello, World!
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/run-ptest b/meta-oe/recipes-support/xmlsec1/xmlsec1/run-ptest
index afd8c69853..edb5f7a4b9 100755
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/run-ptest
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/run-ptest
@@ -8,78 +8,130 @@ check_return() {
     fi
 }
 
-echo "---------------------------------------------------"
+echo "-----------------------------------------------------------------------------------------------"
 echo "Signing a template file..."
 ./sign1 sign1-tmpl.xml rsakey.pem > sign1-res.xml
-./verify1 sign1-res.xml rsapub.pem
 check_return sign-tmpl
 
-echo "---------------------------------------------------"
+echo "-----------------------------------------------------------------------------------------------"
+echo "Signing a template file with xmlsec1..."
+xmlsec1 sign --privkey:rsakey.pem rsakey.pem --output sign1-res-xmlsec1.xml sign1-tmpl.xml
+check_return sign-tmpl-xmlsec1
+
+echo "-----------------------------------------------------------------------------------------------"
 echo "Signing a dynamicaly created template..."
 ./sign2 sign2-doc.xml rsakey.pem > sign2-res.xml
-./verify1 sign2-res.xml rsapub.pem
 check_return sign-dynamic-templ
 
-echo "---------------------------------------------------"
-echo "Signing with X509 certificate..."
+echo "-----------------------------------------------------------------------------------------------"
+echo "Signing a file with a dynamicaly created template and an X509 certificate..."
 ./sign3 sign3-doc.xml rsakey.pem rsacert.pem > sign3-res.xml
-./verify3 sign3-res.xml ca2cert.pem cacert.pem
-check_return sign-x509
+check_return sign-dynamic-templ-x509
 
-echo "---------------------------------------------------"
+echo "-----------------------------------------------------------------------------------------------"
+echo "Signing a node in a file with a dynamicaly created template and an X509 certificate..."
+./sign4 sign4-doc.xml "data" rsakey.pem rsacert.pem > sign4-res.xml
+check_return sign-file-node-dynamic-templ-x509
+
+echo "-----------------------------------------------------------------------------------------------"
 echo "Verifying a signature with a single key..."
 ./verify1 sign1-res.xml rsapub.pem
+check_return verify-single-key-1
 ./verify1 sign2-res.xml rsapub.pem
-check_return verify-single-key
+check_return verify-single-key-2
 
-echo "---------------------------------------------------"
+echo "-----------------------------------------------------------------------------------------------"
 echo "Verifying a signature with keys manager..."
 ./verify2 sign1-res.xml rsakey.pem
+check_return verify-keys-1-manager
 ./verify2 sign2-res.xml rsakey.pem
-check_return verify-keys-manager
+check_return verify-keys-2-manager
+
+echo "-----------------------------------------------------------------------------------------------"
+echo "Verifying a signature with xmlsec1..."
+xmlsec1 verify --pubkey:rsakey.pem rsapub.pem sign1-res-xmlsec1.xml
+check_return verify-keys-1-xmlsec1
+xmlsec1 verify --pubkey:rsakey.pem rsapub.pem sign2-res.xml
+check_return verify-keys-2-xmlsec1
 
-echo "---------------------------------------------------"
+echo "-----------------------------------------------------------------------------------------------"
 echo "Verifying a signature with X509 certificates..."
 ./verify3 sign3-res.xml ca2cert.pem cacert.pem
 check_return verify-x509
 
-echo "---------------------------------------------------"
-echo "Verifying a signature with additional restrictions..."
-./verify4 verify4-res.xml ca2cert.pem cacert.pem
-check_return verify-res
+echo "-----------------------------------------------------------------------------------------------"
+echo "Verifying a signature using X509 certificates with xmlsec1..."
+xmlsec1 verify --untrusted ca2cert.pem --trusted cacert.pem sign3-res.xml
+check_return verify-x509-xmlsec1
+
+echo "-----------------------------------------------------------------------------------------------"
+echo "Verifying a signature over a node using X509 certificate..."
+./verify4 sign4-res.xml "data" ca2cert.pem cacert.pem
+check_return verify-node-x509
+
+echo "-----------------------------------------------------------------------------------------------"
+echo "Verifying a signature over a node using X509 certificate with xmlsec1..."
+xmlsec1 verify --add-id-attr ID --untrusted ca2cert.pem --trusted cacert.pem sign4-res.xml
+check_return verify-node-x509-xmlsec1
 
-echo "---------------------------------------------------"
+echo "-----------------------------------------------------------------------------------------------"
+echo "Verifying a simple SAML response using X509 certificate..."
+./verify-saml verify-saml-res.xml ca2cert.pem cacert.pem
+check_return verify-sampl-x509
+
+echo "-----------------------------------------------------------------------------------------------"
+echo "Verifying a simple SAML response using X509 certificate with xmlsec1..."
+xmlsec1 verify --trusted ca2cert.pem --trusted cacert.pem verify-saml-res.xml
+check_return verify-sampl-x509-xmlsec1
+
+echo "-----------------------------------------------------------------------------------------------"
 echo "Encrypting data with a template file..."
 ./encrypt1 encrypt1-tmpl.xml deskey.bin > encrypt1-res.xml
-./decrypt1 encrypt1-res.xml deskey.bin
 check_return encrypt-tmpl
 
-echo "---------------------------------------------------"
+echo "-----------------------------------------------------------------------------------------------"
+echo "Encrypting data with a template file with xmlsec1..."
+xmlsec1 encrypt --deskey:deskey.bin deskey.bin  --binary-data binary.dat --output encrypt1-res-xmlsec1.xml encrypt1-tmpl.xml
+check_return encrypt-tmpl-xmlsec1
+
+echo "-----------------------------------------------------------------------------------------------"
 echo "Encrypting data with a dynamicaly created template..."
 ./encrypt2 encrypt2-doc.xml deskey.bin > encrypt2-res.xml
-./decrypt1 encrypt2-res.xml deskey.bin
 check_return encrypt-dynamic-tmpl
 
-echo "---------------------------------------------------"
+echo "-----------------------------------------------------------------------------------------------"
 echo "Encrypting data with a session key..."
 ./encrypt3 encrypt3-doc.xml rsakey.pem > encrypt3-res.xml
-./decrypt3 encrypt3-res.xml
 check_return encrypt-session-key
 
-echo "---------------------------------------------------"
+echo "-----------------------------------------------------------------------------------------------"
 echo "Decrypting data with a single key..."
 ./decrypt1 encrypt1-res.xml deskey.bin
+check_return decrypt-single-key-1
 ./decrypt1 encrypt2-res.xml deskey.bin
-check_return encrypt-single-key
+check_return decrypt-single-key-2
 
-echo "---------------------------------------------------"
+echo "-----------------------------------------------------------------------------------------------"
 echo "Decrypting data with keys manager..."
 ./decrypt2 encrypt1-res.xml deskey.bin
+check_return decrypt-keys-1-manager
 ./decrypt2 encrypt2-res.xml deskey.bin
-check_return encrypt-keys-manager
+check_return decrypt-keys-2-manager
 
-echo "---------------------------------------------------"
-echo "Writing a custom keys manager..."
+echo "-----------------------------------------------------------------------------------------------"
+echo "Decrypting data with xmlsec1..."
+xmlsec1 decrypt --deskey:deskey.bin deskey.bin encrypt1-res-xmlsec1.xml
+check_return decrypt-key-1-xmlsec1
+xmlsec1 decrypt --deskey:deskey.bin deskey.bin encrypt2-res.xml
+check_return decrypt-key-2-xmlsec1
+xmlsec1 decrypt --privkey:rsakey.pem rsakey.pem encrypt3-res.xml
+check_return decrypt-key-3-xmlsec1
+
+echo "-----------------------------------------------------------------------------------------------"
+echo "Decrypting using custom keys manager..."
 ./decrypt3 encrypt1-res.xml
+check_return decrypt-keys-1-manager
 ./decrypt3 encrypt2-res.xml
-check_return write-keys-manager
+check_return decrypt-keys-2-manager
+./decrypt3 encrypt3-res.xml
+check_return decrypt-keys-3-manager
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb
similarity index 79%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb
index 1990444dcc..ca6ebba59c 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb
@@ -13,16 +13,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=352791d62092ea8104f085042de7f4d0"
 SECTION = "libs"
 
 SRC_URI = "https://github.com/lsh123/xmlsec/releases/download/${PV}/${BP}.tar.gz \
-           file://fix-ltmain.sh.patch \
-           file://change-finding-path-of-nss.patch \
-           file://makefile-ptest.patch \
-           file://xmlsec1-examples-allow-build-in-separate-dir.patch \
-           file://0001-nss-nspr-fix-for-multilib.patch \
+           file://0001-force-to-use-our-own-libtool.patch \
+           file://0002-change-finding-path-of-nss-and-nspr.patch \
+           file://0003-xmlsec1-add-new-recipe.patch \
+           file://0004-examples-allow-build-in-separate-dir.patch \
+           file://0005-nss-nspr-fix-for-multilib.patch \
+           file://0006-xmlsec1-Fix-configure-QA-error-caused-by-host-lookup.patch \
+           file://0007-xmlsec-examples-Fix-LibXML2-deprecation-warnings-and.patch \
            file://run-ptest \
-           file://ensure-search-path-non-host.patch \
            "
 
-SRC_URI[sha256sum] = "d82e93b69b8aa205a616b62917a269322bf63a3eaafb3775014e61752b2013ea"
+SRC_URI[sha256sum] = "a631c8cd7a6b86e6adb9f5b935d45a9cf9768b3cb090d461e8eb9d043cf9b62f"
 
 UPSTREAM_CHECK_URI = "https://github.com/lsh123/xmlsec/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"

