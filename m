Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.80])
 by mx.groups.io with SMTP id smtpd.web11.36398.1615212512514827386
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jx7JAjBf;
 spf=pass (domain: windriver.com, ip: 40.107.236.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeMorZO4NmDDLqS3Jt/+bi0AvuenSPFYeY15QiVc5eDg3bi8D8YDvzYGJ9mQua+/yiAbIb/XLYeMD6If6nMzyVmez65VCBvFsQrx5bgjeq7quiKzIX3n4TCezyAImEzzSLnaaFEJxPBB/FQ8wIWT3TKsAVx4lv1bozldxU0oWFdpavYjawSNWgeDgK9pEfDGoO+v002eRyqDAeCW2v5nWYwQyZZkppGWdsdFiAmC40Uof55sZUNp5Zbu2AcvfpiX4EPjqH7OT39kAu0KGY9xycmQPemRqqYozdQqlYw5BCBIGLu8pAbmthbb+a90ou3QGtzlegdMtCgf0MTgJDlTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTIkeJ1rGbZPKG1JcDBqK5kBz8u1OnXai8LQYB36O5Q=;
 b=O6KxW1W+CNsdjLTMJomtmrpAR5eZ1QxWYLRmhE5axRsMXJFJ+2KGS8EaK33RF+ccXtDD0EEQX7ZXAExegvCBN1Y/jwAI4mXN5lqbDGR33Tku5yrJWd6kFg4AqzF6RLst8LzELVR8cLanSKUTe3Bo7E/eRb9wINAAkvUj3/fxfwwUxWBQHrS9bKrQ9QBF0PsSwgvTe4VOaAPYl9dG61rqml3ieymyq0bGWpG9Pr4JmkL2GimJeY5JmAvE3qdIw21w4aDscofFUZRq/5ObDJYT8onhoEdESaDP/sprMRVMj1YjvIMNfihlpjcrOktrn3RA7CtHMaw1eOqEE22ZXG56hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTIkeJ1rGbZPKG1JcDBqK5kBz8u1OnXai8LQYB36O5Q=;
 b=jx7JAjBfyHxWf2q/B20f4Gr4Abdrqrl+ONg/6lAJy5/tOnlNS4Ur/EA9MOdOvzjxm8jxAVgZoiqj126xqz30pkv8WOeJZVr/8wspVp91tnDX/yVCZyPuYb6F9LMsaJCCavLDywLN6cmdgCm2+W2E/pIRSZGcaWsaQ9wk4CNlTP0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3446.namprd11.prod.outlook.com (2603:10b6:a03:1a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 8 Mar
 2021 14:08:30 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:08:30 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] packagegroup-meta-python: Add python3-semantic-version
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20210302111640.18581-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4dfbe6d6-14c0-ac4d-02fc-4b27505ff998@windriver.com>
Date: Mon, 8 Mar 2021 09:08:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210302111640.18581-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR02CA0144.namprd02.prod.outlook.com
 (2603:10b6:208:35::49) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR02CA0144.namprd02.prod.outlook.com (2603:10b6:208:35::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:08:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5104fe08-8f3e-4563-8be9-08d8e23ba703
X-MS-TrafficTypeDiagnostic: BYAPR11MB3446:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB344624A774B6D20DD07766BE9F939@BYAPR11MB3446.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7r+f7oXfAJ5jzeVSxbbf+56+namih0q2Jnbs1XdRVVZW1oUVYSGrfw+hVe3TKaOWMEtO3xXHy21XqxV/sausa6arihLwgiDXXdjI7KaeAA7em0cbgrR+kh7vAR1tbXWJLIZcgJbHYooqlPk5AjXhyRAVPtjQmGeMpbm7SA10xJ0828FRUHZafS4ubO26qYXcnmRoywEakFLV5EkxmuhqQDF5fGi0MjiINnK6G4mv71f23Mh1/RRKyBWtDyYmiTe+hALT6KxbJ2uoFKuN+cpTqQyAklIh/DGjqJECOqtUGD7/7dBFfdXN6qU25VRqgl/OyMz7Dh8oFl6ggs4lzuMUcJ8uSle4/iIl/gEKc65vBIWQDL441BRnCvDKZuyD82MvKuXzd3HheVhy+FbMeCZL6vZYiQ2n7GEYih1DOCW2gdQrldqbxgctQQy/PCmv0YMZH86cq+mnZjG0Q3jD0ZFaoIg9CYRCCPS443JxUa0fPkpJDdAE/rp2uFl2QWzHr4D/hzt5+WTqFceK+OH4kX5za041UoX0F3P13IqqkxCvs69bES+9Yz60hmfNp650QCrq/rZo0pb+RWPYwh/79jJLRfRJiZ4EE+O6+6DbLreGtEkpXK09t7PHXi2b8N3/Rhlqvx/sp/CL/oQS/VmM+HHiNKyIDkfHrvwAJbc7OQFM++smKdsky7S37sT5bDD+fyob
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39850400004)(396003)(376002)(53546011)(478600001)(4326008)(26005)(6486002)(31686004)(31696002)(166002)(2906002)(66476007)(966005)(5660300002)(316002)(66946007)(86362001)(8936002)(44832011)(83380400001)(16576012)(8676002)(956004)(186003)(2616005)(33964004)(36756003)(66556008)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NVBHWU5MWWgxTzFvUjBNOEEzSDdZUG5nYmZMb0JWVTlZa1NFaXdGV1BCeHUx?=
 =?utf-8?B?NlpCSTlUa3pCRUhlUWN3WHZBVXNSSWppQTB6YlpjWUk1clFFOG5rb1ljUXh4?=
 =?utf-8?B?UlhGZ29BWVltOUpKUVJGR2s3YzdxVUdBMU9KdnlLVDh6ckRaZThlZUdyTXBW?=
 =?utf-8?B?WE4yK2FzbUt2cVI1MmtTb0txdjE2QXN4a0g5Q1F4bXkrWG9hMGNLR0pDa2Er?=
 =?utf-8?B?QXo0eGxneEpmZkw3L1FYcGNOWXNFZUlHMDdDVUtUVXdQTmZ3WEI4dyt0Y2Yr?=
 =?utf-8?B?bFMxMXNtbTEycW13WVRTdnJGVTBVMldjNGpJV05YZFhQUDQzcjZIVEp2SVFD?=
 =?utf-8?B?QVprK042M2tubWI1NlpXK0tnRXdGRHpSK0NWcUxEL3RxOFRibmErN1I3ZmNi?=
 =?utf-8?B?R1c1Y2lwZHRkLzdrM0hwY1BvMVNKSnZtcWdFWWVQZnp6RjMwYkU4azdNTGZW?=
 =?utf-8?B?R2VMSno2aEFDcGhoWE04QXV0MTVTT0dlU20vNnRSZUxJd2RuTUtQeG1jVUdL?=
 =?utf-8?B?TDRhMVMzUHJRakN0UHp3NzV6Q2x4RGhzY1A1V3JrMmRaSWtzb1FLSVpJazZZ?=
 =?utf-8?B?djJVQ2NuUUJrbUVGZUg4NXdycEJ2amRPU3dDYm8rVXN5MS83M1p4anBRRlJ5?=
 =?utf-8?B?akhScENxSUtNWXdiK0o2dk8xbXc1K1UvYlk4Y2s5TjF5TmZ6eW1UWGVBRHY0?=
 =?utf-8?B?T2FsUjFKak1ZQlFkSTNOWEZ2QUlYK3ZIZGphN1pMbTNtaHB5b2Jnb29MUDh0?=
 =?utf-8?B?ZVQ4emc0Ry9MeXZqTEtGeEZmRDQ4RkkrNEVuTmhUTnN3cXR0TWI5akZZWDNL?=
 =?utf-8?B?Tk8zZDdTOFNwOVU2SkN6MnFuWFdZUEwxU3pRS3paOThxVWs1TlRQYm5IdGdP?=
 =?utf-8?B?NmZTbEFMdjljd1pESHFGUm1QS2p5ei9vUEMrc0h5clZSclhCUlA4ZmV6d1Ax?=
 =?utf-8?B?ZE1RQVMwQUhxVnU1Nzk5QmU2RGtCL2Fmc1VhSi9GTit6YVN0UjAwWFRRcXkv?=
 =?utf-8?B?dytzWE1LbUFXUG82MEFVdFg0Vm1BTXhaQnY1Ukh5VnJCTGs5OHo3RnlHV1Vw?=
 =?utf-8?B?M25CYVNKSElaWEM3TWJtWGduWW94SkgvVTMycjlyamdaTndoMVc0R0JGUXgr?=
 =?utf-8?B?aVk2aGV1M3VxWjdpV1NENDFyU0NMcU5Ocy94Q2w1N0pKNUh2SkpwUmt0YXpv?=
 =?utf-8?B?dTJsZ202UVhjV25vczgvdkszL1NiSXNFeDBJZHN1Zm5UdXRaYWtoZXVqRVk1?=
 =?utf-8?B?d2VjUW5JdUVJWjRoV00zSXZTbEhuMW5Pazd6Tk9YbUJCeERET3l2aXIrUWZJ?=
 =?utf-8?B?SStIaC9DKzgyVmVzZm1oRjRYUjJZNDNtbm9NR1NoQmtTbnIzazFYSDAvY0pS?=
 =?utf-8?B?b1hEVWw2Q01qOFlaYlg0ajgrcFN6T2pNWXY0TEhvQmVSME5vMTBIUjdxN1dU?=
 =?utf-8?B?bHROMnlGQlViaENWU2h3a1h3VEZaNUNYME9vU1MyRlNVbDR2MWoyeWNLb2lN?=
 =?utf-8?B?R3E4MHRTZ1g4dVpUNnA2cVdjNVpFNE5wSkZOSTJhRTlsS3RzSnF1T1ZVZDM2?=
 =?utf-8?B?cDZlSng0THltYW9wcEVyMXdOYmM3NlVrSjYzV3FESWZ5SFFnd3haNnpRdW5I?=
 =?utf-8?B?Q3F2aGxkdjE2aVJUZUVYV3dUWSs5ZUk4TEh5MlpGWDZwc3dDNFN0cFlSV0x3?=
 =?utf-8?B?MW1wN05saXdHalBHVDh0RG42R244MUlncTRzRjdWVWxGdUFlWFd4MWJEWEJP?=
 =?utf-8?Q?jtL262Okc5a++izysVS+rJVabBU48WqAVCsFhAX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5104fe08-8f3e-4563-8be9-08d8e23ba703
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:08:30.7659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LnOAXLNjTVbFtwta7aYmXPNsecNzoAFwqB3LKSk97kZbKAGkskOvIcyDzR/JL7GI/plRY+AjfSVV8JpgZJzKbcm8O9tu2h4I/9OUg6DuMAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3446
Content-Type: multipart/alternative;
 boundary="------------15E019EBE37570EE72EBDBCE"
Content-Language: en-US

--------------15E019EBE37570EE72EBDBCE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-02 6:16 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> From: Khem Raj <raj.khem@gmail.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 635dee1942..d22656eb15 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -361,6 +361,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-scrypt \
>       python3-sdnotify \
>       python3-semver \
> +    python3-semantic-version \
>       python3-send2trash \
>       python3-sentry-sdk \
>       python3-serpent \
> --
> 2.17.1
>
>
> 
>

--------------15E019EBE37570EE72EBDBCE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-02 6:16 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210302111640.18581-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210302111640.18581-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 635dee1942..d22656eb15 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -361,6 +361,7 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
     python3-scrypt \
     python3-sdnotify \
     python3-semver \
+    python3-semantic-version \
     python3-send2trash \
     python3-sentry-sdk \
     python3-serpent \
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------15E019EBE37570EE72EBDBCE--
