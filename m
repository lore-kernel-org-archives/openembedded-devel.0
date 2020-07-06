Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.45])
 by mx.groups.io with SMTP id smtpd.web10.60681.1594050525110600655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Nl8gqoFI;
 spf=pass (domain: windriver.com, ip: 40.107.244.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VrbU4gsmXU17k7+yyK9UnxX2+j3pwLvgsHQZQNs1Fl5kHrRGISes2ZQ+iUkgXYF81bG5Q97FAyd+FIn1y0QztE/vD+2YmR/Bmh4zk7DIVnrlysPrhSDq0rUeQba5BiYz3nfOLVcybdPue3z5s8ctc/zoNaHLWIA5ouEmR/r9UM1gJNER3HhMit6WdG44cBx3oXB/LsZV9xxuPm0MmQedU/7lV+nKLbp7Ek8VDQRyYaaCNMp13u6cr2bDz7XiH5ds/iJwy2klzeysUnFqYv+OJShISZBU6+HwmEWJjYb8Q94wCLqIrQfc2qsTHHJxQnUTjOrFVLsJw/3ztKRahqTcVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vy7xzH3ys3ToFbHgME3eNiwLrbP4m2d6iGNpUdxOeDs=;
 b=Qs0Dq0Rxfru1ukHd+oqm3oZ/MIk5HYL+BDNPM9xhbTPr/XoFPrDGEwEEHDYtrBD08JcU3Dz0d4SsfXZtcRUJUbzFrIUWz0+lHUqZ3f/KhKeQOUvZ+KMX+QORXg84ZuyoGQhP7G79LoMBVYCozLkWPnxe5XHrn3vWw2d/q471ra7IRIo06k6vOlppGj3qMp5iZKMrkGrJCyfACikuZmDHX7JF/1yiGf0owEMtZH+r3sFg2LRqYMmRKo4TCPMrkUsOhxAhfr+ENLCN1LxTHVvzlPCqj57y0n7Bpx9EBShxNHHj0U7GkQOJbXUqslg7fXGkS3EhZuQysiz1PhANZQN+zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vy7xzH3ys3ToFbHgME3eNiwLrbP4m2d6iGNpUdxOeDs=;
 b=Nl8gqoFI9L0RBWo15RQghQMzWGTAVieO6WYmZ4XUsO1W8drsYuJbHbg3UJMEadtdvTNrbG92IXG+alzdH9zl5ST5sGEvKYLx83eATkYOlvCH0jdiw1Z4Nq/K6X4og7asicAbh8xoWcX9LdycETC9kDQf6gg3iB48iyhiUAl/xDw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM5PR11MB1899.namprd11.prod.outlook.com (2603:10b6:3:10b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.27; Mon, 6 Jul 2020 15:48:44 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:48:44 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-regex: Upgrade 2020.1.8 -> 2020.6.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
 <20200703093020.3514-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <de7d5f15-77f6-4f6f-1afa-78f9f13b34f6@windriver.com>
Date: Mon, 6 Jul 2020 11:48:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200703093020.3514-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 15:48:43 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69beaaba-3f9d-4c91-a151-08d821c41024
X-MS-TrafficTypeDiagnostic: DM5PR11MB1899:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1899118700DD339807710C659F690@DM5PR11MB1899.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UnrRZMH/B9RMzdmIkFVF8Gqs+7Fe40einw3YgcMseA8rkJeH+z80OMkXS0bJJhR7V4tP9XeWaLMh6FzdXEZeFunNDKN3GzhDkaev08FhoWR53E6Jp6Xyq5k4gUzajOVmmnsaC+Z++MD8/080o+1eR/glj7ST3EZxk4S5sgQVgGjHtPfwD+6GYKi6xR3NeqCwFfffUWsI6mh6CdeEF79sMrA1KJO1aPW7fR5y3lRXRjP5J+Q+p2zuKlGxTnelbKLUhWPVT09r5xPSxamPflGVvCyRIzlw/c46P8Jq5O8EHix8FvuTm8HPbY1yfzHiupPfQP9XjFQp1vc+nBIoiH1Bhr/YCjiE8CGfxOuXGCrkgtLJzDobrW7mkd1m/bAQvSXjLs8jjG2zmciaHgS59tdddO/UQzEKZigAtPivTP1pPIAT5XbmyE3uW1C0tNdyOrRDzQv5ZMyWmV7kaXd3tv3sMg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(376002)(366004)(39850400004)(136003)(16576012)(5660300002)(31686004)(478600001)(86362001)(83380400001)(31696002)(6486002)(966005)(36756003)(316002)(956004)(2616005)(186003)(16526019)(33964004)(44832011)(166002)(52116002)(8936002)(8676002)(66946007)(66476007)(66556008)(2906002)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	qSAl3BcNMw0foF2Eb35M+8ht/yqvpQpVLp70SOaIEETQbKZcu1HvXbjJrd7V3/z5ZDBIzrKOMK0ROPf2dNuY8k+PeaHy+qb3MNwo3850svrhs+i4JjADn0GxO444hhQx034LtMQ02MSbHtAb5XDqDPDxyJqYjLdYZv+YPCejmvHX4bg/ZzUqc9b/cRYY8AtP79PrXRtzh7VSYBoQgztw4AFxUU+3Whxe7H2KM4qqBeCFkk2MDV1eb+oD4zrf+ER7fxZsMhVYxXFCpas91jj6/m+foiQKBcD8jzW1lWX9zMOR6be+Ki3cUm81gJi4Q3kSpJCAsftgSZcUCCJU076EWD67cE8ATz/2/wixg4+YsXONGNbsDuIRLZoyCWgw4ztHex2I94Kyy/v9XJa8OHKQBQKQH5vhJ4JJcaQygS+Xon9LwIFXbiV8U3WCmcynQOx2zpLRKsbrH7hBFOxVY9kbrKbz3HPrHvSmVLrSxQU4pTeEGX9uN5BJZUZhsz5Uyy2R
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69beaaba-3f9d-4c91-a151-08d821c41024
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:48:44.1917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SChSrrGykwWx1dvZ5vhisYrBzJQtlqf1hx5ygu0gvqL2AJ4PKzMims4mLk3wV1sN+Y07UI8WepconTLxr+mbNOezglBVtm2sGQANcZQhQH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1899
Content-Type: multipart/alternative;
 boundary="------------4F15F358FCB2EA087DC595D6"
Content-Language: en-US

--------------4F15F358FCB2EA087DC595D6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/3/20 5:30 AM, Leon Anavi wrote:
> Upgrade to release 2020.6.8:
>
> - Updated to Unicode 13.0.0.
> - Improved performance of string sets.
>
> Fix SUMMARY and HOMEPAGE. Use exact line from PKG-INFO to
> determine the license and LIC_FILES_CHKSUM. The license remain
> the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-regex_2020.1.8.bb                 | 12 ------------
>   .../python/python3-regex_2020.6.8.bb                 | 11 +++++++++++
>   2 files changed, 11 insertions(+), 12 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb b/meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb
> deleted file mode 100644
> index 6bdc03995a..0000000000
> --- a/meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -SUMMARY = ""
> -HOMEPAGE = "http://pythonhosted.org/regex"
> -LICENSE = "PSF"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3d9edb84b293ab5a9ed5bcaf1b769ab6"
> -
> -inherit pypi setuptools3
> -
> -SRC_URI[md5sum] = "73abc3d7e902e94b4281fd2652f5a94f"
> -SRC_URI[sha256sum] = "d0f424328f9822b0323b3b6f2e4b9c90960b24743d220763c7f07071e0778351"
> -
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb b/meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb
> new file mode 100644
> index 0000000000..d09f638400
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "Alternative regular expression module, to replace re."
> +HOMEPAGE = "https://bitbucket.org/mrabarnett/mrab-regex/src"
> +LICENSE = "PSF"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745d623f406b500ec"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "a991f73b0ccfe8f6e9a99bd1bc9071b1"
> +SRC_URI[sha256sum] = "e9b64e609d37438f7d6e68c2546d2cb8062f3adb27e6336bc129b51be20773ac"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------4F15F358FCB2EA087DC595D6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/3/20 5:30 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200703093020.3514-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2020.6.8:

- Updated to Unicode 13.0.0.
- Improved performance of string sets.

Fix SUMMARY and HOMEPAGE. Use exact line from PKG-INFO to
determine the license and LIC_FILES_CHKSUM. The license remain
the same.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200703093020.3514-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-regex_2020.1.8.bb                 | 12 ------------
 .../python/python3-regex_2020.6.8.bb                 | 11 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 2 files changed, 11 insertions(&#43;), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb b/meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb
deleted file mode 100644
index 6bdc03995a..0000000000
--- a/meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb
&#43;&#43;&#43; /dev/null
@@ -1,12 &#43;0,0 @@
-SUMMARY = &quot;&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pythonhosted.org/regex">&quot;http://pythonhosted.org/regex&quot;</a>
-LICENSE = &quot;PSF&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=3d9edb84b293ab5a9ed5bcaf1b769ab6">&quot;file://PKG-INFO;md5=3d9edb84b293ab5a9ed5bcaf1b769ab6&quot;</a>
-
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = &quot;73abc3d7e902e94b4281fd2652f5a94f&quot;
-SRC_URI[sha256sum] = &quot;d0f424328f9822b0323b3b6f2e4b9c90960b24743d220763c7f07071e0778351&quot;
-
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb b/meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb
new file mode 100644
index 0000000000..d09f638400
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-regex_2020.6.8.bb
@@ -0,0 &#43;1,11 @@
&#43;SUMMARY = &quot;Alternative regular expression module, to replace re.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://bitbucket.org/mrabarnett/mrab-regex/src">&quot;https://bitbucket.org/mrabarnett/mrab-regex/src&quot;</a>
&#43;LICENSE = &quot;PSF&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745d623f406b500ec">&quot;file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745d623f406b500ec&quot;</a>
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;SRC_URI[md5sum] = &quot;a991f73b0ccfe8f6e9a99bd1bc9071b1&quot;
&#43;SRC_URI[sha256sum] = &quot;e9b64e609d37438f7d6e68c2546d2cb8062f3adb27e6336bc129b51be20773ac&quot;
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

--------------4F15F358FCB2EA087DC595D6--
