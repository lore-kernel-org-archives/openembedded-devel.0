Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E872ECDB489
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:06 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.52])
 by mx.groups.io with SMTP id smtpd.web10.89880.1697367079777818269
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 03:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=Q1m/u5K1;
 spf=pass (domain: welotec.com, ip: 40.107.7.52, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGOZuDCOOHBbXFxCbQiKYf/S2yaqJJIPn9/67jNVBmHJuhMhBhWMv6iPyeSBOhuRYbbdQS/ugKwa4Gwp7g28M14brsWmpJ8GerMY8fkzc74kRPLTphuJlx3XTiEH84UDRc59FcfzMZ/WceVpdyYnkkxx0ZfELxqXZUA7WXrPDzfaw7GMS/FCkuoRwlhWReKkcl+cihfg/0//NwSXXnjpSlPnGgM+NFwmvw6XDU3FKPdN/7RpiEOqjmF51DQdWniV42Quu6ffQYvWu7UzmUwgnWqqAHAwYZD/K5M2Wqa3++n55bHyYt9rPFqHTZXrGzBU32Qv/e4/Of1aGDk9WgUmyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnX9tAVxLp4QlhJzMxAxH/3nnIEHsh8J9yRQjoMvhIs=;
 b=LObFS1R0D2Cnm7frALmk6zEIqyndamgqe4RsOew0LQ3yStJKJCBwXIYaJSuVKBQ9Ow3SmBIekaHSQ0U9e0VvTplkxGtWS7QeGPT0R3yc+a6aaJnhGijLj4WZrjJx9muv5c21tRW4mp1Elr/kZWnpJPz2tV/j4vf1cE1iV895eE39eyJaXymbS5eSAZknby3rpFUsFN/4RAzHb5FtodpnqOCtpkRx25T4WoYBIePj9b0Bf4sVYWBlozoPL6a3S+WakKVjdaEBDM2GqaLc4PKR5HXA+xBZceQmoSCUJCwI0fH3ea0Np8ihOdd3ztVrKOurb0tl/qVkiDRmB5aeLcBidQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnX9tAVxLp4QlhJzMxAxH/3nnIEHsh8J9yRQjoMvhIs=;
 b=Q1m/u5K1zPMU+mgLWonDAydmOwtq2taaMjXAeJSiYZ8Dnlnloeb4XGWhJZHGSgaJlpm5+pAbBfJnhuW07EGGAKDU9tyeOyMfnxWCMYIwEI37oKSiRy2inFTT4E3cYJEHJqJCJO5xk1Cm1coTJBHSt9dXgjrBVd7bP9P9FzA4EDucmg7BFYBVH1PLpPNfqDhzx83UaltdYftN83NpS+TRaPTH57K9qbfnFfjSl5jpW8gF4BzmZGEcu/WFoSRdJ1mlwPXNrhJ4dRrE3GorDOTalZTBUvjcTw6RJt7tk8AXBPQC+mSQJsEleCuRSdKoH48xkwaTW2lH83FAHSNBh1ge7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 10:51:13 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 10:51:13 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz=20via=20lists=2Eopenembedded=2Eorg?= <p.lobacz=welotec.com@lists.openembedded.org>,
	=?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 04/11] path.py: add support for ACLs and all additional attributes
