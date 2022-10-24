Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB978FA373D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:02:05 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.16354.1666591317162430763
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=R6m5925u;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666591319; i=@fujitsu.com;
	bh=oXK3VHxYYMM1Mia5n1YFL6ERD19uqgCKj/I3X0zZS8I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=R6m5925uyGNAb0d1JqKOtYFmo7qapei3/DfRG9xfI2J6mraA2fTWlFqQpx5tCTX8V
	 vvKc853usmuvw0n6186bXqurHgR1hyHxlarB5i6fBZ+ghFouijsQd5xLSRzfeMm7qK
	 LJl2/iWpLI5qGptMDyzsPys645iY67KwIMDJluDIO0zSXx1nWlaWq7pK2lBvwBnW9V
	 6trJMXcTmBNSfqy7+oT/ZF0kesB7H0dPlSILcMMQiwahrJIpP7n0FxNpsqBYUZxNYC
	 gIpb18O61BqOd4KtpUa0gZhbmUrQu80PYfz3TsRiM8oi81RRB3GJ+yzMXk5Enoz7Sa
	 Fn4qoT3npJ31A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSTdcKyz
  ZYO9iZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPtg1XMBRM5K+68/cLWwLiTo4uRi0NI4Amj
  xILVmxkhnOtMEiffnGeHcPYwSjw5ep2pi5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBf4nbnStZQWwWAVWJG38vAdVzcPAKOEl8PKkCEpYQUJCY8vA9WCungLPElN9XWEBsIa
  CSzk9XwMbzCghKnJz5hAVivITEwRcvmCF6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZ
  ZSNoXMDKtYjQrTi0qSy3StdRLKspMzyjJTczM0Uus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuu
  zE3OSdHLSy3ZxAgM3pTi9NwdjJeW/dE7xCjJwaQkyssgHpYsxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYL3lTpQTrAoNT21Ii0zBxhJMGkJDh4lEd5+kDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8v
  NSpcR534EUCYAUZZTmwY2ARfUlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8yRpAU3gy80r
  gNr0COoIJ6IhLK4JAjihJREhJNTAtTrhokNMvY6jF/ubCBcXgDyqrbYLWT0wWOS/OtUhyoe+j
  payeq5yipSaqFD1KrCxw+rKCYfdx1lwFuwBBlS09V1pdt93/tq6B68jDHUbvJxQ4NuSJXzUST
  mZe8//usha7pNw3QTXRz5+Za07/cGl1Ve4RgX5/ixsnvii6PnL2FL/hI8wy9cnx2yGN2Zbuj1
  Pqn7CmpewUW252T2ru7HLnXSGFD82f3JFaWmnAu3nZyywRcYcfHxiZdzNctf34yN3zVpDbeh1
  DV7knviniVatq0j/NqnCR1Jnwl/HO8vyUKfNd4p6yzqyeFvb8bmISt6bZpI+7WXp5dzyKXaC6
  svTJXL+aKJbvdw74bt5YIqfEUpyRaKjFXFScCAAkkospZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-732.messagelabs.com!1666591318!193033!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16956 invoked from network); 24 Oct 2022 06:01:59 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:01:59 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7E42E1000E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:01:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 707BF100329
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:01:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:01:56 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.12.11 -> 2.12.12
Date: Mon, 24 Oct 2022 14:01:33 +0800
Message-ID: <1666591295-28140-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666591295-28140-1-git-send-email-wangmy@fujitsu.com>
References: <1666591295-28140-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99268

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_2.12.11.bb => python3-astroid_2.12.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.12.11.bb => python3-astroid_2.12.12.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.12.11.bb b/meta-python/recipes-devtools/python/python3-astroid_2.12.12.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.12.11.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.12.12.bb
index b9dc58082a..aa0ce44baa 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.12.11.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.12.12.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "2df4f9980c4511474687895cbfdb8558293c1a826d9118bb09233d7c2bff1c83"
+SRC_URI[sha256sum] = "1c00a14f5a3ed0339d38d2e2e5b74ea2591df5861c0936bb292b84ccf3a78d83"
 
 inherit pypi setuptools3
 
-- 
2.25.1


