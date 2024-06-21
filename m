Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35122C41513
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:11:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.64023.1718935911641187374
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=69022a9133=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L0R3tj011121
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 02:11:51 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yvrmurcrn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 02:11:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOo7v/0Y2y4hBZ5R01wls62yCf+kUgb25tj5a7k7gAUMqD3hKUfbf/NwZwIYPCNk7Qobl2+vyFGRX0EW+fak5Kn5ctWA/RMb4Hu3aTqiJ28HKmaMr2ypMYdbTDJibBjl5uP6s10eZ17x8b4IMr7hDRIXOpLBhrxij6Mm8ACQ3mxPSXxu4ZNHe5Upfg09RDPcT6Vb7pYO+N2YBgoZNVmVsoT8u4vI+sFA+i9xchRNTTZRZtDWgb1nC2gBo1BueyT6EUQVfYf8AAnuVcdws4oJL00XZv2kE/BQ8Ic/EuxPKYnVXstB4NrbvCHF6/gtJ2SEfYTHRxMdLyzw4+09mORjNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNNJsOVmlr9zgjXixIcJovC96adIUFKZ8TAJgEI0pGU=;
 b=PVtdAeRRQyYo7rGX6Z0I9kZwimasjBDFT6F6ZKsJJiviQo+RZ4O40FQzCPLFp8L66tOUfiWfJHMD6UjCrOv4GROKtDNqqnHS7o5noB40KoOIY6UcKCjr9wE01Rjy11iPqEUEVY8dgfnqVwk7C4NS2GCS8KzWUHXeJXLokGbOqNdrmvaUfnK8dDXYz6UzFrOyYuCgw2NZDSvPvStqq5+HjGhbV0H2q8BkcSDdusRAZWjgXma8S0pPy4pxS9PzU+1QtIyWaQa8d/GB20hNOztyIBbQQgfGr+lB+5GQ19UyE+dSwtVv/xqLD3kJAzXj1X8KdC2uUfCmko7T8WZE6yRpDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB6859.namprd11.prod.outlook.com (2603:10b6:510:1ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 02:11:49 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 02:11:49 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] samba: upgrade 4.19.6 -> 4.19.7
