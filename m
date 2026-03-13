Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3384B105F7A4
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 12:11:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14342.1773403882838712052
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 05:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iInu/JEd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75329b8642=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DBKhpw3134841
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 12:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=lax9OMN3/MVLZgAduiH6RKI9In47XJNnyfoxiCkjY9g=; b=iInu/JEd2b2i
	cblXNlb9G2RG9hpR/Y6x6xs/qUNwkBQbrcw4DfzLvDPnb6SjAEvqIyjXBQO2kb1x
	Jy+5f11vHYcT7mVPiHHiQBKLAyxQZIwioVXO4mEWr1zRf5kjpbJus/KVz9ApGLBT
	ZP5gAJvXNpiWc6cJyHbmRGYj4cjPD+87BDDnMh4foktVT2Y9cdHQZcn2KyRV/Osh
	WRFnm3+zA3qYDMnL2LdGtAPy5v+FquIEL4E01PdRYOTNuaqDww30OHlL9S4T4Ymz
	EwQUcX8BiAsuvl6ue1GKV13tBBInlqaZqxpF53HdFY0royO3LzSA2yaxyxMLtauS
	H+whp+7mCA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010055.outbound.protection.outlook.com [52.101.46.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqshvs-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 12:11:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyevKSvvRiKWHSZr68C6aBXZnrU9ti3vZRqVMo3dSq/S3tjsqVSTMzkpDeivg3++AvT9K/OmFa9MbdL34Oa3hM/xzOVXsznzfbJlf7kGOSC6J5f2AZr56qFfB8l77I2jxnnOHUjlUsQ45IhMtRvivscuLmjMVb8bcmY9a+vbF6PLStDR/wBj74E+XXJwqdHvzTX42tFRj6cIbLetylADlcfnqB02ekwYum29cNr4sXc+B0mLyrktLLq0i3aaaMdKfvLEfVll8pG2FDVOgeePUCt1sdSzCULbwP88h4qbcqzG+I19ZcXNjTX4pvcQi0m7p4kuWCAgkqFCKox3Ww+jwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lax9OMN3/MVLZgAduiH6RKI9In47XJNnyfoxiCkjY9g=;
 b=bmJtaajeRmwwQlaKX9J+QBffYh24pu4/JR08dSKcEXUhP+BspWPj9RypnbOLYUlK5hy+taPHelpxUovsX+Cmab+pV9n4UMFZqgIQ0yE9/muLT0Y4264qL39LjltBm2SwEKS9NaPC3/XNhWvpJ0vb/vOM/HGr6R1ujFUrrXZnit/jDBpBro1+n3A5VDU4LGzaAtBLgLaauVYofpqR12aoOV8amCMA6d1PicNbzzMARaYBgFCMVbIZwKnTq6nhLZmUQvqc7Ws/vbFcbxpLPGNKYpMQV9hcGSgjx6rv+8j2xesVunhHHW5SXc8ZT4kEEABP8s7daU3CKa0oCcbsDdI93w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.8; Fri, 13 Mar 2026 12:11:19 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 12:11:19 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/5] v4l-utils: upgrade 1.28.1 -> 1.32.0
