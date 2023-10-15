Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1E5CDB48D
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:06 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web11.89849.1697367728016861852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=iOaZOrLR;
 spf=pass (domain: welotec.com, ip: 40.107.21.80, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bP5Niz0ndEtOWdUOWE3t2Il0pbd+j+9CrGo9feEnBnmEo7PR6+oKh2FL96fA80FcYhVYQVtL8CpU7vJR2Xxbpq5ctzq4xR/LonwoRkOGeiWFvc+ie1NdDoUVwvYicx9G9fd+kXxTmXOZ0Y+oIX5uW1HRB4nd5fjKPUQ2vMxLT1e+uV2RE2/MADFldewavJTX/YwHZbsKEeMrEQreGRny1HM52AqJ5iqWQtNty0WTNMtMQlMRbnFyPUmTRJC5MisFnL+4OpKdPVfarrqYbjmUXqn4HNm54VCvLswR7A3usPAnBWQosn+Ymy5rlAS2Eg9cx9EtJRg3Nhj6vZakElj8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnX9tAVxLp4QlhJzMxAxH/3nnIEHsh8J9yRQjoMvhIs=;
 b=VtGE/MOd3nmYZMzdlJ+LvEi2mJyLrUPRkOl3c8/Rz99UANuqm2ADHBBpoNa3E48SmuEhw8UzFCvnWxZgR1dyl/tvSbDBMFDmem3KL6I+3cHhp/btWa4eo71pHWCeYQWw2Z8wO1fflZ2x5NqKXf6DfH/pJjjevECsPjRXCZk2iVpMY7QfeTzUY/7nYuQmpWymC2I9iHiCYGq88yglHkEfA+8lMrIIRrCnmER6oe5wp72O1Ep3q34VLxvc9RZYPks8vEC6GNtllHgOzuMTV6DDDw58z1aCf56+ad4xXTqiufun5vkyTAS51ehwYnGZrknF5/0kKMwBwEGWx+LgjqP8lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnX9tAVxLp4QlhJzMxAxH/3nnIEHsh8J9yRQjoMvhIs=;
 b=iOaZOrLR46Egbh6Ifrn7bTF1WvpE9rRiINXTjEjD2BZ8t5+/BzRvfv7P+W+Qt7zjxMkAKeJfJQp32eLemozvJNsVl/X8yLuPQ7pLfT395NtM1uYasR5+/CeeULoZy2eTwOkDNO92bKDN3WPo3m/LQP/2UwxC1DXAYoAfXU+lbinmycMVfa+1MP5IKYiyl+M1TIWmX5xQVIxtdQwRnmznqpZafWkDPjhgkAXZxUWG7HJysi9DbI6vQr7skisg9n/OvRW5hFJJ3NQe7ziNQv5xw66TlFfnFUP/oOFKcocWC8uoLk4qwaVa2KuVOsXYZrd+uXSkLgBV3WCDhrHD5sAtNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 11:02:05 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:02:05 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz=20via=20lists=2Eopenembedded=2Eorg?= <p.lobacz=welotec.com@lists.openembedded.org>,
	=?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 04/11] path.py: add support for ACLs and all additional attributes
