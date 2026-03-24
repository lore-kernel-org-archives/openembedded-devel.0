Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1401F54ACE
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 15:15:58 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22237.1774365350863049821
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 08:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=bDe72AQk;
 spf=pass (domain: de.bosch.com, ip: 40.107.130.54, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qr8QUqMf1jrUjcNz3j/3u8Hh5B9+r8s5YRzSSTJQAoRcgD7ccac7TPKEPq8BdW9Qe5YscA1kRQ+GsuT0qIG8QdufWYMuatU7Uqov8OQOL/Ym0SgQbTMdM/ZYfutAUft1Sty9k5k22YxfpUw9kjvSrqDhI4jazpTJ9D9TfSe6utA9PQof4DFB54OVDI+8LzTHDrd+YIZNTlEGL62vyiOwJBU3oeWQZIWoQMGFITTaG+3wZ3/TU7vDUPg+rendKmM63hXjgCnb/jlBsq1IIEdNdGRXXiOtoaRB+MWoJFRTiIIwVWctlrUYyD6C9nInGyvD3Z/jKqLvBrfcrUOsIlPFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+JFErJmRRocsUIjRDU7iYrVnNMbKYkC+l+fiNkWJl8=;
 b=ypxvR5NX+K0DnjSLDNNG/u0CVyb1fYn0FZTSrkUlf/p3HFWp4Xs+uedWfpPMSgkgvd2MGNyHBEbIHQoaiTl5S6fU1xt81vNsdYnq13JHs4dtoYuTXyrU1XKEmd4294rpn029dZu5XPwCuch19M+GfC2MYNkRXdBjGBXzmHIRmC3bLbCPrxR32ooD48XbwehUyIqAKAftIJkN+/hPWTtA8GGgUu26iSUBVwyFWBR2ldGRh7+qV+fHAiMtj0zK/Lms/zuabkX8moJVcNXL7HactcvjqtcyWu5vN8/uFwbrHnT/c2ZR4vYCT2/BwZOCMoGAVK89dNDumhuZNJiHDI2D2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+JFErJmRRocsUIjRDU7iYrVnNMbKYkC+l+fiNkWJl8=;
 b=bDe72AQkljuGqX5+qAGvuEe+JvhOBf3TiVNpR+ZS8+zjx5+RgPbovExiDx1O0U7pr9iu+x5hD2duULwRauN92K70Fz1sKH0ED8lJOt5uYUEYaAtg/RW2KheRp7CxSoACtimzUOvx9rTG7H7J/EDmRZi1sfyshAoM8baclacdFGCgDVqSwHFivBt+fr2U09JVwf2jpkg+03xsL2QFoQd+ox83j0Pou9BdFfYRtcGGAYhnfhf+DPKWZlAvUvAowPLfgilZWgfloGs+RRO1QPjJqW6n31axE6ogD0V+2ur+OzlNewrA+x+EIdngwK8oauong4jrxpxkhsIBqvveZzN/cQ==
Received: from AM0PR10CA0057.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::37)
 by DU0PR10MB5993.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 15:15:46 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::d4) by AM0PR10CA0057.outlook.office365.com
 (2603:10a6:20b:150::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 15:15:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 15:15:45 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 24 Mar
 2026 16:15:45 +0100
Received: from GRB-C-0009M.ot.de.bosch.com (10.142.116.186) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 16:15:45 +0100
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>, Ricardo Simoes
	<ricardo.simoes@pt.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH] libgpiod-1: Inherit python3targetconfig
