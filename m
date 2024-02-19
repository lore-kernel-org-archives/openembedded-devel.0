Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17127C54766
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:03:00 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.37325.1708333370806253776
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NswTmcZn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333371; x=1739869371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+0EiBZnC7b4U+T0NfPX+7wFE3JswqjyuY8RY+TfDB5Y=;
  b=NswTmcZnTRewHoUw5YkJ5m8UXl7JxnMdulliR82o5y1A61sZFKS28gVI
   LKPVJdDQoaEyx8j2B4rkIZB+ODzjv5sIkca7u1t5+v1eUtPNMszKQqpP6
   +InpbDlj+an+q1UVXTrzCXJWRzya+3dRgW1HoDVmk7ltVHv5cd3290YMm
   smS3lUG1b4YE31Dl/MEO/MwuoPixbWTHf2Ol7WHrNhGrOiWLL/y+zBKaN
   TTbHyICWL4OwH7ssUoXJuq0TUCPEjplfNo+cxJPM48OOE7BmrJ/KmHfVI
   cZo6NCvxwSINTz2oCSjTzh0HdnqaSdl96VGNo3w3NjSVV7wgPJBGVAfhn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="129150096"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="129150096"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:49 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B9B35D4805
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EDC7ED3FF4
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8364121F79D
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 322151A00A0;
	Mon, 19 Feb 2024 17:02:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/23] python3-elementpath: upgrade 4.2.0 -> 4.3.0
Date: Mon, 19 Feb 2024 17:02:24 +0800
Message-Id: <1708333346-17704-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10--5.181200-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrcV3n4J/0zUPKyNKzfg6e1rWO
	DdZ1PDmE78OshcQklEAZKKl1sBbyioCJZGMbtS3pA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYRY1tl9vG/AY7Cl8sx4HBG1XgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibIAcCikR3vq8KKFzgRauxbIEYcpMLayKq1ILd7zrk6t/qidbxNe+HgPpWv
	MnQylwI
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108865

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Change the purpose of the evaluation with a dynamic schema context, that
 is now used only for labeling tokens with XSD types
-The static evaluation is now performed also when a schema is provided to
 the parser
-First tests with Python 3.13 pre-releases by adding a tox.ini testenv

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_4.2.0.bb => python3-elementpath_4.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_4.2.0.bb => python3-elementpath_4.3.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_4.2.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_4.3.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_4.3.0.bb
index fe0e99a20..a61ec646f 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_4.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "c53f6531e602dd596a729f75833146ada40c2445a10dae36d9e461068b63af29"
+SRC_URI[sha256sum] = "8d25db9150f5a6aa978c9f58e607fcd5ab6e6e3017140563439a9884ab1eb304"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.34.1


