Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BD1CA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 14:35:44 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14939.1790778943688962292
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 07:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=omycUEO+;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=F2NaNITc;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1LMP3057461
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=nArWYoKT57b9ggTDywZpmR6aNBx0DfrT7yhUKVxdE
	k8=; b=omycUEO+LJfNrIypX+Z6W6Ynur/Tj25fO14SJMBjNWkNGQfxMQnUbqgwS
	3AUeVrd9SRwsEZuRC1Co97EThvP12YsUUt14dXU26fUjIn0h2Lcu4B2mHKZd+5yY
	M0NOuljfeeog6yybf8SFcth77s2Du+bC1T6ZC+xC7ExrqJX4vBh6UN2N5syaKPcN
	BvZ/bx71g+rmt8MIvK5oNwON6GmN1SkiqzZyOEmosXdQTiDY50NRzvFc3+pvyHeI
	4ig8jai2LNiHgvtPEROHlosyHBcV7rapY404m272qABPpd13YRoSXKoDIV+dTJow
	Pu9zqBMER7s2yVYZfMcycr4iDzYhw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013051.outbound.protection.outlook.com [40.93.201.51])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9fe03s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:35:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/sDXsCvDnXjUfyCM28QxfEQVG2YXaiXwzUkBSvwggafzQbYHoS8kBEaqyqwx7gp/oZLVNQgCncy0EkVxS5GmfQn3vEh0PSDKvhusMZOTPQNkWgadp66wPH82gRC+VcgwfxXCd3NOCVSpe6Xh9C2aVodraL5nEFd5/M0U7jsFBdTvqI3iswl8VLtSuzQHkHTSXOeRzEfQ8PMR6F+r5ninGTVeYdsG7RkFBK1M8+5yqlH43s1RQHsP2utoYSF6aIsOQ3U9jvhy+43IrzWGvq42xH9tdQLG2wfQeyMS2nf4BYmM92fZEXk8BirvIFseyWpvs9hl5qe+dN0h0ZR5Q+zNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nArWYoKT57b9ggTDywZpmR6aNBx0DfrT7yhUKVxdEk8=;
 b=cfB3szHKJXHAs0oxXRLsjOGwWZruB1O+7wiuHjV0cRhz4ygGQJyqqNVhltcMsAIfG3+eiVqHirqECatqAAu6ebtpUMbm0guTGPxhNtNpTdoFZAqCOjAPFXDMbjVuiZg5aUWkTfc8T7nngYeM/pt/h1L20Bytkjhuasi8iNJSGJ9gdVBT5vARrvFgz9++P9pdqPQkVif9V3LqlMDcW8BsL1NzpCy7TXhp6ADkw50gqjh5IyxZJY04yY00J25nJU/t9pSIKuRMy8ObBqJ4dMOcE6ekw8uHl8mebNBmww+U2bhaeD3xrWrKRsoFNj7M+344JUBt0vACLBfIPZ5Q3zjHJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nArWYoKT57b9ggTDywZpmR6aNBx0DfrT7yhUKVxdEk8=;
 b=F2NaNITck871PksQim5aXjwwIjbcgdZrDhkIbpA6TtgEJ9l+SCQarTozzGXntlas1OYOSCb9L4IADgWMGryCUmrkUZzR/u5mCaa98SgBQPQWMYd/QAoYU3kNPdIRFniixECmOx1Je1wOeG/Rxd6W/VCLi99mzJBJlzOk/9qatnM=