Date: Tue, 24 Mar 2026 16:15:08 +0100
Message-ID: <20260324151508.2702-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.142.116.186]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000042:EE_|DU0PR10MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: db12cb56-d73c-44b3-8522-08de89b83910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	MgcpwfAbwxXx0Bq/fS2s0Lfr+cfW/KBK3EA3y4VQ/gBUttaKXF/SItm+a+OXvYPP9o7GJUxid34sLZzNrQKLOdkHJJPZmrNBqb2RPGkwa4ytLRgssJ79s5E9wGu+8ys3poksWKSqdxUEoFESeooGxub5+0Gf/Fss86hNDuYmvYjglge3v2NhqMzO1vlUvQ/FAl1Im6/OxCtKDPfUBcfYqVjeeKS9dywEOzVQyisjYD+wy8XieO041hPXxN5oa/kc6MHI0sJRWGM6q7uZOetpDAABWuGHHRvNzNrO13u1QXNWRC12oo6lp1J7j3vCQvjODu2VeFOStqDEidhv5udig8WxxneZZEdqhYdSYdr/BYov8ZsOiwFEEK0NGFqdWYr+pN/zhGz+82cPbTpiMNm28N1IyTRoojSNtsXQTPkf2V0p48qbBuZJc4lFxOHerpV6tHpyKjFXeQXRl7p9deIACVjPaGaD2c9dFbbKg96d9/jJwUHlLxdvKadORxMNzgU03eleSmyZMh9pZz2cBU/m1hpuGeTZuQ6Ve6EAiof7joURt3xt7o5dI0R36sdeKAbGyrd/HLrBj3Asyh2Lop17gcnIr2ermMjPb7SZ3xcjjO8loB7W2k826y/U5J7bGBqlMSXfy6Hz7Fs+zunisc8rxVH2O3w/I0xqBoWD66Ru2G90v51VT5LdqStdn1nwLKPqY7o/AMQKaBnsaMfuVbUVM7lyq/SAFjzzHARcLjSIAX/APPo3KkwDK+r/+J0XrgKctXTdNDa9xGNp2EFGHhl+8w==
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YwqEA+9LQPnUkkO8yCvFN54Duf3BHvcC8BCmLIWAXORLIWiG4nhRYcVj7Lr378T34Xwl4xKQS7wQMJEq9is6vEJ+eSQ5eCNBzx1Rr+0k/bSSYl5yB4aDQUFC9lMmjVZOdceW4FZsLd6umj7YWzGOqdW8G8D3sAl5/GzKy152e1IfiGTnD6uVSwRNaY7ijvIkj30MfIcLo9Uo98wod2v9YEo/YQFg/+drzIzJZMm2nq/sTVCe29aoeosVJXS6TKVuuyGEfXq4qbmh6jzwYlTzFnkCyzxRE8An65z3zqGOA10iCaP6qLr3IASyByRNT+vIvURdEE7FZECiOXmvM76yh1qRgXSeEEkmGmAnPyOemu0PQPK8DdVzPnx/ILlMdzqCmurtwHY9ULqerDDCLCHfrwTimC3asgcnH4jN8bGd0EAbEZdZAWezJ2WaCVLvllSc
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 15:15:45.6792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db12cb56-d73c-44b3-8522-08de89b83910
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5993
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 15:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125576

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

Inherit python3targetconfig so that cross python3-config is used instead
of native.

This fixes the below error when building on a 64 bit host for a 32 bit
target:

| In file included from /workspaces/yocto/build/tmp/work/core2-32-poky-linu=
x/libgpiod/1.6.5/recipe-sysroot-native/usr/include/python3.14/Python.h:72,
|                  from ../../../sources/libgpiod-1.6.5/bindings/python/gpi=
odmodule.c:8:
| /workspaces/yocto/build/tmp/work/core2-32-poky-linux/libgpiod/1.6.5/recip=
e-sysroot-native/usr/include/python3.14/pyport.h:429:2: error: #error "LONG=
_BIT definition appears wrong for platform (bad gcc/glibc config?)."
|   429 | #error "LONG_BIT definition appears wrong for platform (bad gcc/g=
libc config?)."
|       |  ^~~~~

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_1.6.5.bb
index 009cf9897a..583648a6a3 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.5.bb
@@ -10,6 +10,7 @@ SRC_URI[sha256sum] =3D "ae280f697bf035a1fb780c9972e5c81d0=
d2712b7ab6124fb3fba24619d
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}-1.x:"
=20
 inherit python3native
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3tar=
getconfig', '', d)}
=20
 PACKAGECONFIG[tests] =3D "--enable-tests,--disable-tests,kmod udev glib-2.=
0 catch2"
 PACKAGECONFIG[python3] =3D "--enable-bindings-python,--disable-bindings-py=
thon,python3"
--=20
2.34.1


