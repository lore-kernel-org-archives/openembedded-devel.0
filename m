Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7671C74A5B
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 01:24:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.24988.1679880258343591495
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 18:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2450feaf8c=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32R1J9RB019312
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 01:24:17 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php641gsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 01:24:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgJTSjVj0ywhKDxzhvbwCEtjoqurNnVy+AXVURgQObbRd/e1bIh7G+x3/GicmZL2Svor/062PaxC0jg3m0hCZbmuucS1JWCQ+ASR6uaf2HU1DBEQ0wzI/VW57XWNR8ni04F0yLdFbl9Zdo9zdXhHVqkSeVmguhOq/B82JkHsBPelIS+hYIbL8mkYtEBvUGBaPUP60+7PjLHRLj2Oj/K9LnGWyj5u7rMseDGVt51O+rrvPNCQtq413nsmscbfNuFr8x+plb3v05DOwoNqLm/5r1W1Fok+S2I6nfzI759MR+auhqjsI4T+M2Ca7XuC8jb3X/aR6b/abtVuU/AuC5sBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkfncyiwwdoSgIFd5fRAGiD4ybtwUeIA0fO4DdtjMeY=;
 b=Q7zY/ztxEtrW6Qw8J7WJZthR3TkgrsXy7hOpTRbLqdUkCf3ciGKes6nx0M6jXIL90CVUUrYB8tVI86+xhPxp4/AKaHgSFg1fmiRuzyNULLX7FShGQ3jckT1Lo4ppWZ4HRZQ9M+Pul2kMp2r5K7iSiaMBYPptb0Jqt/tG6mDXb06665Xd0ObPd36XDxKhjoKBabYJX5CMXoJXzjRGACUrhGwirIolaTXN3yyDrqxJCxdA2B9W5mHvp2v0L/ImdnpGJdWSWgUwaQifmAPw5/vVYpmPCpxykrTHg1iR/PVwgCnNXyib7W/VEcgQUi4Y6+W8Z1xrbpNcX4eqZwQMIVpXHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 01:24:13 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::2ece:f831:c97b:dd8e%6]) with mapi id 15.20.6222.028; Mon, 27 Mar 2023
 01:24:13 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] abseil-cpp: upgrade 20221014.0 -> 20230125.1
