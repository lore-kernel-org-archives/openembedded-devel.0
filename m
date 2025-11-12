Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51295CCFA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 14:54:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15437.1762959268884118415
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 06:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AO69FzNJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC53dYO3492130
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Zz6x6dYKFsd01aAZQJtqfwpFm89Z3szV0uGSFm0l/pk=; b=AO69FzNJZV0y
	WhmYETCXZN7jZbw1W244Dj4+9UeTfi8lQGZvqbeZTM+Ft0szkUXtrUnsiUzLIWjy
	BWsefgv6HpRzmQZFAUw1JEmCkAaeGTx3ziNf79lxkg5xHy0A1B6MUDhX2SAgKpHi
	eBPSHG6gMurnOdf6i9o06SSmNem/M4R2qPMSCjSOaaYj0WZdV0wBSQtCtadQp6jb
	h5G1qt/lH2y2gT3VUUNFg2ANHyaaQ0/wO6vclMbwJ8nSZ7Z15XLQeRw4LufSuuue
	6Qmsak1UPYBCfgBN00OLB6u9w6/b/0pKN/qF28S1uiTNt+M2RQgP6KR6MBw3GhAi
	pO03IgGLbg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x5fvx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tukpiZY0WTSOmV9rYdxkN6Z9+RxOSDhePm1a3fUTgoMNYagGPtlUOuQnk8Wb8AGmEv/mNQ69HBEqRIQpl4MWuzBomII+x1qXCgJBm/bIT9UXegmT+Qh4nUt4reNm8TgiXaf7xyY55jArool85r7EK+3NjjqaWloYq7UI7g2TySR8tNpfUGf/01Wc2JfjRDRqJm3rWKUtsd9qFbsxeJkoCnNYY7jHofRs34+xg45IR33Ge5LHjfpYlHhMJGqANxGRS+RlCxK0Fm3ubEAuks0U1Y5uV4qQTImhO1FIourqk3qdcgP074v3t21ueuMvv64C/K6ViFzDEPFq1M77VvbePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zz6x6dYKFsd01aAZQJtqfwpFm89Z3szV0uGSFm0l/pk=;
 b=od66gaF+kRNdBVBBWAkNKfZrmmgQjH/WqGs4Gwc3NskThEo4TivwOsxepecFcw6ja7z94vrkgHfNpJ0wfmla9QXI0UzST9+THq+fldkRpd6TXYqfcccsenoeAu72Q81WYnFXXeEQV1mJZx0GmKFkCgi8EIl3nm/CtqKp6FICw2yHoXohPkcuaVP3ic2nvzGXSXjAZfTFrKDCXVxeW1xfxaoCxqWLCKQCxEETvy1n/YgkFJyNP+iqqKTmK/Vdfr8XTN/cDouzmJZi91xFHBWwn1j7Nq5afI4wa6CZR0lD6gQbyqgYIJprSVqhj8j7EuN4lOFk8Ad9Pdh5sKUAY39uUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 14:54:14 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 14:54:14 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 02/11] python3-gpt-image: add UPSTREAM_CHECK_REGEX
