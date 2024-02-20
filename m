Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD08C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:59:34 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.9388.1708419573661563780
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:59:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qMZSN0XK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419574; x=1739955574;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V08C3W92SQXCiuClioiBQkyT58fdRHi5tQH63bynpRg=;
  b=qMZSN0XKOViRdCMQSGdIw6qEU0ADR0OjeZM8Uy4XY4HDiPExnjc/qRAW
   A8Jp0KldgZumQd/+oiMLuz1xoGX4Bg9WW9feSK3cOIgAtFEo50n4F+HZb
   xoYSnCCaLWJkTmKnXrDyQpgyafe2XdxnsrDVmmOEbdu1ScwJWzSHmUFng
   epmrZPpoXAptHKUwZ+aKWFl4KbmCgnQhq+PN32+YoiBADEE1tOD2GO6Js
   gRieyZwBmil6LpUkmIcUwzOTiVeYSIs39jqNVr7DjZSFSf16o7h8HtCfn
   +KHJO46bDlYTQQLp5kxJDcwQcqlW9yMcbewC1ahGJT8Wqnq9/m9azupFG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149906331"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149906331"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:59:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C65BD3EAF
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:59:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B0A2C4692C
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:59:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 321C66B8C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:59:28 +0900 (JST)
Received: from ubuntu20.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BE35E1A006B;
	Tue, 20 Feb 2024 16:59:27 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-networking][PATCH] Fix install error when enable multilib.
Date: Tue, 20 Feb 2024 16:59:25 +0800
Message-Id: <20240220085925.10960-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10-1.195100-10.000000
X-TMASE-MatchedRID: 5V+Cj47j+8Pc+HB+YVvemCeaCBMY8cEnAycZ15wAFvgBqTWBO7g4fopb
	wG9fIuITlHVH/UHDB9Hmn3xyPJAJoo20xpayFHBZCTeoveN0UE19LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrdOhlPEdbdJx6OWCwZVViOktfaA9RPgPtuWKGORdzBPCATu5r9w7Y1LuSS
	vLtPNvt7xX+ZxSEA5nwbztyMFllIXksxU0Ui5VARXBt/mUREyAj/ZFF9Wfm7hNy7ppG0IjcFQqk
	0j7vLVUewMSBDreIdk=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108947

From: Lei Maohui <leimaohui@fujitsu.com>

ERROR: samba-4.19.4-r0 do_package: QA Issue: samba: Files/directories were installed but not shipped in any package:
  /usr/lib/python3.12/site-packages/samba/domain_update.py
  /usr/lib/python3.12/site-packages/samba/ntstatus.so
  /usr/lib/python3.12/site-packages/samba/descriptor.py
  ......

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-networking/classes/waf-samba.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index 41909788f7..c8bf7bacf8 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -95,6 +95,7 @@ do_configure() {
     export STAGING_LIBDIR=${STAGING_LIBDIR}
     export STAGING_INCDIR=${STAGING_INCDIR}
     export PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
+    export PYTHONARCHDIR=${PYTHON_SITEPACKAGES_DIR}
     export PYTHON_CONFIG=${STAGING_EXECPREFIXDIR}/python-target-config/python3-config
 
     CONFIG_CMD="./configure ${CONFIGUREOPTS} ${EXTRA_OECONF} --cross-compile"
-- 
2.34.1


