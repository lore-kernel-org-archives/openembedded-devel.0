Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88515CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 14:35:44 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14937.1790778942785428518
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 07:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=fuYsj0SC;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=e78Bmr5m;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1WK43890166
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:35:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=LkleuKgwD8MdX
	LE4vhaWjA60gQbHgykBxVBiDQqyISc=; b=fuYsj0SCXkRGjD63+OlyN4DHReRfw
	VXcldB0F3v+DFNMW5XZPJD6TgsYAcD9dnLCOYUv3oAEkAkoMEbYuCQrvWYhbYL+J
	myEVeiWRuF4jMsHgEXuJOam0oTK3M9Nx+TQ0/5HRdSH3gWr0JcSCna2MswL2kxYD
	aVAOGbj3k5MLkfQ8PKr42tQOpe8zuPxjdPYyPpHA70nUigx8kGLGP/2idYB/iMLK
	elSMXhH4c17Dp6G8rebw6/7uwxhftpL0ILa71OT1jB3Gf4NdsQfvWP7LQcM/ANzB
	YH2qd9sSEkr+5xl0LXlwWx0oqD6GB6gEe9987CDbGUjLQKDtsS2Jt9JqA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011009.outbound.protection.outlook.com [52.101.57.9])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s21dnq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:35:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1YcctkAyJ5TajI8dVJi7Vy6aTLBPXnZL/kCqGonQLVMqWSh6gp12/G0Jyr3X80GLEyuxuwDODgqx2Gw47OsjfRgHHYTPRCBjz4hbBtyUBv43mLh7Q8bgb83GhF+oKPpZngjOwnAE5mbNJsSWgdyWLn0N65WzzvjkDZn+Q/3tMXWVmvapnoDxSa8CYCn8t66aADLugnU8RMXa7ZYRGq8vtSL6vk5oAsqJk8RsnCsI+5Zr7Vp0FZ479LRVh99C2DL/s+G4Vz35GVPTCtusIz1u1VsACWEq00v3Vvo2iWmbfR6t1mBMIzCp7cdyEBvNDK2FCy9v+Vmdbq7WguzvE7MXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkleuKgwD8MdXLE4vhaWjA60gQbHgykBxVBiDQqyISc=;
 b=ZvV5S+8cp4PJn87D6RxzRuS+RWv8aH1r0NIE59TumgAoEUbHGDB/m6GP57SriSWztvCKNQAGz3rjIYx8qRdc2V0Ov6aAPOjyOoRQxqdmuwgbUN5jBKjFvNS15+kDhikJQl2m7l+gRPjpjzVBN2K+VwV9fatYZmEldyGmLijAsp7oHdhJRfKQXVyJrGJtZwB1T62FAzvgPWMFqS+w/46zaNX6jcgiYlEuiFXNxNyvDdLX1zB3S2g6HLzBz2dZkLFzRz/7NwNETQ/TWnwxzLhZF1Gc4DlVcSmUXDEnYj3SG9EuhAs8TAUDCeSWGNV4K7+QCdI1LOMemkVU8X7v/qQw0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkleuKgwD8MdXLE4vhaWjA60gQbHgykBxVBiDQqyISc=;
 b=e78Bmr5mZQBe0RYvE8fq7dI6uC60sLvrD3yDe0IbQw7SK4QfEk6p5hAWGERBjRJDFAlo5YlQ4eecuTyQ9TbTYhn4W2VDKV1RNF1tKS7P1+EWsNmrp/Jhl5tZz/6eD2DKFGp8+fMw/fknfqTcBohYfj+xFIKU+6Jv9Kn2UBYDhek=
