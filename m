Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.52])
 by mx.groups.io with SMTP id smtpd.web11.20558.1593442258648783873
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NWCYrbim;
 spf=pass (domain: windriver.com, ip: 40.107.92.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DihGenxo+fT6rqAtauqjLF7BOgD+BHCWsKyrCUFc/01gkTP1BYDVAtiLrbcTxNL++MX7j7NqfQKYo+YoONCxc1XorGO5CoI5j8kLaRojiyfmCGieSyrzqD2QHiASHzAxzBeUVjM4houbAn85Q43jRpegE14uPPyV3hqMcaY/vchHrpqYmKizwx+L/ZH+3ncZZef7O3JnISwSD3eqGpYXCWo9jvD46dFCXBI8hoU9iNCCncAUMU4gMhsuFVvCb4VZsF023L+YUQaYpxiyPXzF6NIzL1SA4yUFO0Ufar2T1DffmpecOpd9zXQ7YPtFsAVQ5/yLPZ+AoLh8BpIqQby0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mt/8xKkgjUyjGAKRX8il+DajJHOJF+jKqCAA9UQYQK4=;
 b=k7BVC4ZW7wua2bjQV6VPDvee9kELIWzezph4xVsaJPst3w2NH8T8CEmPtWLZFVhar5ms3443H/iTo/hKBr8S8PxWD/x1kEVCwEkP9c/xGv0jJNttFimN/RuEhFscGEndOZ6pc0tl4xP1VkjnDYiVzrJwxWAQHhYYRwxwdMNOEt2tqAv9ArcXCe6ywACZ2jPzEjAYaA2ua29s7uARmnmy2oUV+UK8N8CDbb9038Hjuh8HpU7VsB8s0bpfaBtxcxfJ3G9GFz+fkrrZdcSUL4eGkJoZ/4wLBAD63HQvDK5LiNQocXeCzTfuqwdJEa87hGK95OVgjdv5Gutd0t/6xmYlfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mt/8xKkgjUyjGAKRX8il+DajJHOJF+jKqCAA9UQYQK4=;
 b=NWCYrbim/LdHaOt+Kwy+MQYAaYrGROewWSIh9zgvz9eyW198CEvLS8/pSdxbQSWooEfHRYU1Rag2KEhme0FTajxV58CWM/nuPXCY1m9jVjt06j36K6eCgJVi6QSiCjGihuBkelAHzNSkK1p3RRYxfmIK26tLb/Z7+fnX7NKlrOo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1988.namprd11.prod.outlook.com (2603:10b6:404:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 14:50:57 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:50:57 +0000
Subject: Re: [oe] [meta-python][PATCH 01/12] python3-pyro4: Upgrade 4.77 -> 4.80
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e6e93c41-9eb3-c4e9-6573-130f2bb97899@windriver.com>
Date: Mon, 29 Jun 2020 10:50:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200626112944.25569-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::19) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Mon, 29 Jun 2020 14:50:56 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45392c37-6956-42c1-9618-08d81c3bd49f
X-MS-TrafficTypeDiagnostic: BN6PR11MB1988:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB19880178EE4AE7472A8A3AEF9F6E0@BN6PR11MB1988.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pr9ZZw5cCAa9IWRHMcyn48teKvKuJMiv9BxIKWNf2gpaJkxYs0MFT/ZhMWzAj8Wq/BWGnzRuvmGLaO+xjYEOJb1I7xMH6Cr/bb6KpJ45OHVOfP67EZMTXo6DHHjXzVnRDeBZ/bb9woySa89wUAd2zbTyMY+Gzpol2FktnGwpPg8uK2KrKFRaHSKzOhiE4v5E/+QhW439cw0GPbnk0VyWxX/7T/1igARvdpuQhiQGYVkBdjyWIK4wuwNEK6B/XRsSZHtsjzxry0ksWYNLYu2EHRQoKpPwntyMnVpcaxA/qZRiccx2LbNN4JfSmQbzcmgAvIgk+DiRXV53ui6NdgeiQbcugk/FD+52i+ndiobHFnEDy/ELfhsaPM6cz6Hx0zqIXGfOr1p+1mA+xW1qKrGhqJ1UVORKepSHIe/5WfIMjEkDFqOozkyvI0VYNpq9mSM5UrHbFDtCHGcieNlhyLFHlA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(136003)(346002)(376002)(36756003)(16526019)(966005)(5660300002)(478600001)(2906002)(83380400001)(8936002)(8676002)(86362001)(31686004)(316002)(16576012)(166002)(6486002)(26005)(52116002)(186003)(33964004)(53546011)(66556008)(66946007)(66476007)(956004)(31696002)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	sUlT/QLWYg7e26GUwJ1B1IJyRiFTljOTn0DZDfpvbWe8jP+bFY7+20TPLW9U/YdYn4n6F0G6dv84wsZ55ofTHJLQplk9VdnB9B5B+hZJwVQ/zxVEdmML1poLQTqtneDwM/zJZh0mOgDnqHaBCvwYi9rT+EmjMY7bCZZKjGXMb5eCLl4q5VLarhRoL8/5RBGeEb3K42A9buMnpxKRFougVEHhtbJbjqDC1WenCWa2uLTbKsNZmufVbrWzIbhHaijqaofjhNCa0ZD6yLCjSNJuR6QYyPaLPegjI6pTfs0HrL+o5YpQXKQQ4HbqIhYJ/wupwMyl9btIat4/X23GGXcB12fmyMdrDIxvdD4wU0fxHDWswoZ5MDyJm6R+rWrggqHQODatpfaZACKp9zOlX0Q7UjrLsu09uuT8ggMW3NnPcLdHPjTKYQOCj1OMiTM7BbdHNBDCxFI1R/fM1jEOPUANS6AS5yolUDJiyvr0vCZx1+w=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45392c37-6956-42c1-9618-08d81c3bd49f
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:50:57.0890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hobUx9j3OTISAl+xzAOz0Fm2zD9COc/KVwFiU1J00Equr4IWkmqTj7JahnVpGTgnRclBJT0Lbnk4KgbEzzMtMhiwRINZ3u+o7/KZH0cBNYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1988
Content-Type: multipart/alternative;
 boundary="------------85EE1ABA204414DF0662B423"
Content-Language: en-US

--------------85EE1ABA204414DF0662B423
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/26/20 7:29 AM, Leon Anavi wrote:
> Upgrade to release 4.80:
>
> - fix possible race condition when creating instances with
>    instancemode "single"
> - cython compatibility fix
> - removed explicit version checks of dependencies such as serpent.
>    This fixes crash error when dealing with prerelease versions
>    that didn't match the pattern.
> - stick to an older serpent library version to install as a
>    dependency when installing on old python versions
> - explain the delay and threading in the distributed-computing2
>    example
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pyro4_4.77.bb => python3-pyro4_4.80.bb}          | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-connectivity/python-pyro4/{python3-pyro4_4.77.bb => python3-pyro4_4.80.bb} (66%)
>
> diff --git a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.80.bb
> similarity index 66%
> rename from meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb
> rename to meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.80.bb
> index ffe58ee9c..dfea67368 100644
> --- a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb
> +++ b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.80.bb
> @@ -2,8 +2,8 @@ SUMMARY = "Python Remote Objects"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=cd13dafd4eeb0802bb6efea6b4a4bdbc"
>   
> -SRC_URI[md5sum] = "21f015ae93cf9ea2bbbc418a2267e9fb"
> -SRC_URI[sha256sum] = "2bfe12a22f396474b0e57c898c7e2c561a8f850bf2055d8cf0f7119f0c7a523f"
> +SRC_URI[md5sum] = "e31fc077e06de9fc0bb061e357401954"
> +SRC_URI[sha256sum] = "46847ca703de3f483fbd0b2d22622f36eff03e6ef7ec7704d4ecaa3964cb2220"
>   
>   PYPI_PACKAGE = "Pyro4"
>   
>
> 

