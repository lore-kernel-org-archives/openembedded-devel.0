Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9F9CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:05:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9571.1790856334743057023
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NhGDEbND;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=473490b304=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69170pvI828182
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Oct 2026 12:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=e4SiP840RGXjbcEp7fwm8IlzV1jm7b7mgnpN1KW6cf4=; b=
	NhGDEbND1HKTFp5a7l+a9sppPu1XSHCK0i0pFsCBVzMLuOXM3C02pROBLTA8LH6i
	NKF1oqf7bsuQK8NjPCS7Pcb6HclbN9OgoQk1+gJRMyd6zVo04CQJupdRCO3KPar3
	FPlTv2UXNHP/7Gaqslchoh6KXXe0leOuv9PP3Lkrsl9/0D9jWAqA6ml/CHidGvsv
	3MdbJhc1HrkfRWctEyGUL38t4af+w10OemyLgq5jm7ixYNXB0xtZUcsSg6vAgZed
	ktH26PjBsQEeEkwwPMbSzjQpCG5QFUBNHK7pFm/GAq0iVCaJnE9c4OH9EmJ0eDD+
	VICZB8mPHs0yfBiuNZy5pw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021142.outbound.protection.outlook.com [52.101.62.142])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx38wh0kt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:05:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rL+fB1rGf7i+XKQqPsBuyWWZYOmPqkMkmi0RPGjAF8Rq2qi+N3MNTwD74EnN/+meOBYeN0ICkjxqK2jLudBu6fkPZHcYcu0IU74YyNaqEGhccv82I+k/hNXkCRewNYe2kUS69Y7Raqktjrsif58eJz29pTzBg5+0jBhslnMA2gAxDy2Z7aXUf1SM9gUuKmfvjkkow/jI54bBBu6nJnSp4MT3iSZnfluVwY1z9yFmyyZrfVrCNoF7U6K2IlnxyXwlNLXI0fgmO9ltpMb2yFR0l6XkTq5DmWaSqSyrlp3MkJMSx2lhmLzbxx6oFp/vBspDxq/MI4xCJPsgP54QvGCfkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4SiP840RGXjbcEp7fwm8IlzV1jm7b7mgnpN1KW6cf4=;
 b=Qsxxw0hHcWIohnhP2FgeE7XtkacK8nXI9x1XGo3MmMhI7Parv2dd7U0/54jw1A9oClF5mLavi6HUd5VMNscRy33xQ/VCgi2036qZwDbnJYrSBs43B8fW3GCSwAIWmjyuGg+VJl42Qn3d0Bu1rFPQNIEHj3TGf1OSLxvE46F4weT2MFV1JcB34y3w5JtpqXm49pfkjfemBDCvNDCdAnm3XpJJ+VzDfUInXgy0JutZp4r+cPPx+4VHUafyWQCxuPBqCMjnaCCI3vCARfhd99uZJ9sFYC9nKoC/1yqnG5e3sqX2YnTPqyxCauGUHcOH0fDEWfBnt/s95r0bqoSoaCdhXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 12:04:47 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 12:04:47 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shiva.Komati@windriver.com
