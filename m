Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.77])
 by mx.groups.io with SMTP id smtpd.web12.1554.1602078476566031158
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2020 06:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ss6PE8uh;
 spf=pass (domain: windriver.com, ip: 40.107.93.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBfTNRDq1GC7TpxEzJoTE1khpXEN4cTglvjzfAtaK0zTcQQNLiGXpiUqmZL0BDipvkGq0ZlmWQiLMHsx7UdtRdDclvi9RrLdVTQLSVYU9ND0v/f6FSP8QOtTGfIZ0UPiRAAOhmHphP97Dk1MNoEagLZRiDXqVG2fI0dxEnb08zOmMO8tdXC8OfMLz9Ujt0wa8s3xES4u/8zaJimYyPkvNXztUqiSyTE3KGJ8kNoILkLC4PISfyGrbv8JQU13c2bQ0yOJddTX3gY9dIg7jTBsOjQ7+exXokRjzOq+yg5zmsxrDfm9ZvlwPiHvn/I+9+rLd1Bud1pNN2oRThfGpg6L1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGon9Ly9jUsO/U0I94bW4Q7oK/e4lfmmyHc9IglPptg=;
 b=LrW0dlPZOoOK5WyqwNBekzSJ10iwsy34UIwigzSXGQcUG0ifnsEpZJK6bdvDYOSk8xMU32KEDBuoMfx3AryRfUjhuavjLnP6T0zySVV+BDnnJ0MKrAdK1Loyovg9t8/fwTN5stWkam1rEjMX4pb3FrdYYb0vXxzL5iBfYxLXYn0qhTvjWajHAgGOTg4n9COtllQVIl/cj0T/Iif1ci+3+GwV0waDWJfxvgJ+lWOj2DdpuBbrY5QNIStLwhAfKJYWpp2H8bWav8DIWL1pZXuadFs9cyI4SSFXT/DezKreCsnE+g/3DMvtlPyZheKPtFuNokIiUhBNC4wQ7YJJuSWmtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGon9Ly9jUsO/U0I94bW4Q7oK/e4lfmmyHc9IglPptg=;
 b=Ss6PE8uhvECKvv7jLSs3ZcyLawjqeVxSpP8HOXnO+PQYMkIozAw5naqeAEWRBGtl33UbMaIJikOPqH2uJvuFn1MzlgAFvF108Eeiuj/aM9sObvdgWTc4Hy7DaBBkbsi1r2akgd4m7fPWzyk9LvAnNFH2sK7PmW3wXonMLUcOapU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2920.namprd11.prod.outlook.com (2603:10b6:a03:82::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Wed, 7 Oct
 2020 13:47:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 13:47:55 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-google-api-python-client: Upgrade 1.12.2 -> 1.12.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201005115507.11563-1-leon.anavi@konsulko.com>
 <20201005115507.11563-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d40b654d-d530-51d2-8e9b-9d440893fd9c@windriver.com>
Date: Wed, 7 Oct 2020 09:47:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201005115507.11563-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Wed, 7 Oct 2020 13:47:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f61adcd-4057-4cc2-b0c4-08d86ac797ab
X-MS-TrafficTypeDiagnostic: BYAPR11MB2920:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2920C5279FC8338A3A1B89EF9F0A0@BYAPR11MB2920.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+F/iMi5we9bQwxUgYJIKbsXgx1x2h3UiawCrHbEc35sJy3T0bNEkzySK9BmYPAtXHK7Z83FcBLhCZhRCkMR9hdtcNcXKech0L2fb1ITO6ybVhVgsgCJtBCVOqlIzBfpVTYIEBH7Caxbt6x8+DdQEr8/TbfgtgynpBKjF8NUl0bNS1J1MtFUK0/JaEjYuKYacTcQ5ZuiteWWLYoxU+5gNOP+8/xGrkGJ/3LvJQ+A+uGzDJsleuJboHNS2ym2HODKoJaKCeepw9vDJ8pSvW7sNXAva/F5OwIISnJfYUARHGEKFE9VYujPc/SoqrMtz+w99dHNUgFVEpDbJJVqybhww1NWuLKoCz4CeSFuKzsGqOE2OpZ9bhubTDHTwmMUKnXyx0DTg0ZqJ/IvUQzwMySkoGfQot2ZROVlp+LOFvZZ+1ZjrZkmaM0pVktU16n/bcLPO7VZwfUOv9vQM3z1wwsS7Nw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39840400004)(366004)(2616005)(26005)(956004)(53546011)(966005)(16526019)(36756003)(186003)(8676002)(16576012)(478600001)(316002)(86362001)(66946007)(31696002)(66476007)(2906002)(5660300002)(8936002)(83080400001)(166002)(83380400001)(44832011)(52116002)(6486002)(33964004)(31686004)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vJNRRwkySwuUeiU74n3JqaQZF0jL8EfkmhTZnW3cZBhe8/uZ/nY4cUWHzwsWz+muosipMhkMOasrYTpI4sXc/jm+dR3mExwAfFn2hGwIAs4UI+DtJURzUUe7tumWScTJeGjHggYDD+7B2KO7kaNF77u0y67JfwtnjglORF0DTAKsUHx8yrPi+xC54kzvVz+edDcYJFLtvVzahurU6/FfTsvx8E0A4ZDhMAf1yME6i/AVOeuvRDTjhDv6Xu/7NL5iKoCLO14R0Tz9sLJNlf3sshHiserS6/GkIBL3oR9BSzlJGF2PAPBZ+uWcAsn76yL9D9k5bEecyL3FnfOD2b4beudfPxhSknJtxa8aeBziC44iO33kBlnO49lWnxphLAwMMUTFjO/hk/II6qdNRGfcpc1D038yIWeMFpj7zwMo+bMWavqOTUf4tOYoX27p07J04ez/6pdkWZKaVoe2TeNwG4kr7vYjcH0Q9A7AAOkDm9aXYBtluzrFCm0SFedrn4zaXludhKD+vgaw5hIZqG1vDBCxXb5Yy9Kqq00af+OintSj3rvklUbihH6SUCLmV/68GSN7Wjh55/ROHt/0UPYwbu+FDfcpblPxJedK9/SoRf8gFJS+EFKd3VFQMTpuZ89n7GKCOSV/o83KcClhviUqBg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f61adcd-4057-4cc2-b0c4-08d86ac797ab
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 13:47:55.1640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p86Qt/KC0EAtsG5VlSZIdZpAGdCWpBKmihrxgMkeEsE9E7F1URUP9whpU9INfWEIEadwjDbD/RLl654EezGJsmKNJkKRKFWStIepq560nhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2920
Content-Type: multipart/alternative;
 boundary="------------8B23D07D36A3C467A05B5907"
Content-Language: en-US

--------------8B23D07D36A3C467A05B5907
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/5/20 7:55 AM, Leon Anavi wrote:
> - deps: update setup.py to install httplib2>=0.15.0
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...t_1.12.2.bb => python3-google-api-python-client_1.12.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.2.bb => python3-google-api-python-client_1.12.3.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb
> rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb
> index 4fcdb66b0d..cf65044627 100644
> --- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
>   
> -SRC_URI[md5sum] = "94d58d98a32b85cf455d8b4f0737b4b5"
> -SRC_URI[sha256sum] = "54a7d330833a2e7b0587446d7e4ae6d0244925a9a8e1dfe878f3f7e06cdedb62"
> +SRC_URI[md5sum] = "24e87dbe11fbbe3d97f23c230f518531"
> +SRC_URI[sha256sum] = "844ef76bda585ea0ea2d5e7f8f9a0eb10d6e2eba66c4fea0210ec7843941cb1a"
>   
>   inherit pypi setuptools3
>
> 
>

--------------8B23D07D36A3C467A05B5907
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/5/20 7:55 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201005115507.11563-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- deps: update setup.py to install httplib2&gt;=0.15.0

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201005115507.11563-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...t_1.12.2.bb =&gt; python3-google-api-python-client_1.12.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.2.bb =&gt; python3-google-api-python-client_1.12.3.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb
index 4fcdb66b0d..cf65044627 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/googleapis/google-api-python-client">&quot;https://github.com/googleapis/google-api-python-client&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3">&quot;file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3&quot;</a>
 
-SRC_URI[md5sum] = &quot;94d58d98a32b85cf455d8b4f0737b4b5&quot;
-SRC_URI[sha256sum] = &quot;54a7d330833a2e7b0587446d7e4ae6d0244925a9a8e1dfe878f3f7e06cdedb62&quot;
+SRC_URI[md5sum] = &quot;24e87dbe11fbbe3d97f23c230f518531&quot;
+SRC_URI[sha256sum] = &quot;844ef76bda585ea0ea2d5e7f8f9a0eb10d6e2eba66c4fea0210ec7843941cb1a&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------8B23D07D36A3C467A05B5907--
