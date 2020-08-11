Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.79])
 by mx.groups.io with SMTP id smtpd.web12.15769.1597154675628991942
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 07:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JyXt4DR9;
 spf=pass (domain: windriver.com, ip: 40.107.212.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7AIoQVrVguWLsdlhJc/D1OzdZEurG796Yy4layE3UVo17ZmrCchJeJhoCoZXdi58Xkw+IE0TcKV1dPfgsVJKFjpp4jS+gqS0cYhytFIo8cF1lmeLzo02XJ8BZIK89f4LkhGQMQ/0nzlE93sycvv/1tkzMxFUUFmRyFPUTkM27t0HrR0qplEt0MwVcamDi0H8SiEoUaByalP74p1+UoxPLnxGzyY/IeOfkvhzCIyg6zdVKfND6D3b65PCzhIlr4rTYc8HaOw/FhBSvNPc3vS354WZyMqWPblh6VXvzCajuDBbqS6b5uZahz5zhidXBNAg2r6Nwy7KEfpByTFE743AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onsCux3kcO2ShjYcsg6IsdTE5N6jtU+OVe8UgVwjdCk=;
 b=Tix/mHo2rO4JVIIRwZQ8uaXVwEWgBINZ6mcMgSIFs5cCesviBEq5wU5crfXcMikuFOt09LJSNBWY+AwCOtEkeWCELpJu82ihLqYqoX6JGIvocnccSwk9Xhp3HQcmoYPGTqOsWOYimZpB+zE24y8q/CoUvfPG8rtSueQ6wlki2sb5J+gPZ8YdTR59u9KoQ0PIqY/Tx7kOarA8XBsJF5/Ou41y0tNDGAHk5dX8UPaqt1auyLIJGt+AR3HSejNomtyF3JhRrcVP/GydtJMAgyj0R3ph+/+Ox6MDGt4w0+KYHiZLgnbZxXByEfIeEsaHjxnI5iScLyi+M9GKqny6M90Ncg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onsCux3kcO2ShjYcsg6IsdTE5N6jtU+OVe8UgVwjdCk=;
 b=JyXt4DR9j5E3jW/FqUFsCvLHjamLrsj04koLKds2RGI64oFyfTs3giGaJ2/OCdCJeI3K5iujRBrZN2ft85CmUCBfxpSoV90bqy4oZIAE6PculsfDAPcnhxU/gOiB0xXLsUEAVMwTcdWJ7d8gTsw8XIiUcxx5haFImrSD9hYq1W8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2904.namprd11.prod.outlook.com (2603:10b6:a03:87::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Tue, 11 Aug
 2020 14:04:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 14:04:33 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-xlsxwriter: Upgrade 1.3.0 -> 1.3.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200810144318.17106-1-leon.anavi@konsulko.com>
 <20200810144318.17106-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1980d0e1-fe72-94c7-ef41-d00824a5ae98@windriver.com>
Date: Tue, 11 Aug 2020 10:04:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200810144318.17106-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0065.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Tue, 11 Aug 2020 14:04:33 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1a6a98b-c654-4b90-3651-08d83dff7955
X-MS-TrafficTypeDiagnostic: BYAPR11MB2904:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2904D90773C584AC04BF69779F450@BYAPR11MB2904.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fttmbPuWw/hpegfWptV+YhGVrxVY6bF7GbGcjyTTrG1POVm79IZrh3KFXHQ3okzjDHmxUKD4e1XpYL4QLuz09SHdEyXaqn+1d/7yM2TVoZfH86jDwUX4Nt7AMgW1HRo397LfUtvL7LXAnviimABg01X92fBlIU8hVhV+s4Aqhm+GqrJwl4B9eE1sN8jyP7PzVRfVAp5pdFGFzTjArDApLHUdfW18CBJDDpTTSYqnJx0NVs1oSndIUNg86V5KZStosxMTr9ydL5XFH7/WYS7Fo5OiYNiGTH1bevJRu/M8B3wNzUibSzRpcqszk6NeVEZbCwbEYgjJIPgir5q0WGxCLWdEd89kdS4XSBO+AxKtufQrVg4RToTmSg8w5qjvUbhUkMjvepDN6dw0hnibcyAYq5PguU3e9c9IiZNeTb328A4a3cUDBVZ7PdZdYxVJr1Aicod7EZvC9Xy88ia8sFZI9g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(396003)(39850400004)(366004)(136003)(346002)(966005)(86362001)(8936002)(166002)(8676002)(956004)(16576012)(83380400001)(186003)(66476007)(66946007)(2616005)(16526019)(478600001)(6486002)(31686004)(26005)(66556008)(5660300002)(2906002)(36756003)(31696002)(52116002)(44832011)(33964004)(316002)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	3YHSFtOj8cfCXWQT+yLPxnDYErjojhqB/JmcAZk/oQYba05DKmnPRjrOD1o7MhS+uQ1oLQ4sEA4tSYTjJMnhb6oagvBhj7QKV3ONKhfyWVz9Emyds/ZK28YcY6VD3EPi0iRdT3VZahTpIHOIqTN/stXfFvol/bVJCeYmfCYcXeC/i+CaVYEw4M1Vkmn4LKkdNpWwVSyIW9XGOs2KN1o7A3OicTRG+EZuxXGGonmqELIOeSVtbdkLrud0QqT5ZT0s2nGZqkrPmfxP4K7St4HGSrAbHQoaqAio/WqhQV9+FnKZzkaRUE9wI8RXAvJqmVqKmM4hUCBUrJoip419S8l7Uh+Hf2pTNJaDhksy6wC7XynJ8hzOy839kizbJLW7Z+M+bhDn1vzhTHDMkPRy+HuTlkWNy5gpNSeKGB+ygN2S+ISSGdquO+YRQ/1nwpsY+orCLpbb0Q2bCOT0juvqgH6QRIafUV+qzasOCL5i69KTE6oSaITQm1J1EkwZ7bnSiLi2+zRgUOqGCqGL7kUBJZ/uToyr4Rg2bakRNg8prOg8kK/epvzaLZLYvCEoEN7Mmq6EnYTEKgvixk2G2ucykb55l3Ye7F+0/z9Z/yojKlRbgkjqL3Q4vm96E39+J+3iKzjKdLc4OrIe+1YxnOINBdMz4w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a6a98b-c654-4b90-3651-08d83dff7955
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 14:04:33.7116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2d5XfPPBVmmbp8//oL2Q5608FyCxG1dk+c9BCkzcEHqwE3DFYMA5Lx5TBKfD1LhGx/9uydFkWSnssf3l+fMx2CnHCBG0cYR1pyoVk1Ot5/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2904
Content-Type: multipart/alternative;
 boundary="------------9EB60DF4DC720D3C4918D849"
Content-Language: en-US

--------------9EB60DF4DC720D3C4918D849
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/10/20 10:43 AM, Leon Anavi wrote:
> Upgrade to release 1.3.2:
>
> * Added Border, Fill, Pattern and Gradient formatting to chart
>    data labels and chart custom data labels.
> * Fix for issue where array formulas weren't included in the
>    output file for certain ranges/conditions.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-xlsxwriter_1.3.0.bb => python3-xlsxwriter_1.3.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.0.bb => python3-xlsxwriter_1.3.2.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb
> index 3b4e89d04..76f5d1622 100644
> --- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb
> @@ -8,7 +8,7 @@ inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "XlsxWriter"
>   
> -SRC_URI[md5sum] = "80ac0ccf43435739c4afa5e0bfff8580"
> -SRC_URI[sha256sum] = "3015f707cf237d277cf1b2d7805f409f0387e32bc52f3c76db9f85098980e828"
> +SRC_URI[md5sum] = "78fccd0e056f3c1c474e13eec54ce30d"
> +SRC_URI[sha256sum] = "3ba4655713c8c84b428b529c8e353ac028626ec57f348094da4f66fdc573b0fb"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 

--------------9EB60DF4DC720D3C4918D849
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/10/20 10:43 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200810144318.17106-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.2:

* Added Border, Fill, Pattern and Gradient formatting to chart
  data labels and chart custom data labels.
* Fix for issue where array formulas weren't included in the
  output file for certain ranges/conditions.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200810144318.17106-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-xlsxwriter_1.3.0.bb =&gt; python3-xlsxwriter_1.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.0.bb =&gt; python3-xlsxwriter_1.3.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb
index 3b4e89d04..76f5d1622 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;XlsxWriter&quot;
 
-SRC_URI[md5sum] = &quot;80ac0ccf43435739c4afa5e0bfff8580&quot;
-SRC_URI[sha256sum] = &quot;3015f707cf237d277cf1b2d7805f409f0387e32bc52f3c76db9f85098980e828&quot;
+SRC_URI[md5sum] = &quot;78fccd0e056f3c1c474e13eec54ce30d&quot;
+SRC_URI[sha256sum] = &quot;3ba4655713c8c84b428b529c8e353ac028626ec57f348094da4f66fdc573b0fb&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9EB60DF4DC720D3C4918D849--
