Return-Path: <liwei.song@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253FFC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 09:30:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11658.1632821421081450955
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Sep 2021 02:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KO/9FaHy;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=490548030b=liwei.song@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S9MEv9029095
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Sep 2021 09:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=/oNO7x3XS8bH8pmtkNwkQEKGiE40RXKxRlU0Nj1u3Ts=;
 b=KO/9FaHy92z8X1oDUnOpo6rJcPuL1zR9z5mLc3H1zCBOh1QWVqIspkqT1z+ZeCY70MW9
 exritnjHMXK4IjpP261apDSahmq5gUyf82j4ueMcagcU5xMcNpmAlUu3hkOXaQS+PGPf
 n64MRVqroLDvqIwX/F7/o7OT/ZO+Fj+eCitRgGjaMgyKUPpGjVNseIeK0t7pM35ua2KK
 u9vliVW605+1OO+HCsFzkDY3UbZ4kbwSkFsHMmNnB1xzgk7tgGx2cY+8M7gz1ULrl8i/
 TYgHnvgLgrkmlzstGjB2i5XmQ3fo/S8FPh0jLBSTmN8xLKaNQ8ofSBeWyHAxfX2+UEWE kw==
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bb8nhs08j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Sep 2021 09:30:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCgZC+jB541OEjvCZDdoFW43IxJJAA2TcjPS+JIC19aPShCASGuS/RgKGYs0rPBNZQCGZY/u8b9csGIFBwNKS+IJSbDflORMlg+dqmjr3nkhvsfol4ar18PgpidWNrscSTPpOeo/Ne46qay+Mo38TQZL2KV9YwnyaxBGHIW0K5VkoT436gWAJrUca3392fyAXOO0olT3MkUdCiwPhfLgkX9na1jLIoRRvko+4d7RbGamwKgSy9lkfwIgAJZPLCU5RSPHsgT4rXYj3YXvzi0sR63neYjnDvOpu7EeKgeJPSctZ5U9rvM3CKhn7XI3fKVdIlIHcDm8IXQUOnKVziKF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/oNO7x3XS8bH8pmtkNwkQEKGiE40RXKxRlU0Nj1u3Ts=;
 b=CTx+F65y85oa8w4vlBgnWaX2BJz4VIn6ve1YKMXMT6AGR1XIHQlLhJIrMe9upSsYn0eQmQwZOvJxAYUyJkY3mWb4vFaVLJAnIo2T0B82XHYlbe9cYRX1NHVaTAmFJk5CgX0Qd4tzrGZ+cA31BrgKpKi1n4LyA7D8EIvEsldKo2BoUA19g4G+/SRGYbyfTK1fb1sTdXPkSrG0RXLYFoNzrSgXOAFfJw+S7xNeMyAcYoKe3OlJHxzeo131i/eSwEbd1mIYTA+5Y35HN0tYkVoRc3CwYAQJpt8lA7VXcoQ3o1pjGpk5I7zv0jZPtqBYiu0Vagsq8T2w2ZjKpEq0eLiYrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19)
 by DM8PR11MB5720.namprd11.prod.outlook.com (2603:10b6:8:11::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 09:30:17 +0000
Received: from DM4PR11MB5310.namprd11.prod.outlook.com
 ([fe80::70bb:93b4:42d0:4fb8]) by DM4PR11MB5310.namprd11.prod.outlook.com
 ([fe80::70bb:93b4:42d0:4fb8%7]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 09:30:17 +0000
From: Liwei Song <liwei.song@windriver.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: liwei.song@windriver.com
Subject: [oe][meta-oe][PATCH] chipsec: platform security assessment framework
Date: Tue, 28 Sep 2021 17:29:58 +0800
Message-Id: <20210928092958.19196-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:203:b0::29) To DM4PR11MB5310.namprd11.prod.outlook.com
 (2603:10b6:5:391::19)
MIME-Version: 1.0
Received: from pek-lpggp3.wrs.com (60.247.85.82) by
 HK0PR03CA0113.apcprd03.prod.outlook.com (2603:1096:203:b0::29) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18 via Frontend
 Transport; Tue, 28 Sep 2021 09:30:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b46118ae-53cd-49ce-1484-08d98262952e
X-MS-TrafficTypeDiagnostic: DM8PR11MB5720:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM8PR11MB5720515543612A458094E7519EA89@DM8PR11MB5720.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DXWC6qXQVbeDLd9g0+0nCC/vTSaABMVxx7SGNTYwdqVcmwOjsuJe1AGw9G2YNoVOnQdsE+oqI+KUwW6VRFDUbqzzLjkKAdUoWa5ipLVNMcvQF1QiRpeo+G8i0KaBRzD5NxufFeaZQOJzV/kJ7HbPALyBAFBzrdL7JooM12QBrE7Fa00PZVn64paaDME8GDxSQK8DY4SGP56AhbUiRgyEfUk9Oekn1Rv+SJlV2XoU5Qb+/X16Yjs/i55AoaqeLtoti3EMbfIVswTbB1bJZjQhiXrwl7dRi2GwztGl0YK2Hz2cPLXvOeyppPTpSYmrMlYvEGBZlYDEmMfjlUaE0NJczVIQKtPexlaPXVvO9ovbLPvqeqoYHlukc6ei/rRZZ8q2qMGOCmVPlf0qwOxVx0HJkkQU/D3r1ksSLpOpDIMuBWvbgNOjI7cUJj2+Mh5bgGlhypVFKcmxkH1PGR1PqZ0JvZ4/RIBgnx1hxwczuBRXZ0x9dv+Wf1HlX9xfNl8ibmJ/8o9QLzvEz6+FUwR6EtXStaGCme+vbOflkD4hfHU7nq/VNlQ4u9GQoohOt3a38EO1yFqr56vcLHJvAneSW2OMbFZB7NLESRXVaMML5MkLI0DsTuQ2YaOOeykBgkujKhJfyslpMA6nyva6IDcC04CYVULHxdvQcUtk6w+KsUP+pT6geG3z4R8YkkKcXDdEyJtuE9w7W3PEkW7NR7Y6MzZDnw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5310.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(6512007)(2616005)(52116002)(316002)(44832011)(86362001)(36756003)(6486002)(4326008)(5660300002)(8936002)(8676002)(1076003)(38350700002)(6916009)(6666004)(15650500001)(6506007)(186003)(83380400001)(66476007)(2906002)(66556008)(66946007)(107886003)(956004)(508600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PGYKY2Ki2vOhtb8Fb2sTi5mkADwMV81o3eQThPrhhR/YbgQ8jI4JD4F8h1/5?=
 =?us-ascii?Q?XFxfyKCgRouzP1RzCibGDic9MV/fVM3sn+WSkLDV4f+v7NND64CvuOGLR1xB?=
 =?us-ascii?Q?vwDGx8/56wqn7Q3YwtM4ULI+iovheODLCQ6M05XxYN4S+98pA7s6UiAEB2AU?=
 =?us-ascii?Q?fwtctbwjvZjGXj1WZbfpHZZk2xYfnnPofmgBUIScRgDoSNKCxLmTXWZGuWDg?=
 =?us-ascii?Q?GZc3IrtN2daTyPV4ydLmZjURnNSNG+Aol6gAy0j8OL66lX6RxQwZfgtQO6Sh?=
 =?us-ascii?Q?ZGkEeY3k4vvHmVdypfaaF3vy7eb+3wb3Y++Y1GUe2x6+0ndJU/c1FG4Wh2qV?=
 =?us-ascii?Q?MA6c6vIA+9IrAzRsMZHG7qmRVkx8Ut8M324UKR43/9u5+nndZxIjWhM1cNF8?=
 =?us-ascii?Q?949A1fcXrcP/yfWpHKndmd+SMJ4Lw4FAaX94wKn5dMAABgrxcIXax2hoIHwA?=
 =?us-ascii?Q?pIXEpLXT2QFOy/HC7WotDwG17h9VinTaWMScUTY34UA/fCr2xnV9/XpcAQ9T?=
 =?us-ascii?Q?dZGHE+6I0aAoMJekXHw5CeBhgX07ejFgu4ZfsKsi/rmisCA59MK+iNau+/00?=
 =?us-ascii?Q?Jp9D3VlxghooUuvT/53bnKLJM5M27gAigm17Rjy0CYmXUS99pWUlpsheywVx?=
 =?us-ascii?Q?HLMU240Mb+EihQlFpsdTeoR/ncwylcjNVe9uABa+1I6FDtcjy4kp5IgDqVzQ?=
 =?us-ascii?Q?iFmsSd29iHgEqgjUQDtnOOw03I/h7JRABh1SUVvVjBZxeEV539ANEKxb8Dup?=
 =?us-ascii?Q?J4LRihKZ/reGINORVK2eU40UZTrTqedBXT6/Du/HAm6+IH72sWIk5sFeTabu?=
 =?us-ascii?Q?WpeNU2bXaulFZhSwxK4q4t/D1xWQIxyo0z/4z8FJqAx3BBFs4mMGxeJBfXNa?=
 =?us-ascii?Q?9rcWIqyeKOnMHQAvP0G3jI0d/d0aE43kWPbV3FeDTj+1CWplsyLzpXyRFib+?=
 =?us-ascii?Q?kX2dfCqdPx9VFbmg9hCkhmuHz4y+pCsvPDZSK2n+Q4WtNmPnF6pSFd1bk54o?=
 =?us-ascii?Q?/2DWR6S3KCSVDVWtLfcowJcA6Mge3O45TeL0+BnxudM8btruP8dLtxZMEHAf?=
 =?us-ascii?Q?wyqj30Sp10iTtinjl38+1NwCFiE1YerA+70VC/QeDJlkIe0xALZCHublSi22?=
 =?us-ascii?Q?zRI85oPqHV112Fhi8URZ13fDD/QhPNn7DUVHLr+qktrVQIcrYEdMvmaadoZT?=
 =?us-ascii?Q?F2I4e1VQA0Uv6MN3TJ6Hnxtq4wVFX5wEhoZSvwOeUoHRK6PiOqT1n91tzUMr?=
 =?us-ascii?Q?YiNBx93VavjbtgIm0xhJIT7zbe5r0O6JUshK/R8ADMD/r7uMylHV2w+6w44a?=
 =?us-ascii?Q?bxdiqhfGbl7P3kjlQRNS03fP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b46118ae-53cd-49ce-1484-08d98262952e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5310.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 09:30:17.2310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gk+z2QqvAu/UypbRh0+hfGRJWsC+aVWboFkcQ3IevfmIEtzKwdUv2XMkAObO8sqxbKU+8jhcqrnDbLlRO3Ucv8Id+nFHfb9iQBB+ACTdUe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5720
X-Proofpoint-GUID: jRpjhOvC5dYhqDP8YsiKxL4wBQ0VuNxf
X-Proofpoint-ORIG-GUID: jRpjhOvC5dYhqDP8YsiKxL4wBQ0VuNxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_05,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1011 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109280056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Sep 2021 09:30:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93161

Add chipsec, tools to dump or analyzing hardware, system firmware
components, like PCH register, ioport or iomem configuration space.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta-oe/recipes-bsp/chipsec/chipsec_git.bb | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/chipsec/chipsec_git.bb

diff --git a/meta-oe/recipes-bsp/chipsec/chipsec_git.bb b/meta-oe/recipes-bsp/chipsec/chipsec_git.bb
new file mode 100644
index 000000000000..019a8f5f12b5
--- /dev/null
+++ b/meta-oe/recipes-bsp/chipsec/chipsec_git.bb
@@ -0,0 +1,35 @@
+SUMMARY = "CHIPSEC: Platform Security Assessment Framework"
+
+DESCRIPTION = "CHIPSEC is a framework for analyzing the security \
+               of PC platforms including hardware, system firmware \
+               (BIOS/UEFI), and platform components."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bc2d1f9b427be5fb63f6af9da56f7c5d"
+
+SRC_URI = "git://github.com/chipsec/chipsec.git;branch=master \
+          "
+
+SRCREV = "b2a61684826dc8b9f622a844a40efea579cd7e7d"
+
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+
+S = "${WORKDIR}/git"
+EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
+
+DEPENDS = "virtual/kernel nasm-native python3-setuptools-native"
+RDEPENDS:${PN} += "python3 python3-modules"
+
+inherit module distutils3
+
+do_compile:append() {
+	cd ${S}/drivers/linux
+	oe_runmake  KSRC=${STAGING_KERNEL_BUILDDIR}
+}
+
+do_install:append() {
+	cp ${S}/drivers/linux/chipsec.ko ${D}${PYTHON_SITEPACKAGES_DIR}/chipsec/helper/linux
+}
+
+FILES:${PN} += "/usr \
+"
-- 
2.17.1


