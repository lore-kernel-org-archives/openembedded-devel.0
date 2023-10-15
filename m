Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5216CDB487
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:06 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.83])
 by mx.groups.io with SMTP id smtpd.web10.89881.1697367080398083208
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 03:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=ByU6Y507;
 spf=pass (domain: welotec.com, ip: 40.107.7.83, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJ/JJxEpobwS2T3IGfDPdqC5KopJmkQbMqv068vpzgOsECGx3eLHVlpne9MjrdIv1FG2U1IGr5TM5vjRRbxTnE8Q2Akd0EODp1ef+0TXbFmRk9aYAVQBqSWYHEgsSHSygDxN08/FgveOef7uyi+O8DCRZAqtpoeTw8HwC0v2okM99EfBEHG3kZ1YXKZeJ2rogxiQ6DGsrfercFyoEa/zm09G2poQ8/hcxiKbUrpZl67br4L6Hmr+COwOCt5vjqqHj2nK2zEcqZz/+74TtXU+cveGEjOC5NmYUvVG7Foffm0zksm+QhsI7FzcPKAN8hcx9X56q6U/N9/hHm5mAJiHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMcad87igkPOQdlt5omEoFA/YQ0WOqE9pSirTeraGHY=;
 b=QUWSa/mQV9nDcq4rmtQEr54VpDjuoIFSUYR9eoFTh40zAt9GjDaNgtOyvPA79KTEiK7zUG2rJKYrbud75ESn/rFrPy18Bdqep0ACtVrVMPhay5thTUWtCFkezCnpRoL4T4ZDZCRqE3SNLIAovHzL4+Eqi/SBJhYoaSPHG7x6R5pPmvOX5a9peSA0zSE3i0SxfY4ePMpPciWFTS6173KzjksIC/YKFXvggCpeHqacw4HFpPSqrEoknAgcXrTFUcVgTi3GhWUUAHp8ZCLQaUgcQiBwETTseHXMRuJU4l6SyEDPl67OpuKEGC89j7myBmLpGi017pk4KfqnCd2t/EXyVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMcad87igkPOQdlt5omEoFA/YQ0WOqE9pSirTeraGHY=;
 b=ByU6Y50749gYbuvOXKgCXjd9OBQxecJznedjm8Tzr537KpvimnUWs7xCHSLssxn9P7pV2dZRhJnvkTMh7RDXxH5lIVEEvh9MgF1YTLIpNmTxsOaPVmQsZXfTKVAvB/zz5HSFKe6eHE3HHLkIc7auR2IwK/EZwBYuhcoTYVTVsbS+rpoPpZGUM+Admc032F1rQuAZJfCS9rwIzy2l926BywrrQwkFDv6eI4kkxQ3C7saDywqr5in1hR1pKPWJBew75XPmiq6HKZ7Kjnn/2joHpZ8ZxPAXZIB07VKgPoKAHMd6UNfDPaSDvB5FHgnXkBZNN6513ufn2aTMAcwBETqrjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 10:51:14 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 10:51:14 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 06/11] package.bbclass: add support for ACLs and xattr
