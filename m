Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F2BD216B8
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 14:30:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15036.1729002597475527281
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Oct 2024 07:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=00181c24c3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F5weUD004343
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 14:29:55 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4290r51n9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 14:29:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKSYdQbHNoxhStXA2qf3eWjTBwHfms33EaxQZ3kRkY7pPnX0QUyPXUTdPDi3G8Y5oXB+Cz7yfTdgpSVMtNTemBa9kxtVAnIB3caOMRwdw90+HOjK2fUPGtzQdlwZHFv9rNaAMIOS/zVrM6/iChA9kdicKQLFKRUvGz1MZAZ77lhnjCKnRo+Es1JhuQiSvld0gHtfySDnk2B508CplfBdO1CbH0I+agBABFmZ8IAz2bBwSep413rVIlfL0A6vz7V0ZStemVtCivyJUkmFfme7/l86SYVyDJL1Yn40S82tH2moLvjrS5T1iE8eff4wOazqNPLLW7X6V+U+m/CMUWMIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgYkIkJE2G99/G7czoExSSrvdv8VMh9zVreUR5B44YQ=;
 b=Ej2AT1bQZJ1wPmbEFnG36h3ifemUHg9sg7MAmWmNimU7UBhYPs/yih7ezEv3sZWbYGi7NZifGLD4wj8SNu6wknNsFkmZG4wZqig1QYbVRRXd8HLrEGG8852JcC3gFwAwVRVWHFbYzL+22m3q3IzKYUhWB9hczYK79tufZz6YtKh0scLviViN4XPdYeh1vesgU/MbZ625CyWeZhgCnu51IV4gD34AXqWV8CAN6ba7qTIGu+L9UN7rKZfVDpjXKDiWQJDN4LzSJ6q1q+OA6X9s0JmZSxo8/AF3VZRG5n094V+/i+4nOl527pB/2BcRjUq1Xe4XJDHw0Y8zaxC9iHC5+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.27; Tue, 15 Oct 2024 14:29:52 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 14:29:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] mozjs-115: upgrade 115.11.0 -> 115.16.1
