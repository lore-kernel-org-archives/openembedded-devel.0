Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFEBC47090
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.6757.1649900772396473411
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 18:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=laBJTf+s;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649900770; i=@fujitsu.com;
	bh=frywpGmiT3/cWSMwfSrk2jMdTSu0AVlw1KLRpfwS9qk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=laBJTf+sQ9uV0HHizYvz0Z2gHNoILyFkgvYGve6fhqfcJfPxKv3VIGwNM/DSnn7Ws
	 tdzTbVE6wELdjvtxTLIkVBL6Fx42mkPP3djrmNjlOIIDyhuapdixrjcCYxm/ICg9V6
	 briSEPTUd/0l7Do7rhZnEsH5gvAwIHLOnRjeK63Qm/t3NwifUP0Q1gMMGjUwDi3shF
	 IuA6AYJ1xeUbvvPYlIsx26ZeN0kF0gfRX/EA8ymCZbH3rYuuGM+DsapvhKMaBsunl6
	 i0rs9d7ksxfXb7e9QyZtn3W/j3SN35slATj9bhNZkfNGM07hv7mw2b7Zw6SL9ifG7x
	 Qh/Ysdkc4MAHQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqPuwJjz
  JYNt/CYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePv1b0sBde4KnY9bWZrYPzA2cXIxSEk8IRR
  4m3fYRYI5wKTxMzVP1ghnJOMEgvWrmLsYuTkYBNQl3h88zWYLSKgL7F09h5mEJtZQFWi++Ia9
  i5GDg5hAWOJLX2pIGEWoPCaKU9YQWxeATeJz0uOsIHYEgIKElMevmeGiAtKnJz5hAVijITEwR
  cvmCFqlCROrPjIBGFXSLw+fAkqriZx9dwm5gmM/LOQtM9C0r6AkWkVo1VSUWZ6RkluYmaOrqG
  Bga6hoakukDQ10Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzKlGKGWTsY
  Z/X91DvEKMnBpCTKm2UYniTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvdUFVBOsCg1PbUiLTMHG
  CEwaQkOHiUR3jn5QGne4oLE3OLMdIjUKUZFKXHeBGBcCQmAJDJK8+DaYFF5iVFWSpiXkYGBQY
  inILUoN7MEVf4VozgHo5Iw78FqoCk8mXklcNNfAS1mAlr8bVUoyOKSRISUVANT78GWxXX7rqQ
  ce3w5Z2pzsmllu5lzt9TMlFuHGx/OEZfpsZwwW6Pt+EGfzutPTv6velBkHMEzZ9mjCzwG0zm0
  jzOZXvj3iLcj49e8sIQjHjJBuhxJHMv51019tfTHHftfz4s5fxc8cF+eYPa70UU1IF5ussGLD
  Y9r9XlOFyTmzHdV939SFV/H3SBoIhzxPN9x7zPFedLyDe2rBb6mTj69Yd73xbzzfv+Jj/1ha7
  b3XM9UGcVjvkfDViz50rbOdOJclQ+bJhodKJooL9l+6bu1/aUazyTX6m9rjbhiwqNbt5Uwecg
  l7p2imbX93FG3/J0Gs5aLbrmdEcVr9rQ6JPz6rMMLtQVSNBrWPwq9sTdBiaU4I9FQi7moOBEA
  dVUJvEUDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-591.messagelabs.com!1649900769!20486!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6673 invoked from network); 14 Apr 2022 01:46:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 01:46:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E08EE1001A1
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:46:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CFB1010018F
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:46:08 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 02:45:50 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: python3-graphviz: upgrade 0.19.1 -> 0.19.2
Date: Thu, 14 Apr 2022 09:46:16 +0800
Message-ID: <1649900780-5925-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96625

From: Xu Huan <xuhuan.fnst@fujitsu.com>

License-Updated:
years update to 2022

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-graphviz_0.19.1.bb => python3-graphviz_0.19.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-graphviz_0.19.1.bb => python3-graphviz_0.19.2.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.19.1.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.19.2.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-graphviz_0.19.1.bb
rename to meta-python/recipes-devtools/python/python3-graphviz_0.19.2.bb
index f1246b4b21..3cae19673f 100644
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.19.2.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Graphviz protocol implementation"
 HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=87cd8818b7e63c6a9c580034e80d7521"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=951dd0868a9606c867ffda0ea3ea6da2"
 
-SRC_URI[sha256sum] = "09ed0cde452d015fe77c4845a210eb642f28d245f5bc250d4b97808cb8f49078"
+SRC_URI[sha256sum] = "7c90cebc147c18bcdffcd3c76db58cbface5d45fe0247a2f3bfb144d32a8c77c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


