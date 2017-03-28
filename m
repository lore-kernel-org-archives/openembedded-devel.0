Return-Path: <mkelly@xevo.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0046.outbound.protection.outlook.com
	[104.47.37.46])
	by mail.openembedded.org (Postfix) with ESMTP id C8ABA77A8D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 19:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OGn68kpqxw0V4BWmfwcCA1C1bwv50Qi89DhyYsjNF5Y=;
	b=C2LfYO8esYEE0MM7DdLiauCl+tQjHzPbBb5CpH6qyXsdnW1J2fzh0J/sesy4tf+j8nOFFTuJQEXDuXbPgNwIhh9cFuBAuLoz+va0VFMsO6alvBKWWUwltBWbwCPOe51Ry+Mde62jyz/s1HJXC+RTG8vQqXjU0aVexXW38xlvueM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	BY1PR01MB1403.prod.exchangelabs.com (10.162.211.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.991.14; Tue, 28 Mar 2017 19:30:09 +0000
From: Martin Kelly <martin@xevo.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Mar 2017 12:33:29 -0700
Message-ID: <1490729609-25245-1-git-send-email-martin@xevo.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR1601CA0033.namprd16.prod.outlook.com (10.174.111.46)
	To BY1PR01MB1403.prod.exchangelabs.com (10.162.211.152)
X-MS-Office365-Filtering-Correlation-Id: 50c7c599-6423-4906-ba2c-08d47610d913
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423065)(201703031133071);
	SRVR:BY1PR01MB1403; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	3:Szp4qyjtYicKy93ZspeuC8QV2+C++Idiw6pw2pKY307WcarSm5jXyq7vDJods/+mVyciHaQtypRx/QbkvwsunlGty7/l2HbFdGaeAdOFWa/9g1haidhS56o0ePWDNogrD4kSGHmKLSJBdd1EcYeDVOPGIH3lACWGj7//J2SyCwHAReAkW5/98RVcjcrkNmhKv4rrQvjDocfC7w1VFx+mh4tq+khSi/9QwTZXSbL5Z5PvIL4Ln44hebF12DEi4FN/jMTe47lAmf/qUdQINrbw4GC68xKXE8W2vPgU3kj9/RwFfLdwvmNLJ0Iu/Jbtvr9nfmkoJXKmWVAXFmuz11vHQA==;
	25:BiKFisJ6obn5B7Gt8XpwOfgFRT2hN8Dkr0VUpPjPeq5wUYgsvLlE28voH/Xl5T6LsYTravRB1Z1vXKIxVoPXjdEj7aMrkmnPZDrdKM2RL4JyC2YoETi4WvsIzC0LEfNLdR3O+PU4FurUAbb1WXcUUpgBOPV/vPAycm8FxwsDUCBgm5QxcXiLmgAjF0d9fw1xLluAguinNeffICM+iiN7TMljj+LrpnGG3uNFr/9IILUXHdCdZ4l3jZagkJNlUAhvfWRr6YfcCeZvMNvEF3FBwnRjiw7q2AqRcB4msKH6dQDQxlNiqilcGLBEk9dU8KSNiJBpu7uIfK+WG6e04mnFs9f6ibfWyZ5zyZOOkZqrprXifR8LM8bLw+pTpZbSwHQYEOuQ/lkejxw1Zl7gwHuqtbA1T5qHSVZZbQdUOVawrcvhBjDuYK9FDqU9mlJvmDoybdCyoCIFtZJwYSHeAqTQIA==
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	31:ILmSz5pPBJZlIunUYIppWgxlsnchd6QHtjxpOLe5/Wcd3TE1tfj6VrCEgdc7wZc2e4Lv1cKQrH6TVDcYTdBJ7Fw6O0kSKber1XW/i23gJCtGKh3jpIpIdUfaJTfoBuPRl1yCvoKIBsuJjON+r61+5zx84yzzmFF7a+pyKvBf3n7h5i33bQ3diPSzkoopOKLnAYhpiqiOQ3eATg9u1n4nvSrdX6i6sY5T4jFNpfqlA+s=;
	20:jTGiG+2ipy/1S6FQ5/LHWDsX59U2BT61NgRG+Qfp5Biyx5MGSe/tq8mqqNaxUMz1YwaOOjnBfEArl8Yq3SxHaRkpLs5P12EVcByPrLrqoF6zfQHtTQvGpUL1wQA45RX5Wqxf3tlCsrkl+Ja0CvvJDnR6FRe3KBNWfwC+lOY2U6dxQxNyjR7s9qmivqy2D8RK0saD/6FDIiELK53hhuTi8NruTkuCOdymI84IWR2phHNL9KGXm1qMl/6dRwfh+9k0uPZcLE7rskeXVMXuUuk2nYTMMu1GCEW2eTmKCEqZ0AdL/cjPA4HJQWo2v5ntEAszclt+kTPooP0bJk7EaFRUSw==
