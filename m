Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D908F54AAA
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 13:00:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19074.1774357202461695896
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 06:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gTfpuoeP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3ASKx3548742
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 13:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=kTIru5CUolzfXI1m0HILyhSa9yZ6s/Kwt55nd9qKzcw=; b=gTfpuoePNSWX
	90d3J88cxZCCDc6TZTxRpDxuiYGyrKLOo0Ib8zfiMsSrP+QMRmMUlNxrBUl6Eiot
	Bj7+ELYNIJLK4z4eOf1tQWW/1B7F1BVS/scA6EnUTLWQUpvzDNMy0RrXIRWhu+IQ
	Gkfb+79HM6WcvAEwlS0b+sMws9pTQl85FdURA12i+/k1eTfBhECuX2j7GBs/Vfb4
	ZVZ+AVBQEx7PzUMY8EDJ2JvZg+RN+EO5zM34a42jefia6JCEhsgKvG8p3wkF9wCt
	+44GPAeiG0neNkxb+JsG3cGIRuXwp7fMR9dRXAaRhOLBVRELphkle3XMiJ2X6opf
	1y/6WTYUqQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013061.outbound.protection.outlook.com [40.107.201.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6ubhp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 13:00:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P50vcKBGcIiyEiBLNNMXxtNLEzWxea9IcXDCMVfmp93MGQygRFqSQBBvN8Xd3LnuPIGMf/dN9j6QRQ+yRy4Y8RP5c/uyLpuYuqsG7cdFhIOQWJzDWIfdxbN3zWoGM1ktu6JChcrYY9oxBzRmVqQo145ZgPIVn4VDpZyO5mxTlz+XBmmmWAq1snEwCV0IPJrVjd8xcBBDTJuE36MwbK9VBrwqN/lx3wfCLlK+LYY8PaBw9i0vKSYv2q4rLDvFeaF9F0bDrUHN5pgsunuLtb3nW80PQ5skWoJ+6szggynYLIXJFq1RlNFwAhD+Q+Ca/T93GLKnQc217gxSekKRJqYceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTIru5CUolzfXI1m0HILyhSa9yZ6s/Kwt55nd9qKzcw=;
 b=IJkzGmfeXhUTIuFsXxRGATkyWmDCF0H1NqcZCZB4NgXvJ1pBsAi07IFsBwBhTKUhbFDM1ZpG7rY4dksrNlKE+MTmxYEyBJ9wTbx0BBjGoiQWOBV5uxd9uPFTIeor1VHREIi9aEDDBAgceyf1KkyUrNLI6/Zip89rCwF0M+k8Wb3O0fAEWZoOhFTVQoNT2BzMratPBrTPf2a8IyIvtteYVXtlqHzKhKr+IlPNmW8y1SfWM4YySc5zYVDGr15PQ7zJP1RNd8kJOCeA65+IzyzXnKVb+IUA5m7q7pdF3UMjm2qpBJgqrKYo4nJ5c+0fnVjm5lMCQngUONaXojCPvf3lmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Tue, 24 Mar 2026 12:59:55 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 12:59:55 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 10/15] xfconf: upgrade 4.20.0 -> 4.21.2
