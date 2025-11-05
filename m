Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B90CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 16:55:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14584.1762361745877873068
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 08:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QWD2vajT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34043ea9ca=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5GCJ5i057545
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Nov 2025 16:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=4fpNtE/B622IWBD5sleO
	I76a6NIsVdZjZ5w9yaf1b0o=; b=QWD2vajT7niizo02ZQXC78N9qmB3KoWMLNeR
	MGwh+Ob2ir7pLbaF8I7Pf2vZyFGKdhdjLLsR6WRJx58YTjHusUQpXHMjfZnR53ia
	cPDrd4GhrBMRpnBlzPirAt9igsZL8KoVtUluFNi2KiPs9+Qx5x7WR61Pv9poYqm+
	iFSX7iz5ikIGM9mBHZ7doAZKxkdYrGdqwn83jcAcDCwXNF/yjdj4AsDKI0DSnZ19
	nVy/HfFhgJV1pwuhg2kJgA5DAgbNtSPxsRrffUpKj/61F5gAVaCtwnop6LpXw1NI
	kKZSdEkRHrtdWK5A3QH0qdpDeZTb2ajrbElNv6m5+2tscoFCWQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011040.outbound.protection.outlook.com [40.93.194.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a89w7835j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 16:55:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tw9JP3vGP1O3mKVj2wZyUY8atuIndU+O6vgYZqj+fLspUESdmhXZEZTe0vxdTwNRFm9hyL8a2DVU1OllHJzslEVYMy1vZaSgkzCePtWFobLa1s+/Y2q6hxXMsBIc4ApsmeJ6ya2hb1CjLrD0o9to7fhK3nlaGkDhFn4XaFQlykYVLmgpsm9uUfb83emkqY6pi73EmayP6XQDrhak1O/vbGOqeEooS1EDE8C2sL8KLEBX9ju1UGGvtA3jqisQBmYlT7CwjH8UXNQHV7D3tKemHeqj4eV9sdpkTcQcr3ry+JBYldD7XwMV6MyloR/9SSyRoL5KlKQAhNI2FJr5b25SQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fpNtE/B622IWBD5sleOI76a6NIsVdZjZ5w9yaf1b0o=;
 b=jJp5RAOmTF/olqfpX+DcQ/46mdaiqmVVCwlAYS/E7Ly/BI9pKiw8HPjHuSRcc9Wc2Ub1T/6J7eaMlfT1b5vu86dpnza6jrPOouwlVv3XdTNnFqsNmTEfKnpAvHbxSdlkrjeu4g4HiHqAMnx5cZLr1Of2NoMmNtmtE39C3rRiahzdgqjM02kaCMkYyaT0DW3jBEPl3ucb0eItDUSsbkcE+4sDtpXdwQffJ32fKTVCLhcCqTbxW7+agZJl5265vMN2YW9uHqtOZ8xmwWNVtC3XbYZeqd39EazLsYoVnO0kh+tZTPDCE7ra305JqJcqhexWKnbYLC8v5DjLZaIkKbxGqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA0PR11MB4621.namprd11.prod.outlook.com (2603:10b6:806:72::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.7; Wed, 5 Nov 2025 16:55:42 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 16:55:42 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v2] vsomeip: upgrade 3.5.3 -> 3.5.10
Date: Thu,  6 Nov 2025 00:55:27 +0800
Message-Id: <20251105165527.4023907-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA0PR11MB4621:EE_
X-MS-Office365-Filtering-Correlation-Id: bb50ca7b-ddef-4c2b-39f4-08de1c8c27cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K5siigI2ji2Kn4QnoR2FxbItAyFSK93Z7u9DGlN9l4G2P+gQUJMby92mk+Ml?=
 =?us-ascii?Q?m8TQvpN+wAZD8IpYGjcpk4pHzzHjvK+6eIrW1/Ck9LtZINf9D8qGd9hfMAsO?=
 =?us-ascii?Q?1mhufGbw7sOXD50GVoWhOlG9VuCI6+2ZyA5muYqAvyuxncsDXzE7RDEGA1IZ?=
 =?us-ascii?Q?v9hNi+TnnvwMCW0Pi4DIYRj5YWQUxQFyE/SadZeuXw1Ti4xOXbFKEe3pq6fB?=
 =?us-ascii?Q?eQ0kof5/R/iUgsoArgHzWdKAJP3wvOCVQJD7Btq8C6VxrVRtC6QTqhwV1/uB?=
 =?us-ascii?Q?1R5ceUUOcm1OGi9DvE4c0ve6Pg6qKOY5XWgs8qpfj006xCWzJCpovpXrtpDP?=
 =?us-ascii?Q?9a5rQiVbY63QmlWYE5p7R+RdmI0iUyiLifnc4ka+VBsL3lqjA65SC29/dUsM?=
 =?us-ascii?Q?JD2xUpcePfeo39Dgoc6afHbgfAY0CfpITQI5IasqcfuFAIqXxnKn28mW1Qv/?=
 =?us-ascii?Q?wDTkC4p8mr/pzpMCq3xDU7/JS+Ipc1SFjpx+c5dWo4aEjJM4jEcTbxkiqwCm?=
 =?us-ascii?Q?r5KEb/jezqRVRf4p2XkzNPRzAv2bbfH2kwICDDh2TYc/LKI3oIt04re/WDmL?=
 =?us-ascii?Q?nSnEqkoIituF7EHdiRJzXJj5foE1wuyRjV/0Gc/ZimeQWiMbv1P1df8/Gce9?=
 =?us-ascii?Q?9sguEwLtBM3wLOfH93UMCVmEi6J9DiaiKM1590ze6qhfUxIWJ2cizxb7UiAl?=
 =?us-ascii?Q?QFUqiVeWYoKsGMM/QBKpq38kU6J6ny7UXzq4jxIgLZqB6hnYTU0M/zJ7batF?=
 =?us-ascii?Q?soreS1MOf15q5aT7DGfepnp27N3CuR3RFMHw7yZpb+ZQDAzAY2lSu+Ll5MLQ?=
 =?us-ascii?Q?WbkjM+hSqX3yTy+AzwGuzJ2gqyDcw4qxN8kujtRJ4WzmRr4cEB6mdt0k0NfU?=
 =?us-ascii?Q?lfs8aIST+4T3mFl27I68eqoL3nawbk5IZQWYNurJkTMVMuJet5BSKygBerd3?=
 =?us-ascii?Q?YwJ3usOssb1JJZ8vSgMUsEliPHXZslhg3Y5H4C0DtrXBgvcCXHV0cXMv5L66?=
 =?us-ascii?Q?w8Yr4X4wM9AmjwW++JwIFlT/cnafenyIXhcxxYPUBdvQTRyGbeePNC2odxaR?=
 =?us-ascii?Q?d9lW0cQBd9OCWKvE4ZR4Das4xqduiYVpaEgmrAIpuPVN/lJj+MZ3APfHVmnc?=
 =?us-ascii?Q?MByiRctMnXUmRKd0bLuDX9jdi9dPt5/0IyieDBm4QmveCwM+/i8zKaFS1U0D?=
 =?us-ascii?Q?XAyUgcou+WOt+udzT//CHaQmokhvxMe0hh/taF5kRJ0psfKdZv/EMgQvIxzn?=
 =?us-ascii?Q?LL0KxmcDDnXh1CxcUv8gkgGZJtrmFUf6WLMdZACuz15SaNQRdgqoXl+vnXMQ?=
 =?us-ascii?Q?IZoF6NnLSkx7w/+bITmy8lJ32CTrzlOKEKR4ZFeut21yCg5JbKO0B6vvYcrF?=
 =?us-ascii?Q?QCPWqkogHD7sljiGS+JpqWqeKWUNP8iSse/hgJAztHJk4PLgYdq/HsIczbSV?=
 =?us-ascii?Q?+oCa+B1RY0GjISz9D6hB9K5cmjgowpklo7h7FeJrMPu8RRVD4J/r/32BJghn?=
 =?us-ascii?Q?7cS4V/ix/vbiqQw/P4aDAr4BZTIW/bAoqtXR4jYJscG49UwrPlfxF2WB2g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eI/ApoU0cvmRWIrEtnMl6vy/JHj9JbIRmxoBx+Nbt997jErS4Ec/GPEq6S0R?=
 =?us-ascii?Q?vwhpEbiE9HbbIgFJOM9EFSClWg9oCF1EnQO1FYnkwayttgEboS58SE0oT+kn?=
 =?us-ascii?Q?Qi3Mqw5LaPP/OR4xxTPk1Hk4GwohEp0nvT7c74wq0m+cO8NDtOLjybLO82Ka?=
 =?us-ascii?Q?05W40GLeQ/0Qb74P8YkOEv8yJAkvEXq8cfAPJxMPqjMh4e5+4JNSd8UhEoMo?=
 =?us-ascii?Q?9OHTuf95nq2nmIr6GGLDaI1FhikFImsIvM1zsQwF12VJe79R+NAGZsB3Fi2X?=
 =?us-ascii?Q?b6VAwVBXC5CA9YulyHOxY/AaTShTQPV7i0HINj7FdsL8m1bECRtO+JspSD35?=
 =?us-ascii?Q?YOHLZie2mEaHUCOBIaOJTYki1ONyASZZflaT4LSdkVOPgdqYHl3H8/SJBcxP?=
 =?us-ascii?Q?nKoPfOvqrGlTrEc6PFdiBt1eezRRHr8nepRn3hwRlTr65agGZs3gOjdPLO6U?=
 =?us-ascii?Q?9T0NKEPQgXSRd8mJb/8hxs0vKY4zksuxhnzjJmS5IcP/gkvMQ09E9Pie57fv?=
 =?us-ascii?Q?sDmw0rEyaYyNNDjGUUIeARBgwRvH9t7odzr4FyVeXcxysTjzuhGnc3BGubPs?=
 =?us-ascii?Q?C+siznL0LC13+2cGnHVeNUvG4DrK57IsPX8guWrOAVhqs9dfb6brR0UfuHcj?=
 =?us-ascii?Q?sah5+xY0E3XfemfM9sWK9M4HxBs2xJXemZhyPnEPayx7XfUG2H9XvkWnReMj?=
 =?us-ascii?Q?D4DqP5cjsrTf5CAQ6b+WoNaEYgL3DBIMHGo0hZJxqObFEgchCd2qvMzPaqVC?=
 =?us-ascii?Q?byAvmRhkkm57/yeF89KHu13t+2MyBW66TdqQCJOV/Yxe/JEXXlqfTfzNQofg?=
 =?us-ascii?Q?ulnZF6Y4G5853SYPffbHK/7ZCnIgZ4iOtA94ECSysTi6OfganT561V/ysDe/?=
 =?us-ascii?Q?aiW4VYEUo2K/3X1uc/ixTPHmlS3oYdZMoaljbNHovk5olTY8Ouiz35sEqGU9?=
 =?us-ascii?Q?/fla5r7Bfie9RA0Uh5wWrCRJIlPmtqd32hGs8EYuraj/1Q+aNRi2k3+4eAaQ?=
 =?us-ascii?Q?9JTl44taCdtCN25zuDGbIjiCH3AGqaqpwfGxtVITWsO32XeoEixKNXVSht3L?=
 =?us-ascii?Q?9X80JC3HDBtlrPlfO1wknrAUj7uOzK8d+HJMo16tzU0Cfr/AymwMdaytBsCd?=
 =?us-ascii?Q?wNr3O5xlmzpYm6GHvazzy68Xyq0jRelgduupYlHvgWhW0K3b+O3rXhGZr7Wk?=
 =?us-ascii?Q?oDLxuqOb7Ev65pRYGglg+kTXrFWN8dsPBupDBbBXCak7Dv+z58QROpmm1rC4?=
 =?us-ascii?Q?xSoHV6xwz3ctDUaeYYUY0rKD7+47gpBft3Ct0/zIoAAhwQ21Ij+rjGC/bwNF?=
 =?us-ascii?Q?i9ir/Rf/6b10+T1tSKkYtk4D5/nHgneEyStFyuurnxosrDpQ3R4vGU6CE0Jm?=
 =?us-ascii?Q?TUykml+P5S21H+scK/sINh9+a6kESnNzSvIzvZMkdtE9+WgUcQARVf1URu6r?=
 =?us-ascii?Q?c9fbEdc300wh29pHWEkpoZSARk9iMpcKsAkyzjZCcd2TWrFg829Ep7eCJtck?=
 =?us-ascii?Q?gZhFn5YJwI9jNUjlTMCFQMnNien1jUE57kWwQbu1vXHZtIQjR1ntHPBZ5N81?=
 =?us-ascii?Q?p9mas2w7b8UUxEq9Lwf9rPj8aK8HtGilW76a80Pn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb50ca7b-ddef-4c2b-39f4-08de1c8c27cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 16:55:42.6872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wxUyNrAc7ecBlPvZCLXLel1H+YuGx1NSQxVwqYxeI65MGhVsx5UuOCVqjxU3pj6LDECLBsZSkyK6X/UwAP0YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4621
X-Proofpoint-ORIG-GUID: ea7zuPnzFb4oxPZdthnoBS8f_hYv5IWx
X-Authority-Analysis: v=2.4 cv=FYo6BZ+6 c=1 sm=1 tr=0 ts=690b8190 cx=c_pps
 a=lexSm1xfraBw67q2grWtcw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Bk7mZIDdsEizWGDkWTYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ea7zuPnzFb4oxPZdthnoBS8f_hYv5IWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzMSBTYWx0ZWRfXz9f0liChSzA5
 iSEqa9I4YefzFqvYbFnVp+DHcMMcAxUP4VVgboklNjBHUfxsbsDEi9dd427uKEUNsMFmJZKYHEE
 kxn+F7J8paOradBStg52cZknLZ4iRebXBdDQySz2xUsrdBHtMaFBdEU5vZ4X1b3x2gVXHuy98t5
 wjA7YZ8voI4fdw43YszEddaNT5pe1iTtwhNwCFjGL1DWCuvlgCSIzVmEInC5GV5Ps78z4tKWzlU
 4z+R5uwiGNmYOk6Fimp/TnCF4HwkedK5zXozhn+matfzuu1lOD3OjAFbx3joW+97+RiidlEEnLm
 hJHgAMYiPb/nfQDBBI3QR7gFODpiVGQ1VeKGKFsDpAv6UeWsnJ4AOQuJ1YWeu3HJg9UjZ1N5Be/
 m47V3WBdC2IQ1jYBJBJlXjTqzO4qxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050131
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 16:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121329

ChangeLog:
https://github.com/COVESA/vsomeip/releases/tag/3.5.4
https://github.com/COVESA/vsomeip/releases/tag/3.5.5
https://github.com/COVESA/vsomeip/releases/tag/3.5.6
https://github.com/COVESA/vsomeip/releases/tag/3.5.7
https://github.com/COVESA/vsomeip/releases/tag/3.5.8
https://github.com/COVESA/vsomeip/releases/tag/3.5.9
https://github.com/COVESA/vsomeip/releases/tag/3.5.10

* Fix build with boost 1.89
* Fix build on 32-bit host

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
V2 Changes: Update to 3.5.10
            Fix build with clang
            Update Upstream-Status in patches

 .../0001-Fix-pkgconfig-dir-for-multilib.patch |   8 +-
 ...e-configuration-files-to-etc-vsomeip.patch |   8 +-
 ...-Do-not-specify-PIE-flag-explicitly.patch} |  21 +--
 .../0004-Fix-build-with-boost-1.89.patch      |  42 ++++++
 ...ddress-from_string-with-make_address.patch |  47 +++++++
 ...eLists.txt-add-missing-link-with-dlt.patch |  41 ------
 ...06-Fix-scanning-64-bit-integer-types.patch | 128 ++++++++++++++++++
 ...treat-warnings-as-errors-with-clang.patch} |  45 +++---
 .../{vsomeip_3.5.3.bb => vsomeip_3.5.10.bb}   |  32 +++--
 9 files changed, 278 insertions(+), 94 deletions(-)
 copy meta-networking/recipes-protocols/vsomeip/vsomeip/{0004-Do-not-specify-PIE-flag-explicitly.patch => 0003-Do-not-specify-PIE-flag-explicitly.patch} (82%)
 create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-build-with-boost-1.89.patch
 create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch
 delete mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch
 create mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0006-Fix-scanning-64-bit-integer-types.patch
 rename meta-networking/recipes-protocols/vsomeip/vsomeip/{0004-Do-not-specify-PIE-flag-explicitly.patch => 0007-Do-not-treat-warnings-as-errors-with-clang.patch} (50%)
 rename meta-networking/recipes-protocols/vsomeip/{vsomeip_3.5.3.bb => vsomeip_3.5.10.bb} (66%)

diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
index 0ddcb642bc..ffbe4e6744 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
@@ -1,4 +1,4 @@
-From 2f931baf290477b586309189445bf87e3bc5d5ba Mon Sep 17 00:00:00 2001
+From 0be97662524d86a24647f7c37b0a66b18da7b72c Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 2 Mar 2022 14:51:13 +0800
 Subject: [PATCH] Fix pkgconfig dir for multilib
@@ -11,10 +11,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ab399a69..beae6eaf 100644
+index 8445ecc8..12c3b947 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -637,7 +637,7 @@ endif()
+@@ -661,7 +661,7 @@ endif()
  # create pkg-config file
  if(NOT WIN32)
          configure_file(${VSOMEIP_NAME}.pc.in ${PROJECT_BINARY_DIR}/${VSOMEIP_NAME}.pc @ONLY)
@@ -24,5 +24,5 @@ index ab399a69..beae6eaf 100644
  
  ##############################################################################
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
index bdaf343606..6dd854e94e 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
@@ -1,4 +1,4 @@
-From ebaa3206ee125741314272cddafa04fa71bd2d1e Mon Sep 17 00:00:00 2001
+From c9d03f6b100d1be8bee75caf933e10fcbb599db3 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 9 Mar 2022 11:48:44 +0800
 Subject: [PATCH] Install example configuration files to /etc/vsomeip
