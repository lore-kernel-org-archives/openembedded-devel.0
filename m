Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.80])
 by mx.groups.io with SMTP id smtpd.web12.5679.1596718795032832511
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 05:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=beoP7neW;
 spf=pass (domain: windriver.com, ip: 40.107.93.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEDbpjhYWID7zzricSa24LY7JRpMHgAxSBwhmlR+aRnzg40xXUtt4h0jfanwb0pJD8/1fhREwSTGVzePU685PtpObbeFHzMQTYDgepdcPh2wwH8klbZ01qFxxoDtdK7JSeEZpnuB/y8KNRRWUTtqqjkWQtgeD4sR4tRYxXKxIn0wRBZzM7XgqRWCwEglYvf3yudZylrZ/eSnVn/2ytDZEmEy1uflphg0LV3nxsC0CdqR4I4YfIXKj/Fp5dIChFk+ccV+IWGKQNsYc14/5Fx09meORsYA2yoxQYyI5tbALfSbIqFQCneM1qMRhCMML7Hh7n8A9rTdIj1rB5dRNPLj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxpVCkVMlDTbOdtgLbBVo2VU87masjhRqb9c855pAnY=;
 b=B4JxI2qTx3+MRBaE6ZeGTGUUDnJuTujYVA/FZrrKsM21PVLiAlJncGte3D0ROP8I7byZxcwGA/bhSD328RFZxpfeMxCtsbXUl8sc8p6amN1Lt+ZyzcGY3jCDfW+4g0pBNYJdHPVuUAxRtM8xYVHbPr1O+pzkzplh0LrF/oQaWiT+E5d3h0P2NDna7QZUpOXByTTZN0VNtF+Z5TnL66M9Wi7rbQsnB5l5CANCMpVvKANzhFq9AjpxwcmpY3fza5VBcySTuzNfbkrkryMz6z7bcUUiqPpoCHGm8pPQMkqMpZoLvhoJyETzn/R6meGsS9EFWjdDPP6bzPxGIl7PUFzYFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxpVCkVMlDTbOdtgLbBVo2VU87masjhRqb9c855pAnY=;
 b=beoP7neWpqkJgvkzy0JXYTUBQXk/oAFhUjge75lcaIjwYis41B0bwSmK1XFOZI+jsmMKIOAs1HPvNdVA4foUFCm2O2rkZfKQSd/m2mRzdL9hxOw7aH/OHkAzlpYesq19FxmQOp2U2Kv/FeLtyLpPs5CAlwN70uwO9cusFnYt6+Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 12:59:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.016; Thu, 6 Aug 2020
 12:59:53 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-asn1crypto: Upgrade 1.3.0 -> 1.4.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200803095759.9591-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ccc84b71-86c8-6f03-a44e-83e38397890a@windriver.com>
Date: Thu, 6 Aug 2020 08:59:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200803095759.9591-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend Transport; Thu, 6 Aug 2020 12:59:53 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e89bceb4-3ec3-4110-2604-08d83a089c94
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43058AE215588CC417DD88C49F480@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TXSeFB3EjsziU4hqe5OJIcT1Y0prEATNl6y5Uh04NOE/eu2tN3uWPq9VZSvzpGMkBg6OVRtvkQy/xrEo4GvMAttFx0pvMjjWK2i6QGIxsCjMDREfLEG9Gs8hhym2kLKu1qR2j4H69PSBr6tzngN0CXeo6C777iN6+D/w9nXczh14rAgG+I4KT9nwViWWG96/KZ+5UguoSsmoW9pY/xhHIfb3irJJyndxx7KWsBU/7TfFkF1Lx38tKEOUEuSKYlb4qOimINTd/VQtX+/KFnYs4aiturcnGFdz4zBTbfw4vcv0ZT96WdgNg49LwDTzD88XtInVm3t71Hg99WlxF7PFWH+lRz1KRSnETxSK9ZwzVfR0gExzO8MXB5Tt1HvbIPwJWYENLB93TmLcd6m2J+PX016E/dRUZd1MGQTCIWNH2KK3qM/Eub7v/JGvis/g1y9NSE3I75OqXOa4Y/A9hN40dw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(346002)(366004)(396003)(136003)(2616005)(44832011)(26005)(86362001)(186003)(16526019)(31686004)(956004)(5660300002)(16576012)(316002)(478600001)(966005)(52116002)(2906002)(6486002)(166002)(8676002)(8936002)(36756003)(66556008)(66476007)(66946007)(31696002)(33964004)(53546011)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	juB7HeTkCJEP1R0zXlzTqa4480lxnLMqSDWRxFI5RO/X+TrfKW3NvnvM2WAJcVZQtcRtx+BNfEkCMDNTlTiRuK0WhKP8hW7WMWvyQmjx6f0CqnfltxqA6fU/AAuWE7zEw1gg38lx47ePvkHAnTm255J3UYA9BYm3SzizKWZNoh/UcO0n7JuZk9XxvlzdE4cPZc4ubLNV2fMma3ITqjFgETLYDPKQ0Yosf/fFwBWdreIvLyxgUMOgzy1aKi/Q/i/vwbF3il3fuGunozZNhq1Uknf6ifAZFHQAisKuBxaEuURaw3ZXcVIEd6AcebRO62YobD6wBM4N9WGMRztDowDs+yHftkZYXrRTzlg2f0ugxx9sLnZf1endiTGlds3qBlNwiOfeAWdJPzmlKVxkIn/ZcD7EERWzRi+bmeMjvyLFL/nFt7DzQ4un8WUm/6tM1mKnncgDZG3BxDQJ7JqxClTqpJDPoSgip2iqQsByJW6O0SW0e0EK0NHqsNX4yCWmBzegtWQH5vm9occpLyeCVgQJ8RsjL/Aea/Y8LKGC2XMX/DMiym9eDDtzB+Zh25K990FwljPISPYqYqtgP45hmNvSzz5LQFf/xMBDErIqJHn7DGNCpPWzz+Rp4xwssXt9xaiR9X0kKSOUbjXBWuGl1g37fw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e89bceb4-3ec3-4110-2604-08d83a089c94
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 12:59:53.6467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8OONMXGsUdHCMtVynWtiF1Hiiftxg1r7vPPGfjImsC5vRY166Qk8xN4YKoSqV6cuMgh9kWtq8MlVAP9EDbCmxxSh784cQzz+uxkxukVtf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: multipart/alternative;
 boundary="------------389442A642802CFFFCFE8C6F"
Content-Language: en-US

--------------389442A642802CFFFCFE8C6F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/3/20 5:57 AM, Leon Anavi wrote:
> Upgrade to release 1.4.0:
>
> - core.ObjectIdentifier and all derived classes now obey X.660 §7.6
>    and thus restrict the first arc to 0 to 2, and the second arc to
>    less than 40 if the first arc is 0 or 1. This also fixes parsing
>    of OIDs where the first arc is 2 and the second arc is greater
>    than 39.
> - Fixed keys.PublicKeyInfo.bit_size to return an int rather than a
>    float on Python 3 when working with elliptic curve keys
> - Fixed the asn1crypto-tests sdist on PyPi to work properly to
>    generate a .whl
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-asn1crypto_1.3.0.bb => python3-asn1crypto_1.4.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-asn1crypto_1.3.0.bb => python3-asn1crypto_1.4.0.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
> index 0d38da989..bb1271e33 100644
> --- a/meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7439e38f5e04ff62fae436184786b7ca"
>   
>   PYPI_PACKAGE = "asn1crypto"
>   
> -SRC_URI[md5sum] = "daad112940181917e3ff169b47b9bd9a"
> -SRC_URI[sha256sum] = "5a215cb8dc12f892244e3a113fe05397ee23c5c4ca7a69cd6e69811755efc42d"
> +SRC_URI[md5sum] = "00bf5b72d37778e62cc73b1d8909ae27"
> +SRC_URI[sha256sum] = "f4f6e119474e58e04a2b1af817eb585b4fd72bdd89b998624712b5c99be7641c"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------389442A642802CFFFCFE8C6F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/3/20 5:57 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200803095759.9591-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.4.0:

- core.ObjectIdentifier and all derived classes now obey X.660 §7.6
  and thus restrict the first arc to 0 to 2, and the second arc to
  less than 40 if the first arc is 0 or 1. This also fixes parsing
  of OIDs where the first arc is 2 and the second arc is greater
  than 39.
- Fixed keys.PublicKeyInfo.bit_size to return an int rather than a
  float on Python 3 when working with elliptic curve keys
- Fixed the asn1crypto-tests sdist on PyPi to work properly to
  generate a .whl

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200803095759.9591-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-asn1crypto_1.3.0.bb =&gt; python3-asn1crypto_1.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-asn1crypto_1.3.0.bb =&gt; python3-asn1crypto_1.4.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
index 0d38da989..bb1271e33 100644
--- a/meta-python/recipes-devtools/python/python3-asn1crypto_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7439e38f5e04ff62fae436184786b7ca">&quot;file://LICENSE;md5=7439e38f5e04ff62fae436184786b7ca&quot;</a>
 
 PYPI_PACKAGE = &quot;asn1crypto&quot;
 
-SRC_URI[md5sum] = &quot;daad112940181917e3ff169b47b9bd9a&quot;
-SRC_URI[sha256sum] = &quot;5a215cb8dc12f892244e3a113fe05397ee23c5c4ca7a69cd6e69811755efc42d&quot;
+SRC_URI[md5sum] = &quot;00bf5b72d37778e62cc73b1d8909ae27&quot;
+SRC_URI[sha256sum] = &quot;f4f6e119474e58e04a2b1af817eb585b4fd72bdd89b998624712b5c99be7641c&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------389442A642802CFFFCFE8C6F--
