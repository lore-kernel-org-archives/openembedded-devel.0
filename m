Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.69])
 by mx.groups.io with SMTP id smtpd.web10.2993.1591818690831607954
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dHRgRH+x;
 spf=pass (domain: windriver.com, ip: 40.107.92.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWaKIb0x99aIg7YJwl5KY/VMHOHQ6bN0AIRoBUmDXbnFV2nr6rd3QazMla0Kz2RAgwygKVy4bKISHugtgdN8IUk4BucbCRpmOxAmb+TxRlX8mS9SsyEKzX59cY3uI81De9H3bSxkUNQpgkewXmtnlqnz+arnidDEhC1sMrT5ylq0fLkahb2cG10T3KrUOKvI1boptIZ0K2put+inuMzunAs0B55q8K4rcpXyenLhXqYjfCtZZ4wB853B1zfzqp7oiONcg6dXMC2XTNbzhlJ+/pb2N2ehf2rhK4R+TZ35ibeSFzVuoBlnAQmzkkmFSp6VjeEnr5MFgOfNojc19nmb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6N5/MLylOleWRUqpAQbdKBS8MwWtNaYfrFK/MnYLEgc=;
 b=XWIXda5fUFiK7K3IxNB5xpE6PgpvvpYVJqRu5cjiRtpqEmjUd3QWubIJuGyJDOA+3ntyBfapwCd+dLpexanNTJ0W89w/SUULvhRwHtmG1WBOrLXMUgPU2RLqBzcg+hMcm3ab7kh7s/lug/EkYXk7Lr3zscCijBY3wyrcx3Wd72qd8PBa1jMaLJs7tuUHCqToyLBTyqv3D83t3DhLASDfdq/+YgZMGjT85P35n0Ya7aCaK5LnbkGhmzFyqhjXWlIYrDqm73TYCL2vHQ0Us2U6YqBVj9pMleRmsbvWnWJTv8nEic1QdRF6ned3a7F7HlBy79CqA4yRJFRel0xJf3zKBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6N5/MLylOleWRUqpAQbdKBS8MwWtNaYfrFK/MnYLEgc=;
 b=dHRgRH+xWMmmuWEOCTWusHly2SlRME5pBT0aiLER31n5iRslCey1Ah1jLy+v1Z4zebq9PtQqVUjMFAyHFvkDZ//1mT9ZJwW4gMt0XGuXGM6wophaGTCB946btsxA+S0KenNyYvQ07+60FYPAS1Y99FNF/MaQ8+oand3e35vMHNw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3924.namprd11.prod.outlook.com (2603:10b6:405:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 10 Jun
 2020 19:51:29 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:51:29 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-oauthlib: Upgrade 2.0.6 -> 3.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609091121.23832-1-leon.anavi@konsulko.com>
 <20200609091121.23832-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <be47b788-1e95-67f4-9985-367ef900573a@windriver.com>
Date: Wed, 10 Jun 2020 15:51:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609091121.23832-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::37) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 19:51:29 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b19f645b-05e8-45d6-f4a6-08d80d77aaf2
X-MS-TrafficTypeDiagnostic: BN6PR11MB3924:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB392477F7F1353C3D20116AB59F830@BN6PR11MB3924.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8AZeRhUpqPUEdQMLosDceoxnd2N+AQ0LBLnbc5O6xWCay9L6zP8cWlv4aDeqg+wKU+TbzwF6AhurQb4d0qo4GRPLioILH04PHzXc5VAyjPMYTVupHn9hqLKNJUmAlNF1Qo/xPe1qOfxGLuodbBpgSLVmtIIRHZiinZAmLUWXiISo7zJfxlhi7kATbu3fQU7MMHD/5JL7GrkORry+ZgUNHQOOfvhV03EWcW/YlbSmdpmTQslPYGj5iYbUyT1wDJ1YaZRTOwldeNwi4ZLWgOOP+MYjuPOeBEy/CHOzKL0mbtJb7yrqBYgsdjTZJEronZj/7s6IrM7CeQKWvgGyc4VLiuxyK2PJL6C/LDVjUHwl2DVdT1+N3ecMGnIyzmJN1c5TSZOSemY+JHf1fSY353LpxDISedbZDzkDlV4ZYXwpi3RYpamsEKq8UzoXkVfTbpSbd5hHvtN7IGkG/qgVZFhWZA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(39850400004)(136003)(366004)(376002)(316002)(6486002)(8936002)(16576012)(166002)(2616005)(956004)(31696002)(86362001)(31686004)(44832011)(83380400001)(966005)(66946007)(66556008)(5660300002)(53546011)(8676002)(16526019)(66476007)(36756003)(2906002)(478600001)(33964004)(186003)(52116002)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	R/TzwqCKaGDev+Xcp5R+OGy9UrBqG3HF6urlWeFJnoK3il9rA9s2kp8dPnc4qJLF+MuJXP6lfENzeI2ldP3org7WpQ3FNYvugR3P9bXFXbIR1SE3muAQ542hbfdlcnffsqVm5enXUq8+4OZ9ZFErh+8nWoR3a7l7MfP0zCjxm8JyT9clu8L4wzOLq6FOD/0AqhxYC44sGl7DeIhb82x/hvT29VhAAxvYdRdVvBrJeL9Rpmfn3qU5XbonWNaZeWuPRJNreeIs3TDqniEnHStYhYUlVFG44P6QSe+8+/kXqBt1RaCc+WH2APMa9TCs8T8HxEg9bT3TlwDP2sBAtYqESa+vZlp+3Uj/6PDcZuBDUyGHSCwYBSCNB1ejRNCNcokhQ/kP+P5XOFqXqq71ygWMQS64wWgY4Gt8b3VXhM9T4rtZFVG1lSUIkcVaZSJmgT0bnJmEkvl3uSis6SKI2B0hxBDNk1d/jsH2R6dVgzC5CQutUJEDEKMN6qZyRBp+AHCq
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b19f645b-05e8-45d6-f4a6-08d80d77aaf2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:51:29.4492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5atXJnLrJ9Sr068/wlqUoBQznI1XfuBvTGi9mx4fj/CbewpgqClYVNj3S+6qDEkLnHD9mM57DHHsZT2m+s3NVqth1R92c+bqZA9vY0RmMVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3924
Content-Type: multipart/alternative;
 boundary="------------DF8457B8115B28F51E9A00E7"