Date: Wed, 12 Nov 2025 22:53:48 +0800
Message-Id: <20251112145357.3788595-2-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 665f6700-8280-4a16-6ef4-08de21fb589e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mMqaoILbjsP/gZ9Drg7/KWGa1omJivIGYdecheygou8nAHHyXKdWKZIpNicO?=
 =?us-ascii?Q?mmSUdTWZnrmizprVk9CuuzpZiPzGk2d1uGEy25gwsCBKgKt1UV5xcLZEbAD9?=
 =?us-ascii?Q?JniIaT7/lVr5j0wxgMGvHcHMO6zrAjYrnILSIXwQCOPKK6kyZTubuoyihi8U?=
 =?us-ascii?Q?sFk5Q5oLkEenEMihLRkaK77XPJaqXoLKqmYOAsp2JSlmH6HOF7dP1ilo5+uE?=
 =?us-ascii?Q?VnMa3KtiUTlvNH+CkbIGIHLGNDYRFjdhsE+y93TuY7KOt0S3rEmkSiZSSZNj?=
 =?us-ascii?Q?BIWI/sijHhk/fBLjDoogvQ2iQk6sYBY6z15zWwKa8alHwT6PfWhqeOt0t5Fh?=
 =?us-ascii?Q?WzzaYBOYB8N+hnT7b6SOvEq2Wf2zEFJ9QCjk5V0o0k5o6y1M9aWzvcf0iv3F?=
 =?us-ascii?Q?k0KcYYHTZ1ZhQ5LGi96kFVFFi9bOvuxwsT9DE/OaCfIhvmhPNOPQ2J/AlPPZ?=
 =?us-ascii?Q?q9Obkr3Nr68n4iagg+hjZLCXfhmkHb8qt6dNMpWeMo0OxqFZUrtEpYo+KsPh?=
 =?us-ascii?Q?KZx+bFSmgLbUHkEJ0pv8mVhkiKOE/P3L0JSX2l/BQQhY6dFDfv43pwBHTUyR?=
 =?us-ascii?Q?87Pv9xS2KGFmmitKrWfGsKf+T9ZX63R9gQQzAF1dKfPEsE7UwA8YDgWUHZ+p?=
 =?us-ascii?Q?7kU64YH4vEWSu1ltPv893iNx49ruNmTVryU/wxb3udLMYEyAwCom9kCs34eC?=
 =?us-ascii?Q?u8QSC1ThAuYFLsM1NEvjFuwjMR6Pl6isSOFu7qGE5K/78VNTIIvmWEQe3RvF?=
 =?us-ascii?Q?koAOF4xDJ0AQsbT1LLZTmXLmCpIm5CY/xA8fhqCkOpgGvYuBAKc7n0PX+4BQ?=
 =?us-ascii?Q?4i2yUiSGriF+F9GE1ASPrkLBY8AiL8NIC2NepYzUMIs4E68OyhSBOOYeoNE4?=
 =?us-ascii?Q?Mxlxea8QAw+jb3KznYyYfYngpGat37K4VnmfdMb6AJewGJyhzRaPOwcranQK?=
 =?us-ascii?Q?JEKRx1snDX3+clQzvyuJh3BXaAAwcmbJleCFXFGd0iEIIvQFh04G/VhIhruU?=
 =?us-ascii?Q?zgv0Ae5pqdKKuzcQMJ1KGx4DU7suCw/9uYpvDC/XL0YTrq/9ivf7Y4EfRi8f?=
 =?us-ascii?Q?plyarOkTCtS5vy60nnBeqYMkxH4pK6jQWa+0Nhv44FVAtuTOcmKLoCjQhc2o?=
 =?us-ascii?Q?ENfyAFvMNG9Vjy4bTo7AZNq+H9ZX1xbiyoNZMKT7z4ssgx6L7HAtmnlNezVL?=
 =?us-ascii?Q?8yvULomwxnF1vy1+hCzyGvJM9THKV1dD8gjkB904BXfDJsP6dtgrTuSg4Mkx?=
 =?us-ascii?Q?zR6/oXqhGc54uEAlGo+EGxfIS4hBe6NgntaQBxbumzOgkEjZmZnf2MNtNCFG?=
 =?us-ascii?Q?wyypgzZHeFn93psc0WjJfGtRdEtLokY4zcrTij4Er7jewnOdpVK9GChuGx4+?=
 =?us-ascii?Q?k+IM/Vjg4gD8RsS5nheAD7sws0eOhgJwUz0xKgGO8JmCLFivYYzPYVgTOepG?=
 =?us-ascii?Q?ODN5r8ZE2EDGcWKw49zcEh7Hn+pUsKXt3IZA5mVST4OjqJZVLkWkJPqRmuEZ?=
 =?us-ascii?Q?zwpwGaSnWB2zZk5KeHRa4S/WvrpKXmzbbBjx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iYCH5MCS8UAL7ejFteBIOjQm1glkwsq+hfHEOVBFe0mUfdurW4c22ik5EeFK?=
 =?us-ascii?Q?oC5jz/OTuUAjz8IrF7gdxxNwFG1p8h2qdhW9v8pe+dW7DsGg4/T3NogCOYZQ?=
 =?us-ascii?Q?AA8Wvv+QgnyB0YWuNSc3IXnThfVbIJP10RYdUkn2HqmNvY47UEf1K/IItOFr?=
 =?us-ascii?Q?qaNicPJyJBr/d5cpk8WbviORE8db3T0Mal9XssSsRAWglfHxxJgBFz61in9u?=
 =?us-ascii?Q?BO11xhfFjQbMWzLGoWTSSrP3sqt75+1XZsswR4CeXbs3VfCkvPTuwB75zu7w?=
 =?us-ascii?Q?GcQEOfHoikQea7TRISTNIuID66x8hbCrsYN1b+q0n6FlQOGd0i5G+5pz9kgs?=
 =?us-ascii?Q?fFmVqTfmIPu1ewE+kQFX5ogapjrKJfBO+8G9CIATZ0uN+g4BV8W7SCeHO1zc?=
 =?us-ascii?Q?AE8pxjLRTi2+F2ks1BPz3ewsCSiM8T7pQ48vByf3jJSUC2bg3JFpFdPy15Kp?=
 =?us-ascii?Q?32tYnjXiuopuO/KlJw5Dbp2rtsS57OHx+BZ+F/5rW+cu+IFqdSqZnhMCvGh5?=
 =?us-ascii?Q?hlR7bLksp39GBei8mYQRYYYL1uq84piNKvtCA9100G81TBEjgResmxcnAs6B?=
 =?us-ascii?Q?Q0faiFzCZZJHlsYn0Lu4x79Aw/WxrcH5NSVdCO0EPA7wCEoIFCtmWzFEigzF?=
 =?us-ascii?Q?gef9hnUfx5+Xuv32+tPzN6aPDsxXWhCTPceNB8C+azwQ9PdAqOoCMLC9Un0K?=
 =?us-ascii?Q?Vjgct4lVmZIdvMqAFzgdUEWjni7hC1gWSi7/zoTGf89ap3nS0xSPLRbmHsgh?=
 =?us-ascii?Q?Im4SwUKxTR7ihWQIAdCKLAyIYB5KVoQwnU46e+S/nYYpNN+4tM+oFxPrkG+B?=
 =?us-ascii?Q?vrXg3rILWZdvbSIuSet9NkBoh75A5U3HVFsEebGbnYS63TdIvIOw9d3X24b9?=
 =?us-ascii?Q?htEPhW03YQrZVlWsJUUxgoiIKyg2W1Z4btNEqSgP0JffktyGoie8MTTRPMUr?=
 =?us-ascii?Q?KO0a54NBaL93V1TUopAMyubHp/HCciYEJuAKBavt4719417d1z8JmUh4I60d?=
 =?us-ascii?Q?gcCa7IdQtmhVb8NR6jU1I2l5W5RfQv7IEiCxG9pmS4JEbEz+M7ofOaXdRMLB?=
 =?us-ascii?Q?LGQk7U1FQg3/OzSBpW/2AIyJUSm+ctxzW9fFjtGwBRD06pfee5i3VqA44dwO?=
 =?us-ascii?Q?5ZhvMVrAeQcoj+onrFZIJfPXpvSpkhz/HDKZOzYpOJ/gP4pWLqtwzfYDNmJ7?=
 =?us-ascii?Q?pDculZq4U0vouRBi0YjEVUZrUc/gibaLKA4FdoC+aGj53zEUZU5CGaF8vYmj?=
 =?us-ascii?Q?uZ4by2HfNuy6k8Sv0twrXUNLO7gBQwRIL+XC8jr/8QBTWpQHG2ecm3OLdIL1?=
 =?us-ascii?Q?JvrQImozSjhY3m9KiTZp2CCXTj/D7ZMGgOlEknfysZi+PUeUCnlLMrlHfERp?=
 =?us-ascii?Q?WNBb5SyEZSI/CDrZjeq39m7/Z/eecH1WXvTsQJgFbamegi/sSjf98YK7dDWp?=
 =?us-ascii?Q?Bz0mSsaIeExUDLADdGO0V0LcmS8S/rFwTS9hmjaswrVntt2w2EV/qHYPNJ00?=
 =?us-ascii?Q?8I1t6I5EE5zBBP3YZdPs59L0k1uDOWE2Q2dU/BIiawqs1cVbQI80Y9PGqQBs?=
 =?us-ascii?Q?FgoVFGX5+2eMeEG4xw6yt0XA+aDGIJDT516I+Mq/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665f6700-8280-4a16-6ef4-08de21fb589e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:54:14.5505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+PT2tK8h3orPo0tjiGap+BIEBTtzJD30PR/DbG2qtTmJrCNiEaWphG+nCuruZ0F2DmTT8bkO8PoWJHsKGn3AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMCBTYWx0ZWRfX9c5o+4FDKtXE
 mqh6al+dC+E0fv3pxMvtuf4bLaigi6z2wL5+EjlDn5qFuitWbU2J144N8TJXQZ0/ATa2FjR5k/C
 DV/CzCTFmRKYzjoZAWlk+43s080r8UktRlSg0sX1vDouRelkb+d8qnRk1KVF6ESpCuL4+q0Pv7M
 omtNwfWsk95GeLnVKG4o904q5qeD9spOVE7f9SZnOst+yWeVWlEY8p9LDEVPOO9OxVhZ4DxAwlG
 2pckptgDmqyYrm3tW21tj6qo+eqfCtMj698Mn3bbn13TmA89REbWDwgwnX4EAy0gLZuqWaJPIgI
 O25qhxCHk7gmrnq0IANDO439yLRjYX5XZBMZNes0CjlkPoqSj9CSqlSFE+T3uGL1LU9QdN0LTpH
 5lPan65QkDOQ1XB23CcoZAcRKIhWCQ==
