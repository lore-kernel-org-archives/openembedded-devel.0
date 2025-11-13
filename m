Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D77CD4F49
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 02:59:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15571.1763002763712280080
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 18:59:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BWMExsv+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3412a946d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD0VH7m1240296
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=SUwE+gTqcKZKE/Zc28cds7l6sYZurGTGIWhQkUwXq/s=; b=BWMExsv+8hjF
	BH/PYAwYgSEHrwmRzoiwxZUYlsguifj/PGVm3/ksLJLbsx3hwGj3NH0WCByZNQQj
	LIMoDazHJMapdppUSoVXkx66v8a2Fdvc9I1yL7W2IUxrYLsIPU6Ub7wizp2tMogh
	E3HIkHWRAlhkGbXqLlpXLu18PQuZeTqHgQ43voI3xTMVq8YSDP2oAS/sREPDPnVH
	ii5GQ9j3iu3WwQ6TWRjduXnB4Lq6S8uCYsgT2CmZxjz2wf4V8WEoVWNDxSWSwHg/
	eadIEdrTH2vw2vlZfu+y1czQtX4trH7ssmfnlyy3oBeCER4+cYmPEz6FKiM5iwkq
	5GsqVr7aRQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013043.outbound.protection.outlook.com [40.107.201.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x6pxg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6E9/XAGCE6yrMYnIvXmcghhKBjfk+gi4/c0ICmlyupc++/d34nAjM8xXaofg380dIp7rGdy1r5SWQ0xXvtTkzFLnSMehrgxnMen6qGdu9t/hnm53uxbUD+tqXEI+KVHt9pLv8akrOCExyFXyiyP/ukPD+WbtyksaBXURqVCAExMSXe5WhdludWUn4RYDcDJ46geg2yfWS+taGDA+ILeWy6HT9AdtlAxFVeI4nHBsUxNlFPsjGqiD1eaRfEKRyZ39Ir/t6Oxvxq0lBqXT1munlN6YxTWfAkRFCmpzSmJVy6dqzfhgvyL9nAmv4TBNFNM2QnL6+y5ksaqVjGLjM0ylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUwE+gTqcKZKE/Zc28cds7l6sYZurGTGIWhQkUwXq/s=;
 b=pBA4UX7NjDpgSqH9X39AA3FnEjiB5tpyTCXvGbE8Ii4QZaBTk7KKqt4yKv1U9AEDG+t5w2bPHRyXznGIztbm2I97CAqZH+Q1FjSTmrekTqwrKchhTvl54jEYx931TBN0Gp5yuDMMphFTG2Mxo0R8P2Q2fg92rHU9fKsTLfYdGpIC+2268fnFqfhKowSLT4rfcdnPKsJ+2bA3lLwk9/5ItkZensJXVW2aaBMITd6O/FRh3ZPlrYjUtZbslPqql4rGWA2rU9ykMN08tHxCLOn5dxGdy9XN4RpXIRb+mjGrEEyHu1L8jZBqqZnx782fwMd3k0TTzS1zsia/BQxsHMQWEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Thu, 13 Nov 2025 02:59:18 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 02:59:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 08/11 v2] python3-pytest-timeout: add UPSTREAM_CHECK_PYPI_PACKAGE
