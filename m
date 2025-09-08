Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31215CA1013
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 09:16:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8648.1757322994838654356
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Sep 2025 02:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WHGY9kph;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13461af826=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5886e9fT3253005
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 Sep 2025 02:16:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=u6lftDU/6lD1pnW5cUe/
	4JepGd9YEpDTgrgCGt05IGQ=; b=WHGY9kphr4DDyK64eI/8Nb6KNKq4401dLFi1
	DCykzUfWMu8zBqqof1fZaSv1UII+CLC6ORTHf0Aj8ZdkhNWPZY2BfClcTZTkdqPN
	EMDBNKshKnepEAPNbFY7Y/WXN4hJGBm+XD2CUhW7EuG42pogFo0MCz+djDCZ11Am
	EWI0fRbCLavO6DmmB2Se8gz1rSViUjHBLOMTGe8EiV5jOQaGeiNcLpM0GlkBs4cj
	2fWPHOi+RHDkgP5tf3katpu1ESJQ3OJSkaQvsWBiyFyVLXN+7MHcv1//HwoBKqdN
	xOavrdye6a2tClDey80YEC/6OEowbbYj5v6dP7Ehojbtm0OGqw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490mfg1b0e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 08 Sep 2025 02:16:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8+yCO3CNwurH8K75L0g2iRMY8agYySGLPbGeMpyaiiqYVdGGOXuksZlC6xIURiPHzvzZZekCnq5m7jjaGGgRWYzcgEj20XSXXZiwvQcOXWNtqPVvRQZZZcRs6liJl5CgwTiCc7BcuygdA4p9pznFCJOen7fq7SpLg2jxb3Eu6bXKonU1t/TruEe2nvzDXRvYZIK6oJmqKi8OKsLlKykI2lYUOodwNSKoIFcXvljmzWtFqnNzw64BEWZemDYOgp3lWStTSmQBpHCwQW1tSxyhoeYxH2c0FD5ZNpA28eC5P4+1nnA2ycXG12lmvfuqCfNoxiNGZhR49mNqTcxYkYB/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6lftDU/6lD1pnW5cUe/4JepGd9YEpDTgrgCGt05IGQ=;
 b=Ug3Nk7IcZGX+JdWdy/ByOvIvYq7nRqmCY4TIJulwbuOS6PULjebHbkyAF57R0rRqm50GOPlbzuJRjbIZktWbfV/9/esYOVeKsVTL/9k1Lv69NcMT75g/oHm7CBohenuD1J2JEkZJWdnJ1bKxhQnLo4+l/bYCJu8KyT2OLB1fYzvDa4BuFtlwX0i4Rv+1YUHf+bPNzz2buL8ZSlryjC7Y/fs5fujKAuvlr9117fpT46zVAogcm+U+D2hUZlNOIu/YJGL6LJyZ0e1Ew2BJIpfXIvXFHf5vGCIh+wnZ7pBn+YjtjI25V1SWc/niBmCpde+gwiSq//Iw+HXZVCAKM15hfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY5PR11MB6115.namprd11.prod.outlook.com (2603:10b6:930:2c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 09:16:31 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 09:16:31 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] libnwck/libnwck3: use time_t to avoid build failure
