Return-Path: <benjamin.bouvier@ekinops.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C0FE7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 07:48:21 +0000 (UTC)
Received: from PR0P264CU014.outbound.protection.outlook.com (PR0P264CU014.outbound.protection.outlook.com [40.107.161.118])
 by mx.groups.io with SMTP id smtpd.web11.10727.1734076100748871521
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 23:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ekinops.com header.s=selector2 header.b=rokbmqfM;
 spf=pass (domain: ekinops.com, ip: 40.107.161.118, mailfrom: benjamin.bouvier@ekinops.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjcyHbZuZoQS1HRuyo+98eJ42HX6KIyDcyhd97nkv8k/IuFD1LoJSSa62BAfOX5ZFn4beayXDhe4PjEjWT5dHiBXG8YFpUtuRJBVjg/9GKeKDz/sQYkPSR9IkuWEz3tE/fbxz4rWFDbonpTLOqPdfCXS68h3JCAMiYsqLYFeiJr0xSC8Ky8w0yPrOWMBbaHyOgN1q2j+ulEdnbiPMT0+KHWHWhbOkiRyTnahyV7FsECb0s39EAo/pBtBiZK2ucOMY7WKcuBynMFfjv+Z8CqX6Zxud2LXt5QLwpLeSUDKHAx7iRj8cT54EPnKhcadrA4tDbviKQXv0Vvd9g/l4LLWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DTpEI1TXwdcYLpd8ygEq+S/Pe+zXpwnQ+L75M3Tmvo=;
 b=wvAY7ulN/a0TEeFy8UhsSoEQBrSEwgL4Se18YkolUSzQIn15pE/6IxSHlc2pfDlPFjDwogRZ+IU9qD64XfNQWsBdTZ/ULqoNX052yQ6DfyLovO/gdtkX/OQ8IXmdyui2XnoNn/ic3Qj6rgRo4v+MrdHYgo1N5Qa3Fg92RoTeTKzPNrOXttzzO8rcJ/99ajjzYmAwxfUcvj0uG3/GGMP/QwM8v6AzORctt0maVF70r0zisdwgcTvsDZ4zCsguI9It1E134mdAozCtsqcKEaHMhbNAFedv6jHPriw5Hq2+ngYZXFnVL+NdMLW06Szz1ySf0+aL0j0orv/sGtDzWyTDVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DTpEI1TXwdcYLpd8ygEq+S/Pe+zXpwnQ+L75M3Tmvo=;
 b=rokbmqfMoeo+710iZWGeKlCJ48ogVcgVsUQxUIjpiAa9CLnuH0V3NcOz2tjr+YyFu/v1fqoTXEqKG+9tYU+/VxMzkMMr5vG60dKp+aX2k0IjQkx5o+t5ktWmGYvN4IiPUOwrGNmZvymSERYoTG8pDl7TWOM3rPowkwUUvo4i5jE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ekinops.com;
Received: from PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11c::11)
 by PASP264MB4868.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 07:48:17 +0000
