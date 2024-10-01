Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3033ACEB2FC
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 04:59:07 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.105])
 by mx.groups.io with SMTP id smtpd.web11.74360.1727758734777106992
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 21:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=RnCD5aU9;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.105, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRGNzbsnO0XVRlf/3r+97rMZUnZi28s8SLQqGmKYuoQccSG1GU6DFlosBOLiVHna5Eo0r/Ugg0gDmH6OFMKDeZ/49I7CbuR6YttW4L7FKH8MXsPcNg+Nw+lGEAle8NwOOvp0OhkEv72yFNpXGD2wC/0P089NHdJPukYPHkEdM9WINaeKoVHyF4McYsmpP8M8PicW5+G6Q7TGlNimEEB0EtUUqTJ95vjxww4tSLlaOoETQcfiZIedXMP/R+oCI219MY55BzB3F7wnJhxcamX7EzbrL5P03VOfryOuX8WlV0qDs/KfTzgsgMRiPIPk/keBQ6JJ3D83Ir7D7aOX+fg+VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqkdsCZ+7iVixScJ8oUIvIm5m88rwc+rEf4w3HF4YJU=;
 b=NS+hrZ50uEvav7D48lGg3bPoXsxlmHPbvJ1cn4Rsz3tU5U5sehHHHAG4tRvz4EIUzq2TfN3d50LwWJsSHYqZpBqpwtsxSZp0edOkvbJ1fMUUd667fvY4vi+duoq4x8tK2ZHY8NiVeUDsmj9gcacgJFT6fuE7vOmJTkpWsS6dabEvpxN0BrfjfevqsEIpfv1YFyLRpdwlQP2pFVDuGN8LYfYJgsd3BNQSqklE/sUHp7uSQIfTI0vsFuutYMcdpb5TYWj4+q6I0uzBd9Ob2YS4V5hbkEk0x6x95ydPVGz5OI+/wsq1QSRRKKXH4PzJ49EIfFM1H8s40XBqNSalG1iMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqkdsCZ+7iVixScJ8oUIvIm5m88rwc+rEf4w3HF4YJU=;
 b=RnCD5aU9WgBFEPN2YDtApfXYfziTNjTc7ru+Hnp3U1GSSvftyEwPG/vYX2GK7S+R3v03z5IJmw+D2h6GLmQSOpjFkmyMZiUdHDOuNtMNJFzj67djRDmTE4KkPRtWbRQ7yApoGSZ1hnOB0QfL/jVIanFnq63KbLBs2VoP+/2j2iHCsNyDldPmJqY6HeprY4gv8ta3WVWVwpNahZwoL62oyMJ93P9Iroa9twx87z3rv7klRDjPtZgclkgJ0aQeQQwip7w82wj/aloHDPcdUfDVVC5qMn5BaqMJYy0+0iPTZEGiG6fxKPT2bQGG/wGlZXtWLyDvNXE6Ywm3eglx1AhiRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM0PR06MB6465.eurprd06.prod.outlook.com (2603:10a6:208:198::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 04:58:51 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8026.014; Tue, 1 Oct 2024
 04:58:51 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv4 4/4] openlmi-tools: Remove obsolete recipe