Date: Thu, 13 Nov 2025 10:58:52 +0800
Message-Id: <20251113025855.1520038-8-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: f7d3866a-0c73-4afb-c278-08de2260a33d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MxvnXI+W3zWO5f6MicNw1RGn+d8YIJgXVSOHZUrd9vhWNUJMeoyQC2I3OQy+?=
 =?us-ascii?Q?j69dl2ajy1G1QCIYt6cLyISUzCbFMht9nbRD4yKT7er2NoBH+JKELs+rvZYY?=
 =?us-ascii?Q?WMlTzQeMLjyuDLwFTkw32TEsnnes0czUrOwEQCnthKk+ei0c9Zufa/sZE3Gd?=
 =?us-ascii?Q?hvVYep7gWCXm4D4hLk5fz0SDxE7KZWYUhFduUaUt61LJY4V5MAwpuBkWzIIE?=
 =?us-ascii?Q?6A7/N/eCqOeDOcPEd2CzSE7Acc0TV/2++IBPk4wUW8xAmwNJxL46zfIP+lT4?=
 =?us-ascii?Q?mhUGzWD2TT5L4HEo0KnWc9EwJY0RAUTXLSfBJzokZt7oqj/FGkpBpYKLPEOX?=
 =?us-ascii?Q?/JlaC15TvldR3A1HiQmGDHRJuWvUFPV+GreknXOZZydtVH1y2psh4xsd96oX?=
 =?us-ascii?Q?XHg3zMA13btnhd+CrAQay90f0Yj5KIJRMiGm9thFGqfE/Ep5OxZ0jevoZziG?=
 =?us-ascii?Q?jjNfyE+O2qBPrtGI/dhvus8uC5PGwY/hVWcLW0DzLRlSd5jhNpRaulN/0Gf7?=
 =?us-ascii?Q?bj0Jo0QmtTfl9HWWOBX8irziDYIzDfjwg4pkHDWL6/Iwb8Q1e8BpCBH1L3DN?=
 =?us-ascii?Q?W2i82KpnDDcxmIuqTorFVsAwOMF/d5hx2WHeoygbTMzWKfYFj/VMJMWYaqon?=
 =?us-ascii?Q?ckL4fHjAwiSJet/sS591zXCoOICs5SQApc9Awjq+SvhdBNomu6SXezbLmdLR?=
 =?us-ascii?Q?UKAkcSYVSmU2w4DuZ9/Q20qFyJlZe7r+jijnZ045VDMv0mVn3CLUiaXfmmKi?=
 =?us-ascii?Q?SiAQ4xwKhjMCXdrr8Gd2UAfXJWDmNahdZ2fNCu5T82iex8M5CIIM8J9isG+S?=
 =?us-ascii?Q?/Kz2IstGORwnMzHSpTnnaunKFYuc800JxJg5aNvNBBDvF2gdlIA8d12pwG/R?=
 =?us-ascii?Q?gwqhyO/YBkMpd/NXHJF3wgrh7ChX5dOuYW1jQlsKtzL7CwVRpY11Bhy6xbxI?=
 =?us-ascii?Q?0jVs0pjrOMnFlBtP5ysw1kfjYJmI/NT66fEvawCR5hRvGBf8bkWvggyjalE2?=
 =?us-ascii?Q?PMKd5ZcmbBPEsKDqkbsi05wAsMw1GCQgsSzajlRJ0NFGQqVUlggI+JxybmnL?=
 =?us-ascii?Q?oVw9OWncwOaVcqlkbEw1rPe+4H/AUspi7+Hnqg26KeTMbgb0pg2Mf2oKGlH3?=
 =?us-ascii?Q?xVzzrgRzcYeBdlqW8JP7FoYlky39jNJXJRxnyoAasUiCBuBCe+etznMTx4Vf?=
 =?us-ascii?Q?mepVDPxA6m9uSbOkRJKy4mzjIzMO4dazU066hua1S9LY0RzHcf+606cAGxOz?=
 =?us-ascii?Q?YisSpq11jl+WJTs50LtJcb5FxAwPE3uBr9QML+9itj5RqngA9QFWWS+yRq5L?=
 =?us-ascii?Q?498J0XvOul1ki3IXCrF10tKwtJ+IDrRWRqTzrfovxJACxL/j4jBR1IQSC7+x?=
 =?us-ascii?Q?xshxMOzNBzwPr88f1inczGyRR1ASciXCHbTIHCWj0/98/jPyeLyRz7fJPz5/?=
 =?us-ascii?Q?SZg3ZX7BgzY/I/xH+9G2dUGLburUm8Vf8Gw7m/z1GXB9QbYXHfPAlybwGt2c?=
 =?us-ascii?Q?OR6Oz9f1GA13dmX7lcvXCXE7g0ok0+jzoA8y?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hKl+8vaJNeP6UZwuEZbAr6DUaFPROA4WHNfKHFOfVMeReRLsc9LI/l2NgxIG?=
 =?us-ascii?Q?fNLSOX+yxCwkQnPsVGFrox1bVLPE96Luvgx4nw60fMMNUUvgeuueGI63XPFC?=
 =?us-ascii?Q?YDStSa0qqEkvsUoJfspSBP4XgWTM4Ya3ADnO9TY4IvawIacqYhXGM4kH3Gc5?=
 =?us-ascii?Q?PHWzCPhmZY0p9ShM6Skn1jeaFQ38piVoVYvmMgClDrtoimEJwoHm52NC14N0?=
 =?us-ascii?Q?poZxuRODhlar6EUMhXITXFak3S974uv53kmSgjX4f9Bf7Hv76SgDdGeEJu66?=
 =?us-ascii?Q?26om8lvBwo0hAfBAnYlC4WrE00mCi1ouREsVqh1UtWpUc8Eqfde4u1SP4L11?=
 =?us-ascii?Q?ewP26MaKj2CNYFbNovWCXeRLNuDrKKmlgPTJsr9e6VFO0EsJ38nR92QNSGjw?=
 =?us-ascii?Q?vYBOyEev8x4e3Qpv+hEw5RW7gP0507GuetfVnj+qpzMDBoKU+kBCvemAPXQa?=
 =?us-ascii?Q?A6Pl9MarbFvOe1NKqfh4u6VP40VkP945EHGlBvw5iVzmPWnJajnaYzSDH9dI?=
 =?us-ascii?Q?4SJVHwZdhDLzY2iVkzDFST4RzsRUeA/oOntifADKUnGFs83/JSPpAPjBB5B3?=
 =?us-ascii?Q?QmNVjFPqSplhIQ4xMCZslwWFQHc/n3uSotQdNRY5phwHrsKAO209nh+26GlJ?=
 =?us-ascii?Q?phYEY+gAIeJSFUY2PbFxxWfe/lSfmRGIxPtNwZh/NxobpS+EEDGwxs4WABN3?=
 =?us-ascii?Q?dPJ1VvkXkFTz55S/X1Wub9cLII88Wcpro4lpVSEQRQRc481Gd76EvPgwXjWo?=
 =?us-ascii?Q?8Kq7mnDSn26VN1rNU81VnzmsPWVFaHBHupVtX1LTNOvxFPeiiESPUxwpR1Md?=
 =?us-ascii?Q?SyHmekzOrqA6T5QApIOm2WnncYhEBIqIak5eKQ01sbS/GuS1YI0m/CaSThce?=
 =?us-ascii?Q?f7posUDNzozhQF04tWBlpxzHasB4u/UCZPoIWkLwkv9vYd+LpTFmpaOg2Fb2?=
 =?us-ascii?Q?Nsg4raKQ1DS/b9jUpwPdt3wakZUCavu1lPwLYJWn3OwMR2HnrYuWUoN8O2k3?=
 =?us-ascii?Q?mrDHpVY5RTTzq5tLrKdRGOtUI3XX6cp9urbNxS/gC/gUIFizOuGARJy02bue?=
 =?us-ascii?Q?Lxsy4agu/qr+hLcaA3fFY4+qAjP7hh2Ovh364ul7uJKTR/3ysm8SzGovEQdw?=
 =?us-ascii?Q?LAbo5N6iIIE5j2gYLWQ1A2MN7COUaVcnvcCwGHStc1Q/mCf7q9GdmVKlqu1f?=
 =?us-ascii?Q?QTaNofGDF4RHS5Hd4fG3aAPxo4GeRJbbnKwATLiwwVUUbya8VDsUJuPLGUcs?=
 =?us-ascii?Q?r61Nq3EOR3pSBUmKw56SGTJyNGjwhuFTG7wEMsR2taw2YmoeQX3HPFjMxQ71?=
 =?us-ascii?Q?N020bQfK/6xTbE9zn1iVjUikmBXer1x3cIYODP0cAaIXOaxriGbEdR9y5yIp?=
 =?us-ascii?Q?IFsPHikhGNzAL0QgdxMZHjLFUPUCOjhhzf2a0nGh158I82R06Sp9G1OU6sOC?=
 =?us-ascii?Q?tNGDtrpTadjn1n79KlI6hKtkrvXfVUQZhRh0pWkOgZPT1gzn00AmSUiNBYo4?=
 =?us-ascii?Q?T+EuR6Ca/iVA06v4fkQEwScsXKgUDsqdYP2GV9lI7Yqc37pPXPaXw6an8LGP?=
 =?us-ascii?Q?ZmZwkm1XhyQQmEYT4KhzAhRWXr/IvvAvW/D4q65f?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d3866a-0c73-4afb-c278-08de2260a33d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 02:59:18.7008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ur+MwySRdvTHGZF2MfsGixiIJDiwxogn4CvQYFeNvOsNv3DubjmYJ2ihm9T/N1hjzYzZiQk1/nWb9R8NaEHrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMCBTYWx0ZWRfX078i9lE9rtfa
 EQKGNmYhhKqr7rV8dsR20sWzLOOS0V1DHwD/LnDEx2+uEpCCcMPEYPu67jLiSQ053HMB3z9J0Gt
 J6uyUiFG3G0j4XmO10KtJQGiVkUyNWd38e4Fop+5ZdOPBXJIcuqXCZvLMTK3j2/fsWTcK8EOTey
 iMpY5CzXOkziqFNtXy3RmbBnzne+lDDFuvVAMRcsyhA8MTTj6jF89GmuanjzyG1FBmF48Jg3hrj
 VZSI5ZOMF1LU1z8OCpwZSG3i9+Xh5k/svfogIaSOCSl/DCQrjyjNyU4JuvoJZ08nUsCQjcRfwBW
 IHWkz49rW7yX/fVuAdXSoaw0EOUVZPy+/BZgWyWhrvnxUbrQOQzXjEwL1ds4XuuA+Ws+FzbZGhz
 fS1gTWI2wUxZCKdFczPILfTXKDyAog==
X-Proofpoint-GUID: WT9IKHlyiCYCRqmuAyx1DECUEtUe_ZFC
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69154988 cx=c_pps
 a=+LMkLzjU88PdHoliF3eHPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=bp5ZUruqnwhb4Cqy5coA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: WT9IKHlyiCYCRqmuAyx1DECUEtUe_ZFC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121594

Add UPSTREAM_CHECK_PYPI_PACKAGE to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-pytest-timeout
INFO: Current version: 2.4.0
INFO: Latest version: 2.3.1

After the patch:
$ devtool latest-version python3-pytest-timeout
INFO: Current version: 2.4.0
INFO: Latest version: 2.4.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python3-pytest-timeout_2.4.0.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb
index a376d02e38..6d7901f5e7 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb
@@ -10,3 +10,4 @@ inherit pypi python_setuptools_build_meta
 RDEPENDS:${PN} = "python3-pytest"
 
 PYPI_PACKAGE = "pytest_timeout"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.34.1