Date: Tue, 15 Oct 2024 22:29:38 +0800
Message-Id: <20241015142939.719707-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241015142939.719707-1-yi.zhao@windriver.com>
References: <20241015142939.719707-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM6PR11MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: 3634a355-27ec-48c3-03a0-08dced25d4b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cKF2GZUfH5ntiitxALY48YNFoEs+00aOJrtL/WNB57g/bvY62zXEIuoRaewp?=
 =?us-ascii?Q?lFifw6XsEq4kI6tzdAGtAHaVxlL4hI8f7IcY1e8ee7DcGsY9WBQLMQ2+ylqU?=
 =?us-ascii?Q?e9nwrcktX6rd92KrZhWYJeAUiSyucWQ8ZbAttIHMI4BN95ouFWwxxBBownPz?=
 =?us-ascii?Q?GEW0hu8fyMUm4x6RaYsg9SIuFJu4TRg63XqRpVYUuf5Q5kd00U/1z24RoQsA?=
 =?us-ascii?Q?d+gtRl4tvpeCh6xqZpeeJAMHaPNUroIkk124/dTNvrhn9QgiXr48bz7FQdfS?=
 =?us-ascii?Q?oYr9RSAERSHs9dXVPx67vJL98kM+94As+waQWf+7bwZvq8XoIUwZl97+Fuzz?=
 =?us-ascii?Q?q7UCmovrPTdn/rUGDBol96tALctW7Sqwwy53bjMvfY0Wu8Bq83cs42uKlW4Y?=
 =?us-ascii?Q?Me/UIUx3hW7YnFWw37Dmb1+XmqouUaNcpsmHuggYZPIiEQWccHadP/BmQanG?=
 =?us-ascii?Q?h413gQyL5rYaZ8Fqdz53Eie63N2RKNkpsRYr9b/GlbHLWqJLbfvLYBmfh+yq?=
 =?us-ascii?Q?0wn1G6haeeXozQcRt8O1r8TExeGY7+tT+Y5KZOyvVRv9yrITc4f3R3pyus9n?=
 =?us-ascii?Q?+uu9GRh19LxBKJ2CFenIKViA/r+4ypY4b/R0NcYkCTXXX1U6CqgWkBdvz62u?=
 =?us-ascii?Q?/gKWP+Xa8s8P5FCzN7mSCttTAvnK4oCdtKhxhmbqa/dTYyBLZJULVjnqQVmd?=
 =?us-ascii?Q?9hpavqO4KlMqvBeq9Dk1jL6vxR1d0A7iU3BhxJmUK2GlaNZqPvcKtEKHjNs8?=
 =?us-ascii?Q?MFyaL4ZpcuF0R7rTM57IIsLZvBsdFv9xYsh7FKfkqgMd4wBrPonzYII0b1dJ?=
 =?us-ascii?Q?gL2s20iUQppBVzYwfP6irpurw90lFr+CBWeHcBsvO00uWYoPAu5T4L5F5EUt?=
 =?us-ascii?Q?BTtSD/7E/AmTpBS3tjJZCbtQ/mbYn+GARHIik+zFlZbOeRmQJWNW6BHjKvYf?=
 =?us-ascii?Q?n3Ryi+Tu4KlkBvMZLT2Axt/deOVKsYAdrPV1rNI72GaiDo1KRU3s5HOfRH/f?=
 =?us-ascii?Q?c2LPcPwjqP9Dzr2qDzkoYpd6AyXxxRGKt1L+s/AA3dZagEIt117LTawaMWvF?=
 =?us-ascii?Q?GCGqvdANyVaYZ29oMO4xvfmF/4Vectt5qQL0Lj/kGvN7m78ZwtB86rfpnV4z?=
 =?us-ascii?Q?JZOEa36DXLp35LYbKdEgGxQc/47IzAhQxz0jydmuBQqixXeM2Nv09mpHM7ot?=
 =?us-ascii?Q?QZNtqDbYg5Bu7FmTLFzsF/7HP5taerVpDu1GsUDiSZwkQaJocNtjDguKw/xL?=
 =?us-ascii?Q?53KqRRvhNZ5GZ2LybLgQki21dPX86dbzAJ3AbmRStVrFSq73na6/Haz6hfc1?=
 =?us-ascii?Q?RjmJgnxuVli6l5NcfUp0ZXL324mq+RU0UcsQtZo3P0AaeA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iaVPaK6mxcxWhI29NFGDw5oAcsz4NnFE2l1bscWZIUByUwev0hyIyKxRYSa8?=
 =?us-ascii?Q?ltmHp8K9MXrc4JbPF91MGz10YDYQqDwhHRjRR+/oICsEjpcgQnL3/f3bBOX7?=
 =?us-ascii?Q?5k6euoRCQfhr2carnLZbXNUKGNmQ67+L4tTU8T9dszv415WyXzy3kNMoLCR3?=
 =?us-ascii?Q?HzCHtw5XpdmiJW4V6ZQJvKfUspqxqK+EEINvbluIOX+1psWsia2XUKuUBhQY?=
 =?us-ascii?Q?YJkj1NGumSL6oU2wvvegHHe1fU2N/roSooJZgJVyTUIUmiTiHRRieQ4A3v1Q?=
 =?us-ascii?Q?XFBRjq7f8LrkNRgyP/f6tt0UyHXdrbgcnoESYQwkLR5F9kqTNLfMO+xln6L/?=
 =?us-ascii?Q?AXExpgn/0QwolQBtx+/DaiJXIM77s8oltUZcu/HARiotBpUUTVqOURZCkHaE?=
 =?us-ascii?Q?qaznURhCejka6zdyZBxtIf9bBxwVvQiduYawiBkZlnujBbcAQ0eZCkc+3ajK?=
 =?us-ascii?Q?IHp/E/kSwuJyacRgCxkvccMsqOXb6997md5J4KawQETlfgtkcFNDRgiazfNn?=
 =?us-ascii?Q?2RoTTnFhaNiFigLAqSIbknTiSybKZpRP8thHPcjxrBwYe4ecpIMIwHiCoOY6?=
 =?us-ascii?Q?0b0WiyoBAwCT1mfmDR2Uw388PV0SCLleg6yA3HVH1nqrsFvjAFwMNcDsnx2m?=
 =?us-ascii?Q?stBnAz7GTyKcnlPUvdGbjx4fMw4qUGCRaK395zo/LFX5ElJE9qCD9AFuid2z?=
 =?us-ascii?Q?86B0/X+Oey0nvgD7K8+e8Jzv4P/udSU9iG3hcyBHIlkpLf4Alm2cXRMX2R3i?=
 =?us-ascii?Q?a4QhqZGVHe9IUzCYWP/A066psmXsNPEnw1SlRK1K2x4sHbUenQeiJQUJl52T?=
 =?us-ascii?Q?hYrlfT8vDxMc82uM5vzu2BUOgUHaq3NJ31CnrAGDYfqlMP/OuqJql3CixT8Q?=
 =?us-ascii?Q?bx32NyTHhs2Yo/Xk1fEAuPNiMyIcET4ZnoMP4iWjR2Jkyr3uxYkP18ifgdu8?=
 =?us-ascii?Q?7nbc0MkBqV7ajZRm0aHG2tbygTXt8xenhvfR3KpCGe2oJaHJfk18woJStLB9?=
 =?us-ascii?Q?TNK6dN4ghOki5a1ZOaZ8IK+VRvW+oDU8zfqwjCp+cg7t4diRPQt9MFRpApM0?=
 =?us-ascii?Q?utoUhGzzPk4RVABw4Ot6oDe6BTz+MfWFw0l3xQ8N3mwYVyXYTpBTEEB5lQHH?=
 =?us-ascii?Q?G8IQJHB3CZarrbpI7rfRMS6oVRaiVPx9D4FNintoVLMpUAvTebAu6bnZ2xMr?=
 =?us-ascii?Q?5k1aYpZhj8XgZuH3veEiG06Y+mP1StoTvx30Zb2xXtj/XRZMtScFrACoGDQm?=
 =?us-ascii?Q?5VjrfSohhUeDfH4S4n2tTb7K885uep2OMfLfWEnagaLHztpr4ExiiIthXzTs?=
 =?us-ascii?Q?RhmVxS58e39QANQJKmj4LfecbKBrEqQ9qyM1WxTbExU1E5xyx8/scXaU39cm?=
 =?us-ascii?Q?kykaa5tl7/oLv8HHJDuibqaf6EjXN73yE/mby3KFeTqK4WNEnC9ZigtVJ7cE?=
 =?us-ascii?Q?qDG0f1v0rZExf02ytgMrkE/g+/nuSMlUFf/BuiOlmJWRxg6VxWL26A3ukJ7o?=
 =?us-ascii?Q?uIsOhsGw0LzBhBKirSXoST/LI8dkTe5IJzeVtqZ3YQGTTofX0yZwMUqxJtDl?=
 =?us-ascii?Q?Scz/UNjapegEbUfbhJYPef7lnJ2meoDVdEZwJy8h?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3634a355-27ec-48c3-03a0-08dced25d4b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 14:29:52.0626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VUa4Ii9aiQVeqMttp8XyylF5Xl9LRR5dZ7pz+LABCz8oTyuXWC4Ewg55+7DFRK1znCq3W8pyJUIUlBpCn01Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
