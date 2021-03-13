Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.79])
 by mx.groups.io with SMTP id smtpd.web09.4744.1615672447128600147
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 13:54:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZbdkEavQ;
 spf=pass (domain: windriver.com, ip: 40.107.95.79, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnJuJqnRdphFQt/K1/W9YtZ7wH2cveZKn/Wsm/vEQxl2qczYeqplEDw8aSuKW3gTxug95Yb/rf7Gc4Wed7LGm9sxThdRRr9pyaZ4nNsdTTDhRrnvpnFfMUrfIxM9I1GxnbIvWhRAP40Iqug6dzUs08jD0E1/Qj7hxsmD/1zA3zChlIuEwR5nwtmBLRIUBosBuGuOmj9Ix6UmdMUAIGfXdDgny8jCY5TdTiSB00TmtLHdzCPQh7IOabssA23c3WydWSd88Pv/VWLxPm46zT/zt1AJawSDB0PzgWUormtA2aag/CG5Uu3LA7iNoRCwT3tVNbzXCXNTgUC05PkPAnE/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u37lNI5TtzSMFrSdbyJYh9XaaCblGJjQ+f2r1cgFPfU=;
 b=KlkoT2djmWv3QDF4A6c3WgYeNN2TcHY1+FsV6J9rATof0SA2MIz/DDv8TWGXKRV1EEWVtE78KVnSq1SL+1aG9SPhkmyd3Loc4pSzA+yeMfGrXEqdk9KMbW9r3Ueyxl4juUGGmrYIEBnH2AesvA+eU9WyA03GWUyYMbpWWh+jtoNQKDMvEZz4IARwmajDt2X22zDsf//SEgIRBzlJTHMPwSuk5eilc3sbWfUN3tl90O/N/K73WXdanaX/ECmnwszixemJnBYYKgzHhw1tpLCp/BMkAoEBAAyo7vda821VtTd1qRvKTVdzfcZdpt43OfcVk8s6bJlAhyQbCzZVGMNMiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u37lNI5TtzSMFrSdbyJYh9XaaCblGJjQ+f2r1cgFPfU=;
 b=ZbdkEavQLHrL71OP5QSXYCT56LEtRzsad3Az0/f/ZKoqyq3TlkdZMBFV3hxRrLM02AhJf8JdbwrHm9T/PSAiZAENLwhorZBWaGhn4tIP+8tgejPS9Lj/447Ml6Vqb5800DAK3CBIMTqPqfIXty8oWtBeA6qPTt6BC+jf9oSegwk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sat, 13 Mar
 2021 21:54:05 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3912.031; Sat, 13 Mar 2021
 21:54:05 +0000
Subject: Re: [oe] [PATCH 1/2] zstd: upgrade 1.4.8 -> 1.4.9
To: openembedded-devel@lists.openembedded.org
References: <166C0478A3A27B5D.5415@lists.openembedded.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <28148bc7-d6e5-9cd9-8875-f01698c65d70@windriver.com>
Date: Sat, 13 Mar 2021 16:54:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <166C0478A3A27B5D.5415@lists.openembedded.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR11CA0072.namprd11.prod.outlook.com
 (2603:10b6:a03:80::49) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR11CA0072.namprd11.prod.outlook.com (2603:10b6:a03:80::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sat, 13 Mar 2021 21:54:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6222c408-561c-40bb-8ccf-08d8e66a8531
X-MS-TrafficTypeDiagnostic: DM6PR11MB4580:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4580E82F5CFA7A7A70EFA188F86E9@DM6PR11MB4580.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LFcbR7ieUoAujVPOt7fnXqY4sMfI9JTBxgBTyQrVEeYTnoo38LG1XMirry5GYInM+sCeCLULjrKtcxnpBjj+XPOiM9uL3Eip0N0/q5aG6Fj+s4Sj0cid/tF+MMCiLg+9XNIJKbNXXCJPrMUR3U9hNN92APFvFgQN5jW6aHOEwtYvZBq1oJdTKvQeOaGlkWrQF8Ov/Fa4GFu0LLQAGYu55ZyOfaMr9spfWnQzU3fKhX6iDM8qDwVB667aBn3Fitl8NyKpUInWVBKFs3rGaR/Zz0J+AlhUyQBAExEQPpLRqy2T9x8TWEjzIqhE4d5tGfJmV0aKEWWE8SxHQZ/aBx9cxmqjMeN/UdUkhAUdg7Ljs8F5wObz0/e1n08VnB2PI3wviO9T2N9ZS2xwqSQPOz73CZd+WP8b3QrARylIi4kKLuifZd8ufmu337MEPNu2Rt4drKJ3yo2gpqZ41fmqF0n+ODbXKz8qSttRCYrlvO+pni0mtjcL35GKc52CziRAWkqNsoPKKsT1anowdd0G0rL/w+2Wc9Dw2Hy10C6rWI3lhmMquRNLK3K4k4Cs7pHlPJdvYTrtug4OmxfOrodGUEZwbPIj224r6AJHqOZiTwnEg0H8hpWSNMod19g+ycG/YDjxb7hm4FFE2IGpKYY08mel/w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39840400004)(366004)(478600001)(2906002)(186003)(5660300002)(66476007)(36756003)(86362001)(6916009)(16576012)(16526019)(26005)(6666004)(8936002)(316002)(66556008)(956004)(66946007)(8676002)(2616005)(83380400001)(52116002)(31696002)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eXRxRnB4QXVKUlYvcnJpZzZGUElFb0tScmRYbnVtOFVuVG1BdEFFZVFualRV?=
 =?utf-8?B?MG83ckx6aXd4L3pjNW84UnZqQy9lSDgzZXU3TXV1cngxeGVDOUI0YkRUSko4?=
 =?utf-8?B?aWlPa2Vobit3aWYrcnRiQlFiSkg4MXBqTk90Y1RydVR5RFplUnBjSDZ2MHNJ?=
 =?utf-8?B?UDhSU2FYV2RVZlNDWFh6bWdFQytsMkJjKzBTQUFpUUN3WXJ4VGVuRWt3Wnd5?=
 =?utf-8?B?MGNGSERPWm9oZzg0QWM3Zk1oVTFXdXgraDNIWWtEU0NuVk0yWlNIV3BUMG9M?=
 =?utf-8?B?dWtUVjBFN2wyMkpMcGZ3NmFHZGhqd3U1WXZHTk8zSFUwQlVmSlhoYnd4UmNm?=
 =?utf-8?B?bTVxeW1hNU5aWDA3RUtlZ3VhbzJIN2xvVk54amdCVEZmSWdZWXY4ajVheXRy?=
 =?utf-8?B?SXd5TUF6YjlFRUFVNzhVaFlSYnVzaUFCcmozZmpYQUJFVk93SklQMXhadC9s?=
 =?utf-8?B?R0s2SUhqUytSR0dTS3ora0o3Yys0cjVMSTh3cmRFOXBiOU9zQVlVM3pDNmtR?=
 =?utf-8?B?UWJhRHhHbk9Sa2pVdE0wTE05ZGlmV1JLelJ2aWRCWjB5UzhvdG0xRUtLd0VR?=
 =?utf-8?B?QzM3MjBlRFdHQ0VNQlFkaFcrUVNwWDFLNnpmV2x6WDdFcjF6THRHWURGY0NG?=
 =?utf-8?B?VTFSSzFzSXgwUWZWYjFUVWlCQlg4VjRpdWlSbEpHUVk1WGhoSUJJNC9mREFF?=
 =?utf-8?B?S1Z1OFlKZkFuUFBtWW9TWlBoZTRZb2lDUUNiMzUvb29qUUUxT014S0pmd2Zl?=
 =?utf-8?B?V2hzMHNnSEpwYUxFTFJPVW5nSi9YeXVUQlZCaWtqVEp5RHZWRlFsUkZrKys2?=
 =?utf-8?B?cFJ5UWhmK0NSalg5ZkxJS05iWGpROEd3aWh0Zk5vd0NVWTNZdHpkU2dzUkhh?=
 =?utf-8?B?RklwaW50RXBNRG85UjFkZ2dqYmVFZktaYy90V3ZLdlJHUXBkVFdteFI4Zk1z?=
 =?utf-8?B?VkFmSFpkZXdvVmpnOVg2Um5wYld1ZEhMdDBndTc5d01CQ2xOelAxeUFoVGc5?=
 =?utf-8?B?TFczYjNTelVMdUJ3bGNEQy92V1J4R0RnZmFna0wwdEFkbUtOalNMU1NTMDZn?=
 =?utf-8?B?aVNFUUF3ZXIreS9CSjMwZ2R1WG1WT1pOMjFCK20zOVpJdjJEQzBTUkJHMVNP?=
 =?utf-8?B?Y1RQdlBGcFRWNHlzRkQ3d3k4ZTdwMjRQb0ZadHJMdWs1Q1VBYWszM2ZrWHRm?=
 =?utf-8?B?TnQ1dXhuMXZDd2JDNFZtN2tSaXNPK0N2TEpBbHZkYm5nOVV1d1hhcEJXSVBh?=
 =?utf-8?B?VlFwK041VzV0ZGJ6NlhNWm1GWjAxZnVCOEFpbGdtN0VvbWVBMENnTjJ3ektz?=
 =?utf-8?B?YXZXd2s4aVphb0dUWXJYNW5jUUpCMms2Z3hwUjdKMmdJMXgyZ0E5RlpiM3VH?=
 =?utf-8?B?USsrMTRXNkRvNFp3UndpT1hlQnhMMmk3aTdqZElNWklURVM4dkxNTFlJQnJz?=
 =?utf-8?B?N1lIZ0FiaThZVmNnZytOaFBWTzhVM2U0UENyeUVyNVQ0NlVaZW53VjhyeXcv?=
 =?utf-8?B?QjJaTGFFdmYzOHdFVmtMNTk1bWZscmVkN2UyZVBMVG9zeXRWelV6SWZYR1FD?=
 =?utf-8?B?bFkrWlNLcklNV0R2ak9OY21BMXpwWlBxNTF3UEhGRTVHbmc3RCt5UGdLaGhp?=
 =?utf-8?B?SEwxdzZUQWRtUThsalJXWmVVYmNCUGdqbUxrUE0rMFlVYy9WQnVBYzdSNHdP?=
 =?utf-8?B?U1JJNjJQajMxYmZVckNYVlFaVGpMV3k5T1M5M3RHL2pjaDREbENqcDAxZUZK?=
 =?utf-8?Q?4x78RUlhiBsS8fZ/IY8AJgc+rg54a62eJJS75pK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6222c408-561c-40bb-8ccf-08d8e66a8531
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 21:54:04.9473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdzgAxo1fp9r8esnVaXDrohb7nAhrIRyNO+gmlKXv5G6Kt3rxMhUeAxnGo97pSJXdgap64Ne6ToEP5xnt3xIjB5So3RtOvvjiNPY2GuLT6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

BUILDALL-QEMU LOG FOR zstd
START TIME: 2021-03-13_11:02:32
HOSTNAME: ala-lpggp3
HOST OS: Ubuntu 18.04.3 LTS
HOST KERNEL: 5.4.0-62-generic
===============
BUILD RESULTS:
[glibc]
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
PASS: qemux86
[musl]
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
PASS: qemux86
===============
PASSED: 18
FAILED: 0


root@qemux86-64:~# cp /var/log/messages log.txt

root@qemux86-64:~# zstd log.txt
log.txt              : 22.38%   ( 48512 =>  10858 bytes, log.txt.zst)

root@qemux86-64:~# sha256sum log.txt
919f983c55ee3f2d1b93ed0a4559157eb9d391e37279eaa6d0e113627e60b9f4  log.txt
dbed71f330bcdbfc6e0ef0d98b4416125daad86ff0f32a2d0b464d90a39f9601 
log.txt.zst

root@qemux86-64:~# rm log.txt

root@qemux86-64:~# unzstd log.txt.zst
log.txt.zst          :100.13%   ( 10858 =>  10872 bytes, log.txt.zst.zst)

root@qemux86-64:~# unzstd log.txt.zst
log.txt.zst         : 48512 bytes
root@qemux86-64:~# sha256sum log.txt*
919f983c55ee3f2d1b93ed0a4559157eb9d391e37279eaa6d0e113627e60b9f4  log.txt
dbed71f330bcdbfc6e0ef0d98b4416125daad86ff0f32a2d0b464d90a39f9601 
log.txt.zst

