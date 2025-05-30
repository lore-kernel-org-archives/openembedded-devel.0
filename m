Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC64C5B553
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 02:41:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2355.1748572916125026719
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 May 2025 19:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8245d0438c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U2BPHr022207
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 19:41:56 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u9d45yx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 19:41:55 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 29 May 2025 19:41:35 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 29 May 2025 19:41:35 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 3/8] version-check.conf: mute version mismatch warning for libhugetlbfs
Date: Fri, 30 May 2025 10:41:46 +0800
Message-ID: <20250530024151.4152523-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530024151.4152523-1-changqing.li@windriver.com>
References: <20250530024151.4152523-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: DXJOHo7kc0055Fx_mcaJ9NG5cmsNeop8
X-Proofpoint-ORIG-GUID: DXJOHo7kc0055Fx_mcaJ9NG5cmsNeop8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAyMiBTYWx0ZWRfX7SvOd6rJom+U bDVm5TEQlGh1emW9TVGGn2oBuixGMOkSRr0CVpXEpZhBCFd9Fhnb6MKbzqluVryxdLymMhYpE1M OYrn6k7w933df/DywinZDFf8DJPYrog00X8TSzBdJq2ffJM8X7BPGaN6AzerbfJYL5lbzsMYA2H
 5Y2Ii8+OFB5gFt5GMwOaXKyvCyM4AnzKm/3FNn+8n697tHfFClkaoBp/a6/bBQK3t8L510CBhKB vgAt+HAIHVrwENAcWr1jWNqFHjySDAkZ/ppBzuY7QwqMYyRJbpxluYwCu14Yb5X/uxPgFJJkeYU MsC71tkGLBO4ZfaKyfEvQFg/ip8ooRg0KKGx8stmx6sTVU87uPUMSdvJEiblTxg+7qoSzLYqGZX
 mhTX3OkqWlYux03HiJIHKtbNfqsbCpAeo9BoL3PdzLZ8JT1WksrieL+/UGk7sYqY7CvfEYxm
X-Authority-Analysis: v=2.4 cv=fdCty1QF c=1 sm=1 tr=0 ts=68391af3 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=WyBp4oyhKQAnnSnQnqkA:9 a=zgiPjhLxNE0A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300022
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 02:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117659

From: Changqing Li <changqing.li@windriver.com>

ld.libhugetlbfs --version return the ld version on the host, and cause
version mismatch warning, mute the warning by skip checking for this
package

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/conf/version-check.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/version-check.conf b/meta-oe/conf/version-check.conf
index 742ecfa487..8329d58e64 100644
--- a/meta-oe/conf/version-check.conf
+++ b/meta-oe/conf/version-check.conf
@@ -30,3 +30,4 @@ CHECK_VERSION_PV:pn-netperf = "2.7.%"
 CHECK_VERSION_PV:pn-bridge-utils = "1.7%"
 CHECK_VERSION_PV:pn-turbostat = "2024.07.26"
 CHECK_VERSION_PV:pn-bpftool = "%"
+CHECK_VERSION_PV:pn-libhugetlbfs = "%"
-- 
2.34.1


