Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13EE2CDB488
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.60])
 by mx.groups.io with SMTP id smtpd.web11.90066.1697369032343148425
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=CTu0w+qP;
 spf=pass (domain: welotec.com, ip: 40.107.249.60, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ar6F0krBj1sAnu1YIOAP/0T876TX7kJOM3qJdLH53AgIRaY53wvxcy1PJWB2e7u0R+RLolU+sgKGsvbbAMngkPDFG0lz08wvDk3DOqxVmtnPs8pt7GyH8XsOymMGgIGsGhdvjmnY/j+E0lguaVysEKDiIJGwu+IPuBNdctUi2BU1JUH3dwQW2FgJxEQnjCDR/1EBq95XA0dBl3dbFnB/lKGK+7xqKmspbQNS9CQZzFs1rO5u2WlTvpSnWFPsQD82ONfvbEe6TlCTzemXQUM+KCj2VCwzkp0KxU0EHkc1ZW+N3y/mmaCJc9eAcrZnvRNgskF3BebeUVic3BrVPj8kAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMcad87igkPOQdlt5omEoFA/YQ0WOqE9pSirTeraGHY=;
 b=dDO/LEd++VkgQULpFRGIddPoK9kroBVwAk3+sa60H9hReRXSTcJZhUXXaCtKDcbuF2ERKpoueq9oG25omHziUen7Zw+AtCB+qrOA5OZxFJg6HEIKMb3C6lnnpN/vjZFhtMfhDQknbsLHkYevNMB/O6PwUxNPbNwKK4NG2+r2gVLgIvZmVb6D42r9c7U25yKcg8AvviU5nYeA+R2NSBFsyw8X18T8Nuf35MBubICOadJfNOnuQ55rgPvVneFRINwVqUF9uf59A5WQJ98oFftKQJqI29lNPdQE5yxyGYpLn0Qmb6AwJWxDWW1v4VTL+6NiSDnhYrUpbTV31sgQu0cmgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMcad87igkPOQdlt5omEoFA/YQ0WOqE9pSirTeraGHY=;
 b=CTu0w+qP2SnwCX8tIxqzS8O23Di/p5mP/O1O6bbxkeTJEUICK62pM1bDU2EpnfTUHY8BlapRYuNu8+sVkP2lbQQ27mFydSoN+kVMzqlGb5PP1AiHwZxgPHH3xEda/foGBDqAzY9yOJspOZjyuVJm5hk0iL9ZFcynKRtwIOIigBee3Uaq8PShw5DK+QNZF63LRedlYbn/2804Shb8q0u0zdYE98FneVbDpRICnVD9ez7S/6ysww1kXcHVaYpnUaCPU26MhQUqGoZCU6tN59kjjKRMvt3lgMrSkEYsayawRYA9vRHrZF3XwkQFo4GWDw54064/rzlJkx8MeU11Jv4uHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8113.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 11:23:51 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:23:51 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 06/11] package.bbclass: add support for ACLs and xattr
