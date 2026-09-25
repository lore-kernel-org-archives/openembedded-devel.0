Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737CBC9830D
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 11:44:54 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6137.1790336686687659610
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 04:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=FcU9jlTH;
 spf=pass (domain: est.tech, ip: 52.101.65.61, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNPmj/epSLQXfk0mHxbatBr6UWy22BxrVtaRCTasPQ2+/P9X2H/lEW2l/k/J+SUFsTC39QhsB0gCd2oUx/KgI2FRb8Tuov4vZzdyDtfZ1kh4Re/1slUnzO5hKL/SvptOQwL0gNgHWm3OSeInrdmXQ9AQQvw/ILui0siWBJrECxZ1FhWOOiTrJvsx6iMs6Z5K35rfNz7G4ieA4upgHq2imbuzmazJaCdyQT/uns0F110fPaAGBGSrZYqhSnKKa0ATWqA/yl2wGP/K32QBvHuvYS/osHhfTdvihVvP9rPVXlX6vgqRPIYNt40oiVO7I06s7aEYpuO6n9HhLzUZnKERsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf5AJjd3I+Cmfn9kU35Vun2grrfGIiEfKrWnmfJUZ8Y=;
 b=Lk4X4rB7i8dEtUqk9/RPnE2MnLXKTi1DCr/AZelBLU5NpSjvl6/ZSnLUjbwIcWF3A7c4wTusvzuM5I2k5IK/xS2+EYUmP/FgHY/jvqKNGap1XrYLamcWNcq1Iqvtd+Nc4nkGsZ5+C+LYKX/Id6hsn1+MwtjJ1eXDTbxE3UCfzKQZ03MGJOj4mwaQH0YWYK7FMKvDqot+J5SkDRggnsxwrb6BjlW1Od2wz8VBJA7hYlumCtovE4LRx3S10VABfj0jDLBQiBVXlTOkUT3aKqspvxolhBdmTKOUw4fBH0I65gtuYvnxk+OcH1f2obSTNw8n3DS7dc4uApwXyzESjIDeNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf5AJjd3I+Cmfn9kU35Vun2grrfGIiEfKrWnmfJUZ8Y=;
 b=FcU9jlTHLqweE+Gpql5NJyFqU80iU/uh/+0C+EaVezX26NKUK89epejCV1eS6RBpf1Q1fEZ/tQdYPIZDpm17Bdid3WQnJz1EdfN8ACSgfO1jX6gQf98QKK+vMbHyz3eWNd2asmJ6lg7ojipYHoWxFdsIdc5RRhIBcTdnEWugQ6PEDy8YSJlUplSUoEkXGNId+IOfZyEnxCJGhuewR4YADdPZhbqe0SA/OwCf+Geftv6wqap0f85EGhx6B8W67DNUolL9ScyEj9sUVs2UXA2XS+M5LR1mC4FSQtZd8J6SKlKxgtyuuhY9haA1BdtfokPItVs1zQhGmabfD4kOM4F8xA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS8P189MB2313.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 11:44:40 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 11:44:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 3/4] libnftnl: add repo.or.cz as premirror
