Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BD7C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:23:52 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.8567.1664267025632722049
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=U0ot2fe0;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664267023; i=@fujitsu.com;
	bh=ndlHDGMgXu096/lkwkJ7vMYs0OYhHWdJk6OVlZ0EDvw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=U0ot2fe0sODextxx5VTuEWiv0A3VEaUQ6oIc1kB+pAh0OVzsElMfqsoCdN5blJm3b
	 v9FzpsrH/T7TdI9wkdMCieY2BuVaPaI+MPJlk9uqZr4Ms2pNiivEW9hGfw28yjI6xM
	 LczV0pTXQ3WuE39HEFvfvGnnwGZfGhL8Yre1e1W53GsjGpMMKnv/b6LVigAXJbR5/h
	 EbhO8IqH01upm94ikT8uOJTIYmh1HgjXWf1Sikij7KAh0NozB5ENWx2sZFrzn/HJg0
	 cKJP05HVT0JvFD3drCzKIKa56x1kLaWeG23EUKq1qcCaede2pCYtk7hgFXszpeb3h7
	 F72UoogbcQmUQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORqMu32Sj
  ZYKmgxcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCasW/qXPaCNxwVl1suszUwNnJ0MXJxCAk8YZQ4
  v3wzI4RznUmiYf1FVghnD6PEhK83gDKcHGwCahLTb91gBbFFBPQlls7ewwxiMwuoSLz43cMOY
  gsL2Em8+PYbzGYRUJU48eIdC4jNK+AocXHnT7BeCQEFiSkP34P1cgo4SZxZMBeohgNomaPEhm
  WiEOWCEidnPmGBGC8hcfDFC2aIVkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYBSchaR9FpL2BYx
  Mqxgtk4oy0zNKchMzc3QNDQx0DQ1NdY11DS30Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OT
  c1L08lJLNjECAzilmFloB+P6vp96hxglOZiURHntFxklC/El5adUZiQWZ8QXleakFh9ilOHgU
  JLgZVoPlBMsSk1PrUjLzAFGE0xagoNHSYR33RKgNG9xQWJucWY6ROoUoy7HzK9tB5iFWPLy81
  KlxHmFNgEVCYAUZZTmwY2ARfYlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8MiBTeDLzSuA
  2vQI6ggnoCDs+fZAjShIRUlINTFo3pvGcD1u5U0WzKdmkZkNATSWb7IPP3Or7mRt/bg77mai/
  Is/RJpX52qtN20QrOv0nX3KQ+5kqJrAw2TYqq6vm0h+Vy99WuN6+98fLvP8I012df4fnVXUxW
  uYv5Yt48keEU7ShRb/QJMZmfl8wP1PgKkuzlWfUKz4mcbOrTk6tzK4JTuI4GfSh6WKaVveNjS
  Lf5ki499x8y1p4vHHP8k++Bzs/Tmu/UsrfeXj3I6X/ZzyqcmQ91kjZLfrEdOuKTLoqX9cq254
  vH51S/wjd+1D15Prq/vWnpXsvnvh/IKHn9uzjM369Ya0MTtb31DY+YPWZ42Ff/OzmtabliQIG
  vD3M6itO5ev9eXLAYc8/JZbijERDLeai4kQAGN9woGcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1664267021!66108!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13749 invoked from network); 27 Sep 2022 08:23:41 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 08:23:41 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 98D12100197
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:23:41 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8C7FF100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:23:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 09:23:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] zabbix: upgrade 6.2.2 -> 6.2.3
Date: Tue, 27 Sep 2022 16:23:23 +0800
Message-ID: <1664267003-2293-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664267003-2293-1-git-send-email-wangmy@fujitsu.com>
References: <1664267003-2293-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:23:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98973

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../zabbix/{zabbix_6.2.2.bb => zabbix_6.2.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_6.2.2.bb => zabbix_6.2.3.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.2.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.3.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_6.2.2.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_6.2.3.bb
index 58ec461745..58d1f9ecc2 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.2.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.3.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/6.2/${BPN}-${PV}.tar.gz
     file://0001-initialize-msghdr-portably.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "f0e7a9abb0f65d700f531253b91c31165077a9c94769cc8d238a423ada852773"
+SRC_URI[sha256sum] = "2be7e57fb33a55fee71480598e317ffa6a8ee5a39639a7e1b42b2ea6872107b5"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.25.1


