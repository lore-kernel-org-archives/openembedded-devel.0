Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.84])
 by mx.groups.io with SMTP id smtpd.web12.3107.1591818839773846987
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bJtmXu8K;
 spf=pass (domain: windriver.com, ip: 40.107.237.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gw2FmA0o0iOm9+6trblceO3m9pMyiQHsgJEHg9BYeVhUKnb0wSjTzI10adIVhl8AhXW/TDKOG4rOAorEVnSKTkmgz7coKBdvUxW8Xwj7rg4FpZEftI09L/sXJ11fBBxVZgjkRAYcDiGsmExuUntaBXv0VlwaCOU1i/FKryRdc9rl/duVuQylrO+IAkYG1yfYibubCotuyQXVc2PXBx/505Socv+mH/RdQHwEQmRoLfd3T1IpAKzycHa56iDmmi255qOzuoJdRmMT0tOWpVGWeEmcGiODZM8qs94weeSAdszLxxY9FPkZnBfxH0vxlM4hmMt/xsMflhk8vouZJNAt9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMssuo5F0IRFFYaXDK7vkmJ37Dcjj2V1Gf+ekTX64LI=;
 b=OvhIosYmIaTaZfW9i+KFsvU88+g9umVcIXicV7MLAxrBoJrri52L33IIa8gShJw2HCnKm3evlOo/fDWDcwPnmocHVfYtdmvLk9Qw6KGcK6PCYAahwdh2qi52MuNJwX9DHZhyLubjEft4uClQTBEdH4MjNmJE4GwyON4HAtflK14RXAzTAp5jYEiMMkkPVsa8Ckkyx8bYpMT6rJK2HI5vHYlD/3t0xWiUbMXGdZf7scoSfkC2Lru9xvGtYxbDZ+gNSYru0u3iCl/PkSogr6YMNZQFc4mBLDuQIJh3iZu2vnBUuGcvJRypZSekVRIPDF+N/mPjGdMC1H8I4+gXfJuJ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMssuo5F0IRFFYaXDK7vkmJ37Dcjj2V1Gf+ekTX64LI=;
 b=bJtmXu8KbMEPhMloiXSoGlt1gfxY+mLZ5Kl/vNVmNjMCS+C5vYtEyP+HahqVO4WAY0+LssUplP8+tHBwsHrlEBQ3GfoddEcMIeapnSP47aPfZ+QvIbnFW0WyCFvfFdEeRAILOfGUaFiwsrYu/Q/A4I2EzgU4zUFmAjo1fvoaKIs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1700.namprd11.prod.outlook.com (2603:10b6:404:47::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.22; Wed, 10 Jun
 2020 19:53:58 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:53:58 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-soupsieve: Upgrade 1.9.4 -> 2.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609134311.13299-1-leon.anavi@konsulko.com>
 <20200609134311.13299-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0a46c9ea-0a18-dbc9-0117-5024650db27f@windriver.com>
Date: Wed, 10 Jun 2020 15:53:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609134311.13299-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::18) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Wed, 10 Jun 2020 19:53:58 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8dacd88c-a996-4ac4-d6e8-08d80d7803b9
X-MS-TrafficTypeDiagnostic: BN6PR11MB1700:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB170073FBBEF594B33CF765DF9F830@BN6PR11MB1700.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MXbIz//uB2QzeHQr1IWqvcr63r5MiSpOfUXyMbYuXhb+0KIsLiYvt0hSEpwEL9cEgtOHxWpadQuytzNOt11buL4hZvIE73IFkNdrqHlpo2NG6s2Pe3lznyaxi9H1QW7A9KF3VEPVNFvgVHJuP9qw3nvMO21oe2NS/vh4ru91JbSJZRTypXB1jtlWdXs1hqL+rD3dBBdVW9yqGozHrf9liElAUuz4ROygiKJoseqx659i36INTJstQywlxOGecMyDRU9yNvxvuULYyDQyh8EIi/y+6eYgflGXLhqyIVWWqimaWhN4/wtdSCrESTpz+xNJdv0o4sHsGjxZtoo+l5qHPcUD7Us7B58SH0+E7jfwWhkbAJiQ0NNrJT1yMlQDhVF07UF2VoVRYIuZfCialKHUC/Z/fKb63vzQPHXWnLVsmdyK2GATcEBCFDPYJeHLGwCql7VP/Lge2Y5aH7q6viNJlA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(396003)(376002)(136003)(39850400004)(66556008)(52116002)(66946007)(2906002)(33964004)(66476007)(31696002)(31686004)(53546011)(86362001)(186003)(956004)(966005)(16576012)(83380400001)(8936002)(2616005)(6486002)(8676002)(36756003)(5660300002)(26005)(16526019)(44832011)(166002)(316002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	k8Ux5ZoYBJGS2/ZC9h7w6mk2C5aq3ngXxt80kSBDSLL6McDXMvP63ChzAvqVvaGxLIsyUIL0zdBpOOUpSMbMfUk5B94C2SfIjdueQ7XIbAwY2sBg6lfse8+GYTsBolypbUZGGbLitZhQUCJ2Un2tolbpy/jvQu+D2kV4yBTQDLgvaY0ytA0A5WdWFbtdRPnyEB/Ai67vfetQaMkKKUzT6z6ho33yC6nB58WTi4nIWuzESWJC6TPC07YPdwY27MCCRGUfZqCgA9jZUg9E0dOyD45pE8G/lN5/P5emnortR5xUh+C3o7ikzXdHxDe/d98XjW/ug8JxRiB3+Hu2xMARZT+YhRdJAiZCbfugaUPnPy8eyuwrfdtJtUPIOsAVS8SMMQS4O9zdEwjmq8cz8fm1X9RCsJ7kauU0a2mAm6yFynvpsC93K1+eMO95ex0u8FmDymC2WIFhfIQkcKvnS3QiN86zRRWBkeMMC2Rsyoqj+S0PbVioLN7Z8yA0eahjftdW
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dacd88c-a996-4ac4-d6e8-08d80d7803b9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:53:58.3712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PAqFYYBsPA+JEOKxGFDIXvlbXuUibJND57fOZwUlEMh1DKMPLzDXM7ML8aXViMtAdLeAN1LqTqhN2ChLvtgPkU/jbAkA2i/8kwUMLUiweI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1700
Content-Type: multipart/alternative;
 boundary="------------80840E6A0ADE22C4DA993A97"
Content-Language: en-US

--------------80840E6A0ADE22C4DA993A97
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 9:43 AM, Leon Anavi wrote:
> Upgrade to release 2.0.1.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-soupsieve_1.9.4.bb => python3-soupsieve_2.0.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-soupsieve_1.9.4.bb => python3-soupsieve_2.0.1.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
> rename to meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
> index df69e007f..aa087c920 100644
> --- a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5"
>   
> -SRC_URI[md5sum] = "43d8ea20c58494446aa65ba5cc6320fe"
> -SRC_URI[sha256sum] = "605f89ad5fdbfefe30cdc293303665eff2d188865d4dbe4eb510bba1edfbfce3"
> +SRC_URI[md5sum] = "62a7481c7dbf6d8cc21e4e3a79c72034"
> +SRC_URI[sha256sum] = "a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff49eadfd7f1a537cc0232"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------80840E6A0ADE22C4DA993A97
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 9:43 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200609134311.13299-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.0.1.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200609134311.13299-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-soupsieve_1.9.4.bb =&gt; python3-soupsieve_2.0.1.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_1.9.4.bb =&gt; python3-soupsieve_2.0.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
index df69e007f..aa087c920 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
@@ -4,8 &#43;4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/facelessuser/soupsieve">&quot;https://github.com/facelessuser/soupsieve&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5">&quot;file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5&quot;</a>
 
-SRC_URI[md5sum] = &quot;43d8ea20c58494446aa65ba5cc6320fe&quot;
-SRC_URI[sha256sum] = &quot;605f89ad5fdbfefe30cdc293303665eff2d188865d4dbe4eb510bba1edfbfce3&quot;
&#43;SRC_URI[md5sum] = &quot;62a7481c7dbf6d8cc21e4e3a79c72034&quot;
&#43;SRC_URI[sha256sum] = &quot;a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff49eadfd7f1a537cc0232&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------80840E6A0ADE22C4DA993A97--
