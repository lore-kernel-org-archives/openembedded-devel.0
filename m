Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4955C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 23:18:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1739.1741648693077104342
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 16:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5164a3b284=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AJUkNO031859
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 23:18:12 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458cv8tpy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 23:18:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9z8TtjllzMiI01SsPGgW2Q+OaMCvRximQ/AJP4ERWQrNBN6FR5sROEGPWoFU5qkYyUZXNOqvRvaM6N/BHCUd+ODP6ypqbvSdRETPOAZC6fB9LVSOB2Ul2AC9EECG8p26+KaQEjPyiiXNIKuCk7tG32O3jyNDizPtVwOgiA0DvzxTRDvFzBjw6FeLpyAZ1ymfeMYqC/1CFuzHUpV8PQm2ICUaTLaSuCUD3FStc5k5czmndVHUq9aZr1y4bSqrqidR6TaGBFpl8Y2iI41IJjVIe893krpqp8LqGH1d1d0Vi3sQuzY7XtkcrllXO6K7XuquVqGTHBhQDE1vKdPEKY66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVw7qrAFcw+fci6F9dIb/yC2ETyTTq1MbJeMIeU7P7I=;
 b=C0zngGgDB8ZG5YzKjflveXrlOiUvmkCGKj1AIxB6FuC0jr/4CTiKY6vptTqGT+NJrUya38/DEMH+4TCyxp7n6Jz9R//0EBXqn/4L/fNLvRMvfIyfF+BQwjsjUZr/35GSUcdeP1Cheu8QNZn43PAsu6ew0Du6lOOHLeXJCM8YVX9F0MNhMQFi1E96EDdRTjCCkzD+gzhxSRLZ8Lrr1oUDcAmtftXUKBEaEU0y8qoqPIyg2UZLtS7QAqyY+/Bj3dLXMZrtWi8Msf5I7WD0YpHuW2+Iec39TqKoDTIi4MFPFRfaXEZocvn3rVP2NISJYLVMJS/fjTvGLQdu4mVIzFGQRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CO1PR11MB5090.namprd11.prod.outlook.com (2603:10b6:303:96::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Mon, 10 Mar 2025 23:18:08 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 23:18:08 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] fio: upgrade 3.38 -> 3.39
