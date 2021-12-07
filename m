Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5CCC433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 03:57:36 +0000 (UTC)
Received: from mail1.bemta32.sdw.messagelabs.com
 (mail1.bemta32.sdw.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.62538.1638849455046460597
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Dec 2021 19:57:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JwevErQc;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638849453; i=@fujitsu.com;
	bh=+qYo6/ItTYlpROQxFZ8FxM7iUIlKVhKidHlMhVgMQmM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JwevErQcmIICP2n4xMH4BEjspO8Sw04wnWFUhNQe2VY1K3YUWVd1MnDTlQKHQQq9i
	 r7R7BHHIgo5WnkS0NBWJUo9Yn4+OAp2uiAQ9qeqtH0A5yCcPwG3wETAw+4EcB2VV9r
	 NCsO5Y+YG8e0aFDBzcaqDGmdJ3SzpqVZCZqW3Biv8kjvCuwlgyzLBC+km4z3K5pta7
	 /8NoyiIkVcacL25xBuX3sZiqOri2yIH6NpPCvgZyTl82wsIRgvzD9U4iKa+4Sqa8iU
	 DSw5UoU3B7z3wIbI086H58v6Ol1sXhy/nPMTOkpCvyCGqTYRZ8P5kdYtJtDvqwbSWe
	 hRc40sG3ZYOaA==
Received: from [100.115.1.47] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id ED/74-29384-CABDEA16;
 Tue, 07 Dec 2021 03:57:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqLv69rp
  Eg9a5FhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bSHXPZCxZyVnzcuI+tgfE4RxcjF4eQwBNG
  iY6p95kgnAtMEjMnNDFDOCcYJV5OO8jYxcjJwSagLvH45mswW0RAX2Lp7D3MIDazgKpE98U17
  CC2sICPxNLf7WA2i4CKxMVZn8FsXgF3ia3nX4HZEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmC
  FqlCROrPjIBGFXSLw+fAkqriZx9dwm5gmM/LOQtM9C0r6AkWkVo1VSUWZ6RkluYmaOrqGBga6
  hoakukDQy1kus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzLlGKG6h2M/3t/
  6h1ilORgUhLljZi3LlGILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK/6TaCcYFFqempFWmYOMEZg0
  hIcPEoivGzAOBHiLS5IzC3OTIdInWJUlBLnFQRJCIAkMkrz4NpgcXmJUVZKmJeRgYFBiKcgtS
  g3swRV/hWjOAejkjCvPMgUnsy8Erjpr4AWMwEtjulfDbK4JBEhJdXAJLD7rvKT2NfMXgta6mU
  l1lzi3MPytcLp/+rrT596vDRh/HpExZN12eKk4tY5obz9m/SvK68WmVTjf5+R6/wT4eiQBo4f
  S6NOnFdzqm9rP+/KvSbGbdH1e+q7f3YfZ6s51Mf92q/A8V9e+CrP4rKJZzkeypebyZ0+3f8pi
  2tKuY/reVUFbuOvmq8O3rhoEuf4lHPL+Ym+s/bPTLhvprLYw1SeWeaU8Cc/rijbCY9/nXCUb5
  y3nitftk14h6rGO5+dgbPC2JmmfKr7ZtzvcijuxlpPi+Uh/yYKF93IFQ1+xjmv97VIqr7Ch5m
  ztyUzVbl8ur14Om/P32S5mQdcv1z/KCf2k5d932b5Tx8KLBUOK7EUZyQaajEXFScCAFL5eqZG
  AwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-587.messagelabs.com!1638849451!90098!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12678 invoked from network); 7 Dec 2021 03:57:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Dec 2021 03:57:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7654310022A
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  7 Dec 2021 03:57:31 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6B100100227
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  7 Dec 2021 03:57:31 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 7 Dec 2021 03:57:09 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-aiofiles: upgrade 0.7.0 -> 0.8.0
Date: Tue, 7 Dec 2021 11:56:38 +0800
Message-ID: <1638849398-17275-1-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 03:57:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94220

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-aiofiles_0.7.0.bb => python3-aiofiles_0.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiofiles_0.7.0.bb => python3-aiofiles_0.8.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_0.7.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-aiofiles_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
index 55e5545373..f7a75ec1ef 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_0.8.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[sha256sum] = "a1c4fc9b2ff81568c83e21392a82f344ea9d23da906e4f6a52662764545e19d4"
+SRC_URI[sha256sum] = "8334f23235248a3b2e83b2c3a78a22674f39969b96397126cc93664d9a901e59"
 
 PYPI_PACKAGE = "aiofiles"
 
-- 
2.25.1


