Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D650DCEB2EF
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 04:25:06 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.128])
 by mx.groups.io with SMTP id smtpd.web11.73994.1727756701186100776
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 21:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=ETjruDQE;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.128, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5O1B4zGBPHxEDzvGMC7eXioi3cY9ynTGUi+gH/BwqPp8spXgPULa/z+Dcp7hbCJMeQo35FQOnHQByg8BqesvCoYftLNUHH8ehA5gbY1EfPpJSOp33qVpDemcMRnAgwJ+536jyL6sEp3b03riRzxsAQBnjOHPgRdzjJDdhpHP8Ikgvd9sXqPa9qKN/I8GMNhyWMHWECWSioiEw00/oojo+yGQ7QkrB6bL5dsOI5PCZRd15X5y7mOnhn3GqzslZe398/c32zBXG+sb95W0eAcJogxfLlHQzWZ+4FxLXuo+EikZ79ml7FsBILhz9J+qdFdM2wXGcTFPGUW2tOxgJZaQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqkdsCZ+7iVixScJ8oUIvIm5m88rwc+rEf4w3HF4YJU=;
 b=Ts5OL4HvfZPH61zF+RcMEmylr8lG3YjMYub4vWHDaaH0wOV8mFxhyM/a7Gx3jE1KCzaVvWMyPRUW+j4/apNlwR5MxzBUPRYzyEcJ//GpwasSDiPVU1xJSc5T0/zEk+3eA9d/CaLezC6b8mPwRIL+1coSyPhLkDrdx47mQ97/y+hTI+905D5IbiKklkpzoDx+k/exwr+L/Lg21vojknJLpeaW4DCmJ8g8IB6kWw/fC8Hainwzt0if7bnfU1UvujirC5X+C/K16EM/IfPVYXfXO7jlFlG0i6eJcTL9OR+G48aNFxVsVOTY8YL7vJ+PZwQLpbazBWQhjYqRyWoCCRQ9uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqkdsCZ+7iVixScJ8oUIvIm5m88rwc+rEf4w3HF4YJU=;
 b=ETjruDQEEyL5czVKBL3Sya9w+851wf/s+uOjYK+UM1BPfx90qprm11kfSxbWJsEUnB+AsyTkQZ3Cud+2POjB72y+pNF2t9k79dFwNM5FTITB29m3ygK9W7RrzLZiphqH9rHLbgYrRRuh3TuNkAZ34Q+82ZO3tybt+SLic9V/cLqRwwm8I4FMY6zTiCb8YcNpY1iyTcoYMQfZgBRj9GAE0egiQxRMzQn7tLmi8eRB/rxMqq/vYb+VkcY8DiL61Ca7Uy2SzRVsTxSve0QGnalZeDzduEedExNOjObfkHw4K0YPQTMQkXyLTL3E2hu63Hcsw4a6hLso+CW6msZP7z8OGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by VI2PR06MB9500.eurprd06.prod.outlook.com (2603:10a6:800:223::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 04:24:58 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%4]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 04:24:58 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv3 4/4] openlmi-tools: Remove obsolete recipe
