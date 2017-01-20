Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0050.outbound.protection.outlook.com [104.47.2.50])
	by mail.openembedded.org (Postfix) with ESMTP id 41865772EA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jan 2017 06:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=UqKoCmkfCMMiI404ac9TJfPZlHUPFImnK7pqnXG/K4Y=;
	b=jjpBfmMStNj8Y1MZftSgAhvPUAZbrX/sY6uh/FgNcRjaL/qZSG18oGBFdJ1ppdOV3RkSBD93mwPyhsspFhjtso0mejKNobvFx/wsvZeadC3eqhVSaJ0kkpgII2ovHJuLAssipqNHL7LaN3k9sIeBEbm8wPbfABQtEyydrPe+gqA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.1) by
	AMSPR04MB310.eurprd04.prod.outlook.com (10.242.107.20) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.845.12; Fri, 20 Jan 2017 23:42:06 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Jan 2017 17:35:30 -0600
Message-ID: <1484955330-9726-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.1]
X-ClientProxiedBy: BN6PR15CA0024.namprd15.prod.outlook.com (10.172.204.162) To
	AMSPR04MB310.eurprd04.prod.outlook.com (10.242.107.20)
X-MS-Office365-Filtering-Correlation-Id: 6fc57710-8f8a-4b31-fb1e-08d4418df205
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:AMSPR04MB310;
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB310;
	3:eXg0J4m+5G4+o06ahPjsOhiJ6Vu5YYLxRDc/aT61taJkPcy1vyoipYxIWA7OvCbro39ilGm4sCDHmWZo/bOBihHV2azN7lPjex3NXpPDCKM+RgoQuQxw4PTOhUq457kUqAnDKiFOcevxwHSzwAOVr/6fB6s09cmJSMhyVQKk5+dc1wuDVFDv4SM4KmmWM7oprmEkwHRXy9WqiBwz/JEaQMG4hJQgOwGpeUeLigqQJOutjgy+yKFgzOqB2LTA5r0eXut/La2IR77tXaKZOCEpKA==
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB310;
	25:z1AYJM+O4mJNoUyXfoxWSlQhmFe0xguzhRQqe6e8vZSktCyTKdBXxdZBMk8sOVDhNN/KPKBtmF/ntiBWjzvnC6zY7KWOA/NHd6496J8YLxy46XrEIbPIJngLfdtLnYGzw3SBDcKcSkDVeOvqUQISwIpyKXfUc2V7ootwaH9iud3EXctWDg28mk7YrJgsuOCI2a9xEUWLH5SQQfayZsiEuNA3VOx65LxwIg1iy10+dy4FqC8l7Ue4Aik++i6bNu2FqjFk/2xC2eorMXGaUBC+plMsW+wZ4qMNJvnZ8WbDdQ+UUmPXkWMSV0g0k1YwyK1Mpcma099VEiJ3/pOvry1ZoB2CTo7O23q/jg+PS8yKbGcd/pvVtApZhPkQF98t7kx2FTKlgypIzOyO9MLwmO8AqyTalUyB9whtMAw6L+nH/Ef2ehmRl5hbobKE8Oy465V1L2gEoc47PdpgNHPkZigiDRBLNAPj3u6sGu/H69lrQKrim8tSY916XU13xJKj/RAyFILR1+KuSAhh9JJKon7CIddh1HhQtVrrU1z3vHmsnrzF7ESvVs0rffzcanS7KVMh/GTCx5RHfBX022kIgtspVM/LXzs0vcB3K6CA90n2cPyudeodCVr+o512Glucnzx3FcuU7qSgrcxJgPItY4tnYt3xQ+6oCOoKHCfRFSg9+4RoCXljZLHkzl3yJLTskVqwy4WCTz1zJABxtp0seZdPa+GRnVpaFXQgSVxr2mNuYessD7k13FD52yBjfq7VHiG+
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB310;
	31:BIythla3px97CSpTLQJTkakLUnYE4RwN6b4pVc7l/t4fcKAD4rL01EvNQQZuVYvkM/hFeTK3I5j9CSjGqDiPrrsUwx1SLkdGQ61kJFnBfvHXz502cLpnM7EuVyQBwNoVfeplYJUxL0FIWi7Rftgw5BsUoizSIPibl3dH5lAjHE6GIQZttioJH5iEYUb5ZAfwfKHw2doYPuNoMku4aVDxmWbpNs2ayZuMUe2yDAPpPFZ8G3pb6m7Nnf5e2nnpW09n8zabJijbhFFRXRxB27YtkA==;
	20:iK9I/5C4kyWHs/l/7SQQlWgP2TFgrUwDraUWs761qq1U4AmnrgnAo1sxkVrk2S9XWPbUxxclxTCDWvAugA2MQZrguxNJidpVt1Yk5NRIgVzoU6fYZY1rvLEXIcHB3NFSa4Et4qPtE64MJqQ6xYkFDAoWzwOJjuZ0YKAo5ASjPFJVrg0axj8KedC8nbe9n8KEqgP2VuKJOfG5Fdca4NvmbSC+g/8z/+l3oecpT6HCBQ+igtET3iY+5uicB0TQ2m03qlgT6qZ6NbQ89S8EfMGkQnuR0Aulks/LbE0+EoSF8l63tQbmYqRFbTHIgcQwJSShr8uONXyFePDeGNEvIrXbpktwK/P9nNDdUZUWIlBG+C1oxGfgXpIP/a/e0pMYk8INpuyNewYXe6UemfX6kBFbopLtwcWoghhQq3GWjGosjEIRTecboe1FHOmv5volsu/uNbaklfvgaQi4O5+9Aq2aIEtqWUD2mmS9yTfTpuRMxUIlSsRVO+REmbYTxHIQSjnj