Date: Tue, 24 Mar 2026 20:59:22 +0800
Message-Id: <20260324125927.1070644-11-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
References: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS7PR11MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5dd50d-e1b5-4887-ef9e-08de89a53efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	k++kjk0XNZK/16uRrSoGGj7qWla0uFbm3w+3RsYaMOXoCJ6O3WKI/pi3TCIlVSK7zzRSuOqBsHu93Q9r28Dx8T/oEuCnjwUQ4d7VvHPx245dtGyOSygjIIon0LERLQDmRlpXbG0WWa0iOie/SkOCbR1glWaPtKoUODTRW0jV2q9E04pzdiLyR6jbddIxc9XT2FlcQSs4FXJBaKnOYVKWdMEVmQMuwhQ5adsFTctOGjmgqC0H7czLgfHTpZkDfrKtFe4KxU5PNldkIFHwgzHF6+6W0rpeyGbEAK4kjYy8U+HR0CfGsyEU+Vez3Xwv8DU2k+UrCKZhZVPHyaOyG2jLxrgb3ApzZhaUOyAaLe96CrS9Qv8EfSe4iR1b/NE4SLU1PYIdbHVoK8p8XYHsMqDYA77naMKRXV1gbXC8EXHwKQK74LjXjLWeFlgoeyKgusBrz3XnpyDQlfEutHZALaHjNWuy477ged6Xbngv908braoOT1nzXqe95X9+A4+Pg6BcXW7614H6I4nHY03Jej37vUAo6x7ObZErBzHLYS126oN+n/oTCeUewVx/b7y8+b9L6XcG0vxXS0zTzg2nty5WRzl9sf/QRMQbe8pKo05wvEz+CLMLmB4+InqzIqZ6ns2IKo4+cPLwDbIn2SGya2l6ZUl4J+jlipIElob46h9ESQ/iHZdEySoiHKulgxCk30c8BURSycFWGKE+kE6BtEzTeWNu9gRgJHM/lDTZFLY36dSQPNkQazTZOhgJQmb++rTwVUOS8iSWJB7iIjnuCc4dxmzrLmRWDIreSswWkV0DCb4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VYmjEHxW3dKdIu2PBvxVlRiojHcI+i5MDxrDJ2F0pHL9n2xDBeVE9gq0Ga7b?=
 =?us-ascii?Q?J0UwQ/dwXppFf3xlK79SsUsUNeMTlRFAOx3HUU3P1ELBjaP8rUj5xMwHeoxo?=
 =?us-ascii?Q?Z+MV7rhwzHpqkMxLl25+5mVElOB7gDmrOdLG38tLHn8b8z6DmfQwDKdPWeWW?=
 =?us-ascii?Q?U0u4kY56gmgWXePvZZahWY9VHeL/bowEMyewZaOKZYKPgTy9zVqKZe7zEqKe?=
 =?us-ascii?Q?OWM+CYjhdn9g9jx1Iko7151tr1DhcxQ/2MEQpHpksMYeJGwN0dwLUadHESSQ?=
 =?us-ascii?Q?d8zNyHzyunFYnlOlAT3mBO4fFuALrKCSFU9Mc5gcSbowBYAcm3o9XaGaxXyi?=
 =?us-ascii?Q?Qe6pxbjIWmrS4minuUZpb52cVYMC9PHWeUHwISYVPt9iYm+/fU5LmerQTPUF?=
 =?us-ascii?Q?bMhZsQJYewM8V0SUP+JHvaN3C5X3AoGBzBHr7ljlmVAfeHKpR23eSIXp+lo9?=
 =?us-ascii?Q?0J91Op/cIU0GYxc3YPTJN5T4uF7637tue+VRM7qTBG/U6yBMOMmpfLNekkKE?=
 =?us-ascii?Q?r0g4sq3PFaow7i4cKFdEhJeTsaolyMbmUc+tOcoP7UREptpylnI8Lz8+0xx/?=
 =?us-ascii?Q?mM9Fip/G10u0QatOfA0G01sbqq8g790pLY2j+tSw08X3l3h71+37JJfZ5K6W?=
 =?us-ascii?Q?Mra5OPBkGYNVhrYjo8nRQfUB6YJF9HtNxuM5ob0R7RrSAxax7bwOKbSQpRr2?=
 =?us-ascii?Q?yGt3j3GOW7aNXI7qw8xfGPj4eEE38mSa5/lROHCg5uZodETcI+piX/2pktWl?=
 =?us-ascii?Q?mLZ6EGVRjwDtpCmKhG90N13UxFOy77MhRTjJbFP+GGvDku+dQRSSSPOsmqm+?=
 =?us-ascii?Q?xw7t5UyK6NjBp1LjCijILXZ4eUUdcfqEAIoSCRDeK4k4RU9nmxSZ4lMdKbIK?=
 =?us-ascii?Q?eJ0v3HycpapgAmoApkakdyf01r/hNig9MxKsr8HeoIlxmOeyM6kixGsgG7Dc?=
 =?us-ascii?Q?A9HhwNNNsz7wP/svpYc94IrH48f+/bguboC2f47hFBokY6Y779u86bkBd3Am?=
 =?us-ascii?Q?psczzJHpvQ0b4bkgjPNxlDgumOiLPsS1ceiU0spxYghoUwOY6W8ADrJoNwJL?=
 =?us-ascii?Q?WEWuMFKdx/4J0NurXiCCUSjGFyPt1PxzuG1BFUU7DR1SmoshLqMfPDLYrD8J?=
 =?us-ascii?Q?Gcd3HLUAEt4/NmxacUN3+oE6BrO7+gUeZ9WmYcBWrNcrYb3pYG5LbCtdKMby?=
 =?us-ascii?Q?Xu4IoABTgG0i7UmLjEBHNoRlqLITPf/+hbubIz5KzOH2hIpPN3xBCVk4pd6p?=
 =?us-ascii?Q?RIOFkKNb5DWyr9Msew6DTB6is66PGfyZDklE1fw7ri85wbgo6Jv56YZi8Toi?=
 =?us-ascii?Q?JeR+PN/0OzGfPl2ljKjFoYBNxUKGonxxZFgbFbaIC6ty0MgBxVUA3gk1tHnI?=
 =?us-ascii?Q?BCY+OGJDV+TQIAs+QJaPbllhQim01CFv4N6Ay9bk/iOrEFVHY7Onc96/soFs?=
 =?us-ascii?Q?Xs+L9yDV0Q8Os3g6LIb6S3yP1UtiogZXeQXx83YXJoTwR+2M8oPnrwBBpWbp?=
 =?us-ascii?Q?IMdhZqkKkB4xqW5h/dSRXMPWd+7uwKLf6eKaew41PgGbBVZgHdZtrXWzq+x9?=
 =?us-ascii?Q?KkZxND5PrL9wX9WVr4ZPjXRmHF23UPQrtIX8dwTj2L3mHJdGmdP1Owv1qJf8?=
 =?us-ascii?Q?OVdbMqZyLRF5UhniFhArzz0nzJhoCSHwWXUrOn0HxC3H9rcWopTdomjTE8IL?=
 =?us-ascii?Q?buYwnc9GIHCh9R85Cc1NYIVZv+D5/K/54KufPq7jx4agqlmrPhjjdY/0DY2U?=
 =?us-ascii?Q?4tdQp0pYJ+XeRg3OE+Kg/+quxeOpdHQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	SZk+t6zBWMk3kQSOh7a5FmlzxnJlYx8sA/2D3kc12KJ6uMOxSqUPFV64r8myI9IKlzLyuXqzbJEKq1ES1nHpJfxG+UocS2BUPpDBHwTmIdEgzLM6AmTwKM0/h1+Q0hFW4UM9cqg1+9gZWrIbHTPlUr6gZKs9leGem5n+NAMzPUkzwIDtKmMDPEl9RZPjMFPoRtHfck/n9vHKvaQuIxAAw3gVhqrwGqlkjTS4omu9F71UfvngaBHSlrFSwPLrxkbUVgkUQDBKTOBbvBm05IiTkzJjUjduF/ezzLmoQlmLE6C10KXlJEiTW4BXPr7GvT0XkHN7oYXWfCFNImoyEmLrNQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5dd50d-e1b5-4887-ef9e-08de89a53efb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:59:55.4079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zE8G0y27Kt+RlMfi6w2ZLEYsVtEhOCqpgow0SAby1yuTxoccqR7kjdu59FcIpeCxsZoedk7DBtxSnpwIIwOFWutjRr+jKGXSm+kDCYcMTwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfXw58S5sRbE4GV
 YaK4xuXFARBqKa3xxjsxMtoPyHKB6qybmanAh4uGon/RbFmaQMfjxi3oC4zv30UitBYbEoWJDpG
 G2qi3qzVeDphWfGonTywAVAEbzCxHrpoRJdXM0lRYYo9DGsAOIXcooApofFIWg6wGWfjSUPt8fe
 0VktB+oggGK5yLmf5SMYlm4oWJN/COsZelU524DnRhedmVQU7L9QEyZwxBhBLjNhELN1jxX/kMn
 0twrvXoJijFs0figNTMGRxA0RyCw55OsqsLgzAyCwZLNqCzei06nRDChmPBq5m+esZm29a2yAQt
 eZS2nmkl9fr/vEzQJGZueWCvVLoU/1ZAhKah/BTOBU9yIdu0KtWXdVJLhMG8Ef4mf71Rdc1UjfF
 GE32eJp+wxxPs4+rZwKTc2xpelvaCYffcxdq0mUTebvdlG3KaM9vJaad/vpAKryABbwMh+0mrug
 1qbEta/fyiBBJSB85dg==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c28ad1 cx=c_pps
 a=6O9SViV89A8ZJb2Gg0v8VA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=zfOjHmi-KGxJY83xHr4A:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: F4uPKZXvI3L3Al8yV8wiIBUfsA6TXDCX