Date: Sun, 15 Oct 2023 12:50:48 +0200
Message-ID: <20231015105055.52510-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015105055.52510-1-p.lobacz@welotec.com>
References: <20231015105055.52510-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR2P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: cb040596-61b5-4010-1066-08dbcd6ca636
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PNbIgkgSahbNdOg+TADpIJhrJ1p8+uGCXuXY/WHpTKqd9nmTez9LahUIbftFdygXCPl/juNov8vyM2TE5tzk3qV7uy3qdtKH/xoVTdfgNavquioBNAm4GIzzDqORkbaLWo0SZT+pkaubN/1bCiwAtpD8mQsGhKlSnJZPEjegaRhtNwChRjdY9y565wdYzXNRRahzT9j2C6OYOPIvUsrVZgmeiFJmD1WBbjUIYSKwiAHVizWmwy58PCTuFAIl4ZfZElONNxHIok6awylIwd3aUhSr6f98bTpxE+skTNB8LDwjKYLcvlKsZGKN4ovQeeTSkmNmLj1YdfWF7zju9fvHQtYoHaLHtWdurCSawGDU2Ko948PdWXDyP/HiUbyZoOtfNP9+wd9FbZRAD9mt2SD9ZUAB9okRZhWDQS5klGRDl0gRQFS4oxJJqyQiH3EdWG/rGXPgIjYcsDYPvxRniX1u2DviiV3SSsmaDPCK2NAfEiv/r1S7lcKwiI28ft/71S3X2us/4GKLQ0tykVExAAbDN1nI7fXIuKXLOhQgnnrvT2i5D3ehRrE4JoMsx6xvPggbrjcChbr7wDVwJiO0X9uDvsFdUm/VCbc2JNye+Zd+H0K5tUKhCPv3bcV214KTX9pO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39830400003)(396003)(366004)(1800799009)(64100799003)(451199024)(186009)(38100700002)(6512007)(26005)(66574015)(2616005)(1076003)(478600001)(6486002)(5660300002)(8676002)(4326008)(450100002)(8936002)(86362001)(2906002)(6916009)(316002)(54906003)(36756003)(41300700001)(66476007)(66556008)(66946007)(6666004)(52116002)(6506007)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j9vCzqIv2s4DWKPoiUxFi6o1pkYTujW4T/X3enHdbL1oS+w+cA6rpOXpBzgV?=
 =?us-ascii?Q?QybtlWQb9DUebYa11y1pVBgwETlfby/EFw1bujBEygfhzZGHLZUyoA22ceTD?=
 =?us-ascii?Q?+Gt7e/dCqaqZYDDqY4Fb5KEst6zxgg+Vpg2BWCCjMzNw1yFw21cGFHhY+vt8?=
 =?us-ascii?Q?NkYsdLJs/YLF6U0FVlGKcEswXaIOl22xPef/2LfOWwuCKe9z5kGAV9474gTG?=
 =?us-ascii?Q?8qObOmfqHqrDpDSGl7g7RwHUZUZUeuyUip3ZGjam6aADpcDctY1m+S1t4sq7?=
 =?us-ascii?Q?3LG+IkwdoObqGDPhhvIIbgNgVZpCK6HsMHTUEqZu4et6Md2B/xjTDM1uJVjW?=
 =?us-ascii?Q?F8zI/dFE5XpsrEaRbx2dcXvXfTjyKjh5HpdS0qWNcJXz57I4LXg+QIGnrwFQ?=
 =?us-ascii?Q?yAIh8U7usOLuv1U38q9psYZsVsbc0l5BhfDq0zdPe0Z5wWIW5+UG2sM1JfEF?=
 =?us-ascii?Q?HDkNy8LzFFmzPvPZGhbtT8PqtrkNNst/cgR4GNMIOp98/Vm6qy8rL4P7p0BX?=
 =?us-ascii?Q?H5X6w8L4F5sOvwNcDJXER8zSG0++5xFQaeTPBSt4LDjmNRRMj627n/cnGgXT?=
 =?us-ascii?Q?vE8ezqa6+d/1sfWX5PoduCm3Vn9UjJRREHJJ6JlDz8G0BfeZo1X1UV4P/9vD?=
 =?us-ascii?Q?HlTdxCREtvuFt89LKap0CWPvjK2TjaWHHEhLHsKTYcpvhN1cDlBnWcZwl7D9?=
 =?us-ascii?Q?AifCCfPEHb1VRlaMALiSlYyaj6V4VpHtuMYswarRggHwkaavNUbkRBqUG/+e?=
 =?us-ascii?Q?f9Zr+kop9bm4+rpXx0j5B8llwStOyyfjDh8bUrbt2l9QTEMqSBATnGri9i3f?=
 =?us-ascii?Q?3IVkNRF6Un8D1wKC5wMjVwLZXOT+upWFMH10C5QmyBFN4/1EJ/poILyW3N5B?=
 =?us-ascii?Q?oHswe2mZDQ9IGg/QKQ2Hm8OfSQ6Tkj6gSuQnNJhkebMyNDqL+0KZOY8UCZU1?=
 =?us-ascii?Q?j6OMGEZVcKeiwb0esb0++Zqj6soTvu+8Tmb8AN6izGESNE0H3rG4dEh+ycaH?=
 =?us-ascii?Q?3W60bLvYAaspwBhBweAwOgj7tBB+YacFRHCtYpOgSNPEbdRZ8gOJFplB5Yuy?=
 =?us-ascii?Q?TNcHgz/miFiTbmcxaer7UjhHdVKySL+2o5IZolXHY77qsYhneSo2jrHMYGsm?=
 =?us-ascii?Q?INTmgg3Kr82pfQ3kLG3LIZ3iXXy+16dRnZvH6b4wBKhnniADV3gpn8jcSaHm?=
 =?us-ascii?Q?2YgjkaDkZ369SpR6PtlC7Jm5S8mt6HfxgqiVHiDFXl5axrIObUTShYD4G9XF?=
 =?us-ascii?Q?Mlx0mUgG99nIiHf0iP5roR0U2BUogu8kcFjV/VQDT0pWjWe5sKhCms64iG2b?=
 =?us-ascii?Q?UxaaHAH8yZvvbFaSCeYpu5BNOsQpsJhleEmt5GrEEDGNeukO84N7K//vola4?=
 =?us-ascii?Q?O3de2fnTMF7gAgv59jVIUDJRnNyOVi/BNQ5l0vXt9d0pc9J6y8hcGo0+wDAY?=
 =?us-ascii?Q?niAxpBJU18kHbLM5RaBfJxDp3N8QxcmgV1NcvXiRBwaamGVY6gVQPuiLo+AG?=
 =?us-ascii?Q?W4u0WONQ3PQ8ulDaVayft0CaLEcpugIJP3B4aFmAKmOVetLyMZ0CKjoL+ihQ?=
 =?us-ascii?Q?tgYhCjxBKipBChcYVWduLg9w3dH/3+yvnJPIueD9?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb040596-61b5-4010-1066-08dbcd6ca636
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 10:51:13.2972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGBfXmTBVc4P74jhRcpuZU+qAnCM4ete/dOldZrZ3s/uQ8Pq66jcCmHSfaoi9eW7ZX3iXie9v/GunZ41UYjGdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105504

