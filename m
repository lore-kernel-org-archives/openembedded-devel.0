Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.79])
 by mx.groups.io with SMTP id smtpd.web11.23078.1591976297314844457
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 08:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iR33dRs4;
 spf=pass (domain: windriver.com, ip: 40.107.75.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a556ZcCDDtOfDdrlUjsmeG9xKsb/Wc8qMNfe8Z7p662vfHjraCfLPDm5vWdbF6v4mzxVwDZpxy7aiguCfsi2H+oe1fuOc2vJ04YMJVnCDMcholAwtiVUqDFJs2DKdwQ9K6EdaQrjd59fZxLSATbgbeuFoo1Q/2UDHYC6yHTjzRwVGI8MCk296VR5UG0VN0A/njlXvMdwA6vHomaKdwAftDczzYmD1k3Hi9ImJ75czl5FI4vuOWFGMlpvT9092NiGtQaUutIJx9XKfPvN9mnW6ktkkUOFuXEOyMpFP2/xkUIVH2MqE9YCAghLJjgDDnUyh+ocDxFnZ+Sx8qq2cxxXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/A6L8utRhxc+nezIKwXA0a5B9JStlUkvlaxBMvPuL4=;
 b=BgXKVQ2PgQYEo+v9NPoGXbX5XdAZkPGFzfeYvPUaDxivk9v0iMUh9BSpU8CIcfT+EuEWVe0QTiCxWFN4q9zDVhXaxtHjpkNa4Af9no512OfypCAov5gF/TaWCnoeqNLCutx/8EtYtXABxcN7R9C+sy5BV+933HHQG0oX64ix45DsX/VCPFMiw9v/AVfNOfla2OvjtkQDFn/4xOPaqtzQpWQWMxK2poPaCcrscp/+k+05qEOJbmeq8cyRSIAwI+cNRugUYuqJX3mFQLKXmJTfkywprgYp9jOQqu0LjkRvSEqdD7xRwEDzhDNGWopSsLy7wo9hWY8VaL6NlLfFD8VmdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/A6L8utRhxc+nezIKwXA0a5B9JStlUkvlaxBMvPuL4=;
 b=iR33dRs4janhinaQrPpyNm22tzTkUlo1gvkWSrkBGtBU1Jc7uJ5BgMZXMwxLpDYl3JqJDwIOdSFYM04OpvSCfpAKVKB6kBAMyqPzrl3THhgwbXS99yaQOaOVrdvR/XEUl6+KUXcTrdMIqgWdB8h1PKWpl4ciNylZR4XmJ5o/VJE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3746.namprd11.prod.outlook.com (2603:10b6:408:8c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 15:38:15 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 15:38:15 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-javaobj-py3: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200612144201.4536-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <00c399b5-9581-0b80-8fd0-686cf14a498c@windriver.com>
Date: Fri, 12 Jun 2020 11:38:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200612144201.4536-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::42)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Fri, 12 Jun 2020 15:38:15 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2e77ad9-eb6e-4327-2374-08d80ee69f71
X-MS-TrafficTypeDiagnostic: BN8PR11MB3746:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB3746AC260C147CC0E7CF48D29F810@BN8PR11MB3746.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:316;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BpQdGs0iUpZurdimB6HtuLf4Ci+Jc9s5gf5LouAQa3kLE4Odnv8IYCzBE7rNQPvzDzWuXmYmac95s0w6x9PP3MsgyqIJ971FBiBEH6hPXh3JMPjFf0G5UTJY/rdyp9jAgriEeRVwgzpfi5HU5UklpVeySSEPnTTp/Gd8ay6pYcBArPHVnz6lPQOXD4ai8jAHL334U4//ToCZ2W/O4ISlk3oCqVHqRF8zOBep0w3zxiWaMI4Ddrfb0/BOrmb4SdTWpLXVX2q3TqZ80Q64/wvhg1UJoRnrEouwmGhZ0BuO/3q7Z23ulGlr4XmJ3Y8iftZ9EfserfY+0cmTZanf0gHJm75XVvnOel9Y8ZZKUQr4s5yz6GKOa8LCtJYuAV+l2DXTDt10nG7bHlx7Mufkm80MfEnmDiP/nCceklNml384/PgmdKfrfO8qjTInksHOtfACXvvQ7ygD6ysbZF+HckwUWQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(376002)(39850400004)(396003)(136003)(6486002)(31686004)(8936002)(966005)(478600001)(8676002)(166002)(83380400001)(316002)(66946007)(36756003)(66556008)(44832011)(2616005)(31696002)(956004)(66476007)(16526019)(33964004)(186003)(53546011)(52116002)(86362001)(26005)(2906002)(6666004)(16576012)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	z25WeRG7DuFQHgnkwo0kv//xqJQvQxjbHwg75I/+oIEBbk/CEecJig6lJdw2vwN2h2sRdc9t1jUapvQMcrd7HrljLoys7U+Q0Us3PoNWfCSnMR/1k8Jlg2KWINZnivM/3fOt5FQixZ772jG1W6J6Z19EpDZ5sLs9p/juMzFK23E8Opgn0oorYL8zvvd8lIpsILCp2XGl9io1TRKxAc/253jico29grqnkMhWWJq1k1FYtWcmF9/EQ5k9zn4r3is00opD/M5WpEpEkFsAmtG11Vz0FP2PP0COYGJiAAN5jrirpv7UiSGHKOLL6V+ioDfB3OuW+0aeA2gnsSG32ps9ggOcwmziMYE2ygLkan2wh7UGoRnFjH+BUntqbr4/pD3spzweGAsfMqTWunIuelvxWb9ZNk4ou0PMDpdmjOYMWom7GlYx32kStF4hIFoFGQfcYbtG9In0mnvnymRr3tGGecaa7ubYxX/ZXUQhC/64F09XoSkNiS/HjdekBIdAPW5y
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e77ad9-eb6e-4327-2374-08d80ee69f71
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 15:38:15.5532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6k+MWrSXkvGYWG7mDwl0taV991g6LQuWbhK8wDAcyuCm//1gNmGJOe2hzwBhseBsqEHKcFUB0aRtmECUpV1zDxcT3Jw9UajEb+t3Of/nMZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3746
Content-Type: multipart/alternative;
 boundary="------------A17CFC1BA380B13283CD0B99"
Content-Language: en-US

--------------A17CFC1BA380B13283CD0B99
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/12/20 10:41 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-javaobj-py3.inc               | 15 ---------------
>   .../python/python3-javaobj-py3_0.4.0.1.bb       | 17 +++++++++++++++--
>   2 files changed, 15 insertions(+), 17 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-javaobj-py3.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-javaobj-py3.inc b/meta-python/recipes-devtools/python/python-javaobj-py3.inc
> deleted file mode 100644
> index e667057bc..000000000
> --- a/meta-python/recipes-devtools/python/python-javaobj-py3.inc
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "Module for serializing and de-serializing Java objects."
> -DESCRIPTION = "python-javaobj is a python library that provides functions\
> - for reading and writing (writing is WIP currently) Java objects serialized\
> - or will be deserialized by ObjectOutputStream. This form of object\
> - representation is a standard data interchange format in Java world."
> -HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://setup.py;beginline=15;endline=27;md5=af9ce26ac2de1b7436eb08c9308b4a1e"
> -
> -SRC_URI[md5sum] = "352fe0df9336b8699ad0799ef152da6b"
> -SRC_URI[sha256sum] = "18c44cfaa214813784a823432b4ab9829c9626b2b00072011627b4008b0067cd"
> -
> -inherit pypi
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
> index 0ec23ba99..49d258ca8 100644
> --- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
> @@ -1,2 +1,15 @@
> -require python-javaobj-py3.inc
> -inherit setuptools3
> +SUMMARY = "Module for serializing and de-serializing Java objects."
> +DESCRIPTION = "python-javaobj is a python library that provides functions\
> + for reading and writing (writing is WIP currently) Java objects serialized\
> + or will be deserialized by ObjectOutputStream. This form of object\
> + representation is a standard data interchange format in Java world."
> +HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://setup.py;beginline=15;endline=27;md5=af9ce26ac2de1b7436eb08c9308b4a1e"
> +
> +SRC_URI[md5sum] = "352fe0df9336b8699ad0799ef152da6b"
> +SRC_URI[sha256sum] = "18c44cfaa214813784a823432b4ab9829c9626b2b00072011627b4008b0067cd"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------A17CFC1BA380B13283CD0B99
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/12/20 10:41 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200612144201.4536-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200612144201.4536-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-javaobj-py3.inc               | 15 ---------------
 .../python/python3-javaobj-py3_0.4.0.1.bb       | 17 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 15 insertions(&#43;), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-javaobj-py3.inc

diff --git a/meta-python/recipes-devtools/python/python-javaobj-py3.inc b/meta-python/recipes-devtools/python/python-javaobj-py3.inc
deleted file mode 100644
index e667057bc..000000000
--- a/meta-python/recipes-devtools/python/python-javaobj-py3.inc
&#43;&#43;&#43; /dev/null
@@ -1,15 &#43;0,0 @@
-SUMMARY = &quot;Module for serializing and de-serializing Java objects.&quot;
-DESCRIPTION = &quot;python-javaobj is a python library that provides functions\
- for reading and writing (writing is WIP currently) Java objects serialized\
- or will be deserialized by ObjectOutputStream. This form of object\
- representation is a standard data interchange format in Java world.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/tcalmant/python-javaobj">&quot;https://github.com/tcalmant/python-javaobj&quot;</a>
-LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://setup.py;beginline=15;endline=27;md5=af9ce26ac2de1b7436eb08c9308b4a1e">&quot;file://setup.py;beginline=15;endline=27;md5=af9ce26ac2de1b7436eb08c9308b4a1e&quot;</a>
-
-SRC_URI[md5sum] = &quot;352fe0df9336b8699ad0799ef152da6b&quot;
-SRC_URI[sha256sum] = &quot;18c44cfaa214813784a823432b4ab9829c9626b2b00072011627b4008b0067cd&quot;
-
-inherit pypi
-
-BBCLASSEXTEND = &quot;native nativesdk<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bbb/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bbindex0ec23ba99..49d258ca8100644---a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb@@-1,2&#43;1,15@@-requirepython-javaobj-py3.inc-inheritsetuptools3&#43;SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
index 0ec23ba99..49d258ca8 100644
--- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.4.0.1.bb
@@ -1,2 &#43;1,15 @@
-require python-javaobj-py3.inc
-inherit setuptools3
&#43;SUMMARY = &quot;</a>Module for serializing and de-serializing Java objects.&quot;
&#43;DESCRIPTION = &quot;python-javaobj is a python library that provides functions\
&#43; for reading and writing (writing is WIP currently) Java objects serialized\
&#43; or will be deserialized by ObjectOutputStream. This form of object\
&#43; representation is a standard data interchange format in Java world.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/tcalmant/python-javaobj">&quot;https://github.com/tcalmant/python-javaobj&quot;</a>
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://setup.py;beginline=15;endline=27;md5=af9ce26ac2de1b7436eb08c9308b4a1e">&quot;file://setup.py;beginline=15;endline=27;md5=af9ce26ac2de1b7436eb08c9308b4a1e&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;352fe0df9336b8699ad0799ef152da6b&quot;
&#43;SRC_URI[sha256sum] = &quot;18c44cfaa214813784a823432b4ab9829c9626b2b00072011627b4008b0067cd&quot;
&#43;
&#43;inherit pypi setuptools3
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

--------------A17CFC1BA380B13283CD0B99--
