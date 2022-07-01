Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6BFCCA473
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 00:22:04 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.32480.1656634921749060653
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 17:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ewcsi733;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656634920; i=@fujitsu.com;
	bh=nY7MPZhktDvCXIdUmjkLoAeiPXfoKOej7AIZP1+7Xr0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ewcsi733A/lRShuD/b2ZVIq/ObnIlSkrtxBPWp0Eq0WUHloCScFzn0kK2r8QjR3Ob
	 dpTcI+T7ENe+jAt0G38NYSlihbUlqbA4C3Hku6/OlawWclPRtNJapc/TgXAqrE75h6
	 SuLqNgMaWyAugg9IrZkHBJaxOTWE8EXWb46MO32OkcsJ8BAi5Kdti2wQlJYfAtH/9Q
	 QWPmwiMl9fl/m3gkCOn9SBV4JAie0XnDw7bKSh/QCLhWhE2J01KxYyLeKmwFCWC91K
	 ZUPHfzk0bt5tkjL8hLvnBAqZPSnH65qPaBAIXIHJ7yGTCM7EKeGcLQUjSDCDNa6y1v
	 4WYSiEnioM4Cw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWVfdbl+
  SwakdbBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aOe00sBTc5Km5sncbcwNjC0cXIxSEk8JBR
  4mvHIVYI5zKTxI13p5kgnN2MEp8vdjJ3MXJysAmoSUy/dYMVxBYR0JdYOnsPWJxZQEXixe8ed
  hBbWMBHonfJPkYQmwUofvT4WSYQm1fASeLRxslsILaEgILElIfvwXo5BZwlPvxpArOFgGrmtU
  9hgagXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0jMmLENaqaaxNVzm5gnMArOQtI+C0n7Aka
  mVYxWSUWZ6RkluYmZObqGBga6hoamukDSyFgvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMwjFOKGap3MP7v/al3iFGSg0lJlDfy3N4kIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8ojb7koQEi1LTUyvSMnOAMQWTluDgURLhLQNJ8xYXJOYWZ6ZDpE4x6nLM/Np2gFmIJS8/L1
  VKnDcKpEgApCijNA9uBCy+LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5s0DmcKTmVcCt+k
  V0BFMQEfsnLYH5IiSRISUVAMTg3+m34KOd0wdC2SOPjgRdrFTnUX2YNi0sgM6DxLF5Hvs9m4t
  XivyK232iVc7b32M36X2rWzBg8NLjivvreQ5FJvYOOd75OOQ5jnNLIrW30/8kkkUvLruQ1bG4
  qsrzJ5xXmDOY+2w0jyppr2nz6PpjGCUw7tdEmK/ny60OKAt/H3nNX7ZUzfs7u+Sm3b9/+K130
  On73ROeLAk/LGNeM8RVrnzR322F5S+nnlTXaZqIe/rkhu2J9KCOuIeZDqc7ra+3lrkp5g1XVF
  rlZfK3sp/etZdgaflNKRap69Xbp+8YOotT8c/wkYLMuYKfJ3d7dDw5N6bXWmppfcqcj3dAnen
  7mW6uSBZs2hSjM/dufv/KbEUZyQaajEXFScCAEDnYolqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-591.messagelabs.com!1656634918!168513!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31991 invoked from network); 1 Jul 2022 00:21:59 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Jul 2022 00:21:59 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id AA18F14C
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Jul 2022 01:21:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9DC6F75
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Jul 2022 01:21:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Jul 2022 01:21:57 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-jmespath: upgrade 1.0.0 -> 1.0.1
Date: Fri, 1 Jul 2022 08:21:25 +0800
Message-ID: <1656634887-17192-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656634887-17192-1-git-send-email-wangmy@fujitsu.com>
References: <1656634887-17192-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 00:22:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97647

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-jmespath_1.0.0.bb => python3-jmespath_1.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jmespath_1.0.0.bb => python3-jmespath_1.0.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-jmespath_1.0.0.bb b/meta-python/recipes-devtools/python/python3-jmespath_1.0.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-jmespath_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-jmespath_1.0.1.bb
index f454d6462..73f5f4d02 100644
--- a/meta-python/recipes-devtools/python/python3-jmespath_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jmespath_1.0.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2683790f5fabb41a3f75b70558799eb4"
 
-SRC_URI[sha256sum] = "a490e280edd1f57d6de88636992d05b71e97d69a26a19f058ecf7d304474bf5e"
+SRC_URI[sha256sum] = "90261b206d6defd58fdd5e85f478bf633a2901798906be2ad389150c5c60edbe"
 
 inherit pypi setuptools3
 
-- 
2.25.1


