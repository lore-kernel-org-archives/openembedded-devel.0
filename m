Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EF6C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:43:43 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.4011.1665391417891866935
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ll0KMVuK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391416; i=@fujitsu.com;
	bh=fF4DdQ7IRLM6NJto5jMboRFbh6uu42icuG/P42fV/pg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ll0KMVuKIFN1T6ZGvGCODHv7L+lY7BR6Z0T/niMJTlPLwaI044CN7WXJn2uWmjr5d
	 1lx4MhPVb6XjIYMd3gfurutdaLDC7GXOkpdRM5UuticjK+rlaTYgtbegeowmCS6EsX
	 Y8BP9I2zhf7Zhj2rw4c80Tu2vl5utTlR/4lLijS6uqPMLQqjVG2547nPMflLOwAOEH
	 M44+cxG7XsGEWlwY8mOKBwnukQJiXeltV+w0DT2aCVGwemt1701mFQUENaY3y/QFKn
	 ct5FHH0pz+nSFRSLvPS1eZhQdWdUPcPOI6wc9DrcWuO4OpESWmfDMUSFXV5QfwDzoO
	 6iOLFp3Magxeg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MxSdf8tnO
  ywcRJVhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aNlnXMBdM5Kr7MWMjSwLiDvYuRi0NI4Amj
  xIK9l9kgnOtMEp9u3oByDjBKLP3XwdjFyMnBJqAr8eLHYhYQW0RAX2Lp7D3MILawgLvEgkkzg
  Go4OFgEVCWe3vQECfMChQ/8ucIEYksIKEhMefieGSIuKHFy5hOwMcwCEhIHX7xgBmmVEFCUmD
  1dHqK8QmLWrDaoVjWJq+c2MU9g5JuFpHsWku4FjEyrGK2SijLTM0pyEzNzdA0NDHQNDU11DXW
  NDIz1Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L08lJLNjECQy+lmPH0DsZNfT/1DjFK
  cjApifIaHHJOFuJLyk+pzEgszogvKs1JLT7EKMPBoSTB++QGUE6wKDU9tSItMwcYBzBpCQ4eJ
  RHeBxeB0rzFBYm5xZnpEKlTjLocM7+2HWAWYsnLz0uVEuetuwVUJABSlFGaBzcCFpOXGGWlhH
  kZGRgYhHgKUotyM0tQ5V8xinMwKgnzvgeZwpOZVwK36RXQEUxAR5y86gRyREkiQkqqgcl2qdH
  KKSX8f8W2t0eZWEzKXnnCOPhJSqeCuX3B+/g12mtV1QOz9y+Kzvl6riwnKkl7R50H14wP1/cc
  8jzX1ZAkfvnz5VWZ34wnTNm5yJCbx2SmaH4l/69Fm4xu6x48tOhVw4b9q54eYVY1PDebXeqcZ
  oqd3OXy7X4P14bcnHa1eKtm/fOd51Pl0s/+6P7nKrciuubHp0cW0Ue5rU/ctz7EGX20Vb0nZN
  amyfIKXnbd6wUnchR4PMvJvVu6c13DJ6EdvDrbTho9Yb/scyToa4G+yTQBTq7f7MuEUuc+/Lz
  NYaemYPT9w/48B6a5J/1xDop1mrf+seiBh1k61ZsD3m3WndcWe/amdfGBOZKT151WYinOSDTU
  Yi4qTgQAH6OjrkQDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-591.messagelabs.com!1665391415!312708!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25161 invoked from network); 10 Oct 2022 08:43:35 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:43:35 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8A1851000CE
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:43:35 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7D24E1000CD
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:43:35 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:43:34 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] wolfssl: upgrade 5.5.0 -> 5.5.1
Date: Mon, 10 Oct 2022 16:43:26 +0800
Message-ID: <1665391406-2538-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 08:43:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99125

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../wolfssl/{wolfssl_5.5.0.bb => wolfssl_5.5.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.5.0.bb => wolfssl_5.5.1.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.1.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.1.bb
index 3aa4f407af..790fa68b33 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.5.1.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
-SRCREV = "44f81f8bc082319cebf0e37df8470aa5748c1355"
+SRCREV = "f1e2165c591f074feb47872a8ff712713ec411e1"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


