Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2905CC63797
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:25:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.16723.1673414733566846375
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:25:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=u3jVwnuz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414732; i=@fujitsu.com;
	bh=JTq+FQAFWYoSetjhC1O/IHGFijrvvO7LwG/TEo+CyEE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=u3jVwnuzLMpF+nUSV7JreH69JEtqb87xzoUiCCccLx0RBM07265DoxKyWpknFMF6C
	 13fPj9Xs2DQ8LjdcTL4O16nR+htaQIWX6VidsVNPJdWtfZASIcGpR/K+eWidCyLEq9
	 wbCV6sBfbYXsmrC40MnELjFzZl1psD6sXNe0lS+6gmAcy5nXEsP/kN+ccXD3UQN8Ax
	 PbrXTvbO4YH9QBB73rvFrEEa/iwPkMnJtnOZh/Yuk3ZXAb5UoKvNDTh0Z8Tokr6MRm
	 X7Gv/N70fiY/UDsZKPRLNLXuGGf73wtrrUuvZSs5vUWHy978gl1SwrWd56TQm96lgT
	 YHJB35KY4AB5g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqOvtsS/
  ZoOGDqMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrH6/BbGgjdcFTcff2VqYPzO2cXIxSEk8IRR
  4sjexcwQzg0miUVd31ghnL2MEltW/mfsYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1ggUOJD+2VWEJtFQFXiy7mTLF2MHBy8Ak4SXxbmgYQlBBQkpjx8D9bKKeAs0TjhK1i5EF
  DJqulrmUBsXgFBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2pUTrh19QtprE1XObmCcwCs5C0j4
  LSfsCRqZVjKbFqUVlqUW6RnpJRZnpGSW5iZk5eolVuol6qaW65anFJUCZxPJivdTiYr3iytzk
  nBS9vNSSTYzA0E0pVvi+g7F76R+9Q4ySHExKorx5EvuShfiS8lMqMxKLM+KLSnNSiw8xynBwK
  EnwqrgC5QSLUtNTK9Iyc4BxBJOW4OBREuGtdQRK8xYXJOYWZ6ZDpE4xKkqJ8zq7AyUEQBIZpX
  lwbbDYvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmJfZGWgKT2ZeCdz0V0CLmYAWH+7aC7K
  4JBEhJdXAxGAUxc5Q/0G61j33h6aaxGW3zHWCZTpSAlut1kVWa3V/9bho8F/x3iXr98+Cbv21
  33fw2V8p6WjeLw4b3j9QVleYUMO1U4r1T1aDt/XurkczrnFELf3578cSr3+e1U0BPhfFpin9D
  rIpEc7f8eZhtWOuWjPvhC0Xfk1/mbhij4aU3fvwzzUsdcKhz1IObXn2k3vGLVnGigrHfVc/X2
  yQZ4tjvau9SHbOwelOicHCNXuNzs6fpvOQaX+mTbR86fItnu7pmoIZmemedwMdrXK2Ln/vrcr
  ll8b2wn6W8Jcj7Ne8fz+fvVTPr+x2+6LXnN9+hF3OP7FTZg9XxbOUN+/LxSyc88JOrddaP9E2
  1NlUiaU4I9FQi7moOBEAtkzKRFgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-548.messagelabs.com!1673414731!39152!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23157 invoked from network); 11 Jan 2023 05:25:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:25:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 12F0F100191
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:25:31 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 06176100182
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:25:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:25:29 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-migrate: upgrade 4.0.0 -> 4.0.1
Date: Wed, 11 Jan 2023 13:25:13 +0800
Message-ID: <1673414714-13796-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673414714-13796-1-git-send-email-wangmy@fujitsu.com>
References: <1673414714-13796-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100531

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 Do not use deprecated functions in Flask-SQLAlchemy 3.0
 Stop building Python 3.6
 Remove tests from pypi package

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-flask-migrate_4.0.0.bb => python3-flask-migrate_4.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-migrate_4.0.0.bb => python3-flask-migrate_4.0.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.0.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-flask-migrate_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-migrate_4.0.1.bb
index 3656a6ebd..7d3ac9e32 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alemb
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 
-SRC_URI[sha256sum] = "2a301c3040af6844f29d9149abe428a0f08ebc8fa149e72113bbb36fa341920a"
+SRC_URI[sha256sum] = "f62b51f9cd2c4f444deac111726a2335d0b846dcf51909a97e261d2098b816f7"
 
 PYPI_PACKAGE = "Flask-Migrate"
 
-- 
2.25.1


