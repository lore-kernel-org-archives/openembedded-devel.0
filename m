Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF87D29FB0
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:34 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.40139.1730874690487656887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E5/cVtiM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874693; x=1762410693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=M38kbX7WZl9ZwHjuEL+6FvDoWvE8nFO29mfBvAxcriU=;
  b=E5/cVtiMcFVzqeBLjes98oYtZupgXddYM1xQhDSjKInj7yg3wC6iKLJT
   yVxPDCURUNsztMKkGdUatmYmPn1PlszQ9kpTRHekbQCGK/xrvbm37HEEG
   6YxOSQOtxr3Qb9h4J+0VpkPsDwX2Ax6vpd74aG1481pt9kmVyTQDaBE4+
   jhM2JHz7sezkmkEiSkefAmQdZwMHurIJG2nQ81UzTRvjs0Iz4e9OKf+xS
   XcZCl6i6Tf1tXV0AYcDIMpCPwDBrBpc/gXySSvCXcmDeGtKqqBv8MuPL6
   XEqYUENOin8X2/uUftVy+govLyevEcTJ8mBHAuFirOUwKHlQOPH1vUYMq
   A==;
X-CSE-ConnectionGUID: NrGt+Bm6RuS563jGqSCMaQ==
X-CSE-MsgGUID: 8pT2ZYemTJ2/OSPYQh77iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="158171289"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="158171289"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 61DADC6847
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B0F0CD969A
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F4496B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F28821A000A;
	Wed,  6 Nov 2024 14:31:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/46] python3-watchdog: upgrade 5.0.3 -> 6.0.0
Date: Wed,  6 Nov 2024 14:30:54 +0800
Message-Id: <1730874660-2364-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--5.859000-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrf6yIJ/9AolOOEENgsUAuYnMW
	fmr8UEU8eA0V3ATvsIgx1J0nF7mCuLvGEmcXHXAm1l+BjLM8lsrC4hYi9ARtbhBLhUIMOS2nu/R
	nVX8mJCIWm/gAtjCd7GetXQVroYqa79SLQXyG7tBYUconbBJWJJSr4ZD/PIl0x8BJ7uScK23Z6i
	UJ3BCiqwSVf/gN2fPbWrtEdRkW/p9tF6/n498MP/LeH1FBnhK0wTlc9CcHMZdH8jOVX4IxtpTXF
	me9d+wogZBEjCNOXeLrixWWWJYrHx8TzIzimOwPC24oEZ6SpSkj80Za3RRg8LHkPRKH7yUN6b1+
	gwvm7QfrFe1GWrRVfYeIuTLBqMyWpSBl0hpeDh8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113723

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Pin test dependecies.
- [docs] Add typing info to quick start.
- [inotify] Use of select.poll() instead of deprecated select.select(), if available.
- [inotify] Fix reading inotify file descriptor after closing it.
- [utils] The stop_signal keyword-argument type of the AutoRestartTrick class can now be either a signal.Signals or an int.
- [utils] Added the __repr__() method to the Trick class.
- [utils] Removed the unused echo_class() function from the echo module.
- [utils] Removed the unused echo_instancemethod() function from the echo module.
- [utils] Removed the unused echo_module() function from the echo module.
- [utils] Removed the unused is_class_private_name() function from the echo module.
- [utils] Removed the unused is_classmethod() function from the echo module.
- [utils] Removed the unused ic_method(met() function from the echo module.
- [utils] Removed the unused method_name() function from the echo module.
- [utils] Removed the unused name() function from the echo module.
- [watchmedo] Fixed Mypy issues.
- [watchmedo] Added the __repr__() method to the HelpFormatter class.
- [watchmedo] Removed the --trace CLI argument from the watchmedo log command, useless since events are logged by default at the LoggerTrick class level.
- [windows] Fixed Mypy issues.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-watchdog_5.0.3.bb => python3-watchdog_6.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_5.0.3.bb => python3-watchdog_6.0.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_5.0.3.bb b/meta-python/recipes-devtools/python/python3-watchdog_6.0.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-watchdog_5.0.3.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_6.0.0.bb
index 0467f55ac..4f56e8104 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_5.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_6.0.0.bb
@@ -4,7 +4,7 @@ DEPENDS = "python3-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "108f42a7f0345042a854d4d0ad0834b741d421330d5f575b81cb27b883500176"
+SRC_URI[sha256sum] = "9ddf7c82fda3ae8e24decda1338ede66e1c99883db93711d8fb941eaa2d8c282"
 
 inherit pypi setuptools3
 
-- 
2.34.1


