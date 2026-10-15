Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B333BCC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 07:52:31 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34541.1792050747904641367
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 00:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=lgSCjR6i;
 spf=none, err=permanent DNS error (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: prvs=274840dd0b=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3CPLI2008653
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 07:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=5ChOf
	lWaiLkAyzi7DaHGl5y180bw3SnQrvabyBp49AI=; b=lgSCjR6iW+5nlPoxDKnRm
	kIfBP0iTKDU4tQaPqADs78f9APIEDw/pc2Me8lLcXPf/5xJx6o9IRLfKVcpZO4gr
	IyzxoCt816rm1qmiNFbdLuKd7aPCSWyoKG0Tj7/OuC+9rNrHxeNMwmBXOCOFyS+c
	QMMEJ1HRE4s10FR9AaK4Y5wgnVvzbs6lec/arHe9xoLjqV/Rf/FZ5cL5GDAn1hYU
	t09pG+Ow0aTjRCU6PXPg2gP8r3TY0mV04rQdBZhu6U/dWQqYzWL+rJ8LLhjs+Ehp
	yvSavw/ACcLTZR1xZqg9bHaqtos+waG4jyRR7DcwcVxG/s0QIB9mWIySurqIP5Th
	g==
Received: from tut-ex02-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4haexqsugs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 07:52:25 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX02-PV.KSTG.corp
 (10.0.10.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 15 Oct
 2026 09:52:24 +0200
Received: from TUTN-GJJX4N4.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.53 via Frontend Transport; Thu, 15 Oct 2026 09:52:24 +0200
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-networking][PATCH] networkmanager: recommend polkit-group-rule-network if polkit is enabled
Date: Thu, 15 Oct 2026 09:52:23 +0200
Message-ID: <20261015075223.401712-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: wBrShsd6BVqcaLKLbenQeYmAF92k8tdp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX2DhU/BPwVX9D
 mIurhszzb+c6VWMtQ6EgBw0sJhX0zq+m0sHFQKvHcilKFB1pQMkb/XKkK5c2TYzXKeC3AzqDe4y
 1RXx7d0DLJWiNbnSodvWu3GVWSBQW/7fzCtHwcG4iXO4HZ803/tjv/g/WP358LPJ+SwBpwccc/M
 +LYlQ5Apuq0I8xaRW+PZ5xeWuWTANfFtDYP/YPEqks6/su7mkQz6tnFecxk8itTre2ZIde9RKcs
 6W5AJqlellT2dKzYDHTlQQgPEhfwO6HFAirY/iiS6Jnuy4jcBMxYa/7cIYPWx5CKriTgN/FrnfT
 2TqTaUE8axWRhJvM0cPY3WVp+SKH3dStB1ma82/6FyJRMhgOjI77DXncLPMo4iUw6hHiuwiSmoI
 smUn7r0Ctkd1z+veIsZUyPPA1UI7OXhZQKIMPCNx5od0hkCWviKhvWcyEvsRmlKOQS0q5SglQnz
 RvltOA+m0JBFuGAkI4g==
X-Authority-Analysis: v=2.4 cv=GqHXaU1C c=1 sm=1 tr=0 ts=6ad08639 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=DBWTBMGyQNCzyBkTEoZL:22
 a=Mf5tFF2oQ1p1YQ6vkpes:22 a=n9SCklZpAAAA:8 a=CfOEu03Yzevu95b1ARoA:9
 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-ORIG-GUID: wBrShsd6BVqcaLKLbenQeYmAF92k8tdp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX985fxsAxAHKN
 SYAmUyPBKujFdjxqcF6x0NjeyuvRn3Y5Yie8ZoNxQ94gSGvKglzZ0kUO2ovJcKoNIf5xAnqXIPq
 DmnSfbUL2IUifooDTG6xPuj3YVaJQLBtuCuPK2XdDPrxdm7XbnAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 07:52:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131003

If polkit is enabled as distro feature, it makes sense to recommend the
polkit-group-rule-network package for the networkmanager-daemon package to
allow members of the network group to modify NetworkManager settings.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.58.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.0.bb
index 976f936b0d..2dc7605f76 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.58.0.bb
@@ -263,6 +263,7 @@ RDEPENDS:${PN}-daemon += "\
 RRECOMMENDS:${PN}-daemon += "\
     ${NETWORKMANAGER_FIREWALL_DEFAULT} \
     ${@bb.utils.filter('PACKAGECONFIG', 'dnsmasq', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'polkit-group-rule-network', '', d)} \
 "
 INITSCRIPT_NAME:${PN}-daemon = "network-manager"
 SYSTEMD_SERVICE:${PN}-daemon = "\
-- 
2.55.0


