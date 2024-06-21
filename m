Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344CEC2BA18
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:11:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.63946.1718935911390868164
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=69022a9133=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L0R3ti011121
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 02:11:50 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yvrmurcrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 02:11:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0L/xUQzq1PT7GvNbgKpKOEv1kNK6L21jUKGoTaZksdfhgHVXI4nlRowltpLQcl4CDiuP/61QePJTmhMnuMP+qtxO9bReinrJJ7sPrdTLJJXibs9Z7Fucfoz0PMh0pgvScfCheRBGN01iyvh9iabv7AXsdIT7ag+yB/zeXx1+ph2iyXOrm9I0xpHfU9E/Lm/ujF3EHx7IsvkF98uVj5Do2ThFhAO5lnHIcFycB27AOPOyPerbJCdcJHj6Zx2BmWb8+svX5sXtb2NWclsl4RlRpeQxwioOfa6ewZ0/z2rSmuBu/L/KDjTiogLAZ36jERBP6OjWM35wbSCAKuuv3zK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDtWNN/XmyRQWAulsyQF8W0qo2GtwWyZCzdjENA0iHA=;
 b=BNl/t6UIrrd2cgoXKHKW1m24+3SJbYQ+Cy77yiB5fjlfwWwKNXUCt7N++c3EQafXwIbm11UrjwxVFnxCdnClCpYL5Hlqk3+PAYiAndml0zHoGLfCk4XXVdtN3FOD3s2WhAslXVFyRva0pvSaE2FeUB9Vel34pPcHJ5GeLToruf/lD4Y+xcDLka+svwuFPM4HZythz/FX63yRkSwdW84DV/642ZFTHChksMAOt2PC3L7iHAWfYeGIZzcxoz72CiozRC5hfejuFIHb4c5cwC0ec8M/INMvxN8eHgGnSPAvQtrU4Wb1ZeF9wsvaNrIyw2tBgyhL/R2BTRgsiHLHdwKYWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB6859.namprd11.prod.outlook.com (2603:10b6:510:1ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 02:11:48 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 02:11:48 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] libldb: upgrade 2.8.0 -> 2.8.1
