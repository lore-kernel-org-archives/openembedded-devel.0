Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.66])
 by mx.groups.io with SMTP id smtpd.web12.3056.1591818715325814382
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hqfQ6HQM;
 spf=pass (domain: windriver.com, ip: 40.107.236.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSDGGuXsNXNUaDcnqCF3yvRX8FyKWVe389l4R3QYKolzeLvQgyXwLOpLJCk/WPGiYOe3VzFuvnZjS0Hv81wjWbshe76WnNoL+ZnFa2c9qhnvReHtrm0wDFy6drHMD+8ACmh/825F2hIu87PUbChJH/5Zy5piMXfJJxvKtll/XgYNwRU0/qlYN2efW+ikR/v/IWiqrBmlv07KUY3iwD2KGred4cc58IJ4lTzXHIsB36JJJuAdb6dR2PaadxKJhuL+MZEIxyZbyU9XqahnNvKWfeZWjLEpxWkFY7pFDjKkFhqHzdPHW6IINKaDO31rdfDLDbCikKGJInivk4CN1jA0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bi31EslrasTZmyFmsdtabjz2N2mcFPNxcOwxnaEEkCs=;
 b=by6c2obSl3TzCG6KLuI8tqAv3KFSKUrcFU+U8FrayanfruaEsIv1ICUhhVCPg1bhgWYcBr5JAPhiEbtBYmCXZP2HrgdcoV+JxyfLHEdIIli4D7TAj37YiTCDhDjjDX1Y2amow6S1WqUA1kamwLfL0YrgVmNFwaiaFQhLJs2iQrRT9GbkSSQXlvHqwAq6FSMSlLmSwxghaj2ru2ooDM5HiD/TB1g5cQgIA/g790PdfLcZxKdQ2e3USEml7MUttBoQMwl1d0KSHp1WPrbl6TG3p+QUy/Bc65C2h9+YsKEChkyjujmzpgU1hJmHC0IYTF8RtQh+Qz7MHvAjDgDkKNWbpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bi31EslrasTZmyFmsdtabjz2N2mcFPNxcOwxnaEEkCs=;
 b=hqfQ6HQMnboDvQZhAdSr4cvHNpziZ6xn2tJ0wly33Bum1VG3mCsmgGe36W3ET21tiFIEgsoL0BG64HZnc92DbIyj8LpNcjRRvc3roQMVT1L8mF7ewrBGctZ1yNAQifW3rCDwB1wPVPxTaSQKQVW5a0SF9B5Gp4cqCrQHATwsZEg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1522.namprd11.prod.outlook.com (2603:10b6:405:b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 19:51:53 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:51:53 +0000
Subject: Re: [oe] [meta-python][PATCH 2/6] python3-tornado: Upgrade 6.0.3 -> 6.0.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609111050.32307-1-leon.anavi@konsulko.com>
 <20200609111050.32307-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d5660d21-53e8-a68f-af9c-d226c6f13965@windriver.com>
Date: Wed, 10 Jun 2020 15:51:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609111050.32307-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::35) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 19:51:52 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55c6547c-056c-4822-eefd-08d80d77b8da
X-MS-TrafficTypeDiagnostic: BN6PR11MB1522:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB152221A501C7B3784320A5069F830@BN6PR11MB1522.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CJgJCG5mm5aKx9+GyyXFcO35R7heaAC95Aou6FHHNYYNxUhN8WhMbCfZHZzzPsk+VbocSJHnmzjMK8Hn6I9ga4iNpgnF2vnf5hV3drKCtaXUd5f69NtpkUelnNlJ75GQNh1UiEMgFxiYQDXZYpjyiJjgDDLMcLS7Z4kIe18N6B+UY9GKQkphcZAL/LU623xf8GCbVgDN4BswbqjaeNQLcwX0S9qeqZyxp8PJULPUUGgg0D+CMmlxEMS5RgyjJdM2GPKM7R39xVW1JKosLoq7+3n/uaO7WQrBUOEXgTiZODSPBmlZtxMSohPafZw/nWh9QR2xVsq5Ygv11BP5hmbt0GV+HNmcRecrElxaZqamf1xF8/dOr6tsZBkV/Tk8ImJHdKY8QS8OZcqh0WO/D5IOJS6xcJNgu3XrwmxCqm5p81FDPiPxL4NDdMbaWZdhGV7d//fQ/AbCnRWWUfX86bxJ+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(346002)(376002)(136003)(366004)(956004)(166002)(8676002)(8936002)(2906002)(31686004)(16526019)(16576012)(6486002)(83380400001)(2616005)(186003)(316002)(36756003)(33964004)(5660300002)(66946007)(66556008)(478600001)(966005)(66476007)(31696002)(44832011)(52116002)(86362001)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/I8EXFS1Mqfa9Pt+7ss7Wq/R0yurfM3vUNJ75ItycpQSNxz9SX8+ZbI+eDsT/ZmxqZ34rKiGyPEYQFpYiZ6akn2MRhaOvOPPrOtZCiqqyX5Lk23H2NppMoNoSuls86q2e78szPLtZ+jSeIn6oGdrPN8Mqqq2Z6956DfYdeJq/ce1s+zcOLg6Krv6GzIKku6gGJShdBcPKzEeP/aTISgGboWYIGxMjvRW1+T05KM3No/svd94UtSJ6HFt8/S29nGTDlcJnFGpscpDyHYP3W6phEWGMfuCBe/a7QPQNSo5ChI6OjnCsKM8CyWJSVwm6/qXOt02xRH4LR+Opnn7miNVDU/LI6FQEd5vUlUxTLX5WKkZ0erk7GOEGHKo0esE+Rrzai65MvmpN8qM4BiKVU5FKtErC5fpoQyPVk1CqFZ89+4Zj8gU/3WLi/YJukUX5r5JlXjC5eW0AhCCTLsWlWLsT6JKR4b/MiTEwXPWzLZwedHNtcA9TyixW4VhF2euJG+u
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c6547c-056c-4822-eefd-08d80d77b8da
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:51:53.2077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tkNjtb1wcRlCVwDydSDTlcdkmrwPj5ujE+OZzdmME00coOEev9yxZwqp+Ojluf9bYsKPd+EKv+f/pgKfhAEShNGzaeCRVt2WZ8kUF0dnwTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1522
Content-Type: multipart/alternative;
 boundary="------------AEC20EF25027737D2F10F5E1"
Content-Language: en-US

--------------AEC20EF25027737D2F10F5E1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 7:10 AM, Leon Anavi wrote:
> Upgrade to release 6.0.4. Update the checksum of the LICENCE file
> although the license hasn't been changed and remains Apache
> Software License 2.0.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-tornado_6.0.3.bb => python3-tornado_6.0.4.bb}  | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-tornado_6.0.3.bb => python3-tornado_6.0.4.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
> rename to meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb
> index 04f6314d0..db6b56744 100644
> --- a/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb
> @@ -4,10 +4,10 @@ By using non-blocking network I/O, Tornado can scale to tens of thousands of ope
>   polling, WebSockets, and other applications that require a long-lived connection to each user."
>   HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87"
>   
> -SRC_URI[md5sum] = "cab4b11480f6d032e46465586192d343"
> -SRC_URI[sha256sum] = "c845db36ba616912074c5b1ee897f8e0124df269468f25e4fe21fe72f6edd7a9"
> +SRC_URI[md5sum] = "cf39425f3d7eba9a54287f3e795a2f23"
> +SRC_URI[sha256sum] = "0fe2d45ba43b00a41cd73f8be321a44936dc1aba233dee979f17a042b83eb6dc"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------AEC20EF25027737D2F10F5E1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 7:10 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200609111050.32307-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 6.0.4. Update the checksum of the LICENCE file
although the license hasn't been changed and remains Apache
Software License 2.0.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200609111050.32307-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-tornado_6.0.3.bb =&gt; python3-tornado_6.0.4.bb}  | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.0.3.bb =&gt; python3-tornado_6.0.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb
index 04f6314d0..db6b56744 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-tornado_6.0.4.bb
@@ -4,10 &#43;4,10 @@ By using non-blocking network I/O, Tornado can scale to tens of thousands of ope
 polling, WebSockets, and other applications that require a long-lived connection to each user.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.tornadoweb.org/en/stable/">&quot;http://www.tornadoweb.org/en/stable/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87">&quot;file://LICENSE;md5=d273d63619c9aeaf15cdaf76422c4f87&quot;</a>
 
-SRC_URI[md5sum] = &quot;cab4b11480f6d032e46465586192d343&quot;
-SRC_URI[sha256sum] = &quot;c845db36ba616912074c5b1ee897f8e0124df269468f25e4fe21fe72f6edd7a9&quot;
&#43;SRC_URI[md5sum] = &quot;cf39425f3d7eba9a54287f3e795a2f23&quot;
&#43;SRC_URI[sha256sum] = &quot;0fe2d45ba43b00a41cd73f8be321a44936dc1aba233dee979f17a042b83eb6dc&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------AEC20EF25027737D2F10F5E1--
