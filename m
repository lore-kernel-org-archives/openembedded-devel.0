Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F06C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:29:19 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.13689.1660544957789431508
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LXaGKHYw;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660544955; i=@fujitsu.com;
	bh=xAs4PX83bTiQS/pGRR1KNyxMEoMGXu63iuMHFcM/X3o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LXaGKHYwfFsIyPeVTp9T9HpfBRSIK6JjJjSfkjMu1n5gYY3zlEGHYXK4rHhs5aRVW
	 mOOU2pudOfSrz9QQISb7d25YzY08lkg3szR5S1l1HSBtQF3EGqJPBGxC+tqFevh+Zr
	 0cvgp0WhXhDhNCFxAVypf2ll1H279KqlJONvwJ314aUxFvnCDEcSRx2o/aWxTtn7VB
	 wpOHXS5khoCtuFIVuHgQzdbueZLXFGTiQC8qyE6ty0HtMe9eNL2MKoQxPhM/EfLt0c
	 aSv13Fq4FFP5v9hZdTCxZRSyCLwDwyE24u8Qgc4hP9kh6CI0mIKRTttiUvJBR20sth
	 /RoqlqrnvgmRA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8ORqLvr+c8
  kg7vXTSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyjB+ewFDznrDh+YxpzA+Mjji5GLg4hgSeM
  EvffnGSGcK4zSZw4f4q1i5ETyNnDKNH/QwbEZhNQk5h+6wZYXERAX2Lp7D3MIDazgIrEi9897
  CC2sIClRNPV1YwgNouAqsT+/kNgcV4BR4kTN5vBeiUEFCSmPHwP1ssp4CTx+kELSxcjB9AuR4
  mrDWUQ5YISJ2c+YYEYLyFx8MULZohWRYnZl5tZIOwKiRkztrFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMVolFWWmZ5TkJmbm6BoaGOgaGprqmuoamZrqJVbpJuqlluqWpxaX6BrqJZYX66UWF+sV
  V+Ym56To5aWWbGIEhnBKMev/HYzdfT/1DjFKcjApifJeu/gzSYgvKT+lMiOxOCO+qDQntfgQo
  wwHh5IEr9ljoJxgUWp6akVaZg4wnmDSEhw8SiK8C24DpXmLCxJzizPTIVKnGC05ps7+t5+ZYz
  mYnPm17QCzEEtefl6qlDhv3TOgBgGQhozSPLhxsJi/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZy
  DUUmYlxdkCk9mXgnc1ldABzEBHaR39zvIQSWJCCmpBqb1X9h+SVUs/XScrW7uvV075ue2iasI
  zljzefZzO54guQRZ5Z833xidnyjJlSUe8lLawayk6bfimtT5unuf8XiWvvL46j6B9VAAd7Nl9
  vuIspNKDL9WHpqy9bG3zPp5Macd1l5YzCH+0PPcQwntltCuFwet7+f2WR83sOR085S07174aZ
  rr9ftzTtx00Jhk/qOjt3rqhT2ad85dM3OSYFwYM+mzvJHkosw54ce6S+9sllGXWsWg2/+n7sG
  KezMdn3KKMh25n/K6/N/nm7lfjr3p3HT6t0vbqd52LVXJ4yXLNrqudgrjY7mz5ZQcY/3eu7sO
  zm1UVpo4PfONSekXVmdxM/Hv7/tXPSw7kRr5fEueEktxRqKhFnNRcSIA9s7cAHQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-587.messagelabs.com!1660544954!1033020!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26664 invoked from network); 15 Aug 2022 06:29:14 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:29:14 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7C7C2100192
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:29:14 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 709A6100043
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:29:14 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:29:12 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 1.28 -> 1.29
Date: Mon, 15 Aug 2022 14:28:54 +0800
Message-ID: <1660544937-1453-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660544937-1453-1-git-send-email-wangmy@fujitsu.com>
References: <1660544937-1453-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:29:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98240

Changelog:
=========
 Fix issue with handling EAP-Success message.
 Fix issue with handling secure setting and EAPoL.
 Add support for DeviceProvisioning API properties.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.28.bb => iwd_1.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.28.bb => iwd_1.29.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.28.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.28.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
index 40f35b15a0..eada93b651 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.28.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.29.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            "
-SRC_URI[sha256sum] = "ee538c720ad15335ece81a52a4b8a11820236df9ed9a5a72a2e64d74c652f0b0"
+SRC_URI[sha256sum] = "71533fe3b8f6381f24832198ba11d00f04a361454770c173b3b66bc3cdf272bd"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1


