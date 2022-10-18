Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D102C4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:10:17 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.1727.1666055415957720682
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=W8DuxQRo;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055414; i=@fujitsu.com;
	bh=fibfGz/C5Apcy0X8VFDBjMIbt/VWYvCFxmb8idrH/VM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=W8DuxQRoB8dLYZ2UWdIlExqNUijADJSXAiUK7dQnTqq3BfMDwdHHw0MGGZhYFufGk
	 QiDmAi1bA+1UR0+OlwzHPIocj6W9/x4XPQiGRxDvCv0mndnSZRVj3VHIaNaWmrWUtX
	 xuYW03OGLYqOLDpoTNO0eXmWFSxZaRlH3Agbo4H4Gc5cDwcxu3O5AnOhqL/B/xfzY1
	 hWU8vFYzKalewD/BJvP2kHXLZ0LQhR6EEZpu1/gttW6rCRT5Q3qY3IXmb8iAEmN/iA
	 yScJwVZ8pmhvESc7SomrHeP28MdvoOH1ylBllhoB+0hsAcuuOSLjnQb1hLjIG9LmZI
	 DnrXQsFXE6rIA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpPv1j2+
  ywavb0hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8anzcfYC+ZxVvzad5G9gfEkRxcjF4eQwENG
  iUUv3zFDOFeYJB7tn8IC4exhlLi9bwNbFyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICoRLfXn4Ds1kEVCWuTJvDAmLzCjhKvN46jQnElhBQkJjy8D1YL6eAk8Si30fAZgoB1T
  x/spAdol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdITFrVhvUTDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGE2LU4vKUot0zfWSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS
  9PJSSzYxAoM3pZgxdwfjzmV/9A4xSnIwKYnydszwTRbiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  dvxAygnWJSanlqRlpkDjCSYtAQHj5IIb9QZoDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8vNSpc
  R5T/8GKhIAKcoozYMbAYvqS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeVN/AU3hycwrgdv
  0CugIJqAjMvZ7gRxRkoiQkmpgco0P2Bj2boe+RerH6LcpG+In/LBXPyf7Q3ydHceTQxenLtto
  quhrtWtfrNKdIH/hNoNtBy28Z06q+Sqbdpp5+e67sWfO9Lg+/n2e78Pdfzs+bzJUqNuuLH1Io
  ozDJMtuSu+/6St45Q7oRq3tvsJdvvJiw7xajevS3sqJG88+bxfSjf/IKdSrZ2Suv95udtDcaa
  UbI7nUXHrUb5gI7W5aXezsrny9TC+BbzFrXWKHR3Tm6WLf/rNRG7783rc3WeuQS/cMMX/tPWz
  nL387/1Ozfda5D3Y/uN8sagre4rbi+MIzZwQC3ky4fFwg+9S61b9Yy1Ry2JgcMw9bnrTndBKq
  iXd8Wlyy69ZBmfsSz/duV2Ipzkg01GIuKk4EAG+gQbhlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1666055413!278462!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7456 invoked from network); 18 Oct 2022 01:10:13 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:10:13 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 184971AC
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:10:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0D1CD1AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:10:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:10:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-core: upgrade 2.10.1 -> 2.10.2
Date: Tue, 18 Oct 2022 09:09:47 +0800
Message-ID: <1666055387-8084-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666055387-8084-1-git-send-email-wangmy@fujitsu.com>
References: <1666055387-8084-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99221

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gle-api-core_2.10.1.bb => python3-google-api-core_2.10.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.10.1.bb => python3-google-api-core_2.10.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.10.1.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.10.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.10.1.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.10.2.bb
index c7ded90984..b2e48ccdd5 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.10.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e16c15a11789bc5a3457afb2818a3540a03f341e6e710d7f9bbf6cde2ef4a7c8"
+SRC_URI[sha256sum] = "10c06f7739fe57781f87523375e8e1a3a4674bf6392cd6131a3222182b971320"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


