Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.79])
 by mx.groups.io with SMTP id smtpd.web11.10900.1601818644892225693
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 06:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QjU366sZ;
 spf=pass (domain: windriver.com, ip: 40.107.93.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNRYSeBJdCPXPR6QxIkD25TBaTfhp95WtYGgP3L6yMqnXGPwhK4iwWV0f1/930tCdUJRxGSRbbjPdu33SPfn8VM16w0gxSK/XnDmj3bKU7bixiDrjzM+nqO8Cw6bXVJoxwLrK3mQn35GZ8jrhxFGSPKMpwvbEs1RVxvJCELhXWw6/Xnnqvb5KDqV/4eAHiGKmyjs3/z3vGLA/UsYmR1Y+lBQks97O29IxfUrXS0HaRB9s8rRrn0QVoHHAtr16E8XTaz+rZJwtbh6VAyoHrwDLPYQi0GlTZBRz4wgD/4t3og+Q224uFFJtICLgTi2V0svOSX+tTU6oqS+JGYV1jXVuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAvUxGlFGFuDauEBlF16JaHOP23nuGAbVt2860hv/4A=;
 b=eiwBTgfkvE9xpA8oIK4E+v3u6VBqJLDdR48R4lz/gPerOLbxnxtJwuW8ooRJ0fv5EXn4VccSYIwOxcjzrDB6bqndM9AlK9trsz6+8tWLxt7S+YK5xsHZJoccbzEbT4YSHbNawzVGEs/xs6PMaxPN8+w6Ot0GD+EbxE/NeGxdrbJI9DSevq+vGax1Qf7Eiws8oVCJOl0Az2pS9iDOnuP8iJZhyTzGdbgZPuXn8XpoqiY/D54Nv0oVWkVw0cJlSb9H8PT2wup/taiieRN2ewiA4miIvpxYB9Gg0PKS0H9bADM6fsacdtmYsZq+BY8279mBkCUdFLOnVHxVCSnKZNstsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAvUxGlFGFuDauEBlF16JaHOP23nuGAbVt2860hv/4A=;
 b=QjU366sZqXpfa0vGbChEPq1SgUYIDu4lxgJEfy/vOBraSDgM0g+1X0j7R92sttOcMpAdnxsFiAcFTVRo5AgIVgIdlJksMTzN0CEFl+E17Z8jQ5CXmY5P66jfgZmHMXHwCgn6l5cG79aUNTNQqpH0p4DJJgXoKkTIM0M0Xfq2Tqc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Sun, 4 Oct
 2020 13:37:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3433.042; Sun, 4 Oct 2020
 13:37:23 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-cbor2: Upgrade 5.1.2 -> 5.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201001082006.21365-1-leon.anavi@konsulko.com>
 <20201001082006.21365-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <98d9cad2-aa75-8971-3a08-c165e1c3039e@windriver.com>
Date: Sun, 4 Oct 2020 09:37:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201001082006.21365-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTOPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend Transport; Sun, 4 Oct 2020 13:37:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57c88150-f23b-424e-e9ac-08d8686aa01c
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2951D4384C7A4B1762792D5F9F0F0@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:317;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kVX4q18mINfTAgNFuWfmb7hIos5TER+zgQ4alsyQ3yOLFuRaN4kMm6DKQRIhAah3pxQsUC+SUMkieUXbhOrncYGbRtQnMS+rloioIOMRfUZh3aQTZpV/lXeg5WzBnUL3cfNj4c1uXJHGhIqpG3Y9sTQDNCSxfkcH1gqC5kx+2egXtt+tT+RK1KbE/KRdbJHQz69oap8V8Cb/DwePhg7rqPT/CaLLsB+G1/9zKynm20Nw0JnBN8eGpQLujOYNH9ErYNXbbjnsO+RH9eMjA6AgJR8TBwRJngfbYF2pxCpYQAhcnugc79P22NvI7TrgllKbJHb2kqEljkvjzRfIrwE3+g6AwZ9ma7q7uCNjZjtwuy0T5S3MNDblrAX6FnGXGRGccf/T3T+F4cc7k7HbbhZzGL38EXzRnh/dmH2QOiD7Smm/af4XN9kVcnCEQbiXcTm133XELUUavfqbfebOsZ94pQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39840400004)(396003)(136003)(6486002)(186003)(16526019)(86362001)(478600001)(44832011)(52116002)(33964004)(31696002)(5660300002)(66476007)(66946007)(66556008)(36756003)(8936002)(8676002)(53546011)(26005)(83380400001)(966005)(83080400001)(16576012)(316002)(2906002)(166002)(956004)(31686004)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	YmfDVDujafA7pVqu9BnCsK/i+ptp6Nq7TxqJAQ0y3nKqDKZhT67+uenIbwI8/DmQsViolomOP6uGugIGnfJm71UlsQfiEeTYwlo1SA5pngDQwh7a4U6s4BmPA2GqPrSrkciL1ZtGNbC5fMbmT2o6FrrtVOvhzRDM/n2jvXiRwUoyZkllzU6nsSbJdwA34WS1w66oZLBOwShslzbomk7OqBRj+RB/7z3cOz7mdCtVJgjM5k+qHfOzzHNMqEeMb+phPrBbKZTHBEw9RbyklXIkr6tQmqXMmSUCp/OMsdLeRSrLjlAVN8s0E1ClGyp0DcQrN6/DzLgdQzuMM5kwBphNSweMRENo7XPvgUzUCiYPWIBdSHlq1APkdckelnCmbXf35BSAKo1rX2rwNFA0E8PmMnTGT0FA2uZKKO1W0+tijHBgIMjYguciUw9oyFjsv79MoTV/5devYWA/sQzUQuVn7s3T4DMYsokGIjfhtikunaYJclS2XuiMSZXKrBOxD85+ckwWuorJ6uq73E1IGF+1mvG03Ivb2HNNmzwYtvqSsO7xF0jR3iAhcCKXNDc/rEDoqh9B8SOonq/Ju7LjGD3tKSScy+qns/n33TCY2mmE3FwmBgLurgRv6khRNfAhtCehCWpGHB6ONfpjfWMD6yicbw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c88150-f23b-424e-e9ac-08d8686aa01c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2020 13:37:23.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhMmHdZTlLXcVGdGhVseUj8eYf/Xu0Y6EbPkVeTB6lx3mOUFdKS4qNsF5jXMXYEjGxf7WYyMWxTRfC9DatrTWfD63/QTOql1XknVXHVVQwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------B63A3CBBCBFFA031BDD4A2E1"
Content-Language: en-US

