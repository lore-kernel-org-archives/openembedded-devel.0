Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.54])
 by mx.groups.io with SMTP id smtpd.web12.12453.1595943260550201033
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 06:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RoUtmkCU;
 spf=pass (domain: windriver.com, ip: 40.107.243.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcZJeuQci6GMbGTYBr1kb519NjV190Nw0SdNYY4h9RpQZGuxvMCFPUMo8RLKvEg+rJNVm5oprCzuN7TXNaQz8/ng+Vm/bQjAC17mStAVeXa6px3wFKp+TdJMgzNJLA8gdOXxwa/MKZrLNGUSefnXplizkit7pk2PkIRI5hYhkjAdL9UuJhaZRYLR5Y3cldlV+smLk6Yv8goCUO8imW8HezIFD9S995X2vgjF7xr+nn0njHVCoo1rftDyl/+o9cdtesymh+Os/fRD6qlHMx+ggZi9XxqTyxYKuHFe+yAzxdCU1h8OpKFSdV1UgDRfSzlmRbYTChsb0a7dqlQ+ubnvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiM3ETFUE8MdO5Mewgmu+1PhOB8Whklg8g2pw5d1FVQ=;
 b=nVleECBlElcfO7xQej4T8axBmIbeiYUzVV0Bp/p/BCcaz+7oI3oSauVVfd2sUdQDo3Hk1TNvQBYwgL5XzA+rCkFB8jo6DKGVVoeaVtHPI1ReA8JyfoTO9nxk+o2p4ivE1S/U0k+sklDaczJrpSFp/mH+OGplcmBCAejDXHIlOZP3ZSm84P9qUuESQRC3Ik0jt5xCEp4Rkvw5NH4Nh8Q1Gj6HtgI/IWW5RoWlmFoPNtLSR9bqX1KAqyeV2OhOt/YyTo6hxXGg4NSwJ17z6e+5A2UU9jl5rfA/vz+Zfef5N2yfGs/DCy6kBBRmdpiZmWICuCZY9oNgh7lbiFeffzvxWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiM3ETFUE8MdO5Mewgmu+1PhOB8Whklg8g2pw5d1FVQ=;
 b=RoUtmkCU7gCn6HDN/IXIkGgqVIuIfKCdZ/KasYp3qGpTHzLLSa2BlmR6/CXxnmCwdXBHlQczyXKN60cyvWxz8YWHSXsDwZ3c+SED7Ui7K9oG4jXfCtDyPqr230M30MWWc5EPbgpop0c8mm7d1W0TKQ2GJ8rgOYgg5qPIEfUdFcA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.28; Tue, 28 Jul
 2020 13:34:19 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 13:34:19 +0000
Subject: Re: [oe] [meta-python][PATCHv2] python3-urllib3: Upgrade 1.25.9 -> 1.25.10
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200724163307.1818-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <25369cb9-ecf9-5a48-5aec-a5aef511112d@windriver.com>
Date: Tue, 28 Jul 2020 09:34:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200724163307.1818-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::9) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0130.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Tue, 28 Jul 2020 13:34:18 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c80cd08f-9da5-43d3-f7a4-08d832faee0a
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4103F027C6933BFA480D58089F730@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	spGIGyB0xEvdykJYh2GzvDUG1bbe+NNPEdxlFqHj/5WpGk8sProVkjVfZz30eu7c5YI/i577jy0XqgHy/wiD6vPyKriFyOshR6oUP3qmeCJfFpcWmUb4Iz9Jsbo2gj8SD6zUOpOFhnBLMab8akmiAw/ppmnv24ULoPHXBkFtyMHu/yg40Ev0CenxN+XJI4/3SFouU13qV7RDfCkK6Bbsl1NtVL/HmOHNjlD5ahOUKOFqYKXzIcEgqQi0Gv08CLHc1yFxpN3mnMojZD2DdiyXz+WcM3haf35zGBLQ+REXg8HgurdQ123+hfMeQ1L5QV8tbnQjZhEX3uBeqTSK0K/xXIdWf1EMnPfFYMdj+iOM3i/PPqLkUfhtDoMTj41hCoURgU+GygfM08gGJRhMbZlGEIgTuJKIeZYbUWaCwyUjAOjZKYx+1wjapsZvsYLwoMK6AX+Wc5Vm1ksOE7aaAQRrNw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(376002)(39850400004)(396003)(346002)(8936002)(478600001)(966005)(52116002)(36756003)(2906002)(33964004)(8676002)(2616005)(16576012)(44832011)(83380400001)(316002)(86362001)(31686004)(53546011)(166002)(6486002)(16526019)(186003)(66946007)(5660300002)(66476007)(66556008)(31696002)(956004)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	WYNRCw9RZ9caRNtUjvfrtmdAgsslTh8gsioF/HXF3X75e7t5fSHwoQnVwD02OpqpDWaGSu/qAAVuPyHUxnf4WhnG9DLp28/C3jUr5kPYotSB1uxJHz4ovAmLR2zX+wOykEXGJfy8Qssl4Hk+wef7DzI5Oirm4b2gYR/vcOWNeL6p6A04R2awhA4UW6hoaRYnuJeSx4oIEDB70C2XBhDbqeH2VqZTIVDqjwyf17bLyVw2PzFnuioVfu37NcvnOMobzBIFWTpquWy0QfNbUfo1RZHbRta1PUvhACZDCWJknPUPouOr33PKw1xhYzXNv/RzUfHnT881xmOYZUMqSiHuUckVj83DzVamTFbVm214VA/Q/7tmCstqLIPoMlTxZnzztl8Lz/5X0fTnxHohPt5o4Dw1fuvKybnd8AVmdxlg7gYrR7IWnokv8zPbfYRF4yWQGMeOm9dRcctP1CBDO9d9A79PsMhkfr3fQKs4VN7lF1A=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80cd08f-9da5-43d3-f7a4-08d832faee0a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 13:34:19.4481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XteQUTS6hSK2v96L5nQzfiuy3xzIMAcoyR45CSc866Qk82ZHC7783gVTH6TAKqjMYmg/ZMnZ0EJJTGBFYn5pQnaLP63FsnFwAx5uOf2ROF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------FBC3CDFA70D34AFA4A3BD039"
Content-Language: en-US

