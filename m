Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10F1CE8D52
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:49 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.11430.1726716760599533637
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KLa3bdmu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716761; x=1758252761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eMLHFeAW7lzsdFSQBktYj55Pdh/OcLfcZNQ3zFw4cNk=;
  b=KLa3bdmuarrnXvh9j8BNvboBfm3w33EGUFMhjTkq0ofB2NIx6+gOUgZ/
   Zwj6wAlFs8/DhZdG68m+ogGd5Q8HceWEH5fp+cGk/MH9TdNjVj7CmI3OH
   41whAqYaa0629DpfKDmUqEdWqnryEdCxsbng9rla3kjJYNelMNov7ryUr
   FIx8ynW1S8R2dg5rXVnlqguOQHSXHjkPwtJi6/+u1qLhIBeXkgAwi9v74
   iRQ4Bmt3/tRnz+syeD0ThELh2XJ8MuQ438jNwZaIsjWFiXADOukll7ula
   qB71rAEu2IehhoXqp5B4BehYsEyuUfJWaqnHfamJL2y47BZgKgJC8RBtk
   A==;
X-CSE-ConnectionGUID: XcBOkqoRT/K6jiNm0E75qQ==
X-CSE-MsgGUID: kIeyWgvBTDOcfuJOuEZMQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="173360382"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="173360382"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:39 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 769FACC142
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B3017D8B85
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4997221FC6A
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E97EE1A000A;
	Thu, 19 Sep 2024 11:32:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/28] python3-pyunormalize: upgrade 15.1.0 -> 16.0.0
Date: Thu, 19 Sep 2024 11:32:04 +0800
Message-Id: <1726716733-14548-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-0.278700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yXg2y0j5vXZGlEDhvi2wR85fv9SYkzU9kb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFMM+G0fwTFYNn3Do4I4e3EUDNd
	mfr7kYTop0Zx16K7ELtl87YiucDCn9E+3R2GYzjzynU/0cv+xf2TgB7D+nqsk4safI8G1Doux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112378

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
 Updated to Unicode 16.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pyunormalize_15.1.0.bb => python3-pyunormalize_16.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyunormalize_15.1.0.bb => python3-pyunormalize_16.0.0.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-pyunormalize_15.1.0.bb b/meta-python/recipes-devtools/python/python3-pyunormalize_16.0.0.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-pyunormalize_15.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyunormalize_16.0.0.bb
index 6992ca24c..19463bc22 100644
--- a/meta-python/recipes-devtools/python/python3-pyunormalize_15.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyunormalize_16.0.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Unicode normalization forms (NFC, NFKC, NFD, NFKD). A library independent from the Python core Unicode database."
 HOMEPAGE = "https://github.com/mlodewijck/pyunormalize"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dc15b678c3bac1f5b2c873591a330eae"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c2ee871081d4e4c24f32e37c413c73"
 
-SRC_URI[sha256sum] = "cf4a87451a0f1cb76911aa97f432f4579e1f564a2f0c84ce488c73a73901b6c1"
+SRC_URI[sha256sum] = "2e1dfbb4a118154ae26f70710426a52a364b926c9191f764601f5a8cb12761f7"
 
 inherit pypi setuptools3
-- 
2.34.1


