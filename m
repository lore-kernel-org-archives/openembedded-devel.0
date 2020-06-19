Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.70])
 by mx.groups.io with SMTP id smtpd.web10.1336.1592588176617827538
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 10:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=M37mB6uZ;
 spf=pass (domain: windriver.com, ip: 40.107.220.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtG9CSKxu7JcP9wb/g5sHGp4RcIkDqzB69SHNUiVS9mWunYFenNvWW9Ewk2WONv6HN3OmY7YoyRlQM16RgNQE7etPW4Biycw+ToZvOjFyQK0FkmKDDqOG8iiLw8VFsUHeMCbWIRi0hGJfsv0If39McYw7jFQTcJvSePAgnTVVoJy/jpj84MgU1F/CLW1kqlRgJ1BY8VozKT1/HZfYN7pdFygtx6uNTZ9SuQDzuAiuwFBCdz9DtCd3MeD5WOtMqIdjQJ8OQ97IvFdkP6xKln0OJQDN5XNA06Qw+2+0a5xOrGOSYj8aHYgbnEdHMncli1WnjqYyD7w195p3l9MeVEx3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKr4XCpau4hc1RIxGPKr1aMqhW72VoxDu7DNUmIRxGc=;
 b=E2ZlAGIltk2W7kWaD9t7V/zLD2NjjCYQFDYH74qOo6ElU6WhmOWax7Gogwx46qzr7I/XWhHyNO2TvoZXWCi61BfeR1HDdw5iFhGvdMNns8lIdacReQMKty0Fbv6JDEOVWGJfw1PFuJjPmc2LUFJJ61bC+RoTohY4zNe6O5lbkrI7O2msxxldFrKxpUruY2aMj7A1flBqvpRB9pIxF/i/hM0Q20EdLHkhozNmt0SBp/VIeITwgdxMKryg8kw36EBwkU936tgvKofzHgTcOQVuPLnayQo1yx8kimiwRG5/mTRBga/kSctbZwANOujJTf3SF824rnxJzGL+3gcSS9EfVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKr4XCpau4hc1RIxGPKr1aMqhW72VoxDu7DNUmIRxGc=;
 b=M37mB6uZaEVA1/SZrtLuPt0HdO4Ii5aAElB7HXFF+DvNlBvP/g1ewMueY71QKHlYmokxm0qm55L42+/PmWbonud3Q9CxHor8rLNKU23HgincWoMxwJeoYCe1cKPiV4CjGx8qPo0KS+45dB2OjSgS1ECdEj1nAORYRSDocdLy3a0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1233.namprd11.prod.outlook.com (2603:10b6:404:44::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Fri, 19 Jun
 2020 17:36:14 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 17:36:14 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-wtforms: upgrade 2.2.1 -> 2.3.1
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <1592401134880.81332@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7950ab3c-9473-de54-5f54-9482bd92da59@windriver.com>
Date: Fri, 19 Jun 2020 13:36:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <1592401134880.81332@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0094.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::33) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0094.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Fri, 19 Jun 2020 17:36:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3efc90e7-8e2c-4289-fe5e-08d8147743c2
X-MS-TrafficTypeDiagnostic: BN6PR11MB1233:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB12333644B1FFCD7BBB67E4CC9F980@BN6PR11MB1233.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ieM7bqIMUS4pfo+s/M4UGGWusnq2l71+Qy+1MklIKea6UqNmAVzNQm7wJFvaY87fqF3DDtLsIuji65S1SJnnLnDMYFhtFpJ9511+Ef0EKg6vuVYhX+QSUxBIEnLCoAbsPwLbNyHQJFTLTRgwMtaXGMpbc5KCZLD1XXyk5ZHec8Zu6ILXj5gU3TO7Xm+d2EXMoyn2M5lhoGtpWMYejBYc/4mlqg1A8xkDy5H14Ifdk8m7W3svF6GWSJx55EOSOCh6OPagvrdrkzlgu+Bp+TD/Yxi4Qt2u+AmoMnCRMV3hoEktTQ/CBZlqc4A0LVABcUhnLaNIj/hpc9vzJJ542/3R4AJutAVcZM9FUmBZ2Y6y6Du1H1j3hXhBcjQOQzdA0wDZUKk5TyozYrxadXMsKVEIjc43Oi1x29WoRYUwlVe6UFHBjuBZaLpSt2Ry+nvoDqb2m5POj18VlUzGCRceMC4rvg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(136003)(346002)(366004)(376002)(33964004)(44832011)(66476007)(66946007)(5660300002)(31696002)(66556008)(31686004)(86362001)(956004)(52116002)(16526019)(186003)(19627405001)(36756003)(2906002)(2616005)(8676002)(6486002)(478600001)(966005)(26005)(83380400001)(166002)(316002)(110136005)(8936002)(16576012)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	N4MEdjQT4hoGKFCGoYmbGHfliqL6yaZ68NFjC09l0TQqc0z4Uz2SbGDqyKF8F5Dav9Nv4tASKMKbW7hrWYqJjPyJHgnGcx9y9r//vzCjm3ZK1+jkcwiwhDtutEPRh53wliOUv5tlaqU6nA7274qDJJyl4jkzzkx+7j2jcIHHEPBiFDqUqLgIRSM549vEEIhzThedG3O/X0UhbdIjTBnVmGjD9FxOH5CNPzyBUtQcyDQHkDnoKgtf3qHPGohWg0zK9PIa1bMQqD9dD81ovVw08P2OM1LMTTTmBEJ8t6JmECB8s7u1EBIQ5rOsf8HZiPatlGrC1bDKmmycV18UzwMgQQbZXr8NcE/vLTwkbYfkrxOzx/y7tYRb8lRqyAMxKpIyFlCatf+GMKrgpoLZpxoBRwm8XgfBQIUcsyMT8nrMfBXnfZw3hKvJNGLTxhpfQkxM35cem0CqollYWgK9J7aaY3nnuOfpHD8ny4B63d9O37ZDA1D3tWtxcCSMfreXk4KW
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efc90e7-8e2c-4289-fe5e-08d8147743c2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 17:36:14.4634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGM/eoczpZnrHArg6w+rCbFspecSzLDmOPTY9IUWsjIuCRIDaegbavLxIa1dhKvoXSMFK68kkaq7+N9UziA947ZMgxDMCscCffolCKNNhFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1233
Content-Type: multipart/alternative;
 boundary="------------577CD12CBA2053F97DA72C35"
Content-Language: en-US

--------------577CD12CBA2053F97DA72C35
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/17/20 9:38 AM, Wang Mingyu wrote:
> ​​Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../{python3-wtforms_2.2.1.bb => python3-wtforms_2.3.1.bb}  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-wtforms_2.2.1.bb 
> => python3-wtforms_2.3.1.bb} (60%)
>
> diff --git 
> a/meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb 
> b/meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb
> similarity index 60%
> rename from meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb
> index 2b7af6267..9f081b68c 100644
> --- a/meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "A flexible forms validation and 
> rendering library for python web
>  HOMEPAGE = "https://pypi.python.org/pypi/WTForms"
>  SECTION = "devel/python"
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c4660c132770d5d0a5757541f6b79493"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=208ce1c159f911ecf389806650582021"
>
> -SRC_URI[md5sum] = "41c0008dbe7bd98892c58f7457a46a4a"
> -SRC_URI[sha256sum] = 
> "0cdbac3e7f6878086c334aa25dc5a33869a3954e9d1e015130d65a69309b3b61"
> +SRC_URI[md5sum] = "bff06943e59671581af07f80d14bda5f"
> +SRC_URI[sha256sum] = 
> "861a13b3ae521d6700dac3b2771970bd354a63ba7043ecc3a82b5288596a1972"
>
>  PYPI_PACKAGE = "WTForms"
>
> --
> 2.17.1​
>
>
>
> 

