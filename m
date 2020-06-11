Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.64])
 by mx.groups.io with SMTP id smtpd.web12.7216.1591881752088816125
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 06:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jxMy4D5t;
 spf=pass (domain: windriver.com, ip: 40.107.223.64, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUFKzfL777hESJNVE5rvuuXjAhdoHMFkZQnRpmPeDJk0wlqLj+BM24n9RYcu2BmLuWl39ECL5tOmrEPHJLqJLNEY/3FTftENqk8bmiUI/Y9zCzUT4gQtwlHeehl0XiMpCSrylHYy1Qd5a5yVdlPTUxhhDjj9OtZpqc2YP9AJ2Wf0Widy3psFF05E4Ts7k8n471IvYehBrfw8KWfTkLrPfL0Fv4TXKFuty1skqbIkQ0Uv1D1BD23GmigDROohDbyMc7hbWtu+neDACZH7T02LxYAuli2744rK9joOTq3q9IPTmqCD7cv5GwKmnumu/fzAYEQWX6mS3wcoSXSIsTa7Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXo+TuXwzXaOulplV+qq816rTFF2lgYmrHLTO6hzGvE=;
 b=BmnRYJUXqgiRPpFDnhZfI6XH5qh1wJu/2S7yhGOFq0j9oxLlITNKgSbabN16pDScK1LjCZJrC7aWF8iODmrnmHIXQG1mzW9N9yIbOLwPMWNsx/kGblJCqHBH9Q1/SiPbTmFHRzxQv8QDySsRcQYrpEi9bCnyKAvaRg+mrhBUjuxwftYBUh6lLCTDNlD9AFF5BlFM2EPCsEeOiH1yTZpIBTJf+umaPI7j19wpzH+sGMCVqGfsxfyVFtycagPNanTgC7VHSCBDaK5ttYkoWEdoWXJiQiBLQuQyKfJspBAUbOceV+5S8LLG6FlzM4ZIC381abbdWVCibYVKx9s6R/av5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXo+TuXwzXaOulplV+qq816rTFF2lgYmrHLTO6hzGvE=;
 b=jxMy4D5tb22L4/7oLJkSOedAFaYRWnp7c0b9VAOfECX8ULAsDWlFrX+pUuRQTmw8tG9GOusId8va8NJrle+WzF6xEzf4I4rUOvzwml6q1cu2Fr/q9GqXVvt9rT3/w5jHT9kHWrMpi71foRA6NzseEaakoRGUS5enJbMRbsGkmeg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR1101MB2068.namprd11.prod.outlook.com (2603:10b6:405:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 13:22:24 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 13:22:24 +0000
Subject: Re: [oe] [meta-python][PATCHv2] python3-lxml: Upgrade 4.5.0 -> 4.5.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200610101914.14595-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6b326fa2-87be-3a12-29f8-785f9b164888@windriver.com>
Date: Thu, 11 Jun 2020 09:22:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200610101914.14595-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::35) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Thu, 11 Jun 2020 13:22:24 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bcd6bcb-3fc1-42b9-d08d-08d80e0a7a9e
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2068:
X-Microsoft-Antispam-PRVS: 
	<BN6PR1101MB2068333D2EA065E75FF604919F800@BN6PR1101MB2068.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yYHp2c5DdPoDCLoJMrg2+6DMqTX1JTHjuzkI5cRPWGbQ8UN451ZV1EtYTB7ygak1IVuMG9ED9V2S0gC1NzZDIL6d6oae7xRROUV3M1QVhClH4mXspIGTvageqhKvX2Pte6EYi2a+bfIOmXPivEuTjBxw6EYzIJ0O27/lSMYcL6bMRT9CIIHMSRKN+szWANrrekTMSjm7YH4otWC6SiL0j1pTcN+rH5GMU4rYOWoyPdXZ/YKxBP1Aclve05+yobs4WL4wlMaMcenfSpD24F+0rA6ceNRJhRmY00IqXdz0KXjmYcOCt6bbqFkOiFx+/a/Een0eCn/qN9Rbl/3uEUIvfTdCAEPm5P6Dvu27C9C/pP+qJccgxHspO4XBKpJb1ZiRZJHozPgz+6MEx86QqOaisjsOwSYJqghNijZH64oHmpJC0MeU0HzktoPxR4KGNHkJuVcB8eG71uH1wT2AQS5avQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(366004)(376002)(136003)(346002)(8676002)(956004)(186003)(16576012)(2906002)(16526019)(966005)(316002)(6486002)(478600001)(33964004)(8936002)(2616005)(45080400002)(31686004)(166002)(66556008)(26005)(52116002)(5660300002)(31696002)(44832011)(83380400001)(53546011)(36756003)(86362001)(66476007)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	O5aV+99d9I5TGv2FoORN/6y5u/Oi3FO7SNleD7aCDLqzqn2i48SbyQyGBcSmh18K2FnTJlNd9yxLq1K2YuY3zPrX45aMfDTNSpSvWOWjc+nWyMFNxPtjVUIqgRX/GfRV78TNfDR95N5ujzPlUb0ti+qazKDUOrnAZVRg6h+/qIYZsg0JvjiYEmVYP3Xgpqw0zPIBY9Opp8/DdFHdCqOTByax68uu7JjvuwTiJeNDXufNAvVqMoEb7sL/E3Wwq3tCe0/gJNvPAtS17aK2+iWmkh3LWAn9zV2DqikRmCzbxTgWcNImN8luzd/iuO0p3lg81++K5eZUV7r+QHHaUqyYPK1+R6EwTnpbWDutojzqNS9pUY0fFFAhP4MYsx5J8Wwfv3tMj8t1JwTgs/4YrqS9EGudwRs6SgYhZawdD29QBt7lZYbh4Z9Kh3+mGqST8eiE5GUu/z0qNMgEa7d9q5Hzxw25xqmYIxxnE8KzveUs0TDDg+Ts8FDaMao+JFBKaA3W
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcd6bcb-3fc1-42b9-d08d-08d80e0a7a9e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 13:22:24.4624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4tfvSeLcZXUjsat+rbPSljRbow+BBwaKjeRv9xnsoeSi6suyj9273Kw8968CpXO1ylCoiDmayn0+Z77aGEUef8QrO2HKA64z+pu9NFQiNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2068
Content-Type: multipart/alternative;
 boundary="------------28331B81DCC31A43E91059A4"
Content-Language: en-US

--------------28331B81DCC31A43E91059A4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/10/20 6:19 AM, Leon Anavi wrote:
> Upgrade to release 4.5.1. With this release we no longer need to
> specify --with-xml2-config='pkg-config libxml-2.0' or equivalent
> for libxslt. Following the recent modifications of setupinfo.py
> to use pkg-config, we just need build without flags.
>
> Suggested-by: Stefan Behnel <stefan_ml@behnel.de>
> Suggested-by: Hugh McMaster <hugh.mcmaster@outlook.com>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-lxml_4.5.0.bb => python3-lxml_4.5.1.bb} | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-lxml_4.5.0.bb => python3-lxml_4.5.1.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
> index e3cfa46d1..a4198b029 100644
> --- a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
> @@ -18,18 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
>   
>   DEPENDS += "libxml2 libxslt"
>   
> -SRC_URI[md5sum] = "f088e452ed45b030b6f84269f1e84d11"
> -SRC_URI[sha256sum] = "8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60"
> -
> -DISTUTILS_BUILD_ARGS += " \
> -                     --with-xslt-config='pkg-config libxslt' \
> -                     --with-xml2-config='pkg-config libxml-2.0' \
> -"
> -
> -DISTUTILS_INSTALL_ARGS += " \
> -                     --with-xslt-config='pkg-config libxslt' \
> -                     --with-xml2-config='pkg-config libxml-2.0' \
> -"
> +SRC_URI[md5sum] = "4d3cca9c0018dd98f39e0ac54fcc3d14"
> +SRC_URI[sha256sum] = "27ee0faf8077c7c1a589573b1450743011117f1aa1a91d5ae776bbc5ca6070f2"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------28331B81DCC31A43E91059A4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/10/20 6:19 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200610101914.14595-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.5.1. With this release we no longer need to
specify --with-xml2-config='pkg-config libxml-2.0' or equivalent
for libxslt. Following the recent modifications of setupinfo.py
to use pkg-config, we just need build without flags.

