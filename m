Return-Path: <li.zhou@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDF7CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 07:43:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14637.1780472629940038327
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 00:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TH6ZLUoh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0614d7157f=li.zhou@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6537Jgj73683809
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Jun 2026 00:43:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=K2dAvQzh7
	X45rJ+7IRZu2sif8uG3zX9r2RvT09C5kuQ=; b=TH6ZLUohRzf4KtA5jSce7sKh2
	UNfylrTlWGx6KSFCTbIGR0w1xIsMvCKAbxjbXqD9Ci831pH6Qy5Dm0+8KXVwz/2W
	oJQRZV1JHyUNh2WzVzEzqXYHhiyzLkx36ofcjgEIORgfZf2PEiJBs6TbsgP1rkyX
	gp0AcHySDV6EkhrycYKOdmFyRdr00E0uALAelzXJxd+CF/rdMPgRrlagzULnarng
	EZo3xxP3wUyngDrP3Ljjnia8ZvtizU42rAagS9wiwaEPT3H3r9ZgYU2wtAOCLKQk
	mpA567EcejDnyL8Y2HK7zF/adBXtNugKzHOVXo/jjrDIcGKRa7YuSMjNuf1/Q==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013028.outbound.protection.outlook.com [40.107.201.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efydedxvs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 00:43:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amMDBCyQ0IigqXD0tKMUIfFmo5D7KJG91mELxdiuNi4KJcqZpG6aE8dpm1omQwXs3FGONeeEvfyheUlomx5zbXkPjRg9DpNXSYqAZt4UkRic7V+IujEGwR2+1TbaQvIg38Rg7cbdEyiErUCQb4Ph+0l+3zg9NUTW3BSWZyCbnWE6Biu3PP37Ng936CfXNH7JZOMfjlARyQqDlXyhWCHLJkrdY9e8AcgVQXeJrzla+c/0m5H30UrGkzfVErhUEuQj79K+7z64bvbm2Pa/HsZMe/GXluhSGtrnQFvbGsUqSP4l6mPzlt91T5XLuYuOqMWz0fcfKp2fMHyTpzR3mgpinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2dAvQzh7X45rJ+7IRZu2sif8uG3zX9r2RvT09C5kuQ=;
 b=erzWxg77UiPrfJzQQPP+CL8S9w7cmlmb/0/8/NaAOH3ekiCLqm+gZINiVoL9zDCZEAiU/TmCU3wnICvQ8nrjL8XZQKtyXCntIrLj3SowxxlmEOOvjqC6pYH4QSP20HDKVMvlXUJbm6ndWoM9zORfJcQLID6OItH4Xgu1J7sp6YI8oe1eHhsfhR7UAI8kQE4duEnyTWvcAetJoa9oC/+tNbklGjf5CujmSwuTDrXhtOAE+F2Ui8JwHXSda8kkOzcI4xufie/VnVkCuZX8TPfG4SlFl0E8R9DCtPpgCNu2H7YwjA1DvxiNQaJJWP+FiRnFYATQdr1BxHG236SZHWkCeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 by CH3PR11MB7795.namprd11.prod.outlook.com (2603:10b6:610:120::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Wed, 3 Jun 2026
 07:43:46 +0000
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae]) by SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:43:46 +0000
From: Li Zhou <li.zhou@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Li Zhou <li.zhou@windriver.com>
Subject: [oe][meta-oe][PATCH] minicoredumper: upgrade 2.0.7 -> 2.0.8
Date: Wed,  3 Jun 2026 15:43:26 +0800
Message-Id: <20260603074326.4009968-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0123.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::12) To SJ2PR11MB7453.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7453:EE_|CH3PR11MB7795:EE_
X-MS-Office365-Filtering-Correlation-Id: f23003a0-db83-425b-6c78-08dec143d770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|6133799003|3023799007|56012099006|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	/ruGOcE7+yB8hsIW22Dq3CKvXVVH8MOf9KPENmDoutVN4Mmhq+dxvtT3DvzzEjd32GMZLXv8pbuXiT6V3gMLYyqXFFmnhLRq+P9hR6419VAFVt3l/909m+B75vcr5QBzNsSpQZQdWMSgtC5IVIH4m1TM/I7Jg8VtIfDUuPkgBwQ+rhpmBBz03do8f9ba8aWIrlklXiAHvrOSRzd5X7BnclDJO1ZFSzrI8+qDRME6bjmbEr74w6OJHIn36mQQFsITuwcidI/Gg8SCEhBO/q4jXj1qMYzzx2p4hu3FIQ28POy6jFkTZ/dPEQ1r5LsQc3eVraTdc8CcH8J2DTKtdQ/ruBUNkHwzFQcTrhFdM+Bj+A8Jw8HxNmNxxv18LlsTI6qj9gcikLiaCtRRnYYGPsR2qaORpVzTXy3Er6813YpKNcK9BKNrbjliSHeM3DNBB0NPY/gFVZb6RxWukfb1rkR3MJ1HjCYMd7HwlASSuKLs2quE7TfQJvc3Xp+vkLKYjZZNO4rR1lKmVFnJ6IbNkMZ9PgH58EgC9M9ObiD2y8sZnPJQTAk3XFuYNjwjLSZ2In80GZp7YK1nnCKIX0631GG6CNtILnLa5zIm+PLT/o9GqIDDApQLieFMW6ZngzMj5X5dbO3A6i8/Mo3e7dSWH7rPq0T6IQqiaDs8DIltp3rr3J/uhv6MTWaygGUtwlXdDyIl+PMwhAkxM5q82DAbf7hKNA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7453.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(6133799003)(3023799007)(56012099006)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7U9OB6l1OdE++rJVzF75AbI43vAdLwl2jRNcr8xTgFyeZpkL2AuL/uhF3QCa?=
 =?us-ascii?Q?rwVHCe0N4SnA4IOB2mWNxGhI99szZYzRxCQ27B4NHbJw2rcgYkgyWwPlrEuM?=
 =?us-ascii?Q?dp6sW7qGCux+fqgEEwYmS1LcH8Vz2aHjx8CLb7B9UbZpFMIaIusDU8HF0RWy?=
 =?us-ascii?Q?Gs9oXaCHOl1hQlCUEmwkTGTxZbHk4vj4jEC9GA1oB7wywxAtN9Q/vBB3VH+7?=
 =?us-ascii?Q?LbQjGZVVCIEqKbtpuTQLlN05LIpv7p5twbz/ktRqX1z+YHb1rY7bVseXgKL7?=
 =?us-ascii?Q?3xF1hYl0AmHlRcpp4//5LpvpFp7Wib+y+B1XZcnsqoChkU498nrulIqFbHWX?=
 =?us-ascii?Q?0TglxE/tMzKwhmkHzziqDqGUO3bIOuDPr/CDE3vNeQTJZo7AZA1EfQwiz+dd?=
 =?us-ascii?Q?Y1dkWDxlNY2ahTzR51mpYaHejfid3oCVqC2B9crB4rTdqnkfQACfV4EPjO2B?=
 =?us-ascii?Q?AHGffa+KhRgetZ2jmF6JAlZHpbxNau3ALTudufnvMbbh8TTYRlyfs02GIeaa?=
 =?us-ascii?Q?/R33ll1Wpammxp/naY9UUO89ei2M4NVI7jIfrlZHT3/XVdXCY7aRnfGM/rNR?=
 =?us-ascii?Q?lfijhCDehV95u2HCjT/ykSJfQO5277OW+xCo30Y9RrCoR0cSKmT+Z+v+nTqO?=
 =?us-ascii?Q?t81wxpnZlDvmPA2f+p7YVTcr1x3Hu6QdUMauUOV0Xiu/eUPq4MhZFXGWdRu/?=
 =?us-ascii?Q?KsPhjPIaEkdVuB6RMoqFS03kv2hTW4gG4NiPkgtVvfUfr+uYkpBBlj4XfV8R?=
 =?us-ascii?Q?e+EWNXcHHsq3bTurcox1wu909InWqWijnZSSeNlvC1whkHvQ21bBBpWKQ2UI?=
 =?us-ascii?Q?l8et+h4kUTsjISZMqFwMqkBcop+zgz1SMlyGpAIIaiPOjOPi/tDiRwom5fo5?=
 =?us-ascii?Q?RayTsuSVJapLcC3jE5vRcZELaBXHymFe7kbpaLCet8RgbYmHHxg4vFSPGyYu?=
 =?us-ascii?Q?PnzRuFqQ/mDP+0zH0pJZ6SeKUADYJyU6/BKSXqlZmM9k1QkvwH2/1yBD7moL?=
 =?us-ascii?Q?oiUFuqzasHx/NAvhUPh8EO0Jz/77B6iGGzUhisOlGx7otG7W+ZsbhPjt8Uc0?=
 =?us-ascii?Q?A/TOKUSxWusOrf/KponPUrEmBQrkCHL30QDNEKlxOFtkM/eU3l+fAMB8q+Ec?=
 =?us-ascii?Q?PAXXnxRX6CHd58pPb7T2EV+YMdqeVWlqdniuZf6ydTqNbVsHZYxXP4faTZwf?=
 =?us-ascii?Q?v9aUnTysCu47y2nEQ8fhLgD9MyI0HGTG/t+ZliHEo7BftsWghh7wKUs8NKsr?=
 =?us-ascii?Q?NcjSo1VSPW+uo8NjdUcfaDURd3EU5pw5H1Pysz7mGt30OBFUam3TjH3cDnxD?=
 =?us-ascii?Q?Eq3UjR+DDw/63WMwiXYbu6sBgpiacI7JV4jmuwXmnweL+8VgMq4nnj6mL6pR?=
 =?us-ascii?Q?1vGvEGGsk5VNNPuk/G+P8fAyD+6KjT3llbYCrc53hA5uDIhVNUt+xCD1wE1u?=
 =?us-ascii?Q?cCbgID8w+qY/pGvXk3tZQnJz2dLWvknQvmz9bQvpKtugDdk/2Kytr2zgm3bC?=
 =?us-ascii?Q?5nF1FXkTbs5V3L9sKyhwf9mH/hFt9vYD5Ye3H5VU7c+6UlnUdn+gy1wwVh3F?=
 =?us-ascii?Q?sHvrIz6X44Wes+3uJyi263WZZmIdD9PICOfug1xUER159tTa+C71ryVLM8S7?=
 =?us-ascii?Q?VBEndz38KBjx3AbEMB4dk3+iAqVlKpIfKl7VQFdkL4yzq7vSPknG3FQ3oBpc?=
 =?us-ascii?Q?bfNRm2cTUZT6zg1KN98cZbw2M5327lD4DLyuAzGkK8g+uhoxxMMhL9xT8kao?=
 =?us-ascii?Q?/XIUhJOofQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	jze1TZmYx98AMuEa3uRXwERQrFWnmYYAtXKXJ4EoPm1tQ3L4gPPDe0yVbixrLTEpSGMs4IWrbipY7KXX1O0zQeKNfqMF1A/SFsIABvKs5oMjjfhREzjjxvpIntKEvK5g71oIs2vWU09IX7A2iIyn/1D2LU4w9zL6PNGW2PXOsmq3AiXEBK66kFYVvle0FCTef+z71kEnQz5a0zZBbTJZKT/tbQCtCdaDUGO41zD17uHbXgz3GCFO3cVmsjnO+L+4JNmCSSyC5L2XGBiY2Ef5S0Pok2aUY0cNBO7NLkwe7F+88Ktdaog0lrM/RWOctWPcW/+fArhEuBUFUVDxuIAdnA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f23003a0-db83-425b-6c78-08dec143d770
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7453.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:43:45.9136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJT2ZawtrzJO3XC2ZBuNofAoa5HwRK6fK5eBeKL6AOPE1N7YUtplx0u5wv9w9AEAkPwQGMYUKadZQLd9cE+Zdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7795
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA3MiBTYWx0ZWRfX1UfY0b65Nkrf
 zCNMSQ2f2gJSxzhp9v5mYo2lSBTmUJa/6/eyyiMNBiQH6XxtX+BGYB45rWcSR4FD4u8K49t2sXk
 jTtSZumaJPqXiprW0+9eCcuxUcnd+WKuhwzhk2r3dy06+suPWT/yN/DAotdnV4zAmgoOmnds7Ij
 O83wgwhgUaPVpQOR6T9w2Ldq1mTf2DBG8P1N2ZeU5433sLH43rRCvD+/xhuntGM9jGue875Nfub
 vepi8pE/MBHseQ68UetUG43klf69o/V8BQzUj0soBkzknvhq8CrrDn4z+6d0x0aBsj8gJYPRV5Y
 DT0stIjwTudAKO0H2xpDs2e5/KToN67f7PzUKaBcbdLBumV8lsFxXisSjteSP6BTgyKKmS7OMjQ
 FQDxnfKGtuen0WKf1yk+9LKUY1XDSLHlzySDaMvnZSdbmP157wP9cLbMVmNQgILv12bFMV2lWRu
 GM17kdx2JclECWw/jKw==
