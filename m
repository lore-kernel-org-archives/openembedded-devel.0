Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A6FCDB489
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.60])
 by mx.groups.io with SMTP id smtpd.web11.90066.1697369032343148425
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=aoPN8CED;
 spf=pass (domain: welotec.com, ip: 40.107.249.60, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKDjHpJmjaDrZtHZSBr9zOppKb3TKhqzupWa2aT3psDGESrRS2LZWsz1/sgUMBw7YfekLCjdGCmccG6JHGWU5FRuQLDlZgr4zQfv+XyLn8Q1MWP4nX8ZR1Z4/4Lq2IXHhTj04ueI9WzfZ+i4HBhwcodia0KZJ1CwdlqVCr9t9uiMwSuNB9JJSnXx8rAoIemdG0139yF/aL5Ip/+P5eo+bj8xADbi6MElO0jNfdA8HzmUnpL0t2QFrKDOxdrnVF+ZERqRw9gtGiZBEfgB5mKsyS5bqXgvCyaecI60KzT7dIa+XqIr2uRz0bz6YnPIcz92Bq1BL/1JiPppr/S7ay90Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLXSQT+v4yRbOoAidvosZ/GsLd7NCnFo9+kqyF1NMus=;
 b=bo8bRfzEJ+Z6m1AEYMXdDiu5v4gMlVFwLGXvi55XQQDsQTeEI5B2v5VKcAGPW0Q23qL6BJU3J8+dVwn0XJ0LmFVYiVf8t5H5pu3hfn82q+Tccc1ldhlt23zDzvdr2SJJuLnWWURpfnaMI/rsh3Z8G0nBcHm3uxu9ayTkajXFPlXUEOhsQMWD1FcpMnUeJDGBXAy9gomDwQPzMFKHGPoiNtfQfzfQhIZLCSVPPLkFniqPW+CqQknU3cXWMYEt4EvQW8jX7DBSw9vpe4nnkTh83RRqg/RmPJ4xnI2xhV52an5mhKhbsJXD6QV8+27t5B3sNcCZICOKG+o9jFZGGM46zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLXSQT+v4yRbOoAidvosZ/GsLd7NCnFo9+kqyF1NMus=;
 b=aoPN8CEDhe4U4AC/tQe1O1usCwaaMIfxAcnDEbvdjmyprjxKk/9oey9r0azNJ1UclU5OEtlnp/2prRdHHy+uxb4UeoliODnnpLXNqZA1CIwO9F8Xx67+MlhC3XLHarmWFPkjkEL7POI8bhhIzqDFpsMCqgO+A31O+1rwTK3IFNmsVO0DL4gEXHw0A2N3lpguq6tMqXzlhWuNVB2VeaAdb8oRRCRURRP+l1pdwpMtT9KqyyTZX4/iPiM2mSXF6dI7giqE4dN8u8tz8Gs6gqrxSI1IC52Xmk7vVgfaUDjCv97cZj9DkW0oAlw+pC6hZZl+2ilV3tG/fhc2kv0weyEGsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8113.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 11:23:49 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:23:49 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 03/11] sstate.bbclass: override tar with tar-native
