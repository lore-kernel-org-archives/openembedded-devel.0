Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.53])
 by mx.groups.io with SMTP id smtpd.web11.21288.1602868678731909929
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 10:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KyxNAs2j;
 spf=pass (domain: windriver.com, ip: 40.107.94.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BH3eghMXkbOoivTgMQ3A5fv/UpBENzJrG/Z1KXo3ObGacwXgbhFsSnORSBy44dz0mYOdT3oBEuha2TpcHGEz+SBWuqJdeit8QNb1xFXxfm5QrsFBLgst2LHw6n2TrYTPULhD86QY8ZK3WKoZciCNHSyFUVxG4pLUlbdV3rDMAReX0P+BZg8qJRvLUTuSnQC0WDgRAECrP+3I6KwOKoaCqrY34xQOHq8PqyaKpJbEm36pLPDPZkA8Z2w7uYvGCz3hjw8nYc3aJzUX2flQGiKnLFgKpP5Mep9ruvPz2q8RAOe2/FcRV4VQvKpnLm8cMKRqk3si6dUEFZ4Ds3eICeLhng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqZkXmpKh4Hv6eNYIm2miPFOaMRG9JX2ZpRE845uaxU=;
 b=j2EaTJbnacpqFdtrcAUinMpbUV9YIAbry2gqIpATC0w4R/46EG4NLCZe/0oRWiAq2cWeEdWrXWejw1R6+U6wOwtKu7gV1LPhGMJ9NWc0fuPfZtpZdHG3MHXZgQKUgEDD3jbFZpe9w6dBcvilHzNGFBW4az3iBpEQR9xNVp1lYSRmy8xCD1nTnIW4uAqReRLV/Wg9zq7iWCVSwXoMv7yRFbz5PNDlwnzFL66tjAnSj+bD/EtdVCrcjaTv2tBB1b0Tih39RvgsfqJjpTA1wgv8KuAPrhaXEH2ThAbCqsG84lTUJHTR6IqBQPlhQR747ukFz/5BTp9+2SRexombsnUc3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqZkXmpKh4Hv6eNYIm2miPFOaMRG9JX2ZpRE845uaxU=;
 b=KyxNAs2jn9iTy2tD/2g8GHOlZxaH7OPuhcuiJZfLlbhA+JC2eBQmqn5wQAtYbV6n5z6X6aSFfOjWs8coKfKW+ELitAgx79fIyINNgyxavmCX4e1K8CHossRHgbkTFGjzuKgece4HmnUZ/aEVRBEEqBfp0kgyhdeXdGeXoOjezrQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 16 Oct
 2020 17:17:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 17:17:57 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-sqlalchemy: Upgrade 1.3.19 -> 1.3.20
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201013114654.5610-1-leon.anavi@konsulko.com>
 <20201013114654.5610-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b50ab35a-8a20-a706-f29b-c26984882ef3@windriver.com>
Date: Fri, 16 Oct 2020 13:17:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201013114654.5610-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR17CA0069.namprd17.prod.outlook.com
 (2603:10b6:a03:167::46) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR17CA0069.namprd17.prod.outlook.com (2603:10b6:a03:167::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Fri, 16 Oct 2020 17:17:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d2cd6cc-4b56-4cf3-f955-08d871f76ce4
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4226ED3A6E9CED1E02C9341A9F030@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U0GJy82vXNN4nom555p1dH4tB3m+gRMjFC2cB6NvdRrSV8Rv5hTwDrggR2tMxUYufy4uzOayvD13JYCnQmpCDRWfL3lben95LEimgF4xDkfIJBZXJr72gc+Ouxla4Da/24ABov7+vZRBSUiqLSBYnw4qCwyt10XehLjfdOcPEoor4snO3x8qrn3tgF/mhuE74dhAIqAH4F0/+Fj2tUSEiOZzJCuZN4fP+xT6NEVQH1nTal35faxYONwNJKexSDRuAzV6ktEULd0LzdGGDRLvDslHZpuAmmk2ol+uw47tBx51yKK82XgSlGbZ81jmA29257sNVsEktxG47ADeoPy2i1udn+Q4uRiOGIn2uoNujL/qMe7bQw1I59/l42/tdgYgQJ7gG8qlLbzZE6a+/Cn5ZCXPNdfyMrOlIDimfHS1U6XS5JrYoTfMJA2wLl3EHCZS2nfwCGZr/H6+KSBNOhxYaqoZ1RQllSAyJR1wE2+3QwkCh75wqgGgBplLhkSJIBvj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39850400004)(16576012)(66946007)(86362001)(31686004)(478600001)(2906002)(44832011)(966005)(66476007)(33964004)(6486002)(316002)(31696002)(66556008)(34490700002)(83380400001)(166002)(36756003)(16526019)(2616005)(956004)(5660300002)(30864003)(52116002)(8676002)(8936002)(26005)(53546011)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	z8MEKSUXssybbLIjd23vZARmcg8X0BdqMxiYfyt44B72IFYspsCmRPk1HCwfz3X3QN3yLB5s0LGD0nHR2PfBXIZRSuAhfIKFKNbBBHXUQT1TDGkv4r9zDTePSmdEpVO6mckETyngwGcdOgc7EP0EsWbeKAN4f+3wj2mg3EocCBt43iNqkfA8QOoK/l+x5WXsX5/nhGGthdaT25NJcVFSr3FcfALAhwcI+CLNcBGDJTjpUTMdw5uenoHr3VcdR9k+6QmxjLqbHkHB0bu4DxMLwITPvUxfotqHFYkN7vy9VLcKzQhALuKtqoW2KOGkNssm4YwwrinF9UKWY925rJw5vcHayQz6wYPkqg0TbHLHwidO3wSeB5cT7clF5grCX3hirsp+BfSSiEi5WLvQ4LPOEkm3hV4SVBfEu+6t80i5AClwhTzrEFewjlaZ8UgdQL4xVNajAk4PchlwLPFVy/Yh2Lo6vaZgXF1F2UuZT3L12X5fEasMgj9uNqRgUDyiFa11WHgkwu7F8d50nVB7VdHprjAyX/dI060BZM1Y76Oj/P6nSQas5/x/knvVN0RuoP8nUmNqzkJ5Tf7lKdXrMC+lWdBH+Ozv8uzKyupqIVLh0ifSdLNYkBOyBAamZTJx80Om8XVCe9XwtO2YSuuXpeFzHA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2cd6cc-4b56-4cf3-f955-08d871f76ce4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 17:17:57.4069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mJj4rkg/XbrFMlXgxZA2x7dds2CsziL/cimd+b8rpQfyI49EWwzJ1EcxB9lnFrDREIFOMimuz1yrBfthq5QKger1EtUvf4TcEIWOTWrktw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: multipart/alternative;
 boundary="------------6042C232CC48F40A415293DE"
Content-Language: en-US

--------------6042C232CC48F40A415293DE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/13/20 7:46 AM, Leon Anavi wrote:
> Upgrade to release 1.3.20:
>
> orm:
> - An ArgumentError with more detail is now raised if the target
>    parameter for Query.join() is set to an unmapped object. Prior
>    to this change a less detailed AttributeError was raised.
> - Fixed issue where using a loader option against a string
>    attribute name that is not actually a mapped attribute, such
>    as a plain Python descriptor, would raise an uninformative
>    AttributeError; a descriptive error is now raised.
>
> engine:
> - Fixed issue where a non-string object sent to SQLAlchemyError or
>    a subclass, as occurs with some third party dialects, would fail
>    to stringify correctly.
> - Repaired a function-level import that was not using SQLAlchemy’s
>    standard late-import system within the sqlalchemy.exc module.
>
> sql:
> - Fixed issue where the pickle.dumps() operation against Over
>    construct would produce a recursion overflow.
> - Fixed bug where an error was not raised in the case where a
>    column() were added to more than one table() at a time. This
>    raised correctly for the Column and Table objects. An
>    ArgumentError is now raised when this occurs.
>
> postgresql:
> - The psycopg2 dialect now support PostgreSQL multiple host
>    connections, by passing host/port combinations to the query
>    string.
> - Adjusted the Comparator.any() and Comparator.all() methods to
>    implement a straight “NOT” operation for negation, rather than
>    negating the comparison operator.
> - Fixed issue where the ENUM type would not consult the schema
>    translate map when emitting a CREATE TYPE or DROP TYPE during the
>    test to see if the type exists or not. Additionally, repaired an
>    issue where if the same enum were encountered multiple times in a
>    single DDL sequence, the “check” query would run repeatedly rather
>    than relying upon a cached value.
>
> mysql:
> - Adjusted the MySQL dialect to correctly parenthesize functional
>    index expressions as accepted by MySQL 8.
> - The “skip_locked” keyword used with with_for_update() will emit a
>    warning when used on MariaDB backends, and will then be ignored.
>    This is a deprecated behavior that will raise in SQLAlchemy 1.4,
>    as an application that requests “skip locked” is looking for a
>    non-blocking operation which is not available on those backends.
> - Fixed bug where an UPDATE statement against a JOIN using MySQL
>    multi-table format would fail to include the table prefix for the
>    target table if the statement had no WHERE clause, as only the
>    WHERE clause were scanned to detect a “multi table update” at
>    that particular point. The target is now also scanned if it’s a
>    JOIN to get the leftmost table as the primary table and the
>    additional entries as additional FROM entries.
> - Add new MySQL reserved words: cube, lateral added in MySQL 8.0.1
>    and 8.0.14, respectively; this indicates that these terms will
>    be quoted if used as table or column identifier names.
>
> mssql:
> - Fixed issue where a SQLAlchemy connection URI for Azure DW with
>    authentication=ActiveDirectoryIntegrated (and no username+password)
>    was not constructing the ODBC connection string in a way that was
>    acceptable to the Azure DW instance.
>
> misc:
> - Fixed issue where the following pool parameters were not being
>    propagated to the new pool created when Engine.dispose() were
>    called: pre_ping, use_lifo. Additionally the recycle and
>    reset_on_return parameter is now propagated for the AssertionPool
>    class.
> - An informative error is now raised when attempting to use an
>    association proxy element as a plain column expression to be
>    SELECTed from or used in a SQL function; this use case is not
>    currently supported.
> - Fixed incompatibilities in the test suite when running against
>    Pytest 6.x.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sqlalchemy_1.3.19.bb => python3-sqlalchemy_1.3.20.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.19.bb => python3-sqlalchemy_1.3.20.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb
> rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb
> index 52e7bf376b..e8f598ada3 100644
> --- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb
> +++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2"
>   
> -SRC_URI[md5sum] = "a5710b0aee19a743e513f3bf002072a8"
> -SRC_URI[sha256sum] = "3bba2e9fbedb0511769780fe1d63007081008c5c2d7d715e91858c94dbaa260e"
> +SRC_URI[md5sum] = "40200b570274446a05959abd3fa81778"
> +SRC_URI[sha256sum] = "d2f25c7f410338d31666d7ddedfa67570900e248b940d186b48461bd4e5569a1"
>   
>   PYPI_PACKAGE = "SQLAlchemy"
>   inherit pypi setuptools3
>
> 
>

--------------6042C232CC48F40A415293DE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/13/20 7:46 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201013114654.5610-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.20:

orm:
- An ArgumentError with more detail is now raised if the target
  parameter for Query.join() is set to an unmapped object. Prior
  to this change a less detailed AttributeError was raised.
- Fixed issue where using a loader option against a string
  attribute name that is not actually a mapped attribute, such
  as a plain Python descriptor, would raise an uninformative
  AttributeError; a descriptive error is now raised.

engine:
- Fixed issue where a non-string object sent to SQLAlchemyError or
  a subclass, as occurs with some third party dialects, would fail
  to stringify correctly.
- Repaired a function-level import that was not using SQLAlchemy’s
  standard late-import system within the sqlalchemy.exc module.

sql:
- Fixed issue where the pickle.dumps() operation against Over
  construct would produce a recursion overflow.
- Fixed bug where an error was not raised in the case where a
  column() were added to more than one table() at a time. This
  raised correctly for the Column and Table objects. An
  ArgumentError is now raised when this occurs.

postgresql:
- The psycopg2 dialect now support PostgreSQL multiple host
  connections, by passing host/port combinations to the query
  string.
- Adjusted the Comparator.any() and Comparator.all() methods to
  implement a straight “NOT” operation for negation, rather than
  negating the comparison operator.
- Fixed issue where the ENUM type would not consult the schema
  translate map when emitting a CREATE TYPE or DROP TYPE during the
  test to see if the type exists or not. Additionally, repaired an
  issue where if the same enum were encountered multiple times in a
  single DDL sequence, the “check” query would run repeatedly rather
  than relying upon a cached value.

mysql:
- Adjusted the MySQL dialect to correctly parenthesize functional
  index expressions as accepted by MySQL 8.
- The “skip_locked” keyword used with with_for_update() will emit a
  warning when used on MariaDB backends, and will then be ignored.
  This is a deprecated behavior that will raise in SQLAlchemy 1.4,
  as an application that requests “skip locked” is looking for a
  non-blocking operation which is not available on those backends.
- Fixed bug where an UPDATE statement against a JOIN using MySQL
  multi-table format would fail to include the table prefix for the
  target table if the statement had no WHERE clause, as only the
  WHERE clause were scanned to detect a “multi table update” at
  that particular point. The target is now also scanned if it’s a
  JOIN to get the leftmost table as the primary table and the
  additional entries as additional FROM entries.
- Add new MySQL reserved words: cube, lateral added in MySQL 8.0.1
  and 8.0.14, respectively; this indicates that these terms will
  be quoted if used as table or column identifier names.

mssql:
- Fixed issue where a SQLAlchemy connection URI for Azure DW with
  authentication=ActiveDirectoryIntegrated (and no username+password)
  was not constructing the ODBC connection string in a way that was
  acceptable to the Azure DW instance.

misc:
- Fixed issue where the following pool parameters were not being
  propagated to the new pool created when Engine.dispose() were
  called: pre_ping, use_lifo. Additionally the recycle and
  reset_on_return parameter is now propagated for the AssertionPool
  class.
- An informative error is now raised when attempting to use an
  association proxy element as a plain column expression to be
  SELECTed from or used in a SQL function; this use case is not
  currently supported.
- Fixed incompatibilities in the test suite when running against
  Pytest 6.x.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201013114654.5610-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sqlalchemy_1.3.19.bb =&gt; python3-sqlalchemy_1.3.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.19.bb =&gt; python3-sqlalchemy_1.3.20.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb
index 52e7bf376b..e8f598ada3 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.sqlalchemy.org/">&quot;http://www.sqlalchemy.org/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2">&quot;file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2&quot;</a>
 
-SRC_URI[md5sum] = &quot;a5710b0aee19a743e513f3bf002072a8&quot;
-SRC_URI[sha256sum] = &quot;3bba2e9fbedb0511769780fe1d63007081008c5c2d7d715e91858c94dbaa260e&quot;
+SRC_URI[md5sum] = &quot;40200b570274446a05959abd3fa81778&quot;
+SRC_URI[sha256sum] = &quot;d2f25c7f410338d31666d7ddedfa67570900e248b940d186b48461bd4e5569a1&quot;
 
 PYPI_PACKAGE = &quot;SQLAlchemy&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------6042C232CC48F40A415293DE--
