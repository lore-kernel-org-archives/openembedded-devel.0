Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D18DC28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 07:02:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3093.1741676545664605249
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 00:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5165a5991f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B4ggwm016058
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 07:02:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458b4133p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 07:02:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHkhjbnWSS4XZn+DgxMoqy7QFk8o2m1D9zBKQcjrzu5dgsKaIlvM9VagfMw9+rBU8VHwI3Ovx5AtpMqdRXuN32bMBJR/v8Nb2Uej07Vv30I8nxllN+iHbgteqiUpUUSUbRke2wn90H6zJ1SfvZxfLUhvx+NhQFfcXAnp9ePcc8B0Y+4x6TlhxKaNJdxqzNClLmBivxOOkqchxvL5LNqzYLgMl8P1KMYHVRoYat40HVJp/Vqmi3C61FkyPzgb7uQ0iMd7/YVtSWZcgIJ3QFNFxB762Jtznma9Zth1AaVKnsEs4RqDz6j9e/g6KpGRvc6FxhJWaECaSlmTybOKDvfHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRvr3k3r86blELBcO29PyX4XTudKF2Yi/yBbylTfNT4=;
 b=WsMmL91y3SZINj+UD+oPjQWmr7z4TXztxy28QX80M1ZMXwUQELiaK5vT9lKEASMjfajgYFjyx4U6LVAeqyP/wvZLx6yvazdDBE4BV4tbnbBCGp6Oej6nz7Chc6gn15VRqE59CoUaHavFToyMw3aYOrKzt1JIV5aUWxVHYImHm7RbzgawRHOlWvbcIFF9YBIkOY8APH07OtjZlQXguC+t2ElOhvUXCxSvDdgpsLQc1pXpdBTQkASFmcux/UTZAjSqFhfLuqsT/VQVT0B0TKiNuJBALcxtkLWb9WwCm+G5wAz73dcrvBKk94GKoYVMSMDBmVhOvZbl18xXismaO34Jpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH0PR11MB4837.namprd11.prod.outlook.com (2603:10b6:510:41::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Tue, 11 Mar 2025 07:02:22 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 07:02:22 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] hiredis: remove runtime dependency on redis
