Return-Path: <ra43240@vinca.am.freescale.net>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0085.outbound.protection.outlook.com [65.55.169.85])
	by mail.openembedded.org (Postfix) with ESMTP id EC4476AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2016 15:59:42 +0000 (UTC)
Received: from BN3PR0301CA0049.namprd03.prod.outlook.com (10.160.152.145) by
	BY2PR0301MB0597.namprd03.prod.outlook.com (10.160.124.28) with
	Microsoft SMTP
	Server (TLS) id 15.1.492.11; Fri, 20 May 2016 15:59:40 +0000
Received: from BN1AFFO11FD018.protection.gbl (2a01:111:f400:7c10::194) by
	BN3PR0301CA0049.outlook.office365.com (2a01:111:e400:401e::17) with
	Microsoft
	SMTP Server (TLS) id 15.1.501.7 via Frontend Transport; Fri, 20 May 2016
	15:59:40 +0000
Authentication-Results: spf=none (sender IP is 192.88.158.2)
	smtp.mailfrom=vinca.am.freescale.net; nxp.com;
	dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received-SPF: None (protection.outlook.com: vinca.am.freescale.net does not
	designate permitted sender hosts)
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD018.mail.protection.outlook.com (10.58.52.78) with Microsoft
	SMTP Server (TLS) id 15.1.497.8 via Frontend Transport;
	Fri, 20 May 2016 15:59:38 +0000
Received: from vinca.am.freescale.net (vinca.am.freescale.net [10.81.16.111])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	u4KFxbsP014778; Fri, 20 May 2016 08:59:37 -0700
Received: from vinca.am.freescale.net (localhost [127.0.0.1])
	by vinca.am.freescale.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
	id u4KFwdqE002575; Fri, 20 May 2016 10:58:39 -0500
Received: (from ra43240@localhost)
	by vinca.am.freescale.net (8.14.4/8.14.4/Submit) id u4KFwdMp002574;
	Fri, 20 May 2016 10:58:39 -0500
