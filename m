Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB2ACEBF96
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 10:57:33 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.138])
 by mx.groups.io with SMTP id smtpd.web11.66456.1727434644622787278
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Sep 2024 03:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=XgP8XHTP;
 spf=pass (domain: kpit.com, ip: 40.107.57.138, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5z/ZEwzUMDimejxbNNCOtxSvF7A2HtNM7OKJPVmrZCIHepsf570tOM3B4iOjlDhtgf8J3olVHDVdyc1uQXFUE3awufO95VlZ7053kQMpqlbSNmGOajO+dvGgvtY7v9dlRlVndForZVts+obqBf3E/n0WJ+00Jmjc099D07ThYnsbPJs+AZPGlWrfldugz+biJnW54Cxw5ssMK6PZHb8p4eu2ZrinXiRBoByG5+6EpS2wBoEP/U2SesbICRGBTZQEvNfhe2SzBkzU+wXo9t0/zoQVvNpX4Lgqdb+eazNHr5+Av38HGmNMfCVTDiGuo2g4KjbKv2OwbDQ266FeY881w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSvUzzy0KOGL+nZm7mwwEi2D/j0cf8cFGv4VgNFPTcI=;
 b=e6E9xMuRRIkwEV5VwoxBDpTp3/O1D96ey5lWWC6SUDYIktnxZYF27b09pmVi7ptXvEYzt7KC5XfbSmEzCqflIcmBse5iEByyY3Uwiclrj7DexfC8mjRVV4mmlbJvOjTJyAxNurJKtudE1skL5AIbdhnEgWBdySIsVfihdVxCXaC/V1116UfWRUynZWszhDyjoJFaL5N4YdzXflTrqtf4LUBWySxAbBMyY3KfzS0X+JNqQIQLu0AhHgRT7uZ0z7k6yU4od8h3X5HpSlrh68esAN/rbKkvhRimK54s/0UQBVRz4YmJehCWLSC3rm2/UzUd+MGTFPmTL/o6Z9YadSti1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSvUzzy0KOGL+nZm7mwwEi2D/j0cf8cFGv4VgNFPTcI=;
 b=XgP8XHTPdHFS7jtUMOLImOeyYswT2UjMArXb0B6UbXlka4APT5LY4rEOglBf1tDErDMN5ArKlIvG76umltr4mcTEUcoAwot3hJac+5m3zH0/15aDZboCPsbWk7D9So8rOrNG4s3FDPBiIYk/FB6HQATcReaZXzMCxuWGYHmRWYM=
Received: from MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d1::12)
 by PN3PR01MB7807.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:9e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Fri, 27 Sep
 2024 10:57:13 +0000
Received: from MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d793:8439:6db7:9272]) by MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d793:8439:6db7:9272%3]) with mapi id 15.20.8026.005; Fri, 27 Sep 2024
 10:57:13 +0000
From: Nikhil R <Nikhil.R@kpit.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "bindu.bhabu@kpit.com"
	<bindu.bhabu@kpit.com>, Nikhil R <Nikhil.R@kpit.com>
Subject: Re: [oe][kirkstone][PATCH v2] rocksdb: Add an option to set static
 library
Thread-Topic: [oe][kirkstone][PATCH v2] rocksdb: Add an option to set static
 library
Thread-Index: AQHa7Jru7/gO4zF040WDzx/wVHMPr7Jrvq26
Date: Fri, 27 Sep 2024 10:57:13 +0000
Message-ID: 
 <MAZPR01MB8950C99B78444C4F01714913EE6B2@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
