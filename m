Return-Path: <potin.lai@quantatw.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF617C4332F
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 15:49:44 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.102])
 by mx.groups.io with SMTP id smtpd.web08.8976.1648741778396103384
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 08:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quantacorp.onmicrosoft.com
 header.s=selector2-quantacorp-onmicrosoft-com header.b=L7lzfTCv;
 spf=pass (domain: quantatw.com, ip: 40.107.215.102,
 mailfrom: potin.lai@quantatw.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXFaqRpl02ptPREODRAuJH0OsnfPk0sioJBn+ZbJG6ZDB17W7ROtvWbDADQS4fyFIZf2mT9/A9xgQgIiN5fEYnYTcXIj5LlMk5yuYGf7j4TSor9Rbj7FQ0r81PcsJJWGudRnugOmQtyJrBlkv5E8Q288SMOiLuhP7/Sos7CtVyVrMrV8PqHEJMR1+VramnWOi/24zhe9jpADOsuPS+zZeBoWA0PiIyyUjpKLil+fJVCh3Sar5qFRbkIKbavaN6jSDAJ82Mc+y1+dO5rjp92CVCwa1ZWBpAd82ADNhTDOkqydggrqgkNpvY5Fx7QbbqcEx0CxREHn8Hi8Q2ev35cB3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmQcNDyL9w7Z73JFmMBOU3dkfSP6PqwZkpbmw7XxF+8=;
 b=WDJWqg9Mf3yBHNmRWfOK72gT3ZGIwdmz0abGnwR8YqXUdBKmTQz9j9MZ2ZowjqnVdF9gF5M9x7D0VvLHW/MspLHw48qrkQIptl2wrdxey/+1u+HfAQ0J2T8KpzL5PX0Q4LFa2OcHVzYGJ+flWxO8stQRBcDapkmNBETj4s75uX3knv9kGv0uaxt3D5Gg8+J6PBXY9CWLT4hCICApYLIMMOKlh4SdS5Oe19gU5n8R1Ft6JuljX9cAzypnVaavhwxZMO86mzqk9ei4Bf3PTXc+vLc5L3NNTP+sl3XsiuXKd/r7vMOYmurxN3AfAWkQi0jzTKfUO9m2Ti3qcDWDT+soMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmQcNDyL9w7Z73JFmMBOU3dkfSP6PqwZkpbmw7XxF+8=;
 b=L7lzfTCvmtunKvBnqtB9d9TBXPJuhmzwuazI0AIOVuXPPAmTUtrkDGdGwdbHjEDhYsnGXxstXcCpHIikccu2wtphG5V5DJFoaZv7erNvmhzFuIQWcRlsdjtjvgtan3O9vvr11xs99yXSapyLhxuBf1f4/zfQftttZl3z7IrrI+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK0PR04MB2785.apcprd04.prod.outlook.com (2603:1096:203:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.24; Thu, 31 Mar
 2022 15:49:34 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42%7]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 15:49:34 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>
Subject: [meta-oe][PATCH v3 4/4] idevicerestore: add recipe
Date: Thu, 31 Mar 2022 23:49:12 +0800
Message-Id: <20220331154912.1456-5-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220331154912.1456-1-potin.lai@quantatw.com>
References: <20220331154912.1456-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0148.apcprd02.prod.outlook.com
 (2603:1096:202:16::32) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4aaa2a8e-6916-4b94-5e27-08da132e0d1a
X-MS-TrafficTypeDiagnostic: HK0PR04MB2785:EE_
X-Microsoft-Antispam-PRVS: 
	<HK0PR04MB278542BCAF47A59CCBE9041B8EE19@HK0PR04MB2785.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	COsNOLX+0vvP2KCMBGN3+/awZH7gbzD2rdIhpJ1IUnnDq2xGjKDPc+qUxrDigFWWJ72690s0Wol6VNAvkbyiK1AaCBTxw952X7XQKUefB8JdGMMunBchxWhrmqgoLZzk4GI2+9nDfYL0hKlm7yuaDykL4xAVIodUi40xVX6l/jFY4qTXz+94Ow9N8OMm0t1+ZqPdpxD6puJAiC5IziMg9kBqXbjcii91airP4Bh8p384vb19qz0oWymBpG8YL+rr61NSFa3G4sFbAvYCA3zjxcv38zxfFKW3V4CGajm3S2mz0KM8tci/M87vr1WJUpxSBZXeBjdo8DJfKIk2so7jtFecJiiUh83AO9ar8/k8Ns+4bh4fQj0zHwfBN6eAxBVy2i4K+r4oypzykZl5AmXnuaTX1jaEXcdhvM8N2MX7O256c90ZQMcGEiH4yCP3g4GRFH4hSmxdO5knBVJMiJG0TVi58ROPRl+wiMgXH+AiP9hGA6NkfbL5C850ucXAki5KC/vQmt6HPaw8zSSasZtEmI/sGGhVj9Y2e6h6Tu0tcdNinF/TuC/taDsW8rxlB1yS4HB4E4NMK1YaJWanbYutfCmEZxPFwN19HxOLWphK7577ps1RC3oSyibRISAYZO2yxUdkULS20Ps4YmUObtPH7uxIlz2+oGqQGXuOCjXi9Wb/D3LcrfVEEbpAZC97YvU28UV05shWDvIUWO50OaPBolTQOgVcx7cfUN3J/BpEW/U7ffsK2PQ/vbpqyyvNji487AEVBfHdRu3MLB+lU0QN5UjWHIXvmdWWR9sCfMFVr/8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3282.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6916009)(54906003)(186003)(2616005)(26005)(107886003)(1076003)(86362001)(83380400001)(508600001)(6666004)(6512007)(6506007)(52116002)(8936002)(36756003)(44832011)(4326008)(6486002)(8676002)(5660300002)(38100700002)(38350700002)(2906002)(66476007)(66556008)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7Igwr1SbPhKHE0zdezXUNYppvImCDZrqehvhGaoGxtq9x9hcYB40/mqQu4KK?=
 =?us-ascii?Q?7SAFUD4k4g52QVdQzs2XXDggcnJ3CA8CK0rGRYtRx4/gVvuz/uRn3q/ZvbnB?=
 =?us-ascii?Q?YJWTfubAXAqqBSvRzPeHBOKSqbxZl7nylmiHhLA82Q5pnQnSU73IzXqT6WoD?=
 =?us-ascii?Q?zMj/kmBWxP/mVKvo0hoIOqmapSU++wMzEKPViQ/fDuBCSojLwErirFNiAfXw?=
 =?us-ascii?Q?WxWfUfnhZr0dO0BTyBEVyziCxwVXrQlhzG9qMXlIolrMlcDU3YCYKAE4FzA4?=
 =?us-ascii?Q?bol+F0s+7JzoRZSAUwgkO/MWWURfdIW0N8jN85NUEF+sPTktg2QFYPYpvutT?=
 =?us-ascii?Q?L4+GI532qLAdSp1h2/tpJQzHXIPlIJfzi+CL08/7kxA7LAUoWOczs/AVtTDU?=
 =?us-ascii?Q?WyEad/jJTZbyEyPPSBZJ9+PNb1HWROS+zqHWY0gELQ6+O0IhKVmoLNG6Te4e?=
 =?us-ascii?Q?8fEbWi7isjZCRx34sNOViflBHSPrJ0ptGb7Q9HWXqb9DPAtv1cEjUE5s8tEl?=
 =?us-ascii?Q?dvsFqfJBZu21TCHHQX5ZZAb/8WPZc4PuIWBLlXdCmDs3xpjJL4D5UIzO718a?=
 =?us-ascii?Q?Ebrl41993MX6n1NC2XfaYcYADh/f63gTDJ2H0Az4qJPaODVQ0E8/tqhnhdIB?=
 =?us-ascii?Q?7Hs0qubK7xpP0RIVxzqUSh0KzEi4P67qZtXpz+a3m2lFr5bl8xcv+NMBBT34?=
 =?us-ascii?Q?Cq8Ep5lp9LoeEiw/YdkmT3E22T1IFfDyfhgXp33mxEDGkZgqPc7zSdbjP57e?=
 =?us-ascii?Q?/REDlP2jmLC6xH89UoMj2EhRarfRSTuKQA2Ea3+rW9/2o4ffR5N52AsFdrPB?=
 =?us-ascii?Q?5CvZueiNBmpT1sdBEeKmfcFZxYaTSujlfLICaqL7dydLjS5lynD8ekgAUXea?=
 =?us-ascii?Q?IrX/HjPuI9QdcoGMTGOaaitBi8xD2/XlZJjUQ/8OVlkShdgDRplFU/s31JU0?=
 =?us-ascii?Q?qVx2UcKIdTspr5DBnE1lXkEQzscn8lh6kBEut+9unX1lkJFXjKBvYT2JVCgA?=
 =?us-ascii?Q?jz65n2q3IKD7YzsgitIC2aoRUabDXZR2Bc7o0ETnGmIawcvmtS968T7Hu3OG?=
 =?us-ascii?Q?go9KXEUMx/oh5S43DeyRV1x9HDe7BXgnm+J1/RPuO2u/3CVohmRXvLNl9S9I?=
 =?us-ascii?Q?akRxy2RGwSTijj9NaspyD2iwBufS1JXYkPfJAv23YDA1fyRstiZ6HQp3SXiV?=
 =?us-ascii?Q?DgP0A0u3/murAldWGbLr4hPZxiUcFKKR9nZMHtCC+n+ybTVpiNt8fp/EbYE8?=
 =?us-ascii?Q?5MN6LKYQzNF9OBao0nG492GFE0Ga5JLvYEJ721rCzyl52jjaScaMJGdNbxg8?=
 =?us-ascii?Q?PbnaBwJN6XEC2H2s50aggHR/M1jyogJqspcX565D+Encx1JRYeunD+m8c9Z4?=
 =?us-ascii?Q?AuumbGBLvPb3tQDY/uXfFB/xuuiXaUdr9ymVA9TzbGo9tttqD/ccniaZF11k?=
 =?us-ascii?Q?Ib/VeDMOArEwO+WnXnma6VfTVAzkS3yXZdEqL3vK2QLzUT2GFygQVurHWdX4?=
 =?us-ascii?Q?ROtI01jJyPTceYic7ZWP5A7PFoFW4k4Rq2y9+wUa/KidXiI+qTYu+YzmSemC?=
 =?us-ascii?Q?G9uEQLJgia3nIew8Q7eumpT5fTE5aHqyeseTtf2RUzulnl14HPgjQhwnMfYJ?=
 =?us-ascii?Q?huC1Jv1VR+++84MQjrgLgskPQKhvo3DsD8jXTVObSDCYrKraPTIKiMznNtfY?=
 =?us-ascii?Q?b5maJI6vuOwAteSrUayNbfCY+OfExu3Mwvew+xVVyBMgMcCpy8Xw5EOafA+u?=
 =?us-ascii?Q?JAL7yTuJe8wKx6BqXC1Y7hrZR9bSihw=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4aaa2a8e-6916-4b94-5e27-08da132e0d1a
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 15:49:33.6382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 T+nYQ9b1PE82D5LhJk0bOBHppKWS+AjBPai4V7nxVYUjADPgnsiuYzSOUVuOmxajLagnyDYUrmuRz9t2hUquUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2785
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 15:49:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96297

A command-line application to restore firmware files to iOS devices.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../idevicerestore/idevicerestore_git.bb        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb

diff --git a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
new file mode 100644
index 000000000..fc07c6e69
--- /dev/null
+++ b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "A command-line application to restore firmware files to iOS devices"
+LICENSE = "LGPL-3.0-or-later"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+"
+
+HOMEPAGE = "http://www.libimobiledevice.org/"
+
+DEPENDS = "libirecovery libimobiledevice libzip curl"
+
+PV = "1.0.1+git${SRCPV}"
+
+SRCREV = "280575bb95977241e240ed081a2602d68746443e"
+SRC_URI = "git://github.com/libimobiledevice/idevicerestore;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+inherit autotools pkgconfig
-- 
2.17.1


