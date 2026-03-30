Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C458FF493B
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 04:15:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43183.1774844120735918590
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 21:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rCsj7uwj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=854974d979=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U3wZBa013167
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:15:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=18ufU2EwJfqZyDCk3YWs
	bFac3DdZ4hPg4hVMjOTHR3M=; b=rCsj7uwjxL8/uWNi8VvlFImXMqlkD+Sa4iOb
	X9bfEETp4ylpO/WK9f5QPlFRTtJ5Lu9ey9evrLuRWVz+MkPsbXI20uL2ybfxb295
	c4Cs12BaKocvmwpXhjlSuqvomqfof8EuEvjlOgzmWx5BU+pmKSvRuiQHrAXZO9mV
	BSlp7bLUHZ0mlLAqMJvH8LhILz9vr/KhneFaqGo6/cPCKmG98PGS2ScTKbXvT+XH
	lioOHl0E8YpIajjmji0ggDkXyEwalI/BwRc9g+ll0ETCf+9cBFf5SDW7YqxpCGXx
	Ravax4TbGCtSU4Nb8Kj8h/U+mXZdbi3C2G5wJ2xNvnLHALhheg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6a8v9e03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:15:20 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 29 Mar 2026 21:15:19 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 29 Mar 2026 21:15:19 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] dialog: 1.3-20250116 -> 1.3-20260107
Date: Mon, 30 Mar 2026 12:15:18 +0800
Message-ID: <20260330041518.592197-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: TsQdgfSFVcLGPIK2ai03tccj4dh_K3YT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzMCBTYWx0ZWRfX34WJpl1HkW1/
 4LNs94bZx1Mdc4I4Z5+OLq/w+0SDDDvmjkb0/mki/fCq7qzI6RmUSt4126CDVRnKfWHUPeuZuvK
 lKcPaSBaaq5YEjhpvzdRR4O9PI23L5XtqQfGIwOirxXw8nFCt6CzcilDRLR6X8Rij6YGa4kmi1n
 /RJe9iu0MkpbTUvh/A6Lw8GwH7czY90JHoB9gNe7Y2jNF8PHKl2jihhWtGEaF419doNMFu8Tq4a
 sc+42+y3/6ntQWkyA4Gl2lEQcgaUgsKXi/qRHPc4E40KkgW2kCSDoEwR96JtC7F50HwildCY38x
 TgVUMx0CzlcpjBnMUyTfA2Z0n+lFe6YRf7ciPYU+FNmO7Vggkw8pvActaRXbJbNjmGTcVNAk40M
 p1eZPabfXpKkRVbUyHRaB34u1SW6XQxoV3hJmLTVg/ptIlgU8ofR5jN3rrDY1bkyDxo8YGrdIHG
 iFutEEdo/HZtGq+aBAg==
X-Proofpoint-ORIG-GUID: TsQdgfSFVcLGPIK2ai03tccj4dh_K3YT
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=69c9f8d8 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=goT8vtq0AAAA:8 a=t7CeM3EgAAAA:8
 a=7wmzO7fKDGGO4--SnKoA:9 a=R2Ji3J8RlHp2PMwqXl91:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 04:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125824

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../dialog/{dialog_1.3-20250116.bb => dialog_1.3-20260107.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20250116.bb => dialog_1.3-20260107.bb} (93%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20260107.bb
similarity index 93%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20260107.bb
index 0d09ccea16..42c0a8c434 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20260107.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "https://invisible-mirror.net/archives/${BPN}/${BP}.tgz"
-SRC_URI[sha256sum] = "68406329827b783d0a8959cc20a94c6e1791ac861a27f854e06e9020541816dd"
+SRC_URI[sha256sum] = "78b3dd18d95e50f0be8f9b9c1e7cffe28c9bf1cdf20d5b3ef17279c4da35c5b5"
 
 # hardcoded here for use in dialog-static recipe
 S = "${UNPACKDIR}/dialog-${PV}"
-- 
2.34.1


