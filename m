Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BAEC433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 02:36:34 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.2863.1645583793222887994
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 18:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fRjqVjbG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645583791; i=@fujitsu.com;
	bh=nGdwGlV+2ZDeAl8u/Bnpk3vEdsjsDW5CgfIiwUp5MQg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fRjqVjbGzhSNkeZ6WTXamYcbkELExsYV8+yWnvOeKsn4CL5a8OvVLFAkkMuIKHurG
	 ORx1FJfpGgscCT7jwu/+Js2u75lDyQYvH/0NE21jg63JNWR0I78J5hmDLb7m/G0BtI
	 XmP2zsHqaJXW9zrNpU+tGP1YQuJ4hmC5vS7OOmm/+cckynJFN9653QcF67qKD2fQqy
	 XTtIZ9IN3X9TUyttl2E+VIW/LlDsFM7TUa/cNWEJ2x0PE0ZmIfB5fIFRXlJPIexlkA
	 GDBmChLA6uSyW6W93irR6gvacyjL79ZQDYmZA4rlfteoWPAI4v8jrtVl0P9CPsZbkA
	 U8S5wegyUE1Cw==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id BB/FA-12292-EAD95126;
 Wed, 23 Feb 2022 02:36:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsViZ8ORqLturmi
  SwfMueYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPjyT72go8CFZe+bGVrYJzA38XIxSEk8IRR
  Ys7NV0wQzgUmiRNn7zJCOHsYJTZP3svWxcjJwSagK3Hu8Vp2EFtEQF9i6ew9zCC2sIC9RP+vN
  jCbRUBV4lPLLVYQm1fAQ+LUg49MILaEgILElIfvmSHighInZz5hAbGZBSQkDr54ARTnAKpRlJ
  g9XR6ivELi9eFLzBC2msTVc5uYJzDyzULSPQtJ9wJGplWMVklFmekZJbmJmTm6hgYGuoaGprr
  GuoaWlnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIHBl1LMfHwH45S+n3qH
  GCU5mJREeef6iyYJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuD9MAsoJ1iUmp5akZaZA4wEmLQEB
  4+SCO/+OUBp3uKCxNzizHSI1ClGRSlxXj1g/AgJgCQySvPg2mDRd4lRVkqYl5GBgUGIpyC1KD
  ezBFX+FaM4B6OSMO8pkPE8mXklcNNfAS1mAlo8JUsIZHFJIkJKqoFphwtX8hfVSbXxdX5bHnj
  anz59/6594gS9idvnvwk5d2rFbN+P9k2l9x5s3Vi4LWfOP9nKlimb9LfNa+7bfeXUuZclWh2r
  li1Pz9BRmhD4RL85aWG14IqXkze/03vWMkvr430tEd+GLfrFYocMVr6qtpmczmnNfFyX2SfIo
  2hn3xNF35X9m3IrZt/6JiWZEOnEu+Lx/ONNW++cK8yu+bKXQdt67l2L7sVftzlfPjj9iQHjO5
  u1SfWHTizT1NO5FbNQI4/hQJOY2K6O2C0pM98s56yccNm41lf0v9Ua0/aFzHuOubUqWkf6pTs
  6Rl/ekD078O6in6VRDH6KnbEbtN7/mMKtUfdvz02p98GH9zkbKbEUZyQaajEXFScCAH16KzA5
  AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-591.messagelabs.com!1645583790!51867!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23472 invoked from network); 23 Feb 2022 02:36:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 02:36:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0FE5D100190
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 02:36:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E80DD100193
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 02:36:29 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 02:36:22 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] pugixml: upgrade 1.11.4 -> 1.12
Date: Wed, 23 Feb 2022 10:36:12 +0800
Message-ID: <1645583772-38647-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 02:36:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95463

License-Update: year updated to 2022.

Changelog:
=========
Bug fixes:
----------
-Fix a bug in xml_document move construction when the source of the move is empty
-Fix const-correctness issues with iterator objects to support C++20 ranges

XPath improvements:
-------------------
-Improved detection of overly complex queries that may result in stack overflow
 during parsing

Compatibility improvements:
--------------------------
-Fix Cygwin support for DLL builds
-Fix Windows CE support
-Add NuGet builds and project files for VS2022

Build system changes:
--------------------
-All CMake options now have the prefix PUGIXML_. This may require changing
 dependent build configurations.
-Many build settings are now exposed via CMake settings, most notably
 PUGIXML_COMPACT and PUGIXML_WCHAR_MODE can be set without changing pugiconfig.hpp

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../pugixml/{pugixml_1.11.4.bb => pugixml_1.12.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/pugixml/{pugixml_1.11.4.bb => pugixml_1.12.bb} (86%)

diff --git a/meta-oe/recipes-devtools/pugixml/pugixml_1.11.4.bb b/meta-oe/recipes-devtools/pugixml/pugixml_1.12.bb
similarity index 86%
rename from meta-oe/recipes-devtools/pugixml/pugixml_1.11.4.bb
rename to meta-oe/recipes-devtools/pugixml/pugixml_1.12.bb
index 4e4048f5e3..b09c46a66b 100644
--- a/meta-oe/recipes-devtools/pugixml/pugixml_1.11.4.bb
+++ b/meta-oe/recipes-devtools/pugixml/pugixml_1.12.bb
@@ -7,10 +7,10 @@ data-driven tree queries."
 HOMEPAGE = "https://pugixml.org/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://readme.txt;beginline=29;endline=52;md5=d5ee91fb74cbb64223b3693fd64eb169"
+LIC_FILES_CHKSUM = "file://readme.txt;beginline=29;endline=52;md5=d11b640daff611273752ec136394347c"
 
 SRC_URI = "https://github.com/zeux/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "8ddf57b65fb860416979a3f0640c2ad45ddddbbafa82508ef0a0af3ce7061716"
+SRC_URI[sha256sum] = "fd6922a4448ec2f3eb9db415d10a49660e5d84ce20ce66b8a07e72ffc84270a7"
 
 UPSTREAM_CHECK_URI = "https://github.com/zeux/${BPN}/releases"
 
-- 
2.25.1


