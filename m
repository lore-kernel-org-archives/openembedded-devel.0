Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC53D12676
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 09:52:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14114.1730800355321901738
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 01:52:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1039ed3882=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A55awGW007158
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Nov 2024 09:52:34 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42n9a0jumx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 09:52:34 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 01:52:33 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 01:52:33 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] gnulib: Add do_deploy_archives back
Date: Tue, 5 Nov 2024 01:52:33 -0800
Message-ID: <20241105095233.887542-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=H7mJwPYi c=1 sm=1 tr=0 ts=6729eae2 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=omOdbC7AAAAA:8 a=enG6-LMoPoosSpmFjXMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: PUu3UcKAmyaMyF1RznaxL8j-n6UeS3yZ
X-Proofpoint-GUID: PUu3UcKAmyaMyF1RznaxL8j-n6UeS3yZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_03,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411050074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 09:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113415

From: Robert Yang <liezhi.yang@windriver.com>

The gnulib has sources, so we can't delete do_deploy_archives, the commit which
deleted it said:

"""
commit 32d29814278262005ef9bd691178c68b8cb1e000
Author: leimaohui <leimaohui@cn.fujitsu.com>
Date:   Fri Aug 3 16:32:33 2018 +0800

    Fix bug when inherit archiver.
"""

I tried the following build:
ARCHIVER_MODE[src] = "original"
ARCHIVER_MODE[src] = "patched"
ARCHIVER_MODE[src] = "configured"
ARCHIVER_MODE[src] = "mirror"

The bug should be fixed during the past years.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-support/gnulib/gnulib_202401.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_202401.bb b/meta-oe/recipes-support/gnulib/gnulib_202401.bb
index 41675d358..8f70cd7a0 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_202401.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_202401.bb
@@ -32,6 +32,5 @@ do_packagedata[noexec] = "1"
 deltask package_write_ipk
 deltask package_write_deb
 deltask package_write_rpm
-deltask do_deploy_archives 
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


