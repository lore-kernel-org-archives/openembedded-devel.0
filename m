Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA67C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 03:21:26 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.1740.1668396078687463593
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Nov 2022 19:21:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FcSY7nS0;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668396077; i=@fujitsu.com;
	bh=V8MFwL7I14L7oFMyuzmXS2LEELJCa4S4lFxcwjCzEZo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FcSY7nS0UEPrsHC7Y5KhNOtHnPZ4+x6rgkhrNGuumi+htZVrmRzmmOzg5EhxA+Y1F
	 K2Q+rt3fmo4F98M+jHTcSb280cmoLq5Q0jnlIAPazrLNoBhDzjAVA+11mgweORdfKL
	 WH+Od6wo3QdaDdXsZ8uOHeSPqfw5F5Ylm3xLvJZ3cjX+0S7ECDDifPGAX1EBN+Iv30
	 3hWTrGgme1X+u0V5msZDMxFhc4VIyrxU0EBTQ0qoYyjv+cL8CxoENuI5Eu42PRe4Qy
	 MCjNoiLQFohxVkEc1QucQg0qtSRuzywBzDzakjEJ2pleEoJrDvSxhh7iblTgEZB/mz
	 o4jr6HG1Xc+BA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORqKu9pTD
  ZoKfB1uLi4aXMDowe5zauYAxgjGLNzEvKr0hgzTj0y7JgBmdF7/F5bA2MRzm6GLk4hASeMEoc
  37yTBcK5ziRxvKuBEcI5wCgxb+kWpi5GTg42AQWJhVvPsILYIgL6Ektn72EGsYUFfCXu/9rHD
  mKzCKhK9G25BFbDK+Ah0XflDViNBFDvlIfvmSHighInZz5hAbGZBSQkDr54ARTnAKpRlJg9XR
  6ivEJi1qw2JghbTeLquU3MExj5ZiHpnoWkewEj0ypGs+LUorLUIl1Dc72kosz0jJLcxMwcvcQ
  q3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2MwJBLKVZM2MF4aNkfvUOMkhxMSqK8
  /OsLk4X4kvJTKjMSizPii0pzUosPMcpwcChJ8F7YDJQTLEpNT61Iy8wBhj9MWoKDR0mEt3QTU
  Jq3uCAxtzgzHSJ1ilGXY+bXtgPMQix5+XmpUuK8KiAzBECKMkrz4EbAYvESo6yUMC8jAwODEE
  9BalFuZgmq/CtGcQ5GJWHeOyCreDLzSuA2vQI6ggnoiO+ReSBHlCQipKQamAIZPeN9TlrytuV
  99LB5ZVu727nyzEG2jzxhnL+sPWYLLK6ykzuoEPUxdMeSmquGIZ7W1z63W2VoPPl4W1TPs6hy
  geCZH3s49WcsVee+41lR9evg+9PTH0VEXTqceMDmkEVjZsb245Jvlz6YoCb5tn1m2rbYQ3+cZ
  XQNU8+FtisZsMo979WoXm6rp6m5LvWvudk0V3m9koA8r76teb+tdn36ZTp3n05D9Y/KF2+Wr+
  KeddzuYsqDw1INHs5Xbd4ui1Qxd9rFuUj26+HWWdrfLoUEKmrsZ9435XXCtx/7PkhPsk+dPb3
  v8JKUfO0fim/3vBfrOrBVXbhpY/T+m9oXvM4/PTNrveSfog9WVR/+8SmxFGckGmoxFxUnAgAR
  zYuYQAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1668396075!261432!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22619 invoked from network); 14 Nov 2022 03:21:15 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Nov 2022 03:21:15 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B29AC100194
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 03:21:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A64C2100188
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 03:21:15 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 14 Nov 2022 03:21:14 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-stevedore: upgrade 4.1.0 -> 4.1.1
Date: Mon, 14 Nov 2022 11:21:09 +0800
Message-ID: <1668396069-24459-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 03:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99581

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-stevedore_4.1.0.bb => python3-stevedore_4.1.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_4.1.0.bb => python3-stevedore_4.1.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_4.1.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_4.1.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-stevedore_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_4.1.1.bb
index 2749f481d..66916838c 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_4.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "02518a8f0d6d29be8a445b7f2ac63753ff29e8f2a2faa01777568d5500d777a6"
+SRC_URI[sha256sum] = "7f8aeb6e3f90f96832c301bff21a7eb5eefbe894c88c506483d355565d88cc1a"
 
 DEPENDS += "${PYTHON_PN}-pbr-native"
 
-- 
2.25.1


