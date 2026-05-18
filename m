Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7578CD4F58
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 17:14:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2397.1779124457186812968
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2026 10:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=NeER8dDW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95986d85e0=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IEGJlS1524251
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 10:14:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=mbap7ZjPX8PqqsN8+fkEpicC6cLvxRk9JCo/ZT+hdKs=; b=NeER8dDWHiY/
	8aTzDj4HIDDLlkjtozsAsdX4hPYJ8Hj7ap6gQeo78kwa5g9ujcu5n97ZQDVAiGC5
	nHFDo/0nvYZf6QCKxHpYr+xk7NbxXxk825ptGZ0qRY1ALRO6s+0FfuGIhwhtmN5U
	z3h4glFKaTjs8HWpwO+8E9DvPTfIZD8Tb3J2rOUq4FFA8qKiRiVAlGNGFsuq++VV
	HqGDG4cZ9dfliBGn8sj7OKj37bK/As+VO06mBkIWZcWDUrkN2K2jg8tDuRbPRiOL
	clWtbzO47ktBNjk2Li7a1qUtVa6yPHn0E5ZbO7sxko3Po6eTt1IXcwJ0ogdnxSTs
	r/h4960Skw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3ga5js-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 10:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTpSz2G9kbRxw6GmKlDGc0Z9AnBAAvDb24G7QI8b0z8Gq53hgOyyAweB4YjLcReEbB9yKJegp0OJuLmbLou076hVAT41I75JpgHtOt0D+bZIyfIEUQ/DnHDSB3fzn2al3cpc3u13g8qnEnqTdXOH/6UU9EluUQdADzI2ZnTL8Xh1sSxkr03rG++ddgPzSQr671MHDa8+jRPeWhyppaxYiip3t1VKKspZ9ttlYfLqYSZ574vSVFir4H3rRY/0IGCuNmpRpwVHKpu7QegXR49Uxt6tuE7v70XLDNICa8G77n5N2/GdfMSbc0mnvFM3FrkUzdw/L8UYeCQxukYQgKK4FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbap7ZjPX8PqqsN8+fkEpicC6cLvxRk9JCo/ZT+hdKs=;
 b=Prxua6bfJK21t8wpETIW4L/vnWHuzIAOaSpXI3+Lgyr1MVriCpFsnxb9fx3FRs3fBbDEz1Bfr5Ly6W9YDW93txM4BMuMCxc+shDolWJuxPfrUKRMdXzm76uRca4BotRggR4wm+FQlh6pt64fNW8H51XYZxiavDWYlKi34AA4reSFu0pFYgGywGcVkPziKA52GQSKVauCm9t3N96nsZcuDeIT+qeBNvRmPiiqHiTXWc7/LfHJsFy/okLF/r0PnfM8U7ANwkY3GHu3oWksBGsTXH7ypLzzTA+GfGJanHKhAQP2lda+DBxEmMWohFUXy9ecGquH9at9/cvz2ABi2Mzo8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 17:14:12 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 17:14:12 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 6/6] dnsmasq: fix CVE-2026-5172
