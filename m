Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.42])
 by mx.groups.io with SMTP id smtpd.web09.13885.1604501232844651484
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:47:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=F46uo37h;
 spf=pass (domain: windriver.com, ip: 40.107.92.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRrHoz2EQ3a6BfwyqODtgrfqmb/vVp5tiIcLW5lCF8CS0WnVqxS9A3VeIHX+ZjFoQypgeuXW8BeotpgCDky/TD6IcRtK7gbfesymkE+Ik/82yzD2Xku9S2kT84oZgqHAuX8z1r0Wr+MFChJ9RvYpn80J/d7olK3JrPrYTzMGM8ooApgLz6vpfK5fnXGy5HqSHTVwy32cwTumlBNgHbxOOIeLoWhZPfYnZ1rj1JldxvraMJAN/FAoUgp1o5Fk5/jCn7AkYkuO9hRso1zh8qgGdu0kOszhN7DctZL6hOf4yn14Tzukij7yIyn/ozNYd3VPsKHX678ABuewYz3/1AA5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6E0J9HIkLyhNwduSVYhLGlYLQF4zxaGw9opEaRo+e8Q=;
 b=hXt8XyMch5vza1+hBjsji/vHed5x1beIj1nzflnp+GSf+ZN79n6vyS5JS/EUPKq8LjeYhi28kCX94CIvjLxvf8NjQgQI1PSg8vyqch3CM8MShd5bglxuiC6ziZ9/NJ5TTvw0YP/tDRwxmSAglky3lMPuZXLLnJHtRZ7BrEu5E6wU8/GS5E+7jTEXUHxvf6vXvuTUAaoOP2ZQ12VTOBjQFugNbUZsXcA2KxKjGkaYQGaViZFqOEJQKz/beGXtzDlhKjDsaAgsY8tScpdpqLLAciQxRL94t/YawbYeUiDDvQiB4McHQtu2ZfiHtJk3snZuWElUuHBNZ34hjomA+oVUrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6E0J9HIkLyhNwduSVYhLGlYLQF4zxaGw9opEaRo+e8Q=;
 b=F46uo37hz8ANhAF0wV3wZJ7BHbqH0rthF4HuTiWEltqzYY4AGzhcaVnteQSNCFL5F2PvTTBpjbxZEWMKuZSdkiCm0d4bzo9Vl9Li+hreua4uRvccAdl0pGhu22VCqKU3g7vKJ4WEAZG4opWUFuBHSHW7lQPUkb+nM3kpI7pg+K4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:47:11 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:47:11 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-aiofiles: Upgrade 0.5.0 -> 0.6.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201028174622.7515-1-leon.anavi@konsulko.com>
 <20201028174622.7515-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5a348216-fbcc-4be0-09b3-605f113d9aea@windriver.com>
Date: Wed, 4 Nov 2020 09:47:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201028174622.7515-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR20CA0021.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR20CA0021.namprd20.prod.outlook.com (2603:10b6:a03:1f4::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 4 Nov 2020 14:47:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aad20f5b-0aec-43e2-e694-08d880d08306
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5085FA3F6E31D09E85903C4A9FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	153eiwJ9IQgf2pikXl0EuwmlrXUbGuy1fvcWj1A9CYKm5n3XHnUzDySojHpdR2RreY67SN+uZLYP4lqNvrJvm508aDvOk63Rxsr17ArlzRbxA5TDJ/Ty7gNKEsxsoyop0ae1fHm9Rud35Hy5XMsNBRhjdouSpg7d6thM1XQfmmIal5GQ9U98NmkroaDnwwBJVYrCJsSJ+iqDfjzeh/GsBt3xhqA2UIeuqbtDo4FJI6oplR4LQW80QDZnlIMyZ+0u3oXz6xzOKO/CRjsBQPpQl2sRaAUSi0Ge2Z2K8dC/PL8xqpWNjpoMQQrx42XU/AG3rXMbtXPueeZGVuLDfvrvyU3ivqmBAeBlmqp8u+5Ka6cz0SyAqmAiqF6x2OxzcARYEcSsFnYYYZ7HfCPWOgTAB8xV45IFBqU62gVq/aVZaAnSNuqadjt7chNDHACedy6+9TSjJYAL7cBzSG9UDIpkTg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	dtx29DmnT8gQmlgs1jcO478CRFmsNbDkNvjWR5yVC2X9shzBi0ygsQmMbOXOAxJkFyJq7VRowfgvqUqwZ/uXc2Vn4VDiCTiE8YV6EVUmt5aieCBSyfkhw/s35OZ/0CoVWb/D+8OSUK8/fo7CaCMuSI518tuMpYOJEkNyHmjN8Zx4bpyXfOhBh8hsLrAqtsnyy4OjBMwIyWM76g9IjRgpcatCDbWgV99TpvprdDjejF1virIi5AuYjuqOqWlzjTCTLNgW/MoSJFOoIO6+D8dADvZtI3Qa43/6RNdXg0xNpX7r70WamCk3RLZETvUJC/btEVPBgUZsl7djhvfbUEE/ZjA52nNP/xmcl4Uoj8W+zf/SBP8iJqIK9GRheMlNz+IL0tuYp7FzGynIDBziKzvDMU8gt9qQWvffCmtFgoTZd2z1+Yyq7+uFFzGCD1y10XqwMyWgpBxlo57Qrua121uxoAi6M5cfq7sqv2R1Mz/PpxNglvIfuBlus3VLzuxCODqiHPcT/Wj/OjKuAfTb/MKFhHLqrzlsvmbQsycJVcObcJZ7fW377I6nF+UL8c0zO3Ms7xhxahVEYfVW/wJa029xUepYrtE7m0uOiQ/zDAce+k+t1bivazKFSYCmKhgHlFF3zSwbFQDRzl9qT/wIQgFPaQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aad20f5b-0aec-43e2-e694-08d880d08306
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:47:11.5454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnR1hA73cUL5i/308sbZcwEmbTNVK3EElWF2oLhc2PsCTKAQG1WJmgCkkZtp2PkT9HdkkS3/rcvxbwZvtnChHenRdhaRE/pvpQiL1XA5lbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------385011037F79981014A166FB"
Content-Language: en-US

--------------385011037F79981014A166FB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/28/20 1:46 PM, Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.6.0:
>
> - aiofiles is now tested on ppc64le.
> - Added name and mode properties to async file objects.
> - Fixed a DeprecationWarning internally.
> - Python 3.9 support and tests.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-aiofiles_0.5.0.bb => python3-aiofiles_0.6.0.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-aiofiles_0.5.0.bb => python3-aiofiles_0.6.0.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_0.6.0.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-aiofiles_0.6.0.bb
> index 0559c01e41..89157b504f 100644
> --- a/meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiofiles_0.6.0.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
>
> -SRC_URI[md5sum] = "2243eff06072115e8afe8907677ca51d"
> -SRC_URI[sha256sum] = "98e6bcfd1b50f97db4980e182ddd509b7cc35909e903a8fe50d8849e02d815af"
> +SRC_URI[md5sum] = "3b7ba03babd3d3a6101524469358843e"
> +SRC_URI[sha256sum] = "e0281b157d3d5d59d803e3f4557dcc9a3dff28a4dd4829a9ff478adae50ca092"
>
>   PYPI_PACKAGE = "aiofiles"
>
> --
> 2.17.1
>
>
> 
>

--------------385011037F79981014A166FB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/28/20 1:46 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201028174622.7515-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.6.0:

- aiofiles is now tested on ppc64le.
- Added name and mode properties to async file objects.
- Fixed a DeprecationWarning internally.
- Python 3.9 support and tests.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201028174622.7515-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-aiofiles_0.5.0.bb =&gt; python3-aiofiles_0.6.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiofiles_0.5.0.bb =&gt; python3-aiofiles_0.6.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_0.6.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb
rename to meta-python/recipes-devtools/python/python3-aiofiles_0.6.0.bb
index 0559c01e41..89157b504f 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_0.6.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/aio-libs/aiohttp">&quot;https://github.com/aio-libs/aiohttp&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d2794c0df5b907fdace235a619d80314">&quot;file://LICENSE;md5=d2794c0df5b907fdace235a619d80314&quot;</a>

-SRC_URI[md5sum] = &quot;2243eff06072115e8afe8907677ca51d&quot;
-SRC_URI[sha256sum] = &quot;98e6bcfd1b50f97db4980e182ddd509b7cc35909e903a8fe50d8849e02d815af&quot;
+SRC_URI[md5sum] = &quot;3b7ba03babd3d3a6101524469358843e&quot;
+SRC_URI[sha256sum] = &quot;e0281b157d3d5d59d803e3f4557dcc9a3dff28a4dd4829a9ff478adae50ca092&quot;

 PYPI_PACKAGE = &quot;aiofiles&quot;

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

--------------385011037F79981014A166FB--
