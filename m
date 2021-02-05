Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.66])
 by mx.groups.io with SMTP id smtpd.web09.2040.1612565838509638729
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 14:57:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Biyxvooz;
 spf=pass (domain: windriver.com, ip: 40.107.223.66, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmeVb4KwBv5MxetWGeVh62MdLmHR0u/UgZbuX7cEM4lOwmuhAHKdA4WKIlND1HvIKbUDoBASQ3XE4ZP7d37R9/fQQzkMUqHX8Nos9OYosHkBihEfRmjlXaz2DrV1wLXRmxtc4YqfVHi58xUoW2K0su/Rz0XeIAryx6zoVgoQG6CYBfJd3fxcTwBAepgwy9LDAQ0105ej1xWFRSUN+4UBHNJlrOxcuUObDpZggDEite68U2WFOS9t5Er64j3La57GoNToydgTYdo4EFUE4LmRCtDUQzTDCatatAcz0tA3sq7Jyc+pl10rmYU6mtXixD4vn6gkL/9pvQ1+cQyNk3hrAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMLCeK2Y32d8vOMa8+OYzQf2cI59Fl9UyCLhLE7sD9s=;
 b=nEe7VmI7+s0K/WP61JwJjAjtZ0xDdu4oTK9YZT6EeMrphti46fvH7fJrlbvMCd1svdPXpzkFENa+Ejzv9ai2lZDhOY6swlElFMpTm529FcmKCJSF3+Ws9I1ypTbCpak8M7a4rGyMWoAwzgwn7oHUg83/g8zYSN3/zyuPuzi/5dn303mn3mAMzfcdQ8HhcBjYrjVi8KSK+nHgBVE4UWJ4rSavN/Yu2NXzD1VgLMHjGtHFzUTldcHGa2+RG0jtpmFrtUI6wab/b40TMwQ/OZhw0rWL9XTu37IWdsftkT7m/wQFnBBXzsNZ+FeZ+BJudTXFSZDAoZHV+tAXHUH3EzYRGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMLCeK2Y32d8vOMa8+OYzQf2cI59Fl9UyCLhLE7sD9s=;
 b=BiyxvoozyfXpbvkAMYewYZJSRJebME3QCbWuwfJsdIZU7SUktO+0lowGyPg0CqyPQB/cH3zecmW7zaxwoXxTyRpqWim3d5Uzd8qmUdLnuonEiblxrWlnOKvUL9oAFSSRptyda2PvCvdlT4ix8NJY0m0FJQVJMjthxRPtMq4+JVM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2719.namprd11.prod.outlook.com (2603:10b6:805:59::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 5 Feb
 2021 22:57:16 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%7]) with mapi id 15.20.3805.027; Fri, 5 Feb 2021
 22:57:16 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-OE][PATCH] postgresql: bypass autoconf version check
