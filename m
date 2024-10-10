Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D2DCEDDB1
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 01:41:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.33910.1728524481539130781
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 18:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00130c5401=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A0EWoU024568
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Oct 2024 18:41:21 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4234ykvs0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 18:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPhS5U8Bnsp+nvmRhlS83Cj7/Ayv7/WjdwcUmBhCnKD2iQI0Z3Z7RP4HnNt7jNqZyWovKQZAZ0CwjvIZaNAHt92sHvHmgbDJglXwKSVHcuxAkN9QproK9WVG9vmsCZYFBwPmZMQiYp6nCr2G8RhqHshYi5aIrj7hTjcmGZIoaQXDf/WW4BxLQIEWQFSJmN+XZ0dH1AXVDQTV85A5G7rXs1o0K3gc66TXOg+o5RYR3Bqp5OOAbHhdsU2Pc1eXhr9QH1E/fNbgQaD4Kc5/fZHm+2G10DTaIfTZ0MXxGC39vhqsXOe39SsfXMyw62qbK9Dsip+M6PUADx/7TwEjoKWTvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+J9IV3up6IxQ5gwkE8WiKOrtzXwMp1dwhNo0osFQcdQ=;
 b=gqjGTJnOzzamJPLGv/TeNP9KiZ15HszejHKJ6B4Iq+UzGYmf88D4HkAYfshzj4IXqpJko5cNehBglUa7T3FetmDqaZzE2bSmmw+L7VnPAbsI2sILa8ST/DDy1zeogUjvksyC0LhKvpqX1rsRno15dFhUI3Qdq3hQsH78LNY87T4KjqYX2q9/ED5sp9XSHCWUANfwKNwwMNIhm2VvSPAPHOF8MyufTw9MpOY2Y0Up6dqQFU3UQgiB59KjjPs4dCqvmMQ7uQy/1yQ7FTqt2Ek0LFZJNGtcIA4F4TLWchqA/YcnhB1q9VYk/WT75hDKCs73PCVM1nBuzlTK2xprPwCB1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.16; Thu, 10 Oct 2024 01:41:17 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 01:41:17 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] fio: upgrade 3.37 -> 3.38
