Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC9BC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:01:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.3062.1657180904299384698
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kEcMo9mr;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657180910; i=@fujitsu.com;
	bh=/h9JID7GbufumEd5ZB4IPlneRFF32cXjvyvHBSL7KFY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kEcMo9mrZghKi3bWNYgVeAWHLOooJBys2FkdIiiPhKU1x5H0bJnGhIH4dwR48+7jm
	 UHSlIJd2kRXcxhAoUEvPzCmTQ1rzC7DTNtz5UAco+jvrKRgA5QA6iKyPD9jYEbSdHV
	 FP9eGa2SGteZHFT4iR/UkcyUaM0LCnGRZvZc8fm24aMXo8844sHvMSSrGqC3Ec3H4D
	 Obo5JEtcFTm7azRijJU1ztLb8l2WP8mHAt8nhlVGc3k0H7tJ3w0bgawW/An84VzuhX
	 4cF0nYsKUmn75gSfYzVSfS7bD9NUIYQTDDtWXfKSqf5Tnr5eXNMeydwz6IW8X6SrCO
	 /y0Igwv3ChMHQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORpPts0rE
  kg7u3hSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozGxvnsBdM5K3qm72RuYNzP0cXIxSEk8JBR
  Yvq7t2wQzhUmiUUb50A5JxglPt77zNjFyMnBJqAu8fjmazBbREBfYunsPcwgNrOAqkT3xTXsI
  LawgJ/EhTkNYHEWARWJm/NvsYDYvALuEp+ebwbrlRBQkJjy8D1YDaeAh8SeXRfA4kJANUdeXm
  KFqBeUODnzCQvEfAmJgy9eMEP0KkmcWPGRCcKukHh9+BJUXE3i6rlNzBMYBWchaZ+FpH0BI9M
  qRuukosz0jJLcxMwcXUMDA11DQ1NdYyMg00QvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMwkFOKFTJ2MH5f+VPvEKMkB5OSKO/qnmNJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4pScC5QSLUtNTK9Iyc4BRBZOW4OBREuFdAtLKW1yQmFucmQ6ROsWoyzHza9sBZiGWvPy8VC
  lx3o8gMwRAijJK8+BGwCL8EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3vkgU3gy80rgNr0
  COoIJ6Ihl+UdAjihJREhJNTDldh+alLKs+e3ZhTdK5lhzRO4rLul7ySZ7z1Bgq5BMiT6v8fpJ
  l3+0SYess1f8bt3kOMFss/6SZYt0HAw8gz3zTZfOuxhos2TZ8qgNVVLT9H6EuLgF/1F57PdUr
  bzTeduG9wI1grGWnw+514dIRqrPEVgu6rcrw1v2hkrKB4fvZf7rJ3y/66qjovfs8oazreaN7U
  yisucDrj6/8vzxbU7p5Tcm7QjR91qy/4xa6b7De31szyfMnzJx97OtZWxWNcxnL8xW+XxNJPJ
  ei1SvXG9xulNDRJHAF/kfE81+hE4xTw7UtU8/PHfuta4QD375Q0nO1vbS70q1dcKvajKc1wud
  EHzszMrfBh39Waa8HEosxRmJhlrMRcWJADpDcZprAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-548.messagelabs.com!1657180902!20470!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22395 invoked from network); 7 Jul 2022 08:01:42 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 08:01:42 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E39B51B8
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 09:01:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D5E791B4
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 09:01:41 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 09:01:32 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-autobahn: upgrade 22.5.1 -> 22.6.1
Date: Thu, 7 Jul 2022 16:01:14 +0800
Message-ID: <1657180875-31986-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657180875-31986-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1657180875-31986-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 08:01:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97758

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-autobahn_22.5.1.bb => python3-autobahn_22.6.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_22.5.1.bb => python3-autobahn_22.6.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_22.5.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_22.6.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_22.5.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_22.6.1.bb
index 956399b56..71da18f81 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_22.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_22.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "34aa5569b0b4419f8c277792c600dc2518c4930928c74e2279ef8b88d8b8a3ea"
+SRC_URI[sha256sum] = "fb63e946d5c2dd0df680851e84e65624a494ce87c999f2a4944e4f2d81bf4498"
 
 inherit pypi setuptools3
 
-- 
2.25.1


