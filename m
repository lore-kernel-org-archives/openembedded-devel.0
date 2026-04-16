Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB22F8D775
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 19:39:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24166.1776368388359212881
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 12:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=hK0B8812;
 spf=pass (domain: navimatix.de, ip: 52.101.83.91, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJNCaAah4GiEPCnIBzdkLx+rt+MbghY/e3R2dH8jWBVxws1KrWDfNTv2zEsGvos3VXKi70ZwsIQEp9v1gjtfBUk+0+BsAN1oyDzLFm7SlucuipIgjNID+xLGV03UpIDbXX5P9NcBMxewkl1MuiLqBLY72wCUVZoaornx+v9mixDeeHQjdc2v6aAFU52xwQJStKiu+nw+4ojf1lehmfpYqTP/cqy1xN/f4lJCFCwNmBgukiJe2TJ1A+FqMgBO/C7fVxV3nL4s1zrSu5NyNF5AXWXVYrPW/G1OZlLokO1TZgXjcAxjPxPQf0CJtX4Lze567DE2fIMftJq42OJVLs3daA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2RbzNMX+yXKS/l1p0MGjMB6C90HwENxGQiISLag5Mc=;
 b=P3jvarbKbITbBMl0AuRQv5IjI0k2BCmr8RbyNsQoLIHt2IImJRjrXmdFDAF5plq2wII6cvlC12oAKbc67uyajPM7D6JPkFsvrsVwy66gK8Q7qIMGF/u2J+oKL/usXh5mrnYdYJ+QeOSNT6dgKSgY5RFSFVSRgshydqz9q/zeJZ+aqzAufzQEFnnTzmNbRciwKmz5q+CbkvRQZsOb4Q3oOoukbCfkaQjf5BwDel4J2oi9YxrmDpXgpmf7ee63N9I6KXqF3XFB8k5OzN2sNhuVAaZmsv+tV4qdpy0gGe9q3ZHH/YSZiCjF5G4cRicWSgMo0/YnV/xxZQq3w+9N54i6yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2RbzNMX+yXKS/l1p0MGjMB6C90HwENxGQiISLag5Mc=;
 b=hK0B8812rn2l6DqnmLqfhWcGirOXxhSnB9NIdpfB7vE89lx232Go4Di0QTZUCmbxbeL6npSJP5OFV483LFkIjPZUN3l4B33C/d4dWxWiGlQizijWoGxxp+UeL+y54U/6hIl7jzybkWY5/6HUoly/kNRwVe6o+VpqdauG/ak9i04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GVXPR01MB11229.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:216::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 19:39:42 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9818.023; Thu, 16 Apr 2026 19:39:41 +0000
Date: Thu, 16 Apr 2026 21:39:40 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] fswebcam: Add RRECOMMENDS ttf-dejavu-sans
Message-ID: <325d4f364345811b8217637156b6e1713bc1cd0c.1776368379.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0430.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::27) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GVXPR01MB11229:EE_
X-MS-Office365-Filtering-Correlation-Id: 93afa5e6-9a27-4ee2-832b-08de9befe787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	3rQdNpwDWl4vwONlu70D8Cg9ZTBwCMFyqJN1MOerxN/6Q6vCUBqrWHosTAacknq87ONgMZxuETs2eUtV65Z/3guSOYCCzqtYjSBulwAOSDTwCW0tMnrsGChddo9F2XUIU2HTUu7pZxUtdzOdLp6YCQ9SskksgnLEs4nl7wOpr82Xss9wW5BxHHvtnZ03E13Yp5Futd3cW0Tmkd0n3J7tbL0qSUp0KqQLGuo9ChYaQNd5UvotJM5toco5+ZQJGDpLKVEsF5dqiAlN4pw8OkgNhNki8e9gthZZ7Ykh9g92nY2M6/JYkSA9WBk36rPnhygMgFj53eJc63RFZ0LxRtKjKnI3AwZRzHFhG3x5DSl0XpX+tsWGGp84xvScc5sEqG1DPM1iXcTOlGhJCkgNYiwUhW7tBx3r4qD48mme3Z2ktC6aXFyJK9iHZ7W82vOuvt/33KpcTYBA9EZ6Mk4KelZsPpta9wQ0l/RAu0B7nc6q4XUOs1kaRzH8E1y80Y4k86F9+EgHckTCUSCtf2xY1xRntkr/GUXOg9cWP+BelA9IrMO091ueN00ESVWHEayg+bVZ0zy/29BkGC/RJfJbmK6xCJKhZSdm5YtZWVP0rpFIySwPFY2a3ogkxDgrWUZLvFmi15T4E7s4T3WxwCuFoj92fWIeuLFQLUM92k1oVZQSeFNjo6pkCkzTsIf4kgE21D9KvbHPlD6vTV33Gvk+OvcHm7RJuBcZAsbW1fyonAZSNkM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bILQCszKrLPIjv283qn2/qFFlxgI3/5PWeKtwqSbdWzk4HstWCk3Xr4wC8Lg?=
 =?us-ascii?Q?v0cRMzht3bnK3HhJ+0GTpCr7NNPPe7qD09vXfqwL7cxYpWjhe6zdH6Ivbn6r?=
 =?us-ascii?Q?1kgIOJCAJKUDaw2sZYbD5oXGx6davP+5tJCovDxdD9H9louAmgWjwrL37ENI?=
 =?us-ascii?Q?FLq2d9q6ZtVTmEz8+h7w82um0suuH6s6Ab9ybZCmZ5riIcyzQyF8N9zXIxXG?=
 =?us-ascii?Q?ec5ClI02UqLpo1AY+KwDAtOlKNzu/ITldE/iPa/GpU0KCUDFOMhKdCY6sR5i?=
 =?us-ascii?Q?9zoRKhFi03wKF5+rz0HPCpzUllSItjGPqbr31uLZFgHU3Y1gzCtzHxdqj/LP?=
 =?us-ascii?Q?bTMUvjY9nWGchX5b5LN9N8lK6Z5yPqVIgAOda65t6D/D2c/ATTjWTiYwrLgP?=
 =?us-ascii?Q?P0EQBtay1sTrEFW4DKhJGiPsp7g51Gz5UdSAvvMkHKowxG6uKIPskprqmGwm?=
 =?us-ascii?Q?dOgclp8V1sy0bccwoRrKeqBJS3D7EbxhNSWxJZWiYgrFeCaBKVx80hgALZhH?=
 =?us-ascii?Q?4ndLZAVt0qwrTtBOQgNsTN2wxFs0W62k5sMJ+heRufwQLkP9m2oLAxRGn68e?=
 =?us-ascii?Q?m8x7eq7j8jzVXfa4o8UuD/vs79O5N0X+x+W8LvoZdZdNurXFKGVvmvExD5j9?=
 =?us-ascii?Q?c26vx+8cwkgOuY/c6MpvHzI8egZUyZCvhJG54kWg/mEu890J875PXYDXh3Li?=
 =?us-ascii?Q?25DeZNcAj6AERGOHMqurNAFT/lTqPzYck8lR66Hb+ruGF5M/tc2lHrhUHdvg?=
 =?us-ascii?Q?MPinEqb7cbkjUAY2BiMzB9uomo+Z0dpMY3L1ScPZersxaDJR7G5hC/uyzreQ?=
 =?us-ascii?Q?uV/Ohyq4NqrcUfvWUrH44voR1z2jGY/4jRp0DEHZoOxRMR7PzSeVlauVsEBn?=
 =?us-ascii?Q?1//p6m1l3OMgMSUaNS9vKFq1ngQJMQJ5x9/pvdXAF0AocQixHIgjN+YfjOv/?=
 =?us-ascii?Q?K1cyLuq6dkao8Y9gfz34oRv/j7SVYv58nfxQNPsmiP1SnJlPXAMxULQ8frD3?=
 =?us-ascii?Q?hDHiROva7mxPxpWtlw3kd8K14Ln3p5/GSiilpHNtJFVeCQjK18d+wFET8OB1?=
 =?us-ascii?Q?+3sh2dlWfYYPMr+fDj4/mdDti6/RthIcH2yZPi8ND3uh5qicvGYjq3TEJQXL?=
 =?us-ascii?Q?OIyPkseXfhLVKe1xn6ljLh2UNHhZR5LisTyKA9t9WU4nxTtd+x25kHsMTkii?=
 =?us-ascii?Q?RlLCCNdMLoYCGVrc5VY6JGkluwc6ev92aB6fShhw09dUvghKONmhOLXSBAU9?=
 =?us-ascii?Q?fALy82T4EV6bVr2GWs3DBTwnzGLmIYu10iYJsZaVudcK1eLNi+I/kX1l6LdF?=
 =?us-ascii?Q?xHmZYcxy0xt3y5MwQVAMWLwtEDF7tcbRSCpnofTFSqzCTamGesoMC3YIDYIP?=
 =?us-ascii?Q?y4xF+lGCKY+jQQyAkZ+J7AYtUSDbsXMm3ofdPvqmdx8YsCfLnjHCbu6LnhwT?=
 =?us-ascii?Q?QBjRcdV0fEzlJQYYqfXfQY+s2/rUmrDzFz2XWcfiQB8nfB4R5h9UDHRD5Hy0?=
 =?us-ascii?Q?5rlnFLEcz+MgVyGxP2ID/1cX0HVHtarT/kHXJpOTI1WV5jTJFOCoJ8Rva7Gm?=
 =?us-ascii?Q?3japR9o3akES2qkgSDWfr7w2mZ4vtR7r2qwgG6rqk6olILqaGpy64XBWvZc0?=
 =?us-ascii?Q?sEcH6JTsMolAHNJ4tN/Ksi8aPiRJH2laOFSkD71gUsAxlUIQSMiINgwkiX6H?=
 =?us-ascii?Q?Ia3Y0EqTmjap2gzVTWOgea3uqRAbS09MvgCrSJCk5VXc6U89hkb2wlTKmkID?=
 =?us-ascii?Q?bWyikQS02u5MpXFzfu3T+su9D0ASdY0=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 93afa5e6-9a27-4ee2-832b-08de9befe787
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 19:39:41.8601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gom0Psr7prvNRu8rT0g0F58/YEzUXNalLdEtRfolltcygNq53L+sWpQQHFFTdxo+5zlyJB3k+d8nXk2rFYtogeNAG0KCBrAUsaMEafhmtcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB11229
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 19:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126413

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Add a recommendation for a sans serif font to print text on images. But
fswebcam works fine without a font to save only plain images.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../recipes-multimedia/fswebcam/fswebcam_20200725.bb           | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.=
bb b/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.bb
index bdda35df40..bc4f324da5 100644
--- a/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.bb
+++ b/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.bb
@@ -18,4 +18,7 @@ DEPENDS =3D "gd"
 SRC_URI =3D "git://github.com/fsphil/fswebcam.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3D${PV}"
 SRCREV =3D "db35d4bbd336885a44f017ff142bc9523dbdce3c"
=20
+# Compile gd with PACKAGECONFIG fontconfig for easier font selection
+RRECOMMENDS:${PN} =3D "ttf-dejavu-sans"
+
 inherit autotools-brokensep
--=20
2.53.0