Date: Fri,  5 Feb 2021 17:57:04 -0500
Message-ID: <20210205225704.17109-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BL1PR13CA0244.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::9) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by BL1PR13CA0244.namprd13.prod.outlook.com (2603:10b6:208:2ba::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.10 via Frontend Transport; Fri, 5 Feb 2021 22:57:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d55e9a17-ec78-492f-7438-08d8ca296216
X-MS-TrafficTypeDiagnostic: SN6PR11MB2719:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB271901339FF864674939E1F680B29@SN6PR11MB2719.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y53n92eWn0K1v4c1a1zbVZMDkDjzNGMhllwm5pM2dmATg3ZoSd6jkorD8kt3GzqLJvQ3yz8enQQxwcA6CpVuL0TKMqYPDjuURTXb+50zPxoeeEbyuJ5rUYtuDGX3hSfs3zQFOzLBUKwtVlTXMh3z8K7m5tYugjd+ZsfeRBHnu4hfGysjNhJsnwsjk96MuivbdzZbaWXws14k1SZpS0PjHMGIFHQE15N2U96UsNHGwhTjEag6J0qWbdo08vWJncL8KEQAwbTC9TWYOpqXsoi/dNmQyWRsbiw4maLeR4Nj8qlt+QV7ss6QZNduzz5i9+kHqvbr+bUWME/AoSWTj6fpicgX6JXFtxeF0mNDQ79e93hingpDKybwF4RQTWhUGLsCp9SY/e2zpDfFOe1I2pdwX3OleIYrdeRIy03BjGS3+Ky3LjpmJ8Ne5jJ7OAFJ9KlIQ2K/MoEVrMJHKT29OMlz6DLHwxCkgyMB9yW/A7vCfuKcbLs7a9Vs3qSas/C2b5lAdPGpb04YHbkY0MgSWHIbVrshnCRjNwUc9X+g0FSt66McO2Fq29dq204yKF6Cb0fFNJ4HDRG90ZVbDxVdnWzk60fxvr5tD4ED0xNQf7U0dus=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(366004)(376002)(66556008)(478600001)(66946007)(66476007)(2616005)(6512007)(2906002)(6506007)(5660300002)(8676002)(6916009)(36756003)(8936002)(52116002)(316002)(86362001)(83380400001)(1076003)(6486002)(6666004)(186003)(16526019)(956004)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?d2PSv2mlNSigx2oPsQlfjhL7Zyl2yrFZCTm5Un6LhpQH7XFUlHWrRa+FNB3F?=
 =?us-ascii?Q?wRPOazPCPFk2qRpqzB4+yvPZN727RCex3GMhQxg7NLPlm8J0d2Nf8WvSzv0k?=
 =?us-ascii?Q?9EUa1NebGXdDv3sbvtfdog1TAMujhStqwK3D65HA4Y/2Fx7lusgTZKbpRsZA?=
 =?us-ascii?Q?/d//tou9tPxXd5OVjS5TFvHYYQttWh1DlThBUVNuYsm4MqOtgZ0q9V6LV2uD?=
 =?us-ascii?Q?mOH7dJjpudx+55qNwyL0iFVZzcTO6g05MA3IXf6or38VADvhQwLR7K/KCcd0?=
 =?us-ascii?Q?T0KAQ/2/hvGhCAmwX/ZtV3UdOOLd7QEtIlhb+9Zy584jeiN+jhx9PhhF3WvJ?=
 =?us-ascii?Q?+FKpNGFxcLtRUsdDqSvJy6J8FXIFrNMbojhr4p+fE9fQUGczvFDSnyNhOr8C?=
 =?us-ascii?Q?MdexWme8MHgS+CYXXOZ1Uk2tmadzgx6ZEulAC9HrGbmN39xWYlfzRFJD06zb?=
 =?us-ascii?Q?EmfaN8xE8AYs2FfFk7dLJNaiaVHmyYzPNu8Fb8gWdqoecsl21eqgTWLIkkPG?=
 =?us-ascii?Q?3zFq4jZEGi8CG2+qLRjGqpS+sapty5B+QS9YmRr2lIMyB4szQNF1/wUP+26F?=
 =?us-ascii?Q?CT38/V8WUagZIKVYu7Qqm3Qs55G6n5WVLR8b6+CwSK4NYpr1lxkvyAalgwIv?=
 =?us-ascii?Q?zKmLwPpPMNM5Ta2+Lce8XMpgpG8zkeWZToX3jHyNGRd62EQOzGFmoRj59wRI?=
 =?us-ascii?Q?CsvTyb8wIcaxO/wIT13Uhc80F+pntfwHCxi++w5En3WhqufTXIxg3ScF04+e?=
 =?us-ascii?Q?Om6AR1TeRH0l3CoDlBkt3rb0RuD2HTFiNRFU/WVbluh4Re9YMK//XnRpic7N?=
 =?us-ascii?Q?CTYh223YXLygXTi7CBrNFznjtboprMpI+sWaVakaM80DkU74khdHxo/91jjS?=
 =?us-ascii?Q?IkPi3SA+BwDPMFzMOHjySeU9c/jxlpnMnumkYH/q6fxzM2xd6ZUTl5v5RqSJ?=
 =?us-ascii?Q?o9DKIC6AtfslyH7s9gtD9o5G91v54ps3oDLoqRlPWVf1Gr8vYcQI0ZWCei3R?=
 =?us-ascii?Q?2QUpNpeFevGcGPgbjzOWyU2P+7+AYtvPl4nCptR4nAOdFkdh0MIOiVYjdY/R?=
 =?us-ascii?Q?xdx8T2uoovsRkYpR3fRwpDLVkl2mfUrfGsSX2Pn7vu21yUmQ/1SDAgVEF+69?=
 =?us-ascii?Q?8wol/n06Cyoo/9pLwtPP5/kBAoMTlUxaSzYWDVXr5hnvmIqHI8Oasdb6+RlS?=
 =?us-ascii?Q?DJBlpUvIgJzI6GELBS5VfT43pjnNNwCVf1mGcHD+hffCJdXsI4+N0l3gR+eJ?=
 =?us-ascii?Q?V2JQ2zCuCX/SCT8f/Un6tMhMMpc0S1Nfn3baE+GrKrFVgrUgAqqw4GYISpf7?=
 =?us-ascii?Q?5haU4xaI5xNVpgE159fXYquT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d55e9a17-ec78-492f-7438-08d8ca296216
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 22:57:16.2357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AavbF3TkRLj4PwpyA7BeYb6PK7QYOQDPzYDrQfpppv5nvEEEfo8dfnXYvu5D5ShX0INaKSIutnGvt39adA7Pyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2719
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

allowing autoconf to be upgraded 2.69->2.71.

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...n-bypass-autoconf-2.69-version-check.patch | 32 +++++++++++++++++++
 .../recipes-dbs/postgresql/postgresql_13.1.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-configure.in-=
bypass-autoconf-2.69-version-check.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-=
autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/00=
01-configure.in-bypass-autoconf-2.69-version-check.patch
new file mode 100644
index 000000000..c54a886a2
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.in-bypass-autocon=
f-2.69-version-check.patch
@@ -0,0 +1,32 @@
+From 7177d8334a3c28ab0ec5c90e0656f43414929659 Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Fri, 5 Feb 2021 17:15:42 -0500
+Subject: [PATCH] configure.in: bypass autoconf 2.69 version check
+
+for upgrade to autoconf 2.71
+
+Upstream-Status: Inappropriate [disable feature]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ configure.in | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 8d4e9ac..75203c2 100644
+--- a/configure.in
++++ b/configure.in
+@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
+=20
+ AC_INIT([PostgreSQL], [13.1], [pgsql-bugs@lists.postgresql.org], [], [htt=
ps://www.postgresql.org/])
+=20
+-m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf vers=
ion 2.69 is required.
+-Untested combinations of 'autoconf' and PostgreSQL versions are not
+-recommended.  You can remove the check from 'configure.in' but it is then
+-your responsibility whether the result works or not.])])
+ AC_COPYRIGHT([Copyright (c) 1996-2020, PostgreSQL Global Development Grou=
p])
+ AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
+ AC_CONFIG_AUX_DIR(config)
+--=20
+2.29.2
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb b/meta-oe/re=
cipes-dbs/postgresql/postgresql_13.1.bb
index aeeddc647..f2a29a59d 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb
@@ -6,6 +6,7 @@ SRC_URI +=3D "\
    file://not-check-libperl.patch \
    file://0001-Add-support-for-RISC-V.patch \
    file://0001-Improve-reproducibility.patch \
+   file://0001-configure.in-bypass-autoconf-2.69-version-check.patch \
 "
=20
 SRC_URI[sha256sum] =3D "12345c83b89aa29808568977f5200d6da00f88a035517f9252=
93355432ffe61f"
--=20
2.29.2

