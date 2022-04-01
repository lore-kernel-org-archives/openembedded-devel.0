Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7ABC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 03:43:33 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.6363.1648784613174168225
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 20:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qJlD5i01;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648784611; i=@fujitsu.com;
	bh=8P6LkT07a6eH9s+/D8IDoPgmsYTtsxsceanmfgYg7DE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qJlD5i01bLr8eMlpS9qibHQ1SItCGF9tKpOll+A0xGPjNoOWylppNfQZcAhQsCh6F
	 lAq/CDamGsfF7bQgsjYsBwygpAMoMf0FqqRI9gl9JUxRzsm/Nmm9SPfnZs+sTPx74i
	 zOHwCCdjrkG420eTl6qxq4/VhmBs1LSJnsUUpOLzudelqGTW7NWZK3nx/zWYjjmHd7
	 IyXCmAKizqlNyECyBtw7dn/c9eirAs7doCewEd1yg4Z1VYA7MEwGQUbOfuoevm7e6X
	 rek+PGYDd88CpSGXXIukKVb6pb4DKYrviZYO7PjzK+yGogs3S/W2zLbk1IBByagjCy
	 6d3yu34VqgeQg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeJIrShJLcpLzFFi42Kxs+EI0X1U4pZ
  kcOqGosXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFx+kL2gk28FR87+pgaGNfxdDFycQgJzGKS
  ePZvExOEs59R4mpzH1sXIycHm4C+xMZ1n5hAbBEge+nsPcwgtrCAn8TdifuBbA4OFgEVib3fH
  UHCvAIeEuufdLOA2BICChJTHr5nhogLSpyc+QQsziwgIXHwxQuwVgkBRYnZ0+UhyiskXh++xD
  yBkWcWko5ZSDoWMDKtYrRNKspMzyjJTczM0TU0MNA1NDTVNbPUNTfRS6zSTdRLLdVNTs0rKUo
  EyuollhfrpRYX6xVX5ibnpOjlpZZsYgSGU0qxq9cOxiN9P/UOMUpyMCmJ8jocck0S4kvKT6nM
  SCzOiC8qzUktPsQow8GhJMHbkeOWJCRYlJqeWpGWmQMMbZi0BAePkghvcDFQmre4IDG3ODMdI
  nWKUVFKnPcYSEIAJJFRmgfXBounS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeUtBpvBk5p
  XATX8FtJgJaLH+DVeQxSWJCCmpBqaMr8cP6jP4mnNNl3BKi5QVlpVZH/tlq3mVaIprkaJVgf+
  euIx7X5z2PHRR2xIyz/PJMRtrt3TvHwuM5fKNtHQOMe5z3Nf7/vTKX7ZBN3guHe7wubl8Rfjv
  J1/++bk+vPXwg0PvJL+1JZ/Odl6qKhNLnnxm/6NtC3hvHOw9unA2y5sNz9QY/ol953KXbjg3z
  4bx8GZTp4kcnWH3p/Mkep2+yfz5/EPPIFH3NhaTFWwBJ90aZ9//ufM294PUOWvyNwV63w9Qce
  abz2Ay21jAtu7Iy7qjHyXN3R/+n9Cn0V3wdKe3+S2p7T2J9QofeOf8v5/1cFLMXvfFU2qnSb3
  hOS7I5jan9JOCtizb/wXLfhgqsRRnJBpqMRcVJwIAP/cmgSIDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-545.messagelabs.com!1648784610!38729!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 795 invoked from network); 1 Apr 2022 03:43:30 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-14.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Apr 2022 03:43:30 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2313hOOG013185
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 1 Apr 2022 04:43:30 +0100
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Apr 2022 04:43:23 +0100
From: "zhengrq.fnst" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-nocaselist: upgrade 1.0.4 -> 1.0.5
Date: Fri, 1 Apr 2022 11:43:15 +0800
Message-ID: <1648784595-10309-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Apr 2022 03:43:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96316

License-Update: version updated to 1.0.5

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-devtools/python/python3-nocaselist_1.0.4.bb   | 8 --------
 .../recipes-devtools/python/python3-nocaselist_1.0.5.bb   | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-nocaselist_1.0.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb
deleted file mode 100644
index 60c79c22a8..0000000000
--- a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "A case-insensitive list for Python"
-HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d229da563da18fe5d58cd95a6467d584"
-
-SRC_URI[sha256sum] = "73a9c0659e7135c66e46a6ab06e2cb637ce9248d73c690ebd31afb72a4e03ac0"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.5.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.5.bb
new file mode 100644
index 0000000000..22b8825801
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.5.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A case-insensitive list for Python"
+HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[sha256sum] = "e1c12ca2ae9d345b34948f2c8f60e3894619e2be2ed28b4ecc5e7f1dea117d1d"
+
+inherit pypi setuptools3
-- 
2.25.1


