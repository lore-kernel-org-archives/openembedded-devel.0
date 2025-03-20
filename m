Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05384C36003
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 05:40:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1091.1742449231232601757
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 22:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51749bd76b=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K5eUrb009323;
	Thu, 20 Mar 2025 05:40:30 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d0h95g3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 05:40:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJABuVS0HMLCFuJULiOeTKjcInUHJvWwV98D5nlduFCA1++EHXg//ouW2u9KyDJe59uCtgyeB4TUBVrOMvQ+RTOjRvutOXWMh/xIoomHJ3q+ai5J/s0tryOMe94yELvH2VYoW/lqNic9CQVhposYlKf2ZGuy7nvHE8P01fyUAzbjK7EZlx5CjeOIQhc3PyJGLXHE06CMpGzlEpVdAsNqEJaQsfmm2Rw5Rqf/M4FW3ur9WDii5sG4bT071LEQSNSuq9acbMlmX4B6hcu5hqn0LvEk/tfyDSUtZyxXiMrsQu0IRjl7vQdlwpFbOY9Q1BSqaYMKWVTyGNlBjosESmRnQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4BSTHhO3Ug/tI5xB0sVm7yxl/ujM4JVIBiyY/d/D+Q=;
 b=V7zsxEhClvUZBJEb02cXazPYI68srfS1eYE0SfFhJR4vpn5kyjVIjvj20S6cSt1esVYqb61wvt1iShrQvfg2s/nDGgmDov1i916HsHEmvVgt0SUHnyCvMHzzen9sbOPs4nR0szgfrIcEefdsfhsv7/ZXc71JQBrNrNI+obRS0qM+u62IwL3rnBj3cXSyRA8C1++W4ZIv1DtCmlRPFKhfwzzw7SmGmKaRmfbcVE4j8AZU6kNUsmAkaM4Zl73OY9YGi6SpiuqiAHXPe+0kEWF7wJf2iC6TPYaGEpJz3BtaygOo2+WLLronyVoOlHW72sQXdYd8/BEi6+fMNai3IySEdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 05:40:26 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 05:40:26 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][kirkstone][PATCH 1/4] geoip: fix do_fetch error
