Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39336C433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 09:19:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.2061.1652347167725110713
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 02:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SIScMir/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652347165; i=@fujitsu.com;
	bh=Lp/8mBRCRvpnZZlcHjd+A+Crg6SMN0Qa/a1bpCpGSWM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SIScMir/nIN1uGet/pd3WokZ9cSRflDS9D3NkAj0XFovcUPMTcziCDbwldeegMe+y
	 vfgp7SfM0vz2px5DHedKAcoavP9WlbFZSC2Y28j81gr1QNbq/+uByWL3hr544ZDnYY
	 iwIZJM1HZaCTdXN0lwmCApXg/dwCHptbCUMoOMoZ9E/CNcnHRMYP/rWm5jYcYgkUKU
	 F+XUjwLLoq30MolvphMtxkEJhCHYDxdiiU7DRE+ELwILCuM1cJtnm9T0+UNhpi3eGS
	 ZnLamSZovAT1XEiu+riq9zw5awyKeqod6LQZ4FcMNwOzMCKhoJgu+unNJ9bPDX1Tjl
	 KGwUQ2WKON+OQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsViZ8MxSVf2Yk2
  SQXOzpMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHq1y7Wgi8cFUtnnGZuYFzI0cXIxSEk8IRR
  4t7KdywQzgUmiRWnvzBBOAcYJXr2LmftYuTkYBPQlXjxYzELiC0ioC+xdPYeZhBbWMBP4tycy
  2BxFgFVicdHroPV8wp4SNx7vh6sRkJAQWLKw/fMEHFBiZMzn4DVMwtISBx88QIozgFUoygxe7
  o8RHmFxOvDl6Ba1SSuntvEPIGRbxaS7llIuhcwMq1itEoqykzPKMlNzMzRNTQw0DU0NNU1ttS
  1MNJLrNJN1Est1S1PLS7RBXLLi/VSi4v1iitzk3NS9PJSSzYxAoMvpVg9aAfjtxU/9Q4xSnIw
  KYnynjtfkyTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgnfnOaCcYFFqempFWmYOMBJg0hIcPEoiv
  MUgad7igsTc4sx0iNQpRkUpcd4P+4ASAiCJjNI8uDZY9F1ilJUS5mVkYGAQ4ilILcrNLEGVf8
  UozsGoJMx7GuQynsy8Erjpr4AWMwEt3u9aCbK4JBEhJdXAlKhoYFrwu+gi/ymTEzvXZpVPj5s
  /qZBvktfyWTdWf8idsWKpa/DvZWK3Gk4Eef9TD9rd0SLp/Fi185+I7bGp0wS/H3D2P835Pfu3
  pskD6XmLd55dkPR563Rpu/+vim3/Tkva+lHigOuGBP1Dqw/dytkfujA9Pv/4isQ7/cW+PI9ur
  C9zzmicwrZwKbtJW+SR0weUZ+/UuHYw/alXyt7bH6LSXzzUEhUWK351yefq0wwV9ptWQlcXuU
  at/lPdw33Xird+0fKgH/xlam2H7kjtqujXPLek9cJH8/8nVq2xyCtKdfSd+E6+2Cd707vHR8y
  E3v85cd3Zc8LD8IYTdyN6vjUuvGq7snLPoxnPnF/vzLqoxFKckWioxVxUnAgA2gkxtjkDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1652347165!462016!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8215 invoked from network); 12 May 2022 09:19:25 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 May 2022 09:19:25 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 098FF100453
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:19:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id F0B821000FE
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:19:24 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 12 May 2022 10:19:10 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-autobahn: upgrade 22.3.2 -> 22.4.2
Date: Thu, 12 May 2022 17:18:53 +0800
Message-ID: <1652347133-16660-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 09:19:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97069

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-autobahn_22.3.2.bb => python3-autobahn_22.4.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_22.3.2.bb => python3-autobahn_22.4.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_22.3.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_22.4.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_22.3.2.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_22.4.2.bb
index 78514a412..3dc308385 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_22.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_22.4.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[sha256sum] = "58a887c7a196bb08d8b6624cb3695f493a9e5c9f00fd350d8d6f829b47ff9036"
+SRC_URI[sha256sum] = "57b7acf228d50d83cf327372b889e2a168a869275b26e17917ed0b4cf4d823a6"
 
 inherit pypi setuptools3
 
-- 
2.25.1


