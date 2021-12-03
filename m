Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6296FC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 05:22:36 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.8325.1638508954566725346
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 21:22:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xWlZtJ12;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638508952; i=@fujitsu.com;
	bh=IHQiCRoJlNOCtPmt8zLBia7q7ihsNgDCyw07oaEm/9E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xWlZtJ12NUThhxxIrCFFBeotueW/iWWep6h1K6ETP4u2kj/zOwqNsEAQoeYyeWvrS
	 t05oxsVV+FID1G3OQAiGaC3/KCFQtq/YBFtnfufMsrxbaGtdmPVgsa3sid8mAVyvrE
	 9KfYK5qYRj43Mf49NC6iyEET9uQN/0TvQXIi1+q6qfiAg026hu4rTPOQeJkI22SnKW
	 OkVwk0OBgYfNOs8O1FmuIo9vaW+lgFsz6UjAYKb6BinGDoPyORnwQaxJkAOzs21VwK
	 KPMxaadD18TMIqOdGEanPHRE70hPiRq0zZ1Jifw1qRwah6D6H4WVU5JuZ3rJ9tWs0M
	 yaTL38peprXSA==
Received: from [100.115.34.229] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id 3C/BC-16121-899A9A16;
 Fri, 03 Dec 2021 05:22:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqDtj5cp
  Eg4v9vBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8atYwkFZ3kr/jV/Y2pg3MDTxcjFISTwhFFi
  Qs8CFgjnApPElreLmCGcE4wSKydeZO1i5ORgE1CXeHzzNSOILSKgL7F09h5mEJtZQFWi++Iad
  hBbWMBbov9gC1MXIwcHi4CKxLJ/kSAmr4C7xJH5yiAVEgIKElMevgfr5BUQlDg58wkLxBQJiY
  MvXjBD1ChJnFjxkQnCrpB4ffgSVFxN4uq5TcwTGPlnIWmfhaR9ASPTKkbrpKLM9IyS3MTMHF1
  DAwNdQ0NTXWNTXSMDE73EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK3OScFL281JJNjMCQTClW
  PrOD8dOlb3qHGCU5mJREeV3lVyYK8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDNWAaUEyxKTU+tS
  MvMAcYHTFqCg0dJhNd+BVCat7ggMbc4Mx0idYpRUUqc1xIkIQCSyCjNg2uDxeQlRlkpYV5GBg
  YGIZ6C1KLczBJU+VeM4hyMSsK8XiBTeDLzSuCmvwJazAS0+PCs5SCLSxIRUlINTPnRdoWa7w6
  d8VsjcVePZe6Cx5MW+MS/nH1jGzAMLvR/0bglUXLigdmLcu2WdMPZbzwfivodyI/b49aftKI7
  4/P7iszOim+Wn/5Pfh65ruaZ5Otgh7+XMhP2LBRa7XtIc7qUjUHrlydPfmu17ts1RVDr3YrGc
  /KcVo4B/ueP9Z6KXjDre/zj3aFOZV27PSpPb+ITzFqzQW4f3/wFx9tKmzM2f+xY0+FzuO29ik
  5A7t5VMh2XV3yO3nalOeb6IdmYuhWnby47Gj91QvHkN9tulhhfNPkkmqG6umi2SJ9ulZEab3T
  fg8RVFv/zJTUzfTw6WSOmhvFLxUXGnxTx4mDP3Dglbo9x7p74Z+bmV+T5lFiKMxINtZiLihMB
  I4Rh/kQDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1638508952!85564!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29472 invoked from network); 3 Dec 2021 05:22:32 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Dec 2021 05:22:32 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CDF41100243
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  3 Dec 2021 05:22:31 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C2C5F100225
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  3 Dec 2021 05:22:31 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 3 Dec 2021 05:22:20 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pycparser: upgrade 2.20 -> 2.21
Date: Fri, 3 Dec 2021 13:21:58 +0800
Message-ID: <1638508918-22365-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 05:22:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94190

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
=================================================================
  - Much improved support for C11 (multiple PRs)
  - Support for parehthesized compount statements
  - Support for modern Python versions (3.9 and 3.10)
  - Fix support for structs with nested enums
  - Multiple small bug fixes

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-pycparser_2.20.bb => python3-pycparser_2.21.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycparser_2.20.bb => python3-pycparser_2.21.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb b/meta-python/recipes-devtools/python/python3-pycparser_2.21.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
rename to meta-python/recipes-devtools/python/python3-pycparser_2.21.bb
index fde868a701..3b8a9cd206 100644
--- a/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-pycparser_2.21.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Parser of the C language, written in pure Python"
 HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=86f1cedb4e6410a88ce8e30b91079169"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2c28cdeabcb88f5843d934381b4b4fea"
 
-SRC_URI[md5sum] = "b8f88de737db8c346ee8d31c07c7a25a"
-SRC_URI[sha256sum] = "2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0"
+SRC_URI[md5sum] = "48f7d743bf018f7bb2ffc5fb976d1492"
+SRC_URI[sha256sum] = "e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206"
 
 inherit pypi setuptools3
 
-- 
2.25.1


