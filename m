Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D56D277D9
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 10:01:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6063.1768039287398017036
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 02:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nqBaE90K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5470fe3c83=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60A9p00u437485
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 02:01:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=o3GWXSVk9k/v8T2vCJci
	A0onjX3G8mPAcW4H7B6q7cM=; b=nqBaE90Kpemte30hdqBV4rNbukk8U7UUaEvc
	scswebotUvYN/CLwlgvAQbepTHbF+bAoDHtOYU1ifSZB1U8/zT8Z0ZhjERzW3K/l
	j2eEotEcBnuZe9s0rIEFapFRCyVI81q5+jrlOswv7XjuBalcMV34SwrdkslpZuKV
	GQRhBtSfvKs7FSmhb+totOUVYZCFe8aCZmx+oum/q9LR1hKSG9D35BRK78CbaMow
	ivY2tV3Uy0RSvk7NEZUOHFMuFLrV2iEeZF5EWPD/wCvfcCLxmMKJrl0NEtp4dY8t
	vZwgGOAIbdNFl1gsTEvdHI1lGco1Uvi7wDaYA0KASoLj/4I/ew==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkatug9v3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 02:01:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ccy7OAQpbaeJj24Rj0//i/RIz6C+yxwUzTJ8MmjselG41wmWJZp3uplxTfXxwH7uFrXejUiQaCHUWM01kRJPoDQKinNBn8pzsXazWZn8kAi9zTuZchfI1Tr+QxmYIjtcWw9/99l4rWt6AVAM3hvehfXLxgngL+InmOQojpDyTGFj/fdjNZLgWy2BJHIim4NDwa6sy3khXgDcXEf1uhzbpeNDpKODD0XRSUHMm9lmEM1zeN9/eWkmCofm16KnNu7IbWoFLvO5sqzt8ikJpzTqdkFoR8IyCeg7s1HA60mS4pYgkHYe9vwhualANJ4Dnj30KI5+SPk6HALHWusU+j547g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3GWXSVk9k/v8T2vCJciA0onjX3G8mPAcW4H7B6q7cM=;
 b=QWqOcIyxJVXQfU6slx7ECp99aG+qTQTRHV8Qw28iL0iHBMlqB7h+Yx/fScZ24nC8YLUXjwnEub6rO0gqy2HYfKErg3FthYCaKiWE5yGn09Hn/fMsOFXH0PD7rAbWxJtjJDr09gCXBikP7QdPNIq8FCnms2c6H/MAktKPwOIJIdysbZ1FmgqRpcD7YnPuhEELcwUETn4HK+6wBYL0SbMx7Xj7op8HTgqqOalCPNdxZsOQ2zWYlhwK8XkD9i0zwlOQzLcpZguXOqFIRuYgghlwEYCx8q4FnMkdEVOV8aMoblToXJlkJrGBMEjbUu55A2CMfYVHm2NcFIhkwEv10k/Y4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ5PPF92ECB6678.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::846) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Sat, 10 Jan
 2026 10:01:24 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9499.005; Sat, 10 Jan 2026
 10:01:24 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][krikstone][PATCH v2] python3-django: Fix '_lazy_re_compile' is not defined
