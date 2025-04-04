Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28CFC369A3
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 08:18:41 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.122])
 by mx.groups.io with SMTP id smtpd.web10.6510.1743754714572896958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 01:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=kNIJ18nx;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.130.122, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwlgMAjXyjNhybdxF6Ep6GB1VN8huyDRyYwi/3R3qGP7kxRYYwKjAcQbdyV1XnhaD44uVF2vMC7GB2uMH2Tq14eP478zTQhpuuskN8L0pfVjbGbMvWhFcQwEVh0YTcggLvUrvmalN5vHKq9GVMJjo63QQCGXNCMxH7PM3WaOsxX4ycirn42xxc+bG3N38AxgdQGmsL662rOH6KjUKf+teals7fYLQd+1lsbj1Tx0UutJerl1lI8JUqhNDPumpDf2f/xKdO9/pVDcN2ELAXAXGTEclUW1Ix33DXs8aZILkXbAkIPwBq2YjD2+yZrIIQC0F7q+RRN0LN4w1llB6OoJYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyCFqr+vO19TI9dmz8ApOOFFtdP4j8FBjD00Q/1SfWI=;
 b=ocQ/GCdIFFRj8GwK6336Ym8i4JuPvKoPaOWG8b7mJTrBaqusinfIEU0iMFdCt76WOssKVJigiCblvrdht6Lnty99T5M9M8d56GXv7jPeYBqj0ZeSkLuRQo90++xh6mBRuGcobgev8cAuGvfwn2+a+thpBpnBiqCQeMjaNq+GPvnAM7urOyfIZguCRaqB+M9ZcX7vmrkxpCCczyAwYS55AOMAAJLLUm2eb5i/iCvW8TfHoyeUXNJG7wcWnWV2iAuQF4ht37XLGTCPVmUHUSlSOkMZ/kzJrxGY7IeRSFgDDn9YcpSZjHTWO/2L+XT2mld2lrDIXJmdAzAAkkBuwWacWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyCFqr+vO19TI9dmz8ApOOFFtdP4j8FBjD00Q/1SfWI=;
 b=kNIJ18nxkcMNsCCqdQYMs64bNBfquChKR979sWX6kpKHvUAwdZGJk/6GgFqMPHRBHzpfUfq5ROsaDV9mrSUosvdR4EwuGvqy5TARxDFyei2TuAN5dmwpDnbaKc2mnkzvFK+Qgg9XNsPFe9zqRlkQYL+9Zh/99p3ZJK5Qkr93icwS0KvDO7ZkRIWRXX8RvpnDK4Ql868pny8BzTRYcLhsVP7qZTcVhYPqxX4U70Ia0FJnj7N192bkg3M2sVl0d2jAlBRmSzVNwBpiC1LLr7glRCscL1ZU5M1lK69NaYGpyXbcDYbx13ig+DmgxlPeTF0/RMNwCjoQYcrHLkpP2RZe8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7471.eurprd06.prod.outlook.com (2603:10a6:102:151::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 08:18:32 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 08:18:32 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH v2 8/9] packagegroup-meta-oe: Honor VIRTUAL-RUNTIME_dbus