Date: Mon, 27 Mar 2023 09:23:54 +0800
Message-Id: <20230327012354.2047037-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:196::9) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CY8PR11MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: a1591e32-f526-4ffd-af05-08db2e61f967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wQT0ER6cVAYhhWrn8mETdf+dx6ZcqCVt1HUq8Gig8LaT7mR0662SBb+kSGMoUCqmHGL6WyaA3h0Jj9peMlnZcqZT8wLJbE/A0ZpaebgiXlaPa0pJ6+1hdqUJSM8kVHlgxd1w8diaktCW3laWUPv8kZ6UKx5lTpp0m0PhRSjRrIdJu0Sm4OtqhHNXCS8XJvbgmdmse6mtu/WLQboDs7txXmnlKBMY3NC0R+g4bwfSj9WIa4W05lPpMX5dvLyGsCNumHq6qi/HJSe5PjFwwWA801VNVjbLXBizDnLu2lSMCanEyU7E1GIYCzA7iPOHNDDb2XwpMkUrw5nODGFvXfuhjBkPIWruyyts/q92pJBZ/Z4Cr20vLvVmPIni8X0EPGNK4S8eMab9TvI7CA8PhmL2n0CAcoKtaL4cVplRdY5YBH8yYe+tJNPT0sel+JdTYJS+2E+2/GqFF3kVujkIgE2UFKNta/5UoTrAQazE+Dn1bWcfdMpMIa0Iaacb9RTqKmqfDb5oCz1SbIOYelgWAXcgL3ukaBxkREDijGgKklhh1VDi6OGq86HNORrgwsodP4c6lLAqAjFH2jnMjd4+VLUVsFfqNyg7YZxX7xukhtlHlN4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39850400004)(366004)(136003)(396003)(376002)(451199021)(8936002)(38350700002)(316002)(41300700001)(2906002)(83170400001)(5660300002)(38100700002)(44832011)(66556008)(66946007)(2616005)(478600001)(6916009)(8676002)(66476007)(52116002)(6486002)(966005)(6666004)(83380400001)(6512007)(186003)(26005)(1076003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6/jTtdUJZEtvq8cZCxWqSXkz9iLtKeFpwIvSwel2LXsHExioTiEJlWrSOz4+?=
 =?us-ascii?Q?2LLvCfNDBjLAP1eDSv53evjveTuTLcoGBkvsnHCsUSTqGPX1N4ai3iPGed9g?=
 =?us-ascii?Q?THJO+kHrYn50FCIrlh/NlZsTDHPe0khYECZX31ehJHLWpxRkuZ3mAcTC0cWW?=
 =?us-ascii?Q?2CmsyG3KC7Qg1wzSK2RYLvZZSimBmzPAmuHIJ3a1m7hd6xqsHUSb0oA/3Itt?=
 =?us-ascii?Q?519lcekOCtVQhIP4EC4p1LD6z1xIdvJ6Xv+N5azdASqID/ZZd+CfCO8wAqr4?=
 =?us-ascii?Q?jIlQdc9U5hQTMQJwcBDg/p8Hdo2Is9xnRUBTgAykRQjPhQmzhvPD6Myy/KXe?=
 =?us-ascii?Q?LVko+VgNMB4UvxYK6i6U5Wm2q9tUX7gA8atrceHmnAaF46m81CgjBvufBnAa?=
 =?us-ascii?Q?tWzXhoYXFCgEQEVE31NkgjDVkSpdreVUdAV+qdExdNiKCdAaM4Iu/TCHfcyt?=
 =?us-ascii?Q?T5ommGG9152koCDuxmjyMqbiDPf6CnD1Z2u7jUJulal5nG2uiUVhcUWhofC0?=
 =?us-ascii?Q?QCmx0Mrgsr955dBrirxREqwo6pU1SIO0XYgsptpTLoZU10bQjmhv25eq83Ia?=
 =?us-ascii?Q?hbXwZFxeVM1v58aAqzXwv9FCohOI0aLnL/DgI60jND+FgGjj7yg/dnoZVviW?=
 =?us-ascii?Q?vVvuH4fWRLIFAyUcyfmw3pqMkQvkwpn5vGhCLvrvo9v4JQl0ZrRcj+fRQ0xX?=
 =?us-ascii?Q?83utfaK2+AObnDpPe2s5xDbORw+zE/u3uF7HLoKDY8VNtQBIZGi/I2876N5X?=
 =?us-ascii?Q?Pw9Nfnnvn4mlX/8YG6W++5sb3b0TqtU3DWmMEY4OhxBwyEsO0Dfm7QT10L+x?=
 =?us-ascii?Q?EBWm/+n1op7q7b+XejTni7wBwdPOQqbKthNmj6g3ORCJs3O4im4Ly+QHagSj?=
 =?us-ascii?Q?5wff4SzKfW6yz9rML/mDeZ8/c7/R5ZiRLvikzT14FuUE6k1nljkCMBfifg/C?=
 =?us-ascii?Q?kw8U7smT0EM1psBsPzJFZrA55sxLXinR22n0n8CaqYkWfkCYaf8Q5SSxD/cW?=
 =?us-ascii?Q?JefrYteTWGN5g/0jOKoMWzeFOJSveveiDP8/KtTf1ioIVEpYv6D2decuRknP?=
 =?us-ascii?Q?HUMRVJDplIJ2DV8EM3P7iPFSz998lQ3rlthUGSkx/4qDEqpLbrgaqlfO/bAf?=
 =?us-ascii?Q?8vA/acRI/0AyVFh0QDd13KWkAwnIcp9M2DlxTz2jNFx2bDYferECx42vetAU?=
 =?us-ascii?Q?fUTAoy0hVC2UcFWCErOB8dQKczEeM85oig4Ai5Ng9o3v//MWBspE3i8XUN0D?=
 =?us-ascii?Q?YxMs/Ul7BuQPLzh3Agy8CRIBeB0igxsJcLOSX8UYpEWS3wVHScU9QD1euK3b?=
 =?us-ascii?Q?Mh/0V9ryrUMGlkybpr5wJR7NZYHphVGRK6AmtGO3MKX7KHkAp6xdFmjyAqjO?=
 =?us-ascii?Q?ijiXAnlb4XOqU4iiNwZL1aZMFD7Mp4Yx0pVbSac1367EB+OI35/NXAOQ9fuG?=
 =?us-ascii?Q?673tciToTu+GGu8FxDbPlB+u1TdI+qM5Pv2UUFa0qSs0GtvJzNKvvsnPUa7p?=
 =?us-ascii?Q?aXGHqjRwk5PHLnMLHNsdQCGJqXPISoZF48w/G9vXHc6pBdLds0TpqsBF7NN+?=
 =?us-ascii?Q?miC163HNxWuTjMEqxHlA9GSwzMAeXF5ns1B5Ef1Qp6jg3N7+o26yo5qpcI5i?=
 =?us-ascii?Q?cg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1591e32-f526-4ffd-af05-08db2e61f967
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 01:24:13.6164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScqMAQZoaR3VmhJ3tElTpdEgejVopimnFtY6eoacPvJS+jQ/t6BAHrZURXAyPL9/7FHvsdEjdGd6PDqIMMVw0r+hFOVyylXGcJ2PBxLu748=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
X-Proofpoint-ORIG-GUID: Xr1AdsU3UXS1MqRzeXJcB7qcl4cEUwvk
X-Proofpoint-GUID: Xr1AdsU3UXS1MqRzeXJcB7qcl4cEUwvk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=600 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303270009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 01:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101752

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Note: please make sure your oe-core has the following commit:
https://git.openembedded.org/openembedded-core/commit/?id=a73e269d3e591a10bb397b94b82e3fb960112d33

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index f7f8fc848..08f2e264f 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -7,9 +7,9 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-PV = "20221014.0"
-SRCREV = "5fa65f28e46e86c44966a1ca8a727a329d9c1ff8"
-BRANCH = "master"
+PV = "20230125.1"
+SRCREV = "c8a2f92586fe9b4e1aff049108f5db8064924d8e"
+BRANCH = "lts_2023_01_25"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
@@ -28,6 +28,7 @@ inherit cmake
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
                  -DBUILD_TESTING=OFF    \
                  -DCMAKE_CXX_STANDARD=14 \
+                 -DABSL_ENABLE_INSTALL=ON \
                 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