Date: Sat, 10 Jan 2026 18:01:04 +0800
Message-Id: <20260110100104.4062951-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0061.jpnprd01.prod.outlook.com
 (2603:1096:405:370::16) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ5PPF92ECB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 19fd47c1-9eb7-4c03-aa61-08de502f35f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7142099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?A0FmEmgGTexHBY13kWdkFbmJLbL50Z/L/6OAVYadcSOx2Dbnm+XdIhqVeCHJ?=
 =?us-ascii?Q?5VjzsIJAp/qE6Po29oGQh1G9hWGsy0v2FYEZkXv8EZKUgQkrBEO/sWow+eoM?=
 =?us-ascii?Q?LoAJO7laZkWKY7IPzrm1wC5pS64m4tES5hI7YgEcz9lUTdYZZtUuho3yvcna?=
 =?us-ascii?Q?Lg5wotJbXICgD5D6z/KcRAajYLU7Dbsg3FSCRF1P9PS1U3RZV5LqGNzlvwKz?=
 =?us-ascii?Q?g+znfywAryl6B4K5G84HdBLHjVLPC2nCZKYmMXziVTq7H+3YBcnfN3w7FN6X?=
 =?us-ascii?Q?Zt3mHKaAe0Lcd+zLBnOk+//2nFe2XaKXlPrIRELRyNjAFR37UwUboNuit2+w?=
 =?us-ascii?Q?Qsf+aJJPjstyZGFBbz4px1R1GbljQDPQSY+xHRcNaEpvH8c6y+2jo3cpcMem?=
 =?us-ascii?Q?NRAFowdSUHriT88yZ5Mw9Z3GSf57pQhh4U3OarwkgUuvbnQ9DF56sNmg186K?=
 =?us-ascii?Q?wdpgIChtQ7MpR7u7cSOlDmPRC/XFtTxPxl4J4+PZADiGL/wLaSA/YJJhQx17?=
 =?us-ascii?Q?XVN2WrJWgan72skQbQfvhEr6JtwXQ4UVTJdXxJ8ZjXnsvgQZdBlRqkbsqkTT?=
 =?us-ascii?Q?Q7HW+KmYPm5fNqVCXjF0VzmVH6cFRLXzSztymW9f6QO2+7caEsys4yG75WGh?=
 =?us-ascii?Q?pRnam5UQs6AkdQSIAtdZWk45y1HledfbljlgK4dm78R/kVfG0HEt7vqUTPBz?=
 =?us-ascii?Q?CG//F14rrM5hqnFt7YfqISsUuoqrkN/iJ6b63FJ0enI7jf+DQ7EbjYVtANh3?=
 =?us-ascii?Q?X4JCX+JYERioaYufsPRRcoa08QVG6daXIxD66xqgcqoHxA2kaI2HAcRxsHux?=
 =?us-ascii?Q?iHwmMazyw5mMxSrQ0W9zGVIEQYyIBsWcLQ5etpMwK0AyQZ2J1jwg+beo/Lf6?=
 =?us-ascii?Q?1fvHFcY9DqcjvIp1ouiKJRjR8P2NS0RW5bqrl6YZGYHETR+Y5JHfCkj7Yjtm?=
 =?us-ascii?Q?qqQJhREKsUzm3hxpgDPVm561KKdnGdZIeiQKOVkgJ9zXkClFQP/PncT1q9tP?=
 =?us-ascii?Q?7RnupwdZi3QHUsYk1VinPoMDNPLWtyFzI6+ZpMMARs2jSAsSrr6BKqAjyQT4?=
 =?us-ascii?Q?YP+J9zoFq+z12L/D+/QSnL6OnlZ13nJreFKfe3ev0XUQijiaDPhiQ2PMxOKx?=
 =?us-ascii?Q?3xwDlYVPruLqFz0ev/6P6tlX1WD1fomvsdyKHzDKjZ0bKsrpftePNYr+hwO/?=
 =?us-ascii?Q?aWOUi7F0bMMf51z/y2v8RULsCL9HkwENRe+K0DLBkq/8i/rjIguekn7MzEad?=
 =?us-ascii?Q?qnPyFLBgGi0gIL7lo8+B8yEwdskU49K1m3JamKj45Z3AuV0W+OzSLkpm4F8s?=
 =?us-ascii?Q?UMHcFV+klW5u7ZKHLDctzis0wZcCPxLZhglxFG3zD/iFZgYC+/lOBmaBR4VO?=
 =?us-ascii?Q?qsRRhkXaxU+GmYAPeVy4UrX7WW14kVvRVTf1LgSBnxM/kHiRGyEfLNxJagPf?=
 =?us-ascii?Q?iESgc00mQK6oJGLR/om7TPp25uyBfplzKw2qnglYAZk4XopCUMww9HYL7o2a?=
 =?us-ascii?Q?Jo0jPDrSAAZcQRlu4gTNH8/Mk46lp65M6ujxEIxuHFAPJgLjd+4wOFYt+A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB8200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7142099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Cy2m7vrMaYvyWyibq3DLgothzzsW/JgdQ47P9kMtnrfwLl3v68vG5+vRh4ha?=
 =?us-ascii?Q?LteK0J1UJoOiYMMv0zHapM3n4hNbWz1IqRuyppf8vGiMNf8vDv2vZ/6F7Lm5?=
 =?us-ascii?Q?N49tlrGqAadvrIJTNca/lWncEP9F/r/n0H4w6IYaszv5MYG5TNyxWPOjuH9V?=
 =?us-ascii?Q?BflEqFVT3XyqjIpbHGn/2X+GOz2uR50a6dOZAKZWCh+yWWU8USwiv/I9R/4L?=
 =?us-ascii?Q?48vKfsMO7SARdaOvqDANZ+hCvNtBr7BOx+Tw8KjI/DxrEvY54ulLjGcUUPdv?=
 =?us-ascii?Q?cyK5gm0wFfDkleEuBYxJoUmYgVsPNT9D11kIxjS9iBpAWJoqaP67w/e5MGxW?=
 =?us-ascii?Q?bA7PgkoynSIJFdW2RuFIJlbUV/ngyn7nMlOYeTcs6upISp6A3mLSWI2FtlId?=
 =?us-ascii?Q?QmX9n3w6rxE4tHFXODI3v+y3k2/2Aw98Kbls9U5a4MFtd8X/S8UKlv8mUDgX?=
 =?us-ascii?Q?xiyN2cVFiybhMVxDCwUbIfoC6/YzvQGM/3hH9yMytTeM7ZGqGeDTIfMAoOH1?=
 =?us-ascii?Q?B+ahT3lZRQnC0JCMyH9EzoMnUXsGWiyr3tTXMcAg4xSmbJBSlW0iz9T9wa4a?=
 =?us-ascii?Q?0sa0v70ly+bWLKOjuQaWaq1BV3N1y97CWJSyeJRq36GeGa8vMkfJhD4Z8ik3?=
 =?us-ascii?Q?KinNHnIWvwGhcaIOUO8aJPBtm3I+jpwE0rdXUI5X7VD4cd8xryngCn2W9a+Q?=
 =?us-ascii?Q?ChS6LQ1LcADFRZqa7bwGYNNhKs8gtbc3KvEgzlMjEDAnnSLNy36YEqVUEStY?=
 =?us-ascii?Q?ZUalZ13tzmz/H3KK8dypXk+aNAeOWvr5nkemQeD9LDKvDsdKSVEB5wXk3zKQ?=
 =?us-ascii?Q?9OdcnXNF09mqmQjVXB+2NqQxJei5QibO0L0eQaz1GzNGTOb5eZgYjC2yYNVE?=
 =?us-ascii?Q?USM4fLBvWr1GhDFgbqFXdKiJy/5QNShgWo9hN0o2kEqzCLwmXbyFZZhCz+qs?=
 =?us-ascii?Q?fgj9RirrZnruRMOqwxZsMtk6pjZItDP0KmkIsTe6ZPfeIAU0ull4ZS01F+7M?=
 =?us-ascii?Q?nbbIg6rW++iDHYo+US/5+53Q4Y6C/ihkyxHCXA8wTso7prcW54/p9FYBIcic?=
 =?us-ascii?Q?ND+BAKmq/99y8HXpP1nmApsPB3PsZ62CrfBgFXzXxYC66ppsc69/MkkUEJWg?=
 =?us-ascii?Q?Ul2qelBbE0AKIbu/HF4bVxrSScMpVxV+puzHsWziV/9c51VFfj1upcmXjrcx?=
 =?us-ascii?Q?vXupvWSoxrUIddAWvblDc8M33aI51QKUy+uw4bd2fNCmGFmWcOPehvTBjv0r?=
 =?us-ascii?Q?gNF4pcziqG0rcoik9UujQIOXcEEkmEquQlrFtAxMl8qz428eEauGeJPOb1tk?=
 =?us-ascii?Q?QwiHDEftgM1GNP15QqZOw2w4XNORgiWIi9+GjfhCjEVSau9LmPM2T42VqS3g?=
 =?us-ascii?Q?hyhaAfArP9A05kFuvE0SQrgRG8vZRV0+sEhyY63vHaanCqgqEq3+LnG25rUP?=
 =?us-ascii?Q?vU7jSmHKZ3w3kmpQaZZDs+CluKqfF6J+vbrcCgBbZl9gjrcGH5cTrhiJF4Fn?=
 =?us-ascii?Q?rRIY/FxV/lkD4XIaU6ii7RXcMTSflAUFE4xDDbfkIXizYScf08oQ6mL5JZ/R?=
 =?us-ascii?Q?V5r7fAHfSXwvVIZA+rrCTfX9izdRfSk9wZXdK9mJa/WEPPq7Mu91koqA1Aj1?=
 =?us-ascii?Q?5MphI5smFn/vDjd5fEXu4BxcbgpQj/k7gcOwd7rkOvu6J1GtHKJwSErQUmEP?=
 =?us-ascii?Q?ZWPSOypa1fnodmAt7dgvpedmmAgfJCciGHE25QXWRWD9HsnF0KJk28i3EB7x?=
 =?us-ascii?Q?+r+3hrORyvQ6vg8tm39v0bqtS3n548E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19fd47c1-9eb7-4c03-aa61-08de502f35f4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 10:01:24.0518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPbxfD5Qg0TZ2Su3px0KnYzEaJhDxolCDWeJaI/YrXeVGcx6h64YAjlgPzxcgT72MO8p2MhGHX1x7FCK5s1BguJQWwKP3qg66HP1dAQ9SUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF92ECB6678
