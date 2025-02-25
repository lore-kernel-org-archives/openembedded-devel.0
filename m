Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A36C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 08:00:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3441.1740470426503475082
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 00:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41510be863=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P6kFBo029523
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 08:00:25 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y3t2kc6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 08:00:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8I8sXHJz7cv7yvxjS/XMMe85m1kSaITEnkv7NCInP9ST3/F6hs3TdIvJwNZMpFM7vE15ZyXa+7Xyrz2ZPAVDjaPd0RsK8qxVx3j7Oqjt9UnUB7kjPxmYPTQ9T6E5Ud/GK5HwGB58dpX/6wK2H3e2dugDjA1vPXEKY9qolqQWFLEd7ytD1TT51tScO3HgvLs90+RU3Q2uJTmowW4978YDVMqlwIXGoPlBnDw0A7+qWN4HA8JkAMFvEQWA69MkTLlbxJzFMmscjY3/9IZTax+tTlrFZ8vUpGW5wPtjndBSS9VG9tkvIthntfZ5vrgkNdc8KStZuohFEo0cdUEvhGlig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3Yl6lKkMAOX7nwquyDgIbrlD543pNYwxHJ5/Eh0gfg=;
 b=NXfyOCvtBT+YSlzR+PCvQm2CLsTrx/fB6y7QRaxPo/ayqkHsLoX9SdkF82zQVziHZWwPBCEa5T8dVDl1TR+sB8w8jB31aAhn7c99oF4rpc1RSw5VXSM460/2GzIpGrSEL8nRIMWyFc7tMSmecr24E8h5eXRL9SKxKKXNkK71klW0UmSJrcOHiqRxfmPTNeEgPIm/sBxTL+tY7a9UgUmksAyQ1lck5h09PLzwN85HeSeoZkidkqxC4pbgYvcab2IUhvAwH7X45KQthJxNgA2WjFnoM7kf8sq8PRyQHPa8XbhVl8aNNrf1mPVlp6ckY2Io7GfD1BvUYmN94uMjiUjNUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 08:00:23 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 08:00:23 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libspdm: do not build for mips64
