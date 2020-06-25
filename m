Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.76])
 by mx.groups.io with SMTP id smtpd.web11.9907.1593090031844259594
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WZyj4dE8;
 spf=pass (domain: windriver.com, ip: 40.107.237.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C48XdurISawqdiSU6XrIC7Eej0mb7UO0qI4Zri/e51w8RULYCavF+ADhaYhhmbM1mAuDYhNdWTvOLsTk9+m3Bse0ackAGxgKcVjEOMjxkO4+DF6u0UjIKUWNVRzT/SUc5yvgpmRo+0VUpag9IcPib3LGD/EIKPBTqnA48AhXq7eCjpXDrpvV/nn/SbBoQTLW97T8n467zdwY2RR4pFgdYXcMMTBFNij7PHFrBq+STVIY1Yf3AZOrKQt4J+nn7mPRpvzPBp+0UAAAkjAG3qNG2uWQP75hMaYV9r5gDw9I48S5RN9S6/gamNwjG36QFJagNPo1Vaq2jR0FWsjjZM1HKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qv07TwtMX37ML8HafWKDDwiP/bgx2jcbvVAc49MZv0=;
 b=Sxds30/A7MYEkyQG1wzMPgo9pq4MKwWLsn6X6JGQ4sp/ZegjdqzwdBgf/hxt0wLe5JzgGV+o7xmHKOyNyVbdZUjMq+BzfTtMgdLT3jJOKYMX7h9gZ9cz09kipucxA1gKiFDQjqWTEa+AFIt+aK9hDDNoMCG9l4prSrTjBgM093wcx244ImuNluYfHK0TyeWZMrmpZnSqcEl5jXRShllAeqyxp6JrrNBhxI3zDFevC8iAKeplvhgpiRrW0qMVPpsmOd2gtT8SzgGNRe5MLyuQqWCXq0NUAGQg0NVLiOmf/KmfDLgW2gEj7igBNYyvlqWJ/ClIhRRBlsHDjHDb0nLAcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qv07TwtMX37ML8HafWKDDwiP/bgx2jcbvVAc49MZv0=;
 b=WZyj4dE8Z8OAWNcKLZXvoajY4k9wt1LauUObuyRjZpw9KeED9mjS6Ix9R0135VfiM5KCpNlXWJqWfI+1K50jh2G22+UMEIpNDLUtlsacSGtCLumk1hJH1JR0RHtVDIE390Lg+xc0Gar2S1rzwTnNAItQirrknJVTFF9vUyio1Hw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Thu, 25 Jun
 2020 13:00:30 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 13:00:30 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-py: upgrade 1.8.1 -> 1.8.2
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <1592990517499.2231@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e8d8056f-57d7-6ebe-dd8c-7a5137c6a43b@windriver.com>
Date: Thu, 25 Jun 2020 09:00:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1592990517499.2231@cn.fujitsu.com>
X-ClientProxiedBy: YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::35) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 13:00:30 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 907716fe-a0ab-4f07-8d61-08d81907bd34
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB39548C8F9429EB0387ABD1269F920@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nPxLQ7rTwmGw/PmHTym8DUw+SrgWYje1DnY7PNGGpI8+527vUNr3C7JNFFDu9aOGdoyb2aKJkAUSlM+buzU+61jY4DKdaxO61hJLZaHh3XxXVji9R1SDvdCHa15oKGxpp4d0/wE4BNgEPwwQvQRSR1kT5UM8PIj7/MEch0K5sDZMPjGcbYkAyD15iAwT5HptuuYyHlM3EB/0voVDwtGMCVM/p8l80xsc32110FulpaHVZJClvHZIgFgAIzVSUrIliroMnWojjn3YrZeZ6TXou4FFzG6nc0yEOhkrcsmjOc5oabNGhqyAPmtRTK3zYDmvk8VjIj1IjNcwOkbWGfc9CCeYq5pU7QnjU+sp4f+EkGoc6KYaXxwJvteEdTwPG8g/fOo3OSP9A/FTzqyfZfgyhpRWRQBY5UT+LQx2sX1ouW4SavZl7dMOVN3j+w0yF6PcN4khqyLamMXokLOQWmLe/Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(39850400004)(366004)(396003)(346002)(52116002)(44832011)(83380400001)(86362001)(26005)(31696002)(186003)(36756003)(5660300002)(53546011)(8936002)(16526019)(966005)(16576012)(166002)(110136005)(66946007)(66476007)(19627405001)(33964004)(66556008)(956004)(478600001)(2616005)(6486002)(316002)(8676002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	z0TDlX8cwtwM5JSrXZA9nhzGLgMH/3HOtzGghfYlQfChnBFCD/50zyGh7eZJte8pEMCTs7Al4BjD8rkJOL78lzLiNY7RXP0y8noosuSEGR8w46cOc3+SgzJiDzQ9zpeo6o7vpJVfFgXV8TP8/Go29lsGSdMd3i3MV6bOe+oIyAo+ituzpEt3tEIywkCmj5RWP6DxFZybVeO8wThIMx6QsfyUUZDgQu+3t5XZrMJVscv4oBulw2kWWIca/r8XnkxzOV6wLvYtVHslnnd4dXpfeKcmyt9jleVMt3nzy7HJ4D44qKpUB0lZjBfeSVURWu61YA8ShYzIueE0c8xN8aBpytrMmFqjsZLUsvwgixyCHF+rLdOXxkMh5ZhiuyurRqmC2osxaoCghbZMXZNZv0jZ6IPPJ77MSzpVUgq2Wzp98hyy6B18nA27eHCK/SF5kgTYVzFv+2iISHodJY5DQy1ngaTMd/+Bif/cf8NLtXerSW5lSRUYR1IYP0raCoNUDADC
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 907716fe-a0ab-4f07-8d61-08d81907bd34
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 13:00:30.5463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+xIF4yXzbMLGXjHLWcIOVBPJnCwtdzWlf++UhagzaYqmDIGb8lUcGMjW9u55VzZa7+x19OvWkU9UgeBj7eFheARWQTBC+NyRH0cytn91Us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------386D9A433B5FC77687FEFB65"
Content-Language: en-US

--------------386D9A433B5FC77687FEFB65
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/24/20 5:21 AM, Wang Mingyu wrote:
> ​​Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../python/{python3-py_1.8.1.bb => python3-py_1.8.2.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-py_1.8.1.bb => 
> python3-py_1.8.2.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-py_1.8.1.bb 
> b/meta-python/recipes-devtools/python/python3-py_1.8.2.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-py_1.8.1.bb
> rename to meta-python/recipes-devtools/python/python3-py_1.8.2.bb
> index ff66aeaa2..aea737853 100644
> --- a/meta-python/recipes-devtools/python/python3-py_1.8.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-py_1.8.2.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://py.readthedocs.io/"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
>
> -SRC_URI[md5sum] = "42c67de84b07ac9cc867b8b70843a45b"
> -SRC_URI[sha256sum] = 
> "5e27081401262157467ad6e7f851b7aa402c5852dbcb3dae06768434de5752aa"
> +SRC_URI[md5sum] = "baa54e458875d68031c422abb2e47a5c"
> +SRC_URI[sha256sum] = 
> "f3b3a4c36512a4c4f024041ab51866f11761cc169670204b235f6b20523d4e6b"
>
>  DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>
> --
> 2.17.1
>
> ​
>
>
>
> 

--------------386D9A433B5FC77687FEFB65
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/24/20 5:21 AM, Wang Mingyu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1592990517499.2231@cn.fujitsu.com">
      
      <style type="text/css" style="display:none"><!-- p { margin-top: 0px; margin-bottom: 0px; }--></style>
      <div>​​Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@cn.fujitsu.com">&lt;wangmy@cn.fujitsu.com&gt;</a></div>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1592990517499.2231@cn.fujitsu.com">
      <div>---</div>
      <div>&nbsp;.../python/{python3-py_1.8.1.bb =&gt; python3-py_1.8.2.bb}&nbsp;
        &nbsp; &nbsp; &nbsp;| 4 &#43;&#43;--</div>
      <div>&nbsp;1 file changed, 2 insertions(&#43;), 2 deletions(-)</div>
      <div>&nbsp;rename
        meta-python/recipes-devtools/python/{python3-py_1.8.1.bb =&gt;
        python3-py_1.8.2.bb} (72%)</div>
      <div><br>
      </div>
      <div>diff --git
        a/meta-python/recipes-devtools/python/python3-py_1.8.1.bb
        b/meta-python/recipes-devtools/python/python3-py_1.8.2.bb</div>
      <div>similarity index 72%</div>
      <div>rename from
        meta-python/recipes-devtools/python/python3-py_1.8.1.bb</div>
      <div>rename to
        meta-python/recipes-devtools/python/python3-py_1.8.2.bb</div>
      <div>index ff66aeaa2..aea737853 100644</div>
      <div>--- a/meta-python/recipes-devtools/python/python3-py_1.8.1.bb</div>
      <div>&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-py_1.8.2.bb</div>
      <div>@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://py.readthedocs.io/">&quot;http://py.readthedocs.io/&quot;</a></div>
      <div>&nbsp;LICENSE = &quot;MIT&quot;</div>
      <div>&nbsp;LIC_FILES_CHKSUM =
        <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9">&quot;file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9&quot;</a></div>
      <div><br>
      </div>
      <div>-SRC_URI[md5sum] = &quot;42c67de84b07ac9cc867b8b70843a45b&quot;</div>
      <div>-SRC_URI[sha256sum] =
        &quot;5e27081401262157467ad6e7f851b7aa402c5852dbcb3dae06768434de5752aa&quot;</div>
      <div>&#43;SRC_URI[md5sum] = &quot;baa54e458875d68031c422abb2e47a5c&quot;</div>
      <div>&#43;SRC_URI[sha256sum] =
        &quot;f3b3a4c36512a4c4f024041ab51866f11761cc169670204b235f6b20523d4e6b&quot;</div>
      <div><br>
      </div>
      <div>&nbsp;DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;</div>
      <div><br>
      </div>
      <div>--</div>
      <div>2.17.1</div>
      <div><br>
        ​<br>
      </div>
      <p><br>
      </p>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------386D9A433B5FC77687FEFB65--
