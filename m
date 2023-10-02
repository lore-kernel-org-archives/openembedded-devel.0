Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5B8E74901
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 17:37:06 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.59])
 by mx.groups.io with SMTP id smtpd.web10.88818.1696268224871979773
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 10:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=W3snSOdO;
 spf=pass (domain: nxp.com, ip: 40.107.14.59, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3OihDPwNpD0aAFvLokCR2kRfGvhQgmi6HTFvfWiqv8lb1qzPwZrfcqaxRGKX35uxc2aVNMARAXkWrnXydSeGTxrjetffAOzc151vlDVztYvaJHXwcEyER37pgJoFew+a9joZxeUDWEQlcc4BH72gj5hpDutYju1TSC4gHUem7t41reJlIjeELUri30KG86gGlXIT010DTgLXAqG4Fhn1GsmODnaSTtllz1FZfWB9Up9Xuy0HHMC1N4z12nGD4oeF+kGzvbnRJOpuNIH3Z5zLfnvZFSkkM8GtrumtJukJdJTiM0IIKEXdC5Xrywmz7grRkH8g89vOxEyAPW+pknmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4CcqshYX4XKp/p9582NsTnx7T8C3+2LE5TbVTxHTi8=;
 b=oeWL5KxXRg/4mlEXT/xOY8FOJ0PRIRZP00eb6fmzzzB0LD/nro3MKoCDptrr0He8gIu5I+8JU/vP5PasY3701Ldt2lSKbCWUriE5Bih/m4nej/ZiJbIN4Z7qgdBwBXVpaULKTYHe5NnFpwFU/QtcBf4f6rU/4HlAIyrSScwBKjwSsvJ74wXvY9NBjI5QT3mxMtkvg1xx4/VXi2AXojJcMNSX+jJem/z3Ptmsxv+GpqQ6FDeeF97V9fidOgoWJVyDKUDGzr/DBBJfl3rbHbuEVKkK+61W4y5gM/x06SuLcd+ygJhVTlhoANSUOxT0z1eRLPX6Rtgvj5sN1MIleM6N6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4CcqshYX4XKp/p9582NsTnx7T8C3+2LE5TbVTxHTi8=;
 b=W3snSOdOaxsXZ8O8aS0XT84j5cVk+UeVshqikiCOGBPmZGR5MuqX3SDCqGrA0SZMX+WxozdUeHtWIfuFkeH3PO+FT/TwxcM+PtOPNINTnqN6TwRBR/CH1wi1fI5fN6Aj6crE9Nj40hABIncCfvplGssDEhFZdSGhNAvGLqSoc5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9696.eurprd04.prod.outlook.com (2603:10a6:10:314::6)
 by VI1PR04MB6800.eurprd04.prod.outlook.com (2603:10a6:803:133::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Mon, 2 Oct
 2023 17:37:01 +0000
Received: from DU0PR04MB9696.eurprd04.prod.outlook.com
 ([fe80::4939:b4b:824e:49cd]) by DU0PR04MB9696.eurprd04.prod.outlook.com
 ([fe80::4939:b4b:824e:49cd%7]) with mapi id 15.20.6838.024; Mon, 2 Oct 2023
 17:37:00 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-devel@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [meta-multimedia][PATCH] libcamera: Avoid build break in signature recalculation
Date: Mon,  2 Oct 2023 12:36:44 -0500
Message-ID: <20231002173644.3284604-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To DU0PR04MB9696.eurprd04.prod.outlook.com
 (2603:10a6:10:314::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9696:EE_|VI1PR04MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 4acba5b3-7295-454c-6eac-08dbc36e2edf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dvWJ3UHwwherPA+D9CZYpGVCAO6D8BhRpH/1uAwdX7QH9iLyJ6kz8081ew0K4t24TyySDbbjOLFhrcHlotPeGdL6nT50X1S88+kIYDlts7chb0JcC6G88kKiDZEJaL4aIVdcdTcqDf+cm7FqG3jMCPweR9ToK08H85eZ8htvF8hCP4HoagNT37lhfLwMJjJBoyN4kJ9paz5nE3qmMog8hU46Ek6vsrNfWwkxJJ7H506muHqGm3qM1+VX6Z1/LGp1dQ40Dg3V3ApyhZO/6NNZmTxvpsX5z+eYpMej5UUg47M0OVoM32UIi1iWL3cu21pfv0CBuYQ1JchEuGwJt8LALKrZKUxAcPDzQZxEklS6hpufN31rf7LWJsP/KRkeOnnieFGyDqGTXlTzzR/oPbaEQ5hyKEvWTWmnYSPkltqBlLtuzUuXT9Y3JOO3+09zhf9kdi6J8nDyZ4fUiFszl6fzFMC3D8TdVijjbNf+AjMQ0takfTnM7cne/n2XftAbbWZDVs/3E2xUQVsRDCqdaHYWJ+S9gGWRyDUOMJMc3SkHtadd6Jqdm236EbHxE35cb1DRCPIqlFVBBdmapHf2YnXSbjSRF5Z++6hMS0tOXtxWpJCKBpMM8Sh9xwGvvQ60roGO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9696.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(136003)(366004)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(52116002)(6666004)(2616005)(1076003)(6512007)(2906002)(86362001)(38350700002)(38100700002)(6506007)(26005)(6916009)(44832011)(66946007)(41300700001)(36756003)(6486002)(4326008)(66476007)(5660300002)(478600001)(66556008)(316002)(8676002)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bjy9pkGTX5diMpRj/1gumfTuqnMpwJVUA0l1a3ouwYnKaK05rM49h0ijiJcm?=
 =?us-ascii?Q?N3tUWqXudFbYcyAdzk+Fw02ArksqaJcSbncx2LwHORL9A5i8BUeo277NVPBp?=
 =?us-ascii?Q?Zud+FmYOAMR2TftIXMyUpukF7/9/5oL0I48LozfSIeIPMdvdbAkpY1PFBa6l?=
 =?us-ascii?Q?6edWNz3i4qAD2WR3jJ4NsVtsR4UKGt/UVc2HJaA0whOfRGzTper/yVo9KMDl?=
 =?us-ascii?Q?Jul6XzHXlvEtgywt7bzzY56Tv73v5JWwkIyd8UIOk4QGXwMGtt9vmSlLQQEj?=
 =?us-ascii?Q?L4ZtJgfyA5Pqnzi3P2wbrmBv7Q8OlEDWnP5fEiezu5v3UQRu0l+w0b20XlHm?=
 =?us-ascii?Q?QK2sOXVsQttzlg3MkP+qjhH4TrciXk5/FL8AeYtMXRScc9bW3mJFi8smzCop?=
 =?us-ascii?Q?HshsdVA9alRSODjaVFtqzmUPzqqsL0u8jIYRVNxLzAZgMZlPD1YzgINxVz4e?=
 =?us-ascii?Q?xOuP+wRuErNU2XGc4Fmbo0CI/saVg9NRgNZCJhfb7hnj6JfsyppZUEC0BNbc?=
 =?us-ascii?Q?ActmyC/3F5Tz40aadD44HEChsG4EA4l3KQq6b7TldtXlsbFrhTGMo/Q74jIq?=
 =?us-ascii?Q?Awk4EZjtPeH6OF8G/+JmL7gnlUdlx9tYZ4B5sQedNzxiE/gT9w8vUz7sYfOi?=
 =?us-ascii?Q?AnJ8tbBR3yx4b5DnA0xYqGM6jO1TjPsijUPQIkolraDZXydgf4mZHCbMDqNe?=
 =?us-ascii?Q?pJ/aV2wH3gf05ukNUVB/pYXv/BImrd+u3S1TKL+AopZY12cJq011ugHwwhGo?=
 =?us-ascii?Q?5AZa/wEVQu4uQNW17pO+dUpHMWWsBGIji8CH5u56W0JG/+aRKVLlV63QUrU4?=
 =?us-ascii?Q?kyLK7mEkFWOGFdyX9hXJye3OWUQnnMcCkmUYRqvraN4XczZl3qWcU8H6doIg?=
 =?us-ascii?Q?297o0Upi3seHgb3hoPUjkXS5D5Xw192IIX0+4yypXgE2avh9v2J94nO3CO4v?=
 =?us-ascii?Q?S4W7/1tLadn+R1PtUadBlV+0TdIxMuFn/JID5XmLfDnmpfvQihD5ANYgCAqQ?=
 =?us-ascii?Q?3hi5FZA/sr9SdMxfDFTBwCIsa2AEpgHPjHR7dWyluWOzYrwZbEuWduNirbUb?=
 =?us-ascii?Q?3TAMlP2zLhHZ6vnZaAsRATzVyS0v2ISbl82Bh0sJEq3Vf/3YQLpHg+VtJ1Cz?=
 =?us-ascii?Q?6BWDr+rXtfrHPBmLfp6pvnZxHaUIMmMUdGdsUGW3WKmbkB2HeyKF7lMOBQPZ?=
 =?us-ascii?Q?ENGfXUrSKsU8hn7l6F70SAcjTel7bdniSKBApN3BlvJIaqeKwaprJ9GSRwZh?=
 =?us-ascii?Q?CVAMmiIOKBKJhaVLFBD+QqXA+qWj9BIIMU47XuzD4Ux59qmOOMlra8aSTNB/?=
 =?us-ascii?Q?6/kVWdZCTL9xCCPzrddgxUQd9OnW63+ptjbfGVxIFZKXljGClXs2WJPtEuG1?=
 =?us-ascii?Q?0hFBgn0h9CLSWX/XSVaoTiz+44ZHiHIxZK6g5eO5+ZhgEIXdoThuvEtNAYDL?=
 =?us-ascii?Q?ylnSvGkF+mcyMsW5mNs/OA2VhwYUknoe0iO1ONI+KGO7OQoAy0/oVXO1xm9/?=
 =?us-ascii?Q?EPFKw9Fhb17RuJ0dHs9rjE8CteXZO9dSHGK6kMRJMu5dGUhuw+RniHXuQPPR?=
 =?us-ascii?Q?JjLfb53PQ1C/eQ7kaUHOpYT6T2AelM6inzGeJ8bO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acba5b3-7295-454c-6eac-08dbc36e2edf
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9696.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 17:37:00.5969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxv87sapIe452wdM0Ojuz9nZbEG8qZJYT8PHzKsAFo8Z8PBguOsPmLDXpa0hb3+APsh4BIg2e6a1NW4QhJOfuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6800
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 17:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105309

The signature recalculation task can fail:
```
/.../build/tmp/work/armv8a-poky-linux/libcamera/1_0.0.4-r0/temp/run.do_reca=
lculate_ipa_signatures_package.937421: line 154: /.../build/tmp/work/armv8a=
-poky-linux/libcamera/1_0.0.4-r0/git/src/ipa/ipa-sign-install.sh: No such f=
ile or directory
```

This happens whenever ${S} is removed and packages are retrieved from
sstate cache.

Instead of trying to fix the task, avoid the issue altogether by
performing the signature recalculation directly in do_package.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../recipes-multimedia/libcamera/libcamera_0.1.0.bb        | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.b=
b b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
index ece1be6f3..2a3c6473e 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
@@ -50,8 +50,11 @@ do_install:append() {
     chrpath -d ${D}${libexecdir}/libcamera/v4l2-compat.so
 }
=20
-addtask do_recalculate_ipa_signatures_package after do_package before do_p=
ackagedata
-do_recalculate_ipa_signatures_package() {
+do_package:append() {
+    bb.build.exec_func("do_package_recalculate_ipa_signatures", d)
+}
+
+do_package_recalculate_ipa_signatures() {
     local modules
     for module in $(find ${PKGD}/usr/lib/libcamera -name "*.so.sign"); do
         module=3D"${module%.sign}"
--=20
2.25.1


