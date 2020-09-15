Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.66])
 by mx.groups.io with SMTP id smtpd.web10.14815.1600180303513827723
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aa35lXDC;
 spf=pass (domain: windriver.com, ip: 40.107.237.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBTX3tGRvpQGVUPR71NWce0ohCbv0jnqKTaE9HnIk98h7O+tk2QlHi0QubCqHVMOZnctGEYP/xrSuM5z/sZV+wdtXR+e/SdEhqT5RgatsPWXzbPUVHaOC1WyG+/UBANtmCCMHcSv9bv7glHSli+UDP6n2e8VPd4MHMhgHoNoK2HEcwUGvtnyHiw8BMU+Pi/s0lBNx++XHPgrd5kvrB9kxghXM2TMHtweMiVhDp0rpuprABEaCkA0KyEkLPM1/q+EbJ82o0ZfPbRgDVR6wBx7/NZxN6dS3Y3Y4TximrmFT1iwWbhIsqYfLT1+th5jJk2HHlSaWrhD5+22me/ZXi6ftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuwKMo47fFfbio4oFMEdCWKKLGQ6PCdjvWigV6asHKw=;
 b=J6A3t+bHTbXICnjr4xkfbnBL6MeBuAkRswkssiXUCkgPQqSfHwCWFCEGQWPE4jWXc/uP7IlYmq/cTuNTOa+19FrSnK+edPXz4gtfb9adwJ8zYKVcHLoqF1ttri9+v6nx0tPabEpr9OjKLozqsJH2oKmgON+YcV08Tg2ZlWGtaa4Tf8j9I5cr2CczL8mjsAv589DiMH97rKWjdqAQH+37feOflMdCnwHCkZ4Ix3+n7OTP/N7N5cvHr0yyYcQ7oer8KFwSgpYm6DlHrtpzic+YoiU0DuYwxBNw7Sd4fB3hhlgY77V0mltDOikDVJe4YcB8ySUAcAXPyNVIKFahEmRHXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuwKMo47fFfbio4oFMEdCWKKLGQ6PCdjvWigV6asHKw=;
 b=aa35lXDCAnLrAA51H62hbF+2/HNn9YUQ85MeQg7rB08KW0GyV8QJMucdAHfBOlqOpaTjnhDdX7PVC0x9wXqMXp2P5hTVF91YhMsInKPGESeQs5atUE82tXRjoIK17ukDnkdJXqfizTGhF6sR0S2C1dz8LQ/vk5oZGLF4xqyC+z0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4388.namprd11.prod.outlook.com (2603:10b6:a03:1c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 14:31:39 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:31:39 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-alembic: Upgrade 1.4.2 -> 1.4.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
 <20200914131536.6072-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <494eee26-9022-ca9d-6b51-ea7a82548309@windriver.com>
Date: Tue, 15 Sep 2020 10:31:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914131536.6072-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Tue, 15 Sep 2020 14:31:38 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac7b3d4a-dabf-458a-cf1b-08d859840e96
X-MS-TrafficTypeDiagnostic: BY5PR11MB4388:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43888D151D6DD9EBCA833B959F200@BY5PR11MB4388.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zfaiqIG47gTuixANZJsBsL3skSlfuF955SjaaVY+GMa+9zSiZ7C3bc0cdrXfflQqc88AJgUM7QLnjgn6JrlunXSFMM4pXx18cglItxnL0Ky4NYclkqIQDpZG2k8Q2GaBaWmBYfba2VjyA7u8MZ7GD+lfSC84PM5JRNu1n6PHgvDKFm221vE+6ehGmvEMMgi5lQBABQIo2CQdIEuMewHajpB3dOBrreI0RTGrZepySUXm/IMgAqkA7aFDjKiW9AgTAaW/dt3a8ZQanTmWFNeiWJBDxbtTcIx2pSyMZVPQeNo05CkMeFWI+thadRyRF/OYJ/UqH/rVhEV5rcr3Ip0hYIF5cFcRTc8H8+XWRs2nkfgW4lRLsqH+Q0AS59srNqBxB6c9d+R+/vsL2TBRL2amp78IiADpmc5nTFOvX09VIRYVCqLmarwOizdnoUJPpCvEutxp1UVzPh9KHxM7Jl5wCA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(366004)(346002)(86362001)(66556008)(316002)(16526019)(2906002)(66946007)(66476007)(33964004)(966005)(16576012)(26005)(53546011)(52116002)(186003)(166002)(83380400001)(36756003)(8936002)(478600001)(31696002)(2616005)(6486002)(8676002)(31686004)(44832011)(5660300002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	XhvA6eI/AQEkkrSNjUa60F/GPeNU63p18dOt+3K1CAosp6zStbqtGdl2JsBD5A7yk6bmEtbCYkvmlpi8yYPPScz8DMDGPLOGituE2u6DrDWew9YvA52w/mnCWWJGmmMy2ceRnRZx86pvWVEki6gwThQhWHTJad1Q87iGFE6UquvVPO3FgZvmexZZAiO9RizigjntEEhO3FaxXdLN8U504R9u1e4Cf55WIBS4Hf3F0N/lx2knybXRoKaXd3ow0cQRbpsSyd7kF6BZ6SsAEu4jNyciKUvhjLMsf/0GASzmTs0+lZI0FPGciF5bbV+lN8pV/N53ngvD0g8nde7ye43ZDddYXyBnGSgsV+klN2UV9KClmpiuJ6b5UYhDZsLQMw+p9s+XIgxnRGWFanpGS07onawjyQ/XX7fyH2vWO6mT8Ak+l0OyeZmrbRl+BDUvfyGJC7y4vnEZ4HlUCOv4I2pzp+AF1bsS6T5Ms4mNv02ZQoSktD7Fptq2LAav+QSGFXpCjIGtBryEBPoAFvAwPgiiRpyHlPgoBQnDMkRSFkIoyFXhT3vrKKd+VqyQLXPXfHvMZxqtOeyq/cqKnK8iwb0PzkcCqMmdebMrj9KK6wPy3NRQlGYPZ93Mldt1YyXrO7yanfr4FKofGihBs4btdluzPg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7b3d4a-dabf-458a-cf1b-08d859840e96
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:31:39.0453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8L+V4qgIBxIxjWXVV+vJ1th5qcCAdMsFdTBOa9ZAo/IT4qKkDzukjquMnTktjg0Cdq8iPVnEqmbi07dynhSoRaPTI0ze1bWsUzfPis4SSWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4388
Content-Type: multipart/alternative;
 boundary="------------4AC55FB9D62869021714E864"
Content-Language: en-US

--------------4AC55FB9D62869021714E864
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 9:15 AM, Leon Anavi wrote:
> Upgrade to release 1.4.3:
>
> - Added support to drop named CHECK constraints that are specified
>    as part of a column, rather than table wide. Previously, only
>    constraints associated with the table were considered.
> - Fixed issue where the MySQL dialect would not correctly render
>    the server default of a column in an alter operation, if the
>    operation were programmatically generated from an autogenerate
>    pass as it would not accommodate for the full structure of the
>    DefaultClause construct.
> - Fixed issue where the CAST applied to a JSON column when copying
>    a SQLite table during batch mode would cause the data to be lost,
>    as SQLite's CAST with JSON appears to convert the data to the
>    value "0". The CAST is now skipped in a dialect-specific manner,
>    including for JSON columns on SQLite.
> - The alembic current command no longer creates an alembic_version
>    table in the database if one does not exist already, returning
>    no version as the current version. This allows checking for
>    migrations in parallel without introducing race conditions.
> - Fixed issue where columns in a foreign-key referenced table
>    would be replaced with null-type columns during a batch
>    operation; while this did not generally have any side effects,
>    it could theoretically impact a batch operation that also
>    targets that table directly and also would interfere with future
>    changes to the .append_column() method to disallow implicit
>    replacement of columns.
> - Fixed issue where the mssql_drop_foreign_key=True flag on
>    op.drop_column would lead to incorrect syntax error due to a
>    typo in the SQL emitted, same typo was present in the test as
>    well so it was not detected.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-alembic_1.4.2.bb => python3-alembic_1.4.3.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-alembic_1.4.2.bb => python3-alembic_1.4.3.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.4.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-alembic_1.4.2.bb
> rename to meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
> index 22630604b..0e7f629d4 100644
> --- a/meta-python/recipes-devtools/python/python3-alembic_1.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
> @@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bd64aba1b968c2bfbc2b525a181ce85c"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "1d67bdbd3abd33f0319afcd29bc59686"
> -SRC_URI[sha256sum] = "035ab00497217628bf5d0be82d664d8713ab13d37b630084da8e1f98facf4dbf"
> +SRC_URI[md5sum] = "6051576d8e25e3d4a9fd818d79531bad"
> +SRC_URI[sha256sum] = "5334f32314fb2a56d86b4c4dd1ae34b08c03cae4cb888bc699942104d66bc245"
>   
>   PYPI_PACKAGE = "alembic"
>   
>
> 

--------------4AC55FB9D62869021714E864
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914131536.6072-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.4.3:

- Added support to drop named CHECK constraints that are specified
  as part of a column, rather than table wide. Previously, only
  constraints associated with the table were considered.
- Fixed issue where the MySQL dialect would not correctly render
  the server default of a column in an alter operation, if the
  operation were programmatically generated from an autogenerate
  pass as it would not accommodate for the full structure of the
  DefaultClause construct.
- Fixed issue where the CAST applied to a JSON column when copying
  a SQLite table during batch mode would cause the data to be lost,
  as SQLite's CAST with JSON appears to convert the data to the
  value &quot;0&quot;. The CAST is now skipped in a dialect-specific manner,
  including for JSON columns on SQLite.
- The alembic current command no longer creates an alembic_version
  table in the database if one does not exist already, returning
  no version as the current version. This allows checking for
  migrations in parallel without introducing race conditions.
- Fixed issue where columns in a foreign-key referenced table
  would be replaced with null-type columns during a batch
  operation; while this did not generally have any side effects,
  it could theoretically impact a batch operation that also
  targets that table directly and also would interfere with future
  changes to the .append_column() method to disallow implicit
  replacement of columns.
- Fixed issue where the mssql_drop_foreign_key=True flag on
  op.drop_column would lead to incorrect syntax error due to a
  typo in the SQL emitted, same typo was present in the test as
  well so it was not detected.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914131536.6072-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-alembic_1.4.2.bb =&gt; python3-alembic_1.4.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.4.2.bb =&gt; python3-alembic_1.4.3.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.4.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-alembic_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
index 22630604b..0e7f629d4 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=bd64aba1b968c2bfbc2b525a181ce85c">&quot;file://LICENSE;md5=bd64aba1b968c2bfbc2b525a181ce85c&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;1d67bdbd3abd33f0319afcd29bc59686&quot;
-SRC_URI[sha256sum] = &quot;035ab00497217628bf5d0be82d664d8713ab13d37b630084da8e1f98facf4dbf&quot;
+SRC_URI[md5sum] = &quot;6051576d8e25e3d4a9fd818d79531bad&quot;
+SRC_URI[sha256sum] = &quot;5334f32314fb2a56d86b4c4dd1ae34b08c03cae4cb888bc699942104d66bc245&quot;
 
 PYPI_PACKAGE = &quot;alembic&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4AC55FB9D62869021714E864--
