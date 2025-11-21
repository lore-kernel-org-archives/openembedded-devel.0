Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624E8CFA46C
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 03:27:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3472.1763695654117450145
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 19:27:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TSytqKRl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=342016e232=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL1obW34077904
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 03:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=yjjmw6zDBLluoLhZ1nc/
	+3DDRpk5P2QY7gfIwnU4L8o=; b=TSytqKRlhcs66Yt8YyvZRwQO7yERzDwVYf8u
	GnbGgu3hh1NmsFXhASob96Bn4caq8XrHTHatmrpUsjnB0YY6npA0GVkYK2j4NSRs
	ksRPTWyyva6NRH6HgoaxWYVWwt7M0uNHFotgdE6ggUdtkd8JsIIFl7UEbaCyL/dY
	7zGqrUMJ2AVnRYZig/ECs9HQJFrCgeqbnxbax6r156lT4KUBpWiUp0DDF6yNYM00
	hZ2pvri7OCX+ffB/X6ejdDMhEHMDpoXrdxCbU1j8S+6bPoq5LWXuwCdJ0qgOQA/4
	uk+TutXk72ADRU9v8e1ZvhiUwId3JsmHb1cFmgUv6yBecTz3KQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ajehqg2qw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 03:27:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1OHEGej4WECVI/qpuf9rlgCuYXB2BAoNjwGzMgkC3OCtwOCUtpWvLs5JYoCQ/VojU5dZ0d2z80dgO3vkzv9/Ur1u/NSWgsWUB2FdttfuevVgdOkOxEeRCgAnKty+g3dBLwxQLAnM8szgcTGkiL6Fz0kEZ6GSizl3eXOSKRLWxEmaTfeKd1+dlUG47pgUMpzsrot0iJRsKpCSzO70Ikzyy00vZdgiZGZTMYw+r4FMiFMSDUBZR5ZDgPWs9F6vEJmVG4ZNvJ6dujyIiQjUuL4ZoFifhE+KbenPHIbQMQi2eXqr2W9toD5gN9/mFYt4vbgl48eJmBZhydokRQkWHJD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjjmw6zDBLluoLhZ1nc/+3DDRpk5P2QY7gfIwnU4L8o=;
 b=cJGBwkdkGBgXJzp80MJVD5Hx9NDobiVs4E0kP5FKMaoa5JdW+scqN0m/68VcouNdj7+bnU2RPLs2oU8j5vuOyEb2AjySj8PJe46jNptTBBZ7DrWbqUzGpM3eiJinPQtopBR1ykqpcBcQkwtnud/UcBXMnkkQ8ayYgk1FoshPGPWIn3Pf6kU6t5bpCA4UFnzKvUm0ne4IAxjjiMXmcgtoIV95M6Mk0X4GR9dsZDydkE9cByZOjudy2aLyzi10IO3LqCjapXdV3KXduMAjdlzJo5Re9TGfaSWpZpFxn3avfWsrQlrPg6iehPoCVxs2taJwfoyJSLwy3rOh5XVCKPwIAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB7839.namprd11.prod.outlook.com (2603:10b6:208:408::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 03:27:31 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 03:27:31 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] re2: add UPSTREAM_CHECK_GITTAGREGEX
