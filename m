Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FA4CD13CF
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 14:54:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15440.1762959270641151059
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 06:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=J9brbkBb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC53dYS3492130
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=65qiid35gb6dHVMC7X3XrLR1Vw9nuJzQD7KB4Zkf01Q=; b=J9brbkBbBp7W
	0QxLFvJ3frXk+n6MQyMT2FDIX8uw/iUfPySFQyPsju/Z0VWWQYAvMHvHPSjCKotv
	KkWcbexNW2vhMfE7xKt5hakpQ/6/8FCoAxTjIvpV0TXitStL5Y/0n+dLBKIao8my
	+bt/UGzCTzcv09xj/YP1Kvv6a5MQkBBDGWSUAjLz0J3AHE8+9cqyW9Cg+rmQt8HJ
	oq6jnjH5GQgR6YI6AZ0AE3liKgkyHKHLq/+EkIaNQ0bSDJGIzMtMXWDlLYbyhBEk
	R1kdJlaL+HqKpn/TsO8jY9ofaI4E83Kd+KbIPeoCTPdSh58a64rCa/tTqpuUjSf4
	l3LWYCFQtA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x5fvx-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQ4bSeajhwsLFDh9WOcYu4gJfMdZ5TYoU3e2NDmt/FyLciUw35zsQHU4uO9xFbHsDFdSAV42dA3u9T49DgOZmReoDy8b4TlJQVmDdB/5WkSHuHhosqE6G2bauKmh9cdMJXwPHL8zNEXtnQh7gQG09YPwtXXZ4Y0IB3VOjSgUpLBcmmYxtN8zUNbjXZf8C7Htujmp0RYMQx6L4YYaKVJ3nyT8FhTsN6iaKBpqsqJaMJnDBVlLmmrNeNB5t8wlaAJYrfESfshQU8sPD3//cHMJpPMmu/z1LtpNkmNlKn/52nr4Z50Lw5mli6NWaI/wi20aGD8pJuxD3w7QaZlBajJ4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65qiid35gb6dHVMC7X3XrLR1Vw9nuJzQD7KB4Zkf01Q=;
 b=ed4D9KnLsFV7RelbP84PxVvau+e+kgd3f87Tarh+Cgtgy6g1uyMH07Rswxpd6go54rHlcI+dW9NFFtE8a3QEkN9EEzzdNnEZxhT2KPcgDI7CuspMqaj5zZy1Vv2zC+JT2XATczymJTmjsZyxjkVeh3eKWUIpfPy8w+ldY5bD0/HseFN+UA95coZ57xloCVi33GkYUWV6Qo8vg4jHafXEeJEVatxGyjoUpQkideWleIsSVZF6q3RMcRU6MFehiiO9tbhfdPpIUuLBIksr5QJuy2Mf2nH7JIvB4EMz5thXXscvqR0exIqooj5OlrAOZKExPZNQjiqYOMTRbJpLNQsbiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 14:54:23 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 14:54:23 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 06/11] python3-pytest-cov: add UPSTREAM_CHECK_REGEX
