Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AE6F54AA2
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 12:59:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18829.1774357195195994106
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 05:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PaRNjscB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OCT0Dr2053767
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=zuVwmgMjvna4vrAeO15+2RpKoOTHFug0CBQfhkBMbMU=; b=PaRNjscBaaW6
	AYVPrboLD16L3zX3N7v7gzla+K0WHpxHKmyQbd0mQA/UB+adfwcBXARdjoAKGtwI
	Kq1bpKL0SqgvT04CKx29I8BSGtEPfxqAVPbQhomnkFH5OGtoV4XRZyWAIq79f0Nv
	wgpDFLu0l0hjbtwBXSXMsT3UPOZekKMN2K5e/V15sB7+o03MbcRG2a0/UH8Hivq/
	ky7ega9ffqYGCrORkPwdQo9uDReyd9QuIBw5CC/lRFXlyhOcbCW9WXguD27nmyCL
	hrvZyqLRfX2qOQCny3i/8rvmrCFzWOxIo1dyQnNobtJOTSIwcjjIRDAeb88GqaWu
	R9u1+pENjw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011042.outbound.protection.outlook.com [40.93.194.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj83d89-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdVKeVEWFPcGLh3bim4mjclS+DTZ4nka0e/RW5+1V57pSicUwLzRxgnSUSO2AzPaxWkYeZFig2MdysYWXw38hbKE2jJAxe8h+0WzWfBIOh8Sn87I+EH5472MzFi66WqRnxdJm4MWwjADp2nwNrtneEgmUBaTQoTIvH4vE8CfvoBk0U4PTNDjFyOU7Q9mFcZRzIou0izwFCGzVEvmYqzjj3IHFO11GxK0a9noOQJsZoN7fgwHrQ+leicGFh5YSbu/Qk+2HfjGs4e41CUTwdm80rVneY+NiuPwjtQOJDjHCQvtXMxV2NV37i+AGz6QQkKOhcY3+0E3QZxm+WtTI9BeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuVwmgMjvna4vrAeO15+2RpKoOTHFug0CBQfhkBMbMU=;
 b=gQaRvpvXkLm9S1kAh7AIuNxcclTZrRMtY31hX61ctZslrFFR0IdezEKuKuXdoC1HZkBsqkA1etx/XIx2pdTNzmNYo1+4ezFWJ2sRLcElrw3QBnuPWWy9iNXosyN2aZp2QEdOOBvkGLL6jji4UGVf96y7fAAd2nESf4sqkmTu25A5X5n+yezpKjVYKpQEX22WIs5lhLDOiMq+BtMnuIr8FO54PQW0tlLO1YDBte45/WEZYxzziS5UITZonfX/Nc+RpPOyeSFa8PO5QStUadmNqoozHL1+Ag+sEXl+vY4lLB9j4KrQYp0Jk0WhW6djk2tl+uvgqv9I0hwbpdjQ2C+j4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 12:59:52 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 12:59:52 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 08/15] tumbler: upgrade 4.20.1 -> 4.21.1
