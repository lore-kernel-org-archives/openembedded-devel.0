Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364AFC32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 01:02:29 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.5904.1661302946822554481
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qJHibZq1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661302944; i=@fujitsu.com;
	bh=vx/VafOXHL1QS92tfVIDxKB6eITJn6fRZqUbbKtzwYI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qJHibZq1M553S86qQ/sxlXp7ZI0PiveLKOZpXV+/6uP+RDonemjBMGkiS4Cj/zDOu
	 PSHgQoQw570Gvq6EZNvqERPeeJXLeNE4qV6/O/MJUvqqoR78w302TsH1lRJhJxKmFs
	 AW34Ry42sW2dcXySq31hSLRj0j1XXB6MGSd8fKj1D9bjKT+YjMs8R8u/j8Fb412Y+9
	 9w1oHkvjalO2WecQENfMVu9bVvVf5279TvpudWbc/pyZAJuFnKo+LPjCdiKIBT6chm
	 9NcUhQ/+VnWaO+BSdaluac0cmWACkHIxd2c+3VP8xA/ZmwE6uBv6bUwtyZ43T8AHPU
	 TySrUDGRkhezQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqLuggjX
  Z4FWKxcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCacfB7P0vBd/aKY7O2sDYwLmDvYuTkEBJ4wihx
  b3ZxFyMXkH2DSeLFmsMsEM5eRolV9/+CVbEJqElMv3WDFcQWEdCXWDp7DzOIzSygIvHidw9Yj
  bCAncTtLQ/ZQGwWAVWJj1OXsYDYvAJOEg/XdIHVSwgoSEx5+B7M5hRwlnjecxjqCieJj0t3ME
  LUC0qcnPmEBWK+hMTBFy+gehUlZl9uZoGwKyX2zOpngrDVJK6e28Q8gVFwFpL2WUjaFzAyrWK
  0SSrKTM8oyU3MzNE1NDDQNTQ01bU00zUyNNBLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxN
  zknRy0st2cQIDOOU4oRLOxjX7fuld4hRkoNJSZT3mhhrshBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJXttyoJxgUWp6akVaZg4wpmDSEhw8SiK8K9KA0rzFBYm5xZnpEKlTjLocM7+2HWAWYsnLz0
  uVEuddUwZUJABSlFGaBzcCFt+XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzXigBmsKTmVc
  Ct+kV0BFMQEcE7WYGOaIkESEl1cCUzvJsXc7PXEUzvclNAlEOgVvmv2EKjJvPeE38R27E+9Wi
  Tov7VobulpCX67wx1ZYjVVTw4+Udq7zzKzhW1R8/uOD8y6uxosoBi7ZkeBori0xWuL4wy/2vG
  6PF6wnsL+auNBKZcMfR/UG7a/ZxmQty8Y/XJtt4ZDh+q9/gm8T38tTn22WKuy4+uXZ1M6dujb
  mbbbX1pI6Xxvfcsju3WsxNnKxnvv2HtLTZqXCThStXXBE49aif3XGb0SWLFb0qmyZ+Nvrycqf
  DCm03NZ+nCok5zlwbrl/vC7a6b+fer5Rx0ClBNDv+WYtBh8vhp85bfaSj8kucJiesPPnpz0VT
  h15Pz/NyDD2VuzS2a0qq5CuxFGckGmoxFxUnAgCNtRRfagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-728.messagelabs.com!1661302943!105424!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26622 invoked from network); 24 Aug 2022 01:02:23 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Aug 2022 01:02:23 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6AE3E100190
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:02:23 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5E757100043
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:02:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 24 Aug 2022 02:02:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] zlog: upgrade 1.2.15 -> 1.2.16
Date: Wed, 24 Aug 2022 09:01:47 +0800
Message-ID: <1661302907-10612-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661302907-10612-1-git-send-email-wangmy@fujitsu.com>
References: <1661302907-10612-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 01:02:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98409

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/zlog/{zlog_1.2.15.bb => zlog_1.2.16.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/zlog/{zlog_1.2.15.bb => zlog_1.2.16.bb} (89%)

diff --git a/meta-oe/recipes-extended/zlog/zlog_1.2.15.bb b/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
similarity index 89%
rename from meta-oe/recipes-extended/zlog/zlog_1.2.15.bb
rename to meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
index 0fda3e6756..b75802f09f 100644
--- a/meta-oe/recipes-extended/zlog/zlog_1.2.15.bb
+++ b/meta-oe/recipes-extended/zlog/zlog_1.2.16.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/HardySimpson/zlog"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "876099f3c66033f3de11d79f63814766b1021dbe"
+SRCREV = "dc2c284664757fce6ef8f96f8b3ab667a53ef489"
 SRC_URI = "git://github.com/HardySimpson/zlog;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