X-Proofpoint-GUID: rYaRYFUruQlScvlcagbLwT4dB9KXhVaF
X-Authority-Analysis: v=2.4 cv=Iq0utr/g c=1 sm=1 tr=0 ts=6a1fdb35 cx=c_pps
 a=bKR93RD0qenpecP8xHJc8w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=xNf9USuDAAAA:8
 a=NEAV23lmAAAA:8 a=hcxzT4NMAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=2Pl-_WghtfgcDIha2OMA:9 a=3w6iy9BqfFbDrj__1GvT:22 a=qTCd_7tRWm03b--9HkOK:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: rYaRYFUruQlScvlcagbLwT4dB9KXhVaF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 07:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127374

Upgrade minicoredumper from 2.0.7 to 2.0.8.
Remove below patches because they have been merged by 2.0.8
upstream version:
0001-corestripper-Fix-uninitialized-warning.patch
0002-Fix-2038-year-problem-in-timestamp-handling.patch
0001-coreinject-fix-assignment-of-const-qualified-type.patch

Changelog:
===========
* Address multiple compiler warnings and errors found by more recent
  toolchains. The issues existed technically, but were not a problem
  for real-world usage scenarios.

* Relocate the man pages for sbin binaries to section 8.

* Fix timestamp value in the core dump directory name for 32-bit
  systems with a 64-bit time_t definition after 2038-01-19.

