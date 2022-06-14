Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E82FC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 02:59:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1806.1655175562703214863
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 19:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Iu99+wvk;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3164603221=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25E2x3fZ024932
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 19:59:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=7GU3ZL+YT0TI7dTq79pgSb+8SmlYySdewgR9q0AFppg=;
 b=Iu99+wvkJVdq3SVQFbVxUbI49khnJ6riH0Bvkn4pXGXec+sSxpBCDE5ngTsN1hFofSk8
 1az5D8skxucAaZgVlQJjPHYJVzDQNM64qkEFiGoSZt6VLXsYfvq8Nkl/7MjJMaBwUdtn
 /LqUNOg4RyhnalDht73PL3ZSJk8BaTcXRyt1Iwb0VthkhfJ9ZyHL42skdpVx39Lg/a+t
 6HvkmBqUPx8pLp9tAOlMqsW4AwB96jNhlc+wCcAEWbXS5kCuNXvfdmEMnXfkA5YSvExL
 hijSzIF5Et8MxrO/q2vyXb4oZhC0fGVPwVcgDK6glTPcocyYl4ky6Jyx4gFwOzYv95Hs xw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmtjkhthg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 19:59:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TN8f47ybopiXkqOZiucmjTgrWEFaSGXKoLSasRTII37AjN5/4Fz/dc4JuW9gDE5yW58mXntibia8Hqx/vIOcdUgAXx//lhFHNucV1w+ptRI4bZwooq77jsslvqIFIEZoSUVDIKTh2XmnGMis7l+TD3Qgprhuy+ywX+T6gFSbEYQ/jlAzSGshno+h0FCiecZKEgdIxbXRzC0ymTaCk4qtHGSlZ4RTTtLUgqK2r6zZLkJDIO7HG3WyIOfVPxyozJv9f3OfN0h0aDaW3PBG54yvF0c3V4laUQGVJzJzUl+8DS7eki/ZM9jNbktAkKCyQXo4C9+L8D8lB0TifDgXo4HVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GU3ZL+YT0TI7dTq79pgSb+8SmlYySdewgR9q0AFppg=;
 b=MeRSR01RdcOWxRu6EIfymrFCKNWJhEpOemroghefa2UEag947JCfFbsKp/HBHqwzeUjR/VdpBaFmiuoybiyqtgNWvV1HYnN+0ZwQ+ozywSVyHJC7IHVywLbdPz+gB8h1/NYf30gSr6tJKYQRTy6WKbJaPFF02O45fLB+Zy91s3THqsbjaQNlE/bdYPBWJArkCH6BwLQSmCkMfmlJgVB49j2JuyHHfs/M7YafeAEdWfc6EtUOVroz7yfG4y67/DeaEcKRLTFVm7Dkyh9SuXotEUSOPYbIDoLl+URKj0GsAyrHxCf+5QcxuL1y0Ote4z85tiSdA9ZVX3luBPXghJPgiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 by DM6PR11MB3817.namprd11.prod.outlook.com (2603:10b6:5:13a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Tue, 14 Jun
 2022 02:59:20 +0000
Received: from SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::a8e3:9407:2650:5a17]) by SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::a8e3:9407:2650:5a17%5]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 02:59:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] duktape: fix override syntax in RDEPENDS
Date: Tue, 14 Jun 2022 10:59:06 +0800
Message-Id: <20220614025907.815496-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:3:18::17) To SA2PR11MB4875.namprd11.prod.outlook.com
 (2603:10b6:806:11a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a3732c5-8d98-4054-1c07-08da4db1e071
X-MS-TrafficTypeDiagnostic: DM6PR11MB3817:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3817A0EE87AD2ABC49772345F9AA9@DM6PR11MB3817.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MY456mZeiwTSDvU9PUpnt5zJuBtsFGka5AohN2ACldgxnA7TrmNW+kPsz3PzhrTLBiUXHHE6kUlybxzD/LR5SZ0uTT0ClnmSiodj9kfOcoEfuNqG/lKQ/7eDj2+KvtnklkfO1P5HRt1eJT6tkTx/x1AwMAbWJK5OzO8FA0fi5JQqY0OQ7kefU1itMBlqHi9XiY0r0pWymKudypgdbig0GSZ7Sg2V281BH9s8PTidCL1gDY7XTIayti1Y3X/9PBKgT4QpMCP3uz665lDXRjM3WeS26ii52j077JYDRCfrgUE2C2veJGpHExCmlxZTl52vU2T2alOnR7AXXtoNJw5MeoI83+wFxcgAT80co5ZUTx0357XR4Ez+EecJB1i8DHAzHesJ/GtMwKGdX0pmpXG0/QxEkuEy99nwuN/l72n7OPkDT0KEhOdesPABHL9RGSUhxTCWk89d/wONua1w8YH2vOl0EF1M+Pe4lv1b8y6sU+pi4PBNPNsl+oZwy0qIruGPSOiiEMVc0xzvIRBYugxQLG0QJHLWSGLeEmhh5ckJ277p6laRjVYxUJj1ufh/4LAP5pUrCVCScZj7Vcow5CD9ZUGX2BibXYK+JbdVb8BIdYd2UjKgNtQoHjpc5tU02CUCD/tN78VyzhAGsG+t7qlDeXbhujDni04yeFv27z6kG9WrDQQj10kaVBwEcTKRgZLG7qMiNuj4SmB3/RPfADEXWw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4875.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(36756003)(5660300002)(83380400001)(44832011)(4744005)(508600001)(86362001)(6666004)(66476007)(66556008)(6916009)(38350700002)(6506007)(38100700002)(8936002)(6486002)(66946007)(8676002)(2906002)(52116002)(1076003)(186003)(2616005)(316002)(6512007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qphbmY+d0jpvZR81b+HrSWtWufeLtaftQ1YP2RQQ6HiCiXJrfoAGadV4iRzC?=
 =?us-ascii?Q?71KLvS8EKeI0n2dPDt9S/BndpX22pMQzkWbngqWF+K/kBQhswydzxnmGklsJ?=
 =?us-ascii?Q?AKLNj+PP0bOTBwwk+HHahXHjheGAPzrIECTudv2M3kRqSOxaW/wt7sULMssG?=
 =?us-ascii?Q?SH/ubeaW7AHYzpid+f9moaciql8Vh6VE7T+F+udu1Y+ti5DszPzpDD788T39?=
 =?us-ascii?Q?YoHMoJ24drE2ewa19ctcs8I27uhPRO251bMGKT3C8jkRBHgxzlgEJ4mYUwJ8?=
 =?us-ascii?Q?dCg36DpExTm5wWUn4FQj1BVTfMqJ4zkp+oGDrfVxsX2LE2OiUm7f4mFAc9qG?=
 =?us-ascii?Q?oP3i755W3WL+tZ1+gLGN41vQUXKtWiXrhBDaz7EccXEHOMmjxkco1Srap5tA?=
 =?us-ascii?Q?I5kraNyiC1Hg6F46yah/NxEVbrUxU01mCSnb1t6PAJuhtIG+0kfD/qa2n67a?=
 =?us-ascii?Q?/Kr97FqDT8ezlh8FMKCzpczjTun9clclngSpLpKyUESLvk10wHWXlQjCsDPe?=
 =?us-ascii?Q?dtu+TahATfi9YSvv1eDbnbqsU3LApny+qTPtxIhUZQCTxRQKio+m/mAJaME2?=
 =?us-ascii?Q?j1thP3grvlhwVSoSFWZgTwZlAXN9+zAt09efrNiwebziF2248h011eqFjk9t?=
 =?us-ascii?Q?l7LXCpbY/D4GeZqnEpRtxJi3ppWWgIwaidgVnPzn6FbFJCkCW96Lgx6HYSGz?=
 =?us-ascii?Q?LpFb+IlugK0EPgSd7xD20cesqtUNTbl/6oi/zbgS6ioSFTV9ceKlaMqEvQpK?=
 =?us-ascii?Q?3gtWPWMM4UNMq0CwY1EnuasXZ3ml4ypiVp4gVDx5VHK6WMcCXQkEUnnGiFTS?=
 =?us-ascii?Q?LzFCbKfszmFrbi9bMpGmSeTbqvQwVmzz8TpiKK+Dj8o3kGDSM2vUbNopnSMn?=
 =?us-ascii?Q?7chqbQxcvv2NJEYXjw4EDd7ZlZMvP34/AK+G+Cm5sZ0aHBBMrGBlA78qeu32?=
 =?us-ascii?Q?ZXHiwqrk9e1cUhFViA62oNQToiw7YZiADm5M9UzmcDpRcN/JviWMp+oO0qkJ?=
 =?us-ascii?Q?iNdeopRKvvhP74j5HPvVABxRAeOleY5abzqLsH+NczRLWW7hTJbG1wr3rnMJ?=
 =?us-ascii?Q?/kRNL7+f659P819gOtaI4j0Khjo4AOtGHhLzmcK+UowhDc/RQmtpq+yae/ZC?=
 =?us-ascii?Q?TFu+sQzSao+iEjm68Y4XVZxewtHwJngN48Qt8cPARAneiLtX0mFkSgOkQRg3?=
 =?us-ascii?Q?JcJTBAM4TEdhQgk2IDeP4GfIZXLmL9pR59nwjcLTTDfhHqyhL6aoMVT7wsOl?=
 =?us-ascii?Q?ktgeDRyq1WNXlQMIRGj4aSfxSaHk5VOUbfaNeTprtLJ+qJv3n9WHBNOTTmvw?=
 =?us-ascii?Q?qsXBmBzeOwbC8I0AT3kIcL0ClpKCvqMqkS/+bp8wKDmmDRXjqqJhzXpKJ2CP?=
 =?us-ascii?Q?LXBVF5RdtZ2yjaKkUemOSM1Cpg/C8sp6x1bfoeUo42clFoaqEFGnvT+G3oOQ?=
 =?us-ascii?Q?0/kIvjoddEAaU5Y0icpqEvq3uMwXreaZxAb0yveDwtbYD74cSIwQS0xfznTg?=
 =?us-ascii?Q?4Vp4g3XKo+0gzXSDFx8MrJTPjQ5gsZMEVYMT+JYx/+pUqA1kTn5rZDRedA/4?=
 =?us-ascii?Q?km7MsrnmbqUNy2V7bUphld1Z0iaYsgX9z0D2sBYc9jdqPwfAUtwO6nXMcv4f?=
 =?us-ascii?Q?WjcBzh5ziTVKaZGrZkyDmWnTlLqrEDwmEAj7w0PeeNy1WagWy51f4G6FTLqW?=
 =?us-ascii?Q?uOMw0I+OZgvEZ80Hv8OlWD9HgZrnP2VLhbosJvt1BwzSzG/gt+zeqVkd6x4G?=
 =?us-ascii?Q?/sfjRzIa4g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4a3732c5-8d98-4054-1c07-08da4db1e071
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 02:59:19.9530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 u23zWrYNun+URJyeIVlFrur26GmVbRzAEZdbbbau0/yeiKv73Cdi2Rl23ISfqxJo5VoNQ6LhPjFjy5mQ94iJYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3817
X-Proofpoint-GUID: MFTclkYIqQwd-PntxQnUSwPa--xQZMoQ
X-Proofpoint-ORIG-GUID: MFTclkYIqQwd-PntxQnUSwPa--xQZMoQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_01,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxlogscore=515 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206140011
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 02:59:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97495

RDEPENDS_${PN}-ptest -> RDEPENDS:${PN}-ptest

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/duktape/duktape_2.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/duktape/duktape_2.7.0.bb b/meta-oe/recipes-extended/duktape/duktape_2.7.0.bb
index 583e8337e..22b6c782a 100644
--- a/meta-oe/recipes-extended/duktape/duktape_2.7.0.bb
+++ b/meta-oe/recipes-extended/duktape/duktape_2.7.0.bb
@@ -37,4 +37,4 @@ do_install_ptest() {
     install -m 0755 "${WORKDIR}/duktape-2.7.0/examples/eventloop/ecma_eventloop.js" "${D}${PTEST_PATH}"
 }
 
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS:${PN}-ptest += "make"
-- 
2.25.1


