Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF596C636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 11:19:40 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.81221.1675768774169275069
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Feb 2023 03:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yIfnKdLV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675768772; i=@fujitsu.com;
	bh=sIazNaFx1q8mbBm9VBxue6I2IbRq4meLcaC6Qy8TDBQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yIfnKdLVFTuHnUY5D2Ie19sjcpiWeU9pPQwU/MxCBvOVJf7l1+neuavWyayiaWMiU
	 U69vlGKvage2IZEc4/UCSj8gy2bNhLabCq6JtzODKswLfoiJpmnkp5d67vt7iv4Hgn
	 DFxSF+OQXK15zWofkD1eUP0gwhJMpaRe/RLWREt7M/R6625cqfRDGOJZRDeeUsU2xT
	 KCzJv2FeJMV8FYswKk9U47mjFEzOvWzNk3jkaeqta92M8izsoUxYT/nTvoV/ANc+KW
	 MR85yZXMJbvrs1pzVS0R4MfK2y1P9UWOl/ONP7cC2UwHHsHeLrhf2zxsonNcEZBYmh
	 YD3DV2aoW4LIg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpHvE+FG
  ywYMTTBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a51YfYC/o4K3603WZrYJzP0cXIxSEk8JBR
  4sX8z2wQzlUmiesHT7JCOHsYJdbMPcjUxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAh0T37XlgNSxA8R2HHzGC2LwCjhIz7t0Dq5cQUJCY8vA9mM0p4CSx7W8vWL0QUM2DOW
  1Q9YISJ2c+YYGYLyFx8MULqF5FidmXm1kg7EqJ1g+/oGw1iavnNjFPYBSchaR9FpL2BYxMqxh
  Ni1OLylKLdC30kooy0zNKchMzc/QSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTyUks2
  MQKDN6VY7fEOxq19f/UOMUpyMCmJ8t5XeZQsxJeUn1KZkVicEV9UmpNafIhRhoNDSYLXywgoJ
  1iUmp5akZaZA4wkmLQEB4+SCO89kFbe4oLE3OLMdIjUKUZFKXFeV5A+AZBERmkeXBssei8xyk
  oJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZN0AOawpOZVwI3/RXQYiagxSGqD0EWlyQipKQamAw
  P2LlUMKWfXSMiGrhgMYtUt6A1N8/7KoflJa+v99WH7JttdcHk2r3O06/O3U5yWhMnGJyYr/as
  6c7UGesV3+85crL21AJ3IatFjBe363KU/Yu/+HXCTZbVq28nbcwzWu7he0NeWJc5jT333uKX7
  34EbOl761Tw8tEiZ85nc37/dROUzSuQSc9adCFSs2uLfinvd07L+/l7dP/HfUuRb6+98pdVpu
  zv5NZDjWc6S9/N2HRit+KF+NMtP3rnXHv+ZEL6Ym7Xhg17ztoumc3f12Zs/THi8qXfq1oTzkj
  yv2uT2dI2rYv1R5VLoWFZTc2V34v+9xZ+nl32yHCbUOvS+qsh2blLhHafc5578L3ekm1KLMUZ
  iYZazEXFiQDR/oYmWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-548.messagelabs.com!1675768771!152829!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30757 invoked from network); 7 Feb 2023 11:19:32 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Feb 2023 11:19:32 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B91771AE
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Feb 2023 11:19:31 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id AD77C1AD
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Feb 2023 11:19:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 7 Feb 2023 11:19:30 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH] apache2: upgrade 2.4.54 -> 2.4.55
Date: Tue, 7 Feb 2023 19:19:04 +0800
Message-ID: <1675768744-3871-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675768744-3871-1-git-send-email-wangmy@fujitsu.com>
References: <1675768744-3871-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 11:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100960

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.55

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../apache2/{apache2_2.4.54.bb => apache2_2.4.55.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.54.bb => apache2_2.4.55.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
index 4f30eca59..88cef0ef8 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "eb397feeefccaf254f8d45de3768d9d68e8e73851c49afd5b7176d1ecf80c340"
+SRC_URI[sha256sum] = "11d6ba19e36c0b93ca62e47e6ffc2d2f2884942694bce0f23f39c71bdc5f69ac"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.34.1