* Improve status query for init script to check core_pattern usage and
  handle when the regd daemon is not enabled.

* Known problems:

    - If tar is active, core files larger than 8GB will be
      truncated. If it is known that the core files will be >8GB and
      the full core file is needed, tar must be disabled.

License-Update:
The COPYING changes in upstream commit 941079541a
update Copyright end dates to reflect when changes were last committed.
The COPYING.LGPLv2.1 change in upstream commit 00e3b2fdf7 replaces
the FSF postal mailing address with a URL as recommended by the GNU FAQ.
No license change, no impact on the recipe licensing.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...x-assignment-of-const-qualified-type.patch | 44 ---------------
 ...restripper-Fix-uninitialized-warning.patch | 53 ------------------
 ...8-year-problem-in-timestamp-handling.patch | 55 -------------------
 ...umper_2.0.7.bb => minicoredumper_2.0.8.bb} |  9 +--
 4 files changed, 3 insertions(+), 158 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-coreinject-fix-assignment-of-const-qualified-type.patch
 delete mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-corestripper-Fix-uninitialized-warning.patch
 delete mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0002-Fix-2038-year-problem-in-timestamp-handling.patch
 rename meta-oe/recipes-kernel/minicoredumper/{minicoredumper_2.0.7.bb => minicoredumper_2.0.8.bb} (80%)

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-coreinject-fix-assignment-of-const-qualified-type.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-coreinject-fix-assignment-of-const-qualified-type.patch
deleted file mode 100644
index ace46202b7..0000000000
--- a/meta-oe/recipes-kernel/minicoredumper/files/0001-coreinject-fix-assignment-of-const-qualified-type.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 07023a2d2ef059a039fef83ee4b33a7e47ca8e3e Mon Sep 17 00:00:00 2001
-From: John Ogness <john.ogness@linutronix.de>
-Date: Tue, 24 Feb 2026 11:33:40 +0106
-Subject: [PATCH] coreinject: fix assignment of const-qualified type
-
-coreinject fails to build with glibc 2.43.
-
-The issue is due to a new glibc feature:
-
-* For ISO C23, the functions bsearch, memchr, strchr, strpbrk, strrchr,
-  strstr, wcschr, wcspbrk, wcsrchr, wcsstr and wmemchr that return
-  pointers into their input arrays now have definitions as macros that
-  return a pointer to a const-qualified type when the input argument is
-  a pointer to a const-qualified type.
-
-The fix is trivial since the returned strrchr() value is only used in
-a way compatible with const pointers. The data type was simply defined
-incorrectly.
-
-Reported-by: Aurelien Jarno <aurel32@debian.org>
-Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1128695
-Signed-off-by: John Ogness <john.ogness@linutronix.de>
-
-Upstream-Status: Backport [https://github.com/diamon/minicoredumper/commit/eb66f10ae26edf94bf41d513ce90a4eb1e0f11b3]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/coreinject/main.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/coreinject/main.c b/src/coreinject/main.c
-index faf8edf..198485d 100644
---- a/src/coreinject/main.c
-+++ b/src/coreinject/main.c
-@@ -240,9 +240,9 @@ static int inject_data(FILE *f_core, FILE *f_symmap, const char *b_fname,
- 	struct ident_data indirect;
- 	struct ident_data direct;
- 	const char *ident;
-+	const char *p;
- 	FILE *f_dump;
- 	int err = 0;
--	char *p;
- 
- 	/* extract ident name from file path */
- 	p = strrchr(b_fname, '/');
diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-corestripper-Fix-uninitialized-warning.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-corestripper-Fix-uninitialized-warning.patch
deleted file mode 100644
index 8b90d33e1b..0000000000
--- a/meta-oe/recipes-kernel/minicoredumper/files/0001-corestripper-Fix-uninitialized-warning.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From bb44bb643cd2a2f937331b4d1a76b03556b718a2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 23 Jan 2024 11:36:41 -0800
-Subject: [PATCH] corestripper: Fix uninitialized warning
-
-Clang finds more open paths where ret can be uninitialized
-
-Fixes
-| ../../../git/src/minicoredumper/corestripper.c:2768:13: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
-|  2768 |         } else if (di->core_fd >= 0) {
-|       |                    ^~~~~~~~~~~~~~~~
-| ../../../git/src/minicoredumper/corestripper.c:2773:9: note: uninitialized use occurs here
-|  2773 |         return ret;
-|       |                ^~~
-| ../../../git/src/minicoredumper/corestripper.c:2768:9: note: remove the 'if' if its condition is always true
-|  2768 |         } else if (di->core_fd >= 0) {
-|       |                ^~~~~~~~~~~~~~~~~~~~~
-| ../../../git/src/minicoredumper/corestripper.c:2763:9: note: initialize the variable 'ret' to silence this warning
-|  2763 |         int ret;
-|       |                ^
-|       |                 = 0
-
-Upstream-Status: Submitted [https://github.com/diamon/minicoredumper/pull/15]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/minicoredumper/corestripper.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/minicoredumper/corestripper.c b/src/minicoredumper/corestripper.c
-index 3eb9089..e9e3936 100644
---- a/src/minicoredumper/corestripper.c
-+++ b/src/minicoredumper/corestripper.c
-@@ -2707,7 +2707,7 @@ static int dump_data_content_file(struct dump_info *di,
- 	char *tmp_path;
- 	FILE *file;
- 	int len;
--	int ret;
-+	int ret = -1;
- 
- 	len = strlen(di->dst_dir) + strlen("/dumps/") + 32 +
- 	      strlen(dd->ident) + 1;
-@@ -2760,7 +2760,7 @@ out:
- static int dump_data_content(struct dump_info *di, struct mcd_dump_data *dd,
- 			     const char *symname)
- {
--	int ret;
-+	int ret = -1;
- 
- 	if (dd->ident) {
- 		/* dump to external file */
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0002-Fix-2038-year-problem-in-timestamp-handling.patch b/meta-oe/recipes-kernel/minicoredumper/files/0002-Fix-2038-year-problem-in-timestamp-handling.patch
deleted file mode 100644
index 977f59b976..0000000000
--- a/meta-oe/recipes-kernel/minicoredumper/files/0002-Fix-2038-year-problem-in-timestamp-handling.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 0f80d5813679320b69ae1d2aefb58af1e0e2d269 Mon Sep 17 00:00:00 2001
-From: Jiaying Song <jiaying.song.cn@windriver.com>
-Date: Wed, 10 Dec 2025 14:22:00 +0800
-Subject: [PATCH] Fix 2038 year problem in timestamp handling
-
-The minicoredumper uses 'long' type for timestamp which causes
-overflow on 32-bit systems after 2038-01-19. This leads to
-incorrect timestamp formatting in core dump directory names.
-
-Change timestamp variable from 'long' to 'time_t' and use
-'strtoll' instead of 'strtol' to handle 64-bit timestamps
-properly on 32-bit systems.
-
-Upstream-Status: Submitted
-[https://github.com/diamon/minicoredumper/pull/24]
-
-Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
----
- src/minicoredumper/corestripper.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/minicoredumper/corestripper.c b/src/minicoredumper/corestripper.c
-index e9e3936..e52802e 100644
---- a/src/minicoredumper/corestripper.c
-+++ b/src/minicoredumper/corestripper.c
-@@ -617,7 +617,7 @@ static int init_di(struct dump_info *di, int argc, char *argv[])
- 	if (*p != 0)
- 		return 1;
- 
--	di->timestamp = strtol(argv[5], &p, 10);
-+	di->timestamp = (time_t)strtoll(argv[5], &p, 10);
- 	if (*p != 0)
- 		return 1;
- 
-@@ -3715,7 +3715,7 @@ static int do_all_dumps(struct dump_info *di, int argc, char *argv[])
- 	bool live_dumper;
- 	char *comm_base;
- 	pid_t core_pid;
--	long timestamp;
-+	time_t timestamp;
- 	char *comm;
- 	char *exe;
- 	char *p;
-@@ -3750,7 +3750,7 @@ static int do_all_dumps(struct dump_info *di, int argc, char *argv[])
- 	if (*p != 0)
- 		return 1;
- 
--	timestamp = strtol(argv[5], &p, 10);
-+	timestamp = (time_t)strtoll(argv[5], &p, 10);
- 	if (*p != 0)
- 		return 1;
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.8.bb
similarity index 80%
rename from meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
rename to meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.8.bb
index ff4fdf358e..ed8085b73a 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.7.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.8.bb
@@ -2,23 +2,20 @@ SUMMARY = "minicoredumper provides an alternate core dump facility for Linux \
 to allow minimal and customized crash dumps"
 HOMEPAGE = "https://www.linutronix.de/minicoredumper/"
 LICENSE = " LGPL-2.1-only & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=71827c617ec7b45a0dd23658347cc1e9 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=be36ac4e46b05b190e6b9d3ec415aa63 \
                     file://COPYING.BSD;md5=b915ac80d5236d6aa659cb986daf00e5 \
-                    file://COPYING.LGPLv2.1;md5=321bf41f280cf805086dd5a720b37785 \
+                    file://COPYING.LGPLv2.1;md5=3254c7b4d4712a396bd036bfb211a908 \
                    "
 DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux json-c"
 
 inherit autotools pkgconfig ptest systemd update-rc.d
 
-SRCREV = "ca6e7ad62b4cf984de84aa081024c4e45632cecb"
+SRCREV = "dd1d6044ab6e255b7aadbe7a80eebd6a4eaa0469"
 
 SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
            file://minicoredumper.service \
            file://minicoredumper.init \
            file://run-ptest \
-           file://0001-corestripper-Fix-uninitialized-warning.patch \
-           file://0002-Fix-2038-year-problem-in-timestamp-handling.patch \
-           file://0001-coreinject-fix-assignment-of-const-qualified-type.patch \
            "
 
 
-- 
2.34.1