Date: Thu, 10 Oct 2024 09:38:14 +0800
Message-Id: <20241010013816.4084737-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010013816.4084737-1-yi.zhao@windriver.com>
References: <20241010013816.4084737-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0174.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: fc346194-42ec-4dd6-27bc-08dce8cca23c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x9DUyiaSVJ9ZEvEiEHAOtkMThPxTTDUoWWiQkSXPWxIHQissP7JCHNGxax9O?=
 =?us-ascii?Q?FO8y7jFa5iCQmM9f2crkt+swPjkETIUNE0k64UZ2XEliwAFtAbB3j7FD27U3?=
 =?us-ascii?Q?TTrLwroND6uirQZOVS9AOZ7sk/fzZLz5JA4gz8P38uNge+Bhn7BceeVJv/ou?=
 =?us-ascii?Q?Gweq3ig5Ip64pg53sKgrmPdlTLcFqTx7ClgSMq0rAvsA/QFWE/VlzGCsurOP?=
 =?us-ascii?Q?10rXJZ8p+896Yey0Jv8Qlf1gUpRkVgvuKFU5IgJikbWCeQOhfZmYXm9IwyUu?=
 =?us-ascii?Q?lPtH9tJytUccBD2/BDqxQBjNecp9Oxk98ZtDYVUHTQVmb8lWNfTavbsBE2c1?=
 =?us-ascii?Q?Bnp7swg58mLmSmInigeC4boC0TX+q7wC2YdpjnwQy9qB5TtT2q0XdC1wUqJq?=
 =?us-ascii?Q?dpRCr1eDegHZLkZaLhffE5tkmE/bBZlFcP4+K514u1glUkqjLSuvIWCprP17?=
 =?us-ascii?Q?qFvIrJHZR7QaXmlMolBqlJbA5BwBfsfShaic06u9Z4N9OHXPlZpbipZ0LMBo?=
 =?us-ascii?Q?20jIHgRiUusEEFUjVlLDYMHF/rbvfZRnhPPNwEsUX9DVvCHrmj7CVU9088lJ?=
 =?us-ascii?Q?RkT9upaCBzAeZWECet023GbHMMd/gAEBCq2TXj8Ebf/7bSJX65Mzd2hTb2UL?=
 =?us-ascii?Q?2ZjQNHILaR9XMYEz2wkYM6tDkuOapgGZY/kWuxespDJsqeMTlodAyfAQD3Rx?=
 =?us-ascii?Q?YiAwNVgWMOv1YYRB5EArNW2yqmAxeXhP24XCYC2X/pjp8b6H800Gnd1Las1l?=
 =?us-ascii?Q?VLbreEmszIAH98lsWLq1JQthxzjNiDNCrZfW3V1buLOJqF/QtarAOQuq8H1B?=
 =?us-ascii?Q?EYabKvZLhNpW1iNOgRul1wA4v4mIESZfNNAAHR1SAs1YZMTuDdIpJuHqozU2?=
 =?us-ascii?Q?+3/tFEWgHlEC1tJ2uj+s2WtZqiEe6q2KfDt/qFG3pYktV5KvumhLdSWJO6Ct?=
 =?us-ascii?Q?l7eXPTckwRECmWa+bm2QdIiQHZQLBUf5XTsdWADzxcVIMaQFhV8+SkhmDSeL?=
 =?us-ascii?Q?yX0TCONLGnRabWw/sDQ4lJdUbrE2P/ZK7i5TyeTqvDqUkcYSO+6zjtrL1xql?=
 =?us-ascii?Q?SgauScGxn8BmQRH20sHBL742n2PtqFLZxKlK7kvPbdwDmeaQR5jX7Z+cNueI?=
 =?us-ascii?Q?Ai+O+HCte/hRI3cbrxB48Hj6F+ExWqgFLiuVV8vu3TCyFAxNK/jcbiRXXo6s?=
 =?us-ascii?Q?JBOGth5ihgtjPw1Etmv+8h44t2hpPAVy9jEd/czgVbbSwF+A/b/d0z0gwriI?=
 =?us-ascii?Q?J4e5J4jt5oaCiJxureQ2h3LBao3iAqk4gcakvHuGG7vhxq+vlG5CuLwo6mw2?=
 =?us-ascii?Q?sz+VNZxsNIsb8YNJdcXA2fl8hTOfXFOihYEeomxd0DH7hQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gE087PYaRAEN3LM/OI2mEBgVnRjlT3JBea7d1R4hFqhtDUMPhqEf20ULMpPN?=
 =?us-ascii?Q?ZG8neHVMCelvEh7N+3pilPn/7xalNXV9zTsykr+DxfouKxxc+LfaqUmBQGpH?=
 =?us-ascii?Q?r7IrF4wTVG6Rcbg181bqPR3/dfe9dffaPd3RErfwE9ODPrdhyaIYdbiS8hPu?=
 =?us-ascii?Q?syEDm0oSGC/FDRYh/1wz8zU7TPzNs1dK7fegZWHJvWLEs8lkeCACcaxdH3q/?=
 =?us-ascii?Q?aIMjKuKAAZDzqtxWKy7uWbUbq/Hbk+Alvsny+kZQlhP8/e06AqQQCo2ozXrW?=
 =?us-ascii?Q?UvTLTOCQJ33wcC3zRu1wAIJEG7O+ZiK1uYYQRdF47OAT/0ttI0vPxmRKEJiL?=
 =?us-ascii?Q?DNzZg00T0haG2oEs0aawcLvsUVLniXGwX3dbgf0bAZL5VMVp3VDrO+Md3JL/?=
 =?us-ascii?Q?i3KyovuUuM2kynr6uSuOUY5qJzOFJd2CFs5CuPl3I+rsF5WuCyuleMS2qwq4?=
 =?us-ascii?Q?5RaKfQdVZc8shrRFREw80Y7sPB/tz2q+bmv1AVi3BYHSfDvHNFRqNdqNHOxA?=
 =?us-ascii?Q?QaR/L+hV6xJECWwvDPrZWqr7Ahk+V7yvvvSPZD3VsvTkSfxo0ozMlx3RPuTy?=
 =?us-ascii?Q?rzqDFZ+l/T071hOGVoIb3v0D0rFVu38rOVTKbJpUiKy2qADj39MKQb5suv0t?=
 =?us-ascii?Q?HuQq40v3oFQEeiDByS3v6aOUN6NcXY6KI2B/w/9uRKzuNsBfCDafKRELQldI?=
 =?us-ascii?Q?3NGmGA4KDfRTImT12I+BJpzMfNukm7ZmZNur0g2shfEuZO47NEuVoq09PO32?=
 =?us-ascii?Q?g5vaOGeErQ97xV4iqPv6txW8pgJDvp22cnBg6WpTisJTFGCQZf+7/tPHUDVb?=
 =?us-ascii?Q?Ot3HUJ++CcpM2iY+GfZI5+WWb/2f15bCcuM6lr/lWqCxJcAp1QjUwuiRDi2w?=
 =?us-ascii?Q?7hMcJTpbxunz2mUFDd5EIyNuPlhDuUfkWCPMplPIiTJ4Wbt4SzWeKboIX40E?=
 =?us-ascii?Q?KXQKewiMIVjxaq9pyyFivQRmz4IM/Frq3iuf5kCmI86rTuUB502vdiWhF3eP?=
 =?us-ascii?Q?R26sHC1rRYHuA6vFnwecXsFyxigmyCdjqc4szZKN8CZKMqf7Cv1VsjYAEiDB?=
 =?us-ascii?Q?9lHc6Qy88RQBbZ36mAtnWWyZ4IA36tsL8ZhKxNXaAWX7yMjAoVxXhN9ighN0?=
 =?us-ascii?Q?+9XgoRP7fjNw754nqy1d3l+IoV95rTvwbG1T1lnkDC4j6jq/34T13T3TY0Lb?=
 =?us-ascii?Q?rwl1wurAXvZ6n0HQQuIdPLyfWP2nxAUrk1cu9wsFLtuKjixa31wXfsUGcavo?=
 =?us-ascii?Q?OQeOqh9fG8oSTPOGDQPFRdu17nLcvDbj5ZI5pNM9Ii7l+TbErRAk+iWXEFQa?=
 =?us-ascii?Q?oVB0hWpYbFnIKXypRBt+n1bGaAdaBcUr+9fmBGfmzAtsfkC8ck/XPOsxB4BU?=
 =?us-ascii?Q?RGuuoG5NiOEACAeb+K4KcOCGGuDFdG+Ye5zww4YfPhbq5GqiVpdLmU5DeSyi?=
 =?us-ascii?Q?RHm3g4kJQSLC4R1VLKRAJDZniEN/yAyVCXaCzQc0AgtI7+6DWdLy+YLWjcUA?=
 =?us-ascii?Q?i0t4416AQggtP00EqlSkDNYZGO37B+BEBkIz4rOA8Kv3lGHQWy4pAOKXqV8m?=
 =?us-ascii?Q?8NEE+lPyoeWQO9hm02Ec1u+5xpHJTGZLmXMhBKsP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc346194-42ec-4dd6-27bc-08dce8cca23c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 01:41:17.5374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPReXK1X+dIA0V2eo6yu6pir2sB2x20tmJtkNdQ1TN3tTuW0nsDuj8gO+liOYJzIZIYBOG3fmrP2+ZUVUv7eqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8718
X-Authority-Analysis: v=2.4 cv=AKB5nO5v c=1 sm=1 tr=0 ts=670730c1 cx=c_pps a=F+2k2gSOfOtDHduSTNWrfg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=5gmefPSMmS3YnzIXUAoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: F0nh_gFmwWY1wkSuy8TH7r9xgKLPlKot
X-Proofpoint-ORIG-GUID: F0nh_gFmwWY1wkSuy8TH7r9xgKLPlKot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_23,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=802 mlxscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410100009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112750

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.37.bb => fio_3.38.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.37.bb => fio_3.38.bb} (97%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.37.bb b/meta-oe/recipes-benchmark/fio/fio_3.38.bb
similarity index 97%
rename from meta-oe/recipes-benchmark/fio/fio_3.37.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.38.bb
index 83c889a8f..1d1db92f4 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.37.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.38.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG_NUMA:armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRCREV = "9213e16d98b0e9d2f8d4f7e760ed0fd45c8960f6"
+SRCREV = "5af800ca20ea18193d2262a8191ae32e14d623f8"
 SRC_URI = "git://git.kernel.dk/fio.git;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "fio-(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1