Date: Tue,  1 Oct 2024 04:58:21 +0000
Message-ID: <20241001045821.103617-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241001045821.103617-1-niko.mauno@vaisala.com>
References: <20241001045821.103617-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003840.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:15) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM0PR06MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4fd4d3-97d6-481a-db8d-08dce1d5be2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Sz/gvOXNPn4IegOTuDGF9TgufHJvxrCJ3lHDUSMHurr94E8wbYC2CZzGBK4Z?=
 =?us-ascii?Q?fZ9aqa78s/E6ZrqjGqpoVDDf2iCKyHzwY2GDSf+jMimTx0J0mKeVGF5dwrHz?=
 =?us-ascii?Q?+e6jrSN3dT0mJPZOISxp33FbhpPr5opvoh5/ysRoNws1Dt356SaJPikQW7le?=
 =?us-ascii?Q?dne+AzHQXPoPEZTiso7FWedtwqVBDESnOCTDdtD+bKVH8Po8YbGo80BPC54b?=
 =?us-ascii?Q?PbWAiHbQWNq36VtgjZMjDtG0NG4Gqsl8/cvDeoCR8/KIX6cLVaJLzB32BA7x?=
 =?us-ascii?Q?nR78mn8Zh/HciswK4K4U4wRl720q2ma+AxoVl8GrhXAZLN9WQhYWjaD4Cd/7?=
 =?us-ascii?Q?4GxO+4Lj8X33gC4CTnIEF9WeuK4jAOHp8FH1K5UNCpxOt+shbJ2aUNlHSXKp?=
 =?us-ascii?Q?bgr49cNHxDhRg9Ne6cZKUoENVdIxvU2hg6/txo9bFoEg54O4hlnhvEr9wjC6?=
 =?us-ascii?Q?//nlVffOfJzDun88sfiBhYr788A7a7xAzG38LLzZSacppAvt+56r+QNtxs0b?=
 =?us-ascii?Q?uqhoJ2VQ2WdIuMJ5L/goT0HujwCnsZQU40yi0bupC0JZFYnQ6yUdD18kAu8W?=
 =?us-ascii?Q?Q2NThZs3+AsQulBhtnxEZnB0RXKUCuOTwiAG8vEjWi0cXrbVUPNW23/+Mty4?=
 =?us-ascii?Q?jbVFpzHNr4FMowF4Loa3faZthGr71t6K3+bW7eMzW3tRNntPK1EUiBa9WAeO?=
 =?us-ascii?Q?pzheleVXkQZwshNGb19mUvHX0U+VfTW7+Jq65LODexXXEhi34qTB7rxH5fRo?=
 =?us-ascii?Q?esHUuGnr9J6gjehfvif3zsca0oF9S9qu+YycFekW8cYSNJ/hCeNYtjsP4pUE?=
 =?us-ascii?Q?dntZ1gPLmhyPl1inf7FktumiFE6eY5woLuPWuLsNQQGJlrjDJL+bJ0AWnwhc?=
 =?us-ascii?Q?UL9DD+gjSiC+XyizXOCeP0gbiE6/QDDKzloAlcyf2IA0oTOn4Z6mrkR+N39r?=
 =?us-ascii?Q?x9sX38o5J8WKt8BQRrHfNlJuboihTIa62LxOrB0PhVi9RqnLzKHAGY1ocol5?=
 =?us-ascii?Q?iPAuF9NdeY3LPKpa3ncH/P31NLjTpTGjJKGaYcBhZ1WhlsS+TKXn/JjVAigl?=
 =?us-ascii?Q?M8GBQa8il0k+tQvT73SVXaAxB92F8aDK+z/1FgDiPTLuEynhlFVUXpBbPZRd?=
 =?us-ascii?Q?p948xYgxZf/MzP1fSx1n0kY/mEmRIvrKrbLQv6MvK4uvpm7S6atrOD6NXq2a?=
 =?us-ascii?Q?OSDNTjWRIU3SoiResK4XAo8c9VucfYatezS8oXBK4FZsxQJ90pmWyS9f0pGi?=
 =?us-ascii?Q?GRpW+y9p47zoXIFuLXq+0C2rrl/1Lir/gekSpqcOUA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fN5R1tcqXDZkdi3wdFv7Ry9qjocNQ6GADAx/R5xFc+78aKGhk6i4g6Pg0NH4?=
 =?us-ascii?Q?7eE5DCI5ePS2pZbJ9VW4xYagOOyKOipS1RG913yWl8E8yQ1oJE/jAQhqeon8?=
 =?us-ascii?Q?IWzwnZYewKKNss/izFZ8ZHfx7C2fW3Jd974FdNXh1JeUBXzU01mcuYi+T67s?=
 =?us-ascii?Q?8OVHo6cwA0z/8gzWcs4xZVUWhsUzjEXLM3uO+OKoHAXD8v6e0X7NJvOAbajD?=
 =?us-ascii?Q?JQxftt7dL57/ZLmnXmgnHjRIT4TxCSU/f5rgn3exsPdzrN1aGaWjER77wLO+?=
 =?us-ascii?Q?ufEqieAz6ulZRb7gmsBRc+8M7UlZ6dB0wkdyLO1kYJ8ehZOForMEXCTXo1FA?=
 =?us-ascii?Q?MRYEOJT2cvUiaeEVc+zdW16cL1BM6mnoapx99Wsy8uIvyF1Vyy3TkZ2CD4Ni?=
 =?us-ascii?Q?GpJCfE1S+sEhjZGivCoYsW7i+cuMaUOBVFnAOmvqhRLUnzbIIL0eYK07JdnV?=
 =?us-ascii?Q?CaNeQ+RyNnUFpkW9LicpjLocD7QjTbOWxN07bI7EEIGchcyWTpyTyNCNg46A?=
 =?us-ascii?Q?XW6sTosUkRNnf4hzP3srxeVLSxegsVQbQkmsX7xPymkcIYGD/lTutH4fatep?=
 =?us-ascii?Q?1Ehyzj1OO4qi2NEMtjuSw8Y1ReIEBF6BEFZJHHSurrWNg90jWyg0i22dyN1H?=
 =?us-ascii?Q?2LMVEjfbMDa6aW1AGwlH6nyp6Pl3lj4EtvF6OM0yx5wm0kvtRiuMWDetd6x8?=
 =?us-ascii?Q?uh44hW7N8lJCkoguZTOqvQ2kwGHYmI9drsdDsaMaCZ19ka8eWbhaROTxHLj+?=
 =?us-ascii?Q?poMtQy3+wcSNbGEWSQBofJ8j5Flq+kRJDbYchbNjF15DnZD4D7MM4iYQBBOD?=
 =?us-ascii?Q?CwbuwMu3PW3ClqH+THpA5lIVdyuyzxspqV8jqE927XHflOc4PUA5sglu7xz0?=
 =?us-ascii?Q?mX/3a8Ovw1I9ReUnCUDbXiIoGI4H/PH+wAP/LQpZVcTmUwuvtskahsFFNLAv?=
 =?us-ascii?Q?7esy1yaB4ZwIN44k2tUC0JU8kiI1D0KsgZ3DrxiDleOOOYsfd0uqB4GPPMi2?=
 =?us-ascii?Q?A597+4E8q8p+pTU0/v9gbVlTVRFLFQItbb+0yEZb1CN0yG00EhEVQ1ZAG0UE?=
 =?us-ascii?Q?ZGO1ukRwYH6bj/Kpd70qWQ6KyNpBIvh/97iTRDXSZD0phBP8pKnIm3yI3U0P?=
 =?us-ascii?Q?Sfrbg2wGeK77JNN9Mr2invXgwcZCajFfR6p6eNDyEu/sA2jQrA4HKa/jTnm5?=
 =?us-ascii?Q?eqRU8zUw1Z1CROY0Lud7X+1TuWw9vm6ocNeEFzwOA57UQTqnHGmvkJvzTdUc?=
 =?us-ascii?Q?pFMDAaPGzfTN6Wvz2s3l09BYOWdey7p/Im/LkZW1oYKpQdFV44Rz9xNmRivC?=
 =?us-ascii?Q?TzxRrmjAgLPpiuvFEhNaYhbphteY+wGnLtGxzboa1sj+2Jwe826FWpm72EBU?=
 =?us-ascii?Q?piHmIsEdh3HgK5AxS3aKGp6beF6rjZZIq7rRYaHc5M4ec4l2ujIhIEqIVclX?=
 =?us-ascii?Q?z1FkBR85XaX0lGDt4yvoozN9QmlUbszV5eJ35VIuSCYv0ETvt45ljouCgqWk?=
 =?us-ascii?Q?ksv5vSo7mBRDrFrGl9mCxqfXSZAYHSlKaZfGkzednRPpTgCjuNRhXXlpeZlH?=
 =?us-ascii?Q?qt3Y3uqPiLhG0mZSY0pe9iF2cHwIR345vuwAYW7DvnPYrXXltMCktnb7sUqq?=
 =?us-ascii?Q?dg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4fd4d3-97d6-481a-db8d-08dce1d5be2c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 04:58:51.5300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWgmxYvlEbIxjjiu0pD4TlYVH/RS4hpfXJkFt2skB1YwFwNIneK8zspUAQgFSXQe2U0iWs9rdANJtmfkS8Ox/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6465
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 04:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112627

