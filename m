Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAA4C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 02:59:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1817.1655175564785701654
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 19:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BUaTI4T2;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3164603221=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25E2x3fa024932
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 19:59:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=825hnbxWeJ5NCZ4HZ2XiwHZcSu8tp+fhd6U0ojk/O3s=;
 b=BUaTI4T2WO4roDxnFeA21E4gzUY/NNBeOZVxsMZgre2M2sG/ESduehZ/8Gn+rdvzAHev
 tO0IGb1G70Xn/xKu56dZRpVqlfhmV5d4IkHCD8FJ8yvFFDYkaRnG//8GEmq/+cvi/DWL
 u+VQfMmrESo0mXHmgNZNp5GQw/KQHctacfUtucB3UU8JKY3pWvjpiqMcIGYxWk+tcKNJ
 vHiy2b0WtN49uBfKx8lOnCjp/6P5SwUEdM3c8Pyywnc7NLrSpXUzijeUtwlDitaiuOQc
 9Kr0H8f3VDur7wt/6zylVrslLxGkfB5dnL18sRKAfqlrw8r7Edl0zEUVDw64bkLXbsS+ mQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmtjkhthg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 19:59:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxAG/qex+JDKVle/RywMcG5cBgiIUHpSLdiAYmw+csQK3B0GesBCu8JiTatRMRkySSN0KtaZkZLQ+UEAvid6idXpYkt6T9b/Qa45iOWNBcyHAi3odF6b/tdwhQuinMGS3hdGt2x8qLVrHG7CYnwDi4+crEUglMN2PwFvCpDjEJ/wNebynU5+9/BpDrwJ47AQ/rYWiiIlq+08KVt4mt9o3osUmrAX9OxiRz1BItCT/OsY7l9TMhvvki/ai3dqting9KJJ3QKQKBGWRKdIw6G/Cpy4C/WNdZ05WqAaoPkVyRP4vBlC2QJG+Y7k5V3Z3zYVeZfIV/j5M6m8wdztmuuc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=825hnbxWeJ5NCZ4HZ2XiwHZcSu8tp+fhd6U0ojk/O3s=;
 b=CAuw49xe/3o5qpIe19vEeBWGLgrBuZF6x0TsgsGVdqNPHeSIa4aiaF5yKtG1oCtLfiWhzgsujjPOm96roYzvIfdq//Q8aXobB8Cvp7yaZB51CVBQeGJI+OLrTjfkknapdkA9Pqd3+Q6TILPjOJ0/eFOhs2WnJgPBRNcvDSyfN6N9KpckeyxJGu613mccTE20vNY9Wng5DnlDZWqvojuWo9YZXAleu2uP1kElqjjcwCbFj+f13vQutNrIVP3eIYlPdq+FPiAUejZasTMrtSBRMmPoczblkluEOXYWWfVmEkDtlMa2FaCIfitjtjN+BVN5Azh1W/v4Cqrue79gsi4kIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 by DM6PR11MB3817.namprd11.prod.outlook.com (2603:10b6:5:13a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Tue, 14 Jun
 2022 02:59:21 +0000
Received: from SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::a8e3:9407:2650:5a17]) by SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::a8e3:9407:2650:5a17%5]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 02:59:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] polkit-group-rule-udisks2: fix override syntax
 in RDEPENDS
