Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC438CE8372
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:26:22 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.106])
 by mx.groups.io with SMTP id smtpd.web10.59036.1727713570740389019
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 09:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=ysVAuJ/M;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.106, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrFGOpB+r6GUs72u14vyc1bkrlHC9lWJ+ahNKwMHr3Q4fdMNWfd8r+HrxYlIid0ueSjrYyJbPTsvStbbXh7FuMSJ/P3RlKumN2KEAf5UCiCIAXnU5AST54UW6FXZU9JzEsU5iR+4j55rDtO4haYMpjt7oIwggflED7jrCgTrR5OqE0EXTb26HQvWwwHtxRl9Q6C9EHj+hCNQ0hbodOLZRgYIIBbX3+KSx27VtupgJKozNbcntys0H0H4hbt8TWJyJJyzCe/IEd6kDSJ4KC7uerrZ49zadUps+pWzTdLduYltAwkBf42QNUs05NcBVBrSpLyozZ5gmeFIwduZEu3+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqkdsCZ+7iVixScJ8oUIvIm5m88rwc+rEf4w3HF4YJU=;
 b=olbIqBWHkwuUIY5Ql/EueNQv9eGuiWgG8cLaWedz3SDXRKgpTuw86ngOGbH+6bJ0hU38ux8ww7fpo8/TgGypqL73KbPQVIo055v6h2DbMoOSuyZaPVNInAjIw0fmwg7hISDTFe0WYV3ARqGiHkVvz1qkuqhU5abvPNT3ZSFDAyGQAnyb6KH50sykpAbX72bgheebN0QBs299Scl5Yik0RDdilOdhQVHk6lfHxnLUmhgvvIJ7x6sbRRaboUpcpH4Kq4kTcepGcaAkJoes+GO7wjZ+xWvkqbFbkV261ZFwsOhnYcT9tzFgtJX9sXUAvImc45j/gCFLl0AfGc3VXvJrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqkdsCZ+7iVixScJ8oUIvIm5m88rwc+rEf4w3HF4YJU=;
 b=ysVAuJ/M2Sm8Dfgqbw5CUik87c6laZQOgTSk0u+bT4zTUWR3BCp4JZrOmHzCXOU/zpJ88gVBiMGio0jmLYU3upU6QiMdWzoPWUT6zI4+CpXYvbkq7cKzUa4G6h87iz6TUgl0jRSCLW/2dCjQ60IsKsOLuP+D8m14rSPVt1fSMxK9iztzG6I2axHx+uU7tEY54t5HPq391YijvpgAlC+tOZtlZPY0zWLaj9E3u/Cj8HBAcY2WImRWPpiG/c6ZBjdcaP+7VeoyI4YXZCdLpgzLanlm6p7zCUE0NauxllULmiJ6AcpEQ0GL9okM0RMC0+Xdjw+C8ZuCqSsBoFh80BG7Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB8PR06MB6426.eurprd06.prod.outlook.com (2603:10a6:10:12a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 16:26:06 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 16:26:06 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv2 4/4] openlmi-tools: Remove obsolete recipe
