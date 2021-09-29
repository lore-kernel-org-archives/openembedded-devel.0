Return-Path: <purushottamchoudhary29@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8F7C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 12:52:15 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.8352.1632919934271376143
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 05:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aYTQd/aN;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: purushottamchoudhary29@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 d4-20020a17090ad98400b0019ece228690so4128192pjv.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 05:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Hq8kpzV2m3QXPBUPsH7Tz7PBcucwbeUPyVDLzRNvdT0=;
        b=aYTQd/aNxcjV3wnYRhx4nI1pzNVCZqq4/wECJYA4XjAvc7qrxrusHjAhwPwzRAU/YW
         ArcnTR4YdC7VZYqRTFfK+UO02hESF0XO/wG1aS/aAh8c1VXlrNbAek0ZMOXvhGlqq97B
         53FiCsGOuTL+i72Wpc9L6pjNhm7H7gDrraF4CgrAdiU1fI+3RC8D2jWMbGjfsAWTM0ZE
         QKSRtPkOOVMgFLb1u6pu5qgObG4yCuVpiqgooqlGdu9ccwywihPCmr+0Ro52n/VgDiLY
         rjQaFqRt9BIWu4LfEiszgT+bwbEI4ITXQcOs05UXZDCpInGad/ilZgqaEvOt83U4oBfC
         rvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Hq8kpzV2m3QXPBUPsH7Tz7PBcucwbeUPyVDLzRNvdT0=;
        b=JH+2lhYCzCgaejNzUENRX/qw4kprMC5G/mBQHix2aKUJbE+m+WVrW7XdgLshUpB6rG
         EzJZoq5LZoJXl+JHADN9+ZXar4pXJzoJ3Cxo6W4AkEDZJ3xsplUh/UtvA0510UhCcS6C
         HZ6fi0ubJP/mfNACC6s8GCTuA2MdGs/nJlEwtEtokfq2sKPems8RJgQhrkuFCvDCllew
         RmmdPImY2i/opLFZRaov8eVhMwHjxeUYoKpmbddMAC+poWb2hSZ8jeVhCJ7FUasS1GH0
         mDBAu29s28qxHAFx+3bDtvtFKgd0i5t872+QAXWmlaoSwVSElO05yyp/T/aG3M/gW2H3
         qJtA==
X-Gm-Message-State: AOAM532M6Fxar4z4h1z6KqesKieQf5nxjw/c0xqRL9+Vl+jUzm65neYv
	iuutNIFCdWIrYVAMXlJAfJok9jqnIyDC7w==
X-Google-Smtp-Source: 
 ABdhPJxc8qh5CbvROp5HFsOSVV2b3F6B87ypArSB2f1OAeqqgBmnGTYiaMuwsPnNDw3YiRAZ1HWZeQ==
X-Received: by 2002:a17:90a:29a4:: with SMTP id
 h33mr6236880pjd.88.1632919933553;
        Wed, 29 Sep 2021 05:52:13 -0700 (PDT)
Received: from localhost.localdomain
 ([2405:201:a410:a032:c8af:5ac3:4078:7551])
        by smtp.gmail.com with ESMTPSA id
 l11sm1913307pjg.22.2021.09.29.05.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 05:52:13 -0700 (PDT)
From: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: mikko.rapeli@bmw.de,
	Purushottam Choudhary <purushottam.Choudhary@kpit.com>
Subject: [meta-oe][dunfell][PATCH] tcpdump: Update CVE-2020-8037 tag
Date: Wed, 29 Sep 2021 18:22:00 +0530
Message-Id: <20210929125200.3833-1-purushottamchoudhary29@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Sep 2021 12:52:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93168

CVE tag was missing inside the patch file
which is the remedy for CVE-2020-8037 and
tracked by cve-check.

Signed-off-by: Purushottam Choudhary <purushottam.Choudhary@kpit.com>
Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
---
 ...01-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch b/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
index 9b74e00c5..84d4716f3 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.patch
@@ -9,6 +9,7 @@ if we haven't captured all of it.
 
 (backported from commit e4add0b010ed6f2180dcb05a13026242ed935334)
 
+CVE: CVE-2020-8037
 Upstream-Status: Backport
 Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
 
-- 
2.17.1


