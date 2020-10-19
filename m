Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.44])
 by mx.groups.io with SMTP id smtpd.web09.12109.1603110637791687778
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 05:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FA9x8aDB;
 spf=pass (domain: windriver.com, ip: 40.107.237.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XB0uPeDPdTUZK1eqeJ6CCv8CXfdhRaavw7EdCcjON6LeY36ONHx3YrPZfoBm3lE/ldJx3y1GJ6ukRtPaAcZ7eFikRufPOyW8kKA5A8dAbJTRIBFTc37t2YpcslK8aSZ3gmRaKrro4gzTBjdVfOA4VgGlKCZse8TDA6ul7++fyg18x+vQXlW4YZzOIMjNtNgr76d7J4Nm13KmRJMeLunjf1Gp8qxcRq4sEgmHi2KzaYYbxXjpGdF4Wds6LrCWcXsr647kYRMMU4l+7KlDong0xZApRE9gs+uqor5bjWqY7PpnbHH15UQOulZT2y3A3W1bv21lGoJsuQfrrwafrrOMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABSkoDZhv/Uu6rwf4/P00BKzhfOCYyIiAuwVD6DnrxY=;
 b=MN3kgYnKMuwzvUh0ydLAYd/zuFFbU6+ENpZYUB8HuMEqlYb+V+oyulWXSWGA01URJt43QD2WcBi1BISCBK0CywsFC1d0UFjQ9Hr8fTF26xLJivDDpcCnXxDF3ZJ/PgzeSvtU3TBWJxlZ5CCB/5D72zB55ZAyvjRuS8CoYHN2Y9FeV5fNgCMZ+CgekMIXP6DO0J9td0ReVC+vNs5+X8L72Zk3lcrcgmeztyPlDumQiIWJpRYKNNnHNW2ZGmiKhFh7IsLFDmYZDTgbq65dFULDz5T/ByeuIlpoW6oEzdqLCLlH+NLkUr36nkZZVbUV1NaKocuP2QFAUqKGrfRJaw/MCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABSkoDZhv/Uu6rwf4/P00BKzhfOCYyIiAuwVD6DnrxY=;
 b=FA9x8aDBehe7ljGptq46ekdGeb6mMI2JcBDp4ryzgMD2uDVgMZB8aGUZTN6BKpXG5KjNuVsZ1DY0JA1qFhPPM7mHw8cE/CrX0TpO8fzt8IyYqAyjIZEC3haAg+JvJqae5ouayULtjGnREq6NrFH3acG/zQm3m1180xDG6YMVEZ8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4323.namprd11.prod.outlook.com (2603:10b6:a03:1c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Mon, 19 Oct
 2020 12:30:36 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 12:30:36 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-luma-core: Upgrade 1.17.1 -> 1.17.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201014073256.9605-1-leon.anavi@konsulko.com>
 <20201014073256.9605-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <801c2a2b-033b-9bc6-b947-5de928602e24@windriver.com>
Date: Mon, 19 Oct 2020 08:30:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201014073256.9605-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:a03:100::33) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR08CA0020.namprd08.prod.outlook.com (2603:10b6:a03:100::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Mon, 19 Oct 2020 12:30:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bd6161b-f2d5-4275-b84d-08d8742ac7d0
X-MS-TrafficTypeDiagnostic: BY5PR11MB4323:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB432387F8996907470915CC389F1E0@BY5PR11MB4323.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:200;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+ktLUAyfshOXfxAF0nf7nZKD8JuCmpIQ5v50JofytPLGdJpFfJwaCNW7UWZG1D2lahsvc5C9bdNFe0eE7Gz290t7Yv359zeczwdmydr/RY1g5Bm0npTwkyC5tlCjzA0/IuB/hxD/6S1zJQZtkHeoXPcPG4h3lYhcuIzS25tOKUfiWVjcYMj2ssgmbRcDR/wLzdlIrHqWwPxzogJiUOU0xKl34hpE4qFKR8qlKz2Mrc9adXrftWtsxkG0b4rwfBSwW2y+KCKKtgVU6WmO2+yE8z8sLflPriUb1hOh9Yty2zumQ23/cYzjS1Sx20s4v/UVFSWz5umouW7eqRsvjWya+RUuRDFUFM5/sPqhif6nh7xpj5VuTTISOcnS18pbEG94x1Qh3H3JVsyhf/01xAy8nSR47sWmyp/rvRfpMg4r7hDGT3nm/m/EaYcLY//4QY2/55GyyyKXD6Cn1Dwrx9jLww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39850400004)(366004)(376002)(33964004)(6486002)(316002)(66556008)(66476007)(2616005)(66946007)(86362001)(956004)(52116002)(8936002)(166002)(36756003)(2906002)(16576012)(53546011)(83380400001)(478600001)(186003)(31686004)(16526019)(966005)(44832011)(8676002)(31696002)(26005)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	iSnZaYiStZfvD3WV0bX9iKUn20cbI1x+qpf8MqIEYY/wNs+EzzZU48l6ZQDoTU4SsfS9CoGP0W38AEXW5RE/VcmnH7o+04CbuqonxofY5egbHB1YrvB2MlGrXst+qCY2EIl+tXarMbTAf5Z0xTyd2EhQPkVK2IIs6Pxc4rn+0J0BI0yBp7gUhGUbLkuBd5jJoHKWbXqRiIJYHGJ+O4OJIQwvCE/g7HgefjtKKCNpyBjFhoTUuTQuWQEperfN9tjh/X7sI9ivcsqf9uIaw2DdJ78WfrpbaLEpg7yZbSJjtvUbnYlwf00Vy745ctjt7tq7pA48T52LpieX3L5t2/x5oNkgk5OsQ23Z8KL3EFN0SmOZysOgYT8BgRNWWkYW6bddINUbe9028Vl1xDcOEw7PMr+HIAlVu1XxKGQuY+NVE1Kzs5L35ohoDVgy8ynS3dk387xcRIJMENwLG/aBuucsqT4lGVf43PZ5PaNxeZDuHgGdRYWbZeH20GpoA+gbTEX/FBvKu2ZA2/YCBc4n2BJcd0jk8bjGUhbEstxg/Or/tFkxJb1Ov8uZaGzJNzkLUlwImGJ1HmGgiQG7nJXBNNf2xE9lgowfI2flDSr8JX+PdfqG0o99NZVlNq369R9IjZxQRtm343lFSG1Nn9r9qa5V9w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd6161b-f2d5-4275-b84d-08d8742ac7d0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 12:30:36.4727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bwntlrkXHXzzk+lThhmhNh/E03MXgAjCUsrHiMmY2FZNJoeXUK2NIaiCyEo2kZAModavYAUEmCg3wpOZ+io344yhWQqWs1qyassPTqyNXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4323
Content-Type: multipart/alternative;
 boundary="------------BD635187E95AC3BFDD798168"
Content-Language: en-US

--------------BD635187E95AC3BFDD798168
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/14/20 3:32 AM, Leon Anavi wrote:
> - Remove SPI cs_high capability (causing SystemException in latest
>    version of spidev on 5.4 kernel line)
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-luma-core_1.17.1.bb => python3-luma-core_1.17.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-core_1.17.1.bb => python3-luma-core_1.17.2.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb
> rename to meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb
> index 9246d1b3a6..97786ff456 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "dea76a83c7130f59b7e807c3b2f1b3b5"
> -SRC_URI[sha256sum] = "b4a9f934f4dbf9b1d5c74259f871b4187aaa754b139964153f7702badaaccffd"
> +SRC_URI[md5sum] = "4e4a5e85ccf19eba001d11d95b33b174"
> +SRC_URI[sha256sum] = "d66b98e23470f023a6423273e9632180a1a941849f1417c69a708ca51861c993"
>   
>   CLEANBROKEN = "1"
>   
>
> 
>

--------------BD635187E95AC3BFDD798168
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/14/20 3:32 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201014073256.9605-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Remove SPI cs_high capability (causing SystemException in latest
  version of spidev on 5.4 kernel line)

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201014073256.9605-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-luma-core_1.17.1.bb =&gt; python3-luma-core_1.17.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.17.1.bb =&gt; python3-luma-core_1.17.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb
index 9246d1b3a6..97786ff456 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7">&quot;file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;dea76a83c7130f59b7e807c3b2f1b3b5&quot;
-SRC_URI[sha256sum] = &quot;b4a9f934f4dbf9b1d5c74259f871b4187aaa754b139964153f7702badaaccffd&quot;
+SRC_URI[md5sum] = &quot;4e4a5e85ccf19eba001d11d95b33b174&quot;
+SRC_URI[sha256sum] = &quot;d66b98e23470f023a6423273e9632180a1a941849f1417c69a708ca51861c993&quot;
 
 CLEANBROKEN = &quot;1&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------BD635187E95AC3BFDD798168--
