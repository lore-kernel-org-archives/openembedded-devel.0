Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889BBD72348
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 07:42:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62886.1769154163403707431
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 23:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jAGt7LjO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54833b6d62=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N01YAb2456851
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 23:42:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=WTl+vIj9oDyFoA+tESB/
	ErCXkXjV07DRnMwlRP9Ck0s=; b=jAGt7LjO/5EAMHh0oSYj9POX0yio7KKZRQjv
	fXtnQCtoooCyrRL1Df0q8h32wbIyOPogORQC2HjacVk6FeHceK0MicppIHD55G2E
	Uih5cVWUum8GER2zmeva3ZOcRuHy2RLH6n5RFMNu00oX6x69e0Zq7mIUEDvvBjYE
	o8KAkWuird9aFZ/dWaZFYwfoxxP0Aito+/ttvdNyxR+JYLTXBWgrVBoaxIGzbhlq
	mxBDpNhFOpp7zZTt2ZC/t+9kTTbTOhZf92HCiBqJWjdZ6Jb6S0dVXLufZQpPXv3h
	vSDfHJ6gh/GPlBXffzv+WUFSwG9w3vX/U2XMf6ncQjb/80sGHQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btnd73uxb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 23:42:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tA02j8nBXmE5Y8kx7VYYWlLLt7Ic4flZM2NB3rDX2/fcBEuf7c9PYpwcDJ2vF9cSc9XY0eMOkC4bo7+EEBJHoif5amHI+FBbNE6mzEnXayCQbD3OcprvoC57TnC4i6Laj/sF/zOMQTZQPz/5g944nCgfPgwb60XpqA1qUHDIbztGw0KlbiD2C/f77y0ae1HmPphPh0JigjA8k9YSbZhdEEvyRPex+o+2fTCihbdyZIlZ5VGeWZeyCqv/ThQZng9CDNGPTt64jCqeav2SbUbb+ScZctjPnEBe6trE5eGS6oosVbqMcV7hZuriAP2c0HIqCtHJskC1DTRGBfIOhPN/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTl+vIj9oDyFoA+tESB/ErCXkXjV07DRnMwlRP9Ck0s=;
 b=Xy7vF5M0rzx0fv5TKE0X8ZNzc/ONL7La1qfQBfShXjauKD0Sb7p3JOVuo8GTXyLefk0d7798xxz75LBK761MOJZHNcs9Ov2LrxCX8vEGRx2q2UuNP/oB6JP3dhGvQAy3EHyctdJNOdwKaGLXxRp1GiEn1wlfPWIv6gfOad0b7XK44xHTEX012wOH0VPv5XqXPXdVnSBrjA6UpcvTZn5CQafOxT87uDwL3Z6JR3zrq16lqB9UyUlFeiDtoKzZTNXHvZ/Oj4L2R6R1jb3/XbRviXkxs8zoohOdB2Azs+GriUyFRZa53+Byj4e2y75cLQTM47oYHZ7/1SuTRYEVbIT5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB6981.namprd11.prod.outlook.com (2603:10b6:303:229::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 07:42:40 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 07:42:40 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] net-snmp: remove des from default packageconfig
