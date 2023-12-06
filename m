Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD40C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 08:22:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26776.1701850958191663302
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 00:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dSigMvzl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0704540428=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B67F3XU005784
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Dec 2023 00:22:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=xRX/QbfLliurGM3KHL
	St936p7E4iPNlP0b8Bmlyuyoo=; b=dSigMvzl4k0p3j0oKMsMzZvD3K8NVPnBCV
	0WgHnn4PCaOMJFsbx5OZJWnq5tO/c/B9/vni+XGYLkBlNu1BJF0d6/VIDUxXc1/I
	8qpo8FegoHJCGDP6zNpBfz3x35URHIq7X2rKXoAoTnddm1UDSuR670DfhTuvNIN6
	PvuXkOby8t5q15JdxFCtPgkdD6cHUANnzh9SrTu75/eNjCq9Ar4QDUQ9IIgn5Cwh
	biqxkY4x24nqq9pYlsnvJdxT5kwuVbRolcH2+SRGkZcCYLtoK/jpmXm8SafKN4vD
	AGKi3hGBUkgFf+UttYLCdlSkP6jQOidM58y7WQ6/B0qhUnDGIN5Q==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd2rrahy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 00:22:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnZvTsyhVaoIvBnNdPDV4JKFGRAl+1qAVfsOINThifCeYunM3ZegSN2OgWb4b7Kt3Esl0iODsPJ0a5IBB0Jcj0HeTsJVHjzYncDXvjTBIjeZEpI420qYM+d21ixWiUpSDrqCZaX6odChqNqH3f89K5O+6gDRRQUVWYXZ+M2EIejudkA79SVi0gWO1GdHRG5YTJD7zx6hwBYUU9CP0rPFGeh455lUlIBUeie5BXaop3nS994Qpn2p/i8Zqf3R9n+ug2Wuwo8ZJOYX1ZDZ8mG8WenAV3QM77mPTd3EY/W3k2AXvzHNW8IMGBPStbP5KRPNJC5dfCAcSKfdIsu1Rvdm0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRX/QbfLliurGM3KHLSt936p7E4iPNlP0b8Bmlyuyoo=;
 b=Pbqrse+8sqR8EtIv6VcjA8bxNokMDqRzhQ9JhK0hJffdFjE/gYtyaKUH5A7dqZnwQlzQriCgg/iDkQD6qGiIHnYIfLwII9Aoc/7tyVYlIeZTciH+PAOFnM51XV2vbucg9zt/5OD/nJzfWrfliR4g5tZc2hCQCxwW9n/03Rt/GNMo2ljRE3YBCFv6INVagKJIJYB5hUEoHFfanuX4IRNXqSctHLw2zmFukEx2PBzjJnJOSWvvxMmMV17cin9FD7nBHPhV5wjzfvRUT235TZ1ZE5SSGymgFxFE8XrpzM1BzerN/hQq8TIXZRmNieGEy32Kz2xSg0sedIU6NK4U8bZM6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3397.namprd11.prod.outlook.com (2603:10b6:a03:1b::29)
 by CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 08:22:35 +0000
Received: from BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::4f9d:3b80:9e57:685e]) by BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::4f9d:3b80:9e57:685e%3]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 08:22:35 +0000
From: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Sambu, Soumya"
	<Soumya.Sambu@windriver.com>
Subject: Re: [oe][meta-oe][master][kirkstone][mickledore][PATCH 1/1] yasm: fix
 CVE-2023-37732
Thread-Topic: [oe][meta-oe][master][kirkstone][mickledore][PATCH 1/1] yasm:
 fix CVE-2023-37732
Thread-Index: AQHZ0eGvCryZupfmxEChavBLx3bRXrCclozi
Date: Wed, 6 Dec 2023 08:22:34 +0000
Message-ID: 
 <BYAPR11MB3397B520F493352F9C6E96E98184A@BYAPR11MB3397.namprd11.prod.outlook.com>
