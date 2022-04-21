Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A14C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:14:34 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.7005.1651130066111882188
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fiqRTbbB;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651130064; i=@fujitsu.com;
	bh=BEzObpKr/7nC+TEjnV/ufuqT95RLaaKPjW6ySoGiOLE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fiqRTbbBuPmwWq8He8Z+aqPeWDysh1G5LCnV+Now/6HQk04Z5tQoI/e+3QWsaHQB4
	 825W8V3d45fsHH+yaDJlNBNPVlCXja/6nHx0t747n/rCzWtLf8k9lfDXS8FkypF6zd
	 D2P4g9GveZQS3mlp1hxVR9jZcJOWl9u1GIbMzORa/x4A+tUYh9sVuKMRaJI+fVJ1gx
	 YuQafKsHofn48zwzAEfllHIIWYvRf56u6Ne/slZ4niIsd5NO8EumQx1NnSWsnfLIHU
	 YP42NuQaF2L0MSjskoKMkrNeKfKt0sCbLXcFSt18GJlHITXdS74L7Sc0t/KmTc+IEa
	 qvHlDsdeORRag==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8MxSfe8XVa
  SwYM7yhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ar23eYC25wVkyfcIepgfEvRxcjF4eQwBNG
  idePLjBDOBeYJF7fX8MK4RxglPjYtRzI4eRgE9CVePFjMQuILSKgL7F09h5mEFtYwFui49E+N
  hCbRUBVYuONf0A1HBy8Ah4Sz/4Vg4QlBBQkpjx8D1bOKyAocXLmE7AxzAISEgdfvGAGKZcQUJ
  SYPV0eorxC4vXhS8wQtprE1XObmCcw8s1C0j0LSfcCRqZVjFZJRZnpGSW5iZk5uoYGBrqGhqa
  6prpGxsZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBoZdSzPpyB+P0vp96
  hxglOZiURHmtTLOShPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwKlgD5QSLUtNTK9Iyc4BxAJOW4
  OBREuGVMQZK8xYXJOYWZ6ZDpE4xGnPcXbh3LzPH4QmX9jILseTl56VKifOm2wKVCoCUZpTmwQ
  2CxeclRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8oSBTeDLzSuD2vQI6hQnolJVFmSCnlCQ
  ipKQamOb8yH1f7ciyVjRmooH/vR+l37qvXxDLvByqNl3g9Tvzl8Z3sss3PPI5r73ki+ejK4ca
  dy9T8Vpskx/O41kbsmidRf7ViQesdawaWT4d5/+WOP9nVapEjNKmo6+D3sb1C83jeMcQvL9j4
  73tGh8vTi7cMl9bdbH/o+y1+ZPVwhV/qKt0fc7+/mLtq/b4Ez1nMuRlWnx11F2tDZ/Fnvvb+b
  +vo5lZrGzaAkbRvzNYjfwPz/s6+8Rkj7yvsSEfvn17y63Icvbpxf8hi5oatIPeHUo+udomKqT
  IwuugsO8Dl/VXnkqLBBUGrLDT2dd+5vyVH7Id79pXsR/JvmifKTpL8krKs8lTmxKPzzi1aLWZ
  yw8lluKMREMt5qLiRADffDM6SgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-587.messagelabs.com!1651130063!7614!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7097 invoked from network); 28 Apr 2022 07:14:23 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 07:14:23 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1FA1A10044A
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:14:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 101D110032A
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:14:23 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 08:14:06 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pymongo: upgrade 4.1.0 -> 4.1.1
Date: Thu, 21 Apr 2022 17:58:49 +0800
Message-ID: <1650535129-15302-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 07:14:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96832

Release notes: https://www.mongodb.com/community/forums/t/pymongo-4-1-1-released/157895

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-pymongo_4.1.0.bb => python3-pymongo_4.1.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.1.0.bb => python3-pymongo_4.1.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.1.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.1.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.1.1.bb
index d47dfec50f..7bde4ff681 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.1.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "dbba77bc0b706c7ee496fc75a6c6ed406d85f6091d5fec488a8944c3828e6462"
+SRC_URI[sha256sum] = "d7b8f25c9b0043cbaf77b8b895814e33e7a3c807a097377c07e1bd49946030d5"
 
 inherit pypi setuptools3
 
-- 
2.25.1


