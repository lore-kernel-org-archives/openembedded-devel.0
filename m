Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40506C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 14:14:00 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.118])
 by mx.groups.io with SMTP id smtpd.web08.12254.1645020837612408712
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 06:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=CgpU+B1x;
 spf=pass (domain: arri.de, ip: 40.107.7.118, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fu8bFCZ7GzP/1TpI6sdppDav4oqHfG+0y+6uvRTmOwyBB3Sku3hHm0sQuYwLI0QsZD9ihO4y+ATLv+TDobUYVJxVnxhlv7wTduLQypsIEQLohDy369T1pqc8u7a8F5+D2+ywfSo9yavM4+kliwA/yC/3fAT5IpS4YDQvbG9/jfpfp70+xZkQaZqpBxZA99AyEoA/KZeF5YVOSDXxeNGFMVOGQ77Cn9bDIXh2oXCKd3ktdLkogfoMaW6/slcSme+zmSAO3Ijnv0YLbOHenqh5BzXTwV3KpxRxDPASeTNKsRPmxLbL5m00DrBig2XoUOCWDbVYcrwCVjFlk6lrBxDEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJ28BIe6z2emn3pjVE/IMUQyzL6CZ1q4PmR/j2yy5iA=;
 b=cqrEyeBcBE8tOqrkRwCm0Ko3PvrpeLUGx/dNw8DsOBmYPj5HM+hQED0pj0El1xgPbdNSYk7nZbwVZRKH/rp4ilP878guGBmw7feUJad7bCsImWss+0i4DEztKfFykllDiRLsFDnLzt5RhaCBW3uk6ROrQltUGQotG9XVg2CEJCrooNPjmaRp1kX5lZbcHnLMpNQuFQIcZo4crdgx6snH/v2KY7IWFSzqH07l3uf2ICUKL/OO5fOuohqgcZVWldR41h8bc4TE8iIDkny0DnbxwYVzFqvvCLcdhuVQgcZF1LHrmDFXlFwtnWRjtRlEq2UwZCL6flJNrUGFwUrzGvwAXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de; dmarc=none
 action=none header.from=arri.de; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJ28BIe6z2emn3pjVE/IMUQyzL6CZ1q4PmR/j2yy5iA=;
 b=CgpU+B1xm+xgKcURJP+IEConNBs08DMvPbE9+L4oDqioyGvcwr8CchQFoFqwMJ874q4z7aENuKQ8OCz9yr9SSSgod6PezS78j+HE9g3af5EWVL10g3gxdoVrQ6YGe4HaCHpcqD0Q8yZ0jwaBC7EamTcnQ6CwHqTstKinC5dsIvU=
Received: from AS9PR06CA0017.eurprd06.prod.outlook.com (2603:10a6:20b:462::13)
 by PR3PR07MB6506.eurprd07.prod.outlook.com (2603:10a6:102:67::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.8; Wed, 16 Feb
 2022 14:13:53 +0000
Received: from AM5EUR02FT005.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::d) by AS9PR06CA0017.outlook.office365.com
 (2603:10a6:20b:462::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Wed, 16 Feb 2022 14:13:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT005.mail.protection.outlook.com (10.152.8.173) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 14:13:53 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 16 Feb
 2022 15:13:53 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Wed, 16 Feb 2022 15:13:53 +0100
Received: from localhost.de (192.168.54.102) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 16 Feb 2022 15:13:52
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][honister][PATCH] graphviz: native: create
 /usr/lib/graphviz/config6 in populate_sysroot
Date: Wed, 16 Feb 2022 15:13:35 +0100
Message-ID: <20220216141335.1829-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.102]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21dfef3b-ea63-467b-11eb-08d9f1568ff7
X-MS-TrafficTypeDiagnostic: PR3PR07MB6506:EE_
X-Microsoft-Antispam-PRVS: 
	<PR3PR07MB65067216B90DC6D302B6E748BF359@PR3PR07MB6506.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h/ofZG+FD/p01lEb7mcxDMXCZBb+MHoaTxm0a7Z7dAz7HJaOiGLiWj5IX5+80zpXFpJfwmVQ3+GSqz6W+VSk90xgHSqlJfCxC2FG+DURnOCDU+RBViVlhka+W+CORDUDsNCgaOZ8WaC7qcsvubdFbjvGipQeS+eNir7VcU04uTExFVlNR9w+bd+MHxA5o9v1c4pbvFrPDzJ3PBeQKF94XG9QL/O56v8x/TIrRKm21HP5b2aY8S+vUXFyCfOyKMW3kmYDQ3Qk3N5FfmpeCOiKDUN5XfO+Y6uUfYZBYvqFYyW4gIVnvIDlZY4xbYMV1r1sBsrktANT06xok6rzFJ3mPZt7A6nKMMAnlTx444nTbCbYeG0zj77EV0qiksD4Tg6Qv0DSQ/5Sd65ka/20FipAmcEi3X+0kLekm2+Wil2gEMnwEk5VKNMTD9Zi+mr7ksse52XrhHfp+NopWDxzUzbpWnemT7KcaT+yoGXTIxJ+Pp+C5RbKc1DQkJBpYIj1VypVSLubkS7aVYTtN5L82KBuwBuBujmFE4Ip7JC5ENKLGSYMt+Jf0f1nFXOrp6MMbO5h3qMNd+62Y9qO6qI+bpFFeqr8y38pwIk2OQab1N+uzvxp3KzLTP72Ba0ITxvUKlPcY+PuyNJ+THfB9uLC+H475o010+k8PsiAhEch7VjviJTMxUubV4SHw3KnOsCrqeZ80klgaZtjDptHPRl0mnW9bk5TNR15YG5BOdU7cW7NBAInMDFrzsJ0OTco1B3axDzgHXUI0Fy+IZuYWN+zPSBlRg==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(508600001)(26005)(6916009)(6666004)(316002)(1076003)(82310400004)(336012)(81166007)(356005)(86362001)(426003)(186003)(16526019)(54906003)(36756003)(2616005)(83380400001)(70586007)(36860700001)(2906002)(40460700003)(70206006)(5660300002)(4326008)(8936002)(8676002)(47076005)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 14:13:53.3982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 21dfef3b-ea63-467b-11eb-08d9f1568ff7
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT005.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6506
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 14:14:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95335

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


