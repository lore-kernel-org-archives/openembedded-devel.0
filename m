Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 68824 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 Apr 2018 05:27:04 UTC
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00111.outbound.protection.outlook.com [40.107.0.111])
	by mail.openembedded.org (Postfix) with ESMTP id 08A89745EE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2018 05:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=emZy+SDPlaw+maVWtODCLMN1384VqJPkyyrlJlp7y/Y=;
	b=Qk5nNsPIPV/92eWcssEkq32wmo5MsEN8jhvgU02A//JBQtqhAJHudi3zHG4yCU2gUx8j9lLSTZvl5tcRnpqxxFzz9xfn2wMJar8JVTBfwZaA3OHQc7k4XApkfQqgBomeYn1xBW01liqO/rlsrsUK0aStr833TRlT76kdo621Rto=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=qt.io;
Received: from piippo.intra.qt (192.89.120.53) by
	VI1PR0202MB2591.eurprd02.prod.outlook.com (2603:10a6:801:7::7) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.675.11;
	Wed, 18 Apr 2018 10:05:15 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Apr 2018 13:04:54 +0300
Message-Id: <20180418100454.3171-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: HE1PR05CA0366.eurprd05.prod.outlook.com
	(2603:10a6:7:94::25) To VI1PR0202MB2591.eurprd02.prod.outlook.com
	(2603:10a6:801:7::7)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0202MB2591; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2591;
	3:JNAtMQt9JPuUcElMIKopcVOBSItygNageLp6GRFzV1bKXmP4yjmSnrCHYXVhLsl7WI2gZy2azUC21TstYNddNj2pW1/TcQCx5wH73GJfV1XyUeUdEjF5KRPuiDs7OzQlb191AeuhyNiX0YFJ2Z+oN++0nhw2/1YZEfkh1UaVu1y0BV7lMhn7YtKVWt53kuQtvs/z6Wf4lZ586P+nsiRtplwrnKeS/OBSC/D0NeX5vXKh1JZA7kJDY3Ay8D4rbd1O;
	25:Gu9OiulRaJj6cHtxGsHlErQ3EJ+AQYlsyJ2OL/fAY9KFvjSvvj8getUeGJ+C/C9w1to+xcUF+LXJkZMhpQiob1V6CtUREfX9Scg81OEAyVxuZ5WeJL2/CCketrKPht1+eClV7CoU5CG67ria4uD0N0OQZkhjldiNRSUjaIGJIHfmkc4oKGdf8l5kLAp32GlezFuKOJN9zWYY6OoHXODdFU22FRtbtmXfJWSS1OIG796uBmPvVZ+cvaZG054uDN/BRla60gmR3/ndyJ0PcpgdYsaExrYzq0yrurHkICK6tV+Cio4s8l3FIF9MyppDcMB2LL6amJf4soiLI0L3RatufQ==;
	31:AsgH8Yq7zUG7TcZM6VxaJxXCW8DPawBRSnbYGPOTuZMOvUD5hFTVDc+wHfeHwXUyWwiyDP6rYw/c5BGLXa2i4fk8VyIi9IazYbnc+sHLPot0T9huCGeHUaP2p7NTVInxz+Mz0aN1MltdRhjdQFU+dL1wssCcNY09BQRZQP3RPIQ0EH/ZhOLFMtde0zkBF3AUVUuHNtrLm9/fo+W32HMZLAoAoj1UGBksMMMvMeAxyug=
X-MS-TrafficTypeDiagnostic: VI1PR0202MB2591:|VI1PR0202MB2591:
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2591;
	20:wLZxpDDHtYX4Y2llWJZ1dBMWD2uWmrESweR6nTMRnR13psCdfvvd0GqFSVzGALKIuh3o2zh/8e9hV+oy/iRs1YORxiZLPwzxoy8tu4HM4SZ324zuMTjvtXv77Fq78lPnoDejd11qttNwifNvzl0hRqTsqDGEwLUZFnYW03RdK7kcL6bMWe4qbDhuCnpA5K937p9FHcCDlg9Y+RikZvp6MOc8hYpcTOYLA+2MRehzHZeD+EP6rfxWRbFMvJbV7JDQZqKA8YR61hEQ3FiIs2AQl4QTrfYO3N9qmseaeZoENsepM1v+BRIgdRNMqOX3Y8SeZsvLxb47M23cnhiWG0IBQ26Q/SBX7W8QruJG/0aYdte4BYSvC1y/GOOspb//D6tbr5FTHTCB4BDLSXo3ES9esVI5Ddb2hn9sRAWDywuhnmomSGsVhTrQT9QyFD1tdl8zAY/bpxlXi1ybVRqHOKTc8GiVTyU/vIbUALUDIq3+zGN896SxeiQMXjF4PCX1OG8e;
	4:ueApWHDT8n8WoduqqOfevsczgPCweciKzjHF9PgUxVQfRXqlEFiiSyTHEUDk9M47y5fMbRgf1yFHa2SOV4iEyz/tHC+GIrIozQWwNpwwoMiJPEh2WM1Smf5U+5mmCGYXGdYypQi1w91rjeIv8Wy98eX6Zg4G115iAiiSQRtkp/+LGCAIetX8Pk3LmslMkkrN8Y2BuJZHnqALxy9u4EULZz872Ol0a7+eU7552yBko0bbeqR4G8NsZELvqY26r/8DXYeyStf0Gpxm2qFZl0SGnQ==
