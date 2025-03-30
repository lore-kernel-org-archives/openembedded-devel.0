Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354C7C28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 10:28:23 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.89])
 by mx.groups.io with SMTP id smtpd.web11.27933.1743330476550525245
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 03:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=huGf2Kvj;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.67.89, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YU5TxZuiiuz4ZMWOca/U64LPhatbm+7UXtKmpsBKGh7Xphg9RvylRNBOQpkjhWKZV7fnbuGCce/vfZw+ZxSR5aDG126FxUOFrzuCyq4FBzmUlqeyxTrLVFUkzZ78kdtfVbbmAfWU9jTfEmId8vxYx/cyWnhrjTMS4bC7Eh95/BGXWXj/yamWDlk6d1svWhPOy+yhEBbU15bL1X5NLDpr4bwoENGA27HxSaBw9b4lOz3v4dB5WqTGBrncO45ZlCgrcU94MnGJw9IQHURCYP3t8J114gG7iS4Bne2QzkZ0WdXY3YDFdj5TUxTEdh8rD8K7YXoF6t3GdNUsHTJY0ZsXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECbBwdWcKIzNsDm5muBlARahvfjRHPrHQJmvO5G/5hI=;
 b=sA22MBxmBKVRFwuIqpP4h5cJKhlyLn46CCudJ0ySUPlORjf9wVZiBFfH+QZ3Swe0V0P8iPmwTkdl2XV1EAzy2zXsSjvlqY+BKy8Gy7PYjjy7Vt+LO5lTMhYekspo9H3HrXU4/x/eqxq6lqZB/8XBMVq1gyzZsEO8qLjUDZqsP77NnC7oKnyA8m9hkKB5CUS+HZgtb0/VPykmc+WepT38u9iCY/csvB2/c7TEaUxz5yA3XbgBIffBBLajZUS0rY1a7WwfAU0elaArf1N5Ywh9V5AYpFVocidZ4Bwx8vMZi9IfVRuqbKjpOVVX4lcHXd6EdgAOUzuqHV0AHdl/D6SrDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECbBwdWcKIzNsDm5muBlARahvfjRHPrHQJmvO5G/5hI=;
 b=huGf2KvjMqHQiVkgce7fU7lVcJg4b7S/Pw+Gy0jaX92d/2rn7Tp0jcECFa75zQ/V/8wcb7g1pV5wMedlwuyEvc+g/5yjyjt83+R01EoZ+EeyvSSP4tZEvuIEJaDMjadufRcsJKWe5wGEXhLPrb/LgBI27mio0ijsyFNyaJUjjbvJnNxeFn7ldQJ7Qzhar0xq/NdPBTXS5n8kfTuW9p52ilnVLErvP1Nqdhf/xxeQi42y7QAHHNxRXv+ZR23rfhXt6H6kby4dLx1I1EKCCMvHr+WGE2vtaA5wDKhFqcuZl609XUsAbgnY0xGQIWvupIbsDxwr0BHckDc1NbvESbAZfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB7100.eurprd06.prod.outlook.com (2603:10a6:102:8f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sun, 30 Mar
 2025 10:27:53 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Sun, 30 Mar 2025
 10:27:53 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 2/2] mozjs: Remove dangling patch file