X-Proofpoint-GUID: wCrq-YKuncJx2q1ts8Ovat81-EPiNPA7
X-Proofpoint-ORIG-GUID: wCrq-YKuncJx2q1ts8Ovat81-EPiNPA7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDA4MSBTYWx0ZWRfX8ENoDr0zRCWv
 RF0tSfkXmlknm0KHiFczAkninxCR4Le8UKsnrv60HkTqHCz6Dafi7JTR7+nMCjAnZNzsFmr3VJF
 HNP7LXjJOWGaSBwsu9xfrj5TFzNH4TtwJQMXB17V2mnztAdjWYcfJPZcUgx6N2fVxdsDfBTppFa
 BcpGJqAlCUVtOkHB/fdQbCRLUrWQRQ7OxJEhLgkz63WFYbIGGiWmLBbGcC9C7cPyPcwQg81kpBr
 NsVu1SXV7rYGepoKZSqFu9pQMSZB//JmF/xtoxRK/HKEC+n08zHtSgb0mZYg+9bw2t1tFAV5wwC
 kdPDdXeyj7ut3hXFa77YcDESY07x+C+RCd1HHh2mbFzzjhJp5+mB9VczApPPT1YIgshX3Qskvn8
 uswFob/cohI3aBi/MqcNjy43RuqYhFgG4BUmOM274vlUUBl9dffyJAN19PIiu76ewnAkFyhS4Ug
 HAYKn7KpKPdiXfLBEXw==
X-Authority-Analysis: v=2.4 cv=XbOEDY55 c=1 sm=1 tr=0 ts=69622376 cx=c_pps
 a=KOMCkPMYLpCa0saNKAKAdQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=JUY6PVayAAAA:8 a=pGLkceISAAAA:8
 a=W8_ZnyXlAAAA:8 a=fxJcL_dCAAAA:8 a=VWcOui0qAAAA:8 a=TFSH6_FRtRJuyxxk8C0A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=32l4pQc4xq9dSJlKNEIc:22 a=eqgIXyRJRr-I_B2loWo7:22
 a=QrT887owLcKFfbcY6Lji:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601100081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 10:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123319

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

- Fix:
  NameError: name '_lazy_re_compile' is not defined
  introduced by CVE-2024-27351.patch and CVE-2025-32873.patch
- Revert the modification for docs/releases/2.2.28.txt

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
v2: Fix a typo in the title

 .../python3-django/CVE-2024-27351.patch       | 35 ++++------------
 .../python3-django/CVE-2024-39329.patch       | 27 +++---------
 .../python3-django/CVE-2024-39330.patch       | 40 +++++-------------
 .../python3-django/CVE-2024-56374.patch       | 42 +++++--------------
 .../python3-django/CVE-2025-26699.patch       | 37 +++++-----------
 .../python3-django/CVE-2025-32873.patch       | 33 ++++-----------
 .../python3-django/CVE-2025-57833.patch       | 33 ++++-----------
 7 files changed, 59 insertions(+), 188 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-27351.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-27351.patch
