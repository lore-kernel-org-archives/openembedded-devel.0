Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44DBC433F5
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 06:14:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.9015.1640931244608661381
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 22:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MeKgiuMY;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=89994c103b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BV6C1S4019454
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Dec 2021 06:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=FmN9ym3DwrY4dlHP6qsEmXsEGorpSkB7dKDggU4N/Sk=;
 b=MeKgiuMYAxV7YG5/lSIY9Xoi+EvZHamXTIyy4leQZnfEGBP4k6tpXSM7Gb4PTbR9zK6k
 gtUBO8hR0JVMhtHKnIBATJRkJPWgkgbZZmtfPyp9p6DyxNaIsQcpv0i8TvrgtH39O7Vs
 u2wAK4XuBj4D9bApc2DKtRGRgrxAgvGUlbSiVg+kkgUkEaDW36arDt2NA+Bcxb1Iorvb
 IrJd/13bPf8kXeSqVgLIVMXEH5bloMMfACGt3Jq2vEoS0hRi+LcqYk3OCHBmiTAgmbAi
 EsflSPIAlskZa8cvW4DgP85qFzoJbv3FmiIhZslONmgbFv6Py6p1xNWXdQxZ2D7D/pnF KQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d8x51gtfp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Dec 2021 06:14:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEYswJkI2d9ZQFfShSMAqttL5jVTLrr6+yEBYUVgu9PdnruHQvN+bM1eRhjGUQGR5zTJIBLNMF3KrrLfV1lR6mVowQhGppNykAkagfGK/LROJcHsHyTuazZ7J6uUHs16ogC0F8ZB2SpZIJd+UYV047B3wyhMmDc7RgsssEYlz/FneS96Arn6m8LxIjjpvQmkD6pDvyA5JCM93yLo/0Pl4n03wrBpRZk+Q3snL6+sChHsBOzoTfr+wsD/aTTRfzIgN1BD8mx5hMk8ea2aOUOa/ChpwF2Bp/pD5X/PcVri5N++xbFi5/xKPV2RmeRK4bRngPArcmqnckb17M49nsOqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmN9ym3DwrY4dlHP6qsEmXsEGorpSkB7dKDggU4N/Sk=;
 b=FB5vFQZ9mb76kBcYUy97aXbXjQI1A+2C5otMbqQ1EsqgWjvUZBy8FMxm8OhSx2ImpPBiKry+c7zZoYj5fYLn9vE60nt9EIiLQnfp15FIxjwdLe8Ck1V+102OEz3hdmVy+abiuYS0iyCjl4IewGmrH40czLGiRJjGkBvEbSlRGaYEPLtrNcopWa+v9pliKciztF7/b6VfBslvjW+Gon8PZWVmI6KHqirMui0Jezt6hqoWI2oQJk3ac7haUVTyWx05VYkqJc6Vcn5ffKbEiGG+7AxKvbm/ppQzq4AqhvMPtz0rIyjuQGsP1BlUgZO+qPCoqHqsezUAWrLMrY4Bf+Q/6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Fri, 31 Dec
 2021 06:14:02 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%5]) with mapi id 15.20.4844.014; Fri, 31 Dec 2021
 06:14:02 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] lvm2: add UPSTREAM_CHECK_GITTAGREGEX
Date: Fri, 31 Dec 2021 14:13:49 +0800
Message-Id: <20211231061350.1166984-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211231061350.1166984-1-yi.zhao@windriver.com>
References: <20211231061350.1166984-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0195.apcprd02.prod.outlook.com
 (2603:1096:201:21::31) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 803cee0e-20e1-414d-fcf1-08d9cc24bd69
