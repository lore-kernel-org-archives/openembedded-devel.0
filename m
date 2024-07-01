Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D789C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:22 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.13622.1719816260296809629
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=axcj2n9o;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816262; x=1751352262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2B4wIS7DC8Wl6w5iGhWvF3MOqabq1n9WYcClHR9nFCM=;
  b=axcj2n9oiWtgdXfELemyJomNV3sOTKOFPYPv5qKILrnI2rVSQbNc3s63
   iscMPLMqWlP8i853f+JMbSB/6cpV18mxlrToFMlFRt3vnDmtXBxfHtip9
   QfWppXub9ibGzSAclGZbzL84SbBPBY5mwCKWBq1pJ07jV+3VosNnK1Fm5
   HifVkBqF7iw0NLVZXz0RoQ6hqscVZQkI8EDcgmx2GC4j09wDaveBeeStx
   ABRHpZC3CUUfaCVwGNdPkUpOtreW3ywU9NrfjYm/91xBtSl+fOetHJotP
   gxYXX4lu8gbM3QJWeBXT10QARa4xMMzYc4lgxpJgwpjJ01fwf8HV/r6pw
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="165542295"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="165542295"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:15 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6102FC68E9
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A05FBCF7D9
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DA7620071A33
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CF16D1A000A;
	Mon,  1 Jul 2024 14:44:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/25] isomd5sum: upgrade 1.2.4 -> 1.2.5
Date: Mon,  1 Jul 2024 14:43:41 +0800
Message-Id: <1719816242-11839-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--4.047600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrVC0UatNKNplUjspoiX02FyjE
	INafKEeOi1QzF8xBpkWYPsTBEa9DWQDNPxu11HXjP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZG9yZj3aufb5HxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7qUL
	FYoCtmAaJ6746Fz0dmHrZ1vxVsx/xwdPPkc+nVFg1OGtGDurUXkNFKFihAZPpleRshe2otZuWdG
	GDl26pd4knLNReiWciCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111180

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- testpyisomd5sum.py: Use a consistent iso size
- Remove quiet from iso creation, size seems wrong
- workflows: Move to Fedora 39 and checkout v4
- Revert "test: Update testing to include small iso and larger iso"
- Revert "Fix checksum failure with small isos"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../isomd5sum/{isomd5sum_1.2.4.bb => isomd5sum_1.2.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/isomd5sum/{isomd5sum_1.2.4.bb => isomd5sum_1.2.5.bb} (94%)

diff --git a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.4.bb b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb
similarity index 94%
rename from meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.4.bb
rename to meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb
index 5f2993dd4..87fcf8cc6 100644
--- a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.4.bb
+++ b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb
@@ -31,6 +31,6 @@ RPROVIDES:${BPN}-dbg += "python3-${BPN}-dbg"
 
 FILES:python3-${BPN} = "${PYTHON_SITEPACKAGES_DIR}/pyisomd5sum.so"
 
-SRCREV = "3f4c9bd3f21ec9ac75a025dfa3fa30fe3f621831"
+SRCREV = "ed1f54de86b5d507c4cfa552923e9ddfddd9b893"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


