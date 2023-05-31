Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE955C77B7C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:41:10 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8614.1685518863533370609
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="118931667"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="118931667"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:48 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E854CD7E7
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E00E1BF4BE
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:45 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D0A7A68957;
	Wed, 31 May 2023 16:40:44 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pint: upgrade 0.21 -> 0.22
Date: Wed, 31 May 2023 15:40:16 +0800
Message-Id: <1685518820-20028-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10-0.808900-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr3SkTY86NiDivY1zctlJ9TBwz
	72zDzvkOEpOBzVcqqX4Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl/qzSYnI5VS9npt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFPUvB7glXA0/mq0Ng/3WmFJoO6
	PAvHEP227xG+qJo14Dv+LHf1sSYaPOhp1+AKBHb4JlKYkl++M48ndb548u/OBLRRcCnMOQSux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102926

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Drop Python 3.8 compatability following NEP-29.
- Drop NumPy < 1.21 following NEP-29.
- Improved typing experience.
- Migrated fully to pyproject.toml.
- Migrated to ruff.
- In order to make static typing possible as required by mypy
  and similar tools, the way to subclass the registry has been
  changed.
- Allow non-quantity atol parameters for isclose and allclose.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pint_0.21.bb => python3-pint_0.22.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.21.bb => python3-pint_0.22.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.21.bb b/meta-python/recipes-devtools/python/python3-pint_0.22.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pint_0.21.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.22.bb
index 13944ec78..0eed33f79 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.21.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.22.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi ptest python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "3e98bdf01f4dcf840cc0207c0b6f7510d4e0c6288efc1bf470626e875c831172"
+SRC_URI[sha256sum] = "2d139f6abbcf3016cad7d3cec05707fe908ac4f99cf59aedfd6ee667b7a64433"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


