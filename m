Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.79])
 by mx.groups.io with SMTP id smtpd.web10.8365.1612533726355190181
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:02:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mO1vNYKZ;
 spf=pass (domain: windriver.com, ip: 40.107.75.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khklDDi42Gs2oq9EF2S40zYK2Zud0Sp4XTv/0M6J2ul9eqxVvb6mC52aRQU/mO0dDbxzOtMJkwt2ktX6txvETTrGFr02ALKClFTsEU3quOcbbNRK7+XIchjQF8FaX37QQoEJF5aeaBmENKIn/8YN8qAAH07omrY2wQb0HUM0srNCDiqmiAvWTCtMKcp900SYYrwCUjISvAYihrU2bVY7OpLBYxvrIp6k0DIQXp2A5yai+3bD/GQu8uhQJGtadI1XaeXmOpnxLucbn4xFvH/uPR09z8y61NxIaLI2JBKXXqFeaa2/6b3JPEKYntbymsft12YAVRZAR5opHz38i/cx7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdcSH6NcF36aEyTfL1GovXg/y7kr/R3b+JolnBmghwU=;
 b=d5j8C9j3skh/sUScowjI6Po0y8zqZ7JwBPE4+KDB0btxR2BScgxYq20aR5BJlDHFHuKxS8gYjnTIXctp8C1P5YFzF/CjuvVys9jSpFVzEc1ucizxZHlmfUbx2ynE/sVoAzs+at1YmX0l47efSaOqhEIzHN0KSpAuFDvOccvg9kkKFYPZk5tHRouWm5ClDG8ZvU5y99VE4i2rERIatpBHCd7nIJ1DIMirYrUqRjCE0sBNDBzAq2+9l9TaUUMg6LSc7xR2EFJfzK7JuBeDFLylYEoecKYs0iamhNl/ypFrB1gYcm2CTF87HwZsi6hztUgflaRGFru1wMVjBBIEJPf5qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdcSH6NcF36aEyTfL1GovXg/y7kr/R3b+JolnBmghwU=;
 b=mO1vNYKZMz4YSYGO6zOJebZCOvz35fdwcUek/922DksYKHQ+2bbhRyOTe2NCRmf4pz1FJ3JwW3SGCMeO9v/0sjgmNy4D8Tty93wKfXfjwkZtcKhixNCAc78hJf8BZ2Q66E5hPiDRLrqMKpQLxaASmT7teXFj/m6l59U9KlvetzQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 14:02:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:02:04 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-sqlalchemy: Upgrade 1.3.22 -> 1.3.23
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210202135410.2217-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <89ce97e4-3356-ee81-49f7-c4f8ade7d075@windriver.com>
Date: Fri, 5 Feb 2021 09:02:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210202135410.2217-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:208:23a::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR03CA0012.namprd03.prod.outlook.com (2603:10b6:208:23a::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 14:02:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96de73a0-3378-4d01-76b0-08d8c9de9e22
X-MS-TrafficTypeDiagnostic: BY5PR11MB3894:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB389495F97F493991080E67BA9FB29@BY5PR11MB3894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RMeYRlB+b+VOYvjy7ghGizbMD0LNa//pbmU18Ln7S02WEYlqaXX/EKqQ96CqD3z2SNYE9pZdApsqOKKA6fBIs7WM9Ixv2gX8ZNQsoxO93dahXc4YkWWXU4FvHUJCpip7+nPEAT6Fe6pMDCoI9H02FWXDyF0GmRE8T3Oq1wB+GLZWs5LNsvID6lbZR2DTjMoqt912H0lSS2hwkzLzYUbkZZmsC9HFfT7IfCxtfQNTFypWlfboP0r4RgIbo4g57DlU37hbJf8bq4eX9VJ97AQ1WpnBooWvfB8jBFp8+q/yXc+oKM7h8Rdazg/5JCQgH5E6dmHSxaZf7ZmkK1sr3GI4YKJ9D8w7w+i/HfImHDgdE+4YCKUbrHa0skHNSe3urykxJiIyZ8D14P1BvrOFpwIN98wp0kLSSWYbhEdm089moG+z227J2dJNS54xzkwd7XH5DCfiZ8xaVR++Cme1kwnB0OB2WOH6aKt3H1bfGfQjZQHSaP0TkctzUoICN8urZDktOxGCeU0h9RYc9cygiKtJNxAnOlwBw8Sf5ijU8rdzAWH0uFdbLs3NxxBvLRoY7BLmTMZM62OpAn/BnZs5EWb0Jvsl6a7g7tfi1ZKa7FIvb498B5Akqw2sRHnx9T8creTwkI4vihb9cJLjG5x8yyk3Pyi+un1/GNYCu5nDw5rIdM6JPQ0BnUglavwaFpOWnvlQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(166002)(30864003)(31686004)(8936002)(66556008)(478600001)(66476007)(5660300002)(83380400001)(966005)(66946007)(6486002)(31696002)(26005)(186003)(316002)(16526019)(33964004)(16576012)(8676002)(44832011)(2616005)(956004)(52116002)(86362001)(36756003)(2906002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?OGJMVzh1elhFeWlIZDBsazZMZjNqQzJpV0NaOVF3UExwY2M1M3lkYmdHSnIr?=
 =?utf-8?B?Q2hwU0JxbmZ5MEJ0aXRnbk1QS2FnT1NQT1ZBQ2FHNWczYXNlbVhmcVliNGZl?=
 =?utf-8?B?cVVKSVAxT2E0Zldwc1RwaXN4OW9UeEJrWVZuSlVpak9idWF0dmtkcTgzdU1o?=
 =?utf-8?B?ZnNBbmZKUG4zbkVib1ZlWlRGd0lMTTNkSml5TmVaOFNHRVhvT255UndGaHha?=
 =?utf-8?B?Z1ZOWDU4TU8rMk1rV2tzOEY2dGRYQllLSGxwd1V6OWQvSFl6NDNhL1NaS1dN?=
 =?utf-8?B?WnJxaGtmdElzRi9KQmN0eW9XYW9zcnA0TVJZbkp3bFZtbyt1c01URnpXaU50?=
 =?utf-8?B?UWRYQysxQ2l5VStXSzNNUVNyL0tmcktLY0cyTENMVGs1ZllIdmZuY1Fjc3VD?=
 =?utf-8?B?TDh2WitaYkRLV1VONnNNOWd6am43bm5LaFlPdDZudTBMdzJtcFc3L3NQbG1P?=
 =?utf-8?B?d25KU0dXcVI3NmxHWUNqQUpyWUpnL1RQeHR1eWx6QzZjenF1UDVOcVNjcitR?=
 =?utf-8?B?LzlVNWxiYmlUQlZ6WlpaRWkvOXQ2akFsNkFmVlVNOGFRY2UvMlRRY2gxS0ww?=
 =?utf-8?B?SG4xeVJWejlGZkhLVnZjZEh2TVdTS2F1OVovVkJueWVpKzZRc1E4T1l4R3hY?=
 =?utf-8?B?empiSjJrSzkzRmdBaWxRZWg2cEcvdFpMZ3E4QWV5Zk1HTTZ3Nm12WmllVHpI?=
 =?utf-8?B?cjhhWDNDeEhNMm80aGtBalRTL3JpWGZzYzBiREZXVnZaM1RiOWN6UlZHWTMw?=
 =?utf-8?B?NkRzdTIyLzNnUlgrY1R5blZKZ0FNZ2Z6VHVLcjFPMTJ1a1U2VFJLOHBoLy94?=
 =?utf-8?B?MENpbUZyTEJnNGRDTlhkME1zcEgzZzkzZCtXR0NlUk4rSm5jOXFLcnY2VWxL?=
 =?utf-8?B?WkRtb3VvZHArTzZoTmxkZXgwOVB6VFFtRlZRSXpSa2ViZ0k4a3dUSExuN0h2?=
 =?utf-8?B?QmFrT3M5YU1tSkpyRG1mVnRYdXExblQzRE9YRkVtQ3dWNlhBcGttcFpIZEJ2?=
 =?utf-8?B?b1ozbjA4QzgwMTI3M3ZBK1Fic0FEWVRTQ3U4Zk9rT3k2Z2t0UHI5eXQzQXlj?=
 =?utf-8?B?UHhaK0RJVlduaWp4S0d2UmZBTFIramhPeHB6ZU0rMFdpODR5WG1ISlpJRjdL?=
 =?utf-8?B?UGNJbTlNVUladEd3ZjVHNTNsL3E2cDhCbHFjUzRjMm1wU2NaWlMwbTZiZllP?=
 =?utf-8?B?U0d3eXFnMWdyRlNmamZBd1dxUWtLK1EzNHEvRW00ZXZTVDV1TDYvZ2FJYUd3?=
 =?utf-8?B?TGR1dVV5ei8vN2FXUm1wek9wazBlRGNvRDB2RGxhV2VkV3BxM3Qyb0JPWUky?=
 =?utf-8?B?WDE3NXZ3MHNrdDVMRWgwM2tSamUvMXprSmY5Mkg2S0p5SHBTdkNVT0xIeHVY?=
 =?utf-8?B?VHFBVWRrUkxvQ3EyK1h1OUVTeTg5RjQyRVFtbTI2Nm1oMC9MQXo4K2FYdU1E?=
 =?utf-8?B?Q1U4T1dOU1BNR3NMakh4NUhycTdzMWRaTEZuRzV5bXp6Z3o2QkZTYXhYdktR?=
 =?utf-8?B?b1B5ZWZhUU1ydkF4RlBXL0VEUFdCZHVoLzd1QnVUNUpZRkQ1b1hwQmdXR2pW?=
 =?utf-8?B?UUNtd2VWTDczSXNORkVUYzJFRWs3TmNTbEdUVzZWblkzVW1uaUNDdXBLMHVB?=
 =?utf-8?B?VUV3WGhnOWNZTWdaaVlUMGNnekdDY1pZUStLbnNBNmJSUVRFWndlZXRwVTJ4?=
 =?utf-8?B?bmxhMEVpMWpLMEN5UzF0OFRBQ1FiNmg0eEkwcExyT3BobzJyUWJTWFhkaXBP?=
 =?utf-8?Q?lFb1IeO7LEZWwA8uAI4ANgHgSy8hreIodVCWu7o?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96de73a0-3378-4d01-76b0-08d8c9de9e22
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:02:04.7995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOQrvgTouxhof7GYYnn6HRKJm2xxM5o6OM9G5yu597FIfqC/k9Ks1l4kvzBicGsg5xc9eM4Gr1TtWBHNnfrT0T/iE/5b7B9u63eioroAHTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
Content-Type: multipart/alternative;
 boundary="------------8E352BA1808DB11DC1565108"
Content-Language: en-US

--------------8E352BA1808DB11DC1565108
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-02-02 8:54 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 1.3.23:
>
> - Fixed bug where making use of the TypeEngine.with_variant()
>    method on a TypeDecorator type would fail to take into account
>    the dialect-specific mappings in use, due to a rule in
>    TypeDecorator that was instead attempting to check for chains
>    of TypeDecorator instances.
> - For SQLAlchemy 1.3 only, setup.py pins pg8000 to a version lower
>    than 1.16.6. Version 1.16.6 and above is supported by SQLAlchemy
>    1.4.
> - Fixed issue where using Table.to_metadata() (called
>    Table.tometadata() in 1.3) in conjunction with a PostgreSQL
>    ExcludeConstraint that made use of ad-hoc column expressions
>    would fail to copy correctly.
> - Casting to FLOAT is now supported in MySQL >= (8, 0, 17) and
>    MariaDb >= (10, 4, 5).
> - Fixed bug where MySQL server default reflection would fail
>    for numeric values with a negation symbol present.
> - Fixed long-lived bug in MySQL dialect where the maximum
>    identifier length of 255 was too long for names of all types of
>    constraints, not just indexes, all of which have a size limit of
>    64. As metadata naming conventions can create too-long names in
>    this area, apply the limit to the identifier generator within
>    the DDL compiler.
> - Fixed deprecation warnings that arose as a result of the release
>    of PyMySQL 1.0, including deprecation warnings for the “db” and
>    “passwd” parameters now replaced with “database” and “password”.
> - Fixed regression from SQLAlchemy 1.3.20 caused by a fix which
>    adds double-parenthesis for MySQL functional expressions in
>    indexes, as is required by the backend, this inadvertently
>    extended to include arbitrary text() expressions as well as
>    Alembic’s internal textual component, which are required by
>    Alembic for arbitrary index expressions which don’t imply double
>    parenthesis. The check has been narrowed to include only binary/
>    unary/functional expressions directly.
> - Fixed regression in Oracle dialect introduced by #4894 in
>    SQLAlchemy 1.3.11 where use of a SQL expression in RETURNING for
>    an UPDATE would fail to compile, due to a check for
>    “server_default” when an arbitrary SQL expression is not a
>    column.
> - Fixed bug in Oracle dialect where retriving a CLOB/BLOB column
>    via Insert.returning() would fail as the LOB value would need to
>    be read when returned; additionally, repaired support for
>    retrieval of Unicode values via RETURNING under Python 2.
> - Fixed issue where the stringification that is sometimes called
>    when attempting to generate the “key” for the .c collection on a
>    selectable would fail if the column were an unlabeled custom SQL
>    construct using the sqlalchemy.ext.compiler extension, and did
>    not provide a default compilation form; while this seems like an
>    unusual case, it can get invoked for some ORM scenarios such as
>    when the expression is used in an “order by” in combination with
>    joined eager loading. The issue is that the lack of a default
>    compiler function was raising CompileError and not
>    UnsupportedCompilationError.
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sqlalchemy_1.3.22.bb => python3-sqlalchemy_1.3.23.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.22.bb => python3-sqlalchemy_1.3.23.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.23.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb
> rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.23.bb
> index cf127241d..d962ea7d9 100644
> --- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb
> +++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.23.bb
> @@ -2,9 +2,9 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
>   application developers the full power and flexibility of SQL"
>   HOMEPAGE = "http://www.sqlalchemy.org/"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
>
> -SRC_URI[sha256sum] = "758fc8c4d6c0336e617f9f6919f9daea3ab6bb9b07005eda9a1a682e24a6cacc"
> +SRC_URI[sha256sum] = "6fca33672578666f657c131552c4ef8979c1606e494f78cd5199742dfb26918b"
>
>   PYPI_PACKAGE = "SQLAlchemy"
>   inherit pypi setuptools3
> --
> 2.17.1
>
>
> 
>

--------------8E352BA1808DB11DC1565108
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-02 8:54 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210202135410.2217-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 1.3.23:

- Fixed bug where making use of the TypeEngine.with_variant()
  method on a TypeDecorator type would fail to take into account
  the dialect-specific mappings in use, due to a rule in
  TypeDecorator that was instead attempting to check for chains
  of TypeDecorator instances.
- For SQLAlchemy 1.3 only, setup.py pins pg8000 to a version lower
  than 1.16.6. Version 1.16.6 and above is supported by SQLAlchemy
  1.4.
- Fixed issue where using Table.to_metadata() (called
  Table.tometadata() in 1.3) in conjunction with a PostgreSQL
  ExcludeConstraint that made use of ad-hoc column expressions
  would fail to copy correctly.
- Casting to FLOAT is now supported in MySQL &gt;= (8, 0, 17) and
  MariaDb &gt;= (10, 4, 5).
- Fixed bug where MySQL server default reflection would fail
  for numeric values with a negation symbol present.
- Fixed long-lived bug in MySQL dialect where the maximum
  identifier length of 255 was too long for names of all types of
  constraints, not just indexes, all of which have a size limit of
  64. As metadata naming conventions can create too-long names in
  this area, apply the limit to the identifier generator within
  the DDL compiler.
- Fixed deprecation warnings that arose as a result of the release
  of PyMySQL 1.0, including deprecation warnings for the “db” and
  “passwd” parameters now replaced with “database” and “password”.
- Fixed regression from SQLAlchemy 1.3.20 caused by a fix which
  adds double-parenthesis for MySQL functional expressions in
  indexes, as is required by the backend, this inadvertently
  extended to include arbitrary text() expressions as well as
  Alembic’s internal textual component, which are required by
  Alembic for arbitrary index expressions which don’t imply double
  parenthesis. The check has been narrowed to include only binary/
  unary/functional expressions directly.
- Fixed regression in Oracle dialect introduced by #4894 in
  SQLAlchemy 1.3.11 where use of a SQL expression in RETURNING for
  an UPDATE would fail to compile, due to a check for
  “server_default” when an arbitrary SQL expression is not a
  column.
- Fixed bug in Oracle dialect where retriving a CLOB/BLOB column
  via Insert.returning() would fail as the LOB value would need to
  be read when returned; additionally, repaired support for
  retrieval of Unicode values via RETURNING under Python 2.
- Fixed issue where the stringification that is sometimes called
  when attempting to generate the “key” for the .c collection on a
  selectable would fail if the column were an unlabeled custom SQL
  construct using the sqlalchemy.ext.compiler extension, and did
  not provide a default compilation form; while this seems like an
  unusual case, it can get invoked for some ORM scenarios such as
  when the expression is used in an “order by” in combination with
  joined eager loading. The issue is that the lack of a default
  compiler function was raising CompileError and not
  UnsupportedCompilationError.

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210202135410.2217-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sqlalchemy_1.3.22.bb =&gt; python3-sqlalchemy_1.3.23.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.22.bb =&gt; python3-sqlalchemy_1.3.23.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.23.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.23.bb
index cf127241d..d962ea7d9 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.23.bb
@@ -2,9 +2,9 @@ DESCRIPTION = &quot;Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.sqlalchemy.org/">&quot;http://www.sqlalchemy.org/&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2">&quot;file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595">&quot;file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595&quot;</a>

-SRC_URI[sha256sum] = &quot;758fc8c4d6c0336e617f9f6919f9daea3ab6bb9b07005eda9a1a682e24a6cacc&quot;
+SRC_URI[sha256sum] = &quot;6fca33672578666f657c131552c4ef8979c1606e494f78cd5199742dfb26918b&quot;

 PYPI_PACKAGE = &quot;SQLAlchemy&quot;
 inherit pypi setuptools3
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

--------------8E352BA1808DB11DC1565108--
