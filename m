Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.46])
 by mx.groups.io with SMTP id smtpd.web12.60775.1594050502033468478
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=B1YDJaPA;
 spf=pass (domain: windriver.com, ip: 40.107.69.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnFpztSc48Jr5a6kPLPkySBOhbkvhBxGdga87PRhUWAURs9hP0iR+gx0DgcFA6AWUz7VjC9K1xDCmd/L1twXmm7+XWti6IslkqG9gWdlisyfb8C6gN1Oyxxqekj5wT4MxxHjhKvQIbfSW2MZvF2PoSvkMaRsL0bVkJINqX3a8RqJ4pErai5H4uWJAuXNhAcrlTRb++ivRtmo99gt9cpOXnv6Pm/l/stRSGyfpMZqKhDGxOIMduuYbiYpDExnNPpIVWC7cl0UjaiRBYOBoMmNi46aPlyQoxFoQXFpAFAeX0nI8q+0eIrWmQGRj6KnC3I2jIWws8E5FhDodn1HIlNspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhO1cSgvgz4k7Svh8w3T/C1fM9XRbnN1pLF1IkJ0Fus=;
 b=eoczOpD0PF5oeJL4q7El2g/RGgu0U2YR/fBsC/l6ucH3J8nTH52dm2Ya/VUQcHFvfd8Dk0PCY69I5So1Tq3W5lHned71n/1cEk2UdOc9jOSJo/nwXTVYmqm/j+upzHVv0z2RR2AgJy6Jlv13yEmFcU+JGtMzw0JRXXKt5lOWQH1TlJ/TU5PpWRFm35EauvT+tyt27nQny22nI710wu0vypQ1H177Z9+u6eK6uzRPDGnQ9dVD9Gu/RzoxeyNkR0MowTNdMc14XN4qX76P6gbf0eMkFSORHd+avxLfd0Xy9dLHSk7OYhPaf1EnelJkGrZbiaxuQTLRMYN/E/J4SoEOQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhO1cSgvgz4k7Svh8w3T/C1fM9XRbnN1pLF1IkJ0Fus=;
 b=B1YDJaPAUT5XAUif7g+XUgdA/ALD6QpCz+YsauX5qHKiMqs9tufCFOc1uHN7+noYbFKhBPPQL6RO+R0ZTpj/NAOSnorwghSKLYxmvm03aDshosx4+GdOjy6fZvPi+En0j+kUpMbar4If7YJayqwHLl7VRfT4E96drsJUHo/E34w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM5PR11MB1899.namprd11.prod.outlook.com (2603:10b6:3:10b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.27; Mon, 6 Jul 2020 15:48:21 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:48:21 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-sentry-sdk: Upgrade 0.14.0 -> 0.16.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
 <20200703093020.3514-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3971c4be-0c26-a8d4-8b06-694d7f345c34@windriver.com>
Date: Mon, 6 Jul 2020 11:48:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200703093020.3514-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 15:48:20 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14587913-c4c7-4ffc-1f9a-08d821c40260
X-MS-TrafficTypeDiagnostic: DM5PR11MB1899:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB18994FB38D4CBD5DD05A5FFB9F690@DM5PR11MB1899.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OYmvleRDaXauGxT/KO4CigC5Jk4UCzLqb3nwwjW556543tmNAmwtwd4gGs1TOqkItzgVcyrCo87zG0iwQJseyOBAkFz/7Nj7Kne3zSHyUGxAX/YeY7P81i2QEJOPZokU1vZcMkK8ginbzkJYv3K+MkVDSF7jZbhVfCK7Pcd5ImsKR5VT3EI3CJMCtfDIOKY11SantrLkJZqKNz8UT5IQNvx2PeoHKrlCIHtZYuLmVWbIK0Z1lwrR4TrqyNiuLpMx2ZRTPLn+KfSbiz0GRC6oLD3r7NsczpJUQJ7x0XJOKC/+coQu5ITHJexf+IQL8ChyWtdUGBdhYlDjQjRrajgsgOmaJAYxnkbscywrnj75+LBP/ZE6ocBfJ9Dig/nSvCyACTs4kkC2OeSep8v4pEigwKSwJ/fjkSvlzsZBPfR8e9DSlJ4qY57QvQq1jrFCMRTV8I2taIn7VJ2LDwa7spE2Nw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(376002)(366004)(39850400004)(136003)(16576012)(5660300002)(31686004)(478600001)(86362001)(83380400001)(31696002)(6486002)(966005)(36756003)(316002)(956004)(2616005)(186003)(16526019)(33964004)(44832011)(166002)(52116002)(8936002)(8676002)(66946007)(66476007)(66556008)(2906002)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	fb8wXraWn3psDqXoL7JAmYGNR8djTrpSHrVAu15G/W8n4su9dTzRvtfAX/RzZrfDZai7Ehi00z+u5LsH/bfwGHnOvr3njt0SGviFiNRXHxolujAhhfFInY3kj0DTN77yyX3YrGxntKWGuhSSrnTtqpA3ynXzhsrzMw5H79PWvVMIbGFC/YSVn0i0Gj1n4Mdgmx9si1/PBm32ew4L1aV+lqFzYHSPtOQIJcQjeJX9G3GIHp/DOWPAWXualetREQh3O66mDOjUXMQCakyqeUKEDAyuPPpUW8DuS4MEXoc2kaJJMk40n64ZuJEVRSnxIfzGh6SHR1JrPUbSLoJ/YWrFLgTWPmzSpHX0faBsUu+bhw/ppHqhhZLc9x14VR0NRnpEk1e3zQJhUIzi40BhV7JJBPpqshc+UwWpw/3lFAXfINlMTTknqn2/p0aWMLmZMOPCTva6ZyCW3CFnR3VJ3cdPdvesXRBEHlEbbuYsPWT7Jg4DMfMGJ1HAs9ziNTnCi8hf
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14587913-c4c7-4ffc-1f9a-08d821c40260
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:48:21.0965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHMAnM6r9PBRZQF3e6LyK68Kw19mNRw1ZS6LFloYZdl1Hf15z/hJ4Z1yrefgziBHQr1HiPYkbpSC5Y69kjjuxVm5Eow756PQkFYTMxTOSZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1899
Content-Type: multipart/alternative;
 boundary="------------68EEE641817D00920AB02E78"
Content-Language: en-US

--------------68EEE641817D00920AB02E78
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/3/20 5:30 AM, Leon Anavi wrote:
> Upgrade to release 0.16.0:
>
> - Redis integration: add tags for more commands
> - Redis integration: Patch rediscluster package if installed.
> - Session tracking: A session is no longer considered crashed if
>    there has been a fatal log message (only unhandled exceptions
>    count).
> - Breaking change: Revamping of the tracing API.
> - Breaking change: before_send is no longer called for
>    transactions.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sentry-sdk_0.14.0.bb => python3-sentry-sdk_0.16.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.14.0.bb => python3-sentry-sdk_0.16.0.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.14.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.14.0.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb
> index 894e1f9020..b3f149029f 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.14.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>   
> -SRC_URI[md5sum] = "2d5cc43c8a178134b739c77439d1f26b"
> -SRC_URI[sha256sum] = "8e2d38dc58dc992280487e553ec3d97a424e4d179f4fad802ef3b08f64ccf4d8"
> +SRC_URI[md5sum] = "8cfa879e803add117b073cad20c1d74d"
> +SRC_URI[sha256sum] = "da06bc3641e81ec2c942f87a0676cd9180044fa3d1697524a0005345997542e2"
>   
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
>
> 

--------------68EEE641817D00920AB02E78
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
    <blockquote type="cite" cite="mid:20200703093020.3514-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.16.0:

- Redis integration: add tags for more commands
- Redis integration: Patch rediscluster package if installed.
- Session tracking: A session is no longer considered crashed if
  there has been a fatal log message (only unhandled exceptions
  count).
- Breaking change: Revamping of the tracing API.
- Breaking change: before_send is no longer called for
  transactions.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200703093020.3514-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sentry-sdk_0.14.0.bb =&gt; python3-sentry-sdk_0.16.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.14.0.bb =&gt; python3-sentry-sdk_0.16.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.14.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.14.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb
index 894e1f9020..b3f149029f 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.14.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.16.0.bb
@@ -5,8 &#43;5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>
 
-SRC_URI[md5sum] = &quot;2d5cc43c8a178134b739c77439d1f26b&quot;
-SRC_URI[sha256sum] = &quot;8e2d38dc58dc992280487e553ec3d97a424e4d179f4fad802ef3b08f64ccf4d8&quot;
&#43;SRC_URI[md5sum] = &quot;8cfa879e803add117b073cad20c1d74d&quot;
&#43;SRC_URI[sha256sum] = &quot;da06bc3641e81ec2c942f87a0676cd9180044fa3d1697524a0005345997542e2&quot;
 
 PYPI_PACKAGE = &quot;sentry-sdk&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------68EEE641817D00920AB02E78--