Date: Wed, 12 Nov 2025 22:53:52 +0800
Message-Id: <20251112145357.3788595-6-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 21b3ad3e-f4b1-435c-f74a-08de21fb5dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mUC6N7cPqnbyNK8Pg4mD1vGP5PfvX7ZvoTgDgfuslnqU6iSogYowWSwuJmaz?=
 =?us-ascii?Q?S054YHspghCxDhWY73UXCUEyCsc4vUTR/f6sBHVwoO0Ve4Qf3SxXgifqD1N3?=
 =?us-ascii?Q?yjyYKCYelPtjjhUOhmbDvkBVDSzYIhZz5FQcAuZfyeD995/eXMC0i5dDM7bv?=
 =?us-ascii?Q?mtXb7TI6bLuAP6bUmUnQMC9ouhoSKNV7IEj6ZR7HwWOzh+862zWj7Zjkj4dt?=
 =?us-ascii?Q?FJVD2iSiCrf1VBehFSavyNOSILsYvUyzl/ya9QW1X7NNquAvnMV9S/1YUMAd?=
 =?us-ascii?Q?U3tZ2Vc2Md5I3zMq/fCNO1QsColUBf5VkvH8tdEDxDwyocD6o8qU3TPm4GyT?=
 =?us-ascii?Q?ICR1WoXb+THqV1NEC3kH/uZXQ35TQ9YkLs4z8loSOffGA2ECpjoX4vBrCGjA?=
 =?us-ascii?Q?XG2iJw0n5ElyuacfIIio3Zp0SopTxd+3nklx1/h9+RBjIb2rCPjNNlVWFdSc?=
 =?us-ascii?Q?VQt1+D1hQqvrg0wj1ydVCdZCj8Qpopf06EtAw3fhwqPyjmv4Ig+WTGsdtpS4?=
 =?us-ascii?Q?/iQ8xXNAbWv96RJC8RJeCcDvIj7dS1VwYo99NRcw4TC8xMgE22t+1Di60Duu?=
 =?us-ascii?Q?NzM1E4yvwPvtIIPFaj8xMt4iGQ0ABkyrmnvv0dQSzDSB4/6fkrq0FcnQdwiA?=
 =?us-ascii?Q?LWSNSIu6rvTkKqdvorbwX9OKuWdmbBBonixo/N7tLdhfsNjd1310T3JC5+oK?=
 =?us-ascii?Q?9Wtpa7kcp2um6VZrYM3P60b1FLK85wdYV/xrqUwP0CeuaeeYsMnc9f7ivkCu?=
 =?us-ascii?Q?gXzK6kuAZqWSFzzUFltIiy8XqWpfae88FQzr0fHRYs9hF966zSgPbwrwHPUO?=
 =?us-ascii?Q?FOnTk+TshbpTj8JQkjiRrHILDLhsEYX2klrLNVpJ+juohJ6+aPKoQWCc90h6?=
 =?us-ascii?Q?lE+gVeHDn0wldChBTW5bOpDaMinZkWQT7YGINjTqjh57sUAn7xMA4nd9VdC4?=
 =?us-ascii?Q?z2Jfua1vImVmuKqyfVbA/Y+W4DEcQ78eR5kyiBQJJGkAhHz6T2InJhvVvjev?=
 =?us-ascii?Q?gZbbIqcXH5ZfO4l4Uxia1nvZE0inyuno9BVy4OD3pDzTWPWZ00+qN49NKao+?=
 =?us-ascii?Q?oWN4YKnnDAQn7ZWoI2y2o5H7bHABJhys0RbTxrr0lXpaX4I66K/rCdjoxxhE?=
 =?us-ascii?Q?WFD55WwsuK4Hl7eSrQbgPsa9DesE0qL8rZr1fJiq/Y/9lph6/DzvQZ2IjN1n?=
 =?us-ascii?Q?NVPJkqjHaWaBn9HPSPPOCQA+xgSLduT2bKd5cPzzmaA3lYYlxqbL5p186ojV?=
 =?us-ascii?Q?JcfOyBSWjEo+VDvMG+w5v7cwAd2qE0Q8or8Mu7fbZPxyFj6hyNEGMVQ81b5A?=
 =?us-ascii?Q?9rzSFnCk6xo9ZIPt+olWw6p1QcIohKACJiw400arrXqVg+IZ1P1r316ll9OP?=
 =?us-ascii?Q?PP4jt1rqHpCtDX+ucHqWmXCHAar6EaxTfv8RJejnqG4xJRt6e9WUhtA4Xh36?=
 =?us-ascii?Q?1LgkwnBQxx6mcGbJ4w/bctMWi+cDQ2nBGoR80P6nImOFbW6gxaA6MG5ai6e7?=
 =?us-ascii?Q?9g0SfZYBT2J6o93mDc0GMI6kkt9NF92MXLIi?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ghv6jTWJB0O4hUBA3AXimdJUwyvaQ5E5ISnvCNp7N1tJOSOtlodYFnChiiOK?=
 =?us-ascii?Q?B0rGCk7xegncPqB6kOjdz7+6Q1oc8K/V7VDpHtahxwalOZYUdufiGMOV5Sfq?=
 =?us-ascii?Q?si9WoPGL8TZ6ZiuXULHkaIUy3AZ88T/g6H067vb405d0XPv0+rjyQQczA8g/?=
 =?us-ascii?Q?9GByOwQg9a45yfo1FVlieyZXbZPiOLnFrddFdUE3Ul6bRQQknwSt/NeUEiNN?=
 =?us-ascii?Q?6XbTIOSmVbY2AC5xFzgom7+BucuA5eXZPetlbPBGM5Ylo2+3pVp1ae8tSMY7?=
 =?us-ascii?Q?GpQIerCVCfTfMLpTxxSpRzBVT9oO7N2mUgjim/gphfrTGoXa6lFCVkK3lQ0J?=
 =?us-ascii?Q?Vb33e26U/7yebJ5SOWX9WEPTF6//xYDD3dmFDn2RvxUFmddmUl/ZtBC6h6v3?=
 =?us-ascii?Q?/F7JpeqRXfW1TTfcjHSO2560LrAZDQ5soKjo0qC0ipSQloBrXR4e4OxXgRwz?=
 =?us-ascii?Q?eVNP2WaxsieB5b7CfVVR4qcmSm2O5Yq9pnTY4fGptN5byCHtzoumf2v6+0Vf?=
 =?us-ascii?Q?qWIMtJ0tG3OHkLIMJvruEIzjpaWDbSzzwQbGgFu4gEhqu59y1n6p9J7q8QHm?=
 =?us-ascii?Q?aLmAbrCj+Y1bPpRr4ijaHmMiQ7OO0+TbWx7dtadqegGdSQbYQT2L6Pd5L12Z?=
 =?us-ascii?Q?eAK7cpQ9vB0TFfhXkQjoTBKX7doDeBrYlPojNcmgpDS4YpjLkdQLMM5VjvO+?=
 =?us-ascii?Q?19Mknwx/WQCmou8bRyvrMdtqcelp5hq3hSYHvlrjjJYEtFIm9nXHA/69uUEb?=
 =?us-ascii?Q?PYLWsXImTjgXVfu/YlF+Zwuj3iaibJSDTAmCA9JOkikbIxpp04YhRMsNCVxf?=
 =?us-ascii?Q?cPV+vnhAb69Lbt3+FeUo3YV6jKMhiRFmyBgtXUNRKTlT0FoWeruD92/GMVr3?=
 =?us-ascii?Q?KyOz9LEBZ32S7jjCS5DQ6IlFAG4hDj1erP4FYnvR5CQxWqXn6mHM96n2PvML?=
 =?us-ascii?Q?P6v07MojlS9QrrFI8W/R/dqKJAuqe/nX6XM8udugdQ+/XeP0Gng8GiNyy6r9?=
 =?us-ascii?Q?Wk94ezwaXx3P1t66/zrLvUVh/seFZLiRBjduQD2BjGB5fvMj7mcT82wTgzcL?=
 =?us-ascii?Q?6md2l8f4XtmJ7hzjJBzB8C6yoLCZGxjM7fZRzXLXmYtO3XyWZ3KVo9z2ssxS?=
 =?us-ascii?Q?kK/8BSt8vj+ZN8uIsjH9amsd+3jOgr3bFFd/lW6c5fPR5EYA02uMxsH5pVhg?=
 =?us-ascii?Q?hIYHUOeYGWetMLXmlyRs20zdcvs39pPbvvBATGqtYwSIJ7sCnBjCjQa7N/4h?=
 =?us-ascii?Q?BvOBljZ7q//C5i2PSPg4iQKNLoYmvs5KeoZtL0uZZDCCa7zd1AuQgKlHtFXX?=
 =?us-ascii?Q?ZuHlzJa5//PRVpmZBOmgqWfKYox7CpcVWkHiIVED4c4lx3RWoNli9pfEtuKi?=
 =?us-ascii?Q?ThoDJ2u3lbmjV8PzOolcFTZeuYx5+b6XgaXA1P6acYlqkdHpJVZoBxpD1Sok?=
 =?us-ascii?Q?oOdqNFTAgpIfjr2qMn4tTux8ZuxFTKNK1D8x05h4atkK7/YUWoOJtoR3Xvcd?=
 =?us-ascii?Q?23bsCSS0OFt3n3F6orMUfPwJvc6JS2qxCqEx4XoD8hRFzXlXI8eU7VL5JSoI?=
 =?us-ascii?Q?Rxm2Nle1u/YWVyogka9fmGy21b6WiENqoB+IWs8j?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b3ad3e-f4b1-435c-f74a-08de21fb5dac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:54:23.3342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRs9rz86xEuPCxaai1s64AgpnmUk72H3NAwoeXkvBfugdRKlBfP+wjWCpFg6fhaeVCxD9yCDX/vg6WjnIpndGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMCBTYWx0ZWRfX8aazoohIbxsQ
 yNj3sejuJH3l2zJ2oy3Drf6kgL2AxBJ5JkcvwYCLeAWWr/3/esqXa5mPXaoyhNhmp3jVD2PIX51
 reoXdfMk/kyGlCoW/DJIs+fy4eyowy9BGoR+0FuRYpcvxZTXtO4pvOtfAgu/cAxfM1PNwDRTmgo
 eiKAtTUwScReLwYRXyaNFUqSdOyYEQ+GXQ8F2rDDTxiXNzQRENIVEvp2huKHYTPDq6Dtu426uYb
 6ve9U/4P+dndzL3HTBCWSumDSV1NPy478Q15o66DF1LDYmOd/zWSQWqtGNW0xahRO82l2wQwoLl
 QwYxq7xlG6IRr2Dqq64HHpLvXCqKkETEE8KdfaQZ+IIRb6b29g3QttZytebX9wZ+HtsZfuVdMJJ
 4jhqRPEb6AQsVprIgkYPpivICjjdWw==
X-Proofpoint-GUID: b9oJmzEv1BK4rvEcFCcddNcWLbybLA54
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69149fa5 cx=c_pps
 a=0PDhd3HO6khzWhHQYbQRQA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=pxCkoswmnBmdEb8pTFAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: b9oJmzEv1BK4rvEcFCcddNcWLbybLA54
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
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121554

Add UPSTREAM_CHECK_REGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-pytest-cov
INFO: Current version: 6.2.1
INFO: Latest version: 6.0.0

After the patch:
$ devtool latest-version python3-pytest-cov
INFO: Current version: 6.2.1
INFO: Latest version: 7.0.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb
index f3f4bc3e86..71a47d8760 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI[sha256sum] = "25cc6cc0a5358204b8108ecedc51a9b57b34cc6b8c967cc2c01a4e00d8a67da2"
 
+UPSTREAM_CHECK_REGEX = "pytest_cov-(?P<pver>\d+(\.\d+)+)"
+
 inherit pypi setuptools3
 
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.34.1


