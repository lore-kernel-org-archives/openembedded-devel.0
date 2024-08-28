Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F3BC5472D
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.8743.1724833596456388398
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F4QLeXOo;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833596; x=1756369596;
  h=from:to:cc:subject:date:message-id;
  bh=KuhbDH54c0s5nfXCr/AmLH+GdaX0nNGvdeMvSXocNa4=;
  b=F4QLeXOoI48qubCLaVHbiIkbhlUcfli3frQcHcjuvpnDxdJxrid66ObI
   V/w49L3+LOQglx6S8/PdCAd11hNPzrnmUvScvJREQX6VyvXdZmKgcUV1Y
   wLyKvH+92kwOJASU+B3zSxtC6WvDqaofNycmP5F980hv8f0YcdG2TROKA
   jeUIVX0b5i1pip11YRh+KOmc5I4B9Bnx+SEJK9AQSfHLuvbogSbXujMUJ
   o5I6/sLAYa2B18oATwTSir5aziRm3Co2IRm3YRKEjNUu/lT7vVSN5Ft8p
   lxqqrf7t7pvi3irxbkSE4FzqbQ50njVktjXNyVj/C0gDjt4Zzl2+VMVy4
   Q==;
X-CSE-ConnectionGUID: D11PgH0pQ8OODbaX0ilk+w==
X-CSE-MsgGUID: yArfJVMdTV+5QzZAlr20kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="172039660"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="172039660"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:26:34 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DC91CA1E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:26:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A78FABF4A9
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:26:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 350BD20079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:26:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D4A2F1A0002;
	Wed, 28 Aug 2024 16:26:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lastlog2: use update-alternatives to  solve conflicts with util-linux
Date: Wed, 28 Aug 2024 16:26:26 +0800
Message-Id: <1724833587-2225-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--6.288900-10.000000
X-TMASE-MatchedRID: 1TCQmSpE5OWMPz8Goa6fXdl0i+WyI+91HteOvpCT4ujJyYU2J054Pe79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoh2P280ZiGmRWCjDJRYeAZ0CtGYG0znilHhh5KUdlgWi8Rl
	Sw+odtQGzxtrcK0Z+TOuLFZZYlisfHxPMjOKY7A8LbigRnpKlKSPzRlrdFGDwVpOpm23T3tmdTM
	ja8gj1N1IkcfGlmyFJ5NYv7LCcI9hR7SHeaypXhQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112025

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/bin/lastlog2 conflicts between attempted installs of lastlog2-1.2.0-r0.core2_64 and util-linux-lastlog2-2.40.1-r0.core2_64
  file /usr/lib/security/pam_lastlog2.so conflicts between attempted installs of lastlog2-1.2.0-r0.core2_64 and util-linux-lastlog2-2.40.1-r0.core2_64

util-linux also uses the file '/usr/bin/lastlog2' and '/usr/lib/security/pam_lastlog2.so'.
util-linux has a priority of 80.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb b/meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb
index ebabcfd40..fb7d877e2 100644
--- a/meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb
+++ b/meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb
@@ -22,6 +22,15 @@ SYSTEMD_SERVICE:${PN} = "lastlog2-import.service"
 
 EXTRA_OEMESON = " -Dpamlibdir=${base_libdir}/security"
 
+inherit update-alternatives
+ 
+ALTERNATIVE:${PN} += "lastlog2 pam_lastlog2"
+ALTERNATIVE_LINK_NAME[lastlog2] = "${bindir}/lastlog2"
+ALTERNATIVE_TARGET[pam_lastlog2] = "${libdir}/security/pam_lastlog2.so"
+ALTERNATIVE_LINK_NAME[pam_lastlog2] = "${libdir}/security/pam_lastlog2.so"
+ 
+ALTERNATIVE_PRIORITY = "100"
+
 do_install:append () {
       if [ -d ${D}${prefix}/lib/systemd -a ${D}${prefix}/lib != `dirname ${D}${systemd_unitdir}` ]; then
           # Fix makefile hardcoded path assumptions for systemd (assumes $prefix)
-- 
2.34.1


