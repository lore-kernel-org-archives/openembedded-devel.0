Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.84])
 by mx.groups.io with SMTP id smtpd.web11.14784.1600180253540801912
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VkQm8sLb;
 spf=pass (domain: windriver.com, ip: 40.107.236.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEF5J1VrGZGFmfBhpqhiJ2WZYyr82O5E0EqgBCdHs1DcUOWl2h7txU6mQf6XwM2tChFKes8yAPBU3fadfOrzyXdTC0T2mABqegel9D02A/L17xJKzBUI69oSzlxn0iqrSi3ODLHMGV5l2fkXa6oSvBvd40rzaXplAOsbMv71A2eromJBlViLmvLH3gUFDBJOULONTkXQAqUFXILCrAjxEncZKcwR8oMS9JpdZfX05cg1+Yg7JWKxYDPCJofLIzKirrc5aj6WlUCF7+voFSESsfJoziuEFMI90/6OrBpaqiH1pOezRlsxs1+BeBhaqMvEIDFtvoXswBclhRcK0pxLiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ofedbltF+TlUUEZA0QGM57fTzwjPpo9VRYChuageMI=;
 b=PafDXOlkmHn60N11lExM8z1dLlrtSEgM3ebsIL9KJ5SgOZjGLy2Ff8TyJD1Jr0i3QElQ4l6sEMRAV98Hq0A11bk4KUrp89m/X9h352nEkTEkmhXGtcmp5iWk1aJ6oVeG2aWmzwM7pV2XtS5NDUCTqIQx6yfd6CisX+ektscfAFYE8r1XALss+bhMntN9jBFfBcS2QgfFrCEbBjmFdPwXSCireyiRyaYJ2Rvz7CIpkqxXxwM0+bUPLp0OmIM/HdJWQ2IqW4dbKscEeGUITVqKuDvsgw9OLcbHqPRYFC3iyKPDkeM2kqoQCcL0Gf+zoDPdzRt5fKuPt3vUn00FLWqh5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ofedbltF+TlUUEZA0QGM57fTzwjPpo9VRYChuageMI=;
 b=VkQm8sLbsnHq9AUrINXMvugbHMJKN4wL+kKsIHXS5W2YaUF4WoojojKIPln2GkvKKDbAGT2dK94YUDfYpY8mN7YmMU7OSHWpQpWoKA1+CsFM4nEfDckJ4B2YpGhKx35vnWh0smK69DYNFro/kSoRd9+0lTJpsFwxKBZPavLU7No=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3912.namprd11.prod.outlook.com (2603:10b6:a03:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Tue, 15 Sep
 2020 14:30:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:30:50 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-pymysql: Upgrade 0.10.0 -> 0.10.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
 <20200914131536.6072-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0c7e23fd-eb14-a141-df3c-a7354389d11c@windriver.com>
Date: Tue, 15 Sep 2020 10:30:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914131536.6072-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0131.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::10) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0131.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.19 via Frontend Transport; Tue, 15 Sep 2020 14:30:48 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa390d01-374a-43fb-e569-08d85983f102
X-MS-TrafficTypeDiagnostic: BY5PR11MB3912:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB391298E37BBA7F667AE0298E9F200@BY5PR11MB3912.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:184;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gqHMvC3ohJiYTaQSKZIh3cTw3UrninhIPNlG8Q001RWJxcq4NJIj0FYljXeEpcWefew6o9IZHiGOhpEWEYztAqGFAFbjquSsBkuqTf08eFplNP5rhfFWWjCkXU8rFbaNCP2HNRVzZROyqiLKQE42bJmpMtcea3qfarG3IZ7woQumCo9vj/A7INdw+q9gj5mYS2mI3XKwSrZFJbZtm+mLSaTFitagtWuMDpCrN3JIgJqoPZjIOBgCjKcqyvSmvRluJJzJYmaNppMj9me4lIFaFMQjsy7ULe8V9qCWvYVAjc2KowCw3JnMb9DjNbr16e83B+M5rLSR0RltJvdxrqlwsFhewGIm4uK0pQtP97/28WYWclxbzNUIxoWXxptiVnKio8CIekE76FJ89xw+CG0K59Z7Z4p+lkPtYeax+18LP2b/ZuKlhI+Y7df8L7LE6NM2lOZCxybLlCR2XamYqqr29g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39850400004)(376002)(366004)(31696002)(8676002)(66556008)(66476007)(26005)(66946007)(2906002)(8936002)(53546011)(186003)(16526019)(6486002)(36756003)(166002)(478600001)(316002)(16576012)(2616005)(956004)(5660300002)(44832011)(52116002)(33964004)(31686004)(86362001)(83380400001)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FjMwz/V+0Nt2egESfX0SCZRJXStCfYPmuG/4utHUevrKsBh9QMi7Y0Yw5CGTOJda8j3xZ0BvkJHhciRDja8t+KvIMyoi8UuFzn2dThdORCxtlmwQ+XQFM/j85ewYVbMdj5O6PUAszMuubndJr0OYgX/fUjfC06yKqQRrI2AAR1e9907iOAH8s8T1+5madgjBdo5H7W0an7Q2w9AZDmHEMSv7CsYvK362o2yVbVo5P/lrMedBrPevDd+6Qroyl7x9lvC1K44y4lLkxC4QqkXTyn8XUcMLEdIOfxJEfSwqJwHgbZQGvMuBnCDbdkopBH2dPBeZ5Ztyj5cDLUztygObuC08NXa5cVm3c0QX7iS/lCaLFw+VbsxAvlG0BtX3/lRypgr2anl9CQ1YTcOl3XeuhWMeUsOi8k5613zmYRnQNR9RyaLJKEd1uZePKyayp+jbueSyT53KkLLasS9jNweP1Ew5JhmZxKdXruawuTW0xwPKD69NrCPs7EclqkBB3O7PGPzsx2VLmrTIchsjLzOCpt7iSpTWG8zrnxWW7c+4Hp/1OdCd4/JgKsGdyB3Lm02JgO4abk3pMq5M+bUs1ciD0itqoOhWSGSiTTJkOW8DgV5vNdneGinew0dFhdYugMw4Da7gydSFIHEvBqaxzNNV8Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa390d01-374a-43fb-e569-08d85983f102
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:30:49.8797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oC8Hj1Sd64Dki66ibEUUSzX4SBDCytipMJ3+RvwWGKVD98C8loqPgA/SRXpYD8V2XZLaYT9yQaQ6tbLPssirmnTmoZDtNIyALlNLQPI048M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3912
Content-Type: multipart/alternative;
 boundary="------------B4295AD48B9CE288AA842965"
