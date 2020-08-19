Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.81])
 by mx.groups.io with SMTP id smtpd.web11.94105.1597860381119390329
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 11:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RipzwS2S;
 spf=pass (domain: windriver.com, ip: 40.107.220.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEYnupPF9PyxzdXmXngDSozwOx2FAm2bnNNCcvIbT1UwhIRiWYRjQDwe+anV9e2bMIYQh9tmIBPgSxI0lqt3WgkQvuQ/P0OzfYXHl2jRI47Q1dACD3wQf4+Q6hPReifgX0Un3WF0WBW6KpWmoN66RXvx/FI55bTZL7sv+7vodzMNXOmZyciWMPs4bTky0VKFO8bEEoM/Y9ooT9cAprZu/iGfvcuhtBiysLXJTpLNsUv9HwV0BeZk0NL6wahwyi6aTs87sz2a7pxXFjgK+Xe95lbXOWfrbMWomVsD/8tIkXj7itzgSTudoseatYh9e5t/b69hZe4SB5/WmR+vv2Npig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drrFfCv+GwNklgs0omEyUUlei3vMTfb4u2ytDvcjoHk=;
 b=Oqlg7v5f+mlTK9uCqLtPzZSUoPdWvIAn4FVA1iRTiRJQgtXcira/4Z9J4iDnCDIoenNRqIoP9Wn0gAgbhP8lqxmI/msYTeLG0NqELIj83YOYIUxYJqOOj95t+31oLMJweTGm/POLKQAmJFLNv+5aWNikvE88NX3xNRGsG5BpCLLTXlE2LZENqi1dNzqTEywNB5I2RiZzVtXTUb7Jjp1pSbnx38VR+RiW2rx07COWbzeB9uwhC/T4Bo5VKwSWMEp6XpHsK7LaB484vWTXebtQg1XXwAHVL7iClfVpgj1AEwh80M+JhWI4Jj+CZJFTimDendusAwUJ4cujlyzNOl5oRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drrFfCv+GwNklgs0omEyUUlei3vMTfb4u2ytDvcjoHk=;
 b=RipzwS2S42exI3ph1KwiPYekqUWDjz4mu/k0gLqasDMxdQJIQfIwWBIjVHymXGKmlWRwgrGdqvBP/J3z/O2hhk/Kzh7kvCewbvavYsiOqnpT7S1Lqt4I0LX8sp8JA8RvvUbTBQ71NQGM6Q1jZSlFych+ObSWwf8pXsN/ckAgAHU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33)
 by DM5PR11MB1468.namprd11.prod.outlook.com (2603:10b6:4:4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24; Wed, 19 Aug 2020 18:06:20 +0000
Received: from DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::fb:781c:eb42:b4f]) by DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::fb:781c:eb42:b4f%4]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 18:06:19 +0000
Subject: Re: [oe] [meta-python][PATCH 1/6] python3-sqlalchemy: Upgrade 1.3.18 -> 1.3.19
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200818153444.15728-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <27ca0f4b-a64f-6dd6-e1dc-0b1b9ffb6600@windriver.com>
Date: Wed, 19 Aug 2020 14:06:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200818153444.15728-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::35) To DM6PR11MB3913.namprd11.prod.outlook.com
 (2603:10b6:5:193::33)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Wed, 19 Aug 2020 18:06:19 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5f265ee-8a3a-40de-6a6d-08d8446a9300
