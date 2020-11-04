Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.48])
 by mx.groups.io with SMTP id smtpd.web09.13892.1604501255837965973
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GO+WMiGm;
 spf=pass (domain: windriver.com, ip: 40.107.92.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuir+KxJCelwRYiKF0H7Et/6Gr3Ik4lauOSzgevQp9BZmlrMKVPU5AezAAHhuiXp9YuvJaEO9i0Y8k8pTIHrzFwd0a32OcXiqBGuX37/nD1uSx0adMRRinnHnScajcnRe35Ttt8KA5DAE0mDlh477IbeFuzHgFomKHEINwBjv/Nbfcsqkw4nq3wPVCHp6tFPO17SK6hAs82HMX3nOhY5sKjQfGxr5t6kSZQzzyqIDiz5m5s4z5mEd3D2Tc9h4iTH8bLZgP5+9MfgRw5pD+K6pg/ApizK6XxkT7p9gBG/0SGruU/UorRAcR09PS9A888ZjZWrodyxi79zAJpDSOpKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xHWk3l4Ppqf5S4VsY5/QPJSKb0budBVsCoqG4DVmyk=;
 b=Fnh2scZks3PSPZxqyrA5vAx/tMRk2GDjd3hGG1SvfbavzTTT/NkXkVBseLw49CAdjQMU0McAvFeH/o2nX5CV2I/5g3iaFbE/WKzz4UmAW3946AVyjno1LCLS/YCNuuxFLPvd0UVRTx1H9eIRDTajXW/34pVRowRvycZtpkdxGebFZS2b6dNIMzJTRQQKK1us6igbula6ViiObKFYqCQ31z/m0YM6szDTUis7raAu4aKI6IgvLLtL6BByKxN1HZQ6aBvR6OiXyK9AGAZiDaLxi6dhJ5moHJAuVULTIUX08YWaK9+rB8ZUnnmyfBUBqDIiksI3a6grxR+TmKbDaDizhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xHWk3l4Ppqf5S4VsY5/QPJSKb0budBVsCoqG4DVmyk=;
 b=GO+WMiGmbbvVe6cSKeQj3hLU2auuK/rR0JVURLSQYRUKWZiKjgkrFhZPVFBvv4SOZlBDew5pVNYTKdXbtAwxPAPUAu6uGJKm6WwgPXhK8ljtRsj/hLSLwUlG0DXfykcRhcbKV7j6q0s2b0ugbWXYxe92AYgNmIwhaIvO8mWVCts=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:47:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:47:33 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-dateparser: Upgrade 0.7.6 -> 1.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201030130840.9169-1-leon.anavi@konsulko.com>
 <20201030130840.9169-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <791f50b6-5836-ef4e-21f0-592b0e08781a@windriver.com>
Date: Wed, 4 Nov 2020 09:47:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201030130840.9169-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR20CA0013.namprd20.prod.outlook.com (2603:10b6:a03:1f4::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 4 Nov 2020 14:47:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6ad9e64-7905-434e-bc79-08d880d09045
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5085B9218551A47525F5D0929FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gsLGz+Kt8c5IeRYeNt4eOfEmuw5PqnOOVS/bk+oXsw3keQhhIz2aEPXXG7gg9x+OyCZG+dzM/0BKF6sZ+zBh/hEV8F8zMwUpKWfpScgl/DwzWCkV/AqIpq0Xw3cETChIwwrUb2FEceTJVwMQrkN46DK4b07MXk7e06G15JnewPvfSzQ/EmkB+19geX2Sih/lr+4JXflFyi/vsFzhvjhYs9xZ7VJu+tlb5wbwxkPa3uLruNrNSeTooqUW5HxT2pTWvNRa5yE0zdsFXqWDkbTJiw2kSDvIRo1C477Pnn6Go8obSMIgdfIPFVAFtRAXPlEzAcDe5/XqBR0V0PcEYXxO+2oidaiyq7XdYuXjX5GcnHkOYfYWfBVlyH+jXQF9VzBa32l1mzNnVULoNgd8KYqy7h87+T33eXhKSj8bPSywhzRrTuuFHAwHP/TxEkwevGlSDtkS7OINP1PWaCyB58QbtA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1dvAzWYXQfgwLq2LFkq2Uhj4h1VvmpGKOtjJHeA5fD0pCbdf7ZTSgvqCB5JOwIQFazvuRuhfEdJawHr1rmwRtouuih4LEFEl0XXNIvxEndEcKb2qa9+92Jl+lbUvRfTRpG2r1yPf9fQMkM7L4N67OME4ahHVsprIbyp/hsP3DygMhw12lf3NnPXT0201bPLpjLkB6KHhliAxn7yoxbP+Cp3xNzm059/TXZptOedYLhAf5lTLfCjrY9DMadt3qzbfZiIBFVYDu6s/2mIy1bBiZ2qWxquvhRheByjtJFUHMzchhu1Ntn+fZpmqKplljRCSmcfpmiygMWTNkrLxfnkJR7it5IRh5BXSm5MyY2ZafsTnqNOKFZLEwJ7zqtcztD8F4yKpYTfbTQvsCbfi3Iw8npl5WZzqmrHdDeWP+iDQbkYIDd/xuan/rg4GtHI5XhuT2yHw9avVqJjQJb9UWTp1AaFlShD3Qz0t+kDjfkIKgG87oxLGldUvfyfJy5WJ4c49N5gJvezVzp2oH2wYdTE5dCokfbuvIxJcfBgcsElMDYHcom6N6eA7WU4Gv0BNAXOXcNMPKPXCyq/G3KmHcp8w1K3ElVrjh9Ijw5bMUsH8ixlwIS+UydJCgolGwoDLgKQb4uaG4Hdf8aV9MY71RUC+sQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ad9e64-7905-434e-bc79-08d880d09045
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:47:33.8125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSm7vtj+wbIqnC8pVpQsg0itcujJNzDWaQe0wsGWn12QKaMBLaB5Dcex648bAHlXUVhJtirsbZOJEmvc3q4feSCjn+8ZsbYcvOkau4og5YM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------D47A9547D68458593BFEB1CD"
Content-Language: en-US

--------------D47A9547D68458593BFEB1CD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/30/20 9:08 AM, Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.0.0:
>
> - Drop support for Python 2.7 and pypy
> - Now DateDataParser.get_date_data() returns a DateData object
>    instead of a dict
> - From now wrong settings are not silenced and raise
>    SettingValidationError
> - Now dateparser.parse() is deterministic and doesn't try previous
>    locales. Also, DateDataParser.get_date_data() doesn't try the
>    previous locales by default
> - Remove the 'base-formats' parser
> - Extract the 'no-spaces-time' parser from the 'absolute-time'
>    parser and make it an optional parser
> - Remove numeral_translation_data
> - Remove the undocumented SKIP_TOKENS_PARSER and FUZZY settings
> - Remove support for using strings in date_formats
> - The undocumented ExactLanguageSearch class has been moved to the
>    private scope and some internal methods have changed
> - Changes in dateparser.utils: normalize_unicode() doesn't accept
>    bytes as input and convert_to_unicode has been deprecated
> - Add Python 3.9 support
> - Detect hours separated with a period/dot
> - Add support for "decade"
> - Add support for the hijri calendar in Python ≥ 3.6
> - New logo!
> - Improve the README and docs
> - Fix the "calendars" extra
> - Fix leap years when PREFER_DATES_FROM is set
> - Fix STRICT_PARSING setting in no-spaces-time parser
> - Consider RETURN_AS_TIME_PERIOD setting for relative-time parser
> - Parse the 24hr time format with meridian info
> - Other small improvements
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-dateparser_0.7.6.bb => python3-dateparser_1.0.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-dateparser_0.7.6.bb => python3-dateparser_1.0.0.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.0.0.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb
> rename to meta-python/recipes-devtools/python/python3-dateparser_1.0.0.bb
> index e4683911e2..e3691dd83a 100644
> --- a/meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-dateparser_1.0.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
>
> -SRC_URI[md5sum] = "78b4bf317f9b844631562abad5ce040b"
> -SRC_URI[sha256sum] = "e875efd8c57c85c2d02b238239878db59ff1971f5a823457fcc69e493bf6ebfa"
> +SRC_URI[md5sum] = "24a06a429597239004d47e6b93991aaf"
> +SRC_URI[sha256sum] = "159cc4e01a593706a15cd4e269a0b3345edf3aef8bf9278a57dac8adf5bf1e4a"
>
>   PYPI_PACKAGE = "dateparser"
>
> --
> 2.17.1
>
>
> 
>

--------------D47A9547D68458593BFEB1CD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/30/20 9:08 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201030130840.9169-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.0.0:

- Drop support for Python 2.7 and pypy
- Now DateDataParser.get_date_data() returns a DateData object
  instead of a dict
- From now wrong settings are not silenced and raise
  SettingValidationError
- Now dateparser.parse() is deterministic and doesn't try previous
  locales. Also, DateDataParser.get_date_data() doesn't try the
  previous locales by default
- Remove the 'base-formats' parser
- Extract the 'no-spaces-time' parser from the 'absolute-time'
  parser and make it an optional parser
- Remove numeral_translation_data
- Remove the undocumented SKIP_TOKENS_PARSER and FUZZY settings
- Remove support for using strings in date_formats
- The undocumented ExactLanguageSearch class has been moved to the
  private scope and some internal methods have changed
- Changes in dateparser.utils: normalize_unicode() doesn't accept
  bytes as input and convert_to_unicode has been deprecated
- Add Python 3.9 support
- Detect hours separated with a period/dot
- Add support for &quot;decade&quot;
- Add support for the hijri calendar in Python ≥ 3.6
- New logo!
- Improve the README and docs
- Fix the &quot;calendars&quot; extra
- Fix leap years when PREFER_DATES_FROM is set
- Fix STRICT_PARSING setting in no-spaces-time parser
- Consider RETURN_AS_TIME_PERIOD setting for relative-time parser
- Parse the 24hr time format with meridian info
- Other small improvements

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201030130840.9169-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-dateparser_0.7.6.bb =&gt; python3-dateparser_1.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_0.7.6.bb =&gt; python3-dateparser_1.0.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.0.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.0.0.bb
index e4683911e2..e3691dd83a 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.0.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/scrapinghub/dateparser">&quot;https://github.com/scrapinghub/dateparser&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051">&quot;file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051&quot;</a>

-SRC_URI[md5sum] = &quot;78b4bf317f9b844631562abad5ce040b&quot;
-SRC_URI[sha256sum] = &quot;e875efd8c57c85c2d02b238239878db59ff1971f5a823457fcc69e493bf6ebfa&quot;
+SRC_URI[md5sum] = &quot;24a06a429597239004d47e6b93991aaf&quot;
+SRC_URI[sha256sum] = &quot;159cc4e01a593706a15cd4e269a0b3345edf3aef8bf9278a57dac8adf5bf1e4a&quot;

 PYPI_PACKAGE = &quot;dateparser&quot;

--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------D47A9547D68458593BFEB1CD--