Date: Fri,  4 Apr 2025 08:18:04 +0000
Message-ID: <20250404081805.663425-8-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404081805.663425-1-niko.mauno@vaisala.com>
References: <20250404081805.663425-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::9) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 16f02545-0b18-445e-d4a0-08dd735149fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BnPSyJA1Egp7+WOdkySAxXChw/lASjiTlkjRunu7tyUSYGwWL583t8cSyuLj?=
 =?us-ascii?Q?YiUrxgVI7jnNBm/iPes3W+z1EyMpQmPP76k4sj1+ke67yAf6VuEk9lAoM/Zq?=
 =?us-ascii?Q?9pTGfZ9HghY8cr3g2XLIIbqdIyldGvI/4y9mc+qIUOwoeQ8sTVyX/EY/y7XG?=
 =?us-ascii?Q?q5PkYdBiuUd1K0avElZxa0ttn5qtD7OzAAyymHzWck7pcmuNgFitLvgr1tAM?=
 =?us-ascii?Q?FKGbhiXvNOCKKnDWmh8BE6HaQFB3qf1ahOnorr8r8np77rjInW2XX0Gp+sho?=
 =?us-ascii?Q?lNyBEY0EjSQJcSUlJZwc/zmxwQ9r4yMV29fxOEjPFUInKCE4vnF8c3TSrPWO?=
 =?us-ascii?Q?cl2CltTYXUHWlqQUMbzU+Av0All7z3y7gBSoQPHNqgsVe5BrvwwEunNbCQFq?=
 =?us-ascii?Q?hOYs+ryl2m/HrqGrNWk500wAzHGDn6O1NFQbnNmU+HHjgzYJodzstdlqoLkl?=
 =?us-ascii?Q?PaLdnv5QIiVkapbMvqhhgwbsWzfOkOhz7uNDk5iGkTpOY06oW7UubkDFR1E/?=
 =?us-ascii?Q?w5D6mUh5cWaiQneh4WZSQSw89xpfzoEvgS8bLFP5pBCVtKT/ao3eZZHaPErA?=
 =?us-ascii?Q?t7Ut/+Wdygzx99mjWdaHgM4AssLnP1CmEEP0WcdbRz5MESjUgKDFFbNSnrvo?=
 =?us-ascii?Q?550h7KtNVKW0jMFNSVvuI7WLxIRS78IHzE+9P6MPjiQUfwh320Ajz+oLLCrA?=
 =?us-ascii?Q?241jjhCxwwFrQbTG/eBe0Si8KCQRTBgRipfYAE/2Ku309SuGyPMxoDWXuZbw?=
 =?us-ascii?Q?y9MZp2nHJ2rwN7FY/mRCAXyisaaG7dMlannoXby0lynrL10f1LLdNYeBnAwH?=
 =?us-ascii?Q?j3+ENMkKZmneWjFVBRTAj2Wzf2swjrI6mrBW3bVlrFBKwF4RIF/nrm1jtcNt?=
 =?us-ascii?Q?B875QSNat7/dRad5hLrq6e8Lnr9Z05dKXDuXM65nqTvcmhWFD7tnuKYbdH8m?=
 =?us-ascii?Q?8D7vKkPIDlEvJSUY400XsKkmsPhJ1Uj6n2q0u93F4DA08BOx6xnpGTQoJnHn?=
 =?us-ascii?Q?dIzd9BsjKqH4LDoJjZT3Z5+Y1CgTNKqeJqevx4rj/QisIm9Mnj1/ePgKOTj3?=
 =?us-ascii?Q?OnC8nbFHYOyfGPzRGqk+DuLoQOTDSBOTtoiy4/gjiaBn73MRYBWBA/wkLIvL?=
 =?us-ascii?Q?z+yaNyRFa3xIm/HwWqyLOrjLJzqxDNGfsshpjo5x3nEHiHWMoUrdSkNcOxUj?=
 =?us-ascii?Q?hLnaWlitMtv5A9+YPC55b/DMuEVbrGHwR1P2cz32lE4iStaeRggQ23lU+t7t?=
 =?us-ascii?Q?F72R7PruqaJW93JHYM8H3sWgBeacqLv/ih8vQ/iGnxvMz00Z153+eDAPgspu?=
 =?us-ascii?Q?VcPWIliIv57MzKjCWB9UJNlUeFjxPQ0WSi3YmKoWFhkd6TFM5GUROGj71Hi4?=
 =?us-ascii?Q?OJKAfzq5jKY6JYX/M7wkPlnTrpvS0zfl/mpKe5tpwPtxn2UjNxtg3Yn2bNjN?=
 =?us-ascii?Q?8FvzJ/A81fYhxWyXjmEAbHwjPD1PMeZJKZNt+6nuhzXRA9J88nQUgg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pVT+PU0dJgdcAKzhSti22n/GvUiYaFDOiAdvASV47QY71Iq2XYmo6QJfUFDm?=
 =?us-ascii?Q?RFS2l2qvov0MfNbqqf7O3Cq+b4VGMTYfgWoKeAUqsRaUatfetFNgzSbMn35d?=
 =?us-ascii?Q?MOQrAGWrUh080IWYxI941E06xFtEENerx3GtxU5K0dSeX8g37cU/dBAsL2dq?=
 =?us-ascii?Q?iPpKtAHBrJYxOHpVu8PobbRg2qEcweuOFag3rnVJadtXSCHehoX+HOAcyNJE?=
 =?us-ascii?Q?kiJnqZEffaDx0dQu+S17+9gpO7vJyQxHiTXLDQ4GpfUWFPrPkWRlhf3NWDus?=
 =?us-ascii?Q?BDSTgDRPpi6ms9Dnd6GOWxYoOCnx/vOxVwtkiSjbGXiru63jwInC/TZxfMHd?=
 =?us-ascii?Q?qmJDX4OeOlbQ366Q8xWgHGmfhTVeXXtv+cyXQYsbzuohmMvspVXbats9oCi1?=
 =?us-ascii?Q?HeuprthuKGJX5m4tGSQl0ES0K5LsETNWliIUcdd5Z0SnF34nV8PgKAln9KLL?=
 =?us-ascii?Q?fOfq4BdHElWPG0s2jfzo8Z5/dNQqlkp7RH7HxfzBbddOHfwgfG3cLLcxRqRo?=
 =?us-ascii?Q?Cv3IDH+bzgqKOs8L1hRUkhcwwjEJg8eI1f8kiNli2LQdXGtGqcMybxDuqXmW?=
 =?us-ascii?Q?OCPqqzmfzzDKO0fSVakdsO/DVnCKB+lHYLVEhwK+1G0HC8iV6ggetM9SuTwu?=
 =?us-ascii?Q?/gmlXcq8i0Du/aEa8H1I8Id83EOS4tzn1WgxAFO4jIDwmV0G4sNgVkS8WeYF?=
 =?us-ascii?Q?kxJqfl9iNEhFEE2VfWKj6EiWcWzZCySZC1vYn1SpnygZ9vVBP7tFZPpyXIkw?=
 =?us-ascii?Q?676EOOQex/SkeGNeCgK2WgpgGyDpakXQGr01ekQdRGxcgv3WWZz9UAmnFLYD?=
 =?us-ascii?Q?veTHdU/4HhEAu0B7TvPsQRECnNsQbpmwBdShH2pptRoea9mBKRfSxv2kFYEN?=
 =?us-ascii?Q?p13ZszwFzV6iPWuIBgkyxCLamfdK24g0Av5iVplZUtKxOJ0+vvEP2I7I/pJl?=
 =?us-ascii?Q?jNimhu78nrvaUln7LzwBcy0tEhxQHZq8B0RtyzgvWqUUdo4sWqt9v70AT4oP?=
 =?us-ascii?Q?6hI5r3vRaKiH0IAFFuFilCx87+zRuwvBsUmG1l8KvplHZK2oM4kEDI3ukOCw?=
 =?us-ascii?Q?EH67LhRs7yk72gHdKhIHgQphNIXZj6Ycp7bTj5zX1DyxRGSBOs4nRLYJxLZ8?=
 =?us-ascii?Q?gRiwlN/rJ8hvH/o3lW1siZlB6W5Rd5LYATT6380LhfgucxDgrso9O9tSjNVV?=
 =?us-ascii?Q?P6gywMG9oocRe87CaTwR5Ul9RdICCYN80u2KVtoex+y61NfZIn5HbB2xVgbv?=
 =?us-ascii?Q?2ivX+oU7SGl/bKJDn76xOQUE1QxdH3O+H+q7ADsvFI0/VzeNZR+sfFIDbJTp?=
 =?us-ascii?Q?ICEXfdBlRMjn/NLercbH/dtvBPR0hc96x7jcvsZnx/zs1CpfgoD17yNUNNyw?=
 =?us-ascii?Q?CNkW09/h6wiqYWPW9NJp7SOoyp15AjK1wgvB8wMye0bq0oLRTeDCdcD8sXHr?=
 =?us-ascii?Q?B3lFu/KOA691nNpVgb3RiBk/TwPWA1Yj/MrjBJ1T3Qsqq5ilqmSbLpqsPtsq?=
 =?us-ascii?Q?yTpjXbFAp9AWZS5LDh2zzgxlMTKyz+WL3pLneqgaLJP75/VFJMU6jkU6as3H?=
 =?us-ascii?Q?KvCi6C3m+Y3EmIo95cPU+cCJ0X2Txp7H+1nS+cJOAFZCRfi177IdAiJ2QzSM?=
 =?us-ascii?Q?JQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f02545-0b18-445e-d4a0-08dd735149fc
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 08:18:32.8721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STdZAdcJNkC6wFzaMV40KGAJjMFlmmjRRxfM923TujZqGIlyHWMraTRGswLfa2KZUtmXh2P1wewJfOYd2Kga2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7471
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 08:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116568

The new VIRTUAL-RUNTIME_dbus in oe-core can now be used to select the
preferred runtime D-Bus implementation, such as dbus-broker, so refer
to the variable instead.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 70d05c44bc..78d91baaee 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -163,7 +163,7 @@ RDEPENDS:packagegroup-meta-oe-connectivity:append:libc-=
glibc =3D " wvstreams wvdia
=20
 # dracut needs dracut
 RDEPENDS:packagegroup-meta-oe-core =3D "\
-    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dbus-broker", "", =
d)} \
+    ${@bb.utils.filter('VIRTUAL-RUNTIME_dbus', 'dbus-broker', d)} \
     dbus-cxx \
     dbus-daemon-proxy \
     distro-feed-configs \
--=20
2.39.5


