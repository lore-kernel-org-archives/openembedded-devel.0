Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29025C43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 04:00:03 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.2763.1657857596639179935
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 20:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Fgd2TEWw;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657857594; i=@fujitsu.com;
	bh=7HD9qi1Ae0jE0d9dyEG06MIMpnmmL6zOCBwW0GZcXe0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Fgd2TEWwX5OOAeS1YZfmFhGZAdk2eqI+12R0ArvOGGOJ0XSAyGG3DM+6Uld/jiw4x
	 eXWuypgpE+eCm9UcDJlf4lJOrC0dtgRiyWtl3w11cXbY27v5iJbvI7YNRGYgaPgDoJ
	 xcwpIHWcwqhCXpYK1DD3dh+NWgkLIV4MB0BvNA5Kckotv8ROFFE2IE3G4ZKBLxCuhi
	 XFJkwvgNN2VoVSBjQkuWrH4afPprTjCfIqhKDlhQHU10jH7RkXozY8OzZy7mt1wE2y
	 g+hXG9h48WfmSq4bqwCe5T5mZcg/OGDBwpxV5au6BI3rhKSjWdL5di1MP1/lyge+W7
	 NkG56LjVkLZRw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWdfy2YU
  kg7OnZS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxvu66xFDznqPj68w9TA2MfRxcjF4eQwENG
  idvHbzNDOFeYJHbN2QDkcAI5Jxkl/q52AbHZBNQlHt98zQhiiwjoSyydvQeshllAVaL74hp2E
  FtYwEuiq3czUxcjBwcLUPxSry1ImFfAXeLFwi4mEFtCQEFiysP3YK2cAh4Sd1b1skOscpfYta
  ydBaJeUOLkzCcsEOMlJA6+eMEM0askcWLFR6g5FRKvD1+CiqtJXD23iXkCo+AsJO2zkLQvYGR
  axWiTVJSZnlGSm5iZo2toYKBraGiqa2mua2hsqZdYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdc
  mZuck6KXl1qyiREYxinFid07GFfv+6V3iFGSg0lJlPdQ/oUkIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8xx4D5QSLUtNTK9Iyc4AxBZOW4OBREuF1egiU5i0uSMwtzkyHSJ1i1OWY+bXtALMQS1
  5+XqqUOG8JSJEASFFGaR7cCFh8X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzLsE5BKezLw
  SuE2vgI5gAjrioS/YESWJCCmpBqYzUuv5FK8tCp9Rd+dntIO8YKxcTIFM3M5UBqn7F389Tp2g
  0RrxxvOm7WOu1Gsf+4JOTrv1Yv4EV4tV4WJL9XtNe38W/17x3jfYxNe1627Vxd/L5/34t/C9V
  eSn9Sv09G8vk2q1OFmaXKWo9Xre5oSc8zee3JMoj9VN4U25+fLnpLu8nZcr7s5kfi+747xjzd
  q1IgvmvlJyKT76hKf49sRktuirxXP2XfjAMqdW9twr78JlbxbMPi95wI9plusdht9Klf7hF3k
  9jvadberez7TWVuan5O+KxUXf/BXq37n9FSozTi1JdA14snHZDtHYmN/bp/9fsvjFzZy4Z8KO
  7kK35fxvau18/CCSeaaCVuF8JZbijERDLeai4kQAwbQCtmoDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-745.messagelabs.com!1657857593!217276!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29532 invoked from network); 15 Jul 2022 03:59:53 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jul 2022 03:59:53 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E2F67152
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:59:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D68DB150
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:59:52 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 15 Jul 2022 04:59:51 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 5.29.2 -> 5.30.0
Date: Fri, 15 Jul 2022 11:59:37 +0800
Message-ID: <1657857578-19917-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657857578-19917-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1657857578-19917-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Jul 2022 04:00:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97834

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-web3_5.29.2.bb => python3-web3_5.30.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_5.29.2.bb => python3-web3_5.30.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_5.29.2.bb b/meta-python/recipes-devtools/python/python3-web3_5.30.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_5.29.2.bb
rename to meta-python/recipes-devtools/python/python3-web3_5.30.0.bb
index c9820ebdf..a35c05e06 100644
--- a/meta-python/recipes-devtools/python/python3-web3_5.29.2.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_5.30.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "f37b01f3dc32010b176cef01c2107bc25b7cf94b63c3269d4ec52d7e5ded9a36"
+SRC_URI[sha256sum] = "e141d90408fd9fe5156e2ef22884a160bef8bfd55e6cecd51181af3162ea84dd"
 
 inherit pypi setuptools3
 
-- 
2.25.1


