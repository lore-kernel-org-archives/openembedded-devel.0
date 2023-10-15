Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D6ACDB48A
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.48])
 by mx.groups.io with SMTP id smtpd.web11.89878.1697367950849094118
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=P0yFtzS2;
 spf=pass (domain: welotec.com, ip: 40.107.104.48, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mgh4yE29N0Y2nnvPWO0HdQKwxyc3xQ+ejJEF8zc5ptz2jIwTeICcU31u5GL6oKWsP4bm5AbSiy0HaPy1GOO6SrWl7KFI0CGuTQTqjqUMTVUlhuDvEz6xhB2moAR+KM2lMQSfCrDoAKXZQ7R5wqrDAEiJnUqrKeJ0FoMfv19YK50YIiDfN2Ctv+4WJb23NvpwYwTp2E/7Jbkl6kemEwWAykzXaf3csq3oGQQiCA89SuaDf8UTlq78orI39GiHidFmlUj0U8JUtAmLxpyqV/lxAYr1ycCJDIOKUSIL+zeYKcOqhjV5MBi3qhjuBZ2zktY+hmGv1IMwXAe/rT9reVVioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLXSQT+v4yRbOoAidvosZ/GsLd7NCnFo9+kqyF1NMus=;
 b=DdhtfIsqr50+vfwDNfEmWCSbjxAtu/vAboHGYHAN96qv1LnjvI68tWSfXiyliZzhqNMm2mYBVLfGcdAMzGJQqmDVsSmcSwKSZPvrpYB0A3+LJF6h8gjdGXjTV1bzsfGMZJui5StiTm/9Pysf8SEc+a7yeRSOqiOyBHl+IFqLc3Ak1FnBFYe2esHjxI/NTZ1TNKQcfyo7mNvjYX1GJDEOO2g9ahC4RMSiwHODoXPB659g/YT47dC3T+56ORvV15Ydd0QM1+OCBdt4mMVkUARFdRQ+s57nKggEvW1pltjqkTIalbsD/A4ipc9w5Xdbr4wfx/vi5bPYCtKhZ79S3GBrDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLXSQT+v4yRbOoAidvosZ/GsLd7NCnFo9+kqyF1NMus=;
 b=P0yFtzS2IoC7VhP/mu7PFyEDz6HCxOrHnkqKPciyk8f7a0dGzDF+X8On7lzKWSy9UGwvLEq33MeFswH4V0MCQz7A357DnktpejeG5krGtRPJrdrmTKZAoCUqrF0hoMKC4FH933yeh74LAfOl0OFpWVJF+9EPvJjMRrxz0mDVsorqnD9fHSe0ukCEqG26C7XaDEux1hq+K4+8LfkmAozFvZNOCdvB4CslE6r46DB+TCSzVrlppEErtvV/E3yUyRcP7g6X8mJBC7g4bFdg6xozwqDXp8ANeXX/avqz8ajata83iQALOzps9ByOx8geIbfqKbepx6oCEHvIw9KX5gyCpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 11:05:49 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:05:49 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 03/11] sstate.bbclass: override tar with tar-native
