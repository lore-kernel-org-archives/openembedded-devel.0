Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6262EE7719F
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 12:37:06 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.15696.1736771823225558085
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 04:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GJMz+idS;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e479e529ebcso6134644276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 04:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736771822; x=1737376622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ULVurOEoXsUVOJm7cA6yPv3H/MrX9kuoJZTiubESLTU=;
        b=GJMz+idSjq58efRSrHbobAca4aqZTEfELyxBc0KBGU+jfktWGQ1czsDJEmXZjPfivX
         hFZtOdDDParsu9Abhz+lwFurENEuoYijF/gPANDIVS6gtVBJZDmBZWUprgth42LzJgvi
         vQ22Rx6P0mloy31FFh0vpRXNLNDLptqPVmvPrtrCxfPKGzRjJ58H7n1g0F84KXLB9Ir2
         BlE26TGg1pnDf9L1k0wu82m/wOlFB6Poh1QBaIGC1lKniKTvV3jgL2eu4NDof5HKV2ue
         NKHqVXA8Rf1o4ZJtf24TSGQ4ToKs4jgVhMt9id428t++XhMKy8wQLWID7ehcMCeq1+GN
         0sgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771822; x=1737376622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULVurOEoXsUVOJm7cA6yPv3H/MrX9kuoJZTiubESLTU=;
        b=RB3Himd4tQDAMTl3QGNpDCfeojsLVrcxPqZXIyf4JAxVUcjNeP8jOxo3/XldZkQHDk
         3uU+YAtKXaN4l7u8qDwH0Bq4o09TkeNiIZyHBph6FIg0ru3Zqu+Aa3mKES75iMn+ueTB
         VqaCmFHNv+jUIe8okbiWDCgAueGpZugtO41Wd0NqsrQ8Pe7VK6ucflqCdV2xUyfRG5m4
         Y/7gJ53eGFzptZdZd/VEamCjOwEiEAIJxtdNDPT14NM3BLxYUjz5LETYk6s2nFFkQeHH
         TpK7u6E71j8LBEbGN04qBlxRI1VRJM3li5YlIz5mrrtHQq1I1miaQO2JkEW5C+z43zhC
         oSDA==
X-Gm-Message-State: AOJu0YxtbCdv0tAHDpm6BStr/tDMKr8yziBx9Q7lEV+UzGKp/oAMEgTW
	d8aETCV1VX5BnSjnitpRj9F7Xw6pTUAGkKd/+bD7a52SjXCH4anesTrijs3X
X-Gm-Gg: ASbGncufrSI7Tjt153vLb8KTVScPJK6CeGorqpTFnpboAvbm1F+iIbkdUa/h56Bfhr6
	VWg6Gm0eqMwOMFAINrxYZ+UrfF03nsFZDttwEMm88OvMTLF7ziTfrlDdcMbQVuvjz3HRFsOYPUM
	0r+0X6P5x9dby9flLjhKSK8NimmJKCo6zeWhEmWfZSuGYDRSkkv1benIvJNFpmT3NDLln+eBEql
	LZvkWkZPUixkqUwG1qQW9joM8TGZI9H2/VVr+nDymU6Md7cfv1VPRkAc8T3cBDv5pdSF65jNiyX
	0TjavpCDL/RXi4M=
X-Google-Smtp-Source: AGHT+IF7sVjZlGuZE5kGfgs12H0vQ4yzsTz0vrRyo1PF/EYrNUKFuApeynz4t56cNBrYYMHWMAwOmg==
X-Received: by 2002:a05:690c:f8d:b0:6ee:9cb7:dc24 with SMTP id 00721157ae682-6f53130f1a3mr157691077b3.38.1736771821505;
        Mon, 13 Jan 2025 04:37:01 -0800 (PST)
Received: from localhost.localdomain (71-208-20-57.ftmy.qwest.net. [71.208.20.57])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f546c3eb05sm17261547b3.34.2025.01.13.04.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:37:00 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: upgrade 1.30.0 -> 1.31.0
Date: Mon, 13 Jan 2025 07:36:14 -0500
Message-ID: <20250113123614.1215902-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 12:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114830

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.31.0

Changes:

    Enable Query Cache by default. PR #786

Bugfixes:

    Enhance Windows DNS configuration change detection to also detect manual DNS
    configuration changes. PR #785
    Various legacy MacOS Build fixes. Issue #782
    Ndots value of zero in resolv.conf was not being honored. 852a60a
    Watt-32 build support had been broken for some time. PR #781
    Distribute ares_dns_rec_type_tostr manpage. PR #778

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.30.0.bb => c-ares_1.31.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.30.0.bb => c-ares_1.31.0.bb} (89%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.30.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.31.0.bb
similarity index 89%
rename from meta-oe/recipes-support/c-ares/c-ares_1.30.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.31.0.bb
index 40dc5b09b..98f6dbb63 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.30.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.31.0.bb
@@ -5,9 +5,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2047e36c793a8e9c3d3f4b66f8934a19"
 
-SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v1.30.0/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v1.31.0/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "4fea312112021bcef081203b1ea020109842feb58cd8a36a3d3f7e0d8bc1138c"
+SRC_URI[sha256sum] = "0167a33dba96ca8de29f3f598b1e6cabe531799269fd63d0153aa0e6f5efeabd"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


