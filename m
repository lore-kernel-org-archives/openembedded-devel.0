Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.43])
 by mx.groups.io with SMTP id smtpd.web12.9260.1602632632028718088
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 16:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dXxy54Nf;
 spf=pass (domain: windriver.com, ip: 40.107.77.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BabVYxwXZXJdqfdPjOv96LaW8CBP/d2D7FCbNrI/nU+iDlir09RvM6flR8zkTsShAEan6WceiQsuGxrs0NA1XwiiEY/BQflDVbVmjvzgDf+c8E9aFB2St3GZvV95NAUexMoVaytZyHv2ZY4VF+BkJGbFC0HNKKZVxCGuExaD4+4Br7GcqImswL9cxmorWNt9DT+NSYyhXIYHvTswQsBoJ6DLeJeJ0a87l0VmXDKahcQ2w4DFyFH+9HRh8KT8Vf7YVm0vsGulgsvCPvKWaeYxXSOu+V1GhLgtVkEX8O2OyDAlThCxXycElagXpij6EMC/+E+9BOccBjfAw//fLEfRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lX9ZEnSLqR2fW9CLpVuf+qkfwao6GoJAjn9itLmCkUY=;
 b=N1UeRBBNSLph+aSskSVs9rlAn6W/XoiIVeQYVsTzYuk+JkKj7AJBLx8EOJYO5rD0qnVJVTH698HPu2NXaG2eXDSRXjkOsZSumj8ENM9BjS/8BsFkcD//8bJ0j3w4csAdhg8PbP2hOvcn3NL5kQK/PGAGk3xC/EhBRKqT9ECHL/l2y/rAgFsVpR8cMB8+BxlufkV5woR3m6QAPE0Rax+d2Oa3UIRqPBqyU3NRt512+muOFLj1be4Wt4DV3gjIYYOoUf/ZKt2liBMPrJTWw3T96kUyah35+fnZPJVLXHvExvTrFsbG/m1qYpTngdZkpjVjzb1Y9Rt75n6vTHde8auqhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lX9ZEnSLqR2fW9CLpVuf+qkfwao6GoJAjn9itLmCkUY=;
 b=dXxy54NfMMGy2LJTiuOblWvcVvExF5mWqNjoMQsd8fGPd8LZxq3V6Z2z/Q4tus+RLooQUAekDnv8wZKXhBsfdGg5ZcxF5CXO70ce5Q1GaIOK2aJXi29m3G1V8VxRGYfyEuKkLFZZRV3Ba/ojtieiX2Yy7ggj3XYsuOgqte2pMxw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Tue, 13 Oct
 2020 23:43:51 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 23:43:51 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-pywbemtools: Upgrade 0.7.2 -> 0.7.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201009103535.31339-1-leon.anavi@konsulko.com>
 <20201009103535.31339-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4c4d449b-ad8f-5f7a-df14-842d42bddba8@windriver.com>
Date: Tue, 13 Oct 2020 19:43:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201009103535.31339-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR07CA0070.namprd07.prod.outlook.com
 (2603:10b6:a03:60::47) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR07CA0070.namprd07.prod.outlook.com (2603:10b6:a03:60::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Tue, 13 Oct 2020 23:43:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4537c618-627e-467e-8c37-08d86fd1d632
X-MS-TrafficTypeDiagnostic: BYAPR11MB3816:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3816E386E00FC0CE5201D90C9F040@BYAPR11MB3816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H5gfCw0rOl1CIkH0ac/XBV+1itB9RhqBNmKuUnrVJDVebeBGBUGzE7F0ce6F47OpzBDELU/6td3GW65WhOC23qlWIyM1/CMllsdGKoVobcJ/uAy+Hk+lubeYw3MVMj4MR5m2RJYqTku8UJYI4B+m037Oydhpv4/BdXFyOqaivZ5OrDqornZ1z4nWFEoqLxqpbP3XXNkiS016KX+zn00Kd2/4UKeDXoIbozgmRPJ8eOrIGYFwMkL2oJTCOgUWGPssi1GacwO/wnODyqgUY92gHQztqMNtK0SlTYMRwkWdKx4Y/z6kY75FBfX5ZsuKVjcuQr6JRpHz/fSxAVxiCUX/V/L4w0OCpKNlzORPs2tEgCkL148L4CZRTjtxeldmEtTBfRCR0ZowqVf/ZJcTAgzzEeR2nHqnd0989D1veCJLZxu2aqye2OEgGWWXlktb8RpGPcOgFWEYLqLVYpnjsORoLA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39850400004)(316002)(66476007)(66556008)(44832011)(166002)(478600001)(2906002)(66946007)(52116002)(33964004)(16576012)(26005)(36756003)(53546011)(16526019)(186003)(83380400001)(8936002)(956004)(83080400001)(5660300002)(2616005)(86362001)(31696002)(31686004)(8676002)(966005)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	HqZovwjd8Ja/IyMSTcXqcTxvsILTpmHluOBtw9nS+RxBghm4gIRVA30WpycDmDgxwcf6u0z+MG1t8q58OMrNbVCSFeglQiXEizq4IrIdXPMMuoYYtVU8WAtGUqvxWPiw+PqPY/Mkv1ZBrf8Pu0Jp+5jeTcoBOuubUmGtqo3sgNqKluaXd+aBY4wmK0mr1hpVsw35lSjvNMqwnMIsoHZ1za4d+EqfQGZ5CM0KD3cWIV9CYu6CutBi+jtwFCECmM9DBjWk3rCD+S8bd2PaHV2FeTyAc67eC1GP4xRo4VDjAjhqggVyTIyAksJ0BqmOs1Q5/BpOAqHNvAiz4S5hRjWsL/nRJRPeflfsZ+eksn/B4fz4cioelu027N6/k00ohcdAbU9jAUha6tppxL0JwQ5uXL2WKb1j3KziQEN49oBtj7NO8xEtbLWIOP+050RCPbZgEC0gARAhmn21oeHQmSupyrOrfDlxBPxz+x2Krx75U11mEZXQnsmDsXBvp6GpG/VVYY5Cc+pl97B63g4ah65EF9ioPuL5S/hAV68DwdmCjxNLlK/Zy/hYq6osznhRFX8V/JRZNxLsTp2tOVXEJkUjw70wuetIEUYoXH6UiYLxZomUFYnXJ5jK/x91tiSQGLHlRrH0EBCOFHJ0PtISZCImYQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4537c618-627e-467e-8c37-08d86fd1d632
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 23:43:50.8688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDt2GE1+og4dmOqmK1GsotAnwV9j+lUzWsUI19fguFyTzHTMXcqRsZqMHri0aKi9koRxPIKGO/9qhdjDTOxTLv03XxD6lozMd5C2DLCO5Fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
Content-Type: multipart/alternative;
 boundary="------------9302AD2C2B2E01DE46C936E9"
Content-Language: en-US

--------------9302AD2C2B2E01DE46C936E9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/9/20 6:35 AM, Leon Anavi wrote:
> - Docs/Test: Fixed failing install of Jinja2 on Python 3.4 by
>    adding it to dev-requirements.txt and pinning it to <2.11 for
>    Python 3.4.
> - Fixed incorrect property order in instance table output, where
>    key properties were not ordered before non-key properties but
>    ordered along with them.
> - Test: Fixed qualifier definitions in qualifier_filter_model.mof
>    to accomodate improved MOF compiler in pywbem 1.1.0.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-pywbemtools_0.7.2.bb => python3-pywbemtools_0.7.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_0.7.2.bb => python3-pywbemtools_0.7.3.bb} (87%)
>
> diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb
> similarity index 87%
> rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb
> rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb
> index 9121f81079..8620057f59 100644
> --- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb
> +++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
>   
> -SRC_URI[md5sum] = "54ebb824d7ab231ef1f1e88d8d69ac69"
> -SRC_URI[sha256sum] = "36d70f7d33498cab626e9a2871ea82e434a2c36fe6c240f400615082965f1e4e"
> +SRC_URI[md5sum] = "e3f8cadb8d1253b1b51afabcce4c3461"
> +SRC_URI[sha256sum] = "b475da4389ac77901191c886f4348660f3c0fd59365feb18ede47a086442efff"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------9302AD2C2B2E01DE46C936E9
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
    <blockquote type="cite" cite="mid:20201009103535.31339-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Docs/Test: Fixed failing install of Jinja2 on Python 3.4 by
  adding it to dev-requirements.txt and pinning it to &lt;2.11 for
  Python 3.4.
