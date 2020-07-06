Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.60])
 by mx.groups.io with SMTP id smtpd.web10.60495.1594050061297054998
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Stl8fZV6;
 spf=pass (domain: windriver.com, ip: 40.107.69.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3ZcbQzRtrPhpjZO2tiP0NA02pP6x10GPALCMqClzKwLhvkjt88HAw6VAPbYws3upzqQKUmU+rOLj9tPe8fv2e8sbR5zTPILHunfSZm1kMcKbWs+BfetZ73ZUfSpGbUmAf4OEOUFJ8Ue/ZUL7hnWgSTcCuSykHdCpXJSapgJJPPxTvpYPCG7ur6KgFsPt6gWX3Ku2O1dvScoLH4FNxgQ3B/CPMlO0RC/Glg547ik14nFFXPXf66myj/6OKczlnBO6ahZWWbkPbMrM6/9w8cSLexiRYiTwctmy4DWCMVl4gh9rtXmkIrM5nweGDGL5rg1pDh3OsATjg4kW6f/IeVLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htmX7uS8Nr+waUyVNlbPspU7wUQMX00JLut0+oHkFYk=;
 b=ofeyaCJYyxqBnQrEfs5c4V22pbt19g6P2hHcUZyQafbqqZoEUj3tmWVPcsGp3KhQQ8DlIbLglcgJ3mzlnCO/i+ZCmeVA13+XK27aT7Yhx1DMgQpLhpihMHdIMho99u9BzduoWr3bPuC03beZ0TeWKnn7hfgEGquVfzOJ+4JMFzw3x38L+D4D3pqFlmNNtf+hJDmfWl85V1jxllnZYFjxqKQoQkw7WYuKLp6dgC+55HWV1nZUx50btXzed6L4qLAZ1Z689gvHHhRcv07LWVXRcupGC14dFl+C8vBiZ8wwUQFG/j/zjbfnPAk2CIHxWq/97N8/uh2f2iBK3J3/FEcDsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htmX7uS8Nr+waUyVNlbPspU7wUQMX00JLut0+oHkFYk=;
 b=Stl8fZV6Ge3TIu8GoYkdRw43G7K1ziemF3yNc6mbhaD7ur1+WKvL6gfw9+XSTwV91w5qXRmBha36mSR9c6N8p5Zeu+NwVf6Xix+BN43+XujlZFqttX3LdY6QyDVBOkSAD7NmBC+uGsdBYXh29zJ74IFwS81fA9TGkctORrnthFg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2827.namprd11.prod.outlook.com (2603:10b6:5:c8::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.20; Mon, 6 Jul 2020 15:41:00 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:41:00 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-pyperclip: Upgrade 1.7.0 -> 1.8.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200701142243.1686-1-leon.anavi@konsulko.com>
 <20200701142243.1686-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <169cd3bd-b275-75cb-52af-7e0d494dbd84@windriver.com>
Date: Mon, 6 Jul 2020 11:40:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200701142243.1686-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::8) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0039.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 15:40:59 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f458adde-5edf-461f-1c41-08d821c2fb7b
X-MS-TrafficTypeDiagnostic: DM6PR11MB2827:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB282770E8AB258556EBA19ABF9F690@DM6PR11MB2827.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Tk3+vVtmO5ZJEIOB9XdpWLaQqi45PhUCMaZWO8aU26R7pASWAq1tS6IE8dqVyzdX82mcRcVI2oOObAmrC7tnoRVME2W1olZ93SkmOOEhopzz8cNekF8nJVXyWfl116lngY38tagFIM8So4qo3LrL5tQczeOucopn2Uwl7Xdh0wdQIVE19nkYbW537BSJkP+om0hRuDKzUXWtovnD2nIPpNKCWdhxxsmfp3nrSQt4mFC6BpDMLni06pgLDj270SsYjG0kCau/cXPwuNqmxxfKxUct0I5TEhYi7jNr/tWHruIii4If5jqoUkbpwJbjgYerW7zoSlwnna7Af0GUTGJvrfqAg/zILgCUwpLvo8zkpaIv4E5JJudUJKKGvjVckXr2Upumq/LDNrcexufFtDUXQ+aiGmqAkTsFqzYLv2oNBQlZB4Sd9gHgDp+ksfR4u/Lp1MGZL4eo6N+OWLbWs7BjTQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(39850400004)(366004)(396003)(376002)(136003)(8676002)(66476007)(66946007)(66556008)(966005)(44832011)(478600001)(956004)(2616005)(16526019)(26005)(5660300002)(2906002)(53546011)(31686004)(186003)(52116002)(316002)(8936002)(33964004)(166002)(83380400001)(31696002)(36756003)(86362001)(6486002)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	I/OnSnB75s1VEuKZYSyC5CMMJFXdpl0BJ2JW399LBsvJ8K9q52bDk9/mPpWH4n84LNYrlyUp3NennLbr3EvgRdSJxGkC1uwG5+1/rH3ucEBDYxlxX/hIBS84ANAidtbhqPdvHmn4sIe3wwUf6H6gLIqB41/LGijK/3bCYVxvR6JMyYqQhtQU/ACREgCSO3uEHDaidBiD0sfWlTSaBfv3HM7n8B6HFw+6olyfHO5ESb/ru98YyOg95nkNfMY6nXk7eREDPBMv0YVUw7a+WXke1i6zm+Y30ILP8sgm5BLsdSIMPJvT5AGCly4iir27UUOIo9XUTzbgdXQX4aE9ArZucGKkDugs0Q4n5zH9h5pjdRXM7jIsBghmODwijLZkY/pzlZ3quudgoyjAm3QLx9E7Bjhc4mc/3hGPQkrm7A3NYLacyWH1Ge/pYS8EUwV13rmIxSMDBYkB+pFcawSOUW/8mAxPqnlB6dnX5eIfEcDLnAA=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f458adde-5edf-461f-1c41-08d821c2fb7b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:41:00.1165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jCMe7/QDcjRQJA/kCEIa2HZMFT5ylRnDLhU+pX+v187+bm6XpziXMUOJ5WylbDgVXyI82a3WcMDuEjbnYF9pohCLEUpyhV+Z0SfpOsOEX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2827
Content-Type: multipart/alternative;
 boundary="------------8AF4AD0F3A578C1FC8F7DFB4"
Content-Language: en-US

--------------8AF4AD0F3A578C1FC8F7DFB4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/1/20 10:22 AM, Leon Anavi wrote:
> Upgrade to release 1.8.0:
>
> - Correcting a URL
> - Updating code and docs with waitForPaste() and waitForNewPaste()
>    functions.
>
> Use the exact line with license information from PKG-INFO.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-pyperclip_1.7.0.bb             | 14 --------------
>   .../python/python3-pyperclip_1.8.0.bb             | 15 +++++++++++++++
>   2 files changed, 15 insertions(+), 14 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb
> deleted file mode 100644
> index 52d109abc..000000000
> --- a/meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -DESCRIPTION = "A cross-platform clipboard module for Python. (only handles plain text for now)"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a428356ada7737b416ec4b63dc65d581"
> -
> -SRC_URI[md5sum] = "6bbb8598579cc3ee50554b4c59d0cfae"
> -SRC_URI[sha256sum] = "979325468ccf682104d5dcaf753f869868100631301d3e72f47babdea5700d1c"
> -
> -inherit pypi setuptools3
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-ctypes \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb
> new file mode 100644
> index 000000000..8f331529a
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "A cross-platform clipboard module for Python. (only handles plain text for now)"
> +HOMEPAGE = "https://github.com/asweigart/pyperclip"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632"
> +
> +SRC_URI[md5sum] = "c2564a74b909b6fc32401afd619de83d"
> +SRC_URI[sha256sum] = "b75b975160428d84608c26edba2dec146e7799566aea42c1fe1b32e72b6028f2"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-ctypes \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------8AF4AD0F3A578C1FC8F7DFB4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/1/20 10:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200701142243.1686-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.8.0:

- Correcting a URL
- Updating code and docs with waitForPaste() and waitForNewPaste()
  functions.

Use the exact line with license information from PKG-INFO.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200701142243.1686-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-pyperclip_1.7.0.bb             | 14 --------------
 .../python/python3-pyperclip_1.8.0.bb             | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 2 files changed, 15 insertions(&#43;), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb
deleted file mode 100644
index 52d109abc..000000000
--- a/meta-python/recipes-devtools/python/python3-pyperclip_1.7.0.bb
&#43;&#43;&#43; /dev/null
@@ -1,14 &#43;0,0 @@
-DESCRIPTION = &quot;A cross-platform clipboard module for Python. (only handles plain text for now)&quot;
-LICENSE = &quot;BSD&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=a428356ada7737b416ec4b63dc65d581">&quot;file://PKG-INFO;md5=a428356ada7737b416ec4b63dc65d581&quot;</a>
-
-SRC_URI[md5sum] = &quot;6bbb8598579cc3ee50554b4c59d0cfae&quot;
-SRC_URI[sha256sum] = &quot;979325468ccf682104d5dcaf753f869868100631301d3e72f47babdea5700d1c&quot;
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} &#43;= &quot; \
-    ${PYTHON_PN}-ctypes \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb
new file mode 100644
index 000000000..8f331529a
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb
@@ -0,0 &#43;1,15 @@
&#43;DESCRIPTION = &quot;A cross-platform clipboard module for Python. (only handles plain text for now)&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/asweigart/pyperclip">&quot;https://github.com/asweigart/pyperclip&quot;</a>
&#43;LICENSE = &quot;BSD&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632">&quot;file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;c2564a74b909b6fc32401afd619de83d&quot;
&#43;SRC_URI[sha256sum] = &quot;b75b975160428d84608c26edba2dec146e7799566aea42c1fe1b32e72b6028f2&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-ctypes \
&#43;&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8AF4AD0F3A578C1FC8F7DFB4--
