Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.48])
 by mx.groups.io with SMTP id smtpd.web08.11515.1610468165983343376
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:16:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DImTfBmc;
 spf=pass (domain: windriver.com, ip: 40.107.220.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esvkt7PXwmUr/GH8qtdQjofaFOECgnhBVM8PH4iLx1jidwWRTGlDgyiv4tqUK2fRsx5hl8bvR2YMulOf4s3r8Z4ncls+hMiiar9SsHRcj2tdpBOkkIA7Oz3MCVyzAhdWNwPlY43rOgf6RqnKMaFmADH716lp3S7R7Og7r2w1V4w+/IW2IgEj6XZoEHyJhRBO14bhIGH2x18teb6TbP+P/jpr/595005v6Qw+vK0sYQnCeOluY396y2MP7l6dBuWR/WpunUnq9ozEzenbEnwH7sAnAAOCNzC6n4KkH8DP9I/CKVtQIltdPDWyWhpjnZMKZDH4pXLMS7XhAsQ9Skzg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6kpo31/3A4UA4Un5IbSnUZv7cuzPsbtqgWzhOjnmas=;
 b=kNkGJ6JSu56/2kxFZyyzVgyVvA1TmRVQL3fWaLw8HdD2529e0hVOtJrTGU8cKMuxCUjtMyUI3kmUnEDbx8NCzaCBBh2oJCUD5y1NPIQ/+aTgp7f7izZ+uVczeHpy6T3k2bb8CplfFy94USHGEjyWluDE8xRgB0Wqdw8y1dgjtqgd6f2p2WfxhwQbbkWrPCKwITTSA7oXH9c5gwDtxv+xI3t5bdr9cvcWdLCLGJTvfxiSW1mpYsyhIh2aIHpG0+9vMY80dO+jpQFCyltCu/y01SVT2rn0172oyx1A5rCA/Qc7dZ5Vi48tVmp+l0Q7pDcKZNj7b79lZO3Xi2vyfuz1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6kpo31/3A4UA4Un5IbSnUZv7cuzPsbtqgWzhOjnmas=;
 b=DImTfBmc+b65Ces1N4vZgNKjtdF9C/19z1D+6iAIXlsJgfvB/tNg4ISraAJow21BtxsbTk2YWCXg1gUOGuIUW+CZLWU6O4xqXOqpHfgfFu3GmquW6n4/9kFOfSkbgpqApuiixFz3msYSKyteqosudTwH37t2Ry70wDBhbfScWLg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3719.namprd11.prod.outlook.com (2603:10b6:a03:fa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.10; Tue, 12 Jan
 2021 16:16:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 16:16:05 +0000
Subject: Re: [oe] [meta-python][PATCH 10/10] python3-mock: Upgrade 4.0.2 -> 4.0.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
 <20210111152512.23506-10-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <303e41ff-cc7a-ab7c-346c-77ddd30b11e6@windriver.com>
Date: Tue, 12 Jan 2021 11:16:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210111152512.23506-10-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:c0::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:c0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Tue, 12 Jan 2021 16:16:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e734056e-d344-47cf-d757-08d8b7155cb3
X-MS-TrafficTypeDiagnostic: BYAPR11MB3719:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3719B3AD27DA399155EF649E9FAA0@BYAPR11MB3719.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S3nb88zknP20dsplzPtGCqMt17z/ixUX2ahyL6+wyFTrRHlCRpIoiSJPXp262wbaxnUnh+MGtOBq/mRp9uC1YDSgMnb0cOmUvWSa8pWZa/UVOtA5s7OdduHc6YK83IWQiQr0znF12Rne1LIbTPPKFE5v8T+sWHtUNo7o+r5cxKCoIu4wN40QRrVwGGWyRSinX+c+ywIrN/V6dRFjh8Ahl1T2a59mPz9X/3IyWbNdIAqaxvtXpi+dGBgtbn0zBZYnKPkCHSJfznODe1n4rOfhEx/K2NmAmkzFuruHghzD/4OD+q2hlgNX34C/vv6jeWukJvp/Y0WxyEwywM20GdlN11zvqsUIqwrYaL9ePi4Zvzi1d8bhkdUNFKB2jjPTwvEGYuo9p28d/yamrbBl3NLO32i5dJRQK//IfQgnlORXk4E5ifiB+vNy5nULS5Pw2QHns8NSzPbViad987ZgeBvJkyxrTRQEis3gpIzOWEogun3pQfj4S8+bUcmWsSNqmrI1rY+lbWcExbBNQ/YdHXGgCxp4YtmAANVg7dEbQfNtBXgBdFLoON26ehJ6KJn13iLI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(396003)(346002)(376002)(31696002)(26005)(2906002)(316002)(8676002)(6486002)(66476007)(16576012)(83380400001)(52116002)(44832011)(966005)(478600001)(53546011)(166002)(8936002)(36756003)(86362001)(16526019)(33964004)(66946007)(5660300002)(31686004)(186003)(2616005)(66556008)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cWxKZTlJK1J2OTlJVEZ5ZXEwbGVpUERmZmFvQVhUcjNBa2R3Q3NxVXhBTGdj?=
 =?utf-8?B?K1RVT0w0SHhkdEV5aUE0Qi9FUGJoYlZtN3FaSU5FRjhldE5DOHMxeWFvZHZX?=
 =?utf-8?B?WW4rV3ZyNVhyWU5NWVphWTNMdTAxeXQ2MzlCekVuSkpCZEtwems4cGRTdndw?=
 =?utf-8?B?emkzU0tlQmEreHZ0ZjdwUGh6eVVaOXliTW5FODFZNkIwejV6ZTVSeU15WkRI?=
 =?utf-8?B?b0I4RkpYYUkybHQ4bUxvZGZacm1IODFvckZkaXVzSVJqQm55MWt0dnFqTEYr?=
 =?utf-8?B?cGMzL1FVWGlYT3Yrb3I4UmRJTVVNdm5Zc0h3RzBJRnBNWS83VGtWV0kvQm9X?=
 =?utf-8?B?NmJRYTZsMlBhRGYzcTZJamRuRGtnb1lJWndFY1g0NngzR2xtbEpBTDFXSENp?=
 =?utf-8?B?ZzczVXl4WE4zUmhHV2tRMkg2UHZVenJZcllPMVVBd01KcWFPazFWVzFIOHJG?=
 =?utf-8?B?aHlsT294cis4RlRTbEJJbmtNQjI4bmFsM0I4ZVVpejhxZUtNN1lwQTNJVzZr?=
 =?utf-8?B?TzRkd3hLZ3RQOTlvWkw2M3gwbDRseUlnYmZTMlFVaG5oNW9DSDhzaFdNd0tB?=
 =?utf-8?B?QVI5QjkwUktaVHp2b2ROUGVFdkkzUU90QktWQXBmWFc1czl6SG5oQmFmbHdy?=
 =?utf-8?B?WVA5ODcrWUZOVmZuK3RxNzVwei9Demh4ZnlGL0VLcHh6L1BhL2JxN2hqVmdT?=
 =?utf-8?B?eU5FV0pXczM2VUNIYjhraWhYcXpUR3U2a2JjTm9aZ242aDBqNEFnUVZNWEUy?=
 =?utf-8?B?dElvcHdwR29nNU9kYlEvQkM2UjUvTFM1TkY3UEhudDdrcWppcXpyajk3cUpo?=
 =?utf-8?B?YktEZlUzbFYyMCtNNDdQcXRlUnhRdU8vaUpReThpL0sxZW5MK0NBOFRLdWhH?=
 =?utf-8?B?cENMWEpQT0dmbG8xMTVOU2l0MWlkSlVkNk1CU1JBWTJTOUg2eVhTTnJwMVEr?=
 =?utf-8?B?c08zVjB6RTFFZkpNRXdtYzBna2x6THhFZHhNdXlDdzB2WDkxekpMNS9CSXlx?=
 =?utf-8?B?TXd5Z3dVSUZJNlpCekkwMitUZjhUb1lKb29mWnFKNkNWWitKNGdZVEZGcVZH?=
 =?utf-8?B?eVdVa21ZNGhHTitnMmpsc2VKUzE0TUxTNEFKTlV3ZkFZMjAwSzlxaWdxbVph?=
 =?utf-8?B?YWVadHcxdWpkdmkzMlA2ck5kTVovb293aGlkZUZBWSs1aVI2L1VJa2tsR2dV?=
 =?utf-8?B?cWUrc01MV2pCSGVqWm5vaVRsTmRQRmkzb1pHOHVscU9XTnRiQjNKdzl2SDMz?=
 =?utf-8?B?RXdDYnhYQ2wweS9ycTNySk4zeVZwR24yWWZCdUtuWE9rR0tPRWh6VHgreUJD?=
 =?utf-8?Q?RwyEEaC2m29jbYv1aF9Vj0kPLhwA4ZsyDU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:16:04.9162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: e734056e-d344-47cf-d757-08d8b7155cb3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0Dn9ckikzuJKXLo3OObodhVAKsAHn1tW3X2nsFTXllmhO2OjUuWgq+esFLAkPDx3KMblFGADj7vnHjShqvIrgI5Mi0P0YwvCPndW79spow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3719
Content-Type: multipart/alternative;
 boundary="------------1310A7516FCA9B9B20B4881E"
Content-Language: en-US

--------------1310A7516FCA9B9B20B4881E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-01-11 10:25 a.m., Leon Anavi wrote:
> Upgrade to release 4.0.3:
>
> - Remove unexpected call of __bool__ when passing a spec_arg
>    argument to a Mock.
> - Revert bpo-25597. unittest.mock.MagicMock with wraps’ set uses
>    default return values for magic methods.
> - Mock objects which are not unsafe will now raise an
>    AttributeError if an attribute with the prefix asert, aseert, or
>    assrt is accessed, in addition to this already happening for the
>    prefixes assert or assret.
> - Fixed reverting multiple patches in unittest.mock. Patcher’s
>    __exit__() is now never called if its __enter__() is failed.
>    Returning true from __exit__() silences now the exception.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-mock_4.0.2.bb => python3-mock_4.0.3.bb}    | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-mock_4.0.2.bb => python3-mock_4.0.3.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb b/meta-python/recipes-devtools/python/python3-mock_4.0.3.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-mock_4.0.3.bb
> index 39ab6d01f..b34f25b93 100644
> --- a/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-mock_4.0.3.bb
> @@ -13,5 +13,4 @@ RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
>               ${PYTHON_PN}-pep8 \
>               ${PYTHON_PN}-pyflakes"
>   
> -SRC_URI[md5sum] = "6466619b89c2969dc57722ad73f85676"
> -SRC_URI[sha256sum] = "dd33eb70232b6118298d516bbcecd26704689c386594f0f3c4f13867b2c56f72"
> +SRC_URI[sha256sum] = "7d3fbbde18228f4ff2f1f119a45cdffa458b4c0dee32eb4d2bb2f82554bac7bc"
>
> 
>

--------------1310A7516FCA9B9B20B4881E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-11 10:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210111152512.23506-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.0.3:

- Remove unexpected call of __bool__ when passing a spec_arg
  argument to a Mock.
- Revert bpo-25597. unittest.mock.MagicMock with wraps’ set uses
  default return values for magic methods.
- Mock objects which are not unsafe will now raise an
  AttributeError if an attribute with the prefix asert, aseert, or
  assrt is accessed, in addition to this already happening for the
  prefixes assert or assret.
- Fixed reverting multiple patches in unittest.mock. Patcher’s
  __exit__() is now never called if its __enter__() is failed.
  Returning true from __exit__() silences now the exception.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210111152512.23506-10-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-mock_4.0.2.bb =&gt; python3-mock_4.0.3.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mock_4.0.2.bb =&gt; python3-mock_4.0.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb b/meta-python/recipes-devtools/python/python3-mock_4.0.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-mock_4.0.3.bb
index 39ab6d01f..b34f25b93 100644
--- a/meta-python/recipes-devtools/python/python3-mock_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_4.0.3.bb
@@ -13,5 +13,4 @@ RDEPENDS_${PN} += &quot;${PYTHON_PN}-prettytable \
             ${PYTHON_PN}-pep8 \
             ${PYTHON_PN}-pyflakes&quot;
 
-SRC_URI[md5sum] = &quot;6466619b89c2969dc57722ad73f85676&quot;
-SRC_URI[sha256sum] = &quot;dd33eb70232b6118298d516bbcecd26704689c386594f0f3c4f13867b2c56f72&quot;
+SRC_URI[sha256sum] = &quot;7d3fbbde18228f4ff2f1f119a45cdffa458b4c0dee32eb4d2bb2f82554bac7bc&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------1310A7516FCA9B9B20B4881E--
