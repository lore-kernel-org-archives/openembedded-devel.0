Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC164109192D
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 01:15:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12720.1774401307364592176
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 18:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=DJoDHtIU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7544ec598e=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4uHom1918188
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 18:15:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=hNsfCTPi60soqSRpPQ/HK5
	A/gLWqq/TIIh2LjCvmp6w=; b=DJoDHtIUauKJSwtxM2StVwOKP2Gn+Q9SVV87yH
	Mh3SZkpjDrLJIOXTdsoZQ4RF4pScl4byWvsQUurTG9J6pyGiQHgZIqeytP/jC1F9
	xsO3DACnsXcs1bngEF1bhQRuP+xMiEc9GPzt0kFIZmGYSAnetTaDYt0BzFqQHHT1
	G1/H29pELPwHsHM/j+YKj3V9eUxk40UB0Ka6d8+WzfLTqwcIDvQVdMWSZQDe3Fvr
	sRIw2NRq9AjFMC6gr4qd2la4Z2IFyzLVc0tjaYFKhe5ELnUyjD8U427D8p7oSNqP
	Kp+j1Kj0cijC9UGtb5step4214Blb7mfJNnaYiu/ClozQcDw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010056.outbound.protection.outlook.com [52.101.201.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pkyc5ag-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 18:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DC9jOpF36jRCVuenyLGi2QdjFeHhPp0Xm4Py7B/a83wPjLAJryL2jsrM3UDXSwO2HfiixilSOCiWH9hmw+yHhWt3/Tvmrh9hsw69Jhr8G2Ymk0mNPkQFZHHMC80bkH8OMgW2nSeDUgeWHWpQWxyhae8wntgmfSHXewTF/93eVrwJve5gxiSlzVRJ9n94Eu+xEokL40H/JeqPM6U31ie3A++RPSINJga/3m6n45CR9Aw4XaW33hug42lQYdb+n34G8qQHLmJlsfPWseScjC4zSeceBbqVwWG0w5BIbJDc1BJl/bCKIJVjplMrnsciPDf08yClJk3c62NN8n3ojg8isg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNsfCTPi60soqSRpPQ/HK5A/gLWqq/TIIh2LjCvmp6w=;
 b=ciSmmvaH/MAyqkeUm0MVRuZz/sfyIiAy9DnzUadHc0bskd0AEJB1HFf3hWc2M3x8Y/cgiJNTOXGW+C0jcHp3K4EDlAW06HTMRGyzQh7+fHNAIuqFeR8xlCHlSQKXk7hMLns39p4gQo61Gl3IUxlQwyHHaLrzH72EcPHPsKxdwHrpVy5uR50Lq6mq8XgSnKcwNKDwslYS3cspcsq87Azay2RdS9THT7rNH8wZ6r/xTmM9VRP1a+mDuLc8P9TrZp4y/fGVkoBgYVIaEClaLITXqZi5d/ZU2vFgztEVtIPFiCgUMtIQhiZP1P1LFvQwp4oWycBsH93USzyk5yh+OUqbIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by DS4PPF7CCC4B437.namprd11.prod.outlook.com (2603:10b6:f:fc02::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 01:15:03 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::9fca:dc5d:4230:e12e]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::9fca:dc5d:4230:e12e%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 01:15:02 +0000
Content-Type: multipart/alternative;
 boundary="------------YdyiGlYmUzkRY6e61XtM7NYW"
Message-ID: <694f99cf-6a78-4724-9fa7-82c25254c586@windriver.com>
Date: Wed, 25 Mar 2026 09:14:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH 2/2] netcf: Stick to shell
 implementation of gnulib-tool
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
        Khem Raj <khem.raj@oss.qualcomm.com>
References: <20260322182651.4090587-1-khem.raj@oss.qualcomm.com>
 <20260322182651.4090587-2-khem.raj@oss.qualcomm.com>
 <23edc667-003c-4ced-af66-5d802f1a6636@windriver.com>
 <CAMKF1sqFVzC99pAs5iN7qPc3iQ0b1nTY2ins6T24J5PWCpbTVQ@mail.gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAMKF1sqFVzC99pAs5iN7qPc3iQ0b1nTY2ins6T24J5PWCpbTVQ@mail.gmail.com>
X-ClientProxiedBy: SG2P153CA0037.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::6)
 To SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2589:EE_|DS4PPF7CCC4B437:EE_
