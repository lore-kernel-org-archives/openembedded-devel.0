Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52E0C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:17:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.7728.1654759017098289130
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ecmqt6YH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654759014; i=@fujitsu.com;
	bh=0y3w6DJTtqIMVugFTc6TJdGGTMAdeTiMQvRXn/vF/X0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ecmqt6YHMBCgW2gzw6sjbnMHRAabeEYB6SdSUSOJqjbrgOignO91eEjoBZ5JdIK5o
	 MChXawGmOm1CvmuU3sU3r4TXBs3zZgb2uUPMO9xpOQf2ZbXQn478AZqchYkveES6G4
	 +OQDlQ/OGs/xPRD8N6poxtNvdVv8dCkYMcWiJPO35nQl85VT+MyckKO8fzURxYOxd8
	 Zmq7/IhxDKgm5lBpNOgZ75D6e4Sj4FAPO+VlYV17VISuKuGrKvRoxEH2lKABQk3Ce7
	 +A4qWZK2WR7/4/t4rpzrkdBhqYy13GFRyTPJHKH3mgDje8LfdPYXq3mX61tiTDs2Kk
	 cyLiK/deN4wqQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8OxWTdt3sI
  kg9Z/vBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aXk/OZC9q5Kz7/v87awDiVq4uRi0NI4CGj
  xM0Pqxi7GDmBnLNMEjtvlUMk9jNK/NvxnxUkwSagK/Hix2IWEFtEQF9i6ew9zCC2sICHxJvly
  4GaOThYBFQkpn6xAwnzAoXnzf/HBmJLCChITHn4nhkiLihxcuYTsDHMAhISB1+8YAZplRBQlJ
  g9XR6ivELi9eFLzBC2msTVc5uYJzDyzULSPQtJ9wJGplWM1klFmekZJbmJmTm6hgYGuoaGprq
  WlroWJnqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBoZdSnByyg/Hkvl96
  hxglOZiURHnPpS5MEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBu3cWUE6wKDU9tSItMwcYBzBpC
  Q4eJRHeq3OA0rzFBYm5xZnpEKlTjLocM7+2HWAWYsnLz0uVEuddNxeoSACkKKM0D24ELCYvMc
  pKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmXQoyhSczrwRu0yugI5iAjvh1ZQHIESWJCCmpBiY
  79kNRh3OZzT89TePP+GrrrrJ4YaGS0MntOxj33bvr5iJnc/Gi+ccVs6fPnLpLy+ezZrn7Lu1r
  pVl6ur/d2vzUrK3fxXUsDa81dKxKCzdd9vhIDX+noVj4Dfnuf/GGk+sflnbtVN4cpiSi2iGWW
  amgpOvUV3C747hr1vpLr/jD99RGP/3m0PL22yeOUsmTL0or9TZO3BqwQ7xmnuX2SjmtP+lFOz
  xO37/yY3fe/xvGa+/mvNGc0aE9+ZORUKW6lGytQ/LLc/0H15rvnu8tpO4mG5y+e9/q44fKp5T
  ef1Ak9fXxC7utW6LUeBQeJ0+bzridf6HGGelGxebGixocj9V2vPi4vtxX/ebhrQqph5VYijMS
  DbWYi4oTAXypEt1EAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-728.messagelabs.com!1654759013!369105!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16213 invoked from network); 9 Jun 2022 07:16:54 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jun 2022 07:16:54 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A250A812
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:16:53 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 768A7819
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:16:53 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 9 Jun 2022 08:16:46 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-msk: upgrade 0.3.16 -> 0.4.0
Date: Thu, 9 Jun 2022 15:16:36 +0800
Message-ID: <1654758996-10886-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 07:17:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97450

License-Update: replace '~/.local/share' for '/opt'

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-msk_0.3.16.bb => python3-msk_0.4.0.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msk_0.3.16.bb => python3-msk_0.4.0.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-msk_0.3.16.bb b/meta-python/recipes-devtools/python/python3-msk_0.4.0.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-msk_0.3.16.bb
rename to meta-python/recipes-devtools/python/python3-msk_0.4.0.bb
index a1572276b..8fa2c62cc 100644
--- a/meta-python/recipes-devtools/python/python3-msk_0.3.16.bb
+++ b/meta-python/recipes-devtools/python/python3-msk_0.4.0.bb
@@ -1,10 +1,9 @@
 SUMMARY = "A tool to help with creating, uploading, and upgrading Mycroft skills on the skills repo."
 HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-kit"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.md;md5=2f90e43663eddf1c33087419fbb35e28"
+LIC_FILES_CHKSUM = "file://README.md;md5=f518abfcfc3935b1f0ec8f2332cb30d3"
 
-SRC_URI[md5sum] = "8a4fc92a074544f81f482da2c21ef989"
-SRC_URI[sha256sum] = "c6a717fc068f7c69ddc8cb21dbeeda7cfa97a4e9f41690459c9fbec68b16ee87"
+SRC_URI[sha256sum] = "f698f193112a8628e776e67b89a95c3f78095857c045dd9cde4cf915a5fbdd80"
 
 inherit pypi setuptools3
 
-- 
2.25.1


