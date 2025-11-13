Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7FDCD4F28
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:19:45 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17873.1763014781776604599
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:19:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NNNCjirX;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b0246b27b2so583116b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014781; x=1763619581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYKJfPLjF3DnKnX9lPgukBL1a3GKG6W1pvaf20hpWsI=;
        b=NNNCjirX3/izdXDxvzZTCeZtRpcMBGILB5EMwYq7m4fM9Qtwow28VzPm2xEvl1pnaA
         fBPMwFACcG5041agNOoW0EkGdUtXkc3QssvaydrOOCyifPAcmkB+Am4a7Sn/hqPlIL1d
         UPXj1w30eRIEOso2jtUoOiweO/kporgGS9OBEuxCYUWE04jkKxhZg5hJ9eZOyATpHH0c
         Zbi87rBFUgFeUXHu/E88DTPIFLSvZJuAXA5QF084zs1+pcrPjAOAa0AhwkkXNblij6+x
         8RCLj2eP50dEdkaOxnYNXQ0OJaOPssG2MelBJGV34iHt8WTLN00VcelQ6Dta9Il5qlK0
         Fp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014781; x=1763619581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UYKJfPLjF3DnKnX9lPgukBL1a3GKG6W1pvaf20hpWsI=;
        b=PzbmAnqB5gS48YOQ8lsHQYTtoXx9xKF+fU417hE5f+KgIRbj8cfaxBZ8FOnguKBYpJ
         AXNxK4k0vb2/4YzI0m4FWzwCdWTPaUHtmHJWnHetzWnn3gpzcmAaTRdMgkT+CKSJBmNG
         LGm5vbdYcEWyBXqV6mtEJXRE8XMFeqOwVTooVnXZmFxxRseE2/o/u1eOZ2tgztdaQaUT
         M/i89IJE4CpDrSpPC1AfKQonVOy0PPwFgKup4u8P7aPwy3yV+LXelILiG6X/o1Bnocsx
         lgP3sisblkZJUoI853v9k+6ZcPYwIqZenFgE3aez0S0+O2o4jiS8OPlmWNf1DxMs7+0f
         Y/pQ==
X-Gm-Message-State: AOJu0YxIJpsqpA1hOGTULyW8EtfJ1hic4U7A8LdeF573vlRRmDayUo5d
	+DXkVyc39meja4dR58Ve61KicIvW3DCBY37MqtjKqsw0ysov8gRxzfwXuPOOQQ==
X-Gm-Gg: ASbGncuUFDCVWWD9kKycGRy+zhtuAAboc2ge52IXerM+HLaldOyEubj2mbjXrZpqXAI
	EN1jt225CMC+P8BhEQvPCe9RW0b+KWRvyH1l0EVW5l0Gefv4+tO1MHTohAR6o/qBpIiJ+T2x015
	rDDf2qmFqkWkJeWO2adXKg/RiqUJvHF+glj7iveoZ4wY7J2cd9PTSLF2pqRC07uzlVqY8XRcvYG
	PL5627/ksHBegqOUzCFkNnYfISA0xOgLZGwiKGV0eddABZS7ao7wfsNBFNsbgJOax6UEcrxComn
	a+Nw48OnfyoIxYk8kPKLhiwp2V57qBBOluKG8ZbVGT/WMRpOSCovdTsjktsMP3TeykNFw4FE+XB
	8yV7Dy+dOmvsM70QIDHkLE6Duev7xnOInow1iVwaYPy748EBGb+EP34ZBIgIEi8HL7gnbGfKLCt
	MNCEHfMr0O8cqtVQ==
X-Google-Smtp-Source: AGHT+IHBImOigVLgsXiI7exkkLINYnfBS26ofas4wnhgz/taht4/Qllt25LvqGizfky8nZ5wPFmHXg==
X-Received: by 2002:a05:6a20:3d1a:b0:263:9d85:3733 with SMTP id adf61e73a8af0-3590b028f82mr8047012637.31.1763014780984;
        Wed, 12 Nov 2025 22:19:40 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:19:40 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 03/38] xmlsec1: upgrade 1.3.4 -> 1.3.5
Date: Thu, 13 Nov 2025 19:18:38 +1300
Message-ID: <20251113061914.3756301-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121601

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit baa80b33057efd5077dd438132837b65de1ba40b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch   | 7 +++----
 .../xmlsec1/xmlsec1/change-finding-path-of-nss.patch       | 7 +++----
 .../xmlsec1/{xmlsec1_1.3.4.bb => xmlsec1_1.3.5.bb}         | 2 +-
 3 files changed, 7 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.3.4.bb => xmlsec1_1.3.5.bb} (96%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
index f107f42dab..697a8ee355 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
@@ -1,4 +1,4 @@
-From 4d73b85fb1b794c649359bc8a774b0111d36994a Mon Sep 17 00:00:00 2001
+From 1d7c01467e6f510b5636c73757f302a4bd277a3c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 4 Feb 2020 23:39:49 -0800
 Subject: [PATCH] nss/nspr: fix for multilib
@@ -6,16 +6,15 @@ Subject: [PATCH] nss/nspr: fix for multilib
 Upstream-Status: Pending
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
 ---
  configure.ac | 16 ++++++++--------
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 51621d6..3d23683 100644
+index 7f137c0..e15f5bc 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -960,24 +960,24 @@ fi
+@@ -958,24 +958,24 @@ fi
  dnl Priority 1: User specifies the path to installation
  if test "z$NSPR_FOUND" = "zno" -a "z$with_nspr" != "z" -a "z$with_nspr" != "zyes" ; then
      AC_MSG_CHECKING(for nspr library installation in "$with_nspr" folder)
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch
index 3a1531deb1..61c56ffc8b 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch
@@ -1,4 +1,4 @@
-From 9c861646e034b1c80fafd389279b0a7da90a8ba7 Mon Sep 17 00:00:00 2001
+From b43fa6bf612ee59db57573b39e357b6ca96d48b6 Mon Sep 17 00:00:00 2001
 From: Yulong Pei <Yulong.pei@windriver.com>
 Date: Wed, 21 Jul 2010 22:33:43 +0800
 Subject: [PATCH] change finding path of nss and nspr
@@ -8,16 +8,15 @@ Upstream-Status: Pending
 Signed-off-by: Yulong Pei <Yulong.pei@windriver.com>
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index ce8a278..51621d6 100644
+index 8add879..7f137c0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -935,7 +935,7 @@ NSS_PACKAGE=mozilla-nss
+@@ -933,7 +933,7 @@ NSS_PACKAGE=mozilla-nss
  NSPR_INCLUDE_MARKER="nspr/nspr.h"
  NSPR_LIB_MARKER="libnspr4$shrext"
  NSPR_LIBS_LIST="-lnspr4 -lplds4 -lplc4"
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb
similarity index 96%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb
index 64912c3b03..50c387d250 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://github.com/lsh123/xmlsec/releases/download/${PR}/${BP}.tar.gz
            file://ensure-search-path-non-host.patch \
            "
 
-SRC_URI[sha256sum] = "45ad9078d41ae76844ad2f8651600ffeec0fdd128ead988a8d69e907c57aee75"
+SRC_URI[sha256sum] = "2ffd4ad1f860ec93e47a680310ab2bc94968bd07566e71976bd96133d9504917"
 
 inherit autotools-brokensep ptest pkgconfig
 

