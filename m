Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6321FCDB496
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.48])
 by mx.groups.io with SMTP id smtpd.web11.89878.1697367950849094118
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=Y5stJ7SJ;
 spf=pass (domain: welotec.com, ip: 40.107.104.48, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+jMEEbGMyNAUv5yMkTXQ0pVFi/D+m32QviRMs+48bC8Voc8LKMdmo2VZH15lZjwWvsUKQEwfo0sOfequ01qABDZ5LcDPeFn1TC8Erx79k4aogPIbxTfIC4pHUEylYJq0fK3Fj7kZCgHuq2xXmP8IE6p0u+6b9Bwtwwu0DDZbwziFBFjBEXGuqSPVes8Fu/ig85o7G5OD5kbf4/LFqcfmc5Z0ayrTFV95cqBt8cm0clAPXUA2pVKrAAy9gSx72ekOWfwM/WNIu7HX0AO+nMZoKtuv8LchmgOqx8jYMV6UWOXkEiySX3N8twkS5AUPaxiKRfKguu2F4Rdgn3WYsgTHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulpa9lYXt81oIdqfYfeiZtEThO+YyhBvDq7q+AxaBHk=;
 b=G3vp60eQ4gT+mTxOFWopzLX7r4NbsP0mG2eR+xjq7jW0rh51RrbdOx04hhlJ9b9K9RJC+HG4KVFnN/w+GfeVxxUNW9AL3MkKzEwhZ4sLLBh77NjIo8lh40AQIrLbw4q6K9jITbEeIxnXXPxJcYZMxFefsOj1tQL+jtwGTSgwMB9+WG7iSnyNXPAZJJNQBWAp0RAoeFH57Y89At0HZ6XJBhhDLjmN/kycfYAbC9xnf5g9tVFsbKyKXbDfVH/rsUtTQZ4oWuSGSwes9agfHFRp0Y1xOyrrxqetAfHtnk1pd7/jhDKgBvbDa1avAvarj/N7i169vR5auJBBS0Yp4sic+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulpa9lYXt81oIdqfYfeiZtEThO+YyhBvDq7q+AxaBHk=;
 b=Y5stJ7SJ2OmR5pGn4/447q3I03H2OhxPuif4Q3pa2AkIx+98uJQSXBwC+GuCdkZZRslKzjeuVb4Ch80OU3nST406Rdzscc3/+oCpcQcpMye73gZ8Y8+SevOgblVGgXzOHsWKcpuhA/Qv3Kr9gLMTmnHzQVRj08CkCxgpucPI3HCLaMKN2ULYOJnlbyQmQLtD95+a1XaYIpjqad5FfJMeB0vHrDwz+Qdk03dJ2o7hTnHerBOCoMELSpdIH5HoZRoYowxw5jvtWZlP8yeuJ/i9iGiX9vdnozbDXjpG/a+R7VDPXZNSGJnRQpoTfcywAZ5fkaiQzp0XHa9OBwOXuNYyPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 11:05:48 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:05:48 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 02/11] image_types.bbclass: override tar with tar-native
