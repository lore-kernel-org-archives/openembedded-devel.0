Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA810CF64A0
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 12:06:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.138])
 by mx.groups.io with SMTP id smtpd.web10.52670.1727697977170095918
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 05:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=yNgBFnqr;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.20.138, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWmn7jPugHAdKCxfnebk1oTSXzkF4KOsJwRSJNp5OnEeyrygRGR7jO7Aew7HoKSD6E7tQNuhRtdryAznKIapIr3MBPbsT4bxYBSs94rVB9KHbw9tybGZvkjV4V+htKuceEB81YUTg3w4Do3PsRK0vRJGx88w4CfTlA7Q4kNWneYXi/z+sjetX91Oox3gIhC5Al4z0kW4p+vjYUd/PGu22/BvScdIgNDWECMT5EgUT79sA9vGhTdE5CUA/+7xwwSvITuWQ3SRQz/h1Rbz3zU/KZaLLbmDNYlm8IIx8ssDgpW9dvwTFIClv6r6dW7nNGZYZDmHJoag7JbRpHrEZqr6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqkdsCZ+7iVixScJ8oUIvIm5m88rwc+rEf4w3HF4YJU=;
 b=PWJR5mZ13L2bZ3ItsFd30gREE0ft2S6MHUQfpi85w9OwHyS5b0W7cxalzZhvu8KbrTN0QUvIGgZTyUEdQJ893eEiwMczbw5cLog2m3KhASvrhcwYjX6GkbwDE7yzvmLPDhKNap1jmgfqKl/Kg44/qKWxnzOBXLAd0RvKXjoTTmxVYynhmXj1PIvZ9jNQ/8CataG3NLUetbtbPZdWAccEpGL138N+lZOXdNspPWHJczcLfuppLjcLchjdMCel0ZpEvchdmkxeABe6T5cECx0Zs7tuSVIbv6oq1GtHnTsFibOaemhvEPp4aWGgFjhlttKATaRyAOcOJCsUS6ZoZyM2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqkdsCZ+7iVixScJ8oUIvIm5m88rwc+rEf4w3HF4YJU=;
 b=yNgBFnqryOoVkPtWiczQnljEwQTAfcilPdc/4nAZilyc/We5TXuevb68ATNW33s8JaNpwo/CftqZSC5KYZEwh/MYfK/T+zytv/+0H9804If4/X7vLo84RiLVVQkoXv/d7ErPzm80pt3Gu9152jGFQXbBKJg8qpU88SwCguJMYFSdG6n4tLNBWlaS3tr+sIyTWGqMLWoxj1tctzbCej9tULBQYmWrvJ51EtGqFeMBhslL7wBX0VKiAkAXXoGCcScKsEbdsbwya28lLTt0/T5aGbuN91M12BUE1ZdI7reccJiyClmek0bzM3MOLxp1lz+CQG9PbwMdOPVMnYxFbWUTSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8254.eurprd06.prod.outlook.com (2603:10a6:10:2c0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Mon, 30 Sep
 2024 12:06:14 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 12:06:14 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 4/4] openlmi-tools: Remove obsolete recipe
