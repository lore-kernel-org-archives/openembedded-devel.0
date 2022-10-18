Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA562C4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:11:56 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.1869.1666055515027095783
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NH3FuGsk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055513; i=@fujitsu.com;
	bh=eSFLfVV4x7Dsn4CnUdNo25nJ+Ts1hWPZ4E4XOx+e46M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NH3FuGsk04HS/Zwistc3I6nr6uUgn8Rk4VBnHTq/mhg+rLr0BJO1XkNvOeIHia12q
	 DipuCkxbvQwy1H/Lu09fRriKeDiF3OS74xLCKyCnYyRrEUVF5hfh6z7Nefry+iz+j4
	 68QAj+GthBfILKLjRjEnHZAT09DXo5S7mdNndz1CXaWcZ+gJcMgeFtgyQI7Txv8sGU
	 LEhltRfUS56SsAgc924X3H2Ek8FR3C59c/Ul4EzUuMOIQWr+dFWZTGNWhq/2YUbceu
	 vlRs2UBZxi6h9RShfD+1qLfllZgqgdacU/DGqTLGqQSiLqDb/FZkUVFjUtL3L2tHvL
	 P+uNwVBnC3iBA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8OxWTfir2+
  ywaWVshYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bBI7/YC75zVJw+sJitgXEJRxcjF4eQwENG
  iWknO9ghnCtMEvsO7mTuYuQEcvYwSuy/KApiswmoSUy/dYMVxBYR0JdYOnsPWA2zgIrEi989Q
  M0cHMICXhJXZ4mAmCwCqhKTXpuAVPAKOEr0bzsJVi0hoCAx5eF7MJtTwEmif0EDI8QmR4m3r/
  8zQdQLSpyc+YQFYrqExMEXL6B6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQvTi0qSy3SNTLQSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknR
  y0st2cQIDN2U4qTEHYx9y/7oHWKU5GBSEuXtmOGbLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV
  +sPUE6wKDU9tSItMwcYRzBpCQ4eJRHeqDNAad7igsTc4sx0iNQpRkuOqbP/7WfmWA4mZ35tO8
  AsxJKXn5cqJc6bBjJPAKQhozQPbhws1i8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEublAJn
  Ck5lXArf1FdBBTEAHZez3AjmoJBEhJdXA5LKfcX3ID9VfMhmf1pj8FTE/vCnfqWPpgr91D4ts
  xZJK9t921VQ+cu+gezfvDq55jz5s8ylbfjT/D5vz+rNT/O94PHgU2+qpJc/8VUM+L7ewtv+4Z
  WpMwcGmd498z53d+XH9uY4n0vwK+wPSU86U8m6I96jVFdWaZL/vn8SqcyzsBy/2xMz026fQLZ
  B36120jq2e6E+j1g+7HS+vPMs3PzLo/4qHua4vl4vM1SphPZn5YZLuAuWMQ7nqcjf7BOezZz9
  mtbu96vmjyza3l8u9dejR2Sxe8OdydFooh+bj+kQW1f3OFc19v8/N1mo3Yua98mkLz0V1nvOM
  vmlZFcufNS2ZWZx75drC65LdJpdmKrEUZyQaajEXFScCAGOzT+9wAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-745.messagelabs.com!1666055512!73471!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1860 invoked from network); 18 Oct 2022 01:11:52 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:11:52 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E4A25151
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:11:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D82B1150
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:11:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:11:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pywbem: upgrade 1.4.1 -> 1.5.0
Date: Tue, 18 Oct 2022 09:11:23 +0800
Message-ID: <1666055483-8143-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666055483-8143-1-git-send-email-wangmy@fujitsu.com>
References: <1666055483-8143-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99225

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pywbem/{python3-pywbem_1.4.1.bb => python3-pywbem_1.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.4.1.bb => python3-pywbem_1.5.0.bb} (94%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.4.1.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.5.0.bb
similarity index 94%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.4.1.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.5.0.bb
index 210d64320e..d109fa4601 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.4.1.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.5.0.bb
@@ -16,7 +16,7 @@ HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[sha256sum] = "ad8bbbe4ab7e795722c0f27f2656c92fc673a7e06a14cd151a50f0306454d17e"
+SRC_URI[sha256sum] = "c5f7e458c2530c61358fbc6333be74faf366aace78eae33741431267adf32610"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.25.1


