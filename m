Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B06AC83F1D
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 06:30:41 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.51945.1752388237206341325
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 23:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ron+UC5e;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2737090b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 23:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752388236; x=1752993036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Q9XfmyXdVjUWjQMpCOIUG3lfpdgFzkPxDpWNuol7QU=;
        b=Ron+UC5e2sBzghJQhpt1+Bbis8s+tQ0mwCTVK32g+9R/PVXQqQFdvPSc/1A8rCNxeJ
         b00uPzhwSLRxYzquChy9eaSnUbvgcNkul91v123Ft39y+cR2H4lspsOHv7079m0mO6Tn
         ksQUBA+6N8M5HZtztQsYYXN7A9GZCOQxqd3iywlZ96ZQofgIHz2pkSbQOExIIeqILLs4
         QXqCg72jCCnZSQofieAvSqm0ncIHDc3lnk8lEl2f5BuHmtw17+GYOMwWxCTk2Ag/AGFv
         2ZyMb+EsmJDvbCtCFM4dF/1mWUY+NCy+F1Mzsbgx4FOsu5rd5ZO4CcQavqVEQClsN+CJ
         Y9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752388236; x=1752993036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Q9XfmyXdVjUWjQMpCOIUG3lfpdgFzkPxDpWNuol7QU=;
        b=kBMzvM7TLLfnRw43PNK37DWpsyIP9Jle3evfToS6i8/E/IuWr/rsdbPOjyaQRD9+HK
         iJr0cHBf9ldocU+YRrECeJQfRo48+ZZpxHO6Q2yykIokIAx2SuuHELb9RZs9JU9ve4p0
         CXlCMuFxCWPCtCEjFWkHVT5hTFJwgDPUtws5bsSpFd3Hdx3FNnwID1FfGwU6b9FRz5i5
         AWqgkmwJYwxbjDPwlb7mEnzrLNYnlhfw8AECWIiRSN6dBNpwUwSa7FJKxgZRCgq1IzCM
         3acEi5Y/YjolwsLGlzfMRuUNlZ0kSLSXMqS17l401JUiz0yzDHCPoujv3XBi9dBxOINO
         +Q3A==
X-Gm-Message-State: AOJu0Yzl3cSPmEyUocWI7untOppuUq3NyN7SnPN/ye/xF79OmHwhOIyi
	qkulppIxOU8Kl3fkWliQht2zEz0iTO5I4icgZ1sV+olyXU2XlaL04rPbyUqs1AXF
X-Gm-Gg: ASbGncszqP/gzLq5K2mNYnrW86qz73PY7gQiOTJBAbCl24gPN3qPG+heJexc5wk30jL
	aw9kziJoRDwpo/M5nBCK/v+68c673f7GM1HDdUm6/gMhjIMYXjecftjv5TzSf25RVdh5itvKcCI
	7MeqYGVuJX+y28gjd8UF6htlqB74fqj94cNRqP7Tp76wJ50U2lKqv63TzCUjnbSDTCCNluhBf71
	NMkx0sc1GxCQJQHZkas2J80DyHxLf+sW5qi8rWYB+gCInnMEQ6BiiN0GikFryEuIHFZV26TyPf4
	DBwvOXDX6kE3gqBrEkUYWB2CY2a5dCPH3J14X0b4VDLVYdzn5hKIiWzMECa6Z8q8z6nYrEgFBY4
	xe4VOYe+xBS+eFA==
X-Google-Smtp-Source: AGHT+IHgX+7fhANUWf5bVSbJWwHpD4BXSUDSGtLpFKtAthXTbpSjxtyAXc22QXwB9DIKvn87+VNBpQ==
X-Received: by 2002:a05:6a00:3cc9:b0:747:b04e:941a with SMTP id d2e1a72fcca58-74ee274d335mr10038055b3a.17.1752388235916;
        Sat, 12 Jul 2025 23:30:35 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bce529689sm4928927a12.52.2025.07.12.23.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 23:30:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 7/7] civetweb: Update to latest tip if trunk
Date: Sat, 12 Jul 2025 23:30:23 -0700
Message-ID: <20250713063023.3538218-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250713063023.3538218-1-raj.khem@gmail.com>
References: <20250713063023.3538218-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 06:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118500

Fixes build with cmake4+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/civetweb/civetweb_1.16.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index 06d78b9328..bbf284474c 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/civetweb/civetweb"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ce6ce6eb1b2fd59ee6bab219470442a3"
 
-SRCREV = "d7ba35bbb649209c66e582d5a0244ba988a15159"
-
+SRCREV = "5864b55a94f4b5238155cbf2baec707f0fa2ba6d"
+PV .= "+git"
 SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
            "

