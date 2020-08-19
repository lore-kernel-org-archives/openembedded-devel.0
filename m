Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.44])
 by mx.groups.io with SMTP id smtpd.web10.94367.1597860436683473443
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 11:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=k3KOyr04;
 spf=pass (domain: windriver.com, ip: 40.107.92.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GC6qp9Ta+7CKo7MmjS1/7Go45GyT7kAe6VU5NbU+apf2uhEGZrgVeMJ0aTjQ2EKorJ1+cKZzbbPy0lPlKzISC1+jVFAryDwcaTgh1dkbLG09jfQOYssByhnsaWzfmng+tVQcayHXu3z8nb+7mUPBFkaU4BAIGClRbdTYk9+iNCM1qJqWBkYJO3cK6RPIpt3PNbqOH0+ooM8HlSYDoKfnT/xDjb6Xsi9Z1SUIWW3u1zNpJvpKCraMIkXC11A3YS2D/hyelrspIXGgBv4JJc77PvsvtPJiIr38tRrG/f/0sCfzibNHGhz1lqZM3FrXZmot/e1M+os0FHVRkB52PSsXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRrl8jLwYT/bbEBz1XwUFBWLXripcTj30ewR3hal5pc=;
 b=BB/bNpidycxGoZJEOlQF2u2wdGkSwQb7c5xdu/XP4wfFcQvXMpvu/yyN9NSpGlry4W/krCpqirmt862fX+5A0FRYAZ6CBwVilYxTRaPwT9bg76z8pAFLpa3CkQ0C1GTMd50VrI+dznZ4lI1bxmNx9I97a02cp6NWAkawo1fIL7hCEfZ8NiVtYmh6xPHK2Dr2gtASEK5MOkP0GQ3+bXlSbWfVU4mwcVlpCjE+ZnO6CW0GqHZnGg2w+HJ+HyLutmnMfHdXcuRQYOo+DuYY3iJWResvRjHExCpTlKgl3fu2ae3fvb1KcYyS7lskiOMTyOTv805/BE1VdbLYeGnyWfqUHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRrl8jLwYT/bbEBz1XwUFBWLXripcTj30ewR3hal5pc=;
 b=k3KOyr04+llS7J/YgTXTaA65ptZA7IeApFJO5IXnQ2rlXUou2uCfxyuNOvhfn7f0Lixm0hlv15cbjGtLI+E08matm1P6xlbDTnqU0W0aDWKRql/IVv0TCWOpcldkoK+hyWC9e067AZjWYNI3cQV6UxkBQ25a6UNp3CR61aaJVJA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33)
 by DM5PR11MB0073.namprd11.prod.outlook.com (2603:10b6:4:67::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.28; Wed, 19 Aug
 2020 18:07:15 +0000
Received: from DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::fb:781c:eb42:b4f]) by DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::fb:781c:eb42:b4f%4]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 18:07:15 +0000
Subject: Re: [oe] [meta-python][PATCH 6/6] python3-djangorestframework: Upgrade 3.9.0 -> 3.11.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200818153444.15728-1-leon.anavi@konsulko.com>
 <20200818153444.15728-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <82ff9360-670f-506f-9c51-328063c46ac9@windriver.com>
Date: Wed, 19 Aug 2020 14:07:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200818153444.15728-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::20)
 To DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 18:07:15 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd99a0c5-ada4-4e28-eb27-08d8446ab426