X-Proofpoint-GUID: obL56sgQ4l8l58EbT7a9OwyT8G5rYwo7
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69149fa3 cx=c_pps
 a=0PDhd3HO6khzWhHQYbQRQA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=2XR1s-g4qegJnIwB2xIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: obL56sgQ4l8l58EbT7a9OwyT8G5rYwo7
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121550

Add UPSTREAM_CHECK_REGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-gpt-image
INFO: Current version: 0.9.0
INFO: Latest version: 0.8.1

After the patch:
$ devtool latest-version python3-gpt-image
INFO: Current version: 0.9.0
INFO: Latest version: 0.9.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../python3-gpt-image/python3-gpt-image_0.9.0.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
index a4870de113..1cdbc54b43 100644
--- a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
+++ b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
@@ -10,6 +10,8 @@ DEPENDS += "python3-pip"
 PYPI_PACKAGE = "gpt_image"
 SRC_URI[sha256sum] = "c06d8efc7cf8d6f3954c1c3d8544f494aa95da37fe04e38a9699ad3f57455f7e"
 
+UPSTREAM_CHECK_REGEX = "gpt_image-(?P<pver>\d+(\.\d+)+)"
+
 inherit pypi python3native python_setuptools_build_meta ptest-python-pytest
 
 do_install:append() {
-- 
2.34.1


