Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.81])
 by mx.groups.io with SMTP id smtpd.web09.11005.1603899796658513390
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YBPANarf;
 spf=pass (domain: windriver.com, ip: 40.107.243.81, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faBMwVslIEC2x04jPC7O+esRqEcXbaXzhU/Z4axATKZwprUx3s99N8kMzP7n6nOaXc+VQFXwrrKIcunZ+13CDUx2OxrzZfzQkWNKOOV++s5Yg90ygD7iVWLMR3X24T1YKGF1WeUEEiuMYMxlXAmdZYoJPo4MO6UUOWSmx8NZGBB7I1hDQpSK8yDF5erjDs293lDhUs9pBMi/ZeMrQqd0ohzg0evOA2Zsa4oSIhazinM5/+QdJeqsfUkEkhDsXtNGPwU1BDo5ZkbVCVF7MFf6Bm+1FfH8GhoqJnuLczGZbT4XmmUuyA+jQT/Hb53IZk0pBADWboeazYBRRL5CAEsDHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ut2JOMAxofqXM1mA6GWIRs7O2F1IQjUxosEK4TFM6I4=;
 b=O6t3dns6+ROawRGJrwIFGvUry/Dd26FJj4DSTtAlxBP4X3mSjYKE3GCr4tp5UGURIxalmNZlnEIFC0vGXo8P3frwvFbDko2R3GfeoJpqAyPtS1Zzv4pqLWQEC0VkpOGmFW+lMnXseIGnBR6Fqlaje4cwcFtMPQtKdZVZqac96H8i8o47ySOEop+6gT21zzHKq2N/QfIJJRjL3cjLoaaFG/HvC4LeyiBQrq2AblciiqHUHVSbuQQM5vT/HRpntD8EUffaP7K4yuodtggWvhpFOys3DCA32apaJWDRwawReNwxT7l8XOZgTjbAZz0GU8b4zeI/w1wjiLcDDM22GesdTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ut2JOMAxofqXM1mA6GWIRs7O2F1IQjUxosEK4TFM6I4=;
 b=YBPANarfpTLDHQD3eNs1fnQ4M4mjMFeJ4VVs0JxHg3jaK/sXHO29wJxr4wMtL1gk4i/5B5Eo+a+GG8Arp58vVGZt0L001rC8UaCcSFRDmtyGIYi7kkFH2UOMXMx5+ei26hLgnTd5Kh6SiVpmSrs3w4O9Xc/Mw6mJlbptylmsf/I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM5PR11MB0028.namprd11.prod.outlook.com (2603:10b6:4:67::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Wed, 28 Oct 2020 15:43:14 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::e8b7:eec1:e6fb:35a]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::e8b7:eec1:e6fb:35a%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:43:14 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-prettytable: add wcwidth to RDEPENDS
To: openembedded-devel@lists.openembedded.org
References: <16423239737F92FF.31237@lists.openembedded.org>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <31cd914f-abe8-69d7-5b64-76d718d55e2f@windriver.com>
Date: Wed, 28 Oct 2020 11:43:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16423239737F92FF.31237@lists.openembedded.org>
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0151.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::30) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.133.31] (128.224.252.2) by YT1PR01CA0151.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 15:43:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79c6a4ad-002d-4834-3923-08d87b582ea0
X-MS-TrafficTypeDiagnostic: DM5PR11MB0028:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB0028B80A31244B10F9542E6BF2170@DM5PR11MB0028.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N3jYHzjrPoAYJ3uQW6XzRTHMYiCs3XOclKpg0JdD19hGPV68FtriGDhljLlqNvka5MN5ySRiyN67Fptgpp6uW6BPh5GuwJ830+/nQI2qVCkt8RHTBiNM+zAzL6gAckeGtlXTYwsGJPRxiG+a64B6M7SiWA8ATn4Dn9u1SKmMlZ2SB2eZIN8QvGc8HzvJaMCSPQTD+kdvvPdcxMP7YiHyjCY+VSQ4PMr1c3nKPOvZbcpDRM0z5rfsK8EMDdSv1jCBZRLOuB+28XymhMbaUfkzqcpKuoMKoiK2y2avOLx3eSbXuLIHxWQ3zXTlevLPoBAktxdDLdgjyDZdi+ft/IKkWAhY1+vXi64eV0oNW/IuF9l1bKDdfsv8rEWtb02AAzivbncCgKsnMLOvzIHi/bIw3TJ9sh0C6D3/wc5eW5wcv7pWe4UQ5R/DGYCeKTj3PbdHuBm9F0BbH4Q3bFWrDKbs0xa9lWoSEuX2hHqMj9B1/+E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39850400004)(6706004)(44832011)(6916009)(26005)(66556008)(53546011)(8936002)(16526019)(956004)(6666004)(66946007)(8676002)(966005)(478600001)(4001150100001)(66476007)(2616005)(86362001)(186003)(83380400001)(31686004)(6486002)(36756003)(31696002)(2906002)(33964004)(166002)(316002)(5660300002)(16576012)(52116002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	AG9unkGLEHD0DZqVyHc5MOAmsGX1kabGLaA1JtN/LrbLOhzNHRmkUul0UAZLEIgjH20x9/+9wa68+TVOZwnBTPmxRzbpftEmmcGbtlDNhFKDHfID94GPFw+4w0QFMpbKw57DYPwJ2JPITBr+kgmcfSFF9hUYEVGh3pzVLNVjcmvgMzLChrnQB0cbjNy+3kkg0xqCKDtcxRDvekFEQ83SR8dQX8RPAEfSKhtFySgs/c0ly8O0dgZ92KiVFWhv1Xd7llkZNjXztUux69SZ+FWxABl8zXrNkeNEDKHW+YDvxFz7SpqSMF6GDHgBPQzGbTh1FmZPJJe61HOTHsHIw5Qi7fztaIW9q7O1ABkYyo9DXx9kjR+UQbn3qnEV0dXQ8ty0+I7zvuUFQhOOtqHvUVyin4Y1UZ4X4wEd4hogIIRP7LGIgKOKxv1CM7SefIwpaUQ1Btx+ADInRnlTplQNT4GsA4tuAmk3bCQhEU+rmkyzPJIh0S5w76dpIeXi8PEVtL1cNdxFG7/QFw8kZaeQTs3ykmPzidkkLCHh6Y/5pM5KPNxdyBa0MeA51Quc/Mkh0D7K6GbshS55xkkn4Bp1JuJiADk2J/KHW/P+RGT0iC6eIWNu+qMBMWGioxr8zTjbQaF7G4S8BY7nYDxdMyZ8fmhIaQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c6a4ad-002d-4834-3923-08d87b582ea0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:43:14.8252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3Ve9ctV1AC3wptNFrD2M5KyXNJQXOOGa1EP76+pcPNAnEfnKbLS9wnLIKXsWkvK9T/ORNspxWVa3b5EodvY+ztaT3Ru1VrLct7v4NtSMzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0028
Content-Type: multipart/alternative;
 boundary="------------A7F560EFDF7BC3B441DA012C"
Content-Language: en-US

--------------A7F560EFDF7BC3B441DA012C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

PLEASE DISREGARD THIS EMAIL.

On 2020-10-28 11:40 a.m., Sakib Sajal wrote:
> prettytable uses wcwidth for better wide char support.
> See commit 83689922af58c152993e8ef5bcf7dd1464371272 in
> upstream prettytable, hence, add wcwidth to RDEPENDS.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
> index a065b6c47..79341b9d2 100644
> --- a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
> @@ -28,6 +28,7 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   RDEPENDS_${PN} += " \
>   	${PYTHON_PN}-math \
>   	${PYTHON_PN}-html \
> +	${PYTHON_PN}-wcwidth \
>   "
>   
>   RDEPENDS_${PN}-ptest += " \
>
> 
>

--------------A7F560EFDF7BC3B441DA012C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>PLEASE DISREGARD THIS EMAIL.<br>
    </p>
    <div class="moz-cite-prefix">On 2020-10-28 11:40 a.m., Sakib Sajal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16423239737F92FF.31237@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">prettytable uses wcwidth for better wide char support.
See commit 83689922af58c152993e8ef5bcf7dd1464371272 in
upstream prettytable, hence, add wcwidth to RDEPENDS.

Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
---
 meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
index a065b6c47..79341b9d2 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
@@ -28,6 +28,7 @@ DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 RDEPENDS_${PN} += &quot; \
 	${PYTHON_PN}-math \
 	${PYTHON_PN}-html \
+	${PYTHON_PN}-wcwidth \
 &quot;
 
 RDEPENDS_${PN}-ptest += &quot; \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------A7F560EFDF7BC3B441DA012C--
