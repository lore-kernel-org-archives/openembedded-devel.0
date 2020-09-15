Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.79])
 by mx.groups.io with SMTP id smtpd.web10.14649.1600179958724678327
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pYD53+7S;
 spf=pass (domain: windriver.com, ip: 40.107.237.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwEEDEqMDNTKIs28IZNqmwwWA24G/Xelhr68QJxWorYoc/ZRwk14Xvg0rv5lq5hCFonb/5peU6r9skyCw7hgUr3rLntMO/7lQyKoQjiAs41mT/oyO0fKd/K7Z2qemsYigjqmu+BAz8r9Dfmf3G+5c5CV+YSgxSFEN0CKVdh9HAPmOnFujLYebdlvRsGcFhr5Baz+psLI4igdaOMNkutMiq1KQieFr51xc4MjcZzqDVhikASU1dYdL3faw5Go1tSSIprGjsA7TQbIyMYDCtEU+BpNE8UKHDrEG9jzgMhWgkaKglpjQ60t2h2uZVZW0MdI/ZfrF3807kMqlh+uzC4oLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxzfA4NgeQ95Dq3722uz21cR+3lJa32T5vmhfuxqu+Y=;
 b=oQTmnQBHRH9GkyD2byhKLphNRqN+5VcOb4U2TAleSHGLXn+Upgi2JKaHl98hOpi8EtwmQc0G9bgC4Na+pm1zYmLf5klXvuEDZidWg+/8j0ucxXBivadf2Xf6IVq2csVfdboVQAkVOmEPSyQ0gJjA4rzQyWPGhpkTouIa8TdyUxjWXWxfvSP8nq6pel+miA6c/3fCPIlp1K/n1gE5zJNsUZ5zn86swKnObdfEfV/CG3GYBm4aJNAcdMr5m8Wk3zp4H7mTjptGuk+SyK6l9pomRQ/r3yj2a0SFBavpwUDUmgk4M/RbZ5meExQtaUNilYCFjMX6GpuywE32/T4yc0xHDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxzfA4NgeQ95Dq3722uz21cR+3lJa32T5vmhfuxqu+Y=;
 b=pYD53+7SAVNS7caSIQpF2nZQ8fv1Lzt0x/SFuUSCsJNQT5/iuZPfMWmAip+EHirtJTgdOYrV5Z9yjh6OxefiIG7uVTEww3jlepS3hEyUJajptNc1TglXYI8wIG+RcJbZoYBM56xMqtkaazW2MJYjlArn6rZ0VN1rx5BdP+QxLsM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3447.namprd11.prod.outlook.com (2603:10b6:a03:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 14:25:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:25:57 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-traitlets: Upgrade 5.0.3 -> 5.0.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
 <20200914090419.19171-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7173c6a7-ef2a-0be7-3399-fcdeeb572d0c@windriver.com>
Date: Tue, 15 Sep 2020 10:25:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914090419.19171-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::11) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Tue, 15 Sep 2020 14:25:56 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 549fbd3a-d6e5-4df5-6892-08d8598342cb
X-MS-TrafficTypeDiagnostic: BYAPR11MB3447:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB34476E4C6D5CA179FA7FD37D9F200@BYAPR11MB3447.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OD4b46Qw0AKdr2AFHtx7vZoURlBMjptR4ix8cBkBbAuvLzRthj0ZT2gTQF6Q9T/OcdopswzPjo/gc+X37Y7CgeO0Ot0cw49ObNuvRgWTmK+l8HVQu7ZdOAp2JeKGpgOBodBSAcPhL5bS+JbskAlG+w3bHlI+pMMuvvkidJyyj8r9Oiz082Cj+l7NYxrpFwv8g0WLpKn8dQssbmkvhV3wsxN4hA4TELPbHm3LdPs6Tew5rQz7iAZzHR61H/YxZQMHOGKMF1NRGosfvZzwlX1mPL2TzKUcWICpZDV6XhjmFbuF4str8X1JEKH+SXc3AUd3ATnhiuuwnirKpI/L8Q6my5uf42qv+H5yeW2475NkgLCnXM/qVd2TVSWNflQQJHi5pFLHjgZBEkzsgaN71VsLZMVsAhixqU2St1IAym3VhzT57JRR79hd31kUiQEc5t7RJEnljVQI6Qf2LiUWSTeHGg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39850400004)(396003)(136003)(16576012)(186003)(956004)(44832011)(86362001)(16526019)(5660300002)(36756003)(53546011)(8936002)(66556008)(66476007)(66946007)(52116002)(2616005)(33964004)(6486002)(478600001)(8676002)(31686004)(31696002)(83380400001)(26005)(316002)(2906002)(966005)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	TJK6WWZ+DTFmOoe51dqKS/Q7yQZTDtjOlNkG2wCQ4Q3oxwNQ1waTFURejsMYm5OTQS7wfo4DHx3RnzvjEVtVwW4jPFE7Li3jESo3nOF9AFVRWaKXQAodDU8VRKOJ04NVRnC8DYJAHlXt/cZBBq+CsFkxSbU0fRgPKfnT5ppcdOhQggtKxgpaTekgJ/rOeXhrlrM0OuHOlVR4FoPGyJQnXc389cXyrOrBrDV5GIVkAgz3MNm/YcW5MDk9IEjDS2weQTAyBNDFlJGdwjVaa3JKL1YIwvXUnUqOMzD8+rJIWZbX/xeBHnXnj30P1x8J55HWXnYYsKPAgaExtNPcTND6Li4T4aW0MtdF/Yb7+ZTF4hXL6pm6efyqDvHoWjBR5EuneXxvnexMqTt74vxU9rR8s6IKmZJpGXexRMaWV9hNn6oOuq2eDi8I7gHXJk2VTDfuPHG4JE2g0pBl+K3Wz8HSUag3ArLrfFw3H5Wreizlu4Q/EtomMJtOFtv4QsLMuDg8sPdqoUkpOs2xkFpvhIR/eLVziccAWyfrozOQ4s6mApjK0JgCslGfMRmFGSxO+p32moz+Myn3zP+N+VrsmyzOHsPfNRWqDfBMjnLuQDaLy7E3Sp0jGR0mjebFQvPafgOtFwFuwhxWqggTcgNuru0h7w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 549fbd3a-d6e5-4df5-6892-08d8598342cb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:25:57.1428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtbXy2yOCL9lxpOXy01NtyXb0Jxmtzx8s1lSPJ0J9CaoSijs33Rg07BciPLFLfJvn3R3tBAEtPoikaLmyA5mFOWh8YdxpFKtUkIzLLm+knA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3447
Content-Type: multipart/alternative;
 boundary="------------FB0B7692C225F45C82FD6C61"
