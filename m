Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A8EC87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 08:14:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20039.1754468051625562555
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Aug 2025 01:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0313fa0978=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5767dooK3205015
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Aug 2025 01:14:11 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpy9rm1t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Aug 2025 01:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMdhPdI7wePAX8hskWCLHV/AToIYnv0dd7l8jqUMH0rtXrdDbiuK222LaDTOgRuGvkTNdbdkzbOMaSCiVjp+idXK2PhCVUzrBmI+hka4guXGGwxgCAHBj0jJ/YtnDSM2r5IlYbrUGJv0ALyGwiBNa0jnx6wDrc+FEc+EuVl5uvaHHGv+Jd8QdP7wn16+spMPWJQ1425flrNAxBFlsJvLlVEox0jiapECBpQbra5HjiA1yIRkomJN0zVGKQBSlk5JyWPbfId+6QrcFeH7rgDRdPVwLC53puiBO/NtQzAn//C5l4VOI9Bp+VNZ5LWtNXpL1LA63SL9ygy+KZTtasexBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csv0B4LYhKCbunLVgnKB/NBNXDOtWrXu7/HitfKGR9Q=;
 b=mCn2CrfbYPKOHOVwveG9wwJ0kEGmMib/IlG3bD7WycHEL6r6fJOJcdS9hEdy/DjmPlKYibHCIKQUAKZCXwiB94b14SSmLxwVbqv1/RE83O/PlFdIJPguLYjg80O2njb8cqMU5h9VIA5CezwALuPncXrHQce4QNTP+mvbARmZ1SV4UqUES1pYFfaH7djvmD5TCP93trdOqS0CTE7QaIq+VgaJFmqm7TTPByo91kBwT16OnN7cSLtEt86gZykeGNO7sTbO/EZJbMnwXqeHTRMmtghqcXwffDFdnVjFDsQy9I8+6ITFMilIsZFDQOqdu8bXAI4A2PvLwLwZIfqRd6H6qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB8474.namprd11.prod.outlook.com (2603:10b6:806:3ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 08:14:07 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 08:14:07 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][walnascar][PATCH 2/2] python3-protobuf: upgrade from 5.29.4 to 5.29.5