References: <17EAF175F763BD49.10903@lists.openembedded.org>
In-Reply-To: <17EAF175F763BD49.10903@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZPR01MB8950:EE_|PN3PR01MB7807:EE_
x-ms-office365-filtering-correlation-id: 4b99a3a5-86d6-4407-464d-08dcdee32484
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?rJQGanZJtVSJQP/edBewjFsupyyZAf12PB4wZoXR/hi/HZ63Qgy3H6rzF9Rz?=
 =?us-ascii?Q?U28ug+ine6gnZnOaYuSZ2eCcL/2hSt7+yNjCTSpVWKmhbhny1oYd9u1m7xQz?=
 =?us-ascii?Q?RUq+X+Yj9KnO/1PysB7xz75zFKJsM1mlS/IPCrsSduuee7kKWMtyLQqAbsqb?=
 =?us-ascii?Q?oFEdPi1IMKBu87FWBFnq3lA0MTjDy5zdw6kHEBkuspHPjXRXnvqsHZwSz8yp?=
 =?us-ascii?Q?OH8lHlny3w9yPVqjBRNXJBNL2V8m0nX+RomVMlPOgTo6zBcV9tMjn21MsdCX?=
 =?us-ascii?Q?v9fPs6NhUG55n4xbZ/0X/PjplkiGhXDNVFs1kIHrJntdt/dvgIIhPwLR3GRz?=
 =?us-ascii?Q?Oiizenj/4mcx84eDLsz4iK4ZyWAQ1VmwmfxKMLzhpodEH8h0hlvGGy1YN2YI?=
 =?us-ascii?Q?fpJeDqCpqg/z8AppI8pMAzLGR5i9F9ZZKOPVv26bCaw7Z161PvHzhgF0l+kQ?=
 =?us-ascii?Q?Xpk+lEdPxIYLR+zPDoHHNTeMgdQRP6lakpfu0UwmFrUa3JsSuch5+dvBn08B?=
 =?us-ascii?Q?5WBXIkfQpGDmyolfqWRfobP8zxgxmyDlpYndvWgl8XROmateq++6k/9oasXt?=
 =?us-ascii?Q?q2/jdaZ6trqJSawr8rU2FOM5/unYWEtXXAD0Zvv9TJjadCMkALXDf72Afkrb?=
 =?us-ascii?Q?u94Ypg9dwHoxSTamhUvxgtwCVM8D4b/WNKNPDAeHPiUQKVh0jgwHLF9sbKYW?=
 =?us-ascii?Q?zL+Dl5IVHSu/LlKNg/doGEc+J7plIDwbOHdsJrB6GlNhNAV7WTM1DqYq48LV?=
 =?us-ascii?Q?qaUcgXevdsNa37dSc1sSOA7DMptMaa+AlfavCcn0zHjPVAUrAvAkgRE3iZHB?=
 =?us-ascii?Q?5yqu6YvlPE+rpiMf7wZX+IthpuKxYYRefqFeqGaEmSWdQcGZPgW/BFZ2fEYj?=
 =?us-ascii?Q?EMtqgyXge24VenSMHW/n/lCGoYPEa/cAI68VmhrrDBrI/E/Z6KYEH0MxoV5P?=
 =?us-ascii?Q?i1NkIiO7S4OnSOthzj9OpWpFNx3Tpf3FlTGQFlLTNDjTd0nyt34/tQx67MCz?=
 =?us-ascii?Q?kiSTD99m3ziXd9eWazZTPEDII9o1arecge1roIr4UOybsLZPevT0m8PqqEF/?=
 =?us-ascii?Q?zS+M3KnZE89lOfmQ4jVziA0rCZ6EpWtEaaSsmD1Qvr6BT0wAb/Va57isGhIK?=
 =?us-ascii?Q?77k94JxWnRnu6O0FRWVuX+TJWHc6bxGJqZipNC4zPV7q2Tyj+H2J2uFi8ufp?=
 =?us-ascii?Q?RUz/C06Q/Sum/YHnTA7TuNT8AblisNWvq+kJPmUtvcAcPjXPFuVsVT1Z7NJu?=
 =?us-ascii?Q?FE4X7uRvkcswpXCirMy9pv8teazgx/jcWjgqu9oLOj0kPQSIjlbn5mfjoJsO?=
 =?us-ascii?Q?nW78CqkXrbsAmIRyFp/Cy1IaztTtqRiOao3O6j2f5bREsVph9O6Z3HLlZ6U0?=
 =?us-ascii?Q?fmkZywc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?JaZYJxOxefl0djya/jPuN7QNLkDUOTG8P7cbcFvWH3K3GGe0iCqskSklj0qa?=
 =?us-ascii?Q?JTKvFF+6sYt3lySXkISC7ROtiMgqbOzAz/kAsLHzL12GHqa4hv+kytKl0eUR?=
 =?us-ascii?Q?vV3NKqf7LUS4akBPLRDVotfCzRTeEUD167I5K8w6D4DecoIvX82U/3hYQhB8?=
 =?us-ascii?Q?lvnFVsG08JGwnjOzKC10hUAqXpayjDGzB5orypL2oz3xn9hcbkzMTohv3e6V?=
 =?us-ascii?Q?8fQpqFxsFUibP2kOdsY1TpTOcFmH5ssFaSwTA/v0tekQv67swDg+7pqBHKV1?=
 =?us-ascii?Q?qTAlGAPZ8v0tANU3NDj+vGjdEWe14eMJ4dxpzEZY594nfKPLThQtP4RUxU8U?=
 =?us-ascii?Q?2T5LKoOjofwH09qPjt75k4gDlZbnJFH4FeSsFLW36M5vBk8+ABwcBqBmqaaf?=
 =?us-ascii?Q?R7DL7AngM1ODj3xpb6rCAvW3U5dzI2T9cU/FjSk1ojXvI4GZzhkfNJ4WWbr7?=
 =?us-ascii?Q?FcbTuR1vcK2lA+ICLf4KFznVxJRhcw1TLYirtf8YWlxp2PfF7Qr8wKtIdF/q?=
 =?us-ascii?Q?7sCxEhGPkyr1vrKdlMEHGUMHOGNi+WR+qA6ksZ0Q1S+ia92Wf+PFg66c6SC+?=
 =?us-ascii?Q?69nstXLRTqRWyxLmpqVcGI0CGB7glq4kWq16QkQ2wvsDijNY78go2qn71hGZ?=
 =?us-ascii?Q?SQCfyp3cugIgu0IyOQmNwY5X3ZEWI7VTD33X44JE8xyJMwalwGgwtKKe1hK/?=
 =?us-ascii?Q?TooJGcpmDuFNDefH9HC9RGbFCy0wcGGCiOvElk/f0KkDqzBpb893naLmKb2v?=
 =?us-ascii?Q?T6LuxzAGIbXUMQ+UHH/6JafFz2MCq4tzvUwRord32KOsf+ko5enFSs90G+Uo?=
 =?us-ascii?Q?1RaOjkFEScRyh9NSraE6m00KDOiztjRkvIkXv7AJq0RZF87o521oB6Q0AoZs?=
 =?us-ascii?Q?TXbJkV4iHNHoBYDLWrklf7RIdUBbEZQypMTJdg0fslAlhx9Pu/nyZxDmEW+u?=
 =?us-ascii?Q?zEjLY63PV8Pa60P+nh9xiFegcepT8QHkqyewtl9Kz1e3F/sJrLDn0tSg7I1z?=
 =?us-ascii?Q?CCvX7BgLW/jkfki4nuxuio5/+Q76yhFioDZTN4t5E9sZ5323OQF8aU82o9Xl?=
 =?us-ascii?Q?vkQLvnqEU/8gEPywZ1xNRtuBgZP9Ce13/j0MUYyRruHni3XDmMqf8RU+xIAw?=
 =?us-ascii?Q?hxOpLqwIXY7VTzoxGQthdR0wC06ayCKdFys5D7wMPRZZqezdLgkrWxV9pYGs?=
 =?us-ascii?Q?leeKk5pkqsIZeEO/7FEasWSxaRkERkkZE5qTIaOAsThMt1jss6OAakWaZZfl?=
 =?us-ascii?Q?0wWXeG67KqngmnP77soFEgiMcFEVLV3SfqXEczdKsppD0GCXP4V4QztTLeyL?=
 =?us-ascii?Q?n2ejQQrtB0REkIcsLos0/vQfP33aa//Hh8UoI9rvqbl/KmgwW5myQelpxlEZ?=
 =?us-ascii?Q?anBxVX4yPzNCB6o+G22IVz2yo2dmuBb70WqjLgUrh5BLCqcavRx5QrYAN5s1?=
 =?us-ascii?Q?UISO0EA+0U0ttbjDh2bxAykh0qa213FU9Ynz+3UQn4/yhKCx/ybXyhKzK+tC?=
 =?us-ascii?Q?gU0ie14L0hecqSArCxfm3Wt8JuPjQW0HPBr1b/PoWHfJfdoz2xSeg3syfiGQ?=
 =?us-ascii?Q?ffU+JcywibfcWLWnjKI=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MAZPR01MB8950C99B78444C4F01714913EE6B2MAZPR01MB8950INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b99a3a5-86d6-4407-464d-08dcdee32484
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 10:57:13.0795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Prh6GpbkfVQJ2GH0QkKZtRfefXf+HdLILJbvofZGmQ2u2003OwfULLr+gCmskJnI+jBRD81mhYsHCDtvqZpzTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7807
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Sep 2024 10:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112529

