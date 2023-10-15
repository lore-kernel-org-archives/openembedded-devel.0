Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047EECDB48E
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web11.89851.1697367731043602381
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=rXRtgzmd;
 spf=pass (domain: welotec.com, ip: 40.107.21.83, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3LlC6Pk2KNOrbKLC4zy/KEBtglDLP9aPHe483SrwymBImLVZ80Mu8crAgf9p7OTfnkwDQUcMOxlWix7fs4NoXXf2a8PlGAoqYCpYOZGb/N5nUq4/HD1Wu83NiYvaekDCG1me47ns7wRB7JYCkbfxkZwdQ66ACcuSrmusYdFYZO5H+jlaEn//4lwHZD+4qaQLBUNwsE4WVkjbtRk6OQQe6vcFK2YfNudLrIglTDB4HX+ly1pe4yYaJMitKsnHgxTkvGR+cgxOUOM2412BuEbxdG3mVKprCQB9UbzhS/DHSmg3Gew9PWUB7a5jY5SMwNoQEowyiMEE7tbDzJsv3zfUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMcad87igkPOQdlt5omEoFA/YQ0WOqE9pSirTeraGHY=;
 b=RPPNMejuWI+WI+uOoQq8OkrLZ3z+YxHvx0mmGBR5uB8sMr1pvfy24+ESpotu0FTANefaD0w2fubcFry5+5bjqzN9p4dO737TuSgxdKbh2nWAFsmkLVYJ4h8Xdn38egDNJt1DhNHVlZOuTU45WDcNYTLaewSsAPO5jiRDa99YEuj64jgxboZScD/ZFRHU/BoIFQ0Ii+mfAZFRhIjywA7zCl+VZOqqT5lVSyzb4qfOImcb274FI1XiUJHXPx+4GzvMABZB0C2fKX8x/uLynjLIpuzxE2fmS5owATjaeg+6yWgVXEWZiFzxCaew9IER4wXa0VkJls4yf6JkftD6kO/cyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMcad87igkPOQdlt5omEoFA/YQ0WOqE9pSirTeraGHY=;
 b=rXRtgzmd1LAcRhsL8VOjIdGqzfO4MskoRKk+LiOkv3Hp0jFtrTYXAr3aamtsrqVXd9qsrSMZNIg9XIEQROcyel5rlxlcv3c9eAZjmH9JYdCnTJlXydKNYcxfH74A6QPPXf2faVOmwdmMQ/uMf5KgySAc7fX90F5xuoD9eKOKTne8ehEi8w1RZ0IQiCpslnIDlPQ84x17dqjh+9jmnpguJoDZe06uQGd5OifX7Tc3XlXFRocAzw2LpdeUipw0SwquBxZM35KbgJ7oNCPtkqh2o0Ji0nrhvnpx7lNaBteB8BHL97HWMcuDeBRuWQXnZ4nade1dkFgNP6JIz3aHs4IGBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 11:02:06 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:02:06 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 06/11] package.bbclass: add support for ACLs and xattr
