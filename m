Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26B6ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:51:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.32533.1661482282426193790
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YojR3Fq6;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661482280; i=@fujitsu.com;
	bh=S8Hs0+0rxmhmqOEIDvaYzFnsxFTP90mh6jz3x/b+zQ0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YojR3Fq6Qxvz65ty8iJ5H2Qhlrh6qcZ2yt3JfAeGHtceyATft0gLIotbqMgIHRqWG
	 6ipGUZQPMyGfNKlx6R17KaMp6xWM7sA6831+rtubQxKDQl0nI/IuC7OyZ3/YYFft2i
	 5bP1/DidxDVKfvDvkdjwwjptoKCUi3w1FM98LprCa9KmM9L/eVPS/Al4wGK1/njWEl
	 ZpY5t/OqwqdXHpmKuTu+1HhmGhe5/uhJL/RQDAcUGBEMMtpvpvzti/SeGR9eFKRlsF
	 VbJ/ZgP/lFELcMfa4e/Kgt0COOKlkrgWCErdJYMgX0vlrQoqmbCRog3OzL70TtINGA
	 4Uh95bOHnHd0w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8ORqKthypF
  ssLqV2eLi4aXMDowe5zauYAxgjGLNzEvKr0hgzVj0+y5bwU/uin0LvzE3MH7h6mLk4hASeMIo
  sWXVLZYuRk4g5waTxNmpFRCJg4wS+14dYQdJsAnoSrz4sRisSERAX2Lp7D3MILawQJjExef9Q
  DYHB4uAqkTjiiCQMK+Ah8Sj2y/YQGwJAQWJKQ/fM0PEBSVOznwCNoZZQELi4IsXYK0SAooSs6
  fLQ5iVEjcep0J0qklcPbeJeQIj3ywkzbOQNC9gZFrFaJ1UlJmeUZKbmJmja2hgoGtoaKprbAG
  kDPUSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTyUks2MQIDL6VYLX8H49+VP/UOMUpy
  MCmJ8uo/Y08W4kvKT6nMSCzOiC8qzUktPsQow8GhJMGrZsKRLCRYlJqeWpGWmQOMApi0BAePk
  givtChQmre4IDG3ODMdInWKUZdj5te2A8xCLHn5ealS4rz/jYCKBECKMkrz4EbAIvISo6yUMC
  8jAwODEE9BalFuZgmq/CtGcQ5GJWHeVEOgKTyZeSVwm14BHcEEdITUBnaQI0oSEVJSDUyTVHe
  fTq44/Haq0Ocb8zIZD212Pn1UtPb65d/N/DEH7q906uiL7XJp5fU/Uq3cE/5cu3l/5IofRzmD
  eA49uKl0jlHEwH7is3XFa9vPe/Mk+YW9ZXSynrtNsWRnUvf0tdV3C30jKiyWLXHJ3BGeI8a1o
  7BHIf6Vm013t6OmoINg2tq+t7Es/016+L4m8VT6f1/+8EX/2+aTTGpSK1tPPm+/kb7ZQze2jL
  UrzPjE3KZbmx1KPy5J39qSYfb2yoLGIwaL57fMsXl3M+yra6RwjanCaye2I1wxy9VmLXPKyCy
  Y/9/jjOtOuW1MfBvYpTXMX2ZuKva52SP39sSW/Tby8+IW3BFfPC3odlriD6agDCWW4oxEQy3m
  ouJEANrH/L1DAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1661482279!169269!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8679 invoked from network); 26 Aug 2022 02:51:20 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Aug 2022 02:51:20 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BD2F5100197
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:51:19 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B1134100192
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:51:19 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 26 Aug 2022 03:51:18 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-charset-normalizer: upgrade 2.1.0
 -> 2.1.1
Date: Fri, 26 Aug 2022 10:50:50 +0800
Message-ID: <1661482250-13137-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:51:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98451

Changelog:
============
Deprecated
------------
    Function normalize scheduled for removal in 3.0

Changed
----------
    Removed useless call to decode in fn is_unprintable (#206)

Fixed
---------
    Third-party library (i18n xgettext) crashing not recognizing utf_8 (PEP 263) with underscore

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...-normalizer_2.1.0.bb => python3-charset-normalizer_2.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_2.1.0.bb => python3-charset-normalizer_2.1.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_2.1.0.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_2.1.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_2.1.1.bb
index 7c3d3ffc14..1ab72e53d1 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_2.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
 
-SRC_URI[sha256sum] = "575e708016ff3a5e3681541cb9d79312c416835686d054a23accb873b254f413"
+SRC_URI[sha256sum] = "5a3d016c7c547f69d6f81fb0db9449ce888b418b5b9952cc5e6e66843e9dd845"
 
 inherit pypi setuptools3
 
-- 
2.25.1