Date: Sun, 30 Mar 2025 10:27:30 +0000
Message-ID: <20250330102730.405005-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250330102730.405005-1-niko.mauno@vaisala.com>
References: <20250330102730.405005-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00006627.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3cd) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 630e93f9-f9ce-49cb-cd5a-08dd6f75874f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MuFQ23OgzpmpXFzF5GX0jgFp80U5CxmWufnE/EvOxZmfd0aRn9P/LFBSNd+q?=
 =?us-ascii?Q?Q4izODEcbUJihSgTG3WiTUEd7aWpPLwMexIa5aDL/RRoJt64E8kzGcVbSrcY?=
 =?us-ascii?Q?d1Ypu199sYCsZYUvYZZN2VwS4IbSCBcl5VqWBLPmnbBRXQTymrsFQtHENHxT?=
 =?us-ascii?Q?d2muPCkuNFVj9k3fcn4ASSZdoelAnwJRCJVv4xIvCG9IbDR9n44FFiRCV3ZK?=
 =?us-ascii?Q?k/2aD+izY/74fTgz6SLT4pEjYEiy4gxt0FO64l8TWZognfejE3ucMacy85X2?=
 =?us-ascii?Q?qEIqAkv0hdGwYN+3UjrBKVrG/SvUKvhRJe5AQqdOT7GPgr/qWHimUjc/XPzJ?=
 =?us-ascii?Q?fc1tH0XEW2jKAje8V9WZwo6xL9dg4OQwpFPshMZjJPYnjv9stZZEg1O0vxnU?=
 =?us-ascii?Q?azsTO4xQLGGpY54vjzQoXSz6rVVJxJ+IBVeAZNr07I2IsqPONsNIZVFSYn/I?=
 =?us-ascii?Q?bFs+fGC365nDm/Wwiww9hUAvX7Dqt0dFrCzgNYXdmkI9chwmfJSiWkCrs801?=
 =?us-ascii?Q?BZvM3WO1oWW9CIAZNIcU4vRLA2XC4zgAWh0h/ebpdzgD+Ix8th+rG7HWwCpO?=
 =?us-ascii?Q?EabDcNb88YxhCtvN4vSWMzY9M7NEOGiksJRykm3opwjDHhZDyePcdHgGfItC?=
 =?us-ascii?Q?on7kS9o6XKpEcnX9ChCtM/JilKCxBXQJf7wjdgiyhIWCbRhmgHyGmJaZdOrk?=
 =?us-ascii?Q?GTaubTiDZgxgtG7FEXOn4HfUlzNbcPExA5ZCdidbd+VfUo1RVHqb2iJK1By9?=
 =?us-ascii?Q?AnuuLHTsjpIqwItIWX6xJVgPQCM4I4aVAIzgz+jcC1vEEORf51y3ciu0LOk1?=
 =?us-ascii?Q?fbuXG2FCmvo5uLP39lX4EbgxJFEfMVpoXWxNuHZ0tryKtuITDvuo0sVfcnUU?=
 =?us-ascii?Q?NOklAmi5iGwgW3y+/MKNMbFZt+vVnhNmEClXqIz7SlrNRyg1GuzUeuTFLzB6?=
 =?us-ascii?Q?NnPztFEbGlxwj99T/l3mUYFrCZARoYLmqr1RnWFMcEbAcDvs2nBuwRWXA/Yu?=
 =?us-ascii?Q?GFOE44CtpRDbj/nxxeuqi9FjQIS1E3exODAnsDr1FfXg6Y0S4HyB7LpOq2rx?=
 =?us-ascii?Q?3YEj+kj+9woan1QWIhHJf4oROTqK4PcbiTgYS7nn3RyXSOFKcy3GmysowejE?=
 =?us-ascii?Q?A5XmTb6ryRlhPZM79E2hAx+YsiShe2tNR7nyx3zu9xvphAP3Nz3ravXck/zr?=
 =?us-ascii?Q?8WWC6/w3aYOwFBZuUh2Dv0fA78k0JlSspjnToebVlOPiTtLu6lGtbq0SUbAn?=
 =?us-ascii?Q?4mLOogWIomCxp6DwdAxenzAyEALhZMP6GOZ62d3QRvZzwxPRhkIHescYWS0n?=
 =?us-ascii?Q?aNtK+pDkPI/YeXavEQe6bVwPUJ0hFRfzevpUZnB4/RPLBMXZyY2bb8BNVSow?=
 =?us-ascii?Q?th5Ea0Qs/7siNCGyB4/JRsLbQdcsuqgg8fuDO1irylYV0EGTrWmmY04RT3xS?=
 =?us-ascii?Q?c4FwoRApwI1DUaMrSSQ7nQhwWEjkf+je?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CuzqIGOj4Zx4BLGvQjcdDI6mvq9A20yRcPXBTEo+gNmWs2AWGjnYGgyYJ5G/?=
 =?us-ascii?Q?SRDDo0mC57bcnY18vHkmCxbsLCbyGEAkGxHB1/svlUJ1Tvh+S3L9WYBBSAqh?=
 =?us-ascii?Q?kXrTUA3KvGQa8LdoD5ZN/IU7DGFKFZw3e2m7wUlFAkiU8VM9T3nrpumzg+H1?=
 =?us-ascii?Q?+YKugAEUgcMhKbFQiw4dWrUHYxd4o7GH+wVSgTqiR0kbRKuJOpLynATxef/H?=
 =?us-ascii?Q?3/iVPMp0Aq7qhLJX9U4LvUVpoalHhQ0VjoM48E6tqYwMM8IV8KKLteOQqioi?=
 =?us-ascii?Q?FmR2l8LgrHwnelz7+nr0L8CMwUthDn9M+sZA9x2ZVG28h5wOBAw+KBji/arm?=
 =?us-ascii?Q?ALylq2UiZ8TG5Zn8QeVm0SNPVrFvvF3ZdHAyjolVohiQ8jqkraXfTSoUjpDH?=
 =?us-ascii?Q?ti+36t/dkwQClMjd162cpIJfE8siIPgpqua6c/VVsBIEHqHAapcwrZzwSWRG?=
 =?us-ascii?Q?sxeTC78uxh3rOJsHjYPyvlDmv4ZeJlrC6oby11AFSP4eFzTj8+CWo73blO0B?=
 =?us-ascii?Q?7Gp8rEKRWrrhzj3tL6FFfY2z3n15EDrB41qPlRMPUk29tUJEVd7eTUBseCJV?=
 =?us-ascii?Q?aHgreV1MWI8T+9uP15IvUEXFxQJ/068RgvC7URxtfj6f0wQKMIkhV4CUi4O4?=
 =?us-ascii?Q?h6qw6YcALcpHSxUaIL8EpPhCF7aD/UcvNvkigfHEyWbI/vVsCMYIaKnIYhgZ?=
 =?us-ascii?Q?anb3EdFviUZymL5W64JLt1Yv0pO6eADsllpHF387LgGO54asrUveiA4X+dPc?=
 =?us-ascii?Q?+1wsXdahd77/+uoeVseXXsXcCFQVqJwM3q89zZxippDYJh8fOGKjYRwCORu8?=
 =?us-ascii?Q?gaNHns1Mrxhaq5ycocajsB6BINqYryo25iv7Gt863MvrqSrHZ9rgfkt7Sqzd?=
 =?us-ascii?Q?UhymPMVuLVInTMgwcYlFoPkt8ovm7SfaPj4FZyOud04k/m0L7q06VtqjpzIn?=
 =?us-ascii?Q?+2LWS31TxESACP20kgD+/XK0utTsHkMzqzTHy/jvMzIWQOK6BeKhZSk37YnM?=
 =?us-ascii?Q?tNCMTyf7BLRHdzHZZDcxVR8HxdRdRFQfCPbokVTYL/ntLthGIUkmD/rvAACm?=
 =?us-ascii?Q?mjWno1JTi9Yl0qI6wtUsZ3jAaG0clk4+uN7qRWwOTs7Jj2GW/588kwRo36SV?=
 =?us-ascii?Q?4usFpwyR47UzWH01gMG1farOZ4JBrjjJu5wWyPU6K+NK5KyzMMkhZIxG028L?=
 =?us-ascii?Q?OfrndXLPa1KnOoRqUhKlRg2yjylvNL5S3Bvc/1m2lLmJe6Bx5cyVdl2au8jM?=
 =?us-ascii?Q?UvIDMMjZTWTH8BV7/MX0vOijRtYNAyl0m8GnbpSs2jPWiydrzUqVolVNz+GI?=
 =?us-ascii?Q?ljN2Infsan7epZ65L6HPZaQ0iaMRFVPFrE715ZgQ+LDw0Wv+vWustYXjGkuU?=
 =?us-ascii?Q?FYUOydIsi8BM8S1p+Tbl2g1xTuNBli9sSP9zlH2tYZ7MKtTC3lA398pQCxo1?=
 =?us-ascii?Q?Ra2UQfII3lAVVhNO+tURdLEpTbY5w3wQAqYSE0Zm8GzedDDXUqN61zm8dS5l?=
 =?us-ascii?Q?IgXOWUEDnKE3eZpaHdoGaJQ+yfyJh+Gk0P+b8bXx8MxEjczvYYgi4TubeX/r?=
 =?us-ascii?Q?XL+Ftvv7Pb/QyetaodWw9T+WL/Ecc19PlvVMht0QG/rRT/YbajqWJgxsuxKk?=
 =?us-ascii?Q?fw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 630e93f9-f9ce-49cb-cd5a-08dd6f75874f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 10:27:52.9312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyWjbxWxZ60twZ9e9kpSdFamKmMQPzj84QZyPwEW5pObrkGuXejuZZY4L7/O+4brFtZYHL1z1MsvXkhUhEa10g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 10:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116387

