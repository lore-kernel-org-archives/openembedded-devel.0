Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B53EE49AB
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 23:46:43 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.53])
 by mx.groups.io with SMTP id smtpd.web11.5750.1692733347898128328
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Aug 2023 12:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=wZ71IIBV;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.243.53, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQnKhxM37qYH3QziuEjkJmJsX0QTXKL31Xf3S3xQdm3UUCvpqZEbUdByIDgVov4Jccn/L+L8w0uJbqyzVoEotPvJce5r+4fIr4JR+lsGhkNlGUdefK5vQXl/PIGlSiVTO/glyBNOfIks29dR8MWtaXTC8TWHd71R9usFzIiqLhK92Rz//cUydcbBUdjJZ4TdZxUyEsKhcxACoGKvLqHZ8WrFrD1lVD3GbTw4GuDsBdz9OzAmVwAbCsV4sJ+pQuQ+xNV4r5HWQB7rYGthUm3Yeik3gyuZE/8wuZWD1siQ73924D0F8GUT6ysNOlyQVz5LXdRQMrKgM2j9j3e6Q8UQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+l/OJ53QvFTa7DUPa7oV97otGR2PCvXt91foyDuhYk=;
 b=elWEPDMlId9hyrEIEiCP4v3cQ3ijLdBCytV/fJrwF0s1xbM7mZG9ZI7+28V0j9WTMQbXC6oLLhJh0Y2DFMLgnpcag0nU2UT3UKhqN6QRNztLyx2Ntn0etCgkn5ux5PVwUK9eaIMButg2NlrcYNxOSP+4YP8VC8ttTFYjxchVXiHDq/P0cMF6o+XXE2JCiTRIZyk2QH5NQ4hWD41IK0ooNqq3HhuM+iwoZ3hTl+aK9a2Uv1P/ngXjK0+dqMVzELMtQ4+r7jRWzye5HYuJOOjiHHaWJEv2zIGB5F+bHqFkNBWxjA/9S3gzgsIRrXkymMx3DAXNdEMuIAxWKP+Bv5bwdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+l/OJ53QvFTa7DUPa7oV97otGR2PCvXt91foyDuhYk=;
 b=wZ71IIBVZD67R//y7ft//QRrRbCw8IuLwglghJAMDD7e5hMapqlD5sfXdbGlRN7Bxa0BXBvDWNxhfsGEPFBCfPTFhGThRlyPMqEVXVqi7KiWHEMs9deXZggi5IlIpifI1n4M0QvYAHrk2t/gRGm3KFvDVHVEjqcMuavHmV4+Fcw=
Received: from CY5PR16CA0015.namprd16.prod.outlook.com (2603:10b6:930:10::28)
 by PH8PR12MB8430.namprd12.prod.outlook.com (2603:10b6:510:259::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 22 Aug
 2023 19:42:25 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:10:cafe::7c) by CY5PR16CA0015.outlook.office365.com
 (2603:10b6:930:10::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 19:42:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 19:42:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 22 Aug
 2023 14:42:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 22 Aug
 2023 14:42:16 -0500
Received: from xcolc230100.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 22 Aug 2023 14:42:15 -0500
From: "Mark Hatle" <mark.hatle@amd.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] kconfig-frontends: Avoid using hard coded /usr/include paths
Date: Tue, 22 Aug 2023 13:42:15 -0600
Message-ID: <20230822194215.517592-1-mark.hatle@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|PH8PR12MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a514cae-620a-425b-c650-08dba347e90b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kvAvrCm+u+3VMPnE3/8ppojxSmZRAaFdqsfZ9Ug5xgn0jOl6I3tmJTc+CmEYgJY4SRbz2if9Jldn3r10BSz0xQJW9wSBTLoiTi6XZ5Wwx+7Ikaj4ILxEcNnkjJOCQch56acb4DfNvHW5TTLu+Teu2WsEhX0AEE9NVOhcYYyDM5w8Mqwp/HWiSXx+KQpn8ov6zFIIrfLce4N1CWGa9YYTbMvsRXOyV/c5QgRTKoH7xIn7fA72E4EZVHNzAUjgcRsLQ7+oIIWQ8hal7bBXKv7pemdxqar6BqS0zE8dzMsm0CuLFABCTr3Edx+XsMcJF6dJk5eypwTXKJWXWG3fQBpzyRHHi7RCCtsvu2oUoNWIO1ha1/W1Z5EIljQ/Q28/7vHmqwRf/iSJUZwG8nnfYOdAL8a2ekdQxXxauzJWFzdYJhoJ4+hNOOcFALuzl5I/hKKFdwWr+Iy5DKNC7kHtMMUqX9yKghczGD4yP7kfTEa2FA9PdvxI8cwtn3kLOq0tbvXenelYsASgviOgZtzzuZWoOMvHLng7iObJoP0u6QFUN4jW+s+IeRMvbGQ+gDpTSl1HjKNm8r1hdmlXM/jkJtJ+KouH5+rpgD7zXTLWTo6Ebmo7d0UBwJq/Pcs3Nnw3xz//N8CQgoZfTS5CplVkuilmRxZanBVSungokrTSHADrIFC0vw5L92hiOEKLYZSvHEnNbMv9WNBgPN27Y46o3Qhr56pXlILJ1bArVK4QwwHWWQuOjTeo+97I2OVLAUJ/fZuqvqCC5khSoJgak+aSdL4XiQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(1800799009)(186009)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(36756003)(86362001)(40480700001)(81166007)(40460700003)(356005)(316002)(70206006)(478600001)(70586007)(6916009)(41300700001)(82740400003)(47076005)(26005)(1076003)(426003)(336012)(2616005)(5660300002)(44832011)(2906002)(8936002)(36860700001)(8676002)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 19:42:24.9831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a514cae-620a-425b-c650-08dba347e90b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8430
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 23:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104523