--------------577CD12CBA2053F97DA72C35
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/17/20 9:38 AM, Wang Mingyu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1592401134880.81332@cn.fujitsu.com">
      
      <style type="text/css" style="display:none"><!-- p { margin-top: 0px; margin-bottom: 0px; }--></style>
      <div>​​Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@cn.fujitsu.com">&lt;wangmy@cn.fujitsu.com&gt;</a></div>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1592401134880.81332@cn.fujitsu.com">
      <div>---</div>
      <div>&nbsp;.../{python3-wtforms_2.2.1.bb =&gt;
        python3-wtforms_2.3.1.bb}&nbsp; | 6 &#43;&#43;&#43;---</div>
      <div>&nbsp;1 file changed, 3 insertions(&#43;), 3 deletions(-)</div>
      <div>&nbsp;rename
        meta-python/recipes-devtools/python/{python3-wtforms_2.2.1.bb
        =&gt; python3-wtforms_2.3.1.bb} (60%)</div>
      <div><br>
      </div>
      <div>diff --git
        a/meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb
        b/meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb</div>
      <div>similarity index 60%</div>
      <div>rename from
        meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb</div>
      <div>rename to
        meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb</div>
      <div>index 2b7af6267..9f081b68c 100644</div>
      <div>---
        a/meta-python/recipes-devtools/python/python3-wtforms_2.2.1.bb</div>
      <div>&#43;&#43;&#43;
        b/meta-python/recipes-devtools/python/python3-wtforms_2.3.1.bb</div>
      <div>@@ -2,10 &#43;2,10 @@ DESCRIPTION = &quot;A flexible forms validation
        and rendering library for python web</div>
      <div>&nbsp;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.python.org/pypi/WTForms">&quot;https://pypi.python.org/pypi/WTForms&quot;</a></div>
      <div>&nbsp;SECTION = &quot;devel/python&quot;</div>
      <div>&nbsp;LICENSE = &quot;BSD-3-Clause&quot;</div>
      <div>-LIC_FILES_CHKSUM =
        <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=c4660c132770d5d0a5757541f6b79493">&quot;file://PKG-INFO;md5=c4660c132770d5d0a5757541f6b79493&quot;</a></div>
      <div>&#43;LIC_FILES_CHKSUM =
        <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;md5=208ce1c159f911ecf389806650582021">&quot;file://PKG-INFO;md5=208ce1c159f911ecf389806650582021&quot;</a></div>
      <div><br>
      </div>
      <div>-SRC_URI[md5sum] = &quot;41c0008dbe7bd98892c58f7457a46a4a&quot;</div>
      <div>-SRC_URI[sha256sum] =
        &quot;0cdbac3e7f6878086c334aa25dc5a33869a3954e9d1e015130d65a69309b3b61&quot;</div>
      <div>&#43;SRC_URI[md5sum] = &quot;bff06943e59671581af07f80d14bda5f&quot;</div>
      <div>&#43;SRC_URI[sha256sum] =
        &quot;861a13b3ae521d6700dac3b2771970bd354a63ba7043ecc3a82b5288596a1972&quot;</div>
      <div><br>
      </div>
      <div>&nbsp;PYPI_PACKAGE = &quot;WTForms&quot;</div>
      <div><br>
      </div>
      <div>--</div>
      <div>2.17.1​<br>
      </div>
      <p><br>
      </p>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------577CD12CBA2053F97DA72C35--
