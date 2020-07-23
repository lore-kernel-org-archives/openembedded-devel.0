Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.80])
 by mx.groups.io with SMTP id smtpd.web11.2295.1595522843785884860
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 09:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lc0+yZNr;
 spf=pass (domain: windriver.com, ip: 40.107.93.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0MJbYMUu7O3NRn00Qbgm0rjW3sKpDkYfwJNgbHtmoVCx37Bulc2kvvwGV75MI+Zh33fK10c/aIxL9uSTlEXVffIhDz6npl6LwZozFyLhJUzkvibeO4Zx7W/g8q7jQe70L5IfIlTga/k+/t9EccBYgcT27yB1t/cmHw/lNNxkCtEktxrjc3P8DfoJrpj8BSigEUbqjRE4TsuwOT9vPmfNdhsvn9AX8Zg2HdtvSmvxYvy/J6DXhiZKEE2Auxz53wSWFmXM5giDL9XRBakNKXDFJNiY7JJAXroxnn1/2wN5VIfML/fvOMHKJ+HL/W9EXohE4mTXQaTukHy/5W67pzEwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1iXpv2eB6VSIxThoMYrkHcEnhbpsCmxhbUfHmGZJl0=;
 b=BmS4ZgWg2lluSlBUacw+0H13L0424XluZgwasm5XyaLLwZdYgtwjgtP6Nwkv/33Lk+xxWxltqMcQrO0T90yoj7AiAGAjtz1hTHCMkOBe/pjWW0moS+7nl73GPxHbeezcCdhqU30TWT9pESpeQosBcPxRULwoQycen16PVoQRUrKKoOjc75UIse7/c5snWOR96wIDlwIVAL6mF/GX8L0Ju1LUtyrW8YFq00M6dpvkoVoIRYxbrUa4H9pX5l03T8QTRwXSycUh2XH9hqLhHsnzrqCUtLKbwt6HJLpoUX8Tg27bZ9W4jcsRkEoGag8AKAvc8vJoKNjQexRHBHNsa4GVBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1iXpv2eB6VSIxThoMYrkHcEnhbpsCmxhbUfHmGZJl0=;
 b=lc0+yZNr3WufUWUBM05pVELQ5F+6xKx5HOurfQxhQijlgt97mYu4UjeXzGaRRAdoRPky2zFuuNXdlrfNDZc69/fohbGlkI+TOWDZVVlIcn5TMyxKd2HL6HSkZbruVpgW4qZ89CpNpkfpV+AyfgldyH8qkr3P+zvi6d9lzMyqQiM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4131.namprd11.prod.outlook.com (2603:10b6:405:80::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 16:47:22 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f%7]) with mapi id 15.20.3195.028; Thu, 23 Jul 2020
 16:47:22 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-pymysql: Upgrade 0.9.3 -> 0.10.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200722104905.15499-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <82088e28-be87-41b7-f518-b5e807273078@windriver.com>
Date: Thu, 23 Jul 2020 12:47:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200722104905.15499-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0093.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::32) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0093.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend Transport; Thu, 23 Jul 2020 16:47:21 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b74131c1-9599-4c66-ca13-08d82f2811f5
X-MS-TrafficTypeDiagnostic: BN6PR11MB4131:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB41316AD5C4A374DEA6F361759F760@BN6PR11MB4131.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hN4z5VAnNWF+vyDvk47HbU0ZDpkQM1C1l2L3dQRyMWhCQfUhc/IRJX0YAeFF46QriswKq1sPWChY3u1Cj0a8MwcaLSz31bYLxv8rRpWBeiI+OjGNeP2YFJLN1v9IoDLVQ+I01y8tObS8gkhx1pZVTokS6K3XkutB8WH1PFwL34OdubuZ4LnIRVuNiB3uTpOZKnroG4hWuzjIlH4mlxevKAQFt8uDmM/ZlXaE0g0QJ9c7jjuEM1BYugvS+IRiwkHBdZBQK4v/hJ4eGJgL3BnpTFowiJdQSm3B4WXc9zdlNgv5NuGysRwOXhifctvjgRdI2B5oTQe30F+/mp3yZY3LJTwnKiNs8OHnRVbApPTWOQZh2vfMi6DgFRtGYdubEToFqpAeeGF8zzO2YlCv2LROw8BmWsI1Y2InVv7871SmTs9GDICpvHyUlTFxB6phN9ZDnzU0cCXgBVMVdyLBPHOSug==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39850400004)(136003)(366004)(396003)(8676002)(956004)(2616005)(53546011)(33964004)(83380400001)(44832011)(36756003)(52116002)(966005)(5660300002)(316002)(16576012)(8936002)(26005)(6486002)(2906002)(186003)(16526019)(478600001)(66556008)(31686004)(66946007)(66476007)(31696002)(86362001)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	jglqtAGtRsJDwPM/Kef8wy4U7Hc8m3V3cWwGpvc7PD64RxaRSryNH1V6TJf/ij4pdfjk7qoyDDdX12DbuuklRxIesMvrxhQp706uxxjsnsbUPDcT/lauRXfuYw8D4KVhoDF0iKW4oT+A24VUZziMNyo3laCa9K7eIL/7hAuDE0o9ZFp5byI0w5irHQD56Fd5L46lY5amdRvGzfmaMXDL3NRY+tiVD0JZx2/4iNNrzHYWUHbtXLSV50Ug2TWWWXxozTu5EfPxOeFrUmLvfBEAzwucUkZUd1dXhGlIEWGwh24CVYO4X0NkKBf1eBJRTdCSwvOFEmiiaKYWFPi6SaoOrtsx/XIPEPZpjNI34h/NyBNjYoDA4mEll8ovxw9riYYo7eriXQ5wHzrilLMKK7SGmBrsDib//J+L0ValmVYYAuojORWuOk6LAluq1JFhG8bFBLTy4gfnniajymLm3DzzOVxsN0zJ00Bat3MNKW0/dqw3SH51B8PMw9rXD7UUEOTS
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b74131c1-9599-4c66-ca13-08d82f2811f5
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 16:47:22.1931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fY8iKWHgh+gHO/X9UQMyvWGdtTJaPbE9jYxqRCDkIcPBe00XcP9Uy6muNa8uoopbv0Il80xtAKNh7oHWwv6d7AlZrf1HWreXuLwtCmPOedw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4131
Content-Type: multipart/alternative;
 boundary="------------C062AB8CE43FD8BAA5EE7539"
