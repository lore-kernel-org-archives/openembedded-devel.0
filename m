Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A396DC54E78
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:57 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.8161.1710827209170101062
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ArS5dD79;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827209; x=1742363209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=X2i1W1bXNMQJdYFPwISH9Gd3ILmuc4tH/cz+rCDUe6Y=;
  b=ArS5dD79GL/PbXQWNXGprvg1s3O/XG0zOZ4fUSE9Qa+PHgGgH5+Do+z6
   28r0RSjnAaLslQnA+qN7z85NFMz4NWnX+TAAowp2RDui6i67j4QKEWT6t
   pxpsrVdowKExK9vyjCclToTcOdSMdrTSEQ/lbbuKZI6/qJtbrl1qQyZDO
   4bTXGgne3ilu5TpAH/hVISn+BGlBu5LKuSwuedTn/TwCNFIYEXJ8pdGPc
   9UskiCkgnycNhrATKooeeNeIn8KHw7gSCr71m+A4c0kETJNtQ5w9ka29I
   ukPpitLZc6uofZ/GoC+JhCsItKT7KmUdMBrljyGpV44l4H4MBE35g862u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152721914"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152721914"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:47 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D64FBD3EB7
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:44 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1927DD5E88
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DF982009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 458CB1A006B;
	Tue, 19 Mar 2024 13:46:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/50] python3-pydantic: upgrade 2.6.3 -> 2.6.4
Date: Tue, 19 Mar 2024 13:45:24 +0800
Message-Id: <1710827139-30056-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--0.525600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbytkNxL/J7DaX3KY
	556swoJG4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16ubsT
	aWd4cSvRdcKuEA3qv9nk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5aVg
	fH6D+uOl8CGMOlrr2pM790O0MZ7lEeRIsj+ujylbNuRiaDl1yhhNchOn7WEDzI/YmoCIYInpdKr
	g2pKPZZ26KJ1vpSBs6CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109452

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix usage of AliasGenerator with computed_field decorator
-Fix nested discriminated union schema gen, pt 2
-Fix bug with no_strict_optional=True caused by API deferral

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydantic_2.6.3.bb => python3-pydantic_2.6.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.6.3.bb => python3-pydantic_2.6.4.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.6.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.6.4.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.6.3.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.6.4.bb
index 246f67cb8..ddc24d08c 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.6.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "e07805c4c7f5c6826e33a1d4c9d47950d7eaf34868e2690f8594d2e30241f11f"
+SRC_URI[sha256sum] = "b1704e0847db01817624a6b86766967f552dd9dbf3afba4004409f908dcc84e6"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.34.1


