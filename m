Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3730C00144
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 04:17:12 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.1097.1659586629298828329
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 21:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YXDpA3FJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659586627; i=@fujitsu.com;
	bh=6n6uTl4pEGdTZidW+zWpV7JzocnynJ7VME9HZGCHqSI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YXDpA3FJU2dTUXS7Sqx9okFmx/rNlPvqjFP0mFPOhZg1bOadIksbZLnV6BMVxtx0R
	 M/utcUF0uTW6uz6KqPcTZL9r18P0EMaj+AIuyndaQ0s8blGqIYWUTtd7LHalQqfEuE
	 0dnTz3OGlBRJipKqPV7Y35MfgzAW3vghh046vI5W0FQZPlSLdk1D82T9X91mf77Cgm
	 SEjUBCroxSNGtjXQzCsjlO8iswPJQDpB5Be+p/jKiM8TIISI7G546bCscu58xiBEcQ
	 WthNO0wgr5tourOWgcEU+I938JPWBlPdJ0MvFw7orLdmzZFj2mFKguUiv/VHbGNXu/
	 xhsAi/EC88Z5A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORqOvs8Tr
  J4OV2JouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPjRRNTwQyuirlds9kaGI9xdjFycQgJPGGU
  uLXpACOEc51J4krHZ3YIZz+jxMz5r4AcTg42AV2JFz8Ws4DYIgL6Ektn72EGsYUF4iSedT5nA
  rFZBFQlLqxbCFbPK+AhcebgF7B6CQEFiSkP3zNDxAUlTs58AhZnFpCQOPjiBVCcA6hGUWL2dH
  mI8gqJ14cvMUPYahJXz21insDINwtJ9ywk3QsYmVYxWicVZaZnlOQmZuboGhoY6BoamuoaG+k
  aWljqJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWWbGIEhl9KscLeHYyXV/7UO8Qo
  ycGkJMor6/Y6SYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7y1ToJxgUWp6akVaZg4wFmDSEhw8S
  iK8oiCtvMUFibnFmekQqVOMxhx3F+7dy8wx82vbAWYhlrz8vFQpcV43d6BSAZDSjNI8uEGwGL
  3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3mSvQFJ7MvBK4fa+ATmECOkWH6wXIKSWJCCm
  pBqYe3zSRO2fY6n883n9H6758cKh1bWoQ49qITJGAxKh1Av/Y1p+6bdtXI8ByeWezCPc05sLM
  J5PZX4nMkbELUsyasENMw2t+egDj4viLRzMTXzhtWdrvmbx+b/lF1sKzJ7a+0rDh/7mvuyuCw
  98uSr3+srqb4WcHx3sHrzevn25vzDa988CT99Ksbye5SDOYnzK1CfE6z/JnxpmGqcudRPVnl/
  c/Tq1+dnPF/y0vrcTe5Vlt7HCfYVD4YnHjox1vUrYLym260/jty5Rb3AJ9Fg0rz5y6XuanqMF
  c7j8xZO/1s/tkTqVxNy3ZHFPhUHrhitd+oTMcs5YsMnlwQunyDteMT37id+8vPzo9upXjupMS
  S3FGoqEWc1FxIgC185ySTAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-565.messagelabs.com!1659586626!452111!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22116 invoked from network); 4 Aug 2022 04:17:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Aug 2022 04:17:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BBB81100190
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 05:17:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AFBC1100043
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 05:17:06 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 4 Aug 2022 05:17:05 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.54.0 -> 2.55.0
Date: Sat, 30 Jul 2022 06:03:34 +0800
Message-ID: <1659132214-16037-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Aug 2022 04:17:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98123

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ent_2.54.0.bb => python3-google-api-python-client_2.55.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.54.0.bb => python3-google-api-python-client_2.55.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.54.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.55.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.54.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.55.0.bb
index af1b934c96..e32bebe172 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.54.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.55.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "90ebbae53025545b45962c0bc9874640511f35e929df773d034f40d9464c86af"
+SRC_URI[sha256sum] = "1766c700eee14809ca1f7f52868c937755153289ea77ecdfd73dea6910e9a34d"
 
 inherit pypi setuptools3
 
-- 
2.25.1


