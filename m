Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542E5CDB494
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.60])
 by mx.groups.io with SMTP id smtpd.web11.90066.1697369032343148425
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=WYAAeKAg;
 spf=pass (domain: welotec.com, ip: 40.107.249.60, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IExahFqQ/LVQXaqUtBQiM8lEJIZCLB19yz4RMMGTYQ3UVMXxbnPeT6NQ2JVGwXT59U616ZZYZRrrKQoPQj90Nd2AwBgPtOvo56eUTXzGOwk49YbzhPkLZt8ce3ifh4XDsS6B8surW3uU+ObVNj6Y06G0V828XFrqIXAB5SwYGfUENwep6Wq6imvya9blZRXR+5AvuAbHZ2E8XJw7gUhoyXJyb9NzlKGbntuw4hTHzE0W6e+B8cA7JjT4DbmL1SzTrgEdwiBALRcEDAxaEGYqpTEq1qVgdr2SETBXAs1DYoqJTxzDBbNT6x249Di+XFIwejVluTAlUgmynyBPeBEyjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/uswOqNFOt1x08C3lwLsvp20EExQ/4R5pDoEM+lNso=;
 b=Rwz//tA2OSLSTEsHDceLKSI6hNGqee59tpHRiA9v80WYi714hbDXX51WuYibHNOhlOlWSUaJQfebbF8iUXMCDA4Tjklr5tstZ+PEqawDo2WLt9u1wCKfdXrmARUuBDyQZWePywixyli7aDIy/scoP9RxNKtp9PkjfQ6NGBA6J0nfwmA5Z8PdPBHT3DjxEjPpGD1FQx6YyC6lhYi7HWk0Ch9FQCIWjqtXo9YSBZijLtzLZPP1hFpPz7N6tz4EbWORSzr+BbN9vQTxwrJp+L0u0pXHRas09hrrEypPIhigk7Oxaml1P/mFBHBW8fHb1CPrdAFeDtmI8m3Vcg45ZWbL6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/uswOqNFOt1x08C3lwLsvp20EExQ/4R5pDoEM+lNso=;
 b=WYAAeKAgoRNI/QhkkttxgBl3oTSEecVmjL5ROStn/4gqTiiScqxBcDrFhoCOmbc5lFK+JtoqS3BljabKnhQ2MCfzfCzfj6f74j02A8cqacPFPv6G83pVCgSaPpH9pqKxVoX2Ie58188QMO/Yrs5umlb8pF4tvxEP+lyfAhT93O8d+QtC9bH6J5NKJxnQb+gsiSunRWgFmcCkwarcSJnl234AkIhXGph5PbitA5py5ZD1xvoLXR0ow9N/ldk8B5+mVtahX2U4ayA+e/9TxA7RbaYyri/Ltn5gxfTOggSUvMjnsMNMYe3jRJRTRYWsFfNNclyVPR+ixDYtRfiC0AO8uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8113.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 11:23:50 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:23:50 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 04/11] path.py: add support for ACLs and all additional attributes
