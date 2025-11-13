Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A32CD4F3A
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 02:59:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15566.1763002752407212714
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 18:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tFJmeJwI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3412a946d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD2o2su100874
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=UFP1KT+KqwwukBOWsUa+
	QBQdJ7SBCip3lcIIZhkXgMc=; b=tFJmeJwIDD3EG2jS1LCHJSvwj9zffeir2/6R
	bFBgWXwpLvGCPdxYYDZtiSc8mbHEbqY4na5T8KSgr79PQMesYMkM1zzGbCXLmQjW
	G6N2GTsnKRJpWRRjU/eRWfLpsw42P/aUz7HdRC/18rfFQviRAxSbpvz857SauYEl
	y/UyFAbHzIfDGL7A7sv/2lAsY5jzgXU5sD6k8gi0YlRM8YqKlwIeBple3hbc36q7
	U4oAFhlgFcbYOpWhsgROoL7/B9oDp5TkJvBY/5l0pPlPYAO3zRmVzbk76HmQNrLq
	g5u4HPr/SnS88gqLtSLosEK9EFAl6+H19vg/7WOsDMbPzkiXfQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013008.outbound.protection.outlook.com [40.107.201.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa2136f2k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uP/z0AyGiO0oRTXG0J9hKjsqwDGogEqikNPBJYVmmgksTBHbUPL0gipEPgHRnwTjNx9bmdZCD5XBPwLUX/hNnKrj19ylMJzbHaqNzRGN2kX9KcLwBvXhD8UtN0bB9Jm9sy1af73n4YtZlkQN4BtK2I/PAuInAfqXAXsxx+N34EZP0xejL/OefcRUm1EK6InJFvIpUQDM9s0+6ikGKczng/Zdw0qO1uGMWyH4JmYm7yYKlz9LP0Jcyy2hCrHsxnSps99PZY98qxmCSU+ZaK3Swhf/lkdXX4YiwIkbiJ1HC+ZX/7Dw05i3B8JpkXSe9prTeOkP1m9X/q6UqH6LltftcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFP1KT+KqwwukBOWsUa+QBQdJ7SBCip3lcIIZhkXgMc=;
 b=Eze4B/cAGvCwSaKiIfosFHb9K4SQEfyDMq7zuZawjydSOE0AZjukI7F7Zg/OrIPyZYW0A7/6eX1qOTuz8EbGmDUAeku3DdcWYIBUxZMkeujLCsZhZvnTbjjUdVZDqP3O01C0pWpVWhtliIHoPWaop3NV8/2Vc3KI1V2HHp1gL96e7MApuSNx8PMJX4nUvKzjtySJm+IgnWs4TsT8mdmET4+wgBqR2YqHQo70z5A4eCpknlT0ReaXT0ejo1N20lM/gr2rQl8bxih/2xVYSjlxniq/GKUZ5N3fM+iPfS0sD9HEY0QpEI7uSTiwAUvrQbNEOMDGOQowvGl0FEfEyhJrQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Thu, 13 Nov 2025 02:59:09 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 02:59:09 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 01/11 v2] python3-cached-property: add UPSTREAM_CHECK_PYPI_PACKAGE