--------------B63A3CBBCBFFA031BDD4A2E1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/1/20 4:20 AM, Leon Anavi wrote:
> Upgrade to release 5.2.0:
>
> - Final version tested with Python 2.7 and 3.5
> - README: Announce deprecation of Python 2.7, 3.5
> - README: More detail and examples
> - Bugfix: Fix segfault on loading huge arrays with C-backend
> - Build system: Allow packagers to force C-backend building or
>    disable using env var
> - Feature: :module:`cbor2.tool` Command line diagnostic tool
> - Feature: Ignore semantic tag used for file magic 55799 AKA
>    "Self-Described CBOR"
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cbor2_5.1.2.bb => python3-cbor2_5.2.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cbor2_5.1.2.bb => python3-cbor2_5.2.0.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.2.0.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb
> rename to meta-python/recipes-devtools/python/python3-cbor2_5.2.0.bb
> index c65be72261..cc067c41a9 100644
> --- a/meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-cbor2_5.2.0.bb
> @@ -4,8 +4,8 @@ DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
>   
> -SRC_URI[sha256sum] = "91759bd0ee5ef0d4fa24144dfa551670730baeca8cf2fff1cc59f734ecd21de6"
> -SRC_URI[md5sum] = "693c1bd6635bee8a591a70ea924ad676"
> +SRC_URI[sha256sum] = "a33aa2e5534fd74401ac95686886e655e3b2ce6383b3f958199b6e70a87c94bf"
> +SRC_URI[md5sum] = "0940aa8bfd1a07f06a983bb6dc78f1ca"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 
>

--------------B63A3CBBCBFFA031BDD4A2E1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/1/20 4:20 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201001082006.21365-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.2.0:

- Final version tested with Python 2.7 and 3.5
- README: Announce deprecation of Python 2.7, 3.5
- README: More detail and examples
- Bugfix: Fix segfault on loading huge arrays with C-backend
- Build system: Allow packagers to force C-backend building or
  disable using env var
- Feature: :module:`cbor2.tool` Command line diagnostic tool
- Feature: Ignore semantic tag used for file magic 55799 AKA
  &quot;Self-Described CBOR&quot;

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201001082006.21365-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cbor2_5.1.2.bb =&gt; python3-cbor2_5.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.1.2.bb =&gt; python3-cbor2_5.2.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.2.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.2.0.bb
index c65be72261..cc067c41a9 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.2.0.bb
@@ -4,8 +4,8 @@ DEPENDS +=&quot;${PYTHON_PN}-setuptools-scm-native&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10">&quot;file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10&quot;</a>
 
-SRC_URI[sha256sum] = &quot;91759bd0ee5ef0d4fa24144dfa551670730baeca8cf2fff1cc59f734ecd21de6&quot;
-SRC_URI[md5sum] = &quot;693c1bd6635bee8a591a70ea924ad676&quot;
+SRC_URI[sha256sum] = &quot;a33aa2e5534fd74401ac95686886e655e3b2ce6383b3f958199b6e70a87c94bf&quot;
+SRC_URI[md5sum] = &quot;0940aa8bfd1a07f06a983bb6dc78f1ca&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B63A3CBBCBFFA031BDD4A2E1--