X-Microsoft-Antispam-PRVS: <BY1PR01MB14031283EABF89F55F0871CFAB320@BY1PR01MB1403.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(192374486261705);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040440)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041248)(20161123562025)(20161123558025)(20161123560025)(20161123564025)(20161123555025)(201703131423064)(201702281528064)(201703061421064)(201703061406064)(6072148);
	SRVR:BY1PR01MB1403; BCL:0; PCL:0; RULEID:; SRVR:BY1PR01MB1403; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	4:vjRhyzBgfoCA4BOyil1T00zlrDNtGqRbRklcGS4HxVIISLhCjo6LyjdfvrtIbBWeHBz8YerS9h/CJPGLWrik/G12kM7F2/tvao148fMs0N/BIYS82LVe6TkSi10ICgS7cmdF/3iVZQYlmsAGSKdBoNgNOHC47bRJvQ1Vv9sb5Nzuq4rMUvFyjJi/XO+0H2S+RZ7ZnSqgTXjXQCN44Ko0jkg2eqc1WpCLUNmcZUsgN75HTh6wlyj0dceeuMsP12m80xj1QbGrJxbyKs0PxmDjQ1sFIjydDq0eWjLOQkdG6gvt9kZYDAbp2Zd31M0cgD7ttsK57QkxDM9GcG+MM3sUN52OMes2xKwTiIB+uT9AQk+v30bIXIsE+N+MMmy3ChpGV6aF/Ll6SD9VjtXVgzdrTZHpX471k1xLQmvITFT7xhgfbSAzAifCR+dSYrgnhmbofxUss+FJBXXj3QzATeP9Y3as/urKkV8Dl4ZCxC0nZwDjCheaKRx5r5UQnIiJWwYIkW+N/qDBX0Gwa/9lYv6zgOztbTqdQ2xdO4PrMq6US+34lbwPPCHq7TIgD5Rp7HGJ3Ah2H9TTr65hcofVU1N6hqMvC9CDy1ksz05b+p87hnsmZ+/xSxFWq6NNn4xT35ESRCVwkfQvX7grh5mWVYMFWrbv5ZODMW+tS9eH6GBJ0+tAcbobOFh3NMgzXtrbi/G9cvNZnboj04D+mquQzFiicEacjLBm9MoU4564DkyGhmDrrmQM8SCASyMIG5CunyURY9qqmsXuWv6x7x36FbSaHTFSyVJpiGeeOQshLS01OD1EytdPMA9XV1WKE/Zhoaw/
