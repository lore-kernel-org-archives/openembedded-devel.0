Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.68])
 by mx.groups.io with SMTP id smtpd.web12.7246.1591881839859292540
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 06:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=C3/tgZCb;
 spf=pass (domain: windriver.com, ip: 40.107.223.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRgvmoxEEcQdycSp2fJS5g6roY/BjZlpA+cNRaBmpOZVKjbeR+fLsZQJ/IJUwrrtGyAitJz2qZxFhMpSbDwcCgH9vtB9zefn9cMpbN0jDpQG2CUed2dGevlQ6yghLhca4lQZmduXCfsfgnk7tK2ZPuEHKxCqTA1RV9WaJYA2zY4VuMn4uiS9z0ZY+4eambrjmqYcb+Z689CMTCf28MrWhSH6BmjHUO0PJGnclgRdp6egZIcMosGsP554MhA2lPI4Iqk6zf28xpLF+TeQV12S8Ncxr8cmbZp6HDbkTyM5K0SqsBUzJqYendNiht0QJt7UIW0xtvYp+PnkImFKinGpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38JMFcTCNFkvVqHiEroBGaBpp7VLEXOXN2QgYq+4w7M=;
 b=obJyZCgXnrxymbbINFpcHqEv8vXZgn1cfdnMojiBbBcuyTRDHFy9THl3xyMzJV8wxMNI/Y7KuDec8+78tE2KtIfQevkEFtdD8Ss4/pfL36Kta9HOUufLE5qqPqF4pm0GSxPfgLmeExV3zgOCPNNzE/j6TYsTNncUcl3PQUYSJbov3Uktu+vqkkPPPd7SPyYmUQd9YgkLeryfaY20Jf87q4p09/eqW6FlyxuHhAwvfuX5vMjgVpJHbSxcnj/BDT7IeK8MSCfPXtZGYN+FB4Th7v+GehyXk5+8uvI5ot3CyfxMXzWpFXYEbZZN6n2aTeC3grtdOlPqULy3vreI9ShOOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38JMFcTCNFkvVqHiEroBGaBpp7VLEXOXN2QgYq+4w7M=;
 b=C3/tgZCbS7k5q+2SlS/XceVAV2KnohaVkR1XNM1rWBDijseUwY6vnLEUp3gY6hxIyHSEWH8MH4GO5+eL0YJAxDy8Q1qTfOK80P/6N3ri0mefU/2vSwl2RkdZamixqLXXyr819IRqoNYipH7o0HcaA+rbhxQUvpCG8CV5mQ8dY7k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR1101MB2068.namprd11.prod.outlook.com (2603:10b6:405:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 13:23:58 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 13:23:58 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-multidict: Upgrade 4.7.5 -> 4.7.6
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200610131536.31426-1-leon.anavi@konsulko.com>
 <20200610131536.31426-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f1c25920-64c2-6717-15ea-ed1f9e33565b@windriver.com>
Date: Thu, 11 Jun 2020 09:23:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200610131536.31426-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0079.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::18) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0079.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 13:23:58 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21b83bf4-eb70-43d5-1f63-08d80e0ab2d7
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2068:
X-Microsoft-Antispam-PRVS: 
	<BN6PR1101MB20684A6E03F9F3AD2A982F889F800@BN6PR1101MB2068.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UihfTtZMvdT7pbh8MfeNpuXUruL8DZ2rzjki4dvD8BwSRLorMQGBIZOEnxxvVwBkChtK18Bxl7zVC9Poa7HnsWNRDRP7Jjw7IU682NYcdcoiX3rbcwW7dS8NIbD6t3sZq8Bx58a3xVODUMWxsqfHNon2t2WOhBJ/RPeyL3uoBOOP8CkFyeMslOPDSuDYAxY7tBl2mkxKhoGaFKyx1OHuSkXFhgho9bNfSfnRqxMPsqmoWLwkroyYHa4GNgpLVL885dIEy+4CQaVYPCCE4cR7lbt0VAFduRQz2yVbb1BVz6LlBko91lFnElu5y3HIk7dvSMV+0GtaMFFPF/KtuzV+D45riPsPi54SQ4UYnQZ0/BHQ5SaqCjUIQr9Ai1cxMFVjHrnquDA5gXG5OPHjuI0mpZaCQiNi9nxzxwU5/tKx+hZ6eRVyCgVBTuCWV83m9+uV8NrtWtIy/1kLMBDBQGIRdA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(366004)(39850400004)(396003)(52116002)(5660300002)(166002)(66556008)(26005)(66476007)(86362001)(66946007)(36756003)(31696002)(53546011)(44832011)(83380400001)(186003)(8676002)(956004)(16576012)(478600001)(33964004)(316002)(6486002)(2616005)(31686004)(8936002)(966005)(2906002)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	gcQyZhEg5/j9Fk8MdR9XDz0Nxo5HALpZelPxBVDTEB/ZjBOXs4e8S3DsEmokq5UQfHwK80jrWSdk+DSEOKCOVAgiDoxxo7duO74Pvg3sDESQ9dY075XgGvQEi3JRf9rPoOnXto8yAsR4EH/tguDejCmNXebLg2WmFB+W17XcshR1aD2y8B3INJzyfoMeUBuxSlOIcvIyAPd8S7r7Kudgx88qboN/nhYUZux6i3sHwpf+1sbLdu3QTTbrGm4Y5KiIq4eHv3EAt92w6qCAxX7304GKNZdGOwraZMjQu6ITAd8U5OskKk0Xj1v/aaJmvNlzZkEYQMVCwrZrndGWTJotV9/QdEij7AD3ymXM/kRBelNR0Wi7OcrXxFOXdxNINpvvzAzHWDuOY4ziLHiZ0QKJxtIbP2cjQ1PHxe62suur/kjnxvUP7n7YLyCJEL83CGLv56O5E3eOx00jpEJm3xH1oBAcrsY9ZuebVIWNY3nM/fkXsfIuWkHeOnUX2jx8y9Ec
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b83bf4-eb70-43d5-1f63-08d80e0ab2d7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 13:23:58.7748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcKH34dEbGHLYbfEBELNlPgGzF8O2mTmjbKfD0tIj3u4v96nuH1xRppXyG+D8KigrYC5wJ9tmVBi4FFINeH/sDYOzbhFWMyjeffLejwp1K8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2068
Content-Type: multipart/alternative;
 boundary="------------A7873AE24410827A00F727F9"
Content-Language: en-US

--------------A7873AE24410827A00F727F9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/10/20 9:15 AM, Leon Anavi wrote:
> Upgrade to release 4.7.6 which include the following bug fixes:
>
> * Fixed an issue with some versions of the wheel dist failing
>    because of being unable to detect the license file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-multidict_4.7.5.bb => python3-multidict_4.7.6.bb} | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-multidict_4.7.5.bb => python3-multidict_4.7.6.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-multidict_4.7.5.bb b/meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-multidict_4.7.5.bb
> rename to meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb
> index 30e10c251..02c541b4c 100644
> --- a/meta-python/recipes-devtools/python/python3-multidict_4.7.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb
> @@ -4,7 +4,8 @@ HOMEPAGE = "https://github.com/aio-libs/multidict/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
>   
> -SRC_URI[sha256sum] = "aee283c49601fa4c13adc64c09c978838a7e812f85377ae130a24d7198c0331e"
> +SRC_URI[md5sum] = "40b6ca77171ac8af55f7aa60049f3cdf"
> +SRC_URI[sha256sum] = "fbb77a75e529021e7c4a8d4e823d88ef4d23674a202be4f5addffc72cbb91430"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------A7873AE24410827A00F727F9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/10/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200610131536.31426-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.7.6 which include the following bug fixes:

* Fixed an issue with some versions of the wheel dist failing
  because of being unable to detect the license file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200610131536.31426-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-multidict_4.7.5.bb =&gt; python3-multidict_4.7.6.bb} | 3 &#43;&#43;-
 1 file changed, 2 insertions(&#43;), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_4.7.5.bb =&gt; python3-multidict_4.7.6.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_4.7.5.bb b/meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-multidict_4.7.5.bb
rename to meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb
index 30e10c251..02c541b4c 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_4.7.5.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb
@@ -4,7 &#43;4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/aio-libs/multidict/">&quot;https://github.com/aio-libs/multidict/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a">&quot;file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a&quot;</a>
 
-SRC_URI[sha256sum] = &quot;aee283c49601fa4c13adc64c09c978838a7e812f85377ae130a24d7198c0331e&quot;
&#43;SRC_URI[md5sum] = &quot;40b6ca77171ac8af55f7aa60049f3cdf&quot;
&#43;SRC_URI[sha256sum] = &quot;fbb77a75e529021e7c4a8d4e823d88ef4d23674a202be4f5addffc72cbb91430&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------A7873AE24410827A00F727F9--
