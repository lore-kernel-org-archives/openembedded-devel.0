Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.64])
 by mx.groups.io with SMTP id smtpd.web12.11738.1615394841795397331
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 08:47:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=flgZngBw;
 spf=pass (domain: windriver.com, ip: 40.107.236.64, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jI16x5jenCmx1GdTK7tpOcUWcqf2RZOZxcqQjc6V7VoGU/rZteSXlo9xWa41VdaLyZQKQAYMH7Qs2O+as5FZEtFP9zTSUHcZkV4WfzyOtBaLKeEWONH1NoLUoFlOmuyc1LtzuWV/obNkSd1bDmR1SWtwicphslOkH7x0qs5J0bxY1SdKQifiOOWHQoQ8E6h84kL3HfOQ576peQL1OnEjjWxbLEZi7+KnTU/FgqqpEuHjRfXyYvrj20neAq8R4zIJfF5bN+OKl/uagWCV7Lnt+4jJXkbXcEp/ad1r7rhakZp9ZDIHcWjklIVqdlFnxjKP345lhXoRHsurGnJNkskHnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJPcc/6hf76O9ffYxutqTw1kUkkugWERWmrQrDEu6tA=;
 b=cWqfWQ7ZZ1t73cQIGs0XiCGajqckTinzwPsKyR7U6ckJAry4h7vx3L8YpArn1xLwGAMzGnfclriI8c7Z9yZY1fmxktEM5l3ERXxxlTfHglLGTJoF2cnRs67GC6xwRt7h/tyjBBwf6MH3SHq+ihQFlknSy6bZgAsqpijxyf8HuVg8GKqs+caMzYistXVp4krHV3vLh87kcNZoEbVZLbd267e1R7b0tUvLqj3m3X2iSNS+8VdmmMU/3lmOyJ3wmSqaM9fqYBKdXxmmVWeUhHc1MytyRF89HZIlSWXZFixaZZTLzR62KATrJZS30mvhQna+MGhUnLED3085bgDjHoDJPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJPcc/6hf76O9ffYxutqTw1kUkkugWERWmrQrDEu6tA=;
 b=flgZngBwJaDTTuzuBdywTZDR6Nzb6PWzk/S2dtKAn1sax3plTl43qJMxuBH1kVeWAKzwved/dnLgfO4gitbT7Bo2VvwFIxaOOqIdlPDQOH41TgN74tjPWooLC5MJ75UGYHg6fvfoOBsebs3usYiC2AtTn5EL8BO3UJI0dRaiXvY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2680.namprd11.prod.outlook.com (2603:10b6:a02:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Wed, 10 Mar
 2021 16:47:19 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3912.029; Wed, 10 Mar 2021
 16:47:19 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-pillow: 8.1.0 -> 8.1.2
To: kai <kai.kang@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20210309035611.23351-1-kai.kang@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ea4c00f8-30a7-c54d-f720-4c7784e8dd5a@windriver.com>
Date: Wed, 10 Mar 2021 11:47:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210309035611.23351-1-kai.kang@windriver.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR1701CA0014.namprd17.prod.outlook.com
 (2603:10b6:405:15::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR1701CA0014.namprd17.prod.outlook.com (2603:10b6:405:15::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26 via Frontend Transport; Wed, 10 Mar 2021 16:47:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b63cc5e8-ba8d-4d90-41f6-08d8e3e42b7a
X-MS-TrafficTypeDiagnostic: BYAPR11MB2680:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2680B51C0B830CE7D12123169F919@BYAPR11MB2680.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BvxSxWMcfCKJMRCYctghvtph48YVYtZf7HE721p3e3wuFioQ4L5sVCKin/+70ajHAFpNOupByDdMGDOUyhiB+bOFpU287w8oxRakyTtU2H00HjBW5WW1PLwTHFpAXdZ8+7S/0ZK3WNvir8/8p7u3mJlQ5MYVBcquXTTP+LZxJbiw21fENjEizEcVKTBtmLcnaeISDrfAYsurrCvFniPhZj1HnBEvmMkIc4uDV5dLe4M9ShZfsJ35NoscHWobi7w6ABXDl5KnBjMZ+Q4XhgNvB8WlvtZMDZz+QZcdNu2g2+2UIoWwKDKsTpRU2rWtqVfKOsFgUXsI/QUgXJa8qrmd98XIwhvyQkKj+5d6Zk7MJ6mmvY7SUzhZms0bu11KELOn9LDa277V1N8AwGxp+19NfNrGQOg5B1DC50Dkf4O1jZZUKqqF2gRA5eLs/nOgkzriQTh8Xs4SbArA6t7SxH2cqsEpEwnRSPzvnj+NqSkz5jpOLsAZ/qSVXup0a4ouXEemPCLpaLYFwUsw6UB/6G1MtXuhlWI7zrCwvHN/xHscTw84nrB/QeGbWX2aYc+Syfk5Q10GPBX0A0W0vyWCFThzVbBtGJDKE70wT2K4myhAUQV79y5lUPE8Dj7xIsljLXiBKLwhNMs28V7KKaRSJgqckZrsQM3dMrFNigGO1k6m4Fh5Pt489FiXSpSFOk+q4Nnc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39850400004)(136003)(66556008)(66476007)(966005)(186003)(5660300002)(2906002)(8676002)(166002)(6486002)(8936002)(66946007)(53546011)(33964004)(316002)(16576012)(86362001)(31696002)(16526019)(31686004)(478600001)(83380400001)(956004)(2616005)(36756003)(26005)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?V3VZM3JVV3JHb0ZZQjZPakR6NElYYStSWnBSYWZ1S0UxN3UvTzlxUzNHL2dK?=
 =?utf-8?B?VDgxNUdkYlBLRVJKWmE3WUUrVDI1T2JhSkkvVzNLcERvMWZVQXRNYThVNzdz?=
 =?utf-8?B?OTJmV0E2VEFJQ1JhVk9BRDdCM0thVnFTVWJRM0JaWUIvdFFQV2VxQVEzU0Nj?=
 =?utf-8?B?MVdHZFlFbVdER2hyV0dtS05SRTMxTFprNlJiZXZjcGQ1NmFpQktSbEJFRnZX?=
 =?utf-8?B?SkRaaU1XU21sOU03SFdHZitwdHBEYitUbFIwK0pLSXpmNHc1VW9lTjJYckQ2?=
 =?utf-8?B?aXpJZW9jTzA0bWQwWjJYenhNNUNoa0hscWRxcG0xN200dW93NWVLVkloLzQz?=
 =?utf-8?B?TElFRjF5cGhJV1VJTGx2aFl3NlA0eUFWS1ZkMEdXcVZ3OFhQV204V0RCTE1V?=
 =?utf-8?B?SlRpTmRTYzFjY3ZFanpJSzNoS0UzWUJmR2hrOEEzSFdjOXNVeGdrNi85SkdI?=
 =?utf-8?B?aTRGdElFSGhEUExoaHFLT1NrNGhtQ3AvSnNCYndQSDNHeEYydkw4ZGhNUXFJ?=
 =?utf-8?B?cEdJOVVhWWlsemNWT1JQWlZwd1dSVmRGdkNLNmFaUzI2Mk1GUHBjTGpQc291?=
 =?utf-8?B?Zjc4NFdRRDV3OTdhYmpTMDhJZEJ4WSt5VmE0aDhXVXBtOUNRby8wcW54Um50?=
 =?utf-8?B?ZEkxUW1tQUZZUXVaNFhCdHdIQ0o4dThUSmM1cVFrd0tRblpoaXJnM1N0MnhH?=
 =?utf-8?B?dHc0aHN1MWR2RkdoSk9QUzhHdGdvWmJVQ2FlNkhWUWdTTHFHZ0JEa3JlNm41?=
 =?utf-8?B?Y1VDV05DOVpDWU5jQUczbGFVUjBSNUYwU2J2UFdTR2pZNDJ3ZDZIZ3d2VFo4?=
 =?utf-8?B?UWlORUNZb0FHYVpQOXdqTVE5OU1HVlp5dlpPdXJyR2tEbGVVUVFraXRrbFdF?=
 =?utf-8?B?RWtSR0J3ZGFyQmJ6elZha1pNbXdlcVhuK0Eya3IzVzJVT1pXb3pIbEp2M1NJ?=
 =?utf-8?B?TFpNakVIMUV0c0RQcGd2dnl4YXNvdGY0dVRGV2FDYnBTUDRRa0lkTlJUU2Rj?=
 =?utf-8?B?Mk5yaGVvQnNYeklCMkZrV0pHMTl4cUkxVG54ZytFUjZ0YW5ZTXh4b1ZOL2Jz?=
 =?utf-8?B?QXl5cXAxakZsb1NHd2pJa0ZXdXRXbDdQY1lGY1hCWk1vSXBwTHdBaTQ1b0Nq?=
 =?utf-8?B?QUJFU3pEbEVsbjV2dlhnOVM0SllUQmNOdDlVWUtFQk01V1N4ZVk2ZHh0TGN4?=
 =?utf-8?B?TnBWcTJZM25CeFNTMTd5YzdndDRNWmQ1eHNVUmt6NlBpZGJrbU83OVF3N1V2?=
 =?utf-8?B?VU1mSTJVT2IyTkRGSk9wcGtoWk00NU5qUzlSVWZMeW00WU02SUVRU2pJQXJS?=
 =?utf-8?B?OWZhTnVxNFliQ01ydnd5ZDJZMm51bXlkM3YrNnVtUkpxYnBqditxVDRwUlVC?=
 =?utf-8?B?MlBac0o1NUtVMG9vRTJGMWN2eUlvREtVa2V2akJSM1dQRWdEL3pJNGlaNmJM?=
 =?utf-8?B?emZPbWtmcVk5Vzh3aUU1bTlrdjh1RG9wVDFQZlVZUWdKTzl6azI0WXRkdzlI?=
 =?utf-8?B?TDg0NnpqVWVoMVBUeHEvOXAzNGRsMU92WWJhZi9RWFg3QmFTNll6cWlXaXdr?=
 =?utf-8?B?SEViMzFSQXdIYVZtQ0s0UEV2bVh6ckJiVVAwVUlaYmI2WUIwb1F1cUs4ZUls?=
 =?utf-8?B?WVVXcCtxZmJEbC83VG50VmtrQjBXbnJFN09XQXY2VWxweThzeUE3aGIzcXR0?=
 =?utf-8?B?VHMzYi81UG5LYkRmR0s4Yzc5ZURiTndLZ091VlAxdVh6TjRVV0NvaDgzWjJn?=
 =?utf-8?Q?VkKkatzcy8AidjkT01dPy2r9wK9RoWEWv0pAb4m?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b63cc5e8-ba8d-4d90-41f6-08d8e3e42b7a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 16:47:19.6894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XO4tKk/TpMSHQsWk/BTDnQr0Wus8dIDwNq4mO8XK91v6Y4oY62OJzyBGiJnLabjpJ8zeMU5obGGlwIM6+Iz4iG45J7HXSPbmhyd1G59U1iE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2680
Content-Type: multipart/alternative;
 boundary="------------765A54A1B332CE88A16EE2FB"
Content-Language: en-US

--------------765A54A1B332CE88A16EE2FB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-08 10:56 p.m., kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> 8.1.2 fixes:
> * CVE-2021-27921
> * CVE-2021-27922
> * CVE-2021-27923
>
> 8.1.1 fixes:
> * CVE-2021-25289
> * CVE-2021-25290
> * CVE-2021-25291
> * CVE-2021-25292
> * CVE-2021-25293
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pillow_8.1.0.bb => python3-pillow_8.1.2.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pillow_8.1.0.bb => python3-pillow_8.1.2.bb} (93%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
> similarity index 93%
> rename from meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
> index 63974590c..a1b4f9059 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
> @@ -9,7 +9,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.1.x \
>              file://0001-support-cross-compiling.patch \
>              file://0001-explicitly-set-compile-options.patch \
>   "
> -SRCREV ?= "fcc42e0d344146ee9d265d1f43c094ce5a0ec4cf"
> +SRCREV ?= "88bd672dafad68b419ea29bef941dfa17f941038"
>   
>   inherit setuptools3
>   
>
> 
>

--------------765A54A1B332CE88A16EE2FB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-08 10:56 p.m., kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210309035611.23351-1-kai.kang@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

8.1.2 fixes:
* CVE-2021-27921
* CVE-2021-27922
* CVE-2021-27923

8.1.1 fixes:
* CVE-2021-25289
* CVE-2021-25290
* CVE-2021-25291
* CVE-2021-25292
* CVE-2021-25293

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210309035611.23351-1-kai.kang@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pillow_8.1.0.bb =&gt; python3-pillow_8.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_8.1.0.bb =&gt; python3-pillow_8.1.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
index 63974590c..a1b4f9059 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
@@ -9,7 +9,7 @@ SRC_URI = &quot;git://github.com/python-pillow/Pillow.git;branch=8.1.x \
            <a class="moz-txt-link-freetext" href="file://0001-support-cross-compiling.patch">file://0001-support-cross-compiling.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-explicitly-set-compile-options.patch">file://0001-explicitly-set-compile-options.patch</a> \
 &quot;
-SRCREV ?= &quot;fcc42e0d344146ee9d265d1f43c094ce5a0ec4cf&quot;
+SRCREV ?= &quot;88bd672dafad68b419ea29bef941dfa17f941038&quot;
 
 inherit setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------765A54A1B332CE88A16EE2FB--