Date: Tue, 11 Mar 2025 07:17:49 +0800
Message-Id: <20250310231750.2912527-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CO1PR11MB5090:EE_
X-MS-Office365-Filtering-Correlation-Id: 5270e4ea-7f1e-4adf-ea07-08dd6029d145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iXlBNo6Pho1oHN7NcJ5f5/ocnbTcGPQXnSiOHLxeccdQoiGQ8NylQ+2WisAu?=
 =?us-ascii?Q?bMNM6NObx4VnD4Bh7dn8XVCYkq/PosyFmHwAjYugVUITbWovmVIarslV7rN8?=
 =?us-ascii?Q?urZ5xf1ZJslVQcO3029e7/xd7rTBcxXs5ZNWQWFWhiEMYU7WcSGdZfNUFDQp?=
 =?us-ascii?Q?JJlbLGNE8vN9JHSl7L32+bgyIsirDymAW90NEh1OYOLHuEVNQZQmKUhljdBS?=
 =?us-ascii?Q?sVbEMJ5wghomd5LInSXH86KSgwJNslb9TTODem2ckUXATtY4FPfzIxPTOUob?=
 =?us-ascii?Q?Y5r5LtWXC3Iurql9sFU/Zasvqzi9bpaz6nDfHX2M9/no3oOjImxA6dRhNedn?=
 =?us-ascii?Q?CIRcrxy/ccxb04QaZA9qCOQ5muh5x8KGXODygFzDMUQ0pU0yb+VUPp/uB82Y?=
 =?us-ascii?Q?U3BCXD340DMZ2Qgt2BXF9WgmdAoTIfgOy09G6hKnMX7ROIu0oFpzR4HEJ/Fp?=
 =?us-ascii?Q?nG56+HfiAhC6lPbKECynX64M5eYBC5tWysSwCaKjBQyRbZuux6318EyKbJvW?=
 =?us-ascii?Q?QQmIbnLa5zMxSs2WavU9e560ppeuCOBfYasFRicsDOnWOB62E8EbjWtezl8b?=
 =?us-ascii?Q?mKkXtkb2ofSZ+YkMvZcq1kl1uQZqmeswfTPfYexG3EPCxWxoHVhrhGdvTU3q?=
 =?us-ascii?Q?t/8FPVVOKtPVxZDN8z00wklEw8GIvb3PTXBJBYoOlIm+et1k1fs0Xsl/5l/z?=
 =?us-ascii?Q?DF1S7zqTt+/2yd+evBR5wt/O7P0fBPgC1+U05gvqZUPjozlW+h/HsFd49Joi?=
 =?us-ascii?Q?5Yui/wWkNWDne8abiTg0o/9ZVD5vIra3Aih3xfd29T7uoOfJUyPGUR5Z2vtf?=
 =?us-ascii?Q?efmGKZfZqJty95RNwNurpl8kuLH2iDnRuogLDoPu2WfOkjy2SdnkpdEKQZZK?=
 =?us-ascii?Q?L3W7D70c68bGt5nSB5wJV5NFu5S+1E6/Ptex7395+s1sadeg4Qmous7yauPF?=
 =?us-ascii?Q?stpYF83W2867NszwJOGxRZAFyAUGKl3Kjf1SfmZJXll38MbqqNsxW2hEQLLI?=
 =?us-ascii?Q?NXD5VeLDCy3Y1zqcVrTPDC9Mk5RhDwG+zCM2RPkeSodI+XAw2MIxazust9q1?=
 =?us-ascii?Q?AXVVDlZQAqA3P8g1ojpI/SqNCeoiXSCoNjB/5+mixHO9Uq5cmVePZhwWM4Zg?=
 =?us-ascii?Q?cntte23s94rQrTw5DH6vgFgHEb17Q1mFmm1xP/bNuDSUEEODnrMigkd3JS5B?=
 =?us-ascii?Q?qfLItM+7XKhSRD8N8DWfczPvKzSVFrt2PLqz949FTGYf/ZwrtsWQ7QXYR2bk?=
 =?us-ascii?Q?Dk0sDchHblMEI3/kdtp7SzyyzOepXdMgJtCWn1ut/vpV6CrFq1njzx4iPUTk?=
 =?us-ascii?Q?+5sq+yVMAE2kv2Wj3EMec1Ev2HGFJr0VI5ri1FAKhTrsxXRRpNCKWZxG8Yx9?=
 =?us-ascii?Q?2M2OznuvQCwnbnfca6egjdHga9+Ai51wPYB36+UqRQQaJy57u3eBtGyjSO+H?=
 =?us-ascii?Q?rCw1oMJ19m4jmOUcNUUV1Us5yfWsC/N/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W/DHZD35/oegmnjUePFjGoO1EY1h4DJNQBjIl6LsmfRt0NFawJBfaPz3pUmM?=
 =?us-ascii?Q?Iqn4njdHB+Jy3AQXoMGY22U1nppyRoPc/F2ciuTz2CIJBF7YZR4xnjsxIh8f?=
 =?us-ascii?Q?m+XRJ3Dcay6wCmP0HIYGmaOa/h24cs5XrOkGK4VflScTBC0JaZaFCnQ+3vIS?=
 =?us-ascii?Q?x1k5jLa9XB8jXTB7W3hE8R2plOaEMt1VBkcNjJQ+IExJhHMKLmbEFGBtZDZH?=
 =?us-ascii?Q?8U49ofRnEHRCGbDBEoaHDrTIiAcfukIPdguYsKaEV+y++KYuMtKSRysT347r?=
 =?us-ascii?Q?XD7rfh+GVX8jpbRpsjCEXLMRHSJA8l+pHwOiMTHb8JvWiYUjK0dcI5/4vByP?=
 =?us-ascii?Q?Ul83Oe9+AogqLUQBCJ442BE7K4DZ6Fv2DTFEkgez/gedFFTMJ80AMlawqczf?=
 =?us-ascii?Q?D7C1WQQy6EFsyIZqTMOXQHMvVLTA6ti+hFQJLGpKxubkDTa95zfOfyWIV9Ig?=
 =?us-ascii?Q?vjaPuA2MGKAgyvDjGBRwFDy0/aMGIbP6df8vUu9mm3f1Q4BEL72arFQlm5xV?=
 =?us-ascii?Q?oAn0YDcIJN5bMF2AqDyiFR1nULAoGLdt3586Yb6biKf2NRkC6roIpKeqd9hn?=
 =?us-ascii?Q?bRat5BvMgM3oayPQWos+WFP2/6IL+0OjioJeU3NxyZwS6HzAxP7C3d/w2Qpg?=
 =?us-ascii?Q?mDB5W8m+4W3UBEdtC7BsoQML1VWljYZ7/3dxUrzsyLVee9Bfo+FSo/Vy6dk9?=
 =?us-ascii?Q?Dbkk9+5mQXAAo6VuBsa9UZRhznWE7b5uZZcEvquw0YiZHkcWzdgfKG8MSXSk?=
 =?us-ascii?Q?oYOyC61+M0YQG2YsjdnD0Ah0mgFCIFvdduRx4FSRY2CaX6f9wmJvz/W8LlN2?=
 =?us-ascii?Q?V3p6SVQL8OvC3OFyFwPsLJN/JxPd/fuf4CzFKKUstipe2rTsMpOAgYmKg7zS?=
 =?us-ascii?Q?QZyJOH8LaLiI4pkWT8RmZmcWHMbLJqbM02DF8fqwDkaSrFJNBvyeKnMfSqvW?=
 =?us-ascii?Q?K95Nk4XqcpVUwmtb0yjIKnGDhU08YgNXSkj0jMnmSc9pj17m32AggVLFSPZZ?=
 =?us-ascii?Q?XxyLDLPDrqpTJ13/4xAY7EstDXGfRQ0ge6JljAshGJylX402XCvZdz0uz3Ca?=
 =?us-ascii?Q?fDS12dnOwl6rH1fJKVs1m8H0lVBYfA0l/47yHUPdfx9Gsdr/B7gtU1KePiZ9?=
 =?us-ascii?Q?kcufEuid7wwYHw7gU6631fAQYlAT+hyPGeVtNMlTg5awLolY0MkpSf7X629x?=
 =?us-ascii?Q?B7/sQUqOQ9aJQslf3cT/k5Ya9MIMXbLCEp1mWqhiXUXLXqSm3KQmLNJvYgG4?=
 =?us-ascii?Q?lM9C0aa3nRsCmuLgYRwX9L7TM4nzUm2Bvt7bPpMdpevOIoEBV7xmJX7FcGoM?=
 =?us-ascii?Q?I0l/GZUvcVxkXcGBWEBRhb+eK81JHvsKD8pregTGTP4YqKr2HRnCvyu+IlCd?=
 =?us-ascii?Q?AI9oe6swxqjW16Xy/0qeOtZMIkvfIESL8NyS03L8I6qYMc3pqmPlDShRm7Wp?=
 =?us-ascii?Q?1b9RCBUp789DvBavPoK22z34Gyx+DAQ4z+EdxO0CTL5QowX3erB7av+MlYZw?=
 =?us-ascii?Q?TSlwVkzU6INcvVM76KPZ1TjXFrvhkr8tkuB4+PYOg0/PeAcyqiBXFqYJJiVh?=
 =?us-ascii?Q?pyBJZnsxtBZ8ZpbaTHPqso3lF/hW/PwmmryO3EMJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5270e4ea-7f1e-4adf-ea07-08dd6029d145
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 23:18:08.1249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MapNGzMGQyngJYfKxLiTATjFFqsc0pogzT0OSlpFuZChzvi48I+60hUJEera/urXfZwFE/wZtNU36bt+rDxDMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5090
X-Proofpoint-ORIG-GUID: jmdQBmEcwRVoZqwKYJdBKf8jpx9UHwG-
X-Authority-Analysis: v=2.4 cv=QbKcvtbv c=1 sm=1 tr=0 ts=67cf7333 cx=c_pps a=AuG0SFjpmAmqNFFXyzUckA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=ZTf9XhSuGeOj-BeryocA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: jmdQBmEcwRVoZqwKYJdBKf8jpx9UHwG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2503100176
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 23:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115840

ChangeLog:
https://github.com/axboe/fio/releases/tag/fio-3.39

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.38.bb => fio_3.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.38.bb => fio_3.39.bb} (97%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.38.bb b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
similarity index 97%
rename from meta-oe/recipes-benchmark/fio/fio_3.38.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.39.bb
index 1d1db92f44..473408e9b8 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.38.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
@@ -22,8 +22,8 @@ PACKAGECONFIG_NUMA:armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRCREV = "5af800ca20ea18193d2262a8191ae32e14d623f8"
 SRC_URI = "git://git.kernel.dk/fio.git;branch=master"
+SRCREV = "a6e474c9e896e4ba1eb40066a03402afb040710a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "fio-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


