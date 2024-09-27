Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB05CEBF95
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 10:56:33 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.97])
 by mx.groups.io with SMTP id smtpd.web10.66385.1727434584702818900
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Sep 2024 03:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=ka7fqv9J;
 spf=pass (domain: kpit.com, ip: 40.107.57.97, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qsy1KBbw9pUbZ2JKwY1T0jNMXEHATET+RNqkJlhbxHU0jCq6WSIScLspE4nU0cExC+R++Nild+MTMLX25cgLtDyph/ePpXZrzD12VRiXhx+NpCXOqaKN+zhaNMHJcNpWhmwYFRHYbGV3F0jCfgwRn5TZ0TQ9Mtv7auW/VvnPaY95212RMmbONNeWtUcMzgn42uU+ozT/DUtZxI7VRztFePi6CCY4VLQj8x3dPcMTFhhf1UiATYPPfAI9bGiQ45LJYkYk+sWAJTaPowtwrEqgI6DzNnMbU61rjMTUFN0ePXMduilq5044wpfFUklOsF6D8dV1x2XEfYnhW8sh1w4dig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpmlcPHWSoaVnzOu4twyRDkhREG3M/U4kgG/KJQtrX8=;
 b=ZNEqZvMfRuj3pC+KHz4oU34FOpC40kYB2iH5z24/ja+REQ3m5z9NoU3jQIxdfgCnCZDRlDeXoSA172Ph39oxbmr5FnuPUglix/ISmOf68NMdCexDhtQj3OA0XadUnmuI+KzvmQimtN5oWSyGQn2ldhY7xiSQUNH25D03V/W8bFCfBlXjdJafZ0m75AdmTXUfb1AystUTJMJ9hYFjNvqbGaJDcZLnReuKV8LwTlz5GAUmxqrKUn+RR/mL4sdogj6M8fj2xxz8i0VLws7Upj6ztMkrAN0R0kUnpSbAkxZbj+rON11nUd+J+WWVqPhSmV1xzfW9Aov5U4H2dm/207yixQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpmlcPHWSoaVnzOu4twyRDkhREG3M/U4kgG/KJQtrX8=;
 b=ka7fqv9J5um0sGDCM/M7b0qPOtSFDuGO2GCdht4qDD6HR8NkA+fSI+J3ZX2pRhegd1GNO4/pF7PbcEzzGwN2bqJMP/GL+ydlEzCxoPqm5PcbS0iTbEMXMap63EntnenrsnaJviucg0U9r/J5HQNbSr9I6y+VKL+aQf4tnMNe/6c=
Received: from MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d1::12)
 by PNYPR01MB8094.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:50::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.9; Fri, 27 Sep
 2024 10:56:14 +0000
Received: from MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d793:8439:6db7:9272]) by MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d793:8439:6db7:9272%3]) with mapi id 15.20.8026.005; Fri, 27 Sep 2024
 10:56:14 +0000
From: Nikhil R <Nikhil.R@kpit.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Nikhil R <Nikhil.R@kpit.com>,
	Bhabu Bindu <Bhabu.Bindu@kpit.com>
Subject: Re: [oe][scarthgap][master][PATCH v2] rocksdb: Add an option to set
 static library
Thread-Topic: [oe][scarthgap][master][PATCH v2] rocksdb: Add an option to set
 static library
Thread-Index: AQHa7Jj/pHMNVc6gnE+lt0583X5PL7JrvhJu
Date: Fri, 27 Sep 2024 10:56:13 +0000
Message-ID: 
 <MAZPR01MB89503089675F1061DCD35378EE6B2@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
