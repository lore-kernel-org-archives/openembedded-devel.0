Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.48])
 by mx.groups.io with SMTP id smtpd.web12.8811.1591916683181583284
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 16:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=af5x7lym;
 spf=pass (domain: windriver.com, ip: 40.107.243.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpRbMyn4sIRYTrmFhtJiWVUC5gjyZOvqbn/EifjU2HMopVybDT/sriYANHl3/J6qd8co3KiUN5oa035OSlHGZyZ3Gaxu7RzL+L48DuPC/2o8QXGECGZH0VD0G0YtJN+8NuKonnFm6o0FE/HuucNk6QXinEOXvNZlfISJ6EuiIZanUhaHmV8Ojs8CN4bp2oM3oNMWgaooHkza6VgcI7ToSMoMOv9s9RBYWxEwbxIwHIp5ZZzB2k4oSpN7GPr7+EeuZ2l5AslSGTRlWvs27dSY7FkS5L0C2I0RPUNlh7YCZBkkZeFcOdiMcMQiUrhf+oHk3RqM94c68HKIfJeBLb3rJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRKMPapSRdkVG6XajU+KwR7yKrOjrC4XzbUs1hXhN+E=;
 b=MU/ejG4l3qar/UJXAqprEa1K34pX+JzsxZIGCAJLNeRCd0e/7bbP91q8h0SNvbHRz7CvQGCw6TOjMQcdsLtqwe1KSk2HQJEMwMywIb9/WVKnIkpJxjLLcPWaUpsgV6DmadSSWvthCX8of/djFwDvft5t3sRVZLqotDqhqaG5U2U35F49GJ+a0QZvY1NrWuS4MOYLmNlJ7B3ow3C+R8q5cPnE8laS2yZ5UqSD71MvH0rgjtmDTrfjQq2boYTsLbca1qswwjPCegCP2FS57+ZFsevJXlMEEgI5lOQ4+ZBAR2pNjvVvq+OeLQC3XmCowoNz5Ey2rJ8H1/DXCS0pNXeC8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRKMPapSRdkVG6XajU+KwR7yKrOjrC4XzbUs1hXhN+E=;
 b=af5x7lymU87lMsLvyhF77gczDPTQ3V0UQMqf4V0P2+AbvkReG1RqA1Mj4FYZT23Fh07UmVf3N+M8vam7NwzmTgCT6oA4+u8MByTRi/dk5RvqYZ3HuXBuwMABUZmnqU9zh8ZJ+0aIhdrPbCaPOQHMImqa4GCph3rHg7yORHP7s20=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3955.namprd11.prod.outlook.com (2603:10b6:405:82::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Thu, 11 Jun
 2020 23:04:42 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 23:04:42 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-pocketsphinx: 0.1.0 -> 0.1.15
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200611090904.29772-1-leon.anavi@konsulko.com>
 <20200611090904.29772-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <cb8f0e1d-4ac3-1cd0-1d0e-772f268cd0c3@windriver.com>
Date: Thu, 11 Jun 2020 19:04:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200611090904.29772-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::32)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Thu, 11 Jun 2020 23:04:41 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dabc8416-c70d-4cdf-934f-08d80e5bd308
X-MS-TrafficTypeDiagnostic: BN6PR11MB3955:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB39557FE3C8BAD3234F2917CB9F800@BN6PR11MB3955.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:277;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LUbQHR554i20Yw1liW08mxpjoz8Qxo8vPbe9N8aFVFoSI0BCgFVj3eINbgWehi/lkmtzwaKH9kHjLzHt60xbUL98pDFQnPbns4cY0JWEihQr6aFyE30dbzX62yoeylkKnaTdbrw7NeWovwspYkpQu0Ar9SmRp8UJqCHOgGyhKFWNqRuYOvj6cX7fY2PyDx4GND7NhN3XyolYH243M2ss6f4gf4bc3PHtNBGhJUeTY9gmRjkmZe1ddnTKWo/IDYSGGSiSGHlwdGK2q0qMRJlp2+PncYclcHOoF7ggsQdV5m6S7ZE3apwxGBRv9aPGvTq8ts+e+ZurUrQQ33qZ2Y6AuSYGY+XefEnJaPcczbZGw6bgn3Ua6j3mEH4sFg1CVy7ZSWTQqX7qr20396u1I1Uj1lv32qbt5YYwQ0ET+4dAIVXAZ5NUS8gfY1Tf13Fk8syMutSEaSFy2H8wbdR3RtbOLw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(39850400004)(376002)(346002)(366004)(66946007)(2616005)(36756003)(66556008)(66476007)(44832011)(956004)(316002)(83380400001)(31696002)(166002)(16526019)(5660300002)(26005)(52116002)(2906002)(16576012)(33964004)(186003)(53546011)(86362001)(966005)(8676002)(8936002)(31686004)(6486002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	VNCG5ZN2WNP8UfurvWDr8xlW5t22UgOmayYrh/paM02s9I+jrBndW4RCzHoBbTasCrFYa7srcnTv3zlHQOcVl4melJGld7hcad5xVZoieSQ6h334LStI5Z1JRiGd8kb5ep4BfzeRoHPsyd3NWcv8QA414q2lhOenrUNQp7VC2d5zvHgTD0zgL+0SXTFVTNwGHKQcHx779SDPYEes5upmY3kOZMOoQUW+gYd+pD0BjJpKD1CDkp2fq5yvT7YBGyai4Tstf5FZeXcBNdb/bsCgC3KC3Xvz6ozZjEWpc7czpY4JgdTb3TF4WDfm4BukH+XHrUlAxA5/mBdl690DUls8cK/tSEFOUzpCWFdnF4QrVkBmx81T2f6ELLQsKzTZsDqaWonoWulqINsOEPeXff6lwrufIn/DBomKWu+sEeEa4O8s5qmMKNaW0zydncDguIRHDK9IrXi6NB2+HV/WIwqG31yGcnYhieMe6YNEhdMxAKljwTU/464T7iQvU9EWzMxq
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dabc8416-c70d-4cdf-934f-08d80e5bd308
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 23:04:41.9801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlDaSAP0Dy2aO/1liyCm/oJ2mkgd9oEe/xXxuxn9pQNgAvc+nAC0n1A8M3zewq19ozJhtSuT2pb/QXM1leA4HRs4yH6+MoZBO+digVRODzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3955
Content-Type: multipart/alternative;
 boundary="------------34F61FCB6A42C2F6765E3176"
Content-Language: en-US

--------------34F61FCB6A42C2F6765E3176
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/11/20 5:09 AM, Leon Anavi wrote:
> Add pulseaudio as a dependency and required distro feature because
> libsphinxad requires it. Upgrade to release 0.1.15:
>
> - Add all travis osx
> - Remove bdist_egg and bdist_msi
> - Bug fixes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ocketsphinx_0.1.0.bb => python3-pocketsphinx_0.1.15.bb} | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pocketsphinx_0.1.0.bb => python3-pocketsphinx_0.1.15.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
> index cb22040df..5aa0eb6bc 100644
> --- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
> @@ -5,9 +5,10 @@ SECTION = "devel/python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72"
>   
> -SRC_URI[md5sum] = "c0f2bfd54bc4c438c3bb64825f57d575"
> -SRC_URI[sha256sum] = "2cc493ed48c1301e0d2e69b137dc646c2f8caca190ef4bce61836eac96d1796f"
> +SRC_URI[md5sum] = "94d008eebea16acb60a9ffe614575dee"
> +SRC_URI[sha256sum] = "34d290745c7dbe6fa2cac9815b5c19d10f393e528ecd70e779c21ebc448f9b63"
>   
>   inherit pypi setuptools3
>   
> -DEPENDS += "swig-native"
> +DEPENDS += "swig-native pulseaudio"
> +REQUIRED_DISTRO_FEATURES += "pulseaudio"
>
> 

--------------34F61FCB6A42C2F6765E3176
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/11/20 5:09 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200611090904.29772-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Add pulseaudio as a dependency and required distro feature because
libsphinxad requires it. Upgrade to release 0.1.15:

- Add all travis osx
- Remove bdist_egg and bdist_msi
- Bug fixes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200611090904.29772-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ocketsphinx_0.1.0.bb =&gt; python3-pocketsphinx_0.1.15.bb} | 7 &#43;&#43;&#43;&#43;---
 1 file changed, 4 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pocketsphinx_0.1.0.bb =&gt; python3-pocketsphinx_0.1.15.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
index cb22040df..5aa0eb6bc 100644
--- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
@@ -5,9 &#43;5,10 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72">&quot;file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72&quot;</a>
 
-SRC_URI[md5sum] = &quot;c0f2bfd54bc4c438c3bb64825f57d575&quot;
-SRC_URI[sha256sum] = &quot;2cc493ed48c1301e0d2e69b137dc646c2f8caca190ef4bce61836eac96d1796f&quot;
&#43;SRC_URI[md5sum] = &quot;94d008eebea16acb60a9ffe614575dee&quot;
&#43;SRC_URI[sha256sum] = &quot;34d290745c7dbe6fa2cac9815b5c19d10f393e528ecd70e779c21ebc448f9b63&quot;
 
 inherit pypi setuptools3
 
-DEPENDS &#43;= &quot;swig-native&quot;
&#43;DEPENDS &#43;= &quot;swig-native pulseaudio&quot;
&#43;REQUIRED_DISTRO_FEATURES &#43;= &quot;pulseaudio&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------34F61FCB6A42C2F6765E3176--
