Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.83])
 by mx.groups.io with SMTP id smtpd.web12.258.1610649922549168311
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 10:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=odpnsNfJ;
 spf=pass (domain: windriver.com, ip: 40.107.244.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhA4bwDVFBg58NzFoVLzW1+pM02iCN+uMWN66fCzVgPHDMuyPKWy2otRvgyzg80hhXzrBv2mTURO1Gkk57pnuW8r9B+KeJzTL1QxED9qRT2f9u9zLQXXP9qiFJdk9PoSoU5la3fQkYKlaz0xP41eQuvfTsCTHravGcTQl6/8bZz9liXq9njwIL+XHjsLDHmEabvKgpjkw0HJHvPrU4ot/KTklWCPVE5oW8doNqMu/qUuEBbUrMJdDd6pLZp9v6fxCxt4zvM5sB/iuyQiasIMfZZ4tOFbxE5/b8urLamGc9Wngkwlqbsj0jQtweH1oeSlwBynLKt1xbyy+AQoqfmT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxXaXdb9kabSY3mvww2g0gds1geuzw3q/7gODgHeF6I=;
 b=eZkuaIJpPfvN7k6V+ny+ZOIJsg4uFOMlgZgK785Y+ox1+Zg/RcIlOAvfzeR/m6l5jlh2DIyfx/XtuCWoJ64/LdI9M5XJTLJ7ajvzgtPo7ZuEOv0V5veAK7ujklr0G380rRk/MLw7ZhhlyLeWDP5xZ8s+z8/KTo/zHFvQlZ/Sx3kWS7PBlAz1t4x4EcW2Di2Xgm9s+dyeaiMD1hwJ/b82Ln88+mQhJiyTYVZ5eqS5mgGDaRAZ20l0Fvb6Yso+o+9lftLwm9UJStKx8kq39Ih22CdY1P1nbVJjHUJ//m/gm7aVZqYzgVMASSEnhGgpWcvy+RYl1Q3j/dPPHTasUY5T+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxXaXdb9kabSY3mvww2g0gds1geuzw3q/7gODgHeF6I=;
 b=odpnsNfJWguG4ylUhkvhppzu5O7W9kXnEZ8+u9kjrsfKsemBICN1QZHjFEbPMREJwJOVrqa14F8tq1aImHQomIZDqPZd5i8eGFglq4oXQGH4s3ImKLDnGmlV0lE35h+L1PcbSe9w7/e/rnoAu2yh76JWAT1jfam7aPfH9ovvJwo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 18:45:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:45:21 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-cryptography-vectors: Upgrade 3.2 -> 3.3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
 <20210113142626.27599-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <704008a3-c6ac-e27b-6222-9d58470a6652@windriver.com>
Date: Thu, 14 Jan 2021 13:45:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210113142626.27599-8-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BLAPR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:208:329::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BLAPR03CA0085.namprd03.prod.outlook.com (2603:10b6:208:329::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11 via Frontend Transport; Thu, 14 Jan 2021 18:45:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d8d60d1-d3b0-4dd8-2ffc-08d8b8bc8c34
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4800:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48001FF5A19B379EADC16A2A9FA80@SJ0PR11MB4800.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XA8jrXeBRPyrtoEGoM+BRxeWKcPUIpDpVlY8mfS1qo3VFRhQhrqrm6tAijL6CExYST3W885ReTJRwGMbnKXgNhMLZQbOieVz6+8gNPXy0RpZlDj0sdyg5v3UYQXkzW3jzyF5GexqQ3tgx/rN7Ra41fhR2/ISBBfdRJ/eUGDfqyJq553igFLVqd9jofOuxt7Z3nPIzpANyUZZbsomq023dY7QyshPZPh1htRP87gMh5PVEPbrrAKC8U/qzdK11CY71TemjrQENsqOCXtA8WxMJJW2gE/gs1sK8XKCzE2j9D0dFOpORDhJquoY0KRfWhf1WfBRiwq8k+lmhzsMQu2llY7w8jbWNozG9KTsyFR/rL3kDXK61UAX0ZZyltGK7GHNilKS3DsuAwPNRADGDBmDgJCSGjZCjn+ILhEvw4CgIsU1ZMs9v9jK/B6oFhlpP3dBEKOusH4Mt2v6+61thv3hWXrnQfmfcQsGDp6XL7J3ScPZc8EQP6lf4QVK9FKTKh+ZzbCCCPRjSBsLO/oMl6fFsPoNiHpaZYpWjptpd5PM0U6s/oVKfXqNjjErv5asZWaA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(86362001)(478600001)(83380400001)(66946007)(2906002)(31696002)(31686004)(166002)(16576012)(316002)(966005)(8936002)(5660300002)(186003)(16526019)(53546011)(6666004)(6486002)(52116002)(8676002)(66476007)(36756003)(33964004)(26005)(2616005)(956004)(44832011)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NTVZWmhUbWJmc2JyOFVqUEcvSzNRVU5vWDRZcCtpOEdIbzllSnlScGVtYUpO?=
 =?utf-8?B?c1RmWXZJQWZzMjlJK242ODZ6YmN4cDNKZGlaSmZwdmtpMk5Nd2I0dXFXVWxh?=
 =?utf-8?B?V1JmVGR5K3diTndqVXRqZXY1OGlnVmcya2NJY1F6c1lmRm03VmZLWEFXSmJk?=
 =?utf-8?B?N0hHbDVmOStFdGcrMGhvdGVRQ1R3bW1tZVQ0WVFjN0o0bkR0c2d2MkhVeGI4?=
 =?utf-8?B?Q0poUGFVaFpzSVI3ME5zaHJmd25DYXpxWlJldk9xMDkvc3ZYcGVzNUhHR2dw?=
 =?utf-8?B?ajVXMktCL3RDR1huY29UbCszM0cra25mWWpoT3cyNjN0NGNlUkF4UmRXYkxq?=
 =?utf-8?B?N2VRVCt3eXBNNWV2eVlaZUhmOU9qc0NZOURjTWpweVpMSlhmaloyUGZ6cnVJ?=
 =?utf-8?B?U2dDeC8razdvbGsyMFNkZUVmTUU1cndoVlpYOE1LakdPdWd5aHFGWWc2S1gx?=
 =?utf-8?B?aTZHTVQ4amU2RVc1elRkUjFmTkhHZ3BPZDAvYTdpQStTSUJsWURMbHlEU0Nh?=
 =?utf-8?B?K2szcFduVlFDdjFXR0p5bFZ3UUtCamJ3b2pXbGlGaHdOcmRWeUw5MmovYWlC?=
 =?utf-8?B?NXlLODR1NkZKRGpxTkJUSFRvMXM1d0w4TkgrUjF6NHNmbUpsVFE5cmd6NFRv?=
 =?utf-8?B?d0J4MjZDWHRzbE1SSE9VTVdLdzN3L0tKeHBBSjFRVFFjd05CM0RHR3NKU21W?=
 =?utf-8?B?QmdGcWtCbktjbXhVNUVyamZlSG9jKzJjcGcraEVpV1dlNlBZci92VFJOQmdV?=
 =?utf-8?B?czJ3SE45WnQ4LytiNHA1TlJmMld0NFEybUZwZStRTWVFQUFqZ2dBQ3ZUR2Fl?=
 =?utf-8?B?czdld3U3MTNENUt4TVlCb2tkN3pEeEJmTmlJYjVGUUljZ2RiY0VVM3ZrVzdj?=
 =?utf-8?B?MnVjYXNYUUpIZGNkRkhDMXZCMUdVVlVjMEF6bk9PRjBrNEpqZ1prTldrVzdi?=
 =?utf-8?B?VkFsV09QRW1Jd0pQOGhLbnFPVWZDVitLL0Y1REM5WklGRElsRmo2ejZrYkUr?=
 =?utf-8?B?blk0QkhReS9lTXlyRUZrVUdQSURxdHduSlNuUGhta3NEVHJZSjR6RjYxdzM1?=
 =?utf-8?B?U09vcm0rZUsrSlI3N0ZZd1lOWFltTi8rSzhVZEYwUkg2UEluQVQxREg5ZHdo?=
 =?utf-8?B?TXhoenRHdG9CaFVvTUt2bitGRURLaEgzaXVYTjhtZFZiRlA1ZDlHMVVqVkhv?=
 =?utf-8?B?K3FndThEZFVtT0hRT1BLNnB6THVRVnRkbEdSeStZZ0cyK2pFTTBydllFeDJK?=
 =?utf-8?B?UUpVdFlkQVdvdnRrZjQzY2ZjZFA3emFPSlltZ2lLcXBRNFErdTRYWVlCMGtQ?=
 =?utf-8?Q?LOXouPHuw9o85riFrnVjC7JtkpfZK+010H?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 18:45:21.7668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8d60d1-d3b0-4dd8-2ffc-08d8b8bc8c34
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cKOHz3QrlM0yhjOFJd57/++79Gqvav68lcgdjS2ow+unnHcTMXmaRqGUboqVYHu3NK/ZNIi2H+SUQf0ursbxVrXsAQ6k1GLEe7uYDKIMgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
Content-Type: multipart/alternative;
 boundary="------------3BF9EB42EFA2C38A5EC33AEE"
Content-Language: en-US

--------------3BF9EB42EFA2C38A5EC33AEE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-13 9:26 a.m., Leon Anavi wrote:
> - BACKWARDS INCOMPATIBLE: The
>    :class:`~cryptography.hazmat.primitives.ciphers.modes.GCM` and
>    :class:`~cryptography.hazmat.primitives.ciphers.aead.AESGCM` now
>    require 64-bit to 1024-bit (8 byte to 128 byte) initialization
>    vectors. This change is to conform with an upcoming OpenSSL
>    release that will no longer support sizes outside this window.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hy-vectors_3.2.bb => python3-cryptography-vectors_3.3.1.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.2.bb => python3-cryptography-vectors_3.3.1.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb
> index 2e7ed8169..bcdbc6adb 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb
> @@ -4,8 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0 | BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
>   
> -SRC_URI[md5sum] = "20976284d12ed99e31d38814be038ac1"
> -SRC_URI[sha256sum] = "785f06ffd0bbc73bdd69d0b164d72a7a7827c7c3bbf79ae9a235d7126afd98e4"
> +SRC_URI[sha256sum] = "03789c305dda8dccb4b8c9c019963a742469d88365abbc82e8e898ac478f5ca4"
>   
>   PYPI_PACKAGE = "cryptography_vectors"
>   
>
> 
>

--------------3BF9EB42EFA2C38A5EC33AEE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-13 9:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210113142626.27599-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- BACKWARDS INCOMPATIBLE: The
  :class:`~cryptography.hazmat.primitives.ciphers.modes.GCM` and
  :class:`~cryptography.hazmat.primitives.ciphers.aead.AESGCM` now
  require 64-bit to 1024-bit (8 byte to 128 byte) initialization
  vectors. This change is to conform with an upcoming OpenSSL
  release that will no longer support sizes outside this window.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210113142626.27599-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hy-vectors_3.2.bb =&gt; python3-cryptography-vectors_3.3.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.2.bb =&gt; python3-cryptography-vectors_3.3.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb
index 2e7ed8169..bcdbc6adb 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.3.1.bb
@@ -4,8 +4,7 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;Apache-2.0 | BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4">&quot;file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4&quot;</a>
 
-SRC_URI[md5sum] = &quot;20976284d12ed99e31d38814be038ac1&quot;
-SRC_URI[sha256sum] = &quot;785f06ffd0bbc73bdd69d0b164d72a7a7827c7c3bbf79ae9a235d7126afd98e4&quot;
+SRC_URI[sha256sum] = &quot;03789c305dda8dccb4b8c9c019963a742469d88365abbc82e8e898ac478f5ca4&quot;
 
 PYPI_PACKAGE = &quot;cryptography_vectors&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------3BF9EB42EFA2C38A5EC33AEE--
