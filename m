Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.67])
 by mx.groups.io with SMTP id smtpd.web12.20340.1593442307661568517
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QWOh2hWi;
 spf=pass (domain: windriver.com, ip: 40.107.70.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEKnCfoTDfOKp1qUHyQjI2bkODG8/H2iixePClaBYhfEIL6zuukUsimfGRvZ0bsTwPvrdJFwQ/g+oPOtU0ISfLrHcpmy+cGX0VrSlquJgnFCYSy97rfh0nau2Pvjis1HEz8m5XFKx0mJ7yirSqB47g6y+ighlzJsoQl8rJxC07jqtrGPtEgVUfbJBclhN22x6NvPgTE3yUmXw2TZo66AYtjfSpYz+bwmsaFKHlBamh4q/c8j2kPMng5qSVKgOII8gPkXCEhshvL/lK16c7YWETG4k+QOdu6jZvuvt/zov+sDrzYagoMbobpCoOJC55ZiGbzLVjPmVmsyU0iG9DXj1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1cnbjjlAobaybOIKzYxIMb85/7K9ideQebuoOkEf1M=;
 b=Mb/Hzp5LWoD/iOO/XlcIlWfp6Li2fUbFVVHxEathG9hcnnDZ7tDhQIsiWUsZjUaKs39kSLLWHsjIz9KEjIPKVxB2mOoqKdKu14/zqf2EWPz2wIU3ukuQgSPMpKan7kpvXNOmgxFY9QWZBmS8OsKwyY+MNLmmgCSeIWtYnUWWsGVr4PdzYGThIMctul3BMlFNqkL4orBb2BxjHQ3gKf8cKWiuyjMZY+GitmAsL5kCWfRan/w/0s0ViOgcbpyOX9SnH5eX9yvvey4Js/4e8B+zPiE9jLITwIgtYquA4eoYohaweF7u7mudj55fykmW5ryHcZuBuBCo1GSdq7EoOAWAMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1cnbjjlAobaybOIKzYxIMb85/7K9ideQebuoOkEf1M=;
 b=QWOh2hWiQm5/b80LC75YgSOhF9mjJHGSsgBO53drPs9nMlaaHZbItMTygCRDEVLoiIaOrz4uDtVHi4kixCdNWtnnxawq3cmpnnMzu5LObJ6F+AHCmLchyVBpjcU+0Nnr4nfQG8xoB1wovft6+/rDjYAoyeBv4/aQAL0lMBGv0kI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN7PR11MB2577.namprd11.prod.outlook.com (2603:10b6:406:b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Mon, 29 Jun
 2020 14:51:45 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:51:45 +0000
Subject: Re: [oe] [meta-python][PATCH 06/12] python3-sqlalchemy: Upgrade 1.3.17 -> 1.3.18
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
 <20200626112944.25569-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d4b0d2c4-155d-ff36-8e5e-bb4609d0f046@windriver.com>
Date: Mon, 29 Jun 2020 10:51:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200626112944.25569-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::44) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Mon, 29 Jun 2020 14:51:45 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 833bcfc6-e194-44aa-2c60-08d81c3bf182
X-MS-TrafficTypeDiagnostic: BN7PR11MB2577:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB25771EBF3DA45FCBE3E3F2719F6E0@BN7PR11MB2577.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xV/rU9++d2a8CpyfclibuzQ57Opf2ANDWWPBDS75ebdZ+AD+1rYDkFaj7Oi9rkQmvf6a84ITMqJ9x32lWUIcrCpTBKYfQVeb1P0KWJGMb4Q1yzoRb1F8wDRYErIETTUma4yNu/KkTb7uPJ9JXN93gIcI7KKI6t3rYhDTq+OSQOlwHpqOBfiFCMPNoMw7YkWWx9d7KmwP4GCZ1b89SgT8ZHxRj5PUxO1xVhzUMMgJFxqfT3IlAHgJxsyJRgJ42ORi2B0KtbKeYEckkcN60QVuQ8yca95iu0fVHKYdvJdZn+gwRMI9HlUMQZOxGgCuZuGoBwsNe+7GIeggemBFhlQmW8jtymjk2s+rnveSGvumeiDvgWrdmKI4qGjFIYksDEkZzHkn9h2jJF3/70HZXOALPff3if+IanYjVKfCJ3qsf1OKmGi8xyW1CSKJX9ludwbwg2jBNiCavrjNqgFiWXy1yQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(39850400004)(366004)(396003)(83380400001)(66556008)(86362001)(31696002)(66476007)(166002)(16576012)(316002)(186003)(53546011)(16526019)(52116002)(8676002)(33964004)(478600001)(956004)(5660300002)(36756003)(2616005)(31686004)(6486002)(66946007)(8936002)(44832011)(966005)(26005)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	HMNRyLm810Es8OnRqagf+Nvc89BkMhFJxbP2isUHGSnE8jTU6v82PDe1KX4SeFMbXIeS1tT6n+mug1jwfp9XMgdMnH7qJ0n4+IcgffAsDzVpchuJdQHk+dUJWzDPDDuhVcl/NdV6AU/gshQRpM1LGKnpukX+TOh91ehIu7UXPmBd05TbqpDRi8K/wsdu1DSBqzAbftWIsKAOVideifkg4XpkrpGb4akQ1wOQGwHl5wNi8hC2xAfaryau6bmmpSr2349XGrLMD4B6NkhYuF5h0O2jQJkh6aOQhX72WJhSdVRTjCrYbOvXFJYA+gnhNyaMyIOViilmnARSu7Ef+XVPLEmqzFErml70zpTrewOxoC0DyrwVMsjyQL1JcPBrDdzqoYZvRv/0FPcYv6NPPyzaQolP7sIACtXKhuoNNVVpYVoEFKftJLPQmwhwgTXvLnzM/aX/QG974SbcqV7bbyccJprdUVz7ywokrU4wMIxPg74=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833bcfc6-e194-44aa-2c60-08d81c3bf182
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:51:45.6041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYnk3Y++85dmgqABw5Aah6ymhdqyNtgeTa6H3kz50I0aPDUTZzq/3BPA/z84ETsQFaxQVc8CcSqKRY7kGcstVJLDNNvG/DynFB37v1mv8LM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2577
Content-Type: multipart/alternative;
 boundary="------------E0F146F3797A06DB3CEF6102"
Content-Language: en-US

--------------E0F146F3797A06DB3CEF6102
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/26/20 7:29 AM, Leon Anavi wrote:
> Upgrade to release 1.3.18:
>
> - orm: Improve error message when using Query.filter_by() in a
>    query where the first entity is not a mapped class.
> - orm: Added a new parameter query_expression.default_expr to the
>    query_expression() construct, which will be appled to queries
>    automatically if the with_expression() option is not used.
> - engine: Further refinements to the fixes to the "reset" agent
>    fixed in #5326, which now emits a warning when it is not being
>    correctly invoked and corrects for the behavior. Additional
>    scenarios have been identified and fixed where this warning was
>    being emitted.
> - engine: Fixed issue in URL object where stringifying the object
>    would not URL encode special characters, preventing the URL from
>    being re-consumable as a real URL.
> - sql: Added a “.schema” parameter to the table() construct,
>    allowing ad-hoc table expressions to also include a schema name.
> - sql: Introduce IdentityOptions to store common parameters for
>    sequences and identity columns.
> - schema: Fixed issue where dialect_options were omitted when a
>    database object (e.g., Table) was copied using tometadata().
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-sqlalchemy_1.3.17.bb => python3-sqlalchemy_1.3.18.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.17.bb => python3-sqlalchemy_1.3.18.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
> rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb
> index b9c58e5b6..a5e1737b0 100644
> --- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
> +++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2"
>   
> -SRC_URI[md5sum] = "478214152b9293bf5652815d7312c890"
> -SRC_URI[sha256sum] = "156a27548ba4e1fed944ff9fcdc150633e61d350d673ae7baaf6c25c04ac1f71"
> +SRC_URI[md5sum] = "96e085d318297b1ad36ef2685f54287a"
> +SRC_URI[sha256sum] = "da2fb75f64792c1fc64c82313a00c728a7c301efe6a60b7a9fe35b16b4368ce7"
>   
>   PYPI_PACKAGE = "SQLAlchemy"
>   inherit pypi setuptools3
>
> 

--------------E0F146F3797A06DB3CEF6102
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/26/20 7:29 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200626112944.25569-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.18:

- orm: Improve error message when using Query.filter_by() in a
  query where the first entity is not a mapped class.
- orm: Added a new parameter query_expression.default_expr to the
  query_expression() construct, which will be appled to queries
  automatically if the with_expression() option is not used.
- engine: Further refinements to the fixes to the &quot;reset&quot; agent
  fixed in #5326, which now emits a warning when it is not being
  correctly invoked and corrects for the behavior. Additional
  scenarios have been identified and fixed where this warning was
  being emitted.
- engine: Fixed issue in URL object where stringifying the object
  would not URL encode special characters, preventing the URL from
  being re-consumable as a real URL.
- sql: Added a “.schema” parameter to the table() construct,
  allowing ad-hoc table expressions to also include a schema name.
- sql: Introduce IdentityOptions to store common parameters for
  sequences and identity columns.
- schema: Fixed issue where dialect_options were omitted when a
  database object (e.g., Table) was copied using tometadata().

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200626112944.25569-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-sqlalchemy_1.3.17.bb =&gt; python3-sqlalchemy_1.3.18.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.17.bb =&gt; python3-sqlalchemy_1.3.18.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb
index b9c58e5b6..a5e1737b0 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb
@@ -4,8 &#43;4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.sqlalchemy.org/">&quot;http://www.sqlalchemy.org/&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2">&quot;file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2&quot;</a>
 
-SRC_URI[md5sum] = &quot;478214152b9293bf5652815d7312c890&quot;
-SRC_URI[sha256sum] = &quot;156a27548ba4e1fed944ff9fcdc150633e61d350d673ae7baaf6c25c04ac1f71&quot;
&#43;SRC_URI[md5sum] = &quot;96e085d318297b1ad36ef2685f54287a&quot;
&#43;SRC_URI[sha256sum] = &quot;da2fb75f64792c1fc64c82313a00c728a7c301efe6a60b7a9fe35b16b4368ce7&quot;
 
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

--------------E0F146F3797A06DB3CEF6102--