X-MS-TrafficTypeDiagnostic: CO1PR11MB4804:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4804925EC65A871AB61AB28EF9469@CO1PR11MB4804.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jpjm+l8rJecTq0dyBP+p7sWYjpkoNuIJNT8HumqcfKnb5Hgq9ufTjcOeODy4grMvyEmvwYEykSrs0DjAk4nwFuBwVLYr4fa0vVOHlQaFUux010p7xSwsr0fBxZ9PwpuUgw45dwRuqzKdEZmS9sDlRNb+Eh5jYhV8ahkAAc61t8arNJRE2gTicOEMA5ltQSBDm8rFEWLwA2IOcVlYu8gYIbk9DcNATfT2VCpoYJyfiygdwDDNIJRz8QW6z7i8mtRPI3M9fvA7SeWlzIQnpo1iNWaXFiAtq4maiEk7Q1+5gxlQLpgwT/kvXLEonZ/S9uNqmwEEGeVxOUMTN5vRDoPfuM94OnDYq8QUA2Y7Hbfxko0wdxK29ib8FJlBC4ut9Cfj8C3AfoTmyPI8Tjmdv2xrmL2cQ5ozRBng0sMmdafl5SY9WZ6SzGEYRcfKQAmkl+5X2wu5tsFbd5ZdY7xxvJqhwOZ6hEaKBYaB7SMgpwS11Z35EuXh1YAhBvRq91suTLxFM1u4OMHE+Fp+j+7Kcp6eeRax1Q18jDzdzHHZOOJyKqYwSlAqsy9/0m/2RlWXQLUsn1c4i/naDEpudK0dnesVlDENWTF1yD6WmYY3zefuVsTVN8Uv9riXelcnynK66tdvAKEXyL39szgapU/zHF1KA7kwOOW1oDym6dMQ7W6KZ+QtEzSTZdhkHqK6bU4+oGPjytTbCUpyr7Q5Wg2/QvVG5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(316002)(508600001)(2616005)(2906002)(36756003)(8676002)(6666004)(66946007)(26005)(38350700002)(6512007)(44832011)(52116002)(5660300002)(1076003)(186003)(6486002)(66476007)(66556008)(38100700002)(6506007)(8936002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y2nNe6Fp3pEEfd8DeduXL2+U6eMFFmx8KowvkeodmVtGEt/kGH9IoiotWbfF?=
 =?us-ascii?Q?2GlTrjjSX/7nU0460hoKTSLG48B7aMSQwEJY3XgZZkmI1AMuGLzD7lD5B7hV?=
 =?us-ascii?Q?FV0CHkxl5EllD0GXoNY6bspI0BrSGKZFEac9PW7ZPyNoKBwUFPFu8KOVMksR?=
 =?us-ascii?Q?ggDAEATT/yipJEdTF1NTkwNgsa3ubVMqLfLj+CFxOpQxmysycKoatC3ANqFj?=
 =?us-ascii?Q?WFjaRPCZmdP/9y4SV4696e+16ZJsM3MxEAguFi5xqWwvFuoGq04nCeavtjX9?=
 =?us-ascii?Q?Wwsn8OXqP3X2UlACussVna4m+Df7MFtKtctLViGdimchM3z2Ap2zagl9L/7I?=
 =?us-ascii?Q?jMP4pXMBeg5WmcFUwn0mo/qG73KqgBirRtTPzKa4Th2Ywagr+J7Nsr9jtYiC?=
 =?us-ascii?Q?BQqClqcckz8GbM9Q1a+/7WmRtFFXpTPi1NJUCZMjUczNykt7jY/AqPX9Rehg?=
 =?us-ascii?Q?T2ZUKty/gxeNiiBba+AqhHr83KadTnPgrUzWpBRsP2iMlOXDyOh0P5gZS7vA?=
 =?us-ascii?Q?pSMue8fTa+65AigCU8xMZw/8YQRWiwTDHWtjnMz+asWuRgb9l7bhQPemk5HI?=
 =?us-ascii?Q?BPnATWERfnOipCUFMSHAEANlX2HUa5bDz7cikKGQPKa2RLqXW2P7jTM0l1Y2?=
 =?us-ascii?Q?YFt6V+9W4+BTtx5fTwpwqltxNuWEn1t3dw5Wzae3JSuRM9a1mkREHkjMEryn?=
 =?us-ascii?Q?TosyKMeq38Kimma+KBLo611hBCy0ol6SmjMvtULusiCuwZeqz8NnNlda5H2R?=
 =?us-ascii?Q?NY0sYgk/8pE76Eut48dMrGS/w8rZyU/WDbskR9V8xy4XF0hwBnkUeSMkHbZG?=
 =?us-ascii?Q?vCQe29K45o2WibEPRmKqfMn3xoNGX0vDp9AWp1BEYoc07U9Gq9mI5HKfowPT?=
 =?us-ascii?Q?l63AHIKEpLZ8MnIeE35GyokxEEokjvkR/ASSqkbGAQ/+O+d3HgthAn5iwAtk?=
 =?us-ascii?Q?LLdtFiaY4vBnCcPPzx/WoR+a4SnaJ0h233AP7IR6vb45S8xzgkE1SzilwiRV?=
 =?us-ascii?Q?1MGFOW46P1IGcsUjRo8znkG+LjixP2UptvDO9S1LPgF1St7I4pRDFVFwHWq/?=
 =?us-ascii?Q?iVJQdN6EL54qDluK3XJjKZ8i5qHMrzFlWrp+rG3igXXWwCoHTIWaMB6HPD4s?=
 =?us-ascii?Q?f2idU581eRa3FdwLAc84cLbmULBIE6abWQOAaJjlhmFKInUQ68tYmyah9lqC?=
 =?us-ascii?Q?TYCDxiDVOXI4yvloYcKd7bu2Mw/v9kvoU2ooeVhoZyqRoMsyq3qFo8jw+I+O?=
 =?us-ascii?Q?lNq+J5de8tOv94ONJ8Dqy8JMe+IyZ4cSYZYFC+L5GuvYJXARZayEbv0Bn1A2?=
 =?us-ascii?Q?BKs5BBg3k21/ylGZULcrgFRkubsxF5UdrCaHtYAAXbgVhpSzXll83DYpjhJn?=
 =?us-ascii?Q?OmIFvCSe1ACBJqiaryLGTttGHI71IyqF4AtRLCpBWX2YNCf8oYgUGrgPON/m?=
 =?us-ascii?Q?ZILI/a6ar7YsoXvfftaNlRs3p94QgxBAlVybNt0825qxWlSDcWofozBFoxgr?=
 =?us-ascii?Q?SZenYf/otkKm055MDttr4emc2hpBsHUwLEUXxSa5IxKhGWsyZ6xIgkN4Hr8y?=
 =?us-ascii?Q?DaS+TrfJWuJVrrH2D0fCrSYOOPt037eaBYwYiRDUhNHE04zpPahgoO/zjtPb?=
 =?us-ascii?Q?QhjVbA42adE34XcCbsB2gbg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 803cee0e-20e1-414d-fcf1-08d9cc24bd69
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2021 06:14:02.1520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VN/4k4jJeZxJZ/Db3mmFfQw/lGu/Wyu2Zy9mnQ+TG77+wyCC17bhj2+t6qMYeBk0LjkOWZlYE9jaxlYaOhTh/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
X-Proofpoint-ORIG-GUID: CjtiQ05C5YJ4p9wtmyoyE0QGtJUHJ0_E
X-Proofpoint-GUID: CjtiQ05C5YJ4p9wtmyoyE0QGtJUHJ0_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-31_02,2021-12-30_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=880 bulkscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112310030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Dec 2021 06:14:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94578

Add UPSTREAM_CHECK_GITTAGREGEX to check the correct latest version.

Before the patch:
$ devtool latest-version lvm2
INFO: Current version: 2.03.11
INFO: Latest version: 19990504
INFO: Latest version's commit: af9010d115cd3b97939cec0120126aba262ec57a

After the patch:
$ devtool latest-version lvm2
INFO: Current version: 2.03.11
INFO: Latest version: 2.03.14
INFO: Latest version's commit: ef4521831d15a1785e034f6c6f536a03446f6e05

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 43356c9cd..cccc041bc 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -21,6 +21,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
 SRCREV = "3e8bd8d1bd70691f09a170785836aeb4f83154e6"
 S = "${WORKDIR}/git"
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
+
 inherit autotools-brokensep pkgconfig systemd
 
 LVM2_PACKAGECONFIG = "dmeventd"
-- 
2.25.1