Date: Thu, 20 Mar 2025 13:40:06 +0800
Message-Id: <20250320054009.838158-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0191.apcprd04.prod.outlook.com
 (2603:1096:4:14::29) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SA3PR11MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 293dfe37-8dfe-4cde-1dee-08dd6771b755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x9mtUZic2MxwImUNjjyZrVH5Qll21FfgUDCBoX1drzPzzwkc/VRoqKvAi5wK?=
 =?us-ascii?Q?J+pim3HJpHQaXIYv/VWkGfTSrvTcOoCf4RZycRG2CXoBNlFenKZ4gpaLUm23?=
 =?us-ascii?Q?mtoTfdecWN+XmIyyPeWKGW2/hEupVwa/JT2xuxOrk/4vC/NRQvSzeeblug+E?=
 =?us-ascii?Q?qjLJsiuvbzqzSdac3FyLQyuy4vXrev884IQoSv0m/Sgb/mA4Uf23V1vJzSYp?=
 =?us-ascii?Q?amhWuoMEyoyeA3FCpbcRe8qcCSbxE5IcoYQ2PudchEMC9rm06KqpuDzTeVuj?=
 =?us-ascii?Q?aLWaM12EsKuCn0rF4SusR75e+RS8buAP4tGRN91LMJYPap+hQa6qGFAfWiEv?=
 =?us-ascii?Q?Gly0WlT1kG5FAAHrVVyB6/T4Ub+tbZsZU3SZDAmVqn3wT+UzOpy0GL8Z5jCZ?=
 =?us-ascii?Q?t46YrET8tcWSiNiabeictcUgkk033B2YN78R3DRqO4Te/pDCdtN+JAMCmwf2?=
 =?us-ascii?Q?U2jqNpqmtVWeKMFh/uPTREkU+An3Vx/O1T5z7qj6f3PLylI82Swbowgqb3XN?=
 =?us-ascii?Q?0wOlFSSH85TVQLy8Ekrj7Kk62DVMOBxW884aYOEUBwe+1PmCLwGP8R7UDai6?=
 =?us-ascii?Q?G3Hq8ZsgtQDoQ+0SvWfa+hI2heQmcGNYt3VoN6Ep4fjAbzizNS0shCVgUN8C?=
 =?us-ascii?Q?PBcFTQxevO446r1/IDojyq7XMQ1BYphTzGe6CWR8RpcEO8oMaekH/t7iNAAC?=
 =?us-ascii?Q?96axHbp5MxVVVLOrgUNjKIBmiMuFs9X0Gx4Zbp2AnUTMI4jLm+EMbSfKbreO?=
 =?us-ascii?Q?IyHpaKxYZ/EzfldDYxu5pUf4exGsP+MVCYKczm0ox4C2EOleU+uNg1wPMHRJ?=
 =?us-ascii?Q?RXDIEa0JEZ8aVcinvIzKfAOLPTpUyqvQFfDLQL5Q26M15+KSjPRde0Fp1Ku0?=
 =?us-ascii?Q?vIlIg9Xq/DmosZGW0KFjPkXwZE+KDPcozJz+Ws9Gfn5WJ+JJnqk2BCNynmM9?=
 =?us-ascii?Q?6R+q2zm7wkJr30en/QOYklTAuJ3uiTsmWCJPmE5YT45b3kelMUqR54sltSrc?=
 =?us-ascii?Q?QhGT7LbyIqRJZC4NfmI9PEsQciHbhf5BiTBUVag5JRvWi1rll0yGen7E8JA4?=
 =?us-ascii?Q?EWfDGDoXTqb1fgsnXHNPElGS1/EMfJMui1sXM65p20SEJ61kCjSUb112+/Rn?=
 =?us-ascii?Q?6EeW+BR0ELjRD5mKLWGZxbMCeCS3Su6jHop5T6vHIxfz3IyGkoJIyp1ac2HL?=
 =?us-ascii?Q?wXC+gTopSKLZpXY5oTbJqPpEHXibjWAbIpPs+6xK2x0VV+3PtiEfP0kXa70x?=
 =?us-ascii?Q?V7oWY1J6w0ZVoO8ttysvDYK8cLS0xO7qb7aQ0rLS4gNDCtqMz7rrPyYk1ZW3?=
 =?us-ascii?Q?m6Xm2A2CRTMIaUOleLgQlUDG8iTSkRVHuGAvKMsTET+8savXOodMAuxKrQQS?=
 =?us-ascii?Q?yeO658EVBYM/ti7mm27FtHR70Cf5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hYFitgx6gvgYn6scHpdO4cmg7kILfrR0nQKNmAB3AYQ7IhSbBbSpuR8ISiY/?=
 =?us-ascii?Q?IePmADdAZR0TMN7z5pI96dSwSgyniXttvsE/otohs56GxoIPH41LQXb0mYFP?=
 =?us-ascii?Q?jby1x80ZK9DyWP/KpJn7FZqwYQntW8ezQYqrS3YISrlbEgmRLrJZ+IyKnGq2?=
 =?us-ascii?Q?S2dueLA7T351BxjCAr/s92duemnhk+0S84RrIlSiM2/BeN6SXGtkgkZgrZXx?=
 =?us-ascii?Q?M/rMQMLoVSFJYXyNGn6hrsCy+PCCXGJspVzNLtYgwhEdxs4LQv22hg05XI+p?=
 =?us-ascii?Q?bhsRXPS7Ent7cw9HpTTdEPbb7hhxzzYZAKKaA9X5nSoIOXdJbJZ1K18CB+2Q?=
 =?us-ascii?Q?N7l3SMeRfGJ2S/ihkcpGRLhcHgNt5u2RdcJSPjQf5O3BqFdGzXg9M3qaplh3?=
 =?us-ascii?Q?U4Bz36vNbrZ13tRiJGgZMnvZoey4oJOTsiHQ4hXtsPZNr5VDxxfP0xWHZ0rY?=
 =?us-ascii?Q?hjtZk/IogPMr6wfPUY1bunKILiehk4mSaOXDPcT1M/mioIpXFdK1rX89s3PS?=
 =?us-ascii?Q?irkQtzxnDs7iGk1lzhcyt+thRhVp+IW4yRO+F9SwZaPxu9F8dON80ureOzKj?=
 =?us-ascii?Q?MwvuvNr/O2zW4+HECb8GB2/P3lzMY+en/S6uKUm8UwaEETtDwRfzoylOLHm5?=
 =?us-ascii?Q?G++/JcxlL3JRpYuacT6x67bceMK10imAqW104Omu3GmaoyU6chOaMe/2K/uW?=
 =?us-ascii?Q?KSf85U25aLBTFfGxFJcU3odjOl/C2JaUIodhCCmHXBFkUDf3EDbAASErdDoz?=
 =?us-ascii?Q?xTPTyefCXDsvqt0ueUicwFi2NmKxZuPXCpiJikzKh/A2ymMVlGH6YDOEDF4E?=
 =?us-ascii?Q?pdgmgZ1KTMTHben4u5dWaWyInuPc0fsRMmPeuhBv5lLzHu/Gmpxw/dLNBbUZ?=
 =?us-ascii?Q?dUB3VHan8puX/cskt5e/QBl3b2tui4RMg8j1b6bLu69ajkeT+p0zSYpxC7SR?=
 =?us-ascii?Q?tTbCE4GlYi30sX4E45OFGzZptGPsOdkO9BCqoNMoVzY0AWoBM90vC1dRNj2m?=
 =?us-ascii?Q?E21Ofd1Ldm6KbXhH1P7KXK7hUqpOAZLt8bgsl19gIQV8EJ0/OGKlntKKhyuT?=
 =?us-ascii?Q?asb0RbYbPvuhHQTQ3NtIYz+HwK1zCnoJXHI7Lps4MoU2Y4ouhT+NRwhUAzbr?=
 =?us-ascii?Q?fKntv14JhU0X/3F94q1gOZwVxonERSHfuhyqvfz1O/79IwA9Q3q1u/pn7YW6?=
 =?us-ascii?Q?qE88N8m/EYsEWy+boJC7cgcrkEglDGuYsnGgApuhzI/FFl8Nb3Ncr0aIT3xf?=
 =?us-ascii?Q?JjIJrCQ5/77vXUj68GLkXOXQay/Im/CLulM6o/H1uW2KC6QvtifZB62mfuff?=
 =?us-ascii?Q?CpSjBFzHJBU71y0NieqoQc1cY0BVclqAFGI6c/k8RpJORAFJpuDlT08r7LGe?=
 =?us-ascii?Q?TTzJlMT93OzAJh5oJmEBugpZbhwTuxB58waBynF1bv98YBReye73mYscWSHw?=
 =?us-ascii?Q?6iBz9NqY24/t0dCdiyPaao/ZkRwWgtb7dSxXnvaz3fj/IHlFKdoHf5tRpN+z?=
 =?us-ascii?Q?sGSVVJSDAfKJLT2WNEBqfs1XLw/BFngmB57UyJOee1S8rYxyDjGDucvPRhuq?=
 =?us-ascii?Q?pR2TtAhttqrjXxv+JrosZ/pLgC0KH5y2tdlQk4RzhCjyVEXaaMbh0f8nm8+I?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293dfe37-8dfe-4cde-1dee-08dd6771b755
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 05:40:26.3258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yz90uzOgV9crK5B00ctKXVy0gzIb9DxGoQ3EikpjZkr3hqW1VwDS23oSvLBSk+plaf8uKFF61v5YFGw8O5cO2fsnRnvKjSJBc16dxyHtw7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
X-Proofpoint-ORIG-GUID: eA10LjVcaTTsN4MxIcN_6zrxRJeK_d1Y
X-Authority-Analysis: v=2.4 cv=ROOzH5i+ c=1 sm=1 tr=0 ts=67dbaa4e cx=c_pps a=n5+7iF7l5R/EKaY7dbRUPA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2MUAHTJp_KMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=dlODPEQRsXlIFgTNUeIA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: eA10LjVcaTTsN4MxIcN_6zrxRJeK_d1Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=928 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503200033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 05:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116116