X-Proofpoint-GUID: bFaJXkg5934Oh9xqTluPvXUQrHiz9iC8
X-Proofpoint-ORIG-GUID: bFaJXkg5934Oh9xqTluPvXUQrHiz9iC8
X-Authority-Analysis: v=2.4 cv=ceSArWDM c=1 sm=1 tr=0 ts=670e7c62 cx=c_pps a=6DIaztarb0XTwjBPIWoXxQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=pQs5aej7AAAA:8 a=t7CeM3EgAAAA:8 a=xNf9USuDAAAA:8
 a=tYXVMe6-G5jfjEBI828A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_09,2024-10-15_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410150099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 14:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112927

ChangeLog:
https://www.mozilla.org/en-US/firefox/115.16.0/releasenotes/
https://www.mozilla.org/en-US/firefox/115.16.1/releasenotes/

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../mozjs/{mozjs-115_115.11.0.bb => mozjs-115_115.16.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/mozjs/{mozjs-115_115.11.0.bb => mozjs-115_115.16.1.bb} (97%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.11.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-115_115.16.1.bb
similarity index 97%
rename from meta-oe/recipes-extended/mozjs/mozjs-115_115.11.0.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-115_115.16.1.bb
index f25c5a8f9..d235b252a 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.11.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.16.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://1849070.patch \ 
            file://1894423.patch \
            "
-SRC_URI[sha256sum] = "16be46f16a356a2b8bd3541805a24c8a2acf6f077cf8a65859689685c26025e0"
+SRC_URI[sha256sum] = "c3bb5a210738ca0f8cd26aa53fc4a07560db079c06cd0421cf35af4035029367"
 
 UPSTREAM_CHECK_URI = "https://tracker.debian.org/pkg/mozjs115"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1


