Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.46])
 by mx.groups.io with SMTP id smtpd.web10.157.1591377934269445350
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 10:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ga8usOAW;
 spf=pass (domain: windriver.com, ip: 40.107.92.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kg0pSmLOWUff2Iwtml0mr7b8lPJM6XL+kM6SFzyfW3i6XMkG1cGSK+SvRDtxFYGEuF5iI+18ufJ7q8evtc/Or/OLjqoZEVA7BXJSc1GUCojxSLUjgqdNfUm7tJ+vhKueXBJWfucSFBl2ze04Ya+OANb7y4xRm4Cu3d/WTFoPAARcFB9z8h/j90/t8DZBJo5k+pNDjFJS96Mb/EmrStVu1BmLkf4lXfkjyJ/7bS7a8j9OcLXjzHJfnzONFZhszaRBTYSrjrNWK7fNdNO1YTeRlDkQnmzTASvq+UTk2XdUBJZY1CE2MwE1cCteSokgWXwMn09ymeM5/jtoaqK2VxghNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzTQptbzGFyB/ig4/JeWVoYejRRtG4J87fWRj+Fj5/s=;
 b=RRUU45of8at8DJBX5sD0QQtEZ2pHg7ZVcTFUnqsPLitbUHQouZBs+drUxlRVKPaFXdWYRVRT2oDZgJ0EnnVveT9yyiTUjYTwd9c+foX6RS3HMbZfkbYrP2cONFmtRwQTuNzGocfjIG/w0HSbQsuSyFq7relAy1LwYmu0LHOOXt5482VCzxKoPjxHe/32WWfQuindAlR5QMjw5J2ZHTrJKIzqvDr7wld+/5LwSoTXOetVfKTSVzC+klwBE4kuVDD3HKe2o3b+051SU9zD1+B6LTSTW53GNjmHnefKWkBwEhd948FHDGW4/iaRP1FS6GL65XerRlKEoIE5X2KF8sk67w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzTQptbzGFyB/ig4/JeWVoYejRRtG4J87fWRj+Fj5/s=;
 b=Ga8usOAWGwBPrNHDMbbJdrxOKqhJ236482/mRJhNFJ2vPw1DRnSMi8I7qrMy9e+/phvpw6l8E7MCYceG3aEgb8eoLvkoV9fxYytxIysLfwXNgpoL21OcUn/UtZoVzHEcS+A1jmqBkdvL2B8XCSiH4eta/DWhv+hKzaahpRyEQjw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1908.namprd11.prod.outlook.com (2603:10b6:404:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 17:25:32 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3066.019; Fri, 5 Jun 2020
 17:25:32 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-feedformatter: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200603134232.22336-1-leon.anavi@konsulko.com>
 <20200603134232.22336-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0b713312-f5be-ebe0-826d-1ebb9c36a78a@windriver.com>
Date: Fri, 5 Jun 2020 13:25:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200603134232.22336-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::49) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 17:25:32 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f267fdc0-a4c6-4489-9553-08d809757352
X-MS-TrafficTypeDiagnostic: BN6PR11MB1908:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB19086BFAF0250F8C3E768BB29F860@BN6PR11MB1908.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:208;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7k3cgHwF7p4X66mh1ylYh6pMWPnOyWLPf7PUzrWU/X/yKCoqWNSfOyyAVbNC8WMcji2BNDZdLU5Zj1767SgxF8qvEh/lS9QaGwOJGZhfTKSdVBFfKvVYaozuS10JzKA+7F2BSCE7q4gg37L6ZHqIJjE1va8/Sccd9OOp8BDa3jJryacKRBmKmJnxeVWRZ1guL6cOTNwAdnGsTyRJQl00IoQTbY9rkA1c9+mPW8BBHO1P/wYAzSK+hFMTZ3nSKbuX6f3wlf0JPCEEDdvelYGA+AGaClBNfz6/DvXRpcYocKCeuUMRTmxY0Bnn0R+HTblkF4rUEeIcDOM6enIp48SGAORbT9lgwH5KBnx2oleXiXBiMxq4tXJA2+CYxDidnmTFo7hNK9R9TYDc4OWGxmDUNTTTupmg4H3wHCxgG+wphMRPDPmwZVYTxgOIv1SX+2AJnUi/vJX4BpXW7bpc2/BAnA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(39850400004)(396003)(366004)(44832011)(8676002)(31686004)(53546011)(2616005)(66476007)(66556008)(186003)(16526019)(956004)(66946007)(2906002)(16576012)(26005)(36756003)(316002)(33964004)(31696002)(966005)(478600001)(8936002)(5660300002)(52116002)(166002)(6486002)(83380400001)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	PWZ1E89ALPLKQ8TiyuTzfzBiKVPbe7wRmtAKjEeZdhwfXVVz3PecW8BFTnSZfbHhf9XL0Ka+biczpFj6vnoVB4Ol3Xjqc2r/XFVLRfXmvQrI8kVfDaRqkuDlDPIH/broyaFsIlH5EnyrQWh4u4bJ+Xi1zmfSM0XXDynY2k8f1QJ4fLEQe/3SJRE3Wv4y9GAs8PVQO1/9mMDckGvQ5ZAgrT2WEwHtf10sLNqYvOXiGbFJC8j7OdZKnYNDeNSTgMxXjgKDuk0XupwkQ3nDUKjmpQIPsxuu58EPn/WumKdD731NuGNjBbbZovEMh2zhpHb7iyGnIaY368rzXg+zhcgP+OIsVe3Wey+xeV+efts+yBJqzb2Od9MfcnFiiKLeihiO/MfTE2G1bHi/od/e9lvf+J4yZyRdsyKvdyKoZgmOb4/V9nskHO/lX3fZj597CzM2fV5wVrTtzWqRmLmY1OHhVoSBKjwS2JM3daL+ZoeCkak=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f267fdc0-a4c6-4489-9553-08d809757352
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 17:25:32.6399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnKGngDsKg2S3inwkSnd1lE7U3VfAfgpyMzOOY5JCYseRJg0RzzUnP2MEKWvbNFQI6UzOzXoeeK0EzLL1/w6LCvDPp4NtwTfisyrhd6BDVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1908
Content-Type: multipart/alternative;
 boundary="------------07BD94313AA224DD83B5C10F"
Content-Language: en-US

--------------07BD94313AA224DD83B5C10F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/3/20 9:42 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-feedformatter.inc            | 16 ----------------
>   .../python/python3-feedformatter_0.4.bb        | 18 +++++++++++++++++-
>   2 files changed, 17 insertions(+), 17 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-feedformatter.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-feedformatter.inc b/meta-python/recipes-devtools/python/python-feedformatter.inc
> deleted file mode 100644
> index 6ddcaa98e..000000000
> --- a/meta-python/recipes-devtools/python/python-feedformatter.inc
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -DESCRIPTION = "A Python library for generating news feeds in RSS and Atom formats"
> -HOMEPAGE = "http://code.google.com/p/feedformatter/"
> -SECTION = "devel/python"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=258e3f39e2383fbd011035d04311008d"
> -SRCREV = "7391193c83e10420b5a2d8ef846d23fc368c6d85"
> -
> -SRC_URI = "git://github.com/marianoguerra/feedformatter.git"
> -
> -S = "${WORKDIR}/git"
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-io \
> -    ${PYTHON_PN}-xml \
> -    "
> diff --git a/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb b/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb
> index 95a5405f3..81c5fde13 100644
> --- a/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb
> @@ -1,2 +1,18 @@
> +DESCRIPTION = "A Python library for generating news feeds in RSS and Atom formats"
> +HOMEPAGE = "http://code.google.com/p/feedformatter/"
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=258e3f39e2383fbd011035d04311008d"
> +
> +SRC_URI = "git://github.com/marianoguerra/feedformatter.git"
> +SRCREV = "7391193c83e10420b5a2d8ef846d23fc368c6d85"
> +
> +S = "${WORKDIR}/git"
> +
>   inherit setuptools3
> -require python-feedformatter.inc
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-xml \
> +    "
>
> 

--------------07BD94313AA224DD83B5C10F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/3/20 9:42 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200603134232.22336-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200603134232.22336-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-feedformatter.inc            | 16 ----------------
 .../python/python3-feedformatter_0.4.bb        | 18 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-feedformatter.inc

diff --git a/meta-python/recipes-devtools/python/python-feedformatter.inc b/meta-python/recipes-devtools/python/python-feedformatter.inc
deleted file mode 100644
index 6ddcaa98e..000000000
--- a/meta-python/recipes-devtools/python/python-feedformatter.inc
&#43;&#43;&#43; /dev/null
@@ -1,16 &#43;0,0 @@
-DESCRIPTION = &quot;A Python library for generating news feeds in RSS and Atom formats&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://code.google.com/p/feedformatter/">&quot;http://code.google.com/p/feedformatter/&quot;</a>
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=258e3f39e2383fbd011035d04311008d">&quot;file://COPYING;md5=258e3f39e2383fbd011035d04311008d&quot;</a>
-SRCREV = &quot;7391193c83e10420b5a2d8ef846d23fc368c6d85&quot;
-
-SRC_URI = &quot;git://github.com/marianoguerra/feedformatter.git&quot;
-
-S = &quot;${WORKDIR}/git&quot;
-
-RDEPENDS_${PN} &#43;= &quot;\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-xml \
-    &quot;
diff --git a/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb b/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb
index 95a5405f3..81c5fde13 100644
--- a/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb
@@ -1,2 &#43;1,18 @@
&#43;DESCRIPTION = &quot;A Python library for generating news feeds in RSS and Atom formats&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://code.google.com/p/feedformatter/">&quot;http://code.google.com/p/feedformatter/&quot;</a>
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=258e3f39e2383fbd011035d04311008d">&quot;file://COPYING;md5=258e3f39e2383fbd011035d04311008d&quot;</a>
&#43;
&#43;SRC_URI = &quot;git://github.com/marianoguerra/feedformatter.git&quot;
&#43;SRCREV = &quot;7391193c83e10420b5a2d8ef846d23fc368c6d85&quot;
&#43;
&#43;S = &quot;${WORKDIR}/git&quot;
&#43;
 inherit setuptools3
-require python-feedformatter.inc
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;    ${PYTHON_PN}-datetime \
&#43;    ${PYTHON_PN}-io \
&#43;    ${PYTHON_PN}-xml \
&#43;    &quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------07BD94313AA224DD83B5C10F--
