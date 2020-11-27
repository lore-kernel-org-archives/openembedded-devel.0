Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.85])
 by mx.groups.io with SMTP id smtpd.web12.19135.1606484931952140077
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 05:48:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Q1yCRh2M;
 spf=pass (domain: windriver.com, ip: 40.107.92.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbrf8sAJx1SwXIZo1wtq5delhe8l60Hhmznj9iM/LiR1TJroJUngC92VY7GGYW6m0hvXeKPxzJfCaVf7JWElcOif9L/XYjR6XPnBuOnI1kKqtecYlxBfda1hn5LEvXp+arTNwMvKijZWg7uEa+9PgLEFt9v6LVoS6Qo/yvAtbpSSTL+jejmKavFtSDdD6v2A69KraJzybkrJhq6jl1jixHbAhOjltqf3oXaW/K4ow+8IuTWmYKS4WexscUWPb3e3pMTL27sTlzpQqs/VDcsCKsU9c79pZ1huMpIkbhOweVVhC3A6LxJVG07zDI4HFJRyfi1QItJXSUrLWSuMN2spvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2HyPFt42HjXR9m7NalHfU0tbrVOsp8XaAWHQGYj9KU=;
 b=a9BvMoDbk/Fb4UziKRxW0K/Nvk9v5Fipk4S2BLZFAAn1/EhVTVi/Pn0QbSE9Sq5mj3LB1lTd6lkEv7wWuIp6ZmVXkH4YxHbs8BMSEIK2t+efAHivrlDSIS7tRd2yqif4qtA4Pa+q5iOMgTvky4WA9AHtLynoP12kKFRkwWZLGCMMjvzpdgFImJX1O6kg5t164jhuIu3Gs5YZsAo+uki0J8sA3a3Gr8H9drwG5rkPYi9ptGaZ3ZPRMH2xcD7917HdR4w1GXPAW6wS9jjJL3iiek6J/BSf788O9smzlHDHPVvp0Fj1D2WS84KdpazfcW2o+0TO3y6mM+dogqGq+0lGKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2HyPFt42HjXR9m7NalHfU0tbrVOsp8XaAWHQGYj9KU=;
 b=Q1yCRh2M20++LUD/kQZ/ehVsJYIomCXwQQtTWOYUVgDfsyZhmvFj6251oSHBE+Edh3ICE8v1ZhV3JZ9u+OADaepbOhVo+m7dz9IrrJsZ2Toc57GGJbztLi+XMenIqS8JnJrdL5UEH2uYBvJHdrC12VI00PaoH9SlRc6m7csJKPk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Fri, 27 Nov
 2020 13:48:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 13:48:50 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-luma-oled: Upgrade 3.7.0 -> 3.8.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201126112215.11451-1-leon.anavi@konsulko.com>
 <20201126112215.11451-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5c0f9d46-fcb4-e432-6855-3226f20c24d5@windriver.com>
Date: Fri, 27 Nov 2020 08:48:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201126112215.11451-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0146.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0146.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 13:48:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51345c3b-fa8d-4ef4-96b1-08d892db2bf5
X-MS-TrafficTypeDiagnostic: BYAPR11MB2598:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2598CA62E33F794E1437B5A79FF80@BYAPR11MB2598.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iZ6nIXTAkowW5giHAkfic22WVDY0rtsZ720QunX7cOeJz+QfK7hpkUlfhowd/npw4Y3FwmQpXXbVG5StHXExye75Yqm0/fi592eweBdnuy+6xtfKLA7AClbWzp4K7v03s/RfIwwxzPq+AymHI1/spfQ1uZdUt42FIZgNNe8y9kRwUMOu+FRrRlAAR+UgliyIXG+Nv/JYDGjWZotPigl6Gx0Z5QWY78BZ8vDIgCd9N33/iD+mQbYWKHOvk9YOrveaIe5ibMwd0isJhwGdCYHWkA/mRgSFQ52abR38BUiXmxDbfH4NgLrg01wLuYbkuDuvbGQhBMFst4S86HcZZUxO1S8YhswIud6edIbmKKtp6lLR5vJ6/0tK8aiOhAgkDyu4fGCwZvLsb8z8M9nV3hH49WlCholipndHVsXvKeCBfyge/EOwR/gh4WMxfUgZP23E4SqiipiMEJ5bFi9QDg+s8A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(136003)(366004)(346002)(396003)(186003)(2906002)(26005)(16526019)(52116002)(6486002)(8936002)(83380400001)(53546011)(478600001)(66946007)(33964004)(86362001)(966005)(5660300002)(2616005)(956004)(166002)(8676002)(316002)(31696002)(16576012)(4001150100001)(36756003)(66556008)(66476007)(31686004)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MHZXSk54U0xyVGRTVzB2Y3hUcmY5RWZQbEhiZ1JuQWxST1ZiSFh5NVZhZTFW?=
 =?utf-8?B?NVF5MXZFa0dDTDhmOWhydDlWYXNzMUhKWkJVd08wRHRTMUVTNEhDQk8wd3lv?=
 =?utf-8?B?cXdTdjBMOE05OGJSK3loM3N2V2NNMXg4ZzFyOXV6b0RzSHF3VktIa3hybXBj?=
 =?utf-8?B?bEhuNzRud1J6VENxQUJudWFCSm9wdnJaZXcxTjdiRVlJaHZWRXVCMmNOMkRH?=
 =?utf-8?B?TnJzYUozTFJqZmpDWGxUUGxYZWtlNzRUdURqZkVKR1g1b0hnU2JoZFZGa2lX?=
 =?utf-8?B?ZldENjNjeG5oWTdvUzkxbnlzclB1MjR6THovaVhSeFQ4aGl0NXNzYU5wUmdK?=
 =?utf-8?B?d0xJckZhN2pISDc0bUtQK0FybFlLSzdPSDN5SGlqQnkwZXdTT29vdG5YdEp0?=
 =?utf-8?B?M0VLc3hncjJVcXRpWFpET1dhRFUyTHZVcXMxNEhIdlI4NHhDWmgyMmpFQ3Vk?=
 =?utf-8?B?L2JVQ21yQTdDUTRtMUZKUG94WTBNNi9sOVVWN1pMVGYrTDJScEQ3WE5hdXZ6?=
 =?utf-8?B?RlRnMnNQZkxtY0JydC9RaHZ6SDFYdWI1eXEvbjArUDdwQXZUeWpyN21RZi9H?=
 =?utf-8?B?NlFlMnJkK25IclYxSXo2NlRJK05xeDNqbFIvM253UE42SkxhdkU4dDUrSUNR?=
 =?utf-8?B?V0VlOFNtekV6aS8rS0pDcU9qQWYzcG5Ec3lCRlprZHQ2NTQyalhnMndYY0ZT?=
 =?utf-8?B?d3dnejJmeC92NWpEMTYrYVlTOE5iRTcxcnN3WXU3YTFNb1lSdURzT042NWRn?=
 =?utf-8?B?RDJOTHZJVGZteG5OS0dtUVJNVkg3aDlYQnRMSHNtOEJiQ1Bkby8vZnJUUTVh?=
 =?utf-8?B?b0dFUFRzYVpwVFhaOVZBME9QbjJZMGtzei9TdU16bFpWV0xXc2FQcXdCbFRi?=
 =?utf-8?B?dG9QdWdJZTFMWFhGSEVvRUVDM1h0bGRsKy9BSjduWitnNHBmb1ZyemJUVTV5?=
 =?utf-8?B?aHVTM2hlSWJDZE1QQXM0d1Q5bVVuRjBmUldIK0N3QlBOS0JYbjlRRWtEMFND?=
 =?utf-8?B?TDUxeDJkWWl3TFQ0RE5LNVpzR1Y5ZUFYdGYzTkNiN2pWU204TCtzV250K3dW?=
 =?utf-8?B?VG5IOXdrdmlhZFgrb1VNRjVoT0w5em5sUnh0VDBLUktNRisrY2YwVUwyaDNW?=
 =?utf-8?B?M0ZwMlZRQ1dTQ3loZDhkaUg3QjZZTE5kOU9DNm8vbTRsWGlsbE9EZzRleFRD?=
 =?utf-8?B?aEtJLzVjSHNVeWlIOHVoSk9KbkZEaGxGQTI4NHRJUUpMQ0JJbGF4YzVoSkd4?=
 =?utf-8?B?QW9mYi82NXdncEV2ZGhwYjBnZlQ1anI0R240RjJ5eUl4My9vOUtzS0xVSlQw?=
 =?utf-8?Q?PrBuenqyLGcSpnEEomC2yDO0vhjOwXoHYe?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51345c3b-fa8d-4ef4-96b1-08d892db2bf5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 13:48:50.6972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3295mT5nrC7M3/ugAmcnfZbDNCqUjmjoGIZNz5hzkhVCamc1fnlsd7H/6J018GHZtaV0LAKF185vsxB9MSmZNwCbZQSvwNRqS5b8FPWSObs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2598
Content-Type: multipart/alternative;
 boundary="------------873481A6C567E93D586B0652"
Content-Language: en-US

--------------873481A6C567E93D586B0652
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-26 6:22 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 3.8.1:
>
> - Improved diff_to_previous framebuffer performance
> - Fix mutable default parameter bug when using multiple displays
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-luma-oled_3.7.0.bb => python3-luma-oled_3.8.1.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-oled_3.7.0.bb => python3-luma-oled_3.8.1.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.8.1.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb
> rename to meta-python/recipes-devtools/python/python3-luma-oled_3.8.1.bb
> index 8c9d195baa..329cdb9e3f 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.8.1.bb
> @@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249"
>
>   inherit pypi setuptools3
>
> -SRC_URI[md5sum] = "dd661f869180c5b306628cc6ade04d60"
> -SRC_URI[sha256sum] = "fa710ea5d46f731033dbbcf4330f264d653a9a21d60b29dfc53355f72f355e17"
> +SRC_URI[sha256sum] = "a9b445ecc686e9413ddac655544da21d801bbc6b94612736cf59283e6b92bcbb"
>
>   CLEANBROKEN = "1"
>
> --
> 2.17.1
>
>
> 
>

--------------873481A6C567E93D586B0652
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-26 6:22 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201126112215.11451-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 3.8.1:

- Improved diff_to_previous framebuffer performance
- Fix mutable default parameter bug when using multiple displays

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201126112215.11451-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-luma-oled_3.7.0.bb =&gt; python3-luma-oled_3.8.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-oled_3.7.0.bb =&gt; python3-luma-oled_3.8.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.8.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-oled_3.8.1.bb
index 8c9d195baa..329cdb9e3f 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.8.1.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249">&quot;file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249&quot;</a>

 inherit pypi setuptools3

-SRC_URI[md5sum] = &quot;dd661f869180c5b306628cc6ade04d60&quot;
-SRC_URI[sha256sum] = &quot;fa710ea5d46f731033dbbcf4330f264d653a9a21d60b29dfc53355f72f355e17&quot;
+SRC_URI[sha256sum] = &quot;a9b445ecc686e9413ddac655544da21d801bbc6b94612736cf59283e6b92bcbb&quot;

 CLEANBROKEN = &quot;1&quot;

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

--------------873481A6C567E93D586B0652--
