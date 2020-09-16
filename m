Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.60])
 by mx.groups.io with SMTP id smtpd.web11.22403.1600263430815684906
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eRRFqLCx;
 spf=pass (domain: windriver.com, ip: 40.107.243.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJX5falrP56+bW4uDux5xOVfNVS8Y/Ju4HoliI2hfami8orXh8TBdTPjjK0AIYCYyrtqE9InLVR4t7DXaDCZp48zgVlqeZOuwZetDrVCeikzWNgMsPQyoz6EHjZ1jZP7phFMK9NmXPvQ+eM/ofYNeu69z6XF9HRj74UrClyqT9exNiY1/ZE5jHCT6xLGObj8DS1ad72a2cLzH55vcwnNE3HRDdZJyPKHwYhpSL8NrLjSHKgCNnCzI797UI/UgCpqFiUjxFVYeCUT0lJHEMj7ybksqd3rZQo+g/va80/2qCt5eNdGKjsLNaCxBczW/AtDHijA/WiOJhSh365y7MoFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Q+YlMTXrzUzF+KzI5br/65sd2t213leJmTj7nK+D5Y=;
 b=nSQv/OwCLJG9GLfadtc22Xu8CnabTadWDaTZl/BuN4VrbiX2gWympLGh+Tt+Vgt2pdo1AiWewwuvEvNjmprrDXoCD9y+nVzQ3giIgEBl5+TafDUvLanQrAhuCGa9DqoqEoebBzkRxkx5G7jPR4Vr8bHpbuJBCqiUj54Hl77LfYqVcPSbHX1sHHKoNcrjWfOhFW6Ueo4SK4PIeVn8Jy3UhaI8II3swWERjh55RXnWIs60UfWqpXR2ndTVZTb2lt1BCqnNvVlI2MqBJoNhK1ZWG2jvnbb8zK6TQ6+21DyDq8jOA7bW/lsN7o6yZ/1mOXo+jhBewDpASHrY2BGrWKJd3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Q+YlMTXrzUzF+KzI5br/65sd2t213leJmTj7nK+D5Y=;
 b=eRRFqLCxxBVMhXtcBTIbiXGmJN2tmMv+0Q2gn9WuMSlmwhbTznNGMsY03lePSZoeMHHHsXgP73ZXi78vSkrqxgE9OQVskvAm67Uj6u0eb2VmBT545cJ8jNfpdAWVGhlvC48RWKS3727WmY/5ihsFmEVD8djDUQWNsb11n5zPWTs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4306.namprd11.prod.outlook.com (2603:10b6:a03:1bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Wed, 16 Sep
 2020 13:37:09 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 13:37:09 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-pymisp: Upgrade 2.4.130 -> 2.4.131
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
 <20200915090303.14367-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e4dbb980-01b1-ccce-a93f-22daeb0734b6@windriver.com>
Date: Wed, 16 Sep 2020 09:37:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915090303.14367-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0092.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Wed, 16 Sep 2020 13:37:08 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e50aedc-06b8-465a-824a-08d85a459c1f
X-MS-TrafficTypeDiagnostic: BY5PR11MB4306:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4306D82FE5D287F6E3ABEF239F210@BY5PR11MB4306.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R0H4KsTVqsr5NN54zNfCne2i2FO6Do1aN3LsX94PbqONqlVaYlp32M/U7SXJ90+9QL5oPt3nll4KtVRcgQqxyObfC/UcLOJFfKlyqa18uY8K2kBLioGyK5CZWO6zIK5rxFxyj5C9GhAsSzObOHg+HERZTEhkC4EVjkWxKSoZ6JXshSNbegzmetNQ1rHNnsSyrBOgz0UkCf4UP69aWMy4esmqvw8KSOHwLijcJgHW2cJr/p/K0q7bYqCFdJCfT9vYQqnZnIHHkUhiAAeKvbg1pskzZOcdO9WcsQv7JmPYIVtBgO+4cys+1ZjDI98W0hxNNV8uA4MtqSDN18d++ObE3TAGhpFFmzIOn5SsAQDh++ItOOjfJ71UubItDJUNLAeidTztO+uZcsCEejba9bcR2sWPIeR6RAMAgczZ6y4GIyJVU2s8RYqXubhykWTE33SDZUY2AE+Y7Kg3YqtOt/ajTA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(396003)(366004)(136003)(376002)(346002)(83380400001)(956004)(8676002)(5660300002)(2616005)(966005)(53546011)(478600001)(26005)(44832011)(166002)(8936002)(316002)(31686004)(6486002)(86362001)(31696002)(16526019)(66476007)(186003)(52116002)(33964004)(2906002)(66556008)(66946007)(16576012)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	G/O10rqx/oae9DHUTQDyvYPlxskPqpJorsBHQnV/rnteqy8iMqNNvXQHQ7DiUWuGvxj5b3kZvCmQF6wJnQHaUfRSebqZ4/f4TR13cNenEmI3K3rO5ill7hPkXftxyuoViklDzSU5qKYW8FI59wcn9JfhdljHvxJ8tdAXn3hy8RtpqUYvbPxtUhM8sUlQ6lBkA4zqicio9DpxgKUpQDDygGDKMV8BbR0Y+TLc/293poVguj9c09Ekirv0PfNoSqkOlqtUm+YJl0vv75gdSKEGNU7M/QgOK2NgQpCzBdgKDdwTpTSv1V2+h9xq+sEvfprM1qyM0Fq/blbFfrmRkn71lKEtiJtUhr/jB1UbsRLXv89x7pz+hv7vRGyIqrVfuxqVYrzafqGouVV/Ka0MSry446RuFXdQbZU8mo1ohQfagEk2cYYtayJ/pYaO6vTHTfhqNZa2UK7HNrCOQoCqpUjbMYT7Fc+iTZ/TFAquMHqKT5WrOAVQLQme8tKqZ2JfMgSTfZbOrMk/lcBkX4ocyJ9fSTTwE+VnWPXKk4SiRInrFoqjpV+FMwsuCXvC7ISY5xHA0jrwQitNSnYZHAeSbSGx6M6IWs8NSpVKa5aFIdYyUFpBbDcJMZIMsVYd6+arH5NLBdGGX1iLEX6AEPtvAVg8Fw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e50aedc-06b8-465a-824a-08d85a459c1f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 13:37:09.4387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHI28FdxobKlMwE23f2yrq/tS5TTIlh4yxH092OsT5ogaVSro9nbhONpjJ9W0sBN0XWh9Kcs9LVTPJbpr5FxKnKRNVqvUxwsNozkqDzaumg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4306
Content-Type: multipart/alternative;
 boundary="------------FF7747D1FA5AD02B791BE8ED"
Content-Language: en-US

--------------FF7747D1FA5AD02B791BE8ED
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/15/20 5:02 AM, Leon Anavi wrote:
> Upgrade to release 2.4.131:
>
> - [test] Validate tag removal.
> - [describeTypes] updated and sha3 added.
> - Bump version, file template version objects and dependencies.
> - Rename blacklist -> blocklist.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pymisp_2.4.130.bb => python3-pymisp_2.4.131.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.130.bb => python3-pymisp_2.4.131.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb
> rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb
> index 2e9259466..82ab80314 100644
> --- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
>   
> -SRC_URI[md5sum] = "be91a479c689857617fbfc7ce919e291"
> -SRC_URI[sha256sum] = "2610bfb5cb942e882c247b468769a6f68817b5a413358c381f73ba91d01edaf6"
> +SRC_URI[md5sum] = "8844204f8b059ff2fc508ba9ac07dcb2"
> +SRC_URI[sha256sum] = "59adb7ee95bfb1b5c35abbc01b5372df7327baea4a8df9efe30140ea64b73c18"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------FF7747D1FA5AD02B791BE8ED
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/15/20 5:02 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200915090303.14367-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.4.131:

- [test] Validate tag removal.
- [describeTypes] updated and sha3 added.
- Bump version, file template version objects and dependencies.
- Rename blacklist -&gt; blocklist.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200915090303.14367-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pymisp_2.4.130.bb =&gt; python3-pymisp_2.4.131.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.130.bb =&gt; python3-pymisp_2.4.131.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb
index 2e9259466..82ab80314 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.130.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/MISP/PyMISP">&quot;https://github.com/MISP/PyMISP&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20">&quot;file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20&quot;</a>
 
-SRC_URI[md5sum] = &quot;be91a479c689857617fbfc7ce919e291&quot;
-SRC_URI[sha256sum] = &quot;2610bfb5cb942e882c247b468769a6f68817b5a413358c381f73ba91d01edaf6&quot;
+SRC_URI[md5sum] = &quot;8844204f8b059ff2fc508ba9ac07dcb2&quot;
+SRC_URI[sha256sum] = &quot;59adb7ee95bfb1b5c35abbc01b5372df7327baea4a8df9efe30140ea64b73c18&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------FF7747D1FA5AD02B791BE8ED--
