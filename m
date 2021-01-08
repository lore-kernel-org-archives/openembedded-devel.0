Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.85])
 by mx.groups.io with SMTP id smtpd.web11.1914.1610121959126434280
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CnlZrQTu;
 spf=pass (domain: windriver.com, ip: 40.107.223.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkWt5ZZXupZnqqHb200sDVgDP/9/rs0ziuQ6XZDsfl0sFrQfk/Eq66DZg0dBzoj1q9H9hFWcn3VlgSteGj6JDhzpwzWZIBiqmikyASg49J4jfB1ZqtufMeBpkP3yXBAEbDhBIB2BRoZKIszO7m811UBSm2PtK2MJY0XZctGQws8HX1WB0ZWDGFhaJy3ZqzqWlXFsSrkJQ96z+3nhtjKW+zENQYtWPqzpTVCC+MoOGWsj85Pxti6heOEr3BJVcEOlNYKmauzsr3dOZXhOFBftK2JXQ0g1gek5CBFKSs6HMSsgxbuMbVyEYSRBut9Rc5dfZpnlIG6h/tPgTV8szetRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AU5dE7q4/XPhC3f/c0PeyC4qzujqCDwt05VUf+36WA8=;
 b=fQGB/DCDH8Ul6Rs423iF80MweG/2fnN393GEvrQwZY5Hjz3YR92AwdsRwnHtkkh9VzFlPET4unJeDG0N1wfy2N4eeLD5iKgu7USn5yjkkPVNyVxDDf9kUUYVMu9h6TZg+9HYAX6zPMpblHz7pyr1r/AODpJXoO+bN/1QFeGWOMzw/kJSplAY+8rZYOggkx0goih5Sef3niBoM258+tLtY2CQc5VYJh1yaresrCOx86DCMaMGTaHaC5DqIuuIc5qoHRqNSyJnY9JP/AUS099Ym99ppT/6LnplJilqQBzxMRDiaynre0LTL6OqVrimKmeNn9VqzTQzbASJiHjr7z6arA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AU5dE7q4/XPhC3f/c0PeyC4qzujqCDwt05VUf+36WA8=;
 b=CnlZrQTuYDnYHk6s7M7so3XjXPyfrP93y8d9YznyIWW/CI/DQ5yDLAx4FgWUXNTsCeVvTQSMrAiVS+2GE9KkuT/5M3j5+SrIrRXzfV0mHebSY3isILcUn2vXBIC2qCrbvYUoOHwnj2DhS8Z1U3X36VX3MO91YvCjk/vuVyhIkpA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3303.namprd11.prod.outlook.com (2603:10b6:a03:18::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:05:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:05:57 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-sqlalchemy: Upgrade 1.3.20 -> 1.3.22
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
 <20210106220702.10483-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6893bb8e-80c5-d4c5-5bda-00ebae0b6393@windriver.com>
Date: Fri, 8 Jan 2021 11:05:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210106220702.10483-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:208:160::43) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR13CA0030.namprd13.prod.outlook.com (2603:10b6:208:160::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Fri, 8 Jan 2021 16:05:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8165a5a0-10c0-46fa-f558-08d8b3ef4920
X-MS-TrafficTypeDiagnostic: BYAPR11MB3303:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB33030435FEDCDB2BF4F07FBB9FAE0@BYAPR11MB3303.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rwotl6AU6f8anliYHsVFK9U2RmmL47HHHfUr1h8pXuYR81eMwyL3+qYkQSMKh0g2Mn6yWSVN3v7Lyci7gQeiOcXcEgdr6h1c0We8usg9u9T042TWKNH/HJO0KJttecALtDu6DToclmcwCPWj8avNoxjLJ8mVYTZT+BV+JdUXRpsw+qRgtnZ+/+lCc3dKKpxbihvvTrNPTPxO8JmQGuIBgA4mS21R3/GcWjOpGl/73Kw7fD6utLmG7+Uts5N7KtDIj98F2NUGXiSTf5L61dUA8R2WvcGyNkiVY7OGlkzKj05m9KlnFfL2eHYuVu6gtJ0JPqC56aU5NHfhalJYgE8SnUVUysRqMHBKMW6swlX2GClhnWXO9fNVGi+j36zSApYMMjeXWxdPBVUhqjHSbvF21F0YvOvEmdc3jnfVjmmcvcUaTVlR5pgQiZWa2oGE4Xf6gwJXHU5JuOEyrPLlgVeYaNv/EDTu59ievavDqyHqLAaK32NPKxmvMeWUP/FC2bl2YhLwqPama30KCc6oifHR0lj3FLxsIkmTsQSz6CCuQy562v5B9Jln4Xkj+wsDGo/o
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(136003)(366004)(66946007)(8676002)(33964004)(44832011)(86362001)(8936002)(2616005)(166002)(2906002)(956004)(52116002)(66556008)(6486002)(83380400001)(66476007)(16526019)(16576012)(966005)(36756003)(31686004)(31696002)(5660300002)(26005)(53546011)(478600001)(186003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SEV5c04rRkJmRGlPcmQydlIwbytFcy9razhTOFRJSkphS21GeHlYWkdLMTlT?=
 =?utf-8?B?SjB5NXlzQmVpb1NOc2NpOGFXVGlLOS8zVi9SMnFxUmovc2xXbEFudWFTQjZm?=
 =?utf-8?B?eUljWGUzOG1YRUJKVVZZbDRxZ3ppd1B2MmxlNGgySGx6SytOZkp6dFJoc2xM?=
 =?utf-8?B?QWVXczBudDFhSHdQVXM3RUNPK0dZN3NrR2pvQnU1OGpyQ0UzWUNxYm5YUkRQ?=
 =?utf-8?B?QU5RSjdJTnJzZG5mb2RwcFJmdzhCWm85VDN0ZkVQa29xTFExNGRvbW5YMXds?=
 =?utf-8?B?WUJnSEY2NDNFNDNJdkVVMGpmKzN1Rm9JZTFGUlVOSUFnZGhtdm55dWN3Mll4?=
 =?utf-8?B?eDAzbEtaU2ZDQ2Evd2MrNlZOQUhsclBzdWJzcmNLWGlPSDJSa1NiQStXWFZN?=
 =?utf-8?B?aG9JWHdDL29HUldGYjJ5T3FUWE5naHk0Zm1GWkoyRW1pUVl6aGxoc0lnUEd3?=
 =?utf-8?B?Q0NZbU9WU0tmS2Z0MGoxVWJObTlzUkViVGtON09DUG11aGticGMwNjRZdHV4?=
 =?utf-8?B?VndDQi9DRXJIV2F3NXdGejMwY3RqdnRFdit0OHR3UjIvMjZjdjFhelZqT2E4?=
 =?utf-8?B?ck5JeGtVOStZR3ZPVEw1UU9MaTZxT0Exa0NCSHJGMktkU2Q2MEI1Z3Vxc3dm?=
 =?utf-8?B?QnFNWmJ1QlFLSFhjMHZzQW50NnU5WHQwbDJBM25Ia0oxbm0xRmhVZGUySGhy?=
 =?utf-8?B?R3phQW54dlV6NHhac05BNWpHKzhzbkpKdnBZWTY4RmtPQzJOV3J3MWRzaEVp?=
 =?utf-8?B?dWpReDU0NUpqQTMwemlrM3NHWVQxTTkvVk9HUHZ3VnNvQ2t5U2VsbE0zWmZF?=
 =?utf-8?B?Q01PeTdsRHhiVFNWeUFCeWxrOTNyNzJpY29CK3NWaGtwY0JFSkJRSEhHaEtM?=
 =?utf-8?B?UzJiakNJbjd2NmxaSXdndi9qMDNhYUFNWmZmSElaeDN3N3BsS1BkWEtrVG1s?=
 =?utf-8?B?aG9sUlRWdjd1WGFCaEVaQkF4R2pHdytMN0xZZUtxVHNJM3hOS1BBUGxQRGdk?=
 =?utf-8?B?c284Zm5vaUxJQkdmTE9KL3NpQVd2UTgxOTg0YUhFMXkzY2hNVTUrTXRwRlZx?=
 =?utf-8?B?cUxDMk94ZUt2Qk92aldocDRLbENLWWFnWWgzTVJSV09tWTlNdVRZYXV6YW9E?=
 =?utf-8?B?amcvQUFhWEZraU1LakZGbWZJN3B2c3BBdWo1S2F2UUp4TWs2WkpvNUVtc0NN?=
 =?utf-8?B?b2F6R212TXBwUlRGZm9yY1BtSjEvTUVzU1ZBNi9jeExlektJSUhWaGpDUEZL?=
 =?utf-8?B?bzN0a0oyendQU09aZXFqODNpZzc0K0hsWTQ5MU56VkNMdUZZbVpINU5vMEQ1?=
 =?utf-8?Q?wSP8hpYi7/WcwTn6I5wGyOdacUZvkpGfeI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:05:57.7428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 8165a5a0-10c0-46fa-f558-08d8b3ef4920
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IhtfP8NRm8VmTE20HSG42Pm+n3HvHv5p7D61NdsWoew6j210dkBWhn4z4dKoG5qHvsexLS+piWHhxbQK9LsKQxARV+PX7r+P+CkLU8tfm38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3303
Content-Type: multipart/alternative;
 boundary="------------2A7D7F58FBA8706EC092EF15"
Content-Language: en-US

--------------2A7D7F58FBA8706EC092EF15
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-06 5:06 p.m., Leon Anavi wrote:
> - Fixed regression which occured due to #5755 which implemented
>    isolation level support for Oracle. It has been reported that
>    many Oracle accounts don't actually have permission to query
>    the v$transaction view so this feature has been altered to
>    gracefully fallback when it fails upon database connect, where
>    the dialect will assume "READ COMMITTED" is the default
>    isolation level as was the case prior to SQLAlchemy 1.3.21.
>    However, explicit use of the Connection.get_isolation_level()
>    method must now necessarily raise an exception, as Oracle
>    databases with this restriction explicitly disallow the user
>    from reading the current isolation level.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-sqlalchemy_1.3.20.bb => python3-sqlalchemy_1.3.22.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.20.bb => python3-sqlalchemy_1.3.22.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb
> rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb
> index e8f598ada3..cf127241db 100644
> --- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb
> +++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb
> @@ -4,8 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2"
>   
> -SRC_URI[md5sum] = "40200b570274446a05959abd3fa81778"
> -SRC_URI[sha256sum] = "d2f25c7f410338d31666d7ddedfa67570900e248b940d186b48461bd4e5569a1"
> +SRC_URI[sha256sum] = "758fc8c4d6c0336e617f9f6919f9daea3ab6bb9b07005eda9a1a682e24a6cacc"
>   
>   PYPI_PACKAGE = "SQLAlchemy"
>   inherit pypi setuptools3
>
> 
>

--------------2A7D7F58FBA8706EC092EF15
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-06 5:06 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210106220702.10483-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fixed regression which occured due to #5755 which implemented
  isolation level support for Oracle. It has been reported that
  many Oracle accounts don't actually have permission to query
  the v$transaction view so this feature has been altered to
  gracefully fallback when it fails upon database connect, where
  the dialect will assume &quot;READ COMMITTED&quot; is the default
  isolation level as was the case prior to SQLAlchemy 1.3.21.
  However, explicit use of the Connection.get_isolation_level()
  method must now necessarily raise an exception, as Oracle
  databases with this restriction explicitly disallow the user
  from reading the current isolation level.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210106220702.10483-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-sqlalchemy_1.3.20.bb =&gt; python3-sqlalchemy_1.3.22.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.20.bb =&gt; python3-sqlalchemy_1.3.22.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb
index e8f598ada3..cf127241db 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb
@@ -4,8 +4,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.sqlalchemy.org/">&quot;http://www.sqlalchemy.org/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2">&quot;file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2&quot;</a>
 
-SRC_URI[md5sum] = &quot;40200b570274446a05959abd3fa81778&quot;
-SRC_URI[sha256sum] = &quot;d2f25c7f410338d31666d7ddedfa67570900e248b940d186b48461bd4e5569a1&quot;
+SRC_URI[sha256sum] = &quot;758fc8c4d6c0336e617f9f6919f9daea3ab6bb9b07005eda9a1a682e24a6cacc&quot;
 
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

--------------2A7D7F58FBA8706EC092EF15--
