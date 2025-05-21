Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E771FC54F30
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:05 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.6716.1747818001404151484
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hP37qnsI;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818002; x=1779354002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Wq6+BpQLyqj2bzOzq0oWxa48SS6cN3clAhGKuN4GsgY=;
  b=hP37qnsIbD/Elegb9R6OhfDNJWhwTg4tMsNcR2fWIUTnBTMuVEv1fDFr
   k2hWjSAMX5WimS+d5vubnm5fmfIHt+sw2yFVmkMEJVgoCrjT6OESdt+2U
   dhXYTsnjiZnriYMD/JI7Uv9GfatX/V6AbO7jYcr/9wS39tu/HJH2uiBmc
   44g3sXvqzZmwPWyvuM4xS4h40X2xQ9XCUi0tbClLLf8b10cQZJ+SyApZM
   dm0Qkrf3hUA/a/9xVwIsYTofymtPv1uSiQPhazdYP1X7WedzAPHwDp2kt
   jM14WkMh7VYrRwraalQUV83U4yov5MvUlMWEf+/hYYlPnSNfkoKUTvwcF
   Q==;
X-CSE-ConnectionGUID: dDc8GGkLQTSchOXroIhTaw==
X-CSE-MsgGUID: 1SgixTa8Re6Z4b8FPockmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="187522018"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="187522018"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:00 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D4A7ED5051
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 841ED103C9
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 12B611A009A;
	Wed, 21 May 2025 16:59:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/43] python3-pydot: upgrade 3.0.4 -> 4.0.0
Date: Wed, 21 May 2025 16:59:14 +0800
Message-Id: <1747817972-28874-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117555

From: Wang Mingyu <wangmy@fujitsu.com>

Added:
- Added initial type annotations.
- Added (fixed) complex edge parsing.

Changed:
- Simplify 'Common.get_top_graph_type' with a default.
- Define parser elements in a separate 'GraphParser' class.
- Improve return values and typing of setters and getters.

Fixed:
- Avoid subprocess window creation within 'call_graphviz' on Windows.
- Removed a blank line inserted after subgraphs in the 'to_string()' output.
- Fixed the issue where the parser breaks off lines at hash symbol following a HTML tag

Removed:
- Removed old, unused 'Common.__get_attribute__'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydot_3.0.4.bb => python3-pydot_4.0.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python3-pydot/{python3-pydot_3.0.4.bb => python3-pydot_4.0.0.bb} (76%)

diff --git a/meta-python/recipes-extended/python3-pydot/python3-pydot_3.0.4.bb b/meta-python/recipes-extended/python3-pydot/python3-pydot_4.0.0.bb
similarity index 76%
rename from meta-python/recipes-extended/python3-pydot/python3-pydot_3.0.4.bb
rename to meta-python/recipes-extended/python3-pydot/python3-pydot_4.0.0.bb
index 960592f714..10e55a6e67 100644
--- a/meta-python/recipes-extended/python3-pydot/python3-pydot_3.0.4.bb
+++ b/meta-python/recipes-extended/python3-pydot/python3-pydot_4.0.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/pydot/pydot"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSES/MIT.txt;md5=7dda4e90ded66ab88b86f76169f28663"
 
-SRC_URI[sha256sum] = "3ce88b2558f3808b0376f22bfa6c263909e1c3981e2a7b629b65b451eee4a25d"
+SRC_URI[sha256sum] = "12f16493337cade2f7631b87c8ccd299ba2e251f3ee5d0732a058df2887afe97"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


