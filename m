Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D69CED613
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 06:57:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9947.1728457070603500523
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Oct 2024 23:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0012b9d29b=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4994t8Y9003629
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Oct 2024 06:57:49 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 422ve8v4y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 06:57:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1JDnPoT9quf9J8V07/ziWlHBn5Df90n2wOMl1M6ighahC67g+q+1OgMfXGCW0AnEXkpoReop5Gz35NOZtaR5MOPpXDxGtZ4krztjJEwgis/PQOHDISwKG2hqTVVqORVhvQo6UPrLxobR2tuuHUh0/XvoqU4NclOaOamxlVe8glbX+HOeilsfoU4+GLUdG+gUicuGpghpPazUzQUH5dNh0hkAFDNBEyp6rPpMpALQu0K8xVpuW3F0xCob7vOqK9m2QPDZaCsWRTmmDCJOZutv7xlIn4nGvBMWr9melW/pw9bDTuByccNP4wroIbf3XWq49pgVY+oZLg6pe1YaWNfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjRGPYSGV0oML3Dy6D6JCVdNTuli1pzHahXVnga0tFk=;
 b=iPx4vFniVzoEYJXRkrgL0wkJx/8rX4ceXnI1DoAxSP6E8P1TjheA+f3eol3K+d7+jFT9TrOgvOj5fP09/fd1P4aLp4Lne9qBSRnGN5RtPBHVwN0x9Fs+zJT1zt1bAWTqPkOM+1CliFogfD6YHEZ6VqaB7kmpXIe2v1EfkOZ+UQSl1+gxdlnq9x7NPrZDtZPkPdYQpifCeoEFNCH5FpgK3qGHIR4wfrP53vM6apU0uL3I5gJIfAYttTuIBcqYpurZgGpbFUaz71Twm+CQa754p/lrop4BVyMlFcQ8roB43aCqmVOl9zDawAn2xdhKB7dV0fpqroC+DT+Fcb/oSbaltw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
 by PH0PR11MB4967.namprd11.prod.outlook.com (2603:10b6:510:41::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Wed, 9 Oct
 2024 06:57:47 +0000
Received: from SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326]) by SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326%4]) with mapi id 15.20.8026.019; Wed, 9 Oct 2024
 06:57:47 +0000