Date: Mon, 18 May 2026 22:43:36 +0530
Message-Id: <20260518171336.470608-7-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260518171336.470608-1-Abhishek.Bachiphale@windriver.com>
References: <20260518171336.470608-1-Abhishek.Bachiphale@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TY6P286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::18) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|PH0PR11MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aee1a06-33bb-4a62-b6ba-08deb500e1ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|11063799003|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	W2nNsHi/HyZQeZIUFEgol+z389k61LnZvsk2tQRxv5z4jaEboeWG6Pv0tteesyDwvDxKrY0OiimUDi5Wn80cmNjVK6LQ/KKzBDv9K77rvAC39e/hMma2+oA9LrS2rFBtqsdgxrZpc/wbJHjm6sfnq8awcMbK7mMdlp0UfvuVYHUm+YuY5AAQBggVxg3MvHRcEd4YTajdzBNUHLbEMejcaRHtkwCM3PSjO3ENnT4FDzBlJDrCl/NUNGFqkOvQyOVjcvuSr3n7ANLGfu5OvK+mG58NkNSuFuIkzIwyY5/FPYWkrZQeH8ABOn5/Bc4ai7U1hDBfg2WCXL5hjmHbfW42vkHvg1A7kgNrRzDqRzOYZ+MaVh4z2o7P8xs9nqLn1iS1nXZNLDWCCWLgjNtjciSYwfIE4BY6dHvd3zyvbx7Jk7uY/3RrVNsYJg/lv8l7HEbgWhGM+lYpU1e7U76Sdwd0QSqPPhFun2Q6zER+x9LkLImzcJiOdn+okBmnYX5HuF7LpMXeZIZWeysTXZW6usc2nnbsFwBFzTbI8nxN3UTVt2kzMQtrCYgoHvqIXB/9P8sYb0X27tdXPZbVXH22xXx0C5QcOu6sJqi/+KYSTqwjcqmk/E20HQ7Bh/cm/eMe+czAiap0QaQfSxHBHmfCHvyg80158iCDNK52NAXk5wvS8mG5GQ7jPDjxBhoZQGpt/STxhUwycPbTzUaCbFTG11DVAQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(11063799003)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bXE0cEdyVG1pa2xFQVJ1VXdKZ2ttYkxWVDBmS04wSWlpWmZvWEdiVmQ2SEpk?=
 =?utf-8?B?MzhiMzg0REQ4WnNDQm53eUVJZ2dyQUJKUklqTE0wUnlIU00rQ1drNWxTdkRu?=
 =?utf-8?B?MGt0dE83dHRnQlNxRldRb09lOEo4cjlzd0N5ZkpsVFJBM3BSRFgxVlJ4Y2lY?=
 =?utf-8?B?eG10cXVWcmxYQ01iUFV3OFJNS2hMbTg0TTdIMUF1N24rOEprcDZuVDVXZ1J2?=
 =?utf-8?B?VFJFQWgwdGxGL3dwajZDejVKQ2VxeFVTT09IektLN3ZKSS9GdGNWMTdzRjFX?=
 =?utf-8?B?RzJBMktXNXlhZFJmdm94NXVLWnFHL3RaS3orVHNSVkdwVUJPTmNVMkFGNk1V?=
 =?utf-8?B?bzhXQS9MRk1KdlFxMVZLc2FoNVViOGpaRWlyZzNXR0cxa3JZN0s5b0E1OTlF?=
 =?utf-8?B?dFlCQ2kzb1FBWDY4U2FQYnRhUldpNUVSV2xzbGM0bExnWU9EM29IYWNmRitS?=
 =?utf-8?B?WVZKZHdxSDl6NzNsaGpWWkR0Ui9rK3JKbHZ0OHNnQWtnVnArSU96eXRNOHN4?=
 =?utf-8?B?Vm5jN2p5Q1BDRUJLTzE4eHVwQ0VyTVhEYlBwLzB0U1BncFFaV3Q3QitVV25E?=
 =?utf-8?B?UlcvcmxNWTNTVTUzU3kwQUpEZ0kvWWh0aE83R2RiZnY0MWpHWGZvYkc4UnZL?=
 =?utf-8?B?UlRHbnZzb2pjaTJmVzVaamM2ZlBPazlYTmlJbGZVNmdjS3RwLzhVaVlMNERL?=
 =?utf-8?B?Y2xBYVpZWVovMXd4a01JdXBzaWVjejNIdCt3Uk5zVFp5U0x3TjhHRHd3M3dB?=
 =?utf-8?B?amJaTWlSYk1JbW5Ba1NLUFVNZmF6WHN0Q3NycGxmNWYvWGlYTTlTL0FsaGNQ?=
 =?utf-8?B?akc5WDNCdk1MdFo1enVZRUFBQkZTUTRJZmswU0FmUm0rWkRiREhOdVNyTUlt?=
 =?utf-8?B?SUpsaUNpMjBVOWN2dFhKYXpkUjVqd010anlXN0o3clkrZlhHMU1yV3kweUNF?=
 =?utf-8?B?M0FTaVMybTJGQ3F0VFRZUVBUM3dOL3BhKzVvQnZia3hvQWJLbmY5cXQ2cUpO?=
 =?utf-8?B?dE1nVUh2a0lCc3Y1SXFrRzdxSXlKU09SczR5VmRRekUrY2JtTHI2SklsSDA4?=
 =?utf-8?B?ME1oZ1lmTFdYa1MzNVZMUlp2SnMvWXhyTno3SlE4ZGh2N2o0cHFjSGRnM1Ay?=
 =?utf-8?B?N0NYdzNpSzNXejUvTlFNcTFVWnZhQS9ic1hkdWlJd2pWY1MveE9PT2F3d1N4?=
 =?utf-8?B?VDRIc2ZvZGdlcWJIRlpKUlF0YTk3QUNCd1VPcUxVSkJGUjVrUVE5WGx5UFZu?=
 =?utf-8?B?T3NrU001ZEF0OUxvMm10TEJMZENOU3MxQVh6SG1ZWStNM0xva0hFRWRGWWpF?=
 =?utf-8?B?RDdXZDM4VzdRVTdwZTUwV0dybmZPVGZub3hvZ2ozRksxQjEzL0ZQSUVSVzZO?=
 =?utf-8?B?S2RBTmo3bzI2czVITHFIZmpPa0IxeFh5Rk9GaXJYMStEd08xdnRma01ja3BE?=
 =?utf-8?B?Q2EwZHhTNjh6bWk5c3ZKSzNEQUNYZDlFczUvUklDTFg0bXhQcWNpUm1USzht?=
 =?utf-8?B?Qk9HOVZwTWd5S3RkNWhlVHZYUnd6cTFPMHpraDB5cXdZRWlhZWZuVGNkRS9W?=
 =?utf-8?B?TzIxaFU4ZUVuOXp1cXk5UmhBVVdjSyt6NmpIYjA5L2g2RXBXd3hPK0djWEQr?=
 =?utf-8?B?aHoybXBvVVgyQ3hleTdSeG5lMExtbEw0YjdVTHBkRWhDS0wvK002bHVQa21t?=
 =?utf-8?B?NGsyM2dwUWVFUG9SSFQ1eXdKSitBM3pSUUxIcExHQ2pBQ1F0bmpna1ZjTWQ2?=
 =?utf-8?B?NDIvTzZoQ2RWUlZIaXg4blZDLytLVnF6dzUrWlZNWmNMYnhETzd6aVdxdktp?=
 =?utf-8?B?WlRCNWRmWm5kZGxpWTZQajFoZHFPMm9RR3B3U1hvVnVFUi9KN3hPbVgwN1dr?=
 =?utf-8?B?MWZlWVZaWFJCb1RFTDRkQUVFZ2YzUjJHSVJQMTV2K2V1ZHV3MHd1bnp0T2Va?=
 =?utf-8?B?aUZQdnNlQzVaMDR4eVRFbHdTa1V5SllHT28vTitYZHV1UTdOcmdidWVqeEJV?=
 =?utf-8?B?VkFFMGxOZHdCbnFDT2VJQ0JVNlZQOHRHbC9Cb0FxemRHNXVTbGdTUWdUOHp5?=
 =?utf-8?B?R1RYczYwUXZLbUQyNEFXc29lQzBDeFU2NjBIdHMwdmZsOU9LbzYzMDhtY0xD?=
 =?utf-8?B?cnlTTEFneTVzbXd0YjI4NU5taUtqLzFWVjE3SC9VYmJnSEtFT3pPT3QwWUow?=
 =?utf-8?B?eEFSck5neFZxM1E0VEtMNzdVeDloNVNaVFlsUkxTZG9EdjYzZVo0TWcxQjYz?=
 =?utf-8?B?TTdnYkFQU1R4TUNvUkdRdWc0dnh0M0ZLYXZhTU15Rm5HancrZDRlUWt0Vk5s?=
 =?utf-8?B?dk1NQWJFbFRjdTRwcGphcWJSMjNGVW5JVEpIRWJZRVE2cnZtVGRaUm0vbUR4?=
 =?utf-8?Q?11gi7UQnalMHVB2MZJrs3k+ctn6PLf1hxdfUP?=