Content-Language: en-US

--------------FB0B7692C225F45C82FD6C61
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 5:04 AM, Leon Anavi wrote:
> Upgrade to release 5.0.4:
>
> - Support deprecated use of byte-literals for bytes on the
>    command-line: ipython kernel --Session.key="b'abc'". The b
>    prefix is no longer needed in traitlets 5.0, but is supported
>    for backward-compatibility
> - Improve output of configuration errors, especially when help
>    output would make it hard to find the helpful error message
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-traitlets_5.0.3.bb => python3-traitlets_5.0.4.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-traitlets_5.0.3.bb => python3-traitlets_5.0.4.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb
> rename to meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb
> index 02908dea9..194193f63 100644
> --- a/meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
>   
>   PYPI_PACKAGE = "traitlets"
>   
> -SRC_URI[md5sum] = "66b76cfffd590c39861bc11c247725a5"
> -SRC_URI[sha256sum] = "a2e91709a0330b6c5d497ed470b2feb1ed8da5c9dd807c6daab41f727b9391c9"
> +SRC_URI[md5sum] = "592dde72b6b706d09ea624cce9af3cf5"
> +SRC_URI[sha256sum] = "86c9351f94f95de9db8a04ad8e892da299a088a64fd283f9f6f18770ae5eae1b"
>   
>   RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-ipython-genutils \
>
> 

--------------FB0B7692C225F45C82FD6C61
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 5:04 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914090419.19171-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.0.4:

- Support deprecated use of byte-literals for bytes on the
  command-line: ipython kernel --Session.key=&quot;b'abc'&quot;. The b
  prefix is no longer needed in traitlets 5.0, but is supported
  for backward-compatibility
- Improve output of configuration errors, especially when help
  output would make it hard to find the helpful error message

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914090419.19171-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-traitlets_5.0.3.bb =&gt; python3-traitlets_5.0.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.0.3.bb =&gt; python3-traitlets_5.0.4.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb
index 02908dea9..194193f63 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46">&quot;file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46&quot;</a>
 
 PYPI_PACKAGE = &quot;traitlets&quot;
 
-SRC_URI[md5sum] = &quot;66b76cfffd590c39861bc11c247725a5&quot;
-SRC_URI[sha256sum] = &quot;a2e91709a0330b6c5d497ed470b2feb1ed8da5c9dd807c6daab41f727b9391c9&quot;
+SRC_URI[md5sum] = &quot;592dde72b6b706d09ea624cce9af3cf5&quot;
+SRC_URI[sha256sum] = &quot;86c9351f94f95de9db8a04ad8e892da299a088a64fd283f9f6f18770ae5eae1b&quot;
 
 RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-ipython-genutils \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------FB0B7692C225F45C82FD6C61--