Content-Language: en-US

--------------B4295AD48B9CE288AA842965
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 9:15 AM, Leon Anavi wrote:
> Upgrade to release 0.10.1:
>
> - Fix missing import of ProgrammingError.
> - Fix auth switch request handling.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pymysql_0.10.0.bb => python3-pymysql_0.10.1.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pymysql_0.10.0.bb => python3-pymysql_0.10.1.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb b/meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb
> rename to meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb
> index 895c47b03..15ace44ac 100644
> --- a/meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb
> @@ -8,8 +8,8 @@ HOMEPAGE = "https://pymysql.readthedocs.io"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc"
>   
> -SRC_URI[md5sum] = "d08058b1592724d5808c43f56050f245"
> -SRC_URI[sha256sum] = "e14070bc84e050e0f80bf6063e31d276f03a0bb4d46b9eca2854566c4ae19837"
> +SRC_URI[md5sum] = "4a1fe973afbbdd78928650118ce8ff68"
> +SRC_URI[sha256sum] = "263040d2779a3b84930f7ac9da5132be0fefcd6f453a885756656103f8ee1fdd"
>   
>   PYPI_PACKAGE = "PyMySQL"
>   inherit pypi setuptools3
>
> 

--------------B4295AD48B9CE288AA842965
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914131536.6072-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.10.1:

- Fix missing import of ProgrammingError.
- Fix auth switch request handling.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914131536.6072-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pymysql_0.10.0.bb =&gt; python3-pymysql_0.10.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymysql_0.10.0.bb =&gt; python3-pymysql_0.10.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb b/meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb
index 895c47b03..15ace44ac 100644
--- a/meta-python/recipes-devtools/python/python3-pymysql_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymysql_0.10.1.bb
@@ -8,8 +8,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pymysql.readthedocs.io">&quot;https://pymysql.readthedocs.io&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc">&quot;file://LICENSE;md5=528175c84163bb800d23ad835c7fa0fc&quot;</a>
 
-SRC_URI[md5sum] = &quot;d08058b1592724d5808c43f56050f245&quot;
-SRC_URI[sha256sum] = &quot;e14070bc84e050e0f80bf6063e31d276f03a0bb4d46b9eca2854566c4ae19837&quot;
+SRC_URI[md5sum] = &quot;4a1fe973afbbdd78928650118ce8ff68&quot;
+SRC_URI[sha256sum] = &quot;263040d2779a3b84930f7ac9da5132be0fefcd6f453a885756656103f8ee1fdd&quot;
 
 PYPI_PACKAGE = &quot;PyMySQL&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B4295AD48B9CE288AA842965--