References: <17EAF0B3C9919070.11967@lists.openembedded.org>
In-Reply-To: <17EAF0B3C9919070.11967@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZPR01MB8950:EE_|PNYPR01MB8094:EE_
x-ms-office365-filtering-correlation-id: 498d1eb7-45b9-4ca6-f02f-08dcdee30113
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?pTfWm4mg8gpjZ7fOCMXFFauYe5s7OoPoeLcVbZQeek0J6D/fdDc66CyZEJic?=
 =?us-ascii?Q?7n3NjZq8yIBSXMlZ4PfKY7kKm8U0HNVZNldcQpxRLKdaiy/4dcicxJPhW27u?=
 =?us-ascii?Q?gM95hjz33Gs/MZNi42mDBiJQdtLYd9gi9sCb13dJUKSV1ewIipNdVeloS10r?=
 =?us-ascii?Q?EtpHPiNe0t9yE4ayscx/pgF2Z9Ops4xiiQ8bfgJWxPbz65dRdo9Fjyq0jKHI?=
 =?us-ascii?Q?gVFP4wkxUjVxTcYTvl8oTAU3qxm2slppfnRLAiK5a2EFvX14WCpM8A6wwjbi?=
 =?us-ascii?Q?UUuuE/vXCPnTAC4vwp9C7QVu6KGM9iTCq2MGDByWWS4Yw4SXklU0I/4rmDQH?=
 =?us-ascii?Q?UPw9HVWF4t5XRETiGKIAR5mp4m0whqtl0uuiGRRKSaWg76g/nj0AA+fscotD?=
 =?us-ascii?Q?TxvSPMWDSGdT24kJrtXuaocFyE7VvK3BFrokuImmjIo9SP9ZNkwemhMNekUg?=
 =?us-ascii?Q?hIF8C0BngwT2WHrI7Q2yjDuWJMffdijwAAryj+tSodDnDTByHEtoeCYeslQq?=
 =?us-ascii?Q?Es++C++StrJ0AnkeoyZL03ELPzOFAXvxcFA8VOkz7R/HcxTvYac7P/9qy4cZ?=
 =?us-ascii?Q?tZyDVeQAOtzQK9apTl2jk4kt38vmjp4sqKfaUv0cUi32EPwCIh1HKce3Y3Jf?=
 =?us-ascii?Q?xlqC+LDMc6PSY1u5dOlNswTbsTZ3h3CHuhO7RrbrUyDUVsYD8phuaxKuglO5?=
 =?us-ascii?Q?oYGUcQniYHvKoNPvWoPXjTKneERtR6lLhiuJyoWTeZFprB1Sq556ZTkZ8rJC?=
 =?us-ascii?Q?F7tHxxAXHDKsczs6eJkAOU/tbmZFk6FtNPWbLFJQcwZaSLLKUdCTFKR3+sjC?=
 =?us-ascii?Q?14bwtEu37YOWtek+/RpL11M5nqReCNe5OzqWJp/JKTvRILjUDLFuKHSIB4wo?=
 =?us-ascii?Q?vTfeRMEKXck9j8QWprsVSgWgbqnEasA0m1re+++OBj8vnBQGB5bmtDoC8cPY?=
 =?us-ascii?Q?u8Y0YyScIKF2WXXMa2EG0NdydiZOzL6K3MvmTlrjALuQ1c1B/V0H3SORqtgv?=
 =?us-ascii?Q?fYCB+ldb6KGFj8iXCk33HraJGPZCyLuP9zNxrIHpnA7PWdGXDOt6ybC+KMXA?=
 =?us-ascii?Q?GKhibCpHpKnCFsXIs9lTfAq2QTUFrNlFqtHKIKzHWenRhSygjsf2v9ZDggua?=
 =?us-ascii?Q?3X80Br6WeBOF7G82aTqr1yN3HlUSnKXViz8ARHdx7ORpVbXdhOyTakPuQkWk?=
 =?us-ascii?Q?NhYYOaX9/zt/Va/EFVCRi0rn1LVAxuRsAgdUdhvTNz3hUGfw8GSssQCZN94Y?=
 =?us-ascii?Q?tDI80bCFUWxvUzScMEWZdbIgNneGYHf8YA0wDDpJo/IRuW18m1sYNp8A7huj?=
 =?us-ascii?Q?1GBFT6qzkEIWfsvN7UhXq0jeEg7fc/qBUmxaR9gQESjH1pxAKEGewkMjKxi8?=
 =?us-ascii?Q?Zmb1OVA=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qhCmYNRmn6jozlO7VcnhWMEznFDPQDPwCFAiI30UYDCi8Omw8G2bmxej+H1+?=
 =?us-ascii?Q?iNe53NKhLndMUdrrr+CDndg5hhDDIsAYQqrKrFmPEbKsHVMQ0PJzRwVBhlUJ?=
 =?us-ascii?Q?iBDFIbeelIbAi1+f4Dcp760s+TxsDkx72y0EyyxUYVTBSM3D4KlDQXA+90lz?=
 =?us-ascii?Q?Y3vOLwE+ztLFiUuzNPml7qp282rHLll8TXlX/kzjGTlYCEOcAOtMLTdk0IJT?=
 =?us-ascii?Q?F+wO2c8LywDPQB0sjmikMgT5mfaJejaw7DKyXxD1ZO4CZ/K66v+3lwG0yDnJ?=
 =?us-ascii?Q?ol80Pdr7IeaonOuSNOCeapzN63n5enZpQ9joDEOP2qyCPcSZG+8Xzb6qhtKS?=
 =?us-ascii?Q?xLGve+/WK3GvG9n03QJzSEFZxy+qfXv/XlT7TjRcLBgD67LUmewcaDMRTLz2?=
 =?us-ascii?Q?4h9q7PfJAZQk+DKcOXG4Yn2PavQepe23x546Gfq63FZQdqS2otOS/uENiMHb?=
 =?us-ascii?Q?85M3Ck+tRVOxO0W+udE15AXXRPU6qeQH/Woff3AbxKGpCOWbxStDhp3KiWk2?=
 =?us-ascii?Q?RwtTT+DB41xLUCxyF0MeZ9QD0K3P9SktQZqejwK03FOFvP6waXG24F8YNIow?=
 =?us-ascii?Q?sEDAbSM7FcpxXnJSfE7hQb5tur7LQRyfPcPk+ipWujSa9uoe0d6/msTMAWI8?=
 =?us-ascii?Q?Bcgtz7LvLJ8stMvgCVF6g0wWW7oL3MbtuE4/YrZykdyNWCCYugnFM2wbrXeM?=
 =?us-ascii?Q?5pQ7R+b5hgLcfoB/LHk0BlsG8DQzNP0fs8nWftY1BDgPnw+RtWe3Fsb4lMie?=
 =?us-ascii?Q?M0zjMsywXNCrFAs8ACav1aIsvlqV4lyNZwpcks58bu34si+KpiuSLr6HTEGS?=
 =?us-ascii?Q?4cKtav87ISd9HxXM2nRtsLcpHA6L876MWom6OqBunEbf+Rnm4ic618TKX14Z?=
 =?us-ascii?Q?lKfw3SIlDgK/5PB50wRzKYzpjXSOSCnSUnhA4INpKDKEvcq+Q/P+rsHUsBHc?=
 =?us-ascii?Q?ho0yfmFicac+oMhLv0N89LijW7jKYzKdtdo/oIPLycbp/g2P+QdK2BI6pbro?=
 =?us-ascii?Q?vwiCXfZHMvuDsPr0ljvxamJCwgze6UCK/VXEhKPyRZ3hnCHlDldYUhul/WTD?=
 =?us-ascii?Q?C0NIJNb0UMxKLhf1RO75FjozUMoClBbkxmDCvkh3usvKoxEnMgRPIpNAJ/l7?=
 =?us-ascii?Q?ATVqGgFpZWS1KBDg95v/XNG+ulrh3SefgqW+fisyR/CE5X9xRG9Gr69pHvyR?=
 =?us-ascii?Q?u3Jh7SbHklErhP/W5Ed9ibZo0jt6+KeHs2Bku7dzIlSWCZSKBP+HBEVqisPy?=
 =?us-ascii?Q?gqRmKEMMsZxkh4XMHC3isG8UyGyBpWM4gp1/iDfehhNy72UC/TiA0UDmUJd7?=
 =?us-ascii?Q?ElPBxlTyHJsnSgV8h2u+KuJXhZNIKvHmcJ+zkk+7Is30fVECgOnp3ZCX/bi1?=
 =?us-ascii?Q?BEiXs2e+eB5DknBI4M2E4DO+LWdeZ++WXjyAOt+stFS9DgPEhuNCgMKbD0CS?=
 =?us-ascii?Q?OnqxFDVk8rzFCHnEwsO/2KYEM4Ognt20mUm9U2Nah267GBE9ruUpTAfKnnwr?=
 =?us-ascii?Q?f8u1XdUvyZZ/i2AT1XA1jo72MKWl/jae/n0459l2TdaJA7meNjoIvD0J+BPx?=
 =?us-ascii?Q?YokRQN07cve3mNLlCqI=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MAZPR01MB89503089675F1061DCD35378EE6B2MAZPR01MB8950INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 498d1eb7-45b9-4ca6-f02f-08dcdee30113
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 10:56:13.6299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cQFJOppyuOa9hzOlLg3jok/gN2lq2WeSSFt4M737U1EWicCSp8fsZ7Hi4DxHM71RlwUCywRiYYThAtDf5vLILQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYPR01MB8094
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Sep 2024 10:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112528

