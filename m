Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7E4ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 01:35:36 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.1685.1662082535299530367
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 18:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yawm/JVn;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662082533; i=@fujitsu.com;
	bh=vtcatnkoISj2STUwplyYdAQTFDicLiwBnppWhprK4vQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yawm/JVnhsEf8KPtTeCfG9jUi/g1DpS7zTrtr1fuef688BYtrMJgkJD1Al+fCxz73
	 g3K/ia0EKxbi5HQ605hafSlq8/Uu1Y7dAmYLHHyHK3XI/RRAiEeMT1Ct4pbLP71MTM
	 pyqmissfD3qURj+0MKrtAeEw8FI5k4WingTzvFbFWcO+C7EYJEnlKXDkH9ikyY+dvW
	 CM8uR1gX3ghba11xEFKcZB46VU6/giFR0axRylv/kBPyWccKSJI0mnHJpHEv3b947Z
	 8YCalWsaNfeeH3eJi7k1k++xex3Xlth150X6XPzDZiWmnC4aGXKzELuoZMX3OulNrM
	 RdXmXn6CGScCQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8OxWfdJrGC
  ywfR71hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bX8r8sBZc4KuY9/sTYwPiXvYuRi0NI4AGj
  xLHHu1khnMtMEkeWXoByTjBKHPi7jqWLkZODTUBd4vHN14wgtoiAvsTS2XuYQWxmAVWJ7otr2
  EFsYYFAiT0zlrCB2CwCKhJ/2mcygdi8Au4St288AbMlBBQkpjx8D9bLKeAhMWnFfaB6DqBl7h
  Jb3ntClAtKnJz5hAVivITEwRcvmCFalSROrPgINaZConH6IShbTeLquU3MExgFZyFpn4WkfQE
  j0ypG66SizPSMktzEzBxdQwMDXUNDU11jU11DCxO9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3i
  ytzknBS9vNSSTYzAME4pVt6xg7Ft1U+9Q4ySHExKorxMfwSShfiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwasUIJgsJFqWmp1akZeYAYwomLcHBoyTC+zccKM1bXJCYW5yZDpE6xagoJc4bGwWUEA
  BJZJTmwbXB4vgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFe/wigKTyZeSVw018BLWYCWjx
  9Jj/I4pJEhJRUA1O3P+txpd7Y+llbU36KxPqd5ROUPbfU5CgDK1NhIP/5Y3MCn7Je2luYnfdI
  hyVz0XHzXN3J7reP9nEdv3Kp95va0t210X3/HBJbdc/mS6ga1TupPE088URn9as+sQ3/Ji0ps
  5E5stlGMEG86XOERO1W5au2zpcDVnbGti2uWbTY+caKtjsHz5c01DCvmHMg/onx4Y1P7A+2Pf
  vk58z7aLK9BOfUNtcmnl0WLEL8U//tOdQ4Zf5u75ORB9leHzT9Ls5831xyepn/xwKr3Kk3rIw
  W36tbW2zFtjZXo+JnU5ROitS9soBbm+bcftlZZ3TwuP6MNdU7jCb6mjycks8XqPRz8YfVaifL
  2Njv/ExcekiJpTgj0VCLuag4EQD9wwS0XgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-571.messagelabs.com!1662082532!374943!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7364 invoked from network); 2 Sep 2022 01:35:32 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Sep 2022 01:35:32 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id AE3ED7B
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  2 Sep 2022 02:35:32 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A142573
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  2 Sep 2022 02:35:32 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 2 Sep 2022 02:35:31 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-marshmallow: upgrade 3.17.0 ->
 3.17.1
Date: Fri, 2 Sep 2022 09:36:38 +0800
Message-ID: <1662082601-12677-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662082601-12677-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1662082601-12677-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Sep 2022 01:35:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98590

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...hon3-marshmallow_3.17.0.bb => python3-marshmallow_3.17.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.17.0.bb => python3-marshmallow_3.17.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.17.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.17.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.17.0.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.17.1.bb
index f2f5281d6c..a7f4020cfc 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.17.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = "git://github.com/marshmallow-code/marshmallow.git;protocol=https;branch=dev"
 
-SRCREV = "4a6c08d53f181195c78b505abe155b2f35cbc0c1"
+SRCREV = "22e063270fea6ef6669425f53216e47eb8b04cc5"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