Date: Fri, 25 Sep 2026 13:44:26 +0200
Message-ID: <20260925114427.2889-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260925114427.2889-1-jaipaul.cheernam@est.tech>
References: <20260925114427.2889-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0043.eurprd04.prod.outlook.com
 (2603:10a6:10:234::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS8P189MB2313:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ad977c-e0f2-4067-0f2d-08df1afa61ef
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|13003099007|10067099003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: WeLBYmfZrLVrC1neApmgVhR1hwo/UFyvggdY4HTPqsWPR2bxuvCz7VvKkTvzvgDdw4XJdzRTegWHTd/NRcxExoKccXixbETYrC/OL4ZjOXEPvoJ5xppudBNHyU+H8JiU7m3Iz9SJBjxxuP6Ce3wG77qhHAejyIgMaZBXG1F7aYrREKLTa8k1CpggxL9Eo5y2vpqt6J52tv6r+bfi5C03ZlMySFw7zfUtuA7Bw0j8U/TPwH7a7qzYhzgO/X1Qhq3UVtXF8jjXNbUMjFNw/v47DS939WzoIQGFBtdCII55GgGftBdkmnVMO/0xvdxVT11MoLBP4SgCjxRZPxC2jGP6NuxsIuSy2U3ahDFZBd4maMHx/3Y6gEfI7VTBvFFfiK+Ts3jTu/FtPBqiPPf8dLnz8GVv2LsNIuaPoLHmX4hinnkFQ3HOkCWu52uy/35fvIxU4TsCc8km9v0JTETsdd11oZho5mvuEzxDky/2Bn6hMV65qHXuiamHkDLKQ1f5X4i/QLsisJul3JZYrrdirJMPRzxYFSebxSK68QjfDveHzfCsHO9d2zug7CIxQzlSkCzUL6y0Ry67jkFciCJwg1hJdgbaGSYrqHA4vWAPBvoGDcA2upft9nORvHv8Qt1eXYtd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(13003099007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gNFEExydhvf7cJDNnPCnWkAdRQr3IlMU/N2ndIJghXK8h9fbhD/M69vG5MjZ?=
 =?us-ascii?Q?LnAiMikpV6nvYzO44vVbJ1EI040vAi19duQ6c6oc0fs74Ho9BqsZu7xy4exI?=
 =?us-ascii?Q?66wSnN3hRvbqRjVX0VSSoE7gBne2QLMw2P5Z34oM6R4vs54sseN4gzoSEddU?=
 =?us-ascii?Q?zW6vbX7UZgdZUtFc8f/qyB2o6xiOcnzDfROALEuzGGzXVx3MfuNKebGpZrq4?=
 =?us-ascii?Q?cRD/3D5WT4Ts32g1tMrKKzr8BIqQpS6c1TvhewFe0w+Jza8yzeAA63+Vuz6J?=
 =?us-ascii?Q?gGzhD62RF6jI8rd8BV8y+vIlf5sUz3XjRlisRP68xtKCn4KZ8KKASTvaIG+n?=
 =?us-ascii?Q?rhQRtaKqofNNU1XaQ2JuhRZoCzS6i80/2Y5OQy5WX0bQgBy1AXWjNNPMX96g?=
 =?us-ascii?Q?Qh3jhyquAnpNh5c2mK+nNGzQ8QdNXRxJNC+S/9IsRtCpYmZAdG1pnvbDt/0j?=
 =?us-ascii?Q?pdtpVPzVni24bwiMXTbE68/6ErPumT2uvIHTT8lBlM4Xz/wKrI9baI/0XLSF?=
 =?us-ascii?Q?N4GJGY/hlkiFWtfWI/w6UDdfnkh7eWgIRcmbIvsN9VkG+A1BzURsMFURXPNb?=
 =?us-ascii?Q?IATs/dF26GLTYvvqXcMFXknXEA/Ci4dmxv7/rl0ZDDL/5ymUxTtgKkUdHqz4?=
 =?us-ascii?Q?zdEh0sYto4bIcnBNwFGll5CWiz0OFIxHYDxmk2k6haGv98Y1aNnlB1mIUhyj?=
 =?us-ascii?Q?T3aINPgoF2N8S8UYI4mzY//OkiZ088tWCs//88F8wAFwz4sBLm77XROyYcty?=
 =?us-ascii?Q?k+xBqgzHRA54qTUgEEgF4xNRsAI1n/VVnmetNE7iYdn9iYFgaVUtdMdgk/c4?=
 =?us-ascii?Q?r+CUH565odCyTM664uZx+6+H2Uje/+FxS9SvrrWbLQRdaVQXkoA5PGI/oGX5?=
 =?us-ascii?Q?+EXXFUQT7yjwXJ/zUC27WVZ6i82pornfYRvypG6wSVgHut6mGZ4W8Rx/bk0F?=
 =?us-ascii?Q?qF3uzz4GmXU/6jBxWYSyP/khxD8xK/SP2w/BZqGNxIcnzu74zJNliNfwwrw7?=
 =?us-ascii?Q?JgbLXzdOX7KtADGoTVA/jOVxAOq9isNVjFlIWASxqk1YMtt5sDn9wjDFyk9X?=
 =?us-ascii?Q?t8QVmGTLr20RWe9bUgkP7klFLfhnQUJRnG6+bn3emNNK59+MxORjfLWG5LO9?=
 =?us-ascii?Q?vvuRqwzdawDWSpDnfTJnZoODawA526w+ztXsNZSPp0HtudzL0mppLjAu5CO4?=
 =?us-ascii?Q?6JPaiG4oBHLjZfWUG1wn8/+2cH+OO+zN2n/dTOuCsfGkNKU017fhk04yAE+2?=
 =?us-ascii?Q?HMbOVAALBpKtFiMVrfQDdzcDRsRQSyrfEWyuOfCQjsRRmvkKds7ABrtUR6Qg?=
 =?us-ascii?Q?mHVe1BIZk9TKEBqFb5oXdhJvf4sry0Mk34MziOsoLNixNH+fLcLNylEpdJwR?=
 =?us-ascii?Q?0G1IQIt6tk5bHNG4nQ2glv1+pUaqwOSCdxW79WO9VdPw3kXpB34aHZSF1N7I?=
 =?us-ascii?Q?IMwrMx0yxvXa12VTYVmttlQsXe8ohlP5Tjj8xAeqiMR0q/mqq2rgVoopKtEa?=
 =?us-ascii?Q?7rSr9XxNCeXkHYNHbDgBnD9epc1+9qtKWhUdAHY1qQcb1qYnCnonyzwTe729?=
 =?us-ascii?Q?keDbe5I3QmsI0EeLMIgTDsJadIEazpyB0NrAuhY+Nxi0xuD3KrxNordOB/Hm?=
 =?us-ascii?Q?UdSjNgg01G2D4+5Eqi0wCwiB6dCkEyr4gVmcjlBxB3lEks7GdPv3epOzwS+5?=
 =?us-ascii?Q?VXV9cYm+JeGDNLKNH+U7G1RElOLCfNcB81nuBI4LDXawvgUwZ4h1SCgQckK2?=
 =?us-ascii?Q?hgKD4SS8YQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ad977c-e0f2-4067-0f2d-08df1afa61ef
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 11:44:39.8428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTCMbYrXXUG7F92tiLnS07niKDxj0CDt46hh5j6k3Tvq6gBzgxxW4D0GRxsBi0vl0FEekBnIVcuR0vP5cqXPqwj6olqrd1R0z63VZvXqzK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2313
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 11:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130299

netfilter now offers an official mirror at repo.or.cz. Add it as a premirro=
r.

See https://www.netfilter.org/mirrors.html#git

Link: https://lore.kernel.org/netfilter-devel/arVpqySeeTQ7ZA06@orbyte.nwl.c=
c/
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta-networking/recipes-filter/libnftnl/libnftnl_1.3.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.1.bb b/me=
ta-networking/recipes-filter/libnftnl/libnftnl_1.3.1.bb
index 2d2f3d41a6..9a7743b5e0 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.1.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.1.bb
@@ -7,6 +7,9 @@ SRC_URI =3D "git://git.netfilter.org/libnftnl;branch=3Dmast=
er;tag=3D${BP} \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "
+
+# See https://www.netfilter.org/mirrors.html#git
+PREMIRRORS:append =3D " git://git.netfilter.org/libnftnl git://repo.or.cz/=
libnftnl.git;protocol=3Dhttps"
 SRCREV =3D "0f48d7638800bb48c863e6b7e5f2fe92972bb31c"
=20
=20