@@ -11,10 +11,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index beae6eaf..d791c12e 100644
+index 12c3b947..b42f8688 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -536,7 +536,7 @@ install(FILES ${PROJECT_BINARY_DIR}/vsomeip.pc DESTINATION lib/pkgconfig)
+@@ -578,7 +578,7 @@ install(FILES ${PROJECT_BINARY_DIR}/vsomeip.pc DESTINATION lib/pkgconfig)
  endif ()
  
  install (
@@ -24,5 +24,5 @@ index beae6eaf..d791c12e 100644
  
  # Add all targets to the build-tree export set
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-specify-PIE-flag-explicitly.patch
similarity index 82%
copy from meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch
copy to meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-specify-PIE-flag-explicitly.patch
index 2d789627a3..cada06e98e 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-specify-PIE-flag-explicitly.patch
@@ -1,4 +1,4 @@
-From ec2d36466c9050ee282ea1c3bb1b5f1f61c96ecb Mon Sep 17 00:00:00 2001
+From 8054f459d47cde818ed9d1eb1e49efb4a8d4b3df Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Mon, 17 Jul 2023 14:33:32 +0800
 Subject: [PATCH] Do not specify PIE flag explicitly
@@ -23,9 +23,11 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  CMakeLists.txt | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b42f8688..c39184e9 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -70,7 +70,7 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux"
+@@ -73,7 +73,7 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
  if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
      # This is only relevant for GCC and causes warnings on Clang
      set(EXPORTSYMBOLS "-Wl,-export-dynamic -Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/exportmap.gcc")
@@ -34,12 +36,15 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  endif()
  
      set(NO_DEPRECATED "")
-@@ -78,7 +78,7 @@ endif()
-   if(NOT DEFINED _FORTIFY_SOURCE)
-       set(_FORTIFY_SOURCE 2)
-   endif()
--    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -fPIE")
-+    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic")
+@@ -82,7 +82,7 @@ endif()
+     if(NOT DEFINED _FORTIFY_SOURCE)
+         set(_FORTIFY_SOURCE 2)
+     endif()
+-    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -fPIE -Wno-inconsistent-missing-override")
++    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -Wno-inconsistent-missing-override")
  
      # force all use of std::mutex and std::recursive_mutex to use runtime init
      # instead of static initialization so mutexes can be hooked to enable PI as needed
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-build-with-boost-1.89.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-build-with-boost-1.89.patch
new file mode 100644
index 0000000000..45fffa733f
--- /dev/null
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-build-with-boost-1.89.patch
@@ -0,0 +1,42 @@
+From 2a5c3fbfd863a69eafce6a13b273f5c17cbf4062 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Mon, 3 Nov 2025 23:06:35 +0800
+Subject: [PATCH] Fix build with boost 1.89
+
+The Boost.System stub library has been removed in Boost 1.89.0[1], which
+causes a CMake error:
+
+CMake Error at Boost-1.89.0/BoostConfig.cmake:141 (find_package):
+  Could not find a package configuration file provided by "boost_system"
+  (requested version 1.89.0) with any of the following names:
+    boost_systemConfig.cmake
+    boost_system-config.cmake
+
+Drop 'system' from the COMPONENTS in find_package to fix this issue[2].
+
+[1] https://github.com/boostorg/system/commit/7a495bb46d7ccd808e4be2a6589260839b0fd3a3
+[2] https://github.com/boostorg/system/issues/132
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c39184e9..ddc1eed8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -189,7 +189,7 @@ add_definitions(-DVSOMEIP_INTERNAL_SUPPRESS_DEPRECATED)
+ find_package(Threads REQUIRED)
+ 
+ # Boost
+-find_package( Boost 1.66 COMPONENTS system thread filesystem REQUIRED )
++find_package( Boost 1.66 COMPONENTS thread filesystem REQUIRED )
+ if(${CMAKE_SYSTEM_NAME} MATCHES "QNX")
+     include_directories(${Boost_INCLUDE_DIR} )
+ else()
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch
new file mode 100644
index 0000000000..c25df03d3b
--- /dev/null
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch
@@ -0,0 +1,47 @@
+From 47b976736e4f57447339081ab5a40435b3b2d5a8 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 4 Nov 2025 22:10:33 +0800
+Subject: [PATCH] Replace address::from_string with make_address
+
+boost::asio::ip::address::from_string is deprecated since boost 1.87[1].
+Replace it with make_address.
+
+Fix:
+implementation/routing/src/routing_manager_impl.cpp:1406:98: error: 'from_string' is not a member of 'boost::asio::ip::address_v4'
+ 1406 |  _remote_address.is_v4() ?  _remote_address.to_v4() : boost::asio::ip::address_v4::from_string("6.6.6.6");
+      |                                                                                    ^~~~~~~~~~~
+
+[1] https://github.com/boostorg/asio/commit/c0d1cfce7767599c4cf00df36f8017a1073339ae
+
+Upstream-Status: Submitted [https://github.com/COVESA/vsomeip/pull/973]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ implementation/routing/src/routing_manager_impl.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/implementation/routing/src/routing_manager_impl.cpp b/implementation/routing/src/routing_manager_impl.cpp
+index 3723fe5b..8a252c0b 100644
+--- a/implementation/routing/src/routing_manager_impl.cpp
++++ b/implementation/routing/src/routing_manager_impl.cpp
+@@ -1404,7 +1404,7 @@ void routing_manager_impl::on_message(const byte_t* _data, length_t _size, endpo
+     if (is_forwarded) {
+         trace::header its_header;
+         const boost::asio::ip::address_v4 its_remote_address =
+-                _remote_address.is_v4() ? _remote_address.to_v4() : boost::asio::ip::address_v4::from_string("6.6.6.6");
++                _remote_address.is_v4() ? _remote_address.to_v4() : boost::asio::ip::make_address_v4("6.6.6.6");
+         trace::protocol_e its_protocol = _receiver->is_local() ? trace::protocol_e::local
+                 : _receiver->is_reliable()                     ? trace::protocol_e::tcp
+                                                                : trace::protocol_e::udp;
+@@ -1442,7 +1442,7 @@ bool routing_manager_impl::on_message(service_t _service, instance_t _instance,
+         std::shared_ptr<endpoint> _receiver = its_info->get_endpoint(_reliable);
+         if (_receiver && _receiver.get()) {
+             if(!is_acl_message_allowed(_receiver.get(), _service, _instance,
+-                    boost::asio::ip::address_v4::from_string("127.0.0.1"))) {
++                    boost::asio::ip::make_address_v4("127.0.0.1"))) {
+                 return false;
+             }
+         }
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch
deleted file mode 100644
index 25d66514f8..0000000000
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 8676ef287bb25b49668be4336387bdf83a0cae5c Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Mon, 1 Jan 2024 17:02:41 +0800
-Subject: [PATCH] test/common/CMakeLists.txt: add missing link with dlt
-
-The libvsomeip_utilities library uses functions e.g.
-dlt_check_library_version/dlt_register_app/dlt_unregister_app which are
-provided by dlt therefore add it to linker flags.
-
-Fixes:
-x86_64-poky-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: dlt_check_library_version
->>> referenced by test/common/libvsomeip_utilities.so
-
-x86_64-poky-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: dlt_register_app
->>> referenced by test/common/libvsomeip_utilities.so
-
-x86_64-poky-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: dlt_unregister_app
->>> referenced by test/common/libvsomeip_utilities.so
-
-Upstream-Status: Submitted [https://github.com/COVESA/vsomeip/pull/602]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- test/common/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/test/common/CMakeLists.txt b/test/common/CMakeLists.txt
-index d4d14534..afc8c2d6 100644
---- a/test/common/CMakeLists.txt
-+++ b/test/common/CMakeLists.txt
-@@ -27,6 +27,7 @@ TARGET_LINK_LIBRARIES (
-         ${Boost_LIBRARIES}
-         ${DL_LIBRARY}
-         ${TEST_LINK_LIBRARIES}
-+        ${DLT_LIBRARIES}
- )
- 
- # ----------------------------------------------------------------------------
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0006-Fix-scanning-64-bit-integer-types.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0006-Fix-scanning-64-bit-integer-types.patch
new file mode 100644
index 0000000000..f4653d0010
--- /dev/null
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0006-Fix-scanning-64-bit-integer-types.patch
@@ -0,0 +1,128 @@
+From 67878aa198e17f13a6d1a0de72bf06a872aec472 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 4 Nov 2025 12:50:51 +0800
+Subject: [PATCH] Fix scanning 64-bit integer types
+
+Fix build error on 32-bit host:
+test/network_tests/cpu_load_tests/cpu_load_measurer.cpp:89:24: error: format '%lu' expects argument of type 'long unsigned int*',
+but argument 3 has type 'uint64_t*' {aka 'long long unsigned int*'} [-Werror=format=]
+   89 |   "%lu %lu %ld %ld", // utime, stime, cutime, cstime
+      |    ~~^
+      |      |
+      |      long unsigned int*
+      |    %llu
+   90 |   &utime, &stime, &cutime, &cstime)
+      |   ~~~~~~
+      |   |
+      |   uint64_t* {aka long long unsigned int*}
+
+Upstream-Status: Submitted [https://github.com/COVESA/vsomeip/pull/974]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ implementation/routing/src/routing_manager_impl.cpp     | 4 +++-
+ test/network_tests/cpu_load_tests/cpu_load_measurer.cpp | 6 ++++--
+ test/network_tests/memory_tests/memory_test_client.cpp  | 4 +++-
+ test/network_tests/memory_tests/memory_test_service.cpp | 4 +++-
+ 4 files changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/implementation/routing/src/routing_manager_impl.cpp b/implementation/routing/src/routing_manager_impl.cpp
+index 8a252c0b..9fb6c32c 100644
+--- a/implementation/routing/src/routing_manager_impl.cpp
++++ b/implementation/routing/src/routing_manager_impl.cpp
+@@ -10,6 +10,7 @@
+ #include <fstream>
+ #include <forward_list>
+ #include <thread>
++#include <cinttypes>
+ 
+ #if defined(__linux__) || defined(__QNX__)
+ #include <unistd.h>
+@@ -3914,7 +3915,8 @@ void routing_manager_impl::memory_log_timer_cbk(boost::system::error_code const&
+     std::uint64_t its_dirtypages(0);
+ 
+     if (EOF
+-        == std::fscanf(its_file, "%lu %lu %lu %lu %lu %lu %lu", &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib, &its_data,
++        == std::fscanf(its_file, "%" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64,
++                    &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib, &its_data,
+                     &its_dirtypages)) {
+         VSOMEIP_ERROR << "memory_log_timer_cbk: error reading: errno " << errno;
+     }
+diff --git a/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp b/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp
+index aaf91174..dfe27e8c 100644
+--- a/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp
++++ b/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp
+@@ -12,6 +12,7 @@
+ #include <vector>
+ #include <stdexcept>
+ #include <cstdio>
++#include <cinttypes>
+ 
+ #include <sys/types.h>
+ #include <unistd.h>
+@@ -86,7 +87,7 @@ std::uint64_t cpu_load_measurer::read_proc_pid_stat() {
+     std::int64_t cstime(0);
+     if (std::fscanf(f,
+                     "%*d %*s %*c %*d %*d %*d %*d %*d %*u %*u %*u %*u %*u "
+-                    "%lu %lu %ld %ld", // utime, stime, cutime, cstime
++                    "%" SCNu64 " %" SCNu64 " %" SCNi64 " %" SCNi64, // utime, stime, cutime, cstime
+                     &utime, &stime, &cutime, &cstime)
+         == EOF) {
+         std::cerr << "Failed to read " + path << std::endl;
+@@ -116,7 +117,8 @@ std::uint64_t cpu_load_measurer::read_proc_stat(std::uint64_t* _idle) {
+     std::uint64_t steal(0);
+     std::uint64_t guest(0);
+     std::uint64_t guest_nice(0);
+-    if (std::fscanf(f, "%*s %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu", &user, &nice, &system, &idle, &iowait, &irq, &softirq, &steal, &guest,
++    if (std::fscanf(f, "%*s %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64,
++                    &user, &nice, &system, &idle, &iowait, &irq, &softirq, &steal, &guest,
+                     &guest_nice)
+         == EOF) {
+         std::cerr << "Failed to read /proc/stat" << std::endl;
+diff --git a/test/network_tests/memory_tests/memory_test_client.cpp b/test/network_tests/memory_tests/memory_test_client.cpp
+index 102c8218..d922ad81 100644
+--- a/test/network_tests/memory_tests/memory_test_client.cpp
++++ b/test/network_tests/memory_tests/memory_test_client.cpp
+@@ -6,6 +6,7 @@
+ #include <chrono>
+ #include <iomanip>
+ #include <cstring>
++#include <cinttypes>
+ 
+ #include <vsomeip/internal/logger.hpp>
+ #include "memory_test_client.hpp"
+@@ -30,7 +31,8 @@ void check_memory(std::vector<std::uint64_t>& test_memory_, std::atomic<bool>& s
+         std::uint64_t its_dirtypages(0);
+ 
+         if (EOF
+-            == std::fscanf(its_file, "%lu %lu %lu %lu %lu %lu %lu", &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib,
++            == std::fscanf(its_file, "%" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64,
++                           &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib,
+                            &its_data, &its_dirtypages)) {
+             VSOMEIP_ERROR << "check_memory: error reading: errno " << errno;
+         }
+diff --git a/test/network_tests/memory_tests/memory_test_service.cpp b/test/network_tests/memory_tests/memory_test_service.cpp
+index a8547395..751c6f9e 100644
+--- a/test/network_tests/memory_tests/memory_test_service.cpp
++++ b/test/network_tests/memory_tests/memory_test_service.cpp
+@@ -5,6 +5,7 @@
+ 
+ #include <vsomeip/internal/logger.hpp>
+ #include <cstring>
++#include <cinttypes>
+ 
+ #include "memory_test_service.hpp"
+ 
+@@ -28,7 +29,8 @@ void check_memory(std::vector<std::uint64_t>& test_memory_, std::atomic<bool>& s
+         std::uint64_t its_dirtypages(0);
+ 
+         if (EOF
+-            == std::fscanf(its_file, "%lu %lu %lu %lu %lu %lu %lu", &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib,
++            == std::fscanf(its_file, "%" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64,
++                           &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib,
+                            &its_data, &its_dirtypages)) {
+             VSOMEIP_ERROR << "check_memory: error reading: errno " << errno;
+         }
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0007-Do-not-treat-warnings-as-errors-with-clang.patch
similarity index 50%
rename from meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch
rename to meta-networking/recipes-protocols/vsomeip/vsomeip/0007-Do-not-treat-warnings-as-errors-with-clang.patch
index 2d789627a3..31e7efcf33 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0007-Do-not-treat-warnings-as-errors-with-clang.patch
@@ -1,45 +1,40 @@
-From ec2d36466c9050ee282ea1c3bb1b5f1f61c96ecb Mon Sep 17 00:00:00 2001
+From 74c6e762097ad8016d1410bd1beaef1398f02901 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
-Date: Mon, 17 Jul 2023 14:33:32 +0800
-Subject: [PATCH] Do not specify PIE flag explicitly
+Date: Wed, 5 Nov 2025 22:17:14 +0800
+Subject: [PATCH] Do not treat warnings as errors with clang
 
-For nodistro distro, packages are built without PIE because
-security_flags.inc is not included by default. But in vsomeip, the PIE
-flag is explicitly specified in CMAKE_CXX_FLAGS, which will cause
-building with PIE even in nodistro, causing an error when linking the
-googletest static library:
+There are some warnings when building with clang which are treated as
+errors and fails the build.
 
-TOPDIR/tmp-glibc/work/cortexa53-oe-linux/vsomeip/3.1.20.3-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/aarch64-oe-linux/gcc/aarch64-oe-linux/12.2.0/ld:
-TOPDIR/tmp-glibc/work/cortexa53-oe-linux/vsomeip/3.1.20.3-r0/recipe-sysroot/usr/lib/libgtest.a(gtest-all.cc.o)(.text+0x4a90):
-unresolvable R_AARCH64_ADR_PREL_PG_HI21 relocation against symbol `_ZSt4cerr@@GLIBCXX_3.4'
-
-Remove PIE flag from CMAKE_CXX_FLAGS and only enable PIE flag by
-including security_flags.inc.
-
-Upstream-Status: Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  CMakeLists.txt | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ddc1eed8..62b096e7 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -70,7 +70,7 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux"
+@@ -73,7 +73,7 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
  if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
      # This is only relevant for GCC and causes warnings on Clang
      set(EXPORTSYMBOLS "-Wl,-export-dynamic -Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/exportmap.gcc")
--    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -pie -Wno-tsan -Wl,-z,relro,-z,now")
-+    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -Wno-tsan -Wl,-z,relro,-z,now")
+-    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -Wno-tsan -Wl,-z,relro,-z,now")
++    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -Wno-tsan -Wl,-z,relro,-z,now -Werror")
  endif()
  
      set(NO_DEPRECATED "")
-@@ -78,7 +78,7 @@ endif()
-   if(NOT DEFINED _FORTIFY_SOURCE)
-       set(_FORTIFY_SOURCE 2)
-   endif()
--    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -fPIE")
-+    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic")
+@@ -82,7 +82,7 @@ endif()
+     if(NOT DEFINED _FORTIFY_SOURCE)
+         set(_FORTIFY_SOURCE 2)
+     endif()
+-    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -Wno-inconsistent-missing-override")
++    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Wno-inconsistent-missing-override")
  
      # force all use of std::mutex and std::recursive_mutex to use runtime init
      # instead of static initialization so mutexes can be hooked to enable PI as needed
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.10.bb
similarity index 66%
rename from meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
rename to meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.10.bb
index f854078004..0455e23caa 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.3.bb
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.10.bb
@@ -7,25 +7,27 @@ SECTION = "net"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
 
-GTEST_VER = "1.15.2"
+GTEST_VER = "1.17.0"
 SRC_URI = "git://github.com/GENIVI/${BPN}.git;branch=master;protocol=https;name=vsomeip \
            https://github.com/google/googletest/releases/download/v${GTEST_VER}/googletest-${GTEST_VER}.tar.gz;name=gtest;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/ \
            file://0001-Fix-pkgconfig-dir-for-multilib.patch \
            file://0002-Install-example-configuration-files-to-etc-vsomeip.patch \
-           file://0004-Do-not-specify-PIE-flag-explicitly.patch \
-           file://0005-test-common-CMakeLists.txt-add-missing-link-with-dlt.patch \
+           file://0003-Do-not-specify-PIE-flag-explicitly.patch \
+           file://0004-Fix-build-with-boost-1.89.patch \
+           file://0005-Replace-address-from_string-with-make_address.patch \
+           file://0006-Fix-scanning-64-bit-integer-types.patch \
+           file://0007-Do-not-treat-warnings-as-errors-with-clang.patch \
           "
 
-SRCREV = "6461369b3874c844642c9adaac9d1b7406794ab8"
-SRC_URI[gtest.sha256sum] = "7b42b4d6ed48810c5362c265a17faebe90dc2373c885e5216439d37927f02926"
+SRCREV = "c4e0db329da9b63f511f3c2456c040582daf9305"
+SRC_URI[gtest.sha256sum] = "65fab701d9829d38cb77c14acdc431d2108bfdbf8979e40eb8ae567edf10b27c"
 
 COMPATIBLE_HOST:mips = "null"
 COMPATIBLE_HOST:mips64 = "null"
 COMPATIBLE_HOST:powerpc = "null"
 COMPATIBLE_HOST:libc-musl = 'null'
 
-DEPENDS = "boost dlt-daemon googletest"
-
+DEPENDS = "boost dlt-daemon"
 
 inherit cmake pkgconfig
 
@@ -43,9 +45,10 @@ EXTRA_OECMAKE += "-DTEST_IP_MASTER=10.0.3.1 \
 
 RDEPENDS:${PN}-test = "bash lsof"
 
-do_compile:append() {
-    cmake_runcmake_build --target examples
-    cmake_runcmake_build --target build_tests
+OECMAKE_TARGET_COMPILE += "vsomeip_ctrl examples build_tests"
+
+do_compile:prepend() {
+    sed -i -e 's#${S}/build#/opt/${PN}-test#g' ${S}/test/unit_tests/security_policy_manager_impl_tests/policy_manager_impl_unit_test_macro.hpp
 }
 
 do_install:append() {
@@ -58,13 +61,17 @@ do_install:append() {
     install -d ${D}/opt/${PN}-test/test/test/common
     cp -rf ${S}/test/common/examples_policies \
         ${D}/opt/${PN}-test/test/test/common/
+
+    install -d ${D}/opt/${PN}-test/test/common
     install -m 0755 ${B}/test/common/libvsomeip_utilities.so \
-        ${D}/opt/${PN}-test/test/test/common/
+        ${D}/opt/${PN}-test/test/common/
 
     for d in unit_tests network_tests; do
         install -d ${D}/opt/${PN}-test/test/$d
         cp -rf ${B}/test/$d/*_tests ${D}/opt/${PN}-test/test/$d
+        find ${D}/opt/${PN}-test/test/$d -maxdepth 2 \( -name "*.cmake" -o -name "CMakeFiles" \) -exec rm -rf {} \;
     done
+    sed -i -e 's#../..${B}#/opt/${PN}-test#g' ${D}/opt/${PN}-test/test/network_tests/lazy_load_tests/vsomeip/vsomeip_policy_extensions.json
 }
 
 PACKAGES += "${PN}-test"
@@ -75,4 +82,5 @@ FILES:${PN}-dbg += " \
 FILES:${PN}-test = " \
    /opt/${PN}-test \
    "
-SKIP_RECIPE[vsomeip] ?= "Does not work with boost >= 1.87"
+
+INSANE_SKIP += "32bit-time"
-- 
2.34.1


