Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E041BEC01D4
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 11:42:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15259.1774266138556880780
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 04:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gxIL4U5g;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542b98c32=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5qR4a3908974
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=PfCuIBbsr24Dky4ykuISFoCP/okc9I7bHReeRd69Oq4=; b=gxIL4U5g5ePt
	fI6DHG0+2BRUOStZRW1VP+1Zp26VnenpX0udi1Eqh2+ALgvKXZ8w/SnAeWq2m17f
	wdwN+uqv/SRz+K4VZ++ABKWTkymt9iUk5MNd+DPb0tcD2Ip1AS89C7iTfxHm2xVf
	1OeePOxIB0mhRDBBlZSZIRXpNxrDPSF9JQBkFq/Ts54L+ISTYXnehMZeampUbzFf
	iMkcZKD/S26Jn4pO9P3eo82saZ+46WnYd25bJSGUa3qn+ES4mB+EZ1h6sn028Pbc
	YHAiZzrBGqYDpTZbbQe1cBA+Jvy+2+cH3kRuDfUtjzWnMP78epSq7xEn+Xun4j11
	DERlLMmuog==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010069.outbound.protection.outlook.com [52.101.193.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1tucsea2-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faFrOV9QBeZvxygeZiJ2Fvp6f+eBhgNfoWW9WVVSORsIwsMRvua0zAj6ee1vLkZV+pzKrgnKNbLwYJXpFbmYeh24xC0mw2cYn7U3mMoTWXylDpS8wvujymlOvOjGyqM9chjF8hyuRZe/pRQjyQPAavhI3Qh3JdEyIw+7IphSLvg1VSG/ZifPgcP/3EDiyUmmzrcCdH/SctrEp5f5T9Fu3MPAY8Z1qWXU7CS8Ob/5qirBXIXrOKgNJVkgmblEFsXP6dNduBN0CQEBsJm22ZbZQ8Br/SIqB/wuFDMcC0NexQrgBzT03fT/AvVHOqmEkW1mf8Xbzexy+Vsk1l8WXVS92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfCuIBbsr24Dky4ykuISFoCP/okc9I7bHReeRd69Oq4=;
 b=Gzlpy3/qnXBBtjVzbPqjp4EzRrNtQiVH6ocsTC09TQGUQv5+g22IKtRG5N42u3ds3wCvtcs0IbJHOK5GzAS+j/AZYYys5Vtb8Nm68PII/Z/kIfhz+QoDRruxWUKrJuC9Wl56LxTE5m84gt0MU8DXHxVYSpKOm1UWa3Nvj5jWY5Lx8j45I839CH84jsBiT+rv9//FlYT3Ea8tTbeJ/liKTUwlFde7QMcBdGxbf6zUemRpRjbL3RS3RC8jMV86EEZGrqiC6lPu4Ht9RE7XlkAl5T1zj3TTXG466vVAV7DQwvMCmhr9oSqcHpAsO1sYp9bFIncZ5ebFTPFlWq64sOGiHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 11:42:16 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:42:16 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 10/15] xfconf: upgrade 4.20.0 -> 4.21.2
Date: Mon, 23 Mar 2026 19:41:47 +0800
Message-Id: <20260323114152.4178269-11-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
References: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: e5582ff8-7a93-4770-6a16-08de88d13b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	d9Yb/4EiFOZao2FUJdquAUSoQL/LNtEfqy6XGukIy47mSDmc7OAmOlSFH8BKc444Hgnbo7Lk+YeHcBJuhuJtxqsOttFX/wXP249pfHBWyMgjuWMNAGEyhDCKecVjUc7UX/V9ptPkOHo+MugCXfU1GSIXrYMG7OAbX9YYA9HQ4MX0ArqnFGYEmy3W+kYPLDdbxDbgmfniFZ0/r4DBJ7YJwmK3jXowKequ0pD+Hl98ITnF9sUu6bUVMWv8UIYpaJL9+jfU8GbOS6RLrEUmwP1LCF3m67iG9hYx/3Zhq6KQjFpoZzIBtuKdcig0YB5sIpTy3fIMD1n9L212ljgehCUo9rGTGn7QlMtQ2/LuEIf1B4tIGMpDo5repqpzIIBjkxKiRAB3Ndt61dXi5VWq2Rhq1+p1gf4e5LQ5kkoSDC0lON8nXe2rIEzTIJLLcwidK0M6NnK9bOZ6myc9Rzzi+veOh3ieFtHcRH/8rPIQrINquyHfobUpFYB+bHkPGqVQSmSryxzzs5r2nABwLAFjqXQTFxPEkjqE7VPIgv6BG1q5jyvQeqLRjd7YHJ4Fdt6xpO1PJi/miHQlRz6AaKkzc+In+ZZxuANnVSYS7wm6/lD3S/N9qM5CaOZjDHIURRIBe+aQCEWldWUezfT6nuWnpF7vDjGdhBXMA+QMPMcuoRASvZm37OokRK5iZeW2n5IAO4wwR3Sipk9Cm8+xmRR5nIfiw/9yirvgZ6x/ChfVRdj24aR9/qKYDlZoMkj9tns0iOv7GX5JPExAVcN1wVv0iHug1brEyJF8eZ8KKEvDLoi6q90=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q/sC+hTJi2MOZvEGHYN1lVIYaoG3TtAX/YMPVGPy53vuTR/TnDYZGH2dZMhQ?=
 =?us-ascii?Q?zPiKORq8UNxtL7P8swXlpvwfwE1cWRiDTYZRiC+BGIOSIVNNtovQzqwNj4ei?=
 =?us-ascii?Q?XaNffGxNEvbfx5SIHXuV+RVa/FomOA7kQ1UuutcX1VpPnsR2IXmgdroYUokE?=
 =?us-ascii?Q?bBsdS+oo98KVxxzGeekUGoSP/6mi5xiZUjxPy44RlEAt2+2FawEbxbvPV7YW?=
 =?us-ascii?Q?F5851ljGhc4nmtS6E24tFf5cDJ3/Raq4ii0j6jcGZK0QiamaNJt6f1wYOaym?=
 =?us-ascii?Q?oXtTsXQacpXYl5CiNs902fdQLOPKlowuhVSRf/wulo+zeAgtJjNYJnYy8pNy?=
 =?us-ascii?Q?s7SJHmOswGql5f08FCy5vx1Ye/JK8QP/zbR94oEtDOc+WjO1CnB6OObDbjeu?=
 =?us-ascii?Q?xpoiLR5vfBy6kqZtU9OacKmB9snmc9VFMDhe6lznqbtRUGDIW+m+EjfJUKMO?=
 =?us-ascii?Q?LcgDfiM/uRRi4LdprKQFFNuA4sAxJ1D1Gqugc8KmOhxOOC+UvR25prZugVcg?=
 =?us-ascii?Q?6mEOGzFEUbDCNoWITswV+9PHiVAnOjczm6MU+FDCUCMepKdh/K+vh5ej9F2s?=
 =?us-ascii?Q?Uyxw0yqpm55vXkpYIVpfFX/aiZukicogBwvXwIJUeRF7dnT5EuO6kIt/ZArc?=
 =?us-ascii?Q?QBEze+vEzqCIg6p6DgKpMSQ9lBXMm100mmtYTmVc4vbBA4iHicimfsyLtNd3?=
 =?us-ascii?Q?IjZ2wUw5/gGddccdTPtM4avRNd4ylHZ9oy9hIsFoV96ogQcspQfadaCiW7k5?=
 =?us-ascii?Q?rK8J7Ibo49NEtN7SJfX7SNGBsnu40ZGLtnBr6mgzfwaTfZej04Iz9ZhbQVY3?=
 =?us-ascii?Q?2DLQvlv0Wk/cS0Y3Q/05VDIz7mi2lRtBRh0fbdme1wd6OaqlFop7i/0V6wf6?=
 =?us-ascii?Q?lRB+ojs7jcLjgSamoLSBYTqOPtT2ImDBU8nUL/NSnxeFs8qhj7oXenIwh9nn?=
 =?us-ascii?Q?XcY7TyywKC+wOhfZey3u2+V//XTKQ08Ljrxfiasl4lcw4RJFiM+XeF5HLKck?=
 =?us-ascii?Q?fpIxH0A7TkMPhppL0jXmEjlRDGy1UvXSPcFCSBz8dpYoRIE1m7KtNbJvuKFl?=
 =?us-ascii?Q?mbKs2aNaPyAW4yo6NgQQxTo+ooUcTqf7QqPEvMnsAAMQwROwv68xtQ7P0FkT?=
 =?us-ascii?Q?BaN4TwcZiD7gZc5+oYLtjZv9XqC2+QN6pcm70roM+6tl+Ceb+NTyE/HAOMI7?=
 =?us-ascii?Q?jjEITaXSLlq1pYNp9JrL5yDksBIk0W0arJe/KMhAHhWUCMIR+ElxYnMPB+ja?=
 =?us-ascii?Q?nzaN9BZ6t4vwI23sWMVYqdSFL2/gMAX9oBriCeNZaNOrmLPAtyqUeVMYtEzN?=
 =?us-ascii?Q?N9Lxw04gIjptucQPA1+98JTr0s7GjdLV2jO+jzialjJUCdqXi1yEfO3ZAPmU?=
 =?us-ascii?Q?SMu0drA1unKlNJHcH0BTNex+czEI+C/MznOY4UbEtOpp5LqEx1hXjPx7iZ2k?=
 =?us-ascii?Q?cjxDYHcGBwD6Pw8vEuHHfOO2P2KKlv3UdfQlQ/BvR2uge2+EIPDSSGZbKHGd?=
 =?us-ascii?Q?E+th/8QGEFLtmXD6TLG6/XLbGp/my9R2yvKkSCeJGal4hVjqLZhf5zOq/F8B?=
 =?us-ascii?Q?odBwcxEgba/EQ5f6WVzAHryUozkl0fhhVt22xJ3tpMPOTUaRojVsI0VsWqzu?=
 =?us-ascii?Q?eKKgjA1kaCARXkrFWdq1JjaiZA5JMzMoQQ7mwPfJ+9bLHHecrRyAtEExfP3U?=
 =?us-ascii?Q?2TSVLSLNqFCJ1vnVLM/bPuJyuXikn4GiZTyPgKSiqscOS0o59hh2DXwYNFrA?=
 =?us-ascii?Q?9K/6XJtb/ii+yNikfOcoch1lvixaxuk=3D?=
X-Exchange-RoutingPolicyChecked: 
	Z7matnJJkatqzERki5R6t5fCFvef3xYvskW0sXKIHp2mEfZYB58UCr2WMymy9FZWQCLmMBkKJKkEFPqj+R0sHwHa9Qcgj7aEE8+MTMtyXy8572l5FyJGQacoFIdkWuh1IPuNObBsmPzzCz5u/HiJltCWB80AOA9yCGOo8RrCUKP7k19/CGFz7U4NhNS6mrs0LyiRgk4vB32RXvaucfX5CpxNKHoFhonRmcWpew9NC4OE/MQM/2p+nQO1w4ngbVPFXGK17AfrrIk47MDJkxLngAfIXnA+j/7l3OLdQAtp0bBpE2AyTvxozVFFk4NqtMZ4fq2MZbBHAr2P+rhYBl3teA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5582ff8-7a93-4770-6a16-08de88d13b5a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:42:16.0762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n55Y43L7wQ/wAyrvz/V1OloOZIw3O3ldTFO5RIDkz+GfFMrvVowwkj5YInO5qdDDqwaiBKy3bvKUgfXcZxwMpuqGeLTr7RAgscb5n45jfSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
X-Proofpoint-GUID: 3bmo_F1uiJChBk3ocjln8tmoTXMq0s7b
X-Proofpoint-ORIG-GUID: 3bmo_F1uiJChBk3ocjln8tmoTXMq0s7b
X-Authority-Analysis: v=2.4 cv=deCNHHXe c=1 sm=1 tr=0 ts=69c1271a cx=c_pps
 a=hksmzbl9AP/Wdhn7pSFcZw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=zfOjHmi-KGxJY83xHr4A:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MSBTYWx0ZWRfX/h1Gf2j/EA4S
 Y2HlP2BtjtxcOGE44auIBjLP237GbZ0JrxoYO5QgEAJz3swDueETJ1f0C87D+QQ6ZPP0Cma1m2F
 QkWz+omE34QZ+yOw39MISSKkT6GCuJvj4h6EL707ltNJJVMiG/dQ8OczQx/xU3IuuBCF15b/GHC
 gHNUbCii48VtLfYruy2E570PmeA5J8Pt5aclTVC3lOE2hHynV9jfkz6bMwo3J7/CegQvlhUz/1t
 kbIJ012E6mJbIlTPbIDZDDLdcUaYUs5nrz7zoOXx6jXcbsIAYlvN80uLc2OG+y8rJQ6Pe0DX2HZ
 4pzXPwQTe7iZekyYAhVFcK3G9TFn+KGWsS4fVyMtnAy/NWHBWvqC/hXi55sy3dtJS5Q30o3u6+z
 UUlUSrNfkmJlFWznDgV9Zvqw9FXje4QOXx9p7H5svRY5avnkIMXGxmU4yipH8r67l+Rwhao/Evz
 8THe/y+E+csi7RDDguA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 11:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125513

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
 ...gdbus-headers-are-generated-before-i.patch | 114 ++++++++++++++++++
 .../{xfconf_4.20.0.bb => xfconf_4.21.2.bb}    |  12 +-
 2 files changed, 121 insertions(+), 5 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf/0001-build-Make-sure-gdbus-headers-are-generated-before-i.patch
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.20.0.bb => xfconf_4.21.2.bb} (64%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf/0001-build-Make-sure-gdbus-headers-are-generated-before-i.patch b/meta-xfce/recipes-xfce/xfconf/xfconf/0001-build-Make-sure-gdbus-headers-are-generated-before-i.patch
new file mode 100644
index 0000000000..fa0ea0285a
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf/0001-build-Make-sure-gdbus-headers-are-generated-before-i.patch
@@ -0,0 +1,114 @@
+From 6fc6e4408ea021ee8a210e691f1a13b807121a3c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Thu, 19 Mar 2026 18:33:41 +0100
+Subject: [PATCH] build: Make sure gdbus headers are generated before including
+ them
+
+Fixes: #48
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfconf/-/commit/6fc6e4408ea021ee8a210e691f1a13b807121a3c]
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