Date: Sun, 15 Oct 2023 13:23:31 +0200
Message-ID: <20231015112336.55722-6-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015112336.55722-1-p.lobacz@welotec.com>
References: <20231015112336.55722-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: f63cac2b-4837-4770-a769-08dbcd713527
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z0iachM3QvJ7AU6/mIkwr6c/8w76Xmau3YV+xh6ExRxvGSmqfwdgKc3ACAnrjUQNGF9n41tDmYZlmtYdO9PuDLLzetyq2jXIcjoWj+qTQqwrMhcXuzvcn0C6AH30nrTm39tbAtDrODdHsMNNc4G+jA2JmaFiMM1SDkyKy+uTkOTAiLmoejQP6AOisFWBq9pbdB79DXsIAkQgdAg9PXacyuMNgqL7FgfgKGO5P1VJT9kWyvCDl+7V/mI+dyIGMumEIw7KfZKH53grRpst4du7kUOFH+hFLuwia+1yaKqtHXi6Uyx85NdOej+q8q4uUxkUDpDQz3EExhjt+IOIJ5AuJ76Z9Jz3mFucv2AwU9+9hxCsS8LM+RgQdDFlqi0LdITmYJlNjzOtZRdhUmgM+LO5DhViosjsZ88aXQ9ldmPDOz/HDwjiK5R9b56Btgh4UzzDsEjH0znz+qMdkej94QrsEZagWJ4PC4UXku0gGS67WIW5Ks9LrV/sZudcxazB0UoKo5ZSSbqRmXZo9CU39dwmTiOQiQCrsWWVbAXBmS0WNk1dDPTUQREFfBuwEyoeFi1eEAjIe8Nh/DCGongsWwgR9G653DOZ9+EfhwZQtHlEHLGW8eurqLgIlgEZBV7mVfmD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39830400003)(186009)(1800799009)(451199024)(64100799003)(478600001)(6486002)(66946007)(6916009)(66476007)(66556008)(6666004)(83380400001)(86362001)(38100700002)(316002)(6512007)(66574015)(26005)(1076003)(107886003)(52116002)(6506007)(2616005)(5660300002)(41300700001)(36756003)(8936002)(8676002)(4326008)(38350700005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?udBz0WbThzQho8tK+/6vjbibiqC5sNp1k1PnWjyx58dkMm5P6foI1Jpj5iGz?=
 =?us-ascii?Q?ANtvKT4Y3Mau+98g2J5ye+ucDn0H6yctlltdRmN1wo3q61A3wPxitkVAfpmN?=
 =?us-ascii?Q?71AvzaHesu983fLFBsJh37LQAnAtlXGUKiN/qAH0c0SYIaKqWhiU7IUucBnv?=
 =?us-ascii?Q?cexmZ0+D03GVwGB6r40fRCW0X1Wh268mBlmINky9dZWswpGluip3MJTZTtj2?=
 =?us-ascii?Q?byj0ZyWeUdU+wvgiVLrHXXpYu3LmUqXpPVwBmqkIk4nC/OZTjtnfM4AR09mP?=
 =?us-ascii?Q?KXtZYCdoHIhsN/T//MlfL+htnmOmfMvc3BVRh3EsyVeP/A5VP8dFgY6YbzLV?=
 =?us-ascii?Q?Svsi9o5oNGXjw0O0tzSNQ11efmRDS6zvcIS4w+Byxv9W65RQYMdj3GUWP0s6?=
 =?us-ascii?Q?G/wGSPwe3xESrHUtZjvIwCWze5L911hns7zkAK+EUng/dgf3yGai4C5Q2Ph4?=
 =?us-ascii?Q?e7pVI/xYGU3mAVrNi8Qep7Z/sTQFEjG4KVm/FrZhmhhop64yMziMBxoAprqZ?=
 =?us-ascii?Q?Plzx+8DwJa1fSqfoqwj2Ch5lbsFD6MZEcRSaYqrDd8rAF6NKsr0c9LLi5fsu?=
 =?us-ascii?Q?VDHGPfzQUfRVRNNJh8X4SiOGfd1h1IQJV5qIzHmOkf8uBsCgvrj1cTlid+24?=
 =?us-ascii?Q?B0Oyknsxc/N6v625TS87LZmaueXdDKnqHmVdJPEZNNyBhmO31m3BTL7n6sGY?=
 =?us-ascii?Q?fr3KbrrGFsMO5tDxopSLE5Jcki+EYmLL7V6kkyZeHMD1KmLh7EFgS0AKPhYC?=
 =?us-ascii?Q?/QSMRdjN3mGCGjAI93gCEiZpRY03fP4cYRF1CPYahrkxO07R+BF5gBQBB5aX?=
 =?us-ascii?Q?3voljXLrzPISGl7v8sFS58/5pgxJEFXJDzDOxMd4bSrRKaq6IIC5kXvjafRp?=
 =?us-ascii?Q?9uKu711hHwtPIdwAj77UegSIvO6VgDNuC+WVEocQSZ6XfG3bsk5RTkR5bVWT?=
 =?us-ascii?Q?RlvWsKjsCaj+oO+sNdvUZYk4STKpwSFykGhIGahkUa006fDt+Kg/sz26RY4U?=
 =?us-ascii?Q?3u7xvX2DFADOIzCXVfa3odMmwKsag1VfZ7wTC1+/niOgQlzgN2+XunmS6tne?=
 =?us-ascii?Q?ckVeQ8yrs53fxH2KqguG9kd8ZMSKCnJvIumz6AiCLJZw5H5x/FJDhXOCd2Ri?=
 =?us-ascii?Q?sF20k5ihpV+xMiw6lGQ0Jogim/pFV9Z+buXK5I6fP6hIbDhH3rXqlox2bjMU?=
 =?us-ascii?Q?LrQJ3f36wNpa2zDCDQ7+Phif5Ib5zy1BValOUOjlrWDbIHuDK2qycVKDRxFU?=
 =?us-ascii?Q?bh+KuMRXCYL9gbQloEFYnGZobAiSO6s6bIUq1oqgWkAkmX/zScxSHulO1/Ee?=
 =?us-ascii?Q?jIxtAJ0oaH07paPlnlLoxuiUWeaWF3e1B8OYLHMuAduZLm9fDhmy3gGgxBhK?=
 =?us-ascii?Q?BhbL/6tTg5TXRzNxZUJ2LOqEWomHgQi0YjO1r9VeGZebjjVkZXtZ2dCISAm7?=
 =?us-ascii?Q?EAbzC6VvfVSNOto0Xz36/LoNm5nO/AecWlyEme+GCBZ3xv86Gy8+GrQ65Qa6?=
 =?us-ascii?Q?v8xuTBfx6m9GwQI4UZHQXmPBBM0OPOzS+PUoGSRvlQgAkoqy7n0zHUJCRwvS?=
 =?us-ascii?Q?aE5H7cMAJQ8hTzI+5M6zuzofQJeixwnu2oEwD3Gk?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f63cac2b-4837-4770-a769-08dbcd713527
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:23:51.1076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBGe0dj9eljHvGThQzj3dd4wmUaZDneC4K2ErI1NV3H5rf5C524/Fi0gpiGK+dVfu65SW3EpCpz8r04rS9Snlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8113
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105534

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