Received: from BL1P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::27)
 by SJ2PR10MB7059.namprd10.prod.outlook.com (2603:10b6:a03:4d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Wed, 30 Sep
 2026 14:35:35 +0000
Received: from BN2PEPF0000A991.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::96) by BL1P221CA0026.outlook.office365.com
 (2603:10b6:208:2c5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 14:35:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000A991.mail.protection.outlook.com (10.167.248.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:35:33 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:34:57 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:34:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 09:34:57 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UEYvrs3298440
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:34:57 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xBvOb-00000000jjg-0sC3
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2026 09:34:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 0/4] netfilter: Move protocol=https into SRC_URI
Date: Wed, 30 Sep 2026 09:34:53 -0500
Message-ID: <20260930143457.175793-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A991:EE_|SJ2PR10MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b01615f-020e-4543-c019-08df1f0015ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|3023799007|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	cvYpYEmQciUnOFRoPfXQTFUHdXq6d4uwbIzOvkflHeUk/ODm9DAlhq26DCDWkeEfnnIAsjnVNVrfBo7Y8WuAeHkpfmzEdk9MRJtkkntizalRPIY2iH0z0oJwDhonTfMeISTlj0dlgPgey9xQ1fReeWgP42oieAAemjUOvSX8Mq8aElWbY3zqKgI9r2Q5acbbpuaPEcKQTVdnWrRL0QreKQzX5YkE7Okygk+8qClytqmFXYyqA/IfoprokuH0IGEru2UeATRqK81MLy8+jhvxhIHe54iWImPFlyHBZlonmKTbvScJtNkrbeA4Ob8twEiZkv8QQsgolQEmaDb4/SETUbggc1Oz0d1y/QHm9+VxlYCS/9/ROrAEiAHVxF0CNtI7LaTtH02hRr/ieiHvGt+ThUGewWWyFZ3zQXLlpG73VMDv2Xw7Y/ezl+YZ/fcfrj+xqRT6hARKypXMgp5WmhWJVbC2npQjohC2tribeJH8ZVvdFuaNHe8N5FqJ715JorqwN4ZDDR+0vwLiKLkU2YJavLn/JyjLdiAvwWv7MO4JKbDnLo8NnLNs/D9GTwKxgV/doA5fSBnwvIXrfWYFwycH4AjoA6mpb7QbKVSZmonIsNWAZ1MUyo3oeY1RKeu/y2UO+1qpEyhtAoq1cz0QMKRk17sJALkRYfg62eR6eiEQFY+HkqWgrva/VPgtjXVSTRVVK3pEmuUTAMuPQ0Z/GjxnBw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(3023799007)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+3BAMS5o1bySO4XMKVVNx45jKyEmvLYftVbTNPZRe/CwqZPKyNZ4eoa/8YyLKIZFzoMC+5u5pw1Hbl58nw8Iq1uV0SG2/O86gdSxI4XfMxwzunDKH9QIEHNX9Yjzs1aA+vgSSGRdNJ6xnzgECmS79yYeUinILOgO0V4m5vghySrluTHgHSShOjb0v0Fyj8Q5htdYbX38SuV6cTQ7wMF/dxFNzX0FL6cP2+1MnzVBaXKJt7SYqFHaoI2x/6Cuy6OIucRNdn2xCM0s771ivPd2lcFpxLdK0OsnqsTlsMQUbJEysf8sWuGHtkUTze2gXDSdWKxEAu9UBnkSWPFNmF5cvFsR7htDsnI+NHKgg/g+jw+yRgfU98mp91MGnuanH6BOrlo+z+lASOQLyc9XRLJp9ehEFhRUJ2zxGTovOlYFxOMWDWYGy887zAN/cdXeAztq
X-Exchange-RoutingPolicyChecked: 
	tcD7abJksNP9gseNoS/hmVnELEnJlbPtGC/yPiI2LfsRtWcnY6YgF0CjmCvjfMu97joFgRblFUsvvYJ+BXlh4GmuQyyPJo+2WnmKRBJzDnUGy5NwMDsqxVyBOiV9JfIJX9xlpjbTFQPtFbWVTXEjRG9RSmDz3fOx37Ur3OZiRC/ju4ejCaOxEd+DW2Os9cT1b2LmyUeqBl5ql0tOJxz4qVaFXoQqiY/CR1HpDtLn6VBAOd5jow6fN0TVB/F0P3yadK9HyEMTd5s8sjaU6T1pC01jd1ie2NKKtSvwF2+hz+PhmP0o1XztkHxMqKVo1yymcgImASDUCMLYzVfMiDih+A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:35:33.2710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b01615f-020e-4543-c019-08df1f0015ab
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000A991.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7059
X-Proofpoint-GUID: H-brAXXtPStE0biZuE5xnK3WLEoKEyZp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfX7g65etTYrOyc
 O7Z7+qwE4+EYIUjpPSy9aVkU2rXYjy4m9Ma/QZJodbQoUVlCwNRxCTT8m0AI8SwojhApLbzUWBO
 oaexe6YT86jX59Z9wfYpGeu2ZvEkbdWL9riFqHuaKYHjSIRqFMhomp19yfUiIrJLDo0bSO9VCfZ
 Frw10Ah+Tt/Uhd9is5mfOYZnV5ljXcomzFyuZapl6qn9yBLGGFhN5SzjB5oIt4VVWJVDa2Vb45K
 RwaVimNTogu7XD6+QmzVP+Nk26YkK3fy0HrA07HenbUZDXPRsvdDRsewin2G2oSqEcfQavfIJKi
 jfzaFofU3+C2/1Zeh5/OuN1A+RDEx3oZWMB9QB+vpCy6FiFDuxYKJdc7vVUBa8vK3bW9vuYVwXt
 UY856Af+ATVx4JsZqjoViueWpb76nBQMpfuqgnfke8XeNjQ7mfOY74G6/BaLai5IeJuM8vsbXJd
 3X6e2fvtcbReMskFwlQ==
X-Proofpoint-ORIG-GUID: H-brAXXtPStE0biZuE5xnK3WLEoKEyZp
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abd1e3e cx=c_pps
 a=0F+T9beUwIReeq27KEkavQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=3HDBlxybAAAA:8 a=fQcogE27grhXk44c-3sA:9 a=laEoCiVfU_Unz3mSdgXN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfX6uOdBMhsIVG5
 6UeILBV7ewYUC18vfzQ6yTvBgBSHC25sTsXU/k3G856R7Q2Z0VXFM6+v1DR+xGiZoxGMcp8X7oV
 wxTGTgtYG5SGlSekyYBON92qqFItExw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 14:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130529

Move the protocol=https into the SRC_URI so that both mirrors use it
insteaad of the git protocol.

This fixes a build error:

ERROR: libnftnl-1.3.2-r0 do_unpack: Bitbake Fetcher Error: UnpackError('No up to date source found: clone directory not available or not up to date: *snip*/downloads/git2/git.netfilter.org.libnftnl; shallow clone not enabled', 'git://git.netfilter.org/libnftnl;branch=master;tag=libnftnl-1.3.2')
ERROR: Logfile of failure stored in: *snip*/build/arago-tmp-default/work/aarch64-oe-linux/libnftnl/1.3.2/temp/log.do_unpack.738
ERROR: Task (*snip*/sources/meta-openembedded/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.2.bb:do_unpack) failed with exit code '1'

I could not find another example of including ;protocol=https in
PREMIRRORS.

Ryan Eatmon (4):
  ulogd2: Move protocol=https into SRC_URI
  libnftnl: Move protocol=https into SRC_URI
  libnetfilter-queue: Move protocol=https into SRC_URI
  libnetfilter-log: Move protocol=https into SRC_URI

 .../recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb     | 4 ++--
 .../recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb   | 4 ++--
 meta-networking/recipes-filter/libnftnl/libnftnl_1.3.2.bb     | 4 ++--
 meta-networking/recipes-filter/ulogd2/ulogd2_2.0.9.bb         | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0


