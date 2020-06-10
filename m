Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.54])
 by mx.groups.io with SMTP id smtpd.web11.2888.1591818808883326133
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=M8UqdSS4;
 spf=pass (domain: windriver.com, ip: 40.107.92.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tjvn2OabP8eaBffySfRiL9whzIsbDBRUVIy4zyrkQrczA2uGdmv5N0lMYLdjUO23R5mvwgDT2FvTEZdJ5A4pkbpPYOHiRM5acXZf8IT+VrzsvZv2SST0LCU2YB55evvctldjiynmmsc+ayKj4J9B4f2wWVeXFNBPR9v/G+yMLKYGLvAFC1rrEeSwIQ6t13gKsZd6Vuzwac+Nd3fRILpEIMBQarC3s/7Hv991rpHbSk2Cg4huu+5QyDJSEGWhfNBaG0tDXRATUv8RrOLAePMrqqDaAP9nKpSV4pBWl0AICVN4nlzLq2Z0jqPUSP9RIEHJoaluuDP5xNcyrwTudgkKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsUDqfVnxVRUkjAmmBHjjYKILr3sgFKoFckYkBQRTqQ=;
 b=cx7TL3XHPCcOrP6ylnr9EQX9+faZ5FXjAu7xCnqUlGlee8Y3pU3Tx88e+9H362jN5WOMFPL/96UHAdYb5hxMHKAKCbadzJwvOdLLJl0c3V9Q2085a55YcLqZch+4yrPnjJYINrCdQblek8gr1RKUnR4mXgWcCHmBbuiNEBm0ITp2C8CavG0FztqasztKNXnfe5Z9dPRiYrh+DDgQUVCN/N8FrakbvkBi6fX2NaQu+UlL0jcRilsCKZyRJmFldLf5JzwCHVtQK25a0+WCKlXpfw9IOQtI8cQbZLIHFTmzWXg67bBJfX9xqZFuhwZZsAGgerXhU57E3VB95t4w6MbTCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsUDqfVnxVRUkjAmmBHjjYKILr3sgFKoFckYkBQRTqQ=;
 b=M8UqdSS4jJH1WioSO3vAKMncJ+/RYHZrdc3c/4ugCwnly4TsJARKK8YnLNsdGyE2DOf6p0uv7AHkw73rscRy8RvdlmEwRcq0T3eX49Z1+co2pMcg5r5pgZ0f+FsQK/yiOQ0pxyRSR2akaGrXCgP0GXTnV5XwXfGzERIrygZmcE4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3924.namprd11.prod.outlook.com (2603:10b6:405:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 10 Jun
 2020 19:53:27 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:53:27 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-beautifulsoup4: Upgrade 4.8.2 -> 4.9.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609134311.13299-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d65a1e21-8413-29de-0742-ade991008540@windriver.com>
Date: Wed, 10 Jun 2020 15:53:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609134311.13299-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0101.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::10) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0101.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 19:53:26 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4328448d-759c-4b35-a90c-08d80d77f0ef
X-MS-TrafficTypeDiagnostic: BN6PR11MB3924:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3924CEC5C11EA6F81DCC8F839F830@BN6PR11MB3924.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qjVjpARFHTyfHK0tUeJqbYtAIYM2tEMYBCJTBcH7Q+fvtJPLXRz2yUTPC/ygdETieGpC196+zM6FNLEzWxh+P8ybYTc4XCXk84Vj8XevkdqKRCj9K+v1QUFwrhKspRu6CPh3QAyu2MJwlRL0er7NXninFbms0IsrdBoIfVGM1VZchod1VqumR8YhAvnkhHTJgx1UC+3GHWhsyE9piwnsY5W6L0VvuUAITeUfnnplXF4B5X+MiG6mzQdfYbrdT+DTEy5Pg+6OEB77LV2M69XVTclZwOaapok1N2wTJxIf9arqzB1zZd3BIYq4Q8ShZYAoKrt0mKHMyZp2SOkmOW8+9ann4d7FuQ0mcpcRzL3CK+m1Hxwt0xDN/tdLPcuO31bhEfqtaZkmIXl5VhAmEaRXK2xJWPE1dSshcuhNuE+se5JXMQfwR/NKepD3X/N1VsZWuq6l4xzsJGn3bj40o/iWnw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(39850400004)(136003)(366004)(376002)(316002)(6486002)(8936002)(16576012)(166002)(2616005)(956004)(31696002)(86362001)(31686004)(44832011)(83380400001)(966005)(66946007)(66556008)(5660300002)(53546011)(8676002)(16526019)(66476007)(36756003)(2906002)(478600001)(33964004)(186003)(52116002)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rzAcjwRGO7mspleT0uc2AnrdAHVMxGTIp3pTbbXQWMRS4L/DaOtTdG9SGEVEq/q7wIGDsfdAAtCCsBG8qjYshwUkzp38G1gdlrzsd+x5YEAmPaGNMW9LvONt/I1pBC4A/MnDovIEpoQI9Vvs4r+XT5aCxSj5JgLjoCbqFQYn6Kv0f+OJEFIekdXTMXekC7IY2KBHyKq3GnkHyzYu+qC93zj3KqJBmiThE+lru4SkdbEm062VQvoT9vTjOk9aC4rT/bnsUTmKArVDf+SYVBgDIlACWx8naCmLXxTPfPwMJs0GtlddihZnceRZQE7gvq/XqiRT9Qco5kYu0PVR3FRKlgsTI0YNHSbi6xnJPSxUyinJnYmJwrCmcHbTFh9Q7MljDYwexZAtPfzmy+JjsAHKA7d4Kh3t2o4VFYNuXoQJME+3zxeRfDdy78UjEEVelZRte2HlGCQn4lizdTYZLpkO4su4A1syeYz4ODu4vcnwOgRT4tW5bWTUmtynPLe2AdkV
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4328448d-759c-4b35-a90c-08d80d77f0ef
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:53:27.5658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECtdk3e0ocfr9kY3AH80Hr/HnE1gieVqVK2q18k0/SbO2/cx7Kn+zKYRQrW6Iamsz5WDWFqoW2bdOcAGY50IF1Yk35K0VJmZvWGssdCeDZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3924
Content-Type: multipart/alternative;
 boundary="------------F51C97B700D87B76FD62E83C"
Content-Language: en-US

--------------F51C97B700D87B76FD62E83C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 9:43 AM, Leon Anavi wrote:
> Upgrade to release 4.9.1.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...eautifulsoup4_4.8.2.bb => python3-beautifulsoup4_4.9.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.8.2.bb => python3-beautifulsoup4_4.9.1.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.2.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.2.bb
> rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb
> index 63fbd0958..910de12f8 100644
> --- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"
>   
> -SRC_URI[md5sum] = "5dbdb56c009e4632bae7bed1b385804b"
> -SRC_URI[sha256sum] = "05fd825eb01c290877657a56df4c6e4c311b3965bda790c613a3d6fb01a5462a"
> +SRC_URI[md5sum] = "57502b5b34ccfd97b180260071f5799a"
> +SRC_URI[sha256sum] = "73cc4d115b96f79c7d77c1c7f7a0a8d4c57860d1041df407dd1aae7f07a77fd7"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------F51C97B700D87B76FD62E83C
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
    <blockquote type="cite" cite="mid:20200609134311.13299-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.9.1.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200609134311.13299-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...eautifulsoup4_4.8.2.bb =&gt; python3-beautifulsoup4_4.9.1.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.8.2.bb =&gt; python3-beautifulsoup4_4.9.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.2.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.2.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb
index 63fbd0958..910de12f8 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.8.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.1.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://www.crummy.com/software/BeautifulSoup/bs4">&quot; https://www.crummy.com/software/BeautifulSoup/bs4&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1">&quot;file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1&quot;</a>
 
-SRC_URI[md5sum] = &quot;5dbdb56c009e4632bae7bed1b385804b&quot;
-SRC_URI[sha256sum] = &quot;05fd825eb01c290877657a56df4c6e4c311b3965bda790c613a3d6fb01a5462a&quot;
&#43;SRC_URI[md5sum] = &quot;57502b5b34ccfd97b180260071f5799a&quot;
&#43;SRC_URI[sha256sum] = &quot;73cc4d115b96f79c7d77c1c7f7a0a8d4c57860d1041df407dd1aae7f07a77fd7&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F51C97B700D87B76FD62E83C--
