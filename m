Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.81])
 by mx.groups.io with SMTP id smtpd.web10.14674.1600180013793968437
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=X/PpRUZb;
 spf=pass (domain: windriver.com, ip: 40.107.94.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1SeukWNY2l8NL6HG3zaQ/K0Co+m0p4f9Q8XArhYHYBvjPP5i9MX2LECAvMtf44qDnn8Ijh/S/lJjBMk74AgHA1YC3JM3IruKdGFqXrufgl0ey1rqSeUfQSI5Q3xlBMuE+UjZS1md9un7A6x8lytORrREN2fy3MitpleqkeFK1J+YmLzpMjaw86bwsaQ1iojkD1N8jS2IfUajHIJJFUVV4e9jq3q4WxWd4c73VZNRTVWH8QSdId/LC/9jfjI8Y8ABl3QEnVPYgxQi453tfSsB6BgTSS82KdWg8E2FceHO+kfdzz8VSA8HGN3G2Sygrrt8AHZ/UYVM93KClALli9jrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PO4iqVSPfQKiEeCOfbFe4mogAJ4HLgcxRfzu38xfQog=;
 b=Cbn4mUonHuhJj7wDBzaBMOOIimVCtYZMbIak/tfSJwoYiB8Wv7nAKTe5Bndau8Dc3Cc9qGK7AHpzVTSf1eWbvYMrSPEVwEnUAEr80Uvek+WeDGKcomUF0hSr/HD3s7+RzaxfZbK9+ZSjEXL5iBAA40/UKZC+l5sSeSMnjEdcM9bmCYpa4HTQ+n6UmLG3vLc/M/Sa2UOEf/lBc5ugXFFxKawgHIkrOhQva//xWLZbfdBq9JGMNmbZUDF5QgaKL+bCExPVSauH28cwDGVzn2DjhJygL5/wAp1FQNigtM6jwlOzMoBAD/vU1s/M77hImVfLOTHD81oiqYS+34+nntFCVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PO4iqVSPfQKiEeCOfbFe4mogAJ4HLgcxRfzu38xfQog=;
 b=X/PpRUZbuWp2OTT/YTlLvsYBnj/TQC6KuhNNErvuoGwvY8vjHr5TgoSWjGOU8jLgaQJuS4xP4Xa+cXcboScmSqSDdqYby1+CdFZarL8GdbSWNRJ5z9HmV8HLL+NmEYbr4AYjuh4kyTkLzrwO4G7WDwU6RGulH8AVtYnH2mlkxow=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3767.namprd11.prod.outlook.com (2603:10b6:a03:fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 14:26:52 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:26:52 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-ujson: Upgrade 3.1.0 -> 3.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
 <20200914090419.19171-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <daceb4fd-84b9-4c14-abbc-79a68db37927@windriver.com>
Date: Tue, 15 Sep 2020 10:26:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914090419.19171-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::9) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0130.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Tue, 15 Sep 2020 14:26:51 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b0d12c1-9aa8-4ff8-215d-08d8598363ac
X-MS-TrafficTypeDiagnostic: BYAPR11MB3767:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3767369EF45EFD89BA8AF5FF9F200@BYAPR11MB3767.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s1LgKN4828qt9Xgsga2v1YxkIUb9Rg1PalqY6dG85EjJkAhJGRwxYaWswwlWD9RYPklY4qNmuguly2i+uHLnKtij0R7BSANlnfLLYN1aplosH5Vk5+UGMjpTyIRW8ZWdbUjY25stcHrfP2EnQ95+iIEk+jAY4kVqumQcp4prPP+Fxpgo4HW3SUSzby0ejDUcTa5TYPPX0EMO7W6jHzUsHK71VKH88PlM0RCWg2UyQqQc2XqBzV+j/wEHKh9RE3rYSe6EQd40o6WXgSFDf1vUtG5sAY6hK8Gz1Uji0Ugc4B2R4b12A27328QbuOHc8A1gGsUhdjpvlnQwLR70TD9t03DP/GHQGcckOsnzttY8rzSnGR3hzb7r0MY30JlvF3czXa7rLVzJusa3iLXtWSNd0Mh21NiDu13oO6nYMdKmtV+XSHwscJEkNDRjVl4emX/Ln7IDdzpcpCghyr/PIHP/mA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(2906002)(966005)(66556008)(66476007)(66946007)(478600001)(33964004)(53546011)(26005)(16526019)(186003)(52116002)(44832011)(5660300002)(2616005)(956004)(316002)(16576012)(36756003)(31686004)(83380400001)(166002)(8676002)(8936002)(6486002)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	OmPZudXXKhntQb6P5/Q2M982DTqoPN+W5LXzeRGVNJxqBCSQDB/pPGOgOeVK2G107jwFPAh2uTG0YO6d4HxV6eEfWbNBm3BT3E3avArrYfM6JAZTD2wzwGhft22uTeI5FxlRt07ZNBLDkJPRaD98EzX7f9CmIcAXd9ZzKPtAVvZl6kfnaG/UbN+lHNebSGDlCAkeIVQiuYCcVHwCuFgJIIMBcYYJLlws4jP0/xOo8xoM1yx902fKB6P6F6xBaaRA49+kGhREYBk6I/Rr8O5MzQWmVeP+nzj33gaox1fU+4v2FwvOBA72mXNOkFr9j0v4gPiNDFLIZyYkDkcXTqSMWe1ivG+QMyWrKXblMj60/TnbW30DMNsv9ErzndCf/9DrzVaeRxObTPXIc7H+nFhurl/6SPxvqbnz+UgxaCdaJwr+yvBVVQhKV+94kebM+UgAMySIOvb2s/wMMjivdWPbI6R90mR9TSuTO3XXNsST+Cyy0tDUTKxebqjBXTqUNIUkMNX1gkMfRkWOhAP152RlN1ACR2OepcCdIx3Oh2wnGnmtCDEAw0E6/Mf8M/vYXYELEXs/bzQCzgxOGHyi6qO0crutryUn5LmVwUCChVII0H4MapIcuIt8rGxUFwFSQk/XF7IkJfEflhQuyQ/hjaWCkw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0d12c1-9aa8-4ff8-215d-08d8598363ac
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:26:52.4356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJ7mvXkZ/CZhvssQWG1RyW+5QdvTnf2JYX9V/MEEpn/N19WVT5coNOGiqfwHbeZWno/00kT+Q7sADgdnir58+VUGDDRWNWGpl+7HASnj9NQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3767
Content-Type: multipart/alternative;
 boundary="------------8ED06906A195D029AFBC6974"
Content-Language: en-US

--------------8ED06906A195D029AFBC6974
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 5:04 AM, Leon Anavi wrote:
> Upgrade to release 3.2.0:
>
> - Make PEP 384 compliant
> - Build and deploy aarch64 wheels
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-ujson_3.1.0.bb => python3-ujson_3.2.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ujson_3.1.0.bb => python3-ujson_3.2.0.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ujson_3.1.0.bb b/meta-python/recipes-devtools/python/python3-ujson_3.2.0.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-ujson_3.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-ujson_3.2.0.bb
> index ef57b2a1f..e1d7d9d79 100644
> --- a/meta-python/recipes-devtools/python/python3-ujson_3.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-ujson_3.2.0.bb
> @@ -4,8 +4,8 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
>   
> -SRC_URI[md5sum] = "875ac729018f3cac786d471422306fa8"
> -SRC_URI[sha256sum] = "00bda1de275ed6fe81817902189c75dfd156b4fa29b44dc1f4620775d2f50cf7"
> +SRC_URI[md5sum] = "a524264ef4069e18d742e32e90845a3f"
> +SRC_URI[sha256sum] = "abb1996ba1c1d2faf5b1e38efa97da7f64e5373a31f705b96fe0587f5f778db4"
>   
>   inherit pypi ptest setuptools3
>   
>
> 

--------------8ED06906A195D029AFBC6974
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
    <blockquote type="cite" cite="mid:20200914090419.19171-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.2.0:

- Make PEP 384 compliant
- Build and deploy aarch64 wheels

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914090419.19171-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-ujson_3.1.0.bb =&gt; python3-ujson_3.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_3.1.0.bb =&gt; python3-ujson_3.2.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_3.1.0.bb b/meta-python/recipes-devtools/python/python3-ujson_3.2.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ujson_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_3.2.0.bb
index ef57b2a1f..e1d7d9d79 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_3.2.0.bb
@@ -4,8 +4,8 @@ DESCRIPTION = &quot;UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe">&quot;file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe&quot;</a>
 
-SRC_URI[md5sum] = &quot;875ac729018f3cac786d471422306fa8&quot;
-SRC_URI[sha256sum] = &quot;00bda1de275ed6fe81817902189c75dfd156b4fa29b44dc1f4620775d2f50cf7&quot;
+SRC_URI[md5sum] = &quot;a524264ef4069e18d742e32e90845a3f&quot;
+SRC_URI[sha256sum] = &quot;abb1996ba1c1d2faf5b1e38efa97da7f64e5373a31f705b96fe0587f5f778db4&quot;
 
 inherit pypi ptest setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8ED06906A195D029AFBC6974--