Date: Sun, 15 Oct 2023 13:05:17 +0200
Message-ID: <20231015110526.53738-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110526.53738-1-p.lobacz@welotec.com>
References: <20231015110526.53738-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR4P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: c9aaa2da-2698-4c6e-dffb-08dbcd6eafe3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0nW9bv5eLtRflIsRZsu7GO0/iv8+k7P/Vkz/jNHmi4ylMdh66d0PYP+V2UZ0ca1DPBXHNviB0fKRN2+YXiSIvrTjs6qD5eHFfi6o9cFjrvrVoKhPcCrcMrrdaauC9d5XaolX8szb1uFR/BSQDdnUw2prlvKkfBPFQJQLzShbgxej4J5QLW7YvpAuGxSRVJyubeYNztJt1Gw9bAlnyjwTqdLsVPrTOW69PLV+AIlE2G/HjqznVQYmh3/Lhw2VIhJpwHNr5o4tAT2VMVpgDno9HsVN6cRl1kH6Aun8/DEv5bcpVFWUyBisFUfMuVjMU4ercAEssLZ7lZpshyN48Ydu7J48cMDnaTBTa2FSZI789Whq4MM7C8glwSIGpDqoI2XdF0Sjqw8BOG51fMyUzvx/hJqdEHDKx7o646NW92ToxdLlxwpoOzopoTkRNe7Qt/1iCb13ppWR3HGnBYHzCuhETEWKrCUVewtP/CJSgbh9BGNGCCVlb2gpgF9NXA4+ZPqmUfCcZ02FO6So26/mb9byetoJH+08xgHX7ouv0s7DI9JuR5z3SLR65r45hT6HFaxIwNtVZRq+HYiu7c39QuwkYUoSReffRgDPpz1kiMYjiqU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(966005)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UvucgJ3DhLHT8ozqtPktQLb58xXCeiXB2f/wzK6Yv6rgbzYAAsVaBzOqMiDa?=
 =?us-ascii?Q?+4TwoPnmhEMbnPbnFMCijjniJa7CKS6RGTfJQMeozIAjHoDqltmYq8DlUT0s?=
 =?us-ascii?Q?PFcAe06b0qTB7Y7/lGkSWzgt1CiU3DzD0NBv4WxQe6oe8QXWqUcwsChT3y89?=
 =?us-ascii?Q?PP8RYQwArLhy97ZmsYNU3ZGwqZM7IREJnGuRNQpBmqClgRMzmNJ4muhdj7KI?=
 =?us-ascii?Q?APQsOcH6COH394L+4MUfCKLsvyMUNfjtWnYM+/z75ss5CESyaD+m7MuwPZCP?=
 =?us-ascii?Q?mQ/mOY9hQQPXQPzP3VeEFP+GRmtqohOVNrYnz+cTE91FFDmFm1S7CicOJKUc?=
 =?us-ascii?Q?KO2iHI4xKUS9bnXr/Qsl814MebxwbO2BQqZc6Iy7ff1SNs+ripunSjjUmvAY?=
 =?us-ascii?Q?2FszVbfv8uinCMm6/pJE+x05C7tH8LNV4RWjm9IfQ24aBGmhr5cxsPJe0unM?=
 =?us-ascii?Q?qDNIOaI1ma2kQ8FaWAI58uth4kEdhasMRDdHONk9lIkY0pcaa+Si4VSI/Bzu?=
 =?us-ascii?Q?cCMzOdCYB8apEjmCM39ykqkITAkD+9hylpb00KzFqAQnNnh+z/JavY7TwcJX?=
 =?us-ascii?Q?FDBViU0VW/N3/+a1KWs2nWcxr03TDprCXDZez0RmwYMxt199XojLqY2yJfbv?=
 =?us-ascii?Q?bLub494GMzdne211mfaneykK/SIjqN/m0YEeu4cJXLu6qAR3UsIp5VcuY8kF?=
 =?us-ascii?Q?ajUUrx3LLmbT1gP34oQrxqa37RE11JO9kr3VmDeB5S9DCM6yiS6xHMSpncPx?=
 =?us-ascii?Q?DbvX2QLG8IJvjcfpi6HecOWeL2m+nEKuF810QQfi41vdZgM9luUVu/WyjbAh?=
 =?us-ascii?Q?YXwgtxNRylbdqeII+Ffo/8VZlpKlCXyDCaxVaQAPQrEeIIMQ6TNmk72nlAud?=
 =?us-ascii?Q?3Mgp31Opk2bMQX7bXEY+JBH+uVKBTxLAJ1vzGo5M/CC/TkzN/gnRqZzB6qdL?=
 =?us-ascii?Q?naxMFB1eAX/+XhayUiC/Y7trzVcjgem0OhydVpKilur0Ow6Ltq3MJ3zJkxX/?=
 =?us-ascii?Q?fiXBs8Cagg0Ne5w7o96aP7o+BqI7tNu2DiFuOjQamio15xqtLX667AV1eWQm?=
 =?us-ascii?Q?+bfUPNv2m8qFy+6HZGFL0lj2yWhYvm1Kc0cjN1Vs9+PsOUcg5waWSFJuZ5qC?=
 =?us-ascii?Q?h1x3lzDHBwKCtR/+abEj6OVMtpETXaLx27vpy1qeKGycvoOoGU9WW/1gTl86?=
 =?us-ascii?Q?KwdBBnYt6CWdwhOKazB054QwMxk98lb2FE1VYY2EJ8Zz1AJ6M83ZM46ycxtn?=
 =?us-ascii?Q?9AvcbznDI0DtLZh0hNy+lZFWjBpMeqSoL/MxVzBEoz79RhnH6DLGe5Z/VqiX?=
 =?us-ascii?Q?LNdJaa5WVR4N/AGjIOK2Q6qTbwopg/l3ROeTNWMr5gLhLGWxKp5Y+XDM1h61?=
 =?us-ascii?Q?2megVd39EAU3US5FMcNBYU2Qv+nUvlMgy6PtszLTdVIkIS28nj7nVADbBfiU?=
 =?us-ascii?Q?DJeuecK7XmaN/E/LfTFLihZmyBTVjAeCAdMYuUytxhmqlZWOKPpW84anmVA1?=
 =?us-ascii?Q?PZ1l1Vqz7zZ0Y09iN0dzV2xgWLzkcczIRh4izislUx6Z87bUXw7lmaw5v/dl?=
 =?us-ascii?Q?JnurOiuSxYJGxFDpEVwvCIKXLYDgbBHCjJ5BUq9K?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9aaa2da-2698-4c6e-dffb-08dbcd6eafe3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:05:48.5519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vESbni58WZzjNjf/nLK499icA5wiljwxa4x9qKioDc2KiyRI5//6o4b3g38fGS1fB8yBxMFyf/4JtODJQuGbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105519

Due to the bugs https://savannah.gnu.org/bugs/?61934 and
https://savannah.gnu.org/bugs/?59184, which are fixed in
tar version 1.35, we need to force yocto to use it instead
of the one provided by the host machine.

IMAGE_CMD_TAR will use the tar provided by tar recipe, which
is already in proper version.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-recipe/image_types.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass
index 4aed64e27f..c50bcf673d 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -385,5 +385,9 @@ DEPLOYABLE_IMAGE_TYPES ?=3D "hddimg iso"
 # images that will not be built at do_rootfs time: vmdk, vhd, vhdx, vdi, q=
cow2, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?=3D ""
=20
+# Minimal tar version 1.35 is needed as it has fixed bugs for storing ACL =
entries in textual representation
+# and is able to extract files with xattrs that are read-only; this needs =
to work only if acl or xattr are turned on
+DEPENDS:append =3D " ${@bb.utils.contains_any('DISTRO_FEATURES', 'acl xatt=
r', 'tar-replacement-native', '', d)}"
 # bmap requires python3 to be in the PATH
-EXTRANATIVEPATH +=3D "${@'python3-native' if d.getVar('IMAGE_FSTYPES').fin=
d('.bmap') else ''}"
+# IMAGE_CMD_TAR requires tar to be in the PATH
+EXTRANATIVEPATH +=3D "${@'python3-native' if d.getVar('IMAGE_FSTYPES').fin=
d('.bmap') else ''} ${@bb.utils.contains_any('DISTRO_FEATURES', 'acl xattr'=
, 'tar-native', '', d)}"
--=20
2.42.0


