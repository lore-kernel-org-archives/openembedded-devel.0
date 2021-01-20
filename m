Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.64])
 by mx.groups.io with SMTP id smtpd.web12.30392.1611159773107456045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 08:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=ucBhl+xN;
 spf=pass (domain: spinetix.com, ip: 40.107.20.64, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/zLacuCU2pDf+aieyXnQ/dj+LREBtOS2sywSbx5PUt7QOumDMw/S9vdHqfhFIjWMzoWd8F+Nr33o4TYmEfDTmVQ6rMMq0s4x2RaSMikxNcK6LFu6svDlOEa828nteuB8JmnOVwbfqxG0OR5b/iAOwy9GHdEioxzG3vPTFZt2tNTNYvcRZoVQ62LomYvVL71nnZQjQWzZRpAp711UO/8nLSy2tA+E3aXdypnkMmKG27D97E5xMWNj6CzKkkpB01wRipnfib/LP9CASpcjsO5w+c/LBYsmObxGCaXQk8L2u09d5yV9GkH8kOKtGVwX7TNVJ9E6s1pXIJlZHJ8lbGoaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xXrdp0q2N/xifNnAYHSqyIBF4Jmw7BWOEK3rlsqJ4o=;
 b=ll75HzvlxkgajH2PH1ocPPc4HDwZh9DgSXpfzt5SeKMDg3GT7AiJEQ5EC1fvBFYFKLCromI+oqCRGyYeFlJhYljeyopo69b+F/uVQhLN3vk6RRzUC/Ep1gzwkZzeWsYS2dAKSQ3iw8tKe7JmVJru4AlJ9f6KyuIz5xvINYYjPsJ6+yT9R4h0zugl7kFApSrOb+TU/KQiF/ieTbBULE9Pzzj1+nFVPf3sb1MXnr3UCfPYzVXP02FGR8Id9fE2fjJiiDL5UK9yRlwBYdQdLnTE1/G1y/IcNOAFZqZOV2EcISiZAy7mVt26NTK1ug2z1NxX/jlCsJTItBylkCbZvRCK1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xXrdp0q2N/xifNnAYHSqyIBF4Jmw7BWOEK3rlsqJ4o=;
 b=ucBhl+xNPAewiRn5MOFWh2PGjPT3dWQN6ywb83IVfhsr90KZCAlf17X8TBLQ3AwNI/4B/b+znDjRYMqmAZXeNn3BjZp6dL56wKyM9qd3IfRmmTkMOeFSAsn+mThzYEtCNEO+hE2F8LmVOR8R/+1fCtaTCtgGXjUy/3GZmrmn3Q8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DBBPR01MB7562.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1f3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 20 Jan
 2021 16:22:50 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8%5]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 16:22:49 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [meta-networking][PATCH] net-snmp: control smux via PACKAGECONFIG
