Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9B9CF8865
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:23:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36785.1763652178198705842
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 07:22:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rkgpiIVh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34199b9cbe=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK7odAt2284243
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=H716pVibRCDCD3955nSE
	yu/EdaMNJvTLmrNgoJxQgl8=; b=rkgpiIVhp5SEZgrznOWd9dkb3aQmRbZqH9su
	3SGrJhbJ77qVZY/4bcWyDjdwWEDc9Po4wr05j7xKWyW4uUMf4kfwm1qe0bkUh+/m
	5dtAKOMF492PkAcE/tKX9sK37He8lelJUqZxvDqrTSgrLqGbT3e2qtClAHGdAA7f
	keMB30F42aLTAAF8fCvW/c3dD8rUljRWQSu/QfheZiMYmRo/6Sr2oLoIoMJnF+z9
	uPzVumca+o9QVcmsmdKwkjmvO77SKJIApX0TNfsYEx9zSp3RKKG7cqaOHWCqpYJx
	/j4kXf1GYxL5YN0dvz+KjgS/KaK4ujAZ9FcKvCSUHrKklfoA6A==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010021.outbound.protection.outlook.com [40.93.198.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ahrs3rrg4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:22:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKECcGSlFbUCFpSUK2Y9+LKrEwMdYA/Xy2FUUPDjTBKub0KucqoJMOrAV7Sz5N7TocDx+pqyaZInlUzOlbNFIe7PipcvITxoLE33fOBBVcGoC2sjoupQsMUhHX7tpMJvFiSXyju79deAoODAXCHxdRcG0JWdbxFQndzuyrxGsBfi1fWhSMwkgSXl7rFi/Fs1whIffpjCBlEIwd4SYJhi24WZ0/qX2pQKoUN7awSBEGy0Hr0Sl1JCw1gN0bZIcjKGxXJRbdpgJ4Lqlq4z85TM5a/9Fu4taaZWk3V9nT8lY1zzXyCxlmZ6MEuEbCbEJsPNjc+OlxeeTzy3PkYfXUr7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H716pVibRCDCD3955nSEyu/EdaMNJvTLmrNgoJxQgl8=;
 b=Y0/GulIYZXyd67PC/uPrf9bN9O0n98T8MDNW/v7p76OhhHsSSrnMIlHj26zIZYXKyIdQmfZkOdPAdl+i0dqYxeHCUMgbcFpMwJxD6/+7KOLO8t+LxCimHOLiWxeRmMX6J/oD1szp5hU63zExawX7uKHXkIa/oYEL2qLPXY7V8q5Wucjg/LYnLVjotJQwciTLHj6L9Gg6pihzIDey0tONnOs/XZNtsYeippuiskeXqJp/Rc6DMMSU1BMiLUP/oDBvO8Eb/WfUXvupvCfvYVwRT3HrY+vQW1tFMsKiW6Lz8YsEtSHDMPhnsSJYKXmQGzvxvEBggqHioBJK1mY6BMLUdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 15:22:53 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 15:22:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] vsomeip: upgrade 3.5.10 -> 3.5.11