Date: Tue, 24 Mar 2026 20:59:20 +0800
Message-Id: <20260324125927.1070644-9-peng.zhang1.cn@windriver.com>
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
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df6b6e0-5f3f-439a-64ef-08de89a53d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	08b98QLkM/682N363YF9cAFyPSsL4VTvhOAPseWfR0IrgMyOiIh4ALw+cIJBiKj4MPxyuxz09pfpQywLHEq18KJEMdnk2vWZAN8vTXjmfdm/lhO41fQDMVgUvGQLQxixnQoSMxWcF6yO9hLafcuzyoxZeU5jrMcIpYHbJ4ViLq8578jgetT68/Yu1tIVJYXXW24fi46khkgYV3Mo+PLJiBdFC7Tvz/wapTFtoUsGAuoC5SjMlgWMBfVSGSGNCGYysMTjGrd7Jy19/DSnalXA82Ktz1e4wSS9Mwh425spcZcZHKFPoE1P44P77CyVsuvImI3Fz3VkPJm32QYxXNF1wpFE2RWsVlJJChnLx0rvHVCmiul2h0OOEgxJRp+07qSR1zhKNNA5qAOycsRwhu5CerbEULtJ7MzZeq5um18ST9p/sf4H/ZJ1WZSIUA2eEhl4W8Nq09uky5GUUGsSqVauFhOxa19sb9pmR+F33dzczdVt5IY/ij9Q7CJC4hKscQjKnuX2Rspc3uGYKPLC4mxecDO/C/DzBzD8bB//jm5D/1uriDMij/GndNnAtPg9lwdLJozBjhv/AvJli4pwWD3on+dYCF3t/1hyM8OY2pvDDojQ0LnATEjQ9+S8igvf988O5Izz08moO7bUxZ26YqTGBG4MEhT0kSj6qPfes8XnCGZrJviNje+TblRl5tvrx2T1J/7X9naE7tSoQG6tgJFIw/OjLrGpEnwWAm3OVek/+8w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qFJ13VyPPjmNv4wZf3yLGK1ZpeIqZpQ4ZUtmeTI/zpS5peXWFz6RFOEuGeWa?=
 =?us-ascii?Q?GlPse3mTuAdZOZpxTv1ZPIvYEQRT0A0ntfW4BKHs+Ch+yyrrMhBLagTeKCGo?=
 =?us-ascii?Q?cXTKeUpZiBDBc2DZ1yjHs3EWp4UdWcbT1m1Hlmn8y/anybjMGLpsQ2PWdtV3?=
 =?us-ascii?Q?/wWV19VGPJD+4j+xwSb1XbIqKxzuDmMXkNdoaEbqVQYitK7UD2OozHtWuff9?=
 =?us-ascii?Q?2bkzLttrJjNRoaOQ1zKypIlqaUNK2HodNEmZLD9fmDqSn7QkjG8UXupw3ufA?=
 =?us-ascii?Q?puGNPLSz0KmmlBWEEY0SGMA3/PdZBn36C3agseJRT9RcYIln1WZ//VP8z2wX?=
 =?us-ascii?Q?0QtRAydp6L5AhwPY2glEWpEJ3M7wH9+D5fwyDVBrrah7ergr8b6LaILeVN7/?=
 =?us-ascii?Q?W/whYr9kspzl3+sP1JsJ03ZB49MqjUahs9Fid7CTPD7CL0G6xsCrS8DgTb5w?=
 =?us-ascii?Q?bss9385R/X4aFBN3ujP0phXtqBHpGVSynQDeeZnkOYs6/pcyltt0xBbKJHYn?=
 =?us-ascii?Q?ZTZ6w4J9VtaSI902QiyiqyR94VZqumec+7wYUGcMmT/Oy9NKbXT/fjOR5zjl?=
 =?us-ascii?Q?JgVL3+hYwbdd+QKCNjdRENVg9B/go19jvkn0JraIQyIp6g040uqsTrSl3s3N?=
 =?us-ascii?Q?6h2uTF4aN92L85vWiljIQLp1FJwUNd/3fTZnhHG7Ns56fPppGaw5zGQxGfKO?=
 =?us-ascii?Q?mxCBav/8xS44b3AO4wZ2tsG+fw7HYmCdnNDMnMWQBbxyj0MTaOCMg6MOKuVt?=
 =?us-ascii?Q?fwvsYAd/bpzEwtbNG0mKQGzwNdM+n5MmT0CSBM6Nxa8GNChtp3gotm4AENym?=
 =?us-ascii?Q?LAwHoVibeYuJFYnD8VmWoeDXcqWnCdrbTWNav85AdG5+VIWACddI6yJE+VrT?=
 =?us-ascii?Q?vPG+1GpCDRxN3Topa9oK+IifxeiI9hprgPmq6IxSZeOmsgr1iSAFWbswP0uT?=
 =?us-ascii?Q?JcB3vh2UG/GB5ofDoqA2vOfC1wfHERqUsystiSQ19mtDkZk8ObMIB5svK602?=
 =?us-ascii?Q?Rvtug/jZnW3DUztH+X3RL8qL7GLXM7IwrRUhcnsiPAHCeHFcL+kLGpn0V0jO?=
 =?us-ascii?Q?g9kXni3pGndToHYBRVnWCYW3TWE3qJn1zlRVT56uKHP6wnvujfzq+iZfVeHs?=
 =?us-ascii?Q?n4AjM7omOvJiwiXfP4k6gRC0O3Odeo1JjDjtU6WUmBB4GWlWpj4RQl5eTcOh?=
 =?us-ascii?Q?MV7YJ9ggErTQ3etxeF9XKfRBaXQg88zlOpV8Hr3sXp+vFATfNBy6d32Jtf+O?=
 =?us-ascii?Q?T6QOGn2ESLXfaDD8I7lhnyb8AoywFIqK/Cgv14pw7/mxVKM4cF4syEg0eRSF?=
 =?us-ascii?Q?nByfTxbanUQrrlTuk7lRaOFkas9KWuqcqR9HoD9QxwYj5j0HF+wzehWX6m7s?=
 =?us-ascii?Q?+CchGIme+el41J3WnYeEYHS87UlEetJ8/cmwV3xFh4cIpOm4SjCPuYr+lpiA?=
 =?us-ascii?Q?4HYeQO9KdRlL7YQMaIGIHwD7VriFAzCVsmml4lYNSZG3Sych9VlSdflkrqim?=
 =?us-ascii?Q?V49U1y8FrZ2iqIosPVFfMDj0cEuRR1Vl9NoQzVLZNR+/2JZ4FcpPcyW5XgMc?=
 =?us-ascii?Q?aj2LIf/qdmZecGtfGL0G4kILeQq+DYMnGcBnqI+ck5N8ZcDIuqyT7csxez+M?=
 =?us-ascii?Q?bAteliPwC1fqx6PtoEE7lPeX8cTuGYu++cxtJEucR7SUsLCS23OT3BkNfVoj?=
 =?us-ascii?Q?wC5wsV7tf+hNEHoChLXDd7KXA974ze1kRl05YJdwK4u5pJ9zSA7n+jVO6iei?=
 =?us-ascii?Q?h9bjt+OSXnPIYlTJOWdZQ4/DAJJy8RY=3D?=
