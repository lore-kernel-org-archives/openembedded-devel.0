Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6A6C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 06:20:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9124.1739341223748047594
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 22:20:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4138cd7834=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C4iiYs020154
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 22:20:23 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6hdm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 22:20:23 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51C6KMrb032188;
	Tue, 11 Feb 2025 22:20:22 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6hdm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 22:20:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJajPyXF6QXxWUN+KvdrMMAguCeyfiVHQke3arFd6gdKN5PX1ZxVnrRYV62mIrBZQNjVpL/yc+VyTF1n41ZvflGO+EqWwT5sugy68HbxvTdC2w78gcSmSE2QzYGLTXjpaYrV+309or/Ivt6gy9gy0XxJ0/cI5iWISXM251ahKDxfpXAnoLseZqWgBJx9jMNsE10wqw/DeAeVukyU8I1kRR0v6i8xFS6ob2+St9cmjqooOmfMyERlZp2fqntqwntAKhrepo219naIElxYNedsIIhDa/O8cEOyHH8ONM5vw+qasgdyFuAvwzt1YPyDL0c1g4ZkQNg+V/qNaH0d4Mty+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gP6qnivTHzBz1gmIVZ1NEg2wG10YFyqui4+8hx/0Fw=;
 b=nhEsTE0selWhfxRvDCmaGERvvBNMxZwqBQCsKURt8tqlXobbCGzi/9nyziUledtlrHAh4D+0T6jGDcT/tX9pjVqLlPeGZLOLlqk9ciqnOpbfTqpYHmImc35eeOLuFhX7UZ8hQSDAw50ncR847xMAs/7/1lUQtXoSvDWwQLAMrkQ8iixBftUdth0TWwVnUTZczO1SLN9GXh3roeLxR0eaPisiaknlaCog+7bjvVoJeFy7DZv7rrwdT4ufxMNG8bsylYxQVz5NrQrQVdrhcYkJ8dssw8COcML48HFe2/MQ4TqH/ctpxFaMJEy1kZAnJmYpZXUH477UB0CJ9seW9BbFEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB6914.namprd11.prod.outlook.com (2603:10b6:930:5a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.14; Wed, 12 Feb 2025 06:20:08 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 06:20:08 +0000
Message-ID: <d7cf1628-abc6-4199-8215-88898169f977@windriver.com>
Date: Wed, 12 Feb 2025 14:20:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] opencv: fix build for ppc64
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250210071226.1880278-1-yi.zhao@windriver.com>
 <CAMKF1sqHBDmaQVAuSOcML_cQ8nU-NcMEiMzSQ_3KCP76sHvRFw@mail.gmail.com>
 <378d336d-7c88-4ddf-a791-a131a0dbcc0c@windriver.com>
 <CAMKF1sqeuM_CN7mgNXq83y1CtC=43v41JH0jU9thcrLtKa3Dcw@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CAMKF1sqeuM_CN7mgNXq83y1CtC=43v41JH0jU9thcrLtKa3Dcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2P153CA0013.APCP153.PROD.OUTLOOK.COM (2603:1096::23) To
 DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: 70988d93-39a2-427d-9f0d-08dd4b2d4c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NUdFTmoxU3paeis0Zm1OTVdXSzdnTDMxRUZPdnVOSWtoSmI5UW04ZHp4VlRM?=
 =?utf-8?B?NU1WellHaldpUVg4Yk8rd1NKRTZkUXVQR3JYU3JNZEIxRldQY0crWFlIQXN3?=
 =?utf-8?B?VkErcXlZNTloMExEMVlQbjJBN3k0bHFFS05nVGlJbkNjQ1BqcGxGRHA5WndZ?=
 =?utf-8?B?eEtENDlobkx2T0FsUUdzU0g0bHVLZ3ZqY2FXdWRvOWhNUHkwbXZPdVpLTUdm?=
 =?utf-8?B?SVo4Zkt4N25rZXhnTmZHS3ZlazVOcFl1bFRDdTBGd1cwYmVaditGMmtwVFh3?=
 =?utf-8?B?U2ltTi8wYmpjYzhacWRSZk4rZnA0UzlZNkF5ZjZUbHVxM3ZWckhLODh4NVpT?=
 =?utf-8?B?S2hoZTJTV2tKZWZxczFLL1F2T1ZtRWxGQmtmZkZVUmlXYmRyUHdzVytmK1ZV?=
 =?utf-8?B?Y2dVb2VkQlh3TUpvd0lUckpPbmhVY2hiQmtVbFpaU3pIV0o4UUg5KzVIaEdW?=
 =?utf-8?B?Q2xwSlpHdlREc3VzamZiQklSTklXR2t4ekFubFRSL2UzT0NTaW5hd3I2dTFq?=
 =?utf-8?B?VS8zZnRHcFh5bWxWdm8zdzRCUjBKbVZYak1NQmtiazNTcnBLUy93aWtXQVFM?=
 =?utf-8?B?Z2hiOG9RR21qN2hOQUZIV2k1Zkl5WFdQYTJVVnVxbTNTTUl2bGFpaHZ3RXRU?=
 =?utf-8?B?eTYySHlQUXhSdldFdit4b3hNczJqUG9jT0NzYjJSN2RJMVdRMUJ4NHRCZnU0?=
 =?utf-8?B?RjVJKzZ4ME1NVnU4dU9rK0VrcHhhNWhFUTFiK3lPbkJ1T0VJbVJDQUJNRHZC?=
 =?utf-8?B?N3FYbWpSK3d4emFyUVNpWEV0dytiNjhLSGRtUDZzNkoreWt3L2xCeDVCa082?=
 =?utf-8?B?WHNrUjZyYlZHMFNjVVRFSE9Cb3VMNHZXVlI1QmFZMUhxdGc2d3dCYVc2c0c5?=
 =?utf-8?B?Q1pZSmtWZ2hnakVqS2ZxQmpqbTFYN3RLOFNGcVNJbklnYWVMVEpyaWt6Zm9R?=
 =?utf-8?B?UjFXVjc2UGxvWUlueDFCRmNaR0FqS2pJSHFSMXdSTDNKOVkyUnhFd0FsNFc5?=
 =?utf-8?B?aHA5bXJYSFlJVnk3SzVlSkJDZDVWdjBNVi91T0U5WnpJcWtSbkMwSDFUclNU?=
 =?utf-8?B?TithenBTWWpUVGhMUGwreU82VFVNdk12OWZkVkxFNDdlQnErZTBQR2c2dlcy?=
 =?utf-8?B?Sm8rUlNSaVNENmVTWEhTc2tnL3BTSkwzZXVwRjRsN01lSlo5MVpRejQwblV0?=
 =?utf-8?B?VkloVHpIL21FcEI0ZWYzT1oxNWRUTlZCVGllWktEQm9oVlRUMFZsaU1sSUZU?=
 =?utf-8?B?WlIwSjJ4TFhDRTN2SjdpbWFMaU1tYWdOOUVONG9XbnRJRG03WGpjdlNUQ0l6?=
 =?utf-8?B?ZVZJdlNHM3l2cnBMRXk2NUZSdDhPU3V5R3R4R0xlK0ZGNG5GMHBXQ01kZ2Zy?=
 =?utf-8?B?dHZzbWx6cTNLUkNPTFhVRlVtUVg5SUIwaFA1dEthVWFTa1JZUEpEbmZFN290?=
 =?utf-8?B?QmNxNTdObEl0SlU4aTZ6OEZmdEhRb0hnOVp0Tlo0WDJjc1dLZzdjdU44K0Zh?=
 =?utf-8?B?Mml5QmFEd1Y3MFJYK3paaDBMZVVadjJGOHRXRTBCQjNSNS9LY3hFdWsxRWVE?=
 =?utf-8?B?b3VWaTg2UXRRNXo5SGxINVc3bndndVNkcVV5UUQrSTRMUFgwVGRwQUxNR0Rp?=
 =?utf-8?B?ZHFmVUM3SGFQNWZ4RTRwaGloSWFaSUk1c1lPT25UbmxIWXhRVnRwQm9FcnVy?=
 =?utf-8?B?T1hlRHFhWmczMHFGN1RhYlRwT0lDWmFOekpyK3cxM1FReFlFL0JUdFlNdkFW?=
 =?utf-8?B?STFDMm1NTWdtTE9IaThUMzZUUmVweUZ4WVFMTkxheThlcWgydExQNlVaSk9r?=
 =?utf-8?B?Zi9WYlNtN1U0c1h5MDNmUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MWl2ZC9Gb2s3NExUTU84eVVQV3pCaEs1OUdnaHBGRXVKVjBaZEZNT29ub1BC?=
 =?utf-8?B?cjBYNVpDd0M0aXk5blBjTHNVWUdnVjNlcjk2dG1NYmZ5czF2ZTVzSHNvSzVa?=
 =?utf-8?B?RGhoOEtucllRanUzcmlDUzhmQmdVaVlwWWZjbm9WUDhVVDdSRWUvNWE3K3dN?=
 =?utf-8?B?MFdFNFJMVWFKeFQzZnl6RlVrWmpSY2hDdXhGZ2JraGVXb2ExcGFmMTh3MFpq?=
 =?utf-8?B?dnFDNE9jZjV2OVZaeThqL2Y3NmZuQ3J4UFc2QVNTRDU2L2VwY0JEU0xIeS9B?=
 =?utf-8?B?ZTIxK2s2QXdDWmNpNnFJSEN6RCtTbWxOSnU4Wk1EZEpjOHNyejg5dDZyTVAz?=
 =?utf-8?B?dGVMYVp2YkY3NURMNDNNZU5LbEtLNTdyNGJrOHVOMlpFS2QvMGhYTS9GMjVY?=
 =?utf-8?B?NEJScHo3WFR2K2luRm44K2xYQ3JkcG82L3JkMGEzZ29YNStBVW40QS9FeWQv?=
 =?utf-8?B?U0lua2x5ZzFLeUJENG1yd1Noei9jQzhKOFg1eTdRN3h5Tm13WFV4Vi94SGM1?=
 =?utf-8?B?WnZLRnpsVmE2L0NQRVRqTkxETVFxMmtVY3drQTRoRzZzSnA0NVRtNkJTUmZP?=
 =?utf-8?B?WDFYait3SWZrd2s1N0V6RDRwUXdsVzMxdlJqY2wwTHJ6YVVEVkROR21XODVn?=
 =?utf-8?B?ZzJiS0NjdE1TNzN3SzJEYklDZjNXdUtsWXFMT2ZSaFFkQ2RDNWxOZ0N0dWox?=
 =?utf-8?B?SjdFOThja0EzdktPRUdxQ1V6NkZXcFVQUWwza2IzZlV2dEc1T2ZNdEtoM1N1?=
 =?utf-8?B?bW1WSDUxZFVQL1JwZ2JWMDU4R1czTjl1OE93dDUyKzZBTjNjLzM1SDNHdzRJ?=
 =?utf-8?B?MCszZERSMFJrM0ZjQlZUUzZ6UWlNKzFIaGRrbDVkb2VQTzB1QXFtSVpEZUVy?=
 =?utf-8?B?VzA2U3dqUWt4eGY3OVdVa3gwQ1VFeSsvWm8zWHNXa1FyTGtHNExNQW9Kd0g5?=
 =?utf-8?B?NnBDdU8wUUZQNlpuQk5qTWdqdnBva0JrUm1uVzllMTBPa1VFR25xY25pYWtY?=
 =?utf-8?B?bEJ6Qytlakpobm5yeHJFVHIvbUhaUHlkVEJ2b2VQdmJXN1ZNb0tlV2M5Mm1E?=
 =?utf-8?B?cDl2Sk5OM1dGRmN3aEd0bTFrUkl5Unk5RmlHSVhqWVJ3bVR4U3A0ZmppSEFW?=
 =?utf-8?B?NDQ0VTcxV21tbXF1RDBRRlRCOE8xZjdWWDh4VXBHamJ1ZjlnTTB6VFZDR0Jm?=
 =?utf-8?B?R2YydnNINHBGQ25VeitCeW1pTFBFcGNlVzJETUxFejllM3lwM1FNaTJTUDV5?=
 =?utf-8?B?VWs3K0FzZmFTVFFCaDFwTnBFRDBlS3pjcVEvOVJVR2E1ejU0N2VoeG5LbW9W?=
 =?utf-8?B?eVd0OGtBMUh4SHFiR2lKSWc0RlZtZ1ZLVWZSMHBjWmRjK1FpR1Z0U0NGYndp?=
 =?utf-8?B?dW0vT1F2Rm4xdWVFMDhNUkNkWGlqQzg2K0ZzUTZVbnpkUU1XbHlOQUdCR3Nn?=
 =?utf-8?B?NTNwQ3pGNGxzcjUwUXFWVVh5ay9TamhhbVV3dktleWh3SXFaWUkvNGpBa01Y?=
 =?utf-8?B?Q3loaDB1SS92Rlp4V3RmVnZKdWxjeDFBZ1B2UitCaGIrZ3JIbzZHdkEwVjRH?=
 =?utf-8?B?bFlWdmQwWWtwamZySmloN29RdzZBdVhCZmpQWHFxZ3pkM2xTT2xhYkJ4bWZr?=
 =?utf-8?B?cVJYMEFjTk5RdHh3d1BqNzNJY21uSW9DY2xrVXNnMXlqTFVXNWFoR21zTFdR?=
 =?utf-8?B?V3MrVHVhR0VmR0NBckduYzAwOFQyZU5SYkhLNDRJVjdWSjZtVHFJSDNockJx?=
 =?utf-8?B?VEhCTGQ0MndjSTI0Q3JjUFNkeVZoUnVESURzdVplZVVnWVZrVm5jWGhxSXJv?=
 =?utf-8?B?MkJxQ3loWVYyUXlFR05kZVZ1U1dhRUZIQWNybEVGeURZRTVlbktvYlFGNDlJ?=
 =?utf-8?B?dm9FWEg0YjBSNzJTdzB0eVpkS3ZnQ2tBTy9sNDdmZGJkMlg1djdEYTZUN3pB?=
 =?utf-8?B?SlVJSFMvWWZ4K0JVK0tndXlrVWJzVzJESmliQW91aHpXU01XMXE2VmpXMi9L?=
 =?utf-8?B?Q1NqeVdWQkx1MVZHRGxEQ2FENXp1ZU9TOFN6elNMVTJxRmF6U0kyMW05aUFn?=
 =?utf-8?B?MHJ0TFZabnpES1k4L3dPdkFMdWROa3hGVlVrQkRFbDBYWXNGci9EN056WTdI?=
 =?utf-8?Q?BAepx98H1IJsO8zDKrx86BRNJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70988d93-39a2-427d-9f0d-08dd4b2d4c2c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 06:20:08.1273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCzdnAURZ9e2oIpsWVpB8uLnt+nGr9uvaZfwuSIXSXgG1mtNo4QzVXEoWPXI/U2lOZZkM1Sp3zn88WJSykOlIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6914