X-Exchange-RoutingPolicyChecked: 
	WneXjI3GBvYOIHOVB3plhGUZl8oanU+9x0mU/hMV4lowR1Iz6/3UdH+gsdXW4MTt5bs+zcjC4aNMepyjiHqBn50M+r3maXHMeMTHV6GevR8fAGA4hDQBaa7rFKfhr0H+mIIPHfTdzehUn3Le6sHYUGGAAEPyuey62IFpcpi2MySbu3YkCc8F4XDi/SoApCoRRTBunCIwGImbSBXgFy8J+66rMdBg/t9Q5bhzbAavJw2zJYX10lYNwMSmS4uiQlr9+vDCPu8TTNhCwpE6n3Rq2hRwkAu92+RAkf7nux4ndTY3dj2ocobf4OjHmHRiPN+IQkPYx82F/BJuNwvlKr1e+A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aee1a06-33bb-4a62-b6ba-08deb500e1ac
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 17:14:12.6083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywSh8N3FW5wb7mio5wfsOBrpPLYC0CEOo7pt24wiJtTvkdNjKfFRXYtrey13KNstpfYikpjY0kZozWV/A+PQiHH6qQcckJSDyiuuQIed0nmfoOghq76m0ySbnU7YtUtr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
X-Proofpoint-GUID: BTwMRepZnKpBRU-Uzl1v3HKLRCFvB9iF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2OSBTYWx0ZWRfXwWYBuHTql69+
 5eOhNfIQNZmloNZNqSAdkMf81FJWYBVRvRZsWB/VnTaVZF2zds7VC20XVX/Zui7/R9aU9N74fbS
 MhHoRg+r861SqWa/ttdqVGdMDzSDJ4hCEDDFTDL4a4u8RiNa28W6IVjbuA3oox272AqbfJP8ouZ
 CpRkwfhEKluTz15r2zmD0ZL6t00kcSrSlTxedtRSGbJY7SUK/TW7qWBs8lEMqCWnkJ+5DcPta6W
 8znOiNc90y2eg2U4HL1LksQ4ZBrrz3PBq+nNiEsNJovawcHWN5yvTakCmPa87jX6nipwkzMN0Ns
 D2iGaV2xN7TZG7xZzoSzZQ8LySgB/JejNwVgqNKCGDqRTXykgLkmjhy5mKyMOlAT8oBSkRZn+FX
 AMM1TpUdS9ZZlj6MhhjTV3hvZWwngN38+PeKRH+8JIz3fwQ6UV3xsFJf+Xa3eqDtLTa+4TRA4P3
 xIXpd4kfxlfJRvb4ADg==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0b48e8 cx=c_pps
 a=0b+utHCzfji0ILmZHHcyhA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=PYnjg3YJAAAA:8 a=omqxvBYPAAAA:8 a=t7CeM3EgAAAA:8 a=9ZNDgVYNqGDAeKyNT-8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=LHRESdT2jHCYgTnjdhDM:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BTwMRepZnKpBRU-Uzl1v3HKLRCFvB9iF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180169
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64IEGJlS1524251
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 17:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127057

