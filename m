Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D033AC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 12:36:58 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.92])
 by mx.groups.io with SMTP id smtpd.web10.33122.1644842215474401935
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Feb 2022 04:36:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=IokkUQo5;
 spf=pass (domain: arri.de, ip: 40.107.21.92, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1G+ObCfqsgZZ9FY+Bl17pg5qOoR8NvyC+vjr8j8PrOeQwk+TnF9a9rZmeBxjIiLCTlgRo4V80GPau/xuqKkoPKf0SyHUCbsRSHtswNWaaO+tsSNrLA2+LRhnsjkOeFscPWpjcv4Hh3QipnzLlirgOQLFrCByZqHEfqtGrdDfcBeLPoF2nnBjrCoRGYdXcSGRYXmHUPI1G3+oSqIteGPHJ5qXHrBgc/uOAugKFXoC05Jw1hCGNfSuU7npqVcDN7qToBccPuhMsPwjB9CA7fZY+I3U6i/HS5/5PVA/JJ5ZFqM/vARbPoYXXDXqLDvAHuQ0ckE2IWVWlveNdAgtSUF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eoZK3sIHJZBM2NPB1eAca/5fRKifPtG9X7GQzoUED8=;
 b=CRpoYlp8T0CyXNGYK2n2DMuLJX/NRtO+HwMRDOjRn2JG2m7YuT0yl0SfKYSk5+Bz1mTU953+vhWhuM0WNV4heBHC+R7aOP9Yl4gdAh/vjJ2EXNlKKZ7HjMOBrtNsVqoViJwCk+/ltl85RO60Hokr9gOXzLghzHFFniJs1tnqMUN9rMQkIv0j42F9ZzHvxG2Cj7aEGrogLrfLPZ+3YILgBhzNQoDxo+2CT70fHAP2tMVKEbNq/SJ6oGJucUMrNjySd2QIRA7ou3EWXEmchS7ilFSd7B3g/4xYX7h/8OK5pLXbRfFsu+jfm9pNRQLZYnU0ZjUfXYrOh1c5IcDd0Jf92Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eoZK3sIHJZBM2NPB1eAca/5fRKifPtG9X7GQzoUED8=;
 b=IokkUQo5x1FK1KkA0p/igJetYci2L7igGSyyKMA1JWq8I/DMUhVPB4Wv7Xa2akeUw+VCyChE5wRIVRTa3bWBMDBA5VoHpRjCkW7RF/MIZuzZmNaiSBOD5SYdvMPqzRAKLHqMqxT0IhdaQ0we4ifLniB8SIMHnzdos4DUw/7dWB4=
Received: from SV0P279CA0030.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:12::17)
 by DB6PR07MB4341.eurprd07.prod.outlook.com (2603:10a6:6:4f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.8; Mon, 14 Feb
 2022 12:36:51 +0000
Received: from HE1EUR02FT041.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:f10:12:cafe::a) by SV0P279CA0030.outlook.office365.com
 (2603:10a6:f10:12::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12 via Frontend
 Transport; Mon, 14 Feb 2022 12:36:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 HE1EUR02FT041.mail.protection.outlook.com (10.152.11.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 12:36:50 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 14 Feb
 2022 13:36:50 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Mon, 14 Feb 2022 13:36:50 +0100
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.54.144) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 14 Feb
 2022 13:36:49 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH] graphviz: native: create /usr/lib/graphviz/config6
 in populate_sysroot
Date: Mon, 14 Feb 2022 13:36:39 +0100
Message-ID: <20220214123639.26331-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.144]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43d3506b-0a97-499a-6a03-08d9efb6ac95
X-MS-TrafficTypeDiagnostic: DB6PR07MB4341:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR07MB43416CD1AFB6CC91D0662E50BF339@DB6PR07MB4341.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Yr0C0F1UZsETRejZvuGwmRx/HOwHEioZUYCPNfM+VVo8qfVIAYXHs9VnOf+lt/MU/viRz++Fmxdx+qnVmBx8/tumonFD2j17ab76MTLiWv5pxqTRgCUJfIEAwshyfePHmN93tLPdY9cTMOHHKgfUFefRRH0kWxvYYOjsn7mq64QSNElVBpbol1OgiakK6oncVUNdtIxIgD6h/bUnI5y3WW5Lgq81a2MFz0gdojEA43jZ3jm/euepEK9sjeHwcxCm0N2LEP1Wsa5tQoz6UIecbjJNKMf9wvXVHILNXyKzar3mdopu3mUpg1+Dj5xWXA/Iwn3akFpColK9xoSyT2cqRHsSpBNEKlh4Yrmn3Td0MmU9S7flIHlDxbdMX/mS8PrQolXAEImCEk+J7XZqOPC3TuUJ/KkbZTwfuBSw12uADZkLZbA2TtQySyJLmPgPckXgMY4n80LMzJMNZ7RBjvGR+7Ggs6inaVV3f4CHSz9rO6pI3MwQ7ARy/HK+B3XclmVn+hXt5baDNYg9KFD1TZsrXjZHGJAEHFT0e+GXXO2UOrc+f9WVtYV+RaaXI7RSeICk2YtWjjXq/ZcjW2IipYLiWx/hcX1nHEhY4Znd0tU8LayHDqNeWAjXOXLsYs2ry1rnk2632nk6F1MbP50WItNDRJqdT8tSizTBn0y926GK+/oyQNwj73utKw40ZpL4laoc
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(47076005)(107886003)(2906002)(83380400001)(336012)(186003)(36860700001)(16526019)(2616005)(6916009)(316002)(6666004)(508600001)(36756003)(8936002)(26005)(1076003)(426003)(8676002)(356005)(86362001)(82310400004)(5660300002)(4326008)(81166007)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 12:36:50.7416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 43d3506b-0a97-499a-6a03-08d9efb6ac95
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT041.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR07MB4341
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Feb 2022 12:36:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95308

The `dot` tool requires to be run once after installation in order to
create its configuration file.

The do_prepare_recipe_sysroot task uses do_populate_sysroot in order to
prepare the recipe-sysroot-native. Package postinstall scripts are not
executed for -native packages, but files under ${BINDIR}/postinst-* are.

This is quite the same as graphviz-setup.sh does for nativesdk. The
general idea has been taken from
OECORE/meta/classes/pixbufcache.bbclass.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb b/meta-oe=
/recipes-graphics/graphviz/graphviz_2.44.1.bb
index 7d2515e07549..203e0206fbfe 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
@@ -74,6 +74,17 @@ do_install:append:class-nativesdk() {
 }
 FILES:${PN}:class-nativesdk +=3D "${SDKPATHNATIVE}"
=20
+# create /usr/lib/graphviz/config6
+graphviz_sstate_postinst() {
+    mkdir -p ${SYSROOT_DESTDIR}${bindir}
+    dest=3D${SYSROOT_DESTDIR}${bindir}/postinst-${PN}
+    echo '#!/bin/sh' > $dest
+    echo '' >> $dest
+    echo 'dot -c' >> $dest
+    chmod 0755 $dest
+}
+SYSROOT_PREPROCESS_FUNCS:append:class-native =3D " graphviz_sstate_postins=
t"
+
 PACKAGES =3D+ "${PN}-python ${PN}-perl ${PN}-demo"
=20
 FILES:${PN}-python +=3D "${libdir}/python*/site-packages/ ${libdir}/graphv=
iz/python/"
--=20
2.34.1


