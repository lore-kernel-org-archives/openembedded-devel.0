Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.88])
 by mx.groups.io with SMTP id smtpd.web11.10804.1593785146202865241
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 07:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=b0Lr3j49;
 spf=pass (domain: windriver.com, ip: 40.107.92.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpJrI5tYR5bnEDByQsZX4iZ6vrxxQHsFae28NJIDy7xpzBJe8TXxcgBQ1C4BFmKjTCSTkTEtLAiPoRlkHfAKcE73nAjx1jNIWJEmPkswOLxhXwE4GzQgijVczQ0NPrrHXjb1setEfQuef23Y3zQ/FME8AGK3qtxzyzj+9ytoc9JPcM9ZvkZSKuvCm0qIe32Q41EOJsEhJ0bMA1TPBY909bVePeF35chT4OnFnT0taDgT8egkl9LDRBfXp1sBJffN50DWy55UMtqp5EkuX1FGg+vYyGZwNHmP9e2HxkJuaZa+y5ztBYnLmsYuqYVSu1FNiewl3/2PQEy3s0SmL8zttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kXRCHTJMc1EdP0whqjbEEDVBAcZovEXB+8+M4nW8zE=;
 b=m7I+qALNr7R1iNc9P4zHJbQy8QkTNXf+c9RkLP4DUFYgN85HS+n4xhJYpbgz0es3iXSmkRvXBTU3SL5bEm73FhYEb35tW1OKQUGvjfGYEveJuhTcCVvuOWpRkfrx0/O2J5eoAIxQHoJtFV0iFNCA7AILP6ZtpPe1rssx6Ls9DZNVACvH/vp23Bazj+/bu4dJtOdAUqlg0/Gnmqim21WO+GM+fmggtJPCw1WjO9kh7AguGiCQP20JNDOImPlZVQMtNxQai33YD5Pq6NfCkF8NGMdZF0AymbW7PuRTjnFfLgUPCfa3sBTp1o/Y0RIDUTtQwRUUxLNvMkDJYJztkfpyRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kXRCHTJMc1EdP0whqjbEEDVBAcZovEXB+8+M4nW8zE=;
 b=b0Lr3j49hHaxzHrpyXTYZNjlX6Qk4YiMM2rj/5Fhv3WuPquUBwFzxFRDJxn3ZHeEA0MTx73ElLNo30S0h8uMrRqQTkGwTdXanNo48Nl8yVuslLWeQpYXD5LKOflNIhj/PGAD7OjosyDTGOB2SXxfSY0QkBIEfmwN4OEmcF+cdVw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3628.namprd11.prod.outlook.com (2603:10b6:5:144::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Fri, 3 Jul 2020 14:05:45 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3131.036; Fri, 3 Jul 2020
 14:05:45 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-configargparse: Upgrade 0.15.1 -> 1.2.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200630171119.25540-1-leon.anavi@konsulko.com>
 <20200630171119.25540-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <81a2cc95-8d0d-ab12-6d0f-6934528a6333@windriver.com>
Date: Fri, 3 Jul 2020 10:05:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200630171119.25540-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::20) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTOPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Fri, 3 Jul 2020 14:05:44 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f356ffc9-d9da-4f49-24bd-08d81f5a2daa
X-MS-TrafficTypeDiagnostic: DM6PR11MB3628:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB36282A2E5F7E562C7E1FC70C9F6A0@DM6PR11MB3628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UUxEqQbY1joz98oVmXVRUTBobFkR8TeSipWy13UVX9E/HFiPM8vXqHATF5uisATndt/VcM5HsqZFDpjRZetnU3vtGT3nNJ/rgZnTuCCDYgzpcyfJ6Zk0OA6RaZdgVK0Q3QVHUKeHJGN+7UK/ziKTaGOcTiSVxNz+lHk7La6/0BlSFEd9TjbgKwJocAi9ofYZrYTBJ5eC8ECSv9WxZQPF19SnJlL9PPSL/xcfXYEB3/L+Vosb2VZSWx9T6Vv4OXanQBxWMyX7QOcu4Cu/Q6JV2q1zIQjzGFXqIp/Jk8ELRAgTg3KT/Pvbde9uWyVli1owVLn+bzBRqdGjKPxiiR+pgeezZa0km+BAY0JKC6Bl2Ui5nKNOrlZB8wEtFfxJyQBry/endHF2lSet9EsnO9WjmNsQVNbukBIJ3qy7n1QBNnP3MOycQszTilFBe9OxYqTfGjVowPD8AbzwHl51jdlGUA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(136003)(366004)(376002)(346002)(186003)(2906002)(966005)(52116002)(86362001)(16526019)(5660300002)(31686004)(316002)(66946007)(2616005)(66556008)(956004)(478600001)(66476007)(36756003)(26005)(8676002)(44832011)(53546011)(6486002)(16576012)(8936002)(31696002)(83380400001)(33964004)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	BewsSZ39s3CE7LIBG58jxioXDwVBGdCRd+7UJbVxDhY1ji06v8uLAhRm+ooNwV/Y9dxFLzDphEkePJnDFYB+pDWH/C+jqEsp4FSXzbSM0ZxL2Q0fNAp7sr0fUpHjMPymcm/usoHHvX81HWiJ/MNrkQZkwAYNiat6sfngAUpA6OScBk8zjw+GHKMTKsvnWR5hwhnHrcAcCW9S7gu3Q692lCotxi28/tEAmsO9HZijK/IUJNwgjXn7GJXctC0KZfNP1zZHKzsT2DAkYsGf1wAEGLy9AdnuOGzfnnNg37aTN8f3oR+WjS6liq7RN/8apz04S7eeeD+MnvU8JT+1MS+u3yHNhrKFDMiJVCU55jvOC+3Y7BVeto2gn35VA7MK6vN4cyP69pFHAj4xm1EE/+eymu6E0Iw0uhHu3FdiOzEk984A0a74I0LQ3rKOmNANEpoht+/CZ5PSpbwv3rGzPW2W0c7zYgBa1mr62LdV0E6ugb92vr5YP93rGXXmv+q9yl2U
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f356ffc9-d9da-4f49-24bd-08d81f5a2daa
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 14:05:44.9026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLe0VyQEu/ozOS6IsryvP+56RzJjyLS7d5vCNu4sQ6aQip2K+eW1EMySYmeTnm9H//MOO4tSu4vqcLY5rPXfapaDVZ3XU3PuPUll2K0B0+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3628
Content-Type: multipart/alternative;
 boundary="------------1B70E9946B785D07A226F05F"
Content-Language: en-US

--------------1B70E9946B785D07A226F05F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/20 1:11 PM, Leon Anavi wrote:
> Upgrade to release 1.2.3:
>
> - Fix bug in accepts_list_and_has_nargs section.
> - Allow use of nargs with action=append
> - Add support for python's Configparser config file format
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...nfigargparse_0.15.1.bb => python3-configargparse_1.2.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-configargparse_0.15.1.bb => python3-configargparse_1.2.3.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb
> rename to meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb
> index 0797898a9..54841c243 100644
> --- a/meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
>   
> -SRC_URI[md5sum] = "aba15b7973b7a70bea86fd69289f8fe3"
> -SRC_URI[sha256sum] = "baaf0fd2c1c108d007f402dab5481ac5f12d77d034825bf5a27f8224757bd0ac"
> +SRC_URI[md5sum] = "8978866babc7ff0994f691ebe48b5aba"
> +SRC_URI[sha256sum] = "edd17be986d5c1ba2e307150b8e5f5107aba125f3574dddd02c85d5cdcfd37dc"
>   
>   PYPI_PACKAGE = "ConfigArgParse"
>   
>
> 

--------------1B70E9946B785D07A226F05F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/30/20 1:11 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200630171119.25540-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.2.3:

- Fix bug in accepts_list_and_has_nargs section.
- Allow use of nargs with action=append
- Add support for python's Configparser config file format

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200630171119.25540-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...nfigargparse_0.15.1.bb =&gt; python3-configargparse_1.2.3.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_0.15.1.bb =&gt; python3-configargparse_1.2.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb
index 0797898a9..54841c243 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/bw2/ConfigArgParse">&quot;https://github.com/bw2/ConfigArgParse&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=da746463714cc35999ed9a42339f2943">&quot;file://LICENSE;md5=da746463714cc35999ed9a42339f2943&quot;</a>
 
-SRC_URI[md5sum] = &quot;aba15b7973b7a70bea86fd69289f8fe3&quot;
-SRC_URI[sha256sum] = &quot;baaf0fd2c1c108d007f402dab5481ac5f12d77d034825bf5a27f8224757bd0ac&quot;
&#43;SRC_URI[md5sum] = &quot;8978866babc7ff0994f691ebe48b5aba&quot;
&#43;SRC_URI[sha256sum] = &quot;edd17be986d5c1ba2e307150b8e5f5107aba125f3574dddd02c85d5cdcfd37dc&quot;
 
 PYPI_PACKAGE = &quot;ConfigArgParse&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------1B70E9946B785D07A226F05F--
