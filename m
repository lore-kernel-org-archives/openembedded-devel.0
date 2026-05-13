Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712BDCD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 02:33:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3262.1778639635826019351
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 19:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=WMzFTkhR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9593c5b8d3=zhe.he@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D261va014552
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 19:33:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=iSUrbjzRoqzxhMxHNaZx
	NUkq1CYfRA0ypfHVVF8orW0=; b=WMzFTkhRsasAAAWmF9do21wACLK8RMp+ZO16
	DATADeTSiQRdPg5auDZSEGVc6SmL/mcshsBzMsOL9Q3NajUh7j5N+nS0GizcfJc8
	q9yZgHwYC4zAMiF67EFBVp+jJk92xZfTsQDdJMSvo7cNrImPgIV3jkF0BQC2kwhX
	Aj6A1Cnndxpsp5BK8V5PCSEKtryBpS2/a179Zm9NwiXMGiJkcLzjbgVce3RSfOHq
	pG5nFLjSMGzJNL9tmy1OPwKXg5S01Yn1UzYPSQbR+klIYnUH+pXtyGjlRUGsmCpn
	WuPTD/Jn5Vx5HER3L01fZWSj9UVmQxKmt53JS0gtklbIy919OQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011002.outbound.protection.outlook.com [52.101.62.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4g7g80q2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 19:33:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgHXs9ak6nCCKcZgj2hVAP2kMvDAbHocPKouse32b5GRoewkxVRuFA0tE1eKFdJaPI/w2pzHOMWf73Wtb6LBip/r76bZAgYdnP7KGHYBwMaoWvHzzzRcR82e4BTNd0WQ8/uefnTuykxKxzz5q9cxvMyrpN/Xiol7b34k/eNQksMiIWlkweN+bEXnd1GkIoay36jRpwaRrkmR6JDVolryyVNa/38lCJbpMsTHlTqcTm4wkdolmKFB8aGMdrEMV/y0aGgvTMGVPMloGcPtnO2R77NCbQ0Rs6KJE8iuPRgog9dNpaZFhBN4NzqEW9pEgGIaTvqz9q0z2Pl9qXu5XTw82A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSUrbjzRoqzxhMxHNaZxNUkq1CYfRA0ypfHVVF8orW0=;
 b=DGTp8vGk/qIn6lrlWK+RLdhAl3Tti0qU45X/BEaao/A7O2ZbSng8jYooBHGSiZyKOMfg0rndgVzndx47864/Qn9XdGc/PJiKlLp7U45GrbG3mjj5Kp5OeqbMENZT6XpLckOOOJEbXEjj6RpNJrsAME/xmJlEAQ7b0nZ/C7LEfeLbHGBsXgwOn88quAqHjmpfI2xU20LMpWD+Qr45Kf/TZZi3XlH+rxcxJ8Ql8/holc4Anu5jPnu0SYscNRrLZyemdmCQ862Es1rnlASquDbML+AnqUK4XCu421ys3+UWEl2pCvy3JfyujpS40YrQg30pJ/aoJLbPG7U672aKVumtZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2633.namprd11.prod.outlook.com (2603:10b6:5:c0::14) by
 CY8PR11MB6843.namprd11.prod.outlook.com (2603:10b6:930:60::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.23; Wed, 13 May 2026 02:33:52 +0000
Received: from DM6PR11MB2633.namprd11.prod.outlook.com
 ([fe80::7989:d63c:1bdb:60ef]) by DM6PR11MB2633.namprd11.prod.outlook.com
 ([fe80::7989:d63c:1bdb:60ef%6]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 02:33:52 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2] bpftool-native: Fix -Wdiscarded-qualifiers errors for glibc 2.42+
Date: Wed, 13 May 2026 10:33:18 +0800
Message-Id: <20260513023318.2735656-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::15) To DM6PR11MB2633.namprd11.prod.outlook.com
 (2603:10b6:5:c0::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2633:EE_|CY8PR11MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a034043-e84b-4e2f-f027-08deb098126c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014|18002099003|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	XlSvTnWHUjxhfDUQUgPXsVdfVmInEiCMWVuJvrdRC31hUNpsFkqFC7w7Iz8fNgrmaTbB6rRD5hfNhYyKPwEvsohSYFoj8g8kaUTMC5O8uCeXPEz5OY78kWjobFn4IqEby2dJ1kdMSYRfXXMLtzpofChCROudtOUS2BurQOwXnGmShQfeieI5N7aflMyr+qKTf2pJrZYMbrXS+H1iw+Jz/4DxvS8T2F1epIWg5xpd0mchF+2gnPmTEJzuqk8D4yCVbcpX4iHmVqTAFe1plaIL81+3ssBtNQWFeh8YUgj/Ty9D4IPnb3VJ3ASO+W0psE3S4lAe61K7rEFNXT/k9oyJKPhObwSY5R21EvZnh8mCEEE1OPYxm4ZII/H2TxVNnxJQA1XYTwoWX4plW5o51FnA1nsrZXsUvIDxX3YwaQgk8w5jZk7HClk0Tyv5oSpmq6V5EGxOzly+CpPKW8P8PrLkkSxhtiIZXhvQFHyVfs2iYEScSMDZFbCZHZHRVqvpyvkjMSuPimePzPaCY6FdoGKNyTLbynGdMg7jFY/4xRnSyVC36fZNuBd+e+kb6tVXO/jqpt4RYmxCSQ2j7uw+aHphQa29MHeyy5Awtk7YBy1tRWmdiL7I86R+z6xVA5LiHgU4d1jRlNBWyWXFSaidDUV1+MqZYRyaKthULR3wGzDUzYodvWgmCtxiIVf4quKDlprZBBh/wFqCE8xxkhOYD9kayv1fzUaicFSR9ZuOy7enwbCguJMWFYfNOAajgkCFaZlA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014)(18002099003)(56012099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUEvSGl1OTR3Wkh4VG5DeGpPbmtySG9GdlFwS1lIeVlsRy9xdUJwcHdPTEhs?=
 =?utf-8?B?bldiMUY0MmZ6ejZ6eVdMdk5RTEFBTU1xWlpSc2dEQVBDZ0o1UkpQOVVuOUZ4?=
 =?utf-8?B?WnRFNnF3UktiZEJDWmUxc1Jac1oxTm04empneUhOLzNvZy9SckozVFo2V1Uv?=
 =?utf-8?B?NWhLSGt5TDRRa3Y4a1pHZ1NYMktTbkN3TjVOZW9OZE9acFpGdzFQcDF2QTBP?=
 =?utf-8?B?S21XQmQ5ODJTYUgyRTI2emNUeHY3dTFQVXVSQWRtcVF0eWw2emkxbXNSS2FY?=
 =?utf-8?B?Z1NZSEZSK2VwWldWQklWVk9ya0YxRnQrQmxzbVVtQXhXNWQwS0lLK0Z5elcv?=
 =?utf-8?B?eW5odWN4VHpnVXJyNXBVYWp6UTRsZGx1U2h6SHoxYkh1TmJra1B3M05nTEJR?=
 =?utf-8?B?L1hOWnRvN0NVYm15V205blhwNjBXNkZxUWI4Y1BZSWRwTjBRRHlwZ1ZOUGZ5?=
 =?utf-8?B?Q1RiZHBTTlRHTWFtTjl6TTY5QUVPZ2h1Uk5ydERrZnFDc0RPb0RwWmNMNGRP?=
 =?utf-8?B?cHdVYnFDaUx1VWMvYjVWRlFia01ORlZFZFVMNzRnck9LWjhPNmdhZTJISmJN?=
 =?utf-8?B?eTkwayt5Y2pJdDdGeG5UNkRYcWdRcmpTU2o1ZTVzdGQ1Mms2R0pqczBsQnRS?=
 =?utf-8?B?b2hadnZIdlMyTlZZbVlQSWhnQ1o0VW1yU2tUblFHMzJQQVZjQ1J1K3lsWGY5?=
 =?utf-8?B?VHlBSiszOHkxaUxEUzQyOVpMaExOZGNIalZ0V3p6RGpJNkxRSWtPRWd5M0hr?=
 =?utf-8?B?VmNjeldCYWhWV041MkRCRGFYeWxhLzQwOWNiZWpxYUZIK2x0TkRIOXRWMVRs?=
 =?utf-8?B?MnpLeWpSTnkxYlZEenNLVGY1cEtoSmw0a1RkejRLTW5NNHZBK25KLzdGUGl5?=
 =?utf-8?B?RTBhYmZuRURMcXhiYmo4YXhXcVFaRE5Sc1cvVDYvcDdtNW5XcWhpZ0VUeG82?=
 =?utf-8?B?OWcreitCTGQ0MXdYNjJZbXlCaTRLVExOc3lZTlplaU1GK3VVcjlwUVdQcndi?=
 =?utf-8?B?Y0VXQWhqODV3WTBVQ08vbCtwOU5URHZpd24yTGw3M0pnWUhrNXFFWE9hempQ?=
 =?utf-8?B?YUIxV3RaSFV0RjU4K2toMTYwZzNSd2tZWnBjZ2F1RlhtUnFoNTRqQXh6bVJM?=
 =?utf-8?B?ZzdHZHFvcUR3RTJvSW1IOFZ2WUh5N2dPNEFWcFJFREhhQm1IbklENURXQkNv?=
 =?utf-8?B?NTNHeGdHM2VLbjM5R1RXNjBqdExFUE92ckNKWmViZW8rMTJFbDJaUzhEeFda?=
 =?utf-8?B?OENNUHpTYURwanhhVnBDdkxBcDdOQXdsYmxRVVNkcldMeFhRdnZ0TkJHMFdS?=
 =?utf-8?B?Zk9KaEFHQXNGaWNPb3ZScldZRnNwVjlPVG5Sa3lhWTZiZ1k5Z1hKZ3UrVllt?=
 =?utf-8?B?SWtEcElrZWtMT2MxRXdDOXFvcVJTWHdsT2VzZjhmdHVHT2RSZXp1SUYvMUdM?=
 =?utf-8?B?WXNNRUtjRVFyL29LdkhjZFA2SGFGZHNjQ0hVYWhKQU5ZdHdpYUx5SERwaE9s?=
 =?utf-8?B?a3pHK3VQUlNTVVphcmRDa0RFTW9NakJCd21yWWVkOWE3OVVHd0syUkRqellL?=
 =?utf-8?B?TFBhN0ZQT1FaM25zY3ovSHEvQ3RXZis3eGRqVURGY1dlY3FaZlAwMzZUUEh0?=
 =?utf-8?B?MklKd2xLZ090bnZEcjg2RTFHZFRieVlXM2syb25pNEw4VlFMdVRKOUtoTkpv?=
 =?utf-8?B?U012OG0zVGRwVjVvVXVXNFo0bGVjYWZRb1FXLy9paE15cW8yWFRndnc5anlm?=
 =?utf-8?B?MVJacFpVdS9pakZIVU5ETHFqdlFnWjN5Y2llQzZOa0gyWW5Sdjk5NURha0Zy?=
 =?utf-8?B?NHhMeGVhRlRkbk1vVElUL1NaRVd3Nzc1WTgvMXZSWUZxOXE5Y2VNYU0yeEhx?=
 =?utf-8?B?V0QrL1pFMnhsaFVCYTc0UXdFTzNxbVBkT0RKRDh0ZkRiTTZTYzZ3dVRtWnpo?=
 =?utf-8?B?dFhDMlN6aXh6Z2VnbC82dG1zdEMweHUzYXg0UWFQSU9FajFRdGRJRUc4aHhR?=
 =?utf-8?B?M1F4ZndrN0Y3ZHcvMjdxc3pTa2dDOExOY2ZZU1FTZ0dpa1ZGNDNleENXV204?=
 =?utf-8?B?amxpcWdLL05CTDNlV3Fuckx5TFZJWFRyY2p3TzJaczBBc0hLbDNzMWEwTzRN?=
 =?utf-8?B?VzZ2VzFKcUE0eW5JZjEzcmpSbFJoeFFNcEJoM3V3ZHRTT0ZEVHE3OEZqS2Ey?=
 =?utf-8?B?bHh4aVQzUUZ6em0wclBwcklSd2dVR3lZTmp4U214elhuc0J0UlVnbGZXc2c5?=
 =?utf-8?B?NFFJUzh2SVFJdlZIaE05bE9kVjQrbElUbXkxVUJKYWkraFVHd0poREVVTlFv?=
 =?utf-8?B?a3AwS29DYm0vVUdYUXp6SGhIclpRc1Z1M2pnTW5XQi9YandXZFg5dz09?=
X-Exchange-RoutingPolicyChecked: 
	wtPBfoSAPPGnnTtGdfygHI7/KDdMWA5SdDTUA4DC91/1N/cgn7TNI8/+kT/iocGtvm4JgU3cYzYm/hnYsokr9A6LEW+KlyD/68ocW9oIk7Z3Pi4+xpkfSRA0fJOk4JDs9PS3k371M/p4AILON6iV/BnVwP1RDX4droCUw+9a1mG3hUuoSTh/hvqb05R/vOVI7jgW/mtwM9GeIo38is8XhoTugfu6hID3RZmFElHz+vS0gwz3YmobYj/c6SdrAK5CmCAIf9rMV5Xfl70CYfHyDupcmdc4eKr/NTdRuqmtgf0QSJQGBY6yj3Pwbws4TiufqUuoNiYJUoDkCYY9Hnw4KQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a034043-e84b-4e2f-f027-08deb098126c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 02:33:52.5564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIWq7aC02AnjIe3YI5JGAmnxPjTG+qyljyMJyqgAIzboTt9NqwjXHPuHYGIbUKjYGRtqU9jqt/iR9AxwVbTuVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6843
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDAyMyBTYWx0ZWRfX0XHR+2P833nt
 hHww5lKpbGNpC7C09bagz1cIV+a6eohmILLyPmOcUOZJJM0x23Xh1T6AMIjc8VKZG3AUNHd5w2T
 GZZktOotPFvSPSwhuivmb9HFH+98E+zpnM9AS/PVi4QiyUMSvaNMgdDdBzXh+NENAFXO1iIhq73
 INPzDo+eD12z3P2wS08yYOUuIzfAHSJO8m09og0z5zJHO8OohHh2ePdVQJWjpiPnRkuwMyAR5N2
 WqkZhoFXE5Cm6Sh/U3fTkdYl9WfytfFEIenMec5LeP9SYs5Kda1pU1sACKCY0sK6bnih9eeKx4y
 hPdz5ABRwHYoMg6biaONLCy8n3MAHFNtvzM3xveVcYsVe31ILGY8T/wpjMbPACGpMd32rqmeXsJ
 4J5BIuWFNWMdBYHq23Hlbq8xocYWGIXZ88CVGEHzAnzL70q2H/VwRDvoTPOM/EsH9cmNg5JrpxJ
 H2LcuSM9/my47Q65ppA==
X-Proofpoint-ORIG-GUID: W2laIPVKJ8Tbwc6p9djQU_kypZ1PYKpk
X-Proofpoint-GUID: W2laIPVKJ8Tbwc6p9djQU_kypZ1PYKpk
X-Authority-Analysis: v=2.4 cv=Q7jiJY2a c=1 sm=1 tr=0 ts=6a03e313 cx=c_pps
 a=wqOHD3zG9oVgxNNyXktjPA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=iox4zFpeAAAA:8 a=ag1SF4gXAAAA:8 a=CAchc_BtILMKYomKS8sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130023
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64D261va014552
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 02:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126879

Backport a patch from kernel to fix the following build errors.

bbpf.c: In function =E2=80=98kallsyms_cb=E2=80=99:
| libbpf.c:8192:13: error: assignment discards =E2=80=98const=E2=80=99 qu=
alifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
|  8192 |         res =3D strstr(sym_name, ".llvm.");
|       |             ^
| libbpf.c: In function =E2=80=98avail_kallsyms_cb=E2=80=99:
| libbpf.c:11497:31: error: assignment discards =E2=80=98const=E2=80=99 q=
ualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
| 11497 |                 if (!(sym_sfx =3D strstr(sym_name, ".llvm.")))
|       |                               ^
| libbpf.c: In function =E2=80=98resolve_full_path=E2=80=99:
| libbpf.c:12085:35: error: assignment discards =E2=80=98const=E2=80=99 q=
ualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
| 12085 |                         next_path =3D strchr(s, ':');
|       |

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
v2: Update Upstream-status form

 .../bpftool/bpftool-native_6.16.bb            |  5 +-
 ...-Fix-Wdiscarded-qualifiers-under-C23.patch | 69 +++++++++++++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fi=
x-Wdiscarded-qualifiers-under-C23.patch

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb b/meta=
-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
index fe3ad6138e..edc635517a 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
@@ -9,7 +9,10 @@ DEPENDS =3D "binutils-native elfutils-native"
=20
 inherit native bash-completion
=20
-SRC_URI =3D "${KERNELORG_MIRROR}/linux/kernel/v6.x/linux-${PV}.tar.xz"
+SRC_URI =3D "\
+    ${KERNELORG_MIRROR}/linux/kernel/v6.x/linux-${PV}.tar.xz \
+    file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch \
+"
 SRC_URI[sha256sum] =3D "1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab4=
8516bcc1befbcd83"
=20
 S =3D "${UNPACKDIR}/linux-${PV}"
diff --git a/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdisc=
arded-qualifiers-under-C23.patch b/meta-oe/recipes-kernel/bpftool/bpftool=
/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch
new file mode 100644
index 0000000000..4726727c3d
--- /dev/null
+++ b/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdiscarded-q=
ualifiers-under-C23.patch
@@ -0,0 +1,69 @@
+From ab21cf885fb2af179c44d8beeabd716133b9385d Mon Sep 17 00:00:00 2001
+From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
+Date: Sat, 6 Dec 2025 14:28:25 +0500
+Subject: [PATCH] libbpf: Fix -Wdiscarded-qualifiers under C23
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+commit d70f79fef65810faf64dbae1f3a1b5623cdb2345 upstream.
+
+glibc =E2=89=A5 2.42 (GCC 15) defaults to -std=3Dgnu23, which promotes
+-Wdiscarded-qualifiers to an error.
+
+In C23, strstr() and strchr() return "const char *".
+
+Change variable types to const char * where the pointers are never
+modified (res, sym_sfx, next_path).
+
+Suggested-by: Florian Weimer <fweimer@redhat.com>
+Suggested-by: Andrii Nakryiko <andrii@kernel.org>
+Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
+Link: https://lore.kernel.org/r/20251206092825.1471385-1-mikhail.v.gavri=
lov@gmail.com
+Signed-off-by: Alexei Starovoitov <ast@kernel.org>
+[ shung-hsi.yu: needed to fix kernel build failure due to libbpf since g=
libc
+  2.43+ (which adds 'const' qualifier to strstr) ]
+Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/g=
it/stable/linux.git/commit/?h=3Dlinux-6.18.y&id=3Dab21cf885fb2af179c44d8b=
eeabd716133b9385d]
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ tools/lib/bpf/libbpf.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
+index dd3b2f57082d..9c98c6adb6d0 100644
+--- a/tools/lib/bpf/libbpf.c
++++ b/tools/lib/bpf/libbpf.c
+@@ -8245,7 +8245,7 @@ static int kallsyms_cb(unsigned long long sym_addr=
, char sym_type,
+ 	struct bpf_object *obj =3D ctx;
+ 	const struct btf_type *t;
+ 	struct extern_desc *ext;
+-	char *res;
++	const char *res;
+=20
+ 	res =3D strstr(sym_name, ".llvm.");
+ 	if (sym_type =3D=3D 'd' && res)
+@@ -11574,7 +11574,8 @@ static int avail_kallsyms_cb(unsigned long long =
sym_addr, char sym_type,
+ 		 *
+ 		 *   [0] fb6a421fb615 ("kallsyms: Match symbols exactly with CONFIG_L=
TO_CLANG")
+ 		 */
+-		char sym_trim[256], *psym_trim =3D sym_trim, *sym_sfx;
++		char sym_trim[256], *psym_trim =3D sym_trim;
++		const char *sym_sfx;
+=20
+ 		if (!(sym_sfx =3D strstr(sym_name, ".llvm.")))
+ 			return 0;
+@@ -12159,7 +12160,7 @@ static int resolve_full_path(const char *file, c=
har *result, size_t result_sz)
+ 		if (!search_paths[i])
+ 			continue;
+ 		for (s =3D search_paths[i]; s !=3D NULL; s =3D strchr(s, ':')) {
+-			char *next_path;
++			const char *next_path;
+ 			int seg_len;
+=20
+ 			if (s[0] =3D=3D ':')
+--=20
+2.34.1
+
--=20
2.34.1