--------------85EE1ABA204414DF0662B423
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/26/20 7:29 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200626112944.25569-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.80:

- fix possible race condition when creating instances with
  instancemode &quot;single&quot;
- cython compatibility fix
- removed explicit version checks of dependencies such as serpent.
  This fixes crash error when dealing with prerelease versions
  that didn't match the pattern.
- stick to an older serpent library version to install as a
  dependency when installing on old python versions
- explain the delay and threading in the distributed-computing2
  example

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200626112944.25569-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pyro4_4.77.bb =&gt; python3-pyro4_4.80.bb}          | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-pyro4/{python3-pyro4_4.77.bb =&gt; python3-pyro4_4.80.bb} (66%)

diff --git a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.80.bb
similarity index 66%
rename from meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb
rename to meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.80.bb
index ffe58ee9c..dfea67368 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb
&#43;&#43;&#43; b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.80.bb
@@ -2,8 &#43;2,8 @@ SUMMARY = &quot;Python Remote Objects&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=cd13dafd4eeb0802bb6efea6b4a4bdbc">&quot;file://LICENSE;md5=cd13dafd4eeb0802bb6efea6b4a4bdbc&quot;</a>
 
-SRC_URI[md5sum] = &quot;21f015ae93cf9ea2bbbc418a2267e9fb&quot;
-SRC_URI[sha256sum] = &quot;2bfe12a22f396474b0e57c898c7e2c561a8f850bf2055d8cf0f7119f0c7a523f&quot;
&#43;SRC_URI[md5sum] = &quot;e31fc077e06de9fc0bb061e357401954&quot;
&#43;SRC_URI[sha256sum] = &quot;46847ca703de3f483fbd0b2d22622f36eff03e6ef7ec7704d4ecaa3964cb2220&quot;
 
 PYPI_PACKAGE = &quot;Pyro4&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------85EE1ABA204414DF0662B423--