index a341897ebe24..e23025e23db3 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2024-27351.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-27351.patch
@@ -1,4 +1,4 @@
-From 072963e4c4d0b3a7a8c5412bc0c7d27d1a9c3521 Mon Sep 17 00:00:00 2001
+From 44257057cb92c55ee3c9f66de76120c523aacbc3 Mon Sep 17 00:00:00 2001
 From: Shai Berger <shai@platonix.com>
 Date: Mon, 19 Feb 2024 13:56:37 +0100
 Subject: [PATCH] Fixed CVE-2024-27351 -- Prevented potential ReDoS in
@@ -14,16 +14,14 @@ https://github.com/django/django/commit/072963e4c4d0b3a7a8c5412bc0c7d27d1a9c3521
 Signed-off-by: Shai Berger <shai@platonix.com>
 Co-Authored-By: Mariusz Felisiak <felisiak.mariusz@gmail.com>
 Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
-
-%% original patch: CVE-2024-27351.patch
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
 ---
  django/utils/text.py           | 57 ++++++++++++++++++++++++++++++++--
- docs/releases/2.2.28.txt       |  9 ++++++
  tests/utils_tests/test_text.py | 26 ++++++++++++++++
- 3 files changed, 90 insertions(+), 2 deletions(-)
+ 2 files changed, 81 insertions(+), 2 deletions(-)
 
 diff --git a/django/utils/text.py b/django/utils/text.py
-index 06a377b..2c4040e 100644
+index 06a377b894a2..02dd0891686b 100644
 --- a/django/utils/text.py
 +++ b/django/utils/text.py
 @@ -15,8 +15,61 @@ def capfirst(x):
@@ -43,8 +41,8 @@ index 06a377b..2c4040e 100644
 +# text with only open brackets "<<<...". The class below provides the services
 +# and correct answers for the use cases, but in these edge cases does it much
 +# faster.
-+re_notag = _lazy_re_compile(r"([^<>\s]+)", re.S)
-+re_prt = _lazy_re_compile(r"<|([^<>\s]+)", re.S)
++re_notag = re.compile(r"([^<>\s]+)", re.S)
++re_prt = re.compile(r"<|([^<>\s]+)", re.S)
 +
 +
 +class WordsRegex:
@@ -90,25 +88,8 @@ index 06a377b..2c4040e 100644
  re_chars = re.compile(r'<[^>]+?>|(.)', re.S)
  re_tag = re.compile(r'<(/)?(\S+?)(?:(\s*/)|\s.*?)?>', re.S)
  re_newlines = re.compile(r'\r\n|\r')  # Used in normalize_newlines
-diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
-index c653cb6..7227452 100644
---- a/docs/releases/2.2.28.txt
-+++ b/docs/releases/2.2.28.txt
-@@ -90,3 +90,12 @@ large number of Unicode characters.
- In order to avoid the vulnerability, invalid values longer than
- ``UsernameField.max_length`` are no longer normalized, since they cannot pass
- validation anyway.
-+
-+CVE-2024-27351: Potential regular expression denial-of-service in ``django.utils.text.Truncator.words()``
-+=========================================================================================================
-+
-+``django.utils.text.Truncator.words()`` method (with ``html=True``) and
-+:tfilter:`truncatewords_html` template filter were subject to a potential
-+regular expression denial-of-service attack using a suitably crafted string
-+(follow up to :cve:`2019-14232` and :cve:`2023-43665`).
-+
 diff --git a/tests/utils_tests/test_text.py b/tests/utils_tests/test_text.py
-index cb3063d..7e9f2b3 100644
+index cb3063d460e0..7e9f2b3e96d5 100644
 --- a/tests/utils_tests/test_text.py
 +++ b/tests/utils_tests/test_text.py
 @@ -156,6 +156,32 @@ class TestUtilsText(SimpleTestCase):
@@ -145,5 +126,5 @@ index cb3063d..7e9f2b3 100644
      def test_truncate_words_html_size_limit(self):
          max_len = text.Truncator.MAX_LENGTH_HTML
 -- 
-2.40.0
+2.34.1
 
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-39329.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-39329.patch
index c302c0df186c..67c97f2601da 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2024-39329.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-39329.patch
@@ -1,4 +1,4 @@
-From 156d3186c96e3ec2ca73b8b25dc2ef366e38df14 Mon Sep 17 00:00:00 2001
+From 7d7126caae786521290383d618dea49727d871f9 Mon Sep 17 00:00:00 2001
 From: Michael Manfre <mike@manfre.net>
 Date: Fri, 14 Jun 2024 22:12:58 -0400
 Subject: [PATCH] Fixed CVE-2024-39329 -- Standarized timing of
@@ -15,14 +15,14 @@ https://github.com/django/django/commit/156d3186c96e3ec2ca73b8b25dc2ef366e38df14
 
 Signed-off-by: Michael Manfre <mike@manfre.net>
 Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
 ---
  django/contrib/auth/hashers.py   | 10 ++++++++--
- docs/releases/2.2.28.txt         |  7 +++++++
  tests/auth_tests/test_hashers.py | 32 ++++++++++++++++++++++++++++++++
- 3 files changed, 47 insertions(+), 2 deletions(-)
+ 2 files changed, 40 insertions(+), 2 deletions(-)
 
 diff --git a/django/contrib/auth/hashers.py b/django/contrib/auth/hashers.py
-index 1e8d754..4acb81d 100644
+index 1e8d7547fc35..4acb81d3d0de 100644
 --- a/django/contrib/auth/hashers.py
 +++ b/django/contrib/auth/hashers.py
 @@ -36,14 +36,20 @@ def check_password(password, encoded, setter=None, preferred='default'):