X-MS-TrafficTypeDiagnostic: DM5PR11MB0073:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB0073C3FD2D2CF5FC7D1C7B329F5D0@DM5PR11MB0073.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:137;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XusjdJCpeVHQavoYguP1JZAZsS26bHyjGhFrQAd8EoS9gfh9Jk+PDNMp4g4Kq4KOW2UT1Ij6zOOXru1jI/QWMf+0hA+9USpOs8cjJm2ijO9jSHpbEBadv82HDEN1vf97iZgrprINgdbP6oGcHoV64ElLCC2ArlM/10ikTLCS1QaM9OHaLBZk12pIq9gF2m0L6qLUOwZZwHCPnegoHE5gcv11bF0BRM0VxL95mKPMOwDgVwKqi3Ay0YVq3VkxKg/aSXKSQciUi6rMVQh32zKm8Y68pfqQ4doAihUPgXGw8Faxp0rxWcGutodDBXv/ZsESOQvW/RtAHV4+vfNqzXOBJ2Mdawgl1myEF71pGSy/23JnkrksKm/hPE2i8bvL3og2IrgfgkzD6SFr0Bv2S5Zrddy/H5N1m2gbzb2rtqTcBbLzEjhI9DZEGzBsbMOsggwkw/NT8BlY0Gkuiqu9maqtf1pamacKvLg4o1hXrj08vik=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3913.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(346002)(366004)(39850400004)(396003)(44832011)(36756003)(966005)(33964004)(6486002)(16576012)(186003)(5660300002)(110011004)(31696002)(478600001)(53546011)(2616005)(83380400001)(956004)(66476007)(26005)(66946007)(86362001)(8676002)(8936002)(6666004)(316002)(66556008)(166002)(2906002)(31686004)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8oDvFnxSyQC16kQZMYd8wiy9yr7p2F9IX7kRalUoRmJSdiAn3NabUkQLHPydov6B6Tbd2vDeHZOGOJjz6NzelhZXP3gDJdL5HYYi1vC0KEx9op2Flmg/LSkC4dzvsY2Ai/LV976Ccb4VMJhOsyxXNHz2KQI4n25byOoOq/qTc5JLwx4+zNtYrdBo1ob/F6fPLUlEl+hSD8CdZZ92y/81IloyoThbuwz2ckDd/KzdsFdCJ4IheRqUnjaNaWb4ugYO8yhK1d6IuFJbEWKDEL1TEAuFwILWVsZh84V4KwlljJCcRhfZH8XmEMJzGku87NwyexPmddI6pERYNvlUIkifoEP448CWsSPvXXZbSm/rvNZZJNFusvWKps5GEBS1I6VSAV5N7ldvj7Rdjq7MvzVWuzCC41IfNEPnZQf/Pc8OIGhSsR+RijVgihNHiTybkmQDupUYgZaaZV8YJIR8qtkpR3/odPM2nz1JzMjoPl6cDhL5DFkyNHM8o0R3j2KDoUjjXuvBd8L7uvgEJRHsPpYHQrc1xxYjqf7N+YCANgAAEvIllTTflUf+0V3CA61KFfeyYvF8T8CYDXqZh5N9e/Z2Gy+4MIO1AbdqFzWbxzbpSuWZD7jGPwBXUm12iKwQ39NZ4zjR/1ygLihmwz/mU5hANQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd99a0c5-ada4-4e28-eb27-08d8446ab426
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 18:07:15.4315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iM/fNNsFFGUHYiD+Vc/+77d1j/LL5rmXNIAsbWlI0ryQDDPvU8q3OctyDXuo990JPZ52lDRpkoOGRrxY51rwhAgS38YbxL1whQ/7RuM+CT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0073
Content-Type: multipart/alternative;
 boundary="------------C750AEBE92F19680F4198993"
Content-Language: en-US

--------------C750AEBE92F19680F4198993
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/18/20 11:34 AM, Leon Anavi wrote:
> Upgrade to release 3.11.1:
>
> - OpenAPI schema generation improvements
> - Validator / Default context improvements
> - Supported Python versions are now: 3.5, 3.6, 3.7, and 3.8
> - Supported Django versions are now: 1.11, 2.0, 2.1, 2.2, and 3.0
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...amework_3.9.0.bb => python3-djangorestframework_3.11.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.9.0.bb => python3-djangorestframework_3.11.1.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
> rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb
> index 438a5e19a..81f55ff9e 100644
> --- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb
> @@ -5,8 +5,8 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
>   
> -SRC_URI[md5sum] = "0d481bf8dbb87bb927b46798edc1a9bd"
> -SRC_URI[sha256sum] = "607865b0bb1598b153793892101d881466bd5a991de12bd6229abb18b1c86136"
> +SRC_URI[md5sum] = "c8ea3e4c3c0d705acf70184faeb2b696"
> +SRC_URI[sha256sum] = "6dd02d5a4bd2516fb93f80360673bf540c3b6641fec8766b1da2870a5aa00b32"
>   PYPI_PACKAGE = "djangorestframework"
>   
>   inherit pypi setuptools3
>
> 

--------------C750AEBE92F19680F4198993
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/18/20 11:34 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200818153444.15728-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.11.1:

- OpenAPI schema generation improvements
- Validator / Default context improvements
- Supported Python versions are now: 3.5, 3.6, 3.7, and 3.8
- Supported Django versions are now: 1.11, 2.0, 2.1, 2.2, and 3.0

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200818153444.15728-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...amework_3.9.0.bb =&gt; python3-djangorestframework_3.11.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.9.0.bb =&gt; python3-djangorestframework_3.11.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb
index 438a5e19a..81f55ff9e 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb
@@ -5,8 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/djangorestframework">&quot;https://pypi.python.org/pypi/djangorestframework&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1">&quot;file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1&quot;</a>
 
-SRC_URI[md5sum] = &quot;0d481bf8dbb87bb927b46798edc1a9bd&quot;
-SRC_URI[sha256sum] = &quot;607865b0bb1598b153793892101d881466bd5a991de12bd6229abb18b1c86136&quot;
+SRC_URI[md5sum] = &quot;c8ea3e4c3c0d705acf70184faeb2b696&quot;
+SRC_URI[sha256sum] = &quot;6dd02d5a4bd2516fb93f80360673bf540c3b6641fec8766b1da2870a5aa00b32&quot;
 PYPI_PACKAGE = &quot;djangorestframework&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C750AEBE92F19680F4198993--
