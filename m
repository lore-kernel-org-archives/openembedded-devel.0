Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBB5CD4F44
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 02:59:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15352.1763002756870432357
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 18:59:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=i+6oS7ry;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3412a946d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD2vgQg114160
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=7r865vihvaUuZ9ITFUqdP38mKU/2M72sMQ6C9vRd5Xc=; b=i+6oS7ryZ83A
	FiitVGl7f+0oQFetDP0xExIz7rw1R/vEMfrJN6/rdkXD27NXJVdWPrMf3wT8YY3F
	C+xOHhJuCI9qyKEKvgg0acFPDh8ndrm6LYczOjz+Anasur7e0AXL4u7kjJu7YDo0
	i9F8WtHElO+7E7hacXW5+AEZGhQtdaChfKH7iZu63RbRLpJQ9qTZ9qmhxTDG3i7a
	nSxb41e3rMrLfIzDtLcLSTSf2MCUjQK35y5w5PcOpiU6gus8r5Bwssz45hKqR53f
	KJKrYbOF/6mWI+iOipbZXJsepfj59MzhiKa0s0bhoWYdTOtfXVWwbkqMkIZK01DC
	Fo5E7Rj7tQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa2136f2n-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWwPyiV6/rE/9kNHIcsy1SF6PUYaOLRQLjyI2TPk0WyKMpcrHrMYxNWNKF3q85OlIRYENa/Pn/UReMV5RL7SX8tRbjf9BJ0HeVYuMxculHAbMfcRDxRoQkq/TgUgIVauWim7ci1ypS7R5Lmu7+lOpuirRmEuMGhm0aNbANCqt/TkhuinBIlNkYeZCY5u6yAUAKqu9WXAJQbleWjbItWJMt4YMKrenapger/t1Egb50w5IgQblRrSu0ILyEmXpFV4JMTMB+B4BC4LBTfYlsgCbzClVUedc0UtQtdjhc4OaXS6JAU1CwcbmnTv1NCprHTsB4rMjQ9Cvawdj02jcfGTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7r865vihvaUuZ9ITFUqdP38mKU/2M72sMQ6C9vRd5Xc=;
 b=f0J1kRnM0sxqk7DHBqdfRX31KGYoQ8pClZdrTgzkDQBzvHkkl792Rc2CUm38jGTPxXolBHdtC5iwE7OqL2vVFIKY3tgZYHynNnjiciY66yGm5FbygHfnXlDpg3tNVzNuvpjXWE+zSGnx0/FmPCDlMM65lK7x5tVLO9QaYr8Pcx76tx0fI1US0eJABMrjeNBd9O/ugA8+/NV2tmbL25NIqa8rBhTvRQB4e+p2kNTdwfqVwoj4lpIkPhm5jKvIRsQ5WMME8G7f030CYjoMLFkHth9/t38YWxQ4HfgXo0nnLaz04G8EL5x6i1Psn8NGir3GyDCICs5dptMsjNp33epKWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Thu, 13 Nov 2025 02:59:13 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 02:59:13 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 04/11 v2] python3-paho-mqtt: add UPSTREAM_CHECK_PYPI_PACKAGE