Date: Tue, 25 Feb 2025 16:00:08 +0800
Message-Id: <20250225080008.2609690-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0052.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::13) To IA1PR11MB6396.namprd11.prod.outlook.com
 (2603:10b6:208:3ab::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH3PR11MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: fb527fd4-308a-4121-1c47-08dd55727421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G5l0H/sw0Zrr0ZjGnwm7J4cGaSWfT/+HFQ/CZEle05l4AJuVwOM+DVFRnue/?=
 =?us-ascii?Q?6meyEFXqRZVKHw2PuWYGD+vq1qHTbiYltAe9KtHWeGV2i43cEaV+YAP9PQJw?=
 =?us-ascii?Q?Caw7Oa2xJp3HAXhvF9NIOW68VxWtxDpE+emUYwhBaXixT7OhJzs1NlC1GEDc?=
 =?us-ascii?Q?FEWAy7YzRp6dTRXnpPs06QJdXoVaOwhRtX8lWvQCij9g22vgC+xRaM1y8MMX?=
 =?us-ascii?Q?SD1uCrlyUIMrMh0/lHE/3jwagyXUQdWKmxHjUIYSonDb+XelisIcNTvLUE3K?=
 =?us-ascii?Q?KwvKOuHfVb3ARDjQXVpJnQl8ZpLG9jBcbAZor4Y55EXJEpduKXR6omI2Vk5/?=
 =?us-ascii?Q?lHN9lSCO+CG7Y0S6wBDKQJk8XTs3o/JPb9mGf/YCxzSQWzn5t0pl22VldB/U?=
 =?us-ascii?Q?COWOEXP43mNMjX9sQkf/BHn5gCyjXMhtcCWe9avOgjwT7X7aukyzKu4e0FXY?=
 =?us-ascii?Q?hlY1hZfJ26FIroUcO4FgMRLoAB/CtPXoqNiQgaawRqc8khAe19IpC2FCdBms?=
 =?us-ascii?Q?RQTNTnt35Bd5le1oeLi3GvaxOk04m1MjrZCfbMFTPRdCPjGMO9UfVM9aQbpJ?=
 =?us-ascii?Q?8Of6UBKt29Haq1ON/S5baZwFqAhsdNFtaVL8DfiQSFgNSy4SuVaoEJmwIzuS?=
 =?us-ascii?Q?FRg0oTqd9CAUrW5BcUTZtG3x+ouOWuM5/2GOsg1PFeO2nScg41M7DFBA1igG?=
 =?us-ascii?Q?91G+aepcS3a2P3adQLnA34lOMnOWNdHt9okOzl/LJ/NEWA+ExdSn0cLhdj+p?=
 =?us-ascii?Q?s24++qTNoraHVRwe+TNBcmFr2IhyWYbXJ2m53LG6veHE3C0HJiMMZra7DS5W?=
 =?us-ascii?Q?ktSOpBzwIe5oCvDVSWbq6UeFzIk2hiSolE2EXW4riEBdNdJHOI/E4AHx49Pi?=
 =?us-ascii?Q?OVhec/ttpFeJamDT2svWCojgdPiGLYeM2GA+KcP8I1CW4f1NixnGMDz1SXNH?=
 =?us-ascii?Q?ATaOsX897x/sThqhrXJN5SAtQqNhg1u9EVDvkKiLu1LjjulhUFWO9PVzXCJQ?=
 =?us-ascii?Q?obvCsikJl+pBQcje3GfihKgnlBbX6wcZG+u4GsJWxWAzbt/4lMkdKxAS+bac?=
 =?us-ascii?Q?qMpprRndxgb39hZAuA6Ka7am1L0S7GXKD317mPCIpB+xDqoPqg1U8ODlq5Lf?=
 =?us-ascii?Q?XcDXbPTitSkhiYOnqqpwIgFILofuikqLhyC96wtIWLguPC5BcseVyczOeDsN?=
 =?us-ascii?Q?oxbX2iI53xLEuwkh4K/tFOYV9F11BdWGdwT5FLEENpr0RUfGyv7whYe1OpTN?=
 =?us-ascii?Q?LPpu5ZIZUlT5Gst2SmmbLbrMmKDDYm/IW4fh32AMic5/qYd2Is2LK/pAV2cb?=
 =?us-ascii?Q?NXB7QF026uDcjdJUwQAmzBnblv1gVTMV3IQ92D23BnbYHzh1aUwhR09roP1/?=
 =?us-ascii?Q?AjtS0BmygjRfCv8gW0SvsZHfZ/WDcIFBPQIY/R+Mg0w+9GR5O7O6Bo34TTCr?=
 =?us-ascii?Q?PfrwsFOHuIHUUXj4525jNouDVoKOjaXV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ePZCEmUNcbSCIGnru2YisFALKjTQwbVEowHe4w6yOe0rjfH1CPhg7QDO5zFk?=
 =?us-ascii?Q?khEBykN2/ailG7gpJmadfzp0jDS582GQlulpKZl5RjgJiX8psoB1hrs1zsiY?=
 =?us-ascii?Q?3Sl6tyHMd8t02CKAyjMkdtdu3KLonUOPbgO8NEBtT5ofnGj0XBR4ZIlTrlab?=
 =?us-ascii?Q?Mbmr1yU72FW2Lak6Y3o9g+e4RZmsQmieX6HNYNvd2T37vqWMriPMHkkMny4m?=
 =?us-ascii?Q?mkSFV2ed07p058FQoY+xDRBvXI2ewaMZOYHRcOYl75/UWQ5uuhnkySpApspx?=
 =?us-ascii?Q?Hg1c7Cba3zxwLalp21niC79Q6gKeSuJVa1LpmZKprAcHSC9+niH73clY3pYO?=
 =?us-ascii?Q?aMrbF5ZeS94DoZ2wI2Tv8IGhsUxkFujulHIBmPP36uNt2KAs8ik7ZCrrADcV?=
 =?us-ascii?Q?Z/BGEDCP+/aCJHElSPpPPLd7mj8KbDzvI4sADr5dNOhsSLJ3pFlUe6rqmH0w?=
 =?us-ascii?Q?NmI74vWDykRC+AQ/O8+IsuP7/DOekJlZ5bttxjk5OoLMLY/lRA1KeU5ZlalJ?=
 =?us-ascii?Q?jaHvm41VcXfYFf63cbk58zOhzDCWezx42fAsXCOhyp86IaYGo6E7epIkOm5W?=
 =?us-ascii?Q?m1O9XIFvy0GbvlO46Ldri3/Y64AGNivGV+W2rhV4j9ZZrzFi0BRKFQpR5W/k?=
 =?us-ascii?Q?c+fL11XDVbrGll6eODHz2UEjOjf21URnGCijX8s4EAGocoQOjNLoFBc/HFEq?=
 =?us-ascii?Q?X1my7wBH+0hljwKfShdKY2WbGzrOQXyPv0u0rAt3oCRkkIkNFiPqrZv8DxIB?=
 =?us-ascii?Q?DE6WLHEfl/HOMhcu+iGibO3Fj1q3cfLiMEH5tiX1DwY0BnoeOJ0bHUxoiwr4?=
 =?us-ascii?Q?4VRv1oxS7E/GPzNDTzLUXKcSk5oGldIs4Ld5dNhMaI8yFGDjgYvAz9KZkCtC?=
 =?us-ascii?Q?RjgWOjwhnIKREJbjyXpXXN2e9ZpgvWa0xDBwL3xMCQxBVWVQJ79zstLnnX5b?=
 =?us-ascii?Q?OKfwcEdRANJtcPKNq5PPMsV4w+6h5nSSBHJoQ6FSwSboTZPzMtEkemHkxWcK?=
 =?us-ascii?Q?LmZS/5M1uAMNhH6zaUfWmG5ssnwdQy5X1G4YLSBPzJZ2jE2Y0KtEzdvQJEEK?=
 =?us-ascii?Q?4Velo/ft89zLZyRH94eN7jiJGVae5RUwDSzyt8hyIT5MXLVkQ2QAfiTunize?=
 =?us-ascii?Q?vPGiacjJQ2px6KDSljxuJDKqYWJIySDZGeIZg+jzhw6pnRkr6AfR8ZeEsKpl?=
 =?us-ascii?Q?4zH8TsPJxUMIAxV1UeuoWs2vw79anjMuWWiHTFivAAjlL2/EhUYwZBX2sOZX?=
 =?us-ascii?Q?P6GsueBnfYfOsZfF8KVDuc5cF8q1TDj/lm3+zdRXenxpJIYSKMciIe2Oc3fB?=
 =?us-ascii?Q?PxIpc4K0iVVda8dB3iBZPifNfhon1KtKZifBjUfGKvRubRBq4HnYmU8/XUgr?=
 =?us-ascii?Q?qOnfXogV6zi/KqusYNyJ1jtxOiEQSrHO8aNWImdSZuoeobVyA5Naqw5t0L1m?=
 =?us-ascii?Q?gW2fS2Ym4C68vEn0TVLPLjXDM0ISL6jhCcrn3mPOA/hf5BaYcxVULsaflAwg?=
 =?us-ascii?Q?hPvWgw8z9wRT2Rrc2Yhz9yT+8ZeYvR03a88oLwM0wO3NPzxN/XnPJlCN4A9A?=
 =?us-ascii?Q?MknoihLxVAAAHMo0oVaVZ1lZtH2ZIFz+wDRhpLVu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb527fd4-308a-4121-1c47-08dd55727421
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6396.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 08:00:22.9717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wW4KR0XHzIhFMUEfCiWk+BTvGd1D25igYKb09cQlCI7sF2qz6jUhJmUtucL8Amh49l7GrwWxtwsnAMw5LyHrBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
X-Authority-Analysis: v=2.4 cv=eoIlzppX c=1 sm=1 tr=0 ts=67bd7899 cx=c_pps a=2TzYObwzRp/N0knVItohZg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=hI4UFINTIJqmw0Uowf4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: l5UIIdt-AtcPZJZeGRt546vBrCMswQD4
X-Proofpoint-ORIG-GUID: l5UIIdt-AtcPZJZeGRt546vBrCMswQD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxlogscore=657 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 08:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115564

Fix error for qemumips64:
ERROR: libspdm_3.6.0.bb: unsupported architecture 'mips64'

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
index e4b8076b87..4c0483ebac 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
@@ -77,5 +77,6 @@ COMPATIBLE_HOST:powerpc = "null"
 COMPATIBLE_HOST:powerpc64 = "null"
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarcho32 = "null"
+COMPATIBLE_HOST:mipsarchn64 = "null"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