X-MS-Office365-Filtering-Correlation-Id: 41946e3d-a2b0-4590-d1dd-08de8a0bf0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|42112799006|366016|8096899003|13003099007|18002099003|17002099007|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	n1A46FCudUzMVpHxMMO2dq5rHJiAlNf6ZkvIlldWnZIqQT6QUab6/ys4PKlSH1pSjKtBIpwWcW8B04f3F5KAfK7xWVqKa4X4m1Aecokc3CAdvqH6eD5TWGs1UPbaeI8rc/IGIihoFR6yDwdgWxqt4vD92Jpiw18wH8+J+d8VA3HKNplvtWLcsms68kCHiJ3pXU4/L7p/jIdJsMazhnjWvZBsoGDUyMa4U6soXdWRcBuQzGB1wq+9JLgx8BjhVaH0SqWLe15+cyN4lBrrs08RiDXSlGuaIDDT3IA/5544hs7GVDBzGogrbGOhJ4hWJJTsv6KD8NaM2nAFSXfCSBl0y2Le9NNGTxBfIPsxlqo2yUnnjpKgmQNZlM9/eW1GFGTO8opW/fFA9oot2KZIUt+mE9jsj4qNh4dxtwITfOjbxUqetdnq2EO7mORziaVvpwmxa426MlWz19bsUZGeJSuDGEdwMrJ5jnFKZYBE76PiVR/YhqVeLBQyxnugnM0RVVZS35i5VUwi8/DKOzGjusXxWj6tMJ1GKl+SHGpvYFiOKON7uubuFm3XZg+0Zlmcj2e8T5cCcVFAHjHX19/xkkCKsva6PJgK+y3Jylh8H4ElhrGFyLe+omrjJM7r8JT+HF+pFnTHgYZWiyolcdKjzLY8YAtS3M8wZEaWUKRUxu+dEcKoqLo+hVEcoCTPQ+ifjWgH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2589.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(42112799006)(366016)(8096899003)(13003099007)(18002099003)(17002099007)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c1RIb1RldGFodi94NkFVVjRMTHVwMjB6ZjJMWW5VOEtVZnBRS1BUaW9OK1gy?=
 =?utf-8?B?RkZYVjh5NkFQN0NhcFo3Y2h6ZzFMQXpLbU56ZStGTFZFQWJNSXVxdCs4K0t1?=
 =?utf-8?B?SVN0bGxzUmxBOTlzUlI1cWNRYkJmcmhnTmwyZk9FclIrTW9WdUR6dnJmaG5v?=
 =?utf-8?B?VWNPNUIxOEMrNlRGeDdkSDI5ZGlMdDBFOGxJZk5NUTd6eXJLMU5wOU5OakhL?=
 =?utf-8?B?MElMUWhsdzJ1SzJhWWhpTm5YZUtnU0ZKSzhIZmRraXBTUU1jQ2tCcU5ZUzVq?=
 =?utf-8?B?aHFzQzNnaWtyWWo4RlhrNjVsUUdSRjNYSUpibWpMajEvcEhHRGRaR21ubytE?=
 =?utf-8?B?Y1hkMFFtTlZGSDd6WE1kTDlkMEdZMlRyUFNQcU0xOHlZN1RRN0lJWGs2czNR?=
 =?utf-8?B?dVVaVTd6NlhiUDJjSzVNWGtRZnR4UFY4Ri9ZdVZnNm5qZmQzTFNUUTNLWlpI?=
 =?utf-8?B?dU9rdk50U3V1cFc2L2szOW9rTHJnaXZTM2xtMGdGc29BalBBc1JPZ0JlZFpw?=
 =?utf-8?B?dU04M2lYWnkyMXpWT0pPNXZEMWtiYnROdTRtTmtKVjBKcENUdHJibGh4L0px?=
 =?utf-8?B?QUJaTVIrZzIvRWRWRVRkQ0xadGUvZGpKd0htYmlweHNNRFQvU0ZMZGFNSnQy?=
 =?utf-8?B?dlFSakJVbHM3b0NPZ2kyRXloTE5mNkdQcnRjUitScFRUSkw0VjZ2eno4VVVn?=
 =?utf-8?B?VjNBdXdtVThBMGhkakxHQU00dUh5ejZjOVNDK1lid00wOTVPMUo3VUlMMmN2?=
 =?utf-8?B?TjAxc29XajBCQytLcHEyd3prUStrVzFtbVBCU2NOMVJHc1UrRlRZOWxnU2RP?=
 =?utf-8?B?VmdUblBZOGpNbjNmWjFWb2pUaHBkOHVFS3ljY1lqc1lqM2tCWHJGRENKRFZx?=
 =?utf-8?B?N3dWajhPWjljMG5wdkRyOU1nem1PbWNtaWgzRjRSYXJqSXpVZzVKbU8yWGV0?=
 =?utf-8?B?WWtyNGFBRkFKK0pSUERRb0F5TTBPV2ptWkF5Ukx3Yk1ycFlDNVEzcU1hbEhu?=
 =?utf-8?B?cjhBMGVTeW10c1cxbmx3OHF0Z2E5Q3ZYV0paMU5QNGFMNncvK2N6TTAxNlkz?=
 =?utf-8?B?SEhXQ1JnSnlNWnFtNngrU3VxQnlMc0pqaGdmR0hRZ1JjNk4vZ3pFb041YjMz?=
 =?utf-8?B?cEVzT3E4Z0h3TmF1L1U4ckcrRFJMUzdMd0VoakFGWWMwaDJIa3pkY05lRjFM?=
 =?utf-8?B?RGhTNnRYVVhnR1JSYUp3STVEU0VmSEN0dTB4eDJLYjVzeEk1ME9uaUUzQXZT?=
 =?utf-8?B?Y0dLVEc5MEJZU251OG1zZDRZbGtDK2QwYW9vUEZ4T1lPWjh0UEdacmYrSFJD?=
 =?utf-8?B?WVlOMnl2YlhXWldoK2lybjBIb3hKYjJQLzdxTS80ckV0d1RxUlVRZUZwOUw4?=
 =?utf-8?B?OEt2V3VhODRYbVFia1NDWkw0b05RNmgwVEdiNE1RQWFkUUlnSEQyMGFqeU5z?=
 =?utf-8?B?bG1pdVFSVkxyaXl6TDJOUFIwMGFFTUcwYTN1Ykx4eXFtMnQwYzZzcExNUGs4?=
 =?utf-8?B?VlF2aGJYeTFlNEpQYTNYM2tYV1dNRWdGNGdRNU1mQVIzalpjM3pmcVphK1pD?=
 =?utf-8?B?WVFHMkVkNHVEc3BMeGlxSlFpNE4yL3k5bk4zSnJkY29aL203bW1WUmZFVDlq?=
 =?utf-8?B?NUlYQTVlM1dtcDhROVJ2eVdxUVJDU2RBdSt3QVUyNHFFdWNGZ2pIcUtMRlBO?=
 =?utf-8?B?WUExZEVBQjFWc2M0eFg5dDJWZ2phZi9sR0dqNlpLZm5pb01RRTR6THJZbWg4?=
 =?utf-8?B?S3Fqb2tCL3lMZGp4V1JCTXR4L2V6YUY1NjBJYTFvYlQ0R3QyQWRmTnNiVFp0?=
 =?utf-8?B?cVZBaUtNdE80bEt5dDlDRzRuU04zRHFVb1oxbTN0dlNDVWsrbDdmYWdWaUlv?=
 =?utf-8?B?TUg3SndJeHI3QVlJT25SUzBVZ0RoVWQ1SnV5ZUtuNmJwaTNuSUNabExWYnJE?=
 =?utf-8?B?VldWdnFXeWRJMGZucm0vMFVNSlJYOURRU01RK3ArMDZheDZKMmd3dmRSblZh?=
 =?utf-8?B?YzVVZURPNnZwT3hlTTBKNHVQTzVxcmFML0wyUTcwQkdKYSs5MFlQZzZQR0tO?=
 =?utf-8?B?WGVkOU5vaHpZWUVyN3Y4QWE2SlpPRHlsb1RUeE5TclNRbmZUcUFIVTdJdGRQ?=
 =?utf-8?B?MlFkYmhLMk5jaEhXVHpyQ1diWHNUY0VPa1QwMCtDM3hPUEFhL0JSb0orK3ds?=
 =?utf-8?B?MzBDM0VVeUFVdlBZcUNwYXU2MGl6RU1vUmwvY0hXemVEU3VNQU4vdWQvek5P?=
 =?utf-8?B?YU9BcW5ENUJMdmVsWWtVb3l0T1Rvb2Q4MitpYlRZZVZHb0trZHlhZWQrZ2kr?=
 =?utf-8?B?TzFzODFucVp1dlU4TWlZbTZRZzNwSkkxSTVWWVVPS09vK2hNTmdSQT09?=
X-Exchange-RoutingPolicyChecked: 
	Eaxxf+ZbbArxP7pIEYQHcsamrm+kEhEW8wgfC2EKzTC5Qd1r9/bI+CWuuUj+3AaMuaUbZKqVgJI5VKZ5xDX9py9iltEp6BtCeEJ2eMLPMKmQLH4kk22HgrN/Tdp+2dMg+gqQ6C8Loe5fG9gUuNm/g5zi8EaWjkkyFBmf5mZaeW+mrHhz61ykCk8uaxUNteIctZwElcknzQqLJZMlm8x+4RgwZfExaP+UeTsayAvhPzLqqwliNom7EwwVO52czXCgTaBVJGyaPoA811G3hEHbyNd74qEnxtEICwQ9U/mh92fb4UXu+G2ed4IzX8cm0LtXqL4q1zUPskmLhSENsYdvyA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41946e3d-a2b0-4590-d1dd-08de8a0bf0fe
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 01:15:02.8494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnx4ROeT60J8xP+b7kV+D0EqO47ktLxAyMXYsD9QqH/k1jnPaPKpaVmZX6TNtDTTRI9DOFac7EwwKjI1eJGY+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7CCC4B437
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAwNyBTYWx0ZWRfXx80Izee3VdVn
 73S8hNSEVGC7UTIFkf/Hbd5w2OaAbG4dx/FHNg2JrPauO7/lKb7+m/byocoNdg1E1jwin/sFSY4
 UiZagqvtD3CtBeWerxLDGLueRUQuxUmNtVQfNNYEv/RtvnY9w2dmbA3kq3QUk+gVRv/mypH5Ai5
 RcjoNDa+H5+lI+zr2266mEoctxuk35oRRmK5+/W5SRhw9/R+6wXGqzUhLhdVhkoG/Rgh1NawvHj
 ayn2RiIwKnP5QEegLgrGlDSoMauWWzimoNkrxncG21kbZyMbOoYIox1FoT5XmmdzphNGhkx7qhL
 Lz3eKahVWSqbzfv+BUl+qhHUdiPDRH3NQUlO4ghM5KdMmL5A5Yh/IJ2TSLhbuxAAnW7SIVjVtcz
 F0gD+PDuVwmVTyD6W18xxKQA4qHQwPf0mjcUL9yTNT8/47XlQltyVCQ3ktcW8mLezw1HC+OOEQ9
 ZUS9AAyyNozU7gZUqQw==