X-Proofpoint-GUID: F4uPKZXvI3L3Al8yV8wiIBUfsA6TXDCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 13:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125570

From: Zhang Peng <peng.zhang1.cn@windriver.com>

4.21.2 (2026-03-16)
======
- Destroy GDBusProxy and GDBusConnection on library shutdown
- Make xfconf_init()/xfconf_shutdown() multithread-safe
- Emit signals on the thread that "owns" the channel or binding
- Revert "Make libxfconf multithread-safe"

4.21.1 (2026-03-13)
======
- Make libxfconf multithread-safe
- I18n: Update po/LINGUAS list
- build: Fix typo in optimization level
- README.md: Add uninstall info
- Update README after switchover to meson
- Update also .gitlab-ci.yml
- Remove autotools build
- common: Fix -Wlogical-op warning
- meson-build: Use configure_file() to generate GNU visibility files
- I18n: Update po/LINGUAS list
- Translation Updates:
  Arabic, Estonian, Georgian, Occitan (post 1500), Polish, Slovenian,
  Thai, Uyghur, Vietnamese

4.21.0 (2025-03-23)
======
- build: Automate copyright year management
- meson-build: Add missing function checks
- meson-build: Use SPDX license expression
- meson-build: Add tests option
- meson-build: Use 'pkgconfig_define' in dep.get_variable()
- meson-build: Use 'dependencies' in cc.alignment()
- meson-build: Update debug/optimization flag management
- meson-build: Add missing gir prefixes
- meson-build: Use path builder and fs instead of literal '/'
- Add meson build
- tests: Always cleanup xfconfd process
- tests: Enable t-list-channels test
- tests: Fix test failure because of xfconfd not running
- Migrate to xdt-gen-visibility and xdt-check-abi
- channel: Complete and harmonize docs of get_string_list()/get_arrayv()
- channel: Warn in case of failure in get_string_list()
- channel: Fix get_arrayv() return value
- Translation Updates:
  Albanian, Slovak

