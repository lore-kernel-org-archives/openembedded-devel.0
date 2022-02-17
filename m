Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0174AC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 14:45:53 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.102])
 by mx.groups.io with SMTP id smtpd.web12.613.1645109149290498337
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:45:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=caQjQ2oe;
 spf=pass (domain: arri.de, ip: 40.107.15.102, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiqtG8GXhahO/acFGX7DBJ1fKbrmYmsLQktxJvxrlnrJISyLShXUBjmxT3zHscaELUyMZ7y1srfPQi9+KP+VNWdmGB3QOTFKMnKWveV41DlDlJQrukJff8sd2khtI2cO0R20caL5fPDQXhM+elfI36nhZXpD+16oobU0ndnNXRIohBSPpEg6kBv2+VpHKrCQAIHUdwqusvaXoI5wyTyD9kLGKAgu37wBNApZG4p0NgIpgboVJc21bR++udPDmDDVcNfzAyWJLHb54gJehrH6o+VF2Gntm7/J5RJfvNL1+geSFl4YNhYDOe62LhqNP3OvWRVIQFGAX6RNfSVo3JFWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKVW5iw4CsXXFjAUIWH4tpoHLbVqZKi80m3ndPXlrAE=;
 b=exJAWOCFg6yJLAshpjwpkhlmLoC6osLdrh9gBNau+h2Rcoz8ZHcPjry+iTuFfhXv9ZdvmATrwigRNF7QNR7FzyEGIqtX/4+tjYCVWz8jD2vcmmdOYCxTCqMXWfiNqM73PuxeVuJemOeoiGpsjljHSC/YnsapSlb8/KdD+RvlzdHHErF0bo79lCKAVmGNBA5dWl0IYWU+7c18nVoRTFur7GpQENfVdamytIfaoUxCZ3ZDFbI67MRHBwp8GK63NVD3kgMMbBh8ratb+0bV7RVMGvI78Ql5/pjl0eKVVTJx+aJ8TncMOkDyI6zJUL25xYw0196jiiKTMrTaL6xcRslySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKVW5iw4CsXXFjAUIWH4tpoHLbVqZKi80m3ndPXlrAE=;
 b=caQjQ2oe5PzQLADezLZXu67V0jobWEOmNzPy5p7x2hZ+uzN+nF3HHO+XQmvjgjwBs1NvC73NUS3owedbb1jpApZaH16AjsSPPh908qfbtOcMbhsUyjD3oaDBlYw1HmXOxkB4HLLyzgPeQD4P/86E9l2io4E9liIoU13LKMFnuGc=
Received: from AM6PR08CA0027.eurprd08.prod.outlook.com (2603:10a6:20b:c0::15)
 by AM0PR07MB4964.eurprd07.prod.outlook.com (2603:10a6:208:e8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 14:45:45 +0000
Received: from VE1EUR02FT048.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::a) by AM6PR08CA0027.outlook.office365.com
 (2603:10a6:20b:c0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Thu, 17 Feb 2022 14:45:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT048.mail.protection.outlook.com (10.152.13.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 17 Feb 2022 14:45:44 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Thu, 17 Feb
 2022 15:45:43 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Thu, 17 Feb 2022 15:45:43 +0100
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.55.37) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 17 Feb
 2022 15:45:43 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH] pcapplusplus: add new recipe
Date: Thu, 17 Feb 2022 15:45:33 +0100
Message-ID: <20220217144533.23247-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.55.37]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85f3cadd-b90a-41c0-6485-08d9f2242d7b
X-MS-TrafficTypeDiagnostic: AM0PR07MB4964:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR07MB4964AABBC181F0EBCDDABFD1BF369@AM0PR07MB4964.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KZeeb0H0I/sxrSyi7Eb1buf4tAsqan07Ae8OQ6G/LI/Tzwy9v8m5Hst/ck7m/yoYBsfXyVDFKOoH4iVJXgx/N22VdKadWQCIfGWI9Kmlwtbt0z41o+BxBfqPVzQOXXZghWItsfZaPr3PSG4cE05DQFtZT0VSud5h3tp83UAUtQ/6kAvzpq+b4HSacoZnrC1cZwvgD5T1hbh/nYV9FS3jV0GaT6et/iA6bUoKHNb9g8ew0GTtD61i58FyYmnYv4XFMoSHBKAioWtpn3GHAOoVsKup449HrRtEwKJHmKF4QsjwW2nNDb3dIuZMHiOVjNcbOcQp02SyeOdA0no6j9Ebon1apfNQe9b5nc5X09+Peku2pQMvbaMld2EwoFxek+Ol1O7I2Il0dCgLdXuMB3eYLcGsPE28qpOFvoNUJ6v+dwrJf7HY7Ziy4EvdsImy0leCpEDJK1UvBAOLbZ+0m5kDkzYvPj0r+TCHCUIo0W9PYD8D+lHX+dy0BRweUsqYVEpwg3QbwgCrTZtXTzv2bl6VcaH4fUof0rCXSG0v77iHnwzrRZovra5GehbQ00OaUboDylqtwu8iGSmlDBOwC6pANKq5cGTOIh+WkJF9R+b97oJN96BQ0uyqY45T+v8wsEMNehD/J+k8ZX0try25lgWsAWUmh2vs6f1r1lGU00kMVc2eHsfKHKzZLkAM7ZBMo5vwoD1dsGuDCuzUzxJ0xmeax9wlJFAZnDMtem7aOK1jokXQ6eggGYXDVvt1w/dSD6mGX5UqYUoUOqs4lrULOjEH1aPZhG+vgZAS3zNp0DQL390=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(47076005)(36860700001)(40460700003)(86362001)(82310400004)(81166007)(356005)(107886003)(6666004)(508600001)(2616005)(1076003)(36756003)(426003)(16526019)(186003)(26005)(336012)(8936002)(5660300002)(2906002)(6916009)(70206006)(70586007)(316002)(4326008)(8676002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 14:45:44.4972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 85f3cadd-b90a-41c0-6485-08d9f2242d7b
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT048.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB4964
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Feb 2022 14:45:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95358

"A multiplatform C++ library for capturing, parsing and crafting of
network packets"

PcapPlusPlus uses as custom build system (shell script + Makefile).
There were attempts for using cmake but this work has never been
finished.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 .../pcapplusplus/pcapplusplus_21.11.bb        | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_=
21.11.bb

diff --git a/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.b=
b b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb
new file mode 100644
index 000000000000..0d2f83cf4af7
--- /dev/null
+++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_21.11.bb
@@ -0,0 +1,40 @@
+SUMMARY =3D "A multiplatform C++ library for capturing, parsing and crafti=
ng of network packets"
+HOMEPAGE =3D "https://pcapplusplus.github.io/"
+BUGTRACKER =3D "https://github.com/seladb/PcapPlusPlus/issues"
+SECTION =3D "libs/network"
+LICENSE =3D "Unlicense"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D911690f51af322440237a253d695d19=
f"
+
+DEPENDS =3D "libpcap"
+
+SRC_URI =3D "git://github.com/seladb/PcapPlusPlus.git;protocol=3Dhttps;bra=
nch=3Dmaster"
+SRCREV =3D "ddce58723a4ef7ab19bf1507e6323990b4d2d15e"
+
+S =3D "${WORKDIR}/git"
+
+EXTRA_CONF:libc-musl +=3D "--musl"
+# PcapPlusPlus uses a custom shell script for configuration
+do_configure () {
+    # must use the --default switch only if no other switches are set
+    mkdir -p "${D}${prefix}"
+    ./configure-linux.sh --install-dir "${D}${prefix}" ${EXTRA_CONF}
+}
+
+do_compile () {
+    # build only libs
+    oe_runmake libs
+}
+
+do_install () {
+    # install script uses PKG_CONFIG_PATH as destination path for .pc file=
s
+    export PKG_CONFIG_PATH=3D"${D}${libdir}/pkgconfig"
+    oe_runmake install
+    # remove example makefile
+    rm -rf "${D}${prefix}/etc"
+    # remove ${D} in .pc file
+    sed -i "s@${D}@@g" ${D}${libdir}/pkgconfig/*.pc
+    chown -R root:root ${D}${libdir}/pkgconfig/*.pc
+}
+
+# main package is empty
+RDEPENDS:${PN}-dev =3D ""
--=20
2.34.1


