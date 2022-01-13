Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFDEC433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 09:44:05 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.6674.1642067044136726804
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 01:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=umfDt6Yf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642067041; i=@fujitsu.com;
	bh=sT9AL3Ee6dRev4igKe9JKeINnUdWPR4ZIDZD05gs6Kw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=umfDt6YfkFmE7JIAlIHwxjudnSzl6vdiYSC95sPuI1ZCerUlPYJHCO25q/xec0vkp
	 keyH3SUVwl/JhchOV0fU79cl2gK6cgLxQlzN5A+UuWaDR4cnzrymNYlIrxiwazI5C3
	 tnXKV6EgjKIfmrgwNAM8Sc+L2ZLNrOhMn4YQ0a6uvanZbpnrt5tWu+q5vUjRz18x7n
	 ZcQ525Gud1tOy0HvVjhKrUyCPJtXEoMLDnPScW7lBckCkh+qjzA+tbmlrpipAJeBB3
	 OAVSkYVAHCfsgXfd/IiSwBRMZThqrj2Vf9EiFRNkmtNiOjBw1XPS4xoyHZt0NPeISn
	 40pfbeuT6ttrA==
Received: from [100.115.65.13] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 7E/B0-31213-064FFD16; Thu, 13 Jan 2022 09:44:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MxSTfhy/1
  Eg1c9ahYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a5pfcYC1ZyVtyYvZS1gfEKRxcjF4eQwBNG
  iZ9X7zF1MXICOReYJHb2pULYJxkl1u3nB7HZBNQlHt98zQhiiwjoSyydvYcZxGYWUJXovriGH
  cQWFgiS+Hb0KSuIzQIUn9G7H6yGV8Bd4t+bF2A1EgIKElMevgeLcwp4SCyd9JANYpe7RNvCRV
  D1ghInZz5hgZgvIXHwxQtmiF4liRMrPjJB2BUSrw9fgoqrSVw9t4l5AqPgLCTts5C0L2BkWsV
  ol1SUmZ5RkpuYmaNraGCga2hoqmtmpmtoYaaXWKWbqJdaqpucmldSlAiU1kssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzllGKnXTsYD/b91DvEKMnBpCTKK/TpfqIQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd7HH4BygkWp6akVaZk5wLiCSUtw8CiJ8M77CJTmLS5IzC3OTIdInWJUlBLnDf4MlBAASW
  SU5sG1wWL5EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3nCQKTyZeSVw018BLWYCWvz2zz2
  QxSWJCCmpBiaxqzvuVO3eo7pn2vKv7YvaT70RqNetuC5Z6Xui9GZh4MFSp2uByx9eD/hV6u9V
  VCIWotR9/8DVmk9nfy/fOWmRwNTdWWncbBbLv2+5sFVqy+JfL2//6zq/X+jbnFM/T+/mEJR6t
  ufBI2nn88/3Pj+dnHRsLXvlD7HOA6xvj4TVOq44XLIsffuZB7KFWge3vNGZ3/xvm16+saB9+8
  IJRxVeJeq94JshkBGxrmLznerkWoYp2zWFj9h0BIsmiz3ZWWW/9dB+JUlJh/Pv/TnKrjN0TA8
  uWGM74cuSPe0t545v+yjVzffqimN9vvCzec+sN1jkR69iStuy4YFE68+Wjw8DNglUccxWlF3R
  c2tbetDKz0osxRmJhlrMRcWJAM7pq1tgAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-545.messagelabs.com!1642067040!9634!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23651 invoked from network); 13 Jan 2022 09:44:00 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Jan 2022 09:44:00 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 26FCB1000F9
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 09:44:00 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 18088100451
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 09:44:00 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 13 Jan 2022 09:43:46 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-timeout: upgrade 2.0.1 ->
 2.0.2
Date: Thu, 13 Jan 2022 17:43:34 +0800
Message-ID: <1642067014-26574-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642067014-26574-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1642067014-26574-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jan 2022 09:44:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94804

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...-pytest-timeout_2.0.1.bb => python3-pytest-timeout_2.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-timeout_2.0.1.bb => python3-pytest-timeout_2.0.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.0.1.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.0.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pytest-timeout_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-timeout_2.0.2.bb
index a790a6551f..7c77e4add6 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.0.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
 
 PYPI_PACKAGE = "pytest-timeout"
 
-SRC_URI[sha256sum] = "a5ec4eceddb8ea726911848593d668594107e797621e97f93a1d1dbc6fbb9080"
+SRC_URI[sha256sum] = "e6f98b54dafde8d70e4088467ff621260b641eb64895c4195b6e5c8f45638112"
 
 inherit pypi setuptools3
 
-- 
2.25.1


