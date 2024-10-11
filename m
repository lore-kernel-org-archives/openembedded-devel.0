Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115C4CFD2F5
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 08:55:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7085.1728636951820691025
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 01:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0014a34f0e=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B5mOsh002838
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:55:51 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 426sffgaqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:55:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwjlOBK0ZrfvtmlaQtsMuy6WOXH9OY/2fs2+LGR+Psyr1FDy4F9KSkMF6iWEL0aqyazkqqN+mSU9saLG4Dk+3wW8+YrN8aM1Bjs7FOQXH8Pc+HynKeOeyUfosxlayXG+GS2zPunXe6bs3piT8EGndOaKTVklEAhhQYPJcOvcGJF+h9RmkPG8aqE3Xz6uSlLmiQm2u1d+hK8ZwUleyOEp8e4vZNvVk44hVdPWWaOXOZOnsMDinqOSvuu4qoEjLmpS/n1u0X84E2NhbZKhZfyVwySYoFYNJ7/vjGQ0RE3AhInjuCVOYH9tFrc5Dicch0I4CTetGWpfthXriDmjFnJzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOgNzPY6tfHNOCLJBLXLsRC7HOM5BbP+7YO60EgFO7E=;
 b=tcQD++lpx13PMh7ffmFwM13yJVhT016I6O96UkUhqYpood5Qii0e+eDLGoU3ifNuCrp0SWZsUf4pNWPeY4uE50r0drCZl57mVxAkytvxOcvIDe5U6tfo2yNZhfMXqmLyK7C6X0zR50hFLDXmiigVQ8IMv+0XHThtam5eKmoqXbvqQuknyAn4dEvPTsf5FmHf2Y9RQh5QST+UYy+mk+9emlYiZXHFDWjyiCssIIqKiW9+hmrPKJuu/bvRyqEBSjTZVU4JyLvb7QB95bKeiCduUwcJTDnijrEjPFTkBDEnW6SN6zRx+Pmy5VuL/CLSAaH/bdIz1d9L/iU9qM+c7b5bbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 08:55:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 08:55:49 +0000
