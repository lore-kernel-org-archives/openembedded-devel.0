Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15B9CD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 06:14:48 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9052.1781674256237930375
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 22:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Sw/PQF4/;
 spf=pass (domain: axis.com, ip: 52.101.72.3, mailfrom: anton.skorup@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZtX1YCnbS5Ute5B3fx1P7dQZwHA9b2yjqsrDbuo94DeiPPRiyM9uIPQ1j6aUAFAmIW3MNds3//EPDJBlrHLiJSU89Q4KA9JvKv0b3Ye1ssm1TXSHdHqPBmkQHroRLIDyXRuZwcs2fQZ1aB5k5RT/vI97Py7vwqwMRbhSAZXwh/vGsoA64+ZR9VwCe2q0xPBSAOlFZ0TYMwqmKkxxfVORuxudk6fc7PobttRDZiQ4N9kSB/S1UKJXf0sE2Ov0jvYWQdgWciyi3bb67rYYu57nGBKZCxTEYmDbFnk58ALxJiBjdA3BEIxZGR6Pe5WMLVtQRT9lyuTmKJRoVn4XWqBmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djmCav1Rumc22n4a1UdmKIilbEo5weudnLgq4OamsyY=;
 b=L8wRYY6rUk0gDV2QQgtiMAYEzO+LkSaP1Q0RfmGZukpf1kx4oawXbabrewAhJFFHqg4CbDaZ/kVxoUFI6Y8bpxXaw0z88hs4oj4bzhOP2aAK7WQUPjBTTVyzO/jPdJ0uajWym/8Y5XQarWCzM+k+i1FbkVCH9twFm7ZKX21PZbzkhHlw1IAKwNHHh2N1RRFfFNupIRaTCX5gxcuZEpR8oz4aFev0Z35ajzmVdcttwwZ+fxVw0LohgcZgQLEYT8e9ZPUbDcfdQaJeNpKKaUIhFqYcUh2UzLKAr4xILZslZLlbglh6wW+g3qpO5MXhwRipvnaxGfnZvHEZ8wsOoyPXVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djmCav1Rumc22n4a1UdmKIilbEo5weudnLgq4OamsyY=;
 b=Sw/PQF4/94+lXB+rxwcFv40IExzGjJAUU9OEV1bq84m84G2B6eVu08dTxSVUjZoXprZ0OBCnZhEeItFJIlythBsikCOzUkSqcDEHD1giuhiUJvszElff9aymg6NLbeCwRSYGNa7ZIT7z9WGO4MLtohfKfbRg2jiD8Bd3TGA2npI=
Received: from CWLP123CA0172.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::7)
 by GV1PR02MB8834.eurprd02.prod.outlook.com (2603:10a6:150:a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 05:30:48 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:400:19b:cafe::a0) by CWLP123CA0172.outlook.office365.com
 (2603:10a6:400:19b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 05:30:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 05:30:48 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 17 Jun
 2026 07:30:47 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 17 Jun 2026 07:30:47 +0200
Received: from pc62260-2523.se.axis.com (pc62260-2523.se.axis.com [10.92.71.7])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 86CBC25D2;
	Wed, 17 Jun 2026 07:30:47 +0200 (CEST)
Received: by pc62260-2523.se.axis.com (Postfix, from userid 19544)
	id 859C78461E6; Wed, 17 Jun 2026 07:30:47 +0200 (CEST)
From: Anton Skorup <antonsk@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Anton Skorup <anton@skorup.se>, Anton Skorup <anton.skorup@axis.com>
Subject: [meta-oe][PATCH 8/8] jq: patch CVE-2026-43895
Date: Wed, 17 Jun 2026 07:30:40 +0200
Message-ID: <20260617053040.990143-8-antonsk@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617053040.990143-1-antonsk@axis.com>
References: <20260617053040.990143-1-antonsk@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000003F:EE_|GV1PR02MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bee5d7a-5305-4594-5ce8-08decc319651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|13003099007|22082099003|3023799007|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	VPDJv2O5xNKw7KW67wRtOamcUxkjIfO/2SsNiB8A0J6iaBomr6UceK5r+HvCkoYjUEdgBh4jJRx0OcQPVtkT5MdcdazUq7yFQ0lFE7vD1Fp623H/7Hcz4jntGP12gPqqWoM301uodOorEaKY82GODqo1t+MreuXe3r84hWdMMUp4rKDN6wFlnkDpbArPoIsd/5wsWu4ELJDDT2sZarztOTkyzctAJvcAi0OigCOWAFX1ntuW1StRsHBFmWjNGoix+D3NAoRwS1Od6M6wGvZSbOU++mZsvrK137C7ivEG2Y0oTmS6RbfRZ/4kHGFwUiXFexzbj08VEAFS94jIooN0GI9BldLf76ApiCt0DWqaXYDiennS89Po1PliWc7vwbHe83yUKqRXFTWFW21/vvlzX+O8tGvnIyvAfkL2Qq8vv9vJZ+qOHj88K+2aPvoTYf2FbVTNohylKTLXY0HrwBSGetqf9T8coqn2cGGa0AajGItioD+6DoKs/2YOZUx1HyIFi/UpIeenS/+l9cG1CC1oUszjmQOxRbVoJvAlo+eoSbPou0buPEgeZRUz7KSdkVotFMN5p13GtRHzpvwXjWHc08jdjrG6pu+aC7DnzSc0Lr+qhjaft353IR0cB+WXsmu8snPph3Gsm1s9zZdG2mecNTF3LBV4kzduST42u3bFOrhPtDj6mQ4fpaAB15NJnSoSVRU6qaBkp/daDZ4mNirVLkIt9hHEF0J0CeV6PQuxnLk=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(13003099007)(22082099003)(3023799007)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qcHdQJ4XbuiCXNHUyDNl//EhtP6j8VRKM5SXVpBb1dDRdTm9i2SYJWkq8FChi2gKgx8aEz2zjRwniSYeS6shtPRQKZja3d0zfUV91zjKIM1f4bhgsx2qYbHWbsDTfQuBfOOKhH6vR6nN/xrB4jRMr77BFpqGs3SDhYEWLckS6AJ/2uZcstycn7Qvd2TVAkSCoNJHelBmUXTF93jVzi4tJyE8HsLXG5Ka13p21N8Yt0QsyEiaD34GJ7FwK+QZNvJRAUjgx1g46Nrj2Z8U6e1lrI65C9uwNsaStSJI18lfMJGpPMciU5Fc4i33MriUwQXjnB6cBE8E7VH4B6fCMVpojDLHjCnYYBtcvIxUX9hNdNmBnX1PWx6hh+MzzYUTOzMnOPZ2b7sVnwesCpx2cBsuDTcEGKglmm3qZcN1KL0L2FKOFBNU6gcqdalTz/RiZysx
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 05:30:48.0063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bee5d7a-5305-4594-5ce8-08decc319651
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8834
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 06:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127635

From: Anton Skorup <anton@skorup.se>

CVE details: https://www.cve.org/CVERecord?id=3DCVE-2026-43895

Signed-off-by: Anton Skorup <anton.skorup@axis.com>
---
 .../jq/jq/CVE-2026-43895.patch                | 1537 +++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |    1 +
 2 files changed, 1538 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-43895.patch
new file mode 100644
index 0000000000..8b58c8e95e
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patch
@@ -0,0 +1,1537 @@
+From 9d223f153c3632a207fa071caaa6292da33ae361 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Sat, 9 May 2026 17:08:43 +0900
+Subject: [PATCH] Reject embedded NUL bytes in module import paths
+
+jq accepts embedded NUL bytes at the language level but resolves
+module import paths through NUL-terminated C strings, so the path
+validated by policy or audit code could differ from the on-disk
+path jq actually opens. Pass jv through gen_import so the AST
+preserves the original bytes, and reject embedded NULs in
+validate_relpath.
+
+Fixes CVE-2026-43895.
+
+Signed-off-by: Anton Skorup
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/9d223f153c3=
632a207fa071caaa6292da33ae361]
+---
+ src/compile.c |  12 +-
+ src/compile.h |   2 +-
+ src/linker.c  |   6 +-
+ src/parser.c  | 556 +++++++++++++++++++++++++-------------------------
+ src/parser.y  |  16 +-
+ tests/shtest  |  17 ++
+ 6 files changed, 307 insertions(+), 302 deletions(-)
+
+diff --git a/src/compile.c b/src/compile.c
+index 5e64946b3e..80b723c119 100644
+--- a/src/compile.c
++++ b/src/compile.c
+@@ -525,13 +525,17 @@ jv block_module_meta(block b) {
+   return jv_null();
+ }
+=20
+-block gen_import(const char* name, const char* as, int is_data) {
++block gen_import(jv name, jv as, int is_data) {
++  assert(jv_get_kind(name) =3D=3D JV_KIND_STRING);
++  assert(!jv_is_valid(as) || jv_get_kind(as) =3D=3D JV_KIND_STRING);
+   inst* i =3D inst_new(DEPS);
+   jv meta =3D jv_object();
+-  if (as !=3D NULL)
+-    meta =3D jv_object_set(meta, jv_string("as"), jv_string(as));
++  if (jv_is_valid(as))
++    meta =3D jv_object_set(meta, jv_string("as"), as);
++  else
++    jv_free(as);
+   meta =3D jv_object_set(meta, jv_string("is_data"), is_data ? jv_true() =
: jv_false());
+-  meta =3D jv_object_set(meta, jv_string("relpath"), jv_string(name));
++  meta =3D jv_object_set(meta, jv_string("relpath"), name);
+   i->imm.constant =3D meta;
+   return inst_block(i);
+ }
+diff --git a/src/compile.h b/src/compile.h
+index bef46328a7..d195e9e2e8 100644
+--- a/src/compile.h
++++ b/src/compile.h
+@@ -33,7 +33,7 @@ block gen_op_pushk_under(jv constant);
+=20
+ block gen_module(block metadata);
+ jv block_module_meta(block b);
+-block gen_import(const char* name, const char *as, int is_data);
++block gen_import(jv name, jv as, int is_data);
+ block gen_import_meta(block import, block metadata);
+ block gen_function(const char* name, block formals, block body);
+ block gen_param_regular(const char* name);
+diff --git a/src/linker.c b/src/linker.c
+index cfd74d1d48..e9027004cc 100644
+--- a/src/linker.c
++++ b/src/linker.c
+@@ -93,6 +93,10 @@ static jv build_lib_search_chain(jq_state *jq, jv searc=
h_path, jv jq_origin, jv
+ // in between).
+ static jv validate_relpath(jv name) {
+   const char *s =3D jv_string_value(name);
++  if (strlen(s) !=3D (size_t)jv_string_length_bytes(jv_copy(name))) {
++    jv_free(name);
++    return jv_invalid_with_msg(jv_string("Module path contains a NUL byte=
"));
++  }
+   if (strchr(s, '\\')) {
+     jv res =3D jv_invalid_with_msg(jv_string_fmt("Modules must be named b=
y relative paths using '/', not '\\' (%s)", s));
+     jv_free(name);
+@@ -425,7 +429,7 @@ int load_program(jq_state *jq, struct locfile* src, bl=
ock *out_block) {
+   jv home =3D get_home();
+   if (jv_is_valid(home)) {
+     /* Import ~/.jq as a library named "" found in $HOME or %USERPROFILE%=
 */
+-    block import =3D gen_import_meta(gen_import("", NULL, 0),
++    block import =3D gen_import_meta(gen_import(jv_string(""), jv_invalid=
(), 0),
+         gen_const(JV_OBJECT(
+             jv_string("optional"), jv_true(),
+             jv_string("search"), home)));
+diff --git a/src/parser.c b/src/parser.c
+index c90e313420..9c60173e27 100644
+--- a/src/parser.c
++++ b/src/parser.c
+@@ -937,19 +937,19 @@ static const yytype_int16 yyrline[] =3D
+      325,   328,   331,   337,   340,   343,   349,   352,   355,   358,
+      361,   364,   367,   370,   373,   376,   379,   382,   385,   388,
+      391,   394,   397,   400,   403,   406,   409,   412,   415,   421,
+-     424,   441,   450,   457,   465,   476,   481,   487,   490,   495,
+-     499,   506,   509,   515,   522,   525,   528,   534,   537,   540,
+-     546,   549,   552,   560,   564,   567,   570,   573,   576,   579,
+-     582,   585,   588,   592,   598,   601,   604,   607,   610,   613,
+-     616,   619,   622,   625,   628,   631,   634,   637,   640,   643,
+-     646,   649,   652,   655,   658,   661,   664,   671,   674,   677,
+-     680,   683,   687,   690,   694,   712,   716,   720,   723,   735,
+-     740,   741,   742,   743,   746,   749,   754,   759,   762,   767,
+-     770,   775,   779,   782,   787,   790,   795,   798,   803,   806,
+-     809,   812,   815,   818,   826,   832,   835,   838,   841,   844,
+-     847,   850,   853,   856,   859,   862,   865,   868,   871,   874,
+-     877,   880,   883,   889,   892,   895,   900,   903,   906,   909,
+-     913,   918,   922,   926,   930,   934,   942,   948,   951
++     424,   441,   445,   449,   455,   466,   471,   477,   480,   485,
++     489,   496,   499,   505,   512,   515,   518,   524,   527,   530,
++     536,   539,   542,   550,   554,   557,   560,   563,   566,   569,
++     572,   575,   578,   582,   588,   591,   594,   597,   600,   603,
++     606,   609,   612,   615,   618,   621,   624,   627,   630,   633,
++     636,   639,   642,   645,   648,   651,   654,   661,   664,   667,
++     670,   673,   677,   680,   684,   702,   706,   710,   713,   725,
++     730,   731,   732,   733,   736,   739,   744,   749,   752,   757,
++     760,   765,   769,   772,   777,   780,   785,   788,   793,   796,
++     799,   802,   805,   808,   816,   822,   825,   828,   831,   834,
++     837,   840,   843,   846,   849,   852,   855,   858,   861,   864,
++     867,   870,   873,   879,   882,   885,   890,   893,   896,   899,
++     903,   908,   912,   916,   920,   924,   932,   938,   941
+ };
+ #endif
+=20
+@@ -2841,42 +2841,32 @@ YYLTYPE yylloc =3D yyloc_default;
+   case 41: /* ImportWhat: "import" ImportFrom "as" BINDING  */
+ #line 441 "src/parser.y"
+                                  {
+-  jv v =3D block_const((yyvsp[-2].blk));
+-  // XXX Make gen_import take only blocks and the int is_data so we
+-  // don't have to free so much stuff here
+-  (yyval.blk) =3D gen_import(jv_string_value(v), jv_string_value((yyvsp[0=
].literal)), 1);
++  (yyval.blk) =3D gen_import(block_const((yyvsp[-2].blk)), (yyvsp[0].lite=
ral), 1);
+   block_free((yyvsp[-2].blk));
+-  jv_free((yyvsp[0].literal));
+-  jv_free(v);
+ }
+-#line 2853 "src/parser.c"
++#line 2848 "src/parser.c"
+     break;
+=20
+   case 42: /* ImportWhat: "import" ImportFrom "as" IDENT  */
+-#line 450 "src/parser.y"
++#line 445 "src/parser.y"
+                                {
+-  jv v =3D block_const((yyvsp[-2].blk));
+-  (yyval.blk) =3D gen_import(jv_string_value(v), jv_string_value((yyvsp[0=
].literal)), 0);
++  (yyval.blk) =3D gen_import(block_const((yyvsp[-2].blk)), (yyvsp[0].lite=
ral), 0);
+   block_free((yyvsp[-2].blk));
+-  jv_free((yyvsp[0].literal));
+-  jv_free(v);
+ }
+-#line 2865 "src/parser.c"
++#line 2857 "src/parser.c"
+     break;
+=20
+   case 43: /* ImportWhat: "include" ImportFrom  */
+-#line 457 "src/parser.y"
++#line 449 "src/parser.y"
+                      {
+-  jv v =3D block_const((yyvsp[0].blk));
+-  (yyval.blk) =3D gen_import(jv_string_value(v), NULL, 0);
++  (yyval.blk) =3D gen_import(block_const((yyvsp[0].blk)), jv_invalid(), 0=
);
+   block_free((yyvsp[0].blk));
+-  jv_free(v);
+ }
+-#line 2876 "src/parser.c"
++#line 2866 "src/parser.c"
+     break;
+=20
+   case 44: /* ImportFrom: String  */
+-#line 465 "src/parser.y"
++#line 455 "src/parser.y"
+        {
+   if (!block_is_const((yyvsp[0].blk))) {
+     FAIL((yylsp[0]), "Import path must be constant");
+@@ -2886,152 +2876,152 @@ YYLTYPE yylloc =3D yyloc_default;
+     (yyval.blk) =3D (yyvsp[0].blk);
+   }
+ }
+-#line 2890 "src/parser.c"
++#line 2880 "src/parser.c"
+     break;
+=20
+   case 45: /* FuncDef: "def" IDENT ':' Query ';'  */
+-#line 476 "src/parser.y"
++#line 466 "src/parser.y"
+                           {
+   (yyval.blk) =3D gen_function(jv_string_value((yyvsp[-3].literal)), gen_=
noop(), (yyvsp[-1].blk));
+   jv_free((yyvsp[-3].literal));
+ }
+-#line 2899 "src/parser.c"
++#line 2889 "src/parser.c"
+     break;
+=20
+   case 46: /* FuncDef: "def" IDENT '(' Params ')' ':' Query ';'  */
+-#line 481 "src/parser.y"
++#line 471 "src/parser.y"
+                                          {
+   (yyval.blk) =3D gen_function(jv_string_value((yyvsp[-6].literal)), (yyv=
sp[-4].blk), (yyvsp[-1].blk));
+   jv_free((yyvsp[-6].literal));
+ }
+-#line 2908 "src/parser.c"
++#line 2898 "src/parser.c"
+     break;
+=20
+   case 47: /* Params: Param  */
+-#line 487 "src/parser.y"
++#line 477 "src/parser.y"
+       {
+   (yyval.blk) =3D (yyvsp[0].blk);
+ }
+-#line 2916 "src/parser.c"
++#line 2906 "src/parser.c"
+     break;
+=20
+   case 48: /* Params: Params ';' Param  */
+-#line 490 "src/parser.y"
++#line 480 "src/parser.y"
+                  {
+   (yyval.blk) =3D BLOCK((yyvsp[-2].blk), (yyvsp[0].blk));
+ }
+-#line 2924 "src/parser.c"
++#line 2914 "src/parser.c"
+     break;
+=20
+   case 49: /* Param: BINDING  */
+-#line 495 "src/parser.y"
++#line 485 "src/parser.y"
+         {
+   (yyval.blk) =3D gen_param_regular(jv_string_value((yyvsp[0].literal)));
+   jv_free((yyvsp[0].literal));
+ }
+-#line 2933 "src/parser.c"
++#line 2923 "src/parser.c"
+     break;
+=20
+   case 50: /* Param: IDENT  */
+-#line 499 "src/parser.y"
++#line 489 "src/parser.y"
+       {
+   (yyval.blk) =3D gen_param(jv_string_value((yyvsp[0].literal)));
+   jv_free((yyvsp[0].literal));
+ }
+-#line 2942 "src/parser.c"
++#line 2932 "src/parser.c"
+     break;
+=20
+   case 51: /* StringStart: FORMAT QQSTRING_START  */
+-#line 506 "src/parser.y"
++#line 496 "src/parser.y"
+                       {
+   (yyval.literal) =3D (yyvsp[-1].literal);
+ }
+-#line 2950 "src/parser.c"
++#line 2940 "src/parser.c"
+     break;
+=20
+   case 52: /* StringStart: QQSTRING_START  */
+-#line 509 "src/parser.y"
++#line 499 "src/parser.y"
+                {
+   (yyval.literal) =3D jv_string("text");
+ }
+-#line 2958 "src/parser.c"
++#line 2948 "src/parser.c"
+     break;
+=20
+   case 53: /* String: StringStart QQString QQSTRING_END  */
+-#line 515 "src/parser.y"
++#line 505 "src/parser.y"
+                                   {
+   (yyval.blk) =3D (yyvsp[-1].blk);
+   jv_free((yyvsp[-2].literal));
+ }
+-#line 2967 "src/parser.c"
++#line 2957 "src/parser.c"
+     break;
+=20
+   case 54: /* QQString: %empty  */
+-#line 522 "src/parser.y"
++#line 512 "src/parser.y"
+        {
+   (yyval.blk) =3D gen_const(jv_string(""));
+ }
+-#line 2975 "src/parser.c"
++#line 2965 "src/parser.c"
+     break;
+=20
+   case 55: /* QQString: QQString QQSTRING_TEXT  */
+-#line 525 "src/parser.y"
++#line 515 "src/parser.y"
+                        {
+   (yyval.blk) =3D gen_binop((yyvsp[-1].blk), gen_const((yyvsp[0].literal)=
), '+');
+ }
+-#line 2983 "src/parser.c"
++#line 2973 "src/parser.c"
+     break;
+=20
+   case 56: /* QQString: QQString QQSTRING_INTERP_START Query QQSTRING_INT=
ERP_END  */
+-#line 528 "src/parser.y"
++#line 518 "src/parser.y"
+                                                          {
+   (yyval.blk) =3D gen_binop((yyvsp[-3].blk), gen_format((yyvsp[-1].blk), =
jv_copy((yyvsp[-4].literal))), '+');
+ }
+-#line 2991 "src/parser.c"
++#line 2981 "src/parser.c"
+     break;
+=20
+   case 57: /* ElseBody: "elif" Query "then" Query ElseBody  */
+-#line 534 "src/parser.y"
++#line 524 "src/parser.y"
+                                    {
+   (yyval.blk) =3D gen_cond((yyvsp[-3].blk), (yyvsp[-1].blk), (yyvsp[0].bl=
k));
+ }
+-#line 2999 "src/parser.c"
++#line 2989 "src/parser.c"
+     break;
+=20
+   case 58: /* ElseBody: "else" Query "end"  */
+-#line 537 "src/parser.y"
++#line 527 "src/parser.y"
+                    {
+   (yyval.blk) =3D (yyvsp[-1].blk);
+ }
+-#line 3007 "src/parser.c"
++#line 2997 "src/parser.c"
+     break;
+=20
+   case 59: /* ElseBody: "end"  */
+-#line 540 "src/parser.y"
++#line 530 "src/parser.y"
+       {
+   (yyval.blk) =3D gen_noop();
+ }
+-#line 3015 "src/parser.c"
++#line 3005 "src/parser.c"
+     break;
+=20
+   case 60: /* Term: '.'  */
+-#line 546 "src/parser.y"
++#line 536 "src/parser.y"
+     {
+   (yyval.blk) =3D gen_noop();
+ }
+-#line 3023 "src/parser.c"
++#line 3013 "src/parser.c"
+     break;
+=20
+   case 61: /* Term: ".."  */
+-#line 549 "src/parser.y"
++#line 539 "src/parser.y"
+     {
+   (yyval.blk) =3D gen_call("recurse", gen_noop());
+ }
+-#line 3031 "src/parser.c"
++#line 3021 "src/parser.c"
+     break;
+=20
+   case 62: /* Term: "break" BINDING  */
+-#line 552 "src/parser.y"
++#line 542 "src/parser.y"
+               {
+   jv v =3D jv_string_fmt("*label-%s", jv_string_value((yyvsp[0].literal))=
);     // impossible symbol
+   (yyval.blk) =3D gen_location((yyloc), locations,
+@@ -3040,279 +3030,279 @@ YYLTYPE yylloc =3D yyloc_default;
+   jv_free(v);
+   jv_free((yyvsp[0].literal));
+ }
+-#line 3044 "src/parser.c"
++#line 3034 "src/parser.c"
+     break;
+=20
+   case 63: /* Term: "break" error  */
+-#line 560 "src/parser.y"
++#line 550 "src/parser.y"
+             {
+   FAIL((yyloc), "break requires a label to break to");
+   (yyval.blk) =3D gen_noop();
+ }
+-#line 3053 "src/parser.c"
++#line 3043 "src/parser.c"
+     break;
+=20
+   case 64: /* Term: Term FIELD '?'  */
+-#line 564 "src/parser.y"
++#line 554 "src/parser.y"
+                {
+   (yyval.blk) =3D gen_index_opt((yyvsp[-2].blk), gen_const((yyvsp[-1].lit=
eral)));
+ }
+-#line 3061 "src/parser.c"
++#line 3051 "src/parser.c"
+     break;
+=20
+   case 65: /* Term: FIELD '?'  */
+-#line 567 "src/parser.y"
++#line 557 "src/parser.y"
+           {
+   (yyval.blk) =3D gen_index_opt(gen_noop(), gen_const((yyvsp[-1].literal)=
));
+ }
+-#line 3069 "src/parser.c"
++#line 3059 "src/parser.c"
+     break;
+=20
+   case 66: /* Term: Term '.' String '?'  */
+-#line 570 "src/parser.y"
++#line 560 "src/parser.y"
+                     {
+   (yyval.blk) =3D gen_index_opt((yyvsp[-3].blk), (yyvsp[-1].blk));
+ }
+-#line 3077 "src/parser.c"
++#line 3067 "src/parser.c"
+     break;
+=20
+   case 67: /* Term: '.' String '?'  */
+-#line 573 "src/parser.y"
++#line 563 "src/parser.y"
+                {
+   (yyval.blk) =3D gen_index_opt(gen_noop(), (yyvsp[-1].blk));
+ }
+-#line 3085 "src/parser.c"
++#line 3075 "src/parser.c"
+     break;
+=20
+   case 68: /* Term: Term FIELD  */
+-#line 576 "src/parser.y"
++#line 566 "src/parser.y"
+                         {
+   (yyval.blk) =3D gen_index((yyvsp[-1].blk), gen_const((yyvsp[0].literal)=
));
+ }
+-#line 3093 "src/parser.c"
++#line 3083 "src/parser.c"
+     break;
+=20
+   case 69: /* Term: FIELD  */
+-#line 579 "src/parser.y"
++#line 569 "src/parser.y"
+                    {
+   (yyval.blk) =3D gen_index(gen_noop(), gen_const((yyvsp[0].literal)));
+ }
+-#line 3101 "src/parser.c"
++#line 3091 "src/parser.c"
+     break;
+=20
+   case 70: /* Term: Term '.' String  */
+-#line 582 "src/parser.y"
++#line 572 "src/parser.y"
+                              {
+   (yyval.blk) =3D gen_index((yyvsp[-2].blk), (yyvsp[0].blk));
+ }
+-#line 3109 "src/parser.c"
++#line 3099 "src/parser.c"
+     break;
+=20
+   case 71: /* Term: '.' String  */
+-#line 585 "src/parser.y"
++#line 575 "src/parser.y"
+                         {
+   (yyval.blk) =3D gen_index(gen_noop(), (yyvsp[0].blk));
+ }
+-#line 3117 "src/parser.c"
++#line 3107 "src/parser.c"
+     break;
+=20
+   case 72: /* Term: '.' error  */
+-#line 588 "src/parser.y"
++#line 578 "src/parser.y"
+           {
+   FAIL((yyloc), "try .[\"field\"] instead of .field for unusually named f=
ields");
+   (yyval.blk) =3D gen_noop();
+ }
+-#line 3126 "src/parser.c"
++#line 3116 "src/parser.c"
+     break;
+=20
+   case 73: /* Term: '.' IDENT error  */
+-#line 592 "src/parser.y"
++#line 582 "src/parser.y"
+                 {
+   jv_free((yyvsp[-1].literal));
+   FAIL((yyloc), "try .[\"field\"] instead of .field for unusually named f=
ields");
+   (yyval.blk) =3D gen_noop();
+ }
+-#line 3136 "src/parser.c"
++#line 3126 "src/parser.c"
+     break;
+=20
+   case 74: /* Term: Term '[' Query ']' '?'  */
+-#line 598 "src/parser.y"
++#line 588 "src/parser.y"
+                        {
+   (yyval.blk) =3D gen_index_opt((yyvsp[-4].blk), (yyvsp[-2].blk));
+ }
+-#line 3144 "src/parser.c"
++#line 3134 "src/parser.c"
+     break;
+=20
+   case 75: /* Term: Term '[' Query ']'  */
+-#line 601 "src/parser.y"
++#line 591 "src/parser.y"
+                                 {
+   (yyval.blk) =3D gen_index((yyvsp[-3].blk), (yyvsp[-1].blk));
+ }
+-#line 3152 "src/parser.c"
++#line 3142 "src/parser.c"
+     break;
+=20
+   case 76: /* Term: Term '.' '[' Query ']' '?'  */
+-#line 604 "src/parser.y"
++#line 594 "src/parser.y"
+                            {
+   (yyval.blk) =3D gen_index_opt((yyvsp[-5].blk), (yyvsp[-2].blk));
+ }
+-#line 3160 "src/parser.c"
++#line 3150 "src/parser.c"
+     break;
+=20
+   case 77: /* Term: Term '.' '[' Query ']'  */
+-#line 607 "src/parser.y"
++#line 597 "src/parser.y"
+                                     {
+   (yyval.blk) =3D gen_index((yyvsp[-4].blk), (yyvsp[-1].blk));
+ }
+-#line 3168 "src/parser.c"
++#line 3158 "src/parser.c"
+     break;
+=20
+   case 78: /* Term: Term '[' ']' '?'  */
+-#line 610 "src/parser.y"
++#line 600 "src/parser.y"
+                  {
+   (yyval.blk) =3D block_join((yyvsp[-3].blk), gen_op_simple(EACH_OPT));
+ }
+-#line 3176 "src/parser.c"
++#line 3166 "src/parser.c"
+     break;
+=20
+   case 79: /* Term: Term '[' ']'  */
+-#line 613 "src/parser.y"
++#line 603 "src/parser.y"
+                           {
+   (yyval.blk) =3D block_join((yyvsp[-2].blk), gen_op_simple(EACH));
+ }
+-#line 3184 "src/parser.c"
++#line 3174 "src/parser.c"
+     break;
+=20
+   case 80: /* Term: Term '.' '[' ']' '?'  */
+-#line 616 "src/parser.y"
++#line 606 "src/parser.y"
+                      {
+   (yyval.blk) =3D block_join((yyvsp[-4].blk), gen_op_simple(EACH_OPT));
+ }
+-#line 3192 "src/parser.c"
++#line 3182 "src/parser.c"
+     break;
+=20
+   case 81: /* Term: Term '.' '[' ']'  */
+-#line 619 "src/parser.y"
++#line 609 "src/parser.y"
+                               {
+   (yyval.blk) =3D block_join((yyvsp[-3].blk), gen_op_simple(EACH));
+ }
+-#line 3200 "src/parser.c"
++#line 3190 "src/parser.c"
+     break;
+=20
+   case 82: /* Term: Term '[' Query ':' Query ']' '?'  */
+-#line 622 "src/parser.y"
++#line 612 "src/parser.y"
+                                  {
+   (yyval.blk) =3D gen_slice_index((yyvsp[-6].blk), (yyvsp[-4].blk), (yyvs=
p[-2].blk), INDEX_OPT);
+ }
+-#line 3208 "src/parser.c"
++#line 3198 "src/parser.c"
+     break;
+=20
+   case 83: /* Term: Term '[' Query ':' ']' '?'  */
+-#line 625 "src/parser.y"
++#line 615 "src/parser.y"
+                            {
+   (yyval.blk) =3D gen_slice_index((yyvsp[-5].blk), (yyvsp[-3].blk), gen_c=
onst(jv_null()), INDEX_OPT);
+ }
+-#line 3216 "src/parser.c"
++#line 3206 "src/parser.c"
+     break;
+=20
+   case 84: /* Term: Term '[' ':' Query ']' '?'  */
+-#line 628 "src/parser.y"
++#line 618 "src/parser.y"
+                            {
+   (yyval.blk) =3D gen_slice_index((yyvsp[-5].blk), gen_const(jv_null()), =
(yyvsp[-2].blk), INDEX_OPT);
+ }
+-#line 3224 "src/parser.c"
++#line 3214 "src/parser.c"
+     break;
+=20
+   case 85: /* Term: Term '[' Query ':' Query ']'  */
+-#line 631 "src/parser.y"
++#line 621 "src/parser.y"
+                                           {
+   (yyval.blk) =3D gen_slice_index((yyvsp[-5].blk), (yyvsp[-3].blk), (yyvs=
p[-1].blk), INDEX);
+ }
+-#line 3232 "src/parser.c"
++#line 3222 "src/parser.c"
+     break;
+=20
+   case 86: /* Term: Term '[' Query ':' ']'  */
+-#line 634 "src/parser.y"
++#line 624 "src/parser.y"
+                                     {
+   (yyval.blk) =3D gen_slice_index((yyvsp[-4].blk), (yyvsp[-2].blk), gen_c=
onst(jv_null()), INDEX);
+ }
+-#line 3240 "src/parser.c"
++#line 3230 "src/parser.c"
+     break;
+=20
+   case 87: /* Term: Term '[' ':' Query ']'  */
+-#line 637 "src/parser.y"
++#line 627 "src/parser.y"
+                                     {
+   (yyval.blk) =3D gen_slice_index((yyvsp[-4].blk), gen_const(jv_null()), =
(yyvsp[-1].blk), INDEX);
+ }
+-#line 3248 "src/parser.c"
++#line 3238 "src/parser.c"
+     break;
+=20
+   case 88: /* Term: Term '?'  */
+-#line 640 "src/parser.y"
++#line 630 "src/parser.y"
+          {
+   (yyval.blk) =3D gen_try((yyvsp[-1].blk), gen_op_simple(BACKTRACK));
+ }
+-#line 3256 "src/parser.c"
++#line 3246 "src/parser.c"
+     break;
+=20
+   case 89: /* Term: LITERAL  */
+-#line 643 "src/parser.y"
++#line 633 "src/parser.y"
+         {
+   (yyval.blk) =3D gen_const((yyvsp[0].literal));
+ }
+-#line 3264 "src/parser.c"
++#line 3254 "src/parser.c"
+     break;
+=20
+   case 90: /* Term: String  */
+-#line 646 "src/parser.y"
++#line 636 "src/parser.y"
+        {
+   (yyval.blk) =3D (yyvsp[0].blk);
+ }
+-#line 3272 "src/parser.c"
++#line 3262 "src/parser.c"
+     break;
+=20
+   case 91: /* Term: FORMAT  */
+-#line 649 "src/parser.y"
++#line 639 "src/parser.y"
+        {
+   (yyval.blk) =3D gen_format(gen_noop(), (yyvsp[0].literal));
+ }
+-#line 3280 "src/parser.c"
++#line 3270 "src/parser.c"
+     break;
+=20
+   case 92: /* Term: '-' Term  */
+-#line 652 "src/parser.y"
++#line 642 "src/parser.y"
+          {
+   (yyval.blk) =3D BLOCK((yyvsp[0].blk), gen_call("_negate", gen_noop()));
+ }
+-#line 3288 "src/parser.c"
++#line 3278 "src/parser.c"
+     break;
+=20
+   case 93: /* Term: '(' Query ')'  */
+-#line 655 "src/parser.y"
++#line 645 "src/parser.y"
+               {
+   (yyval.blk) =3D (yyvsp[-1].blk);
+ }
+-#line 3296 "src/parser.c"
++#line 3286 "src/parser.c"
+     break;
+=20
+   case 94: /* Term: '[' Query ']'  */
+-#line 658 "src/parser.y"
++#line 648 "src/parser.y"
+               {
+   (yyval.blk) =3D gen_collect((yyvsp[-1].blk));
+ }
+-#line 3304 "src/parser.c"
++#line 3294 "src/parser.c"
+     break;
+=20
+   case 95: /* Term: '[' ']'  */
+-#line 661 "src/parser.y"
++#line 651 "src/parser.y"
+         {
+   (yyval.blk) =3D gen_const(jv_array());
+ }
+-#line 3312 "src/parser.c"
++#line 3302 "src/parser.c"
+     break;
+=20
+   case 96: /* Term: '{' DictPairs '}'  */
+-#line 664 "src/parser.y"
++#line 654 "src/parser.y"
+                   {
+   block o =3D gen_const_object((yyvsp[-1].blk));
+   if (o.first !=3D NULL)
+@@ -3320,103 +3310,103 @@ YYLTYPE yylloc =3D yyloc_default;
+   else
+     (yyval.blk) =3D BLOCK(gen_subexp(gen_const(jv_object())), (yyvsp[-1].=
blk), gen_op_simple(POP));
+ }
+-#line 3324 "src/parser.c"
++#line 3314 "src/parser.c"
+     break;
+=20
+   case 97: /* Term: "reduce" Expr "as" Patterns '(' Query ';' Query ')'  =
*/
+-#line 671 "src/parser.y"
++#line 661 "src/parser.y"
+                                                     {
+   (yyval.blk) =3D gen_reduce((yyvsp[-7].blk), (yyvsp[-5].blk), (yyvsp[-3]=
.blk), (yyvsp[-1].blk));
+ }
+-#line 3332 "src/parser.c"
++#line 3322 "src/parser.c"
+     break;
+=20
+   case 98: /* Term: "foreach" Expr "as" Patterns '(' Query ';' Query ';' =
Query ')'  */
+-#line 674 "src/parser.y"
++#line 664 "src/parser.y"
+                                                                {
+   (yyval.blk) =3D gen_foreach((yyvsp[-9].blk), (yyvsp[-7].blk), (yyvsp[-5=
].blk), (yyvsp[-3].blk), (yyvsp[-1].blk));
+ }
+-#line 3340 "src/parser.c"
++#line 3330 "src/parser.c"
+     break;
+=20
+   case 99: /* Term: "foreach" Expr "as" Patterns '(' Query ';' Query ')' =
 */
+-#line 677 "src/parser.y"
++#line 667 "src/parser.y"
+                                                      {
+   (yyval.blk) =3D gen_foreach((yyvsp[-7].blk), (yyvsp[-5].blk), (yyvsp[-3=
].blk), (yyvsp[-1].blk), gen_noop());
+ }
+-#line 3348 "src/parser.c"
++#line 3338 "src/parser.c"
+     break;
+=20
+   case 100: /* Term: "if" Query "then" Query ElseBody  */
+-#line 680 "src/parser.y"
++#line 670 "src/parser.y"
+                                  {
+   (yyval.blk) =3D gen_cond((yyvsp[-3].blk), (yyvsp[-1].blk), (yyvsp[0].bl=
k));
+ }
+-#line 3356 "src/parser.c"
++#line 3346 "src/parser.c"
+     break;
+=20
+   case 101: /* Term: "if" Query "then" error  */
+-#line 683 "src/parser.y"
++#line 673 "src/parser.y"
+                         {
+   FAIL((yyloc), "Possibly unterminated 'if' statement");
+   (yyval.blk) =3D (yyvsp[-2].blk);
+ }
+-#line 3365 "src/parser.c"
++#line 3355 "src/parser.c"
+     break;
+=20
+   case 102: /* Term: "try" Expr "catch" Expr  */
+-#line 687 "src/parser.y"
++#line 677 "src/parser.y"
+                         {
+   (yyval.blk) =3D gen_try((yyvsp[-2].blk), (yyvsp[0].blk));
+ }
+-#line 3373 "src/parser.c"
++#line 3363 "src/parser.c"
+     break;
+=20
+   case 103: /* Term: "try" Expr "catch" error  */
+-#line 690 "src/parser.y"
++#line 680 "src/parser.y"
+                          {
+   FAIL((yyloc), "Possibly unterminated 'try' statement");
+   (yyval.blk) =3D (yyvsp[-2].blk);
+ }
+-#line 3382 "src/parser.c"
++#line 3372 "src/parser.c"
+     break;
+=20
+   case 104: /* Term: "try" Expr  */
+-#line 694 "src/parser.y"
++#line 684 "src/parser.y"
+            {
+   (yyval.blk) =3D gen_try((yyvsp[0].blk), gen_op_simple(BACKTRACK));
+ }
+-#line 3390 "src/parser.c"
++#line 3380 "src/parser.c"
+     break;
+=20
+   case 105: /* Term: '$' '$' '$' BINDING  */
+-#line 712 "src/parser.y"
++#line 702 "src/parser.y"
+                     {
+   (yyval.blk) =3D gen_location((yyloc), locations, gen_op_unbound(LOADVN,=
 jv_string_value((yyvsp[0].literal))));
+   jv_free((yyvsp[0].literal));
+ }
+-#line 3399 "src/parser.c"
++#line 3389 "src/parser.c"
+     break;
+=20
+   case 106: /* Term: BINDING  */
+-#line 716 "src/parser.y"
++#line 706 "src/parser.y"
+         {
+   (yyval.blk) =3D gen_location((yyloc), locations, gen_op_unbound(LOADV, =
jv_string_value((yyvsp[0].literal))));
+   jv_free((yyvsp[0].literal));
+ }
+-#line 3408 "src/parser.c"
++#line 3398 "src/parser.c"
+     break;
+=20
+   case 107: /* Term: "$__loc__"  */
+-#line 720 "src/parser.y"
++#line 710 "src/parser.y"
+            {
+   (yyval.blk) =3D gen_loc_object(&(yyloc), locations);
+ }
+-#line 3416 "src/parser.c"
++#line 3406 "src/parser.c"
+     break;
+=20
+   case 108: /* Term: IDENT  */
+-#line 723 "src/parser.y"
++#line 713 "src/parser.y"
+       {
+   const char *s =3D jv_string_value((yyvsp[0].literal));
+   if (strcmp(s, "false") =3D=3D 0)
+@@ -3429,198 +3419,198 @@ YYLTYPE yylloc =3D yyloc_default;
+     (yyval.blk) =3D gen_location((yyloc), locations, gen_call(s, gen_noop=
()));
+   jv_free((yyvsp[0].literal));
+ }
+-#line 3433 "src/parser.c"
++#line 3423 "src/parser.c"
+     break;
+=20
+   case 109: /* Term: IDENT '(' Args ')'  */
+-#line 735 "src/parser.y"
++#line 725 "src/parser.y"
+                    {
+   (yyval.blk) =3D gen_call(jv_string_value((yyvsp[-3].literal)), (yyvsp[-=
1].blk));
+   (yyval.blk) =3D gen_location((yylsp[-3]), locations, (yyval.blk));
+   jv_free((yyvsp[-3].literal));
+ }
+-#line 3443 "src/parser.c"
++#line 3433 "src/parser.c"
+     break;
+=20
+   case 110: /* Term: '(' error ')'  */
+-#line 740 "src/parser.y"
++#line 730 "src/parser.y"
+               { (yyval.blk) =3D gen_noop(); }
+-#line 3449 "src/parser.c"
++#line 3439 "src/parser.c"
+     break;
+=20
+   case 111: /* Term: '[' error ']'  */
+-#line 741 "src/parser.y"
++#line 731 "src/parser.y"
+               { (yyval.blk) =3D gen_noop(); }
+-#line 3455 "src/parser.c"
++#line 3445 "src/parser.c"
+     break;
+=20
+   case 112: /* Term: Term '[' error ']'  */
+-#line 742 "src/parser.y"
++#line 732 "src/parser.y"
+                    { (yyval.blk) =3D (yyvsp[-3].blk); }
+-#line 3461 "src/parser.c"
++#line 3451 "src/parser.c"
+     break;
+=20
+   case 113: /* Term: '{' error '}'  */
+-#line 743 "src/parser.y"
++#line 733 "src/parser.y"
+               { (yyval.blk) =3D gen_noop(); }
+-#line 3467 "src/parser.c"
++#line 3457 "src/parser.c"
+     break;
+=20
+   case 114: /* Args: Arg  */
+-#line 746 "src/parser.y"
++#line 736 "src/parser.y"
+     {
+   (yyval.blk) =3D (yyvsp[0].blk);
+ }
+-#line 3475 "src/parser.c"
++#line 3465 "src/parser.c"
+     break;
+=20
+   case 115: /* Args: Args ';' Arg  */
+-#line 749 "src/parser.y"
++#line 739 "src/parser.y"
+              {
+   (yyval.blk) =3D BLOCK((yyvsp[-2].blk), (yyvsp[0].blk));
+ }
+-#line 3483 "src/parser.c"
++#line 3473 "src/parser.c"
+     break;
+=20
+   case 116: /* Arg: Query  */
+-#line 754 "src/parser.y"
++#line 744 "src/parser.y"
+       {
+   (yyval.blk) =3D gen_lambda((yyvsp[0].blk));
+ }
+-#line 3491 "src/parser.c"
++#line 3481 "src/parser.c"
+     break;
+=20
+   case 117: /* RepPatterns: RepPatterns "?//" Pattern  */
+-#line 759 "src/parser.y"
++#line 749 "src/parser.y"
+                           {
+   (yyval.blk) =3D BLOCK((yyvsp[-2].blk), gen_destructure_alt((yyvsp[0].bl=
k)));
+ }
+-#line 3499 "src/parser.c"
++#line 3489 "src/parser.c"
+     break;
+=20
+   case 118: /* RepPatterns: Pattern  */
+-#line 762 "src/parser.y"
++#line 752 "src/parser.y"
+         {
+   (yyval.blk) =3D gen_destructure_alt((yyvsp[0].blk));
+ }
+-#line 3507 "src/parser.c"
++#line 3497 "src/parser.c"
+     break;
+=20
+   case 119: /* Patterns: RepPatterns "?//" Pattern  */
+-#line 767 "src/parser.y"
++#line 757 "src/parser.y"
+                           {
+   (yyval.blk) =3D BLOCK((yyvsp[-2].blk), (yyvsp[0].blk));
+ }
+-#line 3515 "src/parser.c"
++#line 3505 "src/parser.c"
+     break;
+=20
+   case 120: /* Patterns: Pattern  */
+-#line 770 "src/parser.y"
++#line 760 "src/parser.y"
+         {
+   (yyval.blk) =3D (yyvsp[0].blk);
+ }
+-#line 3523 "src/parser.c"
++#line 3513 "src/parser.c"
+     break;
+=20
+   case 121: /* Pattern: BINDING  */
+-#line 775 "src/parser.y"
++#line 765 "src/parser.y"
+         {
+   (yyval.blk) =3D gen_op_unbound(STOREV, jv_string_value((yyvsp[0].litera=
l)));
+   jv_free((yyvsp[0].literal));
+ }
+-#line 3532 "src/parser.c"
++#line 3522 "src/parser.c"
+     break;
+=20
+   case 122: /* Pattern: '[' ArrayPats ']'  */
+-#line 779 "src/parser.y"
++#line 769 "src/parser.y"
+                   {
+   (yyval.blk) =3D BLOCK((yyvsp[-1].blk), gen_op_simple(POP));
+ }
+-#line 3540 "src/parser.c"
++#line 3530 "src/parser.c"
+     break;
+=20
+   case 123: /* Pattern: '{' ObjPats '}'  */
+-#line 782 "src/parser.y"
++#line 772 "src/parser.y"
+                 {
+   (yyval.blk) =3D BLOCK((yyvsp[-1].blk), gen_op_simple(POP));
+ }
+-#line 3548 "src/parser.c"
++#line 3538 "src/parser.c"
+     break;
+=20
+   case 124: /* ArrayPats: Pattern  */
+-#line 787 "src/parser.y"
++#line 777 "src/parser.y"
+         {
+   (yyval.blk) =3D gen_array_matcher(gen_noop(), (yyvsp[0].blk));
+ }
+-#line 3556 "src/parser.c"
++#line 3546 "src/parser.c"
+     break;
+=20
+   case 125: /* ArrayPats: ArrayPats ',' Pattern  */
+-#line 790 "src/parser.y"
++#line 780 "src/parser.y"
+                       {
+   (yyval.blk) =3D gen_array_matcher((yyvsp[-2].blk), (yyvsp[0].blk));
+ }
+-#line 3564 "src/parser.c"
++#line 3554 "src/parser.c"
+     break;
+=20
+   case 126: /* ObjPats: ObjPat  */
+-#line 795 "src/parser.y"
++#line 785 "src/parser.y"
+        {
+   (yyval.blk) =3D (yyvsp[0].blk);
+ }
+-#line 3572 "src/parser.c"
++#line 3562 "src/parser.c"
+     break;
+=20
+   case 127: /* ObjPats: ObjPats ',' ObjPat  */
+-#line 798 "src/parser.y"
++#line 788 "src/parser.y"
+                    {
+   (yyval.blk) =3D BLOCK((yyvsp[-2].blk), (yyvsp[0].blk));
+ }
+-#line 3580 "src/parser.c"
++#line 3570 "src/parser.c"
+     break;
+=20
+   case 128: /* ObjPat: BINDING  */
+-#line 803 "src/parser.y"
++#line 793 "src/parser.y"
+         {
+   (yyval.blk) =3D gen_object_matcher(gen_const((yyvsp[0].literal)), gen_o=
p_unbound(STOREV, jv_string_value((yyvsp[0].literal))));
+ }
+-#line 3588 "src/parser.c"
++#line 3578 "src/parser.c"
+     break;
+=20
+   case 129: /* ObjPat: BINDING ':' Pattern  */
+-#line 806 "src/parser.y"
++#line 796 "src/parser.y"
+                     {
+   (yyval.blk) =3D gen_object_matcher(gen_const((yyvsp[-2].literal)), BLOC=
K(gen_op_simple(DUP), gen_op_unbound(STOREV, jv_string_value((yyvsp[-2].lit=
eral))), (yyvsp[0].blk)));
+ }
+-#line 3596 "src/parser.c"
++#line 3586 "src/parser.c"
+     break;
+=20
+   case 130: /* ObjPat: IDENT ':' Pattern  */
+-#line 809 "src/parser.y"
++#line 799 "src/parser.y"
+                   {
+   (yyval.blk) =3D gen_object_matcher(gen_const((yyvsp[-2].literal)), (yyv=
sp[0].blk));
+ }
+-#line 3604 "src/parser.c"
++#line 3594 "src/parser.c"
+     break;
+=20
+   case 131: /* ObjPat: Keyword ':' Pattern  */
+-#line 812 "src/parser.y"
++#line 802 "src/parser.y"
+                     {
+   (yyval.blk) =3D gen_object_matcher(gen_const((yyvsp[-2].literal)), (yyv=
sp[0].blk));
+ }
+-#line 3612 "src/parser.c"
++#line 3602 "src/parser.c"
+     break;
+=20
+   case 132: /* ObjPat: String ':' Pattern  */
+-#line 815 "src/parser.y"
++#line 805 "src/parser.y"
+                    {
+   (yyval.blk) =3D gen_object_matcher((yyvsp[-2].blk), (yyvsp[0].blk));
+ }
+-#line 3620 "src/parser.c"
++#line 3610 "src/parser.c"
+     break;
+=20
+   case 133: /* ObjPat: '(' Query ')' ':' Pattern  */
+-#line 818 "src/parser.y"
++#line 808 "src/parser.y"
+                           {
+   jv msg =3D check_object_key((yyvsp[-3].blk));
+   if (jv_is_valid(msg)) {
+@@ -3629,267 +3619,267 @@ YYLTYPE yylloc =3D yyloc_default;
+   jv_free(msg);
+   (yyval.blk) =3D gen_object_matcher((yyvsp[-3].blk), (yyvsp[0].blk));
+ }
+-#line 3633 "src/parser.c"
++#line 3623 "src/parser.c"
+     break;
+=20
+   case 134: /* ObjPat: error ':' Pattern  */
+-#line 826 "src/parser.y"
++#line 816 "src/parser.y"
+                   {
+   FAIL((yyloc), "May need parentheses around object key expression");
+   (yyval.blk) =3D (yyvsp[0].blk);
+ }
+-#line 3642 "src/parser.c"
++#line 3632 "src/parser.c"
+     break;
+=20
+   case 135: /* Keyword: "as"  */
+-#line 832 "src/parser.y"
++#line 822 "src/parser.y"
+      {
+   (yyval.literal) =3D jv_string("as");
+ }
+-#line 3650 "src/parser.c"
++#line 3640 "src/parser.c"
+     break;
+=20
+   case 136: /* Keyword: "def"  */
+-#line 835 "src/parser.y"
++#line 825 "src/parser.y"
+       {
+   (yyval.literal) =3D jv_string("def");
+ }
+-#line 3658 "src/parser.c"
++#line 3648 "src/parser.c"
+     break;
+=20
+   case 137: /* Keyword: "module"  */
+-#line 838 "src/parser.y"
++#line 828 "src/parser.y"
+          {
+   (yyval.literal) =3D jv_string("module");
+ }
+-#line 3666 "src/parser.c"
++#line 3656 "src/parser.c"
+     break;
+=20
+   case 138: /* Keyword: "import"  */
+-#line 841 "src/parser.y"
++#line 831 "src/parser.y"
+          {
+   (yyval.literal) =3D jv_string("import");
+ }
+-#line 3674 "src/parser.c"
++#line 3664 "src/parser.c"
+     break;
+=20
+   case 139: /* Keyword: "include"  */
+-#line 844 "src/parser.y"
++#line 834 "src/parser.y"
+           {
+   (yyval.literal) =3D jv_string("include");
+ }
+-#line 3682 "src/parser.c"
++#line 3672 "src/parser.c"
+     break;
+=20
+   case 140: /* Keyword: "if"  */
+-#line 847 "src/parser.y"
++#line 837 "src/parser.y"
+      {
+   (yyval.literal) =3D jv_string("if");
+ }
+-#line 3690 "src/parser.c"
++#line 3680 "src/parser.c"
+     break;
+=20
+   case 141: /* Keyword: "then"  */
+-#line 850 "src/parser.y"
++#line 840 "src/parser.y"
+        {
+   (yyval.literal) =3D jv_string("then");
+ }
+-#line 3698 "src/parser.c"
++#line 3688 "src/parser.c"
+     break;
+=20
+   case 142: /* Keyword: "else"  */
+-#line 853 "src/parser.y"
++#line 843 "src/parser.y"
+        {
+   (yyval.literal) =3D jv_string("else");
+ }
+-#line 3706 "src/parser.c"
++#line 3696 "src/parser.c"
+     break;
+=20
+   case 143: /* Keyword: "elif"  */
+-#line 856 "src/parser.y"
++#line 846 "src/parser.y"
+        {
+   (yyval.literal) =3D jv_string("elif");
+ }
+-#line 3714 "src/parser.c"
++#line 3704 "src/parser.c"
+     break;
+=20
+   case 144: /* Keyword: "reduce"  */
+-#line 859 "src/parser.y"
++#line 849 "src/parser.y"
+          {
+   (yyval.literal) =3D jv_string("reduce");
+ }
+-#line 3722 "src/parser.c"
++#line 3712 "src/parser.c"
+     break;
+=20
+   case 145: /* Keyword: "foreach"  */
+-#line 862 "src/parser.y"
++#line 852 "src/parser.y"
+           {
+   (yyval.literal) =3D jv_string("foreach");
+ }
+-#line 3730 "src/parser.c"
++#line 3720 "src/parser.c"
+     break;
+=20
+   case 146: /* Keyword: "end"  */
+-#line 865 "src/parser.y"
++#line 855 "src/parser.y"
+       {
+   (yyval.literal) =3D jv_string("end");
+ }
+-#line 3738 "src/parser.c"
++#line 3728 "src/parser.c"
+     break;
+=20
+   case 147: /* Keyword: "and"  */
+-#line 868 "src/parser.y"
++#line 858 "src/parser.y"
+       {
+   (yyval.literal) =3D jv_string("and");
+ }
+-#line 3746 "src/parser.c"
++#line 3736 "src/parser.c"
+     break;
+=20
+   case 148: /* Keyword: "or"  */
+-#line 871 "src/parser.y"
++#line 861 "src/parser.y"
+      {
+   (yyval.literal) =3D jv_string("or");
+ }
+-#line 3754 "src/parser.c"
++#line 3744 "src/parser.c"
+     break;
+=20
+   case 149: /* Keyword: "try"  */
+-#line 874 "src/parser.y"
++#line 864 "src/parser.y"
+       {
+   (yyval.literal) =3D jv_string("try");
+ }
+-#line 3762 "src/parser.c"
++#line 3752 "src/parser.c"
+     break;
+=20
+   case 150: /* Keyword: "catch"  */
+-#line 877 "src/parser.y"
++#line 867 "src/parser.y"
+         {
+   (yyval.literal) =3D jv_string("catch");
+ }
+-#line 3770 "src/parser.c"
++#line 3760 "src/parser.c"
+     break;
+=20
+   case 151: /* Keyword: "label"  */
+-#line 880 "src/parser.y"
++#line 870 "src/parser.y"
+         {
+   (yyval.literal) =3D jv_string("label");
+ }
+-#line 3778 "src/parser.c"
++#line 3768 "src/parser.c"
+     break;
+=20
+   case 152: /* Keyword: "break"  */
+-#line 883 "src/parser.y"
++#line 873 "src/parser.y"
+         {
+   (yyval.literal) =3D jv_string("break");
+ }
+-#line 3786 "src/parser.c"
++#line 3776 "src/parser.c"
+     break;
+=20
+   case 153: /* DictPairs: %empty  */
+-#line 889 "src/parser.y"
++#line 879 "src/parser.y"
+        {
+   (yyval.blk) =3D gen_noop();
+ }
+-#line 3794 "src/parser.c"
++#line 3784 "src/parser.c"
+     break;
+=20
+   case 154: /* DictPairs: DictPair  */
+-#line 892 "src/parser.y"
++#line 882 "src/parser.y"
+          {
+   (yyval.blk) =3D (yyvsp[0].blk);
+ }
+-#line 3802 "src/parser.c"
++#line 3792 "src/parser.c"
+     break;
+=20
+   case 155: /* DictPairs: DictPair ',' DictPairs  */
+-#line 895 "src/parser.y"
++#line 885 "src/parser.y"
+                        {
+   (yyval.blk) =3D block_join((yyvsp[-2].blk), (yyvsp[0].blk));
+ }
+-#line 3810 "src/parser.c"
++#line 3800 "src/parser.c"
+     break;
+=20
+   case 156: /* DictPair: IDENT ':' DictExpr  */
+-#line 900 "src/parser.y"
++#line 890 "src/parser.y"
+                    {
+   (yyval.blk) =3D gen_dictpair(gen_const((yyvsp[-2].literal)), (yyvsp[0].=
blk));
+ }
+-#line 3818 "src/parser.c"
++#line 3808 "src/parser.c"
+     break;
+=20
+   case 157: /* DictPair: Keyword ':' DictExpr  */
+-#line 903 "src/parser.y"
++#line 893 "src/parser.y"
+                      {
+   (yyval.blk) =3D gen_dictpair(gen_const((yyvsp[-2].literal)), (yyvsp[0].=
blk));
+ }
+-#line 3826 "src/parser.c"
++#line 3816 "src/parser.c"
+     break;
+=20
+   case 158: /* DictPair: String ':' DictExpr  */
+-#line 906 "src/parser.y"
++#line 896 "src/parser.y"
+                     {
+   (yyval.blk) =3D gen_dictpair((yyvsp[-2].blk), (yyvsp[0].blk));
+ }
+-#line 3834 "src/parser.c"
++#line 3824 "src/parser.c"
+     break;
+=20
+   case 159: /* DictPair: String  */
+-#line 909 "src/parser.y"
++#line 899 "src/parser.y"
+        {
+   (yyval.blk) =3D gen_dictpair((yyvsp[0].blk), BLOCK(gen_op_simple(POP), =
gen_op_simple(DUP2),
+                               gen_op_simple(DUP2), gen_op_simple(INDEX)))=
;
+ }
+-#line 3843 "src/parser.c"
++#line 3833 "src/parser.c"
+     break;
+=20
+   case 160: /* DictPair: BINDING ':' DictExpr  */
+-#line 913 "src/parser.y"
++#line 903 "src/parser.y"
+                      {
+   (yyval.blk) =3D gen_dictpair(gen_location((yyloc), locations, gen_op_un=
bound(LOADV, jv_string_value((yyvsp[-2].literal)))),
+                     (yyvsp[0].blk));
+   jv_free((yyvsp[-2].literal));
+ }
+-#line 3853 "src/parser.c"
++#line 3843 "src/parser.c"
+     break;
+=20
+   case 161: /* DictPair: BINDING  */
+-#line 918 "src/parser.y"
++#line 908 "src/parser.y"
+         {
+   (yyval.blk) =3D gen_dictpair(gen_const((yyvsp[0].literal)),
+                     gen_location((yyloc), locations, gen_op_unbound(LOADV=
, jv_string_value((yyvsp[0].literal)))));
+ }
+-#line 3862 "src/parser.c"
++#line 3852 "src/parser.c"
+     break;
+=20
+   case 162: /* DictPair: IDENT  */
+-#line 922 "src/parser.y"
++#line 912 "src/parser.y"
+       {
+   (yyval.blk) =3D gen_dictpair(gen_const(jv_copy((yyvsp[0].literal))),
+                     gen_index(gen_noop(), gen_const((yyvsp[0].literal))))=
;
+ }
+-#line 3871 "src/parser.c"
++#line 3861 "src/parser.c"
+     break;
+=20
+   case 163: /* DictPair: "$__loc__"  */
+-#line 926 "src/parser.y"
++#line 916 "src/parser.y"
+            {
+   (yyval.blk) =3D gen_dictpair(gen_const(jv_string("__loc__")),
+                     gen_loc_object(&(yyloc), locations));
+ }
+-#line 3880 "src/parser.c"
++#line 3870 "src/parser.c"
+     break;
+=20
+   case 164: /* DictPair: Keyword  */
+-#line 930 "src/parser.y"
++#line 920 "src/parser.y"
+         {
+   (yyval.blk) =3D gen_dictpair(gen_const(jv_copy((yyvsp[0].literal))),
+                     gen_index(gen_noop(), gen_const((yyvsp[0].literal))))=
;
+ }
+-#line 3889 "src/parser.c"
++#line 3879 "src/parser.c"
+     break;
+=20
+   case 165: /* DictPair: '(' Query ')' ':' DictExpr  */
+-#line 934 "src/parser.y"
++#line 924 "src/parser.y"
+                            {
+   jv msg =3D check_object_key((yyvsp[-3].blk));
+   if (jv_is_valid(msg)) {
+@@ -3898,36 +3888,36 @@ YYLTYPE yylloc =3D yyloc_default;
+   jv_free(msg);
+   (yyval.blk) =3D gen_dictpair((yyvsp[-3].blk), (yyvsp[0].blk));
+ }
+-#line 3902 "src/parser.c"
++#line 3892 "src/parser.c"
+     break;
+=20
+   case 166: /* DictPair: error ':' DictExpr  */
+-#line 942 "src/parser.y"
++#line 932 "src/parser.y"
+                    {
+   FAIL((yylsp[-2]), "May need parentheses around object key expression");
+   (yyval.blk) =3D (yyvsp[0].blk);
+ }
+-#line 3911 "src/parser.c"
++#line 3901 "src/parser.c"
+     break;
+=20
+   case 167: /* DictExpr: DictExpr '|' DictExpr  */
+-#line 948 "src/parser.y"
++#line 938 "src/parser.y"
+                       {
+   (yyval.blk) =3D block_join((yyvsp[-2].blk), (yyvsp[0].blk));
+ }
+-#line 3919 "src/parser.c"
++#line 3909 "src/parser.c"
+     break;
+=20
+   case 168: /* DictExpr: Expr  */
+-#line 951 "src/parser.y"
++#line 941 "src/parser.y"
+      {
+   (yyval.blk) =3D (yyvsp[0].blk);
+ }
+-#line 3927 "src/parser.c"
++#line 3917 "src/parser.c"
+     break;
+=20
+=20
+-#line 3931 "src/parser.c"
++#line 3921 "src/parser.c"
+=20
+       default: break;
+     }
+@@ -4156,7 +4146,7 @@ YYLTYPE yylloc =3D yyloc_default;
+   return yyresult;
+ }
+=20
+-#line 954 "src/parser.y"
++#line 944 "src/parser.y"
+=20
+=20
+ int jq_parse(struct locfile* locations, block* answer) {
+diff --git a/src/parser.y b/src/parser.y
+index 987a4ecaa3..ecd5796561 100644
+--- a/src/parser.y
++++ b/src/parser.y
+@@ -439,26 +439,16 @@ ImportWhat Query ';' {
+=20
+ ImportWhat:
+ "import" ImportFrom "as" BINDING {
+-  jv v =3D block_const($2);
+-  // XXX Make gen_import take only blocks and the int is_data so we
+-  // don't have to free so much stuff here
+-  $$ =3D gen_import(jv_string_value(v), jv_string_value($4), 1);
++  $$ =3D gen_import(block_const($2), $4, 1);
+   block_free($2);
+-  jv_free($4);
+-  jv_free(v);
+ } |
+ "import" ImportFrom "as" IDENT {
+-  jv v =3D block_const($2);
+-  $$ =3D gen_import(jv_string_value(v), jv_string_value($4), 0);
++  $$ =3D gen_import(block_const($2), $4, 0);
+   block_free($2);
+-  jv_free($4);
+-  jv_free(v);
+ } |
+ "include" ImportFrom {
+-  jv v =3D block_const($2);
+-  $$ =3D gen_import(jv_string_value(v), NULL, 0);
++  $$ =3D gen_import(block_const($2), jv_invalid(), 0);
+   block_free($2);
+-  jv_free(v);
+ }
+=20
+ ImportFrom:
+diff --git a/tests/shtest b/tests/shtest
+index 68705df255..fa972de870 100755
+--- a/tests/shtest
++++ b/tests/shtest
+@@ -893,4 +893,21 @@ if echo '42' | $JQ -f "$d/nul_prog.jq" >/dev/null 2>/=
dev/null; then
+   exit 1
+ fi
+=20
++# CVE-2026-43895: No NUL bytes in module/data import paths
++printf 'import "a\\u0000b" as $x; .' > "$d/nul_import.jq"
++if $JQ -nf "$d/nul_import.jq" >/dev/null 2>/dev/null; then
++  printf 'Error expected for import path with NUL bytes\n' 1>&2
++  exit 1
++fi
++printf 'include "a\\u0000b"; .' > "$d/nul_include.jq"
++if $JQ -nf "$d/nul_include.jq" >/dev/null 2>/dev/null; then
++  printf 'Error expected for include path with NUL bytes\n' 1>&2
++  exit 1
++fi
++printf '"a\\u0000b" | modulemeta' > "$d/nul_modulemeta.jq"
++if $JQ -nf "$d/nul_modulemeta.jq" >/dev/null 2>/dev/null; then
++  printf 'Error expected for modulemeta with NUL bytes\n' 1>&2
++  exit 1
++fi
++
+ exit 0
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index 87917b7c32..3a7850c697 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -21,6 +21,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-41256.patch \
            file://CVE-2026-41257.patch \
            file://CVE-2026-43894.patch \
+           file://CVE-2026-43895.patch \
            file://CVE-2026-43896.patch \
            file://CVE-2026-47770.patch \
            file://CVE-2026-44777.patch \
--=20
2.43.0


