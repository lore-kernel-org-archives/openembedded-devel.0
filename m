Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A09E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:01:56 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.77392.1734426114321450172
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E5lNARlj;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426115; x=1765962115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zgUGm5psu8/DpUW/rGkwhNApaWLuflrGucH6dpGMsWs=;
  b=E5lNARljxLnGpf98LgzGqtLhdazNsVyVPpVmfoFNskGJdQ93uNQckPi3
   HHwN3H+DWCWAD1WTT4yLxDY3OqrkBzJ2WgYL9fPB4iKyqIWsRI4i/reP9
   rN0pNd74UW8asLG846WiUSGjWNdVSeXIBcGNIFqAdw0HRrSZibuhfDLBV
   smsJV4MfXSQEaa+l9f8fKFyKBDYQRJhhVBHCfXBuY8AP40N+d8sxzb6OI
   OLRjd7T/A8WWIp0JQbASngrhB3VbZFBNDtwgWq2fFZTyckm02XDjrXFs6
   QUBbmBTQhGtmpqePlnXZRjxvbjXtoAHsGk30CtMx4CEPsat8L6xgyvUaL
   A==;
X-CSE-ConnectionGUID: JZ6RtEGLTh+goWtjvTSVoA==
X-CSE-MsgGUID: 23p/6GoOQ9CtLNks745MGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="162953822"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="162953822"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:53 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id ECBF0C2260
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C61BED8B31
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 655E0347B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:50 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2BB7C1A0071;
	Tue, 17 Dec 2024 17:01:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/17] mcelog: upgrade 201 -> 202
Date: Tue, 17 Dec 2024 17:01:29 +0800
Message-Id: <1734426096-18300-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--1.979800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2v8LO5wKi8YUnDICbPFvtnTHEDUAqZUZM4ZiTLIQu4YpMSiwizsgluQ1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzyQeRC44eWI1ehH
	aLv18F8ppKEILu7MfWxLj4kp4FOrRdrLke4AtXSyqV0Tetu0JXUXL91baWVQc1EgrMIFf/+aoZc
	7+AI1PZiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114359

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_201.bb => mcelog_202.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_201.bb => mcelog_202.bb} (96%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_201.bb b/meta-oe/recipes-support/mcelog/mcelog_202.bb
similarity index 96%
rename from meta-oe/recipes-support/mcelog/mcelog_201.bb
rename to meta-oe/recipes-support/mcelog/mcelog_202.bb
index 799347fe40..59fb86f2a3 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_201.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_202.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;
            file://run-ptest \
            "
 
-SRCREV = "d70a0a7a794b35225295f77225941462c1d57254"
+SRCREV = "6b3fe165f35ef9897a6573042851922b3a3e4e4d"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.43.0