From: liyin.zhang.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] sound-theme-freedesktop: Update SRC_URI
Date: Fri, 11 Oct 2024 16:55:32 +0800
Message-Id: <20241011085532.2205208-1-liyin.zhang.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0115.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::19) To SJ2PR11MB8421.namprd11.prod.outlook.com
 (2603:10b6:a03:549::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA0PR11MB4637:EE_
X-MS-Office365-Filtering-Correlation-Id: fde82b5e-d793-4629-dd96-08dce9d28024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hl60STVjh5bC6Ia4oPRe2YuJpHqiZKh3SaiIbcFy71rrUDUJH3paAy/yK6+a?=
 =?us-ascii?Q?12SWTyqJPMsw7Lcw+5tiA4B2j+lvJjmId1yvE3p1OHc75eGBIiZ5PGXoWYof?=
 =?us-ascii?Q?L6aviOXrn2SMrAsMLYMX7T5cEX909P1GzGo4un9DIl7BX8lFan4GkTOseltL?=
 =?us-ascii?Q?sOQvPcqhLMK4PvpXaHylw2q7znhEK0JZc+pQq20kHGfPt+gsChQoTyMFlnW/?=
 =?us-ascii?Q?iTtTYQ++naOBKsoTuA7J/zdkqW6y8LlL1B8C77BocahmmTqL3acrVW9XvcEn?=
 =?us-ascii?Q?Zv68D8TgbBlG0TKZ7rkfQ95ChTNx5MNz3GefmnZDVaZVcxCBJfL2tOM3DTRw?=
 =?us-ascii?Q?j4pF4fBPuW5zISt2n4JA3SQWso7YqZ97upkop+AgfFmb0HaTdTVvHXbXtIqh?=
 =?us-ascii?Q?4g7t5m4M6lp0TwHnagjeqtnM7inX5spkGjYUZZAcDst5B7PtAxi5IqlxrYdI?=
 =?us-ascii?Q?QENprjA1l66wRvp2jgmVIOhvXlvB4pD7HHvxT6h80t7jKikdGb283I8/fRak?=
 =?us-ascii?Q?AFBoqkUZ7fbASzvWLBU/L8lQ7TiHT/pLFfzVVDK0TK2LB8EgJoBHQOGVWGi3?=
 =?us-ascii?Q?9d8lEt/XnFaUjglfOatHPWalRRqW44fgUl3OsHV/Z/Puj41oOkkewDW/Z6cu?=
 =?us-ascii?Q?0LSzXffUtJ6lZn2eIRnpUSOJNdRxppVXFPE/AQY2y2NZKuutW07V4jBeQDWb?=
 =?us-ascii?Q?0AhuPZ90OzltosaAmNlincvXnzDrVzzQAQzrZtETYJEtI01zROh7HO4xit95?=
 =?us-ascii?Q?kiO/MY8qDig4xxXkeXI2mD1OkEZxbOPBbjK/tZkoFV+wvGtRoL3Medxf4rtA?=
 =?us-ascii?Q?Qrc+GJYJDlmwF4au9CX5W/Xs3SPjFz/+uQVJehHwwlx9GUnx6SRvm8PgRnMv?=
 =?us-ascii?Q?UsuBljEuf8F2N/zKAI/tdQG9oJx6d+MMGcPZ74jlLICs4rS9MQdKYHJErcXV?=
 =?us-ascii?Q?n2TeNMbbro0u/TL3+aFnlARpv0pqUfAGvo9INce7eno8aSGaFIDt2e4LLbQE?=
 =?us-ascii?Q?IJlfHBo3UB77oXkdFhA2bhF9Y5GUWswvAxi+9C3Wb+Mq86a70s7Otqq9aRl9?=
 =?us-ascii?Q?IBhIEeWyQiW0UO/QVlkGIaySmiOX4auRaZJBBagrMKzx2HJ/dA6YUI8defHV?=
 =?us-ascii?Q?sDY2p4Wlz/kUHWexX8Z55P8VcPK14mw2Xi40svLVmhO1q/72LM5aGmkicvgp?=
 =?us-ascii?Q?rNGCLb0GVdKL2fulhOQIuzkqRcCu8kaey8Z8qv4RVuU801xPUgmg3T+vNZoI?=
 =?us-ascii?Q?9tYaABL6opVMus/2RivukJCezdaSvihyjirimEc0/Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SOq889iwiEen+uLGLLi7zwMMX3gBvorU2fBvPQbrxWrXxh7VPfh0SD8jf7H4?=
 =?us-ascii?Q?J0fCk5ViUM7A9/4RudohVItVgHvOzTN2frajhipR1DNlEt4ce8cGZj9nKWLs?=
 =?us-ascii?Q?6B33b1SZdz/jExpBDGwfbX42OwcjgV3kgZcfcPBX7n7BKh2wPBHrqr0jXU3B?=
 =?us-ascii?Q?htKq81N1LaDTsNvc/qsWQZxrPJaWNG8Fmf7Y4uMKpvyHdsho1BDFh84ZePgN?=
 =?us-ascii?Q?oH+9U98KyUnMtBXyzoMC1KWmw+ZIw8ZehgPovyo6SSCD56O5Lxb7JoCh4EES?=
 =?us-ascii?Q?psl/f5axtLkzUqSGfHSJAewauuSrxJlAoaoKXFtVcrEhAzm+KX+xg7Mfkvs0?=
 =?us-ascii?Q?5OqZUopDnm3dKawpStD43tuEVe0I17y55Z84vByj1Zr+uKAe2w7H9QJ1GEy5?=
 =?us-ascii?Q?EwGFP84waIJpv6moBzBMwW/7TtY8daK1gDRNl39UuE/nCsdAcXvuo1vcFgrO?=
 =?us-ascii?Q?cchMRvGwKMXNTe1/NKv50Z+xqHNuMbt1Ra9h4MUoF/WAEJQzKNtdTK9eGhuV?=
 =?us-ascii?Q?v7DLJgk3IcE5itYGLDkGRGt3iS+2R6nNJhkkjS5Efzv06Aw/1fuGUmAoH6oQ?=
 =?us-ascii?Q?fdlUyjQp7YvmX10XFUYgE76+124dv/Jc/DOOeo0sb9Unj6bUp1JYhaRknyQf?=
 =?us-ascii?Q?2OhAos53plUk4h+lLevaPW9XIC1ooS70NTgmmaAjUoGdip2GPhEdxHNH1Zg9?=
 =?us-ascii?Q?2w806X7JSadKuUspaZWJaFnr3T6BThZEwYvh6ON0PB9xfx9r4PUok8jV+33r?=
 =?us-ascii?Q?u0GbiCsguSEzx8iQswJgmt21m6lv1fdjFabR4Pch4FLOblkRFsVGzDuvQ7sC?=
 =?us-ascii?Q?yTu2Vezuh4henV6JKJoThLtxS5CXU14VW8NTyj8/HKz1Zy7MLMCPiQFER0kr?=
 =?us-ascii?Q?xAyckxbwKvAD1NJYSAfJ39RhFAnckPB4RLAOA+MCw5ePevnTXPywCeN+DEH5?=
 =?us-ascii?Q?BjkbFuUfguDWoUSVzpO+jt80M7CLNe92bmmSgyd88NmKQnipInkOLisXDGfp?=
 =?us-ascii?Q?niN/ruJ2hD4VGdfCGQHmteHLkVgR1tq5M+gSLcdfFHxO1pdXO018f1Hp0RFy?=
 =?us-ascii?Q?ZCSQqBh4/PYU03T3/QJLR65FLo+aXafmtYNcPafXdfnUL61V2RF5qlq1l7za?=
 =?us-ascii?Q?fhSxYysMuj/HPp02NEh96H/X85rw1QMqPJQA6KiQQSjoe2JkemJ2NSVN1UHh?=
 =?us-ascii?Q?6tFCqauSjQJHHOQsLbNclpFOUiLdYAbxNI/7vgnQYe1Wwg9B4avv28JUhBSl?=
 =?us-ascii?Q?6f5MBcm60q0Cl1g9k7oz9xD2hn4qTf6bkgBROw5VdjWJQaDEXCG8wwdV5MMH?=
 =?us-ascii?Q?rDjJ1tz0h+Fomq4v6ziU6RMFIKWtXIx1Sn7jZWVd6m8ewpKbxWosnU478Y+P?=
 =?us-ascii?Q?V9qC4QhYQeP4vu7f/+NFi3eGCiXNBu0McOm1Io+hDVHwiiipQmc2AinJ2ivy?=
 =?us-ascii?Q?o4pks8+/aXrsVQ5e7mpqdC1X3cG8d+e/fPweIVt0G0Drvo6RWtJMdhK2E0sz?=
 =?us-ascii?Q?P+LbFfJdsvvFmADM8cRgh+7PGtO609MnpsshNNhwvS6jzK+fzHnXLzvUus5B?=
 =?us-ascii?Q?ECXz5jrlYQ8sjdGVnr3UsyIT59CAtS0vg/CGYQZRF7gjXZhGm3mMzsFOhNUQ?=
 =?us-ascii?Q?3Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde82b5e-d793-4629-dd96-08dce9d28024
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8421.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 08:55:49.0526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6E40cQQFfeOI0UDMa0S0anHmMeCtoATgXj8kXCHbYEfMLi8rySaFG3E7etrO8xZaEk6NPKuHIHnUI3Od73p4GPdtdXe5gE5jaVA05scXLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
X-Proofpoint-GUID: 2OMQB8b6voYmO3NkpVYvg8MakrnBMF-Z
X-Authority-Analysis: v=2.4 cv=IrZMc6/g c=1 sm=1 tr=0 ts=6708e816 cx=c_pps a=GbYsmhbcUJoGoLxTsnc7yA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=e5mUnYsNAAAA:8 a=DxLxgj1Zz3yi28Dz2jwA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 2OMQB8b6voYmO3NkpVYvg8MakrnBMF-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_06,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=773
 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410110060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112795

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
---
 .../sound-themes/sound-theme-freedesktop_0.8.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
index 87320a98e..508519e4f 100644
--- a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
+++ b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
@@ -11,6 +11,6 @@ inherit autotools gettext
 
 DEPENDS += "glib-2.0-native"
 
-SRC_URI = "http://people.freedesktop.org/~mccann/dist/${BPN}-${PV}.tar.bz2"
+SRC_URI = "https://people.freedesktop.org/~mccann/dist/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "d7387912cfd275282d1ec94483cb2f62"
 SRC_URI[sha256sum] = "cb518b20eef05ec2e82dda1fa89a292c1760dc023aba91b8aa69bafac85e8a14"
-- 
2.25.1


