Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426AAC98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 11:44:54 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6137.1790336686687659610
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 04:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=uzp9Nlrx;
 spf=pass (domain: est.tech, ip: 52.101.65.61, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3dQLT6LWrWGpeD8vsq9RWjLCJsR/63+PHwVNzTqMBNHdXSbkA6/SNl6w1eoZhorxfitapNNc4ZfCLege1C98WF1K04NUfhzoMKrd+LLuczEkcvV/HTFwR2UwxhYZ6HDw1VOLniA/ObhG1pRjC6OsDzfjBRj134HRCl3EXu+TGA5jA4bywplqaREslcROKQJD9YApmur+5MccdjK3mUT/rE/ObbK9GLLqV1UwAgslujLeedTBD2cDSJGlN2DmG9xTlL+J6Hezj8tPVHVMHH5wM6+ks+0euheSAXvy8+wnJ0Y/xpngqfBXbaF0MbhrSfTxqD9u1p4+ZUquuyqg6CEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHADaUrv1KeV4ulPXxpdsrIdrsddtg/BKdcalM08vDw=;
 b=sTz/yqlDpyrwzWgBKlDfgBVM2ZP2E6a2/0tpXyDqRd9e7xnEVIKXYvcsizbY8XRZm3H3CBxhtE1cJ6PThPCCj1ei7+clZhtpcJTkV40ytF6OVA6hokmSqUmHusNd/RErpRtd0bt7qqVXENaasbiU1QAl9ZKkA289angOOyk1kHfu68wPfflFuYZqaMYtWlgyjqFbDA17iw/txw7f+ew1Afk0qbs6ExxL3W8Fg+DAkQQ9iEZKkImWbernrI+CYSyIfWV9NRDcuUsaiQdYJZhmilqramEO2yarJTPTTUMkvJVeSCDK2P+FPaHxJgjAGHuXfj8KHwDmAoayf0w7GbRAbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHADaUrv1KeV4ulPXxpdsrIdrsddtg/BKdcalM08vDw=;
 b=uzp9NlrxMKkxyAePjnY3vCs6LQd2tc+Bob051UbOmw4uaILm0BwVedV+u/PrzqhaZDKLTWI2OCf8uD0Z4/oimMxIcUh8yl8IS4gZWCTwB9TOeWytIDryEwFskZCGXvVOqn9x4ieTvc+CzmaMz2X3O9fwikSoSKl+60CNLogL0BlhwJWxrDAwRr8w4S+FSdortxsVfegJFC1wnm/MgIrWBA2wGSU0g7gWeejHg1fWXkfN8ocjw6Z5fZJtXACEZtNzv7A6q3GTVaMJqjKd3NFrGfzU26dpG8zgVkrRNpSBcFqUpgWij0R7X3drUafrciTH+PvvXovOO4gBw9aa7qN5PQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS8P189MB2313.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 11:44:41 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 11:44:41 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 4/4] ulogd2: add repo.or.cz as premirror