Date: Sun, 15 Oct 2023 13:05:18 +0200
Message-ID: <20231015110526.53738-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110526.53738-1-p.lobacz@welotec.com>
References: <20231015110526.53738-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR4P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2e01f6-9dfa-4ba6-796f-08dbcd6eb03e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C3Er9Ben5mGlyX9snbIkoHsExpr7G4Hd+ioPeZjGetfp7zZGoa75fi3cH6/lVuOj8Aa55e2zaQ76yBARRUK0xCtJ53gyY2FuJ6yzMD8mLZ3pQTRa+UXUasTwXeuzhNY/QtAac8U45HcQBQrNDxyNLJuOlQytJW/h7A0PmEAyGPmWAtzYAsnPS9zPA2v8r7jFXWpYY2PjYbMW9QNGpZnfa9ub/L8T0c/ppr+Maka0GFhB6igc40bhScUj+Og8+z8E8yEEexMRra8XniwPc4NWi93I0QLwY1VHZCc0mwqc9WtZwKYNLA8Mqze+ImAafLvNWr4eIPMKZhHKuHnp92er1iIA6lid1+OETIqMxYhelPITjun2zpqkhsNcelz7Uj3IGmiFd97SU14k44sjaG0QtUFid1u42r7kC4Pa56p7CwZS2Ah/biC6gPEbzREJXzXIwXfL54Si+QraW5QszBj5Z+5sHiBEu4PFqf4aXDWSzqD0jZq+Kw4pXM5foYoh9xOiGDTs/g6nbgKehgyZRm8PbRRIM3XwOb6l+S2lZJwkUpWXN/DWayexpZjC1W0e4T3KjNLnxXzdMCbO3SI9JHFuJ5mtUzX2ziA73b+Y+Uh2/hk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(966005)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G/3Uu+23mzGKfYx5D2jzXqpouiJ68SluhEB96bw7d6dC4JBXXtn7rjXWmLIw?=
 =?us-ascii?Q?yYDM0bvXH1277TiT2vYD3xhUCeildewqKFiLytv0bGhIWmFkA0+FGC7V63oT?=
 =?us-ascii?Q?K1vVkBWSb0+kfA5Sl1ZR5pyTn3IYz8D5UIMQCrbQy4F8nqKajDvEFQdi7jKo?=
 =?us-ascii?Q?X2wziGiQC+Nx5C532biYogshwEhiP6UkmF14mVwVYV5nYYUYzbjjkZZeDAi7?=
 =?us-ascii?Q?xRLNU6qw0QM+BBtE1LuMJdO4hqdf3sJpl3N0FVCEG12XAqzAtd2BNQSa2r1E?=
 =?us-ascii?Q?VdHbcxt8BP3eoluVSSjm4NXwEu/3M+z2ooIxsRxiHNzxI3V/Xh6nCCTpMVcH?=
 =?us-ascii?Q?YCWrt5vKKqjO26ig877JM/zJn4DyCVNlJrXMmbCW+CIGB9px7alxc9GvtkZq?=
 =?us-ascii?Q?BNodi3rHpEzP8UsOOj2dlaPpAhgysWmFt+jUNFbclX3QBmZV7GhruobcQryO?=
 =?us-ascii?Q?43xCFg7xeFv08acv3c36nu+BjU2DFahq6pla5F0e+xxWUNSA7zWfOtqR7UR5?=
 =?us-ascii?Q?BBQjXrbCx8Ie07Lo85rfARyl4hcIqXt9+LXXnWXFgFitliPM4hSfKC/ndqRl?=
 =?us-ascii?Q?yHviFKx41Hyro/oD2tKFFvLzv2//7wwdy0v6hZWAkZr8amwJEr3qDVGmbFP0?=
 =?us-ascii?Q?lXONw5PnXt53Kj0ghD9nXiem4PktF/MTX1KIPuK3SL0IPqNDmZKqJXyeumha?=
 =?us-ascii?Q?rRuqB2WVYVarefWADRJOWKMvNDgc2Kq9ZNxY4Uda2wwOJ/wn+Pf3idvRZ9vs?=
 =?us-ascii?Q?UozkdUEsriFmNNPcEQosx1pKiMMkZQlxIWFZGQSDJYNqGSFmjY6brMNdV3Zj?=
 =?us-ascii?Q?qdQMwqNLL2v33x2AtO4Dwi6GVUsX8sHZ1AlXpl5e5VLA+2/9jqe736+fqP67?=
 =?us-ascii?Q?3t0MRhE8ojELnPCUghsDuG66c45eHRfbhHl4lAysoUYo8pu+aLeqiCsQhoZL?=
 =?us-ascii?Q?R5mBYwYi1JGDRw++L+ymopHd94T9WRU8L3ohAxYjMa/ut3aHSAJ+7YCWkJ0k?=
 =?us-ascii?Q?WmuwI1x06J41JIFU9vbbpBzhUAUH7Vtgd7u3DP+MTxsjqNGiMdOMuPcdg5ia?=
 =?us-ascii?Q?5nL3+a/1XybGEF6bRONOffH0lf0RHjlYJHCc92GGB5f0j6WGRzzeqVHQdolX?=
 =?us-ascii?Q?SCkbYuYrYmo0zLaR5arKF8h+fSyhSaRMk4cnaNCGb26O+bag5u75584HYQDg?=
 =?us-ascii?Q?GM7R4RLsQRY/Y5Kc4C1rt2AL6QUG5vud/IKZEw3IJvOoHT+WSh3iAgLtTBot?=
 =?us-ascii?Q?KXKDB+k4yfCSjSFvdky8eiq6CxD1jriRx8MeuPuUM1m+GSNbM4I/rU+fCHlt?=
 =?us-ascii?Q?9raUntgHX0meI08TdunzMjSRBZKt2VY4yNiN9p5U610ycR/KANX6MoFsI+uj?=
 =?us-ascii?Q?qJaxpX7JCz95utAgV8dfylEwhdNKLy19J0udYzg2msziTfHMZ1Y8Lubfvu8W?=
 =?us-ascii?Q?3LNPDS4/08DfH0fApRd5vO8ChK3XAeIklmgG/ZwkZSgO+dC6bClqF7OAlgBf?=
 =?us-ascii?Q?Ozs6pTaw9ZlQ+5ozb/hKAVkJ/784mwAoK26LYCdls/wL+XSSsYNxb/IlrzFF?=
 =?us-ascii?Q?2Ijc/SW3rZYckLBxDM5XcNTgfnO6bx0qhWPKuOzC?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2e01f6-9dfa-4ba6-796f-08dbcd6eb03e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:05:49.1943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLuzkc2zF/9orAbaAmF/MJ/cGDM+jugxm9kxA5a4QrSMCn4Wm8gvJ1z6I7gM+4Jw/hiMd/nKnul6yeezxPUXnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105520

Due to the bugs https://savannah.gnu.org/bugs/?61934 and
https://savannah.gnu.org/bugs/?59184, which are fixed in
tar version 1.35, we need to force yocto to use it instead
of the one provided by the host machine.

sstate_create_package and sstate_unpack_package functions,
will use the tar provided by tar recipe, which is already
in proper version.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/sstate.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 2676f18e0a..5ae6f515f2 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -152,7 +152,9 @@ python () {
     else:
         d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))
=20
-    if bb.data.inherits_class('native', d) or bb.data.inherits_class('cros=
ssdk', d) or bb.data.inherits_class('cross', d):
+    is_native =3D bb.data.inherits_class('native', d) or bb.data.inherits_=
class('crosssdk', d) or bb.data.inherits_class('cross', d)
+
+    if is_native:
         d.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
         d.setVar('BB_HASHFILENAME', "True ${SSTATE_PKGSPEC} ${SSTATE_SWSPE=
C}")
         d.setVar('SSTATE_EXTRAPATHWILDCARD', "${NATIVELSBSTRING}/")
@@ -164,6 +166,8 @@ python () {
         d.appendVarFlag(task, 'postfuncs', " sstate_task_postfunc")
         d.setVarFlag(task, 'network', '1')
         d.setVarFlag(task + "_setscene", 'network', '1')
+        if not is_native:
+            d.appendVarFlag(task, 'deptask', ' tar-replacement-native:do_p=
opulate_sysroot')
 }
=20
 def sstate_init(task, d):
--=20
2.42.0


