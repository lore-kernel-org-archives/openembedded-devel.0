Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.71])
 by mx.groups.io with SMTP id smtpd.web10.4781.1615672514885024274
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 13:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=b4/jMgRW;
 spf=pass (domain: windriver.com, ip: 40.107.223.71, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czACwZxYpZQViT50TpuPFP1ML9joA3jmkxipV0IBIMBZG8DypnSd6k1N82sA/VKFsdlwfx2jFIqH5D5albB8j0ClYs3GPZl34jt1eCSrr0C+p+sdr7AQ6xuC9gsXNhY8BbomL/MAoWHgmG5maxVPlg204qp48SOPa+0UxeCb2SLI8CiPda2F4qWC1BM7s5I/jgY1LZhBjvjKd+7COUrHG0jezYUWJQM3yPyj3tZr1b4inl05ONWCWFPFvdF91jnkUai5LcFFtR+H7DJLacc3bdFXWE/dpo+Jl7nDbOaXpBzgtv+e8fIbsiL4EbQAnIOY8KhhJQ/PeVfOgroKqudY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InSy4c1VhMuQ13DjoXq1iKycEojFfWXBHboomU5jc3E=;
 b=dqF9lT6Szxmc49PJJHlzeZ1wXltzFglBc27pfPiPAd8fynsNEHEJ5TO6bPXJJj6K53yn7xHOSGprd4VnVz/9VG1+RNiHM2pN4WVDjk6vjsVMLsTxZNl72CHuj8JPAeN5M+SP4Q9r15XabSqAXknTcDCB1SormJCmEU3RGpqRxAVEYkKklv4ir6lyyLlbqYXMf6x3QTsJXwkxRyP9+vyasbNBX1A8iLoofvuDPAkiZOgz5ooWx1aH+oZgqEuq2fRIWLbT+4CgqwmGO6V/sn3uPncJd9cj3RwGOmhYVORo9Fj8C7bR01fAiDpByJLs54mQNyFnnmdlP98W8iKNiH9Buw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InSy4c1VhMuQ13DjoXq1iKycEojFfWXBHboomU5jc3E=;
 b=b4/jMgRWvUd6j2mQxCdGMJ+u851Zrq0QjuCTiUrN4wJVEpQMlYY1H4OBc/JCGgU0f5m21OHLhlIXTNS29ql4e9ljdduDYpJUIyfsDUZobY/LijGbIRe19zuqDzRsdseofUyDhsApFkdLZQpzlaYl8WHPd3gWJbR5342F1iheDOw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3707.namprd11.prod.outlook.com (2603:10b6:5:144::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sat, 13 Mar
 2021 21:55:12 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3912.031; Sat, 13 Mar 2021
 21:55:12 +0000
Subject: Re: [oe] [PATCH 2/2] xterm: upgrade 362 -> 366
To: openembedded-devel@lists.openembedded.org
References: <20210313213415.396489-1-Randy.MacLeod@windriver.com>
 <166C0478E3069EA0.31886@lists.openembedded.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <627f550c-32a8-96ef-59d3-0826d31d8c0d@windriver.com>
Date: Sat, 13 Mar 2021 16:55:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <166C0478E3069EA0.31886@lists.openembedded.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR11CA0061.namprd11.prod.outlook.com
 (2603:10b6:a03:80::38) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR11CA0061.namprd11.prod.outlook.com (2603:10b6:a03:80::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sat, 13 Mar 2021 21:55:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a8dbc43-d72f-454b-825a-08d8e66aad2d
X-MS-TrafficTypeDiagnostic: DM6PR11MB3707:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB37078F4F80CF77E96F88F2AEF86E9@DM6PR11MB3707.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y3P44MlZwOjcGF5nB+VSHTIJxaaTOGPiZ1m493mBN28ewxndvLleJlsyiBpfHoL0ys0tJO8hvl2qcBDXzWBMbyY7bci5hsfJgPbZtTdg9kHuFlHVyhr6AilQyFowl2fNzYvhM8kG7j5UTkAWEwiTaz5eCNsxMsu21JjIgE9fvRdJap87iE0tBf7lVjzEFNHVcnE5BzjoYXY6CQ+WevzoyqLKYb+cyUNOwYvUNBEsLSTsdaArJ/bHH+JlrD084M7GFWUPQLpZrOjp3n6Xv8C3/wZ0Gil2b2wx11kyemxybjvRGNGTftiica18b6eN1flqljhVAbrvyZPJWR/hEpiWDds2oDBsuiD/HCKhz/GSnoTT+IksgYEYtqbRyrWk843iKu+e7nD+LxlW7iYK887XqVmVH3CPRbnABw49ZV0OPK0W427khjTzcfS5KxIiV1Lfajv7odeBN3kA74IrgMi8/vAWUt1PTbERtUPUFu2c5c7wO0RMPSijET/++FsdESsfQMqp3crQYPB94kVpBGRsbHpDnRK+f/FPJ3vtdq4QRRu7xCW0n0xYOyfcKIk4PbvTQDONlvcy5UqRiQ1eJUEJzhYSe52goWQpI27gByufQZnYvc0HiuKllgktHWTlxoOKII1qYmCaPLtEyDgVkN5yXg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39830400003)(376002)(136003)(396003)(31696002)(8676002)(86362001)(956004)(2616005)(16576012)(186003)(2906002)(26005)(8936002)(31686004)(16526019)(52116002)(6916009)(66556008)(66476007)(36756003)(83380400001)(66946007)(478600001)(4744005)(6486002)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eFdVekhvcjJ6NnlTK3RQMG4yMDFzcjI4c2E5OHdOY2hIamptSmlxcmxDL2JZ?=
 =?utf-8?B?bGx4bkczbzBxUWVxUnZXNUh1SGRVdFlVcXBQNTdZMGZOd1Y3Rkc0d0Y3Q1VQ?=
 =?utf-8?B?MlF3emJQTllSeWlQTk5YaVQzR1hFdWFydnp3OFZBMUQwYm1kUitIMmZVVnQv?=
 =?utf-8?B?dk1WY3VKZXM3NjRXc2VrbUc2L3BESkFYaGJBMWxYWkN3KzA1dHJleHVvMDhE?=
 =?utf-8?B?bk80WVdxcnl2M3pCeUpVdkdvMnZ6SjdvZFBHL010N3RrRnYzYkp1cGVUTFNT?=
 =?utf-8?B?OGtxZ0p6TkFpNk1EMVFJcVIyQ3RrL01RSmNpUS8za2J0ZGVDYllxWlE4VFF3?=
 =?utf-8?B?ays1eW4yQklHZkNwcUF6ZGtFK092cW5iS1pNZEsvclA3MUlYbDd3Y1QyTjRv?=
 =?utf-8?B?Y0I1QnlPWWN6NkdQQmkzbkpBd0hRMVVkSVIwQjJuS1RaNTc4VGdlQ0NGVXhi?=
 =?utf-8?B?U2tvMGpvSDlrN2pBOUhkT2RYSkVpUHd5QW5JV1F1aGJ5akZrM1R5RGxWR3pJ?=
 =?utf-8?B?bHVxeHYxWE1Nb3hEblpxcjM0OTdONUM5TVFhY2tNSGpSVmRIMGR0UVVKNndz?=
 =?utf-8?B?bDZIZHFrb1hwK0dubHR4c3VQT0RDSG9IK1FkSmlPUC9ZbTEvQkpUNUtRSUd0?=
 =?utf-8?B?Q3d0MGx5M1JnZk5xRUtvT2tKZlQvdk5WREdtUWEwSUc2K3Q0eUlpQWV4OEk5?=
 =?utf-8?B?VlNqV0wrUm93OGxQRzM4bkJ1eGx6REg3U2Y1NDNnQ1pLc2ZoSm9OVWRJNlVw?=
 =?utf-8?B?T2p6R1A5bVlDckRrTmk1djMzOGd3MElLenJxZ0R4WFRQQW1qQy91czlRSGt2?=
 =?utf-8?B?WkRIMnRXbHFCNStFZ2xJalAxUE9QT0VpN0hoVkVoVmtMNUJnVmhMUXhDM1pI?=
 =?utf-8?B?azE0K25iYVkrYkJzZW1DbGdMUDlyeG1vVzNkYXZBQ29YNklEM2V0amt4MEhv?=
 =?utf-8?B?LzRUU2lBZnIvcktVQUIwVU1IR0pyNXpoY1NxTUhBZkhDZHk2OG90NnEvUURV?=
 =?utf-8?B?MUdSM2NWVWpxcURsNGx3U3JQZnR3R2FXSzFmSGhONEQ3QmpmNkZWTVFBVW4w?=
 =?utf-8?B?QkVHT2FJZnlRcWNrcjVGdkxGaTk4a0tvVGtONmQyTDdPMm5CWkRsajMxTUNK?=
 =?utf-8?B?SHUzaEVhUTdLdE9aSmtBdlJvTHpGMmpWMnUrdFY1ZUl3ZXNzR2F4ejFEckhZ?=
 =?utf-8?B?ZUZUbmRtUWJhbU91aFJSZ3QxQmVFNlAzNTZHSzVCRGpIN2ZFVU1yS3dXZVpl?=
 =?utf-8?B?c3U2YVFQUTl0ekdZZkNXSkhFZEgyTGFHQU53MFJ5dDMwUTQ3ZUxhdlZwZkFt?=
 =?utf-8?B?S21QUWNib2JieDVYRzlsUm1kTllBWno3Z3IzZlNIbEkzSm10dVNrMHNOa1hk?=
 =?utf-8?B?Ty8xbERZdUUvZ2tHSmUxWWpkVkdTV2dDenFKTmNFZE5VRmxJYjdiQ2tsOWNq?=
 =?utf-8?B?Ry9DdW1wdE44eCs5NGJkMlZTTEg3NWU1NHlBbHg0MGNpRStuQUszd1UxSno3?=
 =?utf-8?B?YjJLOG5FZ1VCWHZhZFhDK3JvY3JFa0pmVjE5aS9mdWN4aTd3SXp4ZDlBMUE0?=
 =?utf-8?B?STBBN0hpeHdPNUFUTnNTdnA2cUVHM1p6TTR0Wkl4VTA5R2I1UE4rTjQyNm1H?=
 =?utf-8?B?SXdreTRtbGtNRjdNcE9YUVlPYkdkanc2VWxHMFFrQnFIUEl1Qzk3azZHc3Zj?=
 =?utf-8?B?RFhzUDRnQ2JnMUwyZnF2T0pTcmNXamp4VUx4VmlEV0JTVnVHVW9CYzM3TFVl?=
 =?utf-8?Q?vb0uPXE+MmVgiPNb+VAeEZFWBawujsk3XKJWOs5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8dbc43-d72f-454b-825a-08d8e66aad2d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 21:55:12.0127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnagcqoUKeJ/ApGEz1jFw06vvL7J1FxvJz4/pGV7t3xqNWQz6zkoAPVefT5JEFAGoeNFJHTDGIXPawhvsoc2wOePLQwiSPLDY6TQgsj07f4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3707
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

BUILDALL-QEMU LOG FOR xterm
START TIME: 2021-03-13_11:26:07
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



root@qemux86-64:~# xterm -h | head
XTerm(366) usage:
     xterm [-options ...] [-e command args]

where options include:
     -/+132                       turn on/off 80/132 column switching
     -C                           intercept console messages
     -Sccn                        slave mode on "ttycc", file descriptor "n"
     -T string                    title name for window
     -/+ah                        turn on/off always highlight
     -/+ai                        turn off/on active icon
root@qemux86-64:~#

-- 
# Randy MacLeod
# Wind River Linux
