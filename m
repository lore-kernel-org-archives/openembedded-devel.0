Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.57])
 by mx.groups.io with SMTP id smtpd.web12.14984.1600180372061353392
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oK6IX6es;
 spf=pass (domain: windriver.com, ip: 40.107.237.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fh9lWeRd6DUGblSIvSLHkcLaDy776zPH+cOc8OET4Hp9cKswHYDvq3hXT1H4/hJwCIqhkz2AkzvYXr3EtF6G0wT5MyYPEQgp2ZEUUA7KN1z/mqsiSSIaS/sahPObhhPogFa2krwc4PAZ7N8cQGgEMEL2h9Sajws36jc48fT2k9S6T5Ds45Gy29pu2o2U2UzDZoPEjQiUeGsc70LkAyMGQ7egHE2joQirvTP+RK0Vr3HAOC3P1PAlxthAyKUddT3lPf6aXviTtbFnC3y+y5SpvpcaZjTLbugY5HK0y5AMRqLxdRKoCEbQuu5BujdiCfQ40XKHdAx1lnoO+HHGqOaZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=op1HGXYQJM/UDho0O58LREDQ+txqRzoVbsfHJSTiFkE=;
 b=JvhBSYoPdNdRKGzMj3KOqVupa6DPckKW/91Z4XAt9crpONjqFUjSUEaUqTkmGv8dzzYx6jtGKu8/VoP2K3UQ5kdpHSXdgn/rDKj8xHkE3SNNpWnJ1L6mLfQtlZY40B7apsR/qozCG2J6pSUNuJPa7XcDrMymlAU25b8Dy7uOxAYcA6MoAw510Roip09bfkF9OJOR80MZ5qnEDPwfT8LF/JOQpYPLcVzUOBWGdrxtBCclmlppvRaw3/L/MHF1gqfQKvu4tTm/Dku4lcQX4Jg8ul+tp8g7di2iXZv8UMXuoSYNw4uhmx0O9FKgbRb2apfllpCD3cJopblsaYJTQVFnug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=op1HGXYQJM/UDho0O58LREDQ+txqRzoVbsfHJSTiFkE=;
 b=oK6IX6essivXKwNGQ1z5ijqGCfl3ep3KQnjWaZRdniJmXv1oe1XqO9JidjyXGEg7xW/yBKJf+ygdnhhQw5JpdhoI2KehS+MjIUD7CewclQRYoNVQdDPKtOW+OGkgbmIhrOlkySdUjylV1gSFzwxFFJO9ftJYdx2sbmpOBX4CaQE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4388.namprd11.prod.outlook.com (2603:10b6:a03:1c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 14:32:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:32:50 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-pandas: Upgrade 1.1.1 -> 1.1.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
 <20200914131536.6072-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ad481925-1a59-6d86-d945-798634359b27@windriver.com>
Date: Tue, 15 Sep 2020 10:32:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914131536.6072-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Tue, 15 Sep 2020 14:32:49 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0583d0c9-752c-47e6-bac4-08d8598438e4
X-MS-TrafficTypeDiagnostic: BY5PR11MB4388:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4388ED31641BCD172F875A5F9F200@BY5PR11MB4388.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yTS4CAvE+zwCwmu5WW3QYPXcWr3E8gHi90OeiH2MhwgDWMVIsjb54K6Ki1syrmzkhyWU9HJ+fHJoZWUz8YBRIZD+OPR+zWHJauSvG10rDqswu6BeCvDO6IQs1eNdDgBuM+puFjegcR/IKn9Nk3fwC4b9qlQW++4tlFBCGgpZaU3EpXKS1v3LSwBspiZ/PaZ+RKMWoXH6G1RQpWjsk/fV5DqaDfLy/tsYKrAr+vO4h85UH7lucy7qZdtH66pD2yJTKVkGoFnmqxsmPNwfySdYQyeZ6CyeBNALgCxShCxXIpgIOnBXzGrkmLliOyu01okToCxQLkJzdvWu31AO/WmA5Rlt55bgg0P9UgSGLM1XjjbNoCEx5zYNR5jJOpmgjZJG/IHXRYT7nLknx2WsqM0D6gE7OI1Os1PYTUiMKhOfPbrwocWemBbzpopVgqQtrA2Vltyrx6nqqg7168ZiYYO5Rw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(366004)(346002)(86362001)(66556008)(316002)(16526019)(2906002)(66946007)(66476007)(33964004)(966005)(16576012)(26005)(53546011)(52116002)(186003)(166002)(83380400001)(36756003)(8936002)(478600001)(31696002)(2616005)(6486002)(8676002)(31686004)(44832011)(5660300002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	6yzIzc/uYSAg2WRG7UcJFf7cvLlx6WtEji0mgl39+1fQsviWEOGaKhXMExqFlsm6hNnqbvviTWQ10tlPCZCxhCQt3ZtEaQDXedrv0vRx8jm+8vcStQJzoulh0h3uirDhTU8XYSbCY8OFDWmygpSVVvpwHOUxKvmAp4xVhL1dGh95DH3eRgpsABS30vvemMWkVw0QKmVxhDb+5cYzAdhkGPn+FHMM5yACzsRd54xIe9aunyshENMD/WlH9GJJQ9dR5kQh0g8ol4SpfGNJeF0+5fHuk/QJm8btGV6PO6HavxnbuRmP9/oXMgr2nlQp+19njIgwy5AnOz1gO6ajg/OHG7+3PQuktyd/gPtEcKu2M8Amm2Mbh76JDiSv9mSE8b7bgCpLaUkZNkquTmYYMC9egd/fsZvUPpnHTsTc+j4R0wJjmmTcpKhM/9Sr+/c1P9Jr0n/3ZeITzrP30OFXyDJReE8pgDKJ3eIMqrSVNvYnMFe70+wiD6+SNTbflIfF0c0T0PzEgqzW1x811NJRuPP/eBRmHp8g+8CV03AOzeLI4rMH5DPKk7ahZDIJ4q8cyeaIMhQm9F/Y41GBzOc9lk28SoZWz5rICyWU2LLq/HKREEar/4ndAguMj2ZIZfMdGtCJ4pPZCmKEVX3XiDNPQhU31w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0583d0c9-752c-47e6-bac4-08d8598438e4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:32:49.9823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nXEyyCrSCBhUjszOd2DLhhGvt3dyfxXZHs+X20Iq1e0KdrpJyGGbJuo8YEZq8dpARAC6ky6TaOM3yNyZmEURCyEFQLmI1MhdjYIOmeCFKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4388
Content-Type: multipart/alternative;
 boundary="------------8A675A7D6D3F9E0D8A282A74"
Content-Language: en-US

--------------8A675A7D6D3F9E0D8A282A74
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 9:15 AM, Leon Anavi wrote:
> Upgrade to release 1.1.2:
>
> - Regression in DatetimeIndex.intersection() incorrectly raising
>    AssertionError when intersecting against a list
> - Fix regression in updating a column inplace
> - Fix regression in DataFrame.append() mixing tz-aware and
>    tz-naive datetime columns
> - Performance regression for RangeIndex.format()
> - Regression where MultiIndex.get_loc() would return a slice
>    spanning the full index when passed an empty list
> - Bug in DataFrame.eval() with object dtype column binary
>    operations
> - Bug in Series constructor raising a TypeError when constructing
>    sparse datetime64 dtypes
> - Bug in DataFrame.apply() with result_type="reduce" returning
>    with incorrect index
> - Bug in Series.astype() and DataFrame.astype() not respecting the
>    errors argument when set to "ignore" for extension dtypes
> - Bug in DateTimeIndex.format() and PeriodIndex.format() with
>    name=True setting the first item to "None" where it should be ""
> - Other bug fixes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pandas_1.1.1.bb => python3-pandas_1.1.2.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pandas_1.1.1.bb => python3-pandas_1.1.2.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb
> rename to meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb
> index 63ae69e3d..1eade9884 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb
> @@ -6,8 +6,8 @@ HOMEPAGE = "http://pandas.pydata.org/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
>   
> -SRC_URI[md5sum] = "bb796b56c276ecea1a6a227010e9c56a"
> -SRC_URI[sha256sum] = "53328284a7bb046e2e885fd1b8c078bd896d7fc4575b915d4936f54984a2ba67"
> +SRC_URI[md5sum] = "b4ce7c64f549ed48b47877fc64281031"
> +SRC_URI[sha256sum] = "b64ffd87a2cfd31b40acd4b92cb72ea9a52a48165aec4c140e78fd69c45d1444"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------8A675A7D6D3F9E0D8A282A74
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
    <blockquote type="cite" cite="mid:20200914131536.6072-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.1.2:

- Regression in DatetimeIndex.intersection() incorrectly raising
  AssertionError when intersecting against a list
- Fix regression in updating a column inplace
- Fix regression in DataFrame.append() mixing tz-aware and
  tz-naive datetime columns
- Performance regression for RangeIndex.format()
- Regression where MultiIndex.get_loc() would return a slice
  spanning the full index when passed an empty list
- Bug in DataFrame.eval() with object dtype column binary
  operations
- Bug in Series constructor raising a TypeError when constructing
  sparse datetime64 dtypes
- Bug in DataFrame.apply() with result_type=&quot;reduce&quot; returning
  with incorrect index
- Bug in Series.astype() and DataFrame.astype() not respecting the
  errors argument when set to &quot;ignore&quot; for extension dtypes
- Bug in DateTimeIndex.format() and PeriodIndex.format() with
  name=True setting the first item to &quot;None&quot; where it should be &quot;&quot;
- Other bug fixes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914131536.6072-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pandas_1.1.1.bb =&gt; python3-pandas_1.1.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.1.1.bb =&gt; python3-pandas_1.1.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb
index 63ae69e3d..1eade9884 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb
@@ -6,8 +6,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pandas.pydata.org/">&quot;http://pandas.pydata.org/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774">&quot;file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774&quot;</a>
 
-SRC_URI[md5sum] = &quot;bb796b56c276ecea1a6a227010e9c56a&quot;
-SRC_URI[sha256sum] = &quot;53328284a7bb046e2e885fd1b8c078bd896d7fc4575b915d4936f54984a2ba67&quot;
+SRC_URI[md5sum] = &quot;b4ce7c64f549ed48b47877fc64281031&quot;
+SRC_URI[sha256sum] = &quot;b64ffd87a2cfd31b40acd4b92cb72ea9a52a48165aec4c140e78fd69c45d1444&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8A675A7D6D3F9E0D8A282A74--
