Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAFCC7EE2C
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:23:28 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.103805.1683541398463410224
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cssVkIZ5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541396; i=@fujitsu.com;
	bh=SXGTcYUwQTHRAdr7zbDahY1FMQBIYkbQqcsMaFgf7qc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=cssVkIZ5NX77IO77za1uQGAoK5u2++T9sz5ByyOzhOJlDrtLJv6JUMA3xiOC9QE2O
	 ngkftW1Va8j1OmYBM6NHq2v1U+OZjmKDproKhzXJzNAVJl/YxOwWe4RX8UPOK9m328
	 PpCgkEPTtVuM1bbwOB+Hsmk/m1rWpcNoNyHJVcldcUxYbnpAV4zyveRYzczSkm2L2U
	 8EvclnVNqbKqDVmNQX1ktQX5HUiOZrKeNriB545HmE3sxKww1JihIC1E98AKFLUNWz
	 i7Tm7relE/qX3mVSiyK5RstBnlkdZtwLeT8EnE5otgbnngmuHVvOaeXAA4MtK0hZJx
	 IV2sVy/gbQMVw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRWlGSWpSXmKPExsViZ8ORpDv5bES
  KwYtFchYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ahpoesBYe4K77fvcTewLiKq4uRi0NIYCOj
  xKO7X9kgnGlMEt1LprJ2MXJysAlISEzfe5IdxBYR0JX4+GEuI4jNLKAiMWPyESYQW1jAQ6J17
  xVmEJtFQFVi9fwGsHpeASeJnjnfwWwJAQWJKQ/fg9VwCjhLfH29gQXEFgKq6e6dDVWjJnH13C
  bmCYw8CxgZVjGaFacWlaUW6Rqa6iUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrqJZYX66UWF+s
  VV+Ym56To5aWWbGIEBkVKMZvhDsYVu/7qHWKU5GBSEuU1PRiWIsSXlJ9SmZFYnBFfVJqTWnyI
  UYaDQ0mC1+V0RIqQYFFqempFWmYOMEBh0hIcPEoivLJHgNK8xQWJucWZ6RCpU4yKUuK8fGeAE
  gIgiYzSPLg2WFRcYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMywAyhSczrwRu+iugxUxAi/
  0vh4MsLklESEk1MFl/P/H0AvvRbdsX2GWm7NOaL/Ehq4NhI7OYQqvuxYa3+u8W/dn4b+ueJas
  K52wR01HY1ufbajH117HwFIbSdf9e+HPPmzizouGC5mneOzd8hDzc5/ZttNk/sdLkRuSCW/JB
  zeFC4r5Np7N2FukWrlALZt/hfCFvaXbPVJ/4VBvGLpXv+5e92Zh2d5HjtqW6a7/Mf6U9AZgcz
  ts3hRsvTJU8+EHyhpuvzk+RhZw/vY6xcnzP6zZtDPHoX8C2PP0dg/6PZac1nvA88ZTu9d4+n+
  ecmPSKxqjpfdJveLo7HXTLv/fefvHKOuqqrOJqZ3HfJ5cSZ37v3/1yY/6htp33/yvM0Np2NNH
  zv87PdeKfDJVYijMSDbWYi4oTARf5U1MFAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-585.messagelabs.com!1683541395!505437!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24627 invoked from network); 8 May 2023 10:23:15 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:23:15 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 25F8B1D2;
	Mon,  8 May 2023 11:23:15 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 4D3451C2;
	Mon,  8 May 2023 11:23:14 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pika: upgrade 1.3.1 -> 1.3.2
Date: Mon,  8 May 2023 18:23:01 +0800
Message-Id: <1683541384-25689-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541384-25689-1-git-send-email-wangmy@fujitsu.com>
References: <1683541384-25689-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102417

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Closed issues:
----------------
    GeventConnection may now work on Windows #1407
    ExchangeType should be from str type #1409

Merged pull requests:
---------------------
    Attempt to re-enable GeventConnection on Windows #1417
    fix typo #1414
    Fix exchange type enum type #1410

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pika_1.3.1.bb => python3-pika_1.3.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pika_1.3.1.bb => python3-pika_1.3.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pika_1.3.1.bb b/meta-python/recipes-devtools/python/python3-pika_1.3.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pika_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pika_1.3.2.bb
index 075f3bb577..d5100dd78e 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.3.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://pika.readthedocs.io"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=678ec81495ba50edf81e84e4f1aa69f3"
 
-SRC_URI[sha256sum] = "beb19ff6dd1547f99a29acc2c6987ebb2ba7c44bf44a3f8e305877c5ef7d2fdc"
+SRC_URI[sha256sum] = "b2a327ddddf8570b4965b3576ac77091b850262d34ce8c1d8cb4e4146aa4145f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


