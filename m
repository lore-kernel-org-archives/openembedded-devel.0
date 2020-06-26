Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.73])
 by mx.groups.io with SMTP id smtpd.web10.10052.1593184946389347292
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=qJOTXyWH;
 spf=pass (domain: windriver.com, ip: 40.107.77.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1ZlbP4ASwVTNBbPyIeqnj1cnF9QS1rTtk19cEuD3VCEyIvrePF0whXA1uGws4atflX5dKrPgG1WuPBjtZvF0gHbZsCQbCM9t4v5R9Mw4PpTJ0E6HDOJEch0nTEUpVJWXvb3yP1MndhGatykxmdNac6y82Bzww1/dc9+VbpRmQa1jR0v5p7eK53YlDdh5DZ/N70hb7qX108GqxYkLM1QzsB/uV1OYz3VDkVYkQwAQ5b9nQXJg391IJ3T+NlYuTaCX5lY/84/5a59QJTkZgF5s+RMZMCW7gzFSBuebtBrCEf/nO0FpB9YsJAxGTnGONAiNcmLYGoeL2jgSIU5nR9ITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSBeXMU9fAlQs+gJ1DEZ6hjkJa0U0zDFP8vWy1FiRXQ=;
 b=H3Vd0TS/3FdMlfmh5J/jVVVoFkm4k6uBG/pikqXi0Yy5oQgZriJjqvwmkbDGkrgrCX74c/EUOySSYAU4LspMV/7O9omtpmEaZ+sH8TnJCFPsCAgGAh0l3AyMcoEp9PyLB+ZBALkrwgNxKJhEVaWSbCGrvfcQBa+7FsqOSkl5M5OeWsG7rVQmgdEP/F5NVBxP6BYg6gxjynHopgF3618XadSaz+HzdcPMNgv0mNP46KVXgoWc/5s4+JaXg9pvqce75d4O4m2O1MclQf2Z6R5/tViBDyZdOGYW4w+MDg0jshWsM9A96jzzIGL5dz+WVihyEEKkZOX7oE6/UNqTY4SQdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSBeXMU9fAlQs+gJ1DEZ6hjkJa0U0zDFP8vWy1FiRXQ=;
 b=qJOTXyWH7pJro84Hmvr78QoIkHrq3kAFOoQ6zj426ycy+JlLGnvzRQL11CQOcpGhx4ObECUqFyn9r+loxIgg0+oWzWqxZ9wXsSYomaRonXKwUO3j13IdmGVGo99wahg+eSUXhfs4YqLr4f8xZADNPiGKYsgFHz6WRYUhoORqJb4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3953.namprd11.prod.outlook.com (2603:10b6:405:7f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Fri, 26 Jun
 2020 15:22:22 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:22:22 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-padatious: Upgrade 0.4.7 -> 0.4.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
 <20200622103542.27830-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f3c374e4-3c89-5557-09b9-81df9fa1419c@windriver.com>
Date: Fri, 26 Jun 2020 11:22:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200622103542.27830-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 15:22:21 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f09693b-4eed-4ce1-a0df-08d819e4b91c
X-MS-TrafficTypeDiagnostic: BN6PR11MB3953:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3953331A49C7C7654A532CE39F930@BN6PR11MB3953.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6QElCliJpBT31bF/PEo9fZpR0CYSDU26avNe1D+m0ppw0oRAw1su8uxZ30gaR76f6VXX6rDndKPIEwVCDb1ioxh1oKtLLd+TfjrZYCKF5PZwW2AJ2/LWFiIqefMhqgy7PfxEfnC4wQpddJRXkS38crlGJf4VUK1e77EMWzWYhV93dT4oM4pDh36O4uyq/9Sw720XIkmgF0at+0Zsnse/VXOiPByB9vdEFsehB7jCqOTcOi+KXgcJyHRfQC9fShKZGphmAWhQE6jRbQ7+e6TAoJ39MEIoAnJ6ijnPqzmamZBgpwtzQCJG8FxdLtOH+1fs1lo12kBpnpqI3W0e4SDuXszsoMW9IGjbYRdWAZN07IF+h8IQpLVdvDeyjjK3vAjQnWdVcYSBIrZw9bXZi3dWeJvlfN+xE1iXhicNThWr0Q49nTV4LgJEkjzDMuQLZI4IIPxEWvQTNeTvIrnTH5Ae3w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(346002)(376002)(366004)(316002)(166002)(16576012)(2906002)(956004)(83380400001)(31686004)(8676002)(31696002)(8936002)(478600001)(966005)(36756003)(52116002)(53546011)(26005)(44832011)(2616005)(186003)(6486002)(16526019)(33964004)(66556008)(66476007)(5660300002)(86362001)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	EZkg6nGHzJv85rXSr1OBub63wlhFw62SUBqSdES1pcNLuyzZX67eL3st4p09d7OKpSXx5BhTDLn1+/dkREhsnRkDzIqN4fEp+clldJZsET7JjlBdv5L2kcin8MTHInRWWWJeLPo5vMFVeGOjvqB+ILRKcfPqGk7xeJ7SCu9nnebnehxxZik6T38m1MJ40VYb1HkeIVaSQ4GS7KyYQz70LIKmD+VsBsC5kVzoy7qIiH3LFcIaQqZIZe4Hb5NIuO+fRJkGoDYVw5mQ0me8eaflFhwIasFIzdx6KOgC7lG2zxrdOuqlg8JF0FUIL4AvKgGPQtpqFu6LIdMeb2nD50y985ILjbpy3ESyBZ0l1lu84mS+/Eqql3g/YmkU041wdo4jP11Xk90k6/lcNjxprfzgvx/ipfJNRIx64mBxMWYsBw09eyPsl2CVu9QQHk/4S1JF+zb1/+wGPK/4+fjkG9YyypBmIBGOCdl4f+YqHz3lVu/sQz6YBZ/z3uuNqIbTEjku
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f09693b-4eed-4ce1-a0df-08d819e4b91c
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:22:22.4282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iM66AH1JMHcFOZ9Z91r8ibEK8eyiq7OZoVn3Sr8fZfF2S+khdEAjgPp8Vg6HDUf2PuOIP+/+qZISGJAb06MgHVKzfMbHJRWHvqIiFJV8V0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3953
Content-Type: multipart/alternative;
 boundary="------------5F2AB0C9C2701E944A4CB2DE"
Content-Language: en-US

--------------5F2AB0C9C2701E944A4CB2DE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/22/20 6:35 AM, Leon Anavi wrote:
> Upgrade to release 0.4.8:
>
> - Add support for saving / loading models
> - Handle apostrophes in a better way
>
> Change LIC_FILES_CHKSUM due to repo restructure and update of
> README.md. The license remains the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-padatious_0.4.7.bb   | 9 ---------
>   .../recipes-devtools/python/python3-padatious_0.4.8.bb   | 9 +++++++++
>   2 files changed, 9 insertions(+), 9 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb b/meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb
> deleted file mode 100644
> index 4abe7c747..000000000
> --- a/meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -SUMMARY = "An efficient and agile neural network intent parser. Padatious is a core component of Mycroft AI."
> -HOMEPAGE = "https://github.com/MycroftAI/padatious"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.md;md5=77baec496a458dd0e0fc4ca64cd305bc"
> -
> -SRC_URI[md5sum] = "1f53967a1633baa8fd48f11139808a33"
> -SRC_URI[sha256sum] = "3c235942ff4151a3c36536fd776bd8a6d4d57c97046723d2fa80a89b34faac1f"
> -
> -inherit pypi setuptools3
> diff --git a/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb b/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
> new file mode 100644
> index 000000000..404a0170d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "An efficient and agile neural network intent parser. Padatious is a core component of Mycroft AI."
> +HOMEPAGE = "https://github.com/MycroftAI/padatious"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://README.md;md5=cc85c733dffe81e8a7fde2e8f8a6a404"
> +
> +SRC_URI[md5sum] = "7dd2f1830737dc142aa199f77dacf32e"
> +SRC_URI[sha256sum] = "e471f251b94e8cadf6e4214f0f3b7b36678848aaa8c51cd5638ab23ecb716f75"
> +
> +inherit pypi setuptools3
>
> 

--------------5F2AB0C9C2701E944A4CB2DE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/22/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200622103542.27830-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.4.8:

- Add support for saving / loading models
- Handle apostrophes in a better way

Change LIC_FILES_CHKSUM due to repo restructure and update of
README.md. The license remains the same.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200622103542.27830-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-padatious_0.4.7.bb   | 9 ---------
 .../recipes-devtools/python/python3-padatious_0.4.8.bb   | 9 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 2 files changed, 9 insertions(&#43;), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb b/meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb
deleted file mode 100644
index 4abe7c747..000000000
--- a/meta-python/recipes-devtools/python/python3-padatious_0.4.7.bb
&#43;&#43;&#43; /dev/null
@@ -1,9 &#43;0,0 @@
-SUMMARY = &quot;An efficient and agile neural network intent parser. Padatious is a core component of Mycroft AI.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/MycroftAI/padatious">&quot;https://github.com/MycroftAI/padatious&quot;</a>
-LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.md;md5=77baec496a458dd0e0fc4ca64cd305bc">&quot;file://README.md;md5=77baec496a458dd0e0fc4ca64cd305bc&quot;</a>
-
-SRC_URI[md5sum] = &quot;1f53967a1633baa8fd48f11139808a33&quot;
-SRC_URI[sha256sum] = &quot;3c235942ff4151a3c36536fd776bd8a6d4d57c97046723d2fa80a89b34faac1f&quot;
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb b/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
new file mode 100644
index 000000000..404a0170d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-padatious_0.4.8.bb
@@ -0,0 &#43;1,9 @@
&#43;SUMMARY = &quot;An efficient and agile neural network intent parser. Padatious is a core component of Mycroft AI.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/MycroftAI/padatious">&quot;https://github.com/MycroftAI/padatious&quot;</a>
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.md;md5=cc85c733dffe81e8a7fde2e8f8a6a404">&quot;file://README.md;md5=cc85c733dffe81e8a7fde2e8f8a6a404&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;7dd2f1830737dc142aa199f77dacf32e&quot;
&#43;SRC_URI[sha256sum] = &quot;e471f251b94e8cadf6e4214f0f3b7b36678848aaa8c51cd5638ab23ecb716f75&quot;
&#43;
&#43;inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5F2AB0C9C2701E944A4CB2DE--
