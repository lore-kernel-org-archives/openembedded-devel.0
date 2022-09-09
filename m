Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AC4ECAAD5
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 01:25:59 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.1442.1662686757128954978
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 18:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=zAO+a/pG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662686755; i=@fujitsu.com;
	bh=BElsau6DLgwDiA3n+H6L5d6pj8jjAsrNPwxHP/4qO1o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=zAO+a/pGJWEL7/NAZ+cZj5QXX9oUK3UYNMbJdLRzPaBaJ7PJSACL4Djm9JZePipOT
	 0QzGRuou/kmUOAlN47UrgtXtSzoATqUvwj+JuyDd6qAYvDF86PmvqEl+QU8bLtyxfS
	 2JCMcao1rrh2MppwuTHIDse+NhaOnZcHGvbiQTGUOfW+e80lRhVpSH/zXsmRyArl/B
	 tCJps+JFRaVpbp4Hsa6zUBAEOAqqhP6p7WS7fCXErBF2jggNpsgR2WrpAo4k0QL5ka
	 hEdqj7Xxq34Ev63yaGJSdffXWs/2rVpYGSFa+2K5G/lyX0iAzDNfyA6fvfdHaxu5sH
	 eAd8UNxRgXg5w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8OxWVdxmlS
  ywbsFGhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bbnf2MBZe5K7bebmNpYLzP1cXIxSEk8JBR
  4vXp/4wQzmUmiQOHutm6GDmBnP2MEtu+V4LYbAK6Ei9+LGYBsUUE9CWWzt7DDGILCwRILO24w
  AhiswioSGy4dwcszivgLnHw1mKwORICChJTHr6HigtKnJz5BGwOs4CExMEXL4DiHEA1ihKzp8
  tDlFdINE4/xARhq0lcPbeJeQIj3ywk3bOQdC9gZFrFaJNUlJmeUZKbmJmja2hgoGtoaKpraaZ
  rZGigl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yTopeXWrKJERh+KcUJl3Ywrtv3S+8Q
  oyQHk5Io79N+qWQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryXJwHlBItS01Mr0jJzgLEAk5bg4
  FES4bWdDJTmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn5eqpQ479kpQEUCIEUZpXlwI2BxeYlRVk
  qYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG/+VKApPJl5JXCbXgEdwQR0xNZAcZAjShIRUlINTBn
  7GWo+FemcWtFwOojvhzRflvyfi4mGqmIJ3X+Dji06qLXZYIdPk/CawJlJ0s/ajNcYxT6ykL98
  bfWz+Gv3X1v2tjxm1PW6z7qxRNQobpbW7pAohrDcuRovAo/zdKg49O3ZsfZ425y03Xkct+6we
  jHHalyfPqlu1aVvrZHfd8t94fXzOJ8qtXBBer7+Xvnvv/OTmjQzRLSVT1Yd1hG/vfxG41+/U4
  Z98WHL+g99ehIZy37SxfReQEzo3LKAVPnVMw3uBc78Vvrg1CcfgbB3p/Pf7j2g5njF26Xgv98
  Sj9D468JVp26EL50mqXuXN+yc94U1iaZszr6q1gElOx7s51rm1bMz3+RNvsEzgTW9SizFGYmG
  WsxFxYkAsBcoK0YDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-745.messagelabs.com!1662686753!168044!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5205 invoked from network); 9 Sep 2022 01:25:53 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Sep 2022 01:25:53 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 169E5150
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  9 Sep 2022 02:25:53 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 0A0F27B
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  9 Sep 2022 02:25:53 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 9 Sep 2022 02:25:51 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-transitions: upgrade 0.8.11 ->
 0.9.0
Date: Fri, 9 Sep 2022 09:25:42 +0800
Message-ID: <1662686742-2535-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Sep 2022 01:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98728

License-Update:
=========================================
format of LICENSE changed from
ASCII text, with CRLF line terminators
to
ASCII text

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...on3-transitions_0.8.11.bb => python3-transitions_0.9.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.8.11.bb => python3-transitions_0.9.0.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.11.bb b/meta-python/recipes-devtools/python/python3-transitions_0.9.0.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-transitions_0.8.11.bb
rename to meta-python/recipes-devtools/python/python3-transitions_0.9.0.bb
index 14189424a2..980351bf14 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.8.11.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.9.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A lightweight, object-oriented Python state machine implementation with many extensions."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7b20d32906ea4d60ee6f6c1f5dc9c9f178802425c5b155213eb0f25c277f04e4"
+SRC_URI[sha256sum] = "2f54d11bdb225779d7e729011e93a9fb717668ce3dc65f8d4f5a5d7ba2f48e10"
 
 RDEPENDS:${PN} += "python3-six python3-logging"
-- 
2.25.1


