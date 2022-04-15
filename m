Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98169C64ED9
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.2557.1649986721160449920
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 18:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cHIvyOsV;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649986719; i=@fujitsu.com;
	bh=5hfeerwVAmPASkHeft6byTPt33KmnIu2jEjtAWbKBTA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cHIvyOsVhHV9I8ywECYRCYg0tcIeBH/Q97NqNt6wAc8MmXwBHcGByokB5CWofXQQ2
	 b8EzbIie9B0K0mcCr6MJi+iVMUINvHNFMnGQuIpCrRxQKpgb9xei4Ar+09V1c+Ifl1
	 mi2BPmZECbQxw6r74+h2b/Rw5wJzBZqFmS9e34Gyepe9Ce5einofhMCoj6cSp0wbfe
	 5kk1BqXh2qZrYPTBv2YRNkFfzUGCPo++b/lAU/1j7fqiWpHwrQ0dKX0kq0hl/P95jH
	 z561A73pGJ/HqrR99Tex08hEH6dpuydTHAbcSAuRl+dKt0/aKPWF6bU5az5dR6+9sb
	 3ekD8NH23ud4Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSXfumYg
  kg313jCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozGvTfZC07xV6zbupS9gXEVbxcjF4eQwBNG
  ibZrb5kgnAtMEs86pjBDOHsYJU7Mv8XWxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAg8TuX8tZQGwWAVWJ9glLmEBsXgEnib+bToH1SggoSEx5+B6sl1PAWeLknIlgcSGgmv
  6H/1kg6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVErNmtTFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMVomFWWmZ5TkJmbm6BoaGOgaGprqGuqaWuolVukm6qWW6panFpfoGuollhfrpRYX6xVX
  5ibnpOjlpZZsYgQGcUoxo/UOxo6+n3qHGCU5mJREeafGRyQJ8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuCdfxooJ1iUmp5akZaZA4womLQEB4+SCK/ATqA0b3FBYm5xZjpE6hSjopQ4byRInwBIIq
  M0D64NFsWXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzNoJM4cnMK4Gb/gpoMRPQ4m+rQkE
  WlyQipKQamJZMad6zNt/ZXuhxAG8VV10Yd3tAZ4H/c27XuYXBPvs/RiQeePS/kWWt6tX5dW8O
  2BVab/u28rrxSv8n+9pFT/gUTr+7cNZE7QhRp136kZcyu685MhrFct5wFlFcUNZjKPs/cQVv5
  ZYb5benRDeV2VwP3y9z/NzE+ounTvu1hpVkfPEp35Lzs+TDdOtmZe/Ubo539uITayV1ZjX5zf
  rt6Bhy5fHtmu2hYSWLZho8sPrfKCDV9pUni/3X277fT8v3/nP62TEhNnBiqnbiJ+2tmcvWteT
  mPZgXnDu3ocj/u2j/zCL9+xFsErcFQnnKbu+YfvP1lva5Vy5++vsigyOw44bD/2WtbeWxifPz
  j0i6KrEUZyQaajEXFScCADjky8BdAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-587.messagelabs.com!1649986717!34508!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21474 invoked from network); 15 Apr 2022 01:38:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Apr 2022 01:38:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6362C100475
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Apr 2022 02:38:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 57132100466
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Apr 2022 02:38:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 15 Apr 2022 02:38:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] unixodbc: upgrade 2.3.7 -> 2.3.9
Date: Fri, 15 Apr 2022 09:37:53 +0800
Message-ID: <1649986673-24913-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649986673-24913-1-git-send-email-wangmy@fujitsu.com>
References: <1649986673-24913-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96660

Changelog:
=========
    * Add configure support for editline
    * SQLDriversW was ignoring user config
    * SQLDataSources Fix termination character
    * Fix for pooling seg fault
    * Make calling SQLSetStmtAttrW call the W function in the driver if its there
    * Try and fix race condition clearing system odbc.ini file
    * Remove trailing space from isql/iusql SQL
    * When setting connection attributes set before connect also check if the W entry points can be used
    * Try calling the W error functions first if available in the driver
    * Add iconvperdriver configure option to allow calling unicode_setup in SQLAllocHandle
    * iconv handles was being lost when reusing pooled connection
    * Catch null copy in iniPropertyInsert
    * Fix a few leaks
    * Remove "#define UNIXODBC_SOURCE" from unixodbc_conf.h

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../unixodbc/{unixodbc_2.3.7.bb => unixodbc_2.3.9.bb}          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/unixodbc/{unixodbc_2.3.7.bb => unixodbc_2.3.9.bb} (83%)

diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.7.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb
similarity index 83%
rename from meta-oe/recipes-support/unixodbc/unixodbc_2.3.7.bb
rename to meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb
index b91c22e919..c194739cb1 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.7.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb
@@ -11,8 +11,7 @@ DEPENDS = "libtool readline"
 SRC_URI = "http://ftp.unixodbc.org/unixODBC-${PV}.tar.gz \
            file://do-not-use-libltdl-source-directory.patch \
 "
-SRC_URI[md5sum] = "274a711b0c77394e052db6493840c6f9"
-SRC_URI[sha256sum] = "45f169ba1f454a72b8fcbb82abd832630a3bf93baa84731cf2949f449e1e3e77"
+SRC_URI[sha256sum] = "52833eac3d681c8b0c9a5a65f2ebd745b3a964f208fc748f977e44015a31b207"
 
 UPSTREAM_CHECK_REGEX = "unixODBC-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


