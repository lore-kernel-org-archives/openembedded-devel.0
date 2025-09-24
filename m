Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74136CAC59A
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 06:50:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6602.1758696595543211294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 23:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=n9rNy9SA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1362b4720e=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58O5e2Cb4062852
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 06:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=O+f/a6qRMgO3IxVCTiop
	zPkafqSsqXWIDo8s0M9XF+U=; b=n9rNy9SA7QHATtApry//MA1Wj6GgAMOGUZEs
	B08w/jZJoVbWX7Iof2P205l8WVqwYt9H9eakonU0zjRnoL+ffbEwUsK6uKW6mmGo
	y9XOfG4c0VSq6inLobwFqM6lQL9inkjLP6ez8V7w3eGustqyJWOQDoIWGg43WzSK
	IhuooBLWZiIAkFO48ywu7MSsP+1H+W1LHQtWpJcdn4SQVYWaNtkh7vRWSbuGefFn
	QX3ADLUBWY7++jj/pN9P2eCKgnjKtQojpKteOw6VuvK17DogGapPZ2yy0lGPuGJ9
	VjkaMqJJuM365wyfGNybqgUKutit1neve5RmggPVHhm+rv0IdQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012037.outbound.protection.outlook.com [52.101.43.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499k89cbqx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 06:49:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZyIJrOVSAicrvwM4Tm5F+pglJJt402EXczF8pAh+g9ObkfvrVwsUkrXQZcfl4Ag9ii92DBBRAmLR2bctpd3h4Clf/oH9HWRvAQwirW+L0U5+lN0fTVApC+FS8pedLkVkHi7IFRmR6VGxktKnprmGaXklc3/LTlnaO8BUIHl8Tan3OCIgHnItAZ+RCmQLUXyrD8XpXOL9Rjcqj7QbflbS4NK9s4+P0X8ifiBb/Gf72006hjE6A/6iCkpv854yELUunMAvbb596aYFcWo7PNGh10pffBcRLyw2Y4vmckuE4gIU/3obqiGkEO5Vka6trR1DjZV5SPW8i4A3vIK73+ekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+f/a6qRMgO3IxVCTiopzPkafqSsqXWIDo8s0M9XF+U=;
 b=MvITZRKp2CFtSBoHIKB/db6M8U3KCrKDpP9T+COu0XsfnzrP+IvyTykcub7F6qUPSPiDgmfFHKjN6B6LInOLA7hmt11dzh6wmPNClKYC7SMJMtkp0KHrzaf/6EmDykziufZXcvs+RpPqQ+Uesm1s52nGXH0WvB1aFGEelm9cUp7c4V9f4XdhNKc7cOI4tyLaElVJittfWaieYqS4CP8k3Lp5+QXwtNiD3ffD9JaUR9l8JEdXcAiwk/i4LNjrYQtqKj9Y+f2dif/a5eLat0OywliDMVrGaRXfyQZRYrXrRyhDtOyxHUf41y3UOWB4+hBgHUbloHcm2BvRjdak3vPCFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by PH8PR11MB6976.namprd11.prod.outlook.com (2603:10b6:510:223::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 06:49:52 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 06:49:52 +0000
From: libo.chen.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-gpt-image: Add native and nativesdk targets to the build
Date: Wed, 24 Sep 2025 14:49:34 +0800
Message-Id: <20250924064934.1783193-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0014.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::11) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|PH8PR11MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: 743a6ea2-abb6-4cd4-09db-08ddfb368ff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7wiLaGkuGJdIjVaQxv+MG+2sSXDyXJUaibNaK2zQVnA0iUxOY+EeDcD23oq0?=
 =?us-ascii?Q?SKr7LIFdZ3XPDTcFEflNXoe6YJ4UhEEQgemZrGIPETwW1jSsEVbz6WB7vWmO?=
 =?us-ascii?Q?oEfnRbjTNq51FFRYacErSpjvhtWSfi+zgZ7sYbHe4Hi485Zst09J8xLChf8n?=
 =?us-ascii?Q?QHtfMdh/wmyc8AIfDgHLoY5l3tTMDZ9eubuotsgV16O9bMLjdt+KiBZ53tXs?=
 =?us-ascii?Q?TP+kFOuYK3DXzj/rSbemRVm/y3nArdiFdzBP2t8eNvyimpakT4iwWy+MRdIC?=
 =?us-ascii?Q?iYwhcNyiI0SQlFae9KH1P80suKonzOAhXjxpIT2TxPtjxBeCLRDQuzD7MaRp?=
 =?us-ascii?Q?VnAfVby/WOJ1xoxbBdzW2P+bI1Nr2G7SipYvsb+7LOUelDsfBCyU1siZBrn3?=
 =?us-ascii?Q?3WUlc5owZ+haKAjKzadc9s29g5eSiD76YtCZ/JnwvcWsjDfbk5o2j7icBIeJ?=
 =?us-ascii?Q?IIKjj6ubIvL4s5vc0DjDtB+GUlcANYbc4L3eUdSGHufYQAe6K1kyEH6s5o52?=
 =?us-ascii?Q?abufZ5xYuwLIXVFYg3+xxMaJg7hxdRtGpR7SxVteNPH1uEqaFQXjXO9O2gOt?=
 =?us-ascii?Q?QsAWB87j1bfIYCUMjNc7k+S6hHaYUAZc4kO/psoepsQgi8uW/xR0i6Jv78AP?=
 =?us-ascii?Q?xd4+hiLcwUEFRirc1hj/DJbyON6qMP/K5PcgQsK+suBlkrqmXZdKEBpo7dJ1?=
 =?us-ascii?Q?zycrtyRD9N0kyZWVradoLqUTJ2JXyCUpdEUrB7zEycPXanEMT+2Wb/neKx7g?=
 =?us-ascii?Q?+TuxIZmZjBfdJ3bxlG2PRKdZIgZ6R3ZS/lgAPQ9OElX+/Z1D3uTf4o0DV3ha?=
 =?us-ascii?Q?CJIQ7dPJ5/f9npRz2JWmsG8x+xf55enDY20soSldBrdu8njaZKmAbleqAZyu?=
 =?us-ascii?Q?gf1QkFZCIH/acp9OTS2+XZgioQxd3tp3f8EEP5NKx5aDtkDseqHPzPVpsINT?=
 =?us-ascii?Q?CIXWUJhhM+CTdEAs57ePfOITqR5AgYJmp3eIzCndAAlGB9Kfj7uhv1zLSIcm?=
 =?us-ascii?Q?o9COgNuCMsBUC8WPKgCxE0WR1/IQ5lhWOiioL59A5C+brsqfFfEF96FlcsW3?=
 =?us-ascii?Q?vt6wnQ80NJ3uMkSIY9gOhTc6nAh3jnC11N4EylLoUUyWA4WHNwWki5MQg5V6?=
 =?us-ascii?Q?HhmKIeVdk+H5qgKu8cvFkdJUFccEErX6xPbG5Qj3bb4TKiQFxLHqA7QCBLwW?=
 =?us-ascii?Q?TxqpdK7w83zB6TYLXu6qEdtJO8oIIuqJEDjbPbAUevno+tKTME/3NUNFkj2e?=
 =?us-ascii?Q?I7YxfSYPLY/0Rn3FsWIiM07fbL3Ne+rhl8jhRu3FcCIkiYYqKXa7iePD7NKS?=
 =?us-ascii?Q?oFmMiepPFjnt4BGr3IbdxHR8NOfnXeFbaNOiWAtybW7FqI8taL55MEYRgn64?=
 =?us-ascii?Q?u3uyRwB1RkEiuf4SzasHB1/TLKyXRIQmYhr61OksWn0Qyarss8Twu/iAofZI?=
 =?us-ascii?Q?YWW88BLla6cinbhBjxZiLm742f+kvXPPdA09lDGhlPRBF0MwAKNBWA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?axDb5InPufmNBKkKEnxLef0InGVmcSwdrjY/chk1zSWH0mKelsFG0fXSdwKp?=
 =?us-ascii?Q?P8m3E5hRk+TL/c/9Ego/yf3iCybAbTOMa0l6YHOGSkwKo7mIyi21hRt1SqwU?=
 =?us-ascii?Q?4sPKS0ouTjZbivMh3hMOreo2pESNbdj48UxUqCfHPxx22suiyRqJk2SnqkLp?=
 =?us-ascii?Q?kRbcyJUDBT7SyfjLECoiIE6ddDOrGrigk0UzcVTYz5zmAcIAOJrlpP+QWMa+?=
 =?us-ascii?Q?61Y6EqAp9AJ4lX/5dzZmgev4ffi9a3tX9+Qllj6yxiDpq1IWvPCLvO0CmwuM?=
 =?us-ascii?Q?yH0jMkR+4iSWl/repL5ha3SxWCkNAYQNZT0+Rz4FhfEceqUhO+hc281vTkBq?=
 =?us-ascii?Q?R3PrgtAcLh1uTvz7ZwC198V7rWVder8IaiEpRO5I48R8/dFxf8jI/WnX/vlQ?=
 =?us-ascii?Q?EYXeEeLHwswYB0+57DWjuqTHQv3cEzGzeQw/cSewjGmCyVO/BPyq1HenFfYq?=
 =?us-ascii?Q?cEYObRMlpYODZVghUtZjrtMrjSOly/Peo3NrVUMDdxjsSPwRhB4QEzydY6UI?=
 =?us-ascii?Q?NVIMotP3iOLXfCjnVCRXobLrQ+TM6gA/k90B/w9ybKuozfV3/ipmC/eX72Vk?=
 =?us-ascii?Q?Kn/FxdpXuMi3k9A49p+JK91ZRMTd191sntx/2DWIpaP95bBRik+rEzlpjgJV?=
 =?us-ascii?Q?e4UTNn20XK8598kxHWzV3K3sdKDhvbUz8wfnLzjcRLDn9ce8VNVobI194u6I?=
 =?us-ascii?Q?qTHCaili170GVulfYD7Jo+Ioeh1/gtWJoJXj8dH4d7s+IxuD/tErqHybwtiE?=
 =?us-ascii?Q?379dIQI3xsYmmJhjYmo2+AyCkOp68l5ABq1Q1yS/4/AvqPr3wYojLb0X6RrC?=
 =?us-ascii?Q?jmc+xv7rD8vYj8bAUYvfCiRIBQMYdGkRzyDJUgBOArqieKPdkG+4A9PC2kgZ?=
 =?us-ascii?Q?hCMSHZ+JRIym9TUojXfv+xO4E0wSnRuGf387tEvxQU3wIJY9Otu55Sd+bHnZ?=
 =?us-ascii?Q?GDfwA7vHXM2aXINoscIt7WOZCxMxH/jhPmLdc8v30Q7jCRb/NGDCtlQMHoop?=
 =?us-ascii?Q?XfqQNVtXc2NYak/lgoUw0VwJ/TzBEzb/+e4uswa+wLSMhyDWJhcAM7TqZo7u?=
 =?us-ascii?Q?uXH2gQ2jchcIJ9jdQAkbFCJRZu2ZQ0PiMhz/apbwl1cHgE6R86hjPFjtYm1o?=
 =?us-ascii?Q?wgaYYMEiWhn2oqD5J9UV6+RSI18MO13facBxYg4v8FtsADHf/hrypQ1cga+w?=
 =?us-ascii?Q?pdmjP9fQ/wSNhFbL5jh18svVk37HhvenB+05+01u+Kstyn6m+PekiKALLpMZ?=
 =?us-ascii?Q?nS28ulzMYxVp3XeYeFkf9qiwatr4tpnGdLnwdcDojGlGtSVZNF7+BeMiJbvD?=
 =?us-ascii?Q?4oau0NFlGb/fM0CNWh3MeucT9djeKTq2RP2U7coRCFJ25nQnGYh6nCiBdjtA?=
 =?us-ascii?Q?+w1Xsxx2ujENBuYMPZEpZOBSaOUBobktH1GRWHeK2+9k0AMrvq0BQPqiiTgk?=
 =?us-ascii?Q?U8MQ73BO33sRV9W4UJnRXWHQJxOKbnGeAWG4Av4gAT4mhMfaXpUa+vMMg+De?=
 =?us-ascii?Q?EU2pKhJZN4qaB0jpIDeOlgnnswTjP3AI+4QUJboGKxxYYEV3JyPGjLw0fBHz?=
 =?us-ascii?Q?f5xh1RdvdnFvD8AVsHafm+ZbTiReeLmhrVwwQC6CdgeyUrbCuVaYorgdwUIw?=
 =?us-ascii?Q?VQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 743a6ea2-abb6-4cd4-09db-08ddfb368ff0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 06:49:52.1268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKKsphNmAALpzLSAI95ydKOQLDn0y9nRagw3upODvhe+RlqXHL706gu4QLDHqCgCnuPqnJaedC1Kr4qcMw9z8AIsjU8fdsyZYidXiIBF6yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6976
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI0MDA1NiBTYWx0ZWRfXwscdFkMdu7M2
 dNxS8ypE6FriiIp87g3SQd8CktsQsqhCvVw4rgKd46YztqJOLlLXQ5opdYQGMIcB0BI0bXP2HTV
 OHEwY9oJYIdMnt4/BM/36nVN67skVNxAWlo1ilv6j5DeB3xVGtlxENP8InGCCaGvRxEesNxPn6A
 nhqXxhbHWK+ONmnpGEdR7Y1rxlYuJdnv6x9t/dUgKlMMDk5A6YvvqOm4zW91Aqujq0pIMZBvkqL
 xb2QgA/OMuP/q3uOzx0xg86kjpiK3xoRjNH0QRH2vDtRX8ACfg5dZtWwWmkYwjTd4qT5m0V56AA
 0KlSP/gzZ3tRrH1FD8eiF8WU9umGm7xueyd1iZvUR1pUfLAU6xzXoeX9cqMVgE=
X-Authority-Analysis: v=2.4 cv=YZS95xRf c=1 sm=1 tr=0 ts=68d39492 cx=c_pps
 a=ZegHLSctVnYqdC7w6owYpw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=X6q8DKG0kssv1MTF148A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: mv4XhRzt4gfa_Gd_QSnxjknPnKe57GOy
X-Proofpoint-ORIG-GUID: mv4XhRzt4gfa_Gd_QSnxjknPnKe57GOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 06:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119752

From: Libo Chen <libo.chen.cn@windriver.com>

Add the native and nativesdk to the recipe.

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 .../python3-gpt-image/python3-gpt-image_0.9.0.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
index 941d92f55b..a4870de113 100644
--- a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
+++ b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
@@ -15,3 +15,5 @@ inherit pypi python3native python_setuptools_build_meta ptest-python-pytest
 do_install:append() {
 	rm -fr ${D}${libdir}/python*/site-packages/gpt-image/__pycache__
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