@@ -48,23 +48,8 @@ index 1e8d754..4acb81d 100644
          return False
  
      hasher_changed = hasher.algorithm != preferred.algorithm
-diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
-index f3fb298..22fa80e 100644
---- a/docs/releases/2.2.28.txt
-+++ b/docs/releases/2.2.28.txt
-@@ -124,3 +124,10 @@ CVE-2025-57833: Potential SQL injection in ``FilteredRelation`` column aliases
- using a suitably crafted dictionary, with dictionary expansion, as the
- ``**kwargs`` passed to :meth:`.QuerySet.annotate` or :meth:`.QuerySet.alias`.
- 
-+CVE-2024-39329: Username enumeration through timing difference for users with unusable passwords
-+================================================================================================
-+
-+The :meth:`~django.contrib.auth.backends.ModelBackend.authenticate()` method
-+allowed remote attackers to enumerate users via a timing attack involving login
-+requests for users with unusable passwords.
-+
 diff --git a/tests/auth_tests/test_hashers.py b/tests/auth_tests/test_hashers.py
-index ee6441b..391b3cc 100644
+index ee6441b237f6..391b3cc9b41b 100644
 --- a/tests/auth_tests/test_hashers.py
 +++ b/tests/auth_tests/test_hashers.py
 @@ -433,6 +433,38 @@ class TestUtilsHashPass(SimpleTestCase):
@@ -107,5 +92,5 @@ index ee6441b..391b3cc 100644
  class BasePasswordHasherTests(SimpleTestCase):
      not_implemented_msg = 'subclasses of BasePasswordHasher must provide %s() method'
 -- 
-2.40.0
+2.34.1
 
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-39330.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-39330.patch
index 759716617a69..bb521be7b0b6 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2024-39330.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-39330.patch
@@ -1,8 +1,8 @@
-From 2b00edc0151a660d1eb86da4059904a0fc4e095e Mon Sep 17 00:00:00 2001
+From 44f8933ad6a969a6b509c31a7e46a2813d049d8f Mon Sep 17 00:00:00 2001
 From: Natalia <124304+nessita@users.noreply.github.com>
 Date: Wed, 20 Mar 2024 13:55:21 -0300
-Subject: [PATCH] Fixed CVE-2024-39330 -- Added extra file name validation in
- Storage's save method.
+Subject: [PATCH] Fixed CVE-2024-39330 -- Added extra file name validation
+ in Storage's save method.
 
 Thanks to Josh Schneier for the report, and to Carlton Gibson and Sarah
 Boyce for the reviews.
@@ -13,17 +13,17 @@ Upstream-Status: Backport
 https://github.com/django/django/commit/2b00edc0151a660d1eb86da4059904a0fc4e095e
 
 Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
 ---
  django/core/files/storage.py    | 11 ++++++
  django/core/files/utils.py      |  7 ++--
- docs/releases/2.2.28.txt        | 12 ++++++
  tests/file_storage/test_base.py | 70 +++++++++++++++++++++++++++++++++
  tests/file_storage/tests.py     |  6 ---
- 5 files changed, 96 insertions(+), 10 deletions(-)
+ 4 files changed, 84 insertions(+), 10 deletions(-)
  create mode 100644 tests/file_storage/test_base.py
 
 diff --git a/django/core/files/storage.py b/django/core/files/storage.py
-index ea5bbc8..8c633ec 100644
+index ea5bbc82d0e2..8c633ec040ed 100644
 --- a/django/core/files/storage.py
 +++ b/django/core/files/storage.py
 @@ -50,7 +50,18 @@ class Storage:
@@ -46,7 +46,7 @@ index ea5bbc8..8c633ec 100644
          # Ensure that the name returned from the storage system is still valid.
          validate_file_name(name, allow_relative_path=True)
 diff --git a/django/core/files/utils.py b/django/core/files/utils.py
-index f28cea1..a1fea44 100644
+index f28cea107758..a1fea44ded67 100644
 --- a/django/core/files/utils.py
 +++ b/django/core/files/utils.py
 @@ -10,10 +10,9 @@ def validate_file_name(name, allow_relative_path=False):
@@ -63,29 +63,9 @@ index f28cea1..a1fea44 100644
          if path.is_absolute() or '..' in path.parts:
              raise SuspiciousFileOperation(
                  "Detected path traversal attempt in '%s'" % name
-diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
-index 22fa80e..3503f38 100644
---- a/docs/releases/2.2.28.txt
-+++ b/docs/releases/2.2.28.txt
-@@ -131,3 +131,15 @@ The :meth:`~django.contrib.auth.backends.ModelBackend.authenticate()` method
- allowed remote attackers to enumerate users via a timing attack involving login
- requests for users with unusable passwords.
- 
-+CVE-2024-39330: Potential directory-traversal via ``Storage.save()``
-+====================================================================
-+
-+Derived classes of the :class:`~django.core.files.storage.Storage` base class
-+which override :meth:`generate_filename()
-+<django.core.files.storage.Storage.generate_filename()>` without replicating
-+the file path validations existing in the parent class, allowed for potential
-+directory-traversal via certain inputs when calling :meth:`save()
-+<django.core.files.storage.Storage.save()>`.
-+
-+Built-in ``Storage`` sub-classes were not affected by this vulnerability.
-+
 diff --git a/tests/file_storage/test_base.py b/tests/file_storage/test_base.py
 new file mode 100644
-index 0000000..c5338b8
+index 000000000000..c5338b8e668f
 --- /dev/null
 +++ b/tests/file_storage/test_base.py
 @@ -0,0 +1,70 @@
@@ -160,7 +140,7 @@ index 0000000..c5338b8
 +                ):
 +                    s.save("valid-file-name.txt", content="irrelevant")
 diff --git a/tests/file_storage/tests.py b/tests/file_storage/tests.py
