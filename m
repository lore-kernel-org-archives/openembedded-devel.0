Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.75])
 by mx.groups.io with SMTP id smtpd.web11.22374.1600263373148535189
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HBs9tmDu;
 spf=pass (domain: windriver.com, ip: 40.107.220.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqPlM9PPsy9SYxVFXBdR9jX50Kp1KWACGo/mRhQUoKxYWelh60xYuVGpmZbBdXEHRdtbjc1lU0vYiBD5W8YXjoXmgVCpLLhqazq3NJkDQ9ubs1DfowTit9wJFiaYh8eEAo0KzkosY4frfeQb4mkNilI822kwiMpVN7zMDwO85JizRKxnTNeKGtKfKHqedqJb/Z6ii/+lDfRaVxwOsSW4MJnSIxvJpQfl21z8mDYc+nXQCDmj590XqS16+Og6IzRmnpZJswM7v/5iGu2jbGSrPVSIbuPh/w11FOaKAoK9Twx5fLchevquJEIMOb22qWtgiZVRX/b95DZwT7LiGmhiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUi2yLABsja5EgPQkkra7GPm/n6wPgyS/qLG3s0yqqY=;
 b=OXzA0VsAiNErKiktMndHQOWjLi8CojBOYVfQoe5e0RH6FZQ+bRi/28gRs3xZq7wfSvB4h+anjK8AJ3uDZsNA7hjcWgFlNQqwUv8U2KhkEX18QXLoU9s5o7duU9+5aAAEx2rMOzvdt8xwIwVvtvOA+0KW5NyCfedgX7Q/TqXGTZjvF5gNq828NetZgMYa91yWH5QAIgHjbsAwK1hmHBxkg69fbVu7MtRD0opuxm62xUTMyxyZdxXbMmQaL+SW30Gz6r/XqBAD1aMj/A4b7gl/qo+DqdRM7swRY98GS/f9XWGFfxv+6dKFYvpQv97wjQFfL+Zvy4utIbzghy26xsbuIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUi2yLABsja5EgPQkkra7GPm/n6wPgyS/qLG3s0yqqY=;
 b=HBs9tmDu5d8YjBmRzs5xc3FM5a+rqehddxpSLhde8JiqRTowlaKuaUGm3TGpBD3sBtz2brBakgxieQx5U0DaoUfP39ZAdZW6fmYYJYzwwtLR5aZw84ij8EXMBsO0JHJzVMfsY6dXxCq91xO8lrtAZL7Z2J+OPtWO90Rp+MMAaK8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3765.namprd11.prod.outlook.com (2603:10b6:a03:f6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 13:36:11 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 13:36:11 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-cffi: Upgrade 1.14.2 -> 1.14.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b78a9f84-8747-8ade-0966-aa82d6341780@windriver.com>
Date: Wed, 16 Sep 2020 09:36:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915090303.14367-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.19 via Frontend Transport; Wed, 16 Sep 2020 13:36:10 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 950b910a-79fa-4bb6-d39d-08d85a457938
X-MS-TrafficTypeDiagnostic: BYAPR11MB3765:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB37655D8B3589433821DD0ED69F210@BYAPR11MB3765.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7XwSabphTRfGEVg9LdqZys4BBZ+C4oGFnOEqVfghlgOh+mfGCAQPT8LMkQoYFKHWsguGD/J3kwkjNHnweo978F+TNvXq9IqqlIG2gXiRV0gbmbMNThLONcb4BXtqZEJaSvRyc+pu/TWunYseH9Ul1fuKo5l3qPOsckr1iwZ+KSfbv+Az0Hcj+qJa7dmwfzRZP8RGtSSzCQEHpKOfNmr1NDO2bnVGe/fAd0SSxcZ60MTkNCI5+yfaz4Ijky7usJsOTJrgrNM88Ja2pOVhpuAtVhjTdOruDlHPz5DcyJSMxFwyhD0zaMbj+ZnGppRmiDjjj/0olhcgrBNmc8zWSgz+471ep8rvhDIuWcuMAHAH5UYfdrBgrK79kTKzThKcyYN+V2lnMQttT76blEQvJyHKKMv4nYdPAiWfm9Y9P2+mSVLt04W2Y95XR+qFdbvI09HPwVAXYj6OWKHAzA1QbN3wEQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39830400003)(44832011)(966005)(26005)(66946007)(478600001)(31686004)(66476007)(956004)(2616005)(53546011)(66556008)(6486002)(33964004)(166002)(8676002)(8936002)(16576012)(186003)(83380400001)(52116002)(31696002)(86362001)(6666004)(316002)(16526019)(5660300002)(2906002)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	wJAXuAOb3B0hXEKXSIdan6noYGnt0Ff0PfblX4Xd9m3jj/srH8XIe3ZkF9ipbIDltF2nT2oxWXbIia/UY6yf9Ot7LyJnRsllN4tR/IpGsmcNcIJElEPvBvpLwwzBD1pUyDrocFID4rZ3J0lVBkoFNLZeYz04r472ORprOESU+A7d24OBELG51MYSQE5Zsn9XLDfx8zg7CTgDvusYV8dFk5vfwP2O4jwyn9KTCEEo8AFzXDqUGUxq0HG9i2XIN2ocF5OZmowiGnyQj0HyRQ4xWdLP4Z9YSyYd8DnOPJjlVbWB0e3Nn/3EimQ6fBilyKN5RBAvEEN/dadltAwVwty+Dbuqbl14WQ9/a6hN2CD39btD6U+s3J0xTpE8D3VNtsI2zBNcd2nAr/9tIEjYFtnsuETLuNHRoHWuqupRkYg8h8MW30V/ch61r4IdHOrWo4+LHU1QL44m0BuORb258saz13ZQeMEZS+IT3SbKY00sTuSGKNRWwdkzO2/QSy1Dm9SY9zZYCabyDIIcyLDy0+cD0IAncRnPcHT2rrQCAOd6UK8WNtSOT391J3apGVknE5I+MFGaAipFMi3bDkFUAZgCc7seH9n4VICBkts2Wb/HQpQmiaIYZ9PoMuIKlkIenOiLQqQmnugVsYCuSWsHiV7XqA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950b910a-79fa-4bb6-d39d-08d85a457938
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 13:36:10.9553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqXrODFVUTIT3gcCUc/1K6V38EDB24TWP/ceC2uJJNs2bo5rDWtnEJYhLxFbNe70hg2NoXB9RO8kOZD4uaCwOQIBQj7BMthGa4XywNA/i1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3765
Content-Type: multipart/alternative;
 boundary="------------42349C5D1A6E91551511003C"
Content-Language: en-US

--------------42349C5D1A6E91551511003C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/15/20 5:02 AM, Leon Anavi wrote:
> Upgrade to release 1.14.3:
>
> - Don't call PyEval_InitThreads() on CPython >= 3.7, where it
>    should always be a no-op.  It is explicitly deprecated in 3.9.
> - Let the test run directly on pypy too
> - Remove extremely old and outdated .gitignore
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cffi_1.14.2.bb => python3-cffi_1.14.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cffi_1.14.2.bb => python3-cffi_1.14.3.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb
> rename to meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb
> index 57c28954a..dbdd16f66 100644
> --- a/meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
>   DEPENDS += "libffi ${PYTHON_PN}-pycparser"
>   
> -SRC_URI[md5sum] = "3cc2f1daf62dd66eda79b4d6281cebfc"
> -SRC_URI[sha256sum] = "ae8f34d50af2c2154035984b8b5fc5d9ed63f32fe615646ab435b05b132ca91b"
> +SRC_URI[md5sum] = "c2a47ffd5d183b193ac8ed3414dcfd07"
> +SRC_URI[sha256sum] = "f92f789e4f9241cd262ad7a555ca2c648a98178a953af117ef7fad46aa1d5591"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------42349C5D1A6E91551511003C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/15/20 5:02 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200915090303.14367-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.14.3:

- Don't call PyEval_InitThreads() on CPython &gt;= 3.7, where it
  should always be a no-op.  It is explicitly deprecated in 3.9.
- Let the test run directly on pypy too
- Remove extremely old and outdated .gitignore

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200915090303.14367-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cffi_1.14.2.bb =&gt; python3-cffi_1.14.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.14.2.bb =&gt; python3-cffi_1.14.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb
index 57c28954a..dbdd16f66 100644
--- a/meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb
@@ -4,8 +4,8 @@ LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf">&quot;file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf&quot;</a>
 DEPENDS += &quot;libffi ${PYTHON_PN}-pycparser&quot;
 
-SRC_URI[md5sum] = &quot;3cc2f1daf62dd66eda79b4d6281cebfc&quot;
-SRC_URI[sha256sum] = &quot;ae8f34d50af2c2154035984b8b5fc5d9ed63f32fe615646ab435b05b132ca91b&quot;
+SRC_URI[md5sum] = &quot;c2a47ffd5d183b193ac8ed3414dcfd07&quot;
+SRC_URI[sha256sum] = &quot;f92f789e4f9241cd262ad7a555ca2c648a98178a953af117ef7fad46aa1d5591&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------42349C5D1A6E91551511003C--