References: <177C811A47774BD7.3047@lists.openembedded.org>
In-Reply-To: <177C811A47774BD7.3047@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3397:EE_|CO1PR11MB4772:EE_
x-ms-office365-filtering-correlation-id: d933eea0-b05d-4bf8-adbe-08dbf6347fdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 u8d1z9yPgEmHb15qgAbwLgbFA3KAqxejKoIs653T9TAxJP0V4PHqXJPVNKtojx215+TeYqAGUimBgbeMOQ9TeQy2wgd3SEkZdu9fBrV6oyupTppaNciNau42AgH4uJAOULvzwCn7Gq4MtIPXIoPqrIV0QZUVN7Ef7GN9iof1C/xL0kqlDiW5CHxv79xqHclnOo1sE1gaY8FyWLWg4vgm23n65UJqJ2chY9Yn+IoWXWS+GJHGchWaVr5FIdqCeq/0Nd42Xo8i94cNP3S/v+tRo8qobo7wX7eqwAZdKdaQnWUoSHytI0WzyaGR5fZeTsRmlzMpNdFOz2kK3qRKUI/82Hfz1T94xOGVG2DwwQOYUFdKVZxs2TKlcgBTZeS7AxIIJ+BmyylAZul/skFSGfCbHwoc6hDgfJ4RMqr2zue3QVH3z+pR1B7lu6svsj5q9fobFXpVpHKZJENTo8VgasEGTDADW98+JH9xCBDZvF+b4DKou/ADWG4uRi/pugqfXPE/t5ruHdmNj7as9EFv79KEVehsSnMEj4A/UXPVcR3kr/J/oBDUvjSdtlfImBC8ZQaqe2TRWkAyB9VjSw5A7Ni3q3CJ2+07SAcXwxplpyCMMCjTMKO6kJX0RV2UPhdAf/dANca59h+uXqj5sg2x6wFlTQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(86362001)(966005)(478600001)(7696005)(9686003)(71200400001)(6506007)(64756008)(316002)(76116006)(66556008)(66476007)(66946007)(66446008)(8936002)(110136005)(8676002)(55016003)(52536014)(122000001)(38070700009)(2906002)(83380400001)(19627405001)(33656002)(166002)(5660300002)(38100700002)(26005)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?4DaUKeWDmg0LXr4/X5A2zTYIEcrTnjmGBm9xOvNT2jeAETUCyRlOHxeieMiX?=
 =?us-ascii?Q?DkoBQ9BTyZFE3rS27jj53mGQIrbCts4FkZ9o7dfRiysg+878GCJJQLNle6Ik?=
 =?us-ascii?Q?EVXdKnrR+MYInylp9ZqAWYfyIsSRRh1s2NYF1cJxgFomJUavmntS9wDoMLSh?=
 =?us-ascii?Q?MLO+63jMQqLcodMz44UrP+Kf+0CkyvCrrq/y53YNwJadHKkrvGuUGI5jJUsu?=
 =?us-ascii?Q?Tgrr8UmZDLZbziSxsO3N3Y96vcd9fXjMyg6Pa4B+YnZeYJ2uK9NVGD6byGxs?=
 =?us-ascii?Q?cewy33NRURM3iHuPvFUIY8/fWvzgubUGyd50OWEGaDHK1M0sx20FVgD4ES5s?=
 =?us-ascii?Q?AQ+ar44eL0KZ7L4+EENf3LNMv99zX9K7LlXe7YOVJF8AUc0w/ISGVvuY1Ule?=
 =?us-ascii?Q?Mj9cWTL90Ptbp/FOe3RAzu0HsP0rnypIz6JLx+FjyxfxGplESFlpIYH3lLIk?=
 =?us-ascii?Q?aLDLN3EEgliPruPLhSsunGx50TntD8g9l8dQwPubv3FonZb+joHh8G9ENtBD?=
 =?us-ascii?Q?9urlwkTRLxRgrqUP1lV3LF3yYK2ZN+UyTfC0yqUfoK3Q7ZIWcPuIUZUIMlrY?=
 =?us-ascii?Q?KLmHGwbhqbD1emWlP2AsOwklkDQRrc161evhQsQsvOrRHiwS4ub1tRtU/pEj?=
 =?us-ascii?Q?5x4RwfMLivXfHd1wZVysOg3TMQULGmw2TuvcjqQoVKuO7xLFGp4954fYF46q?=
 =?us-ascii?Q?h528Vsim/IWgekns3zyqWdylujO5Hm9Jd7PdPzjTY8LcjdzVfONsMpWYiUSG?=
 =?us-ascii?Q?es56HEiRxBWi/5uPAusw9VT4+TF4QEvip22WnJwUT8dhJaVBiPug0GuPxd0Z?=
 =?us-ascii?Q?JcQS02jhmqk8ctFIm6BD+Dkj8nPD1YLXDavnG2cQlqgSSeDjyX8/h6/DhhjZ?=
 =?us-ascii?Q?72iZ199PC1Ips4BMPHlc8SKGZgRYKWftQZWYxZdkMI7owzocUVMmgdhd3v1Q?=
 =?us-ascii?Q?nG3PSz/hZPXlPPeIwSCsfsZEWJGCD90S+fdVAY+xSk27nvyhWUJoAkkBB0zc?=
 =?us-ascii?Q?pgNLJy4BNQhTuy0PkQvBcMcxcrNn6lktHE0u6XCmY8mMJDLszfVD/kNgeiNP?=
 =?us-ascii?Q?um74j7q7Bu6VIN7xJ7JEBm8JY6oq9sM6+v45iJduph6ne2uZJs2TB6vVfHAG?=
 =?us-ascii?Q?TJkgDloa4j8m9rW/13csquI56fx9qpcOpBgqxzuAPB1++OGpSWeC+L30jFgY?=
 =?us-ascii?Q?iW1rcttJdnwOe42haKFdzNFv/uqwMdhnB+N8G0t9FFFT9KKqY3xxiFDZICVY?=
 =?us-ascii?Q?HIGcSbyrxcyFBd5txdv8bM2x28EVJeopDALteldeCQYguytJNO6UhYa1r7nb?=
 =?us-ascii?Q?1wtfnWdFnfGVTuFiBmC1RXyPyGPTQPMcL3hT3UeJ3iKftDzqOLNV5fV1oon6?=
 =?us-ascii?Q?C+z4Rqfx8AB8eNRiQg9CZjmAhuGeyDBbfj3ALXR0+HtJIAH9XDTgPdxiekTz?=
 =?us-ascii?Q?EaLeLyz1CZsBEtUi3OJlem0suTx/r57XRvi7J4SMbklR4nbTM3GusvqARp2F?=
 =?us-ascii?Q?1FU9EAXbUPwKt2R91R2eSO2ji1rjEYkFR3XVwEBCtKX64TbXpTTHJN5Giqiz?=
 =?us-ascii?Q?xly/KaziBfyDNAPhvoqX5opA3tPYDYHpIYU51JBH?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB3397B520F493352F9C6E96E98184ABYAPR11MB3397namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d933eea0-b05d-4bf8-adbe-08dbf6347fdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 08:22:34.6493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wVzbtog0lp+xxj0nc0RDFhg4YjA2xysUIyqGf+ETyvp/1FOsSEckjxLj39qRglkBJ8sGQvjXUNtbMTBOHRHVFExUBSCmThff3axweR2QxQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4772