Not referenced since commit 27ab1bbc95b27a72a6a8a750a7fd3e98526e2050
("mozjs-115: remove recipe").

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 ...-autoconf-s-config.sub-to-canonicali.patch | 44 -------------------
 1 file changed, 44 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0001-build-do-=
not-use-autoconf-s-config.sub-to-canonicali.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-build-do-not-use=
-autoconf-s-config.sub-to-canonicali.patch b/meta-oe/recipes-extended/mozjs=
/mozjs-128/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
deleted file mode 100644
index 38496ea56c..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-build-do-not-use-autoco=
nf-s-config.sub-to-canonicali.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c860dcbe63b0e393c95bfb0131238f91aaac11d3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 7 Oct 2021 12:44:18 +0200
-Subject: [PATCH] build: do not use autoconf's config.sub to 'canonicalize'
- names
-
-The outcome is that processed names no longer match our custom rust
-target definitions, and the build fails.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- build/moz.configure/init.configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/build/moz.configure/init.configure
-+++ b/build/moz.configure/init.configure
-@@ -647,24 +647,7 @@ def help_host_target(help, host, target)
-=20
- def config_sub(shell, triplet):
-     config_sub =3D os.path.join(os.path.dirname(__file__), "..", "autocon=
f", "config.sub")
--    # Config.sub doesn't like the *-windows-msvc/*-windows-gnu triplets, =
so
--    # munge those before and after calling config.sub.
--    suffix =3D None
--    munging =3D {
--        "-windows-msvc": "-mingw32",
--        "-windows-gnu": "-mingw32",
--    }
--    for check_suffix, replacement in munging.items():
--        if triplet.endswith(check_suffix):
--            suffix =3D check_suffix
--            triplet =3D triplet[: -len(suffix)] + replacement
--            break
--    result =3D check_cmd_output(shell, config_sub, triplet).strip()
--    if suffix:
--        assert result.endswith(replacement)
--        result =3D result[: -len(replacement)] + suffix
--    return result
--
-+    return triplet
-=20
- @depends("--host", shell)
- @checking("for host system type", lambda h: h.alias)
--=20
2.39.5