Date: Thu, 13 Nov 2025 10:58:48 +0800
Message-Id: <20251113025855.1520038-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113025855.1520038-1-yi.zhao@windriver.com>
References: <20251113025855.1520038-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY1PR01CA0197.jpnprd01.prod.outlook.com (2603:1096:403::27)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f3ac5f-a8e4-4b54-acb3-08de2260a01d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SktT8W0v5aDfg/3sHg9VAoBZJ1uuFs37DCEcamvnLd82XTljzOws2mCgaB0Z?=
 =?us-ascii?Q?fXxvAJy+0SHwJvknUh4UaL+Ocu51Z3enTt5iqatS3IBttQsLECoNfUCm9lAA?=
 =?us-ascii?Q?SKLbmhNcGCWFfeMt8IwdVejhb+oDgoivGMSYvSNAUTIqif4BHBIMQGysagCx?=
 =?us-ascii?Q?o8gDgmOYvClIYTzRMi1cieaRkfpBZEhkHVnfM7U0ek3YlXPvGWNjr/sivxmv?=
 =?us-ascii?Q?5uHrDnc0YPgb/0gOBkRDlR2Rrr9A6c2s/FzP29OEFvuXhE87airHDU3mjXCU?=
 =?us-ascii?Q?E+TTG4qJjln5evKPZV1RJ8rGjS+JjRk06xCiLXP9xRWcj8s5zNJdulApFV+M?=
 =?us-ascii?Q?nLHry+AH8hScFyNfaFLyjurqZEejcXniFKTzZ0TBIMUjkBikrjtihAX286Q8?=
 =?us-ascii?Q?CECnOzW7ow2WfL1y8QLwl8Z+nNbV8ekrKw7/VvgNJfGx3+qwwkZMabDytWBW?=
 =?us-ascii?Q?DXSApbFmmNKLIY2wua6yocCQJDMdhdTwgwe43qE3Qj3nfRzxMwQa61K/oxhb?=
 =?us-ascii?Q?R4IvKk7dFIYFKe/iUICH0MGgdlhN7y3IbqSgU2yBQqKp9hV0hoSt806mxa43?=
 =?us-ascii?Q?aIlbgemjPnvaD1uDSb8Z5nKQyN6ntmLy/rjoBHlj9JMwoHZlORB6tMQuzDUR?=
 =?us-ascii?Q?CgHCPd1EAP+0fvertXPQJsl8nRNcXYy5+p2WEDDg9HAlRNcKKYoDTCUkWgmo?=
 =?us-ascii?Q?i/tdttG3pcWqSaEl+B0AfGyT6hOwY4/v48nLP/2U1P1hR+7rIp30fPHV+Ieq?=
 =?us-ascii?Q?RqBvvCBoy+NS5pZem1GfJKAk5wQvCMUM+o7LzEZ33iJsscCdOqVIhgrlCesE?=
 =?us-ascii?Q?p+ZuodZouHj3qX9kUIQSSt+HTEAmKvUhtM5sUMgB8q3zQwAMPnQnIay3bXRO?=
 =?us-ascii?Q?vlKBHQ5WshWRi/EvCNhCoIk3VKbZ/8a8H4Q4rHEMge6xjS61YTViLExmFmjV?=
 =?us-ascii?Q?xwrAJ66qkOr52JpKYONDKq9i5mDhd6FxxU1ansb8EFNeIcRDWrQb2xdFNxHG?=
 =?us-ascii?Q?5g/pFeOjH1jJFUjPWnpHwrtQEnBFGRBpY5jQukQRV6qvPyoYhFLlqUmUyUwz?=
 =?us-ascii?Q?pAYAFuZ0xXN7i55SyfmdzwRypJ66qJOuqG/X/JH6sMCyzQ6ELIjxNG01VeS7?=
 =?us-ascii?Q?uav55dLG2LNpI1EyXffh9n32yjq2FreDKGs1F+MsQGg7gjLwdjM3W57OFYf2?=
 =?us-ascii?Q?5inaMrzCNGE/Q8BepLghn2yZz0lJw5c1KYqYjxhFTMo8BKcOAyD9WmSlzBI1?=
 =?us-ascii?Q?oyhj+J2ZPpoIp6Un8IV/vlG0V8soQz+uz2waxO9koY2OFDdlTdxwo9lmFxJ6?=
 =?us-ascii?Q?+542gDC/K8oW5wAiq2ONTOqEfddu+0WQ4lMykZcG7r0W8aK/wNC2e3EkJC70?=
 =?us-ascii?Q?tCEP6GfAPlwBq3ivcRFV+ptielaVpxTrO6QJusJ5zsXgTTEdvXuT0aGzW9Qu?=
 =?us-ascii?Q?atpDX1uW7ti14oKDQDgMs+F45XezCCRWgcKTKSRQ0G6MY/S7cToext0KMXIq?=
 =?us-ascii?Q?lwFz/LeJOn/f2/o9WLXEaiCIDYFBW4cKjBA8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kTXuc/11iVSgkn0lsYajH6v/drKlaXUyvyOGngTB0HGFUkQEfhR0Xd2byL9Q?=
 =?us-ascii?Q?ycmrJkUH30UpiEHSyDHS6OuZkhJjHi+WVVe5M5/BaVRKR0Wpks30Ujvego5B?=
 =?us-ascii?Q?OQ0e6+orskPiguelspvvNz5OrEGCeLSBVVjlm189sUujK4EN+Uh9Nucb2gE+?=
 =?us-ascii?Q?Wq6sAIRQQ221WvxvhN6TMElLj8G8p3B3FAszIE6Kr+OfEhKdujjuKLpRcoXL?=
 =?us-ascii?Q?0zJ9KX3BQ2i0Yrf6LW+BEC3HtId3rNRh1zSVflz+RFCRBq98+2QCFu0oULcr?=
 =?us-ascii?Q?B8MEk0GAIAiHUJplV28rSf+l9myL4+a2sYJxqwri+LJg1/9XaxLW5BW45wVP?=
 =?us-ascii?Q?lgSK9CYcyYsWw/NLjpCELSKgE4gYm1rRMvScD7gFtSAhXN9IEz41D5kbS52J?=
 =?us-ascii?Q?s2wEeFdUW+db5B2AXyj/bUBPUOnUgGYEOnDtmjMKOR/vx6AEP1WYateXYB/T?=
 =?us-ascii?Q?bWAT9iye82AsJwOgIQJQH2rK8ONvGawkOLAaEjYKfUuR8vG69+i532MpZhot?=
 =?us-ascii?Q?PFt3iCMYoBnWh2mDbruIQHdXYyImFm7yghFuC1teWIUJ4eEvFCWrKeIhDTEh?=
 =?us-ascii?Q?lwdR72JhkTsyh7tYNpWQcI7DXQK1ZMUd9TRShc4ZsrPvMDFNvYu0HXFeuCMo?=
 =?us-ascii?Q?d4Td+jHD/oNap/WYQ5Npcf3dV7R78xCDI84k8yyyLQbmBC/+cofZzLHKIVVd?=
 =?us-ascii?Q?SKa6R9IcHkpjqG1uBuwCJqcw9HjJT0eAiT0+/U2t6yac7hEDaLA0+kHR8kyB?=
 =?us-ascii?Q?AnVcShiWt+bqUCuL5p70lejyb0rC+VdZmgD6HZ6JekySNXIw5ZJX1b+kR8bS?=
 =?us-ascii?Q?3fwbiX5NH6BzFARqdGD5zoix5pqE7zCkA9Wqr0qh3lWuijawQbkxfWgtf/s7?=
 =?us-ascii?Q?J0TB1Dt7vNEGVVEiozJBUkS85taO1V3f3iEZqdGadfyclAbVJoNFv1oKYDoK?=
 =?us-ascii?Q?y3fjje0uHdcYz8kugnd89Mb8oSyWJOlqi5asFGqrkSGzCgTPfoU25zl7W2Mw?=
 =?us-ascii?Q?r3o4zn2cidso7hvhcXDQ1yHvHKJjugCjFFhkj8cLBJLsMMzhHaNU3JQdXaQD?=
 =?us-ascii?Q?2u3eXH8ftkvTP7KbuJpBbxNxGRxLUoWLLK1gM6WUtzkl3H6vB3nVLeiy3ibV?=
 =?us-ascii?Q?Y9Xz5ozee/NSSaiq6ZqCe1rZgipl1uEzM+4+9cPeyNbIukcM5pEc1xv++aLL?=
 =?us-ascii?Q?54KTMbGktl2og1sD4HdauVPwkHv6GV3VVa4f1Rub4QipOzp46NR/iXUuP2ZQ?=
 =?us-ascii?Q?Fq7dfWI36bqF+FzGQpFtNnXmDp0Ck2lOlzoPdIlfUh7QzNmXnv3TW2P6Xd3t?=
 =?us-ascii?Q?IAfxLMH3gKua/fXXMHodYcjMjYt10X9DjoimLt3SQb+CogN3vKK5G4svYzQP?=
 =?us-ascii?Q?IKIXtAMoxd7WI1ZVB7kkvjykkAxfxVpKBfX21n++ejKbDgTjV+dF0uB2gESt?=
 =?us-ascii?Q?rtkO9r2oLUK/DiPpX1RlIdHMxD+lXBR1bmUmf+ijbe+ZVWoj4rSLcEzOQDYY?=
 =?us-ascii?Q?wfWpugih27chVJPCz+T6ZyedqofC84IrUcqW+bsfwYdGBbV1uv4QOYXU1E8P?=
 =?us-ascii?Q?6deLMinNxkIhPh+MG0Ap7dxxNjFrOFL+9Mas8wWp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f3ac5f-a8e4-4b54-acb3-08de2260a01d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 02:59:13.4632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yP4d1CFurdH7kCa7hDNFPPx35Xuwxi5phuOCtlZl3maRRrr6bKT+9PJ0RnXKK0qMOml1yiVFhGVLWfBEgy5NnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMCBTYWx0ZWRfX6usQcTv0Z8w6
 Op02uQlx1FplRu3emqcT9bRxCh7mhJ+DAXl0BJGPKGgVnPvwTLezwLd0Wlzxp6Kv+G4JRZQuNuF
 kn4V5AnrKbEqoMzjjzPrD+X5PflGkjLHLbIoUNslCptMnoPS+A/l5GMtbFCJ5cy7K0y8DXBfv5s
 Mh5fjF+O77hSTnHN9wUhmaG1ndwWH/uOrE6i6fn5tJc4iEbS7OMH6D3FoX/XShfc6KEa9g3h2fJ
 gBeBj73qwiT5Lo9Djv5yb356Srqfhj9hjFsU63SuPm3JyhvOR2F+L8vU56e6/ntN8ikeAbF5PZf
 BVcvFY3IscH7bGED/C1AI0J6rw/6Ey+WlGUyVh4AGLqLa/XHf8r48aL8gDzhOAdq46zjYJyy/9S
 9cl7DhauZvzkB1MTWkERS4XU/AnLOQ==
