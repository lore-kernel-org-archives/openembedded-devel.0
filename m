Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0122.outbound.protection.outlook.com [157.55.234.122])
	by mail.openembedded.org (Postfix) with ESMTP id 31BF76FFAB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 14:21:18 +0000 (UTC)
Received: from AM3PR02MB1172.eurprd02.prod.outlook.com
	(2a01:111:e400:c406::22) by AM3PR02MB1155.eurprd02.prod.outlook.com
	(2a01:111:e400:c406::17) with Microsoft SMTP Server (TLS) id
	15.1.365.19; Tue, 12 Jan 2016 14:21:18 +0000
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1172.eurprd02.prod.outlook.com (2a01:111:e400:c406::22) with
	Microsoft SMTP Server (TLS) id 15.1.365.19;
	Tue, 12 Jan 2016 14:21:17 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Jan 2016 16:21:18 +0200
Message-ID: <1452608478-27279-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: VI1PR07CA0079.eurprd07.prod.outlook.com
	(2a01:111:e400:5967::47) To AM3PR02MB1172.eurprd02.prod.outlook.com
	(2a01:111:e400:c406::22)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	2:hNgRBgg14cjUkY1782/yyykGJ7TwkxVuzUUoD47/1p6Qu5eyLnBP3cE2pFT3Rt4p8HQ6H2ANXb/3Wa7BASg42jFXhbM70aZFlAoj2QIL0vqKzOrc9I6rcVfFE6BYmDqgHP2xLULs4BdQ1qfpXByZkg==;
	3:cid7ZZjY8pPCB7PmRlIEYSsZRgtdcTJ6uOTsipotNLxsxa0t7BRY8eA/eNJoirVbmFN6Cns+CuaKlbd1lbY5PiOSlNgklz6kgxI0f1/j+tpAoC3DQNsUK56x0Bx3u2Ib;
	25:mrCN4WlpJ/yO9Sp4EAHPVCGFGVbUg69Z0tcDqrqvaLKjASaDwUTfk4xBDmSWy7AOOwyhDtwokOIL6fMeAMl7u0DbSn5YJOUnw1tiXIc7nhaaUA8bO1YgMPzFBZlQWlCg/BHQdr1dytp5Ybsb6tVyhRVnXuFHXF2KgL173xTqS+EyueRCj2sblFW2R/OjDsw4erKrwoc/Wdhs3OYMEvhJzgkXj4F2zmPP3UzaDZVvWofTrORKz6MHq7j5s1m+oWQV
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1172;
X-MS-Office365-Filtering-Correlation-Id: 7c445021-c9d6-4c15-e74b-08d31b5ba2b6
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	20:+hcfUXMM0X5jT/yAV4UhTyEGTxudO0xn9KIA0yguyzN8PTgvro+dJcI7D8C25/7xJF4RWVKmWiImwg3vfc8pq5B01oLlruZJovyFMDtPsjHexWjLl6EQLtfHALvuB9n/M14XU176yMPD445+8VNN8wCaUuQj+mt4tDQjFqeF0tw44jasHhVBvJAzfCZs/Y/E/v5DQWPbE5vJilkIHZ3RF7HQi8hfziOx9zlc1OvTBHxPTFg/2fVr4Uz+70sQ7dA+XWAkT3DML+Pf1kaDOHCt/8xNZZeidtOrZaF5kTS1LKHIDATp54dn4riB3zZuK1+zJWzLtL4j3a6VhFe+nP0qdBVWlgYUZI27YcCcVScg4Hg76lCNFKPK8xPnncL14zAsNFVeFtqadREIBoA5Ihr8QfmtHMg6WV6jxtAxHXZ2wUS01ghHsq6h1oMWOGzXEJNm0zk+54Y9SSKPKNZycJt5JfSBwnzJwHtX6fQ/bqEb8C+Wn3TkJx4RntZxC4FE/CMv;
	4:cr7ZxkH7kEyRSJ10QEK+qn6vbKpKSX2ak19lkoktQfdMs16vMduQreDWCRpq+pFM3W5oaZzavOnQU6zCCLuLSNrfYe5Yql6M0M4hGQk76vs5wEy/jW6gUlG952C7EUnObupo1iAVWK8NAV03Vv40NqhuxE8H33502OIVIHxn4hd+vytBgy3tTdAGbibbcoMmlPGXY9vmPL6TEOGGZGboUg+TAbmph5ldMVI/tcUh4+fpUbPrEZ+CUjn8lZUlIFkAvc/4IrCkbnBiUDBYR5q3fony447VZvIs29iqqW1Bw0ghHgATHMXqMAp0s4qjBU+h8hW/POr7AoBaL0Lf5lNpbqE0j4KcjjsEaa4nUU1PMaV8r2+TS+FlIkD/QEieMg0NygFBKibQn/vM3xJnWJnoBLU6hZdqKjVdqqOmTMHvyYQ=