X-Proofpoint-GUID: 8sdQxFSHYFN05ml1R8Jh1nVyT4h_gbcY
X-Proofpoint-ORIG-GUID: 8sdQxFSHYFN05ml1R8Jh1nVyT4h_gbcY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312060066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 08:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107236

--_000_BYAPR11MB3397B520F493352F9C6E96E98184ABYAPR11MB3397namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Gentle Reminder for kirkstone branch.

Regards,
Soumya
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Soumya via lists.openembedded.org <soumya.sam=
bu=3Dwindriver.com@lists.openembedded.org>
Sent: Friday, August 18, 2023 8:08 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe][meta-oe][master][kirkstone][mickledore][PATCH 1/1] yasm: fix =
CVE-2023-37732

From: Soumya <soumya.sambu@windriver.com>

Yasm v1.3.0.78 was found prone to NULL Pointer Dereference in /libyasm/intn=
um.c
and /elf/elf.c, which allows the attacker to cause a denial of service via =
a
crafted file.

References:
https://github.com/yasm/yasm/issues/233
https://nvd.nist.gov/vuln/detail/CVE-2023-37732

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 .../yasm/yasm/CVE-2023-37732.patch            | 41 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch b/meta=
-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch
new file mode 100644
index 000000000..1ca33f0a9
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch
@@ -0,0 +1,41 @@
+From 2cd3bb50e256f5ed5f611ac611d25fe673f2cec3 Mon Sep 17 00:00:00 2001
+From: Peter Johnson <johnson.peter@gmail.com>
+Date: Fri, 11 Aug 2023 10:49:51 +0000
+Subject: [PATCH] elf.c: Fix NULL deref on bad xsize expression (#234)
+
+CVE: CVE-2023-37732
+
+Upstream-Status: Backport [https://github.com/yasm/yasm/commit/2cd3bb50e25=
6f5ed5f611ac611d25fe673f2cec3]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ modules/objfmts/elf/elf.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/modules/objfmts/elf/elf.c b/modules/objfmts/elf/elf.c
+index 2486bba8..bab4c9ca 100644
+--- a/modules/objfmts/elf/elf.c
++++ b/modules/objfmts/elf/elf.c
+@@ -482,15 +482,15 @@ elf_symtab_write_to_file(FILE *f, elf_symtab_head *s=
ymtab,
+
+         /* get size (if specified); expr overrides stored integer */
+         if (entry->xsize) {
+-            size_intn =3D yasm_intnum_copy(
+-                yasm_expr_get_intnum(&entry->xsize, 1));
+-            if (!size_intn) {
++            yasm_intnum *intn =3D yasm_expr_get_intnum(&entry->xsize, 1);
++            if (!intn) {
+                 yasm_error_set(YASM_ERROR_VALUE,
+                                N_("size specifier not an integer expressi=
on"));
+                 yasm_errwarn_propagate(errwarns, entry->xsize->line);
+-            }
++            } else
++                size_intn =3D yasm_intnum_copy(intn);
+         }
+-        else
++        if (!size_intn)
+             size_intn =3D yasm_intnum_create_uint(entry->size);
+
+         /* get EQU value for constants */
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-de=
vtools/yasm/yasm_git.bb
index 19686ff27..26540b429 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -13,6 +13,7 @@ SRCREV =3D "ba463d3c26c0ece2e797b8d6381b161633b5971a"
 SRC_URI =3D "git://github.com/yasm/yasm.git;branch=3Dmaster;protocol=3Dhtt=
ps \
            file://0001-Do-not-use-AC_HEADER_STDC.patch \
            file://CVE-2023-31975.patch \
+           file://CVE-2023-37732.patch \
 "

 S =3D "${WORKDIR}/git"
--
2.40.0


--_000_BYAPR11MB3397B520F493352F9C6E96E98184ABYAPR11MB3397namp_
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
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);">Gentle Reminder for =
kirkstone branch.<br>
<br>
Regards,
<div>Soumya</div>
</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Soumya via lists.openembedded.org &lt;soumya.sambu=3Dwindriver.com=
@lists.openembedded.org&gt;<br>
<b>Sent:</b> Friday, August 18, 2023 8:08 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe][meta-oe][master][kirkstone][mickledore][PATCH 1/1] yas=
m: fix CVE-2023-37732</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Soumya &lt;soumya.sambu@windriver.com&gt;<br=
>
<br>
Yasm v1.3.0.78 was found prone to NULL Pointer Dereference in /libyasm/intn=
um.c<br>
and /elf/elf.c, which allows the attacker to cause a denial of service via =
a<br>
crafted file.<br>
<br>
References:<br>
<a href=3D"https://github.com/yasm/yasm/issues/233">https://github.com/yasm=
/yasm/issues/233</a><br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-37732">https://nvd.nis=
t.gov/vuln/detail/CVE-2023-37732</a><br>
<br>
Signed-off-by: Soumya &lt;soumya.sambu@windriver.com&gt;<br>
---<br>
&nbsp;.../yasm/yasm/CVE-2023-37732.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 41 +++++++++++++++++++<br>
&nbsp;meta-oe/recipes-devtools/yasm/yasm_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 1 +<br>
&nbsp;2 files changed, 42 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.=
patch<br>
<br>
diff --git a/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch b/meta=
-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch<br>
new file mode 100644<br>
index 000000000..1ca33f0a9<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/yasm/yasm/CVE-2023-37732.patch<br>
@@ -0,0 +1,41 @@<br>
+From 2cd3bb50e256f5ed5f611ac611d25fe673f2cec3 Mon Sep 17 00:00:00 2001<br>
+From: Peter Johnson &lt;johnson.peter@gmail.com&gt;<br>
+Date: Fri, 11 Aug 2023 10:49:51 +0000<br>
+Subject: [PATCH] elf.c: Fix NULL deref on bad xsize expression (#234)<br>
+<br>
+CVE: CVE-2023-37732<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/yasm/yasm/commit/=
2cd3bb50e256f5ed5f611ac611d25fe673f2cec3">https://github.com/yasm/yasm/comm=
it/2cd3bb50e256f5ed5f611ac611d25fe673f2cec3</a>]<br>
+<br>
+Signed-off-by: Soumya &lt;soumya.sambu@windriver.com&gt;<br>
+---<br>
+ modules/objfmts/elf/elf.c | 10 +++++-----<br>
+ 1 file changed, 5 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/modules/objfmts/elf/elf.c b/modules/objfmts/elf/elf.c<br>
+index 2486bba8..bab4c9ca 100644<br>
+--- a/modules/objfmts/elf/elf.c<br>
++++ b/modules/objfmts/elf/elf.c<br>
+@@ -482,15 +482,15 @@ elf_symtab_write_to_file(FILE *f, elf_symtab_head *s=
ymtab,<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* get size (if specified=
); expr overrides stored integer */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (entry-&gt;xsize) {<br=
>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_i=
ntn =3D yasm_intnum_copy(<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; yasm_expr_get_intnum(&amp;entry-&gt;xsize, 1));<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!s=
ize_intn) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yasm_i=
ntnum *intn =3D yasm_expr_get_intnum(&amp;entry-&gt;xsize, 1);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!i=
ntn) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; yasm_error_set(YASM_ERROR_VALUE,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; N_(&quot;size specifier not an intege=
r expression&quot;));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; yasm_errwarn_propagate(errwarns, entry-&gt;xsize-&gt=
;line);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; size_intn =3D yasm_intnum_copy(intn);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!size_intn)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
ize_intn =3D yasm_intnum_create_uint(entry-&gt;size);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* get EQU value for cons=
tants */<br>
+--<br>
+2.40.0<br>
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-de=
vtools/yasm/yasm_git.bb<br>
index 19686ff27..26540b429 100644<br>
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb<br>
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb<br>
@@ -13,6 +13,7 @@ SRCREV =3D &quot;ba463d3c26c0ece2e797b8d6381b161633b5971a=
&quot;<br>
&nbsp;SRC_URI =3D &quot;git://github.com/yasm/yasm.git;branch=3Dmaster;prot=
ocol=3Dhttps \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Do-not-use-AC_HEADER_STDC.patch">file://0001-Do-not-use-AC_=
HEADER_STDC.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-31975.patch">file://CVE-2023-31975.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-37732.patch">file://CVE-2023-37732.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR11MB3397B520F493352F9C6E96E98184ABYAPR11MB3397namp_--

