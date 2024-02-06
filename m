Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FD2C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:41:14 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.17403.1707208866896957935
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=paSchFnN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707208867; x=1738744867;
  h=from:to:cc:subject:date:message-id;
  bh=GG8FQAXHx6THSyHjMq0zjHBB7JWkBvYQDoIx+frY1/I=;
  b=paSchFnNsbflfmhyn8iNWtIhwd1uSKqIEWncIpGcsKdb92tUkppA4IzY
   R+QaRk5IiY7aVXbARE7mVqVT1Lh3M3ot5UwMQmiwwdEcOOpzNHcOScwz/
   kEPiCeFGOU6ur2GNiGQg/iNsT7wUBNWCPCdCV2HJnxocNx59US0iSdFag
   G0p06ZwSvXZh9N1bCHN1VjnfM7qcK3LthSJe5YaANfZqArZeQoFXtsMsY
   hdWtLwBhgdzwB4tPrTQYcrAHAzX8fSgvkUYzzPN46xVz/39+ZYr62ByhE
   exv2Gk2BEFQytvJebOhMpY0Tx06aaghZeenDZoLft2L7hKBaCr1uO36u1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148013900"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148013900"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:41:04 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A933E9AC1
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:41:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D543D9688
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:41:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D9218200968F7
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:41:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7428F1A006A;
	Tue,  6 Feb 2024 16:41:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-elementpath: upgrade 4.1.5 -> 4.2.0
Date: Tue,  6 Feb 2024 16:35:33 +0800
Message-Id: <1707208533-5764-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10-0.894700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwli8Y5a0svL9EA
	nAuyokV24CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4oii
	Qk+x9/d6NDvmZSxb8OxUBW+no517dHOzcmZw09d/NH+Kv2If5+DYVxxc2thGBne7y/rDpVsYDq5
	BAl0QxmsRSRFzFVTyiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108613

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Drop support for Python 3.7
-Add uri and fragment options to dynamic context
-Make context root node not mandatory (issue #63)
-Add function objects constructor (issue #70)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_4.1.5.bb => python3-elementpath_4.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_4.1.5.bb => python3-elementpath_4.2.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_4.1.5.bb b/meta-python/recipes-devtools/python/python3-elementpath_4.2.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_4.1.5.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_4.2.0.bb
index 7b6aad7c9..fe0e99a20 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_4.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_4.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "c2d6dc524b29ef751ecfc416b0627668119d8812441c555d7471da41d4bacb8d"
+SRC_URI[sha256sum] = "c53f6531e602dd596a729f75833146ada40c2445a10dae36d9e461068b63af29"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.34.1


