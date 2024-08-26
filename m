Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919DAC5472C
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 14:17:42 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.67])
 by mx.groups.io with SMTP id smtpd.web10.53896.1724681855240839904
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 07:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=ou78sybM;
 spf=pass (domain: de.bosch.com, ip: 40.107.103.67, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apd7qNrN95bRBXk/v18gVY73AEMHm6LNGBmwCb6vHziigyTyCOFO3Ax2GHCHg8Eq+LAwD4Z3cSRcFjoza5OHRT86Ih9eBWffixooo/NA89L7ZAAZEt9oyv9tLT0gJdLg5BsWciwb2ydr7FCtyuJVV5KVups6ZcfDU7o0w1+K5tg2Rt4TCulY69eQDt6j5OHrgtiIXIoSXbAuXg/z7i1zDQLoGhq7I+/6vxi7o444aL+ozhfshIetGwp7Vo8Ql5QyiWZUuD5F9l2tfxvTJjfUUP2THd7/BLt+5TALdBGVZOeat+pdpcm3wHBbQY1QVf1mybqy1Y613UCwCenIMjNrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8hOOTcNUFlQw2hVuShIYZKaSWflBEkapoqNLT0YbE8=;
 b=nhuzagQqcJndQHqlVLHAZVBN5WhJTPLpIiYkrrtvMFyAd+obqZ26rYVx3qyd2zXYq3MQ2DPaDRnbg7N7dffNGjh1uLm5vYPxM4xqXbinveQbkIBpx4H9Eri72+UBBE4QBnKIepfe0PbcuTXW2gHedst4Bymcta+j6Iq5XNW0szose0QnGj9r36d2iXsUDXHyndwxEY9oN16z1GKzVIx4r+0enPTwP54/VGAj2xU8BhTwmAZczTPZW7OBfV6JCgOZlVhb9PtrZGHtmmFVT0DoXwskElO163dkntV9uT4hoYIIhr9+64Ty7+oXLlhXI9aOcK/3P679jruo5TCb+5IXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8hOOTcNUFlQw2hVuShIYZKaSWflBEkapoqNLT0YbE8=;
 b=ou78sybM+gGP9h7tMKe1zQlMORlRc3sPttJcvfGZKx+aqJcprMIFN7o7x9KYsQ/bNNzuFXUkhqkfkTNw/eq9day01fACFo5EoHFOH0FtJ2K9E8CJE7yYoMLrnfW71NBH/UqQUUZ+YYLUKmQNEWH2OslDKoad6OTMhutsZG3yTwLfb/6uwFRDhntuYr8RgF94qBE1noM0w2wtZLgWoG6BU98ocF/j5SinMrshCshhwNwGn4p9mgQ33MZ8sYKLQwECiVRNTXGpFfaV8H55dRVnfg7Kn7E7mew+gJsUfzLemcfc559hFSwxzd7mFYAXYQPN1UHBOesO12u0+Ee9oUxQ7Q==
Received: from AS9PR05CA0155.eurprd05.prod.outlook.com (2603:10a6:20b:496::8)
 by DU0PR10MB5750.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:313::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 14:17:29 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:496:cafe::61) by AS9PR05CA0155.outlook.office365.com
 (2603:10a6:20b:496::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24 via Frontend
 Transport; Mon, 26 Aug 2024 14:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 14:17:28 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 16:17:18 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 16:17:18 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <ricardo.simoes@pt.bosch.com>, Mark Jonas
	<mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH 2/4] directfb: Add freetype PACKAGECONFIG
