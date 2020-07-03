Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.58])
 by mx.groups.io with SMTP id smtpd.web11.10723.1593784927841200393
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bFPpDrqC;
 spf=pass (domain: windriver.com, ip: 40.107.237.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZ1IVnGIKM4dUerlt2Y+zPaG3ycHojZG7WOR5Otj4FrfcGGjJLL6s1nG1jkRy+pdnzvfky/vPGSIpIJfNLGxKl2Su2OmwdwL+BKxB1Wmjcq9V7aflQmCb2FxA5u5bPse3x9srQFVe3azeN3dtamb3iWSnJcQAaDOhD6EobQO591+c9C1usUDc26Rl1BmH/aQ15ydT+eW+3sykyzbQMMrQUgHoAkv3I0nvTnjvf3kQSy4vCHLrtE1xRHSmpSo0UF0EKPzDZu1m5CLjtRCecSffy20YBNVFf1jCQWCUA6FQQKWFOlJApF8yVRjr21c0nJwuxydo+VqG3aeQDpYcvSLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyiWdXY9IU428PRwEzvda93p3wiMxmvQgaCDzGDNLJY=;
 b=f93mxJ7gXJpdtY/B1oXLPj45mn9Jiyw0NMs13xsFvcEZhBrRdO3rNmZaTvP0M2UayEzGTHyFh/q9EOKhz8CrHTPQz2DAlc92pU06Cxlp75hOOG/umB5Z0sVOUmggDi2HuDjdjjFWxfHeAI+SZQCjFlFblfRViyQH2b2H/+bXeqjTsKhevAvjm6qa6EXqfk4/nYIen0m16NY5QI2eO2uFzF1bkUILgl6wYKRKsxrbo4ZjnaydCvETPACQEVeB1DITc9FKVAxQRHcdpvE/sEl8jJUacdbfsgoC7o9UvHNGqA5pkMkq7xPDHXr2rrHAZJngAuMsBnP2GBmLb7CDhVmxkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyiWdXY9IU428PRwEzvda93p3wiMxmvQgaCDzGDNLJY=;
 b=bFPpDrqCBuBX9D2fgMBP3VYPE/8nVlp/bFYEvYTdWcmZA8bf3pG/QwxZOfWnljlaThq5qgGD0STgYdIs/WvMFKY4GcE4mJE11oiojPL1b0LZbM8pA5UgqrpjzlEABC3OunG7b3me1yfy87uoqvaNOfy/ZUnxdqFsJzPbyVuf4aA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3627.namprd11.prod.outlook.com (2603:10b6:5:13b::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.23; Fri, 3 Jul 2020 14:02:05 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:02:05 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-tqdm: Upgrade 4.43.0 -> 4.47.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629171853.18608-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <210f3543-80cd-d0bb-204e-9636ed29e8f9@windriver.com>
Date: Fri, 3 Jul 2020 10:02:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629171853.18608-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::13) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Fri, 3 Jul 2020 14:02:04 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07aadd8a-5d5c-450f-3af1-08d81f59aa62
X-MS-TrafficTypeDiagnostic: DM6PR11MB3627:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB362711941A6A116ECCB0EE799F6A0@DM6PR11MB3627.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jz4Qfvw8Fqb/vmkDxItZBZkzANqs2Og6JfApGzz5It9c+0AGOM+Hf4Sydbmd0FWpKMjBhqMV51AlaADcoe16blftVOx8QzFPOYj0q7cTsMGMMLTIL5PtINJNfooaeGLjDG0h0RYoUc3GLTId6Nxr9WCVCF1T0pfm0oyHEEGVDHv8E3g+zaF8W9CgDfbdACPvmMwXRmoCMUyTCakD34i0nwvYVT8R5CO6sSbgNz8k5lN+DUdmoQnbdPtk2xRWrb2+PCKXoIplC/3WmSBTvwlI805dSUzB9wogzFx/D43SUgJWimu1thcWCoc2ZtdSc9VoxKYjSojRMG7RGjOriG+lbSkyCWZs3td9NgDTEeNxEv+WufNywWl5XzX2VqOU8k8G7yb8ON32jOtvsyh7hA7VNwV1oOkIApioAT1M46dD1khjIQqSYVJwJSiV1+Hylt1bDQjHA1z20AGYC/u7A1Vnqg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(39850400004)(376002)(346002)(136003)(33964004)(66556008)(478600001)(966005)(16576012)(316002)(36756003)(8676002)(66476007)(8936002)(53546011)(2906002)(86362001)(52116002)(31686004)(31696002)(166002)(66946007)(83380400001)(16526019)(5660300002)(26005)(186003)(44832011)(6486002)(2616005)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	RiVK3kRUsChVLMWYyv929PmaX/yfKcTdsdTYDmU3Y6ZL/lI1glZ4nr5kAX43LiX2o8Fa3y5s1r2Lsu+xXB4h20Vpu8w6guakICYZqISJCVw2s921OsvURnL0ciXK6jUIC53L5OXLGlY63PnIcHwZY8PP0QRemtH2z887vWOfJGhq8u3CAKgfkalKDqrk2cNyruAc3umMEYrwS1xHUrdNUeot8jY7qkNI3KvO9CQDr/Qiu7YH9r0ewB9VPfumW5uUab/Ntj/ZBx0ajNmTrQICBAxn5KMkR/nIQm1Ki0iR+5ElOyjso8vn4X+bF6xR7NEpO8es7KPQlRzcUC+btc5K3XmOAjOgupUohEcP1B7gRda0yy8HIHuzqStFdSHRRCcbPoZbO9KNfCqLaiYyRK4O5YShI4Oobgtcq6W0YUqIosf0J4REjmGpZnF5vgtrAYOEwq6Dgv4JEX8J/eBO8wcD10qpYVtCCCcCaq84jh6ssSE=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07aadd8a-5d5c-450f-3af1-08d81f59aa62
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:02:05.2405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YT+MlfvAWO9zN6bOslbZd3lHva8aNNxhFUnjjO0fnL5ha2ldbGMip3/HueQXxmAODdXBKiXPmh+NqxFAiCfpsuFewBqTBFRfcRRixIAGqLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3627
Content-Type: multipart/alternative;
 boundary="------------4BBCBD5DEDCD7F8D18C9273C"
Content-Language: en-US

--------------4BBCBD5DEDCD7F8D18C9273C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 1:18 PM, Leon Anavi wrote:
> Upgrade to release 4.47.0:
>
> - add contrib.discord (similar to contrib.telegram)
> - add contrib.bells to auto-enable all extras
> - add contrib.utils_worker for common slow tasks (e.g. web I/O)
> - fix slow notebook imports
> - fix gui TypeError on unknown len()
> - misc documentation/error message updates
> - misc framework updates
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-tqdm_4.43.0.bb => python3-tqdm_4.47.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-tqdm_4.43.0.bb => python3-tqdm_4.47.0.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.43.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-tqdm_4.43.0.bb
> rename to meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb
> index 642246c00..fad758e3f 100644
> --- a/meta-python/recipes-devtools/python/python3-tqdm_4.43.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb
> @@ -5,8 +5,8 @@ SECTION = "devel/python"
>   LICENSE = "MIT & MPL-2.0"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
>   
> -SRC_URI[md5sum] = "81454c26572e4e47911596ea065eb1b7"
> -SRC_URI[sha256sum] = "f35fb121bafa030bd94e74fcfd44f3c2830039a2ddef7fc87ef1c2d205237b24"
> +SRC_URI[md5sum] = "1594eab5b5aef37ef1fd6d36ce4f8f4c"
> +SRC_URI[sha256sum] = "63ef7a6d3eb39f80d6b36e4867566b3d8e5f1fe3d6cb50c5e9ede2b3198ba7b7"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------4BBCBD5DEDCD7F8D18C9273C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 1:18 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629171853.18608-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.47.0:

- add contrib.discord (similar to contrib.telegram)
- add contrib.bells to auto-enable all extras
- add contrib.utils_worker for common slow tasks (e.g. web I/O)
- fix slow notebook imports
- fix gui TypeError on unknown len()
- misc documentation/error message updates
- misc framework updates

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200629171853.18608-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-tqdm_4.43.0.bb =&gt; python3-tqdm_4.47.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.43.0.bb =&gt; python3-tqdm_4.47.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.43.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.43.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb
index 642246c00..fad758e3f 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.43.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-tqdm_4.47.0.bb
@@ -5,8 &#43;5,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT &amp; MPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25">&quot;file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25&quot;</a>
 
-SRC_URI[md5sum] = &quot;81454c26572e4e47911596ea065eb1b7&quot;
-SRC_URI[sha256sum] = &quot;f35fb121bafa030bd94e74fcfd44f3c2830039a2ddef7fc87ef1c2d205237b24&quot;
&#43;SRC_URI[md5sum] = &quot;1594eab5b5aef37ef1fd6d36ce4f8f4c&quot;
&#43;SRC_URI[sha256sum] = &quot;63ef7a6d3eb39f80d6b36e4867566b3d8e5f1fe3d6cb50c5e9ede2b3198ba7b7&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4BBCBD5DEDCD7F8D18C9273C--
