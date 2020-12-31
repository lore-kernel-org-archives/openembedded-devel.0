Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.18857.1609405423451370047
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Dec 2020 01:03:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=n/LUnuTR;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lzs9RcHw7s9LJWBMM1LZG3M4x7k5GMorW7pio7h0YtvIoySSroRILFZ5w6a66w670RilrF12nlepqOsU++Zht6eiGwnWXzUxzm3EXK2aXkeKBbT8Af7gG/u82SxkAOGrPXoybxN3iRiPSAor54/yspq0nMYvYL985Xkq1ia3iu0BEplTvKXNxzd34EKH6fBRIcu0DLKhLREDcaclhxQqv1gUD1HXKk16g1lHcNv85hLkNTYsAqq2h2V5AV+MGt6NY75ZwxX48TYFXklKcjpisa2tgVPxDZKaUcBOhkgvlLCcYM09VTrKEWHLB2fLmZrZnYfKlBNJj0p/EI8Jbgekpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8pu1GaSdOutA1NgNcgvwDulbwF7xDuUwP1UccZrzaw=;
 b=VMg+hpNoPb4ZPQgJk/katc5TkZz4jYGE1iC844QaOWrJsOnXEFZrCPWm4zfd7HshcsXZB+52+xbYAXIO2xqvyrqAxo5b6FC1XhwcEFnofArlIkAWeKTtbx6BbcKDkwqplEYcBq2WMw57xSKCcf3xhGNVUCGNPDjXTIFf5bJqKvc2yod51jJAVduJ6Qttw4z9t0TfLgG9Ax1qzFiigtsm4w5FhQVfNoipEdDBVqLQPH4zmOiqU/tlUNIxLK1h7a6tk9AipIWMu2l8CDfOkfvkZrBe9cMxspZ4P0ukCzgGt4p1nttWwkw4frZipDLGtWABr8Xj/AeXK1w6697FrI8DvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8pu1GaSdOutA1NgNcgvwDulbwF7xDuUwP1UccZrzaw=;
 b=n/LUnuTR5WIF6i33eTuc/ufvC6CdQuJtpavC85QL9EcHd+njsAeR1P60CI9Wjhhlilko9zmy+TJxlRMyw8oADYGuedwrrU9Btsp3B3fWHa7O3ueHHpoYKsoikYeeAuTeBwHVV8wM4E6dTsc8JzrJ4SYjKEbMAFO03RhzVEoyPLo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2190.namprd11.prod.outlook.com (2603:10b6:301:5b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Thu, 31 Dec
 2020 09:03:43 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3721.020; Thu, 31 Dec 2020
 09:03:43 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/3] etbales: remove upstream ebtables-legacy-save