Date: Tue,  1 Oct 2024 04:24:29 +0000
Message-ID: <20241001042429.3651-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241001042429.3651-1-niko.mauno@vaisala.com>
References: <20241001042429.3651-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0000384A.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:8) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|VI2PR06MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6f9a5b-4bc8-4add-6098-08dce1d1025b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EygpOxdqdD4jMgBSnuGZF/fY1oM0yQdC+YFMZt/bFvAZnwv2yPXXk7yJGMhX?=
 =?us-ascii?Q?UoOuWiQ4TWPFr8UnltjQi2w25dHVLcIwmzt4uo4gu77k9ZyDDAs9341BUCBV?=
 =?us-ascii?Q?8MBzICogCo2kw9MJlI9ed8JJgXr+3mv1TySWxg8WXjIOiSXat9N0abQfQG1B?=
 =?us-ascii?Q?NVx0etsdCmmuDGodBAEYpd9UvXK0yy1GwpTTlhTLh8tY13FCiWM2OoGDyPfw?=
 =?us-ascii?Q?16ADEmYtAMIyP1QPBaOFh3imHvy9Fn0frJcRMwdm7RNb8xPWKQLFG1GlhQXr?=
 =?us-ascii?Q?bUkqw9jq+CKk/IOtcjqSrJQAt1dpGjJS20Y45fl9POYiSA8gkw0CT39DqPDa?=
 =?us-ascii?Q?fvQP91StKRsFMdzsDsXwFrzPUcHBzAXnpGqK2LwEUbsG+L6gm7d8Ff08UU0q?=
 =?us-ascii?Q?D8HKMey1XH36ymM5+eyKyfn7PocwvanJAqyjdUTzCHYRxjoKqEQoX9o6yxbD?=
 =?us-ascii?Q?VGj2MgmwuinGCpsuAl7xTkGviLCl7bAixlqCH5LLfq5jfEqf3l9MTNVjGAmR?=
 =?us-ascii?Q?a6mX6UT77YYfV8JWbE7nueE3qiUfMpJW9xtvP67/fPrzI2LO9IBHigMLnoGK?=
 =?us-ascii?Q?CrPzVQPFzr66lIexKysRNSrh0nKx8S/vvuJ9TZrY34gCFO/hQLxwy7Z1p+CB?=
 =?us-ascii?Q?E/xuJVTAu5ub750AjYX2UjNnRha5kocsUaBogiDA3KGVERo2yC2KHS64NKVf?=
 =?us-ascii?Q?rqZsbBAh0zG1NjrVjoxH9ePXDWxh5wjOVXjWUeCUcu3i8VZPPE8FvBKHRxxZ?=
 =?us-ascii?Q?2wh3JdmCdwpwQS/6sRPh1jnEWhrR/4uzsPPXTLhQ3mcMzNZ7YIgTzyT2xDqb?=
 =?us-ascii?Q?0biAkDb+04L53vqxUXsR66sUgFeC42ncsBptDzUwD31bH+95+uNH8SS30XHo?=
 =?us-ascii?Q?5c8TokRUwdT1xshSo68ks+dH3hif7DrgOx+ezYqoJv/DnzUKcDegCzpCYuHE?=
 =?us-ascii?Q?srPWVOEtz+Vi/3jTmvLczjw3U7KqzxbHKmxI+sCUg6IUIhqVmr6YwcQl319C?=
 =?us-ascii?Q?Mf+dtduKuUNLW4+o2c4dJnjtyW9VtTGXZmB6uueal3D+349szBExJSGR2UqN?=
 =?us-ascii?Q?qO5jlqk/mSpOV3k7vo9q5FLzeMQvqYanNeJ46NJzF4026pc0BehJVc5ZuzVe?=
 =?us-ascii?Q?cR/IhcuHOo+7gT/yO8d5ntRo5j6X0ZdrIHv2eXRPC2kybgUB7a6juthiLtvE?=
 =?us-ascii?Q?89+svZtWjtSgrlfCoOVhSPihkeok2FWU5ktCKVMWyO95dF5KN2UYyM6Y9Ap0?=
 =?us-ascii?Q?bf9tLnWwOKpLlX4U+SxSJTfJlfk72u5e+6ACRsp10g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FShCvZj3QipfwVmhoZdB1gRIHKbulJWuBPXgPGcNkvFkhIr06HXUoS/HjnF4?=
 =?us-ascii?Q?5imhiQJVnZsMroCJEIW+ZgqTVWrhkYYWJbvV8auCOqMlM9yrQUa80jrFVr9p?=
 =?us-ascii?Q?IT2adlJw3+92DqewbMsyoPFJY+xt49kEBo0TEl+aHJAYZt0LVtbCgbTbUWqq?=
 =?us-ascii?Q?N0xHWtzTEmagXziqJRmLKYGR8CAR4M7uGpoqAyNAICsPro/2UPTFcmEXZazV?=
 =?us-ascii?Q?1E0JORwbTudRLeGEOYOIasCC9gvdzwPkj7TrgRaBNlRFklZZQfjFQUHG6pSZ?=
 =?us-ascii?Q?yukVmY3Cyqro7pnDr13w4b3snIQM7BSa16q4JKbUbvoHKKosSNmeqQtP0DH3?=
 =?us-ascii?Q?7uzxbfWIQ6WAtNpymi/fOrXHfSXCOBydE+xq/m3op6yeGPbajpwMMuzyuvLZ?=
 =?us-ascii?Q?VMJSuOkYf5Dhn+11DStUchvcefKjW158D0cuAzVLGPfE+PKrS5AW3QquLy+O?=
 =?us-ascii?Q?kyC0y/P4doat1tSbV4E/v84XRB+Yiz0/CFyboJg1SekGLey0iC6/dY8qPBrf?=
 =?us-ascii?Q?iiWorXkXYekEDlPMs4oQ4VT7+dpG873b6mQOwxsdh544gtzNEsKH3lTso4r5?=
 =?us-ascii?Q?fLxPoNmZiJI/Qikz3wsaarHipkB7zZIIY/ajRsEhan7C8nwXVWXNEsZpXtD+?=
 =?us-ascii?Q?cKvEljAsVPNXoL5wqFKL8PWkl2dh+z/ZVj8h1YCsPD1Z88eklNTCplaI1zpi?=
 =?us-ascii?Q?ksYPk4obgzCIjjYSqISOBOdjUBPT1K4KhretlgFmuqpi2A7h0rzNOtpc0Ajg?=
 =?us-ascii?Q?ejn84hH+WTZJlmjj8YoFJQBIHX0SwWYIthgorRWZuoVh62rqQXf5h09n2eUZ?=
 =?us-ascii?Q?F1avAm7vUneFnyAH77YSzFCGba5vf+AQ5V07U7ccEbi5VonWlPkquIO9PAMv?=
 =?us-ascii?Q?sm+aMk/MmF/jR9poapD8xlPJXxaLmeZFhVZSa9But9TxZcm3mtJ2EVmmAXQe?=
 =?us-ascii?Q?3sipkWny2cLH0mjSdKAe8l7gWq9+iA+NnpscPLjpxmjOjHnFyWO01sqYd8Mb?=
 =?us-ascii?Q?S/ytwd/NoXr651uuCHDp9isiL8ojzPELxQ3JtxtMwyl8BNg5k/qh5BH9bxRr?=
 =?us-ascii?Q?Jr91MHRkok7e/CI9JcusRAYi3Zey6xNipLhH8HBUkrLvZrVmRtRA+Ia/H3TX?=
 =?us-ascii?Q?ZGbrFknE4wU5SU7sLkrFH+iWH58r1puFY3dA/Gm980z9SJpstDh/G0CYowkI?=
 =?us-ascii?Q?kM9kqL9kEZHbC24czjpQvwXv2rve9yTL599cpZY0UXe1r3CYztuW1+odBSv0?=
 =?us-ascii?Q?ZQBLDyWyOy2b9ROfPobRgd72t8zD0wQ+oEH1fcdTT6+aIB4E+7ZgHkhqsBi9?=
 =?us-ascii?Q?Z6nxK9+ZYDJO4783Y8IA0NKS+jBNg2GJqp2yEnHQmbsV4VRuqKZiBkyBSCqU?=
 =?us-ascii?Q?gS9HWmoUSew9NYR1ExhoYCCPRUMzrQsBhWgsAFxihW6CQvgN5hrxnKxgMcCJ?=
 =?us-ascii?Q?E64adJ3EVaozYBrbnXPDomMOvFaimOJyT4iG/JZFpZjbfTTNdg55K0338bsl?=
 =?us-ascii?Q?T7ZMY2p2VKdHK7nwajLTB9HwUPKoW9/PbJH8qpgb9QtNzsEUqIfGQtO7aE9w?=
 =?us-ascii?Q?CK8k0MxSepGHjlztu3nppzOiIS6Cwd4Su0lNv3VVaEFpeZW1Kj0bMg3jZbhs?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6f9a5b-4bc8-4add-6098-08dce1d1025b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 04:24:58.5387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Izh2K7KLpfJEpgEjcswTP+KXRNL6gWhtHPFMg7XAT93oqb93d+Jef701Nd8vkJ9zV/JI2AEOGK0lSelICz6m6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR06MB9500
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 04:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112621

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


