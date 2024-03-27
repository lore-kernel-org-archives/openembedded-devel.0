Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0454EC54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 01:48:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27483.1711504083432381652
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Mar 2024 18:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b0G3u+Or;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38165489da=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42R1l3sh014778
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 01:48:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=V5ZWD
	SQqV4xHOEwgHhAM32GKght6igLmEovNJArpb/A=; b=b0G3u+OrMtO/0fAGs6oLO
	tZTyq6NFSnK+6Cjrq6/NnlPxnWVrFF2fi5WMKQz8aKPNqMmdqYXS2p+iV8OMGbKV
	+dvR83h/Z/NwL27ze5r5rib2Hv4nJhiK6ikelfd6Ij/HcDP/oSZ3joXCKq/cskrw
	M9DrKQdeUH9fYRzBt4VLXpjhg4omAIyJer10XMgibBiFRQdSri5c6bEQCsZUd+3T
	QdkZLVduN4nCsfdT9z9Tm4PjjZlo8STqD7E6Ou5tJe7C6a+Vmz8nKIwAxRNAg/eB
	w79RYGGsipSg7lfOQO7RczMx+XkpB9A65wdMf7sWcnf+mx0RKE7fSI/k/H/keKGt
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1m9xmndg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 01:48:02 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 26 Mar 2024 18:48:01 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Tue, 26 Mar 2024 18:48:00 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] thin-provisioning-tools: install binary to ${sbindir}
Date: Wed, 27 Mar 2024 09:47:57 +0800
Message-ID: <20240327014757.1817465-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: e_2FmS35Af1Ty8TyMr2Gp295hAWlRwKj
X-Proofpoint-ORIG-GUID: e_2FmS35Af1Ty8TyMr2Gp295hAWlRwKj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_12,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403270010
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 01:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109633

From: Kai Kang <kai.kang@windriver.com>

The binaries of thin-provisioning-tools 0.9.0 are installed to
${sbindir}. And it also set BINDIR in the Makefile in the git repo:

BINDIR:=$(DESTDIR)$(PREFIX)/sbin

Tweak to install binary to ${sbindir} and create link files there.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../thin-provisioning-tools_1.0.12.bb                       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb
index 11b5866189..09b91f6b37 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb
@@ -20,6 +20,10 @@ require ${BPN}-crates.inc
 require ${BPN}-git-crates.inc
 
 do_install:append() {
+	install -d ${D}${sbindir}
+	mv ${D}${bindir}/pdata_tools ${D}${sbindir}/pdata_tools
+	rmdir --ignore-fail-on-non-empty ${D}${bindir}
+
 	for tool in cache_check \
 	    cache_dump \
 	    cache_metadata_size \
@@ -41,6 +45,6 @@ do_install:append() {
 	    era_dump \
 	    era_invalidate \
 	    era_restore; do
-                ln -sf pdata_tools ${D}${bindir}/$tool
+                ln -sf pdata_tools ${D}${sbindir}/$tool
             done
 }
-- 
2.34.1