Date: Mon,  8 Sep 2025 02:16:19 -0700
Message-ID: <20250908091619.1134645-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0084.namprd03.prod.outlook.com
 (2603:10b6:a03:331::29) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY5PR11MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 74be1c94-5055-4beb-ca4c-08ddeeb86603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nQvw4RHYP72n45HFPKU5mX0reivkjPkC0UilEMC6CIFtaB+/PPeMNWkDwQ7E?=
 =?us-ascii?Q?0QqX3KM2LZOEQm7Cnvc9K9Z417I+o0v+hwxXBeRBjDXd+QdR9jypzf0gIMSO?=
 =?us-ascii?Q?Z4jcgQYNxNjq+s3bcncT1+Mwfm4i/eX+WczCRW9ffz8qUg6Z7VItL1Xb5MEh?=
 =?us-ascii?Q?vUBEMC4NZewUc5qfnLFhFudAwGwPohDUC9aTO4rF2dv1dvoJJAX0dFw2YC0S?=
 =?us-ascii?Q?Nax6ftQHNzypp6rgBgFVxyqzmTYAMpCwxA7kcGxV05Kg8x6cI2s6RGBxgWqQ?=
 =?us-ascii?Q?SGZ8+zTsKXxsk7rO3TbSNneS1mNiDjpWh9KMDlnMuRBh9fxh12XvzBoRYoTZ?=
 =?us-ascii?Q?JNfP/LaUpEgKu8SixKrEz4aHVeFL2AMpPp257IDzKHI7tq2/qmv5peqOs56l?=
 =?us-ascii?Q?ATuHpmFJMqb+jtJKcMu40N8d7+yJh7BUDZ31UbyoypNcTj2ISMhqOBaFxxAc?=
 =?us-ascii?Q?U3e4gFZJGA9RmJbwTJt8OzJKezddNPu7UzCqUQbMhGMXHrOwVYQLRK6Qo80H?=
 =?us-ascii?Q?7KEZactfd4HSQ+6g83grLKj1xGjIa0/RTFsbhBnmnRqA1wYJA0u969W0tv8J?=
 =?us-ascii?Q?My6AkpToZayP3ymP9+V4+SthaiwRUozuJ0S1Hb6G+ALUWGyZXilXFuZoLKl2?=
 =?us-ascii?Q?loXiSKSQm8msEAeqxScmsVmUxWPDBv17Ir7E4bDa66NL5nGkAkDM//HW+MP6?=
 =?us-ascii?Q?2GAbYkzzPuQvy31P43Q45GZOF+1OXfW35dEz5P4DzhinehAHoBwcRX9g3Na4?=
 =?us-ascii?Q?Y1eVT+ZDjM5gkwX8Z82n6idIJVEx781/ijwS1E4O4wQItCKKSaQvtMIB6SnP?=
 =?us-ascii?Q?Y+tQDxhSIjrjNNDW/KGJ1c/EOKI46HfFe0U/8J5cuVFN4bRvsirQWAT34+ka?=
 =?us-ascii?Q?kzzx/zC9e6b0+6RhWJQPjtzLVRy1rLA+S1GiYg1Ihd5VU2AkZjhJ32qZpuxU?=
 =?us-ascii?Q?pemUMQRCTB0rhAPodnBlEBfXuTkrcqLA7FEtR4DvUUw1Wc8Bt6ua9+P1zuzj?=
 =?us-ascii?Q?VMqQGc4oRgmteZpwZuFpCd3SjLricU+oZY4KDIMkqs5JcKWzs/X7+231a+wG?=
 =?us-ascii?Q?HxTx5VJZgaRy0gNbM+RnHtX9/BBleDNGY7MI6pxv/HnAfdbDXGMTuHJ0Ga/s?=
 =?us-ascii?Q?FwGl4cy9o31wOB5JJxp1x/es7qGGjkDx9QvMwlFz/IjpgFEJ9pRB8r9VPM+B?=
 =?us-ascii?Q?77aKDay4W25Oo7dUnWC0bS5EEgH6JIELpNbHTiph47wv6J/xH31NnBC30fj/?=
 =?us-ascii?Q?gl/Ka45Au62uOZBBY6+7GxdzizN8no1XSr1IF4YB3Nx539cY2R8jSoAdB1fO?=
 =?us-ascii?Q?omBwzKPnVdhvJ6WEN6g0HDw9CXa+1QhVlzekSI+eLvBGv9jgNUlL7CjoGHwC?=
 =?us-ascii?Q?JcrQi4UOnB3Wbbu0t8EF8a7rLDWs+pvpJznmEktAJJ38ytrqoWBIJOLIa9I9?=
 =?us-ascii?Q?sgtKmzHk6QpHfnEQf5r348F90Z/UsS8SgIps1rXVVMbZ47TWV7LJ0Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NE+lyJDzIWz+DQNmeYSHDfL725MUGfwSq/G3PHCOXVUFGqSCc9C8s7QI6amd?=
 =?us-ascii?Q?Um8ThuK9KR4akXd5wRptYxg81QA3XhYgiRYwKGaxNKGx2XFT97pPT8Bten9p?=
 =?us-ascii?Q?ClDvugwSAkKpcvRWh0pMgM8YwljVnT+eZ0rOhhsrPlcyUjB6I2u9Wnp/hQv3?=
 =?us-ascii?Q?u6asn6bBsrbSrdMRmH5gug2/gIomHYMkhvXla8Ch9xRnsB9sFS7u3vEeAEWe?=
 =?us-ascii?Q?/oKvqgZWmEG8f9QcJX+AM3DX6xTqvWeo+7WtrAitOUfWYM3cF5j143jzox/q?=
 =?us-ascii?Q?trIJsjeg+vmdU6sOlbUpj94NwCNBssw+hh2B8M/2n+0ZqWXL4Roe6zFG9GjG?=
 =?us-ascii?Q?gNb8i77x8hSXT+44aFjWVql5FPJYsN5VKMMr+alqsKSrGV8NTZUjdMtCtkGq?=
 =?us-ascii?Q?Vt4KDqWP17ZK8eYxfs2wGXN6afadteGKqDMMKT/OVkrEmDnREM/OllxlX61B?=
 =?us-ascii?Q?Skn42gHHH1/nsRx0ltUMKfqNsjpA4/9905eMS26K4DApoxj/VBjL9rnmIWT9?=
 =?us-ascii?Q?5vyjySNYsnlvyuOXNZ+l3Dx1qJYD8gm0F52OkEIwMzxuXwTrP4arJGmg4naf?=
 =?us-ascii?Q?SG/vqkLKEOzi9C0X5Qn28vsXsgp6YC0lmhp5qBNe1ddPgWGuMRgspwYFw/l3?=
 =?us-ascii?Q?9XHLaEecwJDLZRYe4QZOCZiFs/G8OVASJ31gnWDpayOfZT8ZwDhxayYk77ML?=
 =?us-ascii?Q?Ix14dDDLuQx/UXQuF1qzk9swfwSTQjkxynIL1wFyRotBMx8wfTnflgZytl8X?=
 =?us-ascii?Q?buZogTfotkrWCsBt4AvmS9GuEBq06AKLFbWf7jWsrxI7zDsCXm4ag/fkjbGp?=
 =?us-ascii?Q?Om6OyWVPcuqUJS/cFD6f3xPhunVksW1adhFuU1TZz2/0vSlPE+b/abEauCNj?=
 =?us-ascii?Q?oRMRSWJvjYjizV1jf8dNldmKyYOJLAEAm8bXKSWBniWK7Z+Kv2Xvzp8neLvu?=
 =?us-ascii?Q?3usdPPRcIRxEO1jfhrN4E+7yajpbtL6WY6BmD8C4oRDm2RxOyaHi6G8HdUxt?=
 =?us-ascii?Q?rCLSan1h8zgu8dyvWT3AJFKsoasUJj1J3ScYy6azib4mFrlDjgLZBeft9DB8?=
 =?us-ascii?Q?6Z+ZSAuQS2EfwEiPzi4XsserQ/nQSaugx/KHD94ArmwvCz9zAWtBRH72CUOM?=
 =?us-ascii?Q?xo+liah26Y+ptTP2CASkjF0YoEm7vZyfuD7HXjifrD44NlKpRICCZ5/c5z3+?=
 =?us-ascii?Q?3yUGZOi2e1iuzKKOVt8cnTav2TUFy86Yz1boXRd7kkWAjzq8vkgsb793tbn3?=
 =?us-ascii?Q?cHdMOBAyVV5M26RBHiB7TFVUHsi7pLpn8vBFmLJcWJlblvhgfBfASqwg2tWd?=
 =?us-ascii?Q?Mokyq6LrIm5w0rFNlWPSNIWvzKqctTOkgoRnwNCBS66SP2aVtjHTJyxkQJVz?=
 =?us-ascii?Q?0P+XdqUBtvM4pj2rkMc+FjZaCXx5/qG8YM4QukP89Tcnf/8wlTTrxPgMi+SN?=
 =?us-ascii?Q?voIdarSOKfag6GoAfcJ2r7rulOe1fMDn3Gow40OsPejI1TBw574Uf/66d5F8?=
 =?us-ascii?Q?jOSjlGMfX+NcRxkxgzgOFv+D6AdVnXFtJLvVrdKz79xqRW2VWJLSeMY3hreA?=
 =?us-ascii?Q?ZeE8D84TBfw7MylxsRreuaVVXQquPJbwkwDrVmxV6R37dQOlGZG9pbhR14+d?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74be1c94-5055-4beb-ca4c-08ddeeb86603
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 09:16:31.0603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSbRxtI+hFjYRulHWwsWzk0iO7JwrnJbh0eXgS0zwi9VU6JZwMuAR8PUbYgalolNwFs2zgedNwzXT4Wj8r6MKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6115
X-Proofpoint-GUID: tRsvfqy6y7Ng6R5mCkW18hGGKhqFtjAV
X-Authority-Analysis: v=2.4 cv=d+v1yQjE c=1 sm=1 tr=0 ts=68be9ef1 cx=c_pps
 a=l1cII0oPafWl0rfEi57ttA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=GNEw3xDRAAAA:8
 a=jGBR3VIrZC_8vu6gDf0A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Gbt7yw0KH3r5R2uzA50C:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfXx9AcUAXgxXbQ
 3weNG/havEDt+i3mMxNRzWVfsGMiOHOfiNYYLH+bJDnsAS29M0hXQLUuSNKWVCo0ziYwUVU9CKg
 KE9Eytag/aR8ii1N39wkn59Jbuf4CyfKo95JOD9ZcBWfnEeK2UEj8BeWLqwDlTrm1uaMye+rgva
 6cjeeRLUAvu2rylQOu3z89FNxt7f+0hZT/gFFG+CozE4BIV6H8wPUMKzKdnFXW6cmfHuVBDVx4m
 ho1rcEI3mdqGj5kPrRsrsaeyDHReo6Rii+Sm2mRAYvhxuTLOAao1AxDw85tcLYkK4/hS836AY/D
 t75/5JwJjOxMcvMKgIWJy3+yfQ8LnXjXYyqb0+FgrWubZcWoJsxQ6XqAPwNato=