X-Forefront-PRVS: 0260457E99
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39830400002)(39410400002)(39400400002)(39450400003)(53416004)(3846002)(6306002)(6116002)(42186005)(6666003)(6512007)(7736002)(50986999)(305945005)(189998001)(2351001)(5660300001)(5003940100001)(53936002)(6916009)(107886003)(38730400002)(36756003)(110136004)(50226002)(33646002)(48376002)(50466002)(47776003)(2906002)(66066001)(4326008)(81166006)(8676002)(6506006)(6486002)(25786009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR01MB1403;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR01MB1403;
	23:iRijxl1jI0/K5mUK6d7QO4fi3jWbRA7hoo97+IyTa?=
	=?us-ascii?Q?1HMsAXbAWkhf48hPM2yh4eV3GqcHA/7y2mrkdlKSLgnMHwnDSSHU3vWtPvfC?=
	=?us-ascii?Q?eJ2yh4t4glBCQ60mUXMbiOoG5ga1rV+9x9WWA4LdSldHJgWJ4z18AoefIxxf?=
	=?us-ascii?Q?WHCAHMhQZ6SMUIkQfD/7G3AolTrurJjDZ71La3mGtcFI3vyXlQJVjEkFM2vX?=
	=?us-ascii?Q?7fUYMA72OljhXF7y5c6fi659fj3jfoeXnvoP+fSxrV3+qD4+LyNVWkRt4FJf?=
	=?us-ascii?Q?YlGU8NZZxFTos6Vpi3d5n4mT36EGbmJydoKsWh+E6QGENyFCSt8qLz/RXP62?=
	=?us-ascii?Q?qADPTJ0lGY3evIrE4q4Vlymx3fNRdoA+Pxbd5GLuSRuINhn0DqceGLzu4cLu?=
	=?us-ascii?Q?y0qjJec6RcTygoA2/ZZ7avW5WGRK3tpBKGJCjYYk9RBvIf2jbSV0kmjKKir+?=
	=?us-ascii?Q?YZQHa7bL3RCCrgSFVWN+6LbzBe6bgeDPD8knP/Cd80hRmXFkPoDgsH16iUyE?=
	=?us-ascii?Q?+yVkBUDiwE/LJwKD6+hhNmK7IVGq1DgNP2j5t5vISt3nARTD7xRzuQzh6FnQ?=
	=?us-ascii?Q?FzloY/fRCvLo+UcQXsoUM1+1XxFGq3ov151AdpO+llRaQ9v97yUaq7JfiFNZ?=
	=?us-ascii?Q?g47ttbWKmwjPhBlGTOIROYhkCRX8DGZ3W5ro6aX02KN3OwUaM80JciZ39AJV?=
	=?us-ascii?Q?ZLRhSNVP0xvBFUix/BEUUwVHFEkmLUPoM8h7kPj3NN09AalruK/bHYcjFIJM?=
	=?us-ascii?Q?gadzxlu6B25P+5AaL2r5G1vlaPYM50lqVPdzY9jDUhHpzuDIJWq3VG5gr7AM?=
	=?us-ascii?Q?8OTF7wrlbLg3ivGyS3ZP74Qf38lMBHBIBHyVFg6W0bV3ADXMts3V4tD/8OrE?=
	=?us-ascii?Q?sDwkSz5vSqf3x5FWQuh2eGii2KpdP84yh9ByWwZPMeBjI0Bw5jcRk/gN6v16?=
	=?us-ascii?Q?h2hBwMX4XENEWzEBooZP/RNt4jNkjexZhe6BOeoT9lm1g7LEhlUDq6r8huDB?=
	=?us-ascii?Q?Fk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	6:E7uqcooCOUwUtzFF/+1T3S2l1zkTYbeHypKKlS6n+c0Xfk3WQ8R38METXdkl4a0JR3dZUcD+50lTCdRVK3FLdO6E81Ig5aHmpSYXFEZ62nf5y0Ak7QpIbgQgyeVnq38JuORrwrggmKwVPvD7cGmQLsAcrXafNarLWgMux6qVGVHKIGrS9WWYVnbOC1Ur8r1QjkGeOJccfytbTViPo7PgRnjHyJNAE2neOK16coBb8N8FW5T2ienRCZ0c4hYSlK5D6a15diPIwKaRW8mWM6tfjqqiSwqn8VSDJjeGIObSVoTGUiiyWRbqRM8AT/2xpYoIXb5m8M4b9vKcUoQZFa+98jhPN4gcriJ6hJssBooumcUHDhMe+YZAL9ZFtHTLEmSpM1gKRdhsRYWek993i47lew==;
	5:C1PcHz7PSZP0IhWTmM2J/5z7xG+0JTHF2nyDgsihWrq0iaQAN4/xofgCXq2oOYG+k1W9kYM3YbSLgCH9KitVORO7MhPD6cMCEF8QUnUiJrawZmuzej1eAUsBOZ6CUh12GFYw0QiX+FDcqVJ/bp0zlw==;
	24:aQiBp0wkYO5Btjuil3XFF0r2OD+Ay+UrL7odEj+il5F15GCkGqN+b7ATOA9Wm/5CbdcPy+qLDvebonAoapLuxTh/wRPACYyV46cZTwNtxTo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	7:rbjCoe+H2RCryctKb3AXqGjzbG1KovFq0VzcIpQUjafsL3bF80H4+7edX+5Eiuzw3XLp8lc1MlK1KrXnkeTTaYOddZ37fS/hu5VIURzYrEoKHouLRPR1Xjs6XPrfimErVdUOZJkRa0l580+kXEL2znzcjsqh+NxDL79U5pCD4ICTOZLOg5hR2okUC0MDIcrdfFxbGgbCeOdJuZ8hyl6dM3EOmu5wFiUbAawiNxCFz9+w180GLidy5OHbjyiSv3JvaMUT2rFozmjqTX9LlySWg1rufgGKQFuQJhUFY4aZGvTe7CPU9pX+0s+8EG3p38PDrZq6Mbsn0AFIR86vr3QsIw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2017 19:30:09.5912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR01MB1403
Subject: [meta-oe][PATCH] gtest: add -fPIC
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Mar 2017 19:30:11 -0000
Content-Type: text/plain

From: Martin Kelly <mkelly@xevo.com>

I tried turning on the Yocto security flags and hit a compilation
error due to gtest not compiling. Adding -fPIC fixes the issue.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-test/gtest/gtest_1.8.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb b/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
index 483dc1f..9ba4ee4 100644
--- a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
+++ b/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
@@ -19,6 +19,15 @@ S = "${WORKDIR}/googletest-release-${PV}"
 
 inherit cmake
 
+# -fPIC is needed to prevent relocation errors when we compile with Yocto
+# security flags. See this issue for more details:
+#
+# https://github.com/google/googletest/issues/854
+#
+# If that issue is fixed, we can probably remove the manual -fPIC flags here.
+OECMAKE_C_FLAGS += " -fPIC"
+OECMAKE_CXX_FLAGS += " -fPIC"
+
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-dbg = "1"
 
-- 
2.1.4