-index 4c6f692..0e69264 100644
+index 4c6f6920ed2d..0e692644b7fd 100644
 --- a/tests/file_storage/tests.py
 +++ b/tests/file_storage/tests.py
 @@ -291,12 +291,6 @@ class FileStorageTests(SimpleTestCase):
@@ -177,5 +157,5 @@ index 4c6f692..0e69264 100644
          with TemporaryUploadedFile('test', 'text/plain', 1, 'utf8') as file:
              file.write(b'1')
 -- 
-2.48.1
+2.34.1
 
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2024-56374.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2024-56374.patch
index 3b86eacc4195..7cd7c09c72fb 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2024-56374.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2024-56374.patch
@@ -1,4 +1,4 @@
-From ad866a1ca3e7d60da888d25d27e46a8adb2ed36e Mon Sep 17 00:00:00 2001
+From bd4fcf0ed96b5a74a4143ab4d9e9391f6bf7122c Mon Sep 17 00:00:00 2001
 From: Natalia <124304+nessita@users.noreply.github.com>
 Date: Mon, 6 Jan 2025 15:51:45 -0300
 Subject: [PATCH] Fixed CVE-2024-56374 -- Mitigated potential DoS in IPv6
@@ -15,20 +15,18 @@ https://github.com/django/django/commit/ad866a1ca3e7d60da888d25d27e46a8adb2ed36e
 Signed-off-by: Natalia <124304+nessita@users.noreply.github.com>
 Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
 Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
-
-%% original patch: CVE-2024-56374.patch
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
 ---
  django/db/models/fields/__init__.py           |  6 +--
  django/forms/fields.py                        |  7 +++-
  django/utils/ipv6.py                          | 22 ++++++++--
  docs/ref/forms/fields.txt                     | 13 +++++-
- docs/releases/2.2.28.txt                      | 12 ++++++
  .../field_tests/test_genericipaddressfield.py | 35 +++++++++++++++-
  tests/utils_tests/test_ipv6.py                | 40 +++++++++++++++++--
- 7 files changed, 120 insertions(+), 15 deletions(-)
+ 6 files changed, 108 insertions(+), 15 deletions(-)
 
 diff --git a/django/db/models/fields/__init__.py b/django/db/models/fields/__init__.py
