Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796DDC4708D
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:39:05 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.153515.1672123134639873908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=a897LsJA;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123137; i=@fujitsu.com;
	bh=56msWYsM9ibU+DDVluMk1+Zvky72QKkeIDG7GrBmh4M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=a897LsJAi8SrSSj+RkhxDivwdWHvU97Uv0haJbylSPEMNry8B/BiZXBP2ReL+c9MP
	 ME4PPOg6gnNM2waR/XKIlgRMwFWwmiaMIOwKheKgsPcDjN7VN4/OJuV9//kz8rSPTJ
	 Tzxanp5lfOQS2tqUHVt/BAdCUh32JKKORceTddKuD/iELEodST2xdKlzLYIwdxQ0ZY
	 f8L0bvClrP/+jzkIZmylkn0Z+d+kTYlGorI4YW5+/OOxufsSl+c7ztliStC73skyer
	 /WUruToDiyRhIKdG5jFAOfCLAKggv9l21gyU5aQg8QQUcowV3NVRnU/5pzXDKLLGQM
	 za6NfwKYa2a+Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8OxWZdh8qp
  kg7NLlS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozT2+azFDzmrvj64yJzA+NTri5GLg4hgQeM
  Eudn3mGFcC4zSaxZuYcdwtnDKPHsTQdjFyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICvhI/TzeA1bAIqEp0vDgLVsMr4CRxYfkSMFtCQEFiysP3YDangLNE58ZfrCC2EFDNkc
  5uFoh6QYmTM5+wQMyXkDj44gVUr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n7Aka
  mVYzmxalFZalFuoaWeklFmekZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgQGcUpwavYNx7rI/eocYJTmYlER5pbpXJQvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  L0MkhMsSk1PrUjLzAFGE0xagoNHSQSilbe4IDG3ODMdInWKUVFKnDdxElBCACSRUZoH1waL4E
  uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnVQcbzZOaVwE1/BbSYCWjxh0MrQRaXJCKkpBq
  YItYq/XAsq12haaWw0NJ3WzH3nfoZK/2PP9gTf2bfZS3Oet57Dz151c7LNZzh0Jk+6Z6q/J3I
  joWF3s9037R9q7lU9Y/l3of4g72HW3pklbnUzvxIEQrkU191SLZr/tVkvYVJofKP55kvOGmpd
  0yybNI7F7O7HEYR98KW9D/6w6Qu+qS97m7mhjlqsgYH3gRZrzAWCvmTM1Np8ZlJLCWz+huSD+
  W4ss9991cyYG1Tzx6RhW5y5TpfFa2znvF6Cq0N/pc6yTf+pXVNksfxdrfSRtueGU/ivPWtj6n
  p++rcUDzhpVtqeOC/zPdV00xPSB5Y3BvFyfE5TfmuieGkCVcFJLYJHcr+u0BHI9LowWwlluKM
  REMt5qLiRAB5HjzWWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-732.messagelabs.com!1672123136!449402!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30111 invoked from network); 27 Dec 2022 06:38:56 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:38:56 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 0A7E27B
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:38:56 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id F149B73
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:38:55 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:38:54 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cytoolz: upgrade 0.12.0 -> 0.12.1
Date: Tue, 27 Dec 2022 14:38:16 +0800
Message-ID: <1672123098-31844-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672123098-31844-1-git-send-email-wangmy@fujitsu.com>
References: <1672123098-31844-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100262

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  Support Python 3.11 (including wheels)
  Drop Python 3.5 support

License-Update: Copyright year updated to 2022

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cytoolz_0.12.0.bb => python3-cytoolz_0.12.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cytoolz_0.12.0.bb => python3-cytoolz_0.12.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-cytoolz_0.12.0.bb b/meta-python/recipes-devtools/python/python3-cytoolz_0.12.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-cytoolz_0.12.0.bb
rename to meta-python/recipes-devtools/python/python3-cytoolz_0.12.1.bb
index b6977b029a..b63e71eb16 100644
--- a/meta-python/recipes-devtools/python/python3-cytoolz_0.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cytoolz_0.12.1.bb
@@ -3,9 +3,9 @@ performance utility functions for iterables, functions, and dictionaries."
 HOMEPAGE = "https://github.com/pytoolz/cytoolz"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=efbcddfa5610ca0c07ecfa274a82b373"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d422ebce3e9c6447563bd410e9b22f2e"
 
-SRC_URI[sha256sum] = "c105b05f85e03fbcd60244375968e62e44fe798c15a3531c922d531018d22412"
+SRC_URI[sha256sum] = "fc33909397481c90de3cec831bfb88d97e220dc91939d996920202f184b4648e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