Date: Sun, 15 Oct 2023 13:01:49 +0200
Message-ID: <20231015110154.53364-6-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110154.53364-1-p.lobacz@welotec.com>
References: <20231015110154.53364-1-p.lobacz@welotec.com>
X-ClientProxiedBy: BE1P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: f203c0aa-adf7-4615-adf5-08dbcd6e2bab
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KmuEp9CMNlhusCJOsCI3XpWJXvA+eEzp1d7Ah931HK79xjVI8DxEfh9V422qTSSkoAHYGcKTbFf593H+HeceKKoefvJHTBtyMIPdNA7TZ0A6ayP8e7VLVLN0za9ipvun1JjIB/R2P6KWgOcb38JXFbgC5r1EOrA/AJLz4rhz0JFURIT8yPaoGIw7TzFV+aGEjQyS98ZNOBtRYpfuld9E2ExcoWauuqSfzynzikeHnfeEIO6ICSe5qnLeStMxndjSA3Q5VlFGTELUrFhT+dtyLK81/mvTl1Nvr+Hws7zVSBg2mERSuMFSt7tC42uD4NpPR3o903nK3yptEhL2uMMFxR7lbwlOsAP65zVwQKnMJXz1Hddf3IFYI2cOd5BcZAuU7PBzJeBAjyApBPzlqsPLjBboxqU4inpZcYtOLBoN/RuGT+hc8eatEY5KuvjsZJQ8pkF8CIQoWvRy7eQroD9Dt/UIo7lGmNVfq3anaMf5hPmXBPdrdTYXpA64MH+GIY/tNUrCA+8C8qXkE7kBWcsQE7xHaM/9hy6kNLPCte6huJIDT0qscf164s6Fb8gpn9LvxwZvwWHUyrqPAMtDsr6jpSqG7LfXpRZC0ALmPpTclt5quIF1wtrCbkbXXExP5Sl/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ENds5DcR7Aw/YJP2Xz5D7e2r77aesmJlVNiGxoclT6RHeUzfMb9g00/jxwIU?=
 =?us-ascii?Q?DtTOCazK1qEvoWhr1WBJ+272c0NYzCeVIgWL1qFI3FXDq+8tcDm90XjEJbHO?=
 =?us-ascii?Q?q6NHXYdLtq0aWN6kjlTP1WAgbhsPpIVXp4v1uYzH+aHjJ3vzzTIwjqlS2EPn?=
 =?us-ascii?Q?jb3SBr4BKfz7B+WYGraDXTt/j7sNx0i6Th0p/40zLCxi5kzWvPMXC6Q0MPVJ?=
 =?us-ascii?Q?4ShVWWjueni/cEsWqoqUD2HEy0/QmJz38DpCPYuuMmxFSMNnER9WK6lQjoAL?=
 =?us-ascii?Q?IQyYYP43bFr8p8M3cXyV3LGhmPUNVoOuYzEGhy2kcT84NVvSRuzHmRC5s/kK?=
 =?us-ascii?Q?VY7dXOsSPcKuw4hZz8O3BamIla7Tv2m0dzHsfeDSpoWKmdUwoicc6J+4ng2H?=
 =?us-ascii?Q?dPtkBdq+X0I7bVzhDP6SvY9lms3y9xg5Douy3wA13QJuRtgWVYkP0il2QYuu?=
 =?us-ascii?Q?5AksnitMEAVVdaILh2DBpkNEzbUnGr9etyyBBurenmslK8pSTA8/8ebm9dR7?=
 =?us-ascii?Q?CoiF/pbBKeC1Rl9oxqWzd9mSUizcpy0RE7MjInVHSCUmOd9C4ERE+Wp20ZXv?=
 =?us-ascii?Q?uLm5wODO5Fm5mQrPCMWGaOUXSQ29nARRhFlGw8SBOXOjsrVk9TnfaYL6CVOg?=
 =?us-ascii?Q?n1U9F0KKVBH9zjJQkrAaSfgNcqOahIGZWu5W5ebGCB7DhaHu1PYkPgOSK99/?=
 =?us-ascii?Q?MxasIVcKvdSUfxUiZD03Tf0rIH9N8UyhCNBYK48NyvqgFiAYO7wgq4xDX4Kn?=
 =?us-ascii?Q?4uLzg9Ge7K19UCrZKkLZlRIrM0fWYS3u69ybrKwIvv6xVVZRBiN0nS2AeNbL?=
 =?us-ascii?Q?9DzFnSaP8YL3eyxVe5vw6WLbTdR4Kiu12xU3AYlR/ohRje54JfZPBaln+zBE?=
 =?us-ascii?Q?73bNxCVp8k2qfK4W6jzDwmnZlwD0EME+zadszNrT8pPt1lB5zws7jeH/NKP8?=
 =?us-ascii?Q?Zf4t0Jn7AsHHaKC32J0ozT+V6dLX1BWNvArOKL41RRF1KI+emR6CLU1lbwyk?=
 =?us-ascii?Q?5dEM7zCYxHf/R0/Ro669RDnvGOUi8F+giJezOgWr7UP/ZY/hJWHDeCcuz9gn?=
 =?us-ascii?Q?OosQnl9WJQgQupfKyolH+h4Yg1z8K8uAXjBNW1i1j9nw3t9RM2xGUWHx/vfi?=
 =?us-ascii?Q?n4EydM/aFXpkmoj7IvfDvb6QfFGv1x8PRVLNskHvfOOXZZsMyYjGAPs07RiX?=
 =?us-ascii?Q?m4BipslUvPdFclPIZLLSMiTSkEgWDf38YRjl1Vr6dJzK0b+oAjqgSix6zOQk?=
 =?us-ascii?Q?yx2lu0nOUzQcGc46O5zYWYZws1X7dKPp1PPjd/MOfMO4hga79dz3HIsmfHRe?=
 =?us-ascii?Q?XNf0HoSmxiOXWootjr3zOdzFPwRJ0MwI7J6aSMagJuB+PXBdqVzEuIhnIe9q?=
 =?us-ascii?Q?qgGOyXCgkRIx3qJhYLRzplKuC/TjByX7Q1g/WMudVZAszsxzyL+r0UlJSLGh?=
 =?us-ascii?Q?2QWs43U+Oh+jisO5Ayatd/VubtQ3BVJERSV2oTZOvueiZ+r7LLk1vCFs5IAL?=
 =?us-ascii?Q?ni6dQqvzc3tC0tYN37iUz09YWwaBQ/v/hAryP7hBrF02e8BxI/N2JWctxBEq?=
 =?us-ascii?Q?8cST21WrcWs3ZfPJlK2aSiH+eG9u8ttitm0uKSFU?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f203c0aa-adf7-4615-adf5-08dbcd6e2bab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:02:06.7176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyj1wV3Fqh7bMCjFcST0F102nSGFFO5lTjTUpQhsByw0HsSudhU13EDq/g3ZeuqIGiAU4RFp+qA9LkOu2wIC1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105511

Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index 580884cd83..22af6552d7 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -353,8 +353,13 @@ python perform_packagecopy () {
=20
     # Start by package population by taking a copy of the installed
     # files to operate on
-    # Preserve sparse files and hard links
-    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -xf =
- -C %s' % (dest, dvar)
+    # Preserve sparse files, hard links, ACLs and extended attributes
+    # TODO: for the moment only ipk packages are supporting ACLs and exten=
ded attributes
+    # we need to add support for other package systems as well, but that d=
oesn't bother
+    # tar from creating archives with acl and/or xattr support
+    acl =3D bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '', d)
+    xattr =3D bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs', ''=
, d)
+    cmd =3D f'tar --format=3Dposix {acl} {xattr} --numeric-owner --exclude=
=3D./sysroot-only -cf - -C {dest} -p -S . | tar --format=3Dposix {acl} {xat=
tr} -xf - -C {dvar}'
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
     # replace RPATHs for the nativesdk binaries, to make them relocatable
--=20
2.42.0