From: Piotr =C5=81obacz via lists.openembedded.org <p.lobacz=3Dwelotec.com@=
lists.openembedded.org>

Extend `tar` command inside copytree() and copyhardlinktree() functions,
with additional parameters, in order to support ACLs and xattr. The posix
format doesn't need to be set in here, as GNU tar switches to it whenewer
is uses --acls and/or --xattrs parameters.

Additionaly change preservation of additional attributes for `cp` command
to all (meaning mode, ownership, timestamps etc.) not only xattrs, which
were previously.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/lib/oe/path.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 0dc8f172d5..56e8e214ac 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -92,7 +92,7 @@ def copytree(src, dst):
     # This way we also preserve hardlinks between files in the tree.
=20
     bb.utils.mkdirhier(dst)
-    cmd =3D "tar --xattrs --xattrs-include=3D'*' -cf - -S -C %s -p . | tar=
 --xattrs --xattrs-include=3D'*' -xf - -C %s" % (src, dst)
+    cmd =3D "tar --acls --xattrs --xattrs-include=3D'*' -cf - -S -C %s -p =
. | tar --acls --xattrs --xattrs-include=3D'*' -xf - -C %s" % (src, dst)
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
 def copyhardlinktree(src, dst):
@@ -119,7 +119,7 @@ def copyhardlinktree(src, dst):
     if (canhard):
         # Need to copy directories only with tar first since cp will error=
 if two=20
         # writers try and create a directory at the same time
-        cmd =3D "cd %s; find . -type d -print | tar --xattrs --xattrs-incl=
ude=3D'*' -cf - -S -C %s -p --no-recursion --files-from - | tar --xattrs --=
xattrs-include=3D'*' -xhf - -C %s" % (src, src, dst)
+        cmd =3D "cd %s; find . -type d -print | tar --acls --xattrs --xatt=
rs-include=3D'*' -cf - -S -C %s -p --no-recursion --files-from - | tar --ac=
ls --xattrs --xattrs-include=3D'*' -xhf - -C %s" % (src, src, dst)
         subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STD=
OUT)
         source =3D ''
         if os.path.isdir(src):
@@ -130,7 +130,7 @@ def copyhardlinktree(src, dst):
         else:
             source =3D src
             s_dir =3D os.getcwd()
-        cmd =3D 'cp -afl --preserve=3Dxattr %s %s' % (source, os.path.real=
path(dst))
+        cmd =3D 'cp -afl --preserve=3Dall %s %s' % (source, os.path.realpa=
th(dst))
         subprocess.check_output(cmd, shell=3DTrue, cwd=3Ds_dir, stderr=3Ds=
ubprocess.STDOUT)
     else:
         copytree(src, dst)
--=20
2.42.0


