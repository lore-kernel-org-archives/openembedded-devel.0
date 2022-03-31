Return-Path: <potin.lai@quantatw.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B08C4332F
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 02:17:07 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.110])
 by mx.groups.io with SMTP id smtpd.web08.2372.1648693024501356116
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 19:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quantacorp.onmicrosoft.com
 header.s=selector2-quantacorp-onmicrosoft-com header.b=WUD8RaBW;
 spf=pass (domain: quantatw.com, ip: 40.107.255.110,
 mailfrom: potin.lai@quantatw.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFtvtLGeVEpkL9IA9NIbbFbfM1PR6dK2XXKed9NiIX4PuKndsOgeOyeXCC5q9M3OMoSdbrLRXTIqt11z6NqTrKpuaBEcuQZ5yN5MlbrbUg9SHxOVE4PCW0D8xaR5GGE7mRMYYL/3ZxwMdxm9t489Khk+HeMSpCaKL/qe/my/9GnQONZT7hU3vHz++miL/uHVrPOg/qCA67KQUczMxtAg12SVlgxdULxRrk+V82YNDXOqoEDGnfWTRXI3cAQCpFlm5Xq8PbaHagldp5j2FR6DNP0RgNJqiOQO7aGS2Gmiwd9gPqDQzNpw894n3Jmc+UMvUGNKfWTpY/bgJw8S1rVL7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akVZ8Tweyaur0/sGXr4NrL/eWk25+uNg0XdMzFnKpwc=;
 b=WK7Yb+zU4Ue08046adWxaoeh1EfqwjbdJSwxGz4a+o28m3UzUCfh5knjsyATNVJI90IsPKsRwvhjBybcJjwD0UnP/a4fTqUipqA8JfhPAuqtv6G4Hlhx8i5UUKDaDRV4+BQ4GTOBLoUNm5vV7cO/qnwkdL+/IiqURUeVPPTK5yv977LZhHTtz/pf3aYEbE7T4GKHYX7XJQTH2BRP/GYK5xsdAex+51/17V84yLY9ZqjKwG0x/fHudrh08OT3EqmcbHeK8FCbj19EGx4wvIk8qUpP4uCFQWvu22hJ59zq11gtCVcb5PUO0SYxplpvOuYH8ePuCC3gxIbvFlEV1P7kuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akVZ8Tweyaur0/sGXr4NrL/eWk25+uNg0XdMzFnKpwc=;
 b=WUD8RaBWkapZFcfR6sp5pwlgIRVRLI91LT152iefFzr0uXTAO6vmOGc6J7hiph4UArjqNY+SBLx2iEvtvGRwxXywnLgKy2Fkebv6qP1eIMMHlXSUnvzRd3tKRLaUHWr1B4HaY+mRTKTJGm322Xv35+SqnpXkIo0hHMs+EOkfQMY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by PS2PR04MB2694.apcprd04.prod.outlook.com (2603:1096:300:46::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.20; Thu, 31 Mar
 2022 02:17:01 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42%7]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 02:17:01 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: patrick@stwcx.xyz,
	Potin Lai <potin.lai@quantatw.com>
Subject: [meta-oe][PATCH v2 1/4] libimobiledevice-glue: add recipe
Date: Thu, 31 Mar 2022 10:16:45 +0800
Message-Id: <20220331021648.16582-2-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220331021648.16582-1-potin.lai@quantatw.com>
References: <20220331021648.16582-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0150.apcprd02.prod.outlook.com
 (2603:1096:202:16::34) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f1a2f13-11bb-4f3c-5de6-08da12bc8a2b
X-MS-TrafficTypeDiagnostic: PS2PR04MB2694:EE_
X-Microsoft-Antispam-PRVS: 
	<PS2PR04MB26947B3330EF21035ACA54738EE19@PS2PR04MB2694.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jZDAtHlsYMoOpCD4+8GYSxDIMre0VoDucarYtnXzZns1A591gs45bF5z1P8uHYfr5LTHJidMkllvWxCoFraExz7I3IoWy8e2QH8TxvnxUays6sv8EC3dT3Ckix3SKn0tM95jNb4j7xzSQvGuEAuLJWi36eLSN+yixJVUOl5NZb3m2mchudm/4Ic9kBq4P9vc6p73WqxdfLFWElVSQnkaRC3QnnTFyv1vPQLSKWdLKq8VldIuHK/3NLDQbhA6rMjY9VD8SQWKeKINBMqDX5dG/UD6jbnaTHtDkNSv2QokeCnwlRxYX8t101vrfLG8HBh+f9IiUc/WK/a+1pGmFR8aE7MTg7epYUjmZd6y5Jfkemg6arW+G7jFZPljxYSgA8fgDIJNaUnZaheo9Hol0mFeBjxGuVzxpJOJJ08ZUZj1dp7IB9Ei/oQ7V+B2sU13RoPh8j4/XQHM6Ucll2bJhqoGesv9nOkZGhAJRSEjUY1lTbNHbuDA4JziDWTvSrGZ16hK/bmW152HXe4AeMnqidCaqc+h+GQ9064XctK5jmaEaW6tRpSnPw1rCchF/McOF/Sq27tSA98HKrt9WTk7l0D1CRXWk30kqflwIFu7thR9mXUxUvpu6NaPNoXZ2pUwOM7vL30OknFNHpGo4O179TlZ6MyU8EJf/qGoLm766oMGfO2Y/OGj5cdDIe6dOIQzoH4nDLiSgod3H9DOrsd9EAczwmeNaT3B/BNR1iic3OVbtsDsCH8rgpxoh6TJh1gBiS0OvjznCHC1CdP2iAVo7GjA2uo4TAwx7I+5Qgb3l77YAWw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3282.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(1076003)(2616005)(6506007)(6512007)(26005)(6666004)(5660300002)(186003)(107886003)(38350700002)(38100700002)(8936002)(86362001)(6486002)(508600001)(44832011)(66476007)(316002)(66556008)(36756003)(66946007)(2906002)(52116002)(8676002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?saudiKBeiae3qSeJQG2w6gZU9G3rRhVq3Ww3JD3IqxK5UPUYXltb5z3txUe1?=
 =?us-ascii?Q?VFJKA/E4T9tyFfirJVX0Jfr6HEK0GNOZ/zzhu291E8AJhTuaogVeTezmWDXx?=
 =?us-ascii?Q?9OY5ggBR4/VXZnBEjfYmmnvN2vTI7wF7Er0444fuYa1Row65xsEkQf8QpNjc?=
 =?us-ascii?Q?lseJMsrsOzwsuPRc42gQul8D2DNehfqLx5ckGiuNm1mI8n57flqi6hUMPy6X?=
 =?us-ascii?Q?sNN87mXSIf323nwci4NGj5WlA4UQVK/z2zYw1YpppuChI2zEvSPvQ0uveEGk?=
 =?us-ascii?Q?T4KqSLX49xLtjrIwcPpPTItM3HIvZ8LPYQ2XFw7s73LpzULbT4zVRLONDd2u?=
 =?us-ascii?Q?Urvsmof7fj3eOZYjF97SE/wKt4I5lqSxbrj1/1kjYJ3J5qRrxiUbXUEQr7XN?=
 =?us-ascii?Q?4ffHHlDJsY5GfTbs+WERjhMW4ylykoLLPC+iG+4EulcZC+AivzpWGOdySS/i?=
 =?us-ascii?Q?CJboEAuiHArfB/0DWSFttA4A0aTeUyES/dS9NY2ZmIq5/FoLwWMt9K7g1jAC?=
 =?us-ascii?Q?8QNkHtc+JGqoqGUVec+q+0cAgEsEJTmbvcuelA0QQz2rSHktnI7MxwfGq1jt?=
 =?us-ascii?Q?d0i0o3J3qbo/Ks1fQLgSxCZ/gb44oDRGuAFzVZ6weFg8oTNEwtiMSg5BubOS?=
 =?us-ascii?Q?c7Wet4E24c6LW9pytMWSLBD2bGYKAjgsu6cgBMg4BZcmeJz8SdZa7ack2+VP?=
 =?us-ascii?Q?Fy8G5bg6PklbVm5Tq5bMIkQNo5vfraAnj0+PFBdIp0SiaC+QF1Y5xHnOJbvH?=
 =?us-ascii?Q?BmWublw3Ru8E0J90vk5NWihs993V5skB/60X44AtwnVj9VDvaJ+sYohLebRP?=
 =?us-ascii?Q?feoII/XRL2Q4bnFUeMmhPs/7TwjMkL1QF5if6XwQO+lBG7IYPVh6LGGPENbB?=
 =?us-ascii?Q?f2JlXHG8/gQMDADxrjuSa4jMkVCmdDHWqTiLQvFtylkFVQNhNg3/uMf88EON?=
 =?us-ascii?Q?rwPC5ejAHTDCyLdwoPmdgTVaIGAyyz/kjKK05lJc51tzFl+HjA85drBxoc03?=
 =?us-ascii?Q?p1kdpD1Y5gHDg3s6dKHTtVYqlfPV7AvLn2UqBuBkaqBfExZNKT1Zby0cu8Gg?=
 =?us-ascii?Q?Xk7ZYCSEVZ9R7tpXJ6IxBHWhQzp4bOg7nCC2u9VtKZZk5WOSpz3+DCRZcY/q?=
 =?us-ascii?Q?962Hw6Rcqsvu7L0etfZpOll+I6ItNXgfg5bxZ7FJFTxLdGxEeqhsXg3xl3n4?=
 =?us-ascii?Q?wZZ8amnsywDTLI9CKR2U0tM47S+hdbzdrHGXIW/MwouqlCApKhkALPRf2snp?=
 =?us-ascii?Q?FjSy0jvRiF1pqD3+ahUgu/K6A44AswjbKKkhr5DrxAwfgSFxf30A/+9p5D8j?=
 =?us-ascii?Q?eHgbbKPpngYdwUBNMhGDoV392xRK5wkSAWhHYinHclJRDYAJY67UpZcmrtGZ?=
 =?us-ascii?Q?Sf0EAeSq5qz4uRZXhMI1pOE8UoxSDuhOtH9YmWt9ERMOFzMacZxEY6jCbckV?=
 =?us-ascii?Q?4dhMovn66yhucYAUqdQIIhEoTtd5fx3FxU9LSy+WqrAaaqy5bj5cApRxlybd?=
 =?us-ascii?Q?3iA65QLTJlP6uiJMJrYmq8ZgtQZF+4PIaThx4QoMAquA2a3/n4bZ3LKnJfKq?=
 =?us-ascii?Q?Xve3LE37Kcz/74RBQME/UK2gJ+kyYrUX/hc1Rs9Svp6rIyxCN+UCFr1t+B1o?=
 =?us-ascii?Q?UPFg/LMF2zPqQLqjNlnYmCfk9E/J8NI0EEN49ozgWuWqIWTBdOteT8S+1cVP?=
 =?us-ascii?Q?YjGJbl2mj8eZMsfwVsHxe/EZ6p8PUeRm7unXSxoiBhvJkuuGPyZl3I/je+7H?=
 =?us-ascii?Q?JANGdGAIbA+hDu1m/C/PVKpnf4tHaH4=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1f1a2f13-11bb-4f3c-5de6-08da12bc8a2b
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 02:17:00.9314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PirBF7QAUjx0D2x6DTEmL9GjMCbru6/Q+oGRNRAmMITkn1TiFqcAX0rKDPKJtswLC40v2hbWZ5DjI6kgrIYTeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB2694
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 02:17:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96276

libimobiledevice-glue is the library with common code used by the
libraries and tools around the libimobiledevice project.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../libimobiledevice-glue_git.bb                  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb

diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
new file mode 100644
index 000000000..28303d082
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Library with common code used by the libraries and tools around the libimobiledevice project"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=6ab17b41640564434dda85c06b7124f7 \
+"
+
+HOMEPAGE = "http://www.libimobiledevice.org/"
+
+DEPENDS = "libplist"
+
+SRCREV = "ecb0996fd2a3b0539153dd3ef901d137bf498ffe"
+SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+inherit autotools pkgconfig
-- 
2.17.1


