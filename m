Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8091A109025D
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 17:03:43 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1117.1773939821115907143
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 10:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=kFqJq3ff;
 spf=pass (domain: de.bosch.com, ip: 52.101.72.36, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vm/Gz1Y3knKCmDZTEeLRiut6WRuuxjeJFsYk+bNzPTlAjVp8v1wHa8Duxb/Qttdrbvb1E7BTUCuEK1ByV3qhDrKlVo/pM8yCCa8R5hmGCDQ+iIUNdLt+JyP7G0o2qHVhYMlko6gCFjlYXE7NgujWIp+UpUdIlGXaBDQ40g+1GeoYBk8kKoGhJne0oZYrE05x7mrnRP4B0sEvWQu1ANPpn2rTmSDtninjJXHTGL6UdGqXOQ6PhCW3+6tsMUYICFrs7QkuPnvSRTst4l046sqEq5Gw0rjzvEI/EqlWCq/uPTrP4SV7SNc+HefP9HbHR53wuuZbi4GWR1bgS0jAgAP5OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPq3VK6rm8RSlVkxjnVGXL6sB2SuZiRI8IJqH0y2jhU=;
 b=lHbRugEvdHcKBHtpROKUle7BoEnhtHdVj87xICUIwq11+6T/RYErOPavfPUhtz1qddVk3I4/462rfrTO2TCzyYqc3L6Iy+a6k5eU2XhfXcxYxz/tqRZxji6tyABLngeNl7TQo9j6/m3WWzXc2iNT/6VUQN8oZFxJWJteQlV4cRIHJwcr2raZY4S4sK25Fcf7yfWL5OyVxGPxjL6GxIEKT88B2jNJdvI4+zpWYBXz2KKkliV6WwRZwfbF7q1mx/DBVs9QaCsfN1QWXO0d3GwWt2EEHbx+f9BnEFgET7zwHKt14X24HyPtq++tWTqMUnMB7IGcjCy0RHjXQSjVVE/CBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPq3VK6rm8RSlVkxjnVGXL6sB2SuZiRI8IJqH0y2jhU=;
 b=kFqJq3ffL28PDC/FqY5WW6a97urcxX3bOu1wvG4OSP1yHniAwWc8E/EjDdDOV9upl3UPFsVc4nCEmr3XnQXoedbo2pV2PmGg59uXlU9sElqmzskgKhQ03lBEPsj05Kk2YYhklaKL/FnnncrFXrhfknkXkOfBa5Dqo0gvg0FhleUcsVib3T7DidsqQhETOXROxJhgFb/JRVYh7RqSPGkh3B72kfVRSTUL83+E4ZJ8tCazHZC5S9OG1Uv2vVRjnDWj5cHpKZfEbaPaYrs89fWAVM2NdCkvEizYL5qmFFMjjvNOH/M0JkKWjjwr0N8pX4UOZX66//Rxeql4e90pZmgWHQ==
Received: from AS4P189CA0015.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::19)
 by AS4PR10MB5393.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 17:03:37 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::b3) by AS4P189CA0015.outlook.office365.com
 (2603:10a6:20b:5d7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 17:03:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 17:03:35 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 19 Mar
 2026 18:03:35 +0100
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.70.204) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 18:03:30 +0100
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, maffan <marcus.flyckt@gmail.com>, "Wang
 Mingyu" <wangmy@fujitsu.com>, Ricardo Simoes <ricardo.simoes@pt.bosch.com>,
	Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-networking][PATCH] networkd-dispatcher: Refactor recipe