Received: from PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cea:c378:fb53:82cc]) by PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cea:c378:fb53:82cc%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 07:48:17 +0000
From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
To: openembedded-devel@lists.openembedded.org
CC: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Subject: [meta-networking][PATCH v2] bridge-utils: add CVE_PRODUCT
Date: Fri, 13 Dec 2024 08:47:32 +0100
Message-ID: <20241213074732.138531-1-benjamin.bouvier@ekinops.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0162.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f9::21) To PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAYP264MB4350:EE_|PASP264MB4868:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a43154-ffbb-4b3d-320e-08dd1b4a8171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xEqL1xh6cGLA/+u951jAwRzKHNb3/qdBPTjwu/O6w+wIjbjI7r91yxNl0DYT?=
 =?us-ascii?Q?IT3H1+dTA5R6xedeJX96Slb1mSIA8u640LvClXyPiHULKO6gX2yj/lMdXBPA?=
 =?us-ascii?Q?Z/rHlbbTrLtiAt1fkA2VUdakjWkrA6cF1NBZo0ORR3uN6ZgxxMmTKlVbKlpY?=
 =?us-ascii?Q?7sL55EuX2gF0Ey76rE5wFn1j6tqTTBNHhDpdnt6ASLPLn6hm18kl+YeRVpzo?=
 =?us-ascii?Q?2ZRFCyg7j2b/LRKvSWLrH8VRsdlEWyhgyNYDAbEw+WnZ686DtGYE4Nz3xZW1?=
 =?us-ascii?Q?ShBqVQlMh7imbs7SE8C2HmxP8CM4RVlu9iGbqf6u6U5oRGE36pr3SVFjdpxA?=
 =?us-ascii?Q?x0JXRLdSFy3cZeH/8ks5oF9aeKC+6Iszil55gcpSdjYq8iZf53YY5SP9CRhv?=
 =?us-ascii?Q?lRoL+sEDR9lJIB+eCVQ2ttq/PjBk/VqGXLYLEfZ1bQdeiwu4DJArFi6/PZfZ?=
 =?us-ascii?Q?LOKAEl45+ensbXCvZ0d9irffVojmu0c3QBx3phalEFxIGkgbWCP3iFBc1Iro?=
 =?us-ascii?Q?6l0xVJhBxvqOcbGRCOVMhCe0zgUdbxtkyMhDtj0m1ibrLW91WbiJ2JlPf77A?=
 =?us-ascii?Q?1KRcVpPiUu7MmSNIgFxblSVhL7b6RoFnGxLuwuv9sWWNdmgjWT82xit5t/Qx?=
 =?us-ascii?Q?T/zqw3d/hqgC7Nd8bAZ+Vx8oLJZ22poDZPFH3DkZTQZ1G+Bwu8kAFx2OX12s?=
 =?us-ascii?Q?1WJU6iWq5TpGBXrNp4dUKj3TYq5a/ovkdIJl2x9ZFcqouxB1fB2BzCt/MYh7?=
 =?us-ascii?Q?cObh2MOkIfDHAp7rV0aeNGWAPNvgSoXeK9xNsYRjEbmF8vdN85bYWRQyZLRH?=
 =?us-ascii?Q?uRgytiIESHQhDG2ysX0cWv0NRYhZiCdRZIGlawISFjjTVtV58Tp20Lre2fKw?=
 =?us-ascii?Q?NgUiY0EAVwQjfFimdBzXr5iER6xIDX7kWGwmRfTz9nWkQo/0Lf+gtWLMfapC?=
 =?us-ascii?Q?qGgqhlxS0ztB3fx+q35/IyXPBf32qL9dGo3QTDfI9TEuL84Ro8SLSdZPa3sL?=
 =?us-ascii?Q?h19r2QNnx+HJMIW71nchy/zgy32G+GA71OnrnZ1+1Su0u5BUYRzIuV4j2r0A?=
 =?us-ascii?Q?yOhgd3uBeI5BNDzQSc94z92M5OgIqYWoXtBWOXtRlppOG6lgbeLlrFIwMG/2?=
 =?us-ascii?Q?uWp9BMxbaHdElCWfjwtIbW3mF+18lqO9XKoggvPgZuS8S6XAv8X68LzXKbKz?=
 =?us-ascii?Q?CjyMNG0c8DBI1LgF1wwZfrLb+lrkCG32FgA9ogBzEI06F0gUeYptQGd6hk8P?=
 =?us-ascii?Q?PNNoTR8JNMF7+4IJvwQtGOV0LrkgrEondQXN5t1XPRH5bsgtLILC8cz8gtAK?=
 =?us-ascii?Q?4h8u72pwkSgdGhLS9z42WfrVXyMrHmFazT7A9Fw62DZAI18VG79q+lYQ7ivM?=
 =?us-ascii?Q?Cn/0MmxJGtUeXSHOkqy5IDQdiIXUauR2OkkvAKfwXG1mpqbCrg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/v9IfrRcv3W+vjA/gvC0++r9ijK58XUtbQkWPriIkwE55uwJlOlfSO5EObPu?=
 =?us-ascii?Q?RzV/lr3g5zJmQDJfx1E+iAcD9kTQm7iM5YtPsjTTSLrdHQ5meRckhbDNi5vq?=
 =?us-ascii?Q?UvTrtQQJaz/wjuVW3LctVRztFQTUraZ4qFmxJcyeDgW3KG1aoOlRCnwn0LW/?=
 =?us-ascii?Q?RE8U7JrfYD6Ja72XY/9GxOokXS4YfhaV+IrOqScAB4wlXcUheP3ueHebR952?=
 =?us-ascii?Q?xt+Kpt9UrxLMQs3AX9JCzb2IWXmE+It8LKH2szczA5MjBx3CvCByIj5z1dz5?=
 =?us-ascii?Q?MOlEn1qrzzXErpdbTWLYO7Efu/CFdvaX5QExncQMfAu7tdKHrOFvpZT8DIV/?=
 =?us-ascii?Q?LXIV1lqbtNckXhJei2nE6v5zrxjseShfbZZYgC01imHpQhDq6YPcW3ocO9H7?=
 =?us-ascii?Q?5W2savFje11M6SFYm58a+nSxgqmqIN8o92HEwS26ww6UbrDd+jaRJWtS6sCl?=
 =?us-ascii?Q?rSkbSUYEO9f89goz1U6FhPrdWGUczfnPGvHNT3oTcqowCt3/QP2v74WhAK+Z?=
 =?us-ascii?Q?CYvOWB7qOLUnWDN51hpq8kBWdtWPQgT2OQ0prR7naIRS4oiuq0EDlGsEXX6i?=
 =?us-ascii?Q?jjD/+74mUY0v/RoXlWxBhs7l2EWjAeADXHTjNfRj4L07u6zrVgimUHoBK/GW?=
 =?us-ascii?Q?jZ1M5d4Yrb7ebsjN0jrSZcT5CLnfYSuJoymy4Ccl9NZgZxMejdiKBluGbBAe?=
 =?us-ascii?Q?C+QeumlImWDhqYLKgG9mn74qfAjb4BxuXQlAPNYhNPnqF1GwxTyc+okVRRry?=
 =?us-ascii?Q?mUMdf2TIE3Q4+DUXJ5L022AS8tjRQr0ZVWbEIqLrxTHMARxv1pDFthmFbuq5?=
 =?us-ascii?Q?rdAoIO7Daw0gJpSMxN3STqtfM16yKBZJKsK6ZYtbSCqgXqA7aLDJsk64WFLq?=
 =?us-ascii?Q?8MU9n05noYA6N8rZJlhYyE+OMhOYx9Uc7dXc65B8/jfLOcj1+4DCNCcrI5NF?=
 =?us-ascii?Q?dg9hoeHviqtAa5dyWEeY7bUiT6P6NaNJeOkQCP4gTMfp4HzV0z1OdMspW9iQ?=
 =?us-ascii?Q?vNJuiND8mkqsC9SC7XbokRL3epmQ1TroDulHEnRd+eDcEUae+UlJHSLz7U6Y?=
 =?us-ascii?Q?mE553ASJhS6x2GPgGObFlhU94IaNQE327mRfYna9eNKeRQ1SjCFneZ2Q4Fyy?=
 =?us-ascii?Q?HfwHIIY520egxU2cCvjjH29OU6tOobAtYb6mT+lll68LVPpOKVT85iVsVUMt?=
 =?us-ascii?Q?A8u5zGbbMlg7CqUoMnGMSc+J+aIAXEXBN0B1sF5wUEtl+tUnC6WlsTS1k4p/?=
 =?us-ascii?Q?1QtCrATbmJMj4B0Zy4oxZQ95T63d6Ycx24uTdI0ozQ6dDmjyo666R/MbSG9R?=
 =?us-ascii?Q?JExFd2G430ubEGhWRKn5Mo/sWKoW6bq5hIRFFuoX43vvzZvqiOAhWAgWIJhc?=
 =?us-ascii?Q?DGlC8xgKty7IDE3OJ7fLLkIMj95DXcRYdGilMuVT8xDt8PgK5P1lh3Yjrfs2?=
 =?us-ascii?Q?ShLhIDMrtYAY23zekkIbrOAhDHH6dIjCjLJFqPK3mmialc8J5ViJ2fbYiBK2?=
 =?us-ascii?Q?+gkynuuYVN0UN3RunDBanLHJ0ReF1udaH+sL5xonGQzIKNLS3tzF3YTQoWv9?=
 =?us-ascii?Q?tUX/2om48eizZ6nZIzCXxrx7Uq2bRiuRC602YrmlGESrxx9AHPmyqbRtvrRZ?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a43154-ffbb-4b3d-320e-08dd1b4a8171
X-MS-Exchange-CrossTenant-AuthSource: PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 07:48:17.1443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiXplqW360D1n/52ZgbLjFAvToRBolpBJ9bLU+xy01TZ4bzxLchpCiNkjFfZkDpIcD2LPMeARV6GP45rs/5dgCYzitTw8k/LYhJUH/lYXho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB4868
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Dec 2024 07:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114309

Add exact CPE name (from NVD database) in CVE_PRODUCT in order to ensure
CVE filtering and not be disturb by futur potential false-positive CVEs.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
---
 .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.=
1.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
index cf0fc1c33d..66c8f2d053 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
@@ -19,6 +19,8 @@ S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "sysfsutils"
=20
+CVE_PRODUCT =3D "kernel:bridge-utils"
+
 inherit autotools-brokensep update-alternatives
=20
 ALTERNATIVE:${PN} =3D "brctl"
--=20
2.34.1


