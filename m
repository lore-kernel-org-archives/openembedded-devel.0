Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4D3C369CB
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 08:05:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3720.1744877134566359218
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 01:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62023c0ecd=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H60XU9002201
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 461u2ma8hp-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7KYVtRd/ROf8x0zIIr7jqdzOJ9XpMQ1RJhptxCbs4Iw00W4KXqdsswDv0jhgiMa8BpdBXHDDGtPCBHSrBQKM526bmLW4hqqGNQmsVbkpjFgM963QTZBPROGeWPiS99X98+SYulj6YEFCxj3jyIKmIVbc/8icf35qCqBwJ9ZjPvWfNPwJycEGAhmpmJf9R91NFxljewK1sJgRY7CgMQHxHwTgaT6yMMVwrabYQcfWNGvFZCYBUi6QYgEo0Vkvje3t8+EciDL9wtzTGb5g3fqL6JCw3q4xVo4epBFqFL6iiYa/cpiX6KFloApsu+P8R25DxJsq4AWT7taRXI3NUaLkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPsB2M/HYybYB6cniRFaJG3QV2fSg2bX16HOxlV8tZg=;
 b=xT/hG6Drp9hufu4/Sxgk8iuJQmk+hox0jwOtmS1L++7RC/R9HTXTCcYoq03FU74QuDkzcVfRd412nxtAE63mv8vCzEzUNbZpyZMfzPbqG3Y1oheTD49zErgmOesigEDgCgNaO1IJhSZH99ylJYfcaJa9yortuHctxNefeoEy7b3d8ljVl2npoLveLxUbTYjwWqSjQAlvJwlE1acGgeoGRYAjg5rdgE9OaoUACme/9GprBEi+osZ3/UUYKJrttAtSPf9zo9Asgpl/o+25KNnY9iayd6fqXek7nrY4Uxz7gJMIAIXGO7VtnZAxHDDX449Su+gxouJZa3joaooc0Ux8Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 08:05:30 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 08:05:30 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 7/7] check-version-mismatch.bbclass: skip go/src directory
