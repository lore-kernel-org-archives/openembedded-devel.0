Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D54C5B552
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 02:42:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2356.1748572920751189740
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 May 2025 19:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8245d0438c=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TMCuHZ011289
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 19:42:00 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm5syc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 19:42:00 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 29 May 2025 19:41:40 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 29 May 2025 19:41:39 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 7/8] version-check.conf: mute version mismatch warning for dialog
Date: Fri, 30 May 2025 10:41:50 +0800
Message-ID: <20250530024151.4152523-7-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530024151.4152523-1-changqing.li@windriver.com>
References: <20250530024151.4152523-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=68391af8 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=goT8vtq0AAAA:8 a=t7CeM3EgAAAA:8 a=shQAPz1V2V1N9AN4nV4A:9 a=R2Ji3J8RlHp2PMwqXl91:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAyMiBTYWx0ZWRfX+YiQ+vxRDa1Q MO7Ja1S/shSQFrWNhelbzPPBe6PisvorhKkuryMMw3Lsv8PjSTAK+4qWdLQ7hLJE3yzqO8gwUHc S/fLtPstZUxS/wV1pAC0TY4cjnRZDpXaAGM9dL9+1erGKC6YT4yqbhLLJ/l6J/HEcZ+vi7SX8Ql
 rkZYtGTwFvbAcGnjyKt3meOFStNKIhphO9+wrFZgBTFuHGP5zk10aBaHVkoUKS3lcY3g0iVwQ5X IxV9V3tXCxXpqISeKqo986dEjUTSSMuHrD2BrCAsC9lJpby9CnoKhHEkWff4Tue7U2pf59t4wck CtaekM0oAAk0VZqZ/XgAoOk8VXulbbElqvjrATHKXMZPPczbKx4DrcLi5mdCgfDgRml4A/b0NI0
 pGgyVD67rMphWMi+fPAB1qwaqcl4wDNmuESQVqdxZ69X1N3AdqMh+k6JnniVvipeNj1dVcOx
X-Proofpoint-ORIG-GUID: kc3d1BsmmdxzFmp1X7_D3fRCAx-vOOZ4
X-Proofpoint-GUID: kc3d1BsmmdxzFmp1X7_D3fRCAx-vOOZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300022
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 02:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117663

From: Changqing Li <changqing.li@windriver.com>

Refer [1], dialog's tarballs released with date, for convenient, PV also
end with date. Change to check without date suffix.

[1] https://invisible-mirror.net/archives/dialog/

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/conf/version-check.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/version-check.conf b/meta-oe/conf/version-check.conf
index 72c38133fd..b41c9e8d22 100644
--- a/meta-oe/conf/version-check.conf
+++ b/meta-oe/conf/version-check.conf
@@ -34,3 +34,4 @@ CHECK_VERSION_PV:pn-libhugetlbfs = "%"
 CHECK_VERSION_PV:pn-pps-tools = '%'
 CHECK_VERSION_PV:pn-libusb-compat = "0.1.12"
 CHECK_VERSION_PV:pn-jemalloc = "${@d.getVar('PV').split('+')[0]}%"
+CHECK_VERSION_PV:pn-dialog = "${@d.getVar('PV').split('-')[0]}%"
-- 
2.34.1


