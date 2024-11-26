Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13E8D5A6E9
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 06:53:40 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.106])
 by mx.groups.io with SMTP id smtpd.web10.40072.1732604013778256317
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 22:53:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=IHU9Lf4+;
 spf=pass (domain: navimatix.de, ip: 40.107.22.106, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BI2iD4eM6zv8z9icVy/WG8+qBv+JKEpI52H/SIeHiYPVUeotVqp1bqCQP/5mCPpd2soknKhnmPbiI7jFRc617kFNkADYTyGmR9riQQcq6JcfCjy+L5Mx7BsnsR7AOcRUdmGtGdU1CXXQADZaR/P01G78eKdtm2PygETODv0E4MDZi/B+AmV4NpJimsgfwi0ufZE3oUwVl9WpMT+k1ORYDJPDXlfueUHFyx5G7OPqiisvnVCHCS7wHrKfATMg7P9KUD0y7P0e5839TJ0TCng3hW8Ej+u+Rrp0UWNL0w7WqDQ2hZxeLxZCrjA1S7IeuO1LlZ0/JTi2fBq1aUGnjpAKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/iAl0IujefzitDchAXWMRqChxuMI3sVLoeMYMVvy3c=;
 b=DFUSRHdRf94nnJ3mMLI07CY2B4aei4Bn3ocfztH4PvZRlbcOXE2oXNfj8LDisIAGMllobb+HF8ldTE6AicrI4AP0YA9cSYfzn7reXg3HRltYOfwp7mxAMFHHCzc5sLy2zMmQimkXNLCz4Jpiy/RGwWJcx9HzQNN9SsSLJppq6zHtGvGWldagYZvxBP0zqMGwmXLB7bZLpZqyUEwvOUKwuLSYStQC07s45khHfby968HZacnNAu0vyBLyWtVG+0QEjHdNuHJAOaCIJQWlWFiRgkpxpLhdz3wIQMJXInoy5otVIq9jFRhbNLUbftMjrtC2GL8AxnvruAFfPHlEMSgy6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/iAl0IujefzitDchAXWMRqChxuMI3sVLoeMYMVvy3c=;
 b=IHU9Lf4+pgEWqqwBvc4gFPJD9HyGFin6LrNdycdPbETy+TliRsnbd6puIZaM11hCUr9PGYWd8hLffHd81WD/DiORrVE7ziREAQmeS+QvL6PzWxJQa0BBwW8UAZb4TyQmDkV4lp+bgeKzUtdItg9A/X1sNW9hbA1gL12fqro8usc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DB8PR01MB6454.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:15d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 06:53:30 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 06:53:29 +0000
Date: Tue, 26 Nov 2024 07:53:28 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] webkitgtk3: Add DESCRIPTION about API version
Message-ID: <7bac2b253dc8cd053cf2301b6ebdaca68e6af437.1732604006.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0327.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::6) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DB8PR01MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bab1001-136b-4134-e41a-08dd0de70910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qiGMxg/vSBdM8YsvZCxvthdPzuOc63tSVdS7AkFD8J+Ok6Fjp85t14JFp1Ab?=
 =?us-ascii?Q?0nPy/JZCRrV4+D6pIlyMX0S1VPqWTXU7tE3c2V43Usdz0ktRwrqPq1XQMbDP?=
 =?us-ascii?Q?gjlG3XFCe+hpn0v3T4hMHWltC7qkLbfPwJiglqe+R+KSYMcslDQ2TqwQefdM?=
 =?us-ascii?Q?WD8HmLoumfWlgOB325+4kuAa79OHYKUnBNW56ybGj3krqP2tzNZ9fUMjRQY9?=
 =?us-ascii?Q?+DzlLi9ELwMYe5MmF1es2UxNj+aSLxJnkEYLG0Nyz72wEPx57Cxl04Lh9G+t?=
 =?us-ascii?Q?KZIjIlKKGZ808rKeO+qDuHhoMinwkLn30Qdt4ualFjW2MnKSIUZG2vL+w9s1?=
 =?us-ascii?Q?MWrIbk47um+NN998C3nh1vKoeK73QnrDFQswr6zdt1thknHFn2zA/xOepqGE?=
 =?us-ascii?Q?EXIlAbSXDjqVkh7lA/kW4VJuEdpisFST4zd2oj/YXr2bBZY0mSZynXArKPYf?=
 =?us-ascii?Q?l0AuHJAjVGIamcqyLoJfEcs8Ce1ZCPzerO9ysL84m6equIWEf3lMCuFMgcqm?=
 =?us-ascii?Q?2imuz6+D15d+BankljUJHL55+hMSBtPPdj7qp/jmkS2JjnkQ5hKFu8kPdRS6?=
 =?us-ascii?Q?V45Yb2XSys9ZRGo7ecmGqDYkrcrI36eQ+wsCWN0VsNkGfgnxY6dliukjp+CZ?=
 =?us-ascii?Q?oJVk3VlJXvYCjcvr3d74kJkZOMjgnR/zPtM9U7X/s+jU6Mwe6tO7u2kitfok?=
 =?us-ascii?Q?+LMAgsYMmG11MrcsmSeSOvaaZn9CFCHDIDOO7qypAHsG3ln6MxQNBsNNg67+?=
 =?us-ascii?Q?uhzQCMvGRwvBeSgkKuo58YQjui5F/kVFvzgS4aZtIs4wDvDdz7HkshTJGOD1?=
 =?us-ascii?Q?n/K5p6/nNPcw3rctCzMEl3ucS9HgksIxQzQAJPoghiMk6TFf4/VMzRlRJgl2?=
 =?us-ascii?Q?VjrNLrhtXRjyH3gyjEZcjMMGsaRQIa3lPRInfowZAuccwpWs5u2TeypJHlzv?=
 =?us-ascii?Q?U/BHnUXoxIfeUIPPdL6d8x4VhngrN/9TVegLLAPqWUMVyreTwYz1jDzoAwEj?=
 =?us-ascii?Q?t+YmsqFZsPMMKHmIGDEO4kD/SUb9SAf/b9xSLyA9sOuwNJe/0tzbIJ1j3q8s?=
 =?us-ascii?Q?ltjsYZr9eQalazrcslmsP6Kg5bh5kluYaKuERkRpAb+aVUXP6y0LwgWVuhUC?=
 =?us-ascii?Q?kslLidh7N+1bwReM47U15pTxv7D+RXVmTwq1OC5ke7zzJwz+s1dSS0EnEqiy?=
 =?us-ascii?Q?lKb1ZI3hTxUuFvv9j+nJkLTF/s6h/cg99HefKKlxG8F1Wj5jANybiphSwZa0?=
 =?us-ascii?Q?n0G8W87osbx4Wuq1b9qDiMbwsWigLcSZcjF/26ZoV8egC0XFjxSthoSv1iAo?=
 =?us-ascii?Q?MII=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pbVNOnWCO62NznDwiEC4uszQqVQWkZY65QPH+VlBWRcghh6yLPzlJ/DHT8aZ?=
 =?us-ascii?Q?aMtKDQS2hSUIzFHM+GJzV5TPpniDpFFbE3ndtzGV5ypQ7UZMPBC/fbQpzu2v?=
 =?us-ascii?Q?vfXYC3NXxLT5DOsL7C+s3RXc76ugr6CNgf+KvUYUBvUNvxOU9ypG7u0ZexGB?=
 =?us-ascii?Q?bJfIaLCTDxMKeokUr3QgbCDIip0PV1bw/sZFOLjBkvcZ2cp8DOexDB+EDfJ6?=
 =?us-ascii?Q?ULMPThKrON1CBWV7VFTQf8gNIqi36kc/s2Z1wMmYpl5d4mgj+IA18Ret/LvD?=
 =?us-ascii?Q?FALh4FoLvHbuBbN/3E2n/4aCFzJ9xaA8+w+vtxxhqkYS1RIAFsCi33ys/GqT?=
 =?us-ascii?Q?5GLvy9Bru1muoNQxGFesOkAGkBlQ69sT2Q6P0kJ9MHEapB4/oWs+tA8fHsyJ?=
 =?us-ascii?Q?9KFuPnF2G0P4Rg5mcVMV9cHBAaQN1upoOsJYgckoFnK6GF+MDG08ombFCZMW?=
 =?us-ascii?Q?Ty+gm76nbn6ajMH1S1+1ACf+VoBXUonNWLQ8hHa59+DJMAzALzistf1fxzYJ?=
 =?us-ascii?Q?bWByLRfS+F0sCWq6/s16F4Of4PbbQwqQFkdjU7VP6PBxfNWs5XU9VJLy7csn?=
 =?us-ascii?Q?ZWKxO66RQW6fNXj98gTWghY6wWoH57lwKApGG+akPX11b/V5+6XQX7+FJreq?=
 =?us-ascii?Q?xjd8A/QQMuvSzzhOINhr8GOGWHotefEorxsOywrrlVD6P7N3azE6UmF2bHEa?=
 =?us-ascii?Q?8n74Y+xXclduXypb4d9wMC2jfi1P98gTT6zu8YAVWJymcrl/WwH07LYEzBR/?=
 =?us-ascii?Q?SGXOovB6vYyKJzxVmmp96wHUxOl9DmbxCPx9uJNs32eZwa0wu6qwu9Q6Q4nU?=
 =?us-ascii?Q?QWdpXFKBI5Y7LpBzxjcR2yE/qyorjM4HXednjQn5QwPxe8PY8dbuPwWSnzBR?=
 =?us-ascii?Q?Z0K4fwnC1mezyaB12tRtYG70dtIiARmc7AZZ+8Ri+YI01Gm7NqeFqFHvsdAS?=
 =?us-ascii?Q?Hzu3aW6HiAKmH1BDwREyyDmrB1GQv2aPBNevO2Npn9jWUDfU9F5UzVL5eK/p?=
 =?us-ascii?Q?L0GxguFxA8CeHQuBLyQlUJOvHSG3kv4bNxYTwQ4X7JEnNXi6lVhQ+DVHfDkn?=
 =?us-ascii?Q?OIi7G8Se+9aWA9b15J+YM9HgCR8jkNQxmO+t/4QHIK0iyLLEVGqWuCLXiTkN?=
 =?us-ascii?Q?oQNbB272D30T52gkMiSYg+sRqjTkXN8T4F9T1MVuhEgfWmnmq2oO61foj6aH?=
 =?us-ascii?Q?hMAQgHTPPziPVul/WLzZgvT+jxkIMutnLe5VZPW0MHPpVvNCck1ar8t6Wi8S?=
 =?us-ascii?Q?rDMTMPEwKXS84uqXQzQAIglUESmYdVrHJ5oYmout2rQZk7K/0Q6kzwRw3uTL?=
 =?us-ascii?Q?eyyN8Zm/z3WVXpyXx74/wuBYGeUCuW9e+lEI43ggVQ9MXXM6znZ6pi80WVne?=
 =?us-ascii?Q?u7HYMoQXRCUSVmVJ7eEshf8iRS1LhNlb1sGJmrIYfvUKK47aH+rFr3RXkw8/?=
 =?us-ascii?Q?DoEQi39dingVDOUREmBEQ9MTJlqQNPbxnGe2Zouo7z4vGLH6zf5hTdKrV9qE?=
 =?us-ascii?Q?unNy5fAQoHF22utvnhK2divnF5yiCH8NhQRp5VBD+1oKA6ZLon20uca2QL6G?=
 =?us-ascii?Q?A5kzdvCS7CRJjk3Xq+gLkkYNzQcg4BM6Le0g3/k4mU2KdMWr9v47FKyqv/9G?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bab1001-136b-4134-e41a-08dd0de70910
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 06:53:29.8910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4fPEU3vp730EYFmCGDmRtkWtbJgLImBfNR7ZN1nbfwbU9AUx+qgL6lczLHegpeYxAxpw3GatupU19f1FeLP+xUG5P5rwJv3aMnYH6cAMN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6454
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 06:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114061

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