X-Exchange-RoutingPolicyChecked: 
	t6eAD8PydqaFNExwgGRQCzkU1laHBOBWsqa3M8aRo3VLjhmMU0/EsFdapQoumCT4eqxWmB8+JvZcXU28uD8mx5acpQFaY4d+DcuB/FW0wuqZu6UIyQ2BcrM/ghKZvTiwXo8k46A3l/NHiLEaqrHiw0DhAsLFFihoE+Xy74CYtqarmWrBqDamq0Y5soG1nDO0oWQT0B0vjZo3SenikvgIRMbF1r4w0hnj1+WNL7Ddlqeh3OKJVaY0bYDIcbxKTM8IUgbrsLCyC2iKD1f61D64P4QqSbL40JGYly1bTqJKY7kjEa24Vd64xuhVadAJep/zxZphoXogONTrgAdspC/GyQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df6b6e0-5f3f-439a-64ef-08de89a53d3b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:59:52.5206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzUHKDgVD12vlO9iX0nw3oz3A576WTkg5FpLNNLeBf2h84j6kXIPs2nTTjsgQlaCUcs3qj9phYa4ksudg3RSDcbOBJ0SYq+Ijkr/iQflPTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
X-Proofpoint-ORIG-GUID: ClnixMVjPobVxaJ0v4vFsNod-H8g3MB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfX7IHwFgkFpHr4
 wbzs4qLBEKPJYa4guOT8SQLM41tvgg83aZxQ/kCEtzvmc4rOLxu5M2R31kFh9hYc4ay0LC3it8r
 ITRTKDzW/O0/DX4Ix0GPuBRTQ1+bjjRUDktZBEBO9Il7hB79zP3Eze0fPX/ExTo3xgs63bbM2of
 uVu89OoknLC1NFav0QCyfl88NRKa12I9y3MiawcTvzeKklr/eNRRWGj3VDirLU6eRmtHKFAiV48
 UQTCA6HqmnAamQEuZHL7BoBBZIMasmErI0wDs4Nydkd8DQF0UvY7wuVXa7j2a3+glhjWG++MTiT
 hWwZMTDkgji4/1RiPkeFnOUDRW0fN7YQNaA3OOpXM4qV/p8d5Qyz+DNChmQ09QvBnGaIUc6fqGj
 keSjGwzxkclS1ztkBSwOI4k6GM9C3EBpt8DFNUUSt3++bFDF9lEePdmKD40ZUL069uHbJ7DvLkf
 juzKVUBGx03/DsysaKA==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c28aca cx=c_pps
 a=audpxvcsMtk9YILK9bmPfQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=W29n_M98FV43VrqEp0IA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ClnixMVjPobVxaJ0v4vFsNod-H8g3MB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125567

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
https://gitlab.xfce.org/xfce/tumbler/-/tags/tumbler-4.21.1
https://gitlab.xfce.org/xfce/tumbler/-/tags/tumbler-4.21.0

