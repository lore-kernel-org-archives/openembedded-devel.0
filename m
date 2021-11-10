Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC61C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 04:19:23 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.7540.1636517961787076135
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 20:19:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bJrLmL0K;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636517959; i=@fujitsu.com;
	bh=VsdVWW1fwCzwVf/yXUOGdWt7lMUaJMhIED2IrxIiViA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bJrLmL0KQFLqvjyMb9zu42sFtAA1iXC40qITq8k3kHB30wiUrsAUAb+scZL1tSMMY
	 3t7DoI4lcVN1AAqT2bYgBgYwoTxPTnlTEVmRD3Xg5klxfkg39sApp1EIFUbfT9uTO7
	 8g3F8mDju6xA5chUzLa2mciYODFeTBORsVdLQLfLaVnKI61n1R4hUR1qy2vsyZ4Xk8
	 q0y7FSrmUF2idkAQHhthdMTyAO9Fa+q2I88Dhcs6cvlBvD4YKiLcRJqK2tdrRSxxvI
	 MUgZOS+q5sRUJZlUzJiJChwwf9GFd/saos6xsw3+Y+ubo6OwLU0vq1m2IlR2gADep4
	 kxr8T2yOUxTPQ==
Received: from [100.113.0.18] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 3C/A4-32197-6484B816;
 Wed, 10 Nov 2021 04:19:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MxSdfNozv
  RoHOCpMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFu1hz2gvNcFY1X7rE3MD7g7GLk4hASeMIo
  Me3tYyYI5wKTxMUXF1kgnBOMEu9+7gTKcHKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAn8eDlBBYQm0VAVeLJvTdANRwcvAJOEl8nFYOEJQQUJKY8fA/WyisgKHFy5hMWiDESEg
  dfvGCGqFGUmH25mQXCrpCYNauNCcJWk7h6bhPzBEb+WUjaZyFpX8DItIrRMqkoMz2jJDcxM0f
  X0MBA19DQWNdQ18jITC+xSjdRL7VUNzk1r6QoESirl1herFdcmZuck6KXl1qyiREYkimFjI92
  MJ5+/UHvEKMkB5OSKO8Boe5EIb6k/JTKjMTijPii0pzU4kOMMhwcShK8Ba5AOcGi1PTUirTMH
  GB8wKQlOHiURHhPuwGleYsLEnOLM9MhUqcYFaXEeSe6AyUEQBIZpXlwbbCYvMQoKyXMy8jAwC
  DEU5BalJtZgir/ilGcg1FJmLcQZApPZl4J3PRXQIuZgBYf/NIOsrgkESEl1cDUnSh+I2PzSza
  b/VbvzF2b3V9I5er77pV6tq+gW2650fsrKts+vJirPOPm1AMnFqydZrMk0Ohq2qOPP7vkbnBf
  nWklGFDx+MSM5gn8CZwnyl9mlagdcJj04im7d3VSroA6l4C0ZrKMsraj3Ku7fm3bJA0Kml3rP
  M68327Qs+BLI5Nc61zuTdfZJUvWuDIIZCVyPzn6I2texsllLy4wX0iJvvBlpqOiySE2I6PMjz
  vk7/P8rH4WFbnO4P3esIW8yfWVnhK/EjP897LeWHooKGGa7rqXu1sVZO084gWElkf+jpp7r1j
  nSdb26tSfZxO+XfFxf3n7fdVVG6d+K3bOzN5DSWFpiQd8p9/f5X/l+VclluKMREMt5qLiRABh
  OLr1RAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-232.messagelabs.com!1636517958!570077!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32275 invoked from network); 10 Nov 2021 04:19:18 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Nov 2021 04:19:18 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E905A100459
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 04:19:17 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DC9D910044D
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 04:19:17 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 10 Nov 2021 04:19:08 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-httplib2: upgrade 0.20.1 -> 0.20.2
Date: Wed, 10 Nov 2021 12:18:59 +0800
Message-ID: <1636517939-63664-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Nov 2021 04:19:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93900

0.20.2

  auth: support pyparsing v3 (AttributeError downcaseTokens)
  https://github.com/httplib2/httplib2/issues/207

  proxy: correct extraction of errno from pysocks ProxyConnectionError
  https://github.com/httplib2/httplib2/pull/202

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-httplib2_0.20.1.bb => python3-httplib2_0.20.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.20.1.bb => python3-httplib2_0.20.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.20.1.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.20.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.20.1.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.20.2.bb
index 8a0b6c9e5b..bda1d1f0bc 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.20.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 
-SRC_URI[sha256sum] = "0efbcb8bfbfbc11578130d87d8afcc65c2274c6eb446e59fc674e4d7c972d327"
+SRC_URI[sha256sum] = "e404681d2fbcec7506bcb52c503f2b021e95bee0ef7d01e5c221468a2406d8dc"
 
 inherit pypi setuptools3
 
-- 
2.25.1


