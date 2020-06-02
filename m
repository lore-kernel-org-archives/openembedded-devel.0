Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.66])
 by mx.groups.io with SMTP id smtpd.web12.2170.1591114392832240547
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 09:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GIUUrS4z;
 spf=pass (domain: windriver.com, ip: 40.107.220.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+8p5NFbMsupvp9D950iaDa+1R/+YUVHRqA8Pa3/bc96xXJNBheK/4X8ZG4iOaQRkN80ZSoeXWdkh0ZJTC6o+RM7ChOf0ukwYi3qcF9UpzYNu2Y/Aitdl8ftwEg1JMi3jGL/OnRlS5mzGNXhiskT4N/zkVXilCiqes37ks9v7PScDOBUf2DurLA+YYPelxVa0Zd03kxFXKkybWk0RbGk1W0VzJ61COCtApmGoaW4KUzOuB9VfG1EkjZY5sB5/TgfTbQmKepr/n3AOt8TPaOwfuFKjzG3hYWuU/aFZjCJLtvGrMUyDzTvH0pBoWBKyiEwnooA6zkE6RolX5qRRf+UZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3naAYt84CP7Ttx9aE2VjPXvu+2AOcgGpte+8AFN79c=;
 b=W0yWLMt7itsGiRPFENjnGOlS5CTqv+X6CtzHOF3jiusP42bcX31vfnS6bSqL4oqxmUYsB0Fs0IfN+PBYABbWah9TmE/JvP0qs+qMoPowrBhDZpiVKwrMTGU3q9WT5wPJujjADuycw2P6EBIp8xgRq2Q/clMAf/u4ZPa2lovfow2kH7OJOkBTcn3CJV4Vl0EPaoasixwHJAXV5Wlmhg/u+foq6NubUxe3X/hKWRxWskf32FfW5tsPqbVJAcNoX5JVbD2mc5vcgoWM30Ry6B8RCcVrgQCPZYP+jiCZ6lN7WxnuOgyBaIFMZEAWhJK2GLZvQtL2eFFSGz1bzUqqIjoTmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3naAYt84CP7Ttx9aE2VjPXvu+2AOcgGpte+8AFN79c=;
 b=GIUUrS4zx6Jc2zUl8Rcyha4yXw/6GTAD97ot+1+tlu4xM8wKyXuoDix8xPZiKRlQ8dWEmP/Q7dD5hmQPXkikDjTVtljLbVJfnJRHz6J5uzHbuZ/LvMW8fMLLrkI8b8QBIYQXbzsyvT3ueQ38cw1jZky8ZMwtF0hfX7lxPSWg36M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1491.namprd11.prod.outlook.com (2603:10b6:405:8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 2 Jun
 2020 16:13:11 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 16:13:11 +0000
Subject: Re: [oe] [meta-python][PATCH 4/4] python3-python-vlc: Upgrade 3.0.7110 -> 3.0.9113
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200601120419.13396-1-leon.anavi@konsulko.com>
 <20200601120419.13396-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a1a742c9-f020-bcf8-e5e1-3e95c5e0fb3c@windriver.com>
Date: Tue, 2 Jun 2020 12:13:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200601120419.13396-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::13) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0134.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Tue, 2 Jun 2020 16:13:10 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebc48da7-c9f2-4d52-6593-08d8070fd85b
X-MS-TrafficTypeDiagnostic: BN6PR11MB1491:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB14910E47D0013CE15E7EB3989F8B0@BN6PR11MB1491.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QEtq72SG037O9Ph0XLYqgez2DLjIB47b/+3+6y37OGe4XcxdhApVrKVAUL9Kxi5BIy6vkzWRDqe9PKltwD49PE1jFSPHDiEN4xShclHgqD5ImKtUb+zRA/k16cbzfub3ia8wqO1BKdPtHSeCjYpNBWid9a2NZG2iyU8SdaPHWlwxEr5sXxYIfQC8aV1HRtafT5qVdYSw2SEDp2MuaLtDCQMvcwYT/w2birAWVBztTzoSuQ2Bm/aVVV08h5QWzxIdEP4qQRMLwglsvt+NYF924jv+HTuuhQsPzzixW+LwYe07NwYgiPcU9/SUzCWhViufNNIuj991YHMqlLyBWo1G53B1JZvH43P7KV3+kBgqaXcJZzejAvRWgL6sZ9u5f1VIVnx4LP9uJqvL1ElfPWyoR0CQclD92FEI5N6tZhwpoPqKlfwRDbFBy5+IbXwQ4Ft3/yCMA/CKVR5w2lqbFpHyAQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(396003)(39850400004)(136003)(366004)(186003)(16526019)(53546011)(33964004)(6486002)(966005)(52116002)(36756003)(66556008)(86362001)(26005)(31696002)(66476007)(2616005)(956004)(66946007)(8936002)(44832011)(5660300002)(478600001)(316002)(31686004)(8676002)(83380400001)(2906002)(16576012)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rVcezt57H86sdEPFghpLTFLDgHdqiWY3nXuXkoITc5GbhyHfMEeD9BdCkaWWXzhWDuQu26GkOIm0dkTlSp5NbUL7YvDzUMFTfr3e3xzHRh8Ayr7Q3/LNDHkNs50HB/AQZ905lXRxlDpV4tcXgcg9ge87gEVi4LfAYvvgTtDmnsKeUpOyYEA66b3lEDfyUm2f56mha5I3MZZXVA49WJD/D5XmrnnjsWniWVc913D0pMdPZdXpMDzmg+FDXCbX+GYUz7efnijWg//THBBgl/tO900j/yNsBo2n6t0vK8IMYz61qzORNOc8iOhqynCCIGA5ZU254kCPe2TN2jf80VqaHFj7rv8MCl3rIdWJhZann2PwVgpco5+zpLHZhVm0ghn2qUNtt33JM3hY0c/pwSCqm4O627khlKoTy3A08pOiEnsFXTpHJbUGTHL+I/Ks0/DTPhOQ7UzN4acuImBZQ3HtQUlpKgiwcmu6eE1QkHI+4IE=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc48da7-c9f2-4d52-6593-08d8070fd85b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 16:13:11.1796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtyX909zQrFWmZeMjVZb2H9RFvGOMSto30muuuvDCWeuGayIg+Q90UymtFqqhvKdGVYrcezcl6XIazoTo7Xccwz3miVyXaQTxB+EOSijToE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1491
Content-Type: multipart/alternative;
 boundary="------------6900EF93BE11813838715BEB"
Content-Language: en-US

--------------6900EF93BE11813838715BEB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/1/20 8:04 AM, Leon Anavi wrote:
> Upgrade to release 3.0.9113.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-python-vlc_3.0.7110.bb => python3-python-vlc_3.0.9113.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.7110.bb => python3-python-vlc_3.0.9113.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.7110.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.7110.bb
> rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb
> index be63fed02..6d53e3381 100644
> --- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.7110.bb
> +++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "wiki.videolan.org/PythonBinding"
>   LICENSE = "LGPL-2.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>   
> -SRC_URI[md5sum] = "e128abf7115d6513582bd460c0e74485"
> -SRC_URI[sha256sum] = "821bca0dbe08fbff97a65e56ff2318ad7d499330876579c39f01f3fb38c7b679"
> +SRC_URI[md5sum] = "a3a7d64bb4c6c1cd5569173ceef9cb67"
> +SRC_URI[sha256sum] = "5422b79d347b6419008ee91cfd9663edc37eaf2a0bd8fb9017d4cc2e5f249dda"
>   
>   inherit pypi setuptools3
>
> 

--------------6900EF93BE11813838715BEB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/1/20 8:04 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200601120419.13396-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.0.9113.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200601120419.13396-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...-python-vlc_3.0.7110.bb =&gt; python3-python-vlc_3.0.9113.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.7110.bb =&gt; python3-python-vlc_3.0.9113.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.7110.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.7110.bb
rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb
index be63fed02..6d53e3381 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.7110.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb
@@ -3,7 &#43;3,7 @@ HOMEPAGE = &quot;wiki.videolan.org/PythonBinding&quot;
 LICENSE = &quot;LGPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=4fbd65380cdd255951079008b364516c">&quot;file://COPYING;md5=4fbd65380cdd255951079008b364516c&quot;</a>
 
-SRC_URI[md5sum] = &quot;e128abf7115d6513582bd460c0e74485&quot;
-SRC_URI[sha256sum] = &quot;821bca0dbe08fbff97a65e56ff2318ad7d499330876579c39f01f3fb38c7b679&quot;
&#43;SRC_URI[md5sum] = &quot;a3a7d64bb4c6c1cd5569173ceef9cb67&quot;
&#43;SRC_URI[sha256sum] = &quot;5422b79d347b6419008ee91cfd9663edc37eaf2a0bd8fb9017d4cc2e5f249dda&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6900EF93BE11813838715BEB--