X-MS-TrafficTypeDiagnostic: DM5PR11MB1468:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB146873ADA34506E3133724429F5D0@DM5PR11MB1468.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aU51TxpAJISBTaJ8aLpq7fJo3HrNUumYx/U7e29FLhU/lEl1fXmTN+R5XCdrJvG5moZLB676GCGhS8nrYYndWbujmu/JypIjXhybYtwjaDGCjDgKDk3LVoqNhs7uq+ZB1ndNLG9QrFEWIRDYkhW2CuIYlsR/NNghsBL54tG0ZcWmpvOT/ryXJ0KzEfo4Qim2CL3GEu+CwalqLqOnnwyBDicKlgu9O2DtqzTFAmn8lukH+dTJK6m9U/RRh60Z1l3w+rmnjWHdlJg3WBFrPBPZ90/Q9PAWRkKrFtOFUr01WXsBIcKJ0/+/AtfFDRNWE7qC6ea/QahSdEgFmHoBV3Ngaxlhv+SRupHAdZb8agFvXDZaxib4VteYdWlzF5vwkQBsQMTaoxmq8hCDNd3oDP72zFcAVLnJe9sAH0s6OVASEX2w52k+lj+yqGJztnQxMhCVkuYucKm2/E/UIHqdbsNOgmH3P4iO2kDpym18ENZv8P4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3913.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(136003)(346002)(39850400004)(21615005)(2906002)(8676002)(186003)(33964004)(316002)(16576012)(26005)(83380400001)(166002)(110011004)(53546011)(31696002)(44832011)(52116002)(2616005)(8936002)(956004)(478600001)(86362001)(36756003)(5660300002)(66556008)(66476007)(31686004)(66946007)(6486002)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	HfUkCEUEoqy6PwoM9l8/vMO8+lJFZXmxVdrFylL23jcKeO+NvfIH78eU4D7gbyHAXcxZ30h5LUI9dp30T43/lstEjOwBcn8MdJl3SHms/0s04yRzNs4jr2wiS97c8As8GEkE+BQglseU8ejUoLKSVfHqOMtgj8wuRiGSxoqAPb24zoAy3r6pcJQRJM7/DkGlbtrN+ufdtAi6PyiZjYhYHRTruoTslDItqeWs/i4gvMfxtTCq8NmuBhYegSuYEK2Apw8WIZJsS8ckoCijuwyyi60Q1AeFO8vzkocG0jKjLcEwx2LCihslZ2f3y/m5K9JCWMoKEQf+2gpFdnaKjKrq6aHJsrTwBh6q3tBFOyfMr5xfcuunmwLMMYBgE/xwtdrG2DPF+raNvAOZN6bSOvaKbeNsgsTD6PlEBJl0aKDHPeBjpfNYb92atfj33VgT53WuvclrXbiPz/Cfk5afySRAqw54x7VZakvXxeyJwoqWQppWUNzBzkuaandhswxcOA+S82v3XuT7K45G4gfHxM92AZz4Yib4Pbil3KEXHRYX0WRXJ6IbHsdXAovaw/AayjoldTGcCSse9/z/Tpb3Zr9WgCxVVr2TaZi9+yComhY5dCdAyDhsGHhO9thhJBtROKy6gRbuuXUXwTo2gpvz/jkgqQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f265ee-8a3a-40de-6a6d-08d8446a9300
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 18:06:19.8154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28O2aFt6Dd6O1IEAfaevI/C4FAS4W6/NzBvvt2y3FFas0zxtq/IOwoWaJcz0PeS54/dp5IcEt6X/CesVySG0uj/zHQcSXfeGDkI0hN8QBxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1468
Content-Type: multipart/alternative;
 boundary="------------E655F3170B997739FEB10137"
Content-Language: en-US

--------------E655F3170B997739FEB10137
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/18/20 11:34 AM, Leon Anavi wrote:
> Upgrade to release 1.3.19:
>
> - orm: Adjusted the workings of the Mapper.all_orm_descriptors()
>    accessor to represent the attributes in the order that they are
>    located in a deterministic way, assuming the use of Python 3.6
>    or higher which maintains the sorting order of class attributes
>    based on how they were declared. This sorting is not guaranteed
>    to match the declared order of attributes in all cases however;
>    see the method documentation for the exact scheme.
> - orm: The name of the virtual column used when using the
>    AbstractConcreteBase and ConcreteBase classes can now be
>    customized, to allow for models that have a column that is
>    actually named type.
> - sql: Repaired an issue where the "ORDER BY" clause rendering a
>    label name rather than a complete expression, which is
>    particularly important for SQL Server, would fail to occur if
>    the expression were enclosed in a parenthesized grouping in some
>    cases. This case has been added to test support. The change
>    additionally adjusts the "automatically add ORDER BY columns
>    when DISTINCT is present" behavior of ORM query, deprecated in
>    1.4, to more accurately detect column expressions that are
>    already present.
> - mysql: The MySQL dialect will render FROM DUAL for a SELECT
>    statement that has no FROM clause but has a WHERE clause. This
>    allows things like "SELECT 1 WHERE EXISTS (subquery)" kinds of
>    queries to be used as well as other use cases.
> - sqlite: Applied a sweep through all included dialects to ensure
>    names that contain single or double quotes are properly escaped
>    when querying system tables, for all Inspector methods that
>    accept object names as an argument (e.g. table names, view
>    names, etc). SQLite and MSSQL contained two quoting issues that
>    were repaired.
> - mssql: Fixed bug where the mssql dialect incorrectly escaped
>    object names that contained ‘]’ character(s).
> - Added a **kw argument to the DeclarativeMeta.__init__() method.
>    This allows a class to support the PEP 487 metaclass hook
>    __init_subclass__.
>
> For more details have a look at the complete changelog:
> https://docs.sqlalchemy.org/en/13/changelog/changelog_13.html
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sqlalchemy_1.3.18.bb => python3-sqlalchemy_1.3.19.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.18.bb => python3-sqlalchemy_1.3.19.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb
> rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb
> index a5e1737b0..52e7bf376 100644
> --- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb
> +++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2"
>   
> -SRC_URI[md5sum] = "96e085d318297b1ad36ef2685f54287a"
> -SRC_URI[sha256sum] = "da2fb75f64792c1fc64c82313a00c728a7c301efe6a60b7a9fe35b16b4368ce7"
> +SRC_URI[md5sum] = "a5710b0aee19a743e513f3bf002072a8"
> +SRC_URI[sha256sum] = "3bba2e9fbedb0511769780fe1d63007081008c5c2d7d715e91858c94dbaa260e"
>   
>   PYPI_PACKAGE = "SQLAlchemy"
>   inherit pypi setuptools3
>
> 