X-Microsoft-Antispam-PRVS: <AMSPR04MB310219F0BD7C13E452E0AEFE2710@AMSPR04MB310.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123562025)(20161123560025)(20161123564025)(20161123555025)(6072148)(6047074);
	SRVR:AMSPR04MB310; BCL:0; PCL:0; RULEID:; SRVR:AMSPR04MB310; 
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB310;
	4:wwsz5s0HTRaTRYZFhAehTCrZ7VI0gFOxhYROetvbiyA+czMemfbyUDUiwEz/hYiYCcR4SMb2K5GwfU0U7QRsdBveC9OrWoVDNnn+YCP8kpdWT0tcoM/i0tn7bmpfC0AWZiquvRpS6rSW7DsrlbgfUVCe56Ak7JCWbv4VUx5qGObZbSPxvRxyXvoFTqbQmvCNjALzBmm+MDhaR1a6EnHpMMdT30QUijLjr4DIGMMTpzP910Qlzbag6B8SnnQaw/EPbfontjGcv10OteehG6bMXXldp7LR35bN0qA42NHv2KsRbeu4xSJNV1xTh2dqGESVfJ1OQeSDvQeXuxtR3nPZd8pDwz7a/40yMdWYTc8XPsveNYs8PzK95XgXgB+zFFzmRSkPkbzMICetb94fVK9XOqJ9SBcG1h8gCUzUXYYa3eMW9wIof86Q+Ie3FjOIMVhkMun+QsbH/n3bimJkLqfLd3p1piYJ1Cc7DeCJYnThYOkY+j6yyZ1QjiE+F7pbkdZjpdC/8hTuzwJLuOzL/bkAiBMxmmnEUXhHu8zv3YTg7UGlvXzytbgNDrjsaBIT3eH3B9QD+w+DYPpM99TQPVA3CF3dclkK5sLH5jCLvgGTiBw/HCtGP0oyYgluisf9Ou/VsRMXbsaZSFRnuiWKso901w==