Date: Thu, 31 Dec 2020 17:03:30 +0800
Message-ID: <20201231090331.223784-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231090331.223784-1-yi.zhao@windriver.com>
References: <20201231090331.223784-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:203:c9::7) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HKAPR03CA0020.apcprd03.prod.outlook.com (2603:1096:203:c9::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.2 via Frontend Transport; Thu, 31 Dec 2020 09:03:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fd991b2-2e13-4bab-00ec-08d8ad6af925
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2190:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2190782EC4D8963E41EA3D0DF9D60@MWHPR1101MB2190.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QPd4uu7yA/TddC/iq31miAMTB/5sqJmoSzcvS/t6Ya5M8czP1MZMO9Pv69+V5876U/ghvn6LwzamORfO1RgipxtHXNwQHDALw+6NWoYprWye2Z1Tsm+lQI2KfFMpr/TeeDKQ6Zg+Zb6iyfQ2a3hyl39i1QIzhryCbeGLsexXcFAxguDiL0FmnutARoC5zLuP4PYPEsNpIg8Q2/aaFVQb1QsHyBOLy94lO0XZFDj9Rp124K0LS5uyeafoT+iBJZ8RnL+OSc1n+Qii1ToD4s4lwdPX6KQMhHXhpo1WDanTmoshjkSRIWaysG+uesit2soXksfh+27l2GHhgROLKhDD/Ath4TRnUCC0pBpwa3bRPYJZVT+mOYGlwP42iOpybnFqHFAhsuO3Z98fd5Sh20PTnhoSY+BjIfBJfIWYVzbo6HjZpADXBKNsQK7oWAbsz9+0Q1ODJdax95GDOe/h2Qx/gA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(136003)(396003)(346002)(66946007)(66476007)(8936002)(2906002)(316002)(52116002)(5660300002)(478600001)(966005)(1076003)(8676002)(66556008)(36756003)(6506007)(86362001)(6486002)(16526019)(44832011)(26005)(2616005)(956004)(186003)(83380400001)(6512007)(6666004)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?nWz26LNlmR1Qr8xfscUURgs0+TxdqXqGQ3i0zhSHERVJAR4m8+mqCppglxtD?=
 =?us-ascii?Q?kSYiMP4dUPTZwNwShk16U5f/qn7rvvhiXJg/N8WAr88ZLFPcC1P+Gyh4nqaR?=
 =?us-ascii?Q?aR81d6vsqCBxwfVVD5PMmHIlIy6ngX3af7df+t8HKf8JdoFB4uPtRaXeEHte?=
 =?us-ascii?Q?KKzqeOzhdsZiQO1eGFJ2aJCW+IGr8rCTXsaMfA1E/es52o3s4aL1cKinNTst?=
 =?us-ascii?Q?VLCos6nVIZ0/LEi4GcOHOwj+EcDHn61BX5XMFyr3rhlOPQwenw/1QoUXu5f1?=
 =?us-ascii?Q?QUvtkW0iDcZ87NLDHG6ymcmt3h2n8ph/DIzag+bqXetLGhgvZ1toKxlREEkZ?=
 =?us-ascii?Q?wzW/mf7jIybRlcpJk7ahwcMWeaz94C3cz/+2eA7ZmjrarV96Zgbi0p9bi60H?=
 =?us-ascii?Q?C03bwLbhYyC2QO9/O+xFqw9XyjZLkHJc1y3BL7H/p6UMNpqCRpwWdVMDAzvw?=
 =?us-ascii?Q?f8KgfZkBozlWVdXnzrSTADKzTMjxHw3ylFE9UHB1TB2Z/Cmm3//agJnoBiQO?=
 =?us-ascii?Q?Q6+JjcaNykjICxCNg+zOYiyrNlWgKfrRZA4Id0LwxtGLDp8vumiRz/W7o9tz?=
 =?us-ascii?Q?Bn1n8xkttQHJfjNfkhW94fb7b+Ozyhsie0ceCa21kv9p/NuG5YM8k2mZlrX1?=
 =?us-ascii?Q?F2B78Tw/i+u3JJ1DeLS3scUw0aW8v3dxQ/s2rmmEfg81xc/gW5CVSFJ8t9KM?=
 =?us-ascii?Q?fKDYUaMWfeES05MKivvHgi2aqBH+BaXRs0wUPwOHtjetANR5a726O+7vbLEw?=
 =?us-ascii?Q?/f9hKIbVzEo9olqKR7BP8K2VcSwfu/6xqZ4rfLkAGswKrXexlVbJ7F7EKFQT?=
 =?us-ascii?Q?nnTsXXZw3wZLFWUU3bqBE6W85cY30CEMlPM7mdtZaRhR/gKrnHCNuCOQXEnG?=
 =?us-ascii?Q?+vrwF+JsZZKWK555w38nwpzvydPNl4dKwgW9ML9tueEJA+Yqxxba019XV16R?=
 =?us-ascii?Q?fbFpKWB9QPcxdtP81+7nitiRNPbJGFTq+0zAUT6h7/8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2020 09:03:42.9910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd991b2-2e13-4bab-00ec-08d8ad6af925
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTXFjSQxGaeBqH4h+0C2DEdCyHhAWMdxm9/hMYnM3B8f2K8MHr8RM+BgiPUGTfSnDNqgSxGmQdv4qFHqQYP8Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2190
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Remove the upstream ebtables-legacy-save before we install the local
ones. And install it to ${sbindir} rather than ${base_sbindir}.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../ebtables/ebtables-2.0.11/ebtables-legacy-save           | 2 +-
 meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 mode change 100755 =3D> 100644 meta-networking/recipes-filter/ebtables/ebt=
ables-2.0.11/ebtables-legacy-save

diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtabl=
es-legacy-save b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/eb=
tables-legacy-save
old mode 100755
new mode 100644
index 2d7fc4ed7..2133600f7
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-lega=
cy-save
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/ebtables-lega=
cy-save
@@ -1,6 +1,6 @@
 #!/bin/bash
=20
-EBTABLES=3D"/sbin/ebtables"
+EBTABLES=3D"/usr/sbin/ebtables-legacy"
=20
 [ -x "$EBTABLES" ] || exit 1
=20
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb b/m=
eta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
index 08d4d661d..be21c372d 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
@@ -28,11 +28,11 @@ do_install_append () {
 	#This file has been provided by netbase
 	rm -f ${D}${sysconfdir}/ethertypes
=20
-	install -d ${D}${base_sbindir}
 	# Replace upstream ebtables-save perl script with Fedora bash based rewri=
te
 	# http://pkgs.fedoraproject.org/cgit/rpms/ebtables.git/tree/ebtables-save
-	install -m 0755 ${WORKDIR}/ebtables-legacy-save ${D}${base_sbindir}/ebtab=
les-legacy-save
-	sed -i 's!/sbin/!${base_sbindir}/!g' ${D}${base_sbindir}/ebtables-legacy-=
save
+	rm -f ${D}${sbindir}/ebtables-legacy-save
+	install -m 0755 ${WORKDIR}/ebtables-legacy-save ${D}${sbindir}/ebtables-l=
egacy-save
+
 	# Install systemd service files
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)=
}; then
 		install -d ${D}${systemd_unitdir}/system
--=20
2.25.1

