Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D38CCFA18
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:28:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17967.1763015296035502141
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=OjfGBxOh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3412a946d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD4RvDb3686157
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:28:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Ju1oSaayYvM4uhyc0cI/
	98xSXx3l3KcTiE2J3/hp8Lc=; b=OjfGBxOhmfgpxLx2LjxOwnS09TO5Qrm+8DnW
	vXZo+QocVT+/MSy7UDBiiyhXcCSAy1uJuwPfhGacurb4JQQH07FkqdR34z7MN5CD
	/TJn/iO6F/RBEgEs+Os3IHTEmecMQdVip5g07i+VvYUuvrw8QCmpqBPGKs8Wu+rD
	aeiBnlxX6spP9VfMynIsD1eXHYNC6Faxdi9v9t1paW+exu4xp2ph+4bqUeExPMrz
	uJGtKYIdnzd4qBkXmngKIs766gsUj6ag3VbIvgEciST0rjkknZ+p70LkNl4Kwseo
	6GGOtnJOdbzF4zs3IDYuSQynYHiMd74jy1pOGZVcGMayisVZDQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010055.outbound.protection.outlook.com [52.101.46.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa68jpj8b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:28:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLtKkcR+Zl5ULYCJSqC+6PISsYNN8L3ImSARGOJfCMwU6MtmQUTKLVO1Nu9nGTae0CIy2CHx0w7ufnltCPTnVQ8KWiJWQnosQZ+IgeEtdPBJwX6yuFoYeaWynhLc+ocEJIiVWlMuaqdt9y/AO2EUB8SWNKoQ5ZayJRIhfVGouSOtBjIK6qF0gKOBQtT0LCHC3XP2RuTXJMXGp3EprOdhWwxC46kUoh96KkZtjIoGWUs+n+jmR2wCacJoOc9KWzGeY6DIF8EW2r+Fm41tgf4WjIvVXAvYuKgs0uzKUBCKilyW7P4392a4fw94kiiqLuoaz6VyEMSgORdrQyAl7Yp+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ju1oSaayYvM4uhyc0cI/98xSXx3l3KcTiE2J3/hp8Lc=;
 b=tdrDE1u1seDv8Mb7V/2GjjcXaPg3IWDiL4pQBfeu8zSWUV3NJXrAQRhAWdOtKintt2E1z6pOwa2bil4DmyMDXy4UujanMBMolEhCLJHeiKFSjWdozuXAKII1NRl8PtNe79HEEgJ48+aVoRS2Kb0CPkXXNuXlisJMN1lVXNvlh4se/Hxr4fc98/COZtmsR6TbIDXAQfcMfhOu7BPMfe5/t0UQIsrwBW/ntIwa0zDGaZIEhSSiQe8GI6OOF87/xZ7Mo+vVhjoG5EnjLWPu4MKey5+z+9wN5MNfXotn3ntQc0wXeWSxiMRB+JDk+R7r4/x0NJ3qwseBeJtW1vBozIwIzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB7410.namprd11.prod.outlook.com (2603:10b6:8:151::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Thu, 13 Nov 2025 06:28:12 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 06:28:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-inotify: upgrade to 0.2.12
Date: Thu, 13 Nov 2025 14:27:59 +0800
Message-Id: <20251113062759.3940680-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a755714-0b50-44fd-6dbd-08de227dd1f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bWhZbHZzT2JmOU56c2JnQ3hjNjZWa2h2cWxUUTFqOXl6Tk5pa1A4bnhvamU1?=
 =?utf-8?B?cGh2ZXMwM3VjdVF0L3MxQWZ1dDE2eldGcDhnSkxJSDJhdEtXQUdSNmFTbytm?=
 =?utf-8?B?VEF5MEFlTERPZTI3a1N5MzYvdTUwbGZBcDlwQk9NSnFLbHJmaEJYOXBvcjJL?=
 =?utf-8?B?cXFpb3duVWphMWRzUVJza1YrQStLci8vNzBUakd1MWZvWnlSN2FJbjhJSUNW?=
 =?utf-8?B?aVhnaWhMUm1oTktoR21vd2c5TG5YanVzWE5lZis3SE1wSHlRelpHb2hudTlB?=
 =?utf-8?B?YXVTNndzSERQcXcrUVJpa0xxenZXUGh4K0R6cFpsT3lhZVBFcXhTRDRBV2ln?=
 =?utf-8?B?T0k5S3NhWkN1NUlGU29wbE5JSXU2SWpjNnZZMTMyQmNSZlBnQXZqclpUQmJC?=
 =?utf-8?B?MVJzVG1hRW1BSEdGYS9EUTNvYW9xYlN2UFYxbGJkTm9RTk43MFhwMnRKZTlF?=
 =?utf-8?B?WWVjVFllY3pzWnBoTThyajltM0RRT0VFeW5uYUhEeDl3L1k3b2xtSWlCMEZ0?=
 =?utf-8?B?elpENnNPY044alJ3WVhvSG1rbFkrMkJmMm1KWlZQOEtIM0NFNStJK3VzRW9V?=
 =?utf-8?B?R1R5NVMwdkxkanhRVk0yeEI2SlMxRUo2ZlVlZnVKTW1tbTBTRGN0Z2JHTE1t?=
 =?utf-8?B?enlMeWpIcmIyNXZtSjV1MzhENkI1RHcwZVFOdkZod1l6YzhUc1F1N0NTODhp?=
 =?utf-8?B?S05GUmh5N1NmazZYOERScWoreVFnQi9wLy9hbG1sNTlzL243cEQwY1k1Z0Rv?=
 =?utf-8?B?R3JmV1dwb1NLOVpBRlYxWXF3MHc5UWQ1SG9yQitJeW1rYlY1YS9zYTRWemlG?=
 =?utf-8?B?N2pRZjQ1TXYzeDNScUZqYm1IUmxISkpORXNhSGlkZENpVnBCMWhkdnZoZzVO?=
 =?utf-8?B?ODBnU2cxclNibWwrNm1nQlNCOHRRU3VMQlZiUDNsSUp5S3JSbTB2eWJUVWNW?=
 =?utf-8?B?NFlpdDF6SHE0d2N4TGRXd3pxVkZ0bXl0OGpCZk1XYktPMHQzUWs5TWZKOTV5?=
 =?utf-8?B?NmdKNHZheGl2U3VQUEtLUU9xbHZLNjVoN3pwZFZQdTM1SW9LdmxDa0pLUDVI?=
 =?utf-8?B?a1J1QlNvTFcrYmhiWE54U3BZTXlQU1pqMkh3MlRiOUU3RVRiazNqL0plaEtR?=
 =?utf-8?B?R2drc2tHMjVnczdYRWhranExWE5la1AzVVFXS25ONGUzNy94TitDMTFLWFVR?=
 =?utf-8?B?ZXpkY0oyMWlrUFlyUUN3WGxla0crYldhNXI3TzdoYW5vZ2NMSWIxcjVNbTlM?=
 =?utf-8?B?a3VrN09mcElUWHRpVFA4cHJ6R3ltZzRjaWlLN0ZBWDEwRWlIM0tHcDJGNU00?=
 =?utf-8?B?aTE0Tis3TGVaczFVV2d0N29nVFAyR3k3NVBVUG50UE51SGdBR01PWi9LaXdn?=
 =?utf-8?B?bGU3WGduMHZSblI2MXl0UytBMVFNQ3BOQW5xNUJJUkp4dGdJUnBSQzhCTVdo?=
 =?utf-8?B?bG5mOVRhakZlREVpUUVONDVjc0hYeU56ditQQU5LRVZtWW5XVTZ3M2FjWmNs?=
 =?utf-8?B?d0xEa1BFSHdCKy9Xd3JNZ04xYjdiamo5dXlRdkxaMGEvaWNFSHFYQ0xnMC9v?=
 =?utf-8?B?dTVSVmJpLzRaSTNteGtCZTZDVE5kVWZSdDdNOFhVaTRUNHFFV2FpV1hITy92?=
 =?utf-8?B?dVd6dGJJNmdDZlNhcHIwbnpWY0JUdHgzbmFTOTJ6Sjk1ajlLMG9EUndUMzI1?=
 =?utf-8?B?VzdVTkx5S3BYRjQzNGUwZG55WTVqLzNUa0lqMHYvTVAwS0pGbDhlRGc5ZUtZ?=
 =?utf-8?B?NWxVSzAzcHNUOFBmaWg1c3hOd2wvVGg3QmRvaFFqVFFMSWFYWnFJMytRTy9l?=
 =?utf-8?B?dDhWaDQxZUZUTW02MzJGNG4xK2FiNkxKV0dNRjJ6NUo4ZVZTTUF3TnYwYUR0?=
 =?utf-8?B?ZlFiaE4xcHpJdWdpaFZUSGdodXJvaXJoK3RPQWlDUDB0NC9FMUQxa0YvSjd6?=
 =?utf-8?B?K3grWmt1RU9hVE9heE5PM1VQRjUxNHRqa0JtZDROci9qT1hxNkUybmxvTTVq?=
 =?utf-8?B?U0FOT0JEeTJRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mk5IOTFDR3ZhWldGUDEzM0ZiVldFWElvbjJadnF6ZDY0RDdrSXBweUM0NWk4?=
 =?utf-8?B?eVBjV1ppRW5SUklUTkR0Wk5ySWY0Q0dOSnA3UWt5VFJsTlpJc2wvNTRaY0RE?=
 =?utf-8?B?RVNiVE12OWNIcENnUlVUMEFvOUtlRXMzSExTSVE0RkxpS2x1dElCNDNTOFJH?=
 =?utf-8?B?ZTI1SUxNMmNSa1pnWkNHUklxWFNaWXZpcFcvbTBJRUh2UVk1T2d4OHJVRVNa?=
 =?utf-8?B?OXVtaEpBTmF2ZHVaUDJBKzNvc3JWNVFNREZ2S1Q0S2ZZY3NWQmZrNTlXTks5?=
 =?utf-8?B?RXBqRnFDY05LdWRNY1p3RmF6dHRuRDN2QkNLdm5meVJnbGdZQXlwSDY4dlJK?=
 =?utf-8?B?OFBvcFFkdjFIcTBOK09uT1NCbmowMEpsQlUrcmEwcUVxdllGKzJheDFEUVlP?=
 =?utf-8?B?N0xwYlFyQks1Rk16S0w3K0VYUHd1UklmTVJkQ1ZHZEtxaEJJcjhYQkwxbjNM?=
 =?utf-8?B?YUdmbDBZL25ZWUtqOU5CN2NLc3VJU2tPcHI4TnZFalFLNEdZVXZueTIxMk9i?=
 =?utf-8?B?ZVNzcjM4NkVSSzdZKzR4V0pIZWp0UkFGdVpQbGh5aE1iS0xMb3hWdXplUk8y?=
 =?utf-8?B?NEIwc2ZZUEdkUEl3UEJNYmRXNUdSWVhBTXBvTithVzZ2VllmV1dJdlVzdEZQ?=
 =?utf-8?B?MjlrWmlzU0YyeFpIS3V1bmZUczJFaXVTekxZUUsvYWhNN0s3TlB3cWd2VHhD?=
 =?utf-8?B?WW5MTytLY3VmNVk4dW1lcHNHWlpwWndQZVd4WjJOK04xNDlBQWhrdHV3amFS?=
 =?utf-8?B?andvWmhWUEM1NldhZmp2Y1N1aGNTWlFqUGhOeXgvdjlIK0dDbkh1VzNKbjdn?=
 =?utf-8?B?VmRQRnJzUVNUcytpVEEyN1hVdW8xUG9pZVROdzMxczZvL1ZaRFVibEpreDEw?=
 =?utf-8?B?dTBCKzl5Q2dNN3VSTVVpU2NTRjY0cTRPdUdzVEFiM3pBSCtsWTVxaVlNbTVN?=
 =?utf-8?B?TXdLUFVjVWdWTDhMeEpkVGxzQzFjeE82NStrMFB5eVJ0SSs1ZFBBMzdybHJT?=
 =?utf-8?B?NlBJbFVIL3lHN09MU28zaXIvWXVIelVuNXlNMXlvU0RHbnIxMWJHZDV6SFJB?=
 =?utf-8?B?RnZrSEY2TVUvNTdRcGtJaURYbU9mVzZqN1BXVFJVb3BqN1BWODQxOWo1aWgw?=
 =?utf-8?B?ejgvRlNURVQ2Q0h4bzNpL2JjajhhNjVEUnRjZlE4Vy9xNXlxMzhXaXJLK01t?=
 =?utf-8?B?QmgxTnZMRHphWW1rTVB1REZMekR6RGphOUpkUGdHRkJJYmJ0aGN2QWVtRGpW?=
 =?utf-8?B?cUMvWVhaMFFLVHdMODVVQVJlMDZjL1ZiWkYyTGNpNU1kclcrZE00MlppRzYx?=
 =?utf-8?B?KzZzQUdrTzB4ZklZYlRvY3YzYlh2MzYzWWlGc2FTV3h2Z1lxeElCMW5vYlps?=
 =?utf-8?B?a2p0N3JWSlJxVTBoODhqcW1CUGRzZ1R3TmZCMUtneEhHV3o3UnlvYWtMenMy?=
 =?utf-8?B?NTJ5MWhxWG5yM3djUVoxcDV3eUtHUHVIWHhjVVpoVlRwNzg0M096YXk5bi82?=
 =?utf-8?B?bHpyR2V4UHNNM0M1UUpsZFlrWlpCa2J3Mlh5OEx3RzMvd0QzV2JrUlJGVm5y?=
 =?utf-8?B?angweXNqQ0N5Nkx4Z0x4WElVKzYxeUpVMXpaWCtSSi9BMTNFakhuZjBTOFYx?=
 =?utf-8?B?NWxML2pFaXVLdTRpUFIvajdmdzNTeTBaTG5adDdrcTFhekpOcE1aYjlVUnJG?=
 =?utf-8?B?ck9IZ3ZkMVNXbWE5dXBpZDVXRnEzSmNCZGV5dFVaRFA1LzR0WkNqYVdES0xk?=
 =?utf-8?B?YVBZeXlCalM5TVE2TkxrZTdycUtwUThzYzhCV0RFN1VWU0dyeWhUV2RiVXM2?=
 =?utf-8?B?VHhQVGlmQy9TTHNRa0Y4RFBWZW5oN1h4REhYK043bXVnbkhTVWRjeXdtSDdS?=
 =?utf-8?B?ZFNvOGVMdXZOd3VmSWRxQ2Yzc3lQZjNYMXIwV1FhbUpMVm5PZDFBTzZTTXgy?=
 =?utf-8?B?TnpSU2xObUs3TDRSTnJ4Y3NYTDlRTkhUSjliUWRTditoQjExc0JGa2xibFRI?=
 =?utf-8?B?L3ZyU2Z6dkZqS1NWUVJYRCtocTIwMFBtTXN1RnJsY3lBamdEa2V3a29CQ3hC?=
 =?utf-8?B?WU5HWVNhWk9EcG52dzR6WlMvdUwyeXFPQjRMaHBiRm5EaU1nY2pMMU9QMVhH?=
 =?utf-8?Q?Bj/MQHJzGxs3SnV5zcUFLXF+R?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a755714-0b50-44fd-6dbd-08de227dd1f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 06:28:12.5484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49Rv7jZAjvxJeSBx6jb+JmjJpQZty9E/BWIm+4OSyk8SQKPOoq+NPNOV9j0hsxWR2MWROcfxNLjYsl5WAHxvBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7410
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA0MyBTYWx0ZWRfX6+9VMG7i8UGc
 OqvUKx8uO9DbFMF3Ze6VhwwMFIdqm79wZrUCdiLPGKye/7OkCyL+BLSGyZEdJ0UrE+VVn9NSYaU
 1DXSTRUPR07mVG/3wpamRyoCFbhbBsirNce+1XVPpIN+fUbI7wlz4btHogzKzIuXbA10UA8KVQc
 jCO2nqAeYfEMUixRF8HZDYp6pfE48lMQkso7gXXc2N+F0Uhjjr8ApojQjHE/dAgARoNdbIBWcW7
 rIOB3lgPEvUpfhrcLI4pa2S1/JJfsssA48feWfFdUaDgB+gGA4fLJhaDSAI8MwzIOPp4DXfgyXj
 u9R44j7QkBjB3Zm+TQdNgn0niBRcJkuCF+yjJOf5DAT4+xiWI/Yn2orK1rgvt/hUTrvSDA9crAR
 0XjyYRIBlkUPqteD81OD2LnCn+Xrzw==
X-Proofpoint-GUID: 6eYsyeZkcnOtOJRH4zRjrmtoMPurSQvL
X-Proofpoint-ORIG-GUID: 6eYsyeZkcnOtOJRH4zRjrmtoMPurSQvL
X-Authority-Analysis: v=2.4 cv=ef0wvrEH c=1 sm=1 tr=0 ts=69157a7f cx=c_pps
 a=gGLfFga2G+uCUFnDxO+Iyw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=CckQENj0AAAA:8 a=t7CeM3EgAAAA:8
 a=UP_48DTtEkMPKlQ2ZN8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130043
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AD4RvDb3686157
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121637

ChangeLog:
https://github.com/dsoprea/PyInotify/releases/tag/0.2.11
https://github.com/dsoprea/PyInotify/releases/tag/0.2.12

License Update: Use LICENSE file instead of the specific line in
                setup.py.

* Switch to PyPI instead of github source
* Drop local patch new-test-inotify.patch as it can not be applied with
  updated test_inotify.py

Ptest result:
$ ptest-runner python3-inotify
START: ptest-runner
2025-11-13T03:46
BEGIN: /usr/lib/python3-inotify/ptest
PASS: tests/test_inotify.py:TestInotify.test__cycle
PASS: tests/test_inotify.py:TestInotify.test__error_on_watch_nonexistent_=
folder
PASS: tests/test_inotify.py:TestInotify.test__get_event_names
SKIP: tests/test_inotify.py:TestInotify.test__international_naming_python=
2 # SKIP Not in Python 2
PASS: tests/test_inotify.py:TestInotify.test__international_naming_python=
3
PASS: tests/test_inotify.py:TestInotify.test__watch_list_of_paths
PASS: tests/test_inotify.py:TestInotifyTree.test__automatic_new_watches_o=
n_existing_paths
PASS: tests/test_inotify.py:TestInotifyTree.test__automatic_new_watches_o=
n_new_paths
PASS: tests/test_inotify.py:TestInotifyTree.test__cycle
PASS: tests/test_inotify.py:TestInotifyTree.test__renames
PASS: tests/test_inotify.py:TestInotifyTrees.test__cycle
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Testsuite summary
 # TOTAL: 11
 # PASS: 10
 # SKIP: 1
 # XFAIL: 0
 # FAIL: 0
 # XPASS: 0
 # ERROR: 0
DURATION: 14
END: /usr/lib/python3-inotify/ptest
2025-11-13T03:46
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../python3-inotify/new-test-inotify.patch    | 620 ------------------
 .../python/python3-inotify_0.2.12.bb          |  16 +
 .../python/python3-inotify_git.bb             |  21 -
 3 files changed, 16 insertions(+), 641 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-inotify/n=
ew-test-inotify.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-inotify_0=
.2.12.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-inotify_g=
it.bb

diff --git a/meta-python/recipes-devtools/python/python3-inotify/new-test=
-inotify.patch b/meta-python/recipes-devtools/python/python3-inotify/new-=
test-inotify.patch
deleted file mode 100644
index e462615e14..0000000000
--- a/meta-python/recipes-devtools/python/python3-inotify/new-test-inotif=
y.patch
+++ /dev/null
@@ -1,620 +0,0 @@
-From 80010e27d774e8b722d569384492eaab2bc4ac61 Mon Sep 17 00:00:00 2001
-From: Joe Slater <joe.slater@windriver.com>
-Date: Thu, 27 Jul 2023 15:01:04 +0000
-Subject: [PATCH] working commit
-
-It is not safe to assume the values returned by add_watch(),
-so we add a local helper get_wd() to retrieve them.  This fixes
-a problem in TestInotifyTree.test__cycle() where the
-wd's for the 'aa' and 'bb' paths are not '2' and '3',
-respectively.
-
-A second issue is that Inotify._get_event_names() should
-return a set or sorted list to avoid comparison problems,
-but that is not addressed here since it could be viewed as
-changing the API.
-
-This test_inotify.py is based on the version in the fix_tests branch of
-pyinotify as of commit d7d3c58...
-
-Upstream-Status: Submitted [github.com/dsoprea/PyInotify/pull/104]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- tests/test_inotify.py | 346 ++++++++++++++++++++++++++++++++----------
- 1 file changed, 262 insertions(+), 84 deletions(-)
-
-diff --git a/tests/test_inotify.py b/tests/test_inotify.py
-index d9f1f84..d89a49e 100644
---- a/tests/test_inotify.py
-+++ b/tests/test_inotify.py
-@@ -2,6 +2,7 @@
-=20
- import os
- import unittest
-+import time
-=20
- import inotify.constants
- import inotify.calls
-@@ -15,6 +16,11 @@ except NameError:
- else:
-     _HAS_PYTHON2_UNICODE_SUPPORT =3D True
-=20
-+# Inotify does not have a get for watch descriptors
-+#=20
-+def get_wd(i, path):
-+    return i._Inotify__watches[path]
-+
-=20
- class TestInotify(unittest.TestCase):
-     def __init__(self, *args, **kwargs):
-@@ -29,11 +35,11 @@ class TestInotify(unittest.TestCase):
-     @unittest.skipIf(_HAS_PYTHON2_UNICODE_SUPPORT is True, "Not in Pyth=
on 3")
-     def test__international_naming_python3(self):
-         with inotify.test_support.temp_path() as path:
--            inner_path =3D os.path.join(path, '=E6=96=B0=E5=A2=9E=E8=B3=
=87=E6=96=99=E5=A4=BE')
-+            inner_path =3D os.path.join(path, u'=E6=96=B0=E5=A2=9E=E8=B3=
=87=E6=96=99=E5=A4=BE')
-             os.mkdir(inner_path)
-=20
-             i =3D inotify.adapters.Inotify()
--            i.add_watch(inner_path)
-+            wd =3D i.add_watch(inner_path)
-=20
-             with open(os.path.join(inner_path, 'filename'), 'w'):
-                 pass
-@@ -41,12 +47,27 @@ class TestInotify(unittest.TestCase):
-             events =3D self.__read_all_events(i)
-=20
-             expected =3D [
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], inner_path, 'filename'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], inner_path, 'filename'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], inner_path, 'filename'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D256, c=
ookie=3D0, len=3D16), ['IN_CREATE'], inner_path, 'filename'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D32, co=
okie=3D0, len=3D16), ['IN_OPEN'], inner_path, 'filename'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D8, coo=
kie=3D0, len=3D16), ['IN_CLOSE_WRITE'], inner_path, 'filename'),
-             ]
-=20
--            self.assertEquals(events, expected)
-+            if events !=3D expected:
-+                print("ACTUAL:")
-+                print("")
-+
-+                for i, event in enumerate(events):
-+                    print(event)
-+
-+                print("")
-+
-+                print("EXPECTED:")
-+                print("")
-+
-+                for i, event in enumerate(expected):
-+                    print(event)
-+
-+                raise Exception("Events not correct.")
-=20
-     @unittest.skipIf(_HAS_PYTHON2_UNICODE_SUPPORT is False, "Not in Pyt=
hon 2")
-     def test__international_naming_python2(self):
-@@ -55,7 +76,7 @@ class TestInotify(unittest.TestCase):
-             os.mkdir(inner_path)
-=20
-             i =3D inotify.adapters.Inotify()
--            i.add_watch(inner_path)
-+            wd =3D i.add_watch(inner_path)
-=20
-             with open(os.path.join(inner_path, u'filename=E6=96=99=E5=A4=
=BE'), 'w'):
-                 pass
-@@ -63,12 +84,28 @@ class TestInotify(unittest.TestCase):
-             events =3D self.__read_all_events(i)
-=20
-             expected =3D [
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], inner_path, u'filename=E6=96=99=E5=A4=
=BE'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], inner_path, u'filename=E6=96=99=E5=A4=BE=
'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], inner_path, u'filename=E6=96=99=E5=
=A4=BE'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D256, c=
ookie=3D0, len=3D16), ['IN_CREATE'], inner_path, u'filename=E6=96=99=E5=A4=
=BE'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D32, co=
okie=3D0, len=3D16), ['IN_OPEN'], inner_path, u'filename=E6=96=99=E5=A4=BE=
'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D8, coo=
kie=3D0, len=3D16), ['IN_CLOSE_WRITE'], inner_path, u'filename=E6=96=99=E5=
=A4=BE'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D16, co=
okie=3D0, len=3D16), ['IN_CLOSE_NOWRITE'], inner_path, u'filename=E6=96=99=
=E5=A4=BE'),
-             ]
-=20
--            self.assertEquals(events, expected)
-+            if events !=3D expected:
-+                print("ACTUAL:")
-+                print("")
-+
-+                for i, event in enumerate(events):
-+                    print(event)
-+
-+                print("")
-+
-+                print("EXPECTED:")
-+                print("")
-+
-+                for i, event in enumerate(expected):
-+                    print(event)
-+
-+                raise Exception("Events not correct.")
-=20
-     def test__cycle(self):
-         with inotify.test_support.temp_path() as path:
-@@ -79,7 +116,7 @@ class TestInotify(unittest.TestCase):
-             os.mkdir(path2)
-=20
-             i =3D inotify.adapters.Inotify()
--            i.add_watch(path1)
-+            wd =3D i.add_watch(path1)
-=20
-             with open('ignored_new_file', 'w'):
-                 pass
-@@ -96,32 +133,47 @@ class TestInotify(unittest.TestCase):
-=20
-             expected =3D [
-                 (
--                    inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D256,=
 cookie=3D0, len=3D16),
-+                    inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D256=
, cookie=3D0, len=3D16),
-                     ['IN_CREATE'],
-                     path1,
-                     'seen_new_file'
-                 ),
-                 (
--                    inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D32, =
cookie=3D0, len=3D16),
-+                    inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D32,=
 cookie=3D0, len=3D16),