Date: Fri, 13 Mar 2026 20:11:04 +0800
Message-ID: <20260313121105.2180430-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313121105.2180430-1-yi.zhao@windriver.com>
References: <20260313121105.2180430-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0105.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e51ea7-149f-4032-bf52-08de80f9a2a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	AZUkbo0tYs9CBYzcJpdMUQCCg1gi6IVBwTpcyiLJyKYxcxY3ViU4x/xiBtg7TY4pMRk7v6ppX/p2Ks1T922ABX0/IxLh7w09Z1Uuu8hdv7PqVmq4dZ1k7/I/CWss4tJpYUl19i/OK7u3SKJtggsF56FvOnpmNrZu+IOsgMDRLW6tW2hpiXVb1GTDXSKd3TOS8RaVaCG1vcRU4Btj7Of5y6eqweFJROMfHG5F1qWCLHWw1bnRdNJNg1ER9RU4ZShebclscKPdWAY+JCtn7p12DN+g2upn68nXnoIF7n0fHXuywtQHA++naXG9xPr9v4ced5QDWIfkpttVqhKyZY4uXMVpJEYX7K4tpQ4Wjscsde9Vixwh/O4TShP59ZQ/pe59BUtunOetw3jvNxBDIyfYD97kvjkTu5Jo/jOAiEb2+9WEmpAesVn++hA1mm5ThKtq+VLECjm62g+17vttpcgKKxkaW0VOztQFvI1N2JyINxANXkv16IpJB2UN2IkrOY8w1EckadeWxuMXH0Zgrxhz/s2kjdFLT9UmNXM3D5UGq+3CBfr/qfu6UHBMwHKzk4xpB4weRHt6dgQ4Y66NDYxnMUHf6+XL6iaMZRJjiWzqO7WLE9CjJGgcIfaGbOsuYfxXj60QmCHIfapwQD279ytbLbmO6VdERqNgUacye7Sx1C38pgBZe3VQs5GJ3QT/ok4W8FZykd/JJjiIxsG0IVSZzjVlbyK4/pka5Ug/R0OUesMKWb7VnaCiuBkLPXtCYJuT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aaCli46nDm5ibg63cKyziuy/lJIoQ36O2Lj80d1xt+yQdGW1g0Hc+8MNncql?=
 =?us-ascii?Q?8l62dmdRNBOxecPobcIZer78b/qvOhMIaYoGnMYXKzeLYMuriaUqG/ozXdTQ?=
 =?us-ascii?Q?bAwjgevf/PemtJNd69Ux9TXFMl7zjrVEgdlklyXUujokY1Z/StAyWwPOZAMF?=
 =?us-ascii?Q?Z6zqxAnrSiEAbyJeqDUsGLwIGqfyBqTecXbwEDmK6Y1tKQjQzy/gpRdArsaO?=
 =?us-ascii?Q?BHCnLvjsN+tq4hdd1c0xh546GvbE4ph+ZZ+rFb63ymCujJeq1KzeoZJT70jz?=
 =?us-ascii?Q?2QaolcdgpeGnf0f6QkABk90oOn+lTayQHNsA5Em2vLsuIkYAR2LJTgmiLP2P?=
 =?us-ascii?Q?GgBCghvEFnbsX+snhOmydd0+F3SMX3agbHRX1JoM9xnqaGUbP7FNunpUydoG?=
 =?us-ascii?Q?7fax+Qa9QWFDaGyGupCO325BAGD25k6QDq5BXCeSzxKivwB2z+cX6qBGbo8I?=
 =?us-ascii?Q?ZFI8aQ4rXoihsPfpsFrWqNfHJK7Vo3WMYXI+6fZCq0JWjpGSqimd/mZdGdQU?=
 =?us-ascii?Q?WjHI44br8e/yvhXFOQ8oXP5hG1CB4WvGIaB23XcXTe2styzgTRCYE8VNUxHZ?=
 =?us-ascii?Q?M8nnPw1ddyCWjzNz/fOryrFrSvFHO99zb1Cc6g5OY2TZfWaBoBgXPwwJgKat?=
 =?us-ascii?Q?56yI64/5DzVAhreXujTxhR7EWH0DkAJjLV5P7CGuFm9oqMlntZMBziYC65tf?=
 =?us-ascii?Q?dDsITq6MGmjfsWCfPNPOsfWRv3Hq7lNwVEwPpWpWnGOFZHwKAQx4CyVD3UvJ?=
 =?us-ascii?Q?KaXmAR9bQWQ+SIQePgrLeVybRVRfBKlbEbrSL4AIB79vBX45t1uzFnF8cc2M?=
 =?us-ascii?Q?d0BjS1s1MRbP42vm0pVsU3ZstvpdZItP8vn6QDM/DjemzsHpgxEOhiSSOU+Y?=
 =?us-ascii?Q?q+mlKjpo1pB2HGWc/M/jpn/XJsO7Su+LnigcqB6Sp/LAvB08kYTMChQEH4PS?=
 =?us-ascii?Q?UMGMScfb5WP5rlAr2t2vk79MgDrY9oGFwTjFGhSxuV0W0i2Pvt+8ALdPi3l5?=
 =?us-ascii?Q?JrYZjed6TYRWewzq35K18FS+M9hkUFv5O0A2K1drGTlNExusMAa+LrUz0IDX?=
 =?us-ascii?Q?GM21WFviNe88Q+184hfD7J/VnK6KFOFm98WVYtxdRs+fmOvDHOdk1zAZjEbv?=
 =?us-ascii?Q?C83R7n3XAJMVGMQwlZF7XaC/C9CCW00TzZELOxZlRXhZTeQ9fuNnmVhrPUsK?=
 =?us-ascii?Q?yxZVr7ejodbwD2j0IpJuVxAEX7j2MPJoRY97ScNcIWJcWYK85CPPQQnBT0ih?=
 =?us-ascii?Q?lzOWRAO4CrUNqGXTmrYGToj2dVQlFQX6gSopefKyz6+VZt0Ts2ePBzQrkroK?=
 =?us-ascii?Q?JWnwmfgccCK2HZJaFoYKk90NjTf8ZjciTzcbtuHSOk/X/jPuQOufQgPOPDOI?=
 =?us-ascii?Q?lnALTFwfv9ZP1mW92uf0dv1Er++6hNpAJHxjvZ5JrCjp0mUWtVxhBL2W87Cu?=
 =?us-ascii?Q?ma+fa9sC1UZGtM5RZ998kzbOuv7sAk2/uMAj9Up/GthkoQ+vfuCxCXgZL+cu?=
 =?us-ascii?Q?odmjcSQeEhdkduy9yTyOsYvlqRbgLZdPTi0NCBTu7s255Elf3SkTTmzoxn2w?=
 =?us-ascii?Q?sKLb5ZsWnnJyoTx/2WKdyDxPGjJeUalWAA+QG7FgAqecD/Z7KBMHBN5eivM3?=
 =?us-ascii?Q?+ThG1ZktArjPXfw1ppdXsT40DAOBL0AUlmpvEUhNzNRwJ3vpsRwsKK6F8xGL?=
 =?us-ascii?Q?EV7QA0hutswTM2hVkxZcvZXdRFmxIWbMSW1qggvDUy6J9bRRbieSGMCAdZ1m?=
 =?us-ascii?Q?vkNfceEQNQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	qe5aoQEf9WncMXtJxirtRdQrlQzW9tbTAdfSD3QcmcTGP1Wc5YmUq8hjB6RJSd4yOeJqb5UQ4JiU7aZza2LO5pDuQ/bWZAXvq9eqV9mxFTxmf6boYWt5j6WC8bOKPwlpASyIIYJbk6+jInY1cu+wbutcu8LlYn9w/U6rfPPWMLQrwrfax3J4Mdw7ztxUpIv3NqiTlW1wLgH9I21uxxt3onV+qBahgPlt4tuEgDRbT5w1GvwHfMOreXmRd8+HUYmfunM4SMcumhVke9dZ97tAytW+u11cGxq4py/gfTmsJosbyXUtBT+213zxBfyi73Oy2AVQ04eQspoWxoW7GAvrVQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e51ea7-149f-4032-bf52-08de80f9a2a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 12:11:19.8628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+j2FtKwKFFz1DVraRIWSWZFarq2Yi1JEFb59X9t+bbHWTVu9h766wJIIe9mFXkDoSFwOss3z3wUGcmW7IWUPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