Content-Language: en-US

--------------DF8457B8115B28F51E9A00E7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 5:11 AM, Leon Anavi wrote:
> Upgrade to release 3.1.0. The year in file LICENCE has been
> updated therefore the checksum has been changed but it still
> remains a BSD license.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-oauthlib_2.0.6.bb => python3-oauthlib_3.1.0.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-oauthlib_2.0.6.bb => python3-oauthlib_3.1.0.bb} (82%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.1.0.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
> rename to meta-python/recipes-devtools/python/python3-oauthlib_3.1.0.bb
> index 73fd30cb3..fe27e8e50 100644
> --- a/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.1.0.bb
> @@ -2,10 +2,10 @@ SUMMARY = "A generic, spec-compliant, thorough implementation of the OAuth reque
>   HOMEPAGE = "https://github.com/idan/oauthlib"
>   
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=5ba9ce41463615e082609806255bce1b"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=abd2675e944a2011aed7e505290ba482"
>   
> -SRC_URI[md5sum] = "277a9a966cc8c72e492b4eeb41332445"
> -SRC_URI[sha256sum] = "ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2539bbc3ec70ce1"
> +SRC_URI[md5sum] = "43cb2b5bac983712ee55076b61181cc2"
> +SRC_URI[sha256sum] = "bee41cc35fcca6e988463cacc3bcb8a96224f470ca547e697b604cc697b2f889"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------DF8457B8115B28F51E9A00E7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 5:11 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200609091121.23832-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.1.0. The year in file LICENCE has been
updated therefore the checksum has been changed but it still
remains a BSD license.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200609091121.23832-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-oauthlib_2.0.6.bb =&gt; python3-oauthlib_3.1.0.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-oauthlib_2.0.6.bb =&gt; python3-oauthlib_3.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
rename to meta-python/recipes-devtools/python/python3-oauthlib_3.1.0.bb
index 73fd30cb3..fe27e8e50 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_2.0.6.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-oauthlib_3.1.0.bb
@@ -2,10 &#43;2,10 @@ SUMMARY = &quot;A generic, spec-compliant, thorough implementation of the OAuth reque
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/idan/oauthlib">&quot;https://github.com/idan/oauthlib&quot;</a>
 
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5ba9ce41463615e082609806255bce1b">&quot;file://LICENSE;md5=5ba9ce41463615e082609806255bce1b&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=abd2675e944a2011aed7e505290ba482">&quot;file://LICENSE;md5=abd2675e944a2011aed7e505290ba482&quot;</a>
 
-SRC_URI[md5sum] = &quot;277a9a966cc8c72e492b4eeb41332445&quot;
-SRC_URI[sha256sum] = &quot;ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2539bbc3ec70ce1&quot;
&#43;SRC_URI[md5sum] = &quot;43cb2b5bac983712ee55076b61181cc2&quot;
&#43;SRC_URI[sha256sum] = &quot;bee41cc35fcca6e988463cacc3bcb8a96224f470ca547e697b604cc697b2f889&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DF8457B8115B28F51E9A00E7--