Date: Fri, 23 Jan 2026 15:42:24 +0800
Message-Id: <20260123074225.1538346-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: c8258b98-af52-4c12-da3b-08de5a52fc5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+/L5gPSXg+/o4l7eoDCsUeoo1+xpFK7REU9auJfLfcGVkhRPkdHetBwZ0jBP?=
 =?us-ascii?Q?VPvStVQi9q1p3qI5ECIn9SERllo93BcQCfrEd2IBDB4PrztxK2N15EiZAACY?=
 =?us-ascii?Q?W999NjBcgjSjiViMkXgaOiOSij2hnsi98nW/8Mj7Q0A6lbT4xMbUf05drANK?=
 =?us-ascii?Q?9EXmt2ydtmqAD3dO3zWhJvAY57YaVVUu7VaBhWuPagHIJFED0s2qD4+g/DdO?=
 =?us-ascii?Q?eTgi4pmYQDXiirtu3CFk9WQqBCELfDdlQV9RN28NvjT4z43AkPf6EfeDukog?=
 =?us-ascii?Q?RU6T/8blzg1rKo35FHH0SbUU7qpDbfPxuZwTjx8KOrYnKnGuyBiYzGbZQ2ET?=
 =?us-ascii?Q?xqxYsnVy1rYVlMMxOzpfpeA1MHtRtZp83Q95YKPFEaTQP21kdk7ixyL/HfDy?=
 =?us-ascii?Q?bnIsUoyrWQkIHfl5Rc88wdT0kiJXaaIg+J5SRZDV/96XjwM03h8IL/XTsE42?=
 =?us-ascii?Q?xnMTuCVgverIyeVlAFklllxSf6oxa8rSHjXOgfa8MnoJQNjHHyd+JnHNAMXd?=
 =?us-ascii?Q?DoSALAkHxQs2F+E/ILqff8JXBOFrTXNzbw0nYKbzzmkioGTCNYGEmPGkuJIX?=
 =?us-ascii?Q?Ed5u42o9N+jkFXxFSnDQOAqwsUONXLFXBAW6J9bPI+dTUzq2BDGVZIJZunk5?=
 =?us-ascii?Q?EU7tFEQ0vQZuRX5CnDiBFmU3TEZ/cPW+iKipWrF/tuC37OWok2OtW518DrDg?=
 =?us-ascii?Q?pbzYrf+iib7pFDaLih0BS1WhxvrxPUEcdYHyLhtovuxzw5Bq9Kaz++8UvtS5?=
 =?us-ascii?Q?cRYWHSaDLSDBwWgs5LH7LYg/Vy5M8QbSdltEZ1ShBxhtj8BEZKM+zQqEJR6n?=
 =?us-ascii?Q?7EkaeKYtUiS1UoMyWvHFGSvkQ6+tDDIiHaDD3EBr79Rhp9Y995Otm+SnZpwz?=
 =?us-ascii?Q?J8TwwsjHntsyR+0MxD29RHO2Ki0zPNNkGCRTtX1CyWry+Y1ZqI7BIDoa6vzb?=
 =?us-ascii?Q?KE8zXdLNYh3mcdTB+BMcz7or2GB7zcRmLSm85EVYAyu0e7TU4zTGlw/cRZPM?=
 =?us-ascii?Q?TjgIRpxuD2XWZlm7QteItsypnnFdXls+yDAwGTTTUAPKZZm6YCcQjEnf8Y+u?=
 =?us-ascii?Q?Jk6DMDhQSpcXunDQoiagsEyykajdCcXyXExbY2mXyOdVRuxZylkpuccS66Gn?=
 =?us-ascii?Q?rSJVnPJ+Xo7ste3JZE6tyS3SfOmQ1f1D1QE6+VphJW0IrJOhOxox6DrcklNd?=
 =?us-ascii?Q?FAvfVo5xpBXktmCcMpCmekIQvAnE1FYWwWpQ/Ye2Ya7nFqF9wl/Rc0U0J3oK?=
 =?us-ascii?Q?rDrYZIPIC9etXAfoP1Q6A8Ufezk7GFpkv4cr+bcFfyHCmdaJrAVfhNIi4Nl6?=
 =?us-ascii?Q?sTp86nVdvLwGunF0M7jZy8z3o/JI6T3XCc8G7p8zyzxP09OPUFANazP0RNFC?=
 =?us-ascii?Q?8hJCBmUoMMh2+uGUrMoUvJSw+2/limvhc5LC414Depes+HwtVy/RjanQY7iz?=
 =?us-ascii?Q?NYOKZ2SUIYgAi5ZhZFthapI9MNDfeLt3Ezk5cenVdgNalIUcqvoB3i27G4Ps?=
 =?us-ascii?Q?5mGsk2WFiwXn4pplCruuwZiADLYXwlyygP55wzgza3DbMPDwP78lTwSCZE3Z?=
 =?us-ascii?Q?91T+qODbXjRp8inaCliJWozPfZ0fhDhz2hTl+miMI7drn2piKd1ElHr4q0RJ?=
 =?us-ascii?Q?KAxUKxh4MQfQdN2B2a08RDI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bV6FYzti1iFbUJf6y3/6Diqaxwmy0PySYCv8hjW5sd6K4BgAKBAuAhF4wCDv?=
 =?us-ascii?Q?nqL655bJV8EU1LZCbcMG4hK+MdkZIrTu3VwXIRrTYpsQqUR+6SvYsfdnWbCD?=
 =?us-ascii?Q?RovB9k75aBnCuRI8w1muAuSK+zgwbtRVoS/RMYZw4YFjVKDsU3tBEwvEsotu?=
 =?us-ascii?Q?xexD/EdA1b05M5DfUMY0RuRYxCjSSltd/QX238RvEQWygIXMSV1uHIZSSaw6?=
 =?us-ascii?Q?lxf/DupMfujHMiJp775mdgMNAYTf3PeDCYHYo8huArcVSAK46TF0voQut5Y1?=
 =?us-ascii?Q?3xjvDucweaQpV5rVS+/F6hFdUlL6H7biIhh7ui1Ji+olC41y3amQXRdno9ay?=
 =?us-ascii?Q?DVFh555rvIsfYN1wy+4r85MYGGpU3lTWgacUERfMT5U7dRMpF7gW76N2Hzc9?=
 =?us-ascii?Q?ffOw6DhoTgK7MvnRjH+K4nzBeoivzIMncYF80LLjhppRPOXqd6tIL0Js8c1U?=
 =?us-ascii?Q?vv4rLGeTiA4tYHXw57nSuX6C699K23/1+6pcforgrH84QqpfQw1e45ikLkA0?=
 =?us-ascii?Q?/sAc5ZCiwZw33EQ+Utyqli9t7YRHYE+pCNpesyFOmOnd0V0Zb/tf60YZLSTU?=
 =?us-ascii?Q?esy+9HF8BvfqLt69V2PUAKhDIRr28/W2ecpuROb2VwuTc6e1WnX81Iul2xpt?=
 =?us-ascii?Q?U53l8Z1KT/5UgzNekOSGKuJVfXv0hx5/pcyrTYRXacupJ2aoHC+jppyvT/yr?=
 =?us-ascii?Q?ql+tVOKwZ38TZu9x57C7vcH5CQCAzGD55NicfKivG1rNfatK3ueIbEuFrNq8?=
 =?us-ascii?Q?0JwkyJByzgLisC+QJYk+Jzt/zKjDYRedyiVYdGgx6FDY3KsTDNxaF5CRc1Iu?=
 =?us-ascii?Q?pL+4Hes1Vw6shFQJCwcr5wGDURoEynXWj9VZayT6Gai0tK6V6ogO5WCW9K1R?=
 =?us-ascii?Q?e8CyMo9cWVZwBVCwSqyvrGQWf5CmXqh5GjD2bUuYCWOmk5HXMOzPtqzYPcm+?=
 =?us-ascii?Q?Nf9+HTJMQI/yc38qwTnkULAzDZ8tRenA02msPv3ObamBRbret6SA3VYFNY4Q?=
 =?us-ascii?Q?uWuicffaczi4LYdwwhFC53oVWkMhNXh4U/xGhNsVQ6q7BCl03Iy3Bl6/Yjrj?=
 =?us-ascii?Q?IlcNYK6QJ1m6tJvljEGb1e8bvpETsCl7T/xAjiMJTNrfF2ke13CrU4vdDdJn?=
 =?us-ascii?Q?t5Jj+TNVl5kR0jAtt5h0F/OZUkqe6BbfKTb/7uHovswaWfqBEyFxMNZPJOAT?=
 =?us-ascii?Q?4EAx8k5VQCga24ij8scNmcPa/1il6a0bMX6lTbWSz7hTDQadkk+5WlxSXUEh?=
 =?us-ascii?Q?CkIdn6lH8ITziDzNzn4c9VWKgfU9vqRhbLlqEWAZrZ8gv0YBp//93REh04tl?=
 =?us-ascii?Q?89uW+qCeZL5ScRPahYGzf/KFxxby5GVIE/BJpSRhwnF//ty/9FCC8+3RYkXD?=
 =?us-ascii?Q?49Za962/K3ed78dksoWEiX3T2IufZrDwo7gJfCK77C/V1FBC8SU0y31mtLPw?=
 =?us-ascii?Q?V0BAYYKxBXYQyVcoBy/kv2SIa7GmvfcHMsEA01UvuRSVrnASzXP4DzwKoxME?=
 =?us-ascii?Q?S4hbkH1N9NHA/1YCE0ndw5Q5TdPc/otH/smfUlfHSYrr1P11RFIMYT3SflrT?=
 =?us-ascii?Q?iVsyJjldO1C9oB4QikqUcIzleF6/L7zPYHOfySHTBf72D75jtQvkkDevMBAs?=
 =?us-ascii?Q?zf3Vq3kusIHUf0b73yseG6MjOeY8Jow89wqn0vREDyB2o5F04MMOyUxvVQ/V?=
 =?us-ascii?Q?FwNd30kIh4j+jevXhUkRiaNKn47xxFAmDy85mWuKneBxd1QUC4GVTiQypP3m?=
 =?us-ascii?Q?mUF5Cegv2w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8258b98-af52-4c12-da3b-08de5a52fc5f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 07:42:40.4451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1uDnRNB+iO6HMI0jOttZfoWk81PlIAGvrl1guQsz2JuuIjGgVChYbTuAmWuxg6woCpJx5ci8YB1pkBvs3kupg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6981