X-Proofpoint-ORIG-GUID: k3P0rvHJGf6nJQP_uVCuV9brPrlgDolr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfXyfm6ZVb6C+SO
 AlVi0gEymCPT4ZjeHAG+oXjsjqzVHDKQnBHZGrvVAV6sJMPsbVKqOZKN0zjmWHpwXf97+a3W3FH
 kN0TzLOr195fTn6YdgFQCsYuVmi5FXkhELQmvvT0QZzGD0xZAxotdpS5GbkxQmptaW3r0QqBzQ3
 CrS1TjqJJwWmi7COQj1UuGtMDNkUW8dQEYqAGrs8ioT6SVdhO0cO+FnU4ygIBR6EAr/VMBAC+Ay
 RZkYr2orCPfwSGXZC3/eXgwF+yyRc2Q5oOpQOj/l9NvYJEGBWeOdHXwWz8/BndGrklZcGDA7lr2
 JHMpQYGEUMOFLAqJGEON1XjF9YYenjwzw7ZvNXImdo5oc3iKORhqREGgMTpPSDjj2pHBeXWIqp7
 dBoh6N27xpD8vlaB4U7ZDBnwQmPSzxtu/LEgTk2RSQFuHMgu8m9cBXkqN3UowJYGfxZTBDbrG72
 5WQABAraqsEvcGY18fg==