From: Wang Mingyu <wangmy@fujitsu.com>

Change the SRC_URI to the correct value due to the following error:
ERROR: geoip-1.6.12-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://sources.openembedded.org/GeoIP.dat.20181205.gz;apply=no;name=GeoIP-dat;')

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aadc2ac9dc49dfb5a2066401f22e7b553b324313)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 meta-networking/recipes-support/geoip/geoip_1.6.12.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 429cd69d6d35..12599f97de48 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -11,10 +11,10 @@ SECTION = "libdevel"
 GEOIP_DATABASE_VERSION = "20181205"
 
 SRC_URI = "git://github.com/maxmind/geoip-api-c.git;branch=main;protocol=https \
-           http://sources.openembedded.org/GeoIP.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoIP-dat; \
-           http://sources.openembedded.org/GeoIPv6.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoIPv6-dat; \
-           http://sources.openembedded.org/GeoLiteCity.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoLiteCity-dat; \
-           http://sources.openembedded.org/GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoLiteCityv6-dat; \
+           https://downloads.yoctoproject.org/mirror/sources/GeoIP.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoIP-dat; \
+           https://downloads.yoctoproject.org/mirror/sources/GeoIPv6.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoIPv6-dat; \
+           https://downloads.yoctoproject.org/mirror/sources/GeoLiteCity.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoLiteCity-dat; \
+           https://downloads.yoctoproject.org/mirror/sources/GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoLiteCityv6-dat; \
            file://run-ptest \
 "
 SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
-- 
2.34.1