X-Proofpoint-ORIG-GUID: BAROPAfcIsu-AkAQGwHSnLTJYwTnybZx
X-Proofpoint-GUID: BAROPAfcIsu-AkAQGwHSnLTJYwTnybZx
X-Authority-Analysis: v=2.4 cv=U++fzOru c=1 sm=1 tr=0 ts=69732672 cx=c_pps
 a=g+XQapjYtrKCWQI10hurPg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=rmQfibiZEc3H5F6gCqUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NiBTYWx0ZWRfXxKOlcXd9A2LR
 1fEFSVh159kt4TJ2PY5oyxpazY7Uu5VxTthN07YESaD7HBLe05tOZHjrc5TKs3xisS7naDjgbNm
 tuJnLTPL3fXctrJh5CN1PgjcoUaqXxRkQut/h87TFtES8IMArgfcIIc7gSkrQCsv/4EOgTbPV9g
 Hg9JBsH+nMF16hMAMsSeW/J8iOdGZp92ukZB3OTy+wc9Wjx04UBo6KZraJUj4oMAmZNgQKH14Iy
 S3cAtsAHeXz98FT9NJvkGAzXSL4v3859V3UzcyJK5qybzeQRCa3vLydDSxr6ivru2w71XGPY/2Y
 S5NWZrht397IR0Jz4jAoafJL/L/NkurZq77I//OCS06TGRpJVsqY4N8bHOvphZ/lPjW66U+hgjW
 6Xt/ec/geuvN+QzyEIbnsjUZ2kBEBfvy0Jvn2sg//Z76qPYyMM5tuPFULyhr2PFocsjN4ah9ugO
 iHjqCta0XiTYupvn/cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 07:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123770

The DES algorithm is considered weak and outdated. Remove des from
default PACKAGECONFIG to disable it.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
index b7c9607b3b..d467bf56d3 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
@@ -41,7 +41,7 @@ PARALLEL_MAKE = ""
 CCACHE = ""
 CLEANBROKEN = "1"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} des smux"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} smux"
 PACKAGECONFIG[des] = "--enable-des, --disable-des"
 PACKAGECONFIG[elfutils] = "--with-elf, --without-elf, elfutils"
 PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6"
-- 
2.34.1