Date: Thu, 17 Apr 2025 01:05:16 -0700
Message-ID: <20250417080516.3158818-7-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417080516.3158818-1-Qi.Chen@windriver.com>
References: <20250417080516.3158818-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040A4.namprd05.prod.outlook.com
 (2603:10b6:518:1::53) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: e6b5998f-96ba-4ed8-a38e-08dd7d869f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DOqjL1KnzxC04WhdHOctcXMm9O4mfUZL62xA9ohdsHz9y1SGkIox+Wr1L26A?=
 =?us-ascii?Q?QzIyxdidQfXEJiTiMEyEou/mCsEu7hXdyKe1un1i2ug85ziXmFyIBVoc9lfR?=
 =?us-ascii?Q?2FD0Tei1KThHW0I3Xd4y3G/PMX7m6p/NsPtd4nIppJ4dqA+Huxn64o+enPw5?=
 =?us-ascii?Q?bdtLRgbTOv4KB18jV9OlYlE58Az1C/OrNzuAz0/VqY8Rn3jWBYcGEgXOLXmt?=
 =?us-ascii?Q?5bVM3yg4xtplb8YcOZ6ur3KEe0nevfkypJgFMeRs6M+S8yew3/w97T8Ib0Hf?=
 =?us-ascii?Q?aygDVx+C2QUWfsK9WRta5ALRBJzArr+iuJBUeofw9f8f/NZ16tBoUqszsBXD?=
 =?us-ascii?Q?wel/O9WYJ82VmEc+kuMGCpYskI8kpR6Z5pMqOmgzz0x2wDf5xa6fuD1lKmOA?=
 =?us-ascii?Q?swO1qsaKidQKiXxopgXcrsUmdWCUj7Sit4GODNNIvbaeADb0+f3TYn0oeJbK?=
 =?us-ascii?Q?upxG2m2mhwychudWE5hfebI3wCIfNo7vgUo1n1/Q4ujMYojyesBv+ThbBN92?=
 =?us-ascii?Q?AdvPGrrfkbeNNJgStJRY2VRI+xlkvWD0tKX6EJ+n5oc5L/3LVnf6tt4dZE1d?=
 =?us-ascii?Q?FshTpJKdslZAyOvxZq1J3t+nwJ4oaJzVNFPG9gqxYvEbFjNPP+oIBCd5NydC?=
 =?us-ascii?Q?ahLw0f7jSjdPobRCKNr/Uk0u3ixFm6P8SykTBlB0np4izrXHhf953cFRUQHt?=
 =?us-ascii?Q?Kwcveqbvikvu9RtnJLKIfIlIj1pzx7B/jIPEeasYwkM2fapgzu0hZXIAO0K8?=
 =?us-ascii?Q?WLHhu3NXwmsZzjVEy2OuCJESn2uHph0DfS2DIIqpOW5v+9BjUuan3KcAuCM4?=
 =?us-ascii?Q?90i6DvKkRs4FCCF/o/qavWEkrNE6KotCcwOkS1nv5tr9Flsnx8IhYaQAmZ9y?=
 =?us-ascii?Q?QlNFXec5fGfThni/O7hQioLS8bjnKATFWlyCkpD+Hytkjn1zJu+25YaWYxHH?=
 =?us-ascii?Q?E14+0CfNwWtll1lRIcLgU1NKS8363PhWlEH+hP1qlK7Lu2aK1aZjKOIsnagF?=
 =?us-ascii?Q?mZJyKkoJKTPEYAeqWgzF5ObmKOmidtEaWjbc0rRJUCC/QhX+fY/Kncby2kFP?=
 =?us-ascii?Q?PGpZ6LY4kH9IRhuNyLlk2iLRkSyiq6O+PSSC/8/PEmjvMh8pdyfe6HdjBH0q?=
 =?us-ascii?Q?Uw88jJUEUIsAnFT7gIEPtgNy080XzXsyqg3SLcpFIOAa592R9RgnRoneY3wM?=
 =?us-ascii?Q?O9pmO+/0YdQ38i2mWJBbZzVaOU52/7hawqN6HsDr4me1el+C2aAAV/Ck8vUf?=
 =?us-ascii?Q?7p8omV7qfTRH6zQg5TlUb4+ZI3/O737mLEVUABLTxVPjUbcs8UicACGrdAHE?=
 =?us-ascii?Q?tPgg5xyfXShgC56BxmPd0AVbV1pxhyJCf8MASEx1m/1pRPjlSGheKPwuvBMT?=
 =?us-ascii?Q?wNL5QzU7/FpWcgbKieXmQBEj2U33yV8Qh8mGS6bbHSgZiRTJXc1IZj96CfYL?=
 =?us-ascii?Q?qUKM1CG5Tao+0pjmQt7grtobHvWc8qA1wZAbbFAP8tPP3YAytEmyNg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NNVKs+C3MYScPR5WPRn0fYrFqSrMM1HZxzmQ5k/SCi4nRweCKtYQlCIC2Vf4?=
 =?us-ascii?Q?27W9zmGrHj83VipLLZWYk0hX328JVBUzA99WJaU8PYdbcOhed72VON4X/nCD?=
 =?us-ascii?Q?MEDRbDs/Qpr9MV+8dJdGZQ9d1Ik80aiCwCKBCPsygt+f7LbJFoFXLK1r9Dx+?=
 =?us-ascii?Q?AlbxbSduJr3bvzkGBFqp1p5vQUcqHTreccF431jL3g6SmMLRy0t/Yuto258t?=
 =?us-ascii?Q?MuwnXIWENZkZGrdqhCrZsYyT7OlWcgigp6iusnztrZqpDIK+mCYsF9a1f5n6?=
 =?us-ascii?Q?fbD/YN8JkyhKYPrGWRUU6SZhtA17dSt4yCCRjci5NuPlnVTneMzg9wRLjnwy?=
 =?us-ascii?Q?P7ZfBZX7v2CQdDO94dLS6J+RCNDBKj1PqEdTaGHOwEXKXkb8x89EXb0aMpTT?=
 =?us-ascii?Q?eyNsZ7Vf/MS1fF1aeX9qTUoxan2n+3hKAwjPezcrxJe/ga9J5KHFoz0qNRO8?=
 =?us-ascii?Q?IbVfek1a6kzXCo9nFfiEeKnO66vPRjpjPz705toPHkdOB1v+Ospkq5UTISLB?=
 =?us-ascii?Q?SbqbCJpNPFOnH9nFXsl+RKSCVkmGUM7EtcAqW5LZjFuCLpU7c2LX2AR6ncCV?=
 =?us-ascii?Q?fE/dGbAltLD6kADgVjj5lSA5vFVnrgfI2Z9DU3SwcUrxeC8+thSykSIKtdPo?=
 =?us-ascii?Q?OwHYx+C/Wdhy+klaD/cRUYn1sNgmPW6tDsryRgG2XmK8LWk0VNFHPovNM/56?=
 =?us-ascii?Q?Keam/P4OHjRYouwl8pGIMqj7ONe9WHKfBXvluRZ7q7JtwOQqP/ARxQ2Qa2wU?=
 =?us-ascii?Q?kOSvxN7EPNgUl0g+lkbmbe9DwcwWQRl3Yr5xU82t0yNgen8GT94fqiebaa1U?=
 =?us-ascii?Q?6f+vouoC7Etty02I2Zj5/9qCnzuRQhL5gAHUH7GLGryPIpSSVIaZ1xYc5ABB?=
 =?us-ascii?Q?TXt0CQ5ansZb8gXhpjR8Tma89YZ+KmunCjNCZ796OAqAF1uLj4LajyyABS5Z?=
 =?us-ascii?Q?uxhNgVvGw2lmR/2+KrgYUKg218THCr++Dbsp0ER0sLFPkb5C8tPWBg1Fobo1?=
 =?us-ascii?Q?eRxRloDFj6fUQiu98HrNZrDC33FeHaq36Xfqx2AWE1UA0EgFmUL86tS0SY63?=
 =?us-ascii?Q?THkRUBgxW9rmnd2n0jagihCMRZitKJ/ZWNHNZVBXWmvLFx9SDjvUUwj9VlFD?=
 =?us-ascii?Q?OhgsWFeRyuaJnUZFQOa19xTYXuC/OV0pHgCYiUvOZuSAarAvCQO4LpEXopNx?=
 =?us-ascii?Q?FGS6r5l+3ldb41BUni1oT5e8R2TOZaLizb1i1rxn+JRfaGYm9ILuCPo6zUs2?=
 =?us-ascii?Q?viW3uK3PhIcYBb9PcMKMfBSUeCj2ZveG8Nwl+KAlbdVGQoYxHhJzhl+LLzww?=
 =?us-ascii?Q?vG5Re0k5oqJC18he5ofBNqtzI+0N81DxPYopFRrkJcgzDMSz6Y7hG6Z69qzl?=
 =?us-ascii?Q?pq/rcrz6lwUTOM34zQUE1R21Y8vCv7z69uQn5FOT+21hhNuRiXHBirCy0Sc9?=
 =?us-ascii?Q?+jo526ZBhFakWHpKwRUUiZWutl2tMHSyaNA2ZXmRV8ff0nZ2aQqcSZwiVkRT?=
 =?us-ascii?Q?GKKq/PHYCDOfB1bkx4UdFbTGibukV6j71C+5n9RslK87vfK2VOBtXAw8LLaF?=
 =?us-ascii?Q?kPW2lr4oZnAbGF7rMckEYLayy+RbNdE3ib8/pn55gZKOE9IB6XW90u2EIltY?=
 =?us-ascii?Q?Yw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b5998f-96ba-4ed8-a38e-08dd7d869f0e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:05:30.5582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfNDwh7k7e+FjHX8YNRx1/cQ5D2pvQRfIqSFYkEg3qU/pxpkVp+A5KXuMujWS1GF2+DKMw1hV9AxQQTWo/+Dvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5163