- Fixed incorrect property order in instance table output, where
  key properties were not ordered before non-key properties but
  ordered along with them.
- Test: Fixed qualifier definitions in qualifier_filter_model.mof
  to accomodate improved MOF compiler in pywbem 1.1.0.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201009103535.31339-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-pywbemtools_0.7.2.bb =&gt; python3-pywbemtools_0.7.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_0.7.2.bb =&gt; python3-pywbemtools_0.7.3.bb} (87%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb
similarity index 87%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb
index 9121f81079..8620057f59 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.2.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pywbemtools.readthedocs.io/en/stable/">&quot;https://pywbemtools.readthedocs.io/en/stable/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa">&quot;file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa&quot;</a>
 
-SRC_URI[md5sum] = &quot;54ebb824d7ab231ef1f1e88d8d69ac69&quot;
-SRC_URI[sha256sum] = &quot;36d70f7d33498cab626e9a2871ea82e434a2c36fe6c240f400615082965f1e4e&quot;
+SRC_URI[md5sum] = &quot;e3f8cadb8d1253b1b51afabcce4c3461&quot;
+SRC_URI[sha256sum] = &quot;b475da4389ac77901191c886f4348660f3c0fd59365feb18ede47a086442efff&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------9302AD2C2B2E01DE46C936E9--
