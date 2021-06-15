Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.65])
 by mx.groups.io with SMTP id smtpd.web11.11343.1623771684372071641
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jun 2021 08:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@de.bosch.com header.s=selector1 header.b=gEi0gcUm;
 spf=pass (domain: de.bosch.com, ip: 40.107.21.65, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsHngRF3/LKhB9/w1Ua/ndFSqZxy4xXqbjJlFIDXOv1E6Ei+hV69SD63IkCq8NSI/+keY/q7qWkkZJWGGIMj4i0T8C+4GJxtF+Us4r1gQ9VSJslS+L8D+wRKt//wdJaIhlMCNqOOCOBVg3CpCv2sKe/8WnmAI/JrZ+9vkFhkhS6QlsLKZ4uRV0YEn7QRLzplLoQYl1XNFaTZJUjizg5otaT+lm2ffK/TXekiNoENWVP6YsY9hx3ES+xCPhze/ZvnLwNI9EU02Bd/dEwkg++CqxsynNs8Y7u7GatbXaGhlY0foIUr6WwZO1a94p0lxN5EUv5h6DUaGpTZseSMzR7ZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BbRgAIDMVQfu5ONVnKoBLtBnTmAmv9wY/Tq9I8Q++g=;
 b=bUM7ldc5BGImRJ+9evEJrlPLvMY8wh0uBGHOy+7Cn1za4A+vp7XU/dP31R4WPsswml4ClBDRgh/eSX4Elqewp+7fcdyQqPMNK16z8mqpBZu90bCAJnv1inz8YB3nk1SptvAM9UB8v2X3l+LQAI8E3w9Ehni1c37qJlgFBamkznWqnDhDLOyd6rKj0KBqt1dwSWwcxzREihkyLtSoDtz0Rt4D99JZMoYL3opRHk1QrGvSdwXLoHIk6MaRDSAFq0Cx1nNePr0jJE/7YiUj0U+i+qK2yksi0rY3RTkBqloX30Ca42ZvjUuSJCGTcmWN+JAM7MuZjiQJ5uBiYdbRKCWreQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.199) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BbRgAIDMVQfu5ONVnKoBLtBnTmAmv9wY/Tq9I8Q++g=;
 b=gEi0gcUm6/NFX4Lzl2OvZj76cjFdv3FoEhKQsjRpA0qA8icXkGsG9LLcdL5yJZH4Fz8/38cgxX15xUU2A54yhlM34gpACTaLlc3+Bn7i4k0E9Lr/CfYBSGO0VuU0DxzZlp36/sfWLyovRaZ+jud9XRdscf8HHiW9A42ABB/2jGg=
Received: from AM6PR10CA0061.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::38)
 by AM9PR10MB4887.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:41c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 15:41:22 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::92) by AM6PR10CA0061.outlook.office365.com
 (2603:10a6:209:80::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Tue, 15 Jun 2021 15:41:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.199)
 smtp.mailfrom=de.bosch.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.199 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.199; helo=eop.bosch-org.com;
Received: from eop.bosch-org.com (139.15.153.199) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 15:41:21 +0000
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
Subject: [meta-openwrt][PATCH 4/7] base-files: Create /run/lock directory
Date: Tue, 15 Jun 2021 17:40:46 +0200
Message-ID: <20210615154049.173769-5-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615154049.173769-1-mark.jonas@de.bosch.com>
References: <20210615154049.173769-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Return-Path: Mark.Jonas@de.bosch.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32393962-1d1c-4401-78ad-08d9301406ac
X-MS-TrafficTypeDiagnostic: AM9PR10MB4887:
X-Microsoft-Antispam-PRVS: 
	<AM9PR10MB48875455980228E3D8682DAEAD309@AM9PR10MB4887.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BPrPgrPK/PlTfZG6FS7ZkX0wM2NM3eH89/VmEYI2gsmLwoaEaj6lBb0ZfB5EtNnZzGH/vHQUJmZgZXV8kCoP0I09dsvD3npjYOsaajEmvgVeTX5gyO8urcKP8iLEdcZZrXgxcoCBz4iIasWYfiY5VWzrM3UhtVUcUc8pZhnIdGbrs7Lq51Zq/1tZaqd5bPCwmoHRvlB6JSf4hOuMqXSVwNINV78zEaN7QG5Zq7U3bIkvszF43T+usAs4J3CFx7wnpvoH9JP63qYmhT3q1Bp0At7xhVOHp17w4r0sCY8fwZA43eET8V2RgsZ5Tkx6EGdnekRAarziYEDB699WuJHAzpnrnz1vb1drAyEAXBot9wQsvslE1XtJczdKQgUmUA8yYm1mCh9opQ2P3MB/wSUwFgBROS9xG4Ay60f40Bv//qlwKKUOXpkJHq5FMLaaCdRmaN3+bu55cvVgvyVg7rdPgsmFY3A/kVh1+GPN8bAXLEmdpJwFfEwazlP9t18ZIjfkFpgJJpHW+MBIwx0gErES+EbIZ0Eb1tUWilaNzbVfOjJEApwOnzF8mnMziWYLk9hJcyaxcbH5UFvenivDVadHPKckXov2ESckyzNxMM/w3h8xVYRk8h8TcINmvfRduS2vmz7RUX2BhXw52kiBacafkEHEx891FGyeghjVzxLloo2Wn+z/445JMSVEuTYGzvJr
X-Forefront-Antispam-Report: 
	CIP:139.15.153.199;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(356005)(336012)(498600001)(47076005)(4326008)(86362001)(54906003)(2906002)(110136005)(426003)(83380400001)(81166007)(7696005)(26005)(8676002)(5660300002)(70206006)(70586007)(1076003)(36860700001)(107886003)(44832011)(6666004)(186003)(82310400003)(2616005)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 15:41:21.8051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32393962-1d1c-4401-78ad-08d9301406ac
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.199];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4887
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Kevin Zhang <kevin.zhang3@cn.bosch.com>

When starting an image openwrt-image-full, the services (e.g. netifd)
are not started because the '/run/lock' directory does not exist.

This patch creates directory '/run/lock' in the rootfs.

We are not sure if this is the right solution. We observed that the
'/etc/fstab' contains a line to mount '/run' in tempfs. But this does
not happen. Which mechanism would normally create '/run/lock' at
startup?

Signed-off-by: Kevin Zhang <kevin.zhang3@cn.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 recipes-tweaks/base-files/base-files_3.%.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-tweaks/base-files/base-files_3.%.bbappend b/recipes-tw=
eaks/base-files/base-files_3.%.bbappend
index 4899e90..d457f28 100644
--- a/recipes-tweaks/base-files/base-files_3.%.bbappend
+++ b/recipes-tweaks/base-files/base-files_3.%.bbappend
@@ -131,6 +131,8 @@ do_install_append () {
         # FIXME: Should this change for OE?
         mkdir -p ${D}/overlay
=20
+        mkdir -p ${D}/run/lock
+
         # Avoid flash writes
         ln -sf /tmp/resolv.conf /tmp/TZ ${D}${sysconfdir}/
         if [ "${@bb.utils.contains('PACKAGECONFIG', 'oeoveropenwrt', 'true=
', 'false', d)}" !=3D "true" ]; then
--=20
2.25.1

