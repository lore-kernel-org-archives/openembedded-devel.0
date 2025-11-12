Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723EACCFA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 14:55:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15267.1762959305126497198
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 06:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CUetISJk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC51N5T3489586
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=neI4ubtDHLmfXKMKNU0O0VQlMNz+Z/qQwcbi5/vZeiw=; b=CUetISJktEh7
	OM3pnHuVy+zjKAdqodaaFsag/lsC9tejkrrCI2zZn8wwVOY8SIRFCHFPnRLcwMCs
	Xtaklhanr9kApy6Tty989Udn2ZHQpry4kfhPU5QyonTFmVVX+q6myn3k4WGUiHxt
	pO01WcXl3kVSxpI8k5rlaDacp0BD4j+hwqyWk2LCYoL3F3x/3uswxzNdeY3uJ9KR
	gtGxWLKIrlxbbfUGdlkelw0Fs18LiE/3wlixlUtK75doj3nDvyUd1bNHB0VRsTtO
	Xg2jGkGErgUkc3OcX0HHt6ugJ5BPc0d0rGRgZd41BAd+28ulIEgVWNEIT5cL0lKH
	uYSTIyp/1Q==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x5fx0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:55:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBWp4KxidQvykx8fCwyLRWNs8jMD981MvONA0QGQB490Y0FgiGWVu1W3FnzFHYHsarGSr3ieRiZEh0DrQEg+efSJGjpto3sckDK34myUhdaz7GQ/KNMEAuCDWYvPWa0+bDDCc2r+4bGH/6MQCmvtPAnILt4uiWppAdKXdrFYQ800kyhWhOUP770gkoSOMrEgx10C3bgsD8UrRQ/RE+ruGzGweogX4wldtN9FI8clW9Xiq+bleE5TWFjrlaC/TkvaswXmBFsOswrY0ZNlctkVgvLRcH7mHhdM1nP4kDgVjgKQFokF/NjyJpM0K8Bb3u/Bvn6ATMNMtpVa0rQ2Dngt7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neI4ubtDHLmfXKMKNU0O0VQlMNz+Z/qQwcbi5/vZeiw=;
 b=NXc5IeLQahcPj6W9nVbzjtKzVLzWufDirPKFO1XXqVC6yxKv76ws0r0CugGsqMF2jD08y/6z9SpnBKm+hsheSAbcA8OxnvzBifLb4lbPHQxXiO6XNTabBlneFEZqFDVGImLgPeliMAcI2239fZVUCUpLaBCV23ENwvv4XSX1HKXDDiHxHe7fqAcFqNKTAEwKd6JenPaUmA3AGoC3ZDEuCLVbz7qMVpX4e7umqFc+cmul7406bKKGicHg8kx6RZVMKXDgK2xdJgpy+Qn4vB0c8AM7gw2Vqp+xblHl/qFJJyJn+N2nHfsrm10X3sCwvNu++JTuiqAljURzeK1c5ETC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 14:54:30 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 14:54:30 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 10/11] python3-rich-argparse: add UPSTREAM_CHECK_REGEX
