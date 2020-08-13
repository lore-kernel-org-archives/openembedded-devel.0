Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.67])
 by mx.groups.io with SMTP id smtpd.web12.13136.1597334272657963214
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VLr2qiUi;
 spf=pass (domain: windriver.com, ip: 40.107.237.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzoAPvsKNMXHVFZmn1BV4EeWBWENq5u0SdLngIf3wc3TQz1bGfiIPl6WC5AV5HHsTz38828GBScLXR1WEtqGntflnzG5R8Q20Fc/cAnvrixc0ywIRigKuQ0ImZTFmxPXdlaVX6qsSSmrgSCbaNEzkhvr/Ue9K4swL0x9+5RglM+O1xn8U1LXeoI1vQCoHZ5jJAhHEOh8Lp5TkF6GaGVPxA11BswcAi6fDsIqM67uIkuLUjbU3pZTMkbClJgEy88kJMjqjCiZCDgHucheo8ygglCQ0szWjNf/Yok74iV+wheOdbDFhQv4atxLyS21MbHiOltMp+KRXbC/VBmDeguVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dc8lQGZyQDnx8Sm1Q85UDZuxTwnAP+EECjObIxdBWFs=;
 b=LuL7g60jvh+iSLh1GDB4Wq9BJdlVwPn4ASy74ID4gRjFDnhB4QVfcZ266R9rVbYjbvagtwB3kYGUSCIAwU4+Tks6gGPyBeaYsStqCSbFHCWoAQj95NDaah0XPUDCtFmCclcUWiqtH9SRngPf7wzx6cJyXqX0qezkqGwqabsAHqI+qMzssowjPvRwCxjNXQ8sHNt5mKb8V9T+AbdUPFqaHG7pPgMDK7FNuogctPQWbECphPfHqKTYvdY7uR4shJFJs4Avu04L/hnfOd3gvZ0gHSX79WFojPzjuXn250X3+BmZGfPgaXnhX6IxpWCYmMNsbuWgVEVp0OIhvBbcIpSgfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dc8lQGZyQDnx8Sm1Q85UDZuxTwnAP+EECjObIxdBWFs=;
 b=VLr2qiUiJwdKFB3iIivDxikHbZzRQbIG7hHbpSz8tYgz8yUUEkSqBmxlqnqY6WJOaWp/lyAjyz5nJ0GieJE5h44x7zRwXC1C3NuRMx/M0EzH+n3QAgwkQ5UUQNa07lBgAMteCJ7aiFnItxTO6O7zyfyIkAXz8b1yMAGIIybJEhs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3606.namprd11.prod.outlook.com (2603:10b6:a03:b5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 13 Aug
 2020 15:57:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:57:50 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-redis: Upgrade 2.10.6 -> 3.5.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200812164335.24599-1-leon.anavi@konsulko.com>
 <20200812164335.24599-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <50b2ecdc-74c0-1134-61c5-ffa4a129cf10@windriver.com>
Date: Thu, 13 Aug 2020 11:57:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200812164335.24599-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0112.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0112.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:57:50 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6069f6d1-b28f-4214-07a4-08d83fa1a187
X-MS-TrafficTypeDiagnostic: BYAPR11MB3606:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB36066DEFBBB81FBE539645FE9F430@BYAPR11MB3606.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ih+CfVdjYfRfvK3XIhIQV6D9rkHqUmXou2M0TG8HUKaLzczoh54U2Qt5IRpzInAh+/QJqQAAmM0SXS+4FjwtwQyzTpMXvIZr8X/VvZqsSvuFIa2qvyr3yUYEjIm3z9G9kKRgdwyXkP1UHew3gb8bSVnbzaUnqPaCDL352Wnyn2yJTyJM1z/kgHFinqFXICQ+1W1PeRXp4YWDoILVAeY993/Ik+9e1ZvMZBDuNTdBPjPewlxs+rRdSGIUcOHsRX0N+SZefGVXxbF6OkSsDgE9pc+B0sbvkaXXegh/Eksi7+54J0uLlPUfPSzD+YFZbn5XowkWyV3gLu+GnBWdi0HRwNogtJ6bVzLnIWn2PinKNKhXTSSN9DnsbU+u2piyxU7Oee4IjxoLtIKHKPWI6Q6Vf9UYbggM08IUFwX5LiwOVz24TbDbWLgWptt++1AClxKXINazVOBlhsP/+ZCiHO9Z8Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(376002)(39850400004)(396003)(8676002)(31686004)(186003)(8936002)(16526019)(5660300002)(36756003)(26005)(6486002)(478600001)(2906002)(31696002)(44832011)(66946007)(956004)(166002)(66476007)(966005)(83380400001)(86362001)(66556008)(52116002)(53546011)(316002)(33964004)(2616005)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1NaT1AiDfp+OTuooR6qCbwzVvbLjbYGrdwzVzQ3P1bB9/h9P98npQQGJdOcnrqY1GodYLMO7qjV401UDf3JvcQnx0/9SV6Y/3r0LFdcYvlzLiwOe7dX4ygApT0bJZOpMXpEg9FJrrc2lz1GJBhsZ6Qs7o7XpD/7oKMbwLN/UMSJC65pZpk+bbDI0ErYe59Z/bzIDDIu/2aq92Vvk1M2UNorDh20qUIDfXdtiuvxERpyHtBDoiMXtaU22I2cot370QCdKK7Nl2ecY59+Gu4AxX4g+cSRtWOHoOqE4QNvo94nzn50EiLAIFQOB82mqmHk7sye6NTi6a2/O5/Fws0dWYppz9+Urgo0XR1wqYA3MYCnIGiJngF+ISBM4yAv8k8otx1r3HX2WuO8BRW7hpbLcP+qAaJiKOIWx+UBgoLYIAiMoUrN79udxD0THwfzxSaoZ369QroGsfxfUZybitWGkr+rU4bQ3Hw7G2WplhqESHBg/iyVQvjcQIpJXRDe16lWtXp9gS76aeg0x4U/59U65XMYoXgAxpowLUz52ZNVc/9OcMSzA1GfRFZSJMITxqNdjOBi0LO7zu7kL35O32clMXcrs1BRC4VSxGY5gweiAMzE+kHv1O4vec9u1NsqorEVEFPfYFxg6SNKpN+AYdl+fJw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6069f6d1-b28f-4214-07a4-08d83fa1a187
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:57:50.7099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYetYPsOC4mK4+xg0EX9DrkpeLxC3ym7ugiKd1h+Zdr4bKfMIRyZOAv/4kM6WzM5d2fX5Qdbcb8yHtzhxR1xv3Pnb+WfHZS+WIl/C3/dedo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3606
Content-Type: multipart/alternative;
 boundary="------------165D8944AF4BDA3719AB48F5"
Content-Language: en-US

--------------165D8944AF4BDA3719AB48F5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/12/20 12:43 PM, Leon Anavi wrote:
> Upgrade to release 3.5.3:
>
> - Restore try/except clauses to __del__ methods. These will be
>    removed in 4.0 when more explicit resource management if
>    enforced.
> - Update the master_address when Sentinels promote a new master.
> - Update SentinelConnectionPool to not forcefully disconnect
>    other in-use connections which can negatively affect threaded
>    applications.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-redis_2.10.6.bb => python3-redis_3.5.3.bb}       | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-redis_2.10.6.bb => python3-redis_3.5.3.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-redis_2.10.6.bb b/meta-python/recipes-devtools/python/python3-redis_3.5.3.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-redis_2.10.6.bb
> rename to meta-python/recipes-devtools/python/python3-redis_3.5.3.bb
> index 7a9cc3f79..1887bf9e8 100644
> --- a/meta-python/recipes-devtools/python/python3-redis_2.10.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-redis_3.5.3.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
>   
> -SRC_URI[md5sum] = "048348d8cfe0b5d0bba2f4d835005c3b"
> -SRC_URI[sha256sum] = "a22ca993cea2962dbb588f9f30d0015ac4afcc45bee27d3978c0dbe9e97c6c0f"
> +SRC_URI[md5sum] = "7a00d4540374f34e152a33faa1fcee5f"
> +SRC_URI[sha256sum] = "0e7e0cfca8660dea8b7d5cd8c4f6c5e29e11f31158c0b0ae91a397f00e5a05a2"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------165D8944AF4BDA3719AB48F5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/12/20 12:43 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200812164335.24599-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.5.3:

- Restore try/except clauses to __del__ methods. These will be
  removed in 4.0 when more explicit resource management if
  enforced.
- Update the master_address when Sentinels promote a new master.
- Update SentinelConnectionPool to not forcefully disconnect
  other in-use connections which can negatively affect threaded
  applications.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200812164335.24599-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-redis_2.10.6.bb =&gt; python3-redis_3.5.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-redis_2.10.6.bb =&gt; python3-redis_3.5.3.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_2.10.6.bb b/meta-python/recipes-devtools/python/python3-redis_3.5.3.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-redis_2.10.6.bb
rename to meta-python/recipes-devtools/python/python3-redis_3.5.3.bb
index 7a9cc3f79..1887bf9e8 100644
--- a/meta-python/recipes-devtools/python/python3-redis_2.10.6.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_3.5.3.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/andymccurdy/redis-py">&quot;http://github.com/andymccurdy/redis-py&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27">&quot;file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27&quot;</a>
 
-SRC_URI[md5sum] = &quot;048348d8cfe0b5d0bba2f4d835005c3b&quot;
-SRC_URI[sha256sum] = &quot;a22ca993cea2962dbb588f9f30d0015ac4afcc45bee27d3978c0dbe9e97c6c0f&quot;
+SRC_URI[md5sum] = &quot;7a00d4540374f34e152a33faa1fcee5f&quot;
+SRC_URI[sha256sum] = &quot;0e7e0cfca8660dea8b7d5cd8c4f6c5e29e11f31158c0b0ae91a397f00e5a05a2&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------165D8944AF4BDA3719AB48F5--