--_000_MAZPR01MB89503089675F1061DCD35378EE6B2MAZPR01MB8950INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

This change is already part of master now, May I know when this will get me=
rged to scarthgap

Thanks,
Nikhil
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Nikhil via lists.openembedded.org <nikhil.r=
=3Dkpit.com@lists.openembedded.org>
Sent: Monday, August 12, 2024 2:50 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>; bindu.bhabu@kpit.com <bindu.bhabu@kpit.com>
Subject: [oe][scarthgap][master][PATCH v2] rocksdb: Add an option to set st=
atic library

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

Modify the CMakeLists.txt to add an Option for
STATIC target import, as available for shared library.

Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%2Ffacebook%2Frocksdb%2Fpull%2F12890&data=3D05%7C02%7Cnikhil.r%40k=
pit.com%7C6d4c35b467c04e37279608dcbab01d49%7C3539451eb46e4a26a242ff61502855=
c7%7C0%7C0%7C638590512822552609%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DFr%2Ft=
7FYqlxgsRGiIo%2FU6BSDtDkBByDLsL0F8ezQdD88%3D&reserved=3D0<https://github.co=
m/facebook/rocksdb/pull/12890>

Configure static library default to switched off
as shared libraries are sufficient in most cases.

Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
---
 .../files/static_library_as_option.patch      | 71 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb  |  2 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/static_library_as_opt=
