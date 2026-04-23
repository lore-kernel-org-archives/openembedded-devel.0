Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301CEFAD3F6
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 03:40:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9418.1776915632884165635
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 20:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BmdTtcte;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=857337a20d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N1QAPj766229
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 03:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=wZhHQ5l8/05HGEB1R49Wv5DAGZ508xBSIYAj1XFIp8Q=; b=BmdTtctew47J
	lPnePZf68uyPNtldZYnOA+l1IavbuDHhqK6MoqEt8wSGmF1NjFUGbwXpd3cjIx8B
	tTZqaUYr97HKIIbWD1UoGsqijqJ0dSrG0X1Cvr4VwRyJvn0+VdKaPIOKIaiUPnC+
	wmzGBHdwPEtqyB/FCQ99pnVljwjZVgLJ60IsGeQrlbqfEwcUSEfvHEaBVf03Q2Q6
	vBoBwfEAn6TO4moezpD14Aiyjd29f1s26pu5Vtwn6yGAfSyCBFB+wahcdlsB2L4g
	mJPL9OKWVzfkTjW+mcSGPWYDkF/9XUVbdxjZP3li3RWnenq136h3Hw+ON5Z/vPPw
	oWxLt8jeJA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012049.outbound.protection.outlook.com [40.93.195.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8qc04fq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 03:40:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZ5u0fje6oH1RQ82xC7JTV/ctqqko3dH0KNbetDbVhCL5Y5auRGot4GcvpmjepAOk+Hw05y25GfmVu/OJ0cJZ4FtBAU1nPkq6Wx1Xi1bpZMS/I6uRVc72kGuYU0xJKKhYyrCDOknWnVVn9QLyY0EED1Jjuv9pnmKgj0a5H24ZM7G6A3Tq9P7u67lHdKTGGiym5EmaNNTIoTuKfm0WqS7YdGX74/7k5qUWKjiAr4LhkOBXHWphZZ+Etaf89HollIcAIfEAC8BaYPYoNxry17dJhD4/ej5IOObqBzNMaeSvJFjhBcgfWw7ojc3/m+aJLI8khtCbLbwuiovzF8P/86daA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZhHQ5l8/05HGEB1R49Wv5DAGZ508xBSIYAj1XFIp8Q=;
 b=DiqjfDjq3nvf4E1/8ljQ22ZP+K8jK9EXA2MPGwd6+S3YUyIJxc+fqbd4+jFtGYelakLDiwk/7FcT/weTLSE5ystNh/p10KzQITV8L5nyBSiwJeECt4M3jERypmRa+/V9jHUZisfnoCXMtyN8y+2sHjpGrFyl8wanIS5XdMqdl+4B7MOsaOa4W2bLJI/CmieOA75It1we3lINJfqQMlM9mb9bJvLNjEGXSOQxCZJHdXIlw9Ehhxfs4VNFynm2y9zH8i5eVDyPrpj4+sMN5v7mF2z5qPqa6Xi3jpqzo+lkNwcKy8SfojXkKZDhQGYALkLHQEASr0Ehv0bI7dGd9r3DdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB7367.namprd11.prod.outlook.com (2603:10b6:208:421::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 23 Apr
 2026 03:40:28 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 03:40:27 +0000
Message-ID: <b9fbe190-229f-44ca-acb0-d25f61f52a9f@windriver.com>
Date: Thu, 23 Apr 2026 11:40:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-xfce][PATCH] xfce4-session: Make libpam and systemd
 dependencies conditional
To: wenlin.kang@windriver.com, openembedded-devel@lists.openembedded.org
References: <20260423031717.4186749-1-wenlin.kang@windriver.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <20260423031717.4186749-1-wenlin.kang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0014.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: da35b863-31db-4369-2b46-08dea0ea0f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	aY0RZo5Wph5M7Ei8vYO95L0+0aLrC64GlkYBbQiz1v5x4bb+TSqFd7OnGbYdoxP5deOPiDaJFXaDSWbz3RAWD8XD3Z5xfaHnEeZiA39yaG7KZ5UYh54geOEBoNt3CdWp5A+jGPwkBMUpJTAhmQyEQDcnzL5Gt88fO1tQZhK+iSgJWi8e4xZrtyZOIi7YjQRUJ+XpS4QCPTPKMeGdiinEbnzmpLenDoY+EStz3MF+jmsWLIztXneoA9Qytpv1JRvD4ILJGTChCqUb+HVNtT0NxwFEDuKBWP2ZjJKVNGIG/TQq7GNx1h2sJ6n34l5lu3Q5BVwm+GPpxezUooNFAuety1tZbcBFqT5diqC1IvUyRD6Dhj6fVd96Qvt7wK4hW7xaH0NdfZtuaWkvasrbwQWjWfR5ftWRD/cqd0eu2Y76DYMunYysXilKiFlxEe9+z3Ffzw+ncvclCA8/rIn4o0EqoCy7wvDHBFeOk6vtyNM5eeDVl01SxvOSy85X2C1Z9sKormT02FdoMjFyl40NBxps0atEJNwINjmz9kqisl7BzDn/ls9mgfwGSjsQ4iiqd4QWi0hq0QoTUzeNx9YQEeHPVDG6rZ6XdAKv2z5oVTQEhaLYg30CuVRdSz16zbsvFGlMP1FzfDvYhRjX+mNO4bDf746Vqg5xMZJ513vo/V99ZNaVr4iU+JsK8FqPsNGziNW17TTNfyXHQHzMnn39Y/cMkw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MW1MN2NXSnFtRFQ2NXpuUHVrRUpWUWs5MmdDeVZqb0xwRHJLN3JkS1A5ajBt?=
 =?utf-8?B?dEVlelIvS3AyTEJkcmh4dWsrNDAxZGNPVEVTVVkyNXcrcDJaRzRFcEhZNFl2?=
 =?utf-8?B?RmVhcmJFUFo3ZWw4azN2UlZYakxjS0U2ZTczWWtQNTBiWUdnL0w2ZVdMUmNG?=
 =?utf-8?B?VGVyNTJQOGlVSDl6bDZWekJMSjI5bDVTU0pzMlZheFU4czd4ZHduTU94NDMy?=
 =?utf-8?B?RjA2WGtsS1F2MVg2NWJ6VHZ5cFJ1ZWZ0cW5Gb0d4Vk1TVTVlNUxrMXFrQVc5?=
 =?utf-8?B?aml3eW1YK3JkbDVkbnF4OHR6bXZoT1RtUXl4TTh1RVhoNkhoWXlKTU81Mmx6?=
 =?utf-8?B?ZHdreWtndUJINnVtQ1hKaDJtUVRIN2o4WWhWbjAvZjhOdXFJQ0NMRk1veDNm?=
 =?utf-8?B?Mlh4RWhIQ2dCbmlnU252WHlhZUh6dE5kcG54eG1KNU1hdWRvTUNiYlRHTEh5?=
 =?utf-8?B?WFdSRCtERWtUenQyRWxvZlhVRklUd0hPWUhoQVd5Rmt3dGVKUzhTNTVadms1?=
 =?utf-8?B?Mndtd2VpRmlMUzhWbW5teG5ydktyeS9UMkVMdlZyVXd0UVNNZUl2dTREdXVx?=
 =?utf-8?B?dUh1UDRqMkJmYkIya2gzNjNjWnZwVTk3OWlIL1NGbFJOdHZPY3FtVmRONG1S?=
 =?utf-8?B?NHk4bUMrN1dPODFTMi9VTkJGT3lHdFVLTCtNS3kweEFraDNCb29MNTVsbW5l?=
 =?utf-8?B?bXRhQStVWjdJN1c4K1g5cUd2c25KeFYzMmgzY2s3Unh6N0xpekN4QXRvL29B?=
 =?utf-8?B?ejNmTnFYZXZBVGRTZ2poRGVzUXQ1NFUrMjJqMm5vcUJFOExWT25pNTEycGE4?=
 =?utf-8?B?Qy9PaEI1YmE4L2F3OHE1NlB2ZlRpNXpOdGRKOG1yNy9EbEpFZ2dGckRDYk5R?=
 =?utf-8?B?SWJYM0ZzMW51Z2Y3WXRvY1p4V2tLZXQrcThaUno0TUdLQkNiR2g5MnpnZjdB?=
 =?utf-8?B?M1daVmZVaTJGREtQMGlLTGovQ2d4TzNISHJmb3JpSGpJYVVRbk5SRDl0TUNY?=
 =?utf-8?B?aWtDK3hDdXIrcVhIOXJkODl3RS9uTk90L2M4NEVmTlpjcVYwbnJ3azlrb3k5?=
 =?utf-8?B?NWdjazI5YTRMZzVBVkg0TFJmWXhsUnlCWndtVHlTK0d4bWRYanU5Tk5ucTJy?=
 =?utf-8?B?T2Jmd2xnelBuY0xlNkh3NW9MWVJ4Vko1QlBxTEloRjZuYTFhK3Bna0xwdjY0?=
 =?utf-8?B?ZG9aM2lMeWRFb01YZmI3a2dIRy9jd0prTGgxb3M3OTVHS1N4UnoxSE5jVnIz?=
 =?utf-8?B?RG10Vk04K2gvODA1ajZZdXk4V3JtRTh3TnlVWW5LSnprYkxTdUlVbGlrZG5p?=
 =?utf-8?B?S2g0cHBjRnhZaGZ6UjZ6dElPUENrc3k2WVBROXhpcWdTNitxcUN6RCtpS3ln?=
 =?utf-8?B?NGt2UmlBZHkweTdleWtVeXdhVjdHQ005a1p3amxMQ0pFY2paQjhYTVVOd3lP?=
 =?utf-8?B?MlZOYmZLYS8xUzNGMjdncktWR3NqQkZYb0E3U01yN0dJUmhBZC8xcVlnVmhR?=
 =?utf-8?B?Tkh6NmZoQnlPTGxyTlRObjBlenVHelNEMENsajdraTJDWWpJTm1LRHZCQnpJ?=
 =?utf-8?B?M0ZkaDdzS3RCS0ZJYlFYNXNnM0dGK0ZZTEJnZTdXS0hzTzdSVlVOcEdUUm81?=
 =?utf-8?B?VDJpbW8wbkNXL3NvQVozMzdTVEJyUDNzTUY3Q1IwalNMWHBqUVAwdzd6NzZ1?=
 =?utf-8?B?YW1FbUtlREFNODkxU2p2cy9EaFc4cit4YkY5RytqTi96OGJZd295aXJCNHR0?=
 =?utf-8?B?ellKT3RURkNrZmlPYW9tODlnbTVoejJDbmNpakloZkFJYkhENUFLcEcxTDB0?=
 =?utf-8?B?eXhDN0NZckdSU3NZa1BGUmhKd0cwUU5IQUliVTEyM0dwMU5JUHNLalFoc2Nk?=
 =?utf-8?B?a0FCcGxBNE5SZDliQm4rVEUzNXJXSVRleU5VajJvb3U1eFFsRWd5K0VReWZx?=
 =?utf-8?B?TVRHdkJSWjNPNXI0dEhzbFpoS1dYVHM2bnREOURQM0xBR3RMcW8zMUMwYURZ?=
 =?utf-8?B?SnRvRWZMR21WWStZRCtRbW1iR1pHTVJiVWdIaDJScXh6QThkK3dpdFBDaUI5?=
 =?utf-8?B?bHQ0bHJUT2s2czRrQ25Fc05BWUhhYXBVd0N6bUhPamlFOUxleDEvLzE0RnVD?=
 =?utf-8?B?WnlsM3ByT1NuZEVYbHc5bm1EcTUrTVJ3MEJwYk1VVGUrcWo4cXVFZ0p4NnRl?=
 =?utf-8?B?MFlDeXRlOFVoMFBuVGpJMGpPUWxGUTJCK2JVQ2NHUHh4OHBYVWI2TXRpZVpa?=
 =?utf-8?B?ekJJcUhCUXY1RG9BcE1rY1F4eWdWdVIyaEMzUFEwRzE3eUwrV2xtVUZwTURP?=
 =?utf-8?B?VmdFQWJQOVNuQ3B5QjU1aEpTSndOT3FTaHlnbHBpa1RZc0YrWXFnZz09?=
X-Exchange-RoutingPolicyChecked: 
	TYRDeiPImUtlhGlm4c2LzPiqoNPRRPk43EfkExGAX3Cd4qqG8kzZGvoMShNL8mKC3YzZLzIHLjudZD/ewyGKT7QWwBfYeORdxZLo0nVHbLWI1LtVI4DYKmClS4BbhUJF31yv53WXs1dJzg/3faXX/vfdxes3algERnh5NkMXqAayBSz5t6o8qL1IeEk0BmmPod1PYkH1jPM2vJmDf34e4/ZwL+qS75am9btnNxMMX1lbiMT82gOWfkQAayFWTQNKPlZdkRG9iY1x9NA6sORx+aLfUHokuADxgHkeYVcjOKPo8uYmQUQaM1yrnxuJkQFeE3dUM/qtcpcJCCBxLwBW7w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da35b863-31db-4369-2b46-08dea0ea0f20
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 03:40:27.2741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhz/O/CaPUj4zwU2uw1ejeQe9nN5TSRT3rXTUm5KLy2BDmFitLZZbdlxfnooGVTBoQoj3U4tZSSDbm/Vn6V+Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7367
X-Proofpoint-GUID: fmXra0hX_8bpwl4-QDVt_RSbvlHQz7iL
X-Proofpoint-ORIG-GUID: fmXra0hX_8bpwl4-QDVt_RSbvlHQz7iL
X-Authority-Analysis: v=2.4 cv=EY74hvmC c=1 sm=1 tr=0 ts=69e994af cx=c_pps
 a=nvwb1BjkeYK3HDx+lqLWkw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=x1D5sdFhi9I1PhIp_mAA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDAzMSBTYWx0ZWRfX1QoNDNSZsk2o
 xD4bb2NWe6DwBv1JCGEbmykZOOlqDXTM1+Ko58XqW1gXWv0uHCMF4NsBbK3I08qYu4E05N+WQcn
 iU1oyS1V4ZtUdCErTak9M2F9L5CstlR5DJdythbBcn/BEmHweZVvAhMVt3miu2S5BStPwVyTpcA
 EFVZPaa4iEu+Qy3CVQIPlly1c76pG/wRtGBNeIifWjXg75sQmUPsNXTsoQNUDT8x6BKtpwaBa1w
 a8OSza8/aE0mOciHREbQ9Qs6el/rpIGNqx57Gee0GDSU0msQn8Myp7eMyzVsEa4k41u6N/96jfu
 7k/XHbFJDrMfH6uVweZeIKotqagtJE7mG/UUstqoZ+plivaIIVNbezlRdhbmEoDVUiKfL4bNbTL
 kc1UHcCN33+Ec5AeSRkst77GS6xQb9h5sQdUVB2laGyslYFgFSpcwnayR9/tiN3DdEhvQUgewxq
 qGRcGYMziY+hGrqwOQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230031
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 03:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126568

Hi Wenlin,

On 4/23/26 11:17, wenlin.kang@windriver.com via lists.openembedded.org 
wrote:
> From: Wenlin Kang <wenlin.kang@windriver.com>
>
> libpam and systemd require the settings below:
>    INIT_MANAGER = "systemd"
>    DISTRO_FEATURES:append = " pam systemd usrmerge"
>
> So remove hardcoded libpam and systemd dependencies from DEPENDS.
> Add conditional logic to include these dependencies only when
> the corresponding DISTRO_FEATURES are enabled.
>
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> ---
>   .../xfce4-screensaver/xfce4-screensaver_4.20.2.bb         | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
> index b95bfc170c..191c49b216 100644
> --- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
> +++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
> @@ -10,7 +10,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>   XFCE_COMPRESS_TYPE = "xz"
>   XFCEBASEBUILDCLASS = "meson"
>   
> -DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf libwnck3 libpam systemd"
> +DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf libwnck3"
> +
> +EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '-Dauthentication-scheme=none', d)}"
> +DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> +
> +EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', '-Dsession-manager=none', d)}"
> +DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"

I think it would be better to use PACKAGECONFIG.


//Yi

>   
>   inherit xfce-app
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126567): https://lists.openembedded.org/g/openembedded-devel/message/126567
> Mute This Topic: https://lists.openembedded.org/mt/118966722/7283133
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yi.zhao@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