Date: Wed, 20 Jan 2021 17:22:27 +0100
Message-Id: <20210120162227.8041-1-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: GV0P278CA0070.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:2a::21) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by GV0P278CA0070.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2a::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Wed, 20 Jan 2021 16:22:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccc05b66-b753-4832-63dc-08d8bd5fa12d
X-MS-TrafficTypeDiagnostic: DBBPR01MB7562:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR01MB756210217122FE522047325F88A20@DBBPR01MB7562.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lQrSmeFyrlowxyttsBtbwy8qQ6zgn/fiaZHGEaIzX1gGVIh91B38gVQTA2qcy/DGqE+QLNi22RRMq5Iw7OWCw4K44JQt2Rs/BOGUfgjtv3jJ+I3UmlOFxb610DzPD8c69rmNFHipfUcmU0tXfXEU5rYxUdhJomR72fjOb6Cw71WRDwwKDmyBtMWNTQmsqI0/Ep+KknqQofsE+GTVEpj4q8Nrq/i4XVSYqRImlwjZeQ9Ki4gmr5PwFIgWHjuo/8x6UHXwKmwZjM6Kw86V7aKnuNmUEpbjMcu7DsN0i46fidM7bdTtMdqbFpF3dOWLLw/RJtUwQshYGPMe9my7UN9SVa7Ug3HVdWn0Gpa+uYqZaTVNRVs/TIyycsNtBqbNubMVzxhd4W96YmShoiwwn/77Hw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39830400003)(346002)(376002)(8676002)(6916009)(6666004)(2906002)(86362001)(6486002)(16526019)(26005)(956004)(52116002)(6512007)(1076003)(478600001)(66946007)(8936002)(4326008)(66476007)(83380400001)(107886003)(36756003)(186003)(5660300002)(2616005)(66556008)(6506007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?JcOL/hB//8KQ5Kbvvs1EyAqKNTZS8t9DlYBeH6LXe+Ehtd5GmZjdxJlQW8eb?=
 =?us-ascii?Q?GsxkNIWQXiEhzEtR2av5TYJWNA0d1+j9vmyc48KMXxcCUUN4vV0PDFXjpF2K?=
 =?us-ascii?Q?FlvUWMHYGO2iJq4r4d2hz+mhVsP3GBmRgPJ9VeIqe0e7ljjTyJtDfPfLXfN4?=
 =?us-ascii?Q?w4cvLxvJaiTKdAhZnkzPHAB/6v/XIXt8OiOZtVUOhgQ1oUb2S6nAF8tHSrQv?=
 =?us-ascii?Q?VjRJbynJPGK1mVfBKPTGYXNwGUbUtXjvNCf2mh5wugJywpem8Y1mO/olakv7?=
 =?us-ascii?Q?wFOW5Jx+s+KPdwJkrEH+aadveuWFy8zBZuXkfqnqAdkz7EGzuQmhXQ3/7e8A?=
 =?us-ascii?Q?LRnmDRI554HtGuyaZv4cwcDZLuw1QWXvDadaQGhZe/yV8RlRhdHpw2adkt1v?=
 =?us-ascii?Q?hNSvQ6ziv1H7ci++4OnpmL6pN2cmga5WkAEzUuDzeDPVXW2zlZqI/5U/9amK?=
 =?us-ascii?Q?2qPsT+xrhZYAeBr2ReM9uNiNQUgpZQ4n0wqKKcFtEreMFzQ/4OkMM0wHIjMG?=
 =?us-ascii?Q?VccKjAzh+BIgWGMBCdwPKIbP6yS6lR5apvusjW/U22mOp29o8578welwn37v?=
 =?us-ascii?Q?crMcw9g5Dxxxp/KkhLOXxYxfn0q6IiY/+jjYDacF1U+6JC16p3T8fskV4twE?=
 =?us-ascii?Q?5JsWKgmqtGVPHF78pfsdVjI8RV+sau0wWPDPYslg6I9fShoxF/XCbSXOIgrn?=
 =?us-ascii?Q?rfHqb/gh+W+5gocN3WY4gRUCCmv7TlaEoPtDMQv7+2xO+Iues1xMeN+9jGap?=
 =?us-ascii?Q?PE4A94gRdiH7eSlleeIIp03cmCbWrcIXBy8iuDbjEBajW84OK2VklTWnc6+6?=
 =?us-ascii?Q?42FskA40+m1bmwOUYmpF0CL693fbSFrzYuoRReJ8lSHf9nihrC4L47tqQ7CN?=
 =?us-ascii?Q?R2xo4pCWaVB6iCbq9hUQPxCFEud77QRivZF0JaX7CJ7yy++UxTtkDIkavzj0?=
 =?us-ascii?Q?lvyXg9CJcBmasjZb42/PVIaDorQPuAuDKAJqmnccr2KWnB2S/t8eKEGEB+b9?=
 =?us-ascii?Q?WTDT?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc05b66-b753-4832-63dc-08d8bd5fa12d
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 16:22:49.8163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqMAQAd6Mo2BmQfA/SbUUOGmlROKZD1VPayXIl7kIBUgNIRjloMT2FjDm6089/OAelbdGMSUr5d4jDL+R7jAEQ3dFEaM7AFckzpSkqwS5bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR01MB7562
Content-Type: text/plain

Support for smux is always enabled by the recipe, but it can be a
security risk since it makes the snmpd daemon listen on TCP port 199.

This makes it contrallable via PACKAGECONFIG, so that it can be easily
disabled from the distro or local config. The mechanism makes it easy
to add control for other MIB modules via PACKAGECONFIG later if need
be.

For compatibility smux is added to the default PACKAGECONFIG, so there
is no change in the default build configuration.

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 .../recipes-protocols/net-snmp/net-snmp_5.9.bb            | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
index 5df1f9340..bee83c4d1 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
@@ -40,7 +40,7 @@ CCACHE = ""
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} des"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} des smux"
 PACKAGECONFIG[elfutils] = "--with-elf, --without-elf, elfutils"
 PACKAGECONFIG[libnl] = "--with-nl, --without-nl, libnl"
 
@@ -49,6 +49,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
 PACKAGECONFIG[perl] = "--enable-embedded-perl --with-perl-modules=yes, --disable-embedded-perl --with-perl-modules=no,\
                        perl,"
 PACKAGECONFIG[des] = "--enable-des,--disable-des"
+PACKAGECONFIG[smux] = ""
 
 EXTRA_OECONF = "--enable-shared \
                 --disable-manuals \
@@ -57,10 +58,11 @@ EXTRA_OECONF = "--enable-shared \
                 --with-persistent-directory=${localstatedir}/lib/net-snmp \
                 ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)} \
                 --with-openssl=${STAGING_EXECPREFIXDIR} \
+                --with-mib-modules='${MIB_MODULES}' \
 "
 
-# net-snmp needs to have mib-modules=smux enabled to enable quagga to support snmp
-EXTRA_OECONF += "--with-mib-modules=smux"
+MIB_MODULES = ""
+MIB_MODULES_append = " ${@bb.utils.filter('PACKAGECONFIG', 'smux', d)}"
 
 CACHED_CONFIGUREVARS = " \
     ac_cv_header_valgrind_valgrind_h=no \
-- 
2.18.4