Date: Wed,  6 Aug 2025 16:13:46 +0800
Message-Id: <20250806081346.2626482-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806081346.2626482-1-Qi.Chen@windriver.com>
References: <20250806081346.2626482-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::9) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: fd0134a2-b7c4-4fb3-6ec8-08ddd4c13699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5+nIhYfeEDrvE/mp99XE7qpAH89oyE0U2VKPTLshBxGbw3AdMPzKCqzQfeVS?=
 =?us-ascii?Q?B+/HRl/LVUYK21Ynfsr+OaU7tvv/K7YwlAwrOB22JCnRzV4/T26CH1aO/I8K?=
 =?us-ascii?Q?97E41Ie4sxpJawgqTHCFF+Ck9PesJjL4GAnXGpihMBMNaG5i8N2J1tJfHytU?=
 =?us-ascii?Q?ql1Ks7xs6dcZmkD8i5EPGM+k43dBNVPZidhxSnxAi9HkEGEbA+VNFBYLK9m/?=
 =?us-ascii?Q?Nco6AeMSyMri9SGOfR4DPAM99uWZ3PW/7vLC7nwAvGF5bSgYpZHs6bMHXaVw?=
 =?us-ascii?Q?epzynuff3vCETdmwLt9YxRo3y4wBegf9ltW4GhR/ezt52mxFCyCSnHW+ZeR1?=
 =?us-ascii?Q?2KwxtnLDALz7Mwu7mEDkbFRN1rBCI4om9Qqk8PLrg5P3z2878hc4kD4etdfS?=
 =?us-ascii?Q?s5ejw6VS3/52oUJ1m+PPz+VCU8Y/xE92X7OaSduTiXmRW+v1kLyYECuZVcw0?=
 =?us-ascii?Q?hBDhSJaQIYBaZ0TQNM5lg2jAQCEagA0OVfkK76pHwBx3YrcosKmrQWLqLpMm?=
 =?us-ascii?Q?BZMnnq4H4lEMP4TF6GIkJ3uvsY68Ou8Tyy+V648kuMTO/dbDxbeh3Y/Pw3gZ?=
 =?us-ascii?Q?dkcDLQhDTI4J6QEg1Jm2Et1HjG0Mt15QVjQifGmqoio1kC899l7uO/Gm5J05?=
 =?us-ascii?Q?nxtvoZYnlZufxgC0iKwqVbQ86EYY96lf08n0CjNg+0xuQM5AIQ2DOqud8g+r?=
 =?us-ascii?Q?DGcMLpouG6wNnTkdxQSJiqbjkoc/EgAVF556OMoV3A74O14Z6Y4l7PYfRp98?=
 =?us-ascii?Q?h93D6SyajMdT7VGwDUEBFXEv0m6BWZHxfVm2GJ0px5stBDmkboCyf0vFfCRt?=
 =?us-ascii?Q?WYLqLZk1Q+hw7P9dK6YpVaStmY9+MsasKGe0hVyeM+DAtjgT+p9vYEsIg3oM?=
 =?us-ascii?Q?KX6UfGChzNhz+qrc4h1dy6/840JawjPBP0IfR6B75uWnVtmsDwkEEJT90dlk?=
 =?us-ascii?Q?+r5V7V2yWzhACpzkZXFzb4B0IMh9NRwRJP8vNKLnY7g4WBDKlnLyltjxdLhA?=
 =?us-ascii?Q?tNjB9WsfXcSdtSks8g1RfgvH+PmZfJz1Ju3+0lA2v1KHCMUnDvpfRjKrsiWI?=
 =?us-ascii?Q?8CDKqad2s0kvMEWbTLysqqHsVYRI1NqL6gV+XMD0XbC19Kp09JbSEH6U8dxH?=
 =?us-ascii?Q?k1tt2QtAdiRMec7ntgK+iZ/nacwfnMme/6At7Ma/JgDTdYo3wdOT3hbVrx7R?=
 =?us-ascii?Q?pmGF3A6mpVfyrcDrzfzKrZNe6ggq3ppGhz9MSjlpB3lD8m8gjHBP2TrHdZtk?=
 =?us-ascii?Q?5iGigvF97TQt8cNH9CI3Y3CBMCpbncF20Jsj4AIQIUDQYBqWTi+q2+TZ3iOJ?=
 =?us-ascii?Q?8wPbQJvSR3p1ehkk48xAbL5uaW1L9uB0T89yhnHcaCrIJ3bXh4eGqgDCj3Hs?=
 =?us-ascii?Q?7GJBCEud3EdNUgEdSEtPlmfuezS719noa5GAsJRqNHsD5KlIU1EVVOVyK1su?=
 =?us-ascii?Q?r330IZFv58H2XtNCrhWTknTBq+tH5+oklCXc0NP/y2QkBzxxERCRRQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cEJ3y1fYE71ifSnBAm4In/xYB8TfA2Lwa9CTfm4MCZM0E183Tqj0g62eG8ab?=
 =?us-ascii?Q?fAIJRbSztI9/wvukkz1b4kUVSJM/YG86Nm5Ru8XzVeILRINOeCWTPNtOtMDY?=
 =?us-ascii?Q?GRs80IxKZpLh9+zAE+X3A7bnnoL0URvDyY2ZSsbUIslrTkGDql1zYl5TL6tw?=
 =?us-ascii?Q?38LAlO1+/cr4Gyq8JdJgQiY0hftRjcKCquijlXSQYOtTvIPWoArpdZDhZOrU?=
 =?us-ascii?Q?isKnOTHgxgK6rt02/fhuQIVukegYz1J07CEknDfOBQ1VMEaHNgWZ+1X+XgTh?=
 =?us-ascii?Q?vtghX+dYpBYMp+k3t/AGqrbKJK3/a830iqDsF/+KkZFXVLOqPXKpPABcf+SH?=
 =?us-ascii?Q?imjc9qqKbdDtBQDlNyLHyT3g2cv6RzgZ20DUYxEAO86/LVjEP5i//+kMB28c?=
 =?us-ascii?Q?dlRNkeE179ir7UOpJ/PvXV+F65DDMf5uXX2VL2o2v8lfyv7ByPxrReVuP5pw?=
 =?us-ascii?Q?+TQADOYppqmYtRL9OLJX5hrNX31kWZuNaO06kJ2HFyXr3vxaO1Q8jrZma8kV?=
 =?us-ascii?Q?4DlyxYQyC7Se8jX65Y2nrobcbzH6anMfbQ4shKZVUXKdvxwCszQ+sV8qV+O/?=
 =?us-ascii?Q?nqpwzwtGDfOHWFjNRvpAF5eAPK5lOC7HesBGbPZPTBUW4qBfmEIOW6Y1NCts?=
 =?us-ascii?Q?UcLY9iVpttKRLlHOLNxvutGhjtG0KEAtuHrNpABA9PexuEXWTjxy4gUgHosB?=
 =?us-ascii?Q?sbRi++zzLZAoKZXhrFkTi/RoSel56CW+BKDQ2ojC2xbdL4wu214R8aEPCmtU?=
 =?us-ascii?Q?PARjbhJ5TyYcM5c2CN+Zfv8uFjCWQGzl8wvGXM69kAANED/OLA0pau7squGZ?=
 =?us-ascii?Q?7ONNNIApmPTsumqnBSIMvNxYHTUMg0lMeLp5qydEauo2EXVgXb8RR+TWyeGH?=
 =?us-ascii?Q?na3rV8LcDd6HW7+KLbYaic36gEW+8zQ5VI+N3xJ7G+jK5ZYhTw22Yz4UKyhj?=
 =?us-ascii?Q?0PhvWdPWsXTX+MCLyMnWUpi3H/WhmpjkBOJ7C5QTwDB8CdjcGRHMt012on4C?=
 =?us-ascii?Q?q3ldB7XkNmdH8cDqgRFyX7QY/xeQW89807ye8l7olCK3ctuuOXPIwLj6olp6?=
 =?us-ascii?Q?Uv8aAwlD7iBF3S8xR80czDcQNeFB2fDtfIbQI5qBlo/sLoHsfQYZ9f0/IpJR?=
 =?us-ascii?Q?oagIE3AMdNlRSXB79+VLOz+cJFC9jXQhsHQGCO7+NV7U1FGbzbak2bCOfCS/?=
 =?us-ascii?Q?8Sv6VNsqiL08KCBeLeiVI+xFP+GupUAJ3cQJ2IXNI5SDAgycoiqpjEwcbdPc?=
 =?us-ascii?Q?dErUmvU6EhRjZkk3oLzQc9qQR4POzygirW2Wffi25l2DNwMh2WUzg2xH7UwL?=
 =?us-ascii?Q?cQQcHbAe18yV5e0CsT0V4ay4Tq6eCiCYMJqVNI1abto8qgCype/1+YfqtMwS?=
 =?us-ascii?Q?fz7fLp9y9o4yJdbdoHswzw4iO2ZKWSlxN2pH8rAD6F+Eis5QqrbgMa9Spuxu?=
 =?us-ascii?Q?pmag2DFTe7SaUSRo0VelTI34DhpJ4KITN1vjicf7z0KVH5Tw0k+ZAR+bPJ8e?=
 =?us-ascii?Q?EO8OyEXSm8hfH+/1jBwlrvOLO0gdgz7tPZdy3M/7y8pjketJnD27sDvEmdCa?=
 =?us-ascii?Q?Nyn8sJCZ00NU4XSABZMTzfnTBYT+e5NI+bAmv1Tm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0134a2-b7c4-4fb3-6ec8-08ddd4c13699
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 08:14:07.2810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYmtl8qfglLBRHaPyrr9+StCplyYCxRfONomGQatPUZSYnD/jKRTJS4iJT3BiV4HhHBrMmfUqsjC4wrLotnv7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8474
X-Authority-Analysis: v=2.4 cv=AbaxH2XG c=1 sm=1 tr=0 ts=68930ed3 cx=c_pps
 a=w5zo4y5KsDtx1ruRTwrSSQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=d3C6cGn1eRoA:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=db45io-_UeDe6lnvHNUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: njdWaHQ5J4IUT9UzyOdAiGKzwsytA_vP