Date: Thu, 20 Nov 2025 23:22:36 +0800
Message-Id: <20251120152236.2980604-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: e4df75ac-6e04-4615-97ec-08de2848ac71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uvB+xVXA2UevdvH5pH84YSi8wpwcwuVXNdYPi/WMhRccMrGZNdhvH5bq0Ejw?=
 =?us-ascii?Q?c/PLDMLEOl4+6xrHbcOquhJ5CVFwdWoxEH0Y6L4EGZ742WYSYMB1LDzUvYdS?=
 =?us-ascii?Q?7Mee2DMZTPgtlYrQQaauXT0pODl7l3wQRsPmjNWvD6OCD81iRLFskEgpRJXP?=
 =?us-ascii?Q?cSdWrmjN+zZBLQ5AgWEvMn7irojWWL9ekFZJcZ39+MygNbVSdXCfQ7VnfH8M?=
 =?us-ascii?Q?QzICw2fFaHiTGSp0ZEnlojDAy5cUhRsYdqKlhKC+o4EpjMh6d3GidHnc6kT5?=
 =?us-ascii?Q?2NZlv7BIP8DzK6OXZ6I46Gpj7DIzbJzjGnH52UsZh99wMHEqlhWY4FOzRPeI?=
 =?us-ascii?Q?NdIC8Fz+HSUSLg9qD2oSkw2f8pZSWAc86c561MqIwmxPR4hIdsaWUumpo88+?=
 =?us-ascii?Q?DM5iHPN136oJ7iXEyJ15UieEAlbxo+FcrHAO+b+TmezJoXsC0f5U0i8K+JV1?=
 =?us-ascii?Q?Au//oG3XOg8R0lJPHbTvSFVJEH4EiSpC9PH+kGPvuKXv3hZu0kHFjC6kxX4x?=
 =?us-ascii?Q?WmvyfGbnKm98FSFS11Pk68mgo9WfogmP7NmNAQiOayzlA6HcwgrgIKldTJdq?=
 =?us-ascii?Q?UCvTSVRGriX9UNRjn01Cj2ym7QfqIOfT7CXr5K2GsK/i6CnQTmvUTL0S6eYF?=
 =?us-ascii?Q?ZC1kIFOE+huxMIn3dgBhB65HP61qtp9Ez1Wd47pb3DyZX1I9YAvTJMLIzpJH?=
 =?us-ascii?Q?+6di8p1GGrQPbj95l9ZNFmn5U34VrGXQ5J2Q8JfrIgtU2VyoeL9wERHO1Rs6?=
 =?us-ascii?Q?k7ohC1R4n1RdCARKjdQKA9Kbddv0xG+iwBVKV/YVt8cgL889PkZUrjFcHq32?=
 =?us-ascii?Q?HUyANl0HpWo6msKHiikzIlE8mxUNMAdf/j/iICwtNepMOXdhPyUXXJ1Q3/5F?=
 =?us-ascii?Q?s2s9V+g5W/aQ8WyycGC5qkLGsHlzqPqDi6P/2umcw07vDPbzJTu9UJQMuxKs?=
 =?us-ascii?Q?SXejc0MIMrnj+g1qP8I0JdC193tE5lN33JezVv2bSZZKkFjXsREZ7d1LsOks?=
 =?us-ascii?Q?cj38rCCtuG+YfnK8vnQFXu9ne/dOwjK2DS/xMxvoNlCMDmjzpIllG8UVDC+l?=
 =?us-ascii?Q?HPK+jV8xyH/CVMm7/Ky+jx7X38f9Qq+TU+imcS4Wu5PwfN2kW+1YbQirpeZD?=
 =?us-ascii?Q?m19g9fS1fOmypvNvTHTi/4+o0AEkLsnxXfxX+PeiOmaQv5L2/Re0c29ydnUP?=
 =?us-ascii?Q?9EXUOFXjJ+x/NwE51GV3F9jhUQf4gJP4fcdKRQFDarYqFw+wnt7fHR00RHTC?=
 =?us-ascii?Q?cVMHxGwkT/P1zwwxHE17GeL+zo+0NXx/sn44M58ttg3W78mgVR2ab88R4aGt?=
 =?us-ascii?Q?sUMDTo+OmE7FN0KK/siEdyo1WVLmmXDaIXrJPkMpcSCVebqQ/pLu6mmRhwg1?=
 =?us-ascii?Q?PZJAUFrTYRu1B1SI1L02h8gw5gt81yLBAcCTPee7/R18EpnNAPqI7R6UMkb1?=
 =?us-ascii?Q?IR4jcNZ0DpFTpGmHwJwh7foSEsXzjEhuOmoOB+nQez/k308irViGEc8TWaU2?=
 =?us-ascii?Q?NaXS0V2bAdbKLtQNLhJhWLeqtmgIQ5uxI8hadK1qV4aLUmxe7NYFbvlGug?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ktXFMhSkh6OsJscDtQ3seKmTWF/6WZZu53m42wcGWYpZ+csBkbj47SgMCfDO?=
 =?us-ascii?Q?sfk3ITlDde2r94t7/ceC9BytNff83T1e0s8ZBqz+fJliw8peT6lrRFOblpsR?=
 =?us-ascii?Q?MnpfEyrMt8tXcm/Og6y7FGRGYEbfaGhd3+psnK26J2sWraf5D5MrHqmZuGdQ?=
 =?us-ascii?Q?bbc6vsT2n9dbzkHmlb9i0P8fj1Y0WBb0//pjJkbRzI4V49AX3aZlYq1PqUoD?=
 =?us-ascii?Q?kbioplJ1fUZeFmn5rRVaIl6EEEoFUVMZhLd7Ji9jSRMVAenz7H54aqZBp5wl?=
 =?us-ascii?Q?zJTwxw4NQcFYhE//gqzRTt2yjRQJcXlTaGsNHWLNgr5KcBpVO2etnHxQFhKw?=
 =?us-ascii?Q?BUZ3+ZkwXreV0uh41Slg6alLmt9jFZg5Go5KV4cPFUT6VoWB5jSjXcgGU3v/?=
 =?us-ascii?Q?e+0/6DyWuTt8PpE2Hl2wX7uI/ORJJZg+AMp0ETjsbt8eOPM86gXN4zJSJOeE?=
 =?us-ascii?Q?KK7JqIYRLtWXLHy+c9PhliHCKOVqfvX2kWZbj9IWFpCIlCeKSu6sN9G0p2Ct?=
 =?us-ascii?Q?LFlUGrECWdUaGdjcAaoCx7qRRvcIe8887AXAyIoEYqXSwiAWSSYlwqhcsvz2?=
 =?us-ascii?Q?J3SLp+dENVp5p8Z57ww5q75De79veSqO7coZ71NYqZ4hSgVwmrgJbsLF46Kc?=
 =?us-ascii?Q?nvonLJ9sa0ec4Hq0nEZtcBygB68jvWUw1eu7i/dTegPTBQFTJTsK4H5HfBMn?=
 =?us-ascii?Q?//kDMM6O9sBvTYLCoJH2AW7+pzWVWenAEHhJcXhSEYPEbNtNoGl1AQHHa6VI?=
 =?us-ascii?Q?ONmFoliV6AoYdCvkxiSyAn0k10ATfAP9u0IsPwHsD9BodTY4gVc7kJFJMiPY?=
 =?us-ascii?Q?DRONLfvwkNAGIeDOFxTzrgq5Qnl8mMImPA31aPlbFl83xtUxZwSbAKuYD2Bd?=
 =?us-ascii?Q?54gAPGk6C1GPFuCZIn6UmbyWZyClisCK3Breoq6IX6Ut9yxZRJN3xonC3CTl?=
 =?us-ascii?Q?io5tZyEskaPkuz/iEgsW7tC4qtg85ELYseq4L+hH8Px9aIjXiUy+E9Ec6Dup?=
 =?us-ascii?Q?uoGm3XTBb/UPNlwi/a8U4zAG1OSJJ+jQcTzWkcFpm5n9f7QdSnu/Y2MJm13M?=
 =?us-ascii?Q?Cw//6Ps6PTMOxD6u4p2S3fhHBkpoF12uvBHG9ulm3cxO+ma7//GTiXOTfymL?=
 =?us-ascii?Q?npq4ii7FlGQiTj78/vA5UlGGGjeHuzzv8ju1nFMkmu90jwQzSsmxpnTPqPVs?=
 =?us-ascii?Q?A7Yn3ajti8jT4lA8Ptvz3vJp4glXfCGDaEQPmC1EJ/Mau7rYfEevQKoKj1xB?=
 =?us-ascii?Q?B4l7c0qxUD7WOZNLfGZ7pp6jIBS+bbR89QhKidSyzVJQoG58J1blj/ze8CCw?=
 =?us-ascii?Q?+RelyTqbx0V4ecG8RXm09IJquFiH1WWql6fVYnOs/rixcTeJJZMltUaM64gG?=
 =?us-ascii?Q?VBX2fBWlZ0N94Q5fOFweMhNPJeKEoAtKeBHPtZoAVzVSlGgNC6Pbvrpslo7R?=
 =?us-ascii?Q?UU3Yy0ivRmXZIkRI+lFs+p7ViHIicef01+wjUDLUmv0fUCuNg4/rptdPGBYa?=
 =?us-ascii?Q?bVJkHQfoq4UehdAr+zjXwARaXWlwi+DELiOvmV+xUbBLx8+uxCAOQm6gLw8k?=
 =?us-ascii?Q?EktFNqt5pRnDprFeLriRuj8lxaDhsJYLC3VH2Mmq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4df75ac-6e04-4615-97ec-08de2848ac71
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:22:53.0835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZHlY8p0a98ETDYoKtf7dHi/QiFWrWS6oFz+nZ+HeLutTGS0cmrGFdY8UkG6de7lNG3OD+wa7aSDGuM8ZFeS4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMCBTYWx0ZWRfX/Ci99M+DP/nN
 ftZc08/bQRDqNEuIUK4saJSE2YSMRS/PthSElkLfv4LprUL/YoMWm0iUYliwDDDiuUNyNYL+k9n
 /UyyKG8WNk7BrfZjl9S6jN/BrucQcQZCsWu7jMK7entNP/AYc2eueJ9Uw1MQLO3mFfZ9gPY29QU
 qU+feAWiRq8U5ZN/w/3OsWYacOdBALLGmCY8xAtW7IaWbpXSY1D6X78x2LuTFYRsHvphJQiB6JP
 dN6blfDnzZEQTP256WmznE0CL47dhRU/SKN6LRkDrBMLV5XC0mRYGfNLhPY2mlytDemYjAYqWr2
 issnrx4so55S+6Ay7JUEnjDksTiB41FaHbjB5v8WiaLqR0EJIDoJ/z9LtwhYOC6B4xBHwJm2RIA
 iyxRpSsj+f/TCgZe/DrA+3I/EawnKw==