Date: Wed, 12 Nov 2025 22:53:56 +0800
Message-Id: <20251112145357.3788595-10-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112145357.3788595-1-yi.zhao@windriver.com>
References: <20251112145357.3788595-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d716641-7ba8-4f90-62aa-08de21fb61f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wNe350gHw747YyOfxqJf4bmlbvBmNcm4v5p976WirPZeiuMAnI/y5+HAEsU7?=
 =?us-ascii?Q?fen4A50jbfiFkI6gqhxr6yCQeXntnkNBr8bOoj7tEVKtmW2maqZthhbSDvAx?=
 =?us-ascii?Q?DozBSrVxmukN3+IsfWC4bc5CO5HX+xnjaU7jyI9Wi/XGy10LH7hQuCRglFLn?=
 =?us-ascii?Q?AO1RvpW5zGIr3PdaXzYQeYWQJg+NJX+/CW8Y2JlsLMoojAtpzGU+FYxdx24X?=
 =?us-ascii?Q?OxSQYg/GDJY9wUaMJRSZX4/mvA+V8ahm3D14Ew84/Kn/nSk/OWGV6uYBu3no?=
 =?us-ascii?Q?o2iLYNkUocHn/8gxkYVBIfxTrSARtwyglydpa/wYN/FRnWXyLfPmMiwzqxNb?=
 =?us-ascii?Q?VXRs1UPtIRAbiYLDOXFKZNl/GqtokhN94gl9LaFYMUlW4efr8MS5TdTRVaDw?=
 =?us-ascii?Q?cBNkFnaR5Ffw/gj+Gg4yqjG+SahDcFrJ8K67951ZRm3I2wVh/qxXbAW2LJya?=
 =?us-ascii?Q?0neMT8KExobvKRh+BfwizKFyqxkY5r/nE/dLsZ4g4d0j4OqAuD7V7hpyeQqf?=
 =?us-ascii?Q?hdTi+d6XN1++JvWQi9FSBl2HcGd4xxZMS0zPoEPrrcNcOfFhOdfiYU+Pm7P3?=
 =?us-ascii?Q?l56ae3/GNpDD5ZN4U3P0h0rxbTUsahqkrdQeh8Pz3d5++Lx9mVbXQynDsWW4?=
 =?us-ascii?Q?pow7iQ6vrn9RBxetxj8sjo5pB0/mGjupn3kjlZlYVnEczZOwKOS2UNrtT6NK?=
 =?us-ascii?Q?EFTyFFKO7dRnaAkFuHWOZqXABJXDAOkgAm/bTCJINBZccUV6+R14bdC0scG7?=
 =?us-ascii?Q?r5l9UQDZXMy/RB++Mlh7K2WD9HWALSGgYtZXaEXiIjDqDqUR4SJQa9Q+g33A?=
 =?us-ascii?Q?ndz5WsU/JcDrg8M6DB+58wcbpikGy3/iClehru52lqtadDichJ60Coihub+M?=
 =?us-ascii?Q?GUDW3WbCo6Ep0lNuLz+5r7zy1d8th0NcS2uqPhB87Jn8iqhixsQilLrux9cR?=
 =?us-ascii?Q?hKq8Kl1PcNYtaBheubvpMRbO5pOg6CYZCEf71RjogZYFC2Q2ewP0oTvgyE0z?=
 =?us-ascii?Q?Hgix9VTwBlMXuX7qrv9WxtI4T3d5erixX+ojp8KNv1Iwo4aqpsiCCnWXHzZR?=
 =?us-ascii?Q?2+ql94bdLM6GhqChhlpGCLgPjVaps13Ea1Bynz7rY/CarzJmS+M8NMTpMOx2?=
 =?us-ascii?Q?dwAIFg14Ob8DsVF+cs2W/unN3REvTj5dC6JOfBCUAX9yXg36tuNxjTj8geVI?=
 =?us-ascii?Q?ufTmHZY/wSea51b1hE4IBynl90McY7tXthjAR+OSWIws+QmjqP4ZIowmQFUl?=
 =?us-ascii?Q?gLHQu5GJQfVPzZsAbNk+MZKixAa432Klnbnm8EtNKr9fH7VXwESqwMtm9l0m?=
 =?us-ascii?Q?yBu5OuTAFI3RsRozx4/qsP3mbC0c21rgZrWT0nZr/fbxBrADhl+0lFB2CXh4?=
 =?us-ascii?Q?rbhEkL9V/0AMmiTBRY6BAj/dqsPdQIcHvjDSyjRQ2e86x44MixyKAA1ti/9y?=
 =?us-ascii?Q?gpbIEg42iemAgl0nKftmSn+oN4YYcHPRK3cJk7UmjqeWi5ohva00hEygyFdz?=
 =?us-ascii?Q?/3q7Po1T4ui67OM/wlhyFea5E/V56vBQuUOZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BM2nKHdMxyQtgpx6vVqRDZ95kBTlzZO4QynNMKBGxol74KbieZT/wZ2XE9/v?=
 =?us-ascii?Q?tqIG+IjeAssOm+bcFJH9KWNuZ7BeFnvagKDVkbAynlbuCZCqrdk2cm8XSXnx?=
 =?us-ascii?Q?X5tc4x4G+2bxCrcddCBunpiLOSIpAZypgPLWIyMxUHlZGwEdRJgW5zRbIk/j?=
 =?us-ascii?Q?mN+3JvrQWebAVNUsHWUXSnwM0o832pMNcIhv1LbNVV2D3kvkVcik9YI+viWT?=
 =?us-ascii?Q?4PCvEGjUu0d0XiJO9WtnyBtrW4LuW76tR0jpSQF5BO2YaEqTzVIL9nYPGZvt?=
 =?us-ascii?Q?+d03wPwkntkSn/+pYznqq9Xj6KBnmx5kePjvxTloq7K9AgjwgYkAmUoL0kLA?=
 =?us-ascii?Q?bmWrtvG4+jQYUyLDInpFV5AwYP4JgkmC3YZQbs5UmdOn0GeTHP7moVj4PZLn?=
 =?us-ascii?Q?XJkeFaYwfNCdqGiF3UIQ1OuxXtX/TqkkXzYHC6+VsR9ypMcnHwkkGTdOgLQM?=
 =?us-ascii?Q?vLIghegqx+vFRoA5eCkvx1iWUdS9xeXa/WErhDXOM9WEmMQwm9IZwsCM6K0u?=
 =?us-ascii?Q?rTrsid4yZ5Rfrqq6UQ5jWThXI+TXIOijOYp/pI4qJVD+JjeqdyH5qC/qF05z?=
 =?us-ascii?Q?Nl+f1vIc0m0CTxKfyr9T0i739zs69Qs9Tz12V+bNH3xpnFaMxdeovXD1tabK?=
 =?us-ascii?Q?JfrKjs8o0hjhlZO46AcSa9IuaaNMIEPPI0pg5fkbrk7aOOOLDiHkYpXGj+3A?=
 =?us-ascii?Q?3VvcZQNN49/p/Q/sFSvReLi6sO+pznMvDoQwq8fyL5QFqTUNvXiwj69BXZMx?=
 =?us-ascii?Q?aiwOY79QZzMIYsH3iwvvqJnZRHRuNed19h7KuPX5i2o5o4FQ0LR5zJhdIBp2?=
 =?us-ascii?Q?rtoWBszc6XTyw+VPfbICoRN0msuaNgF4HWutLgHg1Br8k0aZswLhGz0RR6UD?=
 =?us-ascii?Q?atVcjAJZQziBf6XDcWZXnZZoZUgK4TYBthMn5cWQV0t993rSNJHndYbcCetw?=
 =?us-ascii?Q?leJgQh7eHOBsUwQ5aG/8uDfsfoRrk35htvlu4MLLxraXFmIP19hKnfHEkKLo?=
 =?us-ascii?Q?driHpP3t8sPEMZZ27SBHptaR0mTLa3wyuyr/ii5hetc+Sz4zEuc/ohNrQjgP?=
 =?us-ascii?Q?zRxLzH4ixyQ0M/KmM0bOLk9Vutu3reXockYdj0zh4lEDIMbixZlTRaERRBaI?=
 =?us-ascii?Q?lbEB16U8hlwTtz1i0eXCBOQvtetodV1wgmFaVhtDfVQj68eGj09647Ix7ves?=
 =?us-ascii?Q?++Y5AKSzAxHHrhlrwAoH5jH+Tx78mOG0aX33TJZ49ZIQVlzd4moxgvTY7cjb?=
 =?us-ascii?Q?gUC0jFMjbZQyExS9bvINQX6HbrjB4Z6+bvYM3cesk8P3DjKP6bE0wdSFwhCW?=
 =?us-ascii?Q?6v33gyjxXVyCzmaZZ6XrMwTKcXJp43ZcLHkfgv3T5PNqzJbe0u5qUhVrVkbm?=
 =?us-ascii?Q?GgsgMQ4ukJ36yYVqhe6nSuB6+ftBSDT/S6foSWb3k20eNm3BJiBROE5hoNUX?=
 =?us-ascii?Q?1rym3S521uIluCDdd4gJa928JKSs7oLxQC4wSuiF2XFZ2g6O0R8DaHLZNWxc?=
 =?us-ascii?Q?ykXWEpb+RfsfgzLSH+lej3dfJDeXP1DkkIrtf0Rk+DiPAQh65mohsoPWReZu?=
 =?us-ascii?Q?eOw4SsScDjV1/aqKonEKnqbdj/9YpxCH4nO1L8lL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d716641-7ba8-4f90-62aa-08de21fb61f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:54:30.1377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nDE2vdcgZPEmHYkgd2KQfGIPJNG/Qa6u/RI4c+aqX7Nm4NVtEXoUIr9t6KBvZP9s6rxYxb8sb2rHvob/RQhow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMCBTYWx0ZWRfX2pXgDCPg0LIs
 DZdGWHMJ8XTHw5KpKJ/iVLmU6GGLvKpuTzcEntMkjycuQCmWcvK9f6icB4EwPLL99OSFJatkeBP
 SOFVd5MRdaCLNk4PS+UD97ljwpqJjoY/Zprllw+ni+OaMSEw7kJscn7zPdmNPH/jioGNnAjnJlZ
 Idob8rKa2EXdgp6C28IDudWhMrn1OPOuU7N9QXcvRkCRG9EVzDDM2+Yz5vrn4NKPi6sGCAPcqU8
 lR45sJACNPQ3foWno8clsKmxLkRZ0P6Cyz8EFTg9rpEPJ4hkLnH05M5E3IqjUCjMekjyZ8YrvLk
 DxArbeEsBFou3MqK3Vcj5RwFtsXrKwxfQyFIqIfUZnZ2DjRg5+y+A/TXOjr0VRkFi8QCvAl9Ms/
 nJSX8XgOw4vxFcMbgXDSd6jSuaHsDg==
X-Proofpoint-GUID: UTP16zbWr04doPZP_5CiUt0LXDGvQRFn
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69149fc8 cx=c_pps
 a=IMbvhL78Fdh+aiPumIwVPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=ecOmSUXtasTmB6pjJV8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: UTP16zbWr04doPZP_5CiUt0LXDGvQRFn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121558

Add UPSTREAM_CHECK_REGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-rich-argparse
INFO: Current version: 1.7.1
INFO: Latest version:

After the patch:
$ devtool latest-version python3-rich-argparse
INFO: Current version: 1.7.1
INFO: Latest version: 1.7.2

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python3-rich-argparse_1.7.1.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb b/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb
index cb07b012b4..c0e5f62fb3 100644
--- a/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb
@@ -7,6 +7,8 @@ PYPI_PACKAGE = "rich_argparse"
 
 SRC_URI[sha256sum] = "d7a493cde94043e41ea68fb43a74405fa178de981bf7b800f7a3bd02ac5c27be"
 
+UPSTREAM_CHECK_REGEX = "rich_argparse-(?P<pver>\d+(\.\d+)+)"
+
 inherit pypi python_hatchling
 
 RDEPENDS:${PN} += "\
-- 
2.34.1