Date: Fri, 21 Jun 2024 10:11:37 +0800
Message-Id: <20240621021138.2377160-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:405:4::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: aa4024f4-44fe-443d-ad73-08dc919781a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|52116011|366013|376011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OdlaorVfpgoljHB+X1ae2FuNRl2NamIbl3O049hn93IbLvuolYeL/CM6iasC?=
 =?us-ascii?Q?jaN+Zo+ZBPmGXLSPeDUMoWhmhN9gp8cLgSzzuPRt0dD3XuzC/FXoxgN521M9?=
 =?us-ascii?Q?5o3uTIlE+x8/ILkhxbw/z/0V6RncW31YxoLnF2wUIZIwELcRsZolPGLadMAn?=
 =?us-ascii?Q?zQT95gaD6qNXpFzVWxUGW9M/h/hcce44r1TJ8LjaoTjLVUbSNS4Wb+yv5+8T?=
 =?us-ascii?Q?U2SQIakTYdxX3irKg6JTIyFX3U7TK1aXKd7Pn+MAUgFOFakNg0QT8xCfPL/G?=
 =?us-ascii?Q?g5yT7113pjVNC7QZBzwIErKnrxLkIRUaIe2Loim0FI/cAfMMdaxBrdkcW6sY?=
 =?us-ascii?Q?l3Poa1C0Zex7jv54/dyUzVP2EJAhlrlpEwqCZvxesVHBZdjXezCE9Y3KOVfn?=
 =?us-ascii?Q?/cJx0yRjh61hijiRuYIBHBZS3jIrgm3rfm7hSGaAH/piOud5XFgdfa/EGqMU?=
 =?us-ascii?Q?i/3UDJxsVceS9fOeJzoaEH/74m05vqHTRXJi8+/JhIN7gRjl8Ahwrqo+HYOx?=
 =?us-ascii?Q?87cALUVaVWSFvtvKrz8YAd124w7/URCq5lYDw0yzgCphD8hVNg1X8XCGMs/q?=
 =?us-ascii?Q?lZfTu0yqxiikjPFQthvvE2E6RLsHlEA0NuFFpKwD2DF5xitGS7qglPtqfnfY?=
 =?us-ascii?Q?OocAD/hm+CfuCGFECkxdZyY9pEvRGcxKY9Q0HIwFyIcxqNoMM/DYVsxpxMXK?=
 =?us-ascii?Q?bbm5d1EsHhWF5SNuZu3A5vjngwnKA4TP2O4UgJx1Z2CiN1j3PuYEJALuw81a?=
 =?us-ascii?Q?KVJm2YIFm2JQpr9h3hL+te02zYVU7G2A0zVheSLlDfniydMy+xwrol03T7fi?=
 =?us-ascii?Q?4SYvNJKz9fmloSGe/Ut0ysRB+mY7qbWzVntYWXbQ+Vt1jdEuGPzZruvyXHLc?=
 =?us-ascii?Q?IGM0XeQCF3aF2iPFioNGAmMk47By+HClDhPaWvGFU8Tr/fXhIkMIS7t10H52?=
 =?us-ascii?Q?a6oKM+p4UE6pntTHYaCeFpzt0AmTCZZjpQNTv6tip9KaWd3fl+pWXMp5+r4W?=
 =?us-ascii?Q?Cs7xKNMRWsFSxkM0vEWV9nwyKCOTVwfEJHaHN0KOmWDXptzr07EgrW91vvzE?=
 =?us-ascii?Q?imOHJIlHru3x3OXvAmNrrMdVZN0aCtMHGU+y07zVQTmpAhe64+voXToeqsV6?=
 =?us-ascii?Q?djs0Ninml47EIvS0DiA7kPCQ6eIdi28AcWGlqxvYJq3svVT4qxwjf69marqr?=
 =?us-ascii?Q?Ib+X5lqyzWQUKsP20WddUwv1GpCIbchAVwBYyoNP2mu7uvmw49XSQKKpH5kv?=
 =?us-ascii?Q?G5innS4zZnMYXGLmJJ0tfg0Jtk4m/fWjNDWzNDp5AnLzZHHb0KcqlDbenOFs?=
 =?us-ascii?Q?ayePaqXkZ6L4617M3Vq1U8OeyVHkH/zVkLCs9Mvj7IuPRoNtL5bHfmECBbPI?=
 =?us-ascii?Q?H4v6iP0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(366013)(376011)(1800799021)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jyXmch/d8ZXwB7VeuXhte5rtD0lf+0Q78pjfT5fZCtPX9CjvLkS5OVM4ewew?=
 =?us-ascii?Q?HRN9LL0bahnXPtDuXbYYte4aEdj8zx/sUoxLEORxpTwEwO9U/mfCh1Ajyted?=
 =?us-ascii?Q?3AQJzH9daIMOwaMCFFR3NaC3zEDNGCV/W/3xF6VO4hGDg8Hm2C4gV2Vf47j/?=
 =?us-ascii?Q?LCTt8u9/ulpJbXmvedM8ck330EBjpxHsOdeVLChDuXi9fwVdvAkW0/0xUm5S?=
 =?us-ascii?Q?nLeqsp/HYLzSZyLgXZ81RiQjwIvlFyDrWrMZzlvH6OI3XGt1y/JUENTtdNwS?=
 =?us-ascii?Q?GYpKsqT39viV/W3vQ+8DV+4iVkn/mEJjKVIQUYQOJ7ibh3t0FmFiOZZCpT7U?=
 =?us-ascii?Q?FIM70J6g590gHkN6wM1UEhwwT0pw2ifAPRRLZFQDydPdsDHI/prc2VhF0tU0?=
 =?us-ascii?Q?8mn0yOZe3AtEJZPr3MggYLfbvdqIIeJy9EEocJLEnO+coZGJ2NGM5fyaxLI1?=
 =?us-ascii?Q?6k6eTwlVlzfm47SxX68dyMgH6y3T3uZLem1KTQ/YjYIqzs28T6dlY/Su6fHf?=
 =?us-ascii?Q?KGTztRhg0q3pQXrtPHddHrlOpCLO9rlABeB1pygauJo8AbokxPXMYh9/kUfg?=
 =?us-ascii?Q?G+q2K6c5tEDUe0dHoceuAmvV8xqasVUQrCc2xyvC8Ej5g9cMoKlY99UGIGyM?=
 =?us-ascii?Q?upSNFwz7Ce3/kdI31/dX6zDq5pAevcJTSZ1LKJPxNPTpUqffjRaUnaM03Hd5?=
 =?us-ascii?Q?hBvEK4z2W8d+o4+w92/6wzg7KxKDsRo4lFad5WRjpjIKGqueXuGevTDvVWkd?=
 =?us-ascii?Q?ZyUTnkds/rfmPItMBQyO6aUUFegEAboaPXQspxxoWUFB5wQgj82UwBtF6s/A?=
 =?us-ascii?Q?yVW1oUSwLSPOqMcBV7uli6qI/MDG67M2MUh4BRm+pqP0Nm5m1jr0HkddrxpL?=
 =?us-ascii?Q?fXoqsgBuqtSTbqiPZRsrCN2g8Kns8dcJEkpOAcuTV8JOUkpn6rG7yzKuJ/hg?=
 =?us-ascii?Q?bVBCdTNlAs+YZAe+YtlU385AvMGH+m2LqhFpQDEPjQLMMpIKHBKw+Z+DA+yf?=
 =?us-ascii?Q?Kkj2l56a8HsN136Bv7KKj0f0439gY8GwK/nG5h2K+gjlWV5FC+PZw6UFzb94?=
 =?us-ascii?Q?e7e3dEe4jmmGt1WqLUAMGNLcvicdrkVT3lOj0yHBeUQyyCxsNL89K5REDg10?=
 =?us-ascii?Q?lPG/Gn6nFa1fjJktlCqh7TijTchj+GuH8/rN0JtS8T2Omh/bxF29PLOtFaH2?=
 =?us-ascii?Q?2LY94gjJR+F2DBM06z6MMFZ9jctb7j1FuVD5xpTQhrNvUomn/m70Bepoffo6?=
 =?us-ascii?Q?7IlpUTn+I6wIP59yxPa0Rrw0C64sQk21BXzSIem92WZzAnGJiHUm3XKauaN7?=
 =?us-ascii?Q?B84j6Vr6y6jFttcSc/rtxnza+7RuYCX5PcaAyAbUr/ce03ierr5vi04q+xMx?=
 =?us-ascii?Q?+lvMWjY31NveCDsg12uqcqIUXySWqpqcteqNqqpWUb4Q7py/sZ3musPUdjuR?=
 =?us-ascii?Q?r7vPjKdh1SGHjCeEoD/fXxYZGKpLMXjem+w/9W5p8nc/i9i2jF3ksPosEqMe?=
 =?us-ascii?Q?axswJKczKx1yppA2dsvoazVmWiQSeCt1mSn6zvX7IyTzqY2AtywPM9ZddAfa?=
 =?us-ascii?Q?1UVtPa7oNbl/UQosSeRPCJKv2tl5aqh4685YkXlx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4024f4-44fe-443d-ad73-08dc919781a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 02:11:48.3584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8lR/yTQUx6ZSh8jcNEzs/HyH4Qo1td4L2bf1SH4yPARwTDg9QwkXoFdiNyVIfuRvxg4fvWHzm0L/tDFNo3OFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6859
X-Proofpoint-GUID: 81Cr25tOeWfYpeo0yF5lVyjypiZixg9D
X-Proofpoint-ORIG-GUID: 81Cr25tOeWfYpeo0yF5lVyjypiZixg9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_12,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=942
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2406210013
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 02:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110984

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-support/libldb/{libldb_2.8.0.bb => libldb_2.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libldb/{libldb_2.8.0.bb => libldb_2.8.1.bb} (97%)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.8.0.bb b/meta-networking/recipes-support/libldb/libldb_2.8.1.bb
similarity index 97%
rename from meta-networking/recipes-support/libldb/libldb_2.8.0.bb
rename to meta-networking/recipes-support/libldb/libldb_2.8.1.bb
index bdd87993d..29ff2cf6f 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.8.0.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.8.1.bb
@@ -34,7 +34,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[sha256sum] = "358dca10fcd27207ac857a0d7f435a46dbc6cd1f7c10dbb840c1931bf1965f08"
+SRC_URI[sha256sum] = "b68ce6eb0ccd2870fa3c8c334f2028b5d16606fd41308696c17b71959f7bf59f"
 
 inherit pkgconfig waf-samba ptest
 
-- 
2.25.1