--_000_MAZPR01MB8950C99B78444C4F01714913EE6B2MAZPR01MB8950INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

This change is already part of master now, May I know when this will get me=
rged to kirkstone

Thanks,
Nikhil

________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Nikhil via lists.openembedded.org <nikhil.r=
=3Dkpit.com@lists.openembedded.org>
Sent: Monday, August 12, 2024 3:04 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>; bindu.bhabu@kpit.com <bindu.bhabu@kpit.com>
Subject: [oe][kirkstone][PATCH v2] rocksdb: Add an option to set static lib=
rary

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

Modify the CMakeLists.txt to add an Option for
STATIC target, as available for shared library.

Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%2Ffacebook%2Frocksdb%2Fpull%2F12890&data=3D05%7C02%7Cnikhil.r%40k=
pit.com%7Cc0d352ba064142ff3c7308dcbab20b6f%7C3539451eb46e4a26a242ff61502855=
c7%7C0%7C0%7C638590521134215647%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DHhmqge=
PiZ%2FRbCBHT2soOLfBFeCLLhHj6afBIZFalZxw%3D&reserved=3D0<https://github.com/=
facebook/rocksdb/pull/12890>

Configure static library default to switched off
as shared libraries are sufficient in most cases.

Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
---
 .../files/static_library_as_option.patch      | 67 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb |  2 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/static_library_as_opt=