It took me some time to see the difference between webkitgtk and webkitgtk3=
.
So, give a hint in the DESCRIPTION why this recipe exists. And name the
pkgconf file for javascriptcoregtk to make it easier to find this recipe,
when you have no clue about these API versions.

Credits to Debian for lifting the fog.

https://salsa.debian.org/webkit-team/webkit/-/blob/f04cf703b06ce74bb94add3f=
75aa7ac5603d0eae/debian/rules#L11

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb b/meta-=
oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
index 01eefe13d..4c8b00560 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
@@ -1,4 +1,8 @@
 SUMMARY =3D "WebKit web rendering engine for the GTK+ platform"
+DESCRIPTION =3D "\
+    This recipe builds with Gtk3 (instead of Gtk4) which results in API ve=
rsion 4.1 \
+    (having javascriptcoregtk-4.1.pc instead of 6.0). \
+"
 HOMEPAGE =3D "https://www.webkitgtk.org/"
 BUGTRACKER =3D "https://bugs.webkit.org/"
=20
@@ -48,6 +52,8 @@ DEPENDS +=3D " \
           gettext-native \
           "
=20
+# using soup2 builds (JavaScript) API version 4.0
+# using soup3 builds (JavaScript) API version 4.1
 PACKAGECONFIG_SOUP ?=3D "soup3"
 PACKAGECONFIG ??=3D " \
 	   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
--=20
2.45.2