X-Microsoft-Antispam-PRVS: <AM3PR02MB1172FD739AAA1F6CE397929E90CA0@AM3PR02MB1172.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(226695750432114);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046);
	SRVR:AM3PR02MB1172; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB1172; 
X-Forefront-PRVS: 081904387B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(106356001)(97736004)(5001960100002)(86362001)(81156007)(19580395003)(40100003)(33646002)(122386002)(47776003)(19580405001)(450100001)(2906002)(2351001)(42186005)(5004730100002)(229853001)(189998001)(48376002)(50986999)(110136002)(50466002)(101416001)(87976001)(1096002)(6116002)(92566002)(105586002)(3846002)(36756003)(4326007)(50226001)(586003)(5003940100001)(4001430100002)(66066001)(5008740100001)(107886002)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB1172; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR02MB1172;
	23:5ZBWyRg6Zt1VdwsEua9m37hwVOTnCoumjgkCwU372?=
	=?us-ascii?Q?fi3XEcPuYyC/BE5aN1q8AU0wPS9RJ0n6xIPDMPelmas7q8zK9ylI/8Q9XylM?=
	=?us-ascii?Q?VXdjbVoj83/2n+bEOse7gn0RKbnAYKt0YmasjlBJQTGzDSLwmVQq3ov/M0b/?=
	=?us-ascii?Q?4lwimJOH+ByRKagQMBdZy+Ab6TMFMBsm2x3NIAdH16m5LkgEKOPLw4pNzTLx?=
	=?us-ascii?Q?A/wF1hD+EkdjBWoStQ1TW5ZBY1GhSZA5Itb/Ie/ZGb2ODPhKDrjTsbIvlexs?=
	=?us-ascii?Q?5xmbV4U/HsGadAVf1cTdOMVvCciHjcFSPCunsL+/O/HsRHUdRX7jCxaSYY0s?=
	=?us-ascii?Q?5zpxxOzv6j/Hnhj4/6Rl6tW6AILOCCGJ9XFCSSJirQe+ITepWdzmqAtYmlwJ?=
	=?us-ascii?Q?YBe/XPFt6joD5GQ4uC42jVb88xZWvjp7s5dK8klfgNhPcbIY0pwY60S8ocGR?=
	=?us-ascii?Q?hM/RTp/pHih9v+AlhWh4LsJarpyDt1uAbUswSU2fQge4HJenaOlWuIiwk32P?=
	=?us-ascii?Q?QSO8JoLEOWgnclD+Y2zaQZQYchYwqPeA8d8Xn/6QEz0sRa67osK/sMvWnjMb?=
	=?us-ascii?Q?Kh6sNVmAKAgj8g9GVtGog25iMhuIUV1pJwntKXFisvruwmPCYJaB+dLrOT1q?=
	=?us-ascii?Q?OisXRynXNxPs6F4EryU//G6Q3tfgEGHKfqFhSE4x+qwP5+j4QysbAwsB0qvO?=
	=?us-ascii?Q?2AZ4gktb9by8OexyAYTASKEINrwoBYHpTCUXaTZF1w0hG/9hc2etRMPvxdgS?=
	=?us-ascii?Q?KN9r+3GHDQsjwQzsvMQSZvjdJpAoaLgURomda1whDkksb0SYtn0gDq+wU+zT?=
	=?us-ascii?Q?0TfJTeIGbOhAOCmdjwT8aJrRvSXC62kGUjLPBpA8wZg+7wxeg0ahLbqyi5y1?=
	=?us-ascii?Q?qjWxFxz1xeeG3Kb4QSfXvyYmNmTWSq4jV70P7zx2MkBmHoha6+C4apuyt6P3?=
	=?us-ascii?Q?uWuNhXz6sepOusLHUSFz9EVwjne+mUxTSi11nbVH8g2tnCSDoAUc0RmKrGTX?=
	=?us-ascii?Q?+qo1Q106tO47frwVnvmFNN/Doz8aUhs1E1AFGNPgoauyMvtr/Xj+O8oZKg6T?=
	=?us-ascii?Q?3CqYQHRSTEep1lmHDESwzgufnQ0P9vFI/6MRwlYz+/KqNC/wg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	5:wsFAaRkz34adIAOYLWOrldXf6hHldfs2ZMDiUM1zS9OW9V4VDvfXUeXZt94NUxjGojFvNt0oUHgH/KOiBX3+xPp6ne8tjaoCs9PpjZ9GubMXo45k6JeUBZxOtu1YUk8EENorUTVIV5mS4OWtaysZIw==;
	24:rUi1/TgUrY0YuKP1ZGjxdIxOQvzkbyMGeRIgJFJVKtx38ijXk3YqgTc2w5diu4z0JGfrYzrta40q6fzgxxygSfI8UcDGsYArH1Wr/snfbx0=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2016 14:21:17.2272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1172
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1155;
	2:jRTCYjVISFNWdjDjHISszOL4ZMiD6VAZDp16A9i2RkZEKbzmjPanmPzq9JyFjjC+eukIBQuQ6YHQBRSvg5Y+0sF+bJP89Dg8DlmRf1okV13zasBNn3pd0lPdHmv21uem9Zd1WGw5fkemYoXMFhArEQ==;
	23:wa/0brWz50++q7JeQfV0+oSEfCmtrINeFnR95cTQkehcloVlgO0Sxen0TNEWL8qAxLfj324K6GxBki70pztlegSNdchieb6Omttuo3C4035gqsNUro/Uiw1WXUQtX3zXnlP9iuW1KI4xYOnMon3vkAkQHHJVjDVkEWNPFvWV2MtXDVCtK52eycfQc/A2O6lK
X-OriginatorOrg: theqtcompany.com
Subject: [meta-qt5][PATCH] qtbase: re-enable replacing host paths in qconfig.pri
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
X-List-Received-Date: Tue, 12 Jan 2016 14:21:23 -0000
Content-Type: text/plain

Uncomment code that replaces host paths with qmake built-in properties
in qconfig.pri. Modified to replace paths in all *.pri files in mkspecs
directory and to also change paths without space in front of it.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtbase_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 2ef8a75..8b6f509 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -221,9 +221,9 @@ do_install_append() {
     rm -rf ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/macx-ios-clang
 
     # Replace host paths with qmake built-in properties
-#    sed -i -e 's| ${STAGING_DIR_NATIVE}${prefix_native}| $$[QT_HOST_PREFIX]|g' \
-#        -e 's| ${STAGING_DIR_HOST}| $$[QT_SYSROOT]|g' \
-#        ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/qconfig.pri
+    sed -i -e 's|${STAGING_DIR_NATIVE}${prefix_native}|$$[QT_HOST_PREFIX]|g' \
+        -e 's|${STAGING_DIR_HOST}|$$[QT_SYSROOT]|g' \
+        ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/*.pri
 }
 
 PACKAGES =. " \
-- 
1.9.1


