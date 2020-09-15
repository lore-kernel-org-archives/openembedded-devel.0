Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.56])
 by mx.groups.io with SMTP id smtpd.web11.14802.1600180316175259759
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MWdaBZaV;
 spf=pass (domain: windriver.com, ip: 40.107.236.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKObasPi3t+u9QiX3Cyvj7oLy1PV5V/g2Bf7K5Tspf0f/DIzoBADDInrn8XEy8mgMUoYCDK094VT8jWU/xblJDQK7bftr+XhLHusqyf9PRLNFcSAvJDAWGySlZgh8DmZvKeLPBtB1q6AVsuVc0FxvVKpHJBEd/U3owQQpLxx9k6JQ22Gsdm4rOxuyYgRyrrghuQvQrDFHXNctGedS7p7aqS9v1drKEorVlTYk+rAP69ijhHz+RAYTKWXVi7tn/hGMOTlHwbrhKfkN9eo/0XStvsqM7EUQoKF5pnk5WNjyr4cC1tWzA8OSVE/QSDQVZzZbsEIIIsh/EMb0KeLJAwFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=For5entNFh/xeBZ7MOchrlwyKZzKPHMLs3IdgP/KgbU=;
 b=aRgXGogAqNmWn/IxwKc8IEXCqwNKXEZLCKn30fw5zh4yJB32gpFrWnDR8n29icY/Tc5P67JpiqxMZyMpCzDQJ4o0pDuBE+l3W3KsLKNjhW7Q1XCuR/eteWaV4i5oFf1J4jnuFD7EOVlCrDJ7hk018EfUrOsFE+34jTQICrr94vszpnTY4gBY3O1GPyZCsvkfJ6ra3114wi43GR208UBC69jPg2EQhal5ySPx94YbYwGDml5vMJ+jbW9gqK8HSrbV7K2Pd2woVTHb/gxkzI4g0f7INluWZJa6hI+2XNZtNA4lgCX5SGK7rixecqut/ex89rkl9SS3U1Ik4kYHykrsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=For5entNFh/xeBZ7MOchrlwyKZzKPHMLs3IdgP/KgbU=;
 b=MWdaBZaVabZqrvil1PzhJHqvzUt3sLbrkM4cngCHzZecLdDFexf4WroJDwxChT9d2ZyNAQViYc26bb9QTsObIJFBpMDJKxYAoBOLuW86CJs24Pu3G8wYbU/olItbUmmYzN9JZcAcm6ttd9l6GWtU2VPaItfCl/0ib9NeoT9aTNk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3912.namprd11.prod.outlook.com (2603:10b6:a03:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Tue, 15 Sep
 2020 14:31:51 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:31:51 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-nocasedict: Upgrade 0.5.0 -> 1.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
 <20200914131536.6072-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <26e8ed86-5382-e8d4-5833-162bd7a7f754@windriver.com>
Date: Tue, 15 Sep 2020 10:31:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914131536.6072-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::41) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Tue, 15 Sep 2020 14:31:50 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a8fa2e1-0c6c-4d96-e3e2-08d8598415f8
X-MS-TrafficTypeDiagnostic: BY5PR11MB3912:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3912F3B663FFF0A9C1CFA5869F200@BY5PR11MB3912.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nm/4yO9cGJ1AWICWnfQTaGKN6cey6E6AvTpPuOOd62kwqyvyMFBjt8DO/1HevAMoRvQQQgRzQ8xQzBGnQ9XLjU2MBQ4cAzGdgaAL5YgjJvbbU/bpWmAc5S0T74lpJk8QMovVhlnGUecViFbTzn8Et7OFltKijWwrGNnSrfrtiyM5zdl+AY/uLd193x/DCcUE7vjuBnbkGdaznjq5rNObGCmQw3AkmNUH79Ry66Srl2aLNVkezj0IKRJBFH294arLAbiTcXFYVSvh+S1xCwS/AH/JU0WNUKCm/aYTjbHv56C8KDWskwE8iesu5WeFsTN7H8wqYu+JtKv2kXFj33F1fowEE31RGlQXcp8rNth3EMhV3Pnb08Yy049/ZbnMHzR13vABmvk0Qxkd/1vbIHehmdm6zNweYfPxOaR31psORJ3faGLcj1pxb1qzM11Jdm1Cfz+QpCZIMjqXLhlQo2XTIg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39850400004)(376002)(366004)(31696002)(8676002)(66556008)(66476007)(26005)(66946007)(2906002)(8936002)(53546011)(186003)(16526019)(6486002)(36756003)(166002)(478600001)(316002)(16576012)(2616005)(956004)(5660300002)(44832011)(52116002)(33964004)(31686004)(86362001)(83380400001)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	iZ4z7T7ERLiUzKVSAVqt+ES2vTuBKn0HoDUupIz2QWY5seY4hFTKO0YiO5CvMUiqQXYAajOYLcKzQlXhmmX+gTcKTd5IILW3Up8X1HlBserrzYePtYnVHsiH2+nBYDm2CH0RsfH7YPRORVbPLsYy8emaeLj0UEwEo/8LUhKf/DO7f1baqDgcQmdnDJUIklH+M/S92/ZvD+XTTC6d5ZCqIgaH2eOk7ZqVIHYVvV6uaUPSGd3mej9+OIJtcI1D7NHvxPSulu7SYX98zr3ky9uIbfv9gAFgdkwSM9kmi4iyhUvFG39UBNWBmTulQruBUuujjmNM93stRI9uG7IhZsTZE04WokJYVk1EGa/ZfUKwalGPcGfuLXLmEyqvdBfrQK0EN9Fof9s30daWkLFxsJbLzn/LRNQiHyTCoTb4/9t5fva9nAswgFQEy48gqePjre2lHx5y/+0eQ4i1byIfDOH1oQXcRjCZsHo9mWvbC462L8/oq4et5+EdLy8YM+VN9Ovi1Dkgg4UIneUT0gZk0vE328/C9rV6gtHSFpdsAikDPiH4pVBRMklOaB4fbVnvnIHs3V3VZM22de4uuPvSaNiAMZSwpR75ikLhKlCi/OXkC/NUlbkeTYibJQS/EHFKNZKOGNFLf49c2Ik5RXnjsyPLrg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8fa2e1-0c6c-4d96-e3e2-08d8598415f8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:31:51.3962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdJvq/hv4WDvBUiFKoYo65UV27I3grciEsoHhgmj/P7TjLiQEmChm23JibSg43hG3VYdZxqrETePUZtU0V8nSMnmDaqiH33kAxPWtFrmlwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3912
Content-Type: multipart/alternative;
 boundary="------------055626D1851DAB9EB992842F"