X-Proofpoint-ORIG-GUID: njdWaHQ5J4IUT9UzyOdAiGKzwsytA_vP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA0OSBTYWx0ZWRfX1sa6TlnN37IF
 fI/34Wk1QyAEqAq6k4MiNn9GAFiverJ8ZLsbCF+GQaWS1esS+b29Kc+MxqtToBtApE/hR774hY5
 cnBiLCmmm9tn//jo+zgBF5N76QaR7OISNRQNayzatUznSyFKuV+IDwtc3qSzTHHgIU0XrenPA2C
 7pNDk59pAm7dOZa2YP6FlBiFo4nYZjyjLFhYRwm8d1XBPPcTTMmi0g7d3+4/tUVs8xXdwsa3xxw
 gGuzsJwRsVuoj9ET3pKy3nj6dwd7DweMcW3fS3AFH9QoEvsfhsm7qsv2iWJ8mIQHRt3kJczi15w
 1vZ7RaVOvNzoRs1Fpi2lxwJ9RgUv1RkhK4beL5VEvQK8RoGvnngIyZ2ppS+Ivw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Aug 2025 08:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118888

From: Chen Qi <Qi.Chen@windriver.com>

protobuf is upgraded from 5.29.4 to 5.29.5. Upgrade python3-protobuf
to sync.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-protobuf_5.29.4.bb => python3-protobuf_5.29.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_5.29.4.bb => python3-protobuf_5.29.5.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb b/meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
index d39c5e9790..14ab3237b9 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "4f1dfcd7997b31ef8f53ec82781ff434a28bf71d9102ddde14d076adcfc78c99"
+SRC_URI[sha256sum] = "bc1463bafd4b0929216c35f437a8e28731a2b7fe3d98bb77a600efced5a15c84"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 
-- 
2.34.1


