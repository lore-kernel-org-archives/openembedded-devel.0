Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FAEC07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:08:52 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.8523.1664269723602884034
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Dr+4BGHr;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664269721; i=@fujitsu.com;
	bh=Gjl6pWyk6M6zwdntL6XPU77rNopUF+6UNVM3+hs2hqI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Dr+4BGHrLNWkH7nb+KKnCGafTRPeohKOAqZ1ickQfyA8FEBGjmrWjNYoo0yVQ7WGI
	 Co8aJGrfTqEQQnWbe2wEnyxxtvFmKAAkxsNJkrCwSwSMsj22QERiuV2ifkLd+qDjB2
	 sDZIFGsuO1spTkDoOaFrxIRdVSs7hP5gGJdvYlJgs5gO97GoPxghvxtgOzCVqgc4jh
	 gGZbCxRf2SaLRlKWAAC09ifV481XxSpz779PsChMhGJXSCAmtIhR5x3hhsjxqZb2Of
	 /NtBVnfgDvS5Ad6avbaPRDqeb+CAcKyEnM42yEKH2t6/K11U30W4zDqgEv25FD5V/h
	 JT1VzJt+SjPqg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8MxSXfmXqN
  kgwU7hS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozXh3YxF0zkqujtesHUwLifs4uRk0NI4Amj
  xN+pml2MXED2dSaJ90cfs0M4exglLvd/ZASpYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1ggTuLUuftgcRYBVYkpU/4zgdi8Ao4S50/0gcUlBBQkpjx8D2ZzCjhJNC9fyQRxhaPE+s
  dzGSHqBSVOznzCAjFfQuLgixdQvYoSsy83s0DYFRKN0w8xQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjHaJBVlpmeU5CZm5ugaGhjoGhqa6lpaAilLvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK
  3OScFL281JJNjMBATilOLt/BuH3fL71DjJIcTEqivPaLjJKF+JLyUyozEosz4otKc1KLDzHKc
  HAoSfBK7gbKCRalpqdWpGXmAKMKJi3BwaMkwrtuCVCat7ggMbc4Mx0idYpRl2Pm17YDzEIsef
  l5qVLivKZbgIoEQIoySvPgRsAi/BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV7TPUBTeDL
  zSuA2vQI6ggnoCDs+fZAjShIRUlINTLmvajQW/T5VtffCqtSZL5hCvx+9P3cef+hi57ung/jD
  GLQro++fmB7xx+WT6eI/s348XNRgtrhZ1f+O+sHcmfsc3dbETzjWorTZxevdyZXhOxZ4R1s8m
  s0h5q3ekMlsbLXZeI+/YfIHUyurntfd65SXrO87qXxjbs+h8x4ad2KNJlzd8NdU4N/PNLGia4
  KfWxJXVHD0nLGK3FDsaDjT7+hKS1+f6nXbZ2X4/vh6zeC0FJ/IYlmfennr5W47Zhg7ehU+5Zp
  tJmrOpHL0o/HnCM8dqSwfhKYZmRyu/7NzSfqb7csuLplrt3dVbpQic4VR5crbt5ku9p/Jjli3
  7Uf+p9IZ0htnpR8x69ZitmjfNlmJpTgj0VCLuag4EQDIpXtcawMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1664269720!97723!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8088 invoked from network); 27 Sep 2022 09:08:41 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:08:41 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id AD1E71000CC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:08:40 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9F275100078
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:08:40 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:08:39 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.61.0 -> 2.62.0
Date: Tue, 27 Sep 2022 17:08:04 +0800
Message-ID: <1664269685-2594-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664269685-2594-1-git-send-email-wangmy@fujitsu.com>
References: <1664269685-2594-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:08:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98977

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.61.0.bb => python3-google-api-python-client_2.62.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.61.0.bb => python3-google-api-python-client_2.62.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.61.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.62.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.61.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.62.0.bb
index 06758a7fac..abceda8d02 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.61.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.62.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "de0a0cb7bb18ebff5cf7dc782b48a488a14bd7684b538799f31bedab7de2b83f"
+SRC_URI[sha256sum] = "8307b85f0b8f84252747326de50eda279220cc1a3966d6b82e94486618275637"
 
 inherit pypi setuptools3
 
-- 
2.25.1