Date: Tue, 11 Mar 2025 15:02:02 +0800
Message-Id: <20250311070202.229491-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0161.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:24a::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH0PR11MB4837:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ae38a6-4141-4467-ceb6-08dd606aab98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xNwtnDZY8jdsF9UJ9yYbQWjrDJR6zhOgJwl0Tls7BiZrk9bJ/vyTR+bBwKN/?=
 =?us-ascii?Q?PDdtELUP67sPIry7vywLOyh2Y0JzPB6auYjuBEThoZAc3VioewrgBf2eUBww?=
 =?us-ascii?Q?v26fxfPf7yydpeHMJjbcUZ3kIm6uQN/j1SWtNIaWLx71T6I/bLZyFp26ct4a?=
 =?us-ascii?Q?9tAno0XY7F+0EHgdVxbZZhT1Tec69Sxk8il8SUFuHByMsmOyGprmZo5Ul6nC?=
 =?us-ascii?Q?A36MsdszWpluFxFWZJTxhJfQXnobXYfSA6Ia1Z/XgV7uYzClIOVT6sXHxktk?=
 =?us-ascii?Q?CmEn2ss/i/2+LmwcFnLc3+yBQ3yGiY/Ocsmbo+eowpVnhecqBHff0mk8Qgu6?=
 =?us-ascii?Q?azWG4kCrG7h+I7Ak4jMKNr6dwMbvoybPaBbsbwBj7gQOttdsUB0cwZG1OCww?=
 =?us-ascii?Q?DHtRJJ2Hu+121GJkle7JStbFyU9JwEoJFTk39XcgJ5FtlMr7rCdoMtuVZYZz?=
 =?us-ascii?Q?SZKfd4dfVw81EKqV6s0vAHbJx4ztResIAWctljRsZxpVm4yu3PoDsXAX2+Ht?=
 =?us-ascii?Q?q+V6+7Ibwn8l6PXVW11786jtS5PFm4e492Sv3gK75+LTvFDiYgNe6Z3aufjU?=
 =?us-ascii?Q?aAa+1Ky5M9hu+D/68+MRSu7cGkm7EUijrue9F4Y/wJmEFU7/m3wfQZ6aQd4P?=
 =?us-ascii?Q?Jiwnha24fwAb/iZX/z5AsQjDDGUMYfv9J9at4iSiJq9DNLwM65Iq89eAJApX?=
 =?us-ascii?Q?M6l2EHJXf8nAZi3FZjF9ZL66XDzkMCi4ykeUliVche68bU/wqRgEOzDgBZh+?=
 =?us-ascii?Q?tnI+HvfCZc7ihPs+5fqZnP19QnAmxJb4texx+/eeBkR6WaXtvFaRfsW1kJcd?=
 =?us-ascii?Q?OImH/2NiotZlmIBEoqAZepl+WAv7PuWARyfiaPVc4XrBUIAZc485OVjwU0GC?=
 =?us-ascii?Q?hgjs60ElGJ/vlRKa6VwtZyXSSI7sUUFeGtaTrqa9LwvblVX9x71+9y4YKtB4?=
 =?us-ascii?Q?v9x7dbg8Is28oIuVrahdb9cPeFsWMc5lMybllZYAhAufMjziwaOC8Du6NmXK?=
 =?us-ascii?Q?qwLkIbdKVjMohWMYI2YTUi/d946fH31iVJKOLOfWLkMPrrBjbfTalUvT6cTw?=
 =?us-ascii?Q?X6m3szIjl3ersxYhjNAvnZR0Mgm2WEWNZ4Rz4Q7azwL8iMqPkOAqUevOBuoS?=
 =?us-ascii?Q?6pblMcSgHvqoRaWWAUACVrRpVFcqv02RdlmfYhGKFK4Jq9lzcep3nL1J8pY9?=
 =?us-ascii?Q?KDJhdvaz2o66WeEOXVihRxlTZSLaqDbCaeCmlZSNvx3lEUZoZx+mgAOYzer2?=
 =?us-ascii?Q?z8g2fbVhJj1g3xUqPJ4s9Bci8xH64RdvDNMiNLeXka9/GqeJv/MuVZNB4r3M?=
 =?us-ascii?Q?/lTs5hxK0WfO7F/6Vzbj6Fm9mtc1s2LqEOOeGLFta0kD3RsLut8/PWwu56WN?=
 =?us-ascii?Q?0w/iqkVHEqMOQrDTo00/TBBjs7MZVFWeDqAhhirxNzNuh0vbYIjHZFMW5IG+?=
 =?us-ascii?Q?+egjwJUH+ch5qLjH2j4H7P8JsKkUaqOm?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+dz2IyGFVXNJ43G+zazt8ZO+cjQs8WejlV6TmvTXTeBU/9IiUgCpNDyplko2?=
 =?us-ascii?Q?zj+QhA0lSh0Y0VyWSOhuRJIbLvu0ZzKaxYP7Mysbdpz3R6OPXFe9d5S4lD8J?=
 =?us-ascii?Q?fcvijET7eu4X88a1Hb9ZDPKxuR9wWUTmNZ60KjG0Fgamry1+/hClqC6x/jDO?=
 =?us-ascii?Q?pkh7Lz2mAB0IpQ0kOuuFKQAeg9KsARlK/VHbYhWWItx2MWGUyHO4OI9GPu7b?=
 =?us-ascii?Q?drP8R49O+ielFFh7vp/VR0C7JLbMTYKbVdHo4pxOPChXlun0/qd2NCMc38oa?=
 =?us-ascii?Q?t6IsxesrlDxVeDXvzv7WpkrwPzHmGgCLHrbDFXt4pOZwvTz9soh5Q3mjpg9L?=
 =?us-ascii?Q?hWebfDlE4lla1tPkc15d3y0fcJUfQPyqEUQdnOnTDf6/Oc2MP/lL+i3bX9nJ?=
 =?us-ascii?Q?1/WVGs9mCpENB+xSnp/eLDXl5Jus4huhOuruO8R1zdLEMIhcWMWkQR/8U2Gn?=
 =?us-ascii?Q?OwtN2PWO4/GyFoJCJx0AS+EmPz1lyoybxCQxFrUpcCMnGJuu9LDbECZoLrrC?=
 =?us-ascii?Q?o1eIrmXG8VfRVnXjh5+XZAjdnzRos93dc6hWfm9pl9d9H/LDtmN2Xp/kwPDw?=
 =?us-ascii?Q?2GRxbLrnDUgPTiv2PzOe24pwzUMEwh9nKyjh99/qEkbVGB/4IQ2+8ksOQOAm?=
 =?us-ascii?Q?snN6B+3yyA1OTSuyJkq+lv1KL4ouVvIdIMSX/42jakfkI1+Mqp2O8evGTwvA?=
 =?us-ascii?Q?b87xe7IldYfWkoB/aGRGl/Y2+ckwJGcuelB3RZUAkbGosMVddpGJotmmpMan?=
 =?us-ascii?Q?kkn7eko3XagbinjkBIHoQ8WM+9Z3hLIY7IC0FkoeTcpAmyVrWNW+baXPLE1X?=
 =?us-ascii?Q?sjjJesJjKX9rLPlQxGkkoPuTbZISNEE73c40lpqUbr0Rd0qiXHdfCOPdMkQS?=
 =?us-ascii?Q?x1c9V9GCoyU3BcvmDEpATylXiaYGbLHHZ2pFSFzAkExEPtrI+0Xj6nfmF2OU?=
 =?us-ascii?Q?UMyoSaxhX+zGe5jJ8SSt5d3Jwz5cXfoaWDJZBweQ4DeAuTqONqBb8jAhksqT?=
 =?us-ascii?Q?Z9TLv7VZQvtsFn4p9W07nKLxBNd414oQogaQFFZLrZv5hjUtlDHKVvDO0sZC?=
 =?us-ascii?Q?Af0g70dsacX9VyVM4vpPRos0xgp7b+tRKWDhwJB7I78oQ6XX5hj4juLhFtAF?=
 =?us-ascii?Q?185qwmJIO+2bF5W0x7tj+wAsF3eEdC9hyKePXWN4+O3IuR6ASZXcCQ9yleFA?=
 =?us-ascii?Q?Ri1/qphD0TTvrJygiOungGyLrfbKPQJ5yL6uFB4jYJUlcF5LGr6rVt1z/VYC?=
 =?us-ascii?Q?/xfBV6S2y6ZczN2ji1Xjh1ck36xYMosdrgivn2w0KXs/8FEjBs7ErUEo46EO?=
 =?us-ascii?Q?XzcFfLOrUwiBC5FxEQS2yP5M/fY2IbDp7ifSR927hXhud0dyRuI4CTwV9qFJ?=
 =?us-ascii?Q?uH/nJQ3/NN5M3/MVxUS5GT1wrU9d+8jj2t/SPVj72DE+PpFbshCO6HUjy+8H?=
 =?us-ascii?Q?l2ZM6XpYgcsZ2XGAzHbiMRA9BfflPqga0LPlqIvQrFKRiN+1TLQAkvXZUKJS?=
 =?us-ascii?Q?Bf2W3i5jFRcDSGYe+ww/SFCleHljRED56oKaIhmbg9CCVKQoJ3IY3hCYq8ZQ?=
 =?us-ascii?Q?IBl0t19d4Qb5f5AgzS3mGjbzzu5eQQtWVA7ItqTF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ae38a6-4141-4467-ceb6-08dd606aab98
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 07:02:22.2373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4KXSYQrl1dkp3gf2Wel8n3zeQ8ePMomhMLP6ljYIAEvtkHdUP/Bj+Xj1vN1bBW0ytcRQ4cGCHVoCUbE+TZDJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4837
X-Authority-Analysis: v=2.4 cv=JYNGrVKV c=1 sm=1 tr=0 ts=67cfe000 cx=c_pps a=OnljjeCONrlUuPUItWmgXA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=t7CeM3EgAAAA:8 a=MwoO3Ks9T-JRx2FT2DIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: PlsaP97SVNHADH3poTDNpCRlmwg_wobg
X-Proofpoint-GUID: PlsaP97SVNHADH3poTDNpCRlmwg_wobg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=801 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503110046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 07:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115844

Now hiredis can be used not only with Redis, but also with Valkey, an
open source key/value datastore that is fully compatible with Redis. As
Redis changed its license, many users have switched to Valkey. Therefore
remove this specified runtime dependency.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
index d081242736..93273919e5 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
+++ b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
@@ -35,5 +35,4 @@ do_install_ptest() {
 
 FILES:${PN}-dev += "${datadir}/hiredis_ssl ${prefix}/build"
 
-RDEPENDS:${PN} = "redis"
 RDEPENDS:${PN}-ptest = "${@bb.utils.contains('PACKAGECONFIG', 'testssl', 'openssl-bin', '', d)}"
-- 
2.34.1