X-Proofpoint-GUID: k3P0rvHJGf6nJQP_uVCuV9brPrlgDolr
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b3fee9 cx=c_pps
 a=gGLfFga2G+uCUFnDxO+Iyw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=xq3W2uTSAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=xOd6jRPJAAAA:8 a=nTS-qMBIhNI-wPHSd6kA:9
 a=P5L7wpMTXyg1GfFA3Gwx:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 12:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125189

ChangeLog:
https://git.linuxtv.org/v4l-utils.git/tree/ChangeLog?h=v4l-utils-1.32.0

License-Update: Remove FSF address[1].

[1] https://git.linuxtv.org/v4l-utils.git/commit/?id=dc81a361e22ce71a454ad63a6ede725b97cc26ce

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...on.build-fix-arm-_TIME_BITS-64-error.patch | 38 -------------------
 ...4l-utils_1.28.1.bb => v4l-utils_1.32.0.bb} | 10 ++---
 2 files changed, 4 insertions(+), 44 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.28.1.bb => v4l-utils_1.32.0.bb} (88%)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch
deleted file mode 100644
index f41dde0e16..0000000000
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 5aabd01e415374fc97eebe80d4635c3bae728f81 Mon Sep 17 00:00:00 2001
-From: Hans Verkuil <hverkuil@xs4all.nl>
-Date: Sat, 12 Apr 2025 12:30:13 +0200
-Subject: [PATCH] meson.build: fix arm _TIME_BITS=64 error
-
-Undefine _TIME_BITS to avoid this error on 32-bit arm:
-
-/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
-
-Upstream-Status: Backport [https://github.com/gjasny/v4l-utils/commit/d517cfdcdc16533ab7e06e97c07ca089cf261aef]
-
-Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
-Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
----
- meson.build | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 269a9da7..31927cda 100644
---- a/meson.build
-+++ b/meson.build
-@@ -53,8 +53,12 @@ v4l2_wrapper_args = [
-     # As the library needs to provide both 32-bit and 64-bit versions
-     # of file operations, disable transparent large file support (fixes
-     # 'Error: symbol `open64/mmap64' is already defined' compile failure
--    # otherwise)
-+    # otherwise).
-+    #
-+    # Also disable _TIME_BITS=64 since this is allowed only with
-+    # _FILE_OFFSET_BITS=64, which is now 32.
-     '-U_FILE_OFFSET_BITS',
-+    '-U_TIME_BITS',
-     '-D_FILE_OFFSET_BITS=32',
-     '-D_LARGEFILE64_SOURCE',
- ]
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.32.0.bb
similarity index 88%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.32.0.bb
index 14b8d12c45..d19d518b80 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.28.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.32.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = "v4l2 and IR applications"
 HOMEPAGE = "https://git.linuxtv.org/v4l-utils.git"
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
-                    file://COPYING.libv4l;md5=d749e86a105281d7a44c2328acebc4b0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0ebceacbd7029b5e7051e9f529542b7c \
+                    file://COPYING.libv4l;md5=88b8889c2c4329d4cf18ce5895e64c16"
 PROVIDES = "libv4l media-ctl"
 
 DEPENDS = "jpeg \
@@ -23,14 +23,12 @@ PACKAGECONFIG[qvidcap] = ",-Dqvidcap=disabled"
 PACKAGECONFIG[v4l2-tracer] = ",-Dv4l2-tracer=disabled,json-c"
 
 SRC_URI = "\
-    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.28 \
+    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=master;tag=v4l-utils-${PV} \
     file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch \
     file://0002-media-ctl-Install-media-ctl-pkg-config-files.patch \
-    file://0003-meson.build-fix-arm-_TIME_BITS-64-error.patch \
 "
 
-SRCREV = "fc15e229d9d337e46d730f00647821adbbd58548"
-
+SRCREV = "5a666c7ce89c00d66aa8e53c8f098a0c6c401f91"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v4l-utils-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