Date: Thu, 13 Nov 2025 10:58:45 +0800
Message-Id: <20251113025855.1520038-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY1PR01CA0197.jpnprd01.prod.outlook.com (2603:1096:403::27)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA2PR11MB4779:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc0b74d-e745-4db7-3a46-08de22609dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EXOsSBB3d1A8MLckGLPDke6lNMg2kLhdmI0a0X6CDXzPhnAPyYuKNLb71eXG?=
 =?us-ascii?Q?uQ8KryP+htE6d+5QJeIy64vfuoD1w4buGgu9q747LDJQVYIECiC3mQKWcN5U?=
 =?us-ascii?Q?u57I2D9noL/ynmYPmBhBbM8rUfkCun6yA2KNSU9GPI53QZL5nlNuK9oK24zL?=
 =?us-ascii?Q?X/fqDr7druTloM6TsD7vjUaFcBtmpDRN3+OgtNe3Qs+0Qcf9qrDJ9sV1IzVH?=
 =?us-ascii?Q?ecw7JHJ4n+OTZDVcmc41mgAROOQgnxUljX0pvwsHaaDQPDzMjTyFR2B0OmPh?=
 =?us-ascii?Q?ixJENSZW7Jc5m0SVnmjmWWqKYTq7IlI8El0mLyUCjBD1QqYrbUWD8fN47NHj?=
 =?us-ascii?Q?aSpebSPT10tOGs9behCoSKgM/dMCne3wvo6yLh480LVt61cn0SdbTMfKf5AU?=
 =?us-ascii?Q?C+pbiiJ1SufIxTmIwdf3srPTEC1DLMimcmdi4C30H61tMvrkiRpahgvoubCZ?=
 =?us-ascii?Q?g2Gq5qwPOb9Ubn+oq8GTXIq0qloDVefP7FeCu74WBUjvUKPMCRCgsmJ1a/eA?=
 =?us-ascii?Q?KaqfhZ4iZHQqGj6AbodU6LEJwZ2A6v77VsRz6F/xJ7/nuDFppjMpuICSkBZc?=
 =?us-ascii?Q?H2Y3NWLNs6vj4mR1vKqKlULt+v2XKzEUvktOufCHUaM4Vx2+/4juoOt3xybA?=
 =?us-ascii?Q?9zcN1YGmtXxiAbEl6pswS7AiSYzh4cNTex3x4wyNvu62TrO/Mb5UUSS3RYOl?=
 =?us-ascii?Q?EIvN63JNWdV3e9V5p4HJvdTnZnRRygao6D351tJAFXKI76mOvOGsocSAw3vT?=
 =?us-ascii?Q?uTj77SDk5PdmFdKG2pfIfClXyMU6XCTI8HHknH86YGgcxIR46eDuXqaCF755?=
 =?us-ascii?Q?HeWgto67H/zmFti78tb8U9XftslIaJ8O+44TeqZEf7t3OAUoYQnIMsF1hQnA?=
 =?us-ascii?Q?pMBWPcY0t1hokBSbOqWiwwygA1So2MMlVdXVPdxi9q6wCpnkfcQiGGWB7ZQE?=
 =?us-ascii?Q?m03vwxXU9fV0Gr7B2XsPMn7lLtkh2lOLShzPz9+6sSX8Xh7nVIvW4XbbJN0u?=
 =?us-ascii?Q?HLAL7pic/tLyelYwp2V86ANFimG3lTcY/YFAonilCL2Ae36KY2R7K9WOZOaM?=
 =?us-ascii?Q?irdvcpXoPEyc/Pv8gXLMtp5xxkfADyPM68UX0ASE8ELIrho3G6ntO+1nIYNb?=
 =?us-ascii?Q?wYdTmlCvOnvdF4G0DcEVk8XLdPAHdajynJbBU/rZ1XjoOVSoAQ0n3D0UMoiE?=
 =?us-ascii?Q?U4iOEwR1k+9MdOVbYLCTPcon5rUreHYkd3XDBmMLnOcK/9HPETFqRUH1WoB1?=
 =?us-ascii?Q?+vKPaREUs0qa+r/AgqMppgCLQT36qfO5zo22VcgkxTSQoYNiEnbft2/E7wgr?=
 =?us-ascii?Q?+IQq8WxeEs5nwD+PB2GmpBQa9yWS146JCfkxoqlkytci746vqm5z7Fjoywp1?=
 =?us-ascii?Q?wfYsIxp2kn5rMai5edAGzvZNE7WD4rdo7A1IsGJfV1bi6L31SvJQSXjMWYy9?=
 =?us-ascii?Q?LtPnBUK5HyplDWCYBi9HvhjcOA9UhVEdza683TJYy17Eq8b1f34tlB0jkiPE?=
 =?us-ascii?Q?RH1rdgiQBuQIVM8Owkf8FEapTRhnYEJZJqfG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?18dJ+kX3zDoxHGTJ3GRksNfwTozaECIfiLSbQI4Z08Y9z3CY1s6NsvoWXxBr?=
 =?us-ascii?Q?3AZB//Kx8Bpy6/JBBM4b0y122onc36RScDIh9uzrtpFLTOXM2+tGMaQKm6M2?=
 =?us-ascii?Q?YLPnzhZMdPrtkHOEwDc5/cZA0vsi87OrKIJ1dVEKjIIrEgZ7zWL28KZ9iPcW?=
 =?us-ascii?Q?ViCUMj5Nmg8YkyejqS21a6ocuYcVo4x9q5RdxMKyDZWua5XqCBK9QT5YxG5/?=
 =?us-ascii?Q?8YpJ+nEJ0nxMsAT6SqxQ2K3KrDdX5jqhXh4Rjv2Ydiays9WRd+8qwRM5jcAG?=
 =?us-ascii?Q?k2g+3Uq9qKwhAWK5hz2e8Y0+gwoF1xLYNiprwfbhmDMsfne21ZJj57UScIc9?=
 =?us-ascii?Q?mQxdM2vIVkYSOsmWo1pekM0ei9U2yqI0g0asCEDDl1OUlZVI7IwHUztVCega?=
 =?us-ascii?Q?VCpeN3O+A56xmEQ5PR4nZEELBSWrK2U3GSiCiHqLrpeV3QfrMQHXZf+/W4OU?=
 =?us-ascii?Q?hXteQlfPeyAs3z01e3E8LR+YifWyjIEVyaF/qVvK3VObIGMMScUA06Q5cI7j?=
 =?us-ascii?Q?CNnnjfIzaITAJ4H7wkvliDsKY4dHP7JcGtdGRc2m4zMeURDnwBveG6NL11xx?=
 =?us-ascii?Q?s4as2Ba9B8Ew4XdsEF94Pn5IV+QJ0MvUf7+YC6b620JxAFRqVf1NGgyuBLgA?=
 =?us-ascii?Q?1imA6prhtl8gzNv3IJ3RbpIPzYtn/0IAAHsQ8rmLS/uRXOFONj6yuNvP+C+z?=
 =?us-ascii?Q?v4zsji77TOs9cKQEi3TKiQxPgb0Bw3fq+ojafdLe5x0np1qDUTJDXJtDAThl?=
 =?us-ascii?Q?mnkwQihmXf9oiFIBbHTfP+79sLBdTB2fqq3Bhopkcc/1ZAECVugMLfn9nf1T?=
 =?us-ascii?Q?v1vkbVnjR8QqB2hFTEH10pHmFqa2qa/jtM9uKXfhApu2GKZsdGT2gwbrZi8a?=
 =?us-ascii?Q?ShweR5mhmEKU7pEZ2DCs0EcDCB9Gmz0TMcnHjkB96MFv5MhFV1EArFF8R0VO?=
 =?us-ascii?Q?S6W3d/YMkg4Ao6fbOHDPPIOAkQNRiNeJ3qrSoLOZSbjTg988GxowJ7ZosKhc?=
 =?us-ascii?Q?Er8e2DPJhSW6LcOJ0bUGS0TWiCGWFKYch/rH1sgoeN0loUwRTPfxB+2g23L9?=
 =?us-ascii?Q?CBf3fj9NfMpBJnx78YxfqChSTIGQ+ob+Afn7kjRzTNG0gpgmWam51rsh6VfG?=
 =?us-ascii?Q?9PEISpDkn9DzYkHo+XxcxjYhfiya2vOkVqanHHSD4gAJM7peFdhGJX1WPc1G?=
 =?us-ascii?Q?VfYbQmAFsS2uIgyvNVr3abq1VdlSqomasLUmvbLMvOm77AT+npTn30yFPzme?=
 =?us-ascii?Q?+dSzL2kSHpZ6RaEE4g/wWjNXYQhr6HVi3qtz9Pjd/fXb8Wqo8Qux8l8L6/kf?=
 =?us-ascii?Q?LkewFQlCgWRz/DWaJ8gr0flkqTFwnS7uo66o5hQ0whliQyNoVd+X1CZmm/bY?=
 =?us-ascii?Q?6mB976ElYxuRjUklEkqoLgscCuOTtdQ0+iZRMPyKvnPjTi+PuyVgS4ryVBbI?=
 =?us-ascii?Q?3nvcdrmuvuDCgsoGzG0LvfPLCBgdpk4/Zo3IPSf0GeUFSPTT7HR36RzcbYXo?=
 =?us-ascii?Q?ouy/fX7VVyxPI8U/D2LUuDshGTNtEpO+5JByKpUP+CMO8ctZQQyLWmwsnkKp?=
 =?us-ascii?Q?wcBzydPVMBpM95FStji5m8u47sJDCbVTSJmsQqHP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc0b74d-e745-4db7-3a46-08de22609dc8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 02:59:09.5440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nml4Wj8XD8mvLYHbD9jIlUc9ISM9/64EHtRHSwhkW7jxltapkiF+UnToPWZbUbsvKs+jNQxEubDLJYq85iXADg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMCBTYWx0ZWRfX+GeA6ZQbBL7G
 7hAvH5eqyAoGe2OYUa1NC1uQ3eyAn66C/Ia7VggD5JQbvUpdFDiPHCQ4U6MNU+5gBlgpUvHNKqJ
 u41dUbknD4MUx6lWfA9C+qgWOihrkJRbSx9GfvZ1uF0vINzjVcMYfJpLIp4OKGHuBHIkce2GG9U
 V1lfnbwR/SDYXJRmaHa6nNRwI2Dtw3LvIdWZgzJrrRfuhzMjcwnH1ZTUd/XWdfgvpHOeLuU9MVc
 1gyC3JY7ULOzeZQRLp7CjoUI9YjC7Bt9VWt5LfhKRiPrm0xuDUsPOfIE7NSxxZAJYZstrFrTXvm
 7Ou9upBqzyYON/2IVhPMQYZtP8NEiK1B78SAXVsMmQS7E6wGCXDG9zaDpMSrTnBmA0GR1F34wV7
 fIGVben6mv/cwYhYywj9RAS5WQ974Q==
