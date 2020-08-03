Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.40])
 by mx.groups.io with SMTP id smtpd.web10.6843.1596491717973078860
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ix6+Lx+k;
 spf=pass (domain: windriver.com, ip: 40.107.70.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbN5STWuvyh6PViUhqdk2RckhZTn6U+E1zTbp0rYzo/JMOHUlwcGfbmiFXfODPK9LVe76qMjM+AZmC8pg4CqCZPRN0p7AzBQpGlx+jOvHgsapnOmfeMIN80Qf1ZJQRqNLgEekEigPTIuqN+pN47qEsU+rektwiGvcG/dKbLVfRPi5JXcI/HFjTnDhDwNxfYIhNQgVUupiNC/lcYXNv8UPqEoLdCgZYFij2G6PfOBDNplRmZXEaSCvnxF91z0RcN0FwccsHpvqVV3LmL44rVwZgQbtnHlnfM+834UeFHnV4+odQ0pZ/Vh03mHt+xE6aGRRpHTy6ZCs/Qymgh4XgNorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Gl+0PDZ4iY3nrE+BOj9PpmuSgJCBhM1BczpqTQMKKw=;
 b=ZbTpn82zj3cnAqfOskgKwnu3C7suU0AT3KXugzm2xNT3Nr0Ndy475HtWaFUO0MPCBLmUk2s2LRIfw0xqea5toWNZ/KqEIKJ5x3mORl1ydpxMKwkT1qYMoL/i/K917qUQIEy1FHrwl7p0grnZZB8fQDlJVl24h7dCzJg5+C8acbV7mW5QYIVCdiW/RSFLjvwJmUdK94ijHPl3fpxWVtDBIrx4b0SKbWU2pm22bUjyyI3PxqhILuXB1+LZulmTQZft3Fw977NbdIWIZ3uJQ8GbL9YjsOO9us7dTYw7f84oTd5RZIAAD3ECLeC6g7FN9Yed0rZ3yN5P5pMeHaKR5KU6yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Gl+0PDZ4iY3nrE+BOj9PpmuSgJCBhM1BczpqTQMKKw=;
 b=ix6+Lx+knTn3H+zUNxL8sQMHC380ekJMUl/lyhmikX/pt/7FDUM5AUNioCHyyWVIfF9mdyeJ7IVdqHreBPKkFiz302YnMOwxmSxvb+To1RloyH96XUVlDrgyxmGbUJ9laJ/oTjnD4XqMBDO4zbLIXWcwoE2+m54Ofq3FrFPqWsw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3352.namprd11.prod.outlook.com (2603:10b6:a03:1d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Mon, 3 Aug
 2020 21:55:16 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:55:16 +0000
Subject: Re: [oe] [meta-python][PATCH 10/15] python3-xlsxwriter: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
 <20200731132230.20031-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4fd6613f-b417-fb28-e9ff-4d9cb8392f3a@windriver.com>
Date: Mon, 3 Aug 2020 17:55:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731132230.20031-10-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Mon, 3 Aug 2020 21:55:15 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cd0ab59-037c-438e-4ad0-08d837f7e7d4
X-MS-TrafficTypeDiagnostic: BYAPR11MB3352:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3352CB750FC6AA112A6D60EA9F4D0@BYAPR11MB3352.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f45g01rlm1J/w0XARTFDWu2QglkZ0WnwwMmnTuVrCovdCqQtv12nl2g9MUwQQzSZYwqs1HZ04ocQ5ayKAE2bMBhxb8F4P4ueak/Tvsc5XZmAIVQhvtPXTcmIVO8/5QZhgtqW8TFGAW7vwFksIdg1rqNSX4UFJpRtX2uTKqT+S8RU3LPv5y49VRyGfhyy8s1Q+Gj/mIItYgWr4eId0mNNZE76gd9bpULzDu5PUQA5eLg21oPMgZKjT2y5qcM1lLcQQNRdmIS4wm107d29fH8O1eUFDmx7sN6TXtqWXiLE3fHyH83FmvwQrDGdol+gmiYz3ApC9V0WEAQwWHahfcyFzyWhwIjheDxYIgp2ZTm/rTexqKVseXKv8aXKJchl2zgD2hZnIirtoNpy+Ms7jFaLeGEJmnmtguoWVldKsSBYAOf5GZnvwNNaArxC9+zk/npkyll8NoiSilVFQrsvQ0qSPw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(396003)(376002)(346002)(39850400004)(136003)(8676002)(31696002)(2616005)(83380400001)(44832011)(2906002)(53546011)(86362001)(5660300002)(36756003)(8936002)(6486002)(956004)(26005)(16526019)(186003)(66556008)(33964004)(66476007)(478600001)(166002)(16576012)(316002)(966005)(52116002)(31686004)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	9Bq4LBx7OqN7Hq9nn1Rb/M3yKO3LqHsl3tWs3pv4a1jtEWaO1kcGpBmQJcx76ZW6u4uP7TGkK+mFdYxUpFSCTKfV59MqI1S0NqQmmmlQ1clUtqqzOViUmUAA0jVcHOzPIEwBmJMyP3GThmDFkFl5dt3iQfxPVUOnxG3bUq0IewzG+zsnEQ2F1HRLsYD3JH6K11pX8tr10teDO2eCWgyaOxHkcCzNNEBWlF/9CWtRba5JGOfDFRbuGYO6B2nja8Gge9WGSOE6/I4kVFObcJcffSXabPHInb4sjcjgmIaHtGlPL7hCpY0a8NpOREQtHNRt8oTqItTO8jel98sx2hD+rPkSr9Pnq4V0LH4QmbjJggXiSiPpGNLYPMv35FD5ESvgOKPbMlAiOeRSi758HJo0t6QbUNWkqNq4StnNlohVVFFSPh2oqQeq5FMxSXeNY4zwTF0oaqcXakn0gIomGmsRygxdxIoQqHAD49SBbbPPDL7/LjjQM1U5e8lFIplglY1cZViTwSCyx+XhVYJC+jPuEATYj8wjrqoUcxSx+QekVTzk168iMbbeXSdShvRFdzkYf9MtS64XzA0F1HB49fAuxuBsIa/WRWAX8aeAQ8PmJ9nnOlRXJYUYaOmTgNHRCfPdYrpO/Bxg9AmXIDzRcLW5OA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd0ab59-037c-438e-4ad0-08d837f7e7d4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:55:16.0633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SOucohVLqT2pghy989Y8Q6vAR3Qvi/Wyp6nmh3ldgblrjEX785YFcMVyfBbEraA4cNPSA4wytgvGD5ivbunvgV0ymTPHq/79hG/N5OV/i0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3352
Content-Type: multipart/alternative;
 boundary="------------6A11973BACB5C0D0CD6A0A03"
Content-Language: en-US

--------------6A11973BACB5C0D0CD6A0A03
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 9:22 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-xlsxwriter.inc   | 11 -----------
>   .../python/python3-xlsxwriter_1.2.9.bb              | 13 +++++++++++--
>   2 files changed, 11 insertions(+), 13 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-xlsxwriter.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-xlsxwriter.inc b/meta-python/recipes-devtools/python/python-xlsxwriter.inc
> deleted file mode 100644
> index f5d56db00..000000000
> --- a/meta-python/recipes-devtools/python/python-xlsxwriter.inc
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -SUMMARY = "Python 2 and 3 compatibility library"
> -HOMEPAGE = "https://xlsxwriter.readthedocs.io"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0960d52d61b0801760f39463288c2672"
> -
> -inherit pypi
> -
> -PYPI_PACKAGE = "XlsxWriter"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
> index cba856143..114f48214 100644
> --- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
> +++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
> @@ -1,5 +1,14 @@
> -inherit setuptools3
> -require python-xlsxwriter.inc
> +SUMMARY = "Python 2 and 3 compatibility library"
> +HOMEPAGE = "https://xlsxwriter.readthedocs.io"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0960d52d61b0801760f39463288c2672"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "XlsxWriter"
>   
>   SRC_URI[md5sum] = "20f8b7df7f1705fa2f7ac3f84789d2ca"
>   SRC_URI[sha256sum] = "828b3285fc95105f5b1946a6a015b31cf388bd5378fdc6604e4d1b7839df2e77"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------6A11973BACB5C0D0CD6A0A03
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/20 9:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200731132230.20031-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731132230.20031-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-xlsxwriter.inc   | 11 -----------
 .../python/python3-xlsxwriter_1.2.9.bb              | 13 +++++++++++--
 2 files changed, 11 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-xlsxwriter.inc

diff --git a/meta-python/recipes-devtools/python/python-xlsxwriter.inc b/meta-python/recipes-devtools/python/python-xlsxwriter.inc
deleted file mode 100644
index f5d56db00..000000000
--- a/meta-python/recipes-devtools/python/python-xlsxwriter.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = &quot;Python 2 and 3 compatibility library&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://xlsxwriter.readthedocs.io">&quot;https://xlsxwriter.readthedocs.io&quot;</a>
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=0960d52d61b0801760f39463288c2672">&quot;file://LICENSE.txt;md5=0960d52d61b0801760f39463288c2672&quot;</a>
-
-inherit pypi
-
-PYPI_PACKAGE = &quot;XlsxWriter&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bbb/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bbindexcba856143..114f48214100644---a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb+++b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb@@-1,5+1,14@@-inheritsetuptools3-requirepython-xlsxwriter.inc+SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
index cba856143..114f48214 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
@@ -1,5 +1,14 @@
-inherit setuptools3
-require python-xlsxwriter.inc
+SUMMARY = &quot;</a>Python 2 and 3 compatibility library&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://xlsxwriter.readthedocs.io">&quot;https://xlsxwriter.readthedocs.io&quot;</a>
+SECTION = &quot;devel/python&quot;
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=0960d52d61b0801760f39463288c2672">&quot;file://LICENSE.txt;md5=0960d52d61b0801760f39463288c2672&quot;</a>
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = &quot;XlsxWriter&quot;
 
 SRC_URI[md5sum] = &quot;20f8b7df7f1705fa2f7ac3f84789d2ca&quot;
 SRC_URI[sha256sum] = &quot;828b3285fc95105f5b1946a6a015b31cf388bd5378fdc6604e4d1b7839df2e77&quot;
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6A11973BACB5C0D0CD6A0A03--