X-Proofpoint-ORIG-GUID: EB2wOECoxp5tKtHJgzl8vR3FD2HT8NQe
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c3371a cx=c_pps
 a=wszTalFPv2ofqEyTcV7qHQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=7aKITjCGAAAA:8 a=ZaThiXudAAAA:8 a=YvNoDGAPAAAA:8 a=Hr2hzXo4AAAA:8
 a=gjuZwlxBAAAA:8 a=lViJMyulAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=NGSKtDPqTc4fEmvz3BcA:9 a=lqcHg5cX4UMA:10 a=PRpDppDLrCsA:10
 a=O9Trw71uoXUA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ftB1EhNGTZov8IyrQUEA:9 a=DIl45YMTKhhoOFuB:21 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=higHRajXaQW5ZfuI0AHj:22 a=D2Y3n6BFTqBnbl1GHL-i:22
 a=DZU4fieJkDm8WpnclPb5:22 a=53as8YsKq3-og0CBIB0j:22 a=ls__3gZ0znCI_TX61aLk:22
 a=gb9IC-u5QvZuJU0a8fSk:22
X-Proofpoint-GUID: TZrLHZIqBSLuHpAbNJuyE0kmfjwz1CNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 01:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125595

--------------YdyiGlYmUzkRY6e61XtM7NYW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62O4uHom1918188

