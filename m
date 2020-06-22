Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.69])
 by mx.groups.io with SMTP id smtpd.web10.17522.1592833541300565362
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 06:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TSSCTboN;
 spf=pass (domain: windriver.com, ip: 40.107.92.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpJZZ0hdBEN2FbGIfzZlsft+lmsYuB2UxRIjm23tqjs5nPI+2pdzNi8KPoxFTVfYZOj1WTnls1DTVCEbAFsjaqqCCgIl0aRiDUFXBoiqVhP/045WfAVrCORlRIzAEXGEEtyCoH0sIcv25rZm2Ee2Di6Ug3Asm7b8ip9fi3DT3EueU3rFD35EDxtOHtKxnLhMyxZq1fSre/UF8bUHV0732FB0BEPK0+MEr1b+6D+41AfCpR7F7znTn0m7mWeRidCSTEfNCmt1/ww+soQPu6BS84vNYUIrQ0Ni09xvT6u0rRWLjjhzPsVtwpD1rJkkRN/3PwZUliOgehpv9QNH0z9u0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7BVF0W7G1C0fSinkR6475AjoMxeHWFfSx7M5f0MEoM=;
 b=QMcdxh72MN3l3unkVqufhQZRd3lrM93oSibAIu/MMJ4yPh9fqT/L/M7QtYAeBiua5MCM+f+6/IlTiv9h88ukADUSFMpevdawUNWJTNtHuTY+O9/ziQBTvy3atLFPksmmvrfrAB4QiYBM/v6ySwyZ4aovlRspM8ydlODuD2iUYoCoqD2gx2q5ezSxckY0CcL7KzPxSB6f+uNd9hOUuz3TK6jnnHYuayQhd2zh/Tz3nJURUvUqggZC80J2qpW+LqSacjxs9sf3dXaQ6H3AYwe6rNQudPfBUBWiMxjX4zoW9pzNhgoAPmb8XGXC9w5iGPePs0NWzHVzRMqvI2SU/a93yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7BVF0W7G1C0fSinkR6475AjoMxeHWFfSx7M5f0MEoM=;
 b=TSSCTboNXWhNQ55bEi7MMLvgAvMyRNhIu6bTh44xeiMYi4bK04NDabo4msf0J8Fa/FjQrqnGYdOdCCDB1dycM81zfcKzxWhqTcLwDwVGNYxZJ4DNyxt2iuLK+RYiRfs/QDtKKVGKRNHRoaDBwySezqyGwFtzPCF+zM9hwXATIcs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1779.namprd11.prod.outlook.com (2603:10b6:404:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 13:45:40 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 13:45:40 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-pretend: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200619081011.25051-1-leon.anavi@konsulko.com>
 <20200619081011.25051-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <88762ceb-ca2c-0c4b-1757-452a09d80de7@windriver.com>
Date: Mon, 22 Jun 2020 09:45:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200619081011.25051-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::46) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 13:45:39 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb4b0b50-3541-459d-0430-08d816b28ce0
X-MS-TrafficTypeDiagnostic: BN6PR11MB1779:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1779FB73790F36282557A6D69F970@BN6PR11MB1779.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:208;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3Xxrufh7C4oR3V3EhG0a3DxYQb4XOaOdV5jaW94bF3CYkYdfmiVi0gqvb8nsh1cxIYK5V4BAzWJ+yUSl7xwwNnCuynClpu+zNzlJRKk//pnAGCirHRNL6+7ZCd0WCjNgOpuKUhdowvgKuA9+g8+Jpnet4uWYDSaOaAvycI4ow75gmrmt9ivOie3MROBOCrtsFrHfz3e0G4381l0rtLuKE5+mQqRwTGqUkjS9P9wev9zWxClI+uoUD/0ZQZu+2X0w292cloVn+PyundnKArv/cD9hjF//pVxyXssOCg+O4wSspBgqifI0Du5fkPBGT9oOOkxdO5Sy2pB1SvhRiO3Zd8cQMyUo8803Tu9W8NcIqct+y/BxiraDfZt4Q095hAojUxOM1F3UAWe61YQTXBJdLMsLyOpa0xNMZHvtnHZuc/0JAYzAhpqkTKtc6DN1Ps9W2KCi3FWq6S0qp7i6esED6w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(39850400004)(136003)(396003)(53546011)(44832011)(66476007)(66556008)(2906002)(83380400001)(26005)(86362001)(166002)(33964004)(8676002)(36756003)(8936002)(31696002)(6486002)(16576012)(5660300002)(966005)(478600001)(31686004)(66946007)(2616005)(186003)(16526019)(52116002)(316002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	e0/9fLXZikrFPkyPj8iO28XLbHys0g/shpZM0lZKN60m2V9Z2pvMdPgVHPPeix0udbpB+lZivfkv28kRa0uLCOpXrhr1enzqlmLb/pgcpeaCPQqlto7CjcAGMAP09ewaL/mM73HQowBzFeTqG3c9AyrTFQgDxEpk8r+VZDcjZ3vyjlW68Yy/15DZhftA0sif+y5HCtVYhMSoMI+IGBLWHU2qSlQqsqWYq4UDHWygE63h+dPu1WC13WvmoeTAPa9AtZFamC5DzWa92DGbqh2Wjs+D/0OXd8YKZQUdXQ8wk/Fbucjx1lTAq20NIOnZTEGq9yZOdB4dHBpqCcluC6yNxplOAzVb0GpzkMxtWm1hapIgs+sUZi45VLqsIXn4qxgMBrtvP+Ki7svMlhMFIwsPGkqX3aG8Qdbb6Kk6n+VRdAfvgiLiOHGxPOprwFmmJJNxtEGYOLHXoHfzX5HiyF8kp/A/hBu0AtpkAJHOaz/XPKU=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4b0b50-3541-459d-0430-08d816b28ce0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 13:45:39.9226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxQyBy99LmkPqSv18cKFeo7B2s2HerHywLy6Wb0heIa2oyFPwuLjhAO8Gmad/guS/NVHCfR4vHVNlc7oiVOcVmO1Dtu7gU7QxTkpPCpk8RI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1779
Content-Type: multipart/alternative;
 boundary="------------B0CAF0874EF9ECF576CABC02"
Content-Language: en-US

--------------B0CAF0874EF9ECF576CABC02
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/19/20 4:10 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-pretend.inc        |  9 ---------
>   .../recipes-devtools/python/python3-pretend_1.0.9.bb  | 11 ++++++++++-
>   2 files changed, 10 insertions(+), 10 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-pretend.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-pretend.inc b/meta-python/recipes-devtools/python/python-pretend.inc
> deleted file mode 100644
> index 58f196199..000000000
> --- a/meta-python/recipes-devtools/python/python-pretend.inc
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -SUMMARY = "A library for stubbing in Python"
> -HOMEPAGE = "https://github.com/alex/pretend"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99"
> -
> -SRC_URI[md5sum] = "ad53883ede48aeac7ae584f0de0240e8"
> -SRC_URI[sha256sum] = "c90eb810cde8ebb06dafcb8796f9a95228ce796531bc806e794c2f4649aa1b10"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb b/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb
> index 9c5d8a843..21d14a03b 100644
> --- a/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb
> +++ b/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb
> @@ -1,2 +1,11 @@
> +SUMMARY = "A library for stubbing in Python"
> +HOMEPAGE = "https://github.com/alex/pretend"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99"
> +
> +SRC_URI[md5sum] = "ad53883ede48aeac7ae584f0de0240e8"
> +SRC_URI[sha256sum] = "c90eb810cde8ebb06dafcb8796f9a95228ce796531bc806e794c2f4649aa1b10"
> +
>   inherit pypi setuptools3
> -require python-pretend.inc
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------B0CAF0874EF9ECF576CABC02
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/19/20 4:10 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200619081011.25051-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200619081011.25051-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-pretend.inc        |  9 ---------
 .../recipes-devtools/python/python3-pretend_1.0.9.bb  | 11 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 10 insertions(&#43;), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pretend.inc

diff --git a/meta-python/recipes-devtools/python/python-pretend.inc b/meta-python/recipes-devtools/python/python-pretend.inc
deleted file mode 100644
index 58f196199..000000000
--- a/meta-python/recipes-devtools/python/python-pretend.inc
&#43;&#43;&#43; /dev/null
@@ -1,9 &#43;0,0 @@
-SUMMARY = &quot;A library for stubbing in Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/alex/pretend">&quot;https://github.com/alex/pretend&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99">&quot;file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99&quot;</a>
-
-SRC_URI[md5sum] = &quot;ad53883ede48aeac7ae584f0de0240e8&quot;
-SRC_URI[sha256sum] = &quot;c90eb810cde8ebb06dafcb8796f9a95228ce796531bc806e794c2f4649aa1b10&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb b/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb
index 9c5d8a843..21d14a03b 100644
--- a/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb
@@ -1,2 &#43;1,11 @@
&#43;SUMMARY = &quot;A library for stubbing in Python&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/alex/pretend">&quot;https://github.com/alex/pretend&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99">&quot;file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;ad53883ede48aeac7ae584f0de0240e8&quot;
&#43;SRC_URI[sha256sum] = &quot;c90eb810cde8ebb06dafcb8796f9a95228ce796531bc806e794c2f4649aa1b10&quot;
&#43;
 inherit pypi setuptools3
-require python-pretend.inc
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B0CAF0874EF9ECF576CABC02--