Date: Tue, 14 Jun 2022 10:59:07 +0800
Message-Id: <20220614025907.815496-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614025907.815496-1-yi.zhao@windriver.com>
References: <20220614025907.815496-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:3:18::17) To SA2PR11MB4875.namprd11.prod.outlook.com
 (2603:10b6:806:11a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 956c3714-bb58-4d17-5cbc-08da4db1e151
X-MS-TrafficTypeDiagnostic: DM6PR11MB3817:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB381708AE66FD8BC39F14103FF9AA9@DM6PR11MB3817.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7Rk278z4iRzKEO/r1FYcwEmTDh9KO+ROdlcSjUA47wspHF/ICo4NaHym7H5SxquPp+dZYyClSftmA4Yrw3C+d1Yz8Xn539NE5+Ql0SlfxslcpNGYCpBkxooNHGaLOCbvWaZhGUTn5zFsNCCJR+dflm+QY/ND+0IbkhT7muiBx+cGrZj8SvhXOvW83BrJjV1WgqYxcP7B0PfDCe77XE2KBqWiQarq0/trGyZiTTMpbA5GQ4/7VWPusDeeVMnxMOiK4H22HBisY4ZavzYnzLmBT6tY8a919fqSsgPlsce2eBrG7C7QxNUizkCtMDMwzzov5IkIF58YpKyX+lI3JiOzbSnxm1cZ8k+MhJ9w2CHdFUlbXPw2cCHNfVzGzC6BAG3qA67C6es3SGcHQwVudlPWD15vrDhX0hoJl7+jCeLmaCiZv9GapTFgS7cuoYyZZUIzmR2g+UXtN2CCTvShbuqGYa+I1OM2FXrRfwsd8l4R2w8JshNesKVkpFhkpVrr5LPS9rHABQzUpHkPo0bKrsOClpO9YaY/DNxjeuBAHHoMXy/EfFqnIqNmWcktqEo6geMZrLCtNq8i1aIO3jfkK94m36qSIh8+F+hEmBgBFilpMcjRKidtrR0q5vxEhpDigZlh6kYrH0bt2rIJk8p0EW6OA9FKTeak9oQPznbrdBF6c71KZ+hPtzuAYr0uj6ZEGdzMUJjevLdnmCRBw/FIY3jjVWWUaXuXlSXZqLXhOv128HRmKfuheT394NY/pENNRdESEk7W5g1c5aw2IieCIK5ScIUZMo0fUj/pBn0vnLMXEIY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4875.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(36756003)(5660300002)(83380400001)(44832011)(4744005)(508600001)(86362001)(6666004)(66476007)(66556008)(6916009)(38350700002)(6506007)(38100700002)(8936002)(6486002)(66946007)(8676002)(2906002)(52116002)(1076003)(186003)(2616005)(316002)(6512007)(26005)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eXkYUWZ3FvgOa1bhieECdpEzpaMjgb9jMJ+e9K2LczNGEkJS7NMSWVVx7ZB7?=
 =?us-ascii?Q?nM3ol5kZ7gRoQrHoo+IzAxL6oltkFGTyQSbKQKZ8up5xgV9LRETuGuraDMYH?=
 =?us-ascii?Q?UVejCkH46oj1JLAWBGCM1cjSyk0jKUWvkj2D2oTcD4vuFNHniLzMD3vL6h/R?=
 =?us-ascii?Q?5gJI0yzfsbGrZW3mozTjH7/z7Us/5z3nwdw871Hm0URLG6SUZOg4Xlq/4mjl?=
 =?us-ascii?Q?W8Op7ZGhxaBf4GVPx73u4au4VO7XjygCqXQkIyV77Ar0B8CF6mise7yc7jfP?=
 =?us-ascii?Q?lLmPsXjp99K6NzlpFb8Ncy8ovjBDGjOUukcYAQeWuQrNUm1EYRXBaV5kszL2?=
 =?us-ascii?Q?pAeL339DWWoIFfOS3xwsPAIKX0YipQuVdG1xflW7sePXjF2U3Ml1nmG0N4Ct?=
 =?us-ascii?Q?ZLTo63mXVpWnpc3l7VZhpDDKa9xmOyHbPJph1zA7a1OYHaw6UvSU0yQ3tPgj?=
 =?us-ascii?Q?1AcDTSzImanNNzJd65mMbgXp8lcXy50naCLjtM11DEcgMdkThQ3aK9qSPm9t?=
 =?us-ascii?Q?z2C8gO7/YCszKWV51e6LaQytImHicLAcxufVbdbjYqjZMxhooUHI5P2qG9FT?=
 =?us-ascii?Q?koucBW4CEOHV0hd0tGwLphSegkJ8XCmhDM7BaPlDPXkpWqRDHNhPGYNchlCu?=
 =?us-ascii?Q?uPks7OOHRwh+klYd8D6nOjeiB5NW2CvNB7OcA8a5Lb0LupPKAD2gSdsl5WU+?=
 =?us-ascii?Q?IudMMvj2ri1889v77Pn3xqwIaHavNapIuYLtWwqQOD0UoaWUUU6peZlEtdww?=
 =?us-ascii?Q?aqHtzus/gHScsKiMjflT8J1QuHvTGSgccuS8+TRiV6y/pvzMGtFtoFzgi61D?=
 =?us-ascii?Q?3f9CJUK4XyarA3Ua9Ssay8OZnoVTdrcKE3cGySuOgYcAfAIt4VcwhsiqMNXW?=
 =?us-ascii?Q?hkWTRvKj25YfpQwITAp979kKRyfO0axWBeAUNHt0uUlE59vCkIGwRvVN3oKZ?=
 =?us-ascii?Q?uWlf5nJKjnudBnFcddicGRaB69YWlelHMa1hdzq82t6UNW/UZ9pWHjMINB0Q?=
 =?us-ascii?Q?Jx70rDD4k3b+3rRcuhCkmQcGZ99GxJ7WMVbT9hTsPAdFs+pzw16UywkHlJKR?=
 =?us-ascii?Q?zIvTVJMvLrlbTGaWZ+5d04L10SX9KAVRHVr97zdsyUf2Xv5poFjYxc/n9O0k?=
 =?us-ascii?Q?42YVGjPAG1+9YsVWc1tdH4vmdyaAbnJMyUfsf8o7Taeb4EDLig4A9K1sLtU5?=
 =?us-ascii?Q?3+ELFPNrCgOAhS6SbYtEj+N+XK451Z0Pmknoun42ErJw4RjVQCwpeJixY2Kx?=
 =?us-ascii?Q?qaUD1cXyWPxzQftMHwNNPRVThiDQLnEqwaLoc226g2MVAZtswYAZ4n0JDQ3z?=
 =?us-ascii?Q?4MHgl90kbzzn5edrkOXT/CmOb2rWZvyE5/7qfJShZJoRalXicBv+oHsX7SFG?=
 =?us-ascii?Q?uEMNpMCfevZOLmWuL5Z6m+vU80uDM4aY8drJIsZZdg+xWFiBJReHIQNglypP?=
 =?us-ascii?Q?hB0Ru75vxIAiHOBpje7doRxkUHcqUjrJKal4Vs6tO8ZL4VfZY7zjhxtoR4dh?=
 =?us-ascii?Q?bNzD8yAyrgGFTnYMUgslznoBVRBxNr6YiA8J0swV0MJTR8a48UV0IXznDRIT?=
 =?us-ascii?Q?m+QPv41kG9dC+DD5frCfdf1s2mk5A1fGlS+bMo53Zm4hiDJ0vp9OGNMVosme?=
 =?us-ascii?Q?cyrYmKEOincCwDTjAhWbVjdGcbGGfFqP9pt0HXwnyPJlMuFlYbRCJ4xrWzWq?=
 =?us-ascii?Q?YEWG/qqgUQcT4N33MXXyypYp5zW2NJMfwhCR0PiRjxeYkAGeNT/N5h6Zq1Uy?=
 =?us-ascii?Q?539KGMF/Bg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 956c3714-bb58-4d17-5cbc-08da4db1e151
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 02:59:21.4227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 C/sEozyWDkrwyLiYEesCaRFB7xkJ+Da7ciV5UdQwuuIWFNnRPMz0D7cZ3r6u34bVmh7tBiVsV14+xC0ofLSABw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3817
X-Proofpoint-GUID: 6_2Vxz0q2Z1ZTXxrPKAzAO-viR22TA8-
X-Proofpoint-ORIG-GUID: 6_2Vxz0q2Z1ZTXxrPKAzAO-viR22TA8-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_01,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxlogscore=595 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206140011
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 02:59:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97496

RDEPENDS_${PN} -> RDEPENDS:${PN}

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb b/meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb
index ae024d032..db2ed015b 100644
--- a/meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb
@@ -7,7 +7,7 @@ require polkit-group-rule.inc
 # The file originates from https://github.com/coldfix/udiskie/wiki/Permissions
 SRC_URI = "file://50-org.freedesktop.udiskie.rules"
 
-RDEPENDS_${PN} += "udisks2"
+RDEPENDS:${PN} += "udisks2"
 
 do_install() {
     install -m 0755 ${WORKDIR}/50-org.freedesktop.udiskie.rules ${D}${sysconfdir}/polkit-1/rules.d
-- 
2.25.1