-                     ['IN_OPEN'],
-                     path1,
-                     'seen_new_file'
-                 ),
-                 (
--                    inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D8, c=
ookie=3D0, len=3D16),
-+                    inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D8, =
cookie=3D0, len=3D16),
-                     ['IN_CLOSE_WRITE'],
-                     path1,
-                     'seen_new_file'
-                 ),
-                 (
--                    inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D512,=
 cookie=3D0, len=3D16),
-+                    inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D512=
, cookie=3D0, len=3D16),
-                     ['IN_DELETE'],
-                     path1,
-                     'seen_new_file'
-                 )
-             ]
-=20
--            self.assertEquals(events, expected)
-+            if events !=3D expected:
-+                print("ACTUAL:")
-+                print("")
-+
-+                for i, event in enumerate(events):
-+                    print(event)
-+
-+                print("")
-+
-+                print("EXPECTED:")
-+                print("")
-+
-+                for i, event in enumerate(expected):
-+                    print(event)
-+
-+                raise Exception("Events not correct.")
-=20
-             # This can't be removed until *after* we've read the events=
 because
-             # they'll be flushed the moment we remove the watch.
-@@ -131,7 +183,7 @@ class TestInotify(unittest.TestCase):
-                 pass
-=20
-             events =3D self.__read_all_events(i)
--            self.assertEquals(events, [])
-+            self.assertEqual(events, [])
-=20
-     @staticmethod
-     def _open_write_close(*args):
-@@ -167,23 +219,47 @@ class TestInotify(unittest.TestCase):
-         with inotify.test_support.temp_path() as path:
-             path1 =3D TestInotify._make_temp_path(path, 'aa')
-             path2 =3D TestInotify._make_temp_path(path, 'bb')
-+
-             i =3D inotify.adapters.Inotify([path1, path2])
-+
-             TestInotify._open_write_close('ignored_new_file')
-             TestInotify._open_write_close(path1, 'seen_new_file')
-             TestInotify._open_write_close(path2, 'seen_new_file2')
-+           =20
-+            wd_path1 =3D get_wd(i, path1)
-+            wd_path2 =3D get_wd(i, path2)
-+
-+
-             os.remove(os.path.join(path1, 'seen_new_file'))
-+
-             events =3D self.__read_all_events(i)
-+
-             expected =3D [
--                TestInotify._event_create(wd=3D1, path=3Dpath1, filenam=
e=3D'seen_new_file'),
--                TestInotify._event_open(wd=3D1, path=3Dpath1, filename=3D=
'seen_new_file'),
--                TestInotify._event_close_write(wd=3D1, path=3Dpath1, fi=
lename=3D'seen_new_file'),
--                TestInotify._event_create(wd=3D2, path=3Dpath2, filenam=
e=3D'seen_new_file2'),
--                TestInotify._event_open(wd=3D2, path=3Dpath2, filename=3D=
'seen_new_file2'),
--                TestInotify._event_close_write(wd=3D2, path=3Dpath2, fi=
lename=3D'seen_new_file2'),
--                TestInotify._event_general(wd=3D1, mask=3D512, type_nam=
e=3D'IN_DELETE',
--                                           path=3Dpath1, filename=3D'se=
en_new_file')
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path1, u'seen_new_file'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path1, u'seen_new_file'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path1, u'seen_new_file'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path2, u'seen_new_file2'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path2, u'seen_new_file2'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, u'seen_new_file2'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
512, cookie=3D0, len=3D16), ['IN_DELETE'], path1, u'seen_new_file'),
-             ]
--            self.assertEquals(events, expected)
-+
-+            if events !=3D expected:
-+                print("ACTUAL:")
-+                print("")
-+
-+                for i, event in enumerate(events):
-+                    print(event)
-+
-+                print("")
-+
-+                print("EXPECTED:")
-+                print("")
-+
-+                for i, event in enumerate(expected):
-+                    print(event)
-+
-+                raise Exception("Events not correct.")
-=20
-     def test__error_on_watch_nonexistent_folder(self):
-         i =3D inotify.adapters.Inotify()
-@@ -201,7 +277,7 @@ class TestInotify(unittest.TestCase):
-         i =3D inotify.adapters.Inotify()
-         names =3D i._get_event_names(all_mask)
-=20
--        self.assertEquals(names, all_names)
-+        self.assertEqual(names, all_names)
-=20
-=20
- class TestInotifyTree(unittest.TestCase):
-@@ -219,56 +295,101 @@ class TestInotifyTree(unittest.TestCase):
-             path1 =3D os.path.join(path, 'aa')
-             os.mkdir(path1)
-=20
-+            time.sleep(.10)
-+
-             path2 =3D os.path.join(path, 'bb')
-             os.mkdir(path2)
-=20
-+            time.sleep(.10)
-+
-             i =3D inotify.adapters.InotifyTree(path)
-=20
-             with open('seen_new_file1', 'w'):
-                 pass
-=20
-+            time.sleep(.10)
-+
-             with open(os.path.join(path1, 'seen_new_file2'), 'w'):
-                 pass
-=20
-+            time.sleep(.10)
-+
-             with open(os.path.join(path2, 'seen_new_file3'), 'w'):
-                 pass
-=20
-+            time.sleep(.10)
-+           =20
-+            wd_path  =3D get_wd(i.inotify, path)
-+            wd_path1 =3D get_wd(i.inotify, path1)
-+            wd_path2 =3D get_wd(i.inotify, path2)
-+
-             os.remove(os.path.join(path, 'seen_new_file1'))
-+
-+            time.sleep(.10)
-+
-             os.remove(os.path.join(path1, 'seen_new_file2'))
-+
-+            time.sleep(.10)
-+
-             os.remove(os.path.join(path2, 'seen_new_file3'))
-=20
-+            time.sleep(.10)
-+
-             os.rmdir(path1)
-+
-+            time.sleep(.10)
-+
-             os.rmdir(path2)
-=20
--            events =3D self.__read_all_events(i)
-+            time.sleep(.10)
-=20
-+            events =3D self.__read_all_events(i)
-+            events =3D sorted(events)
-+           =20
-             expected =3D [
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path, 'seen_new_file1'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path, 'seen_new_file1'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path, 'seen_new_file1'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D2=
56, cookie=3D0, len=3D16), ['IN_CREATE'], path, 'seen_new_file1'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D3=
2, cookie=3D0, len=3D16), ['IN_OPEN'], path, 'seen_new_file1'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D8=
, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path, 'seen_new_file1'),
-=20
--                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path1, 'seen_new_file2'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path1, 'seen_new_file2'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path1, 'seen_new_file2'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path1, 'seen_new_file2'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path1, 'seen_new_file2'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path1, 'seen_new_file2'),
-=20
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path2, 'seen_new_file3'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path2, 'seen_new_file3'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'seen_new_file3'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path2, 'seen_new_file3'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path2, 'seen_new_file3'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'seen_new_file3'),
-=20
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D512, co=
okie=3D0, len=3D16), ['IN_DELETE'], path, 'seen_new_file1'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D512, co=
okie=3D0, len=3D16), ['IN_DELETE'], path1, 'seen_new_file2'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D512, co=
okie=3D0, len=3D16), ['IN_DELETE'], path2, 'seen_new_file3'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D5=
12, cookie=3D0, len=3D16), ['IN_DELETE'], path, 'seen_new_file1'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
512, cookie=3D0, len=3D16), ['IN_DELETE'], path1, 'seen_new_file2'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
512, cookie=3D0, len=3D16), ['IN_DELETE'], path2, 'seen_new_file3'),
-=20
--                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D1024, c=
ookie=3D0, len=3D0), ['IN_DELETE_SELF'], path1, ''),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D32768, =
cookie=3D0, len=3D0), ['IN_IGNORED'], path1, ''),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073742=
336, cookie=3D0, len=3D16), ['IN_ISDIR', 'IN_DELETE'], path, 'aa'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
1024, cookie=3D0, len=3D0), ['IN_DELETE_SELF'], path1, ''),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
32768, cookie=3D0, len=3D0), ['IN_IGNORED'], path1, ''),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073742336, cookie=3D0, len=3D16), ['IN_DELETE', 'IN_ISDIR'], path, 'aa'),
-=20
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D1024, c=
ookie=3D0, len=3D0), ['IN_DELETE_SELF'], path2, ''),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32768, =
cookie=3D0, len=3D0), ['IN_IGNORED'], path2, ''),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073742=
336, cookie=3D0, len=3D16), ['IN_ISDIR', 'IN_DELETE'], path, 'bb'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
1024, cookie=3D0, len=3D0), ['IN_DELETE_SELF'], path2, ''),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
32768, cookie=3D0, len=3D0), ['IN_IGNORED'], path2, ''),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073742336, cookie=3D0, len=3D16), ['IN_DELETE', 'IN_ISDIR'], path, 'bb'),
-             ]
-=20
--            self.assertEquals(events, expected)
-+            expected =3D sorted(expected)
-+
-+            if events !=3D expected:
-+                print("ACTUAL:")
-+                print("")
-+
-+                for i, event in enumerate(events):
-+                    print(event)
-+
-+                print("")
-+
-+                print("EXPECTED:")
-+                print("")
-+
-+                for i, event in enumerate(expected):
-+                    print(event)
-+
-+                raise Exception("Events not correct.")
-=20
-     def test__renames(self):
-=20
-@@ -283,26 +404,30 @@ class TestInotifyTree(unittest.TestCase):
-             new_path =3D os.path.join(path, 'new_folder')
-=20
-             os.mkdir(old_path)
-+           =20
-+            wd_path =3D get_wd(i.inotify, path)
-=20
-             events1 =3D self.__read_all_events(i)
-=20
-             expected =3D [
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073742=
080, cookie=3Devents1[0][0].cookie, len=3D16), ['IN_ISDIR', 'IN_CREATE'],=
 path, 'old_folder'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073742080, cookie=3Devents1[0][0].cookie, len=3D16), ['IN_CREATE', 'IN_IS=
DIR'], path, 'old_folder'),
-             ]
-=20
--            self.assertEquals(events1, expected)
--
-+            self.assertEqual(events1, expected)
-=20
-             os.rename(old_path, new_path)
-=20
-+            wd_old_path =3D get_wd(i.inotify, old_path)
-+
-             events2 =3D self.__read_all_events(i)
-=20
-             expected =3D [
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073741=
888, cookie=3Devents2[0][0].cookie, len=3D16), ['IN_MOVED_FROM', 'IN_ISDI=
R'], path, 'old_folder'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073741=
952, cookie=3Devents2[1][0].cookie, len=3D16), ['IN_MOVED_TO', 'IN_ISDIR'=
], path, 'new_folder'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073741888, cookie=3Devents2[0][0].cookie, len=3D16), ['IN_MOVED_FROM', 'I=
N_ISDIR'], path, 'old_folder'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073741952, cookie=3Devents2[1][0].cookie, len=3D16), ['IN_MOVED_TO', 'IN_=
ISDIR'], path, 'new_folder'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D2048, cookie=3D0, len=3D0), ['IN_MOVE_SELF'], new_path, '')
-             ]
-=20
--            self.assertEquals(events2, expected)
-+            self.assertEqual(events2, expected)
-=20
-=20
-             with open(os.path.join(new_path, 'old_filename'), 'w'):
-@@ -318,21 +443,33 @@ class TestInotifyTree(unittest.TestCase):
-             events3 =3D self.__read_all_events(i)
-=20
-             expected =3D [
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], new_path, 'old_filename'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], new_path, 'old_filename'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], new_path, 'old_filename'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D256, cookie=3D0, len=3D16), ['IN_CREATE'], new_path, 'old_filename'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D32, cookie=3D0, len=3D16), ['IN_OPEN'], new_path, 'old_filename'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], new_path, 'old_filename'=
),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D64, cookie=3Devents3[3][0].cookie, len=3D16), ['IN_MOVED_FROM'], new_p=
ath, 'old_filename'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D128, cookie=3Devents3[4][0].cookie, len=3D16), ['IN_MOVED_TO'], new_pa=
th, 'new_filename'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D512, cookie=3D0, len=3D16), ['IN_DELETE'], new_path, 'new_filename'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D1024, cookie=3D0, len=3D0), ['IN_DELETE_SELF'], new_path, ''),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D32768, cookie=3D0, len=3D0), ['IN_IGNORED'], new_path, ''),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073742336, cookie=3D0, len=3D16), ['IN_DELETE', 'IN_ISDIR'], path, 'new_f=
older'),
-+            ]
-=20
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D64, coo=
kie=3Devents3[3][0].cookie, len=3D16), ['IN_MOVED_FROM'], new_path, 'old_=
filename'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D128, co=
okie=3Devents3[4][0].cookie, len=3D16), ['IN_MOVED_TO'], new_path, 'new_f=
ilename'),
-+            if events3 !=3D expected:
-+                print("ACTUAL:")
-+                print("")
-=20
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D512, co=
okie=3D0, len=3D16), ['IN_DELETE'], new_path, 'new_filename'),
-+                for i, event in enumerate(events3):
-+                    print(event)
-=20
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D1024, c=
ookie=3D0, len=3D0), ['IN_DELETE_SELF'], new_path, ''),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32768, =
cookie=3D0, len=3D0), ['IN_IGNORED'], new_path, ''),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073742=
336, cookie=3D0, len=3D16), ['IN_ISDIR', 'IN_DELETE'], path, 'new_folder'=
),
--            ]
-+                print("")
-+
-+                print("EXPECTED:")
-+                print("")
-=20
--            self.assertEquals(events3, expected)
-+                for i, event in enumerate(expected):
-+                    print(event)
-+
-+                raise Exception("Events not correct.")
-=20
-     def test__automatic_new_watches_on_new_paths(self):
-=20
-@@ -346,39 +483,60 @@ class TestInotifyTree(unittest.TestCase):
-             path2 =3D os.path.join(path1, 'folder2')
-=20
-             os.mkdir(path1)
-+=20
-+            wd_path =3D get_wd(i.inotify, path)
-=20
-             events =3D self.__read_all_events(i)
-=20
-             expected =3D [
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073742=
080, cookie=3D0, len=3D16), ['IN_ISDIR', 'IN_CREATE'], path, 'folder1'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073742080, cookie=3D0, len=3D16), ['IN_CREATE', 'IN_ISDIR'], path, 'folde=
r1'),
-             ]
-=20
--            self.assertEquals(events, expected)
-+            self.assertEqual(events, expected)
-=20
-=20
-             os.mkdir(path2)
-=20
-+            wd_path1 =3D get_wd(i.inotify, path1)
-+
-             events =3D self.__read_all_events(i)
-=20
-             expected =3D [
--                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D1073742=
080, cookie=3D0, len=3D16), ['IN_ISDIR', 'IN_CREATE'], path1, 'folder2'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
1073742080, cookie=3D0, len=3D16), ['IN_CREATE', 'IN_ISDIR'], path1, 'fol=
der2'),
-             ]
-=20
--            self.assertEquals(events, expected)
-+            self.assertEqual(events, expected)
-=20
-=20
-             with open(os.path.join(path2,'filename'), 'w'):
-                 pass
-=20
-+            wd_path2 =3D get_wd(i.inotify, path2)
-+
-             events =3D self.__read_all_events(i)
-=20
-             expected =3D [
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path2, 'filename'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path2, 'filename'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'filename'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path2, 'filename'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path2, 'filename'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'filename'),
-             ]
-=20
--            self.assertEquals(events, expected)
-+            if events !=3D expected:
-+                print("ACTUAL:")
-+                print("")
-+
-+                for i, event in enumerate(events):
-+                    print(event)
-+
-+                print("")
-+
-+                print("EXPECTED:")
-+                print("")
-+
-+                for i, event in enumerate(expected):
-+                    print(event)
-+
-+                raise Exception("Events not correct.")
-=20
-     def test__automatic_new_watches_on_existing_paths(self):
-=20
-@@ -396,16 +554,33 @@ class TestInotifyTree(unittest.TestCase):
-=20
-             with open(os.path.join(path2,'filename'), 'w'):
-                 pass
-+               =20
-+            wd =3D get_wd(i.inotify, path2)
-=20
-             events =3D self.__read_all_events(i)
-=20
-             expected =3D [
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path2, 'filename'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path2, 'filename'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'filename'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D256, c=
ookie=3D0, len=3D16), ['IN_CREATE'], path2, 'filename'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D32, co=
okie=3D0, len=3D16), ['IN_OPEN'], path2, 'filename'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D8, coo=
kie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'filename'),
-             ]
-=20
--            self.assertEquals(events, expected)
-+            if events !=3D expected:
-+                print("ACTUAL:")
-+                print("")
-+
-+                for i, event in enumerate(events):
-+                    print(event)
-+
-+                print("")
-+
-+                print("EXPECTED:")
-+                print("")
-+
-+                for i, event in enumerate(expected):
-+                    print(event)
-+
-+                raise Exception("Events not correct.")
-=20
-=20
- class TestInotifyTrees(unittest.TestCase):
-@@ -428,6 +603,9 @@ class TestInotifyTrees(unittest.TestCase):
-=20
-             i =3D inotify.adapters.InotifyTrees([path1, path2])
-=20
-+            wd_path1 =3D get_wd(i.inotify, path1)
-+            wd_path2 =3D get_wd(i.inotify, path2)
-+
-             with open(os.path.join(path1, 'seen_new_file1'), 'w'):
-                 pass
-=20
-@@ -437,13 +615,13 @@ class TestInotifyTrees(unittest.TestCase):
-             events =3D self.__read_all_events(i)
-=20
-             expected =3D [
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path1, 'seen_new_file1'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path1, 'seen_new_file1'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path1, 'seen_new_file1'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path1, 'seen_new_file1'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path1, 'seen_new_file1'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path1, 'seen_new_file1'),
-=20
--                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path2, 'seen_new_file2'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path2, 'seen_new_file2'),
--                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'seen_new_file2'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path2, 'seen_new_file2'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path2, 'seen_new_file2'),
-+                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'seen_new_file2'),
-             ]
-=20
--            self.assertEquals(events, expected)
-+            self.assertEqual(events, expected)
---=20
-2.35.5
-
diff --git a/meta-python/recipes-devtools/python/python3-inotify_0.2.12.b=
b b/meta-python/recipes-devtools/python/python3-inotify_0.2.12.bb
new file mode 100644
index 0000000000..f442d2faa6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-inotify_0.2.12.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "An adapter to Linux kernel support for inotify directory-wa=
tching."
+HOMEPAGE =3D "https://pypi.org/project/inotify/"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c16666ae6c159876a0ba63099614=
381"
+
+SRC_URI[sha256sum] =3D "9aee407f92c7d51a2ce50f3b78291a9094e334e34bd68e82=
bf60020795fa2c94"
+
+PYPI_PACKAGE =3D "inotify"
+UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+RDEPENDS:${PN} +=3D " \
+    python3-ctypes \
+    python3-logging \
+"
diff --git a/meta-python/recipes-devtools/python/python3-inotify_git.bb b=
/meta-python/recipes-devtools/python/python3-inotify_git.bb
deleted file mode 100644
index e8d88250a3..0000000000
--- a/meta-python/recipes-devtools/python/python3-inotify_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY =3D "An adapter to Linux kernel support for inotify directory-wa=
tching."
-HOMEPAGE =3D "https://pypi.org/project/inotify/"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://setup.py;md5=3D79b7ec72aa0d446a552d3cceb579=
9e41;beginline=3D28;endline=3D28"
-
-SRC_URI[sha256sum] =3D "974a623a338482b62e16d4eb705fb863ed33ec178680fc3e=
96ccdf0df6c02a07"
-
-SRC_URI =3D " \
-    git://github.com/dsoprea/pyinotify.git;branch=3Dmaster;protocol=3Dht=
tps \
-    file://new-test-inotify.patch \
-"
-
-SRCREV =3D "9be6a51d1660991562eefaaddefa757ca0e0e00f"
-
-
-inherit setuptools3 ptest-python-pytest
-
-RDEPENDS:${PN} +=3D " \
-    python3-ctypes \
-    python3-logging \
-"
--=20
2.34.1


