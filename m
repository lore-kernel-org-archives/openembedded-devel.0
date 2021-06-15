Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.43])
 by mx.groups.io with SMTP id smtpd.web10.11249.1623771684182195050
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jun 2021 08:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@de.bosch.com header.s=selector1 header.b=DqZsL2Yw;
 spf=pass (domain: de.bosch.com, ip: 40.107.20.43, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjGsJ72egIPZIIPI3vj8oMTmhGVEEgvAOJlvCzwJd1m3foegx1Psjl15Vzy6pfZtnhoYLApWei57xJHdHYVh8XreSaH7wVL7sVY64NMBdGqdZi+59QEuEvH50KccbBP86KeNsEI26lNSDH89EGzoKt1/qLg3JVhlaE0hSeS2AGzOcgrm4qFpQ7eaSPPStAuel23Btmp9ugaXxc5GKDh+UoDDfQfRPPmKXXoaChNYSb/eZ2DzFkkuS/ErkpqqRxG6hYXBEPdaqLVOzt/GCtjE0ez45VGuZ3GYKeGi20fSpoO4r8GJ2sAXuRsM2c6T2UV3JOFFnZPz4+nrXCvsoTLNjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFmBY8QlJztFQxJOX/zdFMsuIF7bfFIgoU/dIc4zD+A=;
 b=oAaLadoojdeXUQszKdk4xKSEAO2I1x1KqR/18v6QJxJeMQWS09B8qd+6nft/QKOujCR9YyxJK79La+du6cWgSaD/ICnWp4vDTdemJqAff4nvh29EzZ5ekWZqQtclzHFIN+H8mEJso9z3ZYp7Ju3PXfRBygnUWeXEl8H2dI1pYM/1G/2z4G+6jBUhz152uZda7kjOhWutCWCwbe1LU7hyM/Sq/u24n5gXwOs0PiNAYxYM91GyLysljUJKfWTQiJBcQKzET4UiIELEFjfye33FcjAol2HLtaYlAMA921OUiiwwGQgQAMybcdvv3ZWJxwamGxm64YrhB/g27FkdMjHnpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.199) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFmBY8QlJztFQxJOX/zdFMsuIF7bfFIgoU/dIc4zD+A=;
 b=DqZsL2YwzTk1v5bLzli+IVGsss0ZCHgpR2ZybTj+LEIx6Uz/WN378Vp454P3UwnNt7v8Ard0JiPCxR03kcC3Ysnj/wr5btdgxWpWBxQT1ULcqGIef6g5ba8qInqaBfj/ExSOmmXrQS2D5ZzBiGhJMb9wlcsFRN77DGY9nm1AHys=
Received: from AM7PR03CA0001.eurprd03.prod.outlook.com (2603:10a6:20b:130::11)
 by AM9PR10MB4339.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:26c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Tue, 15 Jun
 2021 15:41:22 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::a3) by AM7PR03CA0001.outlook.office365.com
 (2603:10a6:20b:130::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Tue, 15 Jun 2021 15:41:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.199)
 smtp.mailfrom=de.bosch.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.199 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.199; helo=eop.bosch-org.com;
Received: from eop.bosch-org.com (139.15.153.199) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 15:41:22 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.14; Tue, 15 Jun
 2021 17:41:09 +0200