Date: Thu, 19 Mar 2026 18:02:23 +0100
Message-ID: <20260319170223.1353-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.70.204]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79C:EE_|AS4PR10MB5393:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee7b0dd-50f8-45d7-6acc-08de85d9755b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	/dYpg9Uej/LtAQ/lFUjva/bXGD8QxbwLYW4yM9AokJXzxlQ9GlkYBT9EhKsPb2fNd0OGaiaip+omeS6t3kmkt8vsmG5kQ9oNRwDkxuRti2LOV9YNyvTqei+q5SB+z8Bfz3/Fc/UyS354qdAn0ZcIr+KwUELxGzGIct4VCv7Hqku3t99UA0Maoat3KSxaSCqlwFKPLmfMCpPcf7vA5mctOIkWcGrp9W8tu7MZYnbmGnnDogq2Jy0DnInXLLbTJJHiakg3zhuwJ9yT+P2x2kjWKVnhS8dkHVsQqKGxXNeUOKqfQUD3BU0vYehLeYBX24EIPvR/n9RnyS+Q6EXyrQpnJnh0vIvJbmKnGg+Vo3sEWnvPbWp1XXVjwdgRHCx8w6/Rlz4Vhhwqv9c7FePY4+31wuCvHVVJsBFigtD6gXSQjXY28LZ9M4XrTEtcjudutj7oSIl74e2z5ZVFkSL8anwhDWs8k4gRZv7TOdHNmoR2RVosDt62nbCRzviLdU7d7m2xPZIcS6qIQVWz45ZrjfWdjLHN+veP+hRoT98mQLEAtagrfaw9d7Q/xnpBzGR5Q+87n12AOozXkFL+kvn1gOcP2IoK4A+cJ+zLs92t7yIPfgosMiB3kUoDrfnVT4tmCutwV/5P3NDozPFT/dSGMgGEozP5MYHolTmWiWvyCdSlnBEBjCCfe+UTACEyE34voYdGgU+neYs98ocgDEyyt3mNllQVE1dVdvPblQcN4V6L6oI=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BxY/CRQ5BzzvGvRJL9ryFMq6mt6p9oUy8e3VqtopOhMIus3GeyNrFN2yGfpoNo+O4N1luLNMRr+gFEAjen/Y8yq2RGMEHCHUqRKWeYXsTHQMOyu9Wu34nBgb+RO6F49ZJ/UV/CtM2GhCcOybf7c0zMkaIKqVX37pE2CW1pOERFpWJHukHatspt692UnRqoolGVCZT2OtEnABfsW3raq0lEvaSXgwHDcy00EpSWPQeH5ffE9NRuiT0bsKS5MGbYDw6W1o9PjjnhZEVd7O/cEzR6FkqpQiMzmPmhUM7/JLVA2BB2mlRZPHXpLDUG5ZQjZjbcisTPlnLxmf3iHyQ4mz+i2mYZONVDJ6mF3B6LdB1zt97uhTYJl5guNSo70PEgq8Ds8XmmM4WIIgMJW9O4K2iMj84gaAYA9obBPuCy1Bw7mNTDOwwSY6fPKkh65WHerp
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:03:35.5738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee7b0dd-50f8-45d7-6acc-08de85d9755b
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5393
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 17:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125406

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

This commit fixes the below issues with the networkd-dispatcher recipe:
- Add the missing required variables defined in [1]:
  - HOMEPAGE
  - BUGTRACKER
- Add the SECTION variable allowing improved package management [2]
- Drop SYSTEMD_PACKAGES PN as this is already handled by systemd
  bbclass [3]
- Inherit allarch as the recipe does not create any architecture
  dependent files
- Change the recipe ordering so that [4] is respected
- Add tag parameter for the git fetch, as recommended by [5]

[1] https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html=
#required-variables
[2] https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-SECTIO=
N
[3] https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-SYSTEM=
D_PACKAGES
[4] https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html=
#variable-ordering
[5] https://docs.yoctoproject.org/dev/migration-guides/migration-5.3.html#b=
itbake-git-fetcher-tag-parameter

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 .../networkd-dispatcher/networkd-dispatcher_2.2.4.bb | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-d=
ispatcher_2.2.4.bb b/meta-networking/recipes-daemons/networkd-dispatcher/ne=
tworkd-dispatcher_2.2.4.bb
index e7db8a948b..aa7c9b8736 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatch=
er_2.2.4.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatch=
er_2.2.4.bb
@@ -2,20 +2,20 @@ SUMMARY =3D "Dispatcher service for systemd-networkd conn=
ection status changes"
 DESCRIPTION =3D "This daemon is similar to NetworkManager-dispatcher, but =
is much \
 more limited in the types of events it supports due to the limited nature =
of \
 systemd-networkd(8)."
+HOMEPAGE =3D "https://gitlab.com/craftyguy/networkd-dispatcher"
+BUGTRACKER =3D "https://gitlab.com/craftyguy/networkd-dispatcher/-/issues"
+SECTION =3D "network"
=20
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D84dcc94da3adb52b53ae4fa38fe49e5=
d"
=20
-inherit features_check systemd
+inherit allarch features_check systemd
=20
-RDEPENDS:${PN} =3D "python3-pygobject python3-dbus python3-json"
 REQUIRED_DISTRO_FEATURES =3D "systemd gobject-introspection-data"
=20
+SRC_URI =3D "git://gitlab.com/craftyguy/networkd-dispatcher;protocol=3Dhtt=
ps;nobranch=3D1;tag=3D${PV}"
 SRCREV =3D "dfd26d72793914eb3da910ef8c71de6d7c8942a2"
-SRC_URI =3D "git://gitlab.com/craftyguy/networkd-dispatcher;protocol=3Dhtt=
ps;nobranch=3D1"
=20
-
-SYSTEMD_PACKAGES =3D "${PN}"
 SYSTEMD_SERVICE:${PN} =3D "networkd-dispatcher.service"
 SYSTEMD_AUTO_ENABLE =3D "disable"
=20
@@ -28,3 +28,5 @@ do_install() {
     install -D -m 0644 ${S}/networkd-dispatcher.service ${D}/${systemd_sys=
tem_unitdir}/networkd-dispatcher.service
     install -D -m 0644 ${S}/networkd-dispatcher.conf ${D}/${sysconfdir}/co=
nf.d/networkd-dispatcher.conf
 }
+
+RDEPENDS:${PN} =3D "python3-dbus python3-json python3-pygobject"
--=20
2.34.1