X-Proofpoint-ORIG-GUID: u2zr5uEU46uFLgQeEKL4eS_xyiqSypk6
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=6915497f cx=c_pps
 a=jhI4MnfeDZ9+1dpq/RhspQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=LsTSizDlIOIG3JWFAr8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: u2zr5uEU46uFLgQeEKL4eS_xyiqSypk6
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
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121585

Add UPSTREAM_CHECK_PYPI_PACKAGE to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-cached-property
INFO: Current version: 2.0.1
INFO: Latest version: 1.5.2

After the patch:
$ devtool latest-version python3-cached-property
INFO: Current version: 2.0.1
INFO: Latest version: 2.0.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
V2 change: use UPSTREAM_CHECK_PYPI_PACKAGE instead of UPSTREAM_CHECK_REGEX

 .../recipes-devtools/python/python3-cached-property_2.0.1.bb    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.bb b/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.bb
index 41211534b5..5c88a4e69e 100644
--- a/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cached-property_2.0.1.bb
@@ -6,6 +6,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db7ff60c4e14f58534201242803d8abc"
 
 PYPI_PACKAGE = "cached_property"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
 SRC_URI[sha256sum] = "484d617105e3ee0e4f1f58725e72a8ef9e93deee462222dbd51cd91230897641"
 
 inherit pypi setuptools3
-- 
2.34.1


