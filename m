Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C69C636FE
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.10022.1649931557939048593
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=m2VEI6L/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649931556; i=@fujitsu.com;
	bh=hDs9YqQ0f4CjUbhsaEfqIOp7ZWiK5zlpiX0XrSJCfJo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=m2VEI6L/u9CvlfQMdn2odsZRFIe55A+FIAxQIWDsGOR+6SGpJykVxsxgTEYO5nMV1
	 v5OQpPYaFweV0rwnAytLovin63DeuTMRCplbUQNfwxCcwt5Xjj6yWL6NopGTOE6rGZ
	 W0J/cSbjKIdGL1N9SGnIy3U8g1MNZNgSuzvZPli4DHmBoe90fsOrrPF0newjmBi3k3
	 b7OkT0WyMzs+tGK+k3v5hcEE5dSaMnKHocAJfRtsBDYsGhDwEcL+mXBPpc1nW4hY5S
	 cP0byP3yYOZGRmDkV1ImA2hphrriG7HNQIuBdhAHfUxhE6JFna0x1eVxBP518V8fbo
	 ahZcw9uheY+gw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxRVf5a3i
  Swd8OVYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNr+ySmgjPsFfefnGNvYHzL1sXIySEkMJtJ
  YsYUmS5GLiB7D6PEiR+zmEASbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdww5iCwvYSSz7f
  washkVAVeL5gptAvRwcvAJOEhvvq4KEJQQUJKY8fA/WyingLLGk/wLUXieJs6u6wOK8AoISJ2
  c+YYEYLyFx8MULZoheRYnZl5tZIOwKiVmz2pgmMPLPQtIyC0nLAkamVYxWSUWZ6RkluYmZObq
  GBga6hoamuoa6RgbGeolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgQGZUsx4
  egfjpr6feocYJTmYlER5Nd+EJwnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4F3wCCgnWJSanlqRl
  pkDjA6YtAQHj5II75q3QGne4oLE3OLMdIjUKUZFKXHemE9ACQGQREZpHlwbLCIvMcpKCfMyMj
  AwCPEUpBblZpagyr9iFOdgVBLm5f8CNIUnM68EbvoroMVMQIu/rQoFWVySiJCSamBam/4//7j
  Tl39snV6/9+xLe3HY4fnebxdfZJ3cfPFk8tbzk1K2TV4ffSTqiH63/eEOtskTmn7Wt+g037iu
  xCbSc/DwGYN5D9v9T5yyEb+9l+WmhcTCc8wBbiVSbjNialXmsN9+9Dt3rtVZr46/GVMd1vScK
  NF6+2DneUWRlCX7xWsX9C72YZz4qM/opffJV745bsvzmPlXee1ZnXxp7lJ3Off0az8283jKnY
  66OoFF086tx7PXms87gtM06OIRpr7ohSoN3x0b1F9/nPX0gu7R42vC72a97kiI3hzYKSy29Uq
  D1Oz1z1eXv042Lo4/zpfwZd45hkPOj8643q99eErp/IRKTn/7VY8WRh97/8W8R4mlOCPRUIu5
  qDgRALCsNlVDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-587.messagelabs.com!1649931555!117623!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17669 invoked from network); 14 Apr 2022 10:19:15 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-19.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 10:19:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23EAJ9c2031296
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 11:19:15 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 11:19:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] toybox: upgrade 0.8.5 -> 0.8.6
Date: Thu, 14 Apr 2022 18:18:52 +0800
Message-ID: <1649931533-20183-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649931533-20183-1-git-send-email-wangmy@fujitsu.com>
References: <1649931533-20183-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96651

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-core/toybox/{toybox_0.8.5.bb => toybox_0.8.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.8.5.bb => toybox_0.8.6.bb} (97%)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.5.bb b/meta-oe/recipes-core/toybox/toybox_0.8.6.bb
similarity index 97%
rename from meta-oe/recipes-core/toybox/toybox_0.8.5.bb
rename to meta-oe/recipes-core/toybox/toybox_0.8.6.bb
index 705f531f10..50ce50d1c2 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.5.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.6.bb
@@ -9,7 +9,7 @@ inherit cml1 update-alternatives
 
 SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "bfd230c187726347f7e31a1fc5841705871dfe4f3cbc6628f512b54e57360949"
+SRC_URI[sha256sum] = "4298c90a2b238348e4fdc9f89eb4988356c80da3f0cf78c279d2e82b9119034b"
 
 SECTION = "base"
 
-- 
2.25.1