-index e2d1846..c77702f 100644
+index e2d1846ad625..c77702fdacae 100644
 --- a/django/db/models/fields/__init__.py
 +++ b/django/db/models/fields/__init__.py
 @@ -26,7 +26,7 @@ from django.utils.dateparse import (
@@ -59,7 +57,7 @@ index e2d1846..c77702f 100644
          return name, path, args, kwargs
  
 diff --git a/django/forms/fields.py b/django/forms/fields.py
-index f939338..b3156b9 100644
+index f9393383ed81..b3156b9877dc 100644
 --- a/django/forms/fields.py
 +++ b/django/forms/fields.py
 @@ -29,7 +29,7 @@ from django.forms.widgets import (
@@ -91,7 +89,7 @@ index f939338..b3156b9 100644
  
  
 diff --git a/django/utils/ipv6.py b/django/utils/ipv6.py
-index ddb8c80..aed7902 100644
+index ddb8c8091d2f..aed7902af919 100644
 --- a/django/utils/ipv6.py
 +++ b/django/utils/ipv6.py
 @@ -3,9 +3,23 @@ import ipaddress
@@ -139,7 +137,7 @@ index ddb8c80..aed7902 100644
          return False
      return True
 diff --git a/docs/ref/forms/fields.txt b/docs/ref/forms/fields.txt
-index 3a888ef..688890a 100644
+index 3a888ef6b752..688890a5fba6 100644
 --- a/docs/ref/forms/fields.txt
 +++ b/docs/ref/forms/fields.txt
 @@ -791,7 +791,7 @@ For each field, we describe the default widget used if you don't specify
@@ -176,28 +174,8 @@ index 3a888ef..688890a 100644
  ``MultipleChoiceField``
  -----------------------
  
-diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
-index 7096d13..0e092f0 100644
---- a/docs/releases/2.2.28.txt
-+++ b/docs/releases/2.2.28.txt
-@@ -105,3 +105,15 @@ CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text
- The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to a
- potential denial-of-service attack when used with very long strings.
- 
-+CVE-2024-56374: Potential denial-of-service vulnerability in IPv6 validation
-+============================================================================
-+
-+Lack of upper bound limit enforcement in strings passed when performing IPv6
-+validation could lead to a potential denial-of-service attack. The undocumented
-+and private functions ``clean_ipv6_address`` and ``is_valid_ipv6_address`` were
-+vulnerable, as was the  :class:`django.forms.GenericIPAddressField` form field,
-+which has now been updated to define a ``max_length`` of 39 characters.
-+
-+The :class:`django.db.models.GenericIPAddressField` model field was not
-+affected.
-+
 diff --git a/tests/forms_tests/field_tests/test_genericipaddressfield.py b/tests/forms_tests/field_tests/test_genericipaddressfield.py
-index 97a83e3..4c79d78 100644
+index 97a83e38aedd..4c79d7852aa5 100644
 --- a/tests/forms_tests/field_tests/test_genericipaddressfield.py
 +++ b/tests/forms_tests/field_tests/test_genericipaddressfield.py
 @@ -1,5 +1,6 @@
@@ -256,7 +234,7 @@ index 97a83e3..4c79d78 100644
              f.clean('12345:2:3:4')
          with self.assertRaisesMessage(ValidationError, "'This is not a valid IPv6 address.'"):
 diff --git a/tests/utils_tests/test_ipv6.py b/tests/utils_tests/test_ipv6.py
-index 4e434f3..1ac6763 100644
+index 4e434f3c3aa0..1ac6763d9b93 100644
 --- a/tests/utils_tests/test_ipv6.py
 +++ b/tests/utils_tests/test_ipv6.py
 @@ -1,9 +1,17 @@
@@ -311,5 +289,5 @@ index 4e434f3..1ac6763 100644
 +                    )
 +                self.assertIn(value_error_msg % addr, exception_traceback.getvalue())
 -- 
-2.40.0
+2.34.1
 
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
index 44e182057abb..3471a855c096 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
@@ -1,8 +1,8 @@
-From e88f7376fe68dbf4ebaf11fad1513ce700b45860 Mon Sep 17 00:00:00 2001
+From e8ff028d15324bd21b6378b539637d5c5eb3c4f1 Mon Sep 17 00:00:00 2001
 From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
 Date: Tue, 25 Feb 2025 09:40:54 +0100
-Subject: [PATCH] Fixed CVE-2025-26699 -- Mitigated potential DoS in wordwrap
- template filter.
+Subject: [PATCH] Fixed CVE-2025-26699 -- Mitigated potential DoS in
+ wordwrap template filter.
 
 Thanks sw0rd1ight for the report.
 
@@ -15,16 +15,14 @@ https://github.com/django/django/commit/e88f7376fe68dbf4ebaf11fad1513ce700b45860
 
 Signed-off-by: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
 Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
-
-%% original patch: CVE-2025-26699.patch
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
 ---
  django/utils/text.py                          | 28 ++++++++-----------
- docs/releases/2.2.28.txt                      |  6 ++++
- .../filter_tests/test_wordwrap.py             | 12 ++++++++
- 3 files changed, 29 insertions(+), 17 deletions(-)
+ .../filter_tests/test_wordwrap.py             | 11 ++++++++
+ 2 files changed, 22 insertions(+), 17 deletions(-)
 
 diff --git a/django/utils/text.py b/django/utils/text.py
-index 2c4040e..c474d56 100644
+index 02dd0891686b..e104b60c4f6c 100644
 --- a/django/utils/text.py
 +++ b/django/utils/text.py
 @@ -1,5 +1,6 @@
@@ -68,25 +66,11 @@ index 2c4040e..c474d56 100644
  
  
  class Truncator(SimpleLazyObject):
-diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
-index 7227452..7096d13 100644
---- a/docs/releases/2.2.28.txt
-+++ b/docs/releases/2.2.28.txt
-@@ -99,3 +99,9 @@ CVE-2024-27351: Potential regular expression denial-of-service in ``django.utils
- regular expression denial-of-service attack using a suitably crafted string
- (follow up to :cve:`2019-14232` and :cve:`2023-43665`).
- 
-+CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text.wrap()``
-+=========================================================================================
-+
-+The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to a
-+potential denial-of-service attack when used with very long strings.
-+
 diff --git a/tests/template_tests/filter_tests/test_wordwrap.py b/tests/template_tests/filter_tests/test_wordwrap.py
-index 02f8605..e6f2afb 100644
+index 02f860582ba7..f61842cb19aa 100644
 --- a/tests/template_tests/filter_tests/test_wordwrap.py
 +++ b/tests/template_tests/filter_tests/test_wordwrap.py
-@@ -51,3 +51,15 @@ class FunctionTests(SimpleTestCase):
+@@ -51,3 +51,14 @@ class FunctionTests(SimpleTestCase):
              ), 14),
              'this is a long\nparagraph of\ntext that\nreally needs\nto be wrapped\nI\'m afraid',
          )
@@ -101,7 +85,6 @@ index 02f8605..e6f2afb 100644
 +            "I'm afraid",
 +            wordwrap(long_text, 10),
 +        )
-+
 -- 
-2.40.0
+2.34.1
 
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2025-32873.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2025-32873.patch
index 701f9b574604..0d45c179bb72 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2025-32873.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2025-32873.patch
@@ -1,4 +1,4 @@
-From 9cd8028f3e38dca8e51c1388f474eecbe7d6ca3c Mon Sep 17 00:00:00 2001
+From ceb93eee32c9e9ad7e0fbaed725d6d54b09bf9d0 Mon Sep 17 00:00:00 2001
 From: Marc Deslauriers <marc.deslauriers@ubuntu.com>
 Date: Wed, 30 Apr 2025 10:34:27 -0400
 Subject: [PATCH] Fixed CVE-2025-32873 -- Mitigated potential DoS in
@@ -17,14 +17,14 @@ Upstream-Status: Backport
 https://github.com/django/django/commit/9cd8028f3e38dca8e51c1388f474eecbe7d6ca3c
 
 Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
 ---
  django/utils/html.py           |  6 ++++++
- docs/releases/2.2.28.txt       | 11 +++++++++++
  tests/utils_tests/test_html.py | 15 ++++++++++++++-
- 3 files changed, 31 insertions(+), 1 deletion(-)
+ 2 files changed, 20 insertions(+), 1 deletion(-)
 
 diff --git a/django/utils/html.py b/django/utils/html.py
-index 0d5ffd2..858a517 100644
+index 0d5ffd219baf..6eb8bc3dbf38 100644
 --- a/django/utils/html.py
 +++ b/django/utils/html.py
 @@ -37,6 +37,9 @@ _html_escapes = {
@@ -32,7 +32,7 @@ index 0d5ffd2..858a517 100644
  }
  
 +# HTML tag that opens but has no closing ">" after 1k+ chars.
