Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC27C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:25:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.16719.1673414727218771138
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dQr1lPHp;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414725; i=@fujitsu.com;
	bh=awu+eO3cLKZZtwhg8x11Bx8mRWsgR4FkhyJuDExom68=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dQr1lPHpS6eeCqqcgaiA0338aFo6ptUuG1FBkvXcDiH4xzV/EC52bGT8ViQk2qJ1W
	 v3xCVz0umQjohMsU2JjnDzvpZRHl9jhIGPiFUp0Rih4r7uqXGvOwbMmkb6szrleBFH
	 ZcIiIHk1SDKhT3VrCGd2gVJlOfmU77o4pMed1pgBuhrGiF+Y5OttxhlTvytNq1MlAy
	 l9md8ip/GiO/H7GkZc3+Dt5T2bOgMMWIAHhByKz2ae4/F989lxvHqUJ/XfrzLRA/UB
	 ZN38zTp8WjPsIMSM11b1C/ugUQV06xN/ejOgTWiK6g9EsxFnu/zEHNorbQlfjjYzdf
	 EHHaUJMrsdGWA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8OxWdfFY1+
  ywa6dahYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8afmzuYCrq4Kr59esrYwDiXs4uRi0NI4AGj
  xKdpj1i7GDmBnCtMEqevcEMk9jJKfD7wlhkkwSYgJXHj/n82EFtEQF9i6ew9YHFmARWJF7972
  EFsYQE/iUVXOxhBbBYBVYkXV/6C2bwCThI7zz9gArElBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL1
  4wQ9QoSsy+3MwCYVdKtH74BWWrSVw9t4l5AiP/LCTts5C0L2BkWsVoVpxaVJZapGtoqpdUlJm
  eUZKbmJmjl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5dasokRGIwpxQqXdjC+WfZH
  7xCjJAeTkihvnsS+ZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvCquQDnBotT01Iq0zBxgZMCkJ
  Th4lER4ax2B0rzFBYm5xZnpEKlTjIpS4rzO7kAJAZBERmkeXBssGi8xykoJ8zIyMDAI8RSkFu
  VmlqDKv2IU52BUEuZldgaawpOZVwI3/RXQYiagxYe79oIsLklESEk1MG0sVmNv7JlcsemxKKP
  FXOd72wWllU9/7by3ved8on3oM3u+dV6V/nIlFdX8d4r5LU80RyZWMx7OEmRjczgSznVW0OOf
  zvaK+uXsFVYXo7/lSj69c97tT8MVi6UTOs79l5/9Z6ntBws3z+gdHz6Zx5y+KdT67kr0+awKv
  so5J/QUtubVSF7+0CDDp8hk6Nfusbf10Wu20Pef/s76H7nu3Xf3ZWv2lQqY1XxS908wYD22QW
  lWpaFBdOLrJI6HzHN/J524HXL+QUWBBN/xLV80igU7Nx4/UzbRScT4ilzwzyuzxAt8qpb6XVx
  3Ko0tf5Zzn/SE9B8PHDcovz1fXj/Z707NvN6esqR1mtfTZoouVWIpzkg01GIuKk4EAMShWWJB
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-548.messagelabs.com!1673414724!39916!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13713 invoked from network); 11 Jan 2023 05:25:24 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:25:24 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 57EAE7B
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:25:24 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 4B84473
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:25:24 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:25:22 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cachetools: upgrade 5.2.0 -> 5.2.1
Date: Wed, 11 Jan 2023 13:25:10 +0800
Message-ID: <1673414714-13796-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100528

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 Add support for Python 3.11.
 Correct version information in RTD documentation.
 badges/shields: Change to GitHub workflow badge routes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-cachetools_5.2.0.bb => python3-cachetools_5.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_5.2.0.bb => python3-cachetools_5.2.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_5.2.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_5.2.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cachetools_5.2.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_5.2.1.bb
index 35b338ca8..7cb4f35d8 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_5.2.1.bb
@@ -27,6 +27,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[sha256sum] = "6a94c6402995a99c3970cc7e4884bb60b4a8639938157eeed436098bf9831757"
+SRC_URI[sha256sum] = "5991bc0e08a1319bb618d3195ca5b6bc76646a49c21d55962977197b301cc1fe"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


