Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A811075269
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 00:54:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12364.1774400060935240279
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 17:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LYUB8Fin;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7544ec598e=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4t2o52093647
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 17:54:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=+uzeSZ2O4UYElZOgaMGtt+mAPs/EHkffrVR/vHlU01s=; b=
	LYUB8FinqgZnCAHIB2wO1QK/kh62Xe5DE87WA43GuKsNEvWJRAUf7zdKTgrCYz8t
	KAwXaGYo9QEooqiMtELl759SuZFNMmVE5Q6wYisRae1KP4sJ+Zofkp/uHjgbXOSw
	Am0GXYro44kLGTauty6nGARIreh/JmjpXxoVA4vhN8+hXU3SYIvAEFKzx8CDraOG
	d/ts+BG3KhnqUeXQRMMygBbVTdyF6bDTAHCgfxnK42qko8awrV8lMASwVwX4RuXu
	WlLVmV2b5kOsjSIzxygSlqqywxlXj1z84iaGJ+6Q8QAwrB5vQwswIyQ5vgrv6IR2
	ByKNrHBmu1aY9cRORxflDg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012013.outbound.protection.outlook.com [52.101.43.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1tucuyxr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 17:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/o7neKThC41T4COu/JRkqGPsd1NbCYsl/eHYjoPsfStFGD3LRbmVihyOKwG5Nf0KbDcjgzNn5XDGzhV4Hb3QPbag+oVkacb3TWCTi3XWvNGv5c+e3PLswYTCu+pAEe3a2pEGZSDjP1bWd4WwpIOMqhDa+GZw90jdc9nBDBH3lj7xLQch7tKAIC0LCqJxAai3hZ/jM3UlZfliV/OG5wA+pJSiG7JaN0+RTP37QbO2ORjLwlSlYeCOprAsfXfmjK9ilDpkgqD3OnNrOflxlTWfjFnqohRwdJ15qeKKCsR1hXhOUJD71yqjUDbKvJgxwdslZ9bI7CCjGCXZh9uZsGHhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uzeSZ2O4UYElZOgaMGtt+mAPs/EHkffrVR/vHlU01s=;
 b=mWtVm8l9mx7l/e7mSuwqu6cBKtzmQU/RLzVrWFwzLyk+v5nNFEIfMPp/BD0Osip01LieQ/eVfEdHTKIoYFcNg3HlZ5WummERXRgWzuQR/GFvqeuuJvpHdoCgtKTuPc2GXbYV2x4opLiSfQBPNi0Psb4X6X6cEgphiRsZYJAzD8hTdKoeZaNzZi/JClOXv0ZHNKTYPulvMquOLHeYYKjLN69iQ1ChCVOu3Bcf0qdYfK8pOWm8AO2PrrqoqgyuQU0cop2K4HvHZjRFEDYanf+6/AfgYlqbZ34+Z9T/QTVZFTDr055+OLgK4DhG5lNtoHXRad7MP7wr22q2Yseu5fm+eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by LV8PR11MB8698.namprd11.prod.outlook.com (2603:10b6:408:205::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 00:54:17 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::9fca:dc5d:4230:e12e]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::9fca:dc5d:4230:e12e%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 00:54:17 +0000
Message-ID: <23edc667-003c-4ced-af66-5d802f1a6636@windriver.com>
Date: Wed, 25 Mar 2026 08:54:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH 2/2] netcf: Stick to shell
 implementation of gnulib-tool
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
References: <20260322182651.4090587-1-khem.raj@oss.qualcomm.com>
 <20260322182651.4090587-2-khem.raj@oss.qualcomm.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <20260322182651.4090587-2-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0192.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::21) To SN6PR11MB2589.namprd11.prod.outlook.com
 (2603:10b6:805:53::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2589:EE_|LV8PR11MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: ce01e6c5-1021-490d-7b3e-08de8a090a93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|42112799006|4022899009|1800799024|366016|376014|7053199007|17002099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	0+kfykiA7AbWPs3NqpZQwPm20SA+SXgoRCYPYSgT2s5cJLxy03hQ55UlRRRTC1iQ2kjNoX4lSBZsyKY/B04Je+1FWSg5ky5d3npMsIVT8N8cAKLg0BS7Qr3aLjZqqopcUcYRrOnptK7whHvq3XCOrpe2it8uSTH+IKm6mTw3mfavUeLoeWOVu30cJ2aqCgTuHDFSfC1GNiR0jiGXRv8fC73e6Y9Sy9rg+hTRDDtY2TEzxlM8O21CtIl9mTHsQRJ5q0KA9/GHxXczrAnZ3gP245DtlOF4QyWCur7Ve9luDb4Im6LA9GzzDzMj0OaK8/fZkPZRkJnpLD+CQeVLSqyqcHtNI2BiWaXyEIcv0LeAXtaPv5p9/0mHwz4MAAIn0aZHsKXM91BJElrDbDyjuljksU5J/kAft9IY7+AU3ye1v52OE3LvYlBA08mot8ayMyW4vrZa1FA6XaUOZ4glQMXp7FdJg0VZplUKaOFJd7oMXv2FR9f10qmp3o3WCPgsMcZGreOSrxC5vhRBt1OwWnygCHiGG7Ei7ffi7FIbwSrJM3A6wS6RedXSf0/xlfRB9df+e2pURVdjRJABSnWv8hPQxJmQ99jqvp4grR8IRAwDDel3aICd7Z+AASDo4zuAGuB4P9LfE+imhvpm5VBONHC2YrsnJTmI/nIdp5VpCjKzQKzIDDLvs96JmyWgHR9KhPKq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2589.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(4022899009)(1800799024)(366016)(376014)(7053199007)(17002099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eW5KUU9NL0hUNk1lSUNLMTcxREI3bWdNcEJsS2lFR01UNHFuS3c3Ri9Eb1dR?=
 =?utf-8?B?Z0hYeHdyUXE1NDZsY1B1ZVVuejZWa0xrdU1OK21VUXQ0cnN6bXd4YVBXWHpN?=
 =?utf-8?B?VjVVbXZSZStaSjNOL254SkJSS1dWNFRiTTE0Z1AwRW51bjlWcldpMFUwcmhP?=
 =?utf-8?B?WnF6TkNEWnhrUW5hRDF6MHZCZXdRWXdMcWVSTnlSVzBsa3Q5bE1QVG1GMEpI?=
 =?utf-8?B?am1ORTF0VFZ1V2wwOCtTZnFNaEZFcFpLcWF0T0ZtMWVybHlZaTUyQ20xVVJU?=
 =?utf-8?B?YlBmYXRiZ01MVTJZcnhKTGovcXh3cnRzZFF3QlBzNzh5ck9iVmtWQzR3aU9S?=
 =?utf-8?B?UG1tK1d3aGxRZVJSZjk4OGh1OG11VlpubFBqNU10UWUzQTh5TGg5V28rM3N4?=
 =?utf-8?B?TmNJYWRHVk1OQmZNZU5CUWlqWEprMEZhWnpwVWdMRk1hUU9nVUd0MThsMm43?=
 =?utf-8?B?OXlQK1IzdSsvai9kR1l6VGpKcEthSW1CU1k2MlJqK1I0V0plSkdXb1BvVGln?=
 =?utf-8?B?Sko4RnN5RGJscmwrcGlyTUFWUmJ5cXExNVc5NHBNZVBNL2orNUs2L1Y3Y3pI?=
 =?utf-8?B?MU9ySjAxRGpvUXliVU5xM2pYZDhYYms1OHdLQmJtOGhBTksyR25wQXhEdUdZ?=
 =?utf-8?B?Sm9hWW44Zzc3Zkg2RUdaaExyZ0xoUld6ZmtnampvN2Zvb3BvQUNXdDBOS1Z0?=
 =?utf-8?B?OG9ENU5lMG1PdTNreksxSi9PZk9rcVhFZVI1UjVlOHkySWN5VUNyaGdwL0hD?=
 =?utf-8?B?TllWUEZYTFB3WFZhY0JtVjRwNEhqYWRtWjJXRXYrRTdBZ2FoQXc1cGtFeThL?=
 =?utf-8?B?QVZSbVNwMFBFdnNNdG9FbitydDcwTnpKd25rWTJDTVZjb1dFektQbXRZWFRQ?=
 =?utf-8?B?NlM2SlVRNFhNV3FjcVFGWmlxT2lBL20wWnd1a2E0UlljY3cyK3gzUnVyckpa?=
 =?utf-8?B?NWtMQ2FXOXdBaWtDMnllQXhHSkxkVUxkczYvdCs1NnJ0Ky9zQnZDeTAyZ3lJ?=
 =?utf-8?B?OHR2SlRka1dkSkxJczZBZmVCeEkrVTdIQ0JEMTlsUGMzVXpwVlZ6L0Q0aVJ5?=
 =?utf-8?B?bHh3bTNSZFlEZ2ptaDZKZ0pnOFQyWWowMkk3VkIvbVJrV2svb2FhOTRGKzdu?=
 =?utf-8?B?TlBzU2Q2aFp1RVlsTHdSRFhBS2RjYXd4S0hMYkNKQXEzSHhmNms5M25xUGNV?=
 =?utf-8?B?SlBDYTRkZ2YyY1d2NHUzVTdYQkNNdFNFblpiR0tvaXRManhHbUZlaGFXTUx2?=
 =?utf-8?B?MDRhbC9sRkRXMEFhTlBoU28vcjl1NmwvZVpqSkVHcXlmUnpmc1c2K1Vadk95?=
 =?utf-8?B?NFhjMlNuV0wyZUZ5NjVjWnMzdlJ2ZGRFaXZ0QnFpa3hER3d2ck9mKzc4ajJl?=
 =?utf-8?B?ZmRYN3RvWFdrLzlubmk4OGtXbWFQazlQSWRCMklCdXdHbTZWbzFYdndMdExi?=
 =?utf-8?B?VlV1Q2N4YjNhS1VONi9ybCtOaEZDRkNvR01TOU4xVzdOTlM4Y1NLYTdUVWJv?=
 =?utf-8?B?cE4vVGt3NkRXTkwxV2RkSFlqZGFpM2JjUEtIa1hBMzBHQ1hZR0Y3cEtOTXBZ?=
 =?utf-8?B?UC95dVNwa1NMcldjdHlQOVcvaHZKTUVLWXNNNDI4V2VXcjh6MTB4RytZUURy?=
 =?utf-8?B?T2RsMnRZZWg5ejdRdlhhSkxLbFMwS3NBZE03NTQ1YzZpTFpMWmpZRkF5SDJu?=
 =?utf-8?B?bVNjTFAvUWdiZEkwby95Umw3SThiTmdnY2ZaS3NjWkszcVdmRmVOYThuUTJv?=
 =?utf-8?B?NHNzTlFpL3VhSUIrRkYzdHBUVzA3TVNIWkI5Q1JUT3hqRndDVFh4RGlFejc5?=
 =?utf-8?B?ekYxVTAvZlp5Um91VnpEUW42QnB1MitVMGJJOGhXKzQ4Z3hEa3ZYbTlJVnZE?=
 =?utf-8?B?NXh1ckZtdHNmTkcxQ0VyR3kxd2xLRVlPYXVIT051UE9QTFFjYnk5dEZ4SG53?=
 =?utf-8?B?bTlpRGpDaWRvMnEwVS9MRTZYaHhaQzZmR3p0SEVSbk5FMmRGTTY0UkRNTWxT?=
 =?utf-8?B?YnZJdmRaN1ZxMlZrd1lKNFNtYUlyamorWDVCTmQwZVFvb2cvZ25WQVBKeHZS?=
 =?utf-8?B?aFdBZ3l5dVVIaWVTZE9CYVh5VnB3YTZ6ZVBGd294VVdUeUVwTU43ZXhpK00x?=
 =?utf-8?B?WkQ5M0VnMUhLWU9wdncrU0haOWVmVi9lZFV6dUk4V0FUN2d6QVVydHJERVhj?=
 =?utf-8?B?Y2lxMEpDYUhvbC9PWWR3bjdUaEsyRldybnFORW5USGJ5dGFQZjc2RHM0UVND?=
 =?utf-8?B?WW5mUTEvWEF0V2ErS01pUjd1ZVBFRTFmanE5TW1LRlJZRmllOXJpUmlBM3VK?=
 =?utf-8?B?ZFBsbzJoT2pBNW5LRWlQeDRMZDdXWUJvVUhoYUQwaHJvNHlHNGJndz09?=
X-Exchange-RoutingPolicyChecked: 
	UH8q4k8ZaBZJNy33DcqAXLn85PnQfDXmzBHpWtlcJF7X9zxn+U0bQEXECB+CrJM940aAacW6r8D/TYSTWzDH0oQcHG9DukFLSY1EDy7T7kFBqNDFKj9E39JWiMz7IE75oTTjZCnCmQOQm1yX4k94r2M02IV0H83lolWnuq9J04DMUE+2LEQ3qEPX3bFkjjCTWp5GprvSnMJBMG+gAYdaac2w+nbAWQam0llxQH2sl3H7zY4guAgjXP40EXwnQ0+DYGr07XUyKtckDtM16+SDdZol4PuLBWhw2fJJbZF/4H2LICKwfEvZ8glaCB9Kju1+4VH7X9MuvwEOWoVTMGV+Dw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce01e6c5-1021-490d-7b3e-08de8a090a93
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 00:54:17.3341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NUvj68LHZ4rMjfVXk1E9s9177c64mg9Zsuw/WtyN0X+hlBAwFFtr6D636MhMWV4wB3w3eFRBFfjgw9Es4TzJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8698
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 2ITje12bqWSqRMZWoGdgRckwMt9eDNIY
X-Proofpoint-ORIG-GUID: -Jf2G5DI805lVAj1grt_HWe1CNpL9a9W
X-Authority-Analysis: v=2.4 cv=deCNHHXe c=1 sm=1 tr=0 ts=69c3323c cx=c_pps
 a=Whz0XdwTh4CxRjET/SubaQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=qykAOxvNOaOgjzZ_PZEA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAwNCBTYWx0ZWRfXw1Bb7bA1MgSe
 m8ed3a3XxLE3OfWoYXlUV7U1BuRf5/cv2aEHhyTA6nxqsomjTHoURvHu9lXUk9MyGQ5UNKbCx/h
 80dnEXZISUn5Ifdb7//QB6fYX1/Izn2m29cHX5aQS9IEOohVhzeQENriPqb232LL4hit4ovBYdv
 AKB/eTAR0uQFc+BJa+DeCPMuzBHdwHwkFI/khi2CQAm7cOdvnALiLTdUqbYFR8i4HdR6ROZqp/L
 D8mpuYdC+Qkdb6A9pxnJXAStKjCHKKxIVeIjRd/g193GW5jHyYOwcKy5ssiVsbCixrr8nRP9d3z
 EmXWYqt0AMe3FcYRfbYS6b2WGG9ffmJgxvmLAEKxnpFOorp6FgV27m7aDQK6F334KSEQeGrgykY
 lJjTtNULtAG4IZE6WzgP9pTEfDA/1fdYRhI114OL9qqs99tbd20x5RJzgqAcwdSb0t0btLHEIrP
 ucM8O3sQJn8kOzqMX7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250004
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 00:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125593

On 3/23/26 02:26, Khem Raj via lists.openembedded.org wrote:
> Fix build with newer autotools and gnulib
>
> Newer gnulib use python implementation by default if it
> finds py3 on the system. However, netcf is old package
> and its not expecting python implementation, therefore
> make the shell implementation be used.
>
> REALLOC_N is gone in latest gnulib so house a local
> macro
>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
>   ...nulib-read_file-fread_file-signature.patch | 41 ++++++++-----
>   ...bootstrap-with-newer-gnulib-automake.patch | 61 +++++++++++++++++++
>   .../recipes-support/netcf/netcf_0.2.8.bb      |  6 +-
>   3 files changed, 91 insertions(+), 17 deletions(-)
>   create mode 100644 meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch
>
> diff --git a/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch b/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch
> index b188248fff..83fdfded52 100644
> --- a/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch
> +++ b/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch
> @@ -17,11 +17,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    src/ncftransform.c | 2 +-
>    4 files changed, 5 insertions(+), 5 deletions(-)
>
> -diff --git a/src/dutil_linux.c b/src/dutil_linux.c
> -index 742153a..eb72eb2 100644
>   --- a/src/dutil_linux.c
>   +++ b/src/dutil_linux.c
> -@@ -1113,7 +1113,7 @@ static void add_link_info(struct netcf *ncf,
> +@@ -1113,7 +1113,7 @@ static void add_link_info(struct netcf *
>
>        xasprintf(&path, "/sys/class/net/%s/operstate", ifname);
>        ERR_NOMEM(!path, ncf);
> @@ -30,7 +28,7 @@ index 742153a..eb72eb2 100644
>        if (!state) {
>            /* missing operstate is *not* an error. It could be due to an
>             * alias interface, which has no entry in /sys/class/net at
> -@@ -1132,7 +1132,7 @@ static void add_link_info(struct netcf *ncf,
> +@@ -1132,7 +1132,7 @@ static void add_link_info(struct netcf *
>            FREE(path);
>            xasprintf(&path, "/sys/class/net/%s/speed", ifname);
>            ERR_NOMEM(path == NULL, ncf);
> @@ -39,11 +37,9 @@ index 742153a..eb72eb2 100644
>            if (!speed && errno == EINVAL) {
>                /* attempts to read $ifname/speed result in EINVAL if the
>                 * interface is ifconfiged down (which isn't exactly the
> -diff --git a/src/dutil_posix.c b/src/dutil_posix.c
> -index 1313514..b9884f0 100644
>   --- a/src/dutil_posix.c
>   +++ b/src/dutil_posix.c
> -@@ -211,7 +211,7 @@ int run_program(struct netcf *ncf, const char *const *argv, char **output)
> +@@ -211,7 +211,7 @@ int run_program(struct netcf *ncf, const
>                           "Failed to create file stream for output while executing '%s': %s",
>                           argv_str, errbuf);
>
> @@ -52,11 +48,9 @@ index 1313514..b9884f0 100644
>        ERR_THROW_STRERROR(*output == NULL, ncf, EEXEC,
>                           "Error while reading output from execution of '%s': %s",
>                           argv_str, errbuf);
> -diff --git a/src/ncftool.c b/src/ncftool.c
> -index f1b5642..c878cb0 100644
>   --- a/src/ncftool.c
>   +++ b/src/ncftool.c
> -@@ -351,7 +351,7 @@ static int cmd_define(const struct command *cmd) {
> +@@ -351,7 +351,7 @@ static int cmd_define(const struct comma
>        struct netcf_if *nif = NULL;
>        int result = CMD_RES_ERR;
>
> @@ -65,8 +59,6 @@ index f1b5642..c878cb0 100644
>        if (xml == NULL) {
>            fprintf(stderr, "Failed to read %s\n", fname);
>            goto done;
> -diff --git a/src/ncftransform.c b/src/ncftransform.c
> -index fbabfc3..4c9a56d 100644
>   --- a/src/ncftransform.c
>   +++ b/src/ncftransform.c
>   @@ -54,7 +54,7 @@ int main(int argc, char **argv) {
> @@ -78,6 +70,25 @@ index fbabfc3..4c9a56d 100644
>        if (in_xml == NULL)
>            die("Failed to read %s\n", argv[2]);
>
> ---
> -2.44.0
> -
> +--- a/src/internal.h
> ++++ b/src/internal.h
> +@@ -30,6 +30,7 @@
> +
> + #include <string.h>
> + #include <stdarg.h>
> ++#include <stdlib.h>
> +
> + #include <libxslt/transform.h>
> + #include <libxml/relaxng.h>
> +@@ -85,6 +86,11 @@
> + #define ATTRIBUTE_NOINLINE
> + #endif                                   /* __GNUC__ */
> +
> ++#ifndef REALLOC_N
> ++# define REALLOC_N(ptr, count) \
> ++    (((ptr) = realloc((ptr), sizeof(*(ptr)) * (count))) == NULL ? -1 : 0)
> ++#endif
> ++
> + /* This needs ATTRIBUTE_RETURN_CHECK */
> + #include "ref.h"
> +
> diff --git a/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch b/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch
> new file mode 100644
> index 0000000000..62daeff812
> --- /dev/null
> +++ b/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch
> @@ -0,0 +1,61 @@
> +From dded6e3321e304f50922e61c553d4e4eb0f80fd0 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <khem.raj@oss.qualcomm.com>
> +Date: Sun, 22 Mar 2026 11:05:34 -0700
> +Subject: [PATCH] netcf: fix bootstrap with newer gnulib/automake
> +
> +Upstream netcf is old enough that bootstrap/autoreconf now trips over:
> +- gnulib-tool.py wrapper expectations in newer gnulib
> +- stricter automake handling of AM_CFLAGS += from generated gnulib.mk
> +- subdir source warnings
> +- deprecated INCLUDES usage
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> +---
> + configure.ac             | 2 +-
> + gnulib/lib/Makefile.am   | 2 +-
> + gnulib/tests/Makefile.am | 2 ++
> + tests/Makefile.am        | 2 +-
> + 4 files changed, 5 insertions(+), 3 deletions(-)
> +
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -3,7 +3,7 @@ AC_CONFIG_SRCDIR([src/netcf.c])
> + AC_CONFIG_AUX_DIR([build-aux])
> + AC_CONFIG_MACRO_DIR([gnulib/m4])
> + AC_CONFIG_HEADERS([config.h])
> +-AM_INIT_AUTOMAKE([-Wno-portability 1.11 color-tests parallel-tests])
> ++AM_INIT_AUTOMAKE([-Wno-portability 1.11 subdir-objects color-tests parallel-tests])
> + AM_SILENT_RULES([yes]) # make --enable-silent-rules the default.
> + AC_CANONICAL_HOST
> +
> +--- a/gnulib/lib/Makefile.am
> ++++ b/gnulib/lib/Makefile.am
> +@@ -13,4 +13,4 @@ CLEANFILES=
> +
> + include gnulib.mk
> +
> +-INCLUDES = $(GETTEXT_CPPFLAGS)
> ++AM_CPPFLAGS = $(GETTEXT_CPPFLAGS)
> +--- a/gnulib/tests/Makefile.am
> ++++ b/gnulib/tests/Makefile.am
> +@@ -3,6 +3,6 @@
> + ## Copyright (C) 2011 Red Hat, Inc.
> + ## See COPYING.LIB for the License of this software
> +
> +-include gnulib.mk
> ++AM_CFLAGS =
> +
> +-INCLUDES = $(GETTEXT_CPPFLAGS)
> ++include gnulib.mk
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -14,7 +14,7 @@ TESTS_ENVIRONMENT = \
> +   abs_top_builddir='$(abs_top_builddir)' \
> +   abs_top_srcdir='$(abs_top_srcdir)'
> +
> +-INCLUDES = -I$(top_srcdir)/src
> ++AM_CPPFLAGS = -I$(top_srcdir)/src
> +
> + TESTS=
> + check_PROGRAMS=
> diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> index 4170e9fab0..d1f9e29d3a 100644
> --- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> +++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> @@ -10,6 +10,7 @@ SRCREV = "2c5d4255857531bc09d91dcd02e86545f29004d4"
>   PV .= "+git"
>
>   SRC_URI = "git://pagure.io/netcf.git;protocol=https;branch=master \
> +           file://0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch \
>              file://0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch"
>
>   UPSTREAM_CHECK_GITTAGREGEX = "release-(?P<pver>(\d+(\.\d+)+))"
> @@ -27,6 +28,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>   PACKAGECONFIG[systemd] = "--with-sysinit=systemd,--with-sysinit=initscripts,"
>
>   do_configure:prepend() {
> +    export GNULIB_TOOL_IMPL=sh

It seems this line is missing after merge.

Regards,
Kai

>       currdir=`pwd`
>       cd ${S}
>
> @@ -50,11 +52,11 @@ do_install:append() {
>       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>          install -d ${D}${systemd_unitdir}/system
>          if [ -d "${D}${libdir}/systemd/system" ]; then
> -           if [ "${systemd_unitdir}" != "${libdir}/systemd" ] ; then
> +           if [ "${systemd_unitdir}" != "${libdir}/systemd" ] ; then
>                  mv ${D}${libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
>                  rm -rf ${D}${libdir}/systemd/
>   	   fi
> -       elif [ "${systemd_unitdir}" != "${nonarch_libdir}/systemd" ] ; then
> +       elif [ "${systemd_unitdir}" != "${nonarch_libdir}/systemd" ] ; then
>              mv ${D}${nonarch_libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
>              rm -rf ${D}${nonarch_libdir}/systemd/
>          fi
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125489): https://lists.openembedded.org/g/openembedded-devel/message/125489
> Mute This Topic: https://lists.openembedded.org/mt/118452427/3616933
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [kai.kang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Kai Kang
Wind River Linux


