Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104E4CFC53E
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:25 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.50341.1728896172565027575
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jdGIgC75;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896175; x=1760432175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=E2n5cZT3a2qwYS8JSuG1f1cZa3LozSYzfdq//YwHyXk=;
  b=jdGIgC756FOIktQoXoR1gu2zKe7vWOADJ3vtyqBG4pwO3/V69wvWGfXO
   Jn/vZqo/UaQY+RULZtTx2a3gzxsm7WoFNBFzTavfQ/CeHSfF3T4Hs4Z7J
   bg9Z1volcH3UsN1IxGDglnKQadsGF0SWieTkzMuqY5RAigLMnYtnYTk9v
   jODp2yqS9IJWBMG3BBagtOfZ6OOgj28PurSIVoGk1CQNiGf+FyEr4ZdaU
   /FaqAPvpJmeqTeJxv2wYzovSK2bqeQdeua/AS93pE4SoCSEvX2An7zi3A
   KWAK/bf5Vad7YjilToqGAuoadLIk9StNH/IivW/NndTXrWJ8SG4OefcSX
   g==;
X-CSE-ConnectionGUID: JhQKhPWvTmG83X8MKO+QtA==
X-CSE-MsgGUID: q6ngKOL2RjibAyafwfjIqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176874704"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176874704"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:13 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 30DFAD8011
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D2E8D7755
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 069D36B4D4
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A933A1A01E9;
	Mon, 14 Oct 2024 16:56:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/54] python3-pyzstd: upgrade 0.16.1 -> 0.16.2
Date: Mon, 14 Oct 2024 16:54:59 +0800
Message-Id: <1728896115-2944-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-1.343000-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrXLILvyEBT86GAVmsKRo2NL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIy/G4hnyz0GOtxt2o/IqkqbUJ6hL3u/VbLGf
	KWzLw6pydQEwe5W3tllHtbpVSmms1MEvZvoj2PR9CZ+6wwxG5gdbzHmXCm6Cz+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112888

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Build wheels for Python 3.13
- Deprecate support for Python version before 3.9 and stop building wheels for them

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyzstd_0.16.1.bb => python3-pyzstd_0.16.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzstd_0.16.1.bb => python3-pyzstd_0.16.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzstd_0.16.1.bb b/meta-python/recipes-devtools/python/python3-pyzstd_0.16.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyzstd_0.16.1.bb
rename to meta-python/recipes-devtools/python/python3-pyzstd_0.16.2.bb
index a4aae4aca..c1abd59f6 100644
--- a/meta-python/recipes-devtools/python/python3-pyzstd_0.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzstd_0.16.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aedb5a2679cd1552fb61c181ef974b9e"
 
 PYPI_PACKAGE = "pyzstd"
 
-SRC_URI[sha256sum] = "ed50c08233878c155c73ab2622e115cd9e46c0f1c2e2ddd76f2e7ca24933f195"
+SRC_URI[sha256sum] = "179c1a2ea1565abf09c5f2fd72f9ce7c54b2764cf7369e05c0bfd8f1f67f63d2"
 
 inherit pypi setuptools3
 
-- 
2.34.1