Received: from BL1P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::12)
 by IA1PR10MB7113.namprd10.prod.outlook.com (2603:10b6:208:3fb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Wed, 30 Sep
 2026 14:35:37 +0000
Received: from BN2PEPF0000A991.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::90) by BL1P221CA0001.outlook.office365.com
 (2603:10b6:208:2c5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 14:35:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000A991.mail.protection.outlook.com (10.167.248.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:35:35 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:34:57 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:34:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 09:34:57 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UEYvXE3298444
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:34:57 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xBvOb-00000000jjn-12kK
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2026 09:34:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 2/4] libnftnl: Move protocol=https into SRC_URI
Date: Wed, 30 Sep 2026 09:34:55 -0500
Message-ID: <20260930143457.175793-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930143457.175793-1-reatmon@ti.com>
References: <20260930143457.175793-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A991:EE_|IA1PR10MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: ff3cf298-e517-4251-3792-08df1f0016f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|260925021311599003|260925021911599003|10067099003|260925022911599003|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	MfDYGxFFunUrLNkHCuzE+HTiL7TCdx2R/qe04OsPnWWkTY3vjt0qpcX3g9WpM1Jsk2zAWk9eCDJXcQM+Vcz4diuFG9YaBslCALEV2P5gh0m7bYnTEoWdMC61tMQLf0uL3AFUCsRzl6gMUPW+5owTbqufxG/rbXxfBfM3GP5sRXjmo6MfihnWX8ht5dukQI307dw8Fu4LG1Ttp240L9D8Ynahtio3RtzGNe12Jzh1wUplXtWt0rzHj2c4TSFugx8ijF/nw5qIp5RU2hTRenRQU5V3meiD3zrr9u3bdbWztcS1OPHbbWE2bBPUMTOPlVZ2NUfVUMnmNoW7NmhuZwtvh7pspdwoX8shzj+eu45R6XdSRYpyvexwB4vP/J31yy8AUhJJy099oq+ZC3mh3C8AEtOPbDVPMRa0U8VzAHGuno4MlgZTcgW/vJCHMm8dudWnRtP3MA/qr+aOT9Lwze3YOJek2rQg7Bj1IMbsm2sZxAhSntZ1qYeZYupkE1CWMWeZvjdkToDMxmHG6sUZbldt9EypZiHw9GKqGtfxpoIexipPmfsO2WlUdT36QCAmuqUBknCWVqg6DqWS284/snQaetcdQbhK3xDEgZLLdc6zzwOQsBspJOhKlHjP7pQxrQdYaP0i1pTy6sj2nmHNBDSqRA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(260925021311599003)(260925021911599003)(10067099003)(260925022911599003)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Uzi9AQky5ao4TA6RY6IRZz3jEoSDUn3iLfQDdzHqzr11ffF0hnjDW8XdqfGHPjiHCS0SfvmLcyhCZoxVdyaDSClwksVz+6rloVHzXH+4s2TbRi3U2WWyGh7Ce67aJfuHl1lyPH/Y10w15V7wnLR1j3b7NfBkCld1IOQOzRMuYsvWvQM3aChr6fCURPjTzKQESwDiAJCmGkiv/QYC7qxJozeH54WaYDVH5buLtNv9zzySCF/G5at3twpf1aQfaoCgFFGdONhNvtpovH1lDUsx+Hd+JtHoxFTzrlwsi7S+/uYBZ4EuEfR9terMUehG7Bm11qeP025wkwUar7Si7jJ5phFX7c9hR/4/o6UJsB0Ghy5dAstQzVPFKocIKgXJy9+5paFaMWJ1hhxinyNXYh2ZgRgIso5qYcnvxqlzrTY0enTT8sKYcHyWtc/X5WLRDIhy
X-Exchange-RoutingPolicyChecked: 
	4jaitX//su1r+/L/leug1M6XlyVXVR3gqNZVwW76MCsPFOHGRmrPJlBnEai7OLYbAOULw+V+P1Fa2gTbNVC/AwAMgYLaOQVoLdIE/ezIDUqi4G//yS26QgPlCExuqXYkgjBHma8tZIvWXV2GlB5QyaM9BWxKLPgJTd0JbTIKsYHNGrX84L5lpEG+7ch8ZmLU5HYT/QangLHMc9dpBqPOYwd36Pi/uemy8dcAQIAutJurnxlWlGoB49RS1qLXVx/n/Pkz8ifOofawf9i3YUc0nhQz1n5arUqDKtX6S8KKSkEADIO/GtZ2/Oopqj/6TCxcinTZovrzl/cdAxaEXKkpoQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:35:35.4076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff3cf298-e517-4251-3792-08df1f0016f1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000A991.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7113
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abd1e3e cx=c_pps
 a=xsj2MuQvL1s4LVRwU0hgyg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=3HDBlxybAAAA:8 a=sozttTNsAAAA:8 a=MzbIncJtP8FWr-6l4TIA:9
 a=laEoCiVfU_Unz3mSdgXN:22
X-Proofpoint-GUID: JIK8OG1phvLJ3QXzs8ZIp2g0I0igDDN4
X-Proofpoint-ORIG-GUID: JIK8OG1phvLJ3QXzs8ZIp2g0I0igDDN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfX0PxlaOWiTXtZ
 kd04daUWpiDMKaReU1YsEjMfgwgCV1Wp/gE6GWwNGFnNjzWLfBNerCcDHzgvBLpKyryl4Y9L3i8
 Ys9xQ8a6pca09VutXxh2jvwd7B+kEfErDqWya8lSJ0vcNEW/EBEggiCfSacYFjbMqwP6THkHBZg
 26PQrwSJfl5O1zUKZ2c+V9mTpmM/vDGisRp7DkrhDi6EZab/NyVyZMAqnebje1kUMh12o7zM7z1
 Sx4bEgoMLJcTP12BtwS+2m88JyIYBg//3TY3hw3VZGHJ3pRvf1QdSwmbL7eGaSBzsTbyoU5u1E1
 Ft3Vttu4/GMET6jR05kGmZzkhWrz7BAY/OVcVf13AX0QmCUF7502e6Wld+EsR7qjhDublrBL7pX
 MmRRenSv64gilaxtyNhAsi4l69om6i1eesuSap0nvt6rdyh0Iz9Vw/rbiBR4+QaQTXGm1teaPEX
 3p2ivIY/r6IIwfLBcYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfXxlmfFvqQX/cX
 HHJVlLWek14jSsLT6u22bIfdx+jK+Hz79DDSi6otSi8+by/FS6lBLOSPdGHUtHzud23GAMcsnIj
 vKJPGSw+9aq2PNxzCrJ39myK0rar0CE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 14:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130530

Move the protocol=https into the SRC_URI so that both mirrors use it
instead of the git protocol.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-networking/recipes-filter/libnftnl/libnftnl_1.3.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.2.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.2.bb
index ae72631d08..a26f7216eb 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.2.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.2.bb
@@ -3,13 +3,13 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 
-SRC_URI = "git://git.netfilter.org/libnftnl;branch=master;tag=${BP} \
+SRC_URI = "git://git.netfilter.org/libnftnl;protocol=https;branch=master;tag=${BP} \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "
 
 # See https://www.netfilter.org/mirrors.html#git
-PREMIRRORS:append = " git://git.netfilter.org/libnftnl git://repo.or.cz/libnftnl.git;protocol=https"
+PREMIRRORS:append = " git://git.netfilter.org/libnftnl git://repo.or.cz/libnftnl.git"
 SRCREV = "3d7184970506df2c09868dc6ef3c21aba383db63"
 
 
-- 
2.43.0


