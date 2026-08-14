Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B820BC5DF70
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:28 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24500.1786747579658744612
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Yv9iNQHr;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1688051a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747579; x=1787352379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7N6DAr95gl5TDqPFSRHUicudzu3kGXo70kw+0rCGMGQ=;
        b=Yv9iNQHrjc90g64kNLNdBvRbfpcrJ43EZo9062rsUT4LdkE0O0lLb4My7I+hmtEgLB
         MTYK69kvNeqlB/IWCxL9u+mfJsiYfKKUkYFpWDrqOFDPMkM2gw3iubwZQGp8yTSqFNtp
         gcG9GVhf7I8Bb+xHHPodvIVpnml6cubFRirZRP841aslGPMsrQPH0aO5bAjAnGl2SFn0
         AWYV+a3n4sAfCDmszM3/XSwfnvSewYt7lGTMhuky4H9iSjujZjZUvrgs48NMBGwx/Eqk
         pHC1niNWSRhGw8EwurxHKKr6f98dfCNtPKvmG/+TNxNwoT9VEbJ2RtL9YmcBp6++6KMQ
         vRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747579; x=1787352379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7N6DAr95gl5TDqPFSRHUicudzu3kGXo70kw+0rCGMGQ=;
        b=MiqCCL/EFKGHTXRaNC8hz63Kx3cYFrGoGIN1oxyqn0e2TPjx6Uo/NUWGr8Rkitivvu
         nf8Pj4dvNdOp/JyshkLLtrExzWOVKU40UcJKmGLPs4jukUwUFGpqBZoa4raCF3Vo593r
         OA5/o8eOIgDr7/uz3+W12NqERKS4bL7WJDpZURtQc3Tk+fNFZXdTqLRhI8rcEX46w60F
         pxZlD6qZQ028Ux7eWiGVGBNUv6vGGtHaREQA/1HZNwrRNRazCwSiWi1pbKWkmsyguXlh
         YmZgruaF+TZ6/POs1SBqLlPbpItnO2pAi3rJ4z4WDwm6C4BiJc9BXGgXefUs5vefIxBG
         S9jA==
X-Gm-Message-State: AOJu0YxnSobKSa+Tnm/u6SbZWjn8xGpJWapM4tpcokVF+dcVLkBU5+RN
	RY9uy6YL5Z+qtYopWnAegqkW7zZgstrYDFdNoxnX1KJIxLu2xOT2649GqWSezA==
X-Gm-Gg: AR+sD13wAwxvnZXbfOUzIpA0CCPRN+2lzT25T1+Az97tsiILvsJIgRjfZ1v6aGrrTXp
	qEm7aDbRKO5237IfYqXI6koQJeOW37XXc38wa6GOFFj8UIs1pObxaGieL0RsoecrTUD+EEopOr4
	nBFupRV6uAoLVQFZKY66LDdpvuxdHaWSglWXoy/ZTL3TxIIPzf6anyD8iOS43ZkaGrtA8F84xcN
	1dDgfeWV8LN1dsAmPdnxgFw5DEdaTGzgcbz+od4acQw8CqFXm3XQOOhmnkSuy7ddW1HT3Xpcb4D
	rI3OxjpyXipHDCDq7Mt8bLoV4wgNTbhRDy/zMyeIaL6PCmBa7QnjxcUJSI7aIR5+jPF+fOTuwM6
	q29XpB8HoPCP703X5RlvOIjUpzeqTKi4HygApDRo+vMGFCdVrbMsAgfMs4g+0Xqtd1AiYywOxcG
	6YLwyqSlVFWYiCy3SkPNytXbI2KAiETNzmNQIGICxGzrSrNh5FifiCVSfCeV0bhMSdtrptTHV76
	Uzr9CdmK/zcZKMROonrVza894rM9iB2SoRyCpSDBkGxlKGq37/BByRe2syIbv7yxBKd3NhMBf6C
	uww/qqJM4H0dtyfMdHKCKMDRxTyBBLKX6cRkVi0oePxA9Tx2UWxLYCOEkt57m/qje/3NJ+GwaR+
	H51CDvZ/laR81gPPUJxr/LM5qGC3iOxYo1sUYFyOJO2yilQ==
X-Received: by 2002:a17:90b:264d:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-3933b93e1aamr10840316a91.14.1786747578963;
        Fri, 14 Aug 2026 15:46:18 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 033/109] libidn: upgrade 1.43 -> 1.44
Date: Fri, 14 Aug 2026 15:44:19 -0700
Message-ID: <20260814224539.1523174-33-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129097

Minor release; see upstream release notes for details.

Recipe-side changes: patches / files moved to the new version directory.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libidn/libidn/dont-depend-on-help2man.patch             | 2 +-
 .../libidn/{libidn_1.43.bb => libidn_1.44.bb}               | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/libidn/{libidn_1.43.bb => libidn_1.44.bb} (83%)

diff --git a/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch b/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch
index a066b100c3..bfa53130c2 100644
--- a/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch
+++ b/meta-oe/recipes-extended/libidn/libidn/dont-depend-on-help2man.patch
@@ -25,7 +25,7 @@ index ff62009..dba833f 100644
 -idn.1: $(top_srcdir)/src/idn.c $(top_srcdir)/src/idn.ggo $(top_srcdir)/.version
 -	$(MAKE) -C ../lib
 -	$(MAKE) -C ../src
--	$(AM_V_GEN)env SOURCE_DATE_EPOCH=0 $(HELP2MAN) \
+-	$(AM_V_GEN)env SOURCE_DATE_EPOCH=$(SOURCETIME_HELP2MAN) $(HELP2MAN) \
 -		--name="Internationalized Domain Names command line tool" \
 -		--output=$@ $(top_builddir)/src/idn$(EXEEXT)
 -
diff --git a/meta-oe/recipes-extended/libidn/libidn_1.43.bb b/meta-oe/recipes-extended/libidn/libidn_1.44.bb
similarity index 83%
rename from meta-oe/recipes-extended/libidn/libidn_1.43.bb
rename to meta-oe/recipes-extended/libidn/libidn_1.44.bb
index a4d779c5f2..652d67fb69 100644
--- a/meta-oe/recipes-extended/libidn/libidn_1.43.bb
+++ b/meta-oe/recipes-extended/libidn/libidn_1.44.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423\
                     file://COPYING.LESSERv2;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://lib/idna.h;endline=28;md5=82ce5c462ff87f37c7c0d3a92f8d2f6b \
-                    file://src/idn.c;endline=19;md5=21b4efac8525241da4d38dc1c2e3a461 \
+                    file://lib/idna.h;endline=28;md5=125a92599dac82ffe99800efc5cc03bc \
+                    file://src/idn.c;endline=19;md5=c6ef5ce9b4a04f1e2ac007e42bc86575 \
                    "
 
 DEPENDS = "virtual/libiconv autoconf-archive"
@@ -19,7 +19,7 @@ SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
            "
 
-SRC_URI[sha256sum] = "bdc662c12d041b2539d0e638f3a6e741130cdb33a644ef3496963a443482d164"
+SRC_URI[sha256sum] = "499608bab3a65650a0ea52888c13a8deebe3f71408e319acd9ec52e02eb13959"
 
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+ or LGPLv3
 # so package command into a separate package

