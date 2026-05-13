Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F0ACD343F
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 02:42:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3444.1778640141129489528
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 19:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=RGy/qHf4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=959356aca3=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D2ei6E115929
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 19:42:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=ej7xV0+1b8Ch3t5bYjpUL/
	VCptr3IInwmjoJopnSN1c=; b=RGy/qHf4/Az/VnxkzZSuuTgoo3k0eu3I92B+aF
	MX00wML6oMWGkUFP+v8Xprp0fKUGbvxH8+5w9dvHdsZ8wtl4bTQm/ODbrCLGS+u/
	+prpD/wpurhrIm0uNGOJ70coJ7Z+G6rFwnElCs4PMtS+Nl4bq5HXhZDzjkkqdjZ/
	3sSsqAdxIQoY13gJVIbo+BgZdh0k1AA6IhE9umO/ff0rH4tLgDQ1Dr8NaxcsVnYR
	luZl0cpZ3TNG4sIcK5Vo90APMaJepX5yGYwckQ2EOEGsmPlAyedmpLRQG+F+V84+
	X8WtGNy6NuQ3nNWwa4fEbgJsAWNs7lwFc1CESMqmh5BhNsDA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011000.outbound.protection.outlook.com [40.107.208.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ftb821y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 19:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eumCfy8uWLd3LN1xETu5o6JjIsldGLnsuhHoodQA7ibOIdQVaLYc2R55BDW9k0ruA2/hBa1QhYFEW11KT4ty1od6Z/prGgVfs8h8wGNQ8RtfDJp7RqL7fg7LG+YD9DcL8jhhCHDtzA9gw97cnw2mIKPYqcLFOESlQwHXHxliViOAojGlXlan8cBRFpceg/nVFvXQWWyj91PCGu1v6gtcxJc8SQCLHEaCvFUcdXQ2DCpMmK4cIJEcJNdD6wy6Mhp+X57JdUwuUApAOyzP23RgM4VCOE/Zlkrb+Nwy81JXyorTNpdVHVNsZR903sICmQdIrBLgPibwIHADOMDSdUYOEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ej7xV0+1b8Ch3t5bYjpUL/VCptr3IInwmjoJopnSN1c=;
 b=DCWvHIWetLOD1bXp+c6InSN+vaoZYPcf0L/m53C+B49usCEwMtgOr/7fdf1DvlUuklLo4CBSbd01ue7SzkT5A31eATASEiqgV+zkRTVPqoGowo+JRCkinPVEFRUS8SxVuK4bIdZotxWAhpUrJMcZYYuzM3q73hu9IRU6fByB5XX3HAoaIDamZ3YpxZX0o/3F+VMv/nwKhUBRLgsR7nq1vYQxUtONx61BUj2dltJd7SIrBTr0YFYu4W6FlQBEV5SuBRI0elHFx53xZPSpOkwR0ShD4O9Q2MrT/TCdKNWQ4HlmdWd1Om2RolnTIULr3gNTH4pBLFjGclTaPm/Y24Gkbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16)
 by SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 02:42:16 +0000
Received: from DS0PR11MB7621.namprd11.prod.outlook.com
 ([fe80::b070:218b:b122:bf1a]) by DS0PR11MB7621.namprd11.prod.outlook.com
 ([fe80::b070:218b:b122:bf1a%6]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 02:42:16 +0000
Content-Type: multipart/alternative;
 boundary="------------Zs7Q3fNWsN1LuXiuKmkXYrJS"
Message-ID: <4ab911b0-796e-4387-a972-4296eaaeb81c@windriver.com>
Date: Wed, 13 May 2026 10:42:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] thin-provisioning-tools: fix compile
 failure on 32bit x86
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260512083810.1201751-1-hongxu.jia@windriver.com>
 <CAMKF1soKibpQ_e2fKO5divt3npzH7LYBxNurgN4jyCZ-KajhWQ@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CAMKF1soKibpQ_e2fKO5divt3npzH7LYBxNurgN4jyCZ-KajhWQ@mail.gmail.com>
