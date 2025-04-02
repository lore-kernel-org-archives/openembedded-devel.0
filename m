Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D517EC3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 03:42:56 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.18.1743565372880241004
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 20:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GEOdhl7/;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so839777a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 20:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743565372; x=1744170172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJhxjcVCHQxDO3/JMN1DROs+0ujdESD53QE9jQFznxA=;
        b=GEOdhl7/DP4fzJtW7lL8G8x6xZGSWGtQGoCma+gIYRvmJ9xt+7Y/5WpDaAmA40XIgL
         2cMHTjLXyZ2gqn2oMFBfRL7Y+SbPHPM0p16AJWNQjs+XeRImCZ7jY3ugaXmauCGZg3No
         skincgF8b/V1tzJn6OuNoLIwxuE8mfc7jlM98gBEDENUiiJHC+0ne0z9/JF3dh3EkOaB
         CCtabrhD6081nAcSYWGi0+6YvrwK0zmsMSqdW+zL5UPx+IFCe5pSkIosxAw6Z7OxN/o4
         rqnQ+eiNZFGrE6tLFeehppgRtbP2nm5BpnItvvg9E0OE6F6ZPvGUXIGWmTG04cijtjnt
         BFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743565372; x=1744170172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJhxjcVCHQxDO3/JMN1DROs+0ujdESD53QE9jQFznxA=;
        b=cmMoFuVOif4sw3CyOFL0EB+XZL3m163N2JmZDVhtpIJkreXqceGBooq2xfFtT8u3jG
         AuYuGplGxjWUEFhMaviIYtELbeKIZm+k7vMIj4P3rjQro7t6ugmdyHcIgVL8UxQQ89+7
         R61IntdcGA9oziypSc8aqMfsyed5Bz6aY+r//+O1k2x9/zrYzYP3uMRF/ckT6u3AKO04
         qfazpySMm2WaF8oLBmOdhLa1P1Beq55CsfwYaT4+KAAXi8bGAavmwLJVeV6OpnB6xuA2
         jMMMEOZxQPeIq7QxSzLalfmpG22N4CXRn/NXRPwXYFr5pkW2LVj3DSgL3xCRZ6BwXSuW
         W67g==
X-Gm-Message-State: AOJu0YwslIRQRSicgQxqb582ntD88BPyHyt04DeYE3WJg9Xl9Mok0Ptd
	H1Jfm1ayc4ufXzEQpOAUM+ZT1K7p8asULFWjpTe8rS4tef5zBbx+Kgtm0xiT
X-Gm-Gg: ASbGncstGQHSiz+ozK81RxDXXs+vyN+zUUKyz8bq2UdDrXtaICWn/y/2iGiyQmfVkHT
	AkdYM1BRVVmVwx0DEufR5mzPTahcr6Xit4OmtgjZG67cUPdFsolpX8z9YrjNBiQ0S9XOE+5OM+m
	FBWfUv8bjEBHR4/eJF4xZijwmgpXGZXILgstClGFNH14oYa9TMZ0lw2cR7ZUqQ2qN60sRObmsC0
	GwmtFeAqfRBuspSS0h1tDC0Mi/2rfUdPt4G1ld67HMomHFupyjOs8d1EqxQFeNhp9eqYPcSPda0
	5e1WlJ9YD5GtIM5JG/WHP74OGDYjwvPKSw1T
X-Google-Smtp-Source: AGHT+IE6ZOoHBKOoq64TeaihKIxUxzUK7PRmuBDKocRmeXBvnN5EX45PGEcSPofbt2AEUCvPySTR5Q==
X-Received: by 2002:a17:90b:528a:b0:2fa:6793:e860 with SMTP id 98e67ed59e1d1-30571a4fce3mr820998a91.0.1743565371930;
        Tue, 01 Apr 2025 20:42:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a85b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f93417bsm423010a91.37.2025.04.01.20.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 20:42:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/6] python3-pydantic: Upgrade to 2.11.1 release
Date: Tue,  1 Apr 2025 20:42:44 -0700
Message-ID: <20250402034246.1488516-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402034246.1488516-1-raj.khem@gmail.com>
References: <20250402034246.1488516-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 03:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116495

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-pydantic_2.10.6.bb => python3-pydantic_2.11.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.10.6.bb => python3-pydantic_2.11.1.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.10.6.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.11.1.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.10.6.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.11.1.bb
index 9c2bbf5140..2770b13831 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.10.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.11.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-SRC_URI[sha256sum] = "ca5daa827cce33de7a42be142548b0096bf05a7e7b365aebfa5f8eeec7128236" 
+SRC_URI[sha256sum] = "442557d2910e75c991c39f4b4ab18963d57b9b55122c8b2a9cd176d8c29ce968"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 

