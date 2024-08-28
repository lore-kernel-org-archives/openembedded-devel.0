Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F73C5474A
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.8743.1724833596456388398
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GcWe1QXP;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833597; x=1756369597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AIF6oUit8qWbK2bMHI1F+uoPPFcHQoqTKCutzyNSyNU=;
  b=GcWe1QXPMNcYT8AKodFzEZitVaATlQOKhbjTgCgZvkwQwpG/yxmCkrss
   faHTzfbqOiYOwvxchgbZdvUp1wgRp7lPYLKkhAyHjpVE3aZqYqU4qzwGo
   JgvcSktBH3gwSzuL/2aJ8eFE9jDx3kVy8cZvM+R2i+OwF9hopdLFf88zF
   woSA0qp5MuIOvgLSWUVtq1yKPc75othO43/E63kTUxIKMNHcUggPTwJQT
   I4rBvl/F9NGoXENag4pUGsDEtW47LBrUkaMQf0XjzEMFcWqEiJDNFgG0C
   vVLLcswkN8MloCuse+dG+/gnDrZZGTYbTSfAjkMFbD4oRP0AsWUx48p+m
   A==;
X-CSE-ConnectionGUID: RoGSgzqvSa2ho8F+DEIdkA==
X-CSE-MsgGUID: 7jQNTxMIQ4aXJTnEqEfiQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="172039663"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="172039663"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:26:35 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 355F4C68E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:26:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 76BDED50E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:26:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0807B6BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:26:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A34951A0002;
	Wed, 28 Aug 2024 16:26:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] polkit: use update-alternatives to   solve conflicts with systemd
Date: Wed, 28 Aug 2024 16:26:27 +0800
Message-Id: <1724833587-2225-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833587-2225-1-git-send-email-wangmy@fujitsu.com>
References: <1724833587-2225-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--1.421700-10.000000
X-TMASE-MatchedRID: sxNSNugZwuitxhXyTqc02bstbCLHbulS96ryTp77YeGysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLy9zcRSkKatWdR1HJpsaceKiJEqUFWRghf3ennYqHe2EjINjnv2/BMPsL
	bOLnF04SrdAX/NLoNcp9vpuXVh9T3HxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w68s6
	6+TZ4EvmzxqONM5snu19GT623jvM9ExLRBPEQaPKyjwi+EFIpoqpsqQF5rJglW+Ed7pOJv7CinV
	D/oI5q9bOu3SVjtdm2CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112026

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/share/polkit-1/rules.d conflicts between attempted installs of polkit-125-r0.core2_64 and systemd-1:256.5-r0.core2_64

systemd also uses the doc '/usr/share/polkit-1/rules.d'.
systemd has a priority of 50.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/polkit/polkit_125.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-extended/polkit/polkit_125.bb b/meta-oe/recipes-extended/polkit/polkit_125.bb
index fe1ee467c..5ba9690c5 100644
--- a/meta-oe/recipes-extended/polkit/polkit_125.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_125.bb
@@ -43,6 +43,13 @@ USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysco
 SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE:${PN} = "rules.d"
+ALTERNATIVE_TARGET[rules.d] = "${datadir}/polkit-1/rules.d"
+ALTERNATIVE_LINK_NAME[rules.d] = "${datadir}/polkit-1/rules.d"
+
 do_install:append() {
 	#Fix up permissions on polkit rules.d to work with rpm4 constraints
 	if ${@bb.utils.contains('PACKAGECONFIG', 'libs-only', 'false', 'true', d)}; then
-- 
2.34.1


