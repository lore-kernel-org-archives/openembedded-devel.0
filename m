Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C922C41513
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 06:07:06 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.5629.1712988418064543312
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Apr 2024 23:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i5qc/EP1;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e2178b2cf2so13818105ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 23:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712988417; x=1713593217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8x6IxeILevBsx0VLQjBrHk6xVX7j3S26wFfwJOLfZ00=;
        b=i5qc/EP1ZrejwmZiJkqeVFpskYmbEwTUotC5ztyxpHx3Cw7atHeq1UmoeyEAex5MoQ
         9X+UIQ/7mAKT1asJ+2JZLTBgwbc+QI7IEv/WyM3+FA4Hx3Ngxh4nBvLy8B1VEY1XqQmq
         EUfd3A4p6F/epBvLOZoB4NzZqR51vET9cns0PJQJxys0l2U6aaj08CHjcRirS//HOQAN
         pwcACjOo8sd5hd3x2SQHRM6cxaA0YAMpKB05lTIbPJelKk5mEX/bLLi5hMfe6MFATBze
         ExAQBILizXytLWc912IyBl9PI14TrRIps5/5F/W8x1bMSqqjH4FJSt7FC+5gQfDAquQa
         lVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712988417; x=1713593217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8x6IxeILevBsx0VLQjBrHk6xVX7j3S26wFfwJOLfZ00=;
        b=XoLquFGxiOMy8AAr3m0anNAg/hWU2yhShMFqLqGz/eyF8dA9do3dJmCi8nkxXwMqWf
         /v81qU/XIrajiIEcu9/lGudqK8YgtFghOloSyh+czTZ5F0mkKW9pvRuZGdN4aiaLKqcD
         Lm2cVLQR7dttQYpV+D1w0BwwhctnR0P6fiMG86fEYyw494zUKw65EYDLr+Eni1ZXrQXZ
         R7cguQhkSWlXCknXH1OMxYWjswA42Fir05ceaZgzj7kgAxXP/29oPUXIugTVlENHajT2
         s1AwCczPbygtqrQul89BOx8AHHEuqv4qh78xHj3WGxioKeT3gMZf2G4/xsOvDjLmEB3h
         yqhw==
X-Gm-Message-State: AOJu0YzUkGQypEG+nWE2BV80B9RnYbPf8i+5TIAHfpEOSb27yeEwWvR+
	mUphlCvSaNSmHcIAVFfmpaw8OTlGJx72YntGtdBtrm1ssqqDGC3lqz8faOY9
X-Google-Smtp-Source: AGHT+IFJ5PFRdG3XyfWJXMD3RUKM0n+CrY4g4n5Z9bs/MK0sPEMq/1i6b0J0b5tKRE3a4bZY3r5wmA==
X-Received: by 2002:a17:902:b187:b0:1e0:b62c:460d with SMTP id s7-20020a170902b18700b001e0b62c460dmr4264901plr.38.1712988417096;
        Fri, 12 Apr 2024 23:06:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id ju17-20020a170903429100b001e49428f313sm3953366plb.261.2024.04.12.23.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 23:06:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] pv: Fix ptest failures
Date: Fri, 12 Apr 2024 23:06:51 -0700
Message-ID: <20240413060653.2147909-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240413060653.2147909-1-raj.khem@gmail.com>
References: <20240413060653.2147909-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Apr 2024 06:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109946

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 2 +-
 meta-oe/recipes-support/pv/pv_1.6.20.bb             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index f5c7b9b719..a29408a822 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -35,6 +35,7 @@ PTESTS_FAST_META_OE = "\
     onig \
     oprofile \
     protobuf \
+    pv \
     sdbus-c++ \
     uthash \
     xmlsec1 \
@@ -68,5 +69,4 @@ PTESTS_PROBLEMS_META_OE ="\
     libteam \
     ostree \
     psqlodbc \
-    pv \
 "
diff --git a/meta-oe/recipes-support/pv/pv_1.6.20.bb b/meta-oe/recipes-support/pv/pv_1.6.20.bb
index 6d449a945b..6a739af927 100644
--- a/meta-oe/recipes-support/pv/pv_1.6.20.bb
+++ b/meta-oe/recipes-support/pv/pv_1.6.20.bb
@@ -18,7 +18,7 @@ inherit autotools ptest
 LDEMULATION:mipsarchn32 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'elf32btsmipn32', 'elf32ltsmipn32', d)}"
 export LDEMULATION
 
-RDEPENDS:${PN}-ptest = "coreutils"
+RDEPENDS:${PN}-ptest += "coreutils ${PN}"
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
-- 
2.44.0