X-Proofpoint-ORIG-GUID: tRsvfqy6y7Ng6R5mCkW18hGGKhqFtjAV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Sep 2025 09:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119333

From: Chen Qi <Qi.Chen@windriver.com>

The time_t type varies for 64bit and 32bit. So instead of using
long long, we should just use time_t. In this way, things build
for both 64bit and 32bit targets.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...Fix-build-issue-caused-by-OE-core-changes-to-startup.patch | 4 ++--
 ...001-tasklist.c-fix-Wincompatible-pointer-types-error.patch | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
index 0328202f1b..f16f3e1d97 100644
--- a/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
+++ b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
@@ -23,7 +23,7 @@ Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 
 Refresh the patch
-Don't use explicit type cast to avoid truncation, use long long for tv_sec.
+Don't use explicit type cast to avoid truncation, use time_t for tv_sec.
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
@@ -40,7 +40,7 @@ index 7418f89..f0f30b2 100644
    GList *tmp;
    gint64 now;
 -  long tv_sec, tv_usec;
-+  long long tv_sec;
++  time_t tv_sec;
 +  long tv_usec;
    double elapsed;
  
diff --git a/meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch b/meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch
index 4e23f613aa..d9ca1f0cd9 100644
--- a/meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch
+++ b/meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch
@@ -32,7 +32,7 @@ index 4f0c6c4..758fc5f 100644
    GList *tmp;
    GTimeVal now;
 -  long tv_sec, tv_usec;
-+  long long tv_sec;
++  time_t tv_sec;
 +  long tv_usec;
    double elapsed;
  
-- 
2.49.0


