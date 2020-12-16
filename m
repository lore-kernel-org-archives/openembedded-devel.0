Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.57])
 by mx.groups.io with SMTP id smtpd.web11.4404.1608107367513565638
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Dec 2020 00:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mHRC0gWm;
 spf=pass (domain: windriver.com, ip: 40.107.223.57, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/vZyVFV2pef7XdzilDv/o6iudt2CsKDdJMU1+d0MyOG80K0M8jlJ0YANrlXnH9mNOZlpXtgo0ekFTHf28R2G05B/ZfhfYk0b4rkH9ZY2psV+6xwP3nfdXzUOdKalKNL2W9wOaumQQHmvYdxgtF3UNy244e/Acnm9ZcQJLF885Hj5ysf/1/TF9h4iaiqdUv//szJSgMciEFadhWIcLeGt3xOAveBbFYuj07N/rwOITXX1K5Ru45mabpN/+Aa0/K5el5I0gTY0f7Ft8/QDUkhCbv7cfkhIE0K1/h+veBEQMqmM52YC1AxE4PzyBeUVzh52hZR27u/XTWGa70bP8Z6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTRPE3fg9seKCFFcH1Zu6cQ/9JyggRUEczYRi4X05KM=;
 b=UhuY07INK2exBKrultcGELdbUtq2j77d/O/kTtG2RctS8FHXQbYJoT2n57vAtUvUpNeHhBO5udS4VPemYcxRKAMd4YctpxkLOPraTcg5kbyj3Ovl4HltggluGrod1F1NJlqelO4WnvQfGXAkl/7kf3VpROPgLwmx/PdINZxfnRBswWflfENpYQH4psolsc49a7MSlGFH1XZVprE2lzrv1ePSp2eW9jUqOO0nkd1C4dcENzIQrp6+AbmmRaT0M5uA8+ZA7yCpi8YYb4HSFiSNtwaOhU5pIttXoTD8yGPBvXJMqMkbVIACezrvzMhbUQuqMbAGpQd9mIB43djoajNLxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTRPE3fg9seKCFFcH1Zu6cQ/9JyggRUEczYRi4X05KM=;
 b=mHRC0gWm816Pi2UatOAynogxRuotgAuRxAxv770jC+hGxXA8GvANr8DmZzo7yn/d9kjEfV88qiAq5e5/ocJZxrCQVzLTVaq5qb9aiOI4W7Ic8AfcvFtP0fs+xNu9+NYOFD7yluSHzlxF0pkbRUJhog5CTeYpJpl+JcCtvKZSgnA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4713.namprd11.prod.outlook.com (2603:10b6:303:2f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.19; Wed, 16 Dec
 2020 08:29:26 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 08:29:26 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] ebtables: do not install /etc/ethertypes
Date: Wed, 16 Dec 2020 16:29:16 +0800
Message-ID: <20201216082916.81045-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::12) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by SJ0PR13CA0097.namprd13.prod.outlook.com (2603:10b6:a03:2c5::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.9 via Frontend Transport; Wed, 16 Dec 2020 08:29:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e91ce908-3c6b-4a97-1000-08d8a19cb31e
X-MS-TrafficTypeDiagnostic: MW3PR11MB4713:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB47138BD529DA4C1A905F0CD3F9C50@MW3PR11MB4713.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xEEwAUw1gR+vn5Rypbq9CQctnJsFYDn9q3bjBBTpRRyteDMIUjv30k4Q6/fTZeZpHiQuZ8FYNlGP+ifgrOOUqeFLtggPq9D82h3AlQJ2mpZ16d/f1zTM7Ntq+YT4HFi8LvOv7ReTWYHHYGuqrTMZXLcx5UFqEYaHsiqk0bZMN5tvcYwGJFPc30UdvXX9ZnSRJ2EAQUgGpa5RXfeFAwdLh+qgMuWzQT44rQgL9gUPlHcYEGIj+YwobL1IOBfXjlvY6Hx83Vx30mvaA6GCBIcsf0odKoHWGIkMP+iCJbVq5Bw/HRAPaTCEbXmpuxSNCKgqvsSUFwYs9t6YIL8MPt9z9eD5w2PEpqwC2VWv8hFScIUASSV3ujLW+PM/HqflRhjLByaWPmMKeA8L5ye+0S4aLw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(366004)(346002)(396003)(376002)(83380400001)(956004)(8936002)(2616005)(2906002)(16526019)(5660300002)(186003)(52116002)(26005)(66946007)(6916009)(66556008)(66476007)(86362001)(6506007)(478600001)(44832011)(1076003)(36756003)(8676002)(6666004)(6486002)(316002)(6512007)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Q3N+5bKoq+uqDYEeBDL9d3/IvzhaephyFt8lR5RBr30sTU7Tol4f+EbWDiwI?=
 =?us-ascii?Q?yerXxVqUL++2biINAThEHRS2MNSy4c0zC4pbzRXWkulQxBKHb6O3ShzRyOzM?=
 =?us-ascii?Q?YWfOJciRrmDGbw7ZbhDP8r+vN90PZpegXsX4anhGq9EP22k27FSTb5GhckzD?=
 =?us-ascii?Q?c/ega6TAhG7Mya9C1fyAzh82ylNCmY1kpHPZX9nw7OSQkSv+p2EfjNThhkX8?=
 =?us-ascii?Q?qUWnAdq67EFhT2E4VGOVTMK/CQnPbzclszSZfQ1Bn231xDsEEg8wrnCDnFt3?=
 =?us-ascii?Q?4cM7XJqHo5xybLeLVCSOx+dc+HkE0TC68iWd4dFA4/c8xtHmkRECGqcJ8QZv?=
 =?us-ascii?Q?FqCuSsnhIzrv+nOa2m7m3/TYl59QHnbFcgNxCPVUQUOc3k3tKCuO2xqlc53h?=
 =?us-ascii?Q?J8LXbOyejT/jtoZkNIoDtkX03U1zMmCJS/XZ0wKs7TXbvNw9IMGcNaVkQ5pf?=
 =?us-ascii?Q?faMhovMDVfE/KmX3a/gbaXOWNkxrSLwZHvQvuvmHXti5kBugREGuRlcwc1NN?=
 =?us-ascii?Q?88hdhtTXZjX/4+JLTe/VqZ2YkRWvs4yo9mhEC0HMFk8EIad50752F4A7lf4S?=
 =?us-ascii?Q?0cBlydL0Ril2jiElWKd8Ho4YM50R7W4/hISOjCDX68NxpT8/ePj6FJwjxzs1?=
 =?us-ascii?Q?DLFpmGFqd+Xa2CBMv2LL9YuGPFA8Vcjc674IwlDB8XeejaT+BJM18X6tY2BV?=
 =?us-ascii?Q?S6S6Dmohk8TzdYKGAXv5qfZFjgi4sESiQgYzLAQNwvKzc85bZ+xPftjXVTwp?=
 =?us-ascii?Q?VolZMmFEGvVmjtYXFXbhwZNhatavR2HAGiBV178uI5szocqWeZKN4cqaTP/X?=
 =?us-ascii?Q?wNIQ6lsCdNyNovMJspzw9C97/6jjZfciDbdQUYXPbzWEQBnabKEkMTAwX0nx?=
 =?us-ascii?Q?39hbDXvc5ZRrv2nGV1v7FrQ8MlYoIfaIZqOBLMQMufY9Q2wHJsTAweRL76N4?=
 =?us-ascii?Q?WtTJiRtV4BYhEDKWzHTTW4779k2Lum2GVUV2VIpIdAw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 08:29:26.3822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: e91ce908-3c6b-4a97-1000-08d8a19cb31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPD9kcBIOgyKZ4DTS9i/dIlfZIr97lcaPH2Itw71vtivmpKWutV50TxCG01nBADxAw5kZlhMc7Lr1A8X55Zf0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4713
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The /etc/ethertypes is provided by netbase since 6.0[1].
Do not instal the file in ebtables, otherwise there would be a conflict:
Error: Transaction test error:
  file /etc/ethertypes conflicts between attempted installs of netbase-1:6.=
2-r0.corei7_64 and ebtables-2.0.10+4-r4.corei7_64

[1] https://salsa.debian.org/md/netbase/-/commit/316680c6a2c3641b6abc76b3ee=
bf88781f609d35

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...kefile-do-not-install-etc-ethertypes.patch | 35 +++++++++++++++++++
 .../ebtables/ebtables_2.0.10-4.bb             |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-filter/ebtables/ebtables-2.0.10=
-4/0001-Makefile-do-not-install-etc-ethertypes.patch

diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001=
-Makefile-do-not-install-etc-ethertypes.patch b/meta-networking/recipes-fil=
ter/ebtables/ebtables-2.0.10-4/0001-Makefile-do-not-install-etc-ethertypes.=
patch
new file mode 100644
index 000000000..65f593880
--- /dev/null
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/0001-Makefi=
le-do-not-install-etc-ethertypes.patch
@@ -0,0 +1,35 @@
+From d3d72c9ca6a0ce2597adb02c786de28268973ccd Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 16 Dec 2020 15:49:24 +0800
+Subject: [PATCH] Makefile: do not install /etc/ethertypes
+
+The /etc/ethertypes is provided by netbase since 6.0[1].
+Do not instal the file in ebtables, otherwise there would be a conflict:
+Error: Transaction test error:
+  file /etc/ethertypes conflicts between attempted installs of netbase-1:6=
.2-r0.corei7_64 and ebtables-2.0.10+4-r4.corei7_64
+
+[1] https://salsa.debian.org/md/netbase/-/commit/316680c6a2c3641b6abc76b3e=
ebf88781f609d35)
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 95651b6..85c5f98 100644
+--- a/Makefile
++++ b/Makefile
+@@ -184,7 +184,7 @@ exec: ebtables ebtables-restore
+ 	install -m 0755 ebtables-restore $(DESTDIR)$(BINDIR)/ebtables-restore
+=20
+ .PHONY: install
+-install: $(MANDIR)/man8/ebtables.8 $(DESTDIR)$(ETHERTYPESFILE) exec scrip=
ts
++install: $(MANDIR)/man8/ebtables.8 exec scripts
+ 	mkdir -p $(DESTDIR)$(LIBDIR)
+ 	install -m 0755 extensions/*.so $(DESTDIR)$(LIBDIR)
+ 	install -m 0755 *.so $(DESTDIR)$(LIBDIR)
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b=
/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index 276784009..bf523502e 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D53b4a999993871a2=
8ab1488fdbd2e73e"
 SECTION =3D "net"
 PR =3D "r4"
=20
-RDEPENDS_${PN} +=3D "bash"
+RDEPENDS_${PN} +=3D "bash netbase"
=20
 RRECOMMENDS_${PN} +=3D "kernel-module-ebtables \
     "
@@ -31,6 +31,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${P=
V}.tar.gz \
            file://0007-extensions-Use-stdint-types.patch \
            file://0008-ethernetdb.h-Remove-C-specific-compiler-hint-macro-=
_.patch \
            file://0009-ebtables-Allow-RETURN-target-rules-in-user-defined-=
c.patch \
+           file://0001-Makefile-do-not-install-etc-ethertypes.patch \
            "
=20
 SRC_URI_append_libc-musl =3D " file://0010-Adjust-header-include-sequence.=
patch"
--=20
2.25.1