X-Microsoft-Antispam-PRVS: <VI1PR0202MB25917CB4BE9EE71A83F307BEE9B60@VI1PR0202MB2591.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231232)(944501327)(52105095)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(6072148)(201708071742011);
	SRVR:VI1PR0202MB2591; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0202MB2591; 
X-Forefront-PRVS: 06469BCC91
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(376002)(366004)(39850400004)(346002)(39380400002)(396003)(6512007)(16586007)(50466002)(386003)(97736004)(6506007)(305945005)(7736002)(53416004)(25786009)(956004)(476003)(53936002)(575784001)(86362001)(478600001)(316002)(44832011)(5660300001)(1857600001)(74482002)(6486002)(8676002)(81166006)(8936002)(36756003)(66066001)(2351001)(6116002)(6916009)(2906002)(26005)(47776003)(3846002)(48376002)(52116002)(186003)(50226002)(16526019)(2361001)(51416003)(1076002)(33896004)(6666003)(59450400001)(2616005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2591;
	H:piippo.intra.qt; FPR:; SPF:None; LANG:en; MLV:nov;
	PTR:InfoNoRecords; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0202MB2591;
	23:AuUmliLzNXfZiMt+w6vz3HNucRp4ZXpZvmzPbMI?=
	=?us-ascii?Q?G7dYgQDZOOLkUf5xwoFXq6qn29Bw1QIhuWBKXeyyCRNpin8WP0eBdJExPobR?=
	=?us-ascii?Q?2fhFb/q5K0NivRB9E7KsNH8IcO8w3VVYDXZLBapRAZql9cfFcRWHz7gZC9hu?=
	=?us-ascii?Q?GwZd1u6gFDuNFK0QfM5M/nXexYT5PA2jf8tjMCdXwbdVjHfzam3Kfs3NM0kE?=
	=?us-ascii?Q?UJhgxCdXCvlnuUnqjMRk45B5Ck6XPnDpxV1yvyJgBUb9v/pxagVxBC/f9h9h?=
	=?us-ascii?Q?CnOQJMk+yi2aZ6i02Dz+qmL77eDM3SY+uaGy85Izx/aB+yZhpVtay+V95e8L?=
	=?us-ascii?Q?dFhTUqn3a1m/X+s7yC3YtPwmADO3+Yk0cbO7hFMyhirTsrdasvnDiTAtv6zS?=
	=?us-ascii?Q?f9cXe7nE+WUjYi4u/7USnoZA+PRc1uNm89y/Uhqv+3piDx/3HKqmW3KSd3PS?=
	=?us-ascii?Q?FoNNyr6KiAVXNEAQ5z3U9U9uOmwofFYetg4RdO7XaxpYlCAVLLAzHFyicbp+?=
	=?us-ascii?Q?yLxWwVP6YqCdI0KcW3tn+06PFBXRDaDSxz95g7uLhcSALBHX0yU+xkp/7ozg?=
	=?us-ascii?Q?dOSZG7PcBjZdJezBgBeJ+OcbojX+af+gvD+HxPOS7b6J2gOp69ggQROlyi2R?=
	=?us-ascii?Q?ATMqLrzrncGa3IKPXopbI0XLfAHSxxNESWAo1LdAir81tlBI1EhUdkuNnyOJ?=
	=?us-ascii?Q?Y+gf42UDfYIV/WI8/MsN11SGL0cteHldvrIgWtrkiU5CJ0UA0AfRZ0eDgR7w?=
	=?us-ascii?Q?wslS7Uqx0xtk026KchxWjSripdWLnUJJw2VVkbia7H8te9suVV2x8BFLulcd?=
	=?us-ascii?Q?cHH2UZQkypyNXCsdBxi1RiavSkBH6BFLM73qOn/ONffAUKC8dIKSYweoXYAo?=
	=?us-ascii?Q?Ot5x1W3hw03lUl0GIX54Z5sYFGoQLHSvoDAjpxcqiYx30cfWd4N64gnYSX/1?=
	=?us-ascii?Q?uFn8E6Rl58+sz8Iif/4mgEWNFi9srnggEvW1jx2rBDhfLHpa+orgjofRzU3i?=
	=?us-ascii?Q?8XB3/nS3X2+MzV09XA/4nhkOgGGd9l1m+JU7wGzurhLbsALSYPIrZlIPnDFF?=
	=?us-ascii?Q?k6gGQasrF3W9dV9wSiSTCJtFEs+kWWpHdahj7/ycXTvtb7xyC5CFJziq2bZo?=
	=?us-ascii?Q?8T7V+b0rEKTQ+QfyxW0XarXkX1sv9u1yuDEeI7EwGEKJFpcRK4AaesG79InV?=
	=?us-ascii?Q?9wsDiKiqsu8A4d2Y=3D?=
X-Microsoft-Antispam-Message-Info: GW2rVPJETDQFO8gpANzdMVhN36CO9nJbHLDMKyiAQHkCx0EnFIPKPhBSBfQ/wkAWZTF0GYRD9RqdI8NJbYfgzUCus8heT57bQjWA2i5saGcsN3w39jEuQZtOT2sgow0rjIgDf2G61D9kk1h5aV/hS45HhTKRiLgf8ypRVOkygrQ+CBLnf+O/+LjIAqzvB78Q
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2591;
	6:5M4TiZDn1N4+JODHbr0U/o1mjwx+I/6/mXaZ6cmWBAJxzvpz5Cf8T7dGtIVKvgClGv6HzMMzwjpYOJSn26AprtELh7RnOsg72fqNh2OU8OcLTTvWt/66V81zE59Eg/l18qkdJ7VjZgRUxDYbdvUsGOvQsdbYbz0bZUHUjmoViO7NZBDnUvbfFJM1P+4qeqn842SIkNlS4XJKU89AXVw3H/8vJw+C9Gh6KY6jQsX6QHqa3YquhiJ+wT72WJeApJVQd0gE9uBeNBTUHPXZ2PYk2Jr2zm5lmGjFJcIXvpaICe4rd/KCRNM4+zkD3riiTJKNy7ff74gw8zzOU6RRoPK5Dgu3MVN3X5UKBoQvxh3ud79t1U9iZPpPN2G+fmlpm4ZVvf+6PuwX6VtYL0ZTpkpNu/75O3jniyJuDliC0vLfnTkswNYX4pf7+7HHIGt+Iw0My6qCW1s8LKDMbO7SDG/QIQ==;
	5:sUsjbwVPbAn0PaYNV1HWOuxLMIhUId0yJ/L0VLWMdG6O5421xg8RCevSGl51blK1LQ0AR7StgyuWkHMYOl34RQGKJDcxDhLbSuH/6dV9KhQl41xsURMtr97zujLJBfAMf6rvPYDNDoomMDMqJ6ALLKqKZKjIiXbx1C5vIa2cLVc=;
	24:wUKF+1ZGqyphekNnOpF7j68WQlK/s1EH4nFVhFLaI5FHuOLhSQIjsnNVCz8LFRG+YFWoxJoghOqezwtPViKxrf2sTEtgYxNtByBMqSSAhOs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2591;
	7:E7AQvr37VJIgH2EdcGqtDBEmh/pbPPebUH2nRwd4jpMFNNpBfWOPADSUdUoxTItWVxLb1Xfwe5By0bztjEuBdGxg5PuScIaWd738CYVHpblBWjI61LngjK1zuIUq9ILQ4uIe0Uu81rJ5c+bGTyppLUReAXx/dWXG5J9lbHnaw0biH6W4GcwS5pq6xaEgwRCttEqlcl7eYElmWy8ySMh6MUGNERgUyPO6fo8ALzJdQomb0u7RFDyd6C9h/bcgSr7l;
	23:kufAHeeVjlcPFVCxOLHAN+WAmcSPPW56QShbvwj+19xdcNNxxa3HcmJVk/xHaoB+8kZAKn/8+M5XX/qx4Lul/EJdvJPktUl68mzpLTtLhY/nl8WmpJgTWGA4YUhwsshxe1ZuOhj9lm8XTx9GqqAYWA==
X-MS-Office365-Filtering-Correlation-Id: 56395eae-01b3-4f48-c3b8-08d5a513e1d7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2018 10:05:15.3050 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56395eae-01b3-4f48-c3b8-08d5a513e1d7
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2591
X-OriginatorOrg: qt.io
Subject: [meta-qt5][rocko][PATCH] qtbase: use mysql_config from correct path
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
X-List-Received-Date: Thu, 19 Apr 2018 05:27:05 -0000
Content-Type: text/plain

mysql_config from host sysroot is found first which gives wrong paths
for cross-compilation. Use it from crosscompile path instead.

Change-Id: Ia1e7d8e0c582016130f595b1be279255e9d0b055
Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 0e3a8ac..db6280f 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -119,7 +119,7 @@ PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
 PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
 PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
 PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
-PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql5"
+PACKAGECONFIG[sql-mysql] = "-sql-mysql -mysql_config ${STAGING_BINDIR_CROSS}/mysql_config,-no-sql-mysql,mysql5"
 PACKAGECONFIG[sql-psql] = "-sql-psql,-no-sql-psql,postgresql"
 PACKAGECONFIG[sql-odbc] = "-sql-odbc,-no-sql-odbc"
 PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
-- 
2.17.0