X-Forefront-PRVS: 01930B2BA8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(39410400002)(39450400003)(39860400002)(39850400002)(39840400002)(189002)(199003)(81166006)(86362001)(189998001)(6916009)(5660300001)(6666003)(110136003)(6506006)(6486002)(7736002)(33646002)(42186005)(2351001)(305945005)(25786008)(105586002)(6512007)(5003940100001)(36756003)(106356001)(66066001)(50466002)(50226002)(47776003)(450100001)(97736004)(38730400001)(81156014)(92566002)(68736007)(50986999)(2906002)(4326007)(3846002)(8676002)(6116002)(53936002)(101416001)(48376002)(32563001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AMSPR04MB310;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AMSPR04MB310;
	23:Wd+LVqGf6z+EGbWD6msy9DsbRWmvoyEPf0Krzjyy/2?=
	=?us-ascii?Q?OuXrwseXYH0eY4F1iz/XEUPA1UcmTGJ4j5p3cTV2Mt1oY4B/54MI2tlQbZg+?=
	=?us-ascii?Q?+Z1SUiUswFbPKJKPOUPO0iuYvSrG54Wv3jDjfqHBvVFgv9VYY/jwMP6qDs0k?=
	=?us-ascii?Q?hkmLolqzyNKw/rZZg6a8E5S4mSTPFyiWzguyiTrnLqR3Tw63RWDllUj+H3lL?=
	=?us-ascii?Q?j1hy8olk+oQnHOqOLJiImQFak1DX4baXu1BlfMOVBu8W6F+BpfqG1mlqmOik?=
	=?us-ascii?Q?4ofIhwGxgi8zZXq9UjHuePSiteOBviqdNJRDeITaSl5ZfkPzC7QxFoE4MAmj?=
	=?us-ascii?Q?h2ACbk41PMBdjj7U+nTW/biL+3BPHJ410XjXCZf/yS8dmdqtnbZ/+JrHA0T/?=
	=?us-ascii?Q?tQojTaWqN8doFNCqq7edmzuv5QmzN3uYQXAb9aHuDEvshnxJBT6EXmLYCGYj?=
	=?us-ascii?Q?rJiAME36rgmf+ymFqQ8+ZYXAuPtBrTmO4rRniM1iJf5FdQcqAh9gri335t1t?=
	=?us-ascii?Q?1G2HpaHo6g0zChSLsA1It2jTN1GCJw8QHkHmZpEKpO+UkcEkvgxkW6W9UMTe?=
	=?us-ascii?Q?Coc3sbBNBX8Ze0IwZVv5JtJpgECbcZVPo5+CI/CUD/huGNVHGtCv/TgBquW3?=
	=?us-ascii?Q?mQ+c7u4DRUBaXMeKO1pwM9tBv197MqRJ5I0ngWcmqanCb42ryrR+axaRKcnR?=
	=?us-ascii?Q?uvd3CmW6WMp7IwLYZG6IbA2WTt/n7gBAhr4KtaxVmc13/ti2hhejZqYOpKsH?=
	=?us-ascii?Q?+GgOZ7J3wBXPyoAC2uYJkf99i825i7j0bO24yjzOWH+y3RDA+sxYDUXV9VN4?=
	=?us-ascii?Q?vmOHowtz7SbaLyMrJVycNWMzFo60hgjhkuqJNqTmf0OQUr5sCJAFOeEOtvkt?=
	=?us-ascii?Q?DIBcPd8WkivVP91dOZ2FPndWSmIcCHpdqM07MyXSWPSG3cqXkb1qWArE+EO4?=
	=?us-ascii?Q?a5i7mfbaN8Ud/HNVARb6/pbBCJ46snL9N8rS4q1h6qIoamCj7r9X6jfwAqAi?=
	=?us-ascii?Q?PTAp6m52nBtuoxBb2e3eBBzID1oWedhHWLxVGME1WJyaDvApYs2gFTGWqeXE?=
	=?us-ascii?Q?4CsOf/VJDzFCnRRPoD5HWRKyP1/CwexnuqGO8Zx0kAlTd8w+uS9UlGTplrG/?=
	=?us-ascii?Q?9KGUDVuaPWHu/8msP//DzNwa5IToiYlIJGFyJSAifEedXFRm8V4BR5Ig2qFl?=
	=?us-ascii?Q?Mg2koU/8cTwhr/o8FpC9b1IXN68b12yszi1xEiuk/AlMRNiy6M+HEMkw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB310;
	6:pEs44qCmhC9dm/myn9puaz8qjTi2frOVCV0xGyHbAEzKz+yjKNKPmKq6lAFuOXVuf5FLEIiD1rtu/FhFQKpc+mBjHlgrT1Vv7iHF5QK5X35/vcsgilf6wxVKqgYu6QtJmsqPpimYFCnQMVdUbfGOhAT+1OVsdA3KOJb9W0zKjUXCvOVRr5crJTlHNtjRGOUbwKacVzdS6rsxjjegE2uzAZqu9XLUIF64rd1LA51dZToq3H4QA+O/xGrHkc35KFjXEAVbeibu6gJ+2oodnMv/tv/PNef/BONsFqIMZmWL0X0n5Q0ZpH6j6lqAAYtzOYYQXH8RKb6ParkWhQfurittIUUFmZIhIzopIGJhznRmQrBaZ6QVKkkOF0PCkY7cLXeCRs+E5i/N/QZ8uyTnCO4MyHs2EChU3aDb0U09NtM4owwkBRuLdSyIdaq/c4cGaL0rZe/+G2BajnEj/C/BFVs4dw==;
	5:6AZ2ClTGgG7et1SkIDAykYMiqc9xXv+RFhQBpClLpWpAS6enEvNcFuOvZj/oHSmNyTxIFPWgE1G9rbOAdEPH7Qrq5bkNCDZutTor8lkwxkVpo7taMO4DBt1FD/SGkhOhdCrfg0weuT7O7A/iWFr62w==;
	24:cDokwO6fKWvwgH0BfInefSnKcBspGvXn1tOJneQW8XRz43Fa+o0DN3ZaFe4UswL863bWwT21xsE2qA/IRsMGhFqKUa4JTHgGLmFispWoGUk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AMSPR04MB310;
	7:/XVTHIWQYxgqVGw1r7vn3r141UqZLOnMbf2lCY1fwDZvKoLdEAQoJPgSX8wxaOTWsgAdhZ6LuQYd83FNosqgH36f+lpXUo5flwZC4yLVL4ESbVoBaIf+r40FJj4xPTojCy6gD7XCRDTlek8B2z6mZoyogz4ft3v738bjCla3l2ub6RP99Efh59VxQi8XvsyhTQroBOoU8dv33pX7GpyI1j970aojFiuSJKqbbtzPPN+uS/TAGGhHtkyRB422tbEiBgIY7NfGatCB8uMzGBUvgA/y8bOlRjASpbRfTVRF2n6Xi0yGKwfHfV+RnJb3XjDAXUHET2MonSX8d2bUNpyUPAY0fQgGO76bd47W1dzKJ7FrcdQawvW56FiFNC8Xjhqj55Rp+jigue0KNo3FewkuPtmVe0E+KoRLVmxbISPKrl87XU7Ojts4WlAIuQn8Uu7/sbqncwHok6cQ5X8z6OpqIA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2017 23:42:06.7598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMSPR04MB310
Subject: [meta-qt5][PATCH] qt3d: Add assimp dependency
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
X-List-Received-Date: Sat, 21 Jan 2017 06:16:50 -0000
Content-Type: text/plain

Fix build error:

fatal error: assimp/Importer.hpp: No such file or directory

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 recipes-qt/qt5/qt3d_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 9708ec9..d8f943f 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 DEPENDS += "qtbase"
-DEPENDS_class-target += "qtdeclarative qt3d-native"
+DEPENDS_class-target += "qtdeclarative qt3d-native assimp"
 
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
-- 
1.9.1


