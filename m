Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13F3C6FA8A
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:16:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.2910.1663064162692695047
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hMdRw6eb;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064160; i=@fujitsu.com;
	bh=5D2UqBrSvzhhSwKbjldhQTwtC28er9CVKLvMj8KLAlc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hMdRw6ebAkcbuii5jTrfKNDvCLWjTyA4PBBy5nvfV1HfL5LVUtwq0houMOs4fVyxs
	 +nTtggcgX348oUD64Ro4a3xkdg0ytkt9sQU8mePBiDigur+alpFXCWZw8fI78j/Zns
	 gzTsGN1S9sERxKWBSMNaNEZjOuQ2IBFUKdakP/bS3aJOfirmlsOhioekwLB9sxhXDi
	 yaKD7IN/UBb2ENkb+VQsMsF18sOQn+Iw5BvzH6eRAfBBbe2zx+cgvD49srFFn9yOxN
	 5dq9xRLgldM5gj1bnJxggvjryQZ/Gf66hkGErItDJOcEH7eh/ZlbP/Zoc47ek+x0Wk
	 6+/nrvqnLJDDA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8ORqJsQoZB
  scHmBssXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtGxbytLwTWOim+vljA2MH5g72Lk4hASeMIo
  sW3aQ0YI5zqTxNkbM1khnD2MEkvv3ATKcHKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAh8fv4KaYuRg4OFgFViakz9UDCvAKOEte33wVrlRBQkJjy8D1YK6eAk8TmvjtgcSGgmt
  d3HzFD1AtKnJz5hAVivITEwRcvmCF6FSVmX25mgbArJBqnH2KCsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYrRNKspMzyjJTczM0TU0MNA1NDQF0sa6hiZGeolVuol6qaW6eflFJRm6hnqJ5cV6qcXF
  esWVuck5KXp5qSWbGIGhnFKc3reDceO+X3qHGCU5mJREeSO9FJKF+JLyUyozEosz4otKc1KLD
  zHKcHAoSfDGhwDlBItS01Mr0jJzgHEFk5bg4FES4eUJBkrzFhck5hZnpkOkTjEac1y9cmUvM8
  fMr20HmIVY8vLzUqXEeWd6A5UKgJRmlObBDYLF+yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIx
  KwrwSYUBTeDLzSuD2vQI6hQnoFCNreZBTShIRUlINTIJHTvPNWJ/Hl7rrrv3vawdZ+Vc+Oqqs
  7K3dfX+Tp4uLsGKG79n18mW/Thgs6GzJFtKNmXvFvEPX4b/FlgMGrqwLtG//6K14OVvYk9Vsy
  effxWxaZbeuLpP5nhIvqi/76pVbxeGgn1mzjbxMZLpL5B3Z/lx8KnZp4VJB/qp7vh9C2hJ2c3
  1+1G+9Y0KH5qLF3tqyK6IMPPdJrb931kWsd2G39K4NzaFOG6d2XAhU3r7y5o/3D2a9325i+oh
  j66yA2hJLnkjOtbNqn0oezk8I+bb/+z65a7dtXm7WEkjb5WXIV3PXJef4wzsHCyomveHIqoz0
  bw2vVXknpa770cJX1+D8vZoG7dzz5k9mXepjU2Ipzkg01GIuKk4EAD44W69yAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1663064160!292900!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17584 invoked from network); 13 Sep 2022 10:16:00 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:16:00 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F169C100192
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:15:59 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E5B96100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:15:59 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:15:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] modemmanager: upgrade 1.18.10 -> 1.18.12
Date: Tue, 13 Sep 2022 18:15:41 +0800
Message-ID: <1663064143-3176-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064143-3176-1-git-send-email-wangmy@fujitsu.com>
References: <1663064143-3176-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:16:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98764

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{modemmanager_1.18.10.bb => modemmanager_1.18.12.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.18.10.bb => modemmanager_1.18.12.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.10.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.12.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.10.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.12.bb
index 9316cbbbc1..b06e3ebdab 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.10.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.18.12.bb
@@ -12,7 +12,7 @@ inherit gnomebase gettext systemd gobject-introspection bash-completion
 
 DEPENDS = "glib-2.0 libgudev libxslt-native dbus"
 
-SRCREV ?= "1338749739e0c01bdbc6ddf92388a781806ec3ac"
+SRCREV ?= "c234bd55c9d9618c1478b5e80aaf4b8f965be181"
 
 # Patch 0001 will be in ModemManager > 1.19
 SRC_URI = " \
-- 
2.25.1