ion.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.pat=
ch b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
new file mode 100644
index 000000000..cef551626
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
@@ -0,0 +1,71 @@
+From 285d306494bde3e9c24c8cd6fea1eb380a304d03 Mon Sep 17 00:00:00 2001
+From: Bindu-Bhabu <bindudaniel1996@gmail.com>
+Date: Fri, 26 Jul 2024 15:14:45 +0530
+Subject: Add option to CMake for building static libraries
+
+ROCKSDB creates a STATIC library target reference by default.
+Modify the cmake so that the STATIC library is also an option
+just like creating a SHARED library and set default to ON.
+
+Upstream-Status: Submitted [https://apc01.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fgithub.com%2Ffacebook%2Frocksdb%2Fpull%2F12890&data=
=3D05%7C02%7Cnikhil.r%40kpit.com%7C6d4c35b467c04e37279608dcbab01d49%7C35394=
51eb46e4a26a242ff61502855c7%7C0%7C0%7C638590512822562184%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
0%7C%7C%7C&sdata=3D5%2BdzUTcjOn%2B4RALGI6eaZZDVh18JpWSmCnU%2BJAyq31k%3D&res=
erved=3D0<https://github.com/facebook/rocksdb/pull/12890>]
+
+Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
+Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
+---
+ CMakeLists.txt | 29 +++++++++++++++++------------
+ 1 file changed, 17 insertions(+), 12 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 93b884dd9c1..2ca925d505c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -98,6 +98,7 @@ if (WITH_WINDOWS_UTF8_FILENAMES)
+   add_definitions(-DROCKSDB_WINDOWS_UTF8_FILENAMES)
+ endif()
+ option(ROCKSDB_BUILD_SHARED "Build shared versions of the RocksDB librari=
es" ON)
++option(ROCKSDB_BUILD_STATIC "Build static versions of the RocksDB librari=
es" ON)
+
+ if( NOT DEFINED CMAKE_CXX_STANDARD )
+   set(CMAKE_CXX_STANDARD 17)
+@@ -1139,11 +1140,13 @@ string(REGEX REPLACE "[^0-9: /-]+" "" GIT_DATE "${=
GIT_DATE}")
+ set(BUILD_VERSION_CC ${CMAKE_BINARY_DIR}/build_version.cc)
+ configure_file(util/build_version.cc.in ${BUILD_VERSION_CC} @ONLY)
+
+-add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC})
+-target_include_directories(${ROCKSDB_STATIC_LIB} PUBLIC
+-  $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>)
+-target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE
+-  ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
++if(ROCKSDB_BUILD_STATIC)
++  add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC}=
)
++  target_include_directories(${ROCKSDB_STATIC_LIB} PUBLIC
++    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>)
++  target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE
++    ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
++endif()
+
+ if(ROCKSDB_BUILD_SHARED)
+   add_library(${ROCKSDB_SHARED_LIB} SHARED ${SOURCES} ${BUILD_VERSION_CC}=
)
+@@ -1238,13 +1241,15 @@ if(NOT WIN32 OR ROCKSDB_INSTALL_ON_WINDOWS)
+
+   install(DIRECTORY "${PROJECT_SOURCE_DIR}/cmake/modules" COMPONENT devel=
 DESTINATION ${package_config_destination})
