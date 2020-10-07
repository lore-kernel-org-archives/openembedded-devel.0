Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.43])
 by mx.groups.io with SMTP id smtpd.web12.1598.1602078581951153798
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2020 06:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ik7+0g5N;
 spf=pass (domain: windriver.com, ip: 40.107.236.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYlVTSR2q6fYOQ6kI8nnxOgfFv5iiG355XyUpfHL3QmN/0UUXF6fRqrEVi0XpnZ1xnDBIu/SZhWEk1+gqyK24fSZi4ldJV3vZM1dAIh1TRwygpBcVwKzjIyb671/5wzw1v0zhhC/SKZDNG0xAA215VF5rbBW6gI3pRBi9Zu2ZRquTgg4E4cqLd3FwJ74nMYRrl3D+J0VkCmMzpQ+p9/rXB/h2Q2f5dOJbL2eCRUdv0v1ahP/8icj6SxuVRUVLq68yxPKZKHlYAwHWvSwMzHu+yan9QzVKj3slzoaRML+nEbGzVcwp8acg2MdMOyvzahVkjhd8z5+YJuQu7j3oD1G3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyrG6Qg34tKxxPwB3MKnEsYBEEAaKnRyE4BRdEBYrAY=;
 b=Pu25VpIbS3FJ6VP7+WifgDwqKGSyoz56IlrqzJRKT767m2hRiAexmq4GiJAQrZxAP1k3bJkG7gRlLeA319nWCQaisGY9NRiU9TM/Sh08iwexPsSnLQbBYFLPaTyvqoHKBHFJCgAcCWVmL3dY62RX4hvdC32BMr7Ez85FwJpUTFv2OGD1VYuX9fhg7uUZg2mOEfYuMWnpqCeGYR4mJtDpL9Q65CSXY6FUlZkLyf0xHyb/YqyveVfA7Fne6nbDcflXj5INubpeWiWwNaX4k/7PtCi4SeMNqdptf7/ZGspFNhCEQ45EDFMgM/pqp3EMaJ54rmyR9egtsfkviEsKEWoIbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyrG6Qg34tKxxPwB3MKnEsYBEEAaKnRyE4BRdEBYrAY=;
 b=ik7+0g5NdHFnniknmp93usSoY61x4Con9Lmcg3aYHpDReYeYcaJOqTGlPP4sZE4pvS1GV4LKoXI61nqCMNyn8Bjt4W6OL/NrJxmR04/PFIc/ClKzeuE41LWE2VYyofulQi8BWYn4Rc1HoO11YE+PD8QPCxo9D659VUnGjSF8w4E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2536.namprd11.prod.outlook.com (2603:10b6:a02:c4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 7 Oct
 2020 13:49:40 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 13:49:40 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-pandas: Upgrade 1.1.2 -> 1.1.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201006090526.24310-1-leon.anavi@konsulko.com>
 <20201006090526.24310-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8b4377a5-1013-bf26-2bb0-e252eeaadf53@windriver.com>
Date: Wed, 7 Oct 2020 09:49:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201006090526.24310-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend Transport; Wed, 7 Oct 2020 13:49:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7118c4a7-8c47-44b8-9d74-08d86ac7d683
X-MS-TrafficTypeDiagnostic: BYAPR11MB2536:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB25362B758015CA2A8F1C22999F0A0@BYAPR11MB2536.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0tkwxKyJ5JjLm+h3P6j+Gu4jg5noZYI65oCDqUMgNR5zPKVj4qP6+TE1SCJKjcPYgW7tYxgsRS7AmM3wB4Nbtn3vhg5skCZduew4YbUV3OW0ERW3bILtEE8B2bOQoCfRmbdgpbnKJRjU0m1JP+fxkcdNM05gq7rI7FW67cXtNSCDspq6pEjzDpav/SXjntyepxY2tbk3G/ZwfzYevd9f4QecTVXmukoYgunPRvOyNJATJCnzJt8q9k+5JL3q/LwZUWT5oCx7gRkREojhz4JJqgQ189VAiri/zg0UELEvv0nsC4DRmfXRXccmfTCjcG47QcPG2lVctgSr5RbqDVBYDbzRk/W7JBY/A0SNDu8vtuihAZyzipnIg7wGtvH/LViH02+585PN6qOFmijYTteuGKtbJMYOh0OGnLhpAXzmwlnjydFM6m7FpU7AupRq14FpD52D3RzuuZt9STFA2cKmbA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(136003)(346002)(376002)(366004)(396003)(86362001)(16526019)(26005)(186003)(166002)(66556008)(66476007)(66946007)(83380400001)(2616005)(956004)(316002)(52116002)(16576012)(8936002)(8676002)(31696002)(6486002)(33964004)(5660300002)(83080400001)(53546011)(478600001)(36756003)(966005)(44832011)(2906002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	VvxiIWOP58x0BjTSdT6LLCx9PbEWhIcXEhC9m4bu5Kast9RtXHQu08/+eQVy1MJ5YVVrdNV2m/p/28cK+YGcb8whZKm33GbnkdqJ3Aql/+rIQrrA3yM6c4+9rTjvAz0Yw7qwqm0qD5RYbJNIbiIf5i6DSq03gTu5Nv9tq3UcYx7klCVutFxjd8FU2+8LMlyggUkoxoouGPFTjhzSNuc5Wy06Bh8RSSfoRkWLcClaNLuDtgOZEQv2fiXQPUIvNXpGFV4pcX83SpJrBUm8Cke3lKi4u8PtdFb20bxQsh/YfaoGzy9JNkoAxzeaoneBp5WYDlbNW28LAdsCoU1q09V3Pl1Aa3tslJbrvbldwLIHkkb3074lscwImOmLTgReYNHDomi/CMG3zAKLJiDgXNFoRerH4es1wrqCqotsXVLiD6wyUrkE29wAIrgMnN+9yaKS6xa+WH8Dq+nID1UV9UcnijeZUl/ifHYRN2/8SJrW7uaGTbEBhD8PG9sjHYouQBtgLKs22FHxqLczVMIFjHhwxSdgjGebcQK50AydpjeZHmkySN/3Xe3wx/8uLNntlkDblQawgdRfSSbfkoQ1n+frVhamBJybIA2MDaUxUuqn3IftmzNvQe5sc+57GlfJVfLGVZINfTxnNsFDsCtzfBFAYA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7118c4a7-8c47-44b8-9d74-08d86ac7d683
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 13:49:40.5879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pj834yxs2cZfIjjA7cBg3Bv68o3QsSZqMe7rGIDYqwtGrycZEBhe+ET2HmSV5XeKsCSr4CLGwLFMoU1VIaDN0sDZz+r/ef5w7rNWy/duR0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2536
Content-Type: multipart/alternative;
 boundary="------------40150E0EE4C4DA9488FE0225"
Content-Language: en-US

--------------40150E0EE4C4DA9488FE0225
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/20 5:05 AM, Leon Anavi wrote:
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pandas_1.1.2.bb => python3-pandas_1.1.3.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pandas_1.1.2.bb => python3-pandas_1.1.3.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb
> rename to meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb
> index 1eade9884d..da1ffd0b6d 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb
> @@ -6,8 +6,8 @@ HOMEPAGE = "http://pandas.pydata.org/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
>   
> -SRC_URI[md5sum] = "b4ce7c64f549ed48b47877fc64281031"
> -SRC_URI[sha256sum] = "b64ffd87a2cfd31b40acd4b92cb72ea9a52a48165aec4c140e78fd69c45d1444"
> +SRC_URI[md5sum] = "f10372d83a1c55cae217e8c05bf9bc5d"
> +SRC_URI[sha256sum] = "babbeda2f83b0686c9ad38d93b10516e68cdcd5771007eb80a763e98aaf44613"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------40150E0EE4C4DA9488FE0225
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/6/20 5:05 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201006090526.24310-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201006090526.24310-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pandas_1.1.2.bb =&gt; python3-pandas_1.1.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.1.2.bb =&gt; python3-pandas_1.1.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb
index 1eade9884d..da1ffd0b6d 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb
@@ -6,8 +6,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pandas.pydata.org/">&quot;http://pandas.pydata.org/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774">&quot;file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774&quot;</a>
 
-SRC_URI[md5sum] = &quot;b4ce7c64f549ed48b47877fc64281031&quot;
-SRC_URI[sha256sum] = &quot;b64ffd87a2cfd31b40acd4b92cb72ea9a52a48165aec4c140e78fd69c45d1444&quot;
+SRC_URI[md5sum] = &quot;f10372d83a1c55cae217e8c05bf9bc5d&quot;
+SRC_URI[sha256sum] = &quot;babbeda2f83b0686c9ad38d93b10516e68cdcd5771007eb80a763e98aaf44613&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------40150E0EE4C4DA9488FE0225--