--------------E655F3170B997739FEB10137
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/18/20 11:34 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200818153444.15728-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.19:

- orm: Adjusted the workings of the Mapper.all_orm_descriptors()
  accessor to represent the attributes in the order that they are
  located in a deterministic way, assuming the use of Python 3.6
  or higher which maintains the sorting order of class attributes
  based on how they were declared. This sorting is not guaranteed
  to match the declared order of attributes in all cases however;
  see the method documentation for the exact scheme.
- orm: The name of the virtual column used when using the
  AbstractConcreteBase and ConcreteBase classes can now be
  customized, to allow for models that have a column that is
  actually named type.
- sql: Repaired an issue where the &quot;ORDER BY&quot; clause rendering a
  label name rather than a complete expression, which is
  particularly important for SQL Server, would fail to occur if
  the expression were enclosed in a parenthesized grouping in some
  cases. This case has been added to test support. The change
  additionally adjusts the &quot;automatically add ORDER BY columns
  when DISTINCT is present&quot; behavior of ORM query, deprecated in
  1.4, to more accurately detect column expressions that are
  already present.
- mysql: The MySQL dialect will render FROM DUAL for a SELECT
  statement that has no FROM clause but has a WHERE clause. This
  allows things like &quot;SELECT 1 WHERE EXISTS (subquery)&quot; kinds of
  queries to be used as well as other use cases.
- sqlite: Applied a sweep through all included dialects to ensure
  names that contain single or double quotes are properly escaped
  when querying system tables, for all Inspector methods that
  accept object names as an argument (e.g. table names, view
  names, etc). SQLite and MSSQL contained two quoting issues that
  were repaired.
- mssql: Fixed bug where the mssql dialect incorrectly escaped
  object names that contained ‘]’ character(s).
- Added a **kw argument to the DeclarativeMeta.__init__() method.
  This allows a class to support the PEP 487 metaclass hook
  __init_subclass__.

For more details have a look at the complete changelog:
<a class="moz-txt-link-freetext" href="https://docs.sqlalchemy.org/en/13/changelog/changelog_13.html">https://docs.sqlalchemy.org/en/13/changelog/changelog_13.html</a>

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200818153444.15728-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sqlalchemy_1.3.18.bb =&gt; python3-sqlalchemy_1.3.19.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.18.bb =&gt; python3-sqlalchemy_1.3.19.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb
index a5e1737b0..52e7bf376 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.sqlalchemy.org/">&quot;http://www.sqlalchemy.org/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2">&quot;file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2&quot;</a>
 
-SRC_URI[md5sum] = &quot;96e085d318297b1ad36ef2685f54287a&quot;
-SRC_URI[sha256sum] = &quot;da2fb75f64792c1fc64c82313a00c728a7c301efe6a60b7a9fe35b16b4368ce7&quot;
+SRC_URI[md5sum] = &quot;a5710b0aee19a743e513f3bf002072a8&quot;
+SRC_URI[sha256sum] = &quot;3bba2e9fbedb0511769780fe1d63007081008c5c2d7d715e91858c94dbaa260e&quot;
 
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

--------------E655F3170B997739FEB10137--
