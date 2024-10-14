Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EF6CFC51E
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:14 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.50331.1728896158775621089
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aaV1Qi5B;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896164; x=1760432164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Cic5MSxI2OBYwhMdmiHKjyi7knI+/UcH5lna0pxhrEQ=;
  b=aaV1Qi5BW18WTPvX8U6Aj7HhaGO9ae3sM9WwH5NWOoihSb/po5fmXlUt
   MkNGgsv9agidbjbvVo6gzUrwIOBGEi2tatESMBU4Y0PMxrbmgYgKWC5BM
   Nc9tont8YGKGBG3jsiR4g1CY1yDZWpdyYb+n6U+ciKcyhuc1EitQ/Ukdk
   8xCDC9HvM/wLqoNkLZlgKQJWsYNy4b6or61hBZtFZXaM92IrxtVnslYGQ
   QbBUjDUtbMEZ+peZvjh4NxBnQtvaukOFDuqAyiXYKCe80wzYs02XwO3Hu
   N+v/lWE2H3qOfAnWlJybpy0SVEBlEgoOAgFFO1JCfo0BPajV8yRk2YQim
   A==;
X-CSE-ConnectionGUID: FzOZg1VWRJ2l5QNzDfyEJQ==
X-CSE-MsgGUID: JGHTv+7dQNusYyjr99sYmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="155665596"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="155665596"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:03 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 111C4D6EEF
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 627F9D3F00
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D9F796BA73
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A2F751A01E9;
	Mon, 14 Oct 2024 16:55:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/54] python3-coverage: upgrade 7.6.1 -> 7.6.2
Date: Mon, 14 Oct 2024 16:54:41 +0800
Message-Id: <1728896115-2944-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--0.155000-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysDBQ+XBh4YJTcp
	XpPCV0E390A/B/ncx177l/C1nMhv7ghqxc+Vy0t0OWUWxTQJdI9LGPRv0WdxQgAheUymmndf58O
	i0cvtiGyNnhaKXxJ18w3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXBX18z5X2O3tT1r
	rN8sUDVuyz2v/93Du3BhQWw3lZ+IWXBXaJoB9JZxRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs4f6y
	of8/kDZ0mypNYgmFCpJhmY+mrDG5e4Gbfy7ZpPkjklACV1W5k8be+fi7KH+X42pU++IvclhLg5m
	MXSayr7UU0LpvQUQiogeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112868

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Dropped support for Python 3.8 and PyPy 3.8.
- Fix: a final wildcard match/case clause assigning to a name (case _ as
  value) was incorrectly marked as a missing branch.
- Fewer things are considered branches now. Lambdas, comprehensions, and
  generator expressions are no longer marked as missing branches if they
  don't complete execution.
- Fix: the HTML report didn't properly show multi-line f-strings that end with a
  backslash continuation. This is now fixed
- Fix: the LCOV report now has correct line numbers and better branch
  descriptions for BRDA records. There are other changes to lcov also, including
  a new configuration option :ref:`line_checksums <config_lcov_line_checksums>`
  to control whether line checksums are included in the lcov report.
  The default is false. To keep checksums set it to true.
- Fixed the docs for multi-line regex exclusions, closing issue 1863.
- Fixed a potential crash in the C tracer

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.6.1.bb => python3-coverage_7.6.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.6.1.bb => python3-coverage_7.6.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.6.1.bb b/meta-python/recipes-devtools/python/python3-coverage_7.6.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.6.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.6.2.bb
index 7749158f5..c87cfdd16 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.6.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "953510dfb7b12ab69d20135a0662397f077c59b1e6379a768e97c59d852ee51d"
+SRC_URI[sha256sum] = "a5f81e68aa62bc0cfca04f7b19eaa8f9c826b53fc82ab9e2121976dc74f131f3"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