--------------FBC3CDFA70D34AFA4A3BD039
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/24/20 12:33 PM, Leon Anavi wrote:
> Upgrade to release 1.25.10:
>
> * Added support for ``SSLKEYLOGFILE`` environment variable for
>    logging TLS session keys with use with programs like
>    Wireshark for decrypting captured web traffic
> * Fixed loading of SecureTransport libraries on macOS Big Sur
>    due to the new dynamic linker cache
> * Collapse chunked request bodies data and framing into one
>    call to ``send()`` to reduce the number of TCP packets by 2-4x
> * Don't insert ``None`` into ``ConnectionPool`` if the pool
>    was empty when requesting a connection
> * Avoid ``hasattr`` call in ``BrotliDecoder.decompress()``
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-urllib3_1.25.9.bb => python3-urllib3_1.25.10.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-urllib3_1.25.9.bb => python3-urllib3_1.25.10.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
> rename to meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
> index 8cbc1f9f9..db985a2ff 100644
> --- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
> +++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e"
>   
> -SRC_URI[md5sum] = "dbf9b868b90880b24b1ac278094e912e"
> -SRC_URI[sha256sum] = "3018294ebefce6572a474f0604c2021e33b3fd8006ecd11d62107a5d2a963527"
> +SRC_URI[md5sum] = "94e3d4d472a14e788d4bd1a903fd102b"
> +SRC_URI[sha256sum] = "91056c15fa70756691db97756772bb1eb9678fa585d9184f24534b100dc60f4a"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------FBC3CDFA70D34AFA4A3BD039
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/24/20 12:33 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200724163307.1818-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.25.10:

* Added support for ``SSLKEYLOGFILE`` environment variable for
  logging TLS session keys with use with programs like
  Wireshark for decrypting captured web traffic
* Fixed loading of SecureTransport libraries on macOS Big Sur
  due to the new dynamic linker cache
* Collapse chunked request bodies data and framing into one
  call to ``send()`` to reduce the number of TCP packets by 2-4x
* Don't insert ``None`` into ``ConnectionPool`` if the pool
  was empty when requesting a connection
* Avoid ``hasattr`` call in ``BrotliDecoder.decompress()``

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200724163307.1818-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-urllib3_1.25.9.bb =&gt; python3-urllib3_1.25.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.25.9.bb =&gt; python3-urllib3_1.25.10.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
index 8cbc1f9f9..db985a2ff 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/shazow/urllib3">&quot;https://github.com/shazow/urllib3&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e">&quot;file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e&quot;</a>
 
-SRC_URI[md5sum] = &quot;dbf9b868b90880b24b1ac278094e912e&quot;
-SRC_URI[sha256sum] = &quot;3018294ebefce6572a474f0604c2021e33b3fd8006ecd11d62107a5d2a963527&quot;
+SRC_URI[md5sum] = &quot;94e3d4d472a14e788d4bd1a903fd102b&quot;
+SRC_URI[sha256sum] = &quot;91056c15fa70756691db97756772bb1eb9678fa585d9184f24534b100dc60f4a&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------FBC3CDFA70D34AFA4A3BD039--