X-ClientProxiedBy: SG2P153CA0032.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::19)
 To DS0PR11MB7621.namprd11.prod.outlook.com (2603:10b6:8:143::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7621:EE_|SJ0PR11MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df517f7-4f02-436f-07ac-08deb0993ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|13003099007|3023799003|11063799003|4133799003|56012099003|8096899003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Uud67LcgGZL7F//Zgs2eEcanw99qC2+rpH8Lzo1E6eSu2+vGS2QVgkf3o5OqVYOdEyTyTPN4sQ2ut1MixOZ/Sbn5MYWmIQ55hLCaW5Z3hirLYoKTtBhJWN+zO8MkGNQkln537B11QhlJZuvFgUJ1Ew3reBvrkNSZIlNBqzeQpbrcVYjJ7wEZwCD9P2XrUJM4RhBRgb98HPj2ak40YEEBiy3RbszYXCvGqopw/0A/bREuqHCCZzBykxEtDrlvMAkwxeTqF2CLxD9KaHCRJyV2ez2BBoCVaQG/CYDwJpbEeiIl2GpLZfGgumeYOL/hrEwLr2DSTDcD4ekZ4qx9F1T+tBVx+9uCifFT3ELhX51DoibuScF1AhJeKIPAGkxTCbFinBKTLhVYjiGqRQYTpiSuPzCmmFmIE21Cg06BQzYcS5GcWwyiupLttjSZwx0dm2cHL/mS65gRKPvPoHs+ynRND7LUhLYDil0uYsixGiCkZQRaLFyd/47SGa/a5EEzRbc4zHrmpp3qcEyeyXSL7Dr9y8+L7zznsFXg9gvSmEOjwfyBpV93JDqUwgmBuI69arvM66NS1ONKOlrx5KKzOqBI3d8ihF0JvYW4nc0NrOkT1gPdIL7752fupWFEyLq+ZKwlNLVkiX3FpexvtE1qiTbmYQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7621.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(13003099007)(3023799003)(11063799003)(4133799003)(56012099003)(8096899003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R0gzZzM4c3pTVC93a3VPMnJqMjY4ZlNZN1F0aVpqY0RweGtZcjJaMnJWeDc0?=
 =?utf-8?B?a1A4bkFBUWxXaTR6cGVrR1ZCTzZaZmNVSVpnMUNIU1I5NStLMUxXWWNDRmJs?=
 =?utf-8?B?ZytNV1M1cjh6S2M0aVllR3E4QjQwczNXTjV6MHgwaDlBOWtOaU0yd2pGMjEr?=
 =?utf-8?B?SG5McVhCQ1RGRWFXeEFHTWkxeWgvWTFxREUyN1NDVzlIcWdMUVVDZjcyVFQz?=
 =?utf-8?B?ZEJCQk91aWRaSTBnTXd3WGZCSCtLL0cxa2x1WndJWlo1cm5ZWkJsUWlmNGJZ?=
 =?utf-8?B?RGpXdWVEQ0hCSEcwUFFFQ29tcUp5Si8vYTdQZWNVSUNMQzJWdjVBSEpoUlV1?=
 =?utf-8?B?M2Y1Mm11VTNJNTBYK1p6eGIvb0lRZlpydVlFc2VGWDJGeHpWZE5peDFuNXpI?=
 =?utf-8?B?WXlyQkxXaUxBdnN0c1NqTDZYUE9vZGJPS2FMTU5Yc1VqTk9mNkgwOWRpVzky?=
 =?utf-8?B?SnBleUo5alZhdWdhNGFRUExWRXNjZ3g5TXU1d3N4SWthZVM3UUpIdDR4d1Y5?=
 =?utf-8?B?Y1FaQUR4MjRxZ2p1S0FwRHFkZFp1SXA5WXkwcFlxdEtQQ3ViWUZqREltVEtk?=
 =?utf-8?B?Q0tQODZvWWtEeHVqdVNMWTBaWVIyTmkvWi92Y3VYeGhhRnEydmJlM0lySjcy?=
 =?utf-8?B?SWt1bjlwdDJxdlBVMHB5THVxemRTQlNQdTBwdEZ4NC9WSFZsdTlReGEyc043?=
 =?utf-8?B?MXNRSUJjSk1zVXZad0l2SnA2bXdDcnN2ODJIcnJBQkRnbHlrREdJb1VBNHNr?=
 =?utf-8?B?Q0VYSm1zODdBald4eUxJSHBRZzFhVnk0Q2hlQlQ0d1pSeFhQcGNHT0JrQlhY?=
 =?utf-8?B?T0R5aHdiOTN4d09tRmhuaDBNejdzdHdHZVN6SG9mdmYxVXdYaTdrOHJlcmNY?=
 =?utf-8?B?QXVxNnlSQ3l3WnFXMThBTVdoeE9SYzRCMHgvVW4ybDFra0I2ZFRMQVJPQm9y?=
 =?utf-8?B?MkJyTHhFTjdTWm41ZFhhcjFlZzhNMXBZeEtGTEppcWlyTUNSblg4REFINU1O?=
 =?utf-8?B?L2VyUVNEZitzcnpUa28wOXpPQ0YvdXoxam9seEpkWFM1SnRnNisxa2hHL2FL?=
 =?utf-8?B?Y3VJdEx5M3B0R09tdXZ6UnJnLzV2MjZVTk1WbEJCQ1h4OEQ0bmN5TGVQemEy?=
 =?utf-8?B?c2lzTVo5Q1FoVDkwTHkrZHZ1b1Z6dk1hTFVrbFVZZFhOa0h5VlI2bEZHVzVm?=
 =?utf-8?B?QklDYkRhTmN1Z2dtZGJXTUNwRTZNTnFhSzc2QkxDa1ZobUZ2QUZ4L3pkdDl4?=
 =?utf-8?B?WFRZWGNrUmxteW13YUhLY2FjVE1kcXR5c2xia3N6OXBCNDVFeEFkcE4zWTVw?=
 =?utf-8?B?SEV1bmFzZFlEYnpLVTE3dmk2UFVaOTNUbGFjVHhublJ6QzJtanUzN3RaTVF4?=
 =?utf-8?B?UENuWkpCdUtPMlR2c0E2UVJmN0hleVB3YmhSQUpFT0VuVzJpREtzNnl4MjRL?=
 =?utf-8?B?Vm94TzhaQUpqVEVxb3czcEgwbW12cjJ6ZWZGcUpQNUx2VmhoQWRwbDZXUVRs?=
 =?utf-8?B?UEFOQUxjbGpGQUlSTXJIamhHazlzditkZzBTbVM4VUgyTGxhQXFBSTFoM0xq?=
 =?utf-8?B?WTNjc0l6VVBHVXJ6bGZOdWI0bUVkQ1dwQTc1eFVncVVsOTBybktpZ05tZjNE?=
 =?utf-8?B?c3EyMG90QkRhcjNkUG1waEFRTUsrYzZNWUpiaGE4VTJRRE5Ha0VNZzNEaDY1?=
 =?utf-8?B?TzV6K1ZnK3VQYlY1OWsyVGJMTUlPVGM0VVB2V3M3bEpzbkZWdklnYndUcEFK?=
 =?utf-8?B?TVlpYTNlOGJieUJOVTVqZmtNUkYzN0VJNXltelpFRDdnbHh4M3pqOVNwRzBy?=
 =?utf-8?B?cktXRUNneUcxZ3kzeEJURmdsZWNoVk5rbndKS3NNTzZNYnRzVHFKVUJhQXRt?=
 =?utf-8?B?UXArMXo1T2YrWEh0Y2JYem0vTmJYNWJmSHYrUFpnb1FnM0hGRjdHaTlQeWpz?=
 =?utf-8?B?WHhYSC9OeG9aK1h1MXZBTWVIc1JqTURud1pINkc1S3F1WU9DMTIwTjdYK2gv?=
 =?utf-8?B?Y1A2RjkxWHpJMk1NKzNOQzRYUzhGUUVtdk9salFzQmtsajRVOEE1ZVdQakNw?=
 =?utf-8?B?c2RzcmliZmpTb1dhREFtS2FIRGZpQkJmckVlRGt0cE5FaVFEYnBLc28rLzdh?=
 =?utf-8?B?cHNLYVlUSk9kcXJUNTVZa09FdkZ1TGloa245NGM3VFNaeEZMUTczMW5tWFg0?=
 =?utf-8?B?Q3V2dXNPSUsvNVNXeWhyRGYrRXdqOTBhbzdyTmtHUVoyeHNENVVFeFB0aUFt?=
 =?utf-8?B?SktlQ1dCMjFMQ2FVbDB1VzdqYXA4QytIeFdvZkJvOVFLZFYwWEZCOVBPQ2Fl?=
 =?utf-8?B?dEJjdmxiUXZrMkxxYnFyOW5VZVpCUUFlS2VybmlkWTFncFoweHFlQT09?=
X-Exchange-RoutingPolicyChecked: 
	aahT7XPMK0Pb0I0L/ueHbrooptvrwapoMEO8Wpq/Ys0WOXb6LrwA8L3UU+CVaeYQTDczEJvwydQWs4JKpp7+jIfLRu8LyibFxhmO6YB9HfOOumtu1frb5Y28dIGmte6uhnKkqbYJ5AW7ffAZUPsd5Empx7tcJk+p66BVBa5qNTlQhRdpoKfN4wvmpvOxAgzGPtT6BdO0kIrk0K09qQYWZQ5sqEb499JFgZu4oZ76lcwUExcg8v66AQFybrF2pZi8tqmbR3P08U/1F/IlLPiKFzQQ3q3kKrt78tB0xPHO3jel90ZOu6WTl4wE3ngLAkDNJf582uy8UC378/FtnvaCag==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df517f7-4f02-436f-07ac-08deb0993ead
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7621.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 02:42:16.2559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8uMWgKw4ZTv14ah/Qxx9qCac3KFhvY4yAH9VVDaqSljDzFvpfUoVGlabF4aJ/M+bUGYfz9P+5FGqTskXOeWADi7KNUvz/NIfYQV+ZFMrjNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDAyNSBTYWx0ZWRfX0OCl+kRvmEVM
 Kb6A/+4aCR3IaHvF/t8yRe6J23QGCC/cdRrxDXjfM81w0TpcCpjTaLRYHpxMB+Y57RKL2P4BlF7
 UEfPo21GVlB0m8vYAuQr8LRwOdljeCziUzP18NHTtlIREQaAqr1I/LQWfeEyo3Oi/xfCLsvKnIV
 I2P5O+ZOUhHNttkqSGK1TH15ND73WV/VFeSDuuJZikTEfO2821Uyw02SqIl4mlh5x7OhN4V66HC
 JU9ltlMr3L8THM4Q0LKIjdD7StLa44w0m2WyinrML1WbpszF6wvu9AOaNePI1Kj9lWE9X3CfcHc
 M6GE3ONiMQNltSyh5pb8zwBsKU3O+2tGoLL1eUS+laoGIPnSxomZHYBNBiaQjDOg3m2NdbxC4mH
 J5TGHhf/+wyRtLIz7UbKQhulwiM5LmW60J3LAzosl+Gn0mxvvyv1fXWrNK7uitkAjYFr1lKYjW/
 Uq86EHkoRwZirt1ZjSA==
X-Proofpoint-GUID: oJ0ecQqY9Pg7I544DxvPyPUWeakItJ-A
X-Authority-Analysis: v=2.4 cv=du/rzVg4 c=1 sm=1 tr=0 ts=6a03e50c cx=c_pps
 a=ifAyozehCtGKCK27NPK/8Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=akXkHCNNAAAA:8 a=vmi6oJg5AAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=cWSRvPIfJUaJeEgQSZgA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x5vCa8G6nyixWQYmn44A:9 a=I54x2orCXX9XUeWu:21
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=PqIwviG9Fww6HOkbNfso:22
 a=ioboX4i089tB3dTPuEcW:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: AZbbpdHK95HFn9Tm5vQlMIukalgDBjz5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 02:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126880

--------------Zs7Q3fNWsN1LuXiuKmkXYrJS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64D2ei6E115929

On 5/12/26 23:43, Khem Raj wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Tue, May 12, 2026 at 1:38=E2=80=AFAM hongxu via lists.openembedded.o=
rg=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!ZNjmxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3zHpNGQL8u31s4O=
ojLxs1ER4HbXFfP$>=20
> <hongxu.jia=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     $ echo 'MACHINE =3D "qemux86"' >> conf/local.conf
>     $ bitbake thin-provisioning-tools
>     ```
>     error[E0080]: index out of bounds: the length is 1 but the index is=
 4
>     =C2=A0-->
>     tmp/work/core2-32-wrs-linux/thin-provisioning-tools/1.3.1/build/tar=
get/release/build/devicemapper-sys-f88f57f28cd965d2/out/dm-bindings.rs
>     <https://urldefense.com/v3/__http://dm-bindings.rs__;!!AjveYdw8EvQ!=
ZNjmxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3zHpNGQL8u31s4OojLx=
s1ER_XZVo3H$>:3:8718
>     =C2=A0 |
>     3 | ...usize] ; ["Alignment of dm_ioctl"] [:: std :: mem ::
>     align_of :: < dm_ioctl > () - 4usize] ; ["Offset of field:
>     dm_ioctl::version"...
>     =C2=A0 |
>     =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^
>     evaluation of `_` failed here
>     ```
>
>     Tweak filter condition on TUNE_FEATURES to add m32,mx32 for 32bit x=
86
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>     ---
>     =C2=A0.../thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
>     <https://urldefense.com/v3/__http://thin-provisioning-tools_1.3.1.b=
b__;!!AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3=
zHpNGQL8u31s4OojLxs1ER13ufRPS$>
>     =C2=A0 | 2 +-
>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git
>     a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning=
-tools_1.3.1.bb
>     <https://urldefense.com/v3/__http://thin-provisioning-tools_1.3.1.b=
b__;!!AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3=
zHpNGQL8u31s4OojLxs1ER13ufRPS$>
>     b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning=
-tools_1.3.1.bb
>     <https://urldefense.com/v3/__http://thin-provisioning-tools_1.3.1.b=
b__;!!AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3=
zHpNGQL8u31s4OojLxs1ER13ufRPS$>
>     index 4d8d2a04df..6a58d090e8 100644
>     ---
>     a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning=
-tools_1.3.1.bb
>     <https://urldefense.com/v3/__http://thin-provisioning-tools_1.3.1.b=
b__;!!AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3=
zHpNGQL8u31s4OojLxs1ER13ufRPS$>
>     +++
>     b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning=
-tools_1.3.1.bb
>     <https://urldefense.com/v3/__http://thin-provisioning-tools_1.3.1.b=
b__;!!AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3=
zHpNGQL8u31s4OojLxs1ER13ufRPS$>
>     @@ -10,7 +10,7 @@ SRC_URI =3D " \
>     =C2=A0 =C2=A0
>     =C2=A0git://github.com/device-mapper-utils/thin-provisioning-tools;=
branch=3Dmain;protocol=3Dhttps;tag=3Dv${PV}
>     <https://urldefense.com/v3/__http://github.com/device-mapper-utils/=
thin-provisioning-tools;branch=3Dmain;protocol=3Dhttps;tag=3Dv$*7BPV*7D__=
;JSU!!AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3=
zHpNGQL8u31s4OojLxs1ER_9QYG3K$>
>     \
>     file://0001-Use-portable-atomics-crate.patch \
>     file://disable-cargo-metadata.patch \
>     -=C2=A0 =C2=A0 ${@bb.utils.contains('TUNE_FEATURES', '32', \
>     +=C2=A0 =C2=A0 ${@bb.utils.contains_any('TUNE_FEATURES', '32 m32 mx=
32', \
>     =C2=A0'file://dms-no-layout-check.patch;patchdir=3D${CARGO_VENDORIN=
G_DIRECTORY}/devicemapper-sys-0.3.3',
>     \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'', d)} \
>
>
> would something like
> ${@oe.utils.conditional('SITEINFO_BITS', '32',=20
> 'file://dms-no-layout-check.patch;patchdir=3D${CARGO_VENDORING_DIRECTOR=
Y}/devicemapper-sys-0.3.3',=20
> '', d)}
> =C2=A0cover all 32bit cases ?

Good idea, v2 incoming

//Hongxu

>     =C2=A0 =C2=A0 =C2=A0"
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#126864):
>     https://lists.openembedded.org/g/openembedded-devel/message/126864
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/126864__;!!AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M3wIFp_Tgw=
Lte4BBS_Mg_MWqeWG1CaMtFrYf3zHpNGQL8u31s4OojLxs1ER1OnUMOy$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/119271402/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1192=
71402/1997914__;!!AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqe=
WG1CaMtFrYf3zHpNGQL8u31s4OojLxs1ER6iBVuEP$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_M=
g_MWqeWG1CaMtFrYf3zHpNGQL8u31s4OojLxs1ER0JpsS6j$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------Zs7Q3fNWsN1LuXiuKmkXYrJS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64D2ei6E115929

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 5/12/26 23:43, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soKibpQ_e2fKO5divt3npzH7L=
YBxNurgN4jyCZ-KajhWQ@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 12, 2026 at
              1:38=E2=80=AFAM hongxu via <a href=3D"https://urldefense.co=
m/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M3=
wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3zHpNGQL8u31s4OojLxs1ER4HbXFfP$" moz-do=
-not-send=3D"true">
                lists.openembedded.org</a> &lt;hongxu.jia=3D<a href=3D"ma=
ilto:windriver.com@lists.openembedded.org" moz-do-not-send=3D"true" class=
=3D"moz-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              $ echo 'MACHINE =3D &quot;qemux86&quot;' &gt;&gt; conf/loca=
l.conf<br>
              $ bitbake thin-provisioning-tools<br>
              ```<br>
              error[E0080]: index out of bounds: the length is 1 but the
              index is 4<br>
              &nbsp;--&gt;
tmp/work/core2-32-wrs-linux/thin-provisioning-tools/1.3.1/build/target/re=
lease/build/devicemapper-sys-f88f57f28cd965d2/out/<a href=3D"https://urld=
efense.com/v3/__http://dm-bindings.rs__;!!AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M=
3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3zHpNGQL8u31s4OojLxs1ER_XZVo3H$" moz-d=
o-not-send=3D"true">dm-bindings.rs</a>:3:8718<br>
              &nbsp; |<br>
              3 | ...usize] ; [&quot;Alignment of dm_ioctl&quot;] [:: std=
 :: mem
              :: align_of :: &lt; dm_ioctl &gt; () - 4usize] ; [&quot;Off=
set
              of field: dm_ioctl::version&quot;...<br>
              &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^
              evaluation of `_` failed here<br>
              ```<br>
              <br>
              Tweak filter condition on TUNE_FEATURES to add m32,mx32
              for 32bit x86<br>
              <br>
              Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@=
windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-tx=
t-link-freetext">hongxu.jia@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;.../thin-provisioning-tools/<a href=3D"https://urldef=
ense.com/v3/__http://thin-provisioning-tools_1.3.1.bb__;!!AjveYdw8EvQ!ZNj=
mxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3zHpNGQL8u31s4OojLxs1E=
R13ufRPS$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
thin-provisioning-tools_1.3.1.bb</a>&nbsp;
              &nbsp; | 2 +-<br>
              &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
              <br>
              diff --git
              a/meta-oe/recipes-support/thin-provisioning-tools/<a href=3D=
"https://urldefense.com/v3/__http://thin-provisioning-tools_1.3.1.bb__;!!=
AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3zHpNGQ=
L8u31s4OojLxs1ER13ufRPS$" rel=3D"noreferrer" target=3D"_blank" moz-do-not=
-send=3D"true">thin-provisioning-tools_1.3.1.bb</a>
              b/meta-oe/recipes-support/thin-provisioning-tools/<a href=3D=
"https://urldefense.com/v3/__http://thin-provisioning-tools_1.3.1.bb__;!!=
AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3zHpNGQ=
L8u31s4OojLxs1ER13ufRPS$" rel=3D"noreferrer" target=3D"_blank" moz-do-not=
-send=3D"true">thin-provisioning-tools_1.3.1.bb</a><br>
              index 4d8d2a04df..6a58d090e8 100644<br>
              --- a/meta-oe/recipes-support/thin-provisioning-tools/<a hr=
ef=3D"https://urldefense.com/v3/__http://thin-provisioning-tools_1.3.1.bb=
__;!!AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3z=
HpNGQL8u31s4OojLxs1ER13ufRPS$" rel=3D"noreferrer" target=3D"_blank" moz-d=
o-not-send=3D"true">thin-provisioning-tools_1.3.1.bb</a><br>
              +++ b/meta-oe/recipes-support/thin-provisioning-tools/<a hr=
ef=3D"https://urldefense.com/v3/__http://thin-provisioning-tools_1.3.1.bb=
__;!!AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3z=
HpNGQL8u31s4OojLxs1ER13ufRPS$" rel=3D"noreferrer" target=3D"_blank" moz-d=
o-not-send=3D"true">thin-provisioning-tools_1.3.1.bb</a><br>
              @@ -10,7 +10,7 @@ SRC_URI =3D &quot; \<br>
              &nbsp; &nbsp; &nbsp;git://<a href=3D"https://urldefense.com=
/v3/__http://github.com/device-mapper-utils/thin-provisioning-tools;branc=
h=3Dmain;protocol=3Dhttps;tag=3Dv$*7BPV*7D__;JSU!!AjveYdw8EvQ!ZNjmxGK0Ko-=
e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3zHpNGQL8u31s4OojLxs1ER_9QYG3K=
$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">github.c=
om/device-mapper-utils/thin-provisioning-tools;branch=3Dmain;protocol=3Dh=
ttps;tag=3Dv${PV}</a>
              \<br>
              &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt-link-freetext" href=
=3D"file://0001-Use-portable-atomics-crate.patch">file://0001-Use-portabl=
e-atomics-crate.patch</a> \<br>
              &nbsp; &nbsp; &nbsp;<a class=3D"moz-txt-link-freetext" href=
=3D"file://disable-cargo-metadata.patch">file://disable-cargo-metadata.pa=
tch</a> \<br>
              -&nbsp; &nbsp; ${@bb.utils.contains('TUNE_FEATURES', '32', =
\<br>
              +&nbsp; &nbsp; ${@bb.utils.contains_any('TUNE_FEATURES', '3=
2 m32
              mx32', \<br>
              &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;'<a class=3D"moz-txt-link-freetext" href=3D"file://dms-no-layout-ch=
eck.patch;patchdir=3D$">file://dms-no-layout-check.patch;patchdir=3D$</a>=
{CARGO_VENDORING_DIRECTORY}/devicemapper-sys-0.3.3',
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'', d)} \<br>
            </blockquote>
            <div><br>
            </div>
            <div>would something like</div>
            <div>${@oe.utils.conditional('SITEINFO_BITS', '32',
'<a class=3D"moz-txt-link-freetext" href=3D"file://dms-no-layout-check.pa=
tch;patchdir=3D$">file://dms-no-layout-check.patch;patchdir=3D$</a>{CARGO=
_VENDORING_DIRECTORY}/devicemapper-sys-0.3.3',
              '', d)}</div>
            <div>&nbsp;cover all 32bit cases ?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Good idea, v2 incoming</p>
    <p>//Hongxu</p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soKibpQ_e2fKO5divt3npzH7L=
YBxNurgN4jyCZ-KajhWQ@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              &nbsp; &nbsp; &nbsp;&quot;<br>
              -- <br>
              2.34.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#126864): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-devel/message/1268=
64__;!!AjveYdw8EvQ!ZNjmxGK0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf=
3zHpNGQL8u31s4OojLxs1ER1OnUMOy$" rel=3D"noreferrer" target=3D"_blank" moz=
-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-devel/message/126864</a><br=
>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/119271402/1997914__;!!AjveYdw8EvQ!ZNjmxGK0=
Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3zHpNGQL8u31s4OojLxs1ER6iBV=
uEP$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                https://lists.openembedded.org/mt/119271402/1997914</a><b=
r>
              Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@l=
ists.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-devel+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!ZNjmxG=
K0Ko-e44Pl88M3wIFp_TgwLte4BBS_Mg_MWqeWG1CaMtFrYf3zHpNGQL8u31s4OojLxs1ER0J=
psS6j$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank" moz-do-not-send=3D"true" cl=
ass=3D"moz-txt-link-freetext">raj.khem@gmail.com</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------Zs7Q3fNWsN1LuXiuKmkXYrJS--

