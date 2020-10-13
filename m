Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.63])
 by mx.groups.io with SMTP id smtpd.web12.9269.1602632656382206602
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 16:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DiXNmqpX;
 spf=pass (domain: windriver.com, ip: 40.107.244.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7h0MXHBqzyyCdyI2H2QOyt7wFfz/yhWQdwbfYX0OtlQlKlErvD8tiItSP0ocI/NDklqOK8oN9rBVN071DRGtMKuBKi1cjQYZBz9VeP7Zh7ShSNXyATcWJbaa9FjRNeY3sOPcN3lwu2o2e424oZM5xoE8yh7nFcMNOO/X8Z99yy3oHiNuKFQHO9vUxzyzHIc33+jA4BusvGTdDG/tw77VNk6XRQdcSN7eupN78/zix4OzLAIrWGuJXl7WZReSGB8hKt9ka+VRl2OtQYPG3q802Ygc7brZ50t4i1VkZghugT+F3ijXho8JpGy8JEeHUJafnEUXjBWjXqExmTLnxRMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfJcRJDvwur+iBlL7ckL+eTLSZfoo3X+j6ZNRb34HOY=;
 b=exSPk+xlQgQgUo8j0xe/oTNJld1lJhdOj5UaOGRbeBQFBVpFZ0BpjNrhM1ijEiat2uUYbeYdD/xv/TP1VlDrILaxn8NjpTonDoRQRDLLICjv4+qP2NxnHOezfYqoBaG5696elBFy9AAg2Y2qEC1H/fX92ElI4XYhK9ustMoRJQ6oOmL5AJ14B+wTTU+2IBaua8cvoCkqaITtCuvtYk0H/I8itmA0WV0Lu8tWENdp8Cv40ixrjEsw2NPmhrSDGcS1zvcAU/C3IONGDkN+OW4cpHLszo+0biI6q0Jr7GsKdVu5CHq/GbTecfCCSgqy7HG/8j2la2ajXVOC7p+yp6EWRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfJcRJDvwur+iBlL7ckL+eTLSZfoo3X+j6ZNRb34HOY=;
 b=DiXNmqpXQ/CqrU+LCWXNOo9EwJzkBbk7/fjXjTe89DxzOUa06tHFET47sX6KmV5iaVw7XHcdP8GBZGeqnsog/v5FHPTvZlu/tvDBm0siWhoBRo3AwQXTy7AXk2jUwk2V1tzb8/hHwoB2CXRg3plOCbVG3Eqv/0fMOe3a4kickoo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Tue, 13 Oct
 2020 23:44:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 23:44:15 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-markdown: Upgrade 3.2.2 -> 3.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201009103535.31339-1-leon.anavi@konsulko.com>
 <20201009103535.31339-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d156cff0-5402-df3b-b139-b5451892b632@windriver.com>
Date: Tue, 13 Oct 2020 19:44:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201009103535.31339-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR07CA0050.namprd07.prod.outlook.com
 (2603:10b6:a03:60::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR07CA0050.namprd07.prod.outlook.com (2603:10b6:a03:60::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Tue, 13 Oct 2020 23:44:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0162cc4-ac67-4d83-05e6-08d86fd1e4b1
X-MS-TrafficTypeDiagnostic: BYAPR11MB3816:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3816DFA7EDCDC9986CE489079F040@BYAPR11MB3816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PfrR15KThw01JDhT00HwHoI7wQ94y635Q1KGeZAT6L1pEAGG0eKsSTRrmkq+A0psCOSV4af1NowMCflIXh1jlebUzo0xHBC7jOQJg148nIgjZhwG5AKzuNn805ropXoEuhBJ1V/k7zhM3AUpcviPpShn3bfMy+QrlpPxQK0H0qbOz6+UY5BQSQ2xrGMsl2qefD1VdZHu9eA5idoKLF65Kif4sYoMkYXtni+rGKx57d6e3gul8YbD8V88B7WzfpLwpLdllRdhSaSWLGpHRzksyn2QzEUVoX0yotbjuNotyg4lPF/glbNFRpTfrQZ9OAq8FWYKfIDPdNjThUPpZ0k6noS9MaoPryITNJSKQFMtZ6CDGB7n+f474WYiYuyODgVNwBiZkbMW+VBUP5cuDxBh42ZqzAxMjY+IbyoA+phmKxPVMtaoIobFW0JxYVSdFHmGYUWFOXR6Y0XTqyIx0NhaCw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39850400004)(316002)(66476007)(66556008)(44832011)(166002)(478600001)(2906002)(66946007)(52116002)(33964004)(16576012)(26005)(36756003)(53546011)(16526019)(186003)(83380400001)(8936002)(956004)(83080400001)(5660300002)(2616005)(86362001)(31696002)(31686004)(8676002)(966005)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	wXTGl7p1GV/B88NtFMPcdpVnzS3R2yvdTDnydS7Sb7hy2BXM1aXdXbG1xJ98U4NhJcpvPOCiFm0AXs+pHIYjMqOQfzqvdTZBOXkmQyGj2mST0tUYx08XH1AiEkBQCuIKLno5OmToEWMRQKUZKJcVbr5qxkpMMmdmmqcn5tLypJSyEAsMUI0kYEUti9teJSygHs0jX0tImzDXmCcZ0R8k9rMae+IH+KTQEBiQIn7apQaPctfMoa1B4H4Q7HJnc5imiU87CEziNuUsC5hUe2jDgbNf7d4olCG/6KAZUqFEznxES0kEDVJ4B4ycDA2gG6JlEsKO9R6MpimfIUL2E+hPcv5nTA9tsbNFE6AdgvCXsjgB2nxCLlDX18MUkVMyem+b6oB6dEer1Cc01Cw4A8wDEfIHpDL38dUPF4T3A8us+BgrPPL9w5wlwFtReH2nuuX93fuCcsBgitWZCwk+RR0JsYFcdPHGqr3FwyE/F3Z71G9cg/9Y9VR4ISFBIoCy3o/mzFPZzZZdG8J7ZeML/gJTyo1QxJm81mm6mpV2RoHrKbfI+6xFsetAtnNsgb6GGf406ME2uWfe38MCo0Dxqq/EEf+dyxL43fB2HIb6a4VCWnhHgL1qFi44LvwXSgFPSKIfH21VEg3WcWhVWyAiTAOwlQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0162cc4-ac67-4d83-05e6-08d86fd1e4b1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 23:44:15.3257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfZjLGJSFPz3Nzw5uJdb+MAH5ZsW4kYvgGgGB+O1fi8Cy22Ad2IcbvnIpj5ke1UzjTEv4tYSE2o7+2bEb1IIIgysLkWy69MHX+1DtRdsW+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
Content-Type: multipart/alternative;
 boundary="------------CB5AD2209B5751E7835781D3"
Content-Language: en-US

--------------CB5AD2209B5751E7835781D3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/9/20 6:35 AM, Leon Anavi wrote:
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-markdown_3.2.2.bb => python3-markdown_3.3.bb}   | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-markdown_3.2.2.bb => python3-markdown_3.3.bb} (51%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb b/meta-python/recipes-devtools/python/python3-markdown_3.3.bb
> similarity index 51%
> rename from meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb
> rename to meta-python/recipes-devtools/python/python3-markdown_3.3.bb
> index ce5dde63ea..db8311be5d 100644
> --- a/meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-markdown_3.3.bb
> @@ -5,9 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
>   inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "Markdown"
> -PYPI_SRC_URI = "https://files.pythonhosted.org/packages/44/30/cb4555416609a8f75525e34cbacfc721aa5b0044809968b2cf553fd879c7/Markdown-${PV}.tar.gz"
> -SRC_URI[md5sum] = "6e8daf1e566bf3572c137ada399fe40b"
> -SRC_URI[sha256sum] = "1fafe3f1ecabfb514a5285fca634a53c1b32a81cb0feb154264d55bf2ff22c17"
> +SRC_URI[md5sum] = "76eb34a058bb8b637ccadc4ce384bae4"
> +SRC_URI[sha256sum] = "4f4172a4e989b97f96860fa434b89895069c576e2b537c4b4eed265266a7affc"
>   
>   BBCLASSEXTEND = "native"
>   
>
> 
>

--------------CB5AD2209B5751E7835781D3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/9/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201009103535.31339-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201009103535.31339-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-markdown_3.2.2.bb =&gt; python3-markdown_3.3.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-markdown_3.2.2.bb =&gt; python3-markdown_3.3.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb b/meta-python/recipes-devtools/python/python3-markdown_3.3.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-markdown_3.3.bb
index ce5dde63ea..db8311be5d 100644
--- a/meta-python/recipes-devtools/python/python3-markdown_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown_3.3.bb
@@ -5,9 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed">&quot;file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed&quot;</a>
 inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;Markdown&quot;
-PYPI_SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/44/30/cb4555416609a8f75525e34cbacfc721aa5b0044809968b2cf553fd879c7/Markdown-${PV}.tar.gz">&quot;https://files.pythonhosted.org/packages/44/30/cb4555416609a8f75525e34cbacfc721aa5b0044809968b2cf553fd879c7/Markdown-${PV}.tar.gz&quot;</a>
-SRC_URI[md5sum] = &quot;6e8daf1e566bf3572c137ada399fe40b&quot;
-SRC_URI[sha256sum] = &quot;1fafe3f1ecabfb514a5285fca634a53c1b32a81cb0feb154264d55bf2ff22c17&quot;
+SRC_URI[md5sum] = &quot;76eb34a058bb8b637ccadc4ce384bae4&quot;
+SRC_URI[sha256sum] = &quot;4f4172a4e989b97f96860fa434b89895069c576e2b537c4b4eed265266a7affc&quot;
 
 BBCLASSEXTEND = &quot;native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CB5AD2209B5751E7835781D3--
