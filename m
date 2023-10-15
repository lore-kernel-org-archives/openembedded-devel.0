Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1595ECDB493
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.56])
 by mx.groups.io with SMTP id smtpd.web10.89879.1697367075405928676
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 03:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=S/Yu+GPO;
 spf=pass (domain: welotec.com, ip: 40.107.20.56, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIttzEtGF+hKT+boKKQLLBg40lqr6ZX1AZ3pG6n2sgPGdK5aRNUBZCXFLLnlLwW4xC0agCflizMGW1RWIy9brwlhOXKVKzjQWSGT+0xThKekJL1bj7TO0C95upXq08efbXhNPolTf5FXIa9e43wmdXuYwNFVyRBDHC5RI9gJ6+w3IMjfVABa2bXJRhe5g9Oz3miNbMXhmLKP2ualTucFFZBX+PA0yQXnv/FwgIExYH08lNXCux/iaEaJ6QCbO75yRC6z2B3FfU+ikJjn1RFfJFDXJLe4ej5ZxrzUFFWcmuA2cjLuuOmZGru9tHzRYDaq141jSQJdtwlZN8MB+vz30g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLXSQT+v4yRbOoAidvosZ/GsLd7NCnFo9+kqyF1NMus=;
 b=ebZwIjSgQHUL3LtMpaPdnJrOHxp12WvBxSKRYZMQ2T8+1cuIE7DfRVfWqmxadKEFfyioghwTZVRLki3FYxOAW3zjUmfGZpBg/Qgff/iQFqmSeVQqth/BxIhLScVsAHCsEBGyr/wkkCnAVjb4s8XHi0yQrtsSpOAvkAwBgNf6bGD/jhv8LUqBva1LICXppMd7vunzfKDQ2BXRCL6bXw8xk1Z0gM+MQk0X3xmZ+JLqXCDiMzclAtkJaHm/NkWjRfi7/899sz44R+O9k1dd+vNYUtASV3Cp8qCnsMKka20s8GJJSv/MrhtB0GtEFTwd5UnvAk7mbETwYu6sUYFqZ5UOOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLXSQT+v4yRbOoAidvosZ/GsLd7NCnFo9+kqyF1NMus=;
 b=S/Yu+GPOZn5H3vsjn2tH4e2oPhRr5xPvfqabYKng5WUX9aF5cP+OK+Esqeq6+RQUMkl96Qz8XDCwa0SQiHuk1alxQ+WxDOJGQoWtFOjfYe78pyxkumWdL/+TRfvAzdDzmIxKvg2fnbFqRRshBt1gRt1lzhiDXJrDJtCmbzDsQhedwM1nfslqWugR38v9aCsBH2vuDy/ug5adYKgWT786b2vSnA62CbRePFMAO9M4Bww8qmtXX8/7N8MiTgSm1NR0wgxfJta23k6EOn3YfKNGVgKpGheFryqWgHIWW3+PE/QvqLFYTzwJqcflzSGRJLDmj6ZgHc2BZDioePii8i6DfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 10:51:12 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 10:51:12 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 03/11] sstate.bbclass: override tar with tar-native
