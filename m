Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB288C25B41
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:51:29 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.116159.1698051085301226553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="136685326"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="136685326"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:51:24 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E4A27DDC77
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:51:20 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2488BD9471
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:51:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D912879A4;
	Mon, 23 Oct 2023 17:51:18 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-meson-python: upgrade 0.13.1 -> 0.14.0
Date: Mon, 23 Oct 2023 16:50:54 +0800
Message-Id: <1698051054-25947-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10--3.387600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrgbNN0R684zP+Aw16GgqpOwZN
	LEcrBa0wdnLCqPd2a8cm2ihhinRYiqXUs7kD79U2a87CDXaKRVIXivwflisSrOVPZ45IpnLYvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgDFcf92WG8u/yeuKmpofsO6em2
	vw+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etkvffyAw5k88VbqtFM5NzaWs0G9ZyfedOdKmiC
	xoeVsj4rL+mayJoDZ92q6gfOkmeEcpsvevbRU7q3ewsxNmExjhO05ALRrEzeEu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105674

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Do not run meson install to build a wheel.
-Obey the --skip-subprojects when specified for the meson install command.
-Implement support for the exclude_directories and exclude_files arguments to
 Meson install_subdir() function and similar installation functions.
-Implement support for building wheels targeting the Python limited API.
-when pyproject.toml does not contain a version field and version is not
 declared dynamic, raise an error instead of silently using the version
 declared in meson.build.
-Fix the mtime of source files in the sdist tarball.
-Add objc and objcpp compilers to the cross file generated when the
 $ARCHFLAGS is set.
-Extensive documentation improvements.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-meson-python_0.13.1.bb => python3-meson-python_0.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-meson-python_0.13.1.bb => python3-meson-python_0.14.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-meson-python_0.13.1.bb b/meta-python/recipes-devtools/python/python3-meson-python_0.14.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-meson-python_0.13.1.bb
rename to meta-python/recipes-devtools/python/python3-meson-python_0.14.0.bb
index 6b9ff24f2a..d6ee64b015 100644
--- a/meta-python/recipes-devtools/python/python3-meson-python_0.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-meson-python_0.14.0.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 PYPI_PACKAGE = "meson_python"
 
 inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "63b3170001425c42fa4cfedadb9051cbd28925ff8eed7c40d36ba0099e3c7618"
+SRC_URI[sha256sum] = "b96866690326544dfe452583753ac3f43313227e9fd9416701a8df90af212234"
 
 DEPENDS:remove:class-native = "python3-meson-python-native"
 
-- 
2.34.1


