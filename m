Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.68])
 by mx.groups.io with SMTP id smtpd.web10.41940.1606165121998219921
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 12:58:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=e2suUAzL;
 spf=pass (domain: windriver.com, ip: 40.107.223.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6IQRNjQKDXRL179HhDmMRdCnFj2UMdY2saF8AGHg0kKxRuaqmdSzBLnsj/BHeC8czpkweTmoCt4lpPs/pVvoiTDKjQemVY625B0YXN2o+1RfBZN6N5bmSyxNoZL6maV1tH56A8pWxWUNunguwd9e0yvVTdXSzQ7+7Ylzm7QXl5y8dSUL9l0NvSQ1p3Mc0ybKC+hUqCz1ObPfFb/gu8OGFpSZ1kEmdAPAvt3t+0BN2n8bd41e2jJ/9godGoFnLIeT+sHXJwdTNCgeTTGnAsBrV5eHBKiHZHDebohCekG79UNlTzPBPrVEx3bpijU1iYSDXAWvxVxTFN+n48eKyB+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=in5tvIEzb7TcFjpiyOLkjqwhbt6kxy0clJXPXQMznoc=;
 b=HXdks2JoBWXC69M7lNMMD9P5FQnknjIUY4dPII2NWm2BWnAVms8NwY/sMC4rxLhskYhjYn5+L0qo8DR46kOBF1z9Sc/2Au3Iv9XsEj1cHW0ld5XUOJT7HJAw77BplETULR61kGyAK57KUuYAu3l2l4IfDLEFA3+mNgBB1zBMxpQ0qvrGVAY56SjEYdJivwtJtbCdY39+mZNZ4MavNrloneWHkg4+Yqf8O/7yRZf2vSBa2nmSTvYYueYFXFUA81DmrjxKB5QYoT4620QiWg4Ye2EUzDBaSB0P6RRgyhp446sadkbKSKz2BAvJOHazEU+c0Wu43Rm/HtknIvVByKQ4vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=in5tvIEzb7TcFjpiyOLkjqwhbt6kxy0clJXPXQMznoc=;
 b=e2suUAzLonCAxa8OxNrsekEUQCnwg9NnyYwIg+ju9+ZY8eoUaD1AXGNvot1GgFtsd9pPE3eP0sE4XmN+8rGjI7Uiy/C69Jyl21fTzjE7kFO9dPXW2rGhexU1ExWzkBURxtF0rZldzPABWt0aDrwDj87kgurG4Dwu9X9Syg6KRN8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2600.namprd11.prod.outlook.com (2603:10b6:a02:c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:58:40 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:58:40 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-sortedcontainers: Add recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201123062441.2998158-1-raj.khem@gmail.com>
 <20201123062441.2998158-3-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <07a1ef19-99a1-abe0-e29a-7a3dc76c488d@windriver.com>
Date: Mon, 23 Nov 2020 15:58:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201123062441.2998158-3-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0062.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 20:58:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07648374-9fa9-476c-5a4a-08d88ff28dbb
X-MS-TrafficTypeDiagnostic: BYAPR11MB2600:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2600A9F16C823AE0C4ECEE469FFC0@BYAPR11MB2600.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qpNaAfTOzwF3GBxq0KpTf00/VDoFEXp4pG417UG7g8UrvTYiQ4IiCCvct1Z7jmCSazv63Rw1DZRZJN6GvGM0wg0kEH9oU5MG7aBO1+UCEl5qxyNhfXJGTPjPmUBHdhVTp67Uy9xnqkMJ8BWSP3z5j9AYuBx5w6F39hOVk5Hil8bCpo3ekJUJcv7tYQx3cTW9CEP6g76SXdZq7IBYsQRIgIOanUJexcVMaYOSsJjBAvFyGCQ6XGa/NyeMFJFXqcoRHYNZtXnhqCkGtdoVuEIXa1qx5OrF7WwnQTk4hYEbC4Zsev/q25BGTTx6rJJ8rpdX1r86KNJdmvn3YOcxgt+AFPo4KRP4kvgfl7dwKigUFVjkdUMOXu023pvPxEHZBTkqoLP+tk64kmIrgF13v9IResxC0IYXOKxGJYW3ltlB5hlHMu5Ma9ydzB/PxWQLbcno0C9DFiocOfkJsLoHjCnLIw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39850400004)(2616005)(53546011)(956004)(16576012)(83380400001)(33964004)(52116002)(8676002)(44832011)(8936002)(16526019)(66476007)(66556008)(66946007)(166002)(316002)(186003)(26005)(478600001)(966005)(36756003)(86362001)(31696002)(4001150100001)(5660300002)(6486002)(2906002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	PawCpmncidxPAJ/dm+II7qUuvLh5AL7DrLUGdHm2wC1DWOR89tJAR9oafjWVCPjSVRlwiJRIzA++M3lV7ddruSvNB/elEN7qKXLJnSIY7kLc3KiR6UrZ3yleYLiLVsjY8PnZbWL4u0tmThgzJa1K6Gk5i5s943sUeq6mdZz7rKEoyyQxq1CPUeMujG7+G2ELMO2uAxPOwpop6GgtfqnNo22k/2zSIezd8pJqIgNdHyU4oJfkS0TedSsn6hOvR6B40Nv3Bp5GwiTAmH2uH9+WL9y/MpQleifQA8woqlEEjYPdSzQ6cPskJskTtCNQHMheOAOrtYW36t5hTqC6iuaTj0lHxahdMY2FwS/cHtNGlp0oqYqTQfajBVZQawVzHcmx1NcSe08tygixikEHxlbZnm+AjlA05MZnYqQzdCrNYQGVCi3aOp4ruHSdyjCUopRx6g7lT9UcqrXdZ0+skSwDfOlPAChTsSww8m7PMEnOHj/dST6Da30tyLqHyhZaQ9jyLXbi/DEQSEVlxnCRya5p0RRZ1IE34efvxPGH8fCc7lYMYx+IWNw2AggdyEepEML2xvNw/CnXltIx2s74pxKXmto9vcbkHZPKX26DcSGQWoWSToDBTsWSxfWhYRQdq/9Tf2TDFFzNqjYHW9x8woON22Gj3YFe2LephPrzOBn0+yxrCwr4FreG0x1+tMcLniRbzYFIaD5afEkN2+sgRLbWYvEp44lKWIG7hXvKKU2gn4KEWCmHMh6d9GulVL42RDGDaHun5M+Myk5kRMEodP3dTEMT4b3aeVRi+CfrMZqMLTAhD42aeNz6W1I7DZGjFNmdrsIs+U1TIRooBuCui4ZXhBeqiaSw/dPKXqLNcfmzOXQ3HP0w1dtyOEDfeX57/jSBRonKazhUnSOwtwB6ndpUhQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07648374-9fa9-476c-5a4a-08d88ff28dbb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:58:39.8177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvzW2gV+WhSxoxFfj8bHEgouZD10aGr6D9IN5NoyAHAiULCgkxbXx0w11o2tkYwPfw95qdhj+P/wZOTgehPAXHkPiu/rVIVoIkLn/i9bMU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2600
Content-Type: multipart/alternative;
 boundary="------------EF7AE9662A87B6F0DD6BF33C"
Content-Language: en-US

--------------EF7AE9662A87B6F0DD6BF33C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-23 1:24 a.m., Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Its needed by python3-numpy pytests
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-sortedcontainers_2.3.0.bb             | 9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb b/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
> new file mode 100644
> index 0000000000..6060c03723
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "Sorted Containers is an Apache2 licensed sorted collections library, written in pure-Python, and fast as C-extensions."
> +HOMEPAGE = "http://www.grantjenks.com/docs/sortedcontainers/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7c7c6a1a12ec816da16c1839137d53ae"
> +
> +inherit pypi setuptools3
> +SRC_URI[sha256sum] = "59cc937650cf60d677c16775597c89a960658a09cf7c1a668f86e1e4464b10a1"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.29.2
>
>
> 
>

--------------EF7AE9662A87B6F0DD6BF33C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-23 1:24 a.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201123062441.2998158-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Its needed by python3-numpy pytests

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201123062441.2998158-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-sortedcontainers_2.3.0.bb             | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb b/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
new file mode 100644
index 0000000000..6060c03723
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = &quot;Sorted Containers is an Apache2 licensed sorted collections library, written in pure-Python, and fast as C-extensions.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.grantjenks.com/docs/sortedcontainers/">&quot;http://www.grantjenks.com/docs/sortedcontainers/&quot;</a>
+LICENSE = &quot;Apache-2.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7c7c6a1a12ec816da16c1839137d53ae">&quot;file://LICENSE;md5=7c7c6a1a12ec816da16c1839137d53ae&quot;</a>
+
+inherit pypi setuptools3
+SRC_URI[sha256sum] = &quot;59cc937650cf60d677c16775597c89a960658a09cf7c1a668f86e1e4464b10a1&quot;
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------EF7AE9662A87B6F0DD6BF33C--