X-Proofpoint-GUID: 0yCSCO25nkkkJNqHYYZlVlX--1BodHzm
X-Proofpoint-ORIG-GUID: kZBzIwbTEMEsycwgT6GD1Zh5zbB37eAn
X-Authority-Analysis: v=2.4 cv=G8nmE8k5 c=1 sm=1 tr=0 ts=67ac3da7 cx=c_pps a=CmjB6Nkc3E8pi8fe8piFzA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=YycfQnBmCMkLQiiEzXQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502120048
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51C4iiYs020154
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 06:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115438


On 2/12/25 14:05, Khem Raj wrote:
> On Tue, Feb 11, 2025 at 10:00=E2=80=AFPM Yi Zhao <yi.zhao@windriver.com=
> wrote:
>>
>> On 2/11/25 01:19, Khem Raj wrote:
>>> On Sun, Feb 9, 2025 at 11:12=E2=80=AFPM Yi Zhao via lists.openembedde=
d.org
>>> <yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>>>> Backport a patch to fix build for ppc64:
>>>> modules/core/include/opencv2/core/hal/intrin_vsx.hpp:265:75: error: =
expected primary-expression before 'v'
>>>>     265 | template <> inline _Tpvec v_setall_(_Tp v) { return v_seta=
ll_##suffix(_Tp v); }       \
>>>>         |
>>>>
>>>> Also fix QA issue:
>>>> ERROR: QA Issue: File /usr/src/debug/opencv/4.11.0/modules/core/arit=
hm.vsx3.cpp in package opencv-src contains reference to TMPDIR [buildpath=
s]
>>>> ERROR: QA Issue: File /usr/src/debug/opencv/4.11.0/modules/core/conv=
ert.vsx3.cpp in package opencv-src contains reference to TMPDIR [buildpat=
hs]
>>>>
>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>> ---
>>>>    ...-fixed-VSX-intrinsics-implementation.patch | 61 ++++++++++++++=
+++++
>>>>    .../recipes-support/opencv/opencv_4.11.0.bb   |  7 +++
>>>>    2 files changed, 68 insertions(+)
>>>>    create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-cor=
e-fixed-VSX-intrinsics-implementation.patch
>>>>
>>>> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-core-fixed-V=
SX-intrinsics-implementation.patch b/meta-oe/recipes-support/opencv/openc=
v/0001-core-fixed-VSX-intrinsics-implementation.patch
>>>> new file mode 100644
>>>> index 0000000000..9fc89e4244
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-support/opencv/opencv/0001-core-fixed-VSX-intr=
insics-implementation.patch
>>>> @@ -0,0 +1,61 @@
>>>> +From 97f3f390661f2fd1168336820b89eb4383ce8528 Mon Sep 17 00:00:00 2=
001
>>>> +From: Maksim Shabunin <maksim.shabunin@gmail.com>
>>>> +Date: Fri, 10 Jan 2025 18:34:11 +0300
>>>> +Subject: [PATCH] core: fixed VSX intrinsics implementation
>>>> +
>>>> +Upstream-Status: Backport
>>>> +[https://github.com/opencv/opencv/commit/97f3f390661f2fd1168336820b=
89eb4383ce8528]
>>>> +
>>>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>> +---
>>>> + modules/core/include/opencv2/core/hal/intrin_vsx.hpp | 10 +++++---=
--
>>>> + 1 file changed, 5 insertions(+), 5 deletions(-)
>>>> +
>>>> +diff --git a/modules/core/include/opencv2/core/hal/intrin_vsx.hpp b=
/modules/core/include/opencv2/core/hal/intrin_vsx.hpp
>>>> +index 2157e1e870..0a0915a22f 100644
>>>> +--- a/modules/core/include/opencv2/core/hal/intrin_vsx.hpp
>>>> ++++ b/modules/core/include/opencv2/core/hal/intrin_vsx.hpp
>>>> +@@ -262,7 +262,7 @@ OPENCV_HAL_IMPL_VSX_EXTRACT_N(v_float64x2, doub=
le)
>>>> + inline _Tpvec v_setzero_##suffix() { return _Tpvec(vec_splats((_Tp=
)0)); }             \
>>>> + inline _Tpvec v_setall_##suffix(_Tp v) { return _Tpvec(vec_splats(=
(_Tp)v));}          \
>>>> + template <> inline _Tpvec v_setzero_() { return v_setzero_##suffix=
(); }               \
>>>> +-template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_##suf=
fix(_Tp v); }       \
>>>> ++template <> inline _Tpvec v_setall_(_Tp v) { return v_setall_##suf=
fix(v); }       \
>>>> + template<typename _Tpvec0> inline _Tpvec v_reinterpret_as_##suffix=
(const _Tpvec0 &a)  \
>>>> + { return _Tpvec((cast)a.val); }
>>>> +
>>>> +@@ -650,11 +650,11 @@ OPENCV_HAL_IMPL_VSX_SELECT(v_float64x2, vec_b=
dword2_c)
>>>> + #define OPENCV_HAL_IMPL_VSX_INT_CMP_OP(_Tpvec)                 \
>>>> + inline _Tpvec v_eq(const _Tpvec& a, const _Tpvec& b)           \
>>>> + { return _Tpvec(vec_cmpeq(a.val, b.val)); }                    \
>>>> +-inline _Tpvec V_ne(const _Tpvec& a, const _Tpvec& b)           \
>>>> ++inline _Tpvec v_ne(const _Tpvec& a, const _Tpvec& b)           \
>>>> + { return _Tpvec(vec_cmpne(a.val, b.val)); }                    \
>>>> + inline _Tpvec v_lt(const _Tpvec& a, const _Tpvec& b)           \
>>>> + { return _Tpvec(vec_cmplt(a.val, b.val)); }                    \
>>>> +-inline _Tpvec V_gt(const _Tpvec& a, const _Tpvec& b)           \
>>>> ++inline _Tpvec v_gt(const _Tpvec& a, const _Tpvec& b)           \
>>>> + { return _Tpvec(vec_cmpgt(a.val, b.val)); }                    \
>>>> + inline _Tpvec v_le(const _Tpvec& a, const _Tpvec& b)           \
>>>> + { return _Tpvec(vec_cmple(a.val, b.val)); }                    \
>>>> +@@ -1507,7 +1507,7 @@ inline v_float64x2 v_dotprod_expand(const v_i=
nt32x4& a, const v_int32x4& b, cons
>>>> + inline v_int32x4 v_dotprod_fast(const v_int16x8& a, const v_int16x=
8& b)
>>>> + { return v_dotprod(a, b); }
>>>> + inline v_int32x4 v_dotprod_fast(const v_int16x8& a, const v_int16x=
8& b, const v_int32x4& c)
>>>> +-{ return v_int32x4(vec_msum(a.val, b.val, vec_int4_z)) + c; }
>>>> ++{ return v_add(v_int32x4(vec_msum(a.val, b.val, vec_int4_z)), c); =
}
>>>> + // 32 >> 64
>>>> + inline v_int64x2 v_dotprod_fast(const v_int32x4& a, const v_int32x=
4& b)
>>>> + { return v_dotprod(a, b); }
>>>> +@@ -1518,7 +1518,7 @@ inline v_int64x2 v_dotprod_fast(const v_int32=
x4& a, const v_int32x4& b, const v_
>>>> + inline v_uint32x4 v_dotprod_expand_fast(const v_uint8x16& a, const=
 v_uint8x16& b)
>>>> + { return v_dotprod_expand(a, b); }
>>>> + inline v_uint32x4 v_dotprod_expand_fast(const v_uint8x16& a, const=
 v_uint8x16& b, const v_uint32x4& c)
>>>> +-{ return v_uint32x4(vec_msum(a.val, b.val, vec_uint4_z)) + c; }
>>>> ++{ return v_add(v_uint32x4(vec_msum(a.val, b.val, vec_uint4_z)), c)=
; }
>>>> +
>>>> + inline v_int32x4 v_dotprod_expand_fast(const v_int8x16& a, const v=
_int8x16& b)
>>>> + {
>>>> +--
>>>> +2.25.1
>>>> +
>>>> diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-=
oe/recipes-support/opencv/opencv_4.11.0.bb
>>>> index 07b3a9d9e6..1613b6a3ed 100644
>>>> --- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
>>>> +++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
>>>> @@ -31,6 +31,7 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;na=
me=3Dopencv;branch=3D4.x;protocol=3Dht
>>>>               file://download.patch \
>>>>               file://0001-Make-ts-module-external.patch \
>>>>               file://0008-Do-not-embed-build-directory-in-binaries.p=
atch \
>>>> +           file://0001-core-fixed-VSX-intrinsics-implementation.pat=
ch \
>>>>               "
>>>>    SRC_URI:append:riscv64 =3D " file://0001-Use-Os-to-compile-tinyxm=
l2.cpp.patch;patchdir=3Dcontrib"
>>>>
>>>> @@ -208,4 +209,10 @@ do_install:append() {
>>>>        if [ -f ${D}${bindir}/setup_vars_opencv4.sh ]; then
>>>>            rm -rf ${D}${bindir}/setup_vars_opencv4.sh
>>>>        fi
>>>> +
>>>> +    for fn in arithm.vsx3.cpp convert.vsx3.cpp; do
>>>> +        if [ -f ${B}/modules/core/$fn ]; then
>>>> +            sed -i -e 's,${S},/usr/src/debug/${PN}/${PV},g' ${B}/mo=
dules/core/$fn
>>>> +        fi
>>> Do we know why the absolute paths are being emitted ?
>>
>> arithm.vsx3.cpp and convert.vsx3.cpp are wrapper files generated durin=
g
>> build to include other header files with absolute paths. This is becau=
se
>> VSX3 feature is enabled by default on ppc64 cpu.
> OK. Are they generated using flex/lex ? there are options in flex
> called --noline to remove them during generation phase

Not flex/lex. It uses a=C2=A0 macro ocv_add_dispatched_file defined in cm=
ake=20
file: cmake/OpenCVCompilerOptimizations.cmake


//Yi