The system could end up using an include path that points to the host
system instead of the sysroot.  Force the system to use the sysroot.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 ...d-using-hard-coded-usr-include-paths.patch | 33 +++++++++++++++++++
 .../kconfig-frontends_4.11.0.1.bb             |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/kconfig-frontends/files/0001-A=
void-using-hard-coded-usr-include-paths.patch

diff --git a/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Avoid-us=
ing-hard-coded-usr-include-paths.patch b/meta-oe/recipes-devtools/kconfig-f=
rontends/files/0001-Avoid-using-hard-coded-usr-include-paths.patch
new file mode 100644
index 000000000..ac20e9b88
--- /dev/null
+++ b/meta-oe/recipes-devtools/kconfig-frontends/files/0001-Avoid-using-har=
d-coded-usr-include-paths.patch
@@ -0,0 +1,33 @@
+From 2bd01e844096ab4ecaaab8eccfbfdc721a136d01 Mon Sep 17 00:00:00 2001
+From: Mark Hatle <mark.hatle@amd.com>
+Date: Tue, 22 Aug 2023 12:28:01 -0600
+Subject: [PATCH] Avoid using hard coded /usr/include paths
+
+The system could end up using an include path that points to the host
+system instead of the sysroot.  Force the system to use the sysroot.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+---
+ configure.ac | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 150bc50..4dc684f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -344,10 +344,6 @@ AS_IF(
+     [test "$need_panel_menu" =3D "yes" -o "$need_panel_menu" =3D "auto"],
+     [AC_SUBST([ncurses_nconf_CPPFLAGS])
+      AC_SUBST([ncurses_panel_menu_LIBS])
+-     AS_CASE(
+-        [$CURSES_LOC],
+-        [ncursesw/*],[ncurses_nconf_CPPFLAGS=3D"-I/usr/include/ncursesw"]=
,
+-        [ncurses/*],[ncurses_nconf_CPPFLAGS=3D"-I/usr/include/ncurses"])
+      LIBS_old=3D"$LIBS"
+      LIBS=3D
+      AC_SEARCH_LIBS(
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4=
.11.0.1.bb b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4=
.11.0.1.bb
index 169500f6b..b894f0ba0 100644
--- a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1=
.bb
+++ b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1=
.bb
@@ -15,7 +15,8 @@ DEPENDS +=3D "ncurses flex-native gperf-native bison-nati=
ve"
 RDEPENDS:${PN} +=3D "python3 bash"
 SRC_URI =3D "git://gitlab.com/ymorin/kconfig-frontends.git;protocol=3Dhttp=
s;branch=3D4.11.x \
 	   file://0001-Makefile-ensure-frontends-exits-before-writing-into-.patch=
 \
-           file://0001-Switch-utils-kconfig-diff-to-use-Python-3.patch"
+           file://0001-Switch-utils-kconfig-diff-to-use-Python-3.patch \
+           file://0001-Avoid-using-hard-coded-usr-include-paths.patch"
=20
 SRCREV =3D "f22fce3a308be1c7790ebefc6bbedb33c5f7c86a"
=20
--=20
2.34.1


