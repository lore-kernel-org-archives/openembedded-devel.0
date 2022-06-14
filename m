Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FE6C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 05:03:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.2563.1655182978963123248
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 22:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YBwXaxsM;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3164603221=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25E4uBvc004192
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 22:02:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=wzygQ+jdUchBEpZWYs569UpqjK/N5LnnUsCsNvVe87M=;
 b=YBwXaxsMjtMROORpXcgELMmQEHtnFVcegzhFkC4nY5cHriLFKQZNTUAUAbFodB+svosq
 WzM9siuGWR3dWLURirAwo1eU6Po9+HT5SBe74tRMGVGI4WRsi7C01dm5ZwkqisC5uPtH
 5k08jwSDumaX7wAo1ymMbZQPhP2jrw56qtE5RXPJt0YmKEq9ZSGS5SQt0fkq694F0pVp
 3EZNXjhgErcypDXH8iN86gmjv1EsauXHS/bMRKw1+hhiKxYB+QvbN5Cd56jBZ3n/O+BJ
 bNhzd3mw2gn5dgIjwAn1SieyGOQoDUdmi69N5wl7yIIS6Om/fiB1TTlNx7PYpCfWhe9U tw==
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmpb5a0pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 22:02:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZs4IXbU3gE8g+ZIcdWMD1Yb/rmYf+2L55xurckeB4dJFO8a0QyUTBPioTzPWg6icwwjmTUZAMsJuuPiC8wKQ9Nj9pPGq2HsrO+DR4a6/yMDAbWJz+H7pAkg9uoPDR6idg3XNWs6K7O67MFy8EJvssq6NR6MYMEz/rWKEapGAd7dS8cDuGiy1gQzFGxvLCbH6is7c3pDEcPC4q0OOQec98eqo5wXNxcirbGqf4pdFg6hcbD1vkqnylA6CDwWUROxXC/j6DQNMVjVeWZEEHKPNh029unO7Tex/tdKcceWjIraaDAG1XbJQAr7/Bzh+wR40p3KaOzyIOUo/Ja8IbBejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzygQ+jdUchBEpZWYs569UpqjK/N5LnnUsCsNvVe87M=;
 b=j3kOD7I4cNpxzZ1DtNigaWk/J2jgbo7CUkonjQOEmkm+cQQpZivVyNNq2ZZCan+WtrwAGaS2NmuML0IKJW79SYIXEF4aI5wclz3TI5xli78+f7jo6Rt+sSiWXcOLasXcWDVf8kmRSnWMROxm/gX8+EI/iuoBTAOdUKfkauOiL8ocMTBqWt7f167bknGYqG6VnTGP3Fx6s0XmxXIvVxEN3Wo2v/0P0+CCt47gJpLwzlW2hUT05i8YPHIhdKOQy5xcxpCxsQIgeJtBR5qZzrp1Kny7WUUKnkK1EXDk3cHuACdA2U7zb0zRRvmgbv9TzD6qwdnv3NIehTcsq3q7UM4KRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 by DM6PR11MB2906.namprd11.prod.outlook.com (2603:10b6:5:6a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 05:02:56 +0000
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::f853:6ffc:1879:faa9]) by SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::f853:6ffc:1879:faa9%5]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 05:02:56 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH] libcrypt-openssl-guess-perl: fix syntax for
 PROVIDES
Date: Tue, 14 Jun 2022 13:02:42 +0800
Message-Id: <20220614050243.879733-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::17)
 To SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5a22ff3-5ab3-4212-35a1-08da4dc324be
