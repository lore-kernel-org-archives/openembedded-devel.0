Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278B1C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 14:13:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.129])
 by mx.groups.io with SMTP id smtpd.web11.12073.1645020784266213871
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 06:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=nd5+cVBO;
 spf=pass (domain: arri.de, ip: 40.107.21.129, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buuoG7TO1Qh7CuhGSWbLibeQYNf4UHZOLUAHefx1PPmFkH+AOXCKVxxJGHxqjZQVs9Gs9Y/WGqtSDsjfsS6l5KSknTo39DIDV4Y7XYEpiKyk1l5+/aqQhXkXbkgv7XRM3LcX+04NTITa/zCaT3nAtzD+dcxwFK1A7SyfF7iTTESepTYHgwg1Ns99gyu/3PKcMp4sJPHjN9+sf4N51BqI3HuiUcb8ECh4TmmhSKmW2px25vkqHDNI5lCS5vPRip3s0nbmXyqikGyoI+GafzBzDbS9UapoN5TD7QhY44Zukxd7dlqfZlqltPieIp82Me7QS1Q22HcLfvuADvl0CJyNuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSKS/cVcACO+RbERl2VDwBNsAhNzo0PfQXN7mJIwCgs=;
 b=Ik5ZVu/MhfMZecwxcohq80PtnK0VI7W26WoDiZXwer6oyPOulpJQuwYRsnktnuwm0tCRjMSUrWrrRSy3oLzbr5CRZtKftIGMmihWxMRy+4X3CN/eQ4MOWTorrW5MZL8iab8OhnkZUUKM1HETIrXso4jk3HOCBn8yVM/roHeYronQu6Cdde3cZq0AX4bDIfx5YQfTSBYKoLETokgMoAdzde0lKW0W0bQFJ1rxXp0Y2YqU7xNs744bnjnIwbisLtDZ2zHYHDlHwcxgZIgzf96IvkdbKbLLJHa1Q/awhqzRxeaGUYiCxYfewdxAw66poVfWIhKRbxrU/MfGt0pKnbbaZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de; dmarc=none
 action=none header.from=arri.de; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSKS/cVcACO+RbERl2VDwBNsAhNzo0PfQXN7mJIwCgs=;
 b=nd5+cVBO5sHT8cvG+GS53Q2COLHuInMGnCoExV8qG6Qhb91Ciac3mB1AEQOJK2rciUHBdlHVs/tyvcD2taXANPjX8kEUh16x1/yELOfdq6motdvqScOYgZ0k7drC1CUHhlVS/tm3NowBTZjmb2Up+5lEHjpO4r5CAo7F+2ERELg=
Received: from AM5PR0502CA0004.eurprd05.prod.outlook.com
 (2603:10a6:203:91::14) by PA4PR07MB7328.eurprd07.prod.outlook.com
 (2603:10a6:102:d4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.6; Wed, 16 Feb
 2022 14:12:58 +0000
Received: from AM5EUR02FT053.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::42) by AM5PR0502CA0004.outlook.office365.com
 (2603:10a6:203:91::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19 via Frontend
 Transport; Wed, 16 Feb 2022 14:12:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT053.mail.protection.outlook.com (10.152.9.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 14:12:58 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 16 Feb
 2022 15:12:57 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Wed, 16 Feb 2022 15:12:57 +0100
Received: from localhost.de (192.168.54.102) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 16 Feb 2022 15:12:57
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][hardknott][PATCH] graphviz: native: create
 /usr/lib/graphviz/config6 in populate_sysroot
Date: Wed, 16 Feb 2022 15:12:45 +0100
Message-ID: <20220216141245.1785-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.102]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83ccfede-d5d4-4662-6c26-08d9f1566f03
X-MS-TrafficTypeDiagnostic: PA4PR07MB7328:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR07MB7328E5DEF51925A480CB7121BF359@PA4PR07MB7328.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	joZRClwduxu0rlf8Tf60CnlxPPJtXakzpawylN+SzfcVS7IK8crJ+wWXHX/PjCKjDxZ0qn8+5vvfWn7UldmoT1TvAbVWWcccsACtH9ZEQ2/dmquG6LJjOvOZbvHAU4c5i04bSt1hbLtsqChxH4raERnMPCXAVLxDOTFwE9zc6IjiCbCwA0Ir9brA+HA+/4/hmRWr3VvN+QSH1bKEJWpWggH3h0IQy5iGAgC0opaGZLO6hbsPyF3m/S+BiaBFZdmHyAxuOP72vzx0XtoD6RJW50Looy2AYf9fU0YIo/fX6O6DYLoDlDFdyem4bxfF5tRJ/NAbHIbDyai5St3/EEL10ihB414BJLqf3DAlpFueiCDkE78Df9WLWexO8hsXaCSe7F4proRtZFql9vNZ5iCzuy1s1y2rPVyf0L5waWgoBda9fBpbXjcnDjdRRrkHzsRAk6Xspmg63fbiAgUA9QL7YxPyLelnuIiY6ZKbIQ5K2mfyHwvk95t5VFISE4IoXWIZXCw2u4bQ17z2TEMVWiCtGMc+2lxriOcfuOjpNcdrULLyBzqlZ/H1ce4J2AX1X668qud2GYQGKVxf2X+1Qsyz4WoyJsiCEdnbx1x9YzXFZv2RZmCzWmD56BxquVv1Pspe/ogI5AHGTWQw0ClvrxT7aMy/vx1mfpkxQ237vyiLQ9uqjhTruU/LQ101UstS/2GBSP/Y+tBkwGfKphrZDhiMW0IPDw2Kha4dG8CoghH8Z154oqNT6DpTCUbKH6dCzu8oGCgCw2NMZrWPEG3xgrBSxw==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(54906003)(2616005)(6916009)(508600001)(316002)(83380400001)(6666004)(36860700001)(5660300002)(47076005)(81166007)(2906002)(426003)(36756003)(16526019)(336012)(186003)(26005)(40460700003)(8936002)(1076003)(82310400004)(356005)(70206006)(70586007)(8676002)(86362001)(4326008)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 14:12:58.1143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 83ccfede-d5d4-4662-6c26-08d9f1566f03
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT053.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7328
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 14:13:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95334

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
index 8fe837b75ceb..cc57761bc4fe 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
@@ -74,6 +74,17 @@ do_install_append_class-nativesdk() {
 }
 FILES_${PN}_class-nativesdk +=3D "${SDKPATHNATIVE}"
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


