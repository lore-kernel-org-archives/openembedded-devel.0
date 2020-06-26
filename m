Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.46])
 by mx.groups.io with SMTP id smtpd.web11.10013.1593184923357335096
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=O5sPKlza;
 spf=pass (domain: windriver.com, ip: 40.107.237.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kx7OTaFGIWv/u0BosD9AcBH2nv3871JZ2CW9KZ0FRHOTIR6UVrmAcPBb0HSfKlMCw46DT6LNuk2hMIK47m/A9KzZ1d9TFkKKU759xlO+NKr6bxhOIH0hzlJSqF8aamaLkq9jg+2wltK4fWzd13U95+Ks0QA86358Lzvsl5HeFbwRNud86Gp4lzmzREb5XFCKaaLysysEaYWLookuWGYJmr5BHEEQ3nHtwBCyPdK6e8tU7DStdhqHE+kPmEA4cFOntHZYNBGeLAbQXGyuQeXUjM43PFwWfFSrqlQBh0TIzN9Mi+1igmRxm470gVsbRmkDbGEvF8s770JmvpXVCpzmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQIHDvTfeFA7aDBHFRw/QdutZFmkyT5VTwb1kC8G4b0=;
 b=oHtMucXsUBqbQhzHPdv1ngzpECfUQ6YNad5NB2Su6ltzYiTTgirEP48ECIPq/wJBhrPwdJqITWTZlkZWL+iRX+RoPtYNfOyqRdseuzMUslbtauY7nFFDqBW/Ozmew35ywfEgtwQ36FQJoFOdacg7Nxgq8OKkYUGFENgI/LrnZaa/E2YCxtYes7WDoyTUsZWv+pJ4XV2ubcl7TtC/kkSHXSLE0t0v38BqLC3NV3ehohSM/N0tMKjiWJjrF9L2co2IVNQ8fb9EBz6T1Da7hxrnuFSxD0lUqIUTKjRfXJ9xAJaL6MEv+YUq8+Dq5xuH/80UERVKw5AtX46h63OTjKH3hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQIHDvTfeFA7aDBHFRw/QdutZFmkyT5VTwb1kC8G4b0=;
 b=O5sPKlza1hfg+cWI9nf5cBeEhd69b8i0h5/wBeWQLEWM5u47+nXFjUGpdreOmgSP05orz4PGBCDBpY7kiG3hZ8bUY6/5lK57fJ/oh8du/g4VVQOe111xS5WUFg+QX0GchB8dQyYNQlu+8pdf+1nnQO81fqqUdqVfdwsg7JdO678=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3682.namprd11.prod.outlook.com (2603:10b6:408:88::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Fri, 26 Jun
 2020 15:22:00 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:22:00 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-msk: Upgrade 0.3.13 -> 0.3.15
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
 <20200622103542.27830-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2537be18-fd90-dbb5-422a-d20ab1d4b0ea@windriver.com>
Date: Fri, 26 Jun 2020 11:21:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200622103542.27830-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::22) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 15:21:59 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfd26dee-14bc-4843-0d03-08d819e4abd0
X-MS-TrafficTypeDiagnostic: BN8PR11MB3682:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB36823D1A3162B818416CA2939F930@BN8PR11MB3682.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zz1EBMwQOnQ2J30tyk7g9QkYqTz/+dzDaeEJNE56B2nqGOUeV2ZMvtpjPyP9RQcesrcHybeHWq9kQjs+OS0g/UDnT+MA1thp37o7IF6mj1R+l9pXQ3DFDkQhzS81+CqN9WNgph/O2iWBSeQp8qoQjinyFJU6LMIXRO3Cnkr3YJoLyIoP7hMpiTcTa07bkPJjdVaTeFQSx2NhglB0IhhGZsVxorw8xeq6kbpTPsUVAd33gYXeiCqTMR5qrJqme+CxsUndicZP4wDX0NSRapbcmpiLCf3xMnFi8mumckbl+d+/8+m8ifGboraywT2BUHnGpyufSjxoWJKdAD81bme1lOuqHmLbjTVNJOdZlQSgRGu7lP3PTmyJhWKMYB42Kc3236DUfvutLv1JbsVBbGpP8ixlZWkeKli+wldW1DmLbMcnEqSzGUdt9owGhaxQhq6W+w2sgdbLscvsF6VpUWLHKg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(136003)(366004)(39850400004)(376002)(346002)(956004)(16576012)(2616005)(166002)(316002)(36756003)(31686004)(86362001)(5660300002)(66946007)(966005)(8676002)(66476007)(66556008)(44832011)(31696002)(53546011)(33964004)(2906002)(478600001)(16526019)(186003)(6486002)(52116002)(26005)(83380400001)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	XBObznOfrLoxt/h1a1J/n5SobvvAH61w/DNIc9e/JTzsPlbIF69peglUNPzeq3Zmuow3CrAqhqbunUeWgzx1jlhohZv+grDCaJ/p1VGs/dqdz7StelIrzn0TD1Xgx1fOin7IJ7Z+JhVphdNKOZDSkUeTf+nIneCAYW4yVQ3pmwxb0bGb4fKoSY+0rljXbYUm2ABYXoxeLD7sYtAXXQszCRzN2Tzfx9oIwZgvP7ZBj+2EuUbNtR+LAfqZK2EhfgLYLVGqz0TtoWB2wVANolbdy9+WnR/wrm1KnlIJLZhTL1nOSwty/3ZqJ+WIAfW1MQl6v0kL66XaXZWyb0hlG+fWKC2d/jmqU0EKeb6BapHjoCiHT5a1gzucxslNi0wTCjaGMDneEwAy83tQ8ORZCC3Od/CbolDq7/vzo+mO8pcctUUAPTMlx3juzT47OS0yCfe8patXB92AYnogZI6EKC2duanmfqCAh/cqe2tqyoHaeRevXbObg3zCpkrxdJxP05je
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd26dee-14bc-4843-0d03-08d819e4abd0
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:22:00.1000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6VW3gzSlK5b0A67tgz/C/qBOYLpTXRyt1cvm6waMP2K+BLIWnxMmPD+NRGbUBnzMRM54aUglfOn2psVl9zkU1d/e/ToCAibORMeovGkwUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3682
Content-Type: multipart/alternative;
 boundary="------------FC2770B6D634E8F6E0615FBE"
Content-Language: en-US

--------------FC2770B6D634E8F6E0615FBE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/22/20 6:35 AM, Leon Anavi wrote:
> Upgrade to release 0.3.15:
>
> - Switch Github authentication to utilize Personal Access Tokens
>    as the existing username and password method is being
>    deprecated.
> - Fix handling of --repo-cache argument.
> - Query for name and e-mail if missing.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-msk_0.3.13.bb => python3-msk_0.3.15.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-msk_0.3.13.bb => python3-msk_0.3.15.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-msk_0.3.13.bb b/meta-python/recipes-devtools/python/python3-msk_0.3.15.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-msk_0.3.13.bb
> rename to meta-python/recipes-devtools/python/python3-msk_0.3.15.bb
> index 3f2aaf48d..af011ccf8 100644
> --- a/meta-python/recipes-devtools/python/python3-msk_0.3.13.bb
> +++ b/meta-python/recipes-devtools/python/python3-msk_0.3.15.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-kit"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://README.md;md5=2f90e43663eddf1c33087419fbb35e28"
>   
> -SRC_URI[md5sum] = "11d9fc865ef627efe68f25fc113974e8"
> -SRC_URI[sha256sum] = "55be86ff2cd0087016759f2b15b40861cda2a8d8a8d0c669fdacdf32a77a10da"
> +SRC_URI[md5sum] = "dcb286c489d24d8b0fb8413835f7478a"
> +SRC_URI[sha256sum] = "56d3557889ee2ceebc72284f979aa6ddd4c7fbe2af31142eb6f51404f14516d5"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------FC2770B6D634E8F6E0615FBE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/22/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200622103542.27830-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.3.15:

- Switch Github authentication to utilize Personal Access Tokens
  as the existing username and password method is being
  deprecated.
- Fix handling of --repo-cache argument.
- Query for name and e-mail if missing.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200622103542.27830-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-msk_0.3.13.bb =&gt; python3-msk_0.3.15.bb}   | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msk_0.3.13.bb =&gt; python3-msk_0.3.15.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-msk_0.3.13.bb b/meta-python/recipes-devtools/python/python3-msk_0.3.15.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-msk_0.3.13.bb
rename to meta-python/recipes-devtools/python/python3-msk_0.3.15.bb
index 3f2aaf48d..af011ccf8 100644
--- a/meta-python/recipes-devtools/python/python3-msk_0.3.13.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-msk_0.3.15.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/MycroftAI/mycroft-skills-kit">&quot;https://github.com/MycroftAI/mycroft-skills-kit&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.md;md5=2f90e43663eddf1c33087419fbb35e28">&quot;file://README.md;md5=2f90e43663eddf1c33087419fbb35e28&quot;</a>
 
-SRC_URI[md5sum] = &quot;11d9fc865ef627efe68f25fc113974e8&quot;
-SRC_URI[sha256sum] = &quot;55be86ff2cd0087016759f2b15b40861cda2a8d8a8d0c669fdacdf32a77a10da&quot;
&#43;SRC_URI[md5sum] = &quot;dcb286c489d24d8b0fb8413835f7478a&quot;
&#43;SRC_URI[sha256sum] = &quot;56d3557889ee2ceebc72284f979aa6ddd4c7fbe2af31142eb6f51404f14516d5&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------FC2770B6D634E8F6E0615FBE--
