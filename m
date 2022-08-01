Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA89C00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 09:34:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.22574.1659346443265441655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 02:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VDGOZ702;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5212b3a2f3=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2719Tmmk028448
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Aug 2022 09:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=5jQiPaFcIGilgTud5/DrHvWGSAVV4MOj/D553gFBCvM=;
 b=VDGOZ702dve4qC22NcD7Rui5q7cG0nxGVRteepmc1Oht5BpF6W/Fs1/DQD3Cg7fN0BF9
 DBzD7YYlIRpKAGHz0xdVL5G0zHlC204J2OcRJn9pjZvDpkc/y2kgIVSlh/wXpwQndtUs
 Fn23vnXRFMmDd23HAtJMegCRLmfyGqOPWKiirFtdd7Fl5AqUtIUZQebKmhxnO+Kl77C2
 DIZKGTHeTMmgkB8P9N4bRKgF1nxuaGQcwmsco4j2G3bzAS6DGaALxW+ac56+IsXjrdz3
 qc5R89vrFgaOSC6EHS3JPuD/VrOk6MgCL5WZWxNDJgpxzpAlluo9sZQobbYNBHnaCVKu 2w==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hmsv21dqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 09:34:02 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 1 Aug 2022 02:34:01 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 1 Aug 2022 02:34:00 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] net-snmp: set ac_cv_path_PSPROG
Date: Mon, 1 Aug 2022 17:33:59 +0800
Message-ID: <20220801093359.3202504-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: DQwIripApeNk1buv9CNXuTrObQCfo71_
X-Proofpoint-ORIG-GUID: DQwIripApeNk1buv9CNXuTrObQCfo71_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_05,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 clxscore=1015 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=898 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Aug 2022 09:34:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98073

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: net-snmp-5.9.1-r0 do_package_qa: QA Issue: File /usr/include/net-snmp/net-snmp-config-64.h in package net-snmp-dev contains reference to TMPDIR
  File /usr/bin/net-snmp-create-v3-user in package net-snmp-dev contains reference to TMPDIR [buildpaths]
  WARNING: net-snmp-5.9.1-r0 do_package_qa: QA Issue: File /usr/lib/net-snmp/ptest/include/net-snmp/net-snmp-config.h in package net-snmp-ptest contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
index 5f887b886..30c0ce74c 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
@@ -72,6 +72,7 @@ CACHED_CONFIGUREVARS = " \
     ac_cv_ETC_MNTTAB=/etc/mtab \
     lt_cv_shlibpath_overrides_runpath=yes \
     ac_cv_path_UNAMEPROG=${base_bindir}/uname \
+    ac_cv_path_PSPROG=${base_bindir}/ps \
     ac_cv_file__etc_printcap=no \
     NETSNMP_CONFIGURE_OPTIONS= \
 "
-- 
2.25.1