Subject: [meta-networking][wrynose][PATCH 02/11] strongswan: fix CVE-2026-78124
Date: Thu,  1 Oct 2026 17:34:08 +0530
Message-Id: <20261001120417.1280843-3-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
References: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|PH0PR11MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: 14d3fba8-287b-46b5-49ed-08df1fb43061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|260925021911599003|260925021311599003|260925022911599003|10067099003|11063799006|56012099006|6133799003|12006099003|22082099003|18002099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	vfS26VLoLzItKtuarH/0KtRg49X62RSg/XNOK+j3DDCE8Ui0zmCoMuHQCqRqGciES9P27ho07Rxdr7YTLn9Tbs+H+a4n6TFW/KqHZKUPfWkDmrSVlBRYEFozi2En4juKLTkfGPR5+JxGuKJzQ4/6sMvYGZRbwlmhjrUBW7wM5AooGBJxSdF5I6zgPtWuhME7Z9KavNeT2c2y7Urkinxm0qH2iiK+51evnfVc0Ru+DWuhhvZVLruOaZJFYtQwRrQ1KuiqgR5XLLV4APz/5z6VWi0vR/zVqh/SjAMqyjl7HbTGaqYctEiVGDnytwrugaC+QYupZ2Tz9qwtlXv0hUhDT1Nujw+GxbsTgoxPgtMXBtxO2txmLQtn5/lGcjD3hv214yoqizl11oc6bVRr8d58TGUXqbA6zzEiXfIiv88pAMVlv2b+QxxQOlGvdsU/tWwNG5l6u/JzsU26XrJfKCevYBdSqFV2fZB3KTcz1TYhFtForPyKa4q6KGrw0eRe/9LRRsxXYcyCM5G9R5P7bY9MV002NjiHv+sZtyr71aUCoMJlAjDAxWXhwZJc054dGUbiLeF/JLTAV4kP7Av4CtXXwq76tQflZcxtb55oFQSqJCiP3AcfjelZ+Af8cvzo3yovk2vLZGhmMdpoafhP4tMxASBaTiynI6VbAzUT0UhvlHA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(11063799006)(56012099006)(6133799003)(12006099003)(22082099003)(18002099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bqn54CC5C17mR+JNXXqAjQV8Cwg7Jl0zOJnUePciw/bts128RGiwT9L0nmzC?=
 =?us-ascii?Q?CpuDFhJyfoho5MYEuitsi5NE1Zlhg0IL2qsM7byf0AyeH5w3zVAALmu4aT8D?=
 =?us-ascii?Q?cnWt+tQIfwS9L4fFaHoRRcsWetkjUZAd3kgNDN4+Nc89hLdAyDV+DYONNhTv?=
 =?us-ascii?Q?hE98x3vOACu/wmLNXtBbRI6AEmp839NgzAz4GucU98UXSkxG0d0YikmqA39V?=
 =?us-ascii?Q?wX0PK6pkhE/YP4Yw+G4ePsBei/u1ehUy3n2d5aYeBO/mLcOI1YcUQw2zHJcC?=
 =?us-ascii?Q?/Gm3GYdLciE49whyTUw/GF8l0Gim6g38IB7yUlZ/FsAMDVgZwQorr/vpOUw7?=
 =?us-ascii?Q?W6xPYcvHf/VNJ7m+K294tm0mNbwVnkYK2aQG73wj/DRilEIMloudMULgCC/a?=
 =?us-ascii?Q?kQq8uO+bmbJZ4U/G+QBxEQsAeYNELceBM5seanwlhvMCA5nKZ2ZfcPZayd50?=
 =?us-ascii?Q?C1XCWJeKvWK8BPriiKrNqcoFOYzdrirOOg1sbz+g1us35f0wPm1C/DJer8Vf?=
 =?us-ascii?Q?Jco3Tdra7tuult0nBh6SVn7VWcKs83QbW6OwLB86pUp6HQymWtSz+S4WPJXj?=
 =?us-ascii?Q?hoBQW402xlnngfNjx0i1uB7v9tmxWqF1s6jPZ0MtbxMLdmqaEoFH5VUUkjMh?=
 =?us-ascii?Q?ahk3ICVFQIGoVu9rSHH/vey+sDCVcVuHO/CPLohPKDAXU/C+lfY7H1pm3tGO?=
 =?us-ascii?Q?R+i4ThOEidVN8Q8mmAD6pngL5wX4dlYEc6M+db2oKVuqRrfKJlBN4UMiZp4L?=
 =?us-ascii?Q?gZqMycdNYVW5Sd/geXjON0/Qx4JmdItuWTV7pzLra2UdfSMnq7cwrNMaRUTx?=
 =?us-ascii?Q?2UWrEwZZtTf3U698nV7fUKA5Q7uSmD8dbF3+ds0ph7FPNcyI1lBOZZYUJfqH?=
 =?us-ascii?Q?RsPiw9QnjTrfG/PhGXf6UvOMW6/CDc2ODJYVak2zygEUaoFrcwDLxFuu75yu?=
 =?us-ascii?Q?gAksp7WXs3sUvNThXHw+N8qFPTfSGLoqTwdGY909JnZFNMT5qXHf1q7fakHZ?=
 =?us-ascii?Q?QuPMbkR1XqyvKt4ID95I3MUs/M2xOfngI6+kFEgx9c2v6LJUoDKdjGejELWL?=
 =?us-ascii?Q?2oGgJvn3JBaisUas8ucxXAjH6CJcI81jB48YkPqoOJ4IXF6e2aGR8vuRvKMD?=
 =?us-ascii?Q?WsdoJj+vFLXy719pTQuQX2wOgWpgtau/enTIGzmgeMimm3ExeeMcKmuiinYU?=
 =?us-ascii?Q?YP4Zz0YqJ9OmKsvLL3xLaEDOCx9Fd1KMH+FYKckGlzr+Hvxh0T1aU0WX1Qqz?=
 =?us-ascii?Q?OaxPn97yEvYeCK1EzQYx7MZMwGxF++6ecqmPf3OBPRd1eHJwtSjNwBwkfP+l?=
 =?us-ascii?Q?1JnPmuI70PFTbmqQPfvIgoqkdONdMtuNh5FDMxRP8Uma93hUECP2YCOI2fCd?=
 =?us-ascii?Q?GBdCbbzw2nZ//GXEqBpIpslr4ul0J/p4vmJjWQrQAC2W60sJolIkik0zpFKU?=
 =?us-ascii?Q?UE9Q3TFhWYBm4FhmZFddfuMo3jXvZ0cdtkmbRao6+yT2xssCG+b73mvIX4qA?=
 =?us-ascii?Q?+HLOROx8x0i4iUzam51tOq9X2VkHRWAyvUbqXAEgxAVjUAYAzQpZtSY5vfLh?=
 =?us-ascii?Q?8AoXwwZF1DZuUt8llu4Hha0CxQpKP8R82TF3rB229P18iXSGngZ1ZeL0IBh8?=
 =?us-ascii?Q?snB9DTOYmwYOynDUkti5Z6nJaacDv78R5ElXxiK5pEViVIz3k08aUpSxqA2x?=
 =?us-ascii?Q?/TwYoz81xKnn4CB+6WI1/ss4wwM8GPt6boaoLtirodO7UUA9kea+dSAI9jeC?=
 =?us-ascii?Q?fstnhA9Y6bpNkYrJFjDfoMZ6veYCh77AQD3SyWI4D15BIk5bL8ag?=
X-Exchange-RoutingPolicyChecked: 
	dg3DqZzvYGlDbZBn0ws89QQ7ZRIXgPsobyaUvXPdGXKyo0riWwJqkFHZt2lWxgDU6EP3GHLUPhuEBEgoOak6gCAHJ//Ur/kDh0mbVN4eiesCU6cu7KpKfH+l/1AAmLQtsCIsHLcBV6pIiCwHHpRwEjNMPZYtBb11fUwsBvrMDS3HlqtkYpHm0y2uqOBB2/DQatHOeueHgwyUMj0E9hHcEJPU2zUTY0ysbXXfONl1u9bDY8WHxVR9eddTYEstIXDsY0cSmzLKY/ncpHNmivbvIH2jP2LRMHIb21P9XwfVmG7EfcdStxE0JVD3GglaXxWka56dzcxfG24fGIWeC3DT1w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d3fba8-287b-46b5-49ed-08df1fb43061
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:04:47.7628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6u59stWbbT4pOO8K0IAHbtyMoVEX0F39wYJpqMFWMq+lOD+vbYpTp+oaAFWM/mjKNJC8UC+mseMcGBi/orUbUqA5FqshWcEJD2IwbqHOIhZpLLHVTER2S0y/3fx7pv6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
X-Proofpoint-GUID: _r_6haRRnIM5DNmMkvshOGkkjLdNMXUr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfX+gTlq26aNH29
 uhSC+3vdQGXU+ammfZ2Oz3gmXNJUvVqOE8Rkt4Zk5aclS+RPCTdKw1Fk0H6PaYwyZRupC+BmcrL
 bAtmHIWhmKRZyKZhb3bN91YuV9t5AWHLq2I8dJsOTUOsZigRPJCjiflUFE7MQmduvhD/ba4p4J9
 /VpuCqKlAG1Ciu0n9bGkV1iX1mM0S72OFww8e+sH5WWCDYFp13pNcZP/PTRKP/Eu9k3FXtMUFY0
 69nQQnKBD0eLnTv+K1G8QQn0GvNfIsRmvm6n6Hi20/FdMKOd4kEPhltFAAlD9z5txNadPTUvHo3
 aFmKLNFn5gMP9G4iVGiJI0vDWbnAAZg6kJD7dHdgUlSJ36FTqCt89Acffwiu/TiZnDjcH8YUGAU
 sP3fxDTa4pVzw0yFz+XyNCBu9BsCkbMJ8qi14u+EZ3m0qUe+nAPj8nLhPjoK4XU+NXcCsXi/JYg
 tUDBsrWEi4UQakm7F4g==
X-Proofpoint-ORIG-GUID: _r_6haRRnIM5DNmMkvshOGkkjLdNMXUr
X-Authority-Analysis: v=2.4 cv=ZYSIpcVA c=1 sm=1 tr=0 ts=6abe4c8d cx=c_pps
 a=A3wBdPz/itNY2Bh/0u/a6g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8
 a=KiMCiSwjAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=x3ZMZMX1nGGarHV9e9MA:9
 a=sPCYT0qwnquSfqsKqTDE:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfXxV691D3liknt
 eU40UYnf4/If62BcBZqW4Pu2xA05wEMe9nJ4+seTaUESxXHj/HglOkaCACvBLjeNbrZPZHJ7dM7
 bTwSE0NB2fPiEEyuOdzL0MwD7EaEjhFyRIE3mHkNJs9G7Q05y3k7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130590

strongSwan 5.0.2 through 6.0.7 allows PKCS#7 certificate
enumeration in the openssl plugin that leads to a lack of
release of memory after its effective lifetime.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-78124]
[https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78124).html]
[https://security-tracker.debian.org/tracker/CVE-2026-78124]

Upstream Patch:
[https://download.strongswan.org/security/CVE-2026-78124/]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../strongswan/CVE-2026-78124.patch           | 36 +++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch
new file mode 100644
index 0000000000..a82232a675
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch
@@ -0,0 +1,36 @@
+From 2a3a678be189e51465d17c611982a9e5f379b016 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 15 Jun 2026 16:02:01 +0200
+Subject: [PATCH] openssl: Fix memory leaks after enumerating certificates in
+ PKCS#7 container
+
+This can be triggered via IKEv1.
+
+Fixes: 04884be3b5f7 ("Implement openssl PKCS#7 certficiate enumeration")
+Fixes: CVE-2026-78124
+CVE: CVE-2026-78124
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-78124/]
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+---
+ src/libstrongswan/plugins/openssl/openssl_pkcs7.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/libstrongswan/plugins/openssl/openssl_pkcs7.c b/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
+index 9980bf242c12..46584055ec3f 100644
+--- a/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
++++ b/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
+@@ -132,6 +132,10 @@ typedef struct {
+ METHOD(enumerator_t, cert_destroy, void,
+ 	cert_enumerator_t *this)
+ {
++	if (this->certs)
++	{
++		sk_X509_pop_free(this->certs, X509_free);
++	}
+ 	DESTROY_IF(this->cert);
+ 	free(this);
+ }
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index dfd4c0c8ca..4a1e584d84 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -11,6 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-47895.patch \
            file://CVE-2026-78123.patch \
+           file://CVE-2026-78124.patch \
           "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"
-- 
2.40.0