-+long_open_tag_without_closing_re = _lazy_re_compile(r"<[a-zA-Z][^>]{1000,}")
++long_open_tag_without_closing_re = re.compile(r"<[a-zA-Z][^>]{1000,}")
 +
  
  @keep_lazy(str, SafeText)
@@ -47,27 +47,8 @@ index 0d5ffd2..858a517 100644
      # Note: in typical case this loop executes _strip_once twice (the second
      # execution does not remove any more tags).
      strip_tags_depth = 0
-diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
-index 3503f38..1676bbd 100644
---- a/docs/releases/2.2.28.txt
-+++ b/docs/releases/2.2.28.txt
-@@ -143,3 +143,14 @@ directory-traversal via certain inputs when calling :meth:`save()
- 
- Built-in ``Storage`` sub-classes were not affected by this vulnerability.
- 
-+CVE-2025-32873: Denial-of-service possibility in ``strip_tags()``
-+=================================================================
-+
-+:func:`~django.utils.html.strip_tags` would be slow to evaluate certain inputs
-+containing large sequences of incomplete HTML tags. This function is used to
-+implement the :tfilter:`striptags` template filter, which was thus also
-+vulnerable.
-+
-+:func:`~django.utils.html.strip_tags` now raises a :exc:`.SuspiciousOperation`
-+exception if it encounters an unusually large number of unclosed opening tags.
-+
 diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_html.py
-index 2f412e1..653deb2 100644
+index 2f412e103343..653deb2087e8 100644
 --- a/tests/utils_tests/test_html.py
 +++ b/tests/utils_tests/test_html.py
 @@ -92,17 +92,30 @@ class TestUtilsHtml(SimpleTestCase):
@@ -103,5 +84,5 @@ index 2f412e1..653deb2 100644
          # Test with more lengthy content (also catching performance regressions)
          for filename in ('strip_tags1.html', 'strip_tags2.txt'):
 -- 
-2.40.0
+2.34.1
 
diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2025-57833.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2025-57833.patch
index 9d4edb8d7c5b..c17df1b530b1 100644
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2025-57833.patch
+++ b/meta-python/recipes-devtools/python/python3-django/CVE-2025-57833.patch
@@ -1,8 +1,8 @@
-From 31334e6965ad136a5e369993b01721499c5d1a92 Mon Sep 17 00:00:00 2001
+From 6fb375254ac11840ec66cd6d1ffdc4dbd57af190 Mon Sep 17 00:00:00 2001
 From: Jake Howard <git@theorangeone.net>
 Date: Wed, 13 Aug 2025 14:13:42 +0200
-Subject: [PATCH] Fixed CVE-2025-57833 -- Protected FilteredRelation against
- SQL injection in column aliases.
+Subject: [PATCH] Fixed CVE-2025-57833 -- Protected FilteredRelation
+ against SQL injection in column aliases.
 
 Thanks Eyal Gabay (EyalSec) for the report.
 
@@ -15,16 +15,14 @@ https://github.com/django/django/commit/31334e6965ad136a5e369993b01721499c5d1a92
 
 Signed-off-by: Jake Howard <git@theorangeone.net>
 Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
-
-%% original patch: CVE-2025-57833.patch
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
 ---
  django/db/models/sql/query.py |  1 +
- docs/releases/2.2.28.txt      |  7 +++++++
  tests/annotations/tests.py    | 18 ++++++++++++++++--
- 3 files changed, 24 insertions(+), 2 deletions(-)
+ 2 files changed, 17 insertions(+), 2 deletions(-)
 
 diff --git a/django/db/models/sql/query.py b/django/db/models/sql/query.py
-index 9b054bd..96a6f5f 100644
+index 9b054bd10079..96a6f5fb5c8d 100644
 --- a/django/db/models/sql/query.py
 +++ b/django/db/models/sql/query.py
 @@ -1369,6 +1369,7 @@ class Query:
@@ -35,23 +33,8 @@ index 9b054bd..96a6f5f 100644
          filtered_relation.alias = alias
          lookups = dict(get_children_from_q(filtered_relation.condition))
          for lookup in chain((filtered_relation.relation_name,), lookups):
-diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
-index 0e092f0..f3fb298 100644
---- a/docs/releases/2.2.28.txt
-+++ b/docs/releases/2.2.28.txt
-@@ -117,3 +117,10 @@ which has now been updated to define a ``max_length`` of 39 characters.
- The :class:`django.db.models.GenericIPAddressField` model field was not
- affected.
- 
-+CVE-2025-57833: Potential SQL injection in ``FilteredRelation`` column aliases
-+==============================================================================
-+
-+:class:`.FilteredRelation` was subject to SQL injection in column aliases,
-+using a suitably crafted dictionary, with dictionary expansion, as the
-+``**kwargs`` passed to :meth:`.QuerySet.annotate` or :meth:`.QuerySet.alias`.
-+
 diff --git a/tests/annotations/tests.py b/tests/annotations/tests.py
-index 27cd7eb..cdffb07 100644
+index 27cd7ebfb826..cdffb0792009 100644
 --- a/tests/annotations/tests.py
 +++ b/tests/annotations/tests.py
 @@ -3,8 +3,8 @@ from decimal import Decimal
@@ -91,5 +74,5 @@ index 27cd7eb..cdffb07 100644
 +                        **{crafted_alias: FilteredRelation("authors")}
 +                    )
 -- 
-2.40.0
+2.34.1
 
-- 
2.34.1


