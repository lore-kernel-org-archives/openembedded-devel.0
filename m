Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.56])
 by mx.groups.io with SMTP id smtpd.web10.60693.1594050546014024695
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mfiWOe6g;
 spf=pass (domain: windriver.com, ip: 40.107.69.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/Th9+7D9hu09HkZL8UiCKAYAWT9yaRnreWXBKvsqN8Ikjge+BYhBLEgZyh9oHv9uJ/E4OqB1FcsJTmbE65Vg2tkxK9lYN1WBLwXJcRRnwvtfis5i7Pug+2Pqujo9dE4TDdxW6wKveoWAyR3zHqH8mWgVzwlcBh1sqy1Hl5o5WSVruDwkJHNgi+jrAOEJe2k2EPeZwRUl9o2pOOj9I79a87FjuNtIZWPvpDh2/N7q8UZedFDuj6XQqEEPj95akoE67AQReLTCti013Wz70lrad329zb+fOP0/l1oLTKlaXbuQFUf5e8tWdzzpWNwGIjge3g5lytXSAQwPDRzHIOKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNHGEitdMSq2qL0TGWPPzoi5eDrffT6fmj8jzk13eKE=;
 b=H7UwZE0Jv8ZW1maWV0XE5XsFTRL+ky1W4FCtwBOkXb+ty1niYXjiQdkrD38aLJOoQ+j2kTfNV0JlzFQiSEaaNAs/c0pYVKOCiEYV/VXvl6ZWCBzPDzmOCriZLxmv2ZYLz8wlyP+ea6YI+tUAw6PO6VJLUKqKxvr20aAjhT760B2E49aXfEUIRF3azNpGnllq2EsqvNRyqBrcf6ykZJ7Lo6eoWbN8GSuycgQ0asdIiu0zng06CsyjYnoc9WpOcNsthCF4FX7EtHn4INEBBtzF3mFZeIvQhqg/jXfuTLHj8LSRCd8xArWyG8NPsKIyA6zA4pVKXWCxe7C9TWa6nYAJ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNHGEitdMSq2qL0TGWPPzoi5eDrffT6fmj8jzk13eKE=;
 b=mfiWOe6gjga5C8SUV3uJzZOi2oYHpUPkVXfXbgiQT3gdzzlnaNXSpOwUxv1ZJGr4cnRHUD/b6/GqFMNrsQsS/1XI5lk2VYZXrSEy9ohaE3QzxEYqieTMMyURCKRu7MaVhOyjtCAiJDP/sQr9xuCr78R7S22T5vJpEM7YGWNAb38=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM5PR11MB1899.namprd11.prod.outlook.com (2603:10b6:3:10b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.27; Mon, 6 Jul 2020 15:49:05 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:49:05 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-python-vlc: Upgrade 3.0.9113 -> 3.0.10114
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
 <20200703093020.3514-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a6ade5eb-5b32-d8e7-8c4c-c368d6e43628@windriver.com>
Date: Mon, 6 Jul 2020 11:49:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200703093020.3514-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47)
 To DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Mon, 6 Jul 2020 15:49:04 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8f68496-c77a-43ee-509b-08d821c41c8b
X-MS-TrafficTypeDiagnostic: DM5PR11MB1899:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB18990A1FAEA914425A0B4FFF9F690@DM5PR11MB1899.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:285;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zGO9meatRT/m24saOECM2zvRiGhrd5M6l0BOcfUVsiigGPjnZSOHT82AMGbuEa5Twf6ZFoVw4nWGklVrYD6hs+6MD+LlxXp0ZhlAmxebtfW5T9JYppV3AUykgDvV0XyDkuHBsWEGS+q4r+g0SN7aa4BF7FPpgPR/PSdaA7Z01c1rR2fyhArTIHQlVpvWQwnx0AGbPozjsy+h6FRQwjt8J0IElfoMnMP6yzZL20Ts36GXbuejMQLj0/s1/+59QJWD5RG0COdnuh1yDLStVMIkyezM6zhjnNpM35rdF0Thdcqv87PX6Ed3xJOAs0rWFKrVebOTQwJHhivKbQMcBoduJ8wxlNCdY4+hl9ZB945RYgehmPkv31sEJPFQbWItNc+pw9U/RNiAS85dWaEWqsEP4J0Z5XTzZQjcVrxzO3jygIgJvJFjOundzUNBc+Uhm6sSDgec/PcJZrBwkSBX6IoTnQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(376002)(366004)(39850400004)(136003)(16576012)(5660300002)(31686004)(478600001)(86362001)(83380400001)(31696002)(6486002)(966005)(36756003)(316002)(956004)(2616005)(186003)(16526019)(33964004)(44832011)(166002)(52116002)(8936002)(8676002)(66946007)(66476007)(66556008)(2906002)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	7PPDF8TrfZ+rIAbiaKsx9f63iGweVWkNJoM6zi9U7YlxRz3KzENM2l7BW6MUUEUnFArua6utLZFgMWfgBJlWPqNwaYHA6aK/8FfthLZlimQ1pFHTF0hFq4NZCGyIWWQhp7cKj3xZ67ULF+PT3ZVH4qHUZFR90eficx5ioank2th97BcyKGFV/gONdbKR5ItD69vT5bTDJhKXURNs597i7s3r6MZwKV6hxpkNcZK7lIO7V2K2plvSlKO2a8PvzYwZ+jkxySjpbHEMZ7fYgAoMLf2nGrivGLbREnatZlD9csfP5dNuIK4KUYPB5M6p4whyhYJlsnDNTiaE1R+4ZhCv0rUMOW2zoHC9Bg2pORNywqvVk2I6SXmPYbf4jyhaXXEfKMrXFREOgZrMStC/QFHJ72uxrO63Op5iTNwLLb+R21ElLszL30YmB41bY8ojy65l6DjcEfeGPWSrB8y5Q1TgDGb8RyJBxfEksUc6FkNTOlDWDXdDCCUeIk9v7YOfMYXu
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f68496-c77a-43ee-509b-08d821c41c8b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:49:05.0073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0oktzu6Nd//RlvAuJTjDDXNdkgHC2/ml2IVs8aXDDUP7tmDURyssxVRJNzyYiPGc1GC18YBIxIJ/ZCCHuSZIp+6y/YrnEsV/O+5Py6qABg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1899
Content-Type: multipart/alternative;
 boundary="------------09C5FBC98B70C0B9ECDC5DE5"
Content-Language: en-US

--------------09C5FBC98B70C0B9ECDC5DE5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/3/20 5:30 AM, Leon Anavi wrote:
> Upgrade to release 3.0.10114:
>
> - Generate bindings against 3.0.10
> - Fix return types for callbacks
> - Example usage of media callbacks
> ￼
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python-vlc_3.0.9113.bb => python3-python-vlc_3.0.10114.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.9113.bb => python3-python-vlc_3.0.10114.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb
> rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
> index 6d53e33812..7f8affb4f3 100644
> --- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb
> +++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "wiki.videolan.org/PythonBinding"
>   LICENSE = "LGPL-2.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>   
> -SRC_URI[md5sum] = "a3a7d64bb4c6c1cd5569173ceef9cb67"
> -SRC_URI[sha256sum] = "5422b79d347b6419008ee91cfd9663edc37eaf2a0bd8fb9017d4cc2e5f249dda"
> +SRC_URI[md5sum] = "17dba9a55903cdcae10814080fcadb8f"
> +SRC_URI[sha256sum] = "c1a8a295bea8277fa3d9a07dcdf873fe18c5f11a0e4d1f618df47c316fe0003b"
>   
>   inherit pypi setuptools3
>
> 

--------------09C5FBC98B70C0B9ECDC5DE5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/3/20 5:30 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200703093020.3514-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.0.10114:

- Generate bindings against 3.0.10
- Fix return types for callbacks
- Example usage of media callbacks
￼
Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200703093020.3514-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python-vlc_3.0.9113.bb =&gt; python3-python-vlc_3.0.10114.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.9113.bb =&gt; python3-python-vlc_3.0.10114.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb
rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
index 6d53e33812..7f8affb4f3 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.9113.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.10114.bb
@@ -3,7 &#43;3,7 @@ HOMEPAGE = &quot;wiki.videolan.org/PythonBinding&quot;
 LICENSE = &quot;LGPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=4fbd65380cdd255951079008b364516c">&quot;file://COPYING;md5=4fbd65380cdd255951079008b364516c&quot;</a>
 
-SRC_URI[md5sum] = &quot;a3a7d64bb4c6c1cd5569173ceef9cb67&quot;
-SRC_URI[sha256sum] = &quot;5422b79d347b6419008ee91cfd9663edc37eaf2a0bd8fb9017d4cc2e5f249dda&quot;
&#43;SRC_URI[md5sum] = &quot;17dba9a55903cdcae10814080fcadb8f&quot;
&#43;SRC_URI[sha256sum] = &quot;c1a8a295bea8277fa3d9a07dcdf873fe18c5f11a0e4d1f618df47c316fe0003b&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------09C5FBC98B70C0B9ECDC5DE5--