From: guocai.he.cn@windriver.com
To: kai.kang@windriver.com, openembedded-devel@lists.openembedded.org
Subject: [meta][kirkstone][PATCH] xmlrpc-c: fix do_fetch error
Date: Wed,  9 Oct 2024 14:57:29 +0800
Message-Id: <20241009065729.4114713-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::32) To SN6PR11MB2671.namprd11.prod.outlook.com
 (2603:10b6:805:60::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2671:EE_|PH0PR11MB4967:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ecf1623-63ad-486b-e8dc-08dce82fae90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xy2aTohkGiClMhD3fLeGW7HG2WWbo/xYCBBM1Yi27GHLwh3YMuO6raCqk5D6?=
 =?us-ascii?Q?xs4L67A/otB2acWIIxtNh6sK8G5CI6Uz0AR5yD9HZpFO5HjUni0u8vFR8pAh?=
 =?us-ascii?Q?bOure9itcNcwSXMQD4SRcacY7nekQPItBus0ICcg/JRTxl3DQCIhZFkNe4qi?=
 =?us-ascii?Q?g6Bs6FvkwwjwlR9Pw5wXYEyFnQ3GNk0VPwnn10VQIgLqqPuIdg/RQKOlHvqx?=
 =?us-ascii?Q?ggYYrP6aYl2PFWncshc7IJfUes+Mz3o3lvgVFqdKReCr4EAxJg7nQZcCOGyW?=
 =?us-ascii?Q?qcZGznowRPrTnZUvYOfHW8q0EJD4zdiCOZHO2HaXJ2akvSV/aGUDgvB0Crhw?=
 =?us-ascii?Q?VeaCm4HFFTkRxcyt9C8cYt+317QsTg6McuwPsooV8q6dYh1s3mW/cafgAs7O?=
 =?us-ascii?Q?p+qby66WXyfaKy8q0A8PsL9d0mEfTPWot/fQGK+OA5P9NVk0sEd/Mq6dmPT4?=
 =?us-ascii?Q?+IyWF3F63dEi24C8JYtmhjM7MdO1aKIyhiLeaJgpcwo0umdvwV/gHa8mSEaK?=
 =?us-ascii?Q?7U4tLr8WmloW29JUo+pX6uA64gaThxMAsSM55+CrM8Rq+9Wu8n+FvNJUu6Rh?=
 =?us-ascii?Q?MMybSgstbSNKIQo80cTkkqjdJgVxF5b3Ux9D8B89up8OvLezqNOqaj7bSnBv?=
 =?us-ascii?Q?wp20EtZq8sLcTBdpH9TA+w8LI1jg2ut3LJFyKKqDOj449U4hFfinLP0HWrHo?=
 =?us-ascii?Q?7qmbO22gkQWzKQgOdyk9I2JkJ0T1pGhLXsTeSy7tsKDwU7FWp90PWZ48ctpw?=
 =?us-ascii?Q?QA7YFHl5eXmCTxHE9ZcHrYIP3zQ2Iinoa537nOIVNEOQAXeIgCtOREOXUsv9?=
 =?us-ascii?Q?avTbzsh4K8wMWMOb9gbrv8ZaQWMU3AhlAARVKr2kpZzwvdQ+jPRC/qeXq1JE?=
 =?us-ascii?Q?ZGK5v9LYqRgnwSoH3iVNlRep1jA6x9OBEr36fhkOVU84ox82XyHUjwzI9j/d?=
 =?us-ascii?Q?WNH4FvghvEzvCpXG+jgBj3vkQsSj40yryHfLTYv69jHg0H/gMiI04DmP2M8n?=
 =?us-ascii?Q?viAjxyI05O8enlHrG62YxniKkW4wWUbvfklicgUHxBjhl1X6g8+aWGGmLEo3?=
 =?us-ascii?Q?qfrKT4iiDgAkaE/ICFihpvRM4W1uioXzrngu33L6LBe8ITlo2L50DFo2opve?=
 =?us-ascii?Q?YGZH+zZVEwvG/gTHTn6y1qGo0jIYLFjvwGK+chMPpGvd2sgehJh3UYl3M047?=
 =?us-ascii?Q?MV8JxvStZKQ7f+BxknRxH6ZescK5sttwhoO3zE88ydanx5tszeU3unjQ5ACu?=
 =?us-ascii?Q?JEkE4/j9TCXpKx2aDj9CkOFd0DGxqhajSY8Y3P5EgtKNXpM9+edrUCnySGbp?=
 =?us-ascii?Q?pZ5P9T6vdZg5e4976VtWzEsA9Iny0s9eio0XVhyVK9+ADw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2671.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qBrVLBfhmaZ590t6FFewlFxAo/C3a4FLqVnuFD95TKZljaaLhxDauRI4673d?=
 =?us-ascii?Q?F8ht0D5tfM3zIp+xdu1UODZi4giCP3zv0X5GOOP4k/l269uGy0adw4WCIJW3?=
 =?us-ascii?Q?fOcFZEp95t/OF53i8iTB6bbVSfk1092Tj2nwk8KVQlvwnmirzoAgf1IAo1qD?=
 =?us-ascii?Q?YDA0mCA+P7YBDBg35VykGziqUWMJC0Fpm5PIoaPzyT6Rn/VJN/L9OZl8GW2e?=
 =?us-ascii?Q?oWZMDYibuDsXPDS3vrgeLUcRhTnkxS8fMhmFsuylZX0uPtCo6x6GT0zvojh3?=
 =?us-ascii?Q?kgqpqoNpmgHSo6z843VQv8BhU9J+tJnluTkuU35PMAHGEUqiaZUIMRZs8tIq?=
 =?us-ascii?Q?/kxw3WL0VsCuWYJ4ugVrf4N086p77q9UoiwYVR6A6DDDJNXZ3IA2uPP3eiwN?=
 =?us-ascii?Q?RYjGt/4/8vKIDpsBjJgtIgrp8437erhsIdmtFhzIDMYjX3N3G0XcH/DvH1R0?=
 =?us-ascii?Q?aEwvIKr+Rgr4fzwD+lS6yQpKYdU0yJKVceOTqGSk8V2sdZSv6Lwyk4hyp4FC?=
 =?us-ascii?Q?yX4sk14nHtoaJtCfWH/RMh4kXxn/VEJDORwy9APRovSprpVefQK+mFJy+Elt?=
 =?us-ascii?Q?NEyBv0Zk4fweFeN+G98ZGSXE103Yl42bQgQcVq0SDkJZsVy9u5b/cQgXm8wD?=
 =?us-ascii?Q?HTNu7NkQqUJA1P0+xBTJScTorVMU9wt/Xrwps6lksyP/m4lPLjQgm3KhC7Tt?=
 =?us-ascii?Q?NWTSVg60/aS97t4j7i9s2NorwuqpzhyY4q4ZhBA6BzI0ZFCPeIzMr8bDg/7r?=
 =?us-ascii?Q?q8JPAueEL4MsDOx2eZLwlx+WTRrI04FeORhRpv7iv4PY6r/5c1OgO9b1kLOo?=
 =?us-ascii?Q?u29lpvuoBNbDSGZ0ifitiziq2irJpt01SCOhokH/IG9ZoV9omD8aBrJiRSnS?=
 =?us-ascii?Q?F5UfPvMGF2o/mBCXaLHbfLVkiZpkW0biukBtGLSoduF20IgdDJGnCB8rb4DW?=
 =?us-ascii?Q?O2e3W1ELOJUfXi41Nw0GD70qe9C8OhaylcfQV9/kfkIyICuyOUa19H8zzyTw?=
 =?us-ascii?Q?lDBkluTWQLS/QEe/52SNWsREuN4INaTr5qAWw2aCytP0LqrITsXQVTaKThXo?=
 =?us-ascii?Q?RpOTkgtrvEEjCZfyIAiGgUXX2lBTfG0R/FK9Tx3TMQAnq4Y+TOKVAXluFf4y?=
 =?us-ascii?Q?n81HDV4cI2xUU0wf0pU2Io7CsxLw1n+BGs+OivNpzB3kicXwBGpzHTn9cFWl?=
 =?us-ascii?Q?HJc3LHSqiw42HMjw8imkWJs+fOaf/83hGRwawDANz4HO2y8xiLdyhbuVfnmi?=
 =?us-ascii?Q?SGwzoybCSEluiDF4Iz3iDUVhTSZUBiFUhJHekklpy3DKMPqAO38CvKMOcyzH?=
 =?us-ascii?Q?TbTp1Db2vjkMDIvf2OVlvej9x9blsP+jVPTf6mlP1lp4/XARJa61NFrtpSfp?=
 =?us-ascii?Q?FbOFdOX3mdjADhkVS7DicyA8ygSaA+bsQlvq30JlQoF5n886FfrMd+psVaOL?=
 =?us-ascii?Q?qo3lRImVMZgpGoIr2jkZR0jjQWRiRAwNAKA43Ip/rGFBR4Z8kJzWhLs8hsEV?=
 =?us-ascii?Q?DHMBS1nfp/Jas7OYBb0BvRiTXhHxY3LHVjOg5Tx7L1AINO5lyjTP6z60DZIi?=
 =?us-ascii?Q?3C4Td9TSDKiWBDL/k345LttV5oVXa914xdE+jbkt7zUbGwUXWGkTDOSqi1TH?=
 =?us-ascii?Q?Yg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecf1623-63ad-486b-e8dc-08dce82fae90
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 06:57:47.2001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1C51lmTJnL79uqLvU6ECpNuKZubKNLuYEOgsZGU9WB+BPpvAFI5SlhJvXykEab1r2fRG6ijd5nn9ajsSY3cImAM3UVWIwiN0Y2gQXjjUy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4967
X-Authority-Analysis: v=2.4 cv=CPp4XgrD c=1 sm=1 tr=0 ts=6706296d cx=c_pps a=E16apIjzS4FSNrpGVxxkkw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=R8fBDzYJ3QqHnHLGnFAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NJ9I74RjF11kbcimm2zZc27GF2VJoTWU
X-Proofpoint-GUID: NJ9I74RjF11kbcimm2zZc27GF2VJoTWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_05,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=692 bulkscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410090044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 06:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112723

From: Guocai He <guocai.he.cn@windriver.com>

Fetcher failure:
Unable to find revision 86405c7e1bd4f70287204a28d242a1054daab520
in branch master

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
index 36205009a..991c4544b 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
            "
 
 #Release 1.54.02
-SRCREV = "86405c7e1bd4f70287204a28d242a1054daab520"
+SRCREV = "36b142d6179514989a44c1087f6c46182dafd21f"
 
 S = "${WORKDIR}/git/stable"
 
-- 
2.34.1


