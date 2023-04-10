Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CA8C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:31:18 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.39484.1681115468866648171
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=s6awdCAj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115467; i=@fujitsu.com;
	bh=ms11iRKvHuwFuMTMNNvNuyuDsA1UbxRm0NHqWelPT4U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=s6awdCAjKCM/bLcafQ66K+UkNnnUx3KkJrQu6Chp7zSPhUzkhKwmVeEaQlPVCwEBW
	 TaKD28FjRldeKT7ayiJ5L56Tb8a1xKNWtmBC1c7P6eV7mNEYaF42zEfraxXP5lCmOy
	 NjJQbiBTNMi6SBWmkQ/vWFVrChVzoITtrQqLs7j4i11yZNUuOtaAp2O25Y5AtYWDSW
	 wTh6Y5hCNBE4pZUNPHtDw3nMEG339b1/V4tgOcMhHVTqOp1BoXUkuQT+vPstfInjC9
	 EKGYzgP8hKAcyScnEFXjE5ZDYH58FWC6r1VNXc0MIQjumCHyEC1oQi24h2OdqvRWJi
	 6VjzMAB0KwLEQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWdfrpHG
  Kwcyv8hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8adjbPZC/ZzVlzccIyxgfE+RxcjJ4eQwENG
  iUu/Y7sYuYDsK0wS9+fuYYZw9jBKPD82kR2kik1ASuLG/f9sILaIgL7E0tkgRZwczAIqEi9+9
  4DVCAt4SGw4s42pi5GDg0VAVeJnczxImFfASWLCve9MILaEgILElIfvwVo5BZwldi6fxApxhJ
  PEt4MLWSHqBSVOznzCAjFeQuLgixfMEL2KErMvN7NA2BUSjdMPQc1Uk7h6bhPzBEbBWUjaZyF
  pX8DItIrRtDi1qCy1SNdCL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMwcFOKWd/sYNzW91fvEKMkB5OSKG8Xl3GKEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  QnehQeAcoJFqempFWmZOcAogklLcPAoifBWHANK8xYXJOYWZ6ZDpE4xKkqJ87aeAEoIgCQySv
  Pg2mCRe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO+2w0BTeDLzSuCmvwJazAS0mMvFAGR
  xSSJCSqqBiatpm8zir1WXv9xZKp9a23zEtlrQpJDZ+rOFxIe5Zye/k3vYxb8m+/PDJ2p++vc/
  5x9msjOdaRt5/1WF8spDIYLPG9/yn2z6tc54lnpYSENP5D2dox83f1xose99122D25LN8/94u
  aQtrj53qU6RcfbFgzE/Ht3pq0zYfeCTn/ujk8Hzv7ZNvKyk8yqhtnPe0WCW7e43256ct9XTan
  WZsWjlleslS6OLGUIyViotzWM8Ys92bFuZ5ffb7HMTJq7fq23BV6Jy8/F+iXU7/jmeW735gl7
  ye31FJhWr+278wX6ze6cZybBv2btZsmNJpP42di2J4ovuzvMW7Dfnv+9+J9dLb8W3GwlL3s80
  +L1q3jYlluKMREMt5qLiRADL9OmBVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1681115466!376858!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17447 invoked from network); 10 Apr 2023 08:31:06 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:31:06 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 1C11B159
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:31:06 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 0FBB9155
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:31:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:31:04 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-networkx: upgrade 3.0 -> 3.1
Date: Mon, 10 Apr 2023 16:30:46 +0800
Message-ID: <1681115447-24458-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115447-24458-1-git-send-email-wangmy@fujitsu.com>
References: <1681115447-24458-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102022

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Supports Python 3.8, 3.9, 3.10, and 3.11.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-networkx_3.0.bb => python3-networkx_3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_3.0.bb => python3-networkx_3.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_3.0.bb b/meta-python/recipes-devtools/python/python3-networkx_3.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-networkx_3.0.bb
rename to meta-python/recipes-devtools/python/python3-networkx_3.1.bb
index c83771b1e..7158f7b05 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4266362445d56549f7b8973d02e5f22a"
 
-SRC_URI[sha256sum] = "9a9992345353618ae98339c2b63d8201c381c2944f38a2ab49cb45a4c667e412"
+SRC_URI[sha256sum] = "de346335408f84de0eada6ff9fafafff9bcda11f0a0dfaa931133debb146ab61"
 
 inherit pypi setuptools3
 
-- 
2.34.1