X-MS-TrafficTypeDiagnostic: DM6PR11MB2906:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB29060FE13270350DC56397E8F9AA9@DM6PR11MB2906.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i2DncEdVKzS9Vet+75FvCfGPReboWQmhxp66efbo8d53bL721gJni5nnraK20zzHC2xY5onRjMYUb12JEPOrUB7JTzns1iJh0YLyZjjXmGaXSqO28OU24cMs+9wnVYPLPAcANpVDKhhzV1VyrXr1Il1GzQTlPSQKvf9GeroSBiQ+sm+A8hTRciMYJPaNnT0BFZ9zR7Gj6RRGMTyDVoF+cxeszxu82No6iLznhyGFJVnC5jj8MThyC2a5wWOhwCeCoaQSEINJ8mQinYXVAS++dNkiMumcZlh84Cba2036uNfzeIseI4uzYSjvzXNldz3GjAWEhilgeYU3O78zTfGem0NAws7qqNiC1YnPIrFOUj50kFb9OomxCCHCuihB4zcw/JpA2dWzfNXde0PcEn++JUoiOSFa4T8dgBm9x/INYiqrRknPvS28wGejxJYe4wYmra17Kv+E8cOgkAwTG01YZ/aUNkods+UCQlXhYUKpYywEww3lwXT6pILhIZblsKTzye3EhN8cvy70Ja/rE+i+0Ga1veshyPGcwy3EQl6z51/wXGQKYq2Xt8Cnl8sFV7Q7NaTIE/kzSB0H7KBMpzWSTQALkqjt+zSPHPAT2vP+S0B1T6oq4087Q+2Eu9awFPxYOiLREOKdY33jiYfAvP8ccoBFvyyFOUOx+RvHqk69+fFyzF/g2nxhS5eNsu2ge9rW62HxDcnZbKAd6CkYZ53Zig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4878.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66946007)(44832011)(6916009)(8936002)(4744005)(66556008)(8676002)(66476007)(5660300002)(316002)(38350700002)(38100700002)(36756003)(83380400001)(2906002)(6486002)(508600001)(52116002)(86362001)(6666004)(26005)(6512007)(6506007)(1076003)(186003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dg14uLKgdarXmfaWqSjJAYUUyuMZVAOX7Ko+j7kbWzLmO4JrC2eVM/HtRawY?=
 =?us-ascii?Q?r1Dm1fQJYisRHLSNLxxO6GEgwrw7/cmxG/PQ065ym6OVnDhnTbAX5cmnr57u?=
 =?us-ascii?Q?pFRrnuj/iZ9TWkQSKqXrKl7L3WdkJC8LiscvzkCszdUY0YkkF5a65fR77KzP?=
 =?us-ascii?Q?F2892/DNWyDHOU4aZh4s1u0eeMxtUuRGMS1FaJV6NRFsS6pJBLSMUrFKSUb9?=
 =?us-ascii?Q?5r5odmWhTfR3+024Pk067P5gDGwAav09XqM2sV+7MlGoNKGkLNqhIWA0SR2u?=
 =?us-ascii?Q?T4zDMwVk6U1+UjDjILCY7Vh/8wtzVV8iGkeVplEOiJ/ovjq39EiAaT7Yvznr?=
 =?us-ascii?Q?dSE6YSy8j6pdpn3uABM10i86cjhN0Pe53TYiHfycg+S245te/4p2E/P9EOGG?=
 =?us-ascii?Q?vk0LzFozLZA6UBcBwj5NwXfboCpvsNoj6Ysd3YZpdqkOFdfUlCtCoKgmJev3?=
 =?us-ascii?Q?btb2UqlI5eL8b0VLhQjJUeYNVZJDUy3XDje2L/KVrq6epOmeVYWlpeVYZZ7K?=
 =?us-ascii?Q?JxsYnfoGKPEXI2tKQUECjIc6i8SA5KB2e8qDtO4Q7g5PpdFKMk43KnIvN9b/?=
 =?us-ascii?Q?73H2aoFe0COHunf3gqgjWv5edjSRdVKyo/ryRlwhHsM1W27eC2kmngmA3YHZ?=
 =?us-ascii?Q?RKQ2XsfBK0H9Oi4RoT3E4w1ha4HAU8UWmIovvVzqw6FN/HiAB/ZddcgzeiCF?=
 =?us-ascii?Q?niLxSeGxwGeMk/x9TH2PydLbCssrdLXs7LUtGIZmJhYKX502LSq66vKlOk/c?=
 =?us-ascii?Q?0t5e7B1ZchglCqW+4QoNhdwucWBpPvuI1RvqldhKcR32WUdtgKE16Brb9Bhc?=
 =?us-ascii?Q?GxXqzNo1TbHhSAzIzq+POscATKe96Jq3GSlwutvFbL4L1Tc7tVgNd0h+GK9A?=
 =?us-ascii?Q?DlldlZXOS30IY2XEAPaIKwMYa111uRHb69BrG7TNkuKc6k9dZi1fPpdg0mBm?=
 =?us-ascii?Q?fQm+PKJKH/tWeGj/yBBeASApZPUjz/l9DK6GflGC6HwR/1Q6TRkgHLtvlO2a?=
 =?us-ascii?Q?FM7oEUrdlPYPNHY9HvKyvNye1Vn6UXDg+zEACPb3YOYrNWWAjyxy40/mj7ke?=
 =?us-ascii?Q?wD5srxyakoBdsttoOwve2K4f5EaVidvt4U7H7s66D27eGgIZ/SNNIcj0/rJz?=
 =?us-ascii?Q?Fvj326Kj0mR/SFDE/nxJ/hbsb4zreKFBCXKp4xY90l1r7UAVFY0/Bby9jU4X?=
 =?us-ascii?Q?kG7fHjo/Skw8RpN3tKU3k8ImvFkGS60ROIFifG6LOTwXHzkge70W3SLo14a1?=
 =?us-ascii?Q?w874FGqzyuA+DU/wu5BLxrNtTP/Nlv6kTvNq3vz4EeN0b1RDFxrfLGniZ5pB?=
 =?us-ascii?Q?41bbesWnJA2p6EQV4YPR8Q2rJLXhnN6X50gOFAR6tAoHfNzXvE7u1i6XtY+N?=
 =?us-ascii?Q?ksku1tssaSHFEToi8tSW9w2lq58DCPhHVAy9dH4qZFoguCFtEQcWV1mZlR3m?=
 =?us-ascii?Q?Hr/1YA5whDLuBWFlIQ6jPb5YVDOWibzcAFRFryYhAYXjcJRzkO4oq6j3HgSc?=
 =?us-ascii?Q?62SxSqlK7/Uiwse83MFmjvgDYwlqjqahd8BGQjzg4pA5C5L+W9WQiIT6fsEe?=
 =?us-ascii?Q?1M7t1VylUf6YuC6fyOTTJycxHCuJx+ZvhDGlhWhwe8ZIln1eEeu1uGc0Btei?=
 =?us-ascii?Q?z6FmpGs/mDQkbY8Hqu45FkGfygWDFj916H4RKLpraCVg+EyEBR8Uh1C4NZwP?=
 =?us-ascii?Q?4Pl22pN4jG+FwWJunIH3Rvp9yMWdDTKgrfcE+JAvIxPhwyQXSGLtlmIgLR2r?=
 =?us-ascii?Q?2DEaaldlaQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d5a22ff3-5ab3-4212-35a1-08da4dc324be
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4878.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 05:02:56.0203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qd2nmxMXM9ydl3HPsxXZdV+Ubi5QK8l7VyGKqRrXtNlVpbTlq+FR51Z5AmA8TyGBGfzJ5LpiTYE3wzUkGxhymQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2906
X-Proofpoint-ORIG-GUID: DWLCYU-QCFz8qjwRemfDlkfH19cckPeb
X-Proofpoint-GUID: DWLCYU-QCFz8qjwRemfDlkfH19cckPeb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_02,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=710
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 05:03:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97504

PROVIDES_${PN} -> PROVIDES

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
index 3f004bb2e..d64fc296e 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
@@ -29,7 +29,7 @@ inherit cpan ptest-perl
 BBCLASSEXTEND = "native"
 
 # for backwards compatibility
-PROVIDES_${PN} += "libcrypt-openssl-guess"
+PROVIDES += "libcrypt-openssl-guess"
 
 RDEPENDS:${PN}-ptest += "\
     perl-module-test-more \
-- 
2.25.1


