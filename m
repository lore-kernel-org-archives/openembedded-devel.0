Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D21DC2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:15 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.166857.1719305833269402904
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QQKbyGCg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305833; x=1750841833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=h9uDPLHrrEd5yO5ctkYsnay0W8HpsA95mZh5bqa5bPc=;
  b=QQKbyGCgudf4S120USIJkR+yLyM1Y0GXXflksHPDoaR/WPnc30wktHwn
   Hf8W9uxKatDGWZRCTa0MweNQ3jccx0yO7fhGx9HpGfe6V4coREoPHC/Nj
   UV0H8pkomkO3WyDR8G4x2e8zpjIwgyUN+WvjI5nOo/c2osLQNaJ2Kk+xW
   JdCu+hfoclrvU6FdUwm+bMUOQORZozuvUNPw7n5/9izyg5M5FwF6HwJdo
   qubLXTUWP+t7KEYO7QWVAIhEeogM/bEzB0mvYQSMTOO2kIohIJmGhHAGi
   UZ2yz0DUSEYN5qQe3FvKj0FnnDlQ0uQLjjsyxSXlSLuj+i5hdpAygDT8Q
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164920920"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164920920"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:09 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BEA69D4F55
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 19AB6F99E
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B2F2E2A0B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 496E51A000C;
	Tue, 25 Jun 2024 16:57:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/57] python3-ansi2html: upgrade 1.9.1 -> 1.9.2
Date: Tue, 25 Jun 2024 16:55:55 +0800
Message-Id: <1719305790-11484-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--0.100000-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNtw+xHnsmQjN9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrYxv5oSKFbZa8GRiqQ9gL5+3B+9TItSHGiihbiehRuUjS7/hxFbFJA1dWp
	Gu+BAim4qhcDUyLc2LdzzG7OXRuMlq6ChfGalEiR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111037

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 [>=1.9.1] Fix output for --help

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ansi2html_1.9.1.bb => python3-ansi2html_1.9.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ansi2html_1.9.1.bb => python3-ansi2html_1.9.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
rename to meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb
index 6af898917..9942288c0 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-3.0-only"
 
 PYPI_PACKAGE = "ansi2html"
 
-SRC_URI[sha256sum] = "5c6837a13ecc1903aab7a545353312049dfedfe5105362ad3a8d9d207871ec71"
+SRC_URI[sha256sum] = "3453bf87535d37b827b05245faaa756dbab4ec3d69925e352b6319c3c955c0a5"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


