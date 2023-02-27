Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0D1C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:14:21 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.85600.1677485659710422899
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qMPIQ3ey;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485658; i=@fujitsu.com;
	bh=qxQ0OShrzr0pVYgppAGpSucNLVaN/saKkbrdMb8Enx8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qMPIQ3eylFA7o0QVT/TuXLD8Z0hAkyOfZLWxnMskfrbMCd7HwWn9//fhrXEl/4+4r
	 Zj9gjWQa53ejKE5Tl2Z3vks1QvQoYXLsC0UOqqXswKNMgmGjOqqx49OCqrdwCzTRry
	 EFVRiEdGbYoYp139DMAytQsyrqltulEWmjtZWOyQdGkIBbqLel/85umlqgSN2s1cyE
	 WBAPzrf6wgklIZrO3jzi/7Bxu40w7zv9DLw51T5Thfif07wOQ49LGeNyojthiOpcYW
	 qtkAah0HKvvu9Qs0JkFes6xJC7vioTVqmXaK2etLjKyjLtnANZ+bANzpb1BkISugHY
	 AXgLR+wMbZkfg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpBuZ9if
  ZYOMPfYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP+rbyCnZwVs28cYG9gfMjRxcjFISTwkFFi
  wfZNbBDOFSaJE9PamSCcvYwSh/c1AjmcHGwCUhI37v9nA7FFBPQlls7ewwxiMwuoSLz43cMOY
  gsL+Ers+3sBrIZFQFXiw+VzLCA2r4CTxM15t8HqJQQUJKY8fA9mcwo4S7z/tAusVwikpnMrO0
  S9oMTJmU9YIOZLSBx88QKqV1Fi9uVmFgi7UqL1wy8oW03i6rlNzBMYBWchaZ+FpH0BI9MqRtP
  i1KKy1CJdY72kosz0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2M
  wNBNKVYT3sH4pfev3iFGSQ4mJVHeRU5/koX4kvJTKjMSizPii0pzUosPMcpwcChJ8B5MAsoJF
  qWmp1akZeYA4wgmLcHBoyTCy2wElOYtLkjMLc5Mh0idYlSUEuflSwRKCIAkMkrz4NpgsXuJUV
  ZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvVALQFJ7MvBK46a+AFjMBLd7+8AfI4pJEhJRUA1P
  EL8k/LU3zdGubc/YFpjHXPuJ7cPe3en67+MuZm9+/4+CYlpD5nFG79HDkzH6VT8673ypyXt4q
  sMYktfF4079/r/6rLnlqpfDfIKmdN3PzjzeGWu9aL797tKL+m15lZeHqhtU10X/P6GRZimpaW
  n4W1551xT5Pf9+de15zbfNdTykrurwqv7P0R7NyHefyf0esPSekq9ult6098HFynLnw7ol6h9
  auPnLtYNM6qaz/SXJxysXv57jIiHJcj991v+Zqc2NCZcziTWEsX35k62SL/kjmW6WYnVpiuXV
  fxTUdEYMP6j82zTitLudW8GZ5o4ZJlYNRRqD07NneHG7rDQ865gp/n3CQNdM68sXlx0osxRmJ
  hlrMRcWJACeA+jtYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-565.messagelabs.com!1677485657!408796!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18847 invoked from network); 27 Feb 2023 08:14:17 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:14:17 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 7B27E1AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:14:17 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6FD457B
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:14:17 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:14:16 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-stevedore: upgrade 4.1.1 -> 5.0.0
Date: Mon, 27 Feb 2023 16:13:58 +0800
Message-ID: <1677485641-11740-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485641-11740-1-git-send-email-wangmy@fujitsu.com>
References: <1677485641-11740-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101289

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-stevedore_4.1.1.bb => python3-stevedore_5.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_4.1.1.bb => python3-stevedore_5.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_4.1.1.bb b/meta-python/recipes-devtools/python/python3-stevedore_5.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-stevedore_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_5.0.0.bb
index 66916838c..6b40b6c3f 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_5.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "7f8aeb6e3f90f96832c301bff21a7eb5eefbe894c88c506483d355565d88cc1a"
+SRC_URI[sha256sum] = "2c428d2338976279e8eb2196f7a94910960d9f7ba2f41f3988511e95ca447021"
 
 DEPENDS += "${PYTHON_PN}-pbr-native"
 
-- 
2.34.1


