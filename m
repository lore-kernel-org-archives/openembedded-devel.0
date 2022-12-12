Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67775C4167B
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:36:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.37713.1670830593034126640
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CvfdkVn6;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830591; i=@fujitsu.com;
	bh=Gk6/RWjQ8gQ8DBaUpuBRYz3FoL5AfXbje17KYsh2VeI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CvfdkVn6H+2KMeMSOjJNUR1KGLe18JE1I4N8gv+e5qV9c4VpeXlBZ0hJIMyC59Ltz
	 MtBRXEtqXK/1MRgL/5eZo+ZuB932VXIYCpFnEqHzXVhrTdG8wH/Y2Fc4KUYsxJmSZb
	 ZK6EPv2M4q7KunNO9xsIPjhHIpNc26SuG8G3j3YbkFXYf2iifwOZBmT7XSPbrxIjNv
	 PAPVOszy7MjU9O8UJRwGEN0vrPOPKf3HRaaYsC7a625ql10GrwxkpP87TyN0zOx9tZ
	 Vp0EEqz+V1a3FbOMntyYTEE5XIAgIujNZSSOsj/HyKMBWlK+02xYI8mHaiaApe8Xxu
	 aWHhvVLGJ7duw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqPv/5rR
  kg8MqFhcPL2V2YPQ4t3EFYwBjFGtmXlJ+RQJrxu/2w+wF37gqXq7YyNTA+I+zi5GLQ0jgCaPE
  o707mSGc60wS/XdWMEI4exgl7ny+ytrFyMnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICvxPfNE1lAbBYBVYk3k38zgti8Ao4SG7rvgM2REFCQmPLwPVgvp4CTxL3N3WC2EFBN0/
  4NUPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNilOLylKLdA0t9JKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OTc1L0
  8lJLNjECgzelWP3kDsYNy/7oHWKU5GBSEuWtvDItWYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7
  4ZrQDnBotT01Iq0zBxgJMGkJTh4lER43UBaeYsLEnOLM9MhUqcYdTlmfm07wCzEkpeflyolzs
  t+A6hIAKQoozQPbgQsqi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEua1uQ40hSczrwRu0yu
  gI5iAjoh6ORXkiJJEhJRUA1Ot+dFT3/MlcwN8ru/wyzPRuHQrY1qNvO7+EBEzbdFlmnI/OmKm
  TM38ujh8ZsKcxalV064vUM9c+Ssh/1TlQwPNWaKzt+ybY2yyIFdVZbft4om5Kyzbj3745VLny
  7ykf+dq2XK548lTr+VvOHr6j0vW/wn8sR0/44tFaw12hzeuErEztco7ZzfR/9NThaTDCrFvuP
  RM35TI1YlXXM3uco1tW/vy/7GTFkvy+m8sulUwUVpZXm3J/ZMb3ZPfJN2ozNjBbtWa+oHtctM
  rnq57t2vmpmr6TTOY9lRLuGRyQo/2/+CYt/Lx7Q82t119tDpCp2YpS3/tGfaeHQu3Ptwv/moH
  24LmVI0nanfyvB9mpCqxFGckGmoxFxUnAgAIPTTVZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-565.messagelabs.com!1670830590!181772!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17774 invoked from network); 12 Dec 2022 07:36:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:36:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B1E01100182
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:36:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A5CDF100043
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:36:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:36:29 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-traitlets: upgrade 5.6.0 -> 5.7.0
Date: Mon, 12 Dec 2022 15:35:48 +0800
Message-ID: <1670830548-3059-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830548-3059-1-git-send-email-wangmy@fujitsu.com>
References: <1670830548-3059-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100044

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 Performance: decrease runtime overhead for constructing HasTraits (up to 20x faster) #777
 Minor fixes for Application.aliases #810
 Adopt ruff and address lint #809

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-traitlets_5.6.0.bb => python3-traitlets_5.7.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.6.0.bb => python3-traitlets_5.7.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.6.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.7.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.6.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.7.0.bb
index 1e82dd341..9360b763e 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.7.0.bb
@@ -4,7 +4,7 @@ AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=f17a3ba4cd59794dd6e005c8e150aef0"
 
-SRC_URI[sha256sum] = "10b6ed1c9cedee83e795db70a8b9c2db157bb3778ec4587a349ecb7ef3b1033b"
+SRC_URI[sha256sum] = "bd0fca5c890a09bf66b33cce67ca14156b080429bc39c7ef26b075a4bd4f9fc3"
 
 inherit pypi python_hatchling
 
-- 
2.25.1


