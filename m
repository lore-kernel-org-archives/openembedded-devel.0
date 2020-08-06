Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.43])
 by mx.groups.io with SMTP id smtpd.web12.5684.1596718816794894537
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 06:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gxBGXS2N;
 spf=pass (domain: windriver.com, ip: 40.107.93.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coG72l//12/4OWhQwH71q+jDFLC2cHrMvx8vNgq0mOehIoWnVumV31DmeEY71O3vdJJxaLdKKUIawBqMa/wAU5BTCd+imRbAikzXn2lqEJqWnhShe2zsxzD6bFi1jjPvzu0MUq6tlcGJctpOw49cTiIZx7+vFn63vGYRO05YnrzztUFjJQGe+GmQfEIa/GcEbLC/oAHXwmnrqEovyA/AHJnBCGJUs/Jc48gh1K434ghVBI65lnsbCIVf9fVKnf40RV7kMaLbrpFHDgl42F/WETf5kZSc9xgkh6IkKmZ37WishLJ3OldCyvQb90HTqi326FvWO52oJgaXMZE3/G3qdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SEwqdfRxoojgsQfDb/cZOGsDHXX6bCR6JsltNp7txI=;
 b=ZAMj1JAnxJufefwhu8PGUouhS70ZJ0Lpvm/qihv0+NEAgvJXptuVqYYDEhGAge3me0K+ZOaVMXlsvPbR/dNuzUYoyxLjnhlHru90fuefpX6l6exNr29nBuC+KfYKf1krwZu9JSfqqf0VKVvrmbKx893dtUrZLirMKlIsKPK8IguGz3/yidVUyfZS2csrFzeUsojo3GIJwnHWSqDRq7bsTlhzmT42aYmjPhwgwm4RBnEe9m1KhldMcOfNoTCzGHLcWgy8Yts2O3EMxZnBa/jVG1z1OX0qd8rCODtd6LU0bjjvwHHwSz/s4mMchIDjC5IhkprmlWOXOU+nIPrsUhyPNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SEwqdfRxoojgsQfDb/cZOGsDHXX6bCR6JsltNp7txI=;
 b=gxBGXS2NUoFzd5l6l8BouZVZcTTdC9il/WRFWNSLnx9r89fZXCJKFITDxFhLhrnDvEObCO0/wfG72Kb3zzDHEl5x24zfckgxpxpITNy5iP6m/rrOnTQ8t87j1rMRYx/oJdb8d79ElgosR3S4wC7n0WrWPhs9PgTIvn7JTmpgy4Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 13:00:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.016; Thu, 6 Aug 2020
 13:00:15 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-pyalsaaudio: Upgrade 0.8.4 -> 0.9.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200803095759.9591-1-leon.anavi@konsulko.com>
 <20200803095759.9591-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <529368d0-07c2-df61-d810-146606540366@windriver.com>
Date: Thu, 6 Aug 2020 09:00:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200803095759.9591-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Thu, 6 Aug 2020 13:00:15 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dee4357d-51f4-4435-722d-08d83a08a9c1
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43050AC002D900689970F0AC9F480@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4W1OpDeqonfJTu0Om5GwuAPyIs/ncAEQvqrrXqoVX9qH6w7Aet4hFjLTwQ2X1di6/MzSv/CLT1YoPXFW6V8D3qtfFeydKA0hkIjQzRN/gHETjQnmdcLoBZVpIp68gcrsY5FW6x0Vpp1WhJqiDOS6C+A6lEgO29c5pMHpPIeh/ajQ8oaVTbZI5WPM+Do7ihrUBdsYjGsKJMBhpWsCASKiHo8LTEHWaUkLk5pqBrw1LtVXx7Cr9Xo5Yd2JeMGlYNOu5vkOyr0XmINAqLj4OZd0E65lCALmmjrsbtmZ8dQ/wD6ZSSY/rE43LJDSDI+DqjSX1QzXWdUyJKr+pCEnBcwler+BlJynZd3nHG5NY4Aol0ry6WLvo2MDu3RERnOPqSAVa7pi6O0oUA8VjL88qGLF65/kO7e4ZzMh5XciDMlH4pS1Gpf6/12omn0k7yumnize44Y0RrQXNzhlj/Nf2FSgEQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(346002)(366004)(396003)(136003)(2616005)(44832011)(26005)(86362001)(186003)(16526019)(31686004)(956004)(5660300002)(16576012)(316002)(478600001)(966005)(52116002)(2906002)(6486002)(166002)(8676002)(8936002)(6666004)(36756003)(66556008)(66476007)(66946007)(31696002)(33964004)(53546011)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vCgx1KUOjkWGgFTqThlWhzETQndB3+R5ExwGGIm/TaBzs0uo/Xw0Mgk5wLM03g04YQWLafL7XwP/fCjgyZopDBWNqL+xP5oTM0a4A34gk50Wzv/53SvfR8QByFKIXBhx0GMr+yXTP/oVOmnRJ1pxRRKHBPBGOSlv5EH4bItBOZriDAtbjbxeiZ2+z33Daiwc8VMjnPZv8/l29s99JYQtkHzfwRy1gvwnzPvCkxdzwFvbr8/osI7aeHYK2N+U+9pmJiZ28j8V7G3/GBJtkJaCwERfJ7okPB5EwThdY6U7Af10TpPHUISiZA2KbY8XpeL+3Hy4pnV4qzs8JZwaKBQbn9kvmR0nBZaqtarMnIIrfim74Jji1PppE1E93fwfP3k0E/DIF2hZkyWaOXplB+g1oA6OLujVYbdS44i8NIXH5841zqUkIonrVYIK8xh7G80c5/8TzPtlFDBkGqV9Ih3/nM4XXt1F64Xm6wL5ND1LZPMeSKo5OX809dkePTEmLJA2yr+Uujq3rjwqxLrpqf/p3fA80EL9h7u0NiekNZXw70ccgyuJTo0jVsAzvBFhuqcVBBmWzffYxDZnj1E9QBZKM/vyibK/0t2Jk7hbNard2WTSNibIuwdwiC6mklq0CkEin0bTPIq4qHnD5YGKPjk66g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee4357d-51f4-4435-722d-08d83a08a9c1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 13:00:15.7010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWz0OrMkZZEFh7H9l2mVXbdscgKGzcwwFyg3a8cIXX/Y0WJKOBk0634Ed3H0rINRAz2IUsuqaXwVsM5O6L7b9rjswWYwS1Kps9wDaAIt3j8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: multipart/alternative;
 boundary="------------3B16626F8959E62A1DAB9A26"
Content-Language: en-US

--------------3B16626F8959E62A1DAB9A26
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/3/20 5:57 AM, Leon Anavi wrote:
> Upgrade to release 0.9.0:
>
> - Added keyword arguments for channels, format, rate and periodsize
> - Deprecated setchannel, setformat, setrate and setperiodsize
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-pyalsaaudio_0.8.4.bb => python3-pyalsaaudio_0.9.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyalsaaudio_0.8.4.bb => python3-pyalsaaudio_0.9.0.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
> rename to meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb
> index 987010a14..90050fb14 100644
> --- a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "b46f69561bc85fc52e698b2440ca251e"
> -SRC_URI[sha256sum] = "84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085"
> +SRC_URI[md5sum] = "48c40424a79c2568676a41643d93f1f7"
> +SRC_URI[sha256sum] = "3ca069c736c8ad2a3047b5033468d983a2480f94fad4feb0169c056060e01e69"
>   
>   DEPENDS += "alsa-lib"
>   
>
> 

--------------3B16626F8959E62A1DAB9A26
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/3/20 5:57 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200803095759.9591-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.9.0:

- Added keyword arguments for channels, format, rate and periodsize
- Deprecated setchannel, setformat, setrate and setperiodsize

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200803095759.9591-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-pyalsaaudio_0.8.4.bb =&gt; python3-pyalsaaudio_0.9.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyalsaaudio_0.8.4.bb =&gt; python3-pyalsaaudio_0.9.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
rename to meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb
index 987010a14..90050fb14 100644
--- a/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.8.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyalsaaudio_0.9.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d">&quot;file://LICENSE;md5=1a3b161aa0fcec32a0c8907a2219ad9d&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;b46f69561bc85fc52e698b2440ca251e&quot;
-SRC_URI[sha256sum] = &quot;84e8f8da544d7f4bd96479ce4a237600077984d9be1d7f16c1d9a492ecf50085&quot;
+SRC_URI[md5sum] = &quot;48c40424a79c2568676a41643d93f1f7&quot;
+SRC_URI[sha256sum] = &quot;3ca069c736c8ad2a3047b5033468d983a2480f94fad4feb0169c056060e01e69&quot;
 
 DEPENDS += &quot;alsa-lib&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------3B16626F8959E62A1DAB9A26--