Date: Sun, 15 Oct 2023 12:50:50 +0200
Message-ID: <20231015105055.52510-6-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015105055.52510-1-p.lobacz@welotec.com>
References: <20231015105055.52510-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR2P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 32249d44-a0e2-49bb-9283-08dbcd6ca6da
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	drpWzc2UvjWhgHcjeXGV2HzhK62NSocsGqxsZKMQ99hAzh5EUS8hO+a/p3GT0sa4LDQU5iGK8FhAIAnmTPOvcN4QY57vEASWO4eVjRm3fsEjJ9J+gz+fV0RuNqAODhFg6DdZ4sIHO24lrf79XLVvV3l9C94PneTJ5SqqN5NmLAX1VwECqIA11tgsSew66IBDPbK/UhB+DJUMXxMDpP2qc5EjrlcGEOmlaSFxeoGmVUIKoBjVDBC4rMIqmgMAxK1CwHT9KfJjDeHOJQXXQ7oDQE8melCdwHXK9/R2bEVL4gw6YFj603ZxwUHMlhRgrd3TQMV/boKu8BpxHE3gq3kyhNz9BuXWw29gv1gF2/CHPJOz8Oewbn3fVwxluOin7rFWQrQmvg73BRL9Cb80K9H9jkKaiROBQT/IQ8y/C+LDaAy6dUtkZ2XYbty3IceXrAl93P0noraqCysiNSfWe3hB4f6OVBVzDZaMcHD71XMCW+u+iMaCJqjfiq/c6oMl8I4URf65wjRtfwedIKvu46752HFateI1L0Y5UrQ26ZGfPN7wfOYHW4Mjmfd9+utPcZ3BspepgVevaWFGp/ymLRJjLqcrUQeyiIvKYvU37Q8Md4y9VLqmHm9iNQOdWcOFwMKJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39830400003)(396003)(366004)(1800799009)(64100799003)(451199024)(186009)(38100700002)(6512007)(26005)(66574015)(107886003)(2616005)(1076003)(478600001)(6486002)(5660300002)(8676002)(4326008)(8936002)(86362001)(2906002)(6916009)(316002)(36756003)(41300700001)(66476007)(66556008)(66946007)(6666004)(52116002)(6506007)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a9mLIyhklB2Ny38WHsneA9CVI6Svy+C2avncM/5v9V9EgnMvLae763Ei6vJ6?=
 =?us-ascii?Q?gd6lygK8bMdpy6zQ+GVHX6XLatNcY4iuCJZ91dxPFooFlv3pCLxY4gbHmqz2?=
 =?us-ascii?Q?117iSdAV+osxqHFD2AVkph3v+akIJcRaOpWeooTaihlV/gBISrttl2KkRPIa?=
 =?us-ascii?Q?21z0rOfjbAvlJp62tkbo9zb508ynaqe/YOeiwPbdqjTAXkMkTyvfjLRPHKcN?=
 =?us-ascii?Q?BPDcFzyBG98Y/8HYNgZShSE2URaRZYj/CBXTTaNJm8h/IDvhTSQwdcSDOlij?=
 =?us-ascii?Q?1fo3KbhLnUkWA2Sr6dEIqkI/+PGw6hhnJYZC+SZeORwkNxmPCWX97jMeYc/c?=
 =?us-ascii?Q?nh4ZJZ4VPqMmHy4bY9DWLGDwTTsHc/iDPnlks8zhppu+pVPTHOQWd5O7Rrj0?=
 =?us-ascii?Q?rSWhIQIPzrvgzd6ffN+Pxp81OZLe92NzheYCeExamtM/CQjFT3TPmSF9Yd04?=
 =?us-ascii?Q?+Bo05mCysGpFI5pQUtcBNByWFj4+ehZq4zZKiHTQxm1nZGoekI74B3k1an3r?=
 =?us-ascii?Q?OARU9QyqKx/36wbThAtkHLHDp6u2nUl0soUZJp5qkqPOKYIYb8F5mFauAwlP?=
 =?us-ascii?Q?XonP1QWDJ7hBGNfDA0tlHv1ltlS4leqUmfDo1adNGqDwIGORiLpyWCEUaSMa?=
 =?us-ascii?Q?b8+sOlZBTflCBiChSUS2XgJXKOS3mUBuBY4sTuji5tfdrV5LvetVZKTj7Jt3?=
 =?us-ascii?Q?0SIGiFMOvyBkIPGiiePPWT3tDfdfZv18ey7+9WuP0Kkc2kHZt5VkOhbfq0VQ?=
 =?us-ascii?Q?FlyHEVA7RhoaUOrvI2QobshXdc3TkJgav0ZCqfS1g78IFgpnIg6u3ROebt9D?=
 =?us-ascii?Q?ib8goFTIHNNiYoQyZslqLZyKvRQ6w8/q6rVDvbQu0UesyCJ6LdeGMTFicYBN?=
 =?us-ascii?Q?5xva9RVaARLQTeft1XJ/iL2Q0iMb/VyirnF+yqBLI2G7SbWqxiZKbJv4cDbd?=
 =?us-ascii?Q?lwEFt+CddVEOyWRoW1GX62HBvZItP6YwNUfoVnwEonau8U2ohcFBS2hZbhXN?=
 =?us-ascii?Q?cfBOwM2byk42YVo/ShWglKUpdShRsM+7V6WhovlOUO35EYe7zTjmiUawPWNA?=
 =?us-ascii?Q?6YyJyzh8BU8IFV/CPVuiqTEeTznOrvrbs8i2TJk7D7Ywh0rNNupCmbqI+/j1?=
 =?us-ascii?Q?+OW5drlAaGZ7m3X5tSannzgwBrPF74IN3c1ca5xyIPYH7D3aCbJLwokNHkC1?=
 =?us-ascii?Q?zI65V20kej0G+1kmR6FQ/qw6YOkvl+i0WUm1TtTb1BtLWGa7cJISQn/jTmTM?=
 =?us-ascii?Q?J/jbcIsJziqAYJH16TP6fRvX8NhFiZmHlvjqOEctzXbGESJB7vhGYTwS59l5?=
 =?us-ascii?Q?jw2NMmZ0vKhwzyGUXe/upthrHafZgXF3qhlMD6G8gXXohWRqfXrHU0o1KH1z?=
 =?us-ascii?Q?uZkPI9QEElVaPfda0BhPv6e5Eo6dGPboI5QJ3PiZ+vlXzt3vA/0kcm4zqY3v?=
 =?us-ascii?Q?OEyRUBH2mClIE5V4fVGbZEOrQRNvc6J0RuSYB6QIcMZstQ2Hsm7k510/7wL7?=
 =?us-ascii?Q?FhEw1PwVqyPSDP4BMaX89YrAkJsmET+Ayl2zcqEPy2pBFy/2H9eATccG9USj?=
 =?us-ascii?Q?ZQFHpGT0C8WNOHXrV8xo6LdxoJM1c5/2xapO8pY5?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32249d44-a0e2-49bb-9283-08dbcd6ca6da
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 10:51:14.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pODxoLO8YCWMqwQlI/GPtCvrq4YvTAbrphIM8Px+7yDxlWbCPuheF/BC6iu3I2Y3zWrxVxK2OjbAL8k20mSdOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105499

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