Date: Fri, 21 Nov 2025 11:27:14 +0800
Message-Id: <20251121032714.3836200-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0110.jpnprd01.prod.outlook.com
 (2603:1096:405:378::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA0PR11MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: c7406816-6759-4403-ce14-08de28ade72b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RBVIntfaxTVHHx5SuzhbSDxRIuGXVnWjC4RgK//vjhspnque1xG0xXmGk8s9?=
 =?us-ascii?Q?k1g9RNBQ2DVoyYRUaHiGX6dnkD62rXNCvM67D1VgjKh8lL2iUo/mWuLHJyzG?=
 =?us-ascii?Q?MI9h8Mirz9Nx01z5I1T9riD+Vn71IO8DMpAzIlUltxD2+uRHXL0dz93bno+T?=
 =?us-ascii?Q?trBOe2vCAqdxuWBk/c0qrv+pORp73dqthYZsoFEXPtARWlS1utXoj6nVuQIT?=
 =?us-ascii?Q?aIeWgY7ZpRtjhlJQi33CzXTv1gNDPV14KJ6ktXg6rhtCA5o+1lZF05i3lrrF?=
 =?us-ascii?Q?KKr1QkkPsyqPkH7OZrq3zwlVzDnk7+QkRx8oDig19yNEZj8sCYSMIzRQq2PS?=
 =?us-ascii?Q?JqoaiNHPGG/hS0MFaR7Pb+JdmASsfJg7JF+z0bsiSV/MYMlbtHA8RSVTHgMb?=
 =?us-ascii?Q?1SKCR/9IXZ95GPSQJ5KWp3iCXi2CahyU8vBWClGWwizSCtlllEhO6x53Rc1M?=
 =?us-ascii?Q?z0oVuKDtjo5NmJxsWMofRK2bxlKOrLJ5NZ3cBvN7wnxLmAA2ckFcaB7BjpKk?=
 =?us-ascii?Q?3rd/wdyt5yOd7t0URI4r4asmtkYI/TSI/C9y9W+MkxyadQx9Gsfnwrr66GMt?=
 =?us-ascii?Q?ES+QVjajVIn6ysvqssABb8mXwuIvQZNXGcyKTzsU9WOTYV6al7rnkafC4Sdv?=
 =?us-ascii?Q?yTpTXzU7nwdwFe2KJIo3sjyWhYWDSqxEmAvITt30maSjXvYcuYxU39y/zlGJ?=
 =?us-ascii?Q?7uy7j5QneZ4SXmKqjN6kIo+rVZRS1QzNPRcuTlall6IMTTuyhWuvnvyADgsC?=
 =?us-ascii?Q?1RyyCyZc2m0puFZe/vANMO66pKgXi1tkrDpatmtMSa6avMpypF4YiTZw10uR?=
 =?us-ascii?Q?wpnYLqQETjiF3PynI3Vw21NBzIR0GCcc7yuid5/oiZXAnTuUQDNBJIpU+Hz/?=
 =?us-ascii?Q?RjYZR6gfyIugLzPSV7IUG1OW2UoXAnAf4L7w5IE42Ta/5JlihqvvA5i9A4iP?=
 =?us-ascii?Q?KqsVCEVapruUJlGMIC1HweO2WPxIiKLdZZDR4WFkrrhyFQ0GMX06XULX7FqZ?=
 =?us-ascii?Q?Q3DuqZEgtETxCtly/VTAxQ2x3PAjjQVsm87GvdEQQsgXO6Vubdz3jSlWnlbY?=
 =?us-ascii?Q?/pRKsNZ7+LAXuh+H5LOwwF1kblueUea6FxSf5bfdk8rzSRnmvKcyzGuDHewp?=
 =?us-ascii?Q?u/rZ7J4jMIkLbwMUBpAXyRY/kW+IoP+aet7yeZXS1Wcv8LDcKafE8Hq6sADo?=
 =?us-ascii?Q?fdFLQc8ViWPDIbbTbmgJqTmRzYOzxIkM+UOYLWj2zFkYATCrN8GTcvPN46Ol?=
 =?us-ascii?Q?jJkMA0MFZc/QuylHKQTjgJeagvzVo9RiAncBrq/N5QtK7+cATRqqYgkbk4MK?=
 =?us-ascii?Q?Xla+FlIf3BWdfxz9ICt4TTDw3mixHSyz9c4U6ybz4OPDxd+snvVbCz0PkJYf?=
 =?us-ascii?Q?Xcdovu7rhFQqd8RKifOjb5FW85AzAwIyUxXxrcdKZ3lS4sYTdRxgCw9s3FL8?=
 =?us-ascii?Q?/IDvWff8wvaaQ7FoGQYpyuQgBJIAB7re54xYuP6posg4zsTnbQYFIEVxHhL1?=
 =?us-ascii?Q?qVHun1wM+/w2tvlyug8/q1+iblpb+rr8NkF5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Npg6TiHjV57XdNdSthtGqeSOslVhmfUkfp5a/UMECSO2bQvgT13TGIWqC0UL?=
 =?us-ascii?Q?HakJB6JNCEIwgin22mZ63inZrGECQfYWgzXcplLY7UR1XxBIV8B8wV3RrsqH?=
 =?us-ascii?Q?m9YR61V8LNdGjokgKMQmQDxdE1wcZczo8NywJfhb26/+6nSQivzEL9z54uN2?=
 =?us-ascii?Q?qfa/H3X/YJZezjQownNBrIfGGrLpQ9gJXNDvrPIoQm6qUOZ6N9CsHcJlg6kG?=
 =?us-ascii?Q?k6uA8Hzpew4+sqwCNCF9PBLUDBX4MkCRJMtgKz6ud4pBqn+SNICV9WFap2Kx?=
 =?us-ascii?Q?8zUbPA1UQ/jsQI79PObTeDqz5eu28gjmH6LZkJ1VqEvuPHht8pS8j/hBQums?=
 =?us-ascii?Q?6xYz+TNWD3d00befzm1tfvbfcd5Pgi0lWFFOitnFTPvThT9ZSv/InhIUPIGM?=
 =?us-ascii?Q?lNNb2ivo7K2gbE1rK7dTMbd43mQWzcq6e/D91ltTXU/VLmxLRXYCu/KSPpXt?=
 =?us-ascii?Q?3b1UQAbWWGwfvBsdQItxA86tjswNDtXSkB6a62ODDMkD209aHctDbsxHKULB?=
 =?us-ascii?Q?eUGwKdLVGUz5h3KDNv5rb/r9cg72k6N4PlRsVPvbCbXshrIO6qQbpk/vUI3E?=
 =?us-ascii?Q?hJNVGbvEP3trRIZJLqrFnbXCMRHSprM1oIj/3axJPXkXOmUjwEcgcFfYdMvG?=
 =?us-ascii?Q?ktS34xoOY+OnjSvPd94TzKmH6NWweClaAl1PBBrKkpVfkDUpA7Dc6T8uOETw?=
 =?us-ascii?Q?RykE+0Q1pzxwlTdn4sYz2ChqUYMxGBHyWr9JwEMFfRl3MVZipfeMl7HlWqah?=
 =?us-ascii?Q?fX8s2zQa/jGef8z8OaPAPuDYbwHSK4kloFvaKEqwvnuiAMKXDkHRtGlIsluL?=
 =?us-ascii?Q?qMvhNXHnzkvR9CAIgP5PFnDxMDRKMoDeIGAUWaoWscsoyuolDVq4IZzmhSu8?=
 =?us-ascii?Q?iH4SzHU56asY6uuwf7uWBAOjIdFKR7yGcWx/VzCRq010ee2uy0dkRD/OXg4D?=
 =?us-ascii?Q?fewnXm+cuWQVCMVccuf4rlbD7L0Dx9oPXFp2KI3VxuOHnDZ+1v1i0AjvBFCi?=
 =?us-ascii?Q?nja+DjRe5JQqaE4RO0KdDuXyXPVALW4t4Bt3ff8xwAE3C6KOE8WTK+EWm+WS?=
 =?us-ascii?Q?6Coy8nrHNr73k0e7tXXSQsj3W7ErZDew90oxaHAqnHOTGPgsEfUe/yXks6Dg?=
 =?us-ascii?Q?ff43TwpVquYKdnCc4TII9lslDUaVFQrRlBhmd6IfPq1o7xsjq2Hdd2W70jDp?=
 =?us-ascii?Q?/zYmTeEGFoJL5VmtqTEx+G1k4tHJDYi3RQGlkMiHaxtYKEKO64pOXwEeuBEO?=
 =?us-ascii?Q?GoNAdnlfUKLbqEwZOwK/GgJn8liE49rBRhnjOG89fWOoDpUJdndorD2Te2cB?=
 =?us-ascii?Q?S3STX/Tejh81X9FCVRcbzkzJIK+PVnL3lgo5DfkGaV7t+C+O60KRzRYFIwnB?=
 =?us-ascii?Q?VOVa0FyRXNDjgArY9PLYkOt9ikBVWA0LFSaUZOlMFVaz1pkyqc3hhrnNBjwz?=
 =?us-ascii?Q?nP5t/EJsaL0P1/Uo01gC1drqJGeIMnyoJYhvDQGzU6RtY8GgOWJSUOTLgK+M?=
 =?us-ascii?Q?QetBQMzTnpgd7Q41oB7z0FxoDAKbNBqTh642R6J/yrPurcMSPM2lW5Y0IbHy?=
 =?us-ascii?Q?elRQBxOvHXFc+6X6bPgsqP8ZsI7FEdHaNtsCrHXP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7406816-6759-4403-ce14-08de28ade72b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 03:27:31.0972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rd+U8wedpd2aEk2bcnCcaabXHhwPRq60cY0KNdGw2jK8Jk/cyvT/gAJuLauINdYVJF0y+9I5LSQ/Dp50la20Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7839
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDAyNSBTYWx0ZWRfX8LJkX4ofbP4c
 inUfoAy8if4J0MA9pLWDgFSq129BMa3mH3DUVviuAQociV7XmYql177wQkFBg8K3bkgXedIs94T
 KzYkFXjswI/xGV2s/WpnN1J1dVCZBXgpWAJu98TRgzYjihbdgUFgG9o6odaZwTVOWRZMkb7u/rV
 XXt0GCtuLG4swbm/4MEQhrLs+2G37I/dtekYSxyZFHg/Wsbhuw9LgFPqU6l9lLPGXhT+Qoj4SaY
 DXT4Ssed+ui19yXam26BUw0f8ds4IJp1wL4UUUtUQsjSLbkDKahx4meRdvDHDoVHvBPzODYZV3h
 Uwg8gdqFlTb2Plmx/mXcg9LLVgzHDimpz3OLmB87V3BCVuqfg1a1JfnlNs0wPNOtkh2wx5Workk
 bGcYdXffg6d01zL2nAjCkDDK0SP/UQ==
X-Authority-Analysis: v=2.4 cv=EKQLElZC c=1 sm=1 tr=0 ts=691fdc25 cx=c_pps
 a=RV/m/49WaDJDQ/P4gGxFUg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=1Cu5c7XlS_Q7MqVc3c8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: OLzzjlpKSObNZep96uk8vNE4cNc5Xt5C
X-Proofpoint-GUID: OLzzjlpKSObNZep96uk8vNE4cNc5Xt5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 03:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121957

Add UPSTREAM_CHECK_GITTAGREGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version re2
INFO: Current version: 2024.03.01
INFO: Latest version: 2025
INFO: Latest version's commit: 927f5d53caf8111721e734cf24724686bb745f55

After the patch:
$ devtool latest-version re2
INFO: Current version: 2024.03.01
INFO: Latest version: 2025-11-05
INFO: Latest version's commit: 927f5d53caf8111721e734cf24724686bb745f55

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/re2/re2_2024.03.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/re2/re2_2024.03.01.bb b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
index 5b7b241a25..a510545bab 100644
--- a/meta-oe/recipes-support/re2/re2_2024.03.01.bb
+++ b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/google/re2.git;branch=main;protocol=https \
            ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
           "
 
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(-\d+)+)"
 
 DEPENDS = "abseil-cpp ${@bb.utils.contains('PTEST_ENABLED', '1', 'gtest googlebenchmark', '', d)}"
 
-- 
2.34.1