Date: Fri, 25 Sep 2026 13:44:27 +0200
Message-ID: <20260925114427.2889-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260925114427.2889-1-jaipaul.cheernam@est.tech>
References: <20260925114427.2889-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0175.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS8P189MB2313:EE_
X-MS-Office365-Filtering-Correlation-Id: d732a7c6-c1be-40dd-3c40-08df1afa62c5
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|13003099007|10067099003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: cDZRDgSuLMmhiZG+FFVGdldpxbkxfUFhCbVjerhvZkWWE6m8Sjfmevb/YeRIFej/Hz0bDrMVGMpLh7ZnhSvju2ZtjUyWJGIsFA49za7I/14MAtaLTHBaJxB6AqMvx7aV5fBvw1GM7evKLbS6QkbpDLPA4yCP0ybAsQ6EroAdKRsDZGR936FIdU0EhvQPRRxO7hsamjCIVlgbueI87zC9Xu2VJdRan5l8p9uykKs+hpffqyWfXFUcA74oJMsZlgSi3Fa9jTW8r/R0q66GLfiSkVQ5sglk4XNTjLeoCcRduBMftG5N8pMPVV4mIHhU2Qr4tUcOdJ0zUAA+aad8NEs96GTixxh5nys8UwV2Nbmo2k/xqq7V8XX42HcLAVZtXfFtzlNMPXm6z9uE5ot97WyoZWXHx2dOBDPX/DgIXA3bVao6/IyCRJoX5N+OWy801PKJyR5ditWMVPeLHog6DWo40x/1sIPCJfyYmnyaCTT0AO5RcLnPTglxPLMaDJ6dcgChanUkcIX+Sx9DqL88RksMyQ+3bscag1nXOVrA6hMVUfqiCc6oRLZfw5WF/zhste+6ltlbmR0kecyIhUCBALr4cmJVqOItBOGlRjBdaBWShC+lGT8/YqtqwEmVNbmE/J3u
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(13003099007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VLsQgvhhUXiZhcDTyAS+pFfV0WPlW+Qnn7pTB+YAzD9EjQM8IoxFjapmTkGK?=
 =?us-ascii?Q?k8KLq/+oFsp+00VnDGhZ7Ssda+k3t3K2Tu7LyGwzspKxhufIKIc8ZsPwcvls?=
 =?us-ascii?Q?xT4vbCumOCOvwY7ieGMW3YFCnGgrfY2HGc9jCOELa8w7mn/MncF3Wab8czd1?=
 =?us-ascii?Q?1VYng0kaJyxZGDwU4dirZ5bNm4z3FO2j3TAKKRo/pN5ra0eVRiUySE60a8xh?=
 =?us-ascii?Q?R378uYUKgHYMlG49xmj3lVcojR4S0f5YzInq9ettBRpK0Q1sS+cxCavhjFLA?=
 =?us-ascii?Q?ZTU8LKLvx0ATm8Y/4GWbN4py6w8900Qk+N/3CD/DB4CKwXLsD2+3CU6M5On9?=
 =?us-ascii?Q?5W5nGevnhjuPQ1PRws8T8BOOfSy5nMmYqEZN2nO+fRpnBU274JCRiZygLty+?=
 =?us-ascii?Q?Mzk79N1zavBWpVTSPjKjj2FZ/f3D05gtcOh9xDdVTFIzoE9bppCnSrmMEUhQ?=
 =?us-ascii?Q?ohoGxJDTFI1D30enfijTHQOtLXL6yhLHwr+6qjgaElAqtmC/UqkpGPoGkDwF?=
 =?us-ascii?Q?qaJNXNsIdU3CK9qOq5sEJ9aPaQbkk1gU4+kvO2B8kNv/pYFL4nvx0G+WpAdm?=
 =?us-ascii?Q?xGQGbO9sm2/UIKeJK2QRy794wyuPwIRodjuXAKXmHhiShMAeu+tviMfFYT97?=
 =?us-ascii?Q?zAkb+/7es9IGFl4XqqA485/aU7HKzJU5ozLF2pHy25aTSeOYS/PyJNG5Xhhu?=
 =?us-ascii?Q?6mgaEV1RKo36QdGxAtq+UAJz94lPZccwHXr0DqNeke3GX4eEpxazEySfu/xH?=
 =?us-ascii?Q?OZIK/gvNR6ya+hrB915c21CtUraK2fSVBrfLAQ1wFwY+QOW8YLgPQJDLBIwv?=
 =?us-ascii?Q?g24gWvEE7+qkQYXtnWPY6IPjwq4DK0Qts+uNv7EYpu0+DQEAygMy+G2PR4/D?=
 =?us-ascii?Q?+aGSyyUs0BD/TJX1ZvCRBz/usccSUTDrEaqXoWwIeCwD/0WRi1NbJRwZZY6Z?=
 =?us-ascii?Q?oriz5lJ1UaeEXCzgF0OrJprVKyhnNLkSJjBs2qrDF8xAjD2z4o8lhEdpTKr4?=
 =?us-ascii?Q?esx6K2qdMiQp4O/8C/cxk0ZnOS02tOvOupCicg5+lFREW5QQcgl2hOATFrGn?=
 =?us-ascii?Q?gLjSd5BVjwywGOMjkWcxz/Z6Pt29M5O8UsGnFAOgMOAIh0uuxfvE1HhxOnH3?=
 =?us-ascii?Q?TJoHistAyG3IyNwl7qv7T7CcPBSTvUZVvQYKY4yAvP0nAVEc4aDfCkZrr//C?=
 =?us-ascii?Q?Wa6Rd43ef+lLL3NkoXEgq+ppYGVXpsYbgmwSV6I+n4fAfHGWg8OIk4+qZC5b?=
 =?us-ascii?Q?0CfajqjNUZHVNcN+mAJ4Xfh8inBDvQmrJzCggoNg5MzsnRYulZcTrvqdwBT5?=
 =?us-ascii?Q?5YNNzihMuK4Q/Xlsp7f0ldbZ9tX6PcinWvJKPsa2aeKbn4J0wmYnH0nUuABL?=
 =?us-ascii?Q?gCqZAPtHXV7Bdi1NZkFkiy4QenMfaTZ3dKlPW7UnDD3BkaV1FcYDjAXl3YMp?=
 =?us-ascii?Q?KyPgjXtOH+7T6cQk3yLi7M+2IuzVugGeXtM7db81ovCkEnpM4dae6kOcS785?=
 =?us-ascii?Q?x+IRJPFUYvm5rtbozpgY/454p9uU2wtciYTDyDgRl4YIXgCZWHpommzabG5D?=
 =?us-ascii?Q?UAFeumouoXweBkV369Jv2EUq4AJayj9OIKJJsZ2QGN+Eh0sIERGc3m0URg8i?=
 =?us-ascii?Q?TDD3lXH99WgEIZTwmVhzewmsNxux/L7yPRIimflIggPWh75U/rQTRVyW5OMH?=
 =?us-ascii?Q?KCoQSVGynHmOwzeAc1+B1WxP68pc92pKJuUZOkgj2cld7Dujnbe2hGNHdgOF?=
 =?us-ascii?Q?A9EYnFLfew=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d732a7c6-c1be-40dd-3c40-08df1afa62c5
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 11:44:41.2420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yh4NLEqaVn+dFJDY5LqUHnqfb2hk7ArT5ke7AqFeoLnm1epgwAETwdKIeNNzz034hEKqYgcl5H2+mj//PbsX3v3y0cPwiXRf/d7KDV52JRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2313
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 11:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130298

netfilter now offers an official mirror at repo.or.cz. Add it as a premirro=
r.

See https://www.netfilter.org/mirrors.html#git

Link: https://lore.kernel.org/netfilter-devel/arVpqySeeTQ7ZA06@orbyte.nwl.c=
c/
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta-networking/recipes-filter/ulogd2/ulogd2_2.0.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.9.bb b/meta-n=
etworking/recipes-filter/ulogd2/ulogd2_2.0.9.bb
index 86d0011c4d..409a34d6da 100644
--- a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.9.bb
+++ b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.9.bb
@@ -13,6 +13,9 @@ SRC_URI =3D "git://git.netfilter.org/ulogd2;branch=3Dmast=
er \
            file://ulogd.init \
            file://ulogd.service \
 "
+
+# See https://www.netfilter.org/mirrors.html#git
+PREMIRRORS:append =3D " git://git.netfilter.org/ulogd2 git://repo.or.cz/ul=
ogd2.git;protocol=3Dhttps"
 SRCREV =3D "1fe54ec39a071ea3b06e6883e542dfdcf40d2840"
=20
=20