This recipe depends on meta-python2, master branch of which has not
been updated sine February 2022, see
https://git.openembedded.org/meta-python2/log/?h=3Dmaster

Also, the SRC_URI address leads to fedorahosted.org retirement
announcement page, HOMEPAGE does not seem to work, and
https://pypi.org/project/openlmi-tools/ declares the programming
language as Python 2.7.

Thus, remove the obsolete recipe, along with associated packagegroup
declarations/references.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  6 ----
 .../openlmi/openlmi-tools_0.10.5.bb           | 28 -------------------
 2 files changed, 34 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.b=
b

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index b29b86d45..e5cf8ef2a 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -14,7 +14,6 @@ PACKAGES =3D "\
     packagegroup-meta-oe-dbs \
     packagegroup-meta-oe-devtools \
     packagegroup-meta-oe-extended \
-    packagegroup-meta-oe-extended-python2 \
     packagegroup-meta-oe-kernel \
     packagegroup-meta-oe-multimedia \
     packagegroup-meta-oe-navigation \
@@ -38,7 +37,6 @@ RDEPENDS:packagegroup-meta-oe =3D "\
     packagegroup-meta-oe-dbs \
     packagegroup-meta-oe-devtools \
     packagegroup-meta-oe-extended \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packagegro=
up-meta-oe-extended-python2", "", d)} \
     packagegroup-meta-oe-kernel \
     packagegroup-meta-oe-multimedia \
     packagegroup-meta-oe-navigation \
@@ -436,10 +434,6 @@ RDEPENDS:packagegroup-meta-oe-extended:remove:powerpc6=
4le =3D "upm mraa sysdig"
 RDEPENDS:packagegroup-meta-oe-extended:remove:riscv64 =3D "upm libleak mra=
