Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3619ED1A452
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 08:20:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6891.1728721206514781553
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Oct 2024 01:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0015263500=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C7pgP4030671
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 01:20:06 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 426sfghatb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 01:20:06 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 12 Oct 2024 01:20:05 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sat, 12 Oct 2024 01:20:05 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2 2/2] ptest-packagelists-meta-oe.inc: Add libtoml11
Date: Sat, 12 Oct 2024 16:20:03 +0800
Message-ID: <20241012082003.1599728-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012082003.1599728-1-mingli.yu@windriver.com>
References: <20241012082003.1599728-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QrQM3kyd c=1 sm=1 tr=0 ts=670a3136 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=5qBrznAP3dz6ixwHqT4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: tC27e0vkKmv6OJa3LABlPHVHZt7tYD_2
X-Proofpoint-ORIG-GUID: tC27e0vkKmv6OJa3LABlPHVHZt7tYD_2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-12_04,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=881 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410120057
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 08:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112826

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 565037469..923179a62 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -25,6 +25,7 @@ PTESTS_FAST_META_OE = "\
     librelp \
     libssh \
     libtinyxml2 \
+    libtoml11 \
     libxml++-5.0 \
     libyang \
     lmdb \
-- 
2.34.1