A buffer overflow in dnsmasq=E2=80=99s extract_addresses() function allow=
s
an attacker to trigger a heap out-of-bounds read and crash by
exploiting a malformed DNS response, enabling extract_name()
to advance the pointer past the record=E2=80=99s end.

Reference:
[ https://nvd.nist.gov/vuln/detail/CVE-2026-5172 ]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  1 +
 .../dnsmasq/files/CVE-2026-5172.patch         | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-202=
6-5172.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
index 4ae650f7e7..c19467aed9 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "http://www.thekelleys.org.uk/dnsmasq/${@['=
archive/', ''][float(d.getV
            file://CVE-2026-4891.patch \
            file://CVE-2026-4892.patch \
            file://CVE-2026-4893.patch \
+           file://CVE-2026-5172.patch \
 "
 SRC_URI[sha256sum] =3D "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8=
e3220ade6819b1e1"
=20
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.=
patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
new file mode 100644
index 0000000000..ce6e0f464b
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
@@ -0,0 +1,34 @@
+commit fa3c8ddef6712b52f562813317e6a997e1210123
+Author: Simon Kelley <simon@thekelleys.org.uk>
+Date:   Mon Mar 30 16:24:33 2026 +0100
+
+Fix buffer overflow vulnerability in extract_addresses() CVE-2026-5172
+   =20
+Thanks to Hugo Martinez Ray for spotting this.
+   =20
+The value of rdlen for an RR can be a lie, allowing the
+call to extract_name() at rfc1025.c:952 to advance the value of p1
+past the calculated end of the record. The makes the calculation
+of bytes remaining in the RR underflow to a huge number and results
+in a massive heap OOB read and certain crash.
+
+CVE: CVE-2026-5172
+
+Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=3Ddnsmas=
q.git;a=3Dcommit;h=3D073082ddc0aba7b8efa15a688d6183463b65effa ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+diff --git a/src/rfc1035.c b/src/rfc1035.c
+index f0e1082..7e05fb5 100644
+--- a/src/rfc1035.c
++++ b/src/rfc1035.c
+@@ -943,7 +943,8 @@ int extract_addresses(struct dns_header *header, siz=
e_t qlen, char *name, time_t
+ 			      /* Name, extract it then re-encode. */
+ 			      int len;
+ 			     =20
+-			      if (!extract_name(header, qlen, &p1, name, EXTR_NAME_EXTRACT, =
0))
++			      /* rdlen may lie, and extract_name() advances p1 past where it=
 says the record ends. */
++			      if (!extract_name(header, qlen, &p1, name, EXTR_NAME_EXTRACT, =
0) || (p1 > endrr))
+ 				{
+ 				  blockdata_free(addr.rrblock.rrdata);
+ 				  return 2;
--=20
2.40.0


