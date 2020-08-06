Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.61])
 by mx.groups.io with SMTP id smtpd.web12.5735.1596718945236996125
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 06:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Cskczr0y;
 spf=pass (domain: windriver.com, ip: 40.107.223.61, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKOux7cO24lkuLhsaZXaeVPOiF2l3HOWc38CAoWGetK7CHu88i/wO3qry/2Y862cOCkIcE4yWf/Z5bv31K4e7FPL29n7r8TEZVzEsUlCGclr5uZMzXz57e307xOS4eP2tLBlX8w3laJvFJWD4ZUOaFHa6ZTIVcz64aQE2SVQ8K/sAJw6ZG9NNcA6CKIxPe3H03h2zkXnp+Zo3pU1j6jAKE05yEE8WEE5bZg4WSgUKbIk3EEphLujNHGAR5ABCtWWhqyWqPef7Pu9BQ7lJfjySZ9n/jbaS27ZTRgX4PWoY7cj1obHMfLhgw64o/pv4LzmMzv37XBGE4ccef0DTqPIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGHwuhruwyotuwBcX92uBUXERSPXo4eBVw+KeUclgDE=;
 b=Hectx3yWtaDeEtkNfHQAtmc9oRiNTCJYiqZOsm0uMjELXTSemYGYSFpPckS3EwRGGAnfWk9SpkEKvCuAzaGPVldJRjwHPOxCw8N4K3IY7hdKgk5XHIrkpnPxyCbjkACLM2Zx0LlqnLsvhEWF4A1OGyg8R3y9vzjp6w7RXb0vU7ZA2CwX0DsNtp+pOt2/gs0tUeZM5KJN/h53NhCsQ8GD2qpBycOO6LvkDsJ7ENcgJAT1czdNESp53K8MEU/mT2z/KDZ5jAW55vUjBxpkcLaUpXE7w+IYUNldnQi4PDrAM3y23REI/nsRSEpr8J0LQ5J/5dk04Uj+TsEYzJ9j4MCiiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGHwuhruwyotuwBcX92uBUXERSPXo4eBVw+KeUclgDE=;
 b=Cskczr0yf25+LAQuPh3y3zC1zDX7Z3oe9S16IFfD6rp6Mj/lN0UQGGecTPF4ordQ4jkRiIYET54UuPlXVH8GyhBW/nzws2BAicac/jzc/3gWtFKt3zOHAPQQIqSBQ05zEYlc2Pih1AO6eaO+ERK2yu3fai/dRR+W5E0jlNhl9Xw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 13:02:24 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.016; Thu, 6 Aug 2020
 13:02:24 +0000
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-dnspython: Upgrade 1.16.0 -> 2.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200803140520.23250-1-leon.anavi@konsulko.com>
 <20200803140520.23250-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <54fabc55-aff2-e57a-860d-5658c983d16c@windriver.com>
Date: Thu, 6 Aug 2020 09:02:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200803140520.23250-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend Transport; Thu, 6 Aug 2020 13:02:23 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 023713d6-14c4-4408-b101-08d83a08f629
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4305C3253BD8B70A5D7346319F480@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gcwVBWoD2ziWfRwOJyYDnrHMU6tbh3/dtmy7uAXR4v6anFOy1j98HqiJGaF2hjEgPwN4EhF9Ta4LXFtCYlVp4kKd9UhR6jzedCvNm6+Ba5pO7GxglWjvrte/fazFXSiGj8pG4Izp2XpNloxH2OlwFeJBQ8dYKG6ZQQUCG4SXeR56RHxck9J0lR4+EaZGf6nywlS5VL76w7vidydTnf7eE6M4lZDI2yBXvcricoVag+ptwg35m84snK6T2lF/GmjQJKV3aODN+6OO5C6Ry5JxJENcfhxl2+uk9JFqTPiOaGDNgZID7162pa0mVe8jWcxfFcAw8rQpKjWay5ai2yu6SJZf0l9mvjinIIcD1cgrLjFdhFO543iw/C8TVwqP+HqonbmFkDEzC7vGK3dtK4vK9oaPrfEfJpbK5mHwNb2mICOVt+joa2eAQelTZebfZe1rlHU3/sD3hopmboSi/EaH9Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(346002)(366004)(396003)(136003)(2616005)(44832011)(26005)(86362001)(186003)(16526019)(31686004)(956004)(5660300002)(16576012)(316002)(478600001)(966005)(52116002)(2906002)(6486002)(166002)(8676002)(8936002)(36756003)(66556008)(66476007)(66946007)(31696002)(33964004)(53546011)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	mRaWKgX15Mkak4CNSpLxnkVQFzTun9bKH47frOiGj0tfiz4/Yc1Vioq3MAF44e1ykWJxyWmxMjOHdMASK0k97OphsN4qijwXM63o7vTW+cO9wqS+TVk9g7886e6Z4Wa2r7a2L5juRwN9sDz69iFhvWfIpw4mBZcV5TZ2ZzkTgM6m+qDg2cfTvoIgM1jzZ5xRtOB8V0ZDwZC13rHmErBxN3jFS7cYWXWymnecbKcJkk/tEJbtaodoRWDUoAfQZdD4a1buN2YWtSpJbQE0tfgDptSukP+duvh8wu+Y5Ql2GYq/MYVVi1SsUmY62Aqr5HM8lRHZXgSHKoYc0MmLB9TRqfZ8+7JbOb8p9mZZXynX78QTCuBtoaIWazh+XbelMsooGRwgCJh/yEOhUMDaeZY7gu5dUvNQmuPC9rZxN6XwIyBRtvcQmsQnUSjSnzqJHsTChydX5ryUCRQLLp+lxQRLVl265JgLjcalRMqpaAQFixpIoIwzwbdmVD1v0U7fyikwesZEqva7leL4xQ/YgiWdIz6nW6gsmbgnGVAkG/wgC9ayFEqE6iKMj67x5sUUmJFWqzg7xqa521WQZQZAQE9gXoP7dYUOHxw2jSBCI/cBsMtwHZ7qrLCrOaIvgeO6KvChq1qlek970eoJzmJAarZj3w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023713d6-14c4-4408-b101-08d83a08f629
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 13:02:23.8840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJ7e0nnrJPR5tiQwgMAqReRVeY5GDqPvyno5FxAJc4u9HLpkDEj4lqmXuc1HdPxd/z4R4QGrQEj6JOOShjdAV2Mt9zwB5Th/sqz2qzYsNis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: multipart/alternative;
 boundary="------------CD49FA57068E6E090E6B25B8"
Content-Language: en-US

--------------CD49FA57068E6E090E6B25B8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/3/20 10:05 AM, Leon Anavi wrote:
> Upgrade to release 2.0.0:
>
> - Python 3.6 or newer is required.
> - Rdata is now immutable. Use dns.rdata.Rdata.replace() to make
>    a new Rdata based on an existing one.
> - dns.resolver.resolve() has been added, allowing control of
>    whether search lists are used. dns.resolver.query() is retained
>    for backwards compatibility, but deprecated. The default for
>    search list behavior can be set at in the resolver object with
>    the use_search_by_default parameter. The default is False.
> - DNS-over-TLS is supported with dns.query.tls().
> - DNS-over-HTTPS is supported with dns.query.https(), and the
>    resolver will use DNS-over-HTTPS for a nameserver which is an
>    HTTPS URL.
> - Basic query and resolver support for the Trio, Curio, and
>    asyncio asynchronous I/O libraries has been added in
>    dns.asyncquery and dns.asyncresolver. This API should be viewed
>    as experimental as asynchronous I/O support in dnspython is
>    still evolving.
> - TSIG now defaults to using SHA-256.
> - Basic type info has been added to some functions. Future
>    releases will have comprehensive type info.
> - from_text() functions now have a relativize_to parameter.
> - python-cryptography is now used for DNSSEC.
> - Ed25519 and Ed448 signatures are now supported.
> - A helper for NSEC3 generating hashes has been added.
> - SHA384 DS records are supported.
> - Rdatasets and RRsets are much faster.
> - dns.resolver.resolve_address() has been added, allowing easy
>    address-to-name lookups.
> - dns.reversename functions now allow an alternate origin to be
>    specified.
> - The repr form of Rdatasets and RRsets now includes the rdata.
> - A number of standard resolv.conf options are now parsed.
> - The nameserver and port used to get a response are now part of
>    the resolver’s Answer object.
> - The NINFO record is supported.
> - The dns.hash module has been removed; just use Python’s native
>    hashlib module.
> - Rounding is done in the standard python 3 fashion; dnspython
>    1.x rounded in the python 2 style on both python 2 and 3.
> - The resolver will now do negative caching if a cache has been
>    configured.
> - TSIG and OPT now have rdata types.
> - The class for query messages is now QueryMessage. Class Message
>    is now a base class, and is also used for messages for which we
>    don’t have a better class. Update messages are now class
>    UpdateMessage, though class Update is retained for compatibility.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-dnspython_1.16.0.bb => python3-dnspython_2.0.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-dnspython_1.16.0.bb => python3-dnspython_2.0.0.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
> rename to meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb
> index 66cd88363..a4e984619 100644
> --- a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "http://www.dnspython.org/"
>   LICENSE = "ISC"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
>   
> -SRC_URI[md5sum] = "bc9ca3b3a82164667d5730ec6d5248a2"
> -SRC_URI[sha256sum] = "36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c558e01"
> +SRC_URI[md5sum] = "42f922c9223dde0275e8c0695ead37da"
> +SRC_URI[sha256sum] = "044af09374469c3a39eeea1a146e8cac27daec951f1f1f157b1962fc7cb9d1b7"
>   
>   PYPI_PACKAGE_EXT = "zip"
>   
>
> 

--------------CD49FA57068E6E090E6B25B8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/3/20 10:05 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200803140520.23250-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.0.0:

- Python 3.6 or newer is required.
- Rdata is now immutable. Use dns.rdata.Rdata.replace() to make
  a new Rdata based on an existing one.
- dns.resolver.resolve() has been added, allowing control of
  whether search lists are used. dns.resolver.query() is retained
  for backwards compatibility, but deprecated. The default for
  search list behavior can be set at in the resolver object with
  the use_search_by_default parameter. The default is False.
- DNS-over-TLS is supported with dns.query.tls().
- DNS-over-HTTPS is supported with dns.query.https(), and the
  resolver will use DNS-over-HTTPS for a nameserver which is an
  HTTPS URL.
- Basic query and resolver support for the Trio, Curio, and
  asyncio asynchronous I/O libraries has been added in
  dns.asyncquery and dns.asyncresolver. This API should be viewed
  as experimental as asynchronous I/O support in dnspython is
  still evolving.
- TSIG now defaults to using SHA-256.
- Basic type info has been added to some functions. Future
  releases will have comprehensive type info.
- from_text() functions now have a relativize_to parameter.
- python-cryptography is now used for DNSSEC.
- Ed25519 and Ed448 signatures are now supported.
- A helper for NSEC3 generating hashes has been added.
- SHA384 DS records are supported.
- Rdatasets and RRsets are much faster.
- dns.resolver.resolve_address() has been added, allowing easy
  address-to-name lookups.
- dns.reversename functions now allow an alternate origin to be
  specified.
- The repr form of Rdatasets and RRsets now includes the rdata.
- A number of standard resolv.conf options are now parsed.
- The nameserver and port used to get a response are now part of
  the resolver’s Answer object.
- The NINFO record is supported.
- The dns.hash module has been removed; just use Python’s native
  hashlib module.
- Rounding is done in the standard python 3 fashion; dnspython
  1.x rounded in the python 2 style on both python 2 and 3.
- The resolver will now do negative caching if a cache has been
  configured.
- TSIG and OPT now have rdata types.
- The class for query messages is now QueryMessage. Class Message
  is now a base class, and is also used for messages for which we
  don’t have a better class. Update messages are now class
  UpdateMessage, though class Update is retained for compatibility.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200803140520.23250-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-dnspython_1.16.0.bb =&gt; python3-dnspython_2.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dnspython_1.16.0.bb =&gt; python3-dnspython_2.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb
index 66cd88363..a4e984619 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_1.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.0.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.dnspython.org/">&quot;http://www.dnspython.org/&quot;</a>
 LICENSE = &quot;ISC&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5af50906b5929837f667dfe31052bd34">&quot;file://LICENSE;md5=5af50906b5929837f667dfe31052bd34&quot;</a>
 
-SRC_URI[md5sum] = &quot;bc9ca3b3a82164667d5730ec6d5248a2&quot;
-SRC_URI[sha256sum] = &quot;36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c558e01&quot;
+SRC_URI[md5sum] = &quot;42f922c9223dde0275e8c0695ead37da&quot;
+SRC_URI[sha256sum] = &quot;044af09374469c3a39eeea1a146e8cac27daec951f1f1f157b1962fc7cb9d1b7&quot;
 
 PYPI_PACKAGE_EXT = &quot;zip&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------CD49FA57068E6E090E6B25B8--