Backport patch for handle case where no plugins gracefully.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...here-there-are-no-plugins-gracefully.patch | 57 +++++++++++++++++++
 .../{tumbler_4.20.1.bb => tumbler_4.21.1.bb}  | 25 ++++----
 2 files changed, 71 insertions(+), 11 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_4.20.1.bb => tumbler_4.21.1.bb} (63%)

diff --git a/meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch b/meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch
new file mode 100644
index 0000000000..3a3eb2fd64
--- /dev/null
+++ b/meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch
@@ -0,0 +1,57 @@
+From 95244ee0d1f3184e2c2cae9d33095dc03829b10e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Fri, 20 Feb 2026 17:07:56 +0100
+Subject: [PATCH] Handle cases where there are no plugins gracefully
+
+Not sure it makes much sense to allow the cache plugin not to be built,
+but then again, why not? It could be replaced by a customized
+implementation, and it has always been possible not to build it, so we
+might as well leave it as it is.
+
+Fixes: #109
+(cherry picked from commit b4f4db4bfc1a45f0a405c4516e38394a44c90fcf)
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/tumbler/-/commit/95244ee0d1f3184e2c2cae9d33095dc03829b10e]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ tumbler/tumbler-cache-plugin.c | 5 ++++-
+ tumblerd/tumbler-registry.c    | 7 ++++++-
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/tumbler/tumbler-cache-plugin.c b/tumbler/tumbler-cache-plugin.c
+index 50700a3..e308638 100644
+--- a/tumbler/tumbler-cache-plugin.c
++++ b/tumbler/tumbler-cache-plugin.c
+@@ -188,7 +188,10 @@ tumbler_cache_plugin_get_default (void)
+       g_object_add_weak_pointer (G_OBJECT (plugin), (gpointer) &plugin);
+
+       if (!g_type_module_use (G_TYPE_MODULE (plugin)))
+-        return NULL;
++        {
++          g_object_unref (plugin);
++          return NULL;
++        }
+     }
+
+   return G_TYPE_MODULE (plugin);
+diff --git a/tumblerd/tumbler-registry.c b/tumblerd/tumbler-registry.c
+index 705dbc9..b58e831 100644
+--- a/tumblerd/tumbler-registry.c
++++ b/tumblerd/tumbler-registry.c
+@@ -534,7 +534,12 @@ tumbler_registry_update_supported (TumblerRegistry *registry)
+
+   /* abort if there are no thumbnailers */
+   if (thumbnailers == NULL)
+-    return;
++    {
++      /* we need NULL-terminated arrays for the _get_supported() dbus call anyway */
++      registry->uri_schemes = g_new0 (gchar *, 1);
++      registry->mime_types = g_new0 (gchar *, 1);
++      return;
++    }
+
+   /* clear visited flag of all thumbnailers */
+   for (lp = thumbnailers; lp != NULL; lp = lp->next)
+--
+2.50.0
diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_4.21.1.bb
similarity index 63%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_4.21.1.bb
index 7a01882d57..7ab4b59416 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.21.1.bb
@@ -5,23 +5,26 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "xfce4-dev-tools-native libxfce4util"
 
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+GTKDOC_MESON_OPTION = "gtk-doc"
+
 inherit xfce gtk-doc systemd
 
