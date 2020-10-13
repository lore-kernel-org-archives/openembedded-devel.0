Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.55])
 by mx.groups.io with SMTP id smtpd.web12.9229.1602632553477604675
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 16:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=db25m2ek;
 spf=pass (domain: windriver.com, ip: 40.107.236.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3blPo1FSZFK8RxbuiOvA03FcwkhmyPMQ8ZecnfvUcZk9OmfBqHI0BRIxyF8JhP8V7/o2xGr1nbI51lNDJQ6+rDa/8og0HD/GmiXLDa3IA8pZNuIupgTfxDjT03XBzCc88hMDrBOUbThGr+/ja6QW1pvOtd0AENZdO4VG4IOeoNL3710Pxb+udWkn5HKBJ1l4gkuuJwJ9cYr/mXHOgo5w/Sgo3lMJql1h1pBFCT6AJ0wXKPvg6B65+fxxuQIAOLCy6jL3GA7v4dLcUhKe9cpfsmhmggW2uFzzM8050wdSHNu3Vca0a31+UdmaJ9abiSVclArBOdOcBmuK0SU4IeKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eO4rVg304fRgsgBdBkvYDjlitoOAuvkLMY06Ickm74=;
 b=OTK4pdJwZY6niJpAu/X/I/gzVvuloRyPqYc8Mt4nYNJR8CjJrG+d2DG9KbPIj67YzDrdwrWgK2ileC/0SIcH34J/xMe6P6oG2HGXDCJWwG+TfqTl/aV7LG1+KymuB9iN32w/qlZGgNeqsAVD0EReCUslxTc/9JTEVq15ZylKKP7NHMM0V/90w+UJwXWMct6O73NyoDcVXuieN/k3oCFk4XpQYr2hBH3e1E+o3IRHN+xa3/E4DJX+K0sPcx7wXVwCTLYtFWsWsHlMCYNI8KbNHWbaMBQ9ycVPBMRbDzEy8XtSnK4tMNIR3mXkuEp6kz926ebL72x31nQ/Vz0aIbRlug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eO4rVg304fRgsgBdBkvYDjlitoOAuvkLMY06Ickm74=;
 b=db25m2ekLyME4JmjZaX0O21XPhmt6h4gHWbZgTYFseR182vEaU/N+OnlgHG30+NCVHk8JCGfnEWrDICKnuYz5p5FlIpvGQ07yehVpHa7Awi4pKOlOcoXLCJ+eJz2f3LqiAECHVNm4cIPLhjgefNwibsvh+Y7nLU/2WlzxWd/YF8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3445.namprd11.prod.outlook.com (2603:10b6:a03:77::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.27; Tue, 13 Oct
 2020 23:42:32 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 23:42:32 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-multidict: Upgrade 4.7.6 -> 5.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201012140022.15761-1-leon.anavi@konsulko.com>
 <20201012140022.15761-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <47bc7921-edfc-8062-9b5a-719393f4a06d@windriver.com>
Date: Tue, 13 Oct 2020 19:42:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201012140022.15761-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BY5PR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:1d0::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Tue, 13 Oct 2020 23:42:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d604149-accc-4b2c-fb5b-08d86fd1a6f6
X-MS-TrafficTypeDiagnostic: BYAPR11MB3445:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB344513EFBD8CCBD86929A5849F040@BYAPR11MB3445.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YCCyAdCU2BzE3av2CA9+vy5/CVfaJbkYOlHmK1i06U3rF4fWYtVY2BkGrqFL5KumsWDnd/bmBo+Nvjt2UPXJV04OzMfXM0CLucPA2CE0ootCsCsLr86mPLzGNwXRNxMuaRLjU1DOMK/JvGjxbwcOCgUQPx2tD2tB/gmyQjndvqOPnFVxdDpe0w6L+Et7lVGE0miTcN7tjwCu5DejmE/06WHloBbOKf5ratrIZSQ5QIeXBTphmTcRHBye6z4QWVEBCDt3Kk6GuGLQeXcIqvsm7mA/uq+116Al+r8TWTNodiuC6+6Mwz0hVkI+QzAux0rFCqflzOcUlrmXB/PmbokRQ3MX8SClS2Xb2YrX08yPfe3hhqNUmuDOskznAO0X63l1X9D4wmewjgZyZY3ihQkLS030kGXeyQLTFg4CGyBMs5feuaSkYXWkmoEraCyUrHdyHkEaD7K0m5vHsoWiW15kRg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39840400004)(136003)(376002)(346002)(396003)(16526019)(44832011)(66476007)(186003)(8676002)(31696002)(16576012)(66946007)(2616005)(66556008)(316002)(36756003)(956004)(966005)(86362001)(52116002)(6486002)(53546011)(31686004)(166002)(26005)(83080400001)(33964004)(478600001)(2906002)(5660300002)(83380400001)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	In/XPC1sDl42w3hmrlfnKzIs6HVdDTNqb+nT0BlvQ5CJynKZE8gihfQ28w+DUvSiVEzE4kx1Nq29jHs4XoH7p1Vmf01VcXYGeEDPSLNPpvo4wqM2zHYgWhicoyASF2wvtHoFg2DKnv0HovSRAd4lPj3PJhK1Kp3CAEi0FlIcgnAlTAz3x/oMUi11OrSrP8e91ASV2RFb12j07lZuNwrbu2McyA4tFwA3l+Lz0WcswnHK9pBfNMuct2jOKsvugcE4mBJPwGn5ao0cLcV7MpsNP9w+PO5bZreQniuCa0dCRKh60ONyPVhByEeXdfnyZFEn8jmVlF7S5mj9kaD4V0hpcnz9iMo10AuuKdTuYZ9c6qVlg+sIIGsgYgTMCurdSgjPBb8NSviNQJGRpzxIzmswNKzjwAhtH+4Lka2ahaU9cdc9sqVjZgFGEE4GpN9ui7yaaM9s5mK4Obxi/mLQvNA4Xo9oGCiBYOmkn2zv4v+MMFfwJYjR1/VMWYUb2v4ELlNKNahWk6ukSR48EX5UoHROO7MgpdsAfqt6Sr57UfAfxmxi+cZ6sc56Zq/AmlCbDPxr7qjYpiotZO25PKpyRPtf9/bkJExm97JZGY8mS1iHNT+EY8VrEkDeV+A1FTKyCfPIFLnoNP8ixDd/wg27U8a6tQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d604149-accc-4b2c-fb5b-08d86fd1a6f6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 23:42:32.1422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOq9C5E6RwumNGW6IxGldsJS4uS6QcZSCpH9CNhoGVtV+ElgrSS53lqjQ01vuC8FGTbql91Etxvt5q8YmqSdhV7vyi6NvO6ksmdGaB0Pfdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3445
Content-Type: multipart/alternative;
 boundary="------------68A0CC6353100BA8C49F2590"
Content-Language: en-US

--------------68A0CC6353100BA8C49F2590
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/12/20 10:00 AM, Leon Anavi wrote:
> - Provide wheels for aarch64, i686, ppc64le, s390x architectures
>    on Linux as well as x86_64.
> - Provide wheels for Python 3.9.
> - Drop Python 3.5 support; Python 3.6 is the minimum supported
>    Python version.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-multidict_4.7.6.bb => python3-multidict_5.0.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-multidict_4.7.6.bb => python3-multidict_5.0.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb b/meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb
> rename to meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb
> index 02c541b4c2..676fbae7ed 100644
> --- a/meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/aio-libs/multidict/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
>   
> -SRC_URI[md5sum] = "40b6ca77171ac8af55f7aa60049f3cdf"
> -SRC_URI[sha256sum] = "fbb77a75e529021e7c4a8d4e823d88ef4d23674a202be4f5addffc72cbb91430"
> +SRC_URI[md5sum] = "c2c3311e25636a6f213e998cd1e80d72"
> +SRC_URI[sha256sum] = "1b324444299c3a49b601b1bf621fc21704e29066f6ac2b7d7e4034a4a18662a1"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 
>

--------------68A0CC6353100BA8C49F2590
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/12/20 10:00 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201012140022.15761-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Provide wheels for aarch64, i686, ppc64le, s390x architectures
  on Linux as well as x86_64.
- Provide wheels for Python 3.9.
- Drop Python 3.5 support; Python 3.6 is the minimum supported
  Python version.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201012140022.15761-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-multidict_4.7.6.bb =&gt; python3-multidict_5.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_4.7.6.bb =&gt; python3-multidict_5.0.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb b/meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb
rename to meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb
index 02c541b4c2..676fbae7ed 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_4.7.6.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/aio-libs/multidict/">&quot;https://github.com/aio-libs/multidict/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a">&quot;file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a&quot;</a>
 
-SRC_URI[md5sum] = &quot;40b6ca77171ac8af55f7aa60049f3cdf&quot;
-SRC_URI[sha256sum] = &quot;fbb77a75e529021e7c4a8d4e823d88ef4d23674a202be4f5addffc72cbb91430&quot;
+SRC_URI[md5sum] = &quot;c2c3311e25636a6f213e998cd1e80d72&quot;
+SRC_URI[sha256sum] = &quot;1b324444299c3a49b601b1bf621fc21704e29066f6ac2b7d7e4034a4a18662a1&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------68A0CC6353100BA8C49F2590--
