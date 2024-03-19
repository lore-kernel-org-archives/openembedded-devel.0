Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF856C54E69
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:46 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.8222.1710827201438847373
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c/3XUW17;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827200; x=1742363200;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jRKvHLWCBX0ybEppJvExUb9/q2yd6scP6M6iyVJDdg8=;
  b=c/3XUW17qzyn5zUdYSgcnhKuRs4+5XzZHUnNlGLogUxlpiHm8fmWQHNL
   o/qINOqr1yWYRzTiHPOit8tgwMreAPnVDaCvDXLXiTbDKPjWoFr4D0ngV
   dp0ZfdCLa8G7hdkqjNrFkk5oF9/iJeSnI3pLnJDuKMtj09JC6JVuhco2v
   0k0lxZd7gNuo7SfhKy619Gto6zpZQuwFFErxUxQjrAsduoGBCSvteHWgM
   shkfZ1tBYS0wW4PfFPVzkMEIVAIaJsRPBkZd88kD7jxi7GUK0KESW5wUX
   mqJ7wmSV+/aJiwBsZhAkYFni8bXc9ID9sccbVkiz5WS02jcaqxYeqpat2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="141150219"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="141150219"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:38 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EBE802A0DFD
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3517DD418A
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C203E2009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6C3B61A006B;
	Tue, 19 Mar 2024 13:46:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/50] python3-flask-migrate: upgrade 4.0.5 -> 4.0.7
Date: Tue, 19 Mar 2024 13:45:16 +0800
Message-Id: <1710827139-30056-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--0.581700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrBGvINcfHqhfozDhGeQC9Ero+
	nk84ArnJFbOmr5EW3SlBAiJopeTv0O1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQsqh
	SzMv5WaZ7MSP7SLpuGIiEKUa2WZLOeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZLHSCVFybM+6kLoeJtam0spuCIVI7U+lYRp+qNRjkDXPWjxP
	yEhiGGWvJcrb9L4W+ZqW6rt+sIfLMNdgbOSGdAkuDWF3sgz25xLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109444

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Regression from #438: check g.x_arg exists before accessing it
-Accept -x options for all db commands
-Add --purge flag to the stamp command

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-flask-migrate_4.0.5.bb => python3-flask-migrate_4.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-migrate_4.0.5.bb => python3-flask-migrate_4.0.7.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.5.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.7.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-flask-migrate_4.0.5.bb
rename to meta-python/recipes-devtools/python/python3-flask-migrate_4.0.7.bb
index 87553c17e..bfd854ac0 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_4.0.7.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alemb
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 
-SRC_URI[sha256sum] = "d3f437a8b5f3849d1bb1b60e1b818efc564c66e3fefe90b62e5db08db295e1b1"
+SRC_URI[sha256sum] = "dff7dd25113c210b069af280ea713b883f3840c1e3455274745d7355778c8622"
 
 PYPI_PACKAGE = "Flask-Migrate"
 
-- 
2.34.1