X-Proofpoint-ORIG-GUID: Do3pAWSqR5cUgvm8fG-CRDIXtXFWAl0w
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=69154984 cx=c_pps
 a=xBk5Uq5DOFf1FlsSGvIvFQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=HbzeB9StAAAA:8 a=t7CeM3EgAAAA:8 a=9kXZMM3XHxg2l0ZskGoA:9
 a=i9oqPCtDvve8OcjLCTCP:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Do3pAWSqR5cUgvm8fG-CRDIXtXFWAl0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121588

Add UPSTREAM_CHECK_PYPI_PACKAGE to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-paho-mqtt
INFO: Current version: 2.1.0
INFO: Latest version: 1.6.1

Before the patch:
$ devtool latest-version python3-paho-mqtt
INFO: Current version: 2.1.0
INFO: Latest version: 2.1.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
index 86cf034394..aa88711d69 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
@@ -11,6 +11,8 @@ SRC_URI[sha256sum] = "12d6e7511d4137555a3f6ea167ae846af2c7357b10bc6fa4f7c3968fc1
 
 PYPI_SRC_URI = "https://files.pythonhosted.org/packages/39/15/0a6214e76d4d32e7f663b109cf71fb22561c2be0f701d67f93950cd40542/paho_mqtt-${PV}.tar.gz"
 
+UPSTREAM_CHECK_PYPI_PACKAGE = "paho_mqtt"
+
 S = "${UNPACKDIR}/paho_mqtt-${PV}"
 
 DEPENDS += "python3-pytest-runner-native"
-- 
2.34.1


