Return-Path: <potin.lai@quantatw.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1660C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 15:49:43 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.102])
 by mx.groups.io with SMTP id smtpd.web08.8976.1648741778396103384
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 08:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quantacorp.onmicrosoft.com
 header.s=selector2-quantacorp-onmicrosoft-com header.b=MbXNXXu2;
 spf=pass (domain: quantatw.com, ip: 40.107.215.102,
 mailfrom: potin.lai@quantatw.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nd17OR8XhmdzMbKoGLzpa87TIb46svMcO/66zSvNloIkhT/win4YfANwsmoBIo0HhhDwIMseem3dfKySmd/hxrq3mUM4UekSy7CxK3sqbjmHKsTfPU89BEUign//ehyGl90EfgUS7dVCNcWoS0VUTaX2v2Vl/smiODTfLhriT4p/xO8wuE6tvAxEgoSStZ6uBDwDkXc0PyZxkeOkZjPkBQ17uPQJjErwkxOc1BytrRqv9/3ID7RisTxgCMfBP67QvTUgbh/CreBQp9Yaa1e8Qty2pB5nw7oUoeSS3q+Z3LI/E2gIjClvpiiwcEspwfIF/YIwL466oqS4cjV6ZmFtDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sHVgbO1pYWoHFTE8mHxmCB5H+rjl1LVlgpqTvjP5tc=;
 b=Oe0Mx+GZdb/Yx7ctOf7wbANOP6MsAtQKXBeeFZs48rj4jUBk03lL3octW1HQzD0O3lN+mczLNTimDDAvzLlGkU92L7jnoWTUidnQs31YETI1G/wvqEPZ+q1Hw2uZ7GbDC4KgIWVaQAJ/pxbv7BnGk3dhvPT84FSLzP4n/rBzIYCoQCRUUMaZ5+7A+NMJBS4ftHKp9iNrrjKXGmU53F4kT1oOWX0gAsEgCDtftUQ7HUH7WAKchiRCV/oL1yVjePfOQ5qUVWs4pGUM4c9+UHWhi969CMsYfPshlbMj7H0tcbekzjU/pGbROFnCLZ/CttFctps8PGZjRurBZp0IZpbDJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sHVgbO1pYWoHFTE8mHxmCB5H+rjl1LVlgpqTvjP5tc=;
 b=MbXNXXu23H0TiYaFXrtbW47JtZnGOYyNGz3Z7LMVC9lf/AZkaleMJoBz5iPNWdmWx5l4vlCfHGA2vdtMMSVraxTtiLW9Iw2unhgzRHInfydCV3cfQmB4FR4G19LqpjFQ1+XNFJ8B6eMFIoqPlrv95IokJ5ErIv6Kpz+uZ6FF/bA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK0PR04MB2785.apcprd04.prod.outlook.com (2603:1096:203:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.24; Thu, 31 Mar
 2022 15:49:32 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42%7]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 15:49:32 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>
Subject: [meta-oe][PATCH v3 1/4] libimobiledevice-glue: add recipe
Date: Thu, 31 Mar 2022 23:49:09 +0800
Message-Id: <20220331154912.1456-2-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220331154912.1456-1-potin.lai@quantatw.com>
References: <20220331154912.1456-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0148.apcprd02.prod.outlook.com
 (2603:1096:202:16::32) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1be474cb-b34e-4ec3-5570-08da132e0c6c
X-MS-TrafficTypeDiagnostic: HK0PR04MB2785:EE_
X-Microsoft-Antispam-PRVS: 
	<HK0PR04MB2785B655D28EDFDF3858F7DF8EE19@HK0PR04MB2785.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NBdwcQeaAeKCwWFwsbYU4Rn71MDbGwhW3drAT+LFNittRCwmhCCoPUXWB71UnDmJmjeN+zBxoQkfSPHAG4yy3K+cyK3splVv2O6VLvEcZTw8ukpv21LgqQy7OjXWnwGWcOSD9g1Ha5jkkPAJrrT7ZvUmOAJ6ius21AZM8H7WEacAVgWajBzZkWpUDv8hB5Oflm8pza4ZG+RFm1nzxVf/bz+xADm26XGBzlU40epkbln8IbqHz0voSxOts8ybhNBqd/jMET5f8OpxdCCpL0enrs3eoryNinEK5AhPDAdasTFKRrPWQs8gXisu5qFLamnOynPomOD3I0t3hoiFs5TdeqpyaHI55s8NQjL/NEQH/G03a4tumsxPgSOpEMBOw0zAPdno0+mKcPElXELHWoZWeWCW9LOXkShlf9Udyc1vpRIN3cAlt7ypXBipUUBeDH4cHwclUZK7i+YbHZg2+/2KkxB/WJFE1zDuxynblagVVcM+TSUUsmmWnScPKcuYZNszcORM1p1XRsU/OrZLX+oCrf4QegUv83YZK6u9V0NaVJbITnaTf/cetVww3cFqLUXp+1YzUvpc+r0ooEvaNAyrQOvEMlXfAqi9Wpr10LLowWTwDKr/kq8aGk9Ccmd7knDE16KUnt5saKCZ5WEFKdpX6YV2ElUPDj//PGhfU4j8NYK4SDllI901Mu4+Bo5JJnH5LVAZgkdIBGHCl3yVZ+GwcVCLpIqbs4yjJCfZ8bwwekrZlMNNMOzQbYofHoJaqQ4GgJWvzwC8fAiu4mfBbdCkYoI5Weki4G7XkUICmYhsEds=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3282.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6916009)(54906003)(186003)(2616005)(26005)(107886003)(1076003)(86362001)(508600001)(6666004)(6512007)(6506007)(52116002)(8936002)(36756003)(44832011)(4326008)(6486002)(8676002)(5660300002)(38100700002)(38350700002)(2906002)(66476007)(66556008)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/ZZGB1JotmjhObDBzGo45+36PIfoesCX6x7RjCb/3Sm/ublnfHpHrr6w7Wry?=
 =?us-ascii?Q?SD3won0BakpxLCmMnOdYrQxpRAClfsMKf5o3APM3sQrEuJncQ5RLVWeuoHJb?=
 =?us-ascii?Q?+XLz+6Afl7odNO/5ryUmevBPEK8uIgZY/YmxiEylZbYWK57QzN/AxTzVc8Gh?=
 =?us-ascii?Q?+1nWrFSvsWtzh5zhpXnJGAfShxI9emVU9mHaUkTJBddIiyo3W73TmkBsP1WX?=
 =?us-ascii?Q?49+RCE/dApFfszFMm97Oib26wjzeQL/emeFcTnw57zHUDqUOu9uiKX4wFzG1?=
 =?us-ascii?Q?yGpgqME7p/pbUfFMUEsdfTEo3VKB9/tXkDDA7ge74bFUKj9c1i6su+YmyXil?=
 =?us-ascii?Q?v/K7mvqsY2/JD/D0yxPoQRkn4sKg4+KZmDnvMVVMX8U6jCGXMJM6Rjvxu7Lj?=
 =?us-ascii?Q?zomjWMZvSCBXQ+r0T9pUoyRjUnx2KerqSCLx9Dk4m3UD4OPl9RC8Vg0bYXaT?=
 =?us-ascii?Q?esIPSu21jrL3aaoWpcTZOeUCpAutBjq3h3KCE4apEoXtsBTRbNKNOgLG/C8L?=
 =?us-ascii?Q?zfXgPbwLo49TdlH+xy62leLmPad194yKpqxifjDvhkt+hGjdGigR/7lu77uW?=
 =?us-ascii?Q?wGJ/KjeS1yvjDTR/sW8AkuTcMX8N7PxRubQiXH7Iw354LI/Hmo5wdirgRuE5?=
 =?us-ascii?Q?9PNr/PozkCu2TMpit9Xjbf/ORHee5nVhhFpEg6GcQALiof2Y44pFmNxsyaQi?=
 =?us-ascii?Q?uzrqpxzJcI75qwhvD8zU/QxLjiLsDWnGJliWYW4OlPtiRY2wy/ohhNfiiejA?=
 =?us-ascii?Q?DHqomMPsIeCpv/YsC8iKlGDC9IqCkkk89Yvu5NJ3GdJn7QadMUDhSbl9acjf?=
 =?us-ascii?Q?XunrQIo2paBsrr+YhpzAJtD2EjZ89uOc/MRLwaF44WnETif5XIJ8bm/D3B7d?=
 =?us-ascii?Q?kyZX5TJB9MYFvbvbDVy3ik35tXQwIxq3+pzxCECNjTs/45qN8SMJ6iQq9cDv?=
 =?us-ascii?Q?tFL8eJAdshs9Znpu7tfQVqcM8CnIutrphPWl+XI5Fke4eJuXLz5mIgTnW5/6?=
 =?us-ascii?Q?Xc8pCvt0bh9kyLGXIJFMHK2Gt1/aMnnwpfJoCGM0Jy9OzOUaTPbMV+PttiYS?=
 =?us-ascii?Q?FQWBBnECmacAihao66WPYfUFBS0bd2wqw6JO4f+HSCQ8LmuhOYiytL2Nyi9k?=
 =?us-ascii?Q?bdulIlqnhb2K3BmOtdkDfOpRHTUbdjwAzXXnLkB/3X6/s13MoW7i8eakBV9X?=
 =?us-ascii?Q?daA8i46LEq5eX9g3NcrrIOyKgX2HcHMNDl3Rl+HibTo2At0sDmQZN6XHr8g6?=
 =?us-ascii?Q?aFLrktzFyZMup1vTVylAf5qpw1Vhx6tzDxu4xToC1ZpOog+aRiUyW9zYDtHH?=
 =?us-ascii?Q?o+CaVIA/z90C8DtUrrfekoWaTK5WaDjbmTUXu69b5UxPuTFjTPAquOSepuFE?=
 =?us-ascii?Q?Iuw/w/9Xm1BihJr/NM5A1hSkw4/pifeUBnNt41E6Vlmc6X7G+jsIp645nERb?=
 =?us-ascii?Q?YdVVIoBE2sxhQmvF4YscJ5zEP+9FsVh0KAB+qV5BPN/shTtUPiDKupqYNEWA?=
 =?us-ascii?Q?qVWxbiKjiDCDcVLa4jGWjpJ6x8uNwBUgSPnt8kenWDKjmoEcpIvBwG1OpELs?=
 =?us-ascii?Q?w9KMZ6wIl8P8oBpT6AGBPJK5ZC386P9TcaloPQX1kNO39bxZioOHnn675IuC?=
 =?us-ascii?Q?BAnHaQCoiCJInJmAT3EMRt8PcaaWxdvcbMtXt4H6vUpbDp1jxsHknnMuSGXu?=
 =?us-ascii?Q?MrH39jASvrGqBtyRawVdMB74ndWwpZT3VwlveWzzvg1rfUzlqfukvrlgTcR7?=
 =?us-ascii?Q?B1oMcVxdmbNcVg9Hl+3Lai8htSHMWXw=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1be474cb-b34e-4ec3-5570-08da132e0c6c
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 15:49:32.5289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 W0wedfoGzT9h5aKhb0IWX5wRSKFK8F6XzVE2lhfOPUxqjIARtiayAnUnwLRGJZqv9O9Dg1p+DPh3J93K3hKxIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2785
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 15:49:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96296

libimobiledevice-glue is the library with common code used by the
libraries and tools around the libimobiledevice project.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../libimobiledevice-glue_git.bb                | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb

diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
new file mode 100644
index 000000000..831d32cdb
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Library with common code used by the libraries and tools around the libimobiledevice project"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=6ab17b41640564434dda85c06b7124f7 \
+"
+
+HOMEPAGE = "http://www.libimobiledevice.org/"
+
+DEPENDS = "libplist"
+
+PV = "1.0.0+git${SRCPV}"
+
+SRCREV = "ecb0996fd2a3b0539153dd3ef901d137bf498ffe"
+SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+inherit autotools pkgconfig
-- 
2.17.1