Date: Sun, 15 Oct 2023 13:23:29 +0200
Message-ID: <20231015112336.55722-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015112336.55722-1-p.lobacz@welotec.com>
References: <20231015112336.55722-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7ab475-2ce7-4862-399b-08dbcd713477
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FuNzlhxeifEYmvtth6K67sQErhuiNiV0DYqiZcwlzkWrtGmzrCBG3AIgPWEu24cdLpKZPlwsIy1nE6vhR2oci6j8yafsvWl3wO6sjde1V1V/9RG7nhfI2YkV39fqqirgw7EieCAUmefHFP3uCTvrimePL0XIO4XIJ8OXY3681HLHl8WZzwxVrrODZD4Xs1mJwjzMWvAxWlnOaCttqIQPVeBEx3m3LHox9LwLO5VX2sQ1/Xni2JAW5YMMKxVxGV58pBgu2WrK0pM54ondLvHqnXR33d8JO49iEAvnomy08GwOz9MwDi5wz2DsqsgyfCCuHSHJRc+L5RapgCGLkyEFRnQp1zSG+hAwJ9rpSLSm1qu2zYFq5N2WWz9dtWUGo8mvpk/CY4SlYKMXno8v9ei8jDwhaNqDwQGqgCuYQCqOHYu80vljjqiXf/nibywJpWfztcRjuXLEbFSwE5ZqchNn+sob0hG7NkdBlP79KEpHpDulHna9+SH/sQsuR5R2SnFKLzG5jQS6Cv37Tc7Xe4mV0NBsoBv9ID1bQUbT/XImlKUhTN7+MViLmIvOAqEmmllC9b23CAHILvNdYohu2IHxXIUX9QxTgzazuQFj10FVLRMPRpvz+/o+/+W/FOflEalT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39830400003)(186009)(1800799009)(451199024)(64100799003)(478600001)(6486002)(66946007)(6916009)(66476007)(66556008)(6666004)(83380400001)(86362001)(38100700002)(316002)(6512007)(66574015)(26005)(1076003)(107886003)(52116002)(6506007)(2616005)(5660300002)(41300700001)(36756003)(8936002)(8676002)(4326008)(38350700005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vu47PQ7lLz5jKiVqpJmooxd2oLxP77nys42Uk0mNfwwnoGRMV7KqFfa7fnhK?=
 =?us-ascii?Q?H6t4gRPFRhDMvhAGQLv1aCMmUhSVJkTc2AINnsWnxxIxMUk5Nt0ptPYTQlSV?=
 =?us-ascii?Q?cOhs87PAEHR6/LoMl2yprbfRrFbV/BlaCKxKAG3t2suZ0vdd3duPYB4g7ODG?=
 =?us-ascii?Q?09WP88mvnA8992JBMz2VQ4WX+6X2Qykn+UQvx4MkuXvhpGmucFa/IGO/rece?=
 =?us-ascii?Q?QIfzDWXFsUW0hfD5UyKl/MYBAEOu6vGQROrsYS015DQ/yCLX7oueJoroW2H/?=
 =?us-ascii?Q?yA3jHptVmfJT9LqJSk+fFscK8i6KsfEZBZt90s4x/0hQCdc0jsY9dRVwZh/i?=
 =?us-ascii?Q?DjoJSqcPxAKyAy26LNrzpapwZAT4vmJ6F1mKUgm+qpFu0FkGqLkU9lgY33ss?=
 =?us-ascii?Q?b7qIA9bYClN9lVjEn25NKstKelUal9sHOhCzGo5/xn6gwjXwD0oC5zc9Y0V3?=
 =?us-ascii?Q?k/91AZwu7P/Fn52NuhM/kXK2re3Bnel/MmboQOlteo4/9vT7cyKiG3mcpPAQ?=
 =?us-ascii?Q?VeXiIFerm8o70WtCWyhqGIM08LQPcZeA6USRmb0y67lOMsm8PYSxUwC5fkh2?=
 =?us-ascii?Q?Z/0pjq8XqTMc7WWPMP/TCwdCz+9bSVms3MeTZoW2sLk7V5I+W2uVhGyeiDh6?=
 =?us-ascii?Q?OoUc6nSdH9cqsMUqJ7gZhcG2AvClSUehrMNtYLV2fNI0GQJ3yyvX81XyEtNk?=
 =?us-ascii?Q?6TBx/TETwomMUZPQY/g45zDlRelJdjKd9OT3+9kOWQd94PpHEjW3K7/YiTby?=
 =?us-ascii?Q?92f4RU323qxezFyCTXdeERG3fcassJOdZ+6VTxk2+9gGUk+4jFMJwYtmWj2f?=
 =?us-ascii?Q?FiaxAqMrqNLn9xU6MIEOMIRNhEne1IVKnepDMBylZV1ggeb+mGovNu1/Ez9N?=
 =?us-ascii?Q?cyMbqZbd9vpr/lgXySw/tlnNKhfAT/4eHtuznewN6DZv1HzZX+kx9w2QPzuG?=
 =?us-ascii?Q?g6riSrueZL3SLwnEckEG5k+jo9QlnZB7V1D5GvtaIgnQKGHA48+SzlmudAIO?=
 =?us-ascii?Q?kplYg7jBBa9PpjdaOxBhubXi1eXyxhZADqhf9AGrrfF7v0Vmtz/6Qra4R0VU?=
 =?us-ascii?Q?yMPd2qLT4ng9s802CLJOymWFIKlsJW0/D4eAOFDc4Xts/Koa8t6k7TUDrq/P?=
 =?us-ascii?Q?2KtZBSCbJGf30m0Qj3Q1GuO/aXIizV7o70c2vBVED+7v1Vd8Ak8Se9V6Kjq4?=
 =?us-ascii?Q?pySDmiKeboCJazvtNydOVYsJ2g0qaGzGRaPB1J/PkrMxF7pLewOsS7AaEtNI?=
 =?us-ascii?Q?2VLaZ6grdX6EyxpkNHtSl0gvMJaKNfOq9yd3hRRck4pBG5dqrjoLQ4DebLg/?=
 =?us-ascii?Q?2iG5ck9q1DcjqroFjrz5TEXSL6DkMqe5Rt5bWCuMxtFd9YOfnooIaHo3oCyf?=
 =?us-ascii?Q?eIANqvVvo6cUHVfdl8dComFGjeYTTLlbW7ZsLI7C+Py7TwcoY0raNuhPWUfM?=
 =?us-ascii?Q?dZWNTRs6YuHb1Ui63EWBYtAFl6Uwqk7Gfc5el8LHUtJuAu/FZiV54/fUR4a5?=
 =?us-ascii?Q?914Pzyh9B+N66XyG3Uerd4kQPAuLu4sKjZ4qUQYdHYFQghCQEIo87rNGnfLF?=
 =?us-ascii?Q?gtYQsEMlm6Ao03bRY7DLdf3h/8AfQCT8JXqzYeXo?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7ab475-2ce7-4862-399b-08dbcd713477
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:23:50.0110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nx5W+eLdSNM7lwuMgN+aCpziYqBzrcYin7pc+ACKsSEWwLOwnR2eaakccK0LeKKMbrUaR9XKOJ5ZcZOBMdIFJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8113
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105532

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