Date: Sun, 15 Oct 2023 13:01:47 +0200
Message-ID: <20231015110154.53364-4-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110154.53364-1-p.lobacz@welotec.com>
References: <20231015110154.53364-1-p.lobacz@welotec.com>
X-ClientProxiedBy: BE1P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 45bf8a35-5b7f-4a03-430e-08dbcd6e2abd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	um5G31PZrTgcy2HKAetHyUnzX6WoxTzu0X1ht0nQ2S61l5edyp6ufFFNzCxDyYIPvoZWdV5hKWJQKXKglQELYJL6CKISer6OUumP2huc/w5dqc1BnS2rqEnO9r9b5Nchq/ixzQJMxGCN5Rr415KQgVEAc/3h8cc6HTKw5eGqMKg8iC93k0Q+lBjeE3gtzjRgYFlzWpoKWVQ8/kv6mkHf35u2X9r63AZ+T4g6WCvLmXWsox7wVowXUhAW8A1GkRwt3RvTfm55sDprfDJBE+T78DiRjhTke+9YVrGERdgqLj8doh5kWNf7yl85KzjorEjSd19qFyuKNHu2VXLfRRNchT8xh+abEXs2V/lJp4z40kvZUNxpdY15I2Rh3i798tCZaSLBXRyIJFAVZBjAWkocpx7fy87CwN2OsgQPayfxV9oJEisqzV4lYKNv/iH3d/c4KMJTsIcLU5rv2rvBoMetGejxb3OD8imGTdiEz2R9l1wYmzKcbRAbmMPjUieayQ1pC6H0KzEMWU75AUd3xncr4wREJg2MFXIED28E99qTiIpsXY15letBWakesgo5lm54dM6+TO2eDjnYaGbb6T672pr5otO9BGbvvmuj6aYf8M3c+c1oWmoEdqW/MNZsNkie
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(6486002)(83380400001)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(54906003)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(450100002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?viytxgE67OYAuD9iAIrfc2N55r6fpRI/aVLmIj2zLvZSvNYGS24agOiQOkeJ?=
 =?us-ascii?Q?t4fu7c68t0jhH/u3KNior4HgOxgdXoNn1CJExXHH+J7Uc7bH6YqqcWRsb1U5?=
 =?us-ascii?Q?h4lv2mz4WBnzn6qxj2xc0X0cRgcZ7RhOApE27+eGiYKoy/5Z1T50O7g1rM9w?=
 =?us-ascii?Q?TcqbC6ZB2Y0IzG1utqR2j8KzGzoXNeoziq2tUnx+K3/WD/zpplznw5PP1jgl?=
 =?us-ascii?Q?ebyb71DC/0pRVe1Aw0pe75zoVMM3ASIm0z0q31URESPprFkRc8T1fYBEdeeo?=
 =?us-ascii?Q?30SWR0Fp1AjE83c42TXdPNLCWG6RbE8Ac54iIdNYqktI/8vrROgoDCJHFTcz?=
 =?us-ascii?Q?reBr7/WShEw+nyebVQiSRPh0DtWCrasN1udDil64PyyMJTyebXzET7x31i/Q?=
 =?us-ascii?Q?mQtjiInSo4UaQitToZM8U9TQdqGZJJx0GB7oKJYmV8X9vxZNxwPOEaUvBaM1?=
 =?us-ascii?Q?Sj2yBsP3uQsEN8ay9JkGiDxHUYRwmuBOAqIOjyjY3vA98XvIeqpUWim9xwPp?=
 =?us-ascii?Q?04YdhQLkyAgYDHR7Km7yG19hxjxxvA0br/4S5aNPuSBCgYsZjPNcaYg5mbp3?=
 =?us-ascii?Q?bAf8RP0WethzhvQUOL98/vC776bZP13+8xl0JLIFrgwOhXSTLztLvip1Vzny?=
 =?us-ascii?Q?616l5efxKa7XNe1KNKkQmYyDr118/8mMZoARBQhwM0YEJ/ziiZj0LcsjyaTG?=
 =?us-ascii?Q?QwP1+ZMxkjo0KMDjhHLsKyfYqiPy12aR+YzseQdLTn45+V+YCEdA8EI1aD3h?=
 =?us-ascii?Q?VJq/Hh7j7ziMWPk41pesMCGanQQnRMBiVhqAEXzzp94bdaoKnuuFxMDIhpon?=
 =?us-ascii?Q?Niq2+/igGbzhuFeVDtwWkRpmcVAFI6gtS5c1JekiRYfCuXhv5BWS5LOSqYZl?=
 =?us-ascii?Q?u2vKAGAyx7rAixIW+p52L0v9ZA61GBbY+p+SmyeFm1YC7nQnSbl/dvsZ9EBi?=
 =?us-ascii?Q?fJZlVcGWZEFue8SA3UK3N3oZS8MNowaeqjX58KLelkmL4rariI79gcaBIK9W?=
 =?us-ascii?Q?Nh8cToy3t7Ut+1GT/4zOpN1nB3KGCEaME1UmjfbBZAr/sROHKB0y9Serh26a?=
 =?us-ascii?Q?UQsevcRNfURHETVmTLX6OWTL0s8yU63ijmmXVWxQQ8SUggcg7Z23hbqKDAED?=
 =?us-ascii?Q?et8GQJUMYXe56navwZx2FHW+ufEkKTDjcO36bCycSig5cUjTgnc7O9dF66Ap?=
 =?us-ascii?Q?5GB1Lf5rgVK87FCrTel8Wpqtn4cY3BqIrL2DSLFV6PCcrAs4T0b9AiuUufNO?=
 =?us-ascii?Q?zkde8MrzH33an/qRT0+dAtBoUHjcdXoVJRTDS87BsjI8k41+GSuyxpSpnddp?=
 =?us-ascii?Q?K0//++2L7cgludqQKwIFXO4ocEbc7xStmWtFiv59MDteIXy1tGHHMr6dVuil?=
 =?us-ascii?Q?RH/XqRu+pOSiXZGIhnP1g9s2yCRKXqc7lZgyfs+GI0vInal0DFoeSRqzt4x4?=
 =?us-ascii?Q?SzP65E5iOFXHLPsYvO1ooOdEfNdx/twLffK9U67j7iV33N7tuwzzwYcI1/ye?=
 =?us-ascii?Q?aBB+vOrc3ZCUnE+BnDKYDst2cfDckP8bwGTF07vCZJhrBrE2unYuIqA/zf1q?=
 =?us-ascii?Q?aTxNxAsL3+3prsjLrUSl+WlZMdOBHFOZAUWB+8qn?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45bf8a35-5b7f-4a03-430e-08dbcd6e2abd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:02:05.2150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00Z0ENlMjNDxWcwhJfu0h/byZARa7UXcPmZolDa4jWmgVlDNKSxAzWf0vxoRdc7L3TedMP6BxTh8IWxDljHaCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105508

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