Received: from SI-HUB2000.de.bosch.com (10.4.103.108) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.14; Tue, 15 Jun 2021 17:41:09 +0200
Received: from luchador.grb-fir.grb.de.bosch.com (10.19.187.97) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.2176.14; Tue, 15 Jun 2021 17:41:08 +0200
From: "Mark Jonas" <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
CC: <kevin.zhang3@cn.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-openwrt][PATCH 3/7] base-files: Do not use /etc/group from OpenWrt
Date: Tue, 15 Jun 2021 17:40:45 +0200
Message-ID: <20210615154049.173769-4-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615154049.173769-1-mark.jonas@de.bosch.com>
References: <20210615154049.173769-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Return-Path: Mark.Jonas@de.bosch.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b475610f-eb17-45b7-f1a0-08d9301406df
X-MS-TrafficTypeDiagnostic: AM9PR10MB4339:
X-Microsoft-Antispam-PRVS: 
	<AM9PR10MB433920E9851BC7D4E27A8DB6AD309@AM9PR10MB4339.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ss4seH0GtiwEtr8wjTb18UTDgzJXP9TjrGmSHiEN4VX503fe8U1vKymGw7TmcazD23fktwjK5AHRqGgJ3/wAlYfk58rNn0meyliyn4MRBV8PWqbHMILqywTVcsFFkc0XmBKyJaymR1302huavMh4+INB9EDWCQkfRM8YjoLTn07vorm1Ar6RSIk9ABLp1AXIIa0n0daqRCCKptKrlmdevhcUNzDyM6SA940hlKX08vlyvjkC9QfEU/TPP4uoRn8tjOaPn0xFQ7ktobrjEwGcgI16KzBiF4bKXVUYJaHht2GDNp0ixoWpbOsOvPxK/dUhlptpqPOkplBCf1kjtH8N1aNFkGvIT9YS10ffoWzyZQlg3BNsK8N1104eDOgujS/+aTYQ6QFu37cbQo0RbPgCNWxbi4AnGP0DJySGoJv82J2btjSILSTRJHCam/lIP0SPWhuJzkdgKPK6Nzhhg5WiGo7SNG2j4BYs14cCWG8CvnxJsK1yrzgpEMJxEskuFH86UZ8tVQoQuj9cifMmD6bfL2xFAcSZtyRoNIKlnFPqvxQLHfWQKG/hVfq/G7a5unJym3prBWU4aMd9mMgVRaUXxpTsbjHGjlKc7S2SxONDXEy8TWu5itncs+DBCMqXypDPKH+Erp/4Z2SGr4UHsEsRm04PrvhTTEv3oa9y8433/yyCFCObBhYd91EB7ngU4Ryy
X-Forefront-Antispam-Report: 
	CIP:139.15.153.199;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(107886003)(82310400003)(498600001)(8936002)(44832011)(47076005)(1076003)(8676002)(36860700001)(6666004)(26005)(7696005)(186003)(70206006)(2616005)(83380400001)(426003)(356005)(336012)(54906003)(4326008)(2906002)(5660300002)(81166007)(110136005)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 15:41:22.1465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b475610f-eb17-45b7-f1a0-08d9301406df
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.199];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4339
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Kevin Zhang <kevin.zhang3@cn.bosch.com>

If we build this recipe with 'Poky/glibc' instead of
'openembedded-core/musl', in 'rootfspostcommands.py' the function
'sort_passwd()' will fail because '/etc/group' and '/etc/gshadow' do
not match.

We delete '/etc/group', '/etc/passwd' and '/etc/shadow' from OpenWrt
and thus use those files created by DISTRO.

Signed-off-by: Kevin Zhang <kevin.zhang3@cn.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 recipes-tweaks/base-files/base-files_3.%.bbappend | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-tweaks/base-files/base-files_3.%.bbappend b/recipes-tw=
eaks/base-files/base-files_3.%.bbappend
index 15da306..4899e90 100644
--- a/recipes-tweaks/base-files/base-files_3.%.bbappend
+++ b/recipes-tweaks/base-files/base-files_3.%.bbappend
@@ -40,6 +40,10 @@ do_install_append () {
         mkdir -p ${STMP}
         cp -dR --preserve=3Dmode,links ${SG}/package/base-files/files/* ${=
STMP}/
=20
+        rm -f ${STMP}/etc/passwd
+        rm -f ${STMP}/etc/shadow
+        rm -f ${STMP}/etc/group
+
         # procd - earlyinit
         rm -f ${STMP}/etc/inittab
         rm -f ${STMP}/etc/preinit
@@ -134,7 +138,7 @@ do_install_append () {
             ln -sf /proc/mounts ${D}${sysconfdir}/mtab
         fi
=20
-        chmod 0600 ${D}${sysconfdir}/shadow
+        # chmod 0600 ${D}${sysconfdir}/shadow
         chmod 1777 ${D}/tmp
=20
         sed -i "s#%PATH%#/usr/sbin:/sbin:/usr/bin:/bin#g" \
--=20
2.25.1