Date: Sun, 15 Oct 2023 12:50:47 +0200
Message-ID: <20231015105055.52510-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015105055.52510-1-p.lobacz@welotec.com>
References: <20231015105055.52510-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR2P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: d511ff2b-3ad4-4f06-7739-08dbcd6ca5db
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L/QBY7KfWAr8ugwo/EmXXuSpzT4GgIGdytuq/SpQIOPQtz5dLk5BFHfb9fGr5f/2r0azwK8+fWQnfgCg0vhdV6NMtAQusNibYerL/pP8W5737dUe7JDlH3Suqn8FPuhvC5UkWrL8bggERvm1IxhWsMT0p8g4o+jZcBurie2JRFaeX+H9rAQbIY/yeZCyc5fNv4uMMRGksv5f2MyUcGq1NfB3uXizs0DbZlIY19OUYxHjQkUAcymvzk3z9Lq+AyKFJao8jEgW7g3vOetKws+0BQt+EwTiyuM50LHLkXOcJxk42BEXp7vdnK7VmoZ1fsLQKoDjcak0CP0bKdu8v+0FbcFeDZjXNkjR5ZeJfk+Hm9Q/ZnYfsc2aHnobUx0QOs8GHniW5lotw/Qs9P/6lSbQHHo3hHN6IfK7BOei+/1vu1UzidUylhpYvIJCeKv4CcDbDLmFAPXYE1NE9mR7CLJBmcbfpbFA5lwcAr2xpPsKIPhwWz33zbWp+U6E7IsK78QOQ57b7L52MeMJwXn1OSTAHzBm7mFLfGr57nCT9gb5yCTW7ADx+y8Ss58P9wZYxGYboxVxLwMGZa/jRS1EwG32eK5U6g6f6zNLut0wkCNOKMo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39830400003)(396003)(366004)(1800799009)(64100799003)(451199024)(186009)(38100700002)(6512007)(26005)(66574015)(107886003)(2616005)(1076003)(478600001)(966005)(6486002)(5660300002)(8676002)(4326008)(8936002)(86362001)(2906002)(6916009)(316002)(36756003)(41300700001)(66476007)(66556008)(66946007)(6666004)(52116002)(6506007)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?13nz06+K0fXTwzZM1dTY9Ik7WOBIad/VYY0vj3KRMm95XyN5unDWA2/zNueO?=
 =?us-ascii?Q?Foz08aKwW0lLmYBDhtushFynlc0LtuZBjdutRK98W45HxFC7tn4lBbqxo/IO?=
 =?us-ascii?Q?eWPY7i2r4eB20tF2bG1gFH/obHgcs5Em/B3RC9I8vo4X+kluR0VpNh4d6Hn+?=
 =?us-ascii?Q?5xsOVoSscV9w3YcGxGmsJ+SwvloSA3cum8VkXpBe1+J43SCpFamdychrNGA2?=
 =?us-ascii?Q?WZPngZ/8RpGQ8+FfTbSsu0nv8NvOPqsCk5jbHrCn0nSDznsRJm86boJdj1ph?=
 =?us-ascii?Q?o6p1N129jGl9+SAR+pvkhde9bWeR0Rah55e1dT6LKa5jUHldewDlLBGGsgX9?=
 =?us-ascii?Q?29bQr3rc6UAw7QwQIc7CNocnRGlWAGPvJVwDoaDWsebH877YKKcdOn4fKxHD?=
 =?us-ascii?Q?K3rrhYYU+xviHSYXWoJoZonWjxrHimHtihRbgJW4KnFo7Iub6XdW8TGwdfh7?=
 =?us-ascii?Q?3JTM1dAhJE0mdcmDrbJtPh8pPHcdXd2rysjh1cSpZ0YfR3uVF+BAb+s9SrhI?=
 =?us-ascii?Q?yO6pIYeZ2KaNHIPpJ4fVtjCgevtvM4njACtsSzrqwk49zVZX1dJYb9UqW8gK?=
 =?us-ascii?Q?Xt86zIhZH2UGa4lYZtbuD8t9jzPkB89bfZjHfKKNMAyZbPmJd7NPYW+loYfl?=
 =?us-ascii?Q?8cv5E5EQJUwSS2S+kvGKPrPqvWXQBrTMoRtuIZMUU7zp/APv+gCrHQ3iF7S5?=
 =?us-ascii?Q?6hZK8YKBMLN7bNmkwfMQo96NaC7LagThOBuZVFR/2617dTl8UCM1xhgHno6j?=
 =?us-ascii?Q?omuHtMrtHeSNFscpWPFuKl7we3merr7BQx6J771t5MV0l6GqcNnhIIOVYxkx?=
 =?us-ascii?Q?GUQrxL732Bx73VFS0ly9GAMnODKklkCesddmA5+XmKb+ybuk3oz7Wq7gJqDj?=
 =?us-ascii?Q?ri3lbXeeJFRXhTpB0lY5rWXz/7jhjOvE+iXPwY+v1gGFOSKpNWQaTlgfwhpH?=
 =?us-ascii?Q?2iEql3P5RBxVq9DjTbF/wKr5W14oW1ZlHygKWZYRIPaH3eolaZnxb4rRzRGu?=
 =?us-ascii?Q?3NySNsFvSqve8YDjbiQ+FBjm8ezrZfjTi9Tx/Z9OtEKCb9BhgjZUxoNMTpNA?=
 =?us-ascii?Q?y6GjT6FaggySYJYWhIuGUdsvGJHJpWxE5dWZGuXRYbB1B5MBPhxPdFTi/9eI?=
 =?us-ascii?Q?38HXQ3woqvIKk8dpHoTwKEB/eL2mRQwZ6xhbcAC9jwtrudtcWJ+mccaCgTNN?=
 =?us-ascii?Q?wTgSCN/4RjOi5gCHtASaiG9ft32ysVrdK2fDHKsXnBW/XnWH3I1ByCoIzqcp?=
 =?us-ascii?Q?btC1PaS7hx5/k7uX9i5lj/ITvDqlOHkDzo+CoyIx3eMVgtL1KI2mmRYs/cQf?=
 =?us-ascii?Q?MzYeE4execf2HDo3z/Q1nAKihE/TQ7dvEj55BYRpcqc/Nb++yGBujdKRUmT0?=
 =?us-ascii?Q?towQ6SY+TUab/iOhM8cmg8V40pjJjaW/auTCbxtn/9eeQ7CHPDAOaZr9UVf9?=
 =?us-ascii?Q?nd8lMdtLlLf6Kxv/+DwFdihLftDRUR/x4hb/GLjPBiOuU1+1Vwm9te0gNDvq?=
 =?us-ascii?Q?z13rm6tBtafaobUc/zsWr9T+iUAShFgXXxImWV/kSpQ9uuHzMgupnXl/SYD7?=
 =?us-ascii?Q?nGsN7Z99cg11xmcOq3cDFUe5s4CqKbyf9Y1myBYv?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d511ff2b-3ad4-4f06-7739-08dbcd6ca5db
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 10:51:12.7146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5hgtBfpLDmaWeU+lbaODUbKNSWakanZRdAjgnBpjl6fs9eqhaV069S60Ai/3VVJBDGDaU6siF60cnBRzCtlVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105497

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