-SRC_URI[sha256sum] = "87b90df8f30144a292d70889e710c8619d8b8803f0e1db3280a4293367a42eae"
+SRC_URI += " file://0001-Handle-cases-where-there-are-no-plugins-gracefully.patch"
+SRC_URI[sha256sum] = "0f499f79a2a7ee49726a433584dd8a680d514101b72bd1b003360611ce1dc244"
 
 INSANE_SKIP:${PN} = "dev-so"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[cover-thumbnailer] = "--enable-cover-thumbnailer,--disable-cover-thumbnailer,curl gdk-pixbuf"
-PACKAGECONFIG[desktop-thumbnailer] = "--enable-desktop-thumbnailer,--disable-desktop-thumbnailer,gdk-pixbuf"
-PACKAGECONFIG[font-thumbnailer] = "--enable-font-thumbnailer,--disable-font-thumbnailer,freetype gdk-pixbuf"
-PACKAGECONFIG[gstreamer-thumbnailer] = "--enable-gstreamer-thumbnailer,--disable-gstreamer-thumbnailer,gstreamer1.0 gstreamer1.0-plugins-base"
-PACKAGECONFIG[jpeg-thumbnailer] = "--enable-jpeg-thumbnailer,--disable-jpeg-thumbnailer,gdk-pixbuf"
-PACKAGECONFIG[odf-thumbnailer] = "--enable-odf-thumbnailer,--disable-odf-thumbnailer,gdk-pixbuf libxml2 libgsf"
-PACKAGECONFIG[pixbuf-thumbnailer] = "--enable-pixbuf-thumbnailer,--disable-pixbuf-thumbnailer,gdk-pixbuf"
-PACKAGECONFIG[poppler-thumbnailer] = "--enable-poppler-thumbnailer,--disable-poppler-thumbnailer,gdk-pixbuf poppler"
-
-EXTRA_OECONF = "GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen"
+PACKAGECONFIG[cover-thumbnailer] = "-Dcover-thumbnailer=enabled,-Dcover-thumbnailer=disabled,curl gdk-pixbuf"
+PACKAGECONFIG[desktop-thumbnailer] = "-Ddesktop-thumbnailer=enabled,-Ddesktop-thumbnailer=disabled,gdk-pixbuf"
+PACKAGECONFIG[font-thumbnailer] = "-Dfont-thumbnailer=enabled,-Dfont-thumbnailer=disabled,freetype gdk-pixbuf"
+PACKAGECONFIG[gstreamer-thumbnailer] = "-Dgst-thumbnailer=enabled,-Dgst-thumbnailer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[jpeg-thumbnailer] = "-Djpeg-thumbnailer=enabled,-Djpeg-thumbnailer=disabled,gdk-pixbuf"
+PACKAGECONFIG[odf-thumbnailer] = "-Dodf-thumbnailer=enabled,-Dodf-thumbnailer=disabled,gdk-pixbuf libxml2 libgsf"
+PACKAGECONFIG[pixbuf-thumbnailer] = "-Dpixbuf-thumbnailer=enabled,-Dpixbuf-thumbnailer=disabled,gdk-pixbuf"
+PACKAGECONFIG[poppler-thumbnailer] = "-Dpoppler-thumbnailer=enabled,-Dpoppler-thumbnailer=disabled,gdk-pixbuf poppler"
 
 do_install:append() {
     # Makefile seems to race on creation of symlink. So ensure creation here
-- 
2.34.1