From: Ann Thornton <ann.thornton@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 May 2016 10:58:35 -0500
Message-ID: <1463759915-2536-1-git-send-email-ann.thornton@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131082335794638841;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(428002)(199003)(189002)(9170700003)(960300001)(229853001)(50986999)(92566002)(50466002)(4326007)(2906002)(87936001)(2351001)(5008740100001)(586003)(8936002)(47776003)(36756003)(110136002)(189998001)(11100500001)(19580405001)(5003940100001)(33646002)(101416001)(8676002)(105586002)(42186005)(81166006)(6806005)(19580395003)(50226002)(106466001)(230783001)(8666003)(1220700001)(7059030)(42882005)(87636001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0301MB0597;
	H:az84smr01.freescale.net; FPR:; SPF:None; MLV:sfv; A:0; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD018;
	1:dEY9wfL4OEgXI2tIxCYpKklBOqNhWl2gsZ6Jd+jkpeajzuP9I0eEr9CtbZEchBD6KvJoxVf051ApzFL5YtEjz3hzDKsGHn3hDJjF1nWtiYNw5q7iFMpDy8vau4yniRdPhnPNAl7cl0iFZ/jTkNGd75G0lD1MR8AoT4x7XdnEIVYTeadlDraP+nCGykA4h2ivtj39LS64lqVmAkF/t4p8MmmGbYVyf3d++FOR5SYI+PEtYegJN86XvZebXw0InrvOryQi0JbCQ8CDzxMhv08MtCYQ1goK4Ewv8vP3/nrfslNGmv4q7/5kJezCPsRobXX4DRmhMmZlbeZxwEVbqY5A/RlybycsEzRl+wpWRyJn4eN1aEC28SmNlXcOxquIXoHN2r2H7Mwnd0N2kEwDWHIc1dl5z089RmDok7ETNz2Uu+wbaiJllocjRY0IrSzpyIKANPG9spNo4ld311VoLzBPKxDfR1wrk6yOvhhvAdEZ28ygVbRIyke4STV/LoQADXIPx5v1UFo0iysuv68aD8NWs5oCFf4zC25ULXywsT8YHfc+iXrmvOPVxUYyL4QQzA/oLSylDOcgbj3LQCpOPXSu3btc+IGfdzV6ptEjS2N0F7zuIdwlhjAfO/0dcMeRNUfkS0TRe9T6RhTNoZ65TFMZ18DZJ3JoU2TcduQjgwuMtZDrlFN1bnSygsfAaKRU5oxA
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: b399308a-eda6-4131-c390-08d380c7bfbf
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0597;
	2:gW5uT+tqeytu72io0Jw0v1a7y/vYASsDPTDmMgKEINIbBZy8IO8UMlssZPBQCYd4MmcrnZdZOzVEABXpIq2cEijYme9n9iMrw+PlYkO0mlQyj7jrR7Wea3twtFDnMRZd/B1Ma66p2Vf9e3nU6Wyy4xjjjlfymG61jmcMgkQ265d5Za8UBvZAm43qpJKZe/vH;
	3:10xXKO7xzwvgb4gIVNbGL9WsOYuN19si5PQY4tYrikXTow0LSz4xYPeig6dljNhHn7FZw3kv5VPvxVSNMMomBlx3DCk2wzBVxUJl80tiHlQghdhto5yHM4KCRovM/OV8jJA1bcn8cYX+Ojw+GpJA99sR5b8qz/FfOPtgafsDvwgHLTYHvk0sVSzj2Dd5IFSMMkx82EDhHj3WwiPENYiJ4Tk61WPVvdvgfXhlIbu4Ppc=;
	25:rMyaWHCi9zIDln/GWQ9pyH1F0fh+2D3TUzwx1BASFmfab6AhzwdS7WYPf9B8ZQQH/jw6UKY5vfi9fTebO9eVOpx0wE+QkATz2Xu7H1lxjcNfazekBIFm0Lyt2CEssugGyd9S0AmUU9e39QL2WgEefwnlNJLB60aRWlmjgQdrgMnhF2cgj4epsC9KSrZilAFNKT9EAkPq3M/7EmejwdxrBqbJOBh/NTT1NWkCg1LAwxnbkR7mQi3leH4BzYGRQ5sHh1wIYVcSjx6GV6nMVmIzqDkJBKpdimWGGwlnjVadbhvJNlC69aNKMvRXCQm5d2yu7uHVnCgKeQmWXSSAuf+cGBpj0uWl2vMkWBL7drbWx2k4tuEI4tOtABrdzAFcLrt6XQsIZCX93X4s82QLVCn+6b2hKOkgrTj3Xi9B5a0L5IQ=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR0301MB0597;
X-Microsoft-Antispam-PRVS: <BY2PR0301MB05971B22483DC9E41E5017B99A4B0@BY2PR0301MB0597.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(13015025)(13024025)(13017025)(13023025)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:BY2PR0301MB0597; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BY2PR0301MB0597; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0597;
	4:46qPcQ/AE90ar5sOZEAh9GZzoQXkOHliymaNEkIZQckjNOWK60ZoDhJ7P/fNoxFBYpUgK2GXtYfK8V9n5KyM+M+7pcPlGhU7HD3bKaJVn+PjsZBUdAULwVsegD82ykGmZVzgkHjPXwMS1P9ftDyoCUfzZ79HZjiHbQLnihrGJ3lhr9GJz1skHZWZxeYNqHy9+0ke0AVFc0TtjRD3sULInIJs9M0dk6UOoxK0hh8AqkA/EHZWe78sHgHAd0Ya+kIYHJ1FQOjmdSlE+1QuG8TdkLd/ev/fQz1dDOFglNUpTBnndejBOrpSO2A2psKFWE9JziWnJPsY2hhp6vKDwSy4iWsNyY6maVkSofKGdYt43UWr67K/myy4xx1/ux4Xxh/RJEdjB4zI/0UqPLH7kZAbPwEwgahqIH/HZ9FnPC6X5RMuDBgQiU3dd/zfYQi7hRzXmyLiJHJVrLZSqOUwbVcWEwFRoviif6J8dXzGgKWOCMg=
X-Forefront-PRVS: 09480768F8
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0301MB0597;
	23:wjn8SoraXw4/+Dh+zj3439GHU/N7UXTfdrgWpoG?=
	=?us-ascii?Q?/iJbLldoyiIJk9jhLrNxkJiARb5mVlHDVWMsbUjWyEB7/YbImIHGkMtWjr6H?=
	=?us-ascii?Q?u0U4j87lPb6P4zsJttZYJP1CnLevooq68Ol3XAn3P/IlfHzV/Lpvv1A+7sdb?=
	=?us-ascii?Q?BGPb0zgB4V578LnkfzaDKjOwgtyX79ESDJuUHI80XEbkhbbAerJrS+ikiJAz?=
	=?us-ascii?Q?xJW0MDqwJ0Mgf03/jMQ3mTN8sBDSSdTCymGVAP0tYqZ9iAzpIVITXu+5N+lH?=
	=?us-ascii?Q?KbVLr5QqHMXIywKn2PiQZTInynQ6PdQEYV6Ai1HgaaAYX7DLDDzIhHQ+dA08?=
	=?us-ascii?Q?J5LosBeNsWroEUdu948gN2OJE0s02TMdLrMwVPtnfvl6WS47Bnc94HjuYJ/N?=
	=?us-ascii?Q?/B8I3OxlU5xcWqX0bztonWAj8bqTzQvKbQZikPD9kGyi1BV2BOJR87lWhrWm?=
	=?us-ascii?Q?v8PcBEOgQJHMcm0HFhocRvKfSxeTSCr7ses+K5a5yS+PXvI0WjqjBZDbBtkl?=
	=?us-ascii?Q?XqRobGR2/v8wwGkmhThtFfIshGuMpNh/7JHBUlNoYOAdrzGKsT+OJRFhBXvG?=
	=?us-ascii?Q?iBWJZZkWYgLrWtfjvqpxvlNKZBBizbn8i43OXy52H9rVVo9WqGjjBgEWIcjD?=
	=?us-ascii?Q?miQTYG/PPyU/ryl2a5yUKTRigtjvh/Lpa2hNCwBsA0IXFJchs5zuTcMQTE2M?=
	=?us-ascii?Q?J0dZMr8rzL+z8WnAGUB4QhqW3KewJAoynqg/mhbop6Jc5n98vlY+0I7TVjgL?=
	=?us-ascii?Q?KSv3T9hxOg5oiE8W8ATxgDyyc1kNkHqVKpjU6QN+TK6JJHbuHQNUdvyj4TyU?=
	=?us-ascii?Q?Zd/uT5hEzFax4w1hxPORjFX7efxxxvoduAuDievjYpWUXC41qyHdyHeuBvm7?=
	=?us-ascii?Q?09nkEojbpKR18FeruFIqIQ8o4CmSudNQ/w+xUDu2Ay3xUfv1KALKedlehC2F?=
	=?us-ascii?Q?5ROBjbN/1NgAEIxmAorwSYCgAM/fofe3QYjb4MpNMkrCw/jC8Lw81APrwvdL?=
	=?us-ascii?Q?/W5U7Qdicz/OAFVKUQV/aZtaCvLWWV0ktyu/HbF/bzqHw2yJ2sNsiH2RBjsb?=
	=?us-ascii?Q?qmfy2YNM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0597;
	5:JJLruCb3Xwez82T4mCXu7pqTayi73PavG4c7ss1+iBdxQRYly6b5W/p3G4Aq+XUfDEVIVypfvJo8866HEczbRMmE01xb05tr+p52mMQ7/nMkGrobE5qFadCZluGNVagB4domJCg0Bh4WcEHxuq8OGtJ3kKVGdIXdx6ZQy9ZFei4=;
	24:OfrBUBTBlJkokgG/g4ZWJZ6n85RXPWa42Sf1eNhKwo57b4IN/hzOQgJ1ejtIgLKHtWS+m7GrnalCMYTlRqFn8hZO49ni4+MnCOmj5BpZIcQ=;
	7:wQ5UFen+5SnuISK+QMCnqIwJiIuNKU4nnn9apF4JqPlr3eM6lKkguMsldUPJzSjprDl5GK2hTKA5wUNJqYB0pqQUrcuqhu6hFpzBV9uNi/YF6PIoJWiWnU92ElV4FpdGqEGGd9u3GQRE9EJHVghVGWnMgxrIfgS6Gy5cm8eE6cdXppx+NCAjxA+tfvne4JLU
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2016 15:59:38.4342 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0301MB0597
Subject: [meta-qt5][PATCHv2] packagegroup-qt5-toolchain-target.bb: Add qtdeclarative-tools to RDEPENDS.
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
X-List-Received-Date: Fri, 20 May 2016 15:59:45 -0000
Content-Type: text/plain

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
---
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 1 +
 1 file changed, 1 insertion(+)
 mode change 100644 => 100755 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
old mode 100644
new mode 100755
index c26a707..b20ea64
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -106,6 +106,7 @@ RDEPENDS_${PN} += " \
     qtxmlpatterns-dev \
     qtxmlpatterns-mkspecs \
     qttranslations-qtxmlpatterns \
+    qtdeclarative-tools \
 "
 
 RRECOMMENDS_${PN} += " \
-- 
1.9.1