a sysdig tiptop"
 RDEPENDS:packagegroup-meta-oe-extended:remove:riscv32 =3D "upm libleak mra=
a sysdig tiptop"
=20
-RDEPENDS:packagegroup-meta-oe-extended-python2 =3D"\
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", bb.utils.co=
ntains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'openlmi-tools', '', d), "",=
 d)} \
-"
-
 RDEPENDS:packagegroup-meta-oe-gnome =3D"\
     atkmm \
     gcab \
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/met=
a-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
deleted file mode 100644
index df43d25ac..000000000
--- a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY =3D "Set of CLI tools for Openlmi providers"
-DESCRIPTION =3D "openlmi-tools is a set of command line tools for Openlmi =
providers."
-HOMEPAGE =3D "http://www.openlmi.org/"
-LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3D75859989545e37968a99b631ef42=
722e"
-SECTION =3D "System/Management"
-
-inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "setupt=
ools", "", d)}
-
-SKIP_RECIPE[openlmi-tools] ?=3D "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_=
TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read http=
s://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and i=
f you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_P=
YTHON3 to "yes"', d)}"
-
-DEPENDS =3D "python-native python-pywbem-native python-m2crypto python-pyw=
bem"
-
-SRC_URI =3D "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
-          "
-SRC_URI[md5sum] =3D "e156246cb7b49753db82f4ddf7f03e50"
-SRC_URI[sha256sum] =3D "292b8f5f2250655a4add8183c529b73358bc980bd4f23cfa48=
4a940953fce9e4"
-
-S =3D "${WORKDIR}/${BP}/cli"
-
-do_configure:prepend() {
-    sed 's/@@VERSION@@/$(VERSION)/g' ${S}/setup.py.skel > ${S}/setup.py
-}
-
-python() {
-    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
-        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
-}
--=20
2.39.2


