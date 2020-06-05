Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.84])
 by mx.groups.io with SMTP id smtpd.web10.129.1591377863495767103
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 10:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WMltT4VL;
 spf=pass (domain: windriver.com, ip: 40.107.92.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/GdbGqdvbSR5ndgkbUkgDBqN7m1L+qgPampOLNLXjcXuuWWBUUGz5TJ7IGjS6JBMI9H1snHfyqYZ2SahbmbkpfA+PcwcwNNCwHUY1rk2pbnqgXsO18hEAU4AJQmcs2PAT1+RQgNGs+BGzEyh4SfoDmTua/wjgVU5M1i7u3wcSUrVQpLDo4K/nc5AhdZl3Bm04+UXwVenMzvPM7+hDRpxcrNW9n1pESwAOBGzCbR+0bUIEZ0gfw7pir/O/YTRN5lcuRuJ+IPOhS8vRZ1IR/MDfLuml2iUYT3FYEbLimc2Kbn/Apj1gyqLr7jimM2OlfdIyjyoEyjDd35emGudCOrcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ghos3+MoTjNaWklS1VUk9XNqgfA5Lcmp+/MkBA38OI=;
 b=fo9Tb8J/NR3hGOwQRTBQm1BtpzEN2rmCUR7ezhrKojbfQTTfc6YEWCrVn8jmSuxeNj/ObewgjcqrjyqS7+7XTT+HS/iXmR1vSmaMGFUP6JqguB0TJ5MybpaNxiqWXwAEEKAdzPsifQfhJ+4Apj0YMsuIVR1xPh9GNoaCCKX2Bd46ni2Ll3L47Wh5b9N39TQlGekFPA+HIV5qHAqrb0i7RyYs6AX/hd7RUhS126Of8Zjhgmk8+rEj8Jab/yk2ZSif/CIDHPxoOaJZek9JEkR608aMjjSXG1BlJSP6K5e8RrRU0VmcjbQ7+/mEIRmT8eachR94HKZ7h7NG9ReLDQLERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ghos3+MoTjNaWklS1VUk9XNqgfA5Lcmp+/MkBA38OI=;
 b=WMltT4VLVCjx8T/OOc9vYJjfxB1Ww/WwQ/O8xTYMZvxiQ95jTeLsNvcuaIihJt8IcUDUzsOlywKJBLx2M2mRlObLXABuBvBRMmSew1WEjLaZ/afatk7ii4G1dYQ0iNAWGp5QYYPmrSSF+XcjLtuA7R2LNQzhWVwev6wJtokyc7k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1908.namprd11.prod.outlook.com (2603:10b6:404:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 17:24:22 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 17:24:22 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-pycodestyle: upgrade 2.5.0 -> 2.6.0
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1591188793-15698-1-git-send-email-wangmy@cn.fujitsu.com>
 <1591188793-15698-4-git-send-email-wangmy@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9bd01372-4237-7929-3d28-d02822891b2b@windriver.com>
Date: Fri, 5 Jun 2020 13:24:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1591188793-15698-4-git-send-email-wangmy@cn.fujitsu.com>
X-ClientProxiedBy: YTXPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::42) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 17:24:21 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1828519-4314-40d9-8a77-08d80975497e
X-MS-TrafficTypeDiagnostic: BN6PR11MB1908:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB19084FAE5FB907C04D8AF4649F860@BN6PR11MB1908.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2Az+RI2tQgFV5eOi6LuYXyJVjaUyyUyWTbD8dO0YsBRMXf0zrAn1dm8qhtW38NRQHZC7ZPU1slC4css/8wTomYpVzrfaSdrR8uIZ3q0/76MMSMfMT5oF7Zf6nNDLJcsfWFedCUbcekmI83aqtz1lzoMvjRGKhjRMXDsUDWL6SBX68fycb+GoPfeAXoAt31AzuG9ufmV6JT8fMinJfsASx31w0rR1T0f1/OoVV1UrPxZzfl4BuxMyf4jlN1VqENSMhJ7hv41fzIRtRoM71tfr8iaiOfMi3tOn6S2WfHYwDniw6AsuXe6eV8H1NAa+2l4byyNkZbsoRfPAWejiLdHGSkszhXqbQ/ndaBVBAMcyp1KomQLeWwU4m7osidIkhkJeFWfQvbIwdtIcOjhfSSZn/LUWzOT6tGbg/ynjKph6s0UafROSiygpkkHuubrWWL+n0k2FvV97bWiJVm8nMEkaIA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(39850400004)(396003)(366004)(44832011)(8676002)(31686004)(53546011)(2616005)(66476007)(66556008)(186003)(16526019)(956004)(66946007)(2906002)(16576012)(26005)(36756003)(316002)(33964004)(31696002)(966005)(478600001)(8936002)(5660300002)(52116002)(166002)(6486002)(83380400001)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Gm5qDVSNS8u9jo8odO3OGGZBATE4t2WdKDV3qwtgK7hxKGbF2dXKFo7CcKGv1+e/ufJKTRM2FMRPEg598SxBMIhp0GAKo7BJQvVIDrY/7lgLmZvVQEy5z3YbmcDzdYzKnK1N9GpGsXCqmNQyx/fLHTiTQmJIiDf7ZBZVZVzdd6Fmre6y7M5kcFum8krjzC1jkGNc3fH8fXSaprG7K5okXhaW2nzZVK5aq2sk2wd5g+G9Lac1RulLkYgUX5uKH7uLYxTcnaULMPuas1S/dA70G+3gQGTuAsgzQYHz8QvXymMq9w31jzW0KU1EPdiVMA4PwYm8Iq0mXI8CSp5NawjLNETpIpmuZ5E/X/PXHXUIu6y3JQZUcSqOOOMH43HVoDJBEd9nhLvpboRsPS/SIcWlWsIfC4qFJXHcgspdt+uHnoN0tztg9c1lSSH4vgYEVo1paZua/NyiRZS7t54910qTD8u5JE9yV3py5SUMMqBBDHs=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1828519-4314-40d9-8a77-08d80975497e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 17:24:22.3817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LNPxlMPj1QsdT/Rwt0g3in68lljn2IUIiz2ucd23vf7F3uHuOpBcQ65ttIdV92R02tJDFD9zmoDcoI5IIJy/Uz8G6DdC0dLSoCrlRt1vxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1908
Content-Type: multipart/alternative;
 boundary="------------918ED82FD4AD27291D6F48E6"
Content-Language: en-US

--------------918ED82FD4AD27291D6F48E6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/3/20 8:53 AM, Wang Mingyu wrote:
> -License-Update: Copyright year updated to 2020.
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-pycodestyle_2.5.0.bb => python3-pycodestyle_2.6.0.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.5.0.bb => python3-pycodestyle_2.6.0.bb} (50%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb
> similarity index 50%
> rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb
> index 7f00ab629..4ad1f5493 100644
> --- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb
> @@ -2,10 +2,10 @@ SUMMARY = "Python style guide checker (formly called pep8)"
>   HOMEPAGE = "https://pypi.org/project/pycodestyle"
>   LICENSE = "MIT"
>   SECTION = "devel/python"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=01831ddbaf398471da3cc87f5037e822"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
>   
> -SRC_URI[md5sum] = "40e7a76f364a18f531aaba11a4476e21"
> -SRC_URI[sha256sum] = "e40a936c9a450ad81df37f549d676d127b1b66000a6c500caa2b085bc0ca976c"
> +SRC_URI[md5sum] = "e2fcdace728267d5fa3aa98e08ee40db"
> +SRC_URI[sha256sum] = "c58a7d2815e0e8d7972bf1803331fb0152f867bd89adf8a01dfd55085434192e"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------918ED82FD4AD27291D6F48E6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/3/20 8:53 AM, Wang Mingyu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1591188793-15698-4-git-send-email-wangmy@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">-License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@cn.fujitsu.com">&lt;wangmy@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1591188793-15698-4-git-send-email-wangmy@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-pycodestyle_2.5.0.bb =&gt; python3-pycodestyle_2.6.0.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.5.0.bb =&gt; python3-pycodestyle_2.6.0.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb
index 7f00ab629..4ad1f5493 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.5.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pycodestyle_2.6.0.bb
@@ -2,10 &#43;2,10 @@ SUMMARY = &quot;Python style guide checker (formly called pep8)&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/pycodestyle">&quot;https://pypi.org/project/pycodestyle&quot;</a>
 LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=01831ddbaf398471da3cc87f5037e822">&quot;file://LICENSE;md5=01831ddbaf398471da3cc87f5037e822&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd">&quot;file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd&quot;</a>
 
-SRC_URI[md5sum] = &quot;40e7a76f364a18f531aaba11a4476e21&quot;
-SRC_URI[sha256sum] = &quot;e40a936c9a450ad81df37f549d676d127b1b66000a6c500caa2b085bc0ca976c&quot;
&#43;SRC_URI[md5sum] = &quot;e2fcdace728267d5fa3aa98e08ee40db&quot;
&#43;SRC_URI[sha256sum] = &quot;c58a7d2815e0e8d7972bf1803331fb0152f867bd89adf8a01dfd55085434192e&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------918ED82FD4AD27291D6F48E6--