ion.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.pat=
ch b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
new file mode 100644
index 000000000..3bdf151a0
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
@@ -0,0 +1,67 @@
+From 285d306494bde3e9c24c8cd6fea1eb380a304d03 Mon Sep 17 00:00:00 2001
+From: Bindu-Bhabu <bindudaniel1996@gmail.com>
+Date: Fri, 26 Jul 2024 15:14:45 +0530
+Subject: Add option to CMake for building static libraries
+
+ROCKSDB creates a STATIC library target reference by default.
+Modify the cmake so that the STATIC library is also an option
+just like creating a SHARED library.
+
+Upstream-Status: Submitted[https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgithub.com%2Ffacebook%2Frocksdb%2Fpull%2F12890&data=3D=
05%7C02%7Cnikhil.r%40kpit.com%7Cc0d352ba064142ff3c7308dcbab20b6f%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C638590521134222777%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7=
C%7C%7C&sdata=3DV6SDJe4tQYj%2FSDPVJt%2BpbocK4mUez6vjzCBkPKDwmlg%3D&reserved=
=3D0<https://github.com/facebook/rocksdb/pull/12890>]
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
+@@ -919,6 +919,7 @@ set(ROCKSDB_STATIC_LIB rocksdb${ARTIFACT
+ set(ROCKSDB_SHARED_LIB rocksdb-shared${ARTIFACT_SUFFIX})
+
+ option(ROCKSDB_BUILD_SHARED "Build shared versions of the RocksDB librari=
es" ON)
++option(ROCKSDB_BUILD_STATIC "Build static versions of the RocksDB librari=
es" ON)
+
+ option(WITH_LIBRADOS "Build with librados" OFF)
+ if(WITH_LIBRADOS)
+@@ -938,9 +939,11 @@ else()
+   endif()
+ endif()
+
+-add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC})
+-target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE
+-  ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
++if(ROCKSDB_BUILD_STATIC)
++  add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC}=
)
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
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipe=
s-dbs/rocksdb/rocksdb_6.20.3.bb
index 2ad2d38a5..4acf93439 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "git://github.com/facebook/${BPN}.git;branch=
=3D${SRCBRANCH};protocol=3Dhtt
            file://ppc64.patch \
            file://mips.patch \
            file://arm.patch \
+           file://static_library_as_option.patch \
           "

 SRC_URI:append:riscv32 =3D " file://0001-replace-old-sync-with-new-atomic-=
builtin-equivalents.patch"
@@ -44,6 +45,7 @@ EXTRA_OECMAKE =3D "\
     -DWITH_BENCHMARK_TOOLS=3DOFF \
     -DWITH_TOOLS=3DOFF \
     -DFAIL_ON_WARNINGS=3DOFF \
+    -DROCKSDB_BUILD_STATIC=3DOFF \
 "

 do_install:append() {
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

--_000_MAZPR01MB8950C99B78444C4F01714913EE6B2MAZPR01MB8950INDP_
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
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hello,</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
This change is already part of master now, May I know when this will get me=
rged to kirkstone</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);">
Nikhil</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Nikhil via lists.openembedded.org &lt;nikhil.r=3Dkpit.com@lists.op=
enembedded.org&gt;<br>
<b>Sent:</b> Monday, August 12, 2024 3:04 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;; bindu.bhabu@kpit.com &lt;bindu.bhabu@kpit.com&=
gt;<br>
<b>Subject:</b> [oe][kirkstone][PATCH v2] rocksdb: Add an option to set sta=
tic library</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: This email originated from outside of the=
 KPIT. Do not click links or open attachments unless you recognize the send=
er and know the content is safe.<br>
<br>
Modify the CMakeLists.txt to add an Option for<br>
STATIC target, as available for shared library.<br>
<br>
Link: <a href=3D"https://github.com/facebook/rocksdb/pull/12890">https://ap=
c01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fface=
book%2Frocksdb%2Fpull%2F12890&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cc0=
d352ba064142ff3c7308dcbab20b6f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7=
C638590521134215647%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DHhmqgePiZ%2FRb=
CBHT2soOLfBFeCLLhHj6afBIZFalZxw%3D&amp;reserved=3D0</a><br>
<br>
Configure static library default to switched off<br>
as shared libraries are sufficient in most cases.<br>
<br>
Signed-off-by: Bhabu Bindu &lt;bindu.bhabu@kpit.com&gt;<br>
---<br>
&nbsp;.../files/static_library_as_option.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 67 +++++++++++++++++++<br>
&nbsp;meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb |&nbsp; 2 +<br>
&nbsp;2 files changed, 69 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-dbs/rocksdb/files/static_library_a=
s_option.patch<br>
<br>
diff --git a/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.pat=
ch b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch<br>
new file mode 100644<br>
index 000000000..3bdf151a0<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch<br>
@@ -0,0 +1,67 @@<br>
+From 285d306494bde3e9c24c8cd6fea1eb380a304d03 Mon Sep 17 00:00:00 2001<br>
+From: Bindu-Bhabu &lt;bindudaniel1996@gmail.com&gt;<br>
+Date: Fri, 26 Jul 2024 15:14:45 +0530<br>
+Subject: Add option to CMake for building static libraries<br>
+<br>
+ROCKSDB creates a STATIC library target reference by default.<br>
+Modify the cmake so that the STATIC library is also an option<br>
+just like creating a SHARED library.<br>
+<br>
+Upstream-Status: Submitted[<a href=3D"https://github.com/facebook/rocksdb/=
pull/12890">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fgithub.com%2Ffacebook%2Frocksdb%2Fpull%2F12890&amp;data=3D05%7C02%7Cni=
khil.r%40kpit.com%7Cc0d352ba064142ff3c7308dcbab20b6f%7C3539451eb46e4a26a242=
ff61502855c7%7C0%7C0%7C638590521134222777%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;=
sdata=3DV6SDJe4tQYj%2FSDPVJt%2BpbocK4mUez6vjzCBkPKDwmlg%3D&amp;reserved=3D0=
</a>]<br>
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
+@@ -919,6 +919,7 @@ set(ROCKSDB_STATIC_LIB rocksdb${ARTIFACT<br>
+ set(ROCKSDB_SHARED_LIB rocksdb-shared${ARTIFACT_SUFFIX})<br>
+<br>
+ option(ROCKSDB_BUILD_SHARED &quot;Build shared versions of the RocksDB li=
braries&quot; ON)<br>
++option(ROCKSDB_BUILD_STATIC &quot;Build static versions of the RocksDB li=
braries&quot; ON)<br>
+<br>
+ option(WITH_LIBRADOS &quot;Build with librados&quot; OFF)<br>
+ if(WITH_LIBRADOS)<br>
+@@ -938,9 +939,11 @@ else()<br>
+&nbsp;&nbsp; endif()<br>
+ endif()<br>
+<br>
+-add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC})<=
br>
+-target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE<br>
+-&nbsp; ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})<br>
++if(ROCKSDB_BUILD_STATIC)<br>
++&nbsp; add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSIO=
N_CC})<br>
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
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipe=
s-dbs/rocksdb/rocksdb_6.20.3.bb<br>
index 2ad2d38a5..4acf93439 100644<br>
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb<br>
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb<br>
@@ -18,6 +18,7 @@ SRC_URI =3D &quot;git://github.com/facebook/${BPN}.git;br=
anch=3D${SRCBRANCH};protocol=3Dhtt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://ppc64.patch">file://ppc64.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://mips.patch">file://mips.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://arm.patch">file://arm.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://static_library_as_option.patch">file://static_library_as_option.patch<=
/a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
<br>
&nbsp;SRC_URI:append:riscv32 =3D &quot; <a href=3D"file://0001-replace-old-=
sync-with-new-atomic-builtin-equivalents.patch&quot;">
file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch&quot=
;</a><br>
@@ -44,6 +45,7 @@ EXTRA_OECMAKE =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp; -DWITH_BENCHMARK_TOOLS=3DOFF \<br>
&nbsp;&nbsp;&nbsp;&nbsp; -DWITH_TOOLS=3DOFF \<br>
&nbsp;&nbsp;&nbsp;&nbsp; -DFAIL_ON_WARNINGS=3DOFF \<br>
+&nbsp;&nbsp;&nbsp; -DROCKSDB_BUILD_STATIC=3DOFF \<br>
&nbsp;&quot;<br>
<br>
&nbsp;do_install:append() {<br>
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

--_000_MAZPR01MB8950C99B78444C4F01714913EE6B2MAZPR01MB8950INDP_--