Suggested-by: Stefan Behnel <a class="moz-txt-link-rfc2396E" href="mailto:stefan_ml@behnel.de">&lt;stefan_ml@behnel.de&gt;</a>
Suggested-by: Hugh McMaster <a class="moz-txt-link-rfc2396E" href="mailto:hugh.mcmaster@outlook.com">&lt;hugh.mcmaster@outlook.com&gt;</a>
Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200610101914.14595-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-lxml_4.5.0.bb =&gt; python3-lxml_4.5.1.bb} | 14 &#43;&#43;------------
 1 file changed, 2 insertions(&#43;), 12 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.5.0.bb =&gt; python3-lxml_4.5.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
index e3cfa46d1..a4198b029 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.5.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-lxml_4.5.1.bb
@@ -18,18 &#43;18,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403\DEPENDS&#43;=">&quot;file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS &#43;= &quot;</a>libxml2 libxslt&quot;
 
-SRC_URI[md5sum] = &quot;f088e452ed45b030b6f84269f1e84d11&quot;
-SRC_URI[sha256sum] = &quot;8620ce80f50d023d414183bf90cc2576c2837b88e00bea3f33ad2630133bbb60&quot;
-
-DISTUTILS_BUILD_ARGS &#43;= &quot; \
-                     --with-xslt-config='pkg-config libxslt' \
-                     --with-xml2-config='pkg-config libxml-2.0' \
-&quot;
-
-DISTUTILS_INSTALL_ARGS &#43;= &quot; \
-                     --with-xslt-config='pkg-config libxslt' \
-                     --with-xml2-config='pkg-config libxml-2.0' \
-&quot;
&#43;SRC_URI[md5sum] = &quot;4d3cca9c0018dd98f39e0ac54fcc3d14&quot;
&#43;SRC_URI[sha256sum] = &quot;27ee0faf8077c7c1a589573b1450743011117f1aa1a91d5ae776bbc5ca6070f2&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------28331B81DCC31A43E91059A4--
