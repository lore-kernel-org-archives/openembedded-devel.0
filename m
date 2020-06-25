Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.67])
 by mx.groups.io with SMTP id smtpd.web10.9939.1593089999723274850
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 05:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GkhfRRgk;
 spf=pass (domain: windriver.com, ip: 40.107.220.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAO/YsAeJT/hr+kdoIOydCBwsOlUhzFuxJbqACGCrfwLxKxsfap0zcE4+6R+XGPhSIXzIVhQHhTWhq1Q0ZtXUmqglwzIAG4Ij6Clp0hjCB1QhFm3rrGkQio60u9JMcdjViRybFNuqr6pW0AUhN4P01HpDmHH6rjaC200APx3nLO2BVL6/QPuXDJmKHfdbxbT5HNAsECsSz9aCUNT6fiXWWXKDvwzJqwiQ1BBb3DdjdwLhHxQKu+qgAhrhcUOTDYJbN/mvWLFh29N4AY1Iijo7AKDdtNSrcktPDuLGUSigAKem5CzdWw+cS5y5EYDpLIoMtXMXpLiRboj+hb7+rdVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpU+g6EpOBzfhBcuJhYBgKTtR2W1RfLdUNzj7btC4c8=;
 b=KOEBymhbsEn2f8z0MlkH9KvEL3BUhoKLt9kDsfD1D2ZjQlPxmGCMUTTH+ud4hxVavuhJT9vZwMjD3/kQWHSCAiuNunpxpM7aCduECzlhYA8yrDsOfSvy+CtUNcfKaKl0Z0V1l8imE9ue8l0CglaNuagvxeiiJ7XCQtxT5Fghk9JrHFm1/SAHjnpkVv43U2QmeaJTC3aGgOIDyeevSnrUHNKIua/3tDnySdASKb/h/jKkkqRVUiHceaiVu7D0XSfDST0oGiRkYq3Sdnw3Z00mZbV2VP5xUp8QKnj0AL4UKdcGaVecGpLEr1jfzXJ40Tw11Trt7b17CUKCI0nOumrJ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpU+g6EpOBzfhBcuJhYBgKTtR2W1RfLdUNzj7btC4c8=;
 b=GkhfRRgkVYLcg+xeINP30WlYNSHfFfCx+vR4BxmiuktB0KlwttOowA6DWxOj7dUhxMmrL6e1Uft0MFFN9K7T/y+L26ywIm6VIcj9IganAqkAWZWNRp+YVsMzVIQGYb7jwdttQbBfAhV+oByBlmdbqPoHErXcYPXCfMMmsycHcdo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN8PR11MB3746.namprd11.prod.outlook.com (2603:10b6:408:8c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Thu, 25 Jun
 2020 12:59:58 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 12:59:58 +0000
Subject: Re: [oe] [meta-python][PATCH 03/10] python3-netaddr: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200624151628.547-1-leon.anavi@konsulko.com>
 <20200624151628.547-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0bc11711-6482-9935-5701-ed0fd309b6af@windriver.com>
Date: Thu, 25 Jun 2020 08:59:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200624151628.547-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::18) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 12:59:57 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 050fae44-d697-45ec-645b-08d81907aa01
X-MS-TrafficTypeDiagnostic: BN8PR11MB3746:
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB37465D2486AEF0F15FC8B0AD9F920@BN8PR11MB3746.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:185;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JBUnbsKuJQhYLP2H9GwL+5ERJzLyWU/hD03z+bldx2zm1EighSZaAonVICSSJYgTpj1MzBGFCZuE9kL9wZOx1TGIe2ayQ7gBdrcn/LrtnzL6RITpkGLQ+kWBS4lQi4VMe8aEGR6YuCzLRHrvE1Nyts6dKZ2UKqdLFlf9p2EUq0jqbX+mx0g18DTIXqTRWsQvTbObMMp4FFIr73NurNbDKLT4rMnmL8HvZMhpBPlYkYCxzmf4m49KQL+DVP3ZTIGx1FHXD/GX7LBcC2YPYd+T9In3jh5cuPvo1SPma+QlHMNqBvW6d9o4c2RtVn/rtqAoj4HOQ6/UyWUudaf62Aq7x2FobWOK3I2aXic8rEHNpfAdW8yEISMCt8rE6V3qKXups2ih0/r7lMBzAZu6FM4D67zvxmpduzC59tSDpy0p7wZJ325p4wWeI7jBqOztF9c054sGXixoqEgFZREsilobag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(366004)(396003)(346002)(376002)(136003)(31696002)(53546011)(26005)(316002)(31686004)(478600001)(186003)(83380400001)(166002)(16526019)(2906002)(6486002)(966005)(52116002)(33964004)(36756003)(86362001)(8936002)(66476007)(66556008)(16576012)(5660300002)(44832011)(2616005)(956004)(66946007)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	X/kcjAf++a07nU4vg30D9suh3neoLgxRexW3KZIaVmFakZNAg9kxnNtSp+6k2WOukyJxPhGr8WHfatSy9PrEnv2uIQ8fy0mrRFBFzwuuIHArZFJ4W5QijZIH6aher4ljYx/pG7x/SwvyaB8ptVRnE50OFSdMJM3ovIIzWHIVbOezYPH+redptY9qTNUK2SvPd6JCQWogEu/tYX4pMH6qkFjTEinLBDDrxWxWoic2ANe9Od90LbpcMLudoSpdWm2/sJiqljf/sGKDxR5YzTFdZNX0D1aWwDAETYPLNhbzT4Umjnyfyq+qn+Dp8eBhpR82e/Gxqx4g8CQpTG8Q9n3+S051qOaG9ETWs0fEu3jwIJRqDEmSu2k84KP/woIFFUBbk+XEQnMGHdQpoM724D1qqy7HekyTZqZy8lU97TVyqc3NZ6o576xqWsd3+vQuP+7aZ3PdhSt6qWiWRsc7cxgGooYWLkfsZRB762xpOsIYt38=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050fae44-d697-45ec-645b-08d81907aa01
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 12:59:58.3293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4kFHXgjKfolAUr8pJOnvryxiSZwPvk1Q9PuthzMNEiA3QzN47/X34cW2kD/NE487bdE60bl4gzhnuUx8jYE9V/iR8+qL33NFG5Yubr5kt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3746
Content-Type: multipart/alternative;
 boundary="------------69BC8921B81A666836239A76"
Content-Language: en-US

--------------69BC8921B81A666836239A76
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/24/20 11:16 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-netaddr.inc    | 13 -------------
>   .../python/python3-netaddr_0.7.19.bb              | 15 +++++++++++++--
>   2 files changed, 13 insertions(+), 15 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-netaddr.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-netaddr.inc b/meta-python/recipes-devtools/python/python-netaddr.inc
> deleted file mode 100644
> index bea9be674..000000000
> --- a/meta-python/recipes-devtools/python/python-netaddr.inc
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -SUMMARY = "A network address manipulation library for Python."
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
> -
> -SRC_URI[md5sum] = "51019ef59c93f3979bcb37d3b8527e07"
> -SRC_URI[sha256sum] = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"
> -
> -inherit pypi
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-pprint \
> -    ${PYTHON_PN}-xml \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
> index 30416a4ff..75460caa7 100644
> --- a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
> +++ b/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
> @@ -1,2 +1,13 @@
> -require python-netaddr.inc
> -inherit setuptools3
> +SUMMARY = "A network address manipulation library for Python."
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44"
> +
> +SRC_URI[md5sum] = "51019ef59c93f3979bcb37d3b8527e07"
> +SRC_URI[sha256sum] = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-pprint \
> +    ${PYTHON_PN}-xml \
> +"
>
> 

--------------69BC8921B81A666836239A76
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/24/20 11:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200624151628.547-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200624151628.547-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-netaddr.inc    | 13 -------------
 .../python/python3-netaddr_0.7.19.bb              | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 13 insertions(&#43;), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-netaddr.inc

diff --git a/meta-python/recipes-devtools/python/python-netaddr.inc b/meta-python/recipes-devtools/python/python-netaddr.inc
deleted file mode 100644
index bea9be674..000000000
--- a/meta-python/recipes-devtools/python/python-netaddr.inc
&#43;&#43;&#43; /dev/null
@@ -1,13 &#43;0,0 @@
-SUMMARY = &quot;A network address manipulation library for Python.&quot;
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44">&quot;file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44&quot;</a>
-
-SRC_URI[md5sum] = &quot;51019ef59c93f3979bcb37d3b8527e07&quot;
-SRC_URI[sha256sum] = &quot;38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd&quot;
-
-inherit pypi
-
-RDEPENDS_${PN} &#43;= &quot; \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-xml \
-<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bbb/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bbindex30416a4ff..75460caa7100644---a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb&#43;&#43;&#43;b/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb@@-1,2&#43;1,13@@-requirepython-netaddr.inc-inheritsetuptools3&#43;SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
index 30416a4ff..75460caa7 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-netaddr_0.7.19.bb
@@ -1,2 &#43;1,13 @@
-require python-netaddr.inc
-inherit setuptools3
&#43;SUMMARY = &quot;</a>A network address manipulation library for Python.&quot;
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44">&quot;file://LICENSE;md5=e6345d695ffe3776f68a56fe7962db44&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;51019ef59c93f3979bcb37d3b8527e07&quot;
&#43;SRC_URI[sha256sum] = &quot;38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot; \
&#43;    ${PYTHON_PN}-pprint \
&#43;    ${PYTHON_PN}-xml \
&#43;&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------69BC8921B81A666836239A76--
