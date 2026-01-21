Return-Path: <liwei.song@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4BBD262B2
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 05:18:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5739.1768972729074917794
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 21:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F8B1huMs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5481349422=liwei.song@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L4X4C71868480
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 21:18:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Kf0xTpP7m
	Z8GO7K9aB9r8FFGSb/itj9cLULwnHHwln0=; b=F8B1huMs2r/nnFfXOy0x87Ohw
	VgPmWHjlXnTaFMUUfJ8V+fUv9rP9VlW1h3j4ANwiHAxh6F9jGGwpOnGIREEh9JAh
	qxtA/hwBaNSL8QkqclB2qcKpGxDhEtLvp9NWP5El6BAbDCaYPvHlLYMHlfDQTGQC
	A4NMDZrxxzEY3T98fwNapd9NjB1Rm3isqe+rt9ZnHpSEBAkL39bhVGKa43niiLU4
	m7ou4pSZ69hkDSGsrfsuDp9hHJxqCJS7VB47DVWFHL4NVr4e6Y1wjQdmNdDgXWx/
	v8hMops+Bui2P6dPmR/2tj853AXC2M0NaNTjIzIng97KkXagEUbRFatT7rSBQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011035.outbound.protection.outlook.com [52.101.52.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btnd704qg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 21:18:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrfR727tO0U3vp2XHMvDYqzn4CyihdTKMzNEsLR665uXMGSqTi0PIN1GB6ZZv2QbxLnEOlmy+w17F8QtQcO/qpPDOGkw05rqCviG5QxZEvpwN51CC4W+EAL4ttFp/OHEG6Ez41DhldlJDD5EJQLKPHdLWl6hrrXZWuNJqdFzS7miX78h3yWN2wgJImyfQV6QwK4uMmU6XAZ7jeG17v6f1D5n8MWCobgjYThHzPuEK7EjQdporgtMwB9nQSKyNWyZrqBxpPRDFW9JsTKko5+1xBWpOy80MxpiRO1jGAYR/+Fz2BqGccvOSUXl/wBftEIF/5s5loqfFPx1zVAgA3xJNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kf0xTpP7mZ8GO7K9aB9r8FFGSb/itj9cLULwnHHwln0=;
 b=ODzJ3ysUM19Nt/j7eMdlj+uq5p5O7Dh8Ri0INIg2btP/ta07fMdyYdh2OeYaX1WNkaKjYBjEroL393RLyfhhgDY9ytxSFP40qaRqIipAkR5ai9d16jliR75jneVTYexmct0G1QXY1918LHzADpMmTCe+wbj98dSfuBHtt/56OIZe5IvgTm3ku12DosG6P9mrCkJnl3ax6li+RGmv0zpPbVM+nHDvcdVUm/OZ6PiUF9Wc+JMHZDTCiEz/YAd7TfoVnX+P2mT2L4aNUQyN6nHSsKu+123FkanqwKtGwkU+ndTGgaezUCT6mFdFcmedvScivCfIXxtMBxmBHunWu/y9Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 by LV8PR11MB8488.namprd11.prod.outlook.com (2603:10b6:408:1e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 21 Jan
 2026 05:18:45 +0000
Received: from SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::ead3:517f:5eae:ecf1]) by SN7PR11MB6971.namprd11.prod.outlook.com
 ([fe80::ead3:517f:5eae:ecf1%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 05:18:45 +0000
From: Liwei Song <liwei.song@windriver.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: liwei.song@windriver.com
Subject: [oe][meta-oe][PATCH 1/1] tmon: add a new recipe to generate tmon
Date: Wed, 21 Jan 2026 13:18:29 +0800
Message-Id: <20260121051829.619440-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:3:18::36) To SN7PR11MB6971.namprd11.prod.outlook.com
 (2603:10b6:806:2ab::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6971:EE_|LV8PR11MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: d1907098-fd50-491a-57c8-08de58ac8cf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pY+pAH+t08eFoGgme57g2EY54rh/WuIyIkhk/VWfS8ljShoO97WBQT85gDJ4?=
 =?us-ascii?Q?+zJzjJJyiaR11uejp/DzrySKCzBr61LfiReLjPWDDHIAlksaf9qJMaWtF1j1?=
 =?us-ascii?Q?loLIeX0e4PeoC3POQVPfqRnq0gtJiTxhm+ARGjMjdz7W8n8XuzAvQAonQEgY?=
 =?us-ascii?Q?lSfENTpFWdbtXKe7OdqRzIkYLWbe8SjURIbxFRznQdHTUUuFDZntQ2qSJmlj?=
 =?us-ascii?Q?4o8F/doKAImdeO9YFn60qs+5p91IwZrYWNvg9e+TLe74brFOtOAuUr5g3pPr?=
 =?us-ascii?Q?qAJDYAklzkHLjtqLwhPXMPx2kSq1rBSwcSGVDMdf2f2LTF92v7pKNs2PiUsR?=
 =?us-ascii?Q?EPpraQmqS9CG75Nz07HYj1hDbBr1k6QgugL0rLJHXrQw8q38RGbpTQJV+fGN?=
 =?us-ascii?Q?DLkPlhlqawBJjlRQ/ohsOOF3Xl7OV2UJNW/u4bIuW3pwlSTni8GcElf+lMOI?=
 =?us-ascii?Q?OeaXDnUKzouvM/iHzQ8L8aza4DjAuNDsxQQM6mAleUPe9shmJdoxH0BXqURs?=
 =?us-ascii?Q?2TwYVO5eBmm0BSpl3bX6UmNP2M8RXoWjvrTTibV3SICGM589dTbM6M8dCGUd?=
 =?us-ascii?Q?n2gn/W/yjNC+QnpXCp/1I0OJ/GARwDj3TTeYlK6KRxfNqdsZbeAMV5VbNoGc?=
 =?us-ascii?Q?OmBXwI8WJln3+/d7Pisc9Xo7Wp/3t/ynMNrahS3rw7IRLZqOVq08Q0GhXn3s?=
 =?us-ascii?Q?DjbQNul73W4ZTJBmtVGJziPR1MBDrtwsxo/iJlssWQmsZdaC3JjEYDYKxOxE?=
 =?us-ascii?Q?7lx8T7hzqM4HzuXRGP1iqKCWzTT8lZiOgqKhL5QFYUGtVRWmisB3f83N2HrZ?=
 =?us-ascii?Q?LLMKb17k5xpM1XFQa8j3STwdsSoqICvhTCsLNcE70NB9vxFiD7jk8zkSxlJE?=
 =?us-ascii?Q?eHPxnG0piGDoFwph+rY2vJb8zzmWo4oYrIXRO24TqaTZvTlxwywTygDPPE0H?=
 =?us-ascii?Q?wccnGmiO3jUtgy1iRISK25znFRkHVAy59KZ6C4l9/qRnjH4n8wzYeyyJnC34?=
 =?us-ascii?Q?x2LXxiYIAV3ZZzzbrg148d6AXjnBIw7N23yZjOqvmfwV0qb/vV9spp26nQbz?=
 =?us-ascii?Q?1EjEbvEJ2KIC/qjl81okfxJJMahE0LMK7wQbLwg/DgJ9YAYPSuV4UplhK+m5?=
 =?us-ascii?Q?FbL5DkhJecjapRCVhI88X+taCqjOPdWBmZFRz1wGoaPeruKt5h6qiusydpSy?=
 =?us-ascii?Q?HF3a/jgbYEICbMIyc9D/grCkutBPi28XTrYnSbnlilmTJ/oGKnfOAT/B73xl?=
 =?us-ascii?Q?PjpiKOQnaiJMzP6R1ds9KGy942glGdSafTgnv4DR1DK6OrwCPGK2Avnnf9ch?=
 =?us-ascii?Q?gcvRWHQJlrxvycyTPWp1kNBheVohDxZWzCiSg9B8gKNura3BMxJKwGQNQjzK?=
 =?us-ascii?Q?cUrObhVcJnN/RjlS5sR6L132SFbpg3KMaZtfurBLRsrHybs2cim7++fycPuy?=
 =?us-ascii?Q?ASfHheQKPrrFbE3fKqaDi62ENBkuy8h7AI6530YdA8KPY4kIUDYUsPi5kFdJ?=
 =?us-ascii?Q?x04Sh9R/M2Lpi0QQi2vyeSzbg0OpyGqdFm70lzzAlPqAkS2zkTOXb2eO8il9?=
 =?us-ascii?Q?NSdZvTQ1l8ZhHjdI4cCDvdmIHF0jQOkaCAERIWIAtcBfzOjjio8Vj84SNx89?=
 =?us-ascii?Q?B/oHEJRyOHGnkpCzAdB3ruY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q4CxO3xAWzKz2dfajW1lhqkomfNdwJRVnqPHnvQHubFg7UqqbeWIzF7ULfeY?=
 =?us-ascii?Q?DLrxJAuSiqTJmCOGsaCBcxI1aVqxUVuaO+KhYD5VEvGhuPM8ppZwZ9hmeyEG?=
 =?us-ascii?Q?i2yN/R2ISXmXwUIjozm5xqpWzZOwk2Pjj+uENCkgqlhAYXldxjSjjQiSOFkc?=
 =?us-ascii?Q?bJm9UrTRB/3Tx0ax6pzb7VBe7xls5sdJZbIqQj1lmdCnd1n/7RsG9UEoATOv?=
 =?us-ascii?Q?P3gb1XLTvreK3+oQXv5cwL67BJQ07aBwA7vXDsZUzLvWkpaYJFgsd3NymZe1?=
 =?us-ascii?Q?WD5W7iYqJqFq3SgKY/yZLGwI7sp+YJkHyo2IgmwdBFHE3sbQSn52svhU30ou?=
 =?us-ascii?Q?KYHtKH6u0wCCXw2VjrtDUg53fpWg/emOKODLuWGGGhBMYpv5Pb7CPLfpi7Qr?=
 =?us-ascii?Q?bk4nBDFRnX/4OH7LxWPKAkdoRac4O2sFg8JME9gDNLY0varPKlHXpfP6najS?=
 =?us-ascii?Q?wgUbXakWw18B2/7bQ2HZXr0G2Hk+VBpoaD/nem6ieBkK7S+5pQZP/zFGxl2J?=
 =?us-ascii?Q?j3l3qcBg6krMSPSdUeokSAs/0HoGx+fYN9I/rCE12trB0XMR+/Ix3S8Ea0YW?=
 =?us-ascii?Q?HLmy2DRn5BFD1k/IJ5iZFg1Jtxq1zQvxwN8eQ90d/WGCRT0WViDEeN6FcXge?=
 =?us-ascii?Q?6yky6BtraW7eiyEIWzxT8P0JK5/6xcKSZblRXV9BycTFFUVsTp5KsPEZkVRI?=
 =?us-ascii?Q?cngOoT+J7zx/vd0cOJ3JJHWuwh6USbR3Idkf7SyCYzsL8sQ6cL49I2LHmdg0?=
 =?us-ascii?Q?n+7Q6o6crNot1icnxbKkG50IhuZCQTqCNxKhgUJtRu4ygd0yBD6WFmjVs1xz?=
 =?us-ascii?Q?r+ZuhRczTfUintZibLDhRHaZvN4ywMG1+gWkRyKjuno9lwZe2eltqVnMzQ2A?=
 =?us-ascii?Q?xtqEqslv9xeKbVBIOtONrvNfeZZ5b+Kw62kf2X4A0IZOgLWUcY4sWQwqL8aq?=
 =?us-ascii?Q?ntsyh2o4bY9QCCTpRKHfFaSiJaByRxLbwIQ3eAqqniV7RVIO4jiU+sGGOiQ6?=
 =?us-ascii?Q?PcN32JcVrXzTXgJaWFEnDnkACeFfPhm9CJoGnYZRf+WjOI+6K2T9Ie54bmko?=
 =?us-ascii?Q?yYWE6QVUHu6hO5aFf2r3tF3QKw8heNSaW04FeZA4sq5eii9CDCEKm/SNq94N?=
 =?us-ascii?Q?evotr4X+Zlg56SkrbU0GSXTHfNUf2jA87tfVumWatuXZhkbPzNYU4MXC1fW5?=
 =?us-ascii?Q?ymv7wuMYwDmNf+tOZqbsnO1u+Pdt3Xz+bsc10O08LQ+IYWLVrxAqYfXlAMxT?=
 =?us-ascii?Q?1eyMh9TL9rmJlQQbHyqOjwKl1+ZVxX5OpDoMsscI1sqeOeL04HCd1vX1O4Oc?=
 =?us-ascii?Q?LVSf/hnakOAQS8BXGfIhtljK8aB/CRcS1OPc8/SxQoTwrgKCsqTGpeMJ9Nmj?=
 =?us-ascii?Q?aVi+CN2rKSuxb6pQtDYMBUVnCNbrXbnP1nFpgc3oAB9/aPr7WtPzVlYbh1JA?=
 =?us-ascii?Q?GyImH3sAwBta/ZEs0w2K9GZDAJMXwSRSntpcsz30NFwb+6LM4ZZf7rtMI5Bm?=
 =?us-ascii?Q?NugsfGyH0vU95c1I5kddyM7AzdEZJFKAiSy7gRySHJ86dT4RIDicyoFHFIUT?=
 =?us-ascii?Q?1kIVplopyYo85RzYXhkPI6D3bd6Vza97pcQjhzkCoHXg4ONl65NYGvDc7HZG?=
 =?us-ascii?Q?rIrhJIlCefw3xQufnJTl42Gn3vlQXdwo33J4cWSUSzr1j80RXC5t/3aZnRCo?=
 =?us-ascii?Q?jGjYF83Ml7i+iLqhFNQlggvdMvglDP4cG/tDFbsrfJ5jVKrfh90PFXy6kxjO?=
 =?us-ascii?Q?bhEZlCjWiQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1907098-fd50-491a-57c8-08de58ac8cf1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 05:18:45.8209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZmIR/l/S7wP3urX/KHCNqi2c7QbJvbk4zPcjj7xWahmvYE+unmYXJMB6gDHy89ej8Qflw6YYPkR2TZVVi+WneQdKJyiHAy7N0Qpn2sdESE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8488
X-Proofpoint-ORIG-GUID: bKF_Ti3IZ8dTMvifU3PkgBJNMsUO3S37
X-Proofpoint-GUID: bKF_Ti3IZ8dTMvifU3PkgBJNMsUO3S37
X-Authority-Analysis: v=2.4 cv=U++fzOru c=1 sm=1 tr=0 ts=697061b8 cx=c_pps
 a=2EogD3SZGC0twO92opjmhQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=20ktE8LvIXl5Kcjd:21 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=21zWm_rR9sWP73mh9m4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA0MSBTYWx0ZWRfX5cS2MjGyb5uD
 VG8X0A5XLD5IntLS6v5w2o1N1tnmWID7W7hZTA1QoO7xttafhFmrpQ0hV+Fxb5/YtrehRgcSQcj
 PZFRgHhksznAkWvklxQ6u912V1kd5jmvz94ypjZIjsNrGqg4DY6HwK1ZF/1BYrlpQQJT0an5krk
 HbekKOXvV0z+Y7xSnxen9+jySmJABg1HsOgafDqVoMhdgbHO34BUmxkc+AU5EyTSLVDhKrgPvlG
 NMXTm6AiAwLiB0qwZDJOCfgSul0YK9STOpSkZKEYw2MWqJ0TDCBizo72ua5yXahIIw0PhWlC1Sc
 5BO8ajACFrK2fwYuVWNsx+mapmvJ7BgVK9PaM8C+m2O7z65SQ10frXz3IrsyyKiibKZjVWCy5p/
 iESAQtrcnp9tw7/H4vp3+GFKL2CmU9SSwGCee8bwtkhtasQ9TDPGy2vWpjPAkVj4+vCp7EkmiCB
 VZ/21jA+y21ro8ImzAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 05:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123682

tmon is a monitoring and testing tool for Linux kernel thermal
subsystem, it help visualize, tune, and test this complex system.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta-oe/recipes-kernel/tmon/tmon.bb | 40 +++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/tmon/tmon.bb

diff --git a/meta-oe/recipes-kernel/tmon/tmon.bb b/meta-oe/recipes-kernel/tmon/tmon.bb
new file mode 100644
index 000000000000..4911f445c559
--- /dev/null
+++ b/meta-oe/recipes-kernel/tmon/tmon.bb
@@ -0,0 +1,40 @@
+SUMMARY = "A Monitoring and Testing Tool for Linux kernel thermal subsystem"
+DESCRIPTION = "TMON is conceived as a tool to help visualize, tune, and \
+test the complex thermal subsystem"
+
+LICENSE = "GPL-2.0-only"
+
+DEPENDS = "virtual/kernel ncurses"
+
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
+# This looks in S, so we better make sure there's
+# something in the directory.
+#
+do_populate_lic[depends] += "${PN}:do_configure"
+
+
+EXTRA_OEMAKE = '\
+		CC="${CC}" \
+		-I${STAGING_KERNEL_DIR}/tools/thermal/tmon \
+'
+
+# If we build under STAGING_KERNEL_DIR, source will not be put
+# into the dbg rpm.  STAGING_KERNEL_DIR will exist by the time
+# do_configure() is invoked so we can safely copy from it.
+#
+do_configure:prepend() {
+	mkdir -p ${S}
+	cp -r ${STAGING_KERNEL_DIR}/tools/thermal/tmon/* ${S}
+	# Fix compile error when pkg-config is on the dependency chain:
+	# tmon.h:42:17: error: field 'tv' has incomplete type
+	sed -i '/PKG_CONFIG.*--cflags.*ncurses/d' ${S}/Makefile
+}
+
+do_compile() {
+	oe_runmake STAGING_KERNEL_DIR=${STAGING_KERNEL_DIR}
+}
+
+do_install() {
+	oe_runmake INSTALL_ROOT="${D}" install
+}
-- 
2.40.0


