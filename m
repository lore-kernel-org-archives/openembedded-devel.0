Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7E3C25B76
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.6639.1714628968804437873
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PyVEXzux;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628976; x=1746164976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5vc+awz5bAlXOnJAJj723YUPBsYgXFu3odzxv53vLxc=;
  b=PyVEXzuxG56AmA5DV5zPYttTxz0VHPL7OAj9eX69YVQ2ZYu9jnVTCj9+
   53ELHbas6Xy0/w/QXaEsJtnQE+eErZHwkZyqH8reByfKRFJ8W9Sgbvnju
   ECveT25uW3Ys/AiKixlXlIkZIS6xaXHjz6qhPUI3YxN97iwvBQwyOuqco
   6wSkaYTq7LsAReljRoBQ3f2ButOFdKNkVrbeeZLKlautXui7NE1fhJHWl
   w7dMKkBplGQpKWZ/ry4JsyIbWhzjz4rhPnlqSD/b8EGriwqd8LtLfaq6q
   pWtcOH+ADicXKDqdoIoOGbZK2/OkLESxRHBw3LeDKYB2zRILDK7pDTXkI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="136526445"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="136526445"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:34 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B57A4D4C32
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id ABDFDC19D2
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F91D2008BCDC
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:31 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E1BC21A000C;
	Thu,  2 May 2024 13:49:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/30] python3-xmlschema: upgrade 3.0.1 -> 3.3.1
Date: Thu,  2 May 2024 10:48:23 -0400
Message-Id: <20240502144829.241208-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--5.031900-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrNoSDavyLMJQG5n+Qp6wEW2tw
	OoXDbvJwF8174oFFGJINqAKH097CgfMdlDwM7h+HKsurITpSv+NaNaxZBRbNWtfVxEPp7g/kJhN
	Zatxc0jQglwt9l5S6D3HnpeLMgY01EFTC3NvbQ4Djpxdo/JwVmye0wHaFmKTnlPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDZ1U1lojafr/EITY2UGMiNwpeqaZhManGJ6ba
	/D5x6cp4vM1YF6AJbY1+l7XRPciwwkOroU/RNhSxEHRux+uk8hxKpvEGAbTDn01tlUx7P16LWoC
	rTuj4kwEMc/Y0fgxIacYC4xhf7vWLVQI+RlNp1MPKLW9MzGvn/Ik0ucFY2yuVFf7XHbUr357xpt
	clcXQWluMG6V02+QySir3tZId0WN+6klq53W5kJ9Gzq4huQVX
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110229

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Update validation errors with logging stack trace in debug mode
- Improve locations parsing and URL encoding
- Rewrite the validation of openContent using InterleavedModelVisitor and SuffixedModelVisitor
- Fix validation of XSD 1.1 'all' nested models
- Improve ModelVisitor and particle occurs checking
- Fix interleave mode with XSD 1.1 open content
- Fix for export/download of XSD sources with commented-out imports/include
- Add download_schemas() to package API
- Fix issue with facets on list types
- Add GData converter
- Fix static typing protocols usage
- Extend XSD annotations parsing
- Use XPath subtree as fragment for xs:assert
- Fix in XMLSchemaProxy definition and usage for providing a base-uri to schema nodes
- Module xpath.py splitted to a subpackage for including all the
- custom XPath 1.0/2.0 parsers and related classes to XPath
- Add support for Python 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_3.0.1.bb => python3-xmlschema_3.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_3.0.1.bb => python3-xmlschema_3.3.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_3.0.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_3.3.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-xmlschema_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_3.3.1.bb
index 97dc68378..a80f6c2db 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_3.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
 
-SRC_URI[sha256sum] = "bb24a5f4738e49d85d9eb03a2b5af26bbbbfdb055517ad953d98925094b8c026"
+SRC_URI[sha256sum] = "2066ecbc9728112073f6f44d17c5c16723aff1c7d22a7c4c6421e2d68ec5f0ea"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.34.1


