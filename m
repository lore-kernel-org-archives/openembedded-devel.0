Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F90BC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 14:12:17 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.123])
 by mx.groups.io with SMTP id smtpd.web12.12135.1645020734221093373
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 06:12:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=Gy462PPE;
 spf=pass (domain: arri.de, ip: 40.107.22.123, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9PbWPpRO3mTbfLydA697YykrVvEp4qfkB05TfbygeBmmbecUY3XXUgYHdspA1dSnpmkuGoLf+mIFpKhdRAVv4NnYKBztdG6TZNfksx8WbXlR3+HWCcSuGzj/UO0eReQjcF7LfrL8hBd09+qPeOxLwXIa3xzs9EN2ssII25CzRbsSLW2+o9Okhhu32uELM2kT7QrcaSgbnsy9eDlgebyYz1HUqSoJyCjXHBUyK8lIbHiNVg3KJ+e0e0qG4ew7aTd1AsKZJTtz94aepza8htblrzek2DNApptKi7cRlZBAKXlfqXj0H4Q5zzeTheMdHe8vCvW2r97d61zMB0+iJGsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6Sv7LnrzVEYKRglc6lsr/WevNBVPvoVFsXWyGNfIPw=;
 b=LzamPv9w3fImTTI+STQ9n0I7lwXU7T6kxJyATjUNQDRncVi2bx66bUvniw1pOcCUgpaHmz1b7WGNwQCr8eEBxK02pIBa+5t9f5G+xP17CAIAjiK5UHYewysEriMG0672OF7WawjsiUpRWvhYafigCBNQG4mgJ+gQbyNQoZbPg20zyw3eK+26Vv9nvbNSKNzqJa/t2WaCTL7FJGa442ANiWSxndPvtMwLJ+xYw72gMxTDzlPBBG7NRFygbbm+q79DkOhQtPKrwZPVxX6yy61HUrtdL3mSdF27Pe8biVdRdBH+0r5jxBHlxnuhCe6oGQFhbT+SJgzRzhU80X2APk55Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 217.111.95.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6Sv7LnrzVEYKRglc6lsr/WevNBVPvoVFsXWyGNfIPw=;
 b=Gy462PPE8Qg2VlXnljFQoWY3Jpf62Q/smxtk7xdjg4AtueVl8cszpBI5N5h5zlLvXmrfQ/WyHsqsQwEzSlcWMvUL+zxfi+UjCESvNOG5pVL4LI0n4lblIY1vSskmkgMmiZXfgV/iLdTHjX6hfgZQWBfnHINpy3VEDlKrulbTcZc=
Received: from AM6PR02CA0008.eurprd02.prod.outlook.com (2603:10a6:20b:6e::21)
 by AM8PR07MB7571.eurprd07.prod.outlook.com (2603:10a6:20b:247::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.8; Wed, 16 Feb
 2022 14:12:11 +0000
Received: from AM5EUR02FT019.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::12) by AM6PR02CA0008.outlook.office365.com
 (2603:10a6:20b:6e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Wed, 16 Feb 2022 14:12:11 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 217.111.95.7) smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arri.de: DNS Timeout)
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT019.mail.protection.outlook.com (10.152.8.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 14:12:10 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 16 Feb
 2022 15:12:10 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Wed, 16 Feb 2022 15:12:10 +0100
Received: from localhost.de (192.168.54.102) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 16 Feb 2022 15:12:10
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] graphviz: native: create
 /usr/lib/graphviz/config6 in populate_sysroot
Date: Wed, 16 Feb 2022 15:11:52 +0100
Message-ID: <20220216141152.1666-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.102]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1be1419-72f3-461c-9b58-08d9f15652d3
X-MS-TrafficTypeDiagnostic: AM8PR07MB7571:EE_
X-Microsoft-Antispam-PRVS: 
	<AM8PR07MB75715F5E999A54B5A890DAA4BF359@AM8PR07MB7571.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tqHJdzCl+VHuh8AsQN4yRAlnbGCQwsTU6p3wqn2LZ9DDf9UHsAxKqpuf/i6L27JIytmBH18toJd6HNW04yvOkGf4buXjKZTSe6rBBbozhcriYoI4xW1NtXuSQU3pWkDe8pFSky1LlzhPeiX6uIYarHEEpETOc5vIokMsQuZQWD1VbZRsUPYyzL34weT/ByZED3R+8ojyRlQ/Caq4d+dTcc7ip+s+JCUWaoeX+sbjRTMLGsRFKCAelvfAjt0/fiXL7TeG4YMRW34tM6htqjfpE8HyghVUepAQRyQ/JfFdzROrDfDt1viSWHqfTjQMm4Usb1SVeoeywAqnqtubbewNS2BbVkMX/WJ18BkHv/cQG43UT3q0EvnP88fjrAU01JXBCiyE1ny097ztRk2ki2+l/2O1odH6x0w1nSdCXRGJ7ONHqQ1mFJjtiqIfq26umNHTt3SmP05eTZpOc33NCCf0RGsplnvc+Pxl4QO+Q9tQIE2XPgRtmDeul6dDb8EllKNO7ilvseHRC1afTRv+1I8GAVujqQ4YiatnKGZ8SbHjtZViDPPXuicvMJUqqJOducDa14n9b3EHwNYFiWgyq0kaEkL8qzvDfl3yE9uT80jlVldQ42khIuOQpKXuMYMPNdmAH1ocGBDSfj8XShMMzB7KcOA288EmSicUp58IvzGOGZEWK7KLx3iW9q9rgNHPZRqaMM6W1HnSWfZWYt2P/SkvyA==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(6916009)(54906003)(316002)(86362001)(6666004)(8936002)(81166007)(508600001)(82310400004)(5660300002)(36756003)(40460700003)(356005)(8676002)(70206006)(70586007)(2906002)(4326008)(63350400001)(16526019)(336012)(186003)(26005)(2616005)(426003)(47076005)(1076003)(83380400001)(36860700001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 14:12:10.8248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c1be1419-72f3-461c-9b58-08d9f15652d3
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT019.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB7571
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 14:12:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95333

The `dot` tool requires to be run once after installation in order to
create its configuration file.

The do_prepare_recipe_sysroot task uses do_populate_sysroot in order to
prepare the recipe-sysroot-native. Package postinstall scripts are not
executed for -native packages, but files under ${BINDIR}/postinst-* are.

This is quite the same as graphviz-setup.sh does for nativesdk. The
general idea has been taken from
OECORE/meta/classes/pixbufcache.bbclass.

Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb b/meta-oe=
/recipes-graphics/graphviz/graphviz_2.40.1.bb
index 81ab86c7622e..72e2f5cc7add 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
@@ -55,6 +55,17 @@ do_install_append_class-native() {
     install -m755 ${B}/lib/gvpr/mkdefs ${D}${bindir}
 }
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
+SYSROOT_PREPROCESS_FUNCS_append_class-native =3D " graphviz_sstate_postins=
t"
+
 PACKAGES =3D+ "${PN}-python ${PN}-perl ${PN}-demo"
=20
 FILES_${PN}-python +=3D "${libdir}/python*/site-packages/ ${libdir}/graphv=
iz/python/"
--=20
2.34.1


