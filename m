Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.74])
 by mx.groups.io with SMTP id smtpd.web12.7243.1591881828219835435
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 06:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fpOjnKnu;
 spf=pass (domain: windriver.com, ip: 40.107.223.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFeSmWxvPdghRqix/9MCDxlNuiCZeG2iVM4svbdZ24CrBoWrMjVuPTiQiLE2/o634DUY1J9G5En5kc8lfKnWbgwKwUSZPvoAVlZWtIaDJ1I6Lio+3I2T+LE7v6iF8QWdCoohzMJIFwkF8bumwU/F/JgoAePJr2EmnMzFCvc1bgw0TjjPdYNRJR6MHjJos+zeyc/n8RvoQZEoEXMjbpwm89T7+ne161XA0aKJO2Qb0ijiW2Zm5waD7i7h44ZuprCs7T1VEclFHRPcuhPVYZcdGK3z+5XXs479DjKrMt8Kr4SOchF7Qau/RM8VWWUGe+9NfPPidtsxTkk6ZKUnHm3Www==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CK5kQBEicFXgtqILBZl/smpCxHAdCMB67gNWFT4RUN0=;
 b=dF1wy5DcZF8EmapoeyEOAu7DNuY1GXWjh0rj0a031/LSxYsP6rZu02wqnhc1Ai2ph6eRMKsEy7ZuesVqfgs9EgdukD0BFzjFLYl/h1p8dV4oMpQEUFRRSn/Az8Cxfrsi/O0TmWUH3pUoHwhW4hr08MDdTcdAsEcoJ2cTMq7hRbgRAAS6SwiZob5TLueWzCNIfDKki7KRsGzHxiMV2weymY7Ys8+Y6iAl+AEtMTGTLF1u8sWI7Uxnkr2pgthqAHaVkFbBCRI3PQ22bEfCOWVWBGCJHYOg2iyVU4lJoKLY1BmWu2OO3nzILgGZv5A7MpMtFPchrtbvQ7jcWNzvWfbBGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CK5kQBEicFXgtqILBZl/smpCxHAdCMB67gNWFT4RUN0=;
 b=fpOjnKnuj7wFAMP48qaQ6o6decct4GLqdW47VR3U7aRpe1501ceMIoK3N7vH1xTJrWQBb8iynjAyK+fpkLYTLATinDvHS7WqjeabOgBQiBoWYbZt71LflFN7kY3UYIfQGgurxKFKqeb9eDSdiSI4/kbptf5gmmKvJXZHdSf/AzE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR1101MB2068.namprd11.prod.outlook.com (2603:10b6:405:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 13:23:47 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 13:23:47 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-nmap: Upgrade 1.4.1 -> 1.4.7
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200610131536.31426-1-leon.anavi@konsulko.com>
 <20200610131536.31426-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7b252363-f6db-027d-07fd-9c29af917532@windriver.com>
Date: Thu, 11 Jun 2020 09:23:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200610131536.31426-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0094.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::33) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0094.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Thu, 11 Jun 2020 13:23:46 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c6b0532-8474-4137-314c-08d80e0aabef
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2068:
X-Microsoft-Antispam-PRVS: 
	<BN6PR1101MB20685766893171FF4AF21C8F9F800@BN6PR1101MB2068.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qz9OBdpXi/qlixpr9jeXcvUKnVq0M1jY/sp8lFScTUrBTLyD0QD13GIffpMxIsvfHgimvFAjaSG08G+oZWMhSo9qNh5JGKB7mIpOCKhXSajtwTaC40bLwfmSYmGIjigW9E4m7lTGC2gnBD3KUO+RAhmIRRXgj9eIYMOk8pmsBUhTtj1uCacxNR6ez9zXejgqCYOOa1+hcJRPF8gaidpU93YkhZLPhUZs/9vHPkyxxRgzACMomdAxXhQO5BSCRw4T8nHuz1CnP6j++PcqRVkdY0dXvQusTsbM/W3vpI+kYXJMFgA1FL9iC+8d0GN5WcdDKYnbV8SeUDidzqiRjZA2iGnoqIsHyRDc6sUZxQDbW2r07QqzkESfvhOCV/UISOqxUwv5EWk13MszqIHW0cUll4LbG+/uvBpa4NXT8yVvykU7UzSIZUbAfzC/m1QWpVTM79jEdrSrHcumUsJt1ca9cg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(366004)(39850400004)(396003)(52116002)(5660300002)(166002)(66556008)(26005)(66476007)(86362001)(66946007)(36756003)(31696002)(53546011)(44832011)(83380400001)(186003)(8676002)(956004)(16576012)(478600001)(33964004)(316002)(6486002)(2616005)(31686004)(8936002)(966005)(2906002)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	q4gPnDqdsl3c2GC+JztanDWLcZ8LGSEeydRaxQViA0CjQKuNHrqbXbpIlpjLA23gr1gYwZntMAx3QmR1yYuDH17tf21juRi+/5o49p/9UgydfL43jlGQhjwfsZI8UTtWna/IFK3ReddvCo6AHF0w6oWHRQLSL9jBaFMKMyF45OYDTIJqiEMEtu2Y6/mAstBKR48PCBaWjhLyuybFeklK0Kv+kLxMjPxOvTu2G9FobpPChoqJWxoo32ZKwGvbz39U7qXH1j8QLECr8mAS2yIVIPIcqaNxDta8+havE2wJAFp1bmGd8GdyKDKV3ZbD0nRi3sSeeClxccl7lXGztFHCRM9oPvV0WSrwacIAk75UEtpQHAZzoBpH3fFuZGaodbYQFhFxW4E9JCKMQ5YGHojBaV0aL1nzIgzlaKpFkHJhNLPWhShNFXl6+z/GVVSKz2tn5l49OXKkFo8ZF/tbOvftdf5E0U/jaJlyAC0ojQdmT+Tj9otfbXVvBclFFirU1iZH
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6b0532-8474-4137-314c-08d80e0aabef
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 13:23:47.1735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3b9CBCps0tzkFrhn7E/XQxzKYWRhuBJkNvA0v76O7SfVmoBB48jeZGkds2fTsd1CB/caVlkblNUMuVKZFKWB6Fl2N2Olm7GpFtTTBrP3RQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2068
Content-Type: multipart/alternative;
 boundary="------------0713A75612DD2FE2333B3E47"
Content-Language: en-US

--------------0713A75612DD2FE2333B3E47
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/10/20 9:15 AM, Leon Anavi wrote:
> Upgrade to release 1.4.7:
>
> * Minor bug fixes
> * Documentation updates
> * Added support for UDP
> * Hostdiscovery and major code refactor
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-nmap_1.4.1.bb => python3-nmap_1.4.7.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-nmap_1.4.1.bb => python3-nmap_1.4.7.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.4.1.bb b/meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-nmap_1.4.1.bb
> rename to meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb
> index 80384845d..5ebd75711 100644
> --- a/meta-python/recipes-devtools/python/python3-nmap_1.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb
> @@ -8,8 +8,8 @@ DEPENDS += "${PYTHON_PN}-wheel-native"
>   
>   PYPI_PACKAGE = "python3-nmap"
>   
> -SRC_URI[md5sum] = "64a382c870e14b53f2f52b7455996321"
> -SRC_URI[sha256sum] = "9b64c5956789f4cac9e8ea2e0de6763dea1cecde1a20ae50a4b4dc5ab0ab6e42"
> +SRC_URI[md5sum] = "4dce15e7889b1e9bfa8e1e2e0904795c"
> +SRC_URI[sha256sum] = "127b7ad604a3fd34578a6ad848a603ccf1608c607577eb3bba097a1e2fc8f48a"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------0713A75612DD2FE2333B3E47
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/10/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200610131536.31426-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.4.7:

* Minor bug fixes
* Documentation updates
* Added support for UDP
* Hostdiscovery and major code refactor

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200610131536.31426-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-nmap_1.4.1.bb =&gt; python3-nmap_1.4.7.bb}   | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nmap_1.4.1.bb =&gt; python3-nmap_1.4.7.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.4.1.bb b/meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-nmap_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb
index 80384845d..5ebd75711 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.4.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb
@@ -8,8 &#43;8,8 @@ DEPENDS &#43;= &quot;${PYTHON_PN}-wheel-native&quot;
 
 PYPI_PACKAGE = &quot;python3-nmap&quot;
 
-SRC_URI[md5sum] = &quot;64a382c870e14b53f2f52b7455996321&quot;
-SRC_URI[sha256sum] = &quot;9b64c5956789f4cac9e8ea2e0de6763dea1cecde1a20ae50a4b4dc5ab0ab6e42&quot;
&#43;SRC_URI[md5sum] = &quot;4dce15e7889b1e9bfa8e1e2e0904795c&quot;
&#43;SRC_URI[sha256sum] = &quot;127b7ad604a3fd34578a6ad848a603ccf1608c607577eb3bba097a1e2fc8f48a&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0713A75612DD2FE2333B3E47--
