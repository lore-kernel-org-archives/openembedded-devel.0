Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.70])
 by mx.groups.io with SMTP id smtpd.web12.13053.1597334068333567322
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HR+iLRz3;
 spf=pass (domain: windriver.com, ip: 40.107.93.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0RnliO5S/Gs7aT/PnvtlYMu9VpyydyMGeLX2UtiT0HhyZ7DWRvT5+xZUiuNlGBw9G7O9Lj8xuX0Xe002gHn3bIQde4aUJOddYB2GoJEDRE6K8QR16/TI784sOo70np8rmGo4hu7JKm2hr/3t9Aj3mg6zVkXe7IDfna18TKADXzjtKVx0aatq660u+0jYfmlq4xUGt37CRo3atl2VMP+Bh2qlY7/VDriNeJy0kYuemEQWaqeODTLZi1B+IAaeBGzojj/oMH/6+u9X7hv6HBwcrVTCyt8KCSnsD9jyTrfMIYQIlo5jCRPeOWcMtTTO7niHx+Sgr3pw0gUBqfYYQhSxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OF9M+8hOwLh+5fikpQpG7KzmDIIdkwmegjabpNeBPmA=;
 b=S9lMg76ZMzlnU7EKNPvQpjFijTeaD92o50ujDEeIM3MS/MIUp5Felu57Ob5GajSKhjhTjywUcUfZDq1qloDzNscONEkSwlu78sUfg8aLV72RB37hRskiKGIzZH2C3SNbuPL0YTdxSi1Og2OMcz0q/nHDa91W60vaGP68QeXWr/mmt1zQeojjhsjaMYr6KdsYACy0oeLJVpLoRmb062GJlIhL1AQL9jjyrXDnkDWLiFYOfTkwuMUM2gcoA57hQaLsuRldgn/AzRSVhs4wE+S1I97lhNsxKupXZD0EbXN6w2yEu6/0zFPYjHD5jfq7n/Lxhr3nKZNi8JGXa7lYID39ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OF9M+8hOwLh+5fikpQpG7KzmDIIdkwmegjabpNeBPmA=;
 b=HR+iLRz3S2tkyPZO2ssW1tIZ5ET0PrDCb+foMOQzTWy31GmZcaZPmTP2DyJeZWD9AijAXi9m8l3ERH8itMC+ZqnrnhhpGlxopMaosBL1Nd87rI5H/9fq3k0IrRM0KsbReDZHs4H6g5PtCqezu5ZEwJKtQP75QkKvZwS8jX8uXqQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3814.namprd11.prod.outlook.com (2603:10b6:a03:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 13 Aug
 2020 15:54:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:54:21 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-gast: Upgrade 0.3.3 -> 0.4.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
 <20200811114430.27916-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9b20c2da-568b-dff0-09be-faa7ce89ec80@windriver.com>
Date: Thu, 13 Aug 2020 11:54:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200811114430.27916-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0053.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:54:20 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52ad216b-d578-4bd0-d17e-08d83fa124d0
X-MS-TrafficTypeDiagnostic: BYAPR11MB3814:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3814E7C5B0CF5C3DF3A919749F430@BYAPR11MB3814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U9bM9h6i4IhFvo/2gwtiiwxUKZz9gs+MwemCu2uGLiEMk/N3W16liYP1oaqkFtNhiYnNPvFzQPaFKjgVaAxuZezgnCG/TAQcZiiC3xJdbriaith8l2mxjdvDbIvJIcuDqKkj2QaQKXBoRcfeyUSalaIdPeOLysAtdGIWxIYgQmKpovXz86XHInIg2yQjt6WFXVxev7uvdvTlBFjTnAqrShH1hFXE6VTSEIP21F/TEV78l4jnxAp+dlhgGgjoklOFiEasHnoIoj/axKqc0W4ORXx+NpVnLI9gaxh3KhQ/wRP5L/Cm+Pc9omI31byxla2BM9Ek0X0hDaYwZ7t/FKQ/cKH7FK3LcTfXp8512ANSnNjcWUu2jZOhM5QQGj1PxIAuJ5jkcqbRB9pQm+2DcUGUAMYB9ONzmsCOylASBvIehR0eqB9vJTfLaPEcrAEt6J5UoEyOjXdiXfPZDPP/4bRrWQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(366004)(136003)(346002)(8936002)(16526019)(66946007)(66556008)(966005)(66476007)(2616005)(31686004)(31696002)(44832011)(186003)(956004)(36756003)(166002)(83380400001)(26005)(86362001)(5660300002)(16576012)(53546011)(33964004)(6486002)(52116002)(8676002)(316002)(2906002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	duz1E0IrC3GdXCR/CqhoNr72NtxQFa1A+Tz00vK/J4U1d30J8KQ/H1UdTBdjQTUZgKrSnApi3sDQC+4FJHt8DY396zNlRPvheTmk9SzHArHRMuEwUdKMtmm6yPEJYiAMJ/yqDr17XCrBF3ugitBipyh4uME3l7Uj6IOIzARMsGsYPqAe5nAqSLFKkn1nQE1Ax08rS6T4emjCluOYVw20K4evCuAUSZSVbaivon+MYtb6Vwz+nte5aw5LGJ/C57CArro+DNTHAHNLBXQc75GBcxY9JlKx1qlcPvDVcfPUc2JKs8wyr9XtVOP3SVbTwv+P16AKjq0mk843RSKoKB/8gN0EdS6xYSIyRrAjeXVWm8svyyK85f+XBPCmPHYDZxYLEFoKvM+qFun4TM6OxLHuywQT/LVxUpNz130AtIHdoz6Xle2pnRlo1kx5znkHgAGOfSpj8SJZOywC/XpGI2gV148ULjpKv7KUIBf1Pl3ivZS10OhEP1n4y+0lVAlYrKSGGrs6ssvVeGkLdGzAADgSoDJVLFlrcgEopSS+uy6vxoBBbJHuBaydujqPMBKMRoUfPwoRQiLp+oGUoFwhgCBddVwcIXTQSUYNxXVljYMVk/IRXQs5amkii82PCGE7SGlgL5q2FJQq45eKlJxls0o2gg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ad216b-d578-4bd0-d17e-08d83fa124d0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:54:21.5782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3JsHXMiXvmRzIMm/bnFpNS+NdIn8n0pxSO2x9f7Myzpp/+6/hwQ9jcpKiV3Ofxpk061uJVEbafQmhgzvIqFmRF08VrqV/MvaO+iFSVRTyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3814
Content-Type: multipart/alternative;
 boundary="------------9E2B1C94E14AAC66FFBEBC72"
Content-Language: en-US

--------------9E2B1C94E14AAC66FFBEBC72
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/11/20 7:44 AM, Leon Anavi wrote:
> Upgrade to release 0.4.0 to support Python 3.9.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-gast_0.3.3.bb => python3-gast_0.4.0.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-gast_0.3.3.bb => python3-gast_0.4.0.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-gast_0.3.3.bb b/meta-python/recipes-devtools/python/python3-gast_0.4.0.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-gast_0.3.3.bb
> rename to meta-python/recipes-devtools/python/python3-gast_0.4.0.bb
> index 9d24ddc3e..7ef2eb468 100644
> --- a/meta-python/recipes-devtools/python/python3-gast_0.3.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-gast_0.4.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90"
>   
> -SRC_URI[md5sum] = "213b1820f576db14ed4fdf57efbfa67f"
> -SRC_URI[sha256sum] = "b881ef288a49aa81440d2c5eb8aeefd4c2bb8993d5f50edae7413a85bfdb3b57"
> +SRC_URI[md5sum] = "d1f258eb70bb916f8fe5535351d5ff05"
> +SRC_URI[sha256sum] = "40feb7b8b8434785585ab224d1568b857edb18297e5a3047f1ba012bc83b42c1"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------9E2B1C94E14AAC66FFBEBC72
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/11/20 7:44 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200811114430.27916-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.4.0 to support Python 3.9.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200811114430.27916-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-gast_0.3.3.bb =&gt; python3-gast_0.4.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gast_0.3.3.bb =&gt; python3-gast_0.4.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-gast_0.3.3.bb b/meta-python/recipes-devtools/python/python3-gast_0.4.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-gast_0.3.3.bb
rename to meta-python/recipes-devtools/python/python3-gast_0.4.0.bb
index 9d24ddc3e..7ef2eb468 100644
--- a/meta-python/recipes-devtools/python/python3-gast_0.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-gast_0.4.0.bb
@@ -4,8 +4,8 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90">&quot;file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90&quot;</a>
 
-SRC_URI[md5sum] = &quot;213b1820f576db14ed4fdf57efbfa67f&quot;
-SRC_URI[sha256sum] = &quot;b881ef288a49aa81440d2c5eb8aeefd4c2bb8993d5f50edae7413a85bfdb3b57&quot;
+SRC_URI[md5sum] = &quot;d1f258eb70bb916f8fe5535351d5ff05&quot;
+SRC_URI[sha256sum] = &quot;40feb7b8b8434785585ab224d1568b857edb18297e5a3047f1ba012bc83b42c1&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9E2B1C94E14AAC66FFBEBC72--
