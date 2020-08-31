Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.60])
 by mx.groups.io with SMTP id smtpd.web12.52773.1598879607008507802
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 06:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WYxLHnUp;
 spf=pass (domain: windriver.com, ip: 40.107.243.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQhNwHkk1s+J9U08IVzj3GnvP2FD8eZEHhiIyp98EkGOgRowYWtWxyWzzqnnmem+NVjQ0kBDknh1WM7BYqDHP8SfSO7f/7ch030xoBbSc+MSgOPRKn7uRO3Q8IjAmlBfBt3X3Fy2kLqpBR5KoIMqhcOWJfdwrnnigpAE8G1IpEat7+fzgt2aQlAldzb252URSr+Dn3PCqgiAaV3cBK3ReJBwIsmMGzN36avHxPLDFPpIrYDdrYdoSCMAPlsTc8l+oHHQ4nxIb6LGhcYNFXsIEQpooOgiaTVTcnClkn1HLLQ/mygluBHi17xk/9svMnRsgWOkvi6Y07/QxLRTVfXE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHl9R24T8C2DuJ5rIhdDJbOfY8l3JXCpihBC4+fcI0A=;
 b=fgkrRY+gU2QlvJspFqi/W8D6p5q3zRrKBSqumBf9rxneK2OMXcO/0BXW0PDiD38lu37bwXfwG1Kbg9xXdxIYiZqIJrgknaSDGG66O9Q9779bU8jWXME9ZzGZucpx7th/kJViImLLG+caice68vx4blNwzg4xGNGz0VmUSVHil3ugODLYBIJTiQOc+20V1ZYxdXYM4BwppOvo06E1MmeE2+4UMcocErd06PjhYAa6ZlsHcZUujX/m2FEqDnnfChhjxOz4zOOXtHUTsnx2XlQBaDqPOrgD2E5gZc+WaLptTkh/SbypK4AfuhcWWw4msjIdoN2k4mANmtjzJVBLrzfqpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHl9R24T8C2DuJ5rIhdDJbOfY8l3JXCpihBC4+fcI0A=;
 b=WYxLHnUpD3MyKIaPNr7kmGXpI7aa78D0PwcYM82yYxmUYOxUj+Xu1WejP7OM90G37yl1uOvStcjP0I7nJg9p8LRPPedaAHyDLKGtd/eM5+nO9Gupj93qqWRH39cas5U1ss3y2LHk2ttixaA+B1ONt5BMB24v+St/XijNNUtDLX4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Mon, 31 Aug
 2020 13:13:25 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 13:13:25 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-flask-sqlalchemy: Upgrade 2.4.1 -> 2.4.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200827145504.29147-1-leon.anavi@konsulko.com>
 <20200827145504.29147-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <77c42ddb-af82-606e-2e01-69fec411219b@windriver.com>
Date: Mon, 31 Aug 2020 09:13:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200827145504.29147-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0079.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0079.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 31 Aug 2020 13:13:24 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: baca5e63-3472-4b07-7ca1-08d84dafa4d3
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB42261063A2588ABC9A7943E89F510@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:49;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SRs/UKg4To8d89DjbgzI04qmwog423iACemM433D9ym7T5O9QeSlrthxKE5tu60J4h8LjC76oiGHzmqPgDDAl3F8yalmYiRNFkzBvFP2f1UDUKelDQwLJ2JlT+K2ca2MEL5YaOf4NIoA2zDjdypnaRAOMhUBn66GJ9ZvUTd6+L0d8TUhWah6rRZtr6Ca2HqsF8zTk/lizNl2Myy2XZXX8Ng+RS3fmSIuWa4gmjeuvoQPiVrzaPms35ny5RLSMbKRQj8m8RkdwpsaOafdDu+bbRuSy0xxSSxV+obFU6VbpuzecwWr/D1FhpRX3J6nZdcFqpE62wtdbB8B060PQXc2EZefVtGgCSB3hAQn1TCOt5NeKCIDHVsdEn7BCgXjfZSSbx3IdF/AiHdQ4icORcuMxTJjkkokQRnHlDb2hcVA9m7+A1dTROqbXLFtHJxSAAXo1YwvdXBBsouVzEA9nJXGXg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(39850400004)(396003)(186003)(8936002)(2906002)(966005)(36756003)(478600001)(8676002)(16576012)(66556008)(52116002)(83380400001)(66476007)(5660300002)(26005)(956004)(2616005)(44832011)(316002)(166002)(66946007)(31686004)(6486002)(33964004)(86362001)(31696002)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	63RzGuhAyoY7Idh3adqqOZq71SsZtuTDNYTS2MA3r7XViZYoChs4QjJdXa4PBWlEia5Uyb7ajfoLoTmWaQNvl15t6HtK3jlvJKuJPUQyeCKn6zB6rkg0RvKqru/HTYpQDyBZg56m33+czZ7Q8j2OSujxtdY4KTxUWuDwkjr+aeF2yRsh6Iy5MYK3OxaC0p0p/pyONiydxFM3hz5gstPeulGDtrKOhok0V60hGyDSQmnmNup/C9LJyvwsGTKy8ui8jKo4GwisMjYcpBf8BrZfBLRINPuoC/O8Z37iD+TNea5Hsi791DJd1tz1EpCqkxAgm6JBe5uTgiqaHYlgDQ+NYxDyu90N5wyfdC8cui5hsfIAJYp8gxHIBhJ5BC8xCCswQK3831h1Dntet/niABpxbRdGjixpn61I1bQHw/Mti+K+FcrFTdThu9qcCKDu+hTlc6i29Hx7dDO60j1ESDm8Pj9VktJZUkvpxZRcRJCNIksSKpRLqsOew0yMYPiny8smGc9sf3QfqOS4i1u/tGrvZ25c6yn8ISIivHrBQzLfxqwpR1pa/w45AlG2QsxgCWvDuATEVpquupCkCCAy3pun7YsxnpwRHtnEbEXyeUzOrYWgE8d0PueBGt3T/yPvpVGw+q8xTUz27Hota0qJORCCXw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baca5e63-3472-4b07-7ca1-08d84dafa4d3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 13:13:25.5612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDpLkIVGOa8QU6vexaR72HxYDLO/s/ox+nMcQg1TgCoJcUBBl2aRGPLuYFddYcH+LX7Z9Qk0G4UhMc6t9jNv112Z/FkPWPXEB1dnBjnvEmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: multipart/alternative;
 boundary="------------FB73743FC632671A8370425A"
Content-Language: en-US

--------------FB73743FC632671A8370425A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/27/20 10:55 AM, Leon Anavi wrote:
> Upgrade to release 2.4.4:
>
> - Change base class of meta mixins to type. This fixes an issue
>    caused by a regression in CPython 3.8.4.
> - Deprecate SQLALCHEMY_COMMIT_ON_TEARDOWN as it can cause various
>    design issues that are difficult to debug.
>    Call db.session.commit() directly instead.
> - Fix bad pagination when records are de-duped.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-sqlalchemy_2.4.1.bb => python3-flask-sqlalchemy_2.4.4.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-flask-sqlalchemy_2.4.1.bb => python3-flask-sqlalchemy_2.4.4.bb} (67%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.4.bb
> similarity index 67%
> rename from meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
> rename to meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.4.bb
> index 2c6110d0b..2755c7d6b 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.4.bb
> @@ -2,8 +2,8 @@ DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
>   
> -SRC_URI[md5sum] = "1f5781cf3e1a2b1aabda47a5b20d2073"
> -SRC_URI[sha256sum] = "6974785d913666587949f7c2946f7001e4fa2cb2d19f4e69ead02e4b8f50b33d"
> +SRC_URI[md5sum] = "63a522cb82a75292dc8bc77b6d26187a"
> +SRC_URI[sha256sum] = "bfc7150eaf809b1c283879302f04c42791136060c6eeb12c0c6674fb1291fae5"
>   
>   PYPI_PACKAGE = "Flask-SQLAlchemy"
>   
>
> 

--------------FB73743FC632671A8370425A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/27/20 10:55 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200827145504.29147-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.4.4:

- Change base class of meta mixins to type. This fixes an issue
  caused by a regression in CPython 3.8.4.
- Deprecate SQLALCHEMY_COMMIT_ON_TEARDOWN as it can cause various
  design issues that are difficult to debug.
  Call db.session.commit() directly instead.
- Fix bad pagination when records are de-duped.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200827145504.29147-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...-sqlalchemy_2.4.1.bb =&gt; python3-flask-sqlalchemy_2.4.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-sqlalchemy_2.4.1.bb =&gt; python3-flask-sqlalchemy_2.4.4.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.4.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.4.bb
index 2c6110d0b..2755c7d6b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.4.bb
@@ -2,8 +2,8 @@ DESCRIPTION = &quot;Adds SQLAlchemy support to your Flask application.&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75">&quot;file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75&quot;</a>
 
-SRC_URI[md5sum] = &quot;1f5781cf3e1a2b1aabda47a5b20d2073&quot;
-SRC_URI[sha256sum] = &quot;6974785d913666587949f7c2946f7001e4fa2cb2d19f4e69ead02e4b8f50b33d&quot;
+SRC_URI[md5sum] = &quot;63a522cb82a75292dc8bc77b6d26187a&quot;
+SRC_URI[sha256sum] = &quot;bfc7150eaf809b1c283879302f04c42791136060c6eeb12c0c6674fb1291fae5&quot;
 
 PYPI_PACKAGE = &quot;Flask-SQLAlchemy&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------FB73743FC632671A8370425A--
