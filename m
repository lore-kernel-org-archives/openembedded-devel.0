Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01792C3F6B0
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:24:21 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.24168.1660703053052884121
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=y6paF8g7;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660703051; i=@fujitsu.com;
	bh=8eW865hPV+ciqOLGszYC2a05W4VmDztQwfCdvkgJVXA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=y6paF8g79Zb92dQnu20bvmyIfpOxUUSJkUNNJYmo8BAFnqNsvdj1jUOC8Oqyqb4yH
	 LD4AnsNfuzLRW075pvLd8oWn2K5B/e0kUalf3vLgpCWlIfNNWsR7S+ddi1Vl2QHWYl
	 vUdRr9TDw/kxLSfaI/zuR0j0UStEK9XdXe+RrxzmX8d0eP49oztN1u8Ful7y7aZHdX
	 r6d0f9ZFSiewRzfk7Y7CsXiFRizoSsOXnRp9Z2CHMdZWc6UYtaA49BZ9GS3vM4Ms+p
	 P86qnHINMaPc3Cb6rsiT+tU4PlFvZHWSqT4eK/XfZ+j0gJ/g6Sef103jOs1eBPV5kI
	 rOW1HJ4OhJ2Nw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORpOsZ+Cf
  JYG2vscXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHz+yK2gv8cFT0vJ7I3MC7n6GLk4hASeMgo
  sW3nTFYI5wqTRM+xv2wQzklGiVuXm1i6GDk52ATUJR7ffM0IYosI6Essnb2HGcRmFlCV6L64h
  h3EFhbwkXj3Yj6Qzc7BAhT/aQ0S5RVwl5j/eQsbiC0hoCAx5eF7sE5OAQ+JdauPgMWFgGouvz
  zJAlEvKHFy5hMWiOkSEgdfvGCG6FWSOLHiIxOEXSHx+vAlqLiaxNVzm5gnMArOQtI+C0n7Aka
  mVYy2SUWZ6RkluYmZObqGBga6hoamQNpY19DESC+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4
  Mjc5J0UvL7VkEyMwkFOK0/t2MG7c90vvEKMkB5OSKG8/058kIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK89/yBcoJFqempFWmZOcCogklLcPAoifDKBgCleYsLEnOLM9MhUqcYdTlmfm07wCzEkp
  eflyolzvvWB6hIAKQoozQPbgQswi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubd5w00hSc
  zrwRu0yugI5iAjjh28TfIESWJCCmpBqarmZvEPHgfBBxYpDg3uslgffAUDbGdTet+n0pXm12v
  t2HxnLchLzOSwk9safnMyv5gyV+XjSrJpqdeRSlNepatJR348/8Nzeba5CadJ781C2yf822ZH
  77Gy2CWYc1D5aQnsmxc6TILMhJnVM06n2pVLVQhHrrs5snyLzfM1ha4W8yZMbuWJUwvKPGztE
  W38M825e09rH83RmnzZj7+/L3VIpTto3W81N4pfdelCtw9320KUL7NUP0mxGx/wY0rBTrvp1T
  zf3l55M7hZ3t6A9uWHz0Yu2nTuSfHm7wXuH475/e5+oKaq72QYvOU4/F/n5/9LJk+X3QXL2PW
  72x9myTeTBYrDzf+I0Xcr6+ISCuxFGckGmoxFxUnAgD46Ll/awMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1660703049!280006!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11642 invoked from network); 17 Aug 2022 02:24:09 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:24:09 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 438041AE
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:24:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 377481AC
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:24:09 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:24:07 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-hexbytes: upgrade 0.2.2 -> 0.2.3
Date: Wed, 17 Aug 2022 10:25:15 +0800
Message-ID: <1660703120-15786-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660703120-15786-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1660703120-15786-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:24:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98266

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-hexbytes_0.2.2.bb => python3-hexbytes_0.2.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-hexbytes_0.2.2.bb => python3-hexbytes_0.2.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-hexbytes_0.2.2.bb b/meta-python/recipes-devtools/python/python3-hexbytes_0.2.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-hexbytes_0.2.2.bb
rename to meta-python/recipes-devtools/python/python3-hexbytes_0.2.3.bb
index 89792d9806..534cc88e1d 100644
--- a/meta-python/recipes-devtools/python/python3-hexbytes_0.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-hexbytes_0.2.3.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
 
-SRC_URI[sha256sum] = "a5881304d186e87578fb263a85317c808cf130e1d4b3d37d30142ab0f7898d03"
+SRC_URI[sha256sum] = "199daa356aeb14879ee9c43de637acaaa1409febf15151a0e3dbcf1f8df128c0"
 
 inherit pypi setuptools3
-- 
2.25.1