On 3/25/26 09:11, Khem Raj wrote:
>
>
> On Tue, Mar 24, 2026 at 5:54=E2=80=AFPM Kai Kang via lists.openembedded=
.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYcz=
euvoZLAN4H8TQ$>=20
> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     On 3/23/26 02:26, Khem Raj via lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajve=
Ydw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gC=
vYczeuvoZLAN4H8TQ$>
>     wrote:
>     > Fix build with newer autotools and gnulib
>     >
>     > Newer gnulib use python implementation by default if it
>     > finds py3 on the system. However, netcf is old package
>     > and its not expecting python implementation, therefore
>     > make the shell implementation be used.
>     >
>     > REALLOC_N is gone in latest gnulib so house a local
>     > macro
>     >
>     > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
>     > ---
>     >=C2=A0 =C2=A0...nulib-read_file-fread_file-signature.patch | 41 ++=
++++++-----
>     >=C2=A0 =C2=A0...bootstrap-with-newer-gnulib-automake.patch | 61
>     +++++++++++++++++++
>     >=C2=A0 =C2=A0.../recipes-support/netcf/netcf_0.2.8.bb
>     <https://urldefense.com/v3/__http://netcf_0.2.8.bb__;!!AjveYdw8EvQ!=
dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvo=
ZIHNt5dCQ$>
>     =C2=A0 =C2=A0 |=C2=A0 6 +-
>     >=C2=A0 =C2=A03 files changed, 91 insertions(+), 17 deletions(-)
>     >=C2=A0 =C2=A0create mode 100644
>     meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstra=
p-with-newer-gnulib-automake.patch
>     >
>     > diff --git
>     a/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnu=
lib-read_file-fread_file-signature.patch
>     b/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnu=
lib-read_file-fread_file-signature.patch
>     > index b188248fff..83fdfded52 100644
>     > ---
>     a/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnu=
lib-read_file-fread_file-signature.patch
>     > +++
>     b/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnu=
lib-read_file-fread_file-signature.patch
>     > @@ -17,11 +17,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     >=C2=A0 =C2=A0 src/ncftransform.c | 2 +-
>     >=C2=A0 =C2=A0 4 files changed, 5 insertions(+), 5 deletions(-)
>     >
>     > -diff --git a/src/dutil_linux.c b/src/dutil_linux.c
>     > -index 742153a..eb72eb2 100644
>     >=C2=A0 =C2=A0--- a/src/dutil_linux.c
>     >=C2=A0 =C2=A0+++ b/src/dutil_linux.c
>     > -@@ -1113,7 +1113,7 @@ static void add_link_info(struct netcf *nc=
f,
>     > +@@ -1113,7 +1113,7 @@ static void add_link_info(struct netcf *
>     >
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 xasprintf(&path, "/sys/class/net/%s/op=
erstate", ifname);
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_NOMEM(!path, ncf);
>     > @@ -30,7 +28,7 @@ index 742153a..eb72eb2 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!state) {
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* missing operstate is =
*not* an error. It could be
>     due to an
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* alias interface,=
 which has no entry in
>     /sys/class/net at
>     > -@@ -1132,7 +1132,7 @@ static void add_link_info(struct netcf *nc=
f,
>     > +@@ -1132,7 +1132,7 @@ static void add_link_info(struct netcf *
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FREE(path);
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xasprintf(&path, "/sys/c=
lass/net/%s/speed", ifname);
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_NOMEM(path =3D=3D NU=
LL, ncf);
>     > @@ -39,11 +37,9 @@ index 742153a..eb72eb2 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!speed && errno =3D=3D=
 EINVAL) {
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* attempt=
s to read $ifname/speed result in
>     EINVAL if the
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* in=
terface is ifconfiged down (which isn't
>     exactly the
>     > -diff --git a/src/dutil_posix.c b/src/dutil_posix.c
>     > -index 1313514..b9884f0 100644
>     >=C2=A0 =C2=A0--- a/src/dutil_posix.c
>     >=C2=A0 =C2=A0+++ b/src/dutil_posix.c
>     > -@@ -211,7 +211,7 @@ int run_program(struct netcf *ncf, const
>     char *const *argv, char **output)
>     > +@@ -211,7 +211,7 @@ int run_program(struct netcf *ncf, const
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"Failed to create file stream for
>     output while executing '%s': %s",
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv_str, errbuf);
>     >
>     > @@ -52,11 +48,9 @@ index 1313514..b9884f0 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_THROW_STRERROR(*output =3D=3D NULL=
, ncf, EEXEC,
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"Error while reading output from
>     execution of '%s': %s",
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv_str, errbuf);
>     > -diff --git a/src/ncftool.c b/src/ncftool.c
>     > -index f1b5642..c878cb0 100644
>     >=C2=A0 =C2=A0--- a/src/ncftool.c
>     >=C2=A0 =C2=A0+++ b/src/ncftool.c
>     > -@@ -351,7 +351,7 @@ static int cmd_define(const struct command
>     *cmd) {
>     > +@@ -351,7 +351,7 @@ static int cmd_define(const struct comma
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct netcf_if *nif =3D NULL;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 int result =3D CMD_RES_ERR;
>     >
>     > @@ -65,8 +59,6 @@ index f1b5642..c878cb0 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (xml =3D=3D NULL) {
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, "Failed =
to read %s\n", fname);
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;
>     > -diff --git a/src/ncftransform.c b/src/ncftransform.c
>     > -index fbabfc3..4c9a56d 100644
>     >=C2=A0 =C2=A0--- a/src/ncftransform.c
>     >=C2=A0 =C2=A0+++ b/src/ncftransform.c
>     >=C2=A0 =C2=A0@@ -54,7 +54,7 @@ int main(int argc, char **argv) {
>     > @@ -78,6 +70,25 @@ index fbabfc3..4c9a56d 100644
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (in_xml =3D=3D NULL)
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 die("Failed to read %s\n=
", argv[2]);
>     >
>     > ---
>     > -2.44.0
>     > -
>     > +--- a/src/internal.h
>     > ++++ b/src/internal.h
>     > +@@ -30,6 +30,7 @@
>     > +
>     > + #include <string.h>
>     > + #include <stdarg.h>
>     > ++#include <stdlib.h>
>     > +
>     > + #include <libxslt/transform.h>
>     > + #include <libxml/relaxng.h>
>     > +@@ -85,6 +86,11 @@
>     > + #define ATTRIBUTE_NOINLINE
>     > + #endif=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* __GN=
UC__ */
>     > +
>     > ++#ifndef REALLOC_N
>     > ++# define REALLOC_N(ptr, count) \
>     > ++=C2=A0 =C2=A0 (((ptr) =3D realloc((ptr), sizeof(*(ptr)) * (coun=
t))) =3D=3D
>     NULL ? -1 : 0)
>     > ++#endif
>     > ++
>     > + /* This needs ATTRIBUTE_RETURN_CHECK */
>     > + #include "ref.h"
>     > +
>     > diff --git
>     a/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootst=
rap-with-newer-gnulib-automake.patch
>     b/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootst=
rap-with-newer-gnulib-automake.patch
>     > new file mode 100644
>     > index 0000000000..62daeff812
>     > --- /dev/null
>     > +++
>     b/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootst=
rap-with-newer-gnulib-automake.patch
>     > @@ -0,0 +1,61 @@
>     > +From dded6e3321e304f50922e61c553d4e4eb0f80fd0 Mon Sep 17
>     00:00:00 2001
>     > +From: Khem Raj <khem.raj@oss.qualcomm.com>
>     > +Date: Sun, 22 Mar 2026 11:05:34 -0700
>     > +Subject: [PATCH] netcf: fix bootstrap with newer gnulib/automake
>     > +
>     > +Upstream netcf is old enough that bootstrap/autoreconf now
>     trips over:
>     > +- gnulib-tool.py
>     <https://urldefense.com/v3/__http://gnulib-tool.py__;!!AjveYdw8EvQ!=
dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvo=
ZKWSdXS_w$>
>     wrapper expectations in newer gnulib
>     > +- stricter automake handling of AM_CFLAGS +=3D from generated
>     gnulib.mk
>     <https://urldefense.com/v3/__http://gnulib.mk__;!!AjveYdw8EvQ!dpEKf=
hC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZIIKm=
HWZA$>
>     > +- subdir source warnings
>     > +- deprecated INCLUDES usage
>     > +
>     > +Upstream-Status: Pending
>     > +Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
>     > +---
>     > + configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!dp=
EKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZK=
Ubn9G5Q$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-
>     > + gnulib/lib/Makefile.am
>     <https://urldefense.com/v3/__http://Makefile.am__;!!AjveYdw8EvQ!dpE=
KfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS=
_OOI6A$>=C2=A0
>     =C2=A0| 2 +-
>     > + gnulib/tests/Makefile.am
>     <https://urldefense.com/v3/__http://Makefile.am__;!!AjveYdw8EvQ!dpE=
KfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS=
_OOI6A$>
>     | 2 ++
>     > + tests/Makefile.am
>     <https://urldefense.com/v3/__http://Makefile.am__;!!AjveYdw8EvQ!dpE=
KfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS=
_OOI6A$>=C2=A0
>     =C2=A0 =C2=A0 =C2=A0 | 2 +-
>     > + 4 files changed, 5 insertions(+), 3 deletions(-)
>     > +
>     > +--- a/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!dp=
EKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZK=
Ubn9G5Q$>
>     > ++++ b/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!dp=
EKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZK=
Ubn9G5Q$>
>     > +@@ -3,7 +3,7 @@ AC_CONFIG_SRCDIR([src/netcf.c])
>     > + AC_CONFIG_AUX_DIR([build-aux])
>     > + AC_CONFIG_MACRO_DIR([gnulib/m4])
>     > + AC_CONFIG_HEADERS([config.h])
>     > +-AM_INIT_AUTOMAKE([-Wno-portability 1.11 color-tests
>     parallel-tests])
>     > ++AM_INIT_AUTOMAKE([-Wno-portability 1.11 subdir-objects
>     color-tests parallel-tests])
>     > + AM_SILENT_RULES([yes]) # make --enable-silent-rules the default.
>     > + AC_CANONICAL_HOST
>     > +
>     > +--- a/gnulib/lib/Makefile.am
>     <https://urldefense.com/v3/__http://Makefile.am__;!!AjveYdw8EvQ!dpE=
KfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS=
_OOI6A$>
>     > ++++ b/gnulib/lib/Makefile.am
>     <https://urldefense.com/v3/__http://Makefile.am__;!!AjveYdw8EvQ!dpE=
KfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS=
_OOI6A$>
>     > +@@ -13,4 +13,4 @@ CLEANFILES=3D
>     > +
>     > + include gnulib.mk
>     <https://urldefense.com/v3/__http://gnulib.mk__;!!AjveYdw8EvQ!dpEKf=
hC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZIIKm=
HWZA$>
>     > +
>     > +-INCLUDES =3D $(GETTEXT_CPPFLAGS)
>     > ++AM_CPPFLAGS =3D $(GETTEXT_CPPFLAGS)
>     > +--- a/gnulib/tests/Makefile.am
>     <https://urldefense.com/v3/__http://Makefile.am__;!!AjveYdw8EvQ!dpE=
KfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS=
_OOI6A$>
>     > ++++ b/gnulib/tests/Makefile.am
>     <https://urldefense.com/v3/__http://Makefile.am__;!!AjveYdw8EvQ!dpE=
KfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS=
_OOI6A$>
>     > +@@ -3,6 +3,6 @@
>     > + ## Copyright (C) 2011 Red Hat, Inc.
>     > + ## See COPYING.LIB for the License of this software
>     > +
>     > +-include gnulib.mk
>     <https://urldefense.com/v3/__http://gnulib.mk__;!!AjveYdw8EvQ!dpEKf=
hC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZIIKm=
HWZA$>
>     > ++AM_CFLAGS =3D
>     > +
>     > +-INCLUDES =3D $(GETTEXT_CPPFLAGS)
>     > ++include gnulib.mk
>     <https://urldefense.com/v3/__http://gnulib.mk__;!!AjveYdw8EvQ!dpEKf=
hC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZIIKm=
HWZA$>
>     > +--- a/tests/Makefile.am
>     <https://urldefense.com/v3/__http://Makefile.am__;!!AjveYdw8EvQ!dpE=
KfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS=
_OOI6A$>
>     > ++++ b/tests/Makefile.am
>     <https://urldefense.com/v3/__http://Makefile.am__;!!AjveYdw8EvQ!dpE=
KfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS=
_OOI6A$>
>     > +@@ -14,7 +14,7 @@ TESTS_ENVIRONMENT =3D \
>     > +=C2=A0 =C2=A0abs_top_builddir=3D'$(abs_top_builddir)' \
>     > +=C2=A0 =C2=A0abs_top_srcdir=3D'$(abs_top_srcdir)'
>     > +
>     > +-INCLUDES =3D -I$(top_srcdir)/src
>     > ++AM_CPPFLAGS =3D -I$(top_srcdir)/src
>     > +
>     > + TESTS=3D
>     > + check_PROGRAMS=3D
>     > diff --git
>     a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
>     <https://urldefense.com/v3/__http://netcf_0.2.8.bb__;!!AjveYdw8EvQ!=
dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvo=
ZIHNt5dCQ$>
>     b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
>     <https://urldefense.com/v3/__http://netcf_0.2.8.bb__;!!AjveYdw8EvQ!=
dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvo=
ZIHNt5dCQ$>
>     > index 4170e9fab0..d1f9e29d3a 100644
>     > --- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
>     <https://urldefense.com/v3/__http://netcf_0.2.8.bb__;!!AjveYdw8EvQ!=
dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvo=
ZIHNt5dCQ$>
>     > +++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
>     <https://urldefense.com/v3/__http://netcf_0.2.8.bb__;!!AjveYdw8EvQ!=
dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvo=
ZIHNt5dCQ$>
>     > @@ -10,6 +10,7 @@ SRCREV =3D
>     "2c5d4255857531bc09d91dcd02e86545f29004d4"
>     >=C2=A0 =C2=A0PV .=3D "+git"
>     >
>     >=C2=A0 =C2=A0SRC_URI =3D
>     "git://pagure.io/netcf.git;protocol=3Dhttps;branch=3Dmaster
>     <https://urldefense.com/v3/__http://pagure.io/netcf.git;protocol=3D=
https;branch=3Dmaster__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9=
fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLCEtYGwg$>
>     \
>     > + file://0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patc=
h \
>     >
>     file://0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patc=
h"
>     >
>     >=C2=A0 =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D "release-(?P<pver>(\d+=
(\.\d+)+))"
>     > @@ -27,6 +28,7 @@ PACKAGECONFIG ??=3D
>     "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>     >=C2=A0 =C2=A0PACKAGECONFIG[systemd] =3D
>     "--with-sysinit=3Dsystemd,--with-sysinit=3Dinitscripts,"
>     >
>     >=C2=A0 =C2=A0do_configure:prepend() {
>     > +=C2=A0 =C2=A0 export GNULIB_TOOL_IMPL=3Dsh
>
>     It seems this line is missing after merge.
>
>
> Good eye. But its not needed anymore since the fix works with python=20
> version too, sticking to shell version was a stop gap anyway

My local repo still fails without this line. I'll double check it.

Many thanks.

Kai

>
>     Regards,
>     Kai
>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0currdir=3D`pwd`
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}
>     >
>     > @@ -50,11 +52,11 @@ do_install:append() {
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains('DISTRO_FEATURE=
S', 'systemd',
>     'true', 'false', d)}; then
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_unitdi=
r}/system
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -d "${D}${libdir}/systemd/=
system" ]; then
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "${systemd_unitdir=
}" !=3D "${libdir}/systemd" ] ;
>     then
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "${systemd_unitdir=
}" !=3D "${libdir}/systemd" ] ;
>     then
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv =
${D}${libdir}/systemd/system/*
>     ${D}${systemd_unitdir}/system/
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm =
-rf ${D}${libdir}/systemd/
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ "${systemd_unitdir}" !=3D
>     "${nonarch_libdir}/systemd" ] ; then
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ "${systemd_unitdir}" !=3D
>     "${nonarch_libdir}/systemd" ] ; then
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${nonarch_=
libdir}/systemd/system/*
>     ${D}${systemd_unitdir}/system/
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${nona=
rch_libdir}/systemd/
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>     >
>     >
>     >
>
>     --=20
>     Kai Kang
>     Wind River Linux
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#125593):
>     https://lists.openembedded.org/g/openembedded-devel/message/125593
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/125593__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWRO=
TFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLt8wBJEA$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/118452427/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1184=
52427/1997914__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSoz=
YEheDF_2UTzKsYIrOwr3gCvYczeuvoZLzJ0t0CA$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fg=
evUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLXvTOnKg$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
Kai Kang
Wind River Linux

--------------YdyiGlYmUzkRY6e61XtM7NYW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62O4uHom1918188

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 3/25/26 09:11, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqFVzC99pAs5iN7qPc3iQ0b1n=
TY2ins6T24J5PWCpbTVQ@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 24, 2026 at
            5:54=E2=80=AFPM Kai Kang via <a href=3D"https://urldefense.co=
m/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqr=
erZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLAN4H8TQ$" moz-do-n=
ot-send=3D"true">lists.openembedded.org</a>
            &lt;kai.kang=3D<a href=3D"mailto:windriver.com@lists.openembe=
dded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">windri=
ver.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
            3/23/26 02:26, Khem Raj via <a href=3D"https://urldefense.com=
/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqre=
rZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLAN4H8TQ$" rel=3D"no=
referrer" target=3D"_blank" moz-do-not-send=3D"true">lists.openembedded.o=
rg</a>
            wrote:<br>
            &gt; Fix build with newer autotools and gnulib<br>
            &gt;<br>
            &gt; Newer gnulib use python implementation by default if it<=
br>
            &gt; finds py3 on the system. However, netcf is old package<b=
r>
            &gt; and its not expecting python implementation, therefore<b=
r>
            &gt; make the shell implementation be used.<br>
            &gt;<br>
            &gt; REALLOC_N is gone in latest gnulib so house a local<br>
            &gt; macro<br>
            &gt;<br>
            &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@o=
ss.qualcomm.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-=
txt-link-freetext">khem.raj@oss.qualcomm.com</a>&gt;<br>
            &gt; ---<br>
            &gt;&nbsp; &nbsp;...nulib-read_file-fread_file-signature.patc=
h | 41
            ++++++++-----<br>
            &gt;&nbsp; &nbsp;...bootstrap-with-newer-gnulib-automake.patc=
h | 61
            +++++++++++++++++++<br>
            &gt;&nbsp; &nbsp;.../recipes-support/netcf/<a href=3D"https:/=
/urldefense.com/v3/__http://netcf_0.2.8.bb__;!!AjveYdw8EvQ!dpEKfhC6PW8F-d=
lmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZIHNt5dCQ$" re=
l=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">netcf_0.2.8.b=
b</a>&nbsp;
            &nbsp; &nbsp; |&nbsp; 6 +-<br>
            &gt;&nbsp; &nbsp;3 files changed, 91 insertions(+), 17 deleti=
ons(-)<br>
            &gt;&nbsp; &nbsp;create mode 100644
meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-with=
-newer-gnulib-automake.patch<br>
            &gt;<br>
            &gt; diff --git
a/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-re=
ad_file-fread_file-signature.patch
b/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-re=
ad_file-fread_file-signature.patch<br>
            &gt; index b188248fff..83fdfded52 100644<br>
            &gt; ---
a/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-re=
ad_file-fread_file-signature.patch<br>
            &gt; +++
b/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-re=
ad_file-fread_file-signature.patch<br>
            &gt; @@ -17,11 +17,9 @@ Signed-off-by: Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank" moz-do-not-send=3D"true" cl=
ass=3D"moz-txt-link-freetext">raj.khem@gmail.com</a>&gt;<br>
            &gt;&nbsp; &nbsp; src/ncftransform.c | 2 +-<br>
            &gt;&nbsp; &nbsp; 4 files changed, 5 insertions(+), 5 deletio=
ns(-)<br>
            &gt;<br>
            &gt; -diff --git a/src/dutil_linux.c b/src/dutil_linux.c<br>
            &gt; -index 742153a..eb72eb2 100644<br>
            &gt;&nbsp; &nbsp;--- a/src/dutil_linux.c<br>
            &gt;&nbsp; &nbsp;+++ b/src/dutil_linux.c<br>
            &gt; -@@ -1113,7 +1113,7 @@ static void add_link_info(struct
            netcf *ncf,<br>
            &gt; +@@ -1113,7 +1113,7 @@ static void add_link_info(struct
            netcf *<br>
            &gt;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; xasprintf(&amp;path,
            &quot;/sys/class/net/%s/operstate&quot;, ifname);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; ERR_NOMEM(!path, ncf);<br>
            &gt; @@ -30,7 +28,7 @@ index 742153a..eb72eb2 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; if (!state) {<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* missing oper=
state is *not* an error. It
            could be due to an<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* alias i=
nterface, which has no entry in
            /sys/class/net at<br>
            &gt; -@@ -1132,7 +1132,7 @@ static void add_link_info(struct
            netcf *ncf,<br>
            &gt; +@@ -1132,7 +1132,7 @@ static void add_link_info(struct
            netcf *<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; FREE(path);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; xasprintf(&amp;=
path,
            &quot;/sys/class/net/%s/speed&quot;, ifname);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ERR_NOMEM(path =
=3D=3D NULL, ncf);<br>
            &gt; @@ -39,11 +37,9 @@ index 742153a..eb72eb2 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (!speed &amp=
;&amp; errno =3D=3D EINVAL) {<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /=
* attempts to read $ifname/speed result
            in EINVAL if the<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;* interface is ifconfiged down (which
            isn't exactly the<br>
            &gt; -diff --git a/src/dutil_posix.c b/src/dutil_posix.c<br>
            &gt; -index 1313514..b9884f0 100644<br>
            &gt;&nbsp; &nbsp;--- a/src/dutil_posix.c<br>
            &gt;&nbsp; &nbsp;+++ b/src/dutil_posix.c<br>
            &gt; -@@ -211,7 +211,7 @@ int run_program(struct netcf *ncf,
            const char *const *argv, char **output)<br>
            &gt; +@@ -211,7 +211,7 @@ int run_program(struct netcf *ncf,
            const<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;Failed to create file strea=
m
            for output while executing '%s': %s&quot;,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;argv_str, errbuf);<br>
            &gt;<br>
            &gt; @@ -52,11 +48,9 @@ index 1313514..b9884f0 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; ERR_THROW_STRERROR(*output =3D=
=3D NULL, ncf, EEXEC,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;Error while reading output
            from execution of '%s': %s&quot;,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;argv_str, errbuf);<br>
            &gt; -diff --git a/src/ncftool.c b/src/ncftool.c<br>
            &gt; -index f1b5642..c878cb0 100644<br>
            &gt;&nbsp; &nbsp;--- a/src/ncftool.c<br>
            &gt;&nbsp; &nbsp;+++ b/src/ncftool.c<br>
            &gt; -@@ -351,7 +351,7 @@ static int cmd_define(const struct
            command *cmd) {<br>
            &gt; +@@ -351,7 +351,7 @@ static int cmd_define(const struct
            comma<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; struct netcf_if *nif =3D NULL=
;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; int result =3D CMD_RES_ERR;<b=
r>
            &gt;<br>
            &gt; @@ -65,8 +59,6 @@ index f1b5642..c878cb0 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; if (xml =3D=3D NULL) {<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fprintf(stderr,=
 &quot;Failed to read %s\n&quot;,
            fname);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto done;<br>
            &gt; -diff --git a/src/ncftransform.c b/src/ncftransform.c<br=
>
            &gt; -index fbabfc3..4c9a56d 100644<br>
            &gt;&nbsp; &nbsp;--- a/src/ncftransform.c<br>
            &gt;&nbsp; &nbsp;+++ b/src/ncftransform.c<br>
            &gt;&nbsp; &nbsp;@@ -54,7 +54,7 @@ int main(int argc, char **=
argv) {<br>
            &gt; @@ -78,6 +70,25 @@ index fbabfc3..4c9a56d 100644<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; if (in_xml =3D=3D NULL)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; die(&quot;Faile=
d to read %s\n&quot;, argv[2]);<br>
            &gt;<br>
            &gt; ---<br>
            &gt; -2.44.0<br>
            &gt; -<br>
            &gt; +--- a/src/internal.h<br>
            &gt; ++++ b/src/internal.h<br>
            &gt; +@@ -30,6 +30,7 @@<br>
            &gt; +<br>
            &gt; + #include &lt;string.h&gt;<br>
            &gt; + #include &lt;stdarg.h&gt;<br>
            &gt; ++#include &lt;stdlib.h&gt;<br>
            &gt; +<br>
            &gt; + #include &lt;libxslt/transform.h&gt;<br>
            &gt; + #include &lt;libxml/relaxng.h&gt;<br>
            &gt; +@@ -85,6 +86,11 @@<br>
            &gt; + #define ATTRIBUTE_NOINLINE<br>
            &gt; + #endif&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;/* __GNUC__
            */<br>
            &gt; +<br>
            &gt; ++#ifndef REALLOC_N<br>
            &gt; ++# define REALLOC_N(ptr, count) \<br>
            &gt; ++&nbsp; &nbsp; (((ptr) =3D realloc((ptr), sizeof(*(ptr)=
) *
            (count))) =3D=3D NULL ? -1 : 0)<br>
            &gt; ++#endif<br>
            &gt; ++<br>
            &gt; + /* This needs ATTRIBUTE_RETURN_CHECK */<br>
            &gt; + #include &quot;ref.h&quot;<br>
            &gt; +<br>
            &gt; diff --git
a/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-wi=
th-newer-gnulib-automake.patch
b/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-wi=
th-newer-gnulib-automake.patch<br>
            &gt; new file mode 100644<br>
            &gt; index 0000000000..62daeff812<br>
            &gt; --- /dev/null<br>
            &gt; +++
b/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-wi=
th-newer-gnulib-automake.patch<br>
            &gt; @@ -0,0 +1,61 @@<br>
            &gt; +From dded6e3321e304f50922e61c553d4e4eb0f80fd0 Mon Sep
            17 00:00:00 2001<br>
            &gt; +From: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualc=
omm.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">khem.raj@oss.qualcomm.com</a>&gt;<br>
            &gt; +Date: Sun, 22 Mar 2026 11:05:34 -0700<br>
            &gt; +Subject: [PATCH] netcf: fix bootstrap with newer
            gnulib/automake<br>
            &gt; +<br>
            &gt; +Upstream netcf is old enough that bootstrap/autoreconf
            now trips over:<br>
            &gt; +- <a href=3D"https://urldefense.com/v3/__http://gnulib-=
tool.py__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF=
_2UTzKsYIrOwr3gCvYczeuvoZKWSdXS_w$" moz-do-not-send=3D"true">gnulib-tool.=
py</a> wrapper
            expectations in newer gnulib<br>
            &gt; +- stricter automake handling of AM_CFLAGS +=3D from
            generated <a href=3D"https://urldefense.com/v3/__http://gnuli=
b.mk__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2U=
TzKsYIrOwr3gCvYczeuvoZIIKmHWZA$" rel=3D"noreferrer" target=3D"_blank" moz=
-do-not-send=3D"true">gnulib.mk</a><br>
            &gt; +- subdir source warnings<br>
            &gt; +- deprecated INCLUDES usage<br>
            &gt; +<br>
            &gt; +Upstream-Status: Pending<br>
            &gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@=
oss.qualcomm.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">khem.raj@oss.qualcomm.com</a>&gt;<br>
            &gt; +---<br>
            &gt; + <a href=3D"https://urldefense.com/v3/__http://configur=
e.ac__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2U=
TzKsYIrOwr3gCvYczeuvoZKUbn9G5Q$" rel=3D"noreferrer" target=3D"_blank" moz=
-do-not-send=3D"true">configure.ac</a>&nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 2 +-<br>
            &gt; + gnulib/lib/<a href=3D"https://urldefense.com/v3/__http=
://Makefile.am__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSo=
zYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS_OOI6A$" moz-do-not-send=3D"true">Makef=
ile.am</a>&nbsp; &nbsp;| 2 +-<br>
            &gt; + gnulib/tests/<a href=3D"https://urldefense.com/v3/__ht=
tp://Makefile.am__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevU=
SozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS_OOI6A$" moz-do-not-send=3D"true">Mak=
efile.am</a> | 2 ++<br>
            &gt; + tests/<a href=3D"https://urldefense.com/v3/__http://Ma=
kefile.am__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEhe=
DF_2UTzKsYIrOwr3gCvYczeuvoZLS_OOI6A$" moz-do-not-send=3D"true">Makefile.a=
m</a>&nbsp; &nbsp; &nbsp; &nbsp; | 2 +-<br>
            &gt; + 4 files changed, 5 insertions(+), 3 deletions(-)<br>
            &gt; +<br>
            &gt; +--- a/<a href=3D"https://urldefense.com/v3/__http://con=
figure.ac__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEhe=
DF_2UTzKsYIrOwr3gCvYczeuvoZKUbn9G5Q$" rel=3D"noreferrer" target=3D"_blank=
" moz-do-not-send=3D"true">configure.ac</a><br>
            &gt; ++++ b/<a href=3D"https://urldefense.com/v3/__http://con=
figure.ac__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEhe=
DF_2UTzKsYIrOwr3gCvYczeuvoZKUbn9G5Q$" rel=3D"noreferrer" target=3D"_blank=
" moz-do-not-send=3D"true">configure.ac</a><br>
            &gt; +@@ -3,7 +3,7 @@ AC_CONFIG_SRCDIR([src/netcf.c])<br>
            &gt; + AC_CONFIG_AUX_DIR([build-aux])<br>
            &gt; + AC_CONFIG_MACRO_DIR([gnulib/m4])<br>
            &gt; + AC_CONFIG_HEADERS([config.h])<br>
            &gt; +-AM_INIT_AUTOMAKE([-Wno-portability 1.11 color-tests
            parallel-tests])<br>
            &gt; ++AM_INIT_AUTOMAKE([-Wno-portability 1.11
            subdir-objects color-tests parallel-tests])<br>
            &gt; + AM_SILENT_RULES([yes]) # make --enable-silent-rules
            the default.<br>
            &gt; + AC_CANONICAL_HOST<br>
            &gt; +<br>
            &gt; +--- a/gnulib/lib/<a href=3D"https://urldefense.com/v3/_=
_http://Makefile.am__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fg=
evUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS_OOI6A$" moz-do-not-send=3D"true">=
Makefile.am</a><br>
            &gt; ++++ b/gnulib/lib/<a href=3D"https://urldefense.com/v3/_=
_http://Makefile.am__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fg=
evUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS_OOI6A$" moz-do-not-send=3D"true">=
Makefile.am</a><br>
            &gt; +@@ -13,4 +13,4 @@ CLEANFILES=3D<br>
            &gt; +<br>
            &gt; + include <a href=3D"https://urldefense.com/v3/__http://=
gnulib.mk__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEhe=
DF_2UTzKsYIrOwr3gCvYczeuvoZIIKmHWZA$" rel=3D"noreferrer" target=3D"_blank=
" moz-do-not-send=3D"true">gnulib.mk</a><br>
            &gt; +<br>
            &gt; +-INCLUDES =3D $(GETTEXT_CPPFLAGS)<br>
            &gt; ++AM_CPPFLAGS =3D $(GETTEXT_CPPFLAGS)<br>
            &gt; +--- a/gnulib/tests/<a href=3D"https://urldefense.com/v3=
/__http://Makefile.am__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9=
fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS_OOI6A$" moz-do-not-send=3D"true=
">Makefile.am</a><br>
            &gt; ++++ b/gnulib/tests/<a href=3D"https://urldefense.com/v3=
/__http://Makefile.am__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9=
fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS_OOI6A$" moz-do-not-send=3D"true=
">Makefile.am</a><br>
            &gt; +@@ -3,6 +3,6 @@<br>
            &gt; + ## Copyright (C) 2011 Red Hat, Inc.<br>
            &gt; + ## See COPYING.LIB for the License of this software<br=
>
            &gt; +<br>
            &gt; +-include <a href=3D"https://urldefense.com/v3/__http://=
gnulib.mk__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEhe=
DF_2UTzKsYIrOwr3gCvYczeuvoZIIKmHWZA$" rel=3D"noreferrer" target=3D"_blank=
" moz-do-not-send=3D"true">gnulib.mk</a><br>
            &gt; ++AM_CFLAGS =3D<br>
            &gt; +<br>
            &gt; +-INCLUDES =3D $(GETTEXT_CPPFLAGS)<br>
            &gt; ++include <a href=3D"https://urldefense.com/v3/__http://=
gnulib.mk__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEhe=
DF_2UTzKsYIrOwr3gCvYczeuvoZIIKmHWZA$" rel=3D"noreferrer" target=3D"_blank=
" moz-do-not-send=3D"true">gnulib.mk</a><br>
            &gt; +--- a/tests/<a href=3D"https://urldefense.com/v3/__http=
://Makefile.am__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSo=
zYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS_OOI6A$" moz-do-not-send=3D"true">Makef=
ile.am</a><br>
            &gt; ++++ b/tests/<a href=3D"https://urldefense.com/v3/__http=
://Makefile.am__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSo=
zYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLS_OOI6A$" moz-do-not-send=3D"true">Makef=
ile.am</a><br>
            &gt; +@@ -14,7 +14,7 @@ TESTS_ENVIRONMENT =3D \<br>
            &gt; +&nbsp; &nbsp;abs_top_builddir=3D'$(abs_top_builddir)' \=
<br>
            &gt; +&nbsp; &nbsp;abs_top_srcdir=3D'$(abs_top_srcdir)'<br>
            &gt; +<br>
            &gt; +-INCLUDES =3D -I$(top_srcdir)/src<br>
            &gt; ++AM_CPPFLAGS =3D -I$(top_srcdir)/src<br>
            &gt; +<br>
            &gt; + TESTS=3D<br>
            &gt; + check_PROGRAMS=3D<br>
            &gt; diff --git a/meta-networking/recipes-support/netcf/<a hr=
ef=3D"https://urldefense.com/v3/__http://netcf_0.2.8.bb__;!!AjveYdw8EvQ!d=
pEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZ=
IHNt5dCQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
netcf_0.2.8.bb</a>
            b/meta-networking/recipes-support/netcf/<a href=3D"https://ur=
ldefense.com/v3/__http://netcf_0.2.8.bb__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmE=
PqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZIHNt5dCQ$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">netcf_0.2.8.bb</a=
><br>
            &gt; index 4170e9fab0..d1f9e29d3a 100644<br>
            &gt; --- a/meta-networking/recipes-support/netcf/<a href=3D"h=
ttps://urldefense.com/v3/__http://netcf_0.2.8.bb__;!!AjveYdw8EvQ!dpEKfhC6=
PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZIHNt5dC=
Q$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">netcf_0=
.2.8.bb</a><br>
            &gt; +++ b/meta-networking/recipes-support/netcf/<a href=3D"h=
ttps://urldefense.com/v3/__http://netcf_0.2.8.bb__;!!AjveYdw8EvQ!dpEKfhC6=
PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZIHNt5dC=
Q$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">netcf_0=
.2.8.bb</a><br>
            &gt; @@ -10,6 +10,7 @@ SRCREV =3D
            &quot;2c5d4255857531bc09d91dcd02e86545f29004d4&quot;<br>
            &gt;&nbsp; &nbsp;PV .=3D &quot;+git&quot;<br>
            &gt;<br>
            &gt;&nbsp; &nbsp;SRC_URI =3D &quot;git://<a href=3D"https://u=
rldefense.com/v3/__http://pagure.io/netcf.git;protocol=3Dhttps;branch=3Dm=
aster__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2=
UTzKsYIrOwr3gCvYczeuvoZLCEtYGwg$" rel=3D"noreferrer" target=3D"_blank" mo=
z-do-not-send=3D"true">pagure.io/netcf.git;protocol=3Dhttps;branch=3Dmast=
er</a>
            \<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0001-=
netcf-fix-bootstrap-with-newer-gnulib-automake.patch">file://0001-netcf-f=
ix-bootstrap-with-newer-gnulib-automake.patch</a>
            \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Adopt-=
to-new-gnulib-read_file-fread_file-signature.patch">file://0001-Adopt-to-=
new-gnulib-read_file-fread_file-signature.patch</a>&quot;<br>
            &gt;<br>
            &gt;&nbsp; &nbsp;UPSTREAM_CHECK_GITTAGREGEX =3D
            &quot;release-(?P&lt;pver&gt;(\d+(\.\d+)+))&quot;<br>
            &gt; @@ -27,6 +28,7 @@ PACKAGECONFIG ??=3D
            <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@bb.utils=
.filter('DISTRO_FEATURES','systemd',d)}">&quot;${@bb.utils.filter('DISTRO=
_FEATURES', 'systemd', d)}&quot;</a><br>
            &gt;&nbsp; &nbsp;PACKAGECONFIG[systemd] =3D
            &quot;--with-sysinit=3Dsystemd,--with-sysinit=3Dinitscripts,&=
quot;<br>
            &gt;<br>
            &gt;&nbsp; &nbsp;do_configure:prepend() {<br>
            &gt; +&nbsp; &nbsp; export GNULIB_TOOL_IMPL=3Dsh<br>
            <br>
            It seems this line is missing after merge.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Good eye. But its not needed anymore since the fix works
            with python version too, sticking to shell version was a
            stop gap anyway</div>
        </div>
      </div>
    </blockquote>
    <p>My local repo still fails without this line. I'll double check
      it.</p>
    <p>Many thanks.</p>
    <p>Kai</p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqFVzC99pAs5iN7qPc3iQ0b1n=
TY2ins6T24J5PWCpbTVQ@mail.gmail.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote gmail_quote_container">
          <div>&nbsp;</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            Regards,<br>
            Kai<br>
            <br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;currdir=3D`pwd`<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;cd ${S}<br>
            &gt;<br>
            &gt; @@ -50,11 +52,11 @@ do_install:append() {<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;if ${@bb.utils.contains('DISTR=
O_FEATURES',
            'systemd', 'true', 'false', d)}; then<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}${syste=
md_unitdir}/system<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if [ -d &quot;${D}${li=
bdir}/systemd/system&quot; ]; then<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if [ &quot;${s=
ystemd_unitdir}&quot; !=3D
            &quot;${libdir}/systemd&quot; ] ; then<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if [ &quot;${s=
ystemd_unitdir}&quot; !=3D
            &quot;${libdir}/systemd&quot; ] ; then<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; mv ${D}${libdir}/systemd/system/*
            ${D}${systemd_unitdir}/system/<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; rm -rf ${D}${libdir}/systemd/<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fi<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp;elif [ &quot;${systemd_unitd=
ir}&quot; !=3D
            &quot;${nonarch_libdir}/systemd&quot; ] ; then<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp;elif [ &quot;${systemd_unitd=
ir}&quot; !=3D
            &quot;${nonarch_libdir}/systemd&quot; ] ; then<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mv ${D}$=
{nonarch_libdir}/systemd/system/*
            ${D}${systemd_unitdir}/system/<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rm -rf $=
{D}${nonarch_libdir}/systemd/<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fi<br>
            &gt;<br>
            &gt; <br>
            &gt;<br>
            <br>
            -- <br>
            Kai Kang<br>
            Wind River Linux<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#125593): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-devel/message/125593=
__;!!AjveYdw8EvQ!dpEKfhC6PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKs=
YIrOwr3gCvYczeuvoZLt8wBJEA$" rel=3D"noreferrer" target=3D"_blank" moz-do-=
not-send=3D"true">https://lists.openembedded.org/g/openembedded-devel/mes=
sage/125593</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/118452427/1997914__;!!AjveYdw8EvQ!dpEKfhC6PW=
8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLzJ0t0CA$=
" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://l=
ists.openembedded.org/mt/118452427/1997914</a><br>
            Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lis=
ts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">openembed=
ded-devel+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!dpEKfhC6=
PW8F-dlmEPqrerZbXWROTFJ0Wi9fgevUSozYEheDF_2UTzKsYIrOwr3gCvYczeuvoZLXvTOnK=
g$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https:/=
/lists.openembedded.org/g/openembedded-devel/unsub</a>
            [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" moz-=
do-not-send=3D"true" class=3D"moz-txt-link-freetext">raj.khem@gmail.com</=
a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------YdyiGlYmUzkRY6e61XtM7NYW--