Date: Sun, 15 Oct 2023 13:23:28 +0200
Message-ID: <20231015112336.55722-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015112336.55722-1-p.lobacz@welotec.com>
References: <20231015112336.55722-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 4368b426-0cc7-4657-a046-08dbcd71341c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GvugwxbIQGlJivfIVrEZz+DOym00pDh2h4s/MOe8Hnso2/a+GH5KkVDktB9tTsdshdSqh3iboLyRggghcMB3oKDMdmTqowXwCsZIG8+lccQyuRxcxoq1xiG5FwP9ZzD56ILJvAHiXcJTdEhW3vP117KNK61E0xWmbNEwtLE9t825JOP2bkRslDneEoWn6GcB1xq3akxHGJpFMtkLPgBJOhXl1Puel/KKMw93n2U28cpiY8KmH0Ns/pu3H0g/5AiDaidHt9owOCDOEskntw99jY2PNZq00gOL+eAQINionPWMYVUg/y72hBBr30Cgn0+uVqwQfelxkLo2uZoFYkQVze7XJI9oSBG8CePx97PF2ZEU5789FicrsFVOpjaz5BCm1aWPGqgLuoyu7vyTfOp80fK09uquaU1j+ucohHVMQdYy8UWTW2haW9S1Vs4Sm1dHm79gzVn7OSR46KT7/MUc76sI8tG8xOeADbLJFmRM9Ni5EVP/iTkHZDFVIIEx7eA1sWThnWVhDeOEbiHVXTjfGLb4rMqxo8nGm6kXa5aQN298qL4QeAHl5NPHc+RvTgr+bk6YbMtagX9nVdrAqGrzo1g8vvgMOm0RbIcD8NUdgLA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39830400003)(186009)(1800799009)(451199024)(64100799003)(478600001)(966005)(6486002)(66946007)(6916009)(66476007)(66556008)(6666004)(83380400001)(86362001)(38100700002)(316002)(6512007)(66574015)(26005)(1076003)(107886003)(52116002)(6506007)(2616005)(5660300002)(41300700001)(36756003)(8936002)(8676002)(4326008)(38350700005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GG/ERrcUpAnYqc/3jJP3FF7MTilmXzvy3Y25pPK/6GiwRGIjaDQKZBeN+EYM?=
 =?us-ascii?Q?xKqfadk6fQ7twJ7S0aF91LA6gNtdqYJC4OUPmQ9rcDZfIwf0mxBVPp+CU4Od?=
 =?us-ascii?Q?v+X08yBljJYQiFPgg5K1sWSQHyGgdbZ2i3oOWO6nBNWKBZsBJKAAP56VXCls?=
 =?us-ascii?Q?iFTsAwVLu4BgbasqBy/Eoo0XQVMPgFceub/806DtMcU5CZTYgblYJCagW3Ss?=
 =?us-ascii?Q?mOuZTbYF1oZ6NYGTfOIYJPuFJVQRAU0YzUrPbFOUinMZl2H9W94iFceF6Qwk?=
 =?us-ascii?Q?uGRB/SKUcwonriyRznaWZZ/ceHzczn66L6+57rxbqJmym4XaxBoryskd4j+O?=
 =?us-ascii?Q?bRxJD9RrUFpwx7B2C2g+KXjHT+A65ftNzEWAif7qaSV4PxOqhXpjishSxSx4?=
 =?us-ascii?Q?aun8+4nBSRE7CKeBgth9P/U+c9Qr5u/4cS56dxaQGu+97O5dFn7d7JfrvbVw?=
 =?us-ascii?Q?i5yeHwHcwz1Zgyjt23RbOPAO93jIKaZwKpKiv5wQQ1kH9VSo5Mfn02p1DQQz?=
 =?us-ascii?Q?0LoFxg7SIm6/g95kegr4antEHMCRJQR+/4MtrkaGBoF/kymtso9OaTaikW2W?=
 =?us-ascii?Q?XxHkGQSCd4iugRJ6/E2I/v/I2sAs0bvItYAeEDqPXa6eLgY6s1E5rKiz2Te8?=
 =?us-ascii?Q?KFVwaYfU/aZ/aZ6LaIoDzlIvlnncyZNOWxEpMPFGamS28uRJgGVVUso9D56t?=
 =?us-ascii?Q?vzhlfO0xgyyS40iKe7f87z5f8XR+/2CNBOKYxQPkV3XnY+OI2iru/FH4C4Hd?=
 =?us-ascii?Q?XT6XdfLkdSjR1qwzJF5CiOQnK0B2EgZt1KnxnJZMjyyn38jn5UzK7VSVqs64?=
 =?us-ascii?Q?S4rGTDn3uWjeIT4RGpyXrscwP9mh289kGV4RaREhy0NX78TjWMST4U+hKxsj?=
 =?us-ascii?Q?dUx1wsDWHypj+T4N69xZrbMkOBCZ2KNVKf7kDtpL0bRSeBxz29LyFWdKj3Vw?=
 =?us-ascii?Q?X+i3ashq51xBKIQodfhUvk22Fu6EHSM3n7kMKGCdj8VtnvTMENDgZqBaO8Zb?=
 =?us-ascii?Q?5FgSyr3lULgHhzuqj0o0FUDTbWkPVjAP5pk28HW+XbuYOFM4z6Vx7QNl1U7j?=
 =?us-ascii?Q?gHmgDsxnHcMQUk/V39QhoYO7acstaeJ2w2NzRBm27ktAWLBCHOtb4ULGviKr?=
 =?us-ascii?Q?ChzFvE+nTJyJgG/RFryuSXFnR3vn+xtQQZDK0aR62cbvGHeY5RParhGkNR26?=
 =?us-ascii?Q?vUHIM9398yVZQDJlQX91I5Hbg3TQAHKRFQ/+kZ1Rny+JEyE8EbGbg2mvsO13?=
 =?us-ascii?Q?uXaGDvMhFLOLBGhcPRErjfcwe4tQJGEF8oY0KJHiZ2a1UuXUZOwam0qYuE4k?=
 =?us-ascii?Q?c/dJRF01f64DCOxrm93jH4YMffgTOtVtu58jYz/eDdICKc6dNul0YWss8PVS?=
 =?us-ascii?Q?PIwT9hvW3EYMAZMzjr8CRvzeXd3mq/8yfECGS0aO3A/uoJJ2yA6d1ESbck/t?=
 =?us-ascii?Q?0pz5AsjTdljBKiOqyafrqJ2e3x94j8p2T9h42wFT3E8gahXim6EgrPHTSJdI?=
 =?us-ascii?Q?cKuKeFbYJZX5rJzttoojb02LxFXNcfdSBCFBAcvQoK4chtduRvqLU/jKbLSC?=
 =?us-ascii?Q?QTkLwKF9Olmm2+o9XdfNezWPmUgk5NduAyrjdsrt?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4368b426-0cc7-4657-a046-08dbcd71341c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:23:49.4496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igVAQ+vBmnRMnobGlyrwpb8ztDqslHIgdBrfizEuEvAfvzp+oyOvEZgJGpdgYb2lVrozVnjo2t7rv2FUHiJuKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8113
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105531

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


