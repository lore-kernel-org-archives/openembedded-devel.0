Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DE6C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:39:52 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.6213.1659447587134218936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=x2zKKXRZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447585; i=@fujitsu.com;
	bh=AVj1AeyI/vwE6+2HPjhJVv3IOcAwgii8OKXLuAujrk0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=x2zKKXRZl+2w5d7AAZNdbD6rSkHrfk0pgSPH4nDprc+y722mmVCKpaQdbMHVz1TFm
	 nVJKS+95+p9yT1XvP02B8ZVmrlrrJED7DQEPgLFa+qCA5u5TItIh174NBY5sYvMKAA
	 y2DZopVrpO/bycf9aXQ0xJzNczsyB4suOEw8Pc7xqZFUeXY1ddnmuwitkc/7WcSevC
	 EelySRguluVbL5kQWnTPyLtsVGTxZkmvMoWiQGid8ycKLcpNCDdXIcMWhYQobfhSth
	 tbxMoGLvT1HG63wmXeRWnw3qbHNP1BagbySGFLezAbxQ/OjrtOtLKhzkvhE+bs3jeo
	 gfAAKB94fCzbA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORpKug+TL
  JoHG/qcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjFl4j7WgjvsFa/vTmZuYPzL1sXIxSEk8JBR
  4t+DK4xdjBxAzmUmiR+KEPHdjBKH/p5j7mLk5GATUJOYfusGK4gtIqAvsXT2HrA4s4CKxIvfP
  ewgvcICDhIL9umBhFmAwl9/nAIr4RVwklizezcLiC0hoCAx5eF7qLigxMmZT1ggxkhIHHzxgh
  miRlFi9uVmqPoKiRkztrFB2GoSV89tYp7AyD8LSfssJO0LGJlWMVolFWWmZ5TkJmbm6BoaGOg
  aGprqmukaGRroJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBmRKMdulHYxz
  +37qHWKU5GBSEuWVU3yZJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC95YqUE6wKDU9tSItMwcYH
  TBpCQ4eJRHed2pAad7igsTc4sx0iNQpRkuOqbP/7WfmWA4mZ35tO8AsxJKXn5cqJc57C6RBAK
  QhozQPbhwsgi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEua9BzKFJzOvBG7rK6CDmIAO0uF
  6AXJQSSJCSqqBqV5+ye0JiycXy7wyKlvxh/ftfYWYvfv/39Mv2+otvinq9rHKlsVq7+ptDB3U
  HFwbgku4hDfLSx+Q0HRumSy4cnLegu0T/H/Gv5t3L1Zs7/3zIcpH9N4xL7tee2vZPo8bQefmR
  P0S8vi60tRIvfyTdFW45szfz7QXSMQK/H2asX5+3vowzbObdzT1TG+4p57Atsz6SV5cQFxdZM
  3NAq60i49MDHl7XOteTRCpCPi9+1DisRtLXv9em+9Q+D5hyd1GK/GGYokHM53Ps8zx+bL4+Qr
  96+xbm9kOf+O8LB55Rkx7RejqE7senbyau4tpq4vlr1t1ObuTZqceWLk12+zeAlv1FSsLVwmv
  iBThl3y71E2JpTgj0VCLuag4EQBn0bBWWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1659447584!69669!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8647 invoked from network); 2 Aug 2022 13:39:44 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:39:44 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 81F531AE
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:39:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 76C667C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:39:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:39:42 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] avro-c: upgrade 1.11.0 -> 1.11.1
Date: Tue, 2 Aug 2022 21:39:27 +0800
Message-ID: <1659447571-24348-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:39:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98083

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/avro/{avro-c_1.11.0.bb => avro-c_1.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/avro/{avro-c_1.11.0.bb => avro-c_1.11.1.bb} (88%)

diff --git a/meta-oe/recipes-support/avro/avro-c_1.11.0.bb b/meta-oe/recipes-support/avro/avro-c_1.11.1.bb
similarity index 88%
rename from meta-oe/recipes-support/avro/avro-c_1.11.0.bb
rename to meta-oe/recipes-support/avro/avro-c_1.11.1.bb
index 8558f75c50..bb0bd7d752 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.11.0.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.11.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
 DEPENDS = "jansson zlib xz"
 
 BRANCH = "branch-1.11"
-SRCREV = "4e1fefca493029ace961b7ef8889a3722458565a"
+SRCREV = "3a9e5a789b5165e0c8c4da799c387fdf84bfb75e"
 SRC_URI = "git://github.com/apache/avro;branch=${BRANCH};protocol=https \
           "
 
-- 
2.25.1