Content-Language: en-US

--------------C062AB8CE43FD8BAA5EE7539
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/22/20 6:48 AM, Leon Anavi wrote:
> Upgrade to release 0.10.0:
>
> - MariaDB ed25519 auth is supported.
> - Python 3.4 support is dropped.
> - Context manager interface is removed from Connection. It will
>    be added with different meaning.
> - MySQL warnings are not shown by default because many user report
>    issue to PyMySQL issue tracker when they see warning. You need
>    to call "SHOW WARNINGS" explicitly when you want to see warnings.
> - Formatting of float object is changed from "3.14" to "3.14e0".
> - Use cp1252 codec for latin1 charset.
> - Fix decimal literal.
> - TRUNCATED_WRONG_VALUE_FOR_FIELD, and ILLEGAL_VALUE_FOR_TYPE are
>    now DataError instead of InternalError.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pymysql_0.9.3.bb => python3-pymysql_0.10.0.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pymysql_0.9.3.bb => python3-pymysql_0.10.0.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb b/meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb
> rename to meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb
> index 6a64ccb16..895c47b03 100644
> --- a/meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb
> @@ -8,8 +8,8 @@ HOMEPAGE = "https://pymysql.readthedocs.io"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
>   
> -SRC_URI[md5sum] = "e5d9183cc0a775ac29f9e0365cca6556"
> -SRC_URI[sha256sum] = "d8c059dcd81dedb85a9f034d5e22dcb4442c0b201908bede99e306d65ea7c8e7"
> +SRC_URI[md5sum] = "d08058b1592724d5808c43f56050f245"
> +SRC_URI[sha256sum] = "e14070bc84e050e0f80bf6063e31d276f03a0bb4d46b9eca2854566c4ae19837"
>   
>   PYPI_PACKAGE = "PyMySQL"
>   inherit pypi setuptools3
>
> 

--------------C062AB8CE43FD8BAA5EE7539
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/22/20 6:48 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200722104905.15499-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.10.0:

- MariaDB ed25519 auth is supported.
- Python 3.4 support is dropped.
- Context manager interface is removed from Connection. It will
  be added with different meaning.
- MySQL warnings are not shown by default because many user report
  issue to PyMySQL issue tracker when they see warning. You need
  to call &quot;SHOW WARNINGS&quot; explicitly when you want to see warnings.
- Formatting of float object is changed from &quot;3.14&quot; to &quot;3.14e0&quot;.
- Use cp1252 codec for latin1 charset.
- Fix decimal literal.
- TRUNCATED_WRONG_VALUE_FOR_FIELD, and ILLEGAL_VALUE_FOR_TYPE are
  now DataError instead of InternalError.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200722104905.15499-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pymysql_0.9.3.bb =&gt; python3-pymysql_0.10.0.bb}   | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymysql_0.9.3.bb =&gt; python3-pymysql_0.10.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb b/meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb
rename to meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb
index 6a64ccb16..895c47b03 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_0.9.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb
@@ -8,8 &#43;8,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pymysql.readthedocs.io">&quot;https://pymysql.readthedocs.io&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc">&quot;file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc&quot;</a>
 
-SRC_URI[md5sum] = &quot;e5d9183cc0a775ac29f9e0365cca6556&quot;
-SRC_URI[sha256sum] = &quot;d8c059dcd81dedb85a9f034d5e22dcb4442c0b201908bede99e306d65ea7c8e7&quot;
&#43;SRC_URI[md5sum] = &quot;d08058b1592724d5808c43f56050f245&quot;
&#43;SRC_URI[sha256sum] = &quot;e14070bc84e050e0f80bf6063e31d276f03a0bb4d46b9eca2854566c4ae19837&quot;
 
 PYPI_PACKAGE = &quot;PyMySQL&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C062AB8CE43FD8BAA5EE7539--