Date: Mon, 26 Aug 2024 16:16:42 +0200
Message-ID: <20240826141644.78746-3-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826141644.78746-1-mark.jonas@de.bosch.com>
References: <20240826141644.78746-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DE:EE_|DU0PR10MB5750:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab8d4e4-9c43-4143-c705-08dcc5d9d10c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z0NmsbycVThJdB1ftrIqgCMBnth/3a1Jx1nSPtc8fHcEZBWswLsNfe//6FHm?=
 =?us-ascii?Q?JJitLrTpr96day/n4dxxHA+wj8SJT/w2WEM+S/CtC6WxOSBMsBs7EPwz4ZJ3?=
 =?us-ascii?Q?OXGIIjZxE547bhfmtL7DnkcB1YhJMMzqwIj7PgeeljDm5s5go+vJo92zufOV?=
 =?us-ascii?Q?3e7OK1rcHM/rKZxblO3g2EqIyadhbiyjOf36XNNQuMYWVs+Xy4JJ7ZNb6OyL?=
 =?us-ascii?Q?pcluweim28tcFeI3EsdvbCScuiixV+5r5zhgR+KBkziM0goOYUhjZ1tU1uGN?=
 =?us-ascii?Q?v6jiQIyBYEPr1EFs+1I8XGE1NkKL7+6quQ8gKcJyuxCEQ809J1EtFYirhqNs?=
 =?us-ascii?Q?DgsjHWEZmy/BUE9xtNTRvfSya9boL67hQ+DbNMKTKsc98YW+nVFWkRP3M6KL?=
 =?us-ascii?Q?yzEDwfBkh0h3Tr/GJopu0OmcCPwfig/0EQzP47O69m64NrFuX6umQuxKf9b4?=
 =?us-ascii?Q?DYX5VC9qWYJdfYwLFhSSQBEhuLhACvceQBu5dqhJrRgqm99JNxz38/YHERNn?=
 =?us-ascii?Q?u9bWQ/vGWpPDGog5gngOzs+mOjdIvxZi/y80KgYhun1SyjbT9VomWJ8bc3n3?=
 =?us-ascii?Q?OCnjPKckowLDemlnNd1Z1eKtPVQi2ZFd0rGTy7erd9edlEhYFk0B65+oG06U?=
 =?us-ascii?Q?7gwcQ4hXJqhVzPwooFT8PhyQz3YCh8MUHzKJOaEYIYsTYISTFh9xK5e8bKqF?=
 =?us-ascii?Q?aHRC77R3TwKZPH6rdJcJNY26Kq+Sq83AcwP3A4JrpMFWi6iNS+TBBAK0FRgc?=
 =?us-ascii?Q?R4RMGy1WrytlI1uENCUwTm7e/Y1iJ7d/IwOhmnNKcqTafBvfR0FBSvpuKMTY?=
 =?us-ascii?Q?N4DY5NUDP5WcyBf7AaQbh1CO2hPMT7enkXmFOuO5oOm8Fl9z1p6O3G1FWdQI?=
 =?us-ascii?Q?4oWb8Drx0X7/0rjL1AYEXyHedP8sv/lKhgtRiARLVcjGG2pn9NFJ2zXRxh9J?=
 =?us-ascii?Q?KuUmjWPhbBlIV/vtTlpe6iT8IyruZSp849+HfXT5WBniQPOXRRLk5HqrGtkF?=
 =?us-ascii?Q?KO5jwT33MuG4CkblIRBuiA0O/0nQbtNHtzOLkmj2nKrSRMXQ0EOhIQG9ZpqD?=
 =?us-ascii?Q?fLTZhnFnrVYOt3G9qWoFUbrELjfMkzz9c+xiFKit2ZaRK1af66Tifa/lbXMl?=
 =?us-ascii?Q?ZrR5o2/wGSrtYpkbnv6bOm/s+XzA58SXhSlQZSe+SUQu6qmdS2ZRtMFGEDtH?=
 =?us-ascii?Q?lmEzq8R8J74sDcDNuCThH9f8LUMeRBblX70HJRwDRcz246yjV1DezKS1HHC6?=
 =?us-ascii?Q?+TV2M2GQJpk7HYp9z/m/IpSz7LUR7FF7Jk35IJxW24fk2E3yghyQHwknfyZg?=
 =?us-ascii?Q?IGvHl4i/ji/z1RSrc4JtC54M8jICBvR3DK30fjw+mItny+/LGcg7zgGczi6r?=
 =?us-ascii?Q?GWJWZgZUCjD9mL9ymBhYPdm7wo9J?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 14:17:28.4993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab8d4e4-9c43-4143-c705-08dcc5d9d10c
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5750
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 14:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111966

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

freetype was always enabled in DEPENDS and EXTRA_OEMAKE. Now it is
a PACKAGECONFIG which is enabled by default.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta-oe/recipes-graphics/directfb/directfb.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recip=
es-graphics/directfb/directfb.inc
index 3fbfd9ce7..1f81d2ecc 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -9,7 +9,7 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddcf3c825659e82539645da41a790858=
9"
=20
 HOMEPAGE =3D "http://directfb.org"
-DEPENDS =3D "jpeg libpng freetype zlib sysfsutils"
+DEPENDS =3D "jpeg libpng zlib sysfsutils"
=20
 SRC_URI =3D "http://downloads.yoctoproject.org/mirror/sources/DirectFB-${P=
V}.tar.gz \
            file://configurefix.patch \
@@ -40,8 +40,9 @@ BINCONFIG =3D "${bindir}/directfb-config"
=20
 inherit autotools binconfig-disabled pkgconfig
=20
-PACKAGECONFIG ??=3D "linuxinput"
+PACKAGECONFIG ??=3D "freetype linuxinput"
 PACKAGECONFIG[drmkms] =3D "--enable-drmkms,--disable-drmkms,libdrm"
+PACKAGECONFIG[freetype] =3D "--enable-freetype,--disable-freetype,freetype=
"
 PACKAGECONFIG[jpeg2000] =3D "--enable-jpeg2000,--disable-jpeg2000,jasper"
 PACKAGECONFIG[mesa] =3D "--enable-mesa,--disable-mesa,virtual/mesa,"
 PACKAGECONFIG[linuxinput] =3D "--with-inputdrivers=3Dlinuxinput,,"
@@ -53,7 +54,6 @@ PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,xserve=
r-xorg,"
=20
 EXTRA_OECONF =3D "\
   --with-gfxdrivers=3Dnone \
-  --enable-freetype=3Dyes \
   --enable-zlib \
   --disable-imlib2 \
   --disable-sdl \
--=20
2.34.1


