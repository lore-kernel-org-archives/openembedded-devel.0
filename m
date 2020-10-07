Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.62])
 by mx.groups.io with SMTP id smtpd.web10.1387.1602078263895689837
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2020 06:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=W7Ns64PX;
 spf=pass (domain: windriver.com, ip: 40.107.237.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1rTmhrbB+l5t5q3C8FwiI5BXTDeqSkR5OKVTy0vW28NbcvmRA/vFWopEtm5B+EG/a4oJh5BFgnv0ySAYQI/Ex8bYm6NgpD6ONrfQO4Qu0I8GzHz+YacFyhmvV9lit7MNDSpgBHg6RzlXtTDoKtG7vipFbaJe9+NUH07RJOep3smQVQDZ0nKhfOYjS7YALv/2OJGZ9HmFgcR4CEr09nPi3PgwswOEiTQ2f3g7cYmq4dPHqAXJYZ6wF1pPNorT7IFZoLpJuqk+vD9CRXY88NWwg+C51dbP5lW3xaAQha4uuGjX4tHg6FUpT6/gT2nsNNEUXTecvHM/momovBUcHZGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUqCfkBXaXLpS9QRBjIBC//ZBwhBThBtljDsY8ssYqo=;
 b=izxm4P0D2b++2r+cIfyei/yCczD/SWDuIa4w82rrgFPXFK8lVlt5uAFdAaURN75RzOSVGwuO17OghxXBYnxDYa4FWGMZcfZxYUzby0tZETNtwrU55mPdEqkPvQG2aCklWdNh5AnczAFo/m9nyOTTnvMdFRxyQx6ZgkS3B6ayBHR7Mh3Gk3O1GV1G2cT6pyPGfEPOeCHCgBMu3Nccyr4XIXsNkDnSrte9H0/RfKbouIUDrIT4SkS2jdlpWB/zl7PkoSvs/Z8Ma0FnK2ab9ykupNF3fr4I8i0gM5L3vDp/OMA++E4TW6UIVDHIhLVsTTV/HVjdTC/jWX3Vxy554Eti2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUqCfkBXaXLpS9QRBjIBC//ZBwhBThBtljDsY8ssYqo=;
 b=W7Ns64PXRnfCrr8tXfelahLtbL6pNWPY9j/luROB8/gqSlf0Ia/aSwoK5n/Tx+K3YusHwLc64U96nBsmsrIPIe/R2o3gYJrgnFvciM0BM5lXkQcph4jDgBgdCpiRuLpIiwtMQPav3Dl7fPUnD1UQ5tEfG9HwItQbLJo+VzBuLcY=
Authentication-Results: leica-geosystems.com; dkim=none (message not signed)
 header.d=none;leica-geosystems.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2920.namprd11.prod.outlook.com (2603:10b6:a03:82::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Wed, 7 Oct
 2020 13:44:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 13:44:21 +0000
Subject: Re: [oe] [meta-python][PATCH v2] python3-pybind11: extend to native and nativesdk
To: Andrey Zhizhikin <andrey.z@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
References: <20200930142720.15556-1-andrey.zhizhikin@leica-geosystems.com>
 <20200930173139.23303-1-andrey.zhizhikin@leica-geosystems.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1514af12-126e-6b0b-677e-4833588331d2@windriver.com>
Date: Wed, 7 Oct 2020 09:44:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200930173139.23303-1-andrey.zhizhikin@leica-geosystems.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTBPR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTBPR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend Transport; Wed, 7 Oct 2020 13:44:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c9e2c23-28c6-4843-15d6-08d86ac7184f
X-MS-TrafficTypeDiagnostic: BYAPR11MB2920:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29203C337DA22ED91DA1D4889F0A0@BYAPR11MB2920.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1QaVsqYQJHBvClCGwcu3l7Km/i1d02GjpLfbuMjyIQeCFjpMVfYHTfXSJmzSGIV3sgwQ3zO9PihskWgovLTS3S23zHu1CoieG+vVjzh3AmPRGS3tGiwBbQXVy+qMP4M/2flfRuorM/DJlY5Aojyiv9V8ny/S9ojL0v7tcX9ntzUuHZNOyXJsCu1vRjobnFIgoh34GcY0vJdSQR6XTArHvgbFJAvuA8KrLsOdnmwGz/9zmUvIhJMHRMzVdHv5MKoTiREI42hfA1Cc2O3r+U84OMbldevPedT1AVCH8hLDSBiQ7wbNWUBILMgeonVK1uBL/YnDooAO5LvhIJ2BaO7CUm9+mygAOfgglECyFT/1ggu4zL9KJbXGaPauyYkiyvb/quCAOQypt0BZ6mHC9eTRQ4RhEjDJQDhJM4CjmdYkdNFCN+RZFjw8sbgtgKAaGm5kMZXWFNX2FABBBZr14RNY5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39840400004)(366004)(2616005)(26005)(956004)(53546011)(966005)(16526019)(36756003)(186003)(8676002)(16576012)(478600001)(316002)(86362001)(4326008)(66946007)(31696002)(66476007)(2906002)(5660300002)(8936002)(83080400001)(166002)(83380400001)(44832011)(52116002)(6486002)(33964004)(31686004)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	bI7rDwohQPTKohwZg2O4zQ80emyhKDKzvAmxJJW8g/9a/duELElYNvIR0twsR8n+6t9mZxxaN2OaiGZOhUwXHitKswYvhWwz+xRS/6ozvTD6z/DGw2Nhnj396EDn3lB/O2eUMOAbp5onkwjtmHzD15aJf1T3nV+i1X5W6hRt3/SIN6RDAQxtwxrYiW2ZbUPdZBCLcJzQFb5fn0sb5G+ZXsiP+KcyxTHiQske+5RaRwM+faO4+AlRTfqSxDragTyZVHOR2G2Cl9q8CK1Kg5KKiCeL4hPJED3IXazASqYBMXjgNr0QMehyoFyvoVP+gb4rJ+OLJmRvq6IW4Q8uYNqwXAmCaBzGmq7bnASDidR9uF2ZCU8JwTWosbyFs+iH4srtNI8Yypjmgu3sQZA8NreAByBDcUqIski9wwYxhhwiCLSiYFC6HtNpprGFtVWoxZQyRFkipwtig27OFPD1WZKutJQYv/E9gecPe2WFX27sMGiZ7lNIVEQbo3eqbhvN4WHqhwrxSuaP0xnH6atxZRyIQe2qBYAPNWxnt2f7R0Y8POsDjBrSdzODFmFj1KfidAuMmxYlPPhQEul8BdS04Gfz3iKHOK94qVBraOzasEfH8cY0Gz0kgNI9uyQN0nrCaLKNmqyLsbB8HmWGGgtKwhC2QQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9e2c23-28c6-4843-15d6-08d86ac7184f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 13:44:21.6134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/6YBMcneUL8qmcRSjg+3getU6dJhFHnLEJpH+bq3xBxCPeGtT8VNafecJHq+du6H+DZvb1WdO1JgzbgcZRmCD9U4IqG5O+rCjAuzG3xi00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2920
Content-Type: multipart/alternative;
 boundary="------------5CB02F02540138F076EB5941"
Content-Language: en-US

--------------5CB02F02540138F076EB5941
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/30/20 1:31 PM, Andrey Zhizhikin wrote:
> Extend this recipe with native and nativesdk classes to be able to
> provide a package in SDK and run on the build system.
>
> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> index 9674ec093..5d57590a1 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
> @@ -32,3 +32,5 @@ do_install() {
>   	distutils3_do_install
>   	cmake_do_install
>   }
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------5CB02F02540138F076EB5941
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/30/20 1:31 PM, Andrey Zhizhikin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200930173139.23303-1-andrey.zhizhikin@leica-geosystems.com">
      <pre class="moz-quote-pre" wrap="">Extend this recipe with native and nativesdk classes to be able to
provide a package in SDK and run on the build system.

Signed-off-by: Andrey Zhizhikin <a class="moz-txt-link-rfc2396E" href="mailto:andrey.zhizhikin@leica-geosystems.com">&lt;andrey.zhizhikin@leica-geosystems.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200930173139.23303-1-andrey.zhizhikin@leica-geosystems.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
index 9674ec093..5d57590a1 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
@@ -32,3 +32,5 @@ do_install() {
 	distutils3_do_install
 	cmake_do_install
 }
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

--------------5CB02F02540138F076EB5941--
