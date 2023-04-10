Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1D1C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:26:48 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.39424.1681115197237704257
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QX6Sse+w;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115199; i=@fujitsu.com;
	bh=qt6cqDw2YUWzbuJg6A2DGEXJzWwzCDk9sCaMDNrdL6E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QX6Sse+wHox++iRvUAb3oXxvjjVN/UuaMzA9urVJLFSRZkF1MDpQS+kLMoYgLmx/g
	 xBEJIM09jcsVijCPtLeXKqmLc2TD1WTyoHxyCbsawbW28vAtlmV7b/qLDYk6bz+UeC
	 9YYWcduxjL09hYeVZBZJTK+RfaslvhgreKQfhTorAd5O/Iy348eTSoJ+Zm2ZwBMD1O
	 0vKsACFzYrCtbsu66F839SbjR7sAFOjLXQTITbEL2W9ajPMqtwDRdpudi3l+jdeiMP
	 e/YvtOvgzFfEjwiB3RBYV6jCB8GtQvTOlhQEZaDFAWaKB1nN1q5bog30Xwo9Wz0iJM
	 IoYGj7/S7WLPA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWdfuhHG
  KwYOzKhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bvdS2MBUs5Ks5eX8vWwHiKvYuRi0NI4CGj
  xJyDv5ggnCtMEquP3oLK7GGU6FqzHSjDycEmICVx4/5/NhBbREBfYunsPcwgNrOAisSL3z1AD
  RwcwgJ2EmeabEDCLAKqEit/NYGV8Ao4SWx+exasVUJAQWLKw/dgcU4BZ4nHJ1ezg9hCQDU/Z1
  1ghagXlDg58wkLxHgJiYMvXjBD9CpKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoVpxaVJZapGtopJdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOi
  l5dasokRGLwpxcwvdjD+6Purd4hRkoNJSZS3i8s4RYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7
  8IDQDnBotT01Iq0zBxgJMGkJTh4lER4K44BpXmLCxJzizPTIVKnGHU5rl65spdZiCUvPy9VSp
  y3F6RIAKQoozQPbgQsqi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubddhhoCk9mXgncpld
  ARzABHcHlYgByREkiQkqqgUnkwidGzqY7TDOW/Kw6F7F+2Zp5LMU/Ms9xv59nvt/GLHZeg8xv
  Fd7epml/bc4v5ZSxmnfK+ueWF9HHEics6vSZKHSZZe+Lh0ZOE/sytMSMZS/kmqr8jGoWP8X1h
  O3ehi+C+oe6Tug4yWh/2/xLZ+2+02GBm29qynxunLc0V1JYZt/6spqtScEKnHOiNlUsjYvcce
  jd3x+twhuCfxtOUJzn+i199rPc3rnT4+N6JEqllzh6r5hdd00maq0eh/mSeVNkTvgIXzi8frH
  6HdnowxOtKzZd8374OKDwWJ1f1qpKId4t6+0V/6YWFv/O3+zREWXa+SaCs7Y9QV/Atup4a9HG
  WWs4Tk/gsZA9cPPyiplKLMUZiYZazEXFiQB4S8F6ZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1681115198!377112!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24157 invoked from network); 10 Apr 2023 08:26:38 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:26:38 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3A45915F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:26:38 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2E3EF159
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:26:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:26:36 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.368 -> 0.369
Date: Mon, 10 Apr 2023 16:26:04 +0800
Message-ID: <1681115165-24320-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115165-24320-1-git-send-email-wangmy@fujitsu.com>
References: <1681115165-24320-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102008

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.368.bb => hwdata_0.369.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.368.bb => hwdata_0.369.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.368.bb b/meta-oe/recipes-support/hwdata/hwdata_0.369.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.368.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.369.bb
index 786cc00e9..c20e2430b 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.368.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.369.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "0e25d93ac6433791edbb9d28b3f8eae0cf5e46ff"
+SRCREV = "ced93f9d1c15e45e35378e82b8da96027e58174a"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


