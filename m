Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.57])
 by mx.groups.io with SMTP id smtpd.web11.13545.1604501091264377014
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:44:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OmU6JH9N;
 spf=pass (domain: windriver.com, ip: 40.107.92.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9iAXAf6rew7SctZKy/mN32zYgAIcMc46/q8xY4ie9lMYvF0Ms14uQHai9d41awt5PhNGAHvnY0tLCgp5vubxQpfNTn0pE9YTFtv823bqNkAGg/vthT0JT5gyHiACYuvn+rjfVa/Cc/O5aEvNEaa3OSsH4VQaJyvWa5DrQFZFDfUVteribDlOa8lleh7axjToZdEN4Mh5j7SMlgBe8Sj6QyazADvghnBFDvuhBhfq5/5gqVfIDR0ZbC+1qX10SfYyZL9jAU+a42/Nf1DnXeq8csOW3d5H4OYxat4r+Mckr7FSpYiHjoxV0JqlTs/WEmSCOE6+jj656pd3MW5U0Xfpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ql12/MPNvZs2St4uj4brMZjFuhJ5x8kkjtP2nwTONFI=;
 b=do59rO7GWthfQA6QSM5liIcdSOpYFOzZsX4iQePsGk0N7ugI4bCee1gN5QI7FNP3R6pB7vrCam0nUgs0M5IM0KWe3sUOr+Y00jLv0dbs7nD7glkhfq5LPJWOS1VI/K2RS6WQ1mGF7tD092csbyLW9U9rlFokmMxn/22HHv1U5wFLYgF4Uq4Xb8wUqcx/hgcLUCt3rODkkQTAwiTFJigO3N6NQWFu/ZH2ikg+WQwoQp8dliLpNX/L6FxMB8EnUxEX7l10RoFGknZbR46dga/D1nLmRxgAdFLw0LDukFys+xJ6YQitdsD5c/luo9s6q0gLqtQnSulr7mL4q8ENmlai4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ql12/MPNvZs2St4uj4brMZjFuhJ5x8kkjtP2nwTONFI=;
 b=OmU6JH9NgZkIzEYOzw0Kfu05pzJee6cZh9cuRLINL/sGpVWqYalzKHLLNNmblujYLG/lhV++XO76m+huMiXIzJehgg9E87P6Cdn6bOPaDCxyBOgrs9p158d339f2wuNHjsyd59rE2gnFzDXn41l4WfW+Is81dpeY9ikZYlayuCg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:44:49 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:44:49 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-cryptography: Upgrade 3.1.1 -> 3.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201026115041.11671-1-leon.anavi@konsulko.com>
 <20201026115041.11671-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e2bb6538-4a2b-921c-e639-8a16c9c8e61c@windriver.com>
Date: Wed, 4 Nov 2020 09:44:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201026115041.11671-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::45) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR05CA0032.namprd05.prod.outlook.com (2603:10b6:a03:c0::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend Transport; Wed, 4 Nov 2020 14:44:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3386f6f6-126f-4e10-3123-08d880d02e84
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50850588C627310E2F5CB8559FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gEVSWyp582fC+m0eray05e3Mw6yKzgy/gx3DfDOw6wVJ61tU5HkJ1NtmDH/I9X46+TfCHkV8tjrmiFFwX5y2hHwZ7Ba7fEUtRHVgejG6Cuv1RGb02tbdsoHGdWX4x0EKvIcJYMS0AH7+ZcB275l2MGGutwsCCgh4htf0TE42H0ciOSUaXmaFKNzDZat1v2O+nJWjnUm31+KsTz/3fV1LiPX5TlbNpztcp//JtTn4udh0kFVbzoVJqqTWcyYp1gcF2OXxAkRxmUV7RcxzOc7V4gaqNN389nnz0dhk+bTLlDwspJ3t5pnOb4ihPLVdzSWFAb7SJue8xupttxYWXfftU+iBEUpB6fYCjDukL3VbjjR+T/ySmsSrUFkVxA6DWMj0eKT3+hA2nVUsbtniXnP5FdPYnERKDnFGo/DGPF2QW23EveT5bLg57i5yF0VS7sJJRPLk6KT16HsKGrukXdX74w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	D8NLm5eXupJG7fiWXZBdeU1nYkO4puYT1qi7X8YjbdnDgtA0Rm0BZQkEAyU3cCj9h40KzaSCFlSiGpBSGyjwpqFn8S9ZEqPL88b6zEvz7BIergxqlHnvMscygcOBLXKskVVhXF4CpOfVLTQFSGwgWTGxNtpv3Z8oquOwHd4N+fGuXAdym9/efN5FU+60G7WxJBgkG8JUBRbiM4z19DC7yiN3BCEPcsLtZFdUyPa9FvWXAQBkAsgLrOgK1x8UxFhkFTCqryIOPPlTISw3NS5kKg1Ckwlvrx8Nl5Mm0JDZa4ZOuy8fFtZBNmAmDol7Zmqhn7u4sDHURyzDbLGZbLPOsl6yZ4385AAOrKXljXuPrk6/o0cUx8Woy0011N3ILmYbeezuH3DdpJwMINPuT4RE5gglM1Mp44y9oShUGz2C5oSaDuX9/FDXKyiw3LKgJbScZLxzDUNbCvXfwHTfk4ZhhoLhlRIfRD5iSsy3UCYx66KRZGLqz5pV3SPnIBdszGOQAI1I86lpjP9HkJuQYVS4x7Di3zJVxybflZViNirSZKqvdcOcCtLUDhdoj82ahWfGh11URQkcYedmrNfRo235jesghYcGWxeG7g9cgXTHMj0c3pbfxLPnGHUBkMNeO+2tn/kQhCTa0Kt+MG0SeON6Og==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3386f6f6-126f-4e10-3123-08d880d02e84
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:44:49.7731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjwKFiTSZQq+M0EBm4kHXXhdHFK0Co6ThJLdp/F5QZsJ9wkqx6cRKyEhkkBjCjBvjmQ18pEQQ5dLXdA2PzUmluX+bpGO8jYDc94zLf1fI5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------BFBDA91AE936F5E9BDAF843F"
Content-Language: en-US

--------------BFBDA91AE936F5E9BDAF843F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/20 7:50 AM, Leon Anavi wrote:
> - SECURITY ISSUE: Attempted to make RSA PKCS#1v1.5 decryption more
>    constant time, to protect against Bleichenbacher vulnerabilities.
>    Due to limitations imposed by our API, we cannot completely
>    mitigate this vulnerability and a future release will contain a
>    new API which is designed to be resilient to these for contexts
>    where it is required. Credit to Hubert Kario for reporting the
>    issue. CVE-2020-25659
> - Support for OpenSSL 1.0.2 has been removed. Users on older
>    version of OpenSSL will need to upgrade.
> - Added basic support for PKCS7 signing (including SMIME) via
>    :class:`~cryptography.hazmat.primitives.serialization.pkcs7.PKCS7SignatureBuilder`.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>

This is actually python3-cryptography-vectors, but built OK.


Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...y-vectors_3.1.1.bb => python3-cryptography-vectors_3.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.1.1.bb => python3-cryptography-vectors_3.2.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb
> index 9486fe2350..2e7ed81696 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>   LICENSE = "Apache-2.0 | BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
>   
> -SRC_URI[md5sum] = "fbc43f8b155b52f9ed163d3555ea5e83"
> -SRC_URI[sha256sum] = "5529c516194122fec7db1682812e2314ddff4221fdf993169118f9c0d291e2f6"
> +SRC_URI[md5sum] = "20976284d12ed99e31d38814be038ac1"
> +SRC_URI[sha256sum] = "785f06ffd0bbc73bdd69d0b164d72a7a7827c7c3bbf79ae9a235d7126afd98e4"
>   
>   PYPI_PACKAGE = "cryptography_vectors"
>   
>
> 
>

--------------BFBDA91AE936F5E9BDAF843F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/26/20 7:50 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201026115041.11671-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- SECURITY ISSUE: Attempted to make RSA PKCS#1v1.5 decryption more
  constant time, to protect against Bleichenbacher vulnerabilities.
  Due to limitations imposed by our API, we cannot completely
  mitigate this vulnerability and a future release will contain a
  new API which is designed to be resilient to these for contexts
  where it is required. Credit to Hubert Kario for reporting the
  issue. CVE-2020-25659
- Support for OpenSSL 1.0.2 has been removed. Users on older
  version of OpenSSL will need to upgrade.
- Added basic support for PKCS7 signing (including SMIME) via
  :class:`~cryptography.hazmat.primitives.serialization.pkcs7.PKCS7SignatureBuilder`.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    <p>This is actually python3-cryptography-vectors, but built OK.</p>
    <p><br>
    </p>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201026115041.11671-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...y-vectors_3.1.1.bb =&gt; python3-cryptography-vectors_3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.1.1.bb =&gt; python3-cryptography-vectors_3.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb
index 9486fe2350..2e7ed81696 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.2.bb
@@ -4,8 +4,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;Apache-2.0 | BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4">&quot;file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4&quot;</a>
 
-SRC_URI[md5sum] = &quot;fbc43f8b155b52f9ed163d3555ea5e83&quot;
-SRC_URI[sha256sum] = &quot;5529c516194122fec7db1682812e2314ddff4221fdf993169118f9c0d291e2f6&quot;
+SRC_URI[md5sum] = &quot;20976284d12ed99e31d38814be038ac1&quot;
+SRC_URI[sha256sum] = &quot;785f06ffd0bbc73bdd69d0b164d72a7a7827c7c3bbf79ae9a235d7126afd98e4&quot;
 
 PYPI_PACKAGE = &quot;cryptography_vectors&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------BFBDA91AE936F5E9BDAF843F--
