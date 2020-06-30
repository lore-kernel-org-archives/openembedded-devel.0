Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.52])
 by mx.groups.io with SMTP id smtpd.web12.15077.1593523522232770737
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 06:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GwPYebu8;
 spf=pass (domain: windriver.com, ip: 40.107.93.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1Ins9rpA3KJLaGUEnVpYGlXOCSRMAfVooN/l9d0pG/5RCSus/PoIQQwptHIR0sOa5gnfmJBA4ytvZ2eQOmijS8fwvAQg2bbEgpEkrBFebViW3n7DNTMz2J/YJ6YM+C5H6i2Fl9HlxEUiuyJn1qZp2VEycShJt02VhVidDjR6ks8Vj+VsobqKP37L3OIqarkxJzEQ3vIRtp6565PeNpmWjZ6dEwgbmX8j0CEbL1I8HR7S2tKdu+3M6Xuicm6SQM3smI8YbQQk9LqKeIyp4Sor2V1EIiZKr0JEt1VWHonIaVo9B/vYCmVQA+jiHCWAxIRR1b+EIt/5N+PJ6sB5FfnVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8S2dnhyaTYOcb0apPKuEGRFZFhVKhG7n9PUlib49ZM=;
 b=B481FRoxuURE6buDL1SS9jnHsC1ojO6KlFknDSgp9PLQKeB871GQqM2LyfdT964eGuLcAhYWysQSsDE67uu/LHho9xpPAPhqYE8l2uDX/uWF9/r4EeKyzhwyEbmcsnafDlHp/vTLyoUBPKtCa96CQysqdrb9w3TE3f8YLFISZ/E0NXRdVN+1pL+SVAk7iCqph/1yha5Xd8G4gdNZaLv2MtmlTrldKNgZDEP5mdrWNJ3hY2XtO5oOCMuCo5b18rQm86YEMugtEMzhgQpAxSQfukUfblwMU66FfgL2qH1kiMjcrekJg1Tfr+gNBECuZ2iHDBHU2H+z3LzG7j1eonSddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8S2dnhyaTYOcb0apPKuEGRFZFhVKhG7n9PUlib49ZM=;
 b=GwPYebu87iq8kX3QTu2f9eFO10n01hf9R7ymyopq0a9REW4i83z6YcIYxBspMf3kQG/eoWUHNcrW0pQ9MsW95yF9gH3+8++eCMN6wTpiAalLvXL3ShjqswgPaRYp+CPzXCK5MYJ99zLS8UdZwFRCoFGb7Owz0w7Il/7pesInxoE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB1367.namprd11.prod.outlook.com (2603:10b6:903:2d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Tue, 30 Jun
 2020 13:25:21 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 13:25:21 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-watchdog: Upgrade 0.10.2 -> 0.10.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
 <20200629121233.27026-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ed370c8c-9719-ba71-2339-0a338b8876a7@windriver.com>
Date: Tue, 30 Jun 2020 09:25:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629121233.27026-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36)
 To CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Tue, 30 Jun 2020 13:25:20 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c207f8ce-d870-4eca-a88f-08d81cf909d3
X-MS-TrafficTypeDiagnostic: CY4PR11MB1367:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1367A6E795A2DD5AEAB424949F6F0@CY4PR11MB1367.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zr6nb1UB98WDJFQyOE0pVdE/J7ljyPv1JGoCHjM1UxZ+crgE8hr4VlejBRQQxkYPHPt2sslAXYaiKwLouSOiZ/TlfVSukGiux7i+fOriWuAqkBI8ehFmu9+qSJD3M/gSVM855VET4MpmFOn8q/IkPpWSO/QJzv+sUMnfIgUD6xXjX0NdpbkOIDPJtE4fTd0aGlJbmfin2drnLfylCHYCxKpWOUls9vC/HlMhLBPXR28t4vZ1Or/udIyQQaCfs8KrkbvNHaLgXhmJFKw3EWANdXgN1/c0d4Jaa8wXGu/ML6FQDZ7wL7H9UdtNkuLs/UQBstS6yQgtxyMmK5l/joi1ri0mfqfeejAu+y/Dg99pqr6QsJ35WjXLfLavSbtaOlATdQ/BLKduA0SYmH/aKeFFW2F95xZaVvm2tJTs/76hwWIBiHBpZB1XDJelcfOoKI+VidpJ2oloXpG0jfn9TRj5Ow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(376002)(136003)(346002)(956004)(2616005)(44832011)(36756003)(66946007)(8936002)(66556008)(66476007)(5660300002)(31696002)(166002)(8676002)(6486002)(26005)(52116002)(186003)(83380400001)(16526019)(16576012)(33964004)(316002)(2906002)(966005)(478600001)(31686004)(53546011)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	BKp36yAbhjtaY9AsTS5p6mi6BIUEtTEXhKEi8dhjUrek7KpPYZ9eX4SzqgQe44N8QVJmG9dVe8zjMBlKIq12HxaFXtpmyxaeJi/QjMT96qafrsaTQ2YsANeLl/5TD6YlqW2VjxleZ44wBIyu9fHWZ494k69S1MHjgGcJn9SslB793GTeychhTKK6mqFtpF16SYVGWjEjlvS6XNKXHhmYyY8WcOuHC3aovsfyF5lTBh6+sueOC/pPVCE4xrnKW7EwmrqCIhyFH02ev0yfV5uG+0vC5zdVgaFSDe2PXKbpZFcFIntKcMDsUaT1ZuP8Op7JYbcCq2DM2tAlf0Mc8z3DgPVanpAg/Pe7L5yRAq/VBcaJKDRthRiBm6XX3+aGr5+8151WA/pGmKoKwcoGpeZLFXO7STmdrUuqfAgKXGqImW6MyC5xO2wNffynfkbNlv084Ej+vJ/R+N0xb1LL5WqAAEOlKMrSOO8t1oMKVSjw4v+n1ch3WR5nmepFZKCvrJ55
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c207f8ce-d870-4eca-a88f-08d81cf909d3
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 13:25:21.1545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W83KkRtRpSJ7nwGEhXFrhhvHiSsWK5wWFBAAVgOYi2f5x1Kbc+zxtL/xACcyO4YQO7sItoAlaIchpKM92vwFu8wCsIfaYSP7nFJJnKtRDWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1367
Content-Type: multipart/alternative;
 boundary="------------CECC08CC1C5B33AF18F43BB4"
Content-Language: en-US

--------------CECC08CC1C5B33AF18F43BB4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 8:12 AM, Leon Anavi wrote:
> Upgrade to release 0.10.3:
>
> - Ensure ObservedWatch.path is a string
> - [inotify] Allow to monitor single file
> - [inotify] Prevent raising an exception when a file in a
>    monitored folder has no permissions
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-watchdog_0.10.2.bb => python3-watchdog_0.10.3.bb} | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-watchdog_0.10.2.bb => python3-watchdog_0.10.3.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb b/meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb
> rename to meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb
> index 93a1c192f..2108cbb93 100644
> --- a/meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb
> @@ -4,7 +4,8 @@ DEPENDS = "${PYTHON_PN}-argh"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -SRC_URI[sha256sum] = "c560efb643faed5ef28784b2245cf8874f939569717a4a12826a173ac644456b"
> +SRC_URI[md5sum] = "9a5c9134e943b534b9f8b51d78338cf8"
> +SRC_URI[sha256sum] = "4214e1379d128b0588021880ccaf40317ee156d4603ac388b9adcf29165e0c04"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------CECC08CC1C5B33AF18F43BB4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 8:12 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629121233.27026-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.10.3:

- Ensure ObservedWatch.path is a string
- [inotify] Allow to monitor single file
- [inotify] Prevent raising an exception when a file in a
  monitored folder has no permissions

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200629121233.27026-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-watchdog_0.10.2.bb =&gt; python3-watchdog_0.10.3.bb} | 3 &#43;&#43;-
 1 file changed, 2 insertions(&#43;), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_0.10.2.bb =&gt; python3-watchdog_0.10.3.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb b/meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb
index 93a1c192f..2108cbb93 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb
@@ -4,7 &#43;4,8 @@ DEPENDS = &quot;${PYTHON_PN}-argh&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
 
-SRC_URI[sha256sum] = &quot;c560efb643faed5ef28784b2245cf8874f939569717a4a12826a173ac644456b&quot;
&#43;SRC_URI[md5sum] = &quot;9a5c9134e943b534b9f8b51d78338cf8&quot;
&#43;SRC_URI[sha256sum] = &quot;4214e1379d128b0588021880ccaf40317ee156d4603ac388b9adcf29165e0c04&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------CECC08CC1C5B33AF18F43BB4--
