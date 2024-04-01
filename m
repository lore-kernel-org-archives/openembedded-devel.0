Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A4CCD1297
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:54 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.39356.1711983099599367728
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OlmqZg3A;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983105; x=1743519105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZnVqB04GGpLkjklt+E+S8XJrj/2WWqHm0QcXQ2qqqcI=;
  b=OlmqZg3AA6jQXVVg9ouOZkkKZkQVQEcOri/ZNi4KTwPSymoovlGQsiR3
   FOeat6BPXmidqc6mTVvSaHGTtc+ilK6LT1fDDs8QZMaM2blRqHO321g5S
   bWAU5n8RedDg73omVhZupNqko8F4EpfeiWF6hTZLab2QDPzb4+XIy3lrW
   xObfd5wmOQnqK/ct1A3mijC/0DnxNX/eTR2GYC8QUSBFPjjy4290lOKo1
   h26+CFbHEjt345eOTb0Yz6mXg6NNQC0j9JVrFnKQPoMcTNuqHnAvvsv0O
   /mb+xt3xg4DDktY51Ef5IO34dqDG6BB/JTVXPJKtGKe5HC28pbFqMuUdY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="154534829"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="154534829"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:44 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E76EEC680B
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 32FCF1B860
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C085721F7B6
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 76B1F1A000A;
	Mon,  1 Apr 2024 22:51:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/47] python3-pyzstd: upgrade 0.15.9 -> 0.15.10
Date: Mon,  1 Apr 2024 22:51:06 +0800
Message-Id: <1711983079-16849-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--8.467300-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yaoXHZz/dXlxpxAd6mi1Ga1s1Ir4NZzFmq4r
	mQIDoB6Sc8G/amkXuJMZUTGSlZ0j+RU6Daj8TAqk+GYt8f/VhTtxXefgn/TNQ6qJiU2k4xzFTDY
	4dCWoPQJt7em2i8cWuw3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXBX18z5X2O3uIwP
	rAH8iLMhab+AC2MJ3sBhQWw3lZ+IU7BOj1lchJLN0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtH/zyL+gBqixbJBTKxt0SOkPySLjE5fEM+CfnWSrdiYPAJPEzHyFl+g==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109749

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: add contributors to Copyright

Changelog:
==========
-Fix SeekableZstdFile class can't open new file in appending mode.
-Support sub-interpreter on CPython 3.12+, can utilize per-interpreter GIL.
-On CPython(3.5~3.12)+Linux, use another output buffer code that can utilize the
 mremap mechanism.
-Change repository URL and maintainer following the deletion of the GitHub
 account of the original author, Ma Lin (animalize)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyzstd_0.15.9.bb => python3-pyzstd_0.15.10.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyzstd_0.15.9.bb => python3-pyzstd_0.15.10.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzstd_0.15.9.bb b/meta-python/recipes-devtools/python/python3-pyzstd_0.15.10.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-pyzstd_0.15.9.bb
rename to meta-python/recipes-devtools/python/python3-pyzstd_0.15.10.bb
index 81bffac3a..c094a8d6f 100644
--- a/meta-python/recipes-devtools/python/python3-pyzstd_0.15.9.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzstd_0.15.10.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "https://github.com/animalize/pyzstd"
 SECTION = "devel/python"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8458383225d7107f3383ee5c521628d2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aedb5a2679cd1552fb61c181ef974b9e"
 
 PYPI_PACKAGE = "pyzstd"
 
-SRC_URI[sha256sum] = "cbfdde6c5768ffa5d2f14127bbc1d7c3c2d03c0ceaeb0736946197e06275ccc7"
+SRC_URI[sha256sum] = "83603a97fdbcf2139f475c940789f09e32703f931f29f4a8ddf3551e6700108b"
 
 inherit pypi setuptools3
 
-- 
2.34.1