Date: Mon, 30 Sep 2024 12:05:24 +0000
Message-ID: <20240930120524.2051403-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240930120524.2051403-1-niko.mauno@vaisala.com>
References: <20240930120524.2051403-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00014AEE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::318) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: acf7ca79-7b2e-4d67-9cb9-08dce14847bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WCwbEWr6UZzfcalKOq+2NBjqOWn0GgPaMSiv/0r6tHM4CakNUBZqr/qXkPqg?=
 =?us-ascii?Q?3N+N+iMT9uClYWCIAizLAkYMjl+ghx6EuaLOyx0O/9AAVy0QOIfXLUzNsGct?=
 =?us-ascii?Q?xlcfSDyF078++QTuVL4rfEsERjMoAul2hXms0UOFDJSE6hNEXGsfugnL1PqR?=
 =?us-ascii?Q?x8H0O5h30qNY9f8YS1kckG51Wo9Kl5luSeeQnPu20/EHa4GC5pm3J3IUvuOU?=
 =?us-ascii?Q?3kRS0BQDk9bw8sqrBM34i4ra7l7trPTE4WTRjHs28n+FrfKYXff1zpnAkMkL?=
 =?us-ascii?Q?YOjoYuWgWLHrySASdGZDwNf/++/aZGtIkfPhLQg+WST5smmF+pz5CoPjP9ll?=
 =?us-ascii?Q?Vnz+2c7ArMIZoWCtFs2/WXTsIwN36ewInYg/5XSR5KmHBhM2GrUemudHC21G?=
 =?us-ascii?Q?GPteoR56yM7n0JlMpCQVgjw7y8Lwrfx4t9qRnetBfhNUEbwNcH86fG3mhPul?=
 =?us-ascii?Q?GusLGE1PptMrmt6k8Ge/izMYpm37XG/vfovrqQSqRV4M7Mlfp8yxnN9D6a6I?=
 =?us-ascii?Q?04/pan+WDXT0ubA4vm+myvNSAwDOrTCsd/0wh3xRck9GHKmBjMmeqJNPEeFl?=
 =?us-ascii?Q?dZI9DdPf2wYNSjhDQp5gsEEb7NQ1aqYtN2DthEW+ffRO8AM0SL1/fv8dpY7F?=
 =?us-ascii?Q?OTkv7fB7puP++9rvA0T01zJsHqDei3INN0LOF57OYQHpEEkvJwzUOvKLsH77?=
 =?us-ascii?Q?32uReDhrd1mTQp9rGbDmWPruSlH8wCuTP7HVPHqJc6K2ZVHoKwNc7ttIWErA?=
 =?us-ascii?Q?ocACEsqc7ZsZBht0glWluR1pexiGAn5sJawzzXeK+qDomqgpOgn5gnXCHcyX?=
 =?us-ascii?Q?1OvUXXuTfgw5/IZHfYMZS48aTyi2vikWaIywcuEIEcGnuLpptgi3IWdKd16m?=
 =?us-ascii?Q?cjc/fCpVTSkyQ2D/TvEeIjZQwlHSTg6aQwlyO+RfIzkAhXnl9e1htK28VI8p?=
 =?us-ascii?Q?765H9gmvLiCdZ/IgtcT7UZ8ANXOFOUWq7VFGu8q9V1Z2V2+fYHju7TXHa7M2?=
 =?us-ascii?Q?oVEDy4Gsy/FFSCbnGGe5BJ8UGTSoB+PYsjBCSkEXHBhqWiRMjgcpYeiUcc0C?=
 =?us-ascii?Q?x3DnDA6y6j5nyVD9LSt+MSajRn+4cqbVepfgiQHtGI0CoYQhNP8iD2yeeG3Q?=
 =?us-ascii?Q?8n1PfPHCxg+VT28KLdjN0UfMSEb9SetIzKoEyrmYSvBssCD/8FQw4lFGqOrW?=
 =?us-ascii?Q?J5xa24zO9fs6DwZJN/rkvh+MGAKSpMFB6CoXntZES8ORR4bgPYJLn57RYznH?=
 =?us-ascii?Q?8K1zpiYv9YlomVIqJ3E16Y1wuxmrYnem5xb8/RwpcFm85Jv4ZsUbPw3IwXC0?=
 =?us-ascii?Q?E74Bi5ZO1lt7se9Rw/ot04+h63pX4S8t53SVZ1kq8TOEnBoD57iw9Soi9bei?=
 =?us-ascii?Q?ESfAeDU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b/bFtsppZrMY+CWLKCIJySaUxAPqkOg9J60WgR+KWhVuRPIFKy0j71UZsv1V?=
 =?us-ascii?Q?rxkNUWzH2dLPoe/N6tfNr9z8r6gumWrW8TxyuV41rq0OFrDHgOrbjy6ECdqb?=
 =?us-ascii?Q?6ABSiG29UNDqFqYlaLbZTy4DJTzDJDSkir2hGJf0HY4v7p+zjEpGzsSlV+xx?=
 =?us-ascii?Q?h+58d0VEOgtqZ4eUT4M4utf64s3prAgZnt4fNQfgY931XneWQxLN/SeV8AKg?=
 =?us-ascii?Q?iFIzaYPkXp8J3VyXFP6N7x5HA6YSK7HVp41IHG12aLwi7WAdowTJfxdxwbTt?=
 =?us-ascii?Q?tC5R/dg7K9vkNWxOvh5XjCTBfGI9mRZashm9rbs52KN7Wt7Z3jy3mvv9jVOi?=
 =?us-ascii?Q?1hiAGSsoz28bGbNtKsAjlpTI8qSNsQhxNy4erjLuDjBmNlgk9OHmGoMI/gVv?=
 =?us-ascii?Q?G6tJN7H1Ubh161ySO/TJqpwDkq7g4xZl7fB6QrRr0NJ+2gtsnZa4ZIu/QnCx?=
 =?us-ascii?Q?BvuT0oDz3XvXZ4A00SW/QlrIT4Z1SEKM5KBW//7yRbe62x8+4PCNWHK3sA7x?=
 =?us-ascii?Q?fTZr6iSmbvT5Gx8WBwZzQzSXek8V4vEmsoVx95njVWh/OXfldHzOo/ETwyPY?=
 =?us-ascii?Q?EunBB76BgckW3E52qjUclbzLpGRdskWLhKcqPv2QDswsmft/HVi1ShUebB3y?=
 =?us-ascii?Q?orxDa1umhuA6aztmwamE8ssQW3tB5K66GsrYIsTCwPJVsZCPA3ttxAyxmX/W?=
 =?us-ascii?Q?aQLvLyAghFQhoxLhWev1wgP5NVKDvtTAenr02s1FAt2wjayozT/ViEIdq+SQ?=
 =?us-ascii?Q?nUkb9o5T2ijLOoRH5+khIrujjRDMG99O2ZCxAav/alt3fuQoXkqGXUsA+Jlf?=
 =?us-ascii?Q?HLkYKMZlujnpXtneH49nlhZ/J9dx4YDdqsU7UY1brwKmVgkO8570gd2bjxDZ?=
 =?us-ascii?Q?Q/mij25X6whyeTPfrgYpL2tivmBFia1wwiedHy15fLzg9sTOW++gtrd0bc7O?=
 =?us-ascii?Q?dLKUik5TX49NWxVCrIKcjT+kbs7LMvqfRwpK3DGPJ4d4Ta86j+FHdnKXiEkQ?=
 =?us-ascii?Q?XeV4AgHkrXgX0ml0KKK/KmqAyYIVzCUsRU1/Ff4VELY3i71EV3nRd29idFwD?=
 =?us-ascii?Q?ampefIUkokp6qUv9g6+1tCEql7dr43JAlmhmalsbJeJDljAZrk9mPpLbaqZB?=
 =?us-ascii?Q?IDXUvtJKamqWkZM6jQB9j5/g7bZ0SOtREoEjfaWomvI9Lvd9T/yQl9YxshnI?=
 =?us-ascii?Q?ntg84aGx/iGP0CBdQ5mMP4WqopXLtJvg7By+kKem1956d1DkUD13V27sGJAi?=
 =?us-ascii?Q?I2hDh1FLuXe9vN7NQ4y+203fNI8IkE6n15YplKrCKgD5MlpelLvj1OB9E2+j?=
 =?us-ascii?Q?P0SBa4SmXsARdFFIQhnu28vwSGgGpouv8XBySR/LD3IExHOwV2tqmIwD/euW?=
 =?us-ascii?Q?V8t17T32LRUZCBkm6di8+h/0QIdXGFxXgXgRNzrUXsCTW2t2CG07bltpd01G?=
 =?us-ascii?Q?WyYYyg9zFIhoG0onCPcUt/IzeqtdtPxcJ3AYUrYFUvVPQq32o1/eEmjasZtZ?=
 =?us-ascii?Q?UX3vG/epJZZoiGaud2N4+qpDkVN6jTwgcI0a8gqaox1bKgmVzMgGPcnVLEJx?=
 =?us-ascii?Q?LB19CYl0f9xyfxL6VYfyS8FYEVzSQpC34tLyJLt3CFA6Esd+rfzzLaGh+H4n?=
 =?us-ascii?Q?0g=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf7ca79-7b2e-4d67-9cb9-08dce14847bb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 12:06:13.8076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/3gzvEoQdKOmXU5u+UkSuotrzz1IKlJdvt881GjEMo3csWXJ1KfFdwW9apQ24JJg2vuJv4ZXgyid4gIN1cfAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8254
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 12:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112604

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


