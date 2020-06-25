Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.59])
 by mx.groups.io with SMTP id smtpd.web12.9891.1593090128975035883
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OoxQ/8VT;
 spf=pass (domain: windriver.com, ip: 40.107.223.59, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5HDpegwt8k9oDB5s2q19jxG7rmSblrcC4WuffLpw0qzcNDCoXzeO4/kxHzQYkh0mlmMj3v4kpZs/PrwAeveuK/gJYjQ+ysdF0iu3+8oEP7o9h0rfzUpuy2cJ67N+4SBYl/6b332kGjd47OKaKEiQxziFPvLYYAj4KauwVEWr48E7T6Ry1/MHbhKYsz/jvGdMUn/L+xS/1G5vAuWU53nfR0frT/zWfOSuSGu3MKX5NeAS+w06Nj4EcRtXy+fYabnpzObVjd4bfmvdzbJpqYqOvM8heKwtKAYcTiiFsQkI8sWTmVSm2kKblGZI8hBLm42aOqtDpa+RpAeZcOYZUhErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWe7OQJkleB6Xdc2BgtfMAztk0ZUOXcbCH3le2+u79o=;
 b=iMHqIFAcsL3GSj3lp1oB24t1ebmGKRlHDf5ut5uY+eXwi/Qh8v9tQacB9uWPmzIW4PT2IZh6pyBEqd7U7ZUlTcU7/PNerl2XSJjHbObcvNnEi6Ci1hsgzdND0cODuywoDpMkwU2GsU7V4if7CjNzi2ToR2zcb13g5D1rtBSrYOz2Ay3in9r2Y4NxelugnuQ9+85UYaAoHa88VtJAsnY38sr2cxxDBOz9PPfmMqlJn/jqNEb+cg9xZr3xBNsZ2TOCG7xkb2XsGngJInv34MPoH2sshJ2Iuf1thyTWRNqMnmFAaFXvrqQNp5jY+ulqkroqphxIYPDiOXDOyZ9LFYvbLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWe7OQJkleB6Xdc2BgtfMAztk0ZUOXcbCH3le2+u79o=;
 b=OoxQ/8VT68jQpC+47rHkwOi5xWy7fVAhp88W8nQUlFgZHgidon6eyFWKNE1o5w6rQEcZZEd6GsQO61J0OOQqIJyOQF9/dtIGmQviSiKPttfrZKLWBr8i5j0eD8W7U7pJmSB5RNLeStb6niOMGSmxsfS9k0ucofKhzv2u+CJ87y4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4161.namprd11.prod.outlook.com (2603:10b6:405:81::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Thu, 25 Jun
 2020 13:02:08 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 13:02:07 +0000
Subject: Re: [oe] [meta-python][PATCH 08/11] python3-semver: Upgrade 2.8.1 -> 2.10.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
 <20200623095136.24854-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0722bc39-cc0c-0c47-cbbb-c29054afb773@windriver.com>
Date: Thu, 25 Jun 2020 09:02:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200623095136.24854-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 13:02:07 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a9199f7-9092-4543-7232-08d81907f71f
X-MS-TrafficTypeDiagnostic: BN6PR11MB4161:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4161C5CDDB9828D0372DEBDB9F920@BN6PR11MB4161.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CF/9tluBqqm5PJluQDZWfAHIb/2u6bfRks8ZoOwHwdvk9ACrOO/HMLNEEL8R5kzr5jdBz83VHOMrZGgh/niQqVeOxE2mKhP3PSF4f/WShHRhGWsKVvmvpkEPPUVlVGo8dIksexNFDFbP4FAv2fTyYBnmlfDw262m+4zFZg/hdEL+D4G809vO9AChybI4VRPwqBTb4EzyqQHqefn+whYrvVJ7cyXzF7tLtMsN8UnfDAAMsF3CIiVcBQ76hrBCtVO5qxFjqlI17PivCzD6UfSdWT2v0QQGbXSXvveQRicpRveroaPajpPBH4INyxy0q+L07//G/WG3OpxnV8npAC1X93lvP6yhzsHwI09+EHogN27r0vw+LRJDYX/V7vhuCt92Ry5Vn+LK2NC42a+zf891wSCBMCFcXl/Y4QtwV8/4Fz8AxK08dOzGQ/h1BoECLAKm4IxJqGajasX6fdRFTwDx6A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(346002)(136003)(366004)(376002)(8676002)(53546011)(6486002)(66556008)(16526019)(86362001)(33964004)(316002)(66946007)(66476007)(52116002)(166002)(186003)(2906002)(26005)(8936002)(83380400001)(966005)(2616005)(956004)(31696002)(31686004)(44832011)(478600001)(16576012)(36756003)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	r92EjYXBuRmNw82XZ6ogR8SasybkHClOBWjjfATfB0GkIcdXZwmxsGKW1Z8uGLVYtGrL3nEHRmCnSo/0LdLk44T76uMvkOAQKtT/qu3HpxkjrXAesUJpOvumCxi/ognLnSJzExDYugPrV0XSJ4h+HeSHSO0B4GsJgPdMrvD5I2to1cxlKt4Fd6ZJGzXPbDA/w7bLpTVRU+0oiaQqJuNFUBzcMJ9hgZy0cqVyPXBKSG9qGuvWX/9LtFSs0NfOWy+TPMeNaCMr1TvJw3GMvL4fvbWDzf4NYuZjr/FbQyMdoxAGi6KxwnRD9Pzyr03KW8Z4mmzU97km2Gl7wWSSifQqowa4yRFkAWD3Z95/PlOjolSrHXfSMBSBEVbIYfGr277Dd/TtdfJbCbM1VWkKkpeiUjx39RvJ/39fNm59IioTHEcICDnmYDKwV8uj8lnOvYbc3ZjWJcnPqJLxhyf1++s5RN8W682+fHwBav4f+9I9mSgeLUDmnj+QbQtlGAkH1e7Q
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9199f7-9092-4543-7232-08d81907f71f
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 13:02:07.7408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6r2NVVN/lXGNx17npQLi1zf8h4qsuv0RWj+dTFKIELaMlf9yMssdwaUYkI2dXPMXU+b3ruWT5nd7oDI8CPhI/kS4Ldm7yAkEJ+3RKPQfFSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4161
Content-Type: multipart/alternative;
 boundary="------------F8316F1819899A2200001741"
Content-Language: en-US

--------------F8316F1819899A2200001741
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/23/20 5:51 AM, Leon Anavi wrote:
> Upgrade to release 2.10.2:
>
> - :gh:`268`: Increase coverage
> - :gh:`260` (:pr:`261`): Fixed __getitem__ returning None on
>    wrong parts :pr:`263`: Doc: Add missing "install" subcommand
>    for openSUSE
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-semver_2.8.1.bb => python3-semver_2.10.2.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-semver_2.8.1.bb => python3-semver_2.10.2.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb b/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
> rename to meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
> index a469b23b1..b41ef5ddc 100644
> --- a/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
> @@ -4,8 +4,8 @@ BUGTRACKER = "https://github.com/k-bx/python-semver/issues"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
>   
> -SRC_URI[md5sum] = "dc579ba9d0bb2137bad5324d4bdb7e40"
> -SRC_URI[sha256sum] = "5b09010a66d9a3837211bb7ae5a20d10ba88f8cb49e92cb139a69ef90d5060d8"
> +SRC_URI[md5sum] = "3e11ae9782121e8ffe9f8a8b763a8cb5"
> +SRC_URI[sha256sum] = "c0a4a9d1e45557297a722ee9bac3de2ec2ea79016b6ffcaca609b0bc62cf4276"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------F8316F1819899A2200001741
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/23/20 5:51 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200623095136.24854-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.10.2:

- :gh:`268`: Increase coverage
- :gh:`260` (:pr:`261`): Fixed __getitem__ returning None on
  wrong parts :pr:`263`: Doc: Add missing &quot;install&quot; subcommand
  for openSUSE

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200623095136.24854-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-semver_2.8.1.bb =&gt; python3-semver_2.10.2.bb}     | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-semver_2.8.1.bb =&gt; python3-semver_2.10.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb b/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
rename to meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
index a469b23b1..b41ef5ddc 100644
--- a/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-semver_2.10.2.bb
@@ -4,8 &#43;4,8 @@ BUGTRACKER = <a class="moz-txt-link-rfc2396E" href="https://github.com/k-bx/python-semver/issues">&quot;https://github.com/k-bx/python-semver/issues&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709">&quot;file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709&quot;</a>
 
-SRC_URI[md5sum] = &quot;dc579ba9d0bb2137bad5324d4bdb7e40&quot;
-SRC_URI[sha256sum] = &quot;5b09010a66d9a3837211bb7ae5a20d10ba88f8cb49e92cb139a69ef90d5060d8&quot;
&#43;SRC_URI[md5sum] = &quot;3e11ae9782121e8ffe9f8a8b763a8cb5&quot;
&#43;SRC_URI[sha256sum] = &quot;c0a4a9d1e45557297a722ee9bac3de2ec2ea79016b6ffcaca609b0bc62cf4276&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F8316F1819899A2200001741--
