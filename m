Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD184CD4F4B
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 07:41:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18709.1763019699016795923
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 23:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Iq9Jt++r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3412a946d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD4eYDn1648027
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 07:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=TMq14BtLaZWzC0UjAB6qRENQEPJKj4357645W7k0UUg=; b=Iq9Jt++rJ2ef
	2GCzJ9iRtXZ6mXVj6nIogRLe1RtLAH1HvQYZEpwJ+LcnAa4K2XHpqlf6BCp4tQrO
	zXE6Ebeg9aShgqYdwuwYY4Io1AYCfgL/u5qwUbjT6Qwgp9m+6eK7wLvfTeQKraVQ
	DZNMwWcmkMUPgnShKGc4fO2KmXLNfvE/Xkva/Fk3A9gVJqb4HYTHL5C29pNtImLH
	fvHFA8DKmQAqMlb9UtQYJdKoTy+8zh56kZt67EOrRoHXNcQmdP9DRQEoMGpRGNXM
	Cf+vUaWIJp8WIHozz7wsigrvvtXros+cHus6Ykwl9yk8Z+glvyQGm4EDv430X4oc
	9LPZ8aaHmA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012014.outbound.protection.outlook.com [40.107.209.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x739c-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 07:41:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IK9yU2biv2tau5Il4BucFcRnPyK2ckzrizWlIJS0DuDBwE1nYMiR+tUE3HkuJ8UhTmqDdc3OENW7jDxfXiLrMtALHXIKnFZ8q8BMFZXwirSgh8wsKuQDFAr3MxHEqewEjcQx7pRN9//riP6SGyJ0eaFtAbVbYuI+ObWanvzQLUCZDkm0+OZkTV8/ZCSEwsS7gsAcaz1ZjAmO1/iKMZZTxdpjbYn8F0fE/dM4hHHEWuWdTry1AHncdxvtIrQkfDx8n1fy+ZRswp5tqix+zGXEOZtGW2TTVlRNZCIlHsZRiTnuqkDoB7Xk34TZr0fJa6sMZ4c2nCyehpGNNrSn///4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMq14BtLaZWzC0UjAB6qRENQEPJKj4357645W7k0UUg=;
 b=JeoL9MJTSIOaXrzj1W/BcTbI1cqNMGMWPdlNllsPUAxSKD8lZRfBtiuTM3s0ST1UALGbwnrteCW8Iw2vVgBC0OYXSfwYUUOAQLudBKkKs7BUOV34FWCvdhrqYpC23F3Y/kTGk8h6mqKWdavY3uq2JxQbgNd6PstchwBJayJwhM512qHZ5x0H8c8wHLc1BbeCO+3f4+/0SjSXSvIeEEcUwX8MCuooF9Q+6z5aIexK+PXOPHnYEVAc4Xl04jk5T+UcXu4oTVMvWXpkf9IIxCMxt8kvRQ85ja+utMWo0IuduVTMPtUuK3oCWwhGGjIiRqYh+ZuTVP68zt2CCB7OBCQ3Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Thu, 13 Nov 2025 07:41:35 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 07:41:35 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] dhcp-relay: update UPSTREAM_CHECK_REGEX