X-Proofpoint-GUID: b9mHqDNowUAz9YvgKAhhcbeKOcrw2okm
X-Proofpoint-ORIG-GUID: b9mHqDNowUAz9YvgKAhhcbeKOcrw2okm
X-Authority-Analysis: v=2.4 cv=f61FxeyM c=1 sm=1 tr=0 ts=691f3251 cx=c_pps
 a=4YE3MzgntgO4dypjGrF/tw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=pQs5aej7AAAA:8 a=t7CeM3EgAAAA:8 a=Vj5sHP4knJKglWCS0rcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121937

ChangeLog:
https://github.com/COVESA/vsomeip/releases/tag/3.5.11

* Refresh local patches
* Fix build with boost 1.89

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ddress-from_string-with-make_address.patch | 19 ++-----
 ...8-Replace-io_service-with-io_context.patch | 51 +++++++++++++++++++
 ...ts-CMakeLists.txt-update-cmake_minim.patch | 40 +++++++++++++++
 .../{vsomeip_3.5.10.bb => vsomeip_3.5.11.bb}  |  4 +-
 4 files changed, 99 insertions(+), 15 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0008-Replace-io_service-with-io_context.patch
 create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0009-cached_event_tests-CMakeLists.txt-update-cmake_minim.patch
 rename meta-networking/recipes-protocols/vsomeip/{vsomeip_3.5.10.bb => vsomeip_3.5.11.bb} (94%)

diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch
index c25df03d3b..2c96c4945d 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch
@@ -1,4 +1,4 @@
-From 47b976736e4f57447339081ab5a40435b3b2d5a8 Mon Sep 17 00:00:00 2001
+From 1ca5cf52db05a44e5e469bc394c0a1b32fb943f6 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Tue, 4 Nov 2025 22:10:33 +0800
 Subject: [PATCH] Replace address::from_string with make_address
@@ -17,14 +17,14 @@ Upstream-Status: Submitted [https://github.com/COVESA/vsomeip/pull/973]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- implementation/routing/src/routing_manager_impl.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ implementation/routing/src/routing_manager_impl.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/implementation/routing/src/routing_manager_impl.cpp b/implementation/routing/src/routing_manager_impl.cpp
-index 3723fe5b..8a252c0b 100644
+index a3dc5242..7b9619c9 100644
 --- a/implementation/routing/src/routing_manager_impl.cpp
 +++ b/implementation/routing/src/routing_manager_impl.cpp
-@@ -1404,7 +1404,7 @@ void routing_manager_impl::on_message(const byte_t* _data, length_t _size, endpo
+@@ -1421,7 +1421,7 @@ void routing_manager_impl::on_message(const byte_t* _data, length_t _size, endpo
      if (is_forwarded) {
          trace::header its_header;
          const boost::asio::ip::address_v4 its_remote_address =
@@ -33,15 +33,6 @@ index 3723fe5b..8a252c0b 100644
          trace::protocol_e its_protocol = _receiver->is_local() ? trace::protocol_e::local
                  : _receiver->is_reliable()                     ? trace::protocol_e::tcp
                                                                 : trace::protocol_e::udp;
-@@ -1442,7 +1442,7 @@ bool routing_manager_impl::on_message(service_t _service, instance_t _instance,
-         std::shared_ptr<endpoint> _receiver = its_info->get_endpoint(_reliable);
-         if (_receiver && _receiver.get()) {
-             if(!is_acl_message_allowed(_receiver.get(), _service, _instance,
--                    boost::asio::ip::address_v4::from_string("127.0.0.1"))) {
-+                    boost::asio::ip::make_address_v4("127.0.0.1"))) {
-                 return false;
-             }
-         }
 -- 
 2.34.1
 
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0008-Replace-io_service-with-io_context.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0008-Replace-io_service-with-io_context.patch
new file mode 100644
index 0000000000..db0363ebc7
--- /dev/null
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0008-Replace-io_service-with-io_context.patch
@@ -0,0 +1,51 @@
+From 4b2d82748eaf53a700002d05c6629fa6f5df3dcf Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 20 Nov 2025 17:27:39 +0800
+Subject: [PATCH] Replace io_service with io_context
+
+boost::asio::io_service has been removed in boost 1.87. Replace it with
+boost::asio::io_context.
+
+Fix:
+test/common/include/common/process_manager.hpp:10:10: fatal error:
+boost/asio/io_service.hpp: No such file or directory
+   10 | #include <boost/asio/io_service.hpp>
+      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ test/common/include/common/process_manager.hpp | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/test/common/include/common/process_manager.hpp b/test/common/include/common/process_manager.hpp
+index e09d530e..23731785 100644
+--- a/test/common/include/common/process_manager.hpp
++++ b/test/common/include/common/process_manager.hpp
+@@ -6,8 +6,11 @@
+ #pragma once
+ 
+ #include <boost/date_time/posix_time/posix_time.hpp>
+-#include <boost/process.hpp>
+-#include <boost/asio/io_service.hpp>
++#define BOOST_PROCESS_VERSION 1
++#include <boost/process/v1/child.hpp>
++#include <boost/process/v1/env.hpp>
++#include <boost/process/v1/detail/on_exit.hpp>
++#include <boost/asio/io_context.hpp>
+ 
+ #include <iostream>
+ 
+@@ -97,7 +100,7 @@ private:
+      */
+     void spawn() {
+         std::unique_lock<std::mutex> lock(process_mutex_);
+-        boost::asio::io_service io;
++        boost::asio::io_context io;
+ 
+         // Handle env vars
+         boost::process::environment cp_env;
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0009-cached_event_tests-CMakeLists.txt-update-cmake_minim.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0009-cached_event_tests-CMakeLists.txt-update-cmake_minim.patch
new file mode 100644
index 0000000000..ad68b5354a
--- /dev/null
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0009-cached_event_tests-CMakeLists.txt-update-cmake_minim.patch
@@ -0,0 +1,40 @@
+From 7dec71178aee905fac28712594f91969c6070b81 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 20 Nov 2025 17:26:27 +0800
+Subject: [PATCH] cached_event_tests/CMakeLists.txt: update
+ cmake_minimum_required
+
+Update cmake_minimum_required to make it consistent with the others.
+
+Fix configuration error in higher versions of CMake:
+CMake Error at test/network_tests/cached_event_tests/CMakeLists.txt:6
+(cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+Upstream-Status: Submitted [https://github.com/COVESA/vsomeip/pull/977]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ test/network_tests/cached_event_tests/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/network_tests/cached_event_tests/CMakeLists.txt b/test/network_tests/cached_event_tests/CMakeLists.txt
+index 4a68ae29..a2fbff86 100644
+--- a/test/network_tests/cached_event_tests/CMakeLists.txt
++++ b/test/network_tests/cached_event_tests/CMakeLists.txt
+@@ -3,7 +3,7 @@
+ # License, v. 2.0. If a copy of the MPL was not distributed with this
+ # file, You can obtain one at http://mozilla.org/MPL/2.0/.
+ 
+-cmake_minimum_required(VERSION 3.4)
++cmake_minimum_required(VERSION 3.4...3.22)
+ 
+ # Configure necessary files into the build folder.
+ set(configuration_files
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.10.bb b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.11.bb
similarity index 94%
rename from meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.10.bb
rename to meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.11.bb
index 0455e23caa..e8b72743ec 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.10.bb
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.11.bb
@@ -17,9 +17,11 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;branch=master;protocol=https;name=
            file://0005-Replace-address-from_string-with-make_address.patch \
            file://0006-Fix-scanning-64-bit-integer-types.patch \
            file://0007-Do-not-treat-warnings-as-errors-with-clang.patch \
+           file://0008-Replace-io_service-with-io_context.patch \
+           file://0009-cached_event_tests-CMakeLists.txt-update-cmake_minim.patch \
           "
 
-SRCREV = "c4e0db329da9b63f511f3c2456c040582daf9305"
+SRCREV = "f58ba578c8c04e02dcf08d3ebcb9a71ca1e203ea"
 SRC_URI[gtest.sha256sum] = "65fab701d9829d38cb77c14acdc431d2108bfdbf8979e40eb8ae567edf10b27c"
 
 COMPATIBLE_HOST:mips = "null"
-- 
2.34.1