Date: Fri, 21 Jun 2024 10:11:38 +0800
Message-Id: <20240621021138.2377160-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240621021138.2377160-1-yi.zhao@windriver.com>
References: <20240621021138.2377160-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:405:4::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: a55fe90d-7932-4905-ddd1-08dc9197825c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|52116011|366013|376011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bxgYNIV1nHhipMzklTLnNhoBtve54cz3RmWci33SiPye8r1td1avKYamkdM8?=
 =?us-ascii?Q?bvnRQetlZmoRm7nNjGIoglboO1rITpQx1ZBDzqU9y3+IFu8D2oYoGe38Bzty?=
 =?us-ascii?Q?IoJJryH/jZaM4knYrPtZvZWJO8iomk6YSl0AT19awPHl16teojhy8px1gjEn?=
 =?us-ascii?Q?ymrTwFSEZH/eav8Fax7PdFQGeK22aJJF6bNj3DK9E75TCZ7v8Smd0Ori0H0N?=
 =?us-ascii?Q?Fw/KKwYS5QX8gDtx921yltSSoRt40M8pqMgZk2fYzbp3TKi6zZ/0Z1leRw1a?=
 =?us-ascii?Q?DGfnRdmMS1AqXxNS2NgH0/dlZn8RMFlOBMW04tH6+e3hHYCdFRDbDZbgKnHP?=
 =?us-ascii?Q?bRiqa18o+VEhZEMTUdMsArSffywH1iVDz/urL9uIY9QHLA5dOnLtaXf0h1e9?=
 =?us-ascii?Q?/JB/40M844LGAO3+FD0NkypeIkrGofbkD3wnMwtcxT3/uEklRpv5djFnWehj?=
 =?us-ascii?Q?HGxB80S0FzSgcF/UM/YXRSnVFrrXQyckGTPxEXz8vTOR+oNby0bc6P7cFITl?=
 =?us-ascii?Q?6lGigkuH+LxEXnMTEXTUvSAZZ3sc343jWbKlbWmM1XqkH7VbqmF/H3CZXfz9?=
 =?us-ascii?Q?RpSm4aFjLwHd3yQGVvVkN+QS3awHDEi1TizHe0U+UJBJz+E+XXLi1EDtRS+c?=
 =?us-ascii?Q?f5WMx2HOlllCXZxhAbLW4En4B8QXc9E6acWGkce8ZaihL8aWc1KKy3PpduLZ?=
 =?us-ascii?Q?CdnrS6Qk1gqO2feEv9GKemRnVavjEGzM5cP8AL7zO+LgT1qG+ZCGL+8Wif1O?=
 =?us-ascii?Q?o5xlBMN/2x369DYwSuOkHJsV80kO+D91KH24lcibG7fkZtkozvXAO65YquIl?=
 =?us-ascii?Q?shThwrGCmLoTIRYaEd06Ac5hqbEwun+ynjGBlfLR+XvG2PKvwLoO92rUL69L?=
 =?us-ascii?Q?30b2yz3Ri83aXf0+m2cjjpfJnLemp+oyf8NAge3rFTb0c8P9GR90ACIwYxrH?=
 =?us-ascii?Q?SpekxplfuuNc2fSdo4jh9eise+xMYnOmFSt64VHySR/omhok5z7qJlOaXfGy?=
 =?us-ascii?Q?vhiF1JTYnAf3rfMYm6jo8qnu55frQkM66tez/gnj5qzQFw2GDoKt4X0VCDlM?=
 =?us-ascii?Q?qtGRIydWesDtKiL9H/CcfrA7uAy/Jk6iTmKPIXeR+EAn9uE6mCD0TpIGir2C?=
 =?us-ascii?Q?yd99A8mHwYRivGMRS995+virPoUNCFWdMxQKG9/tytffXYMW+wuUHxlA63eR?=
 =?us-ascii?Q?kZ4mdpIlFp/4/TLzMGQwsoyvNZb5P5j+c5dMipIUxexl8xgtAmx36EOjzTch?=
 =?us-ascii?Q?qsyp/MNEJ0g70wAjb1K0OxK+Fu162dlOoqqWS0SpHyr+QVAHaWIOcBqvrcsC?=
 =?us-ascii?Q?XbWK9HRrefHle+aR2rkNtnsi?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(366013)(376011)(1800799021)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?32KIEkc9Xn6IlZgpjXcfENYUgofgXSqWFSAV+9ZRYKLRQakTKDfhlTeRGoN3?=
 =?us-ascii?Q?V+J8du54MK/gWbxpqVV/yAEn408OalibofLsmTBL7lt2pGIXq3D9tf6EuUuI?=
 =?us-ascii?Q?aKQeTobsd6KyPwe/qoVJ9f37VZ7MzHUQRrEw3dLVUfckdrDM1Q4OaCvYADYn?=
 =?us-ascii?Q?PZiWf+WKYZDmUQdfF2ydTePQHhlVtDN3ikirknDmO45EcUYw7HowRoMDidqv?=
 =?us-ascii?Q?+l+BzRgPPdcsLLH2koOUWAiwrU05g2ldytZdZyfYCo/ydUkvo6srjubh4KN1?=
 =?us-ascii?Q?HMe95bSIn1plXxMcSL4BNxYoJEW/kG73H+e00iFHKPDbNzm37q+kNzYtD86Q?=
 =?us-ascii?Q?HzaNuQ9E0Javeevy/Yn2RhygecuBuzyH4ZIa4/QfA4Gw5sexoRtMXL5OQScG?=
 =?us-ascii?Q?S0HWt3RwTaMphBMes/GS9nD3yk5nQwhaUnAFJney7ldmGd8NNXndp6sECHll?=
 =?us-ascii?Q?zb80Y2DDEsTFm6Nxs+GTnDDWGiiK3maGlKe7HInXQ3zImkh20msBV1A8SO6M?=
 =?us-ascii?Q?HhedhR78x361keQ1eF9QoYl2BN+bEIfjWCCAiicK+2c7uZ7+hkD1Lqikvppl?=
 =?us-ascii?Q?9E4yzhjVz148z6z9XPY43zcKx4qlxPY2tJW1GQYhreZkIQ6+8MUHaX8u1GGo?=
 =?us-ascii?Q?FV49uq9zA0Lf6zD7v8SLma4Lxk8gHO78jeVtFPw5VXRGIyi5Ujjucil4w4YE?=
 =?us-ascii?Q?dV46HLy4UpcD3UoVlTyz0JFI3fC0n9dSgeu3nCGtXI1fwnYp6G5gcd6K3Tq3?=
 =?us-ascii?Q?cBqLNALYz/HMIsyj2jGTCJdIOHO/XCIRIgTn2Rf8hvL06uTluuD7tiMrI5wU?=
 =?us-ascii?Q?fYGxAaHYCJ0qjxfSgEVmgxSpnlOzyREgeImVgkD6VAsRx+69SrlchUxlPaMj?=
 =?us-ascii?Q?1EKQ6/TXA2HfSFW9VB1IC4Tp47yxPpmO73qGMcG+EIQsHInumOLpFq8FtE+F?=
 =?us-ascii?Q?kaoNPam+WxrIIK2dhrrSQA+ET99HT4nrqlwJgMOvb4q2FJd+hWxalEFxbDuJ?=
 =?us-ascii?Q?iRL/NxVcFJGHABIRI9rtsqslppwaP+wW8lGSDJaggUl7QwfhehEwc9YbIiZc?=
 =?us-ascii?Q?KbYCPXx6kp6J02X8bsdWScRtfDzX7YFvU0vwIDUV/tiaGyJ42iiojEBYKeVm?=
 =?us-ascii?Q?LYC0H6ZVyvKCVUhGLqRlGFWx9dDu0TdC+1Qq0WyBPOmmTdFvfU3TUnIIwnyu?=
 =?us-ascii?Q?zB6fW8f3nK1pR0wUappv8go58bMHnb9Vdld9/dymBJ0ifVQPSdsL+zOHEB1R?=
 =?us-ascii?Q?bGSrVW9D1wQaoTi8AQYdCMC8+AcTZS1HAql6wVMTXUrvNc4LL/Tu2B/YW7P5?=
 =?us-ascii?Q?WH2idlG8xca9RjIYgbGg02Vu8oM6ggnaaA9OFFQDutcKvZq25H0ZXhGQtpN1?=
 =?us-ascii?Q?0ydVm5ns7eDlEh0RlSgcHCUEhTx82O4wnA1g50uqfF/2E7pyEYNc0eBoRCIV?=
 =?us-ascii?Q?A11ixjfcXYUz1iikx7+l0UssxohE24eXtyWPfnIyYjTbeYUFYZsPlhm94bJE?=
 =?us-ascii?Q?4+YOO2WmEdp4yXYIGgcVrbrsvTssFAsySSAdPAPqhLdzD5RBFiLNNF9T/vyI?=
 =?us-ascii?Q?S0HXQne9tWT1+/jo19yifyApbCJyft9WdqHfRr6D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55fe90d-7932-4905-ddd1-08dc9197825c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 02:11:49.5414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwOdnFXYjgUp97dCo1fZinVLwqNeDONjam3LI+rgH94vHjneWkvf8C7l3iOVdE/hUw/+QrwLUUoQWozg6kPB+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6859
X-Proofpoint-GUID: SGribkv2CZ5mGW2EIfdJDigTpmdzPEkT
X-Proofpoint-ORIG-GUID: SGribkv2CZ5mGW2EIfdJDigTpmdzPEkT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_12,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2406210013
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 02:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110985

ChangeLog:
https://www.samba.org/samba/history/samba-4.19.7.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.19.6.bb => samba_4.19.7.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.19.6.bb => samba_4.19.7.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.6.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.7.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.19.6.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.19.7.bb
index 7bdcfd35c..796f1697f 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.6.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.7.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "653b52095554dbc223c63b96af5cdf9e98c3e048549c5f56143d3b33dce1cef1"
+SRC_URI[sha256sum] = "2bbb800af2d6bc7b9c23e708cd58d008da3bfa6ef7e621d9ec8b53387efee445"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
 
-- 
2.25.1