Date: Mon, 30 Sep 2024 16:25:32 +0000
Message-ID: <20240930162532.4064184-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240930162532.4064184-1-niko.mauno@vaisala.com>
References: <20240930162532.4064184-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR05CA0083.eurprd05.prod.outlook.com
 (2603:10a6:208:136::23) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB8PR06MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 0863da98-1fa1-4c7d-95b1-08dce16c95e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G0fklutEnp1TTuOA7TaLC64pXZMDuM9D2wU1aAmASQmC93xkMClCXTKBFZfC?=
 =?us-ascii?Q?mPaXx5xDPsdXRax96Q3qXoEjB8mBoYZ7NO1xrtDJDt7dITGv2AQosiU1YgCT?=
 =?us-ascii?Q?iaHBiRZPehDWVGbc0qFzjNio8ojtQ+qacZQjfil5khSEgHVCfdj5UZHLoMto?=
 =?us-ascii?Q?/8sxAmjLtBUJoi+vlW3DOsm4E9sNSxrQSso3Ywfdb0jjVVYKfj8E7w7KaWL3?=
 =?us-ascii?Q?oy0Waa2boTPeT0o2Ipd7YoNvIek4/SKTZ7qRyHUP24eaSacw1TQ5sqUHWJTs?=
 =?us-ascii?Q?o/4DCruSvv9+bnPfBXksPwimU9FUrAou+O6GKeP26R/hCgx6cdaHzCibKoyP?=
 =?us-ascii?Q?49oo6DAx9EzCerxgzkal0vquEITr13lxXD9CGpyYRo5p9VyC/pXvaoFzX5oV?=
 =?us-ascii?Q?bO7iK0uuk8+trxso02E6pT7QZ3dWSC5TOtevrtbg19qtO1PfWa+R6TSUQqzm?=
 =?us-ascii?Q?oCbr6aUd8Lm/9GtcnnPCEf6SnEdgE974kdaJQ4UtRhBIy+bSiOmh66494kGd?=
 =?us-ascii?Q?vl3UujzfnElqgnWhGPR96lHUuMdHYtReR7pc8ahV9sMglC4MPTSU5jdXTKKi?=
 =?us-ascii?Q?KdGYxKFklI3ul7ZVQ7jP3dhZf7QooAyv5MU7I3aF/TS4s+f0f90iHz3bL3fK?=
 =?us-ascii?Q?7cYKxAGZ16wqq4FuwhWr0rnaEwLG4Fm16vscVk5KkYM97pibC9/EdSWzcY+S?=
 =?us-ascii?Q?xwvI+5o1m1eCZkhbZjCo8V23dD7C+XYaaFRuT61i9NNAFMeinG0KO3bhhWsN?=
 =?us-ascii?Q?tDMmnNtXYvvEkuLwgl0KhpFc/Jsd+L1h9/ezRlNsAFvsFKus3zVgja4WHCtw?=
 =?us-ascii?Q?cRICwRcRWTu1DuO9YX0XUmYnx42P5gfLEzCjIZ9tpYKdDDDbDQ/pbEj5uAtn?=
 =?us-ascii?Q?HPajjpAQQC3ki1hEXqR4cU6lqmEc6mr9k/kZDsEbBUp+e9YN5EykeatkRMlY?=
 =?us-ascii?Q?1O3O0r0kJPH9Y4zjJqrAGWB9OgAnLxBIMEFYkOxqC8dR1MP9ON7izkYieUSM?=
 =?us-ascii?Q?xqAFH0fZAtfvBMIbqCYz6kwBocArlWVptThhfiAV0KKhG2MWiBwnDIjd2GeE?=
 =?us-ascii?Q?nAqHu5nHRoX3aKO+bZYstzDbK7CPVzocWBOG3y7U3kMX31Lh4XbSRvmo09VM?=
 =?us-ascii?Q?0fZibqngGXIbeDhGxTInWJM5yfquQp0lgFI7UsbeR+JM+dP5XeTesZCinteE?=
 =?us-ascii?Q?EBlROxWPmyV2cWK+MFIu58Q1L0X5hJcpB6DGYmdGMJ5Bk/q+mPJ3Qez0m3KZ?=
 =?us-ascii?Q?ZZe6EHFxktzvQDAGwq5/h8mVdxaFDTWm5+i5UdGM8A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RQcD5Pj6agEpjD8dPs+EXiTrdNV1ioMpFxNMu4VpumnJMB+5EeaIPpOI0Igd?=
 =?us-ascii?Q?yXdIK7y6xRRtnJu6Vbn/j0gfDHIGvHzTh7gySxREQFTyog8lBfrwtfEgQjaT?=
 =?us-ascii?Q?MTEI0EPh3avHpF6G9Uu04d3swqVw7972L2YsnwUVcVAGnw3fZhSMDV45FLsg?=
 =?us-ascii?Q?2xgzcO0W9r8gp96rk57VEYl6BEsmrM4xAA+RDi/tAdrU2qYKAD//w3Xy/7Th?=
 =?us-ascii?Q?/in5HL1NtPrfDvglTTGhM/jHqDlxm9E3tFVDlV1RMdcfY+28VdeEZAYgPMdh?=
 =?us-ascii?Q?TSeHBu03R1Bf6M0KG05GFpgXRFpK8pgoipqjnyqflac7oENn4E/qkwuTiqJQ?=
 =?us-ascii?Q?o2MLa42IpLM16sB2Rx81uSeDf9sblQ6wfAOsaEeKsXHejAmHwKq4cIWchOwU?=
 =?us-ascii?Q?mlFsSSGoZm88QSvu8vjyn86UNmJTgmscc/yUbdlyyxunUSZaLB2gzB7GDF5U?=
 =?us-ascii?Q?VaO7GG8GAfGlnuPn7c+HyqwMRQLtJ0ctYHkEFjndJEwGiRsHGuYueYqI+6pq?=
 =?us-ascii?Q?0ZWKIzqaWXNg1MxZ+nk6Giofw6AXsfDGZaKD7avjebpTMqlXEkq4misnsYi1?=
 =?us-ascii?Q?t/m6MkKEBqZ0hx4lLFx8cl+cHgu8RU/0zg+x70ecUMU8rAM1dKTmNPEbU9dL?=
 =?us-ascii?Q?p6gwYO/f53uO1iic31RMz6kTdfAwW9Fr/MojSmQkJLK0+5xtALsZXKwAa2B6?=
 =?us-ascii?Q?oL9qHEHbuJ0Rsq/9T1grjiVp1o9Zbpm87HRsomFnKvqhaMGp3J5melp2o3cr?=
 =?us-ascii?Q?wbJ1Tcq58OiUbcFyslfW59OPo40cEx36dsy4p3pe+rRzkqdvN07XbjAOxaUW?=
 =?us-ascii?Q?xViI4EyOMmd015PYa3CLY+ASchquo7RTch6ib9rODfYfuFLZTbco0iZaTun4?=
 =?us-ascii?Q?PYL9vhrPfu8UztyN887f/5CXZ0+zFc+gbmteaz1BiPV4s36Hn+Z93CWvsXQ1?=
 =?us-ascii?Q?v/dxSSd87DyTPHrx0hM1bXtixOdNTxfN0XIsemUF68hqreBUaIBqodiwSnIe?=
 =?us-ascii?Q?DZOF3hVRiZ9jsZjuqCQvn4AGwuKWSPYf0vLtc7vSE2UymqWFRvMvPbO2ooaz?=
 =?us-ascii?Q?DhoW59EJ/zQj6vTtQ0lHwWVZyZQDoToPQDunfJrHrJ/3WkrcFuF8xKHMAIxu?=
 =?us-ascii?Q?4jE81rPG4+JFZcYGVojjkWly/od71VgMNJQ8sjkJi1RfI8k4wmbd9RkfYYEY?=
 =?us-ascii?Q?XpTiM4eC06EqkZB/h8sTMQhLUVudDsWj1+f/aeR3UeI7lTDkOe0vqm28YNPw?=
 =?us-ascii?Q?af46+48tFkWMj+4sWWLlcyiw4wc94CXp3MO+6+yNpOTrsO86vwKxRHcU9RFA?=
 =?us-ascii?Q?nH6K9+a7v0kPQXMBCqSKOLJ6GLw5pbFTHNKB8/ALHUl276sjmgHQSuTAcoPw?=
 =?us-ascii?Q?rMsiF5K6J7IRg0pdSYQwQoflxuvdA/AWUFvqXaAUnlwp2ugbGL6d0k27fCET?=
 =?us-ascii?Q?ipqVYmyNSU5CdL4jRN1TeIIOaaHwt1naBYASzTYwDn/DWLYawI1Iw1bMaQtk?=
 =?us-ascii?Q?JTKsRAVQQa0uUmEkxHxa5ABXarAIYKu9qp2qOii/dnKEKrBTIETglTVRrwzk?=
 =?us-ascii?Q?en21gpGmkCNb59gDrBjvj8hqZ3Agl9jCk9G0wTGDiBjPy6iJBif1PuGzX3zD?=
 =?us-ascii?Q?aw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0863da98-1fa1-4c7d-95b1-08dce16c95e8
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 16:26:06.8415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UK9xxkaPaJCMB0YSb3lOxwCR+Z67LQV3vGEf6ji5hS3/8CGAYrhgTDJ1dTHZBG9KYf0VtBBKW06WSsnPfnUMXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6426
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112612

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


