Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F179C4708C
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.26868.1650872194991413210
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jzutBW3B;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650872193; i=@fujitsu.com;
	bh=40n3/sEGB4vw9rdVcGYx3qLC2Xo5f81utwk6j/DsfsQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jzutBW3BPQMfYfo3po0LWI1/FEBg7Q35ZbKvixP3ZZkRZf8tegByjOx5/T/Xxupiq
	 TyfUkbEWlJ9Dzql/jegZIbloDsSnsOiH7gquAd7Bd48vBntmUNq+keo9bXwJCJKWrA
	 Ft4IfY3WCHxpLtD8taAlV21sJ1aeeUoTqlQHXfHjebTBskOL8zhTy7kKS4h9ukcNq2
	 DCIu1SNXKSM2QOYBeSCcCzlyRTSQOMTQl/JBB4JlAXlbhZY2/qZObKUp8u23kWQCph
	 Ezde22RZaoPe3xEdwodZHG8lK+AbrUTMvrjEn1BVQUwiKECq9+rUeXGpAtuQbhT8/Y
	 Op4bVVPbw1YTQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxRbfBPy3
  J4MoEHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPPtknsBW2cFev2X2NrYJzO0cXIxSEkMJtJ
  YvaxfiYIZw+jxLE5+1i6GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7hx3EFhZwldj09
  AOYzSKgKjFp+yKwGl4BJ4mjH5rA4hICChJTHr4Hi3MKOEs8ePGFCcQWAqqZfOcJC0S9oMTJmR
  A2s4CExMEXL5ghehUlZl9uZoGwKyRmzWpjmsDIPwtJyywkLQsYmVYxWicVZaZnlOQmZuboGho
  Y6BoamuoaG+samlvqJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWWbGIEhmVKseLm
  HYwTV/7UO8QoycGkJMp7zyQtSYgvKT+lMiOxOCO+qDQntfgQowwHh5IE725foJxgUWp6akVaZ
  g4wRmDSEhw8SiK86d5Aad7igsTc4sx0iNQpRmOOq1eu7GXmuAEihVjy8vNSpcR57/oBlQqAlG
  aU5sENgsXuJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvOk+QFN4MvNK4Pa9AjqFCeiUT7W
  pIKeUJCKkpBqY4vannnts861L/1Z2wd3pkueuxDj6Z+9/sVVs4t7Osz7rr/xuZJ5pP8Vhyots
  5jdiT856//gf4KbzvtRC7d0U+7aClLm/v0dctI+XFViXPCdPZvb7aYFv34s/f91w15W7ukhm0
  een0Smzds+Uf8U3ZetuvwWTWjed5bc9HmQhvqRV9tcpp11nfti6+hpf7itLearteFbixuXzvm
  w9b8IFFnrcPjKja5nPNMXDM3fZpNV7Cn3rncLl0Wj2Lcw6UWee7onDeuxLZ1fJ5cza3PjK7WQ
  tm3fM/UsdMRyebyrsvp+S/hjyPaZ9pU6V5ZyUzEchjDVntn94f7nz0DzXfrbp20/dDhY0ftyy
  jfH8nAzBu0osxRmJhlrMRcWJAOslaQFYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1650872192!131932!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32718 invoked from network); 25 Apr 2022 07:36:32 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:36:32 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23P7aNcI007665
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:36:32 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:36:25 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nanomsg: upgrade 1.1.5 -> 1.2
Date: Mon, 25 Apr 2022 15:36:13 +0800
Message-ID: <1650872176-31497-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650872176-31497-1-git-send-email-wangmy@fujitsu.com>
References: <1650872176-31497-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96773

Changelog:
=========
 adds support for IPv6 and fixes a couple of bugs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nanomsg/{nanomsg_1.1.5.bb => nanomsg_1.2.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nanomsg_1.1.5.bb => nanomsg_1.2.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.5.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.5.bb
rename to meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.bb
index 005ad726f3..fdb781180a 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.5.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=587b3fd7fd291e418ff4d2b8f3904755"
 SECTION = "libs/networking"
 
 SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master"
-SRCREV = "1749fd7b039165a91b8d556b4df18e3e632ad830"
+SRCREV = "a081f1720f576d3e72ddce14e159ba90384e5b92"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