Content-Language: en-US

--------------055626D1851DAB9EB992842F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/14/20 9:15 AM, Leon Anavi wrote:
> Upgrade to release 1.0.0 with the following bug fixes:
>
> - Test: Fixed that the reversed test against the built-in dict
>    was attempted on Python 3.7, but the built-in dict became
>    reversible only in Python 3.8.
> - Test: Fixed issue on pypy2 (Python 2.7) where the testcases for
>    update() passed keyword arguments that had integer-typed
>    argument names. That is supported by CPython 2.7 when passing
>    them as a kwargs dict, but not by pypy2. Removed these
>    testcases, because the support for that feature in CPython 2.7
>    is not part of the Python language.
> - Docs: Fixed missing Python 2 only methods in RTD docs
> - Pylint: Accomodated new ‘raise-missing-from’ check in Pylint
>    2.6.0.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-nocasedict_0.5.0.bb => python3-nocasedict_1.0.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-nocasedict_0.5.0.bb => python3-nocasedict_1.0.0.bb} (62%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb
> similarity index 62%
> rename from meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb
> index 440cf5109..dae1ebf30 100644
> --- a/meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pywbem/nocasedict"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
>   
> -SRC_URI[md5sum] = "b1037d65f1f73322c3c2d76681195bb3"
> -SRC_URI[sha256sum] = "ed74b83c7b81505ccaf4b09b0581477fdd5c1099c929098a6a170a91ec26fd33"
> +SRC_URI[md5sum] = "14b405bf7ffe9d0f784aa9c3c39e277b"
> +SRC_URI[sha256sum] = "22840b434e40f20da6d2ccf0821baba54589e2476499b65420b6e4c2e669aa04"
>   
>   inherit pypi setuptools3
>
> 

--------------055626D1851DAB9EB992842F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914131536.6072-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.0.0 with the following bug fixes:

- Test: Fixed that the reversed test against the built-in dict
  was attempted on Python 3.7, but the built-in dict became
  reversible only in Python 3.8.
- Test: Fixed issue on pypy2 (Python 2.7) where the testcases for
  update() passed keyword arguments that had integer-typed
  argument names. That is supported by CPython 2.7 when passing
  them as a kwargs dict, but not by pypy2. Removed these
  testcases, because the support for that feature in CPython 2.7
  is not part of the Python language.
- Docs: Fixed missing Python 2 only methods in RTD docs
- Pylint: Accomodated new ‘raise-missing-from’ check in Pylint
  2.6.0.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914131536.6072-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-nocasedict_0.5.0.bb =&gt; python3-nocasedict_1.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nocasedict_0.5.0.bb =&gt; python3-nocasedict_1.0.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb
rename to meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb
index 440cf5109..dae1ebf30 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_1.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pywbem/nocasedict">&quot;https://github.com/pywbem/nocasedict&quot;</a>
 LICENSE = &quot;LGPLv2.1&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742">&quot;file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742&quot;</a>
 
-SRC_URI[md5sum] = &quot;b1037d65f1f73322c3c2d76681195bb3&quot;
-SRC_URI[sha256sum] = &quot;ed74b83c7b81505ccaf4b09b0581477fdd5c1099c929098a6a170a91ec26fd33&quot;
+SRC_URI[md5sum] = &quot;14b405bf7ffe9d0f784aa9c3c39e277b&quot;
+SRC_URI[sha256sum] = &quot;22840b434e40f20da6d2ccf0821baba54589e2476499b65420b6e4c2e669aa04&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------055626D1851DAB9EB992842F--