+
+-  install(
+-    TARGETS ${ROCKSDB_STATIC_LIB}
+-    EXPORT RocksDBTargets
+-    COMPONENT devel
+-    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
+-    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
+-  )
++  if(ROCKSDB_BUILD_STATIC)
++    install(
++      TARGETS ${ROCKSDB_STATIC_LIB}
++      EXPORT RocksDBTargets
++      COMPONENT devel
++      ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++      INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
++    )
++  endif()
+
+   if(ROCKSDB_BUILD_SHARED)
+     install(
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb b/meta-oe/recipes=
-dbs/rocksdb/rocksdb_9.0.0.bb
index 444351dbb..fae54fdba 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/facebook/${BPN}.git;branch=
=3D${SRCBRANCH};protocol=3Dhtt
            file://0005-Implement-timer-implementation-for-mips-platform.pa=
tch \
            file://0006-Implement-timer-for-arm-v6.patch \
            file://0007-Fix-declaration-scope-of-LE_LOAD32-in-crc32c.patch =
\
+           file://static_library_as_option.patch \
           "

 SRC_URI:append:riscv32 =3D " file://0001-replace-old-sync-with-new-atomic-=
builtin-equivalents.patch"
@@ -43,6 +44,7 @@ EXTRA_OECMAKE =3D "\
     -DWITH_BENCHMARK_TOOLS=3DOFF \
     -DWITH_TOOLS=3DOFF \
     -DFAIL_ON_WARNINGS=3DOFF \
+    -DROCKSDB_BUILD_STATIC=3DOFF \
 "

 CXXFLAGS +=3D "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH=
_NO_INLINE_HINTS', '', d)}"
--
2.25.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MAZPR01MB89503089675F1061DCD35378EE6B2MAZPR01MB8950INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hello,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This change is already part of master now, May I know when this will get me=
rged to scarthgap</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Nikhil</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Nikhil via lists.openembedded.org &lt;nikhil.r=3Dkpit.com@lists.op=
enembedded.org&gt;<br>
<b>Sent:</b> Monday, August 12, 2024 2:50 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;; bindu.bhabu@kpit.com &lt;bindu.bhabu@kpit.com&=
gt;<br>
<b>Subject:</b> [oe][scarthgap][master][PATCH v2] rocksdb: Add an option to=
 set static library</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: This email originated from outside of the=
 KPIT. Do not click links or open attachments unless you recognize the send=
er and know the content is safe.<br>
<br>
Modify the CMakeLists.txt to add an Option for<br>
STATIC target import, as available for shared library.<br>
<br>
Link: <a href=3D"https://github.com/facebook/rocksdb/pull/12890">https://ap=
c01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fface=
book%2Frocksdb%2Fpull%2F12890&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7C6d=
4c35b467c04e37279608dcbab01d49%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7=
C638590512822552609%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DFr%2Ft7FYqlxgs=
RGiIo%2FU6BSDtDkBByDLsL0F8ezQdD88%3D&amp;reserved=3D0</a><br>
<br>
Configure static library default to switched off<br>
as shared libraries are sufficient in most cases.<br>
<br>
Signed-off-by: Bhabu Bindu &lt;bindu.bhabu@kpit.com&gt;<br>
---<br>
&nbsp;.../files/static_library_as_option.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 71 +++++++++++++++++++<br>
&nbsp;meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb&nbsp; |&nbsp; 2 +<br>
&nbsp;2 files changed, 73 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-dbs/rocksdb/files/static_library_a=
s_option.patch<br>
<br>
diff --git a/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.pat=
ch b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch<br>
new file mode 100644<br>
index 000000000..cef551626<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch<br>
@@ -0,0 +1,71 @@<br>
+From 285d306494bde3e9c24c8cd6fea1eb380a304d03 Mon Sep 17 00:00:00 2001<br>
+From: Bindu-Bhabu &lt;bindudaniel1996@gmail.com&gt;<br>
+Date: Fri, 26 Jul 2024 15:14:45 +0530<br>
+Subject: Add option to CMake for building static libraries<br>
+<br>
+ROCKSDB creates a STATIC library target reference by default.<br>
+Modify the cmake so that the STATIC library is also an option<br>
+just like creating a SHARED library and set default to ON.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/facebook/rocksdb=
/pull/12890">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fgithub.com%2Ffacebook%2Frocksdb%2Fpull%2F12890&amp;data=3D05%7C02%7Cn=
ikhil.r%40kpit.com%7C6d4c35b467c04e37279608dcbab01d49%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C638590512822562184%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp=
;sdata=3D5%2BdzUTcjOn%2B4RALGI6eaZZDVh18JpWSmCnU%2BJAyq31k%3D&amp;reserved=
=3D0</a>]<br>
+<br>
+Signed-off-by: Nisha Parrakat &lt;nisha.m.parrakat@bmw.de&gt;<br>
+Signed-off-by: Bindu Bhabu &lt;bhabu.bindu@kpit.com&gt;<br>
+---<br>
+ CMakeLists.txt | 29 +++++++++++++++++------------<br>
+ 1 file changed, 17 insertions(+), 12 deletions(-)<br>
+<br>
+diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
+index 93b884dd9c1..2ca925d505c 100644<br>
+--- a/CMakeLists.txt<br>
++++ b/CMakeLists.txt<br>
+@@ -98,6 +98,7 @@ if (WITH_WINDOWS_UTF8_FILENAMES)<br>
+&nbsp;&nbsp; add_definitions(-DROCKSDB_WINDOWS_UTF8_FILENAMES)<br>
+ endif()<br>
+ option(ROCKSDB_BUILD_SHARED &quot;Build shared versions of the RocksDB li=
braries&quot; ON)<br>
++option(ROCKSDB_BUILD_STATIC &quot;Build static versions of the RocksDB li=
braries&quot; ON)<br>
+<br>
+ if( NOT DEFINED CMAKE_CXX_STANDARD )<br>
+&nbsp;&nbsp; set(CMAKE_CXX_STANDARD 17)<br>
+@@ -1139,11 +1140,13 @@ string(REGEX REPLACE &quot;[^0-9: /-]+&quot; &quot=
;&quot; GIT_DATE &quot;${GIT_DATE}&quot;)<br>
+ set(BUILD_VERSION_CC ${CMAKE_BINARY_DIR}/build_version.cc)<br>
+ configure_file(util/build_version.cc.in ${BUILD_VERSION_CC} @ONLY)<br>
+<br>
+-add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC})<=
br>
+-target_include_directories(${ROCKSDB_STATIC_LIB} PUBLIC<br>
+-&nbsp; $&lt;BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include&gt;)<br>
+-target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE<br>
+-&nbsp; ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})<br>
++if(ROCKSDB_BUILD_STATIC)<br>
++&nbsp; add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSIO=
N_CC})<br>
++&nbsp; target_include_directories(${ROCKSDB_STATIC_LIB} PUBLIC<br>
++&nbsp;&nbsp;&nbsp; $&lt;BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include&gt;=
)<br>
++&nbsp; target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE<br>
++&nbsp;&nbsp;&nbsp; ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})<br>
++endif()<br>
+<br>
+ if(ROCKSDB_BUILD_SHARED)<br>
+&nbsp;&nbsp; add_library(${ROCKSDB_SHARED_LIB} SHARED ${SOURCES} ${BUILD_V=
ERSION_CC})<br>
+@@ -1238,13 +1241,15 @@ if(NOT WIN32 OR ROCKSDB_INSTALL_ON_WINDOWS)<br>
+<br>
+&nbsp;&nbsp; install(DIRECTORY &quot;${PROJECT_SOURCE_DIR}/cmake/modules&q=
uot; COMPONENT devel DESTINATION ${package_config_destination})<br>
+<br>
+-&nbsp; install(<br>
+-&nbsp;&nbsp;&nbsp; TARGETS ${ROCKSDB_STATIC_LIB}<br>
+-&nbsp;&nbsp;&nbsp; EXPORT RocksDBTargets<br>
+-&nbsp;&nbsp;&nbsp; COMPONENT devel<br>
+-&nbsp;&nbsp;&nbsp; ARCHIVE DESTINATION &quot;${CMAKE_INSTALL_LIBDIR}&quot=
;<br>
+-&nbsp;&nbsp;&nbsp; INCLUDES DESTINATION &quot;${CMAKE_INSTALL_INCLUDEDIR}=
&quot;<br>
+-&nbsp; )<br>
++&nbsp; if(ROCKSDB_BUILD_STATIC)<br>
++&nbsp;&nbsp;&nbsp; install(<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TARGETS ${ROCKSDB_STATIC_LIB}<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EXPORT RocksDBTargets<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMPONENT devel<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ARCHIVE DESTINATION &quot;${CMAKE_INSTALL_=
LIBDIR}&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INCLUDES DESTINATION &quot;${CMAKE_INSTALL=
_INCLUDEDIR}&quot;<br>
++&nbsp;&nbsp;&nbsp; )<br>
++&nbsp; endif()<br>
+<br>
+&nbsp;&nbsp; if(ROCKSDB_BUILD_SHARED)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; install(<br>
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb b/meta-oe/recipes=
-dbs/rocksdb/rocksdb_9.0.0.bb<br>
index 444351dbb..fae54fdba 100644<br>
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb<br>
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb<br>
@@ -17,6 +17,7 @@ SRC_URI =3D &quot;git://github.com/facebook/${BPN}.git;br=
anch=3D${SRCBRANCH};protocol=3Dhtt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0005-Implement-timer-implementation-for-mips-platform.patch">
file://0005-Implement-timer-implementation-for-mips-platform.patch</a> \<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0006-Implement-timer-for-arm-v6.patch">file://0006-Implement-tim=
er-for-arm-v6.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0007-Fix-declaration-scope-of-LE_LOAD32-in-crc32c.patch">
file://0007-Fix-declaration-scope-of-LE_LOAD32-in-crc32c.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://static_library_as_option.patch">file://static_library_as_option.patch<=
/a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
<br>
&nbsp;SRC_URI:append:riscv32 =3D &quot; <a href=3D"file://0001-replace-old-=
sync-with-new-atomic-builtin-equivalents.patch&quot;">
file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch&quot=
;</a><br>
@@ -43,6 +44,7 @@ EXTRA_OECMAKE =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp; -DWITH_BENCHMARK_TOOLS=3DOFF \<br>
&nbsp;&nbsp;&nbsp;&nbsp; -DWITH_TOOLS=3DOFF \<br>
&nbsp;&nbsp;&nbsp;&nbsp; -DFAIL_ON_WARNINGS=3DOFF \<br>
+&nbsp;&nbsp;&nbsp; -DROCKSDB_BUILD_STATIC=3DOFF \<br>
&nbsp;&quot;<br>
<br>
&nbsp;CXXFLAGS +=3D &quot;${@bb.utils.contains('SELECTED_OPTIMIZATION', '-O=
g', '-DXXH_NO_INLINE_HINTS', '', d)}&quot;<br>
--<br>
2.25.1<br>
<br>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MAZPR01MB89503089675F1061DCD35378EE6B2MAZPR01MB8950INDP_--