https://gitlab.xfce.org/xfce/xfconf/-/blob/xfconf-4.21.2/NEWS?ref_type=tags

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...gdbus-headers-are-generated-before-i.patch | 116 ++++++++++++++++++
 .../{xfconf_4.20.0.bb => xfconf_4.21.2.bb}    |  12 +-
 2 files changed, 123 insertions(+), 5 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf/0001-build-Make-sure-gdbus-headers-are-generated-before-i.patch
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.20.0.bb => xfconf_4.21.2.bb} (64%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf/0001-build-Make-sure-gdbus-headers-are-generated-before-i.patch b/meta-xfce/recipes-xfce/xfconf/xfconf/0001-build-Make-sure-gdbus-headers-are-generated-before-i.patch
new file mode 100644
index 0000000000..35bed60b11
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf/0001-build-Make-sure-gdbus-headers-are-generated-before-i.patch
@@ -0,0 +1,116 @@
+From 6fc6e4408ea021ee8a210e691f1a13b807121a3c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Thu, 19 Mar 2026 18:33:41 +0100
+Subject: [PATCH] build: Make sure gdbus headers are generated before including
+ them
+
+Fixes: #48
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfconf/-/commit/6fc6e4408ea021ee8a210e691f1a13b807121a3c]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ .scan-build-false-positives |  2 ++
+ common/meson.build          | 36 +++++++++++++++++++-----------------
+ xfconf/meson.build          |  5 ++++-
+ xfconfd/meson.build         |  1 +
+ 4 files changed, 26 insertions(+), 18 deletions(-)
+
+diff --git a/.scan-build-false-positives b/.scan-build-false-positives
+index d925d3f..7ab5ec6 100644
+--- a/.scan-build-false-positives
++++ b/.scan-build-false-positives
+@@ -1,5 +1,7 @@
+ # gdbus-codegen generated code
+ xfconf-gdbus-bindings.c:[0-9]+:[0-9]+: warning: Value stored to .+skeleton.+ during its initialization is never read \[deadcode.DeadStores\]
++xfconf-gdbus-bindings.c:[0-9]+:[0-9]+: warning: Value stored to .+skeleton.+ during its initialization is never read \[deadcode.DeadStores\]
++xfconf-gdbus-bindings.c:[0-9]+:[0-9]+: warning: Value stored to .+skeleton.+ during its initialization is never read \[deadcode.DeadStores\]
+
+ # gobject-introspection generated code
+ Xfconf-0.c:[0-9]+:[0-9]+: warning: Access to field .+message.+ results in a dereference of a null pointer \(loaded from variable .+error.+\) \[core.NullDereference\]
+diff --git a/common/meson.build b/common/meson.build
+index 08acd5b..fe30c38 100644
+--- a/common/meson.build
++++ b/common/meson.build
+@@ -22,6 +22,24 @@ xfconf_visibility_sources += configure_file(
+   command: [xdt_gen_visibility, '--kind=source', '@INPUT@', '@OUTPUT@'],
+ )
+
++xfconf_dbus_xml = configure_file(
++  configuration: configuration_data({
++    'XFCONF_SERVICE_NAME_PREFIX': xfconf_service_name_prefix,
++    'XFCONF_SERVICE_PATH_PREFIX': xfconf_service_path_prefix,
++  }),
++  input: 'xfconf-dbus.xml.in',
++  output: 'xfconf-dbus.xml',
++)
++
++xfconf_gdbus_sources = gnome.gdbus_codegen(
++  'xfconf-gdbus-bindings',
++  sources: xfconf_dbus_xml,
++  interface_prefix: '@0@.Xfconf'.format(xfconf_service_name_prefix),
++  namespace: 'Xfconf',
++  annotations: ['@0@.Xfconf'.format(xfconf_service_name_prefix), 'org.gtk.GDBus.C.Name', 'Exported'],
++  install_header: false,
++)
++
+ xfconf_common = static_library(
+   'xfconf-common',
+   xfconf_common_sources,
+@@ -61,25 +79,9 @@ xfconf_gvaluefuncs = static_library(
+   install: false,
+ )
+
+-xfconf_dbus_xml = configure_file(
+-  configuration: configuration_data({
+-    'XFCONF_SERVICE_NAME_PREFIX': xfconf_service_name_prefix,
+-    'XFCONF_SERVICE_PATH_PREFIX': xfconf_service_path_prefix,
+-  }),
+-  input: 'xfconf-dbus.xml.in',
+-  output: 'xfconf-dbus.xml',
+-)
+-
+ xfconf_dbus = static_library(
+   'xfconf-dbus',
+-  gnome.gdbus_codegen(
+-    'xfconf-gdbus-bindings',
+-    sources: xfconf_dbus_xml,
+-    interface_prefix: '@0@.Xfconf'.format(xfconf_service_name_prefix),
+-    namespace: 'Xfconf',
+-    annotations: ['@0@.Xfconf'.format(xfconf_service_name_prefix), 'org.gtk.GDBus.C.Name', 'Exported'],
+-    install_header: false,
+-  ),
++  xfconf_gdbus_sources,
+   c_args: [
+     '-DG_LOG_DOMAIN="@0@"'.format('xfconf-common'),
+   ],
+diff --git a/xfconf/meson.build b/xfconf/meson.build
+index e3ecd55..15cafa5 100644
+--- a/xfconf/meson.build
++++ b/xfconf/meson.build
+@@ -39,7 +39,10 @@ xfconf_version = '@0@.0.0'.format(xfconf_so_version)
+ xfconf = library(
+   xfconf_pkgname,
+   xfconf_sources,
+-  sources: xfconf_visibility_sources,
++  sources: [
++    xfconf_visibility_sources,
++    xfconf_gdbus_sources,
++  ],
+   version: xfconf_version,
+   soversion: xfconf_so_version,
+   c_args: [
+diff --git a/xfconfd/meson.build b/xfconfd/meson.build
+index 6e46a58..13e614e 100644
+--- a/xfconfd/meson.build
++++ b/xfconfd/meson.build
+@@ -56,6 +56,7 @@ executable(
+   sources: [
+     xfce_revision_h,
+     xfconf_visibility_sources,
++    xfconf_gdbus_sources,
+   ],
+   c_args: c_args,
+   include_directories: [
+--
+2.50.0
diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.21.2.bb
similarity index 64%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.21.2.bb
index 168bd4d790..fbc0cffccc 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.21.2.bb
@@ -5,11 +5,14 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "libxfce4util perl intltool-native xfce4-dev-tools-native"
 
-inherit xfce gtk-doc gobject-introspection bash-completion vala
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+GTKDOC_MESON_OPTION = "gtk-doc"
 
-EXTRA_OECONF += "GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen"
+inherit xfce gtk-doc gobject-introspection bash-completion vala
 
-SRC_URI[sha256sum] = "8bc43c60f1716b13cf35fc899e2a36ea9c6cdc3478a8f051220eef0f53567efd"
+SRC_URI += "file://0001-build-Make-sure-gdbus-headers-are-generated-before-i.patch"
+SRC_URI[sha256sum] = "99aa4366e909ba7b9f746aba48b610b9e9d2933aeb283c7fa5f37a7c3dc7a3a6"
 
 FILES:${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
@@ -17,6 +20,5 @@ FILES:${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${systemd_user_unitdir}/xfconfd.service \
                 "
 
-FILES:${PN}-dev += "${libdir}/gio/modules/libxfconfgsettingsbackend.la"
+PACKAGECONFIG[gsettings-backend] = "-Dgsettings-backend=true,-Dgsettings-backend=false,"
 
-PACKAGECONFIG[gsettings-backend] = "--enable-gsettings-backend,--disable-gsettings-backend,"
-- 
2.34.1