Date: Thu, 13 Nov 2025 15:41:17 +0800
Message-Id: <20251113074117.4031867-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113074117.4031867-1-yi.zhao@windriver.com>
References: <20251113074117.4031867-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0235.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: a7541fa1-f4f9-4caf-03fc-08de22881291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?L4X4ejKs0sGKRsFokvtygKZ7ZZZev6786hY8tmoF51YFYD5l5pCYlV0E4X3O?=
 =?us-ascii?Q?C8myuHcGbbX+f6mEonVcENklESCAN1Ef092T9f3++YXHJW5dS5NlTvkr8DPo?=
 =?us-ascii?Q?f/gFaru/ph7G/y6nZ2Jw+8lPiEp/Yfz/zGwPfdijakoRGx0TE5ItQkKa18iV?=
 =?us-ascii?Q?/KVqOiOQDro5buNX2c/wqoggirRFq6bMcf+rPdk5GtM0LjCAoBc2CNuGnP0Z?=
 =?us-ascii?Q?gXZS0sahr/83L+Qw8/1cFUQFVfRbtE9M7aNJlTUEE637wasKYTlM1i8mH8N4?=
 =?us-ascii?Q?YTH/wXlCo/pOPNMdJWR3GqO1zi9hKHnjvbbRLp0BzZrGPgnJGrW3vQrznT6W?=
 =?us-ascii?Q?BwDozsf6hxibBb07G9bqCfP83ouPVSTZK+qjzgFiAHN6Oh2IZZf1uHibs2o8?=
 =?us-ascii?Q?+3oXzpoBT6lcQMN/h9irzHDbzKRdZjC9NmgFuomj79AW8x/aDluCxcxQxjUr?=
 =?us-ascii?Q?zD8Bf0Yquyw8aXEsPvhzulimVN/Y8X7L1HbXY5p707Tr2EOCswLS9AytHH/2?=
 =?us-ascii?Q?Zr7ly9uiY68rgqc5RgMuK6Wj3KWxuWhkgQlGJ01D1ci6z63zI/cID48mFyHu?=
 =?us-ascii?Q?LBE5OaG2ZAP/rhpTWb5uf4HctIp6hwnhPHUpRXcSLFuiVjHnrv8MG8GMpXfo?=
 =?us-ascii?Q?69VluUz+GED6wOp20Uscyt1v3x3DD34thG35NHnTMHTehlGvpvfNdLa/IQS5?=
 =?us-ascii?Q?TRD1/8ca0DXzjaKtUijDUhgMm45nGZE9aEJNZG1zOVD4fyr3ky5LByxlPMgN?=
 =?us-ascii?Q?+2Fc86cJYdzprtVKgIoWAvGCWlpJaherp3Cm0XadcS4dCly692NBNrRCi2Lz?=
 =?us-ascii?Q?yLFkMrzHWrr4vqO4+QuNkGMJzmyPsmAyhyE+PedotjN1ebSxuQ76t8hs0GMs?=
 =?us-ascii?Q?/4q8dYh2yZoFhfIZVLJ5U+8ObNZVnb2uDuyms+nG05Ch8UzV8ScCV8r+d7T8?=
 =?us-ascii?Q?GQjEBJ+xrbYYn8u699NhNknV8G3jHEQK3vitJAGucFD7hGKliZkL4X8KQqqt?=
 =?us-ascii?Q?7YSiRFSwBWBqy3b/kGpPtWyowOC8NiX13XbIqHL8G99WDX6MEvl3ciedwiPW?=
 =?us-ascii?Q?RmBfD8onCtyNGi6UaDMpAhE7wWDYDYw6VwCg7BetmVqIedIAL94iqPwawSl7?=
 =?us-ascii?Q?9LqkQvs7xDkJJPmaOyYS2GsATZwMR4xXyEjoDf9yf7WFCJ2bA95yF9mNJmpP?=
 =?us-ascii?Q?IJXIxtVD4QZL3LvPw+cPZr5whMbAd96Mk47fsp/3RIvIF9tTFMtudBG7+fW+?=
 =?us-ascii?Q?OnSg5si8c4kdiFdRsTP6qK3eIsFwH5DS6TSaFu22S+XJQR1eWYHwe0Oijbja?=
 =?us-ascii?Q?w+i/W4KoZgzcsl50TCO0eM6mq7d39hKVFQBK8ctgBFCihhUKzDHrjsADjkhU?=
 =?us-ascii?Q?lWlXS5XOHzu+8th/rPJZ/qFbR5MJUxtH1z/tdcaZGsjA5fxTjyosspvZ1N+T?=
 =?us-ascii?Q?tAwBr/0HdZcKf4WziDPosuCWwtyXf30QBAfi5Vn6QG8yXUIpKu7v7Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p8zsOMKP+EOHInIyapeAVAIhkGQGyizD+jI6TfyU7dedAuAtBZiWfgorW38D?=
 =?us-ascii?Q?qW3ropu5rG9dpf6JgWQd4GdRUZZS7NTrOdllKnlr9y4IKnslPY91RrfocuBv?=
 =?us-ascii?Q?hNRs5MRH7CKVImeyd1k7hPUW5As/lGCf/u/i4bWb6N3PEp1z+zzzAt5zv9q7?=
 =?us-ascii?Q?QKtI+kOhUaiOe8H9nSLKW+W8Cji7MEf9SKX8KZQ5AT8NMwmj6rLWcAuWJNB/?=
 =?us-ascii?Q?UhRr0iYEZ2RZFzMJNf46Hdm0xHPrrudI2vn9kAuumC4DLcpk5ypasgfnWZHY?=
 =?us-ascii?Q?q6ZqgByudvnj6Fy9pW7od0bN9dAsqTcsGlkUagAF7ZHZ7paa1naWOj8eiHrP?=
 =?us-ascii?Q?KHYZ32JdDOfVBAA/lw4aFjGLjNNyUr3JfcTQdwH9Y1DRcBMTdybfF8ljZ3d8?=
 =?us-ascii?Q?iY4t1ZPDwDkGKQWUSp+IE3gIELhSrd3/oM800TgBbXk/sE+AsOjx/bu6HycG?=
 =?us-ascii?Q?k2zX83/EuBUi9qmAJdL/cKUKE0Nj7+LB5und1YHm6id+8CUqWftgspBHtbhe?=
 =?us-ascii?Q?3+BnBd38aGjM/HnJPSVxhlRdAYYdUklx9RctqfRrYut4Y7l1Rko07ASSFS6l?=
 =?us-ascii?Q?Ji6ln+xTC2w+HwwoQU+hUG13gYoFxB1q2auRoIQ2iLKqgk9AY8Ye1VXrc6+d?=
 =?us-ascii?Q?bmaBx3UptKxKHkEz8VbgYpgcT3h+JrAkyR3Zz00k0q/LBWfyGS+YHYBZq5gh?=
 =?us-ascii?Q?CVhr2hYjBSV6abWS2bDF04VJPp2IQ/6aNHOADmvcJKNHLHzAWg6u5+pyeR+Z?=
 =?us-ascii?Q?Lp/x0wFQkrmEjlX2D6wJAgLlmZnimRcQUB97lnQXWq9v6nxa/k4Xzu53RON7?=
 =?us-ascii?Q?3Rbbi2MBnWcSSZ4BDU/Upn10VoKdG6M5jhc3rPLPsH4h3CwlNg5wLaGjH4ET?=
 =?us-ascii?Q?PlAAa79hTPSFXcQb7fj+rgxjL8Ws8PO11TLs+K6uDKz0DeQ5pxkjIrDh79rR?=
 =?us-ascii?Q?3r7BYTykT9eMeCq9X9mcGfUc058H6Fur+o8BpiwknmRU0lG370nPbWeeCZBQ?=
 =?us-ascii?Q?aSFUcjLjy+mqYQCZmMN105o+FWQj67y7vkAfMaQWJrdN2d3SjbCTjWex4jIL?=
 =?us-ascii?Q?Eu3nbjVSV96od3i3LGgpM6gKwYh5+2mdGa9JsvMQ64rJjFKX3xJqdHoeTjn2?=
 =?us-ascii?Q?ui2gAYQU9gI8IfYdRfTEP9HSIyLCAR+EO4N2w4UwkB/LJ0ilITefMr9sgPdY?=
 =?us-ascii?Q?lnjYHn7UJShadd4wrDQha4VwPITllwMZQEuWfKhaEc0WMRty8l7WRLqfSQGa?=
 =?us-ascii?Q?00D83cEqwVtNKVj3txyTxPPdq7eCFExm/d+41uZHB+EQrQOVmfXK/xFN5t99?=
 =?us-ascii?Q?9iRCXGha3c2iHYaV7K7qPYa2QBx9ltrML9lbEK/h8OQtFDs9htmXo/zZZL4g?=
 =?us-ascii?Q?23kY6vAylKbS1Enh0Csr209/AuFTq4idP8dblBxiofBARNBVZy2o8r4K5xwc?=
 =?us-ascii?Q?Jm3SacXRI5CBvCX2HZccLfb3m1fiF/upUOtemKboKP48raPA4RuNeJm8uR/0?=
 =?us-ascii?Q?NHcyBys5/wH5Q35HZliQJc7eGinUMdBHYcEecLRtPVdCty4Exbjtq3K3A0zf?=
 =?us-ascii?Q?mQpgOaQRblpM3d564hNAz23vLdeQMH6SF4w6UUTx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7541fa1-f4f9-4caf-03fc-08de22881291
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 07:41:35.8088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FX65fw/9WkB6Bt4ywAcHwaKCfK554Ap/eMnmQg9xiynidkui9yqqYT34TVJDoVB0Yh2lR87k7Qa/f4P6+wM6Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA1MyBTYWx0ZWRfX3BB7Zr3vDzW8
 2ads5w+RuA8CRFI31UascB7jLX2SlE5sG5fKf7T/9Gxp0X0QQA7j38D5IrVTFscDEUehIX7QL1n
 nRtzRCYGjrJ/MXVu46oZZJV2YHXVwwZ7iK3Y9LRMxToXdj0sAKgbTBNvkoKQEAHwCQfVlsv+eIa
 JdtkU87v5ppscp9+uANIGFiS1hkg+hNfV6kpKF7IvZYT4fOI+UyfnyfgF8zCtdL/x/Srbe+7zti
 Z6piGQTsJQMeD7jXwzWYER0++D+PzsqTO3h44tiXkHWpJoU85kKDUfXtljmU5JSAC7Fbb7o0IKQ
 40CEYefwQP4OK3XTbgfXN1NQe+CzbijJxG0P8N3tTUYi9kmK+M4g3guZyDzdVmaZVlwn7xcF/mz
 YHLaMAC3cuqYMOkJ8f4JaQmqRJslqg==
X-Proofpoint-GUID: sV9RSF4Dj3XGvKzBjHpXmH-wTQWOdNEe
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69158bb2 cx=c_pps
 a=91TlPzG7kPfjcj/W1M6+cg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8 a=8Fn2TFpRFMYbW9QDWu0A:9
 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: sV9RSF4Dj3XGvKzBjHpXmH-wTQWOdNEe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 07:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121639

Update UPSTREAM_CHECK_REGEX to check the correct latest stable verison.

Before the patch:
$ devtool latest-version dhcp-relay
INFO: Current version: 4.4.3p1
INFO: Latest version: 4.4.3

After the patch:
$ devtool latest-version dhcp-relay
INFO: Current version: 4.4.3p1
INFO: Latest version: 4.4.3-P1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
index 8a33feec21..707eeb0e26 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://downloads.isc.org/isc/dhcp/4.4.3-P1/dhcp-4.4.3-P1.tar.gz \
 SRC_URI[sha256sum] = "0ac416bb55997ca8632174fd10737fd61cdb8dba2752160a335775bc21dc73c7"
 
 UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>(\d+(\.\d+)+)(-P\d+)?)"
 
 S = "${UNPACKDIR}/dhcp-4.4.3-P1"
 
-- 
2.34.1


