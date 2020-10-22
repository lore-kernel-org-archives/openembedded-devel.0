Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.84])
 by mx.groups.io with SMTP id smtpd.web11.1272.1603410188183579594
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 16:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XzhFn7hl;
 spf=pass (domain: windriver.com, ip: 40.107.77.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxCNIc0/QlMQTw6jJSFNpf/I4yhNZ2TUUwqt08bOuTJExh4Qb6I7npk1a0XCyoBAnKRnnCoEMMHWHJ8xwZ3uO/4qCnZJttKvVdJ8Rv2ejxR+4RxZubVi+cVE6yeYcU1CnKljrgW7c1B6/teRDrea0FgeuC5V5qtBEDMgMXaSq1SCynwQVTq7kKN0U77s9gYG2dW0U+Gv4F9auzV9J6mWQUlBaLqCgzi5rOZoSGMlWBHIFTiyH31VKlAjxQvYTH1pmgYzTVa32dzWzXfn4HdJ2yPLYtM1I8f5EwZsDuxp2rNGv8/kMzDpbBWZYFaraXQIV/IYAXmuXv5gfqhJs7gjeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbAl2C7grS5nu+4r7sgdcv048J35tqRjvH7GghtFFV8=;
 b=Zxfn1h7G9OJ4my3s8HDI7T+K/o1UiHTzIbS8/LElF2Xevi39PCFAleA3nmNBtVuors4j81f7gEtFc2wBRAYX7Y+nsEcukcZAcBThIaYxU0OLAktzSSAS/tTVRY68qrNlQYWOIW0/0Eqq82UGj7QimaAmeHSSMkAcutis/wh6BP/HYQosw+bx0MPaXmvy/AXwI1oShEfXGjNKHAGZiRWetYYws4p/ldoSqyOoaEKKgjnqCsAO/CZ+4ZLbrCgyxYwcWTdIuwfbh8BqlUprJ64spcK5XWheYN/22yq0kuMrwndBmDMV9RIZzfEIxXe6dKPzCkwVtkesUj5SWjDg93LtbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbAl2C7grS5nu+4r7sgdcv048J35tqRjvH7GghtFFV8=;
 b=XzhFn7hl5SEtepr8Nt8L2O6aBn1N9zbG8SGNjq+VpfS2edxoclBt8lfK/Lc2Ju6hzd27lB55Y7lBInuzspnfhxeWc38zJLwPLFtuw7JP28okpQMVj5ljogqPXxVlFCPyTSR2GwSAlucN02ewtLJBkVQ+9e4tDHIGJ/9MRlBhNN4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 23:43:06 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 23:43:06 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-regex: Upgrade 2020.10.11 -> 2020.10.15
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201020152601.26261-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <00a6d2f7-ec14-3567-5866-e24292dfd9ee@windriver.com>
Date: Thu, 22 Oct 2020 19:43:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201020152601.26261-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR03CA0002.namprd03.prod.outlook.com (2603:10b6:a03:1e0::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 23:43:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb570def-75fa-4f1e-db62-08d876e4393b
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48965C7CADD5C4C7BC9DE0979F1D0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F5MofAm/YhxG2EUbmu7jn98lXYQG3IY2ebQlOH3Wh7FezZz16k1UBS0F3L2/ChFnEp1BjdCBRJikUYjz6qMUqmQ+E2dJ8XByj6TgnWDclHfiV89pjAAp69msEvoL0YhdSpmCn4f3cp5YQPjnvcemvmjgbzHHg5G6zfuXlMAmrmIH+B15KnZGkeYmRdn7tqs0rW2pXypzEAdpQCcDODkQuep0c5FJgkpvhizU5Y0XQuj0aglpgjuTx/KQPLOMo/r4r54wPB+0amxRMpJS3As6nWE/oRjXer4KBUVYCupR71gnIb9Jrw6J4dutq2PpRzuG9kfUfEmWIlGNOZqnNI1UXNrz+KEGb+efmPNIslCIyhQPMulTcZLcmWGKxuyigKfnqlUnpAyQTD10LxIZsOgXuIaGVJHuo+B5FGhRRzNdNn1PbgmYmTCado8wvpqRm2+IHoWUFzT7pPfQEOkCtyTrEA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(2616005)(31686004)(33964004)(478600001)(186003)(2906002)(956004)(166002)(44832011)(8936002)(6486002)(966005)(8676002)(83380400001)(36756003)(5660300002)(66556008)(53546011)(316002)(86362001)(26005)(16576012)(66946007)(66476007)(16526019)(52116002)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	+fmeXjWIkSYBz6xtIorIcEs7sQWkA9tYhSwNugDDVgJeFfVk1c+/82wWf8t9Cmiel0oDYzc4re3gAjRM6t0pwSZSMmBWlJ/yifZrwgekazc2mbGhqMF18K7Q58uKP8jIDEQx9G3D28ZV3+R2uAcQqH5KVBNsmAWRxRpcJm5vd8oSswzIHENrL2v3yEsHKtcmgZQ2osXsUmdIIgxpWxj6ENn6Io1OssVI3XpGnk1kyo1ngpnKGbOfKRHH0Bi9rNu+waXK5DjlEwnqziwFkGs1RdoJ0KJb0wnBwzMvu2b3wJ/9EhMWQwvbZkc13I2mwt9HhAFMzwgrgC+ttE/c+azVMYyHG7H3rOWaxXYGx0NdaHvcw7yTn8HSAeCjk9ylMB5nsh4iOw8ahVv957MwOo8kXjKgZvXtDwAXzsUHhISpMq1rJm8OnAF9gkaVo5SxvDy3GRLj2Tjdv8AzHI6DDACldAQaj8ydr8pzZmXS/88Aol+I0eYTUhwwfiFQoQh5ZvSu4O91jUAA6L1ZdFEw/Mn9RwxL7WCPTJdz7wZ1ZqPxpQjUg46yyMrZQJeucfs7TMHByKrYBOXRYYyKyoCCjPkhcOjXoZnhmzE2CDEnIZgWU0GHQ4ak+6Exl5/xJRnrXzC25upo0qzz2jTrMYd74Zi8fw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb570def-75fa-4f1e-db62-08d876e4393b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 23:43:06.1737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpufVtQqLoVOgzkdeBG89l7b68SB7QK2j8HPzS5izAGWUWKDe/1p63aumeUNjuKPDVBLOqf6LWeOD82v3gNMBTgVVhXdAEUsRoG9+6ZbIzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------6425B407DC68EF5A8239CD56"
Content-Language: en-US

--------------6425B407DC68EF5A8239CD56
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/20/20 11:25 AM, Leon Anavi wrote:
> - Fix GCC 10 warnings
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-regex_2020.10.11.bb => python3-regex_2020.10.15.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-regex_2020.10.11.bb => python3-regex_2020.10.15.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb b/meta-python/recipes-devtools/python/python3-regex_2020.10.15.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb
> rename to meta-python/recipes-devtools/python/python3-regex_2020.10.15.bb
> index df2c00bbaa..b72aabd0f4 100644
> --- a/meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-regex_2020.10.15.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "642c259122a3b578cec66d8bba5665e4"
> -SRC_URI[sha256sum] = "463e770c48da76a8da82b8d4a48a541f314e0df91cbb6d873a341dbe578efafd"
> +SRC_URI[md5sum] = "ef9f43ab182949c79b2c8f869788f8aa"
> +SRC_URI[sha256sum] = "d25f5cca0f3af6d425c9496953445bf5b288bb5b71afc2b8308ad194b714c159"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------6425B407DC68EF5A8239CD56
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/20/20 11:25 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201020152601.26261-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix GCC 10 warnings

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201020152601.26261-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-regex_2020.10.11.bb =&gt; python3-regex_2020.10.15.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2020.10.11.bb =&gt; python3-regex_2020.10.15.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb b/meta-python/recipes-devtools/python/python3-regex_2020.10.15.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb
rename to meta-python/recipes-devtools/python/python3-regex_2020.10.15.bb
index df2c00bbaa..b72aabd0f4 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2020.10.11.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2020.10.15.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0inheritpypisetuptools3-SRC_URI[md5sum]=">&quot;file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;</a>642c259122a3b578cec66d8bba5665e4&quot;
-SRC_URI[sha256sum] = &quot;463e770c48da76a8da82b8d4a48a541f314e0df91cbb6d873a341dbe578efafd&quot;
+SRC_URI[md5sum] = &quot;ef9f43ab182949c79b2c8f869788f8aa&quot;
+SRC_URI[sha256sum] = &quot;d25f5cca0f3af6d425c9496953445bf5b288bb5b71afc2b8308ad194b714c159&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------6425B407DC68EF5A8239CD56--
