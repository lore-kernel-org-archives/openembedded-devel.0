Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.45])
 by mx.groups.io with SMTP id smtpd.web10.268.1610649850043212121
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 10:44:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=N22Q9eXE;
 spf=pass (domain: windriver.com, ip: 40.107.244.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6asQOzgzhptnI6rJJlVLOoBhZ1VZlapidMYU3Ck6JC2m/yGTVOptbENlmBVG43RZpInFoZGXKu4nImpFL6zSzlRlMDv40M8Yia+Sy/6kPIMILjCrAEOyDdWSZTLQsO0Ck9sYpqMElvskHNSwECf5+7oJgXXbHLDRaSb74/fpl+b2hqWhumMSw3BAMVuMzIvYdJdikEBeW5C41W+riVlxfO4yo2nKmGoHA6dbu+gFcWpwNWkf6+g+GnWyCUwZTvgs0zAP7aU3Sni9PleGXCzX2fbDjgTmEsIpA1K/LPOm+ZaDkujfV4mgH5gJlGozLbCpeWcGEgGPxIOpgjED9j+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OA12Cjcmp1m6mkfD6S9cbSBtNCasCmr+J2Mh2M6Qetk=;
 b=UUSpynuc55rtLIBKkJQCV+nqF0Gek5U5x9MWku2xCIXGllGHp7VeSQXINL0CbnOEgfnjfKsk+0XU2G+fDLGJzRgaoTUZCHfqRSEWtv7lV8P495PvzoIcm1b75K6juskDluG6OFL20cr3K5vc+FFJN5dGm33Om27bBuZeVSRBnOWX8UwthgWxo3VDdPSUI0xhsslCSuAPojUlfZR541Vy31edSEGdQw+IoyoSvoK6HkoG6nFFhiwyxMo0FKGfhFYLvCD+HHdvgpgZHA3I91ECb4Tdez7ghQ1MWFzMXMQqaKA7e0oT2VB00jeqiAv7T7qAiXnJjK//PEUAOcNb0vlImw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OA12Cjcmp1m6mkfD6S9cbSBtNCasCmr+J2Mh2M6Qetk=;
 b=N22Q9eXEHoOINAUI9tXR+bcwFHDxho8G8z6hoEJF3g8d3XRZwcXwzG/VpUTzFlKA17KH5RHz5vGNOd8eENCjI2Gpnz5y9dqK9yDzvNiy2aFxQVL3PUa/qkEzA+iuSmjLS03obtiJ8y4fl/fcaqTdAAC8Umsztd92zCZRm8lxGCQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 18:44:09 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:44:09 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-msgpack: Upgrade 1.0.0 -> 1.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
 <20210113142626.27599-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3cb65df0-30ea-0b78-d6eb-1212913c5361@windriver.com>
Date: Thu, 14 Jan 2021 13:44:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210113142626.27599-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0123.namprd13.prod.outlook.com (2603:10b6:208:2bb::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.4 via Frontend Transport; Thu, 14 Jan 2021 18:44:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f1d9bb4-f0ba-488f-4192-08d8b8bc6104
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4800:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB480089A81953021452B852DE9FA80@SJ0PR11MB4800.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OpClcnbMH2X03As57Hyh+PgskZ1LqgUOVQuw5yXirb4e87iHbbErfcEWZrRUt4deOaUCXDOLMnyJSMxHuR2uqKa/sKQa8kRV/gQdZ5ahLPA7mzLik/6mrGjNP4dHkX2pDIM21cnY7A4LcfGQMzEMd1ygOfaDgSOI7oPrMOwSe+coKw29xm0OpS8YjoeP0PDa3PD79qCcklM7FZtv2+xott+Nw1LNJPUttr7CRVviUNxIqiqUnu4ZNNn92VhZCkQl68UiifmeIZkMkxYNvzCebusPtZNctoTpZJAAIIJwK/6qvrAYzIKqmmxlpR3EvTZ/Qq9w8Bh8FhoiC+nRZ/pYpy8gnRzdAsd6u8Nklm5+7fp3IGEMHYDGt6i6nTjfo9QghKHRbDvAsbpbhLG95ykbGEmT0ggWVMeCoNvy1n0Tj0TkKBXtgvX0Gmx7yoqMI1TRJYrWce3iYIYPeW9g6TYQeIl3sgCuPOWH7g6W6D8c/FuwuJNMCfd5Exkg/JlrJOJAWa1ReKRk5VHStqGMNU8l/1N9c7ogVJuc7rCHKcskvVUJdhvhHhHb3xmta9RIm/c2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(86362001)(478600001)(83380400001)(66946007)(2906002)(31696002)(31686004)(166002)(16576012)(316002)(966005)(8936002)(5660300002)(186003)(16526019)(53546011)(6486002)(52116002)(8676002)(66476007)(36756003)(33964004)(26005)(2616005)(956004)(44832011)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?OUkwZEh0Z1ZEd3F6eFZUWFNmRWk3ZHV4RU9UT3R5SkpkU3d1aktrMDBFQU1G?=
 =?utf-8?B?KzVMVG9pcUUxYUI4UExQOFJJaktGQ09QdE9FSS81UDQzRTNweUx5cUYwdGFU?=
 =?utf-8?B?R3FKZEhJcTR2VkE2U2hId0RHWHBNWnU0V0ZjRkFyVzFUYXJqS21qcFhITWkx?=
 =?utf-8?B?SkJ5K0QyaURvN25VWUZ4QlUrVGdyNGtQQVZ4aDMwaVFQZmp1a3Fpc2R5L3Nv?=
 =?utf-8?B?czIyUDFXQ3BIUTFKYXJSOHFqNDJYUTExdXYwWktBNittOGxjUW1jelZBVGQ3?=
 =?utf-8?B?ZytFMHdYVm1zYXpXZUhObVJvR0FuWEpYWGRlbWZma3ZRa1VndE5xUk8yQzVv?=
 =?utf-8?B?WEMrZXc5anpnSmU1cjJueXMxSVFRU0J0V1RYTHB1U3JHdFpxTEJwNlFSMEpO?=
 =?utf-8?B?Q3Q5VWFVbDhCMFZVeVQ3aXBUMTM5dy83TnNFMEM0Wjg1Vmh5ZjZMNWNjV2ZV?=
 =?utf-8?B?aXFrVnRaLzRFM1FEbWVKVDdsSnMxTE0vSFZvRUdLT0doVXF3Y0JSTStpK25L?=
 =?utf-8?B?SVJqMERyTUdNVzl6N0lDUmFpNXJYMFE1bnFHUG9MMUVKSWxsTEhCWmF4dmVq?=
 =?utf-8?B?L3NLVVlCM3pUNWZucXVJYjgyVllIUGl2cVY0akhOc1hnL2NMSUlmb3VPYmlw?=
 =?utf-8?B?V0locHAwZDJzTkxJNXBCSDE5R0FMcE5YRytTa1ZteFVWM1Q5dWZpb1lZc29n?=
 =?utf-8?B?RDJMT01qRjAwTW9abU83dmdrUTUvbXBNS09uUEZrSVk2eHlSVHJIWkN4blJJ?=
 =?utf-8?B?VVI2RDNGRkU3TUJXUWRmcGYzcnJzSTNLcUNNMWN5TUttcS93K0tLN1NDSmQ2?=
 =?utf-8?B?OTM5eDJwUEhacmpYTDF2cmxlSzZJYUIxY0pTZ1ZuOGQ5Ujh6ejFFTTcwM3Jz?=
 =?utf-8?B?WWJFKzVhZFFsb2lzWXZFVDlaNEpKNHljU1hxNEpmZUNUYXloRjhZRVpyNFdq?=
 =?utf-8?B?R0QvSk9TN3pQYytOdHo5S0ZINkFtNFRuenltYitVQjlyR1FYNWFXYTdMaE1J?=
 =?utf-8?B?S1JzWW55a2l2Qk5XckI5Z0Q4dW5yMmxhVUduTDZ6VFlncnBZcEJLdk1SaHpp?=
 =?utf-8?B?Y21SVGhrd0p6U1hyRFZsTnNtK0NvSDE0RC9KYi93MUgyOHA3QjNzVVdnSGtk?=
 =?utf-8?B?c2RsTGhBUS9oTUJ0ck1MK2plTjl2Q3hGR0p0aEtMZFZQOXdpRmk0MHFBcW1E?=
 =?utf-8?B?cVBXSkVMZ3FJbGFuZGtybE90cUhKbTd5RnJrSjZkNUl4VTVpMzhDN1k5SjlY?=
 =?utf-8?B?dk1JdnVzc1BBVDBSTzhTRXQ4U2JlcGZxTkdGR0VWL28zck1OTndNSUFBM0hJ?=
 =?utf-8?Q?LeR/e3r4pFSYt5xdmSORr1tcjXXuhbe2+/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 18:44:09.3446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1d9bb4-f0ba-488f-4192-08d8b8bc6104
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTykhPFvfVNZOd+e4ci/Lzh2HtKeYgxac30a1D4DVvvCOiTJOeSTF5Wa8dVz5mmkj5Oh+Wb7go0wpzhFMzJiqyi/CwEyga/nT73wscpQ7M0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
Content-Type: multipart/alternative;
 boundary="------------0F6E0075E0E7F74C081D54E7"
Content-Language: en-US

--------------0F6E0075E0E7F74C081D54E7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-13 9:26 a.m., Leon Anavi wrote:
> - Fix overflow in unpacking timestamp to datetime
> - Format markdown
> - Update readme
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-msgpack_1.0.0.bb => python3-msgpack_1.0.2.bb}     | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-msgpack_1.0.0.bb => python3-msgpack_1.0.2.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.0.2.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-msgpack_1.0.2.bb
> index d744738a2..989a7ae3f 100644
> --- a/meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-msgpack_1.0.2.bb
> @@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
>   PYPI_PACKAGE = "msgpack"
>   inherit pypi setuptools3 ptest
>   
> -SRC_URI[md5sum] = "c35ee8f991dad3969884e9585e56ebba"
> -SRC_URI[sha256sum] = "9534d5cc480d4aff720233411a1f765be90885750b07df772380b34c10ecb5c0"
> +SRC_URI[sha256sum] = "fae04496f5bc150eefad4e9571d1a76c55d021325dcd484ce45065ebbdd00984"
>   
>   RDEPENDS_${PN}_class-target += "\
>       ${PYTHON_PN}-io \
>
> 
>

--------------0F6E0075E0E7F74C081D54E7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-13 9:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210113142626.27599-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix overflow in unpacking timestamp to datetime
- Format markdown
- Update readme

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210113142626.27599-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-msgpack_1.0.0.bb =&gt; python3-msgpack_1.0.2.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.0.0.bb =&gt; python3-msgpack_1.0.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.0.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.0.2.bb
index d744738a2..989a7ae3f 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.0.2.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751">&quot;file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751&quot;</a>
 PYPI_PACKAGE = &quot;msgpack&quot;
 inherit pypi setuptools3 ptest
 
-SRC_URI[md5sum] = &quot;c35ee8f991dad3969884e9585e56ebba&quot;
-SRC_URI[sha256sum] = &quot;9534d5cc480d4aff720233411a1f765be90885750b07df772380b34c10ecb5c0&quot;
+SRC_URI[sha256sum] = &quot;fae04496f5bc150eefad4e9571d1a76c55d021325dcd484ce45065ebbdd00984&quot;
 
 RDEPENDS_${PN}_class-target += &quot;\
     ${PYTHON_PN}-io \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------0F6E0075E0E7F74C081D54E7--