X-Proofpoint-ORIG-GUID: CxuGm_K2FK8cVoSp_Sxbk3SAZyc67q58
X-Proofpoint-GUID: CxuGm_K2FK8cVoSp_Sxbk3SAZyc67q58
X-Authority-Analysis: v=2.4 cv=BaLY0qt2 c=1 sm=1 tr=0 ts=6800b64d cx=c_pps a=S2IcI55zTQM2EKrhu3zyRw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=RuCiCPKGs8-oma-v32oA:9 a=zgiPjhLxNE0A:10 a=zZCYzV9kfG8A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=992
 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116926

From: Chen Qi <Qi.Chen@windriver.com>

Files under it are source files. And if go/src locate under
/usr/lib, this will result in very long LD_LIBRARY_PATH causing
failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/classes/check-version-mismatch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/classes/check-version-mismatch.bbclass b/meta-oe/classes/check-version-mismatch.bbclass
index da99feaf3f..e83cfec756 100644
--- a/meta-oe/classes/check-version-mismatch.bbclass
+++ b/meta-oe/classes/check-version-mismatch.bbclass
@@ -313,6 +313,7 @@ python do_package_check_version_mismatch() {
     # avoid checking configuration files, they don't give useful version information and some init scripts
     # will kill all processes
     skipped_directories.append("etc")
+    skipped_directories.append("go/src")
     pkgd_libdir = pkgd + d.getVar("libdir")
     pkgd_base_libdir = pkgd + d.getVar("base_libdir")
     extra_exec_libdirs = []
-- 
2.49.0


