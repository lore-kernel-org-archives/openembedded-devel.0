Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.49])
 by mx.groups.io with SMTP id smtpd.web12.4852.1594857176658605200
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2020 16:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=l/GcYvBx;
 spf=pass (domain: windriver.com, ip: 40.107.244.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gExo1vMgZ0JAdPDYhyLVWzmatxPCJeTqgrMFFHT7Lrjs4YQe4mm6v88emQVwAV+uy9yea8C9LgLX8TslV/jhJtKnOzbJaTf6JhWpJP67Iave+TpfNye8sjweeFXkmpTu0DuQkBtolCg6qp4KExBDhCMh3gyyTffTRH94OTNdO5U6GAMf/0n8ECyEzfnrK1KPx8weZvh8arLkcx+T+6wWKrZX14pWb+7eNIY4KWQa91oOdf/vB7w7yk5apDUm6heHeHqc2mTGlklAHrNuENmQhrZn/8SvqKtVAsq7XCUN/lbEhBhqzZ7Axi4Gd1EM9X/RC+d/BQddvwuUKx0MoO0Mug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIjWi6ZUh1bvtQXC1M6IXw1BsdnnOwbw7GUtbd5MVrQ=;
 b=MxW9W9SkgwHt3zFprJkZoxp/8s8XAk0X2GmstSWeMPIxc1qhn0s8qZwh1Q3yTF554OeBIZs2baV3yMYxMpTw1eHDHaCQj69RQBx+MybrJ7pTi9p+kT2VikxmvIRYguEDv1CcSXl6Mpv+h+y+zJp+QM69e+Dc7bZmr6xG6i/WVHQM2/qaJwTtCw+DIYrr1OlAxJEyq9PpqE906MoRJIQD6HD9vnXUdgGGnUm1rYIFnSYLPlJRnwlJcP4oD6iRAOFxaKC4+FQiimF7WdXJC6FkkZbr3bHzFGTOWU2JnNP4nrHore/xUohhBeqjRsTSJz2wYHpEQkd8giZFdd19UZyj3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIjWi6ZUh1bvtQXC1M6IXw1BsdnnOwbw7GUtbd5MVrQ=;
 b=l/GcYvBxNfadC0Y5/sjJ5BPj80ldJu1XuGhBX5EDUpPr0gWeHaOlFOqJ/jx6Jhg4Jz9+9ZoRMcprkUp4ky97rIQqJWLt1Okxg5tMj4STg5CVM3KLBV4biygchA3hvR8auUA26cQVwhkcDEDrwWYMPceonoPoAu0xt7HUiuf5OS0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB0055.namprd11.prod.outlook.com (2603:10b6:910:76::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.24; Wed, 15 Jul
 2020 23:52:55 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Wed, 15 Jul 2020
 23:52:55 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-rsa: add new package
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200711031932.5883-1-akuster808@gmail.com>
 <20200711031932.5883-3-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <42b338ee-a648-58f4-91ac-14f2b6912993@windriver.com>
Date: Wed, 15 Jul 2020 19:52:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200711031932.5883-3-akuster808@gmail.com>
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Wed, 15 Jul 2020 23:52:54 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b406b319-b803-4398-fc51-08d8291a3189
X-MS-TrafficTypeDiagnostic: CY4PR11MB0055:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB0055ED8463F11FBDD19858FB9F7E0@CY4PR11MB0055.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EADqiOt0Eey6JNoNfXLUbTu4NX2TvsB8iNPiJTLpft44wYkfYQQoZYmW1/Gs5Iyy4T4uiK3h9iWf/ip2LMNYE8NxUQoRoixoJ8nXW1HX7vOJfD5cwxyfLyS0IQiJtaQgOe+n3uSBi5qPQgtNIjDvodfHBRzeepiovp+CcIl3JIIMRNUkZhwEpH4DgA0elMItRSWXXYS6PMr/xZIya30gpe92ffYapvQ0He18b+/ABTIDRhwK72TTFtEqB0Xbm0UIMIriF9BlyxKmLLD04Jay9MColmkgnEszWGhydRSD7VWlUtlGRYHgzasrnSdKpv5+mU3GWBKAtdJDtLzP/oVY69atn9oTv91qOBE7cyezStgBVC5Ojzmv2dNhP7mOxJ6tlagunXIU8Q7yfEl5oAgoM8kiYghFCjNG9B8t4OawuB798dDdbTJkHn/rjyMxjgs6bifhmOmXvl45kxIyWjdmYA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(366004)(39850400004)(396003)(136003)(86362001)(316002)(8936002)(31696002)(2906002)(5660300002)(478600001)(16576012)(166002)(966005)(36756003)(31686004)(8676002)(186003)(956004)(16526019)(52116002)(44832011)(66946007)(83380400001)(6486002)(66476007)(26005)(2616005)(33964004)(53546011)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	zRmaqH739xFgfkZA/Womfq/8MLMEWxYFCcBrGiPffpg5AFBPcsx5ztqUPQAlUkO9U77y9NxHsGpfXRHC09+3a1dLxoJSELJ68QNF1sb8cdZI8fHyNFIF5UuVwqcLmHJgAUa0qLc0b1+tGbW8UBKmmCQE0SjQULZsadcVq+/v90XtNr5WwQWOVZzo1F2VAI20FpNpAjbqMDoWPyGTyflysNmqQ2Ph5lW+9ye/IFy1G31lXTaJkzkXXow5nL3iXqGrGmX8RdTOR4V+2iDhL27TjjrHMBjodR8ipac/YXJ3sTCN7djUOF46GDD8Ma3xXg4t0qxI7O94BD56jvAlPj/Ax37ndzuz0ljlXy9/GYCxByWrXX2hUY4Rn8ZyuVWlymQOYDm6ERChw666QhWPprmz9tNS83DGGrKNImCkt5S9OASREah11Bphy68eJhERMp8NnuBy3dpQi4qGFnQ1pqdFgIOfRHuZIAQyRlsPnDfN1hg=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b406b319-b803-4398-fc51-08d8291a3189
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 23:52:55.3678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCRXmnFLgWtfc6cDPdPP47o+qiw40TEwIH/RSe/DFMf+KrvbESszucqnx0XeDgOF3e3Sy4Mubox5P4Snq5opaAhrhnFKia4f+GL/jPmdFFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0055
Content-Type: multipart/alternative;
 boundary="------------D928B9FA2D432F60674EBD0D"
Content-Language: en-US

--------------D928B9FA2D432F60674EBD0D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/20 11:19 PM, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-rsa_3.4.2.bb               | 44 +++++++++++++++++++
>   1 file changed, 44 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb b/meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb
> new file mode 100644
> index 0000000000..759214fa38
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb
> @@ -0,0 +1,44 @@
> +SUMMARY = "Pure-Python RSA implementation"
> +SECTION = "devel/python"
> +AUTHOR = "Sybren A. Stuvel"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
> +
> +SRC_URI[sha256sum] = "25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5"
> +
> +inherit pypi setuptools3 update-alternatives
> +
> +ALTERNATIVE_${PN} = "\
> +    pyrsa-decrypt \
> +    pyrsa-decrypt-bigfile \
> +    pyrsa-encrypt \
> +    pyrsa-encrypt-bigfile \
> +    pyrsa-keygen \
> +    pyrsa-priv2pub \
> +    pyrsa-sign \
> +    pyrsa-verify \
> +"
> +
> +ALTERNATIVE_LINK_NAME[pyrsa-decrypt] = "${bindir}/pyrsa-decrypt"
> +ALTERNATIVE_LINK_NAME[pyrsa-decrypt-bigfile] = "${bindir}/pyrsa-decrypt-bigfile"
> +ALTERNATIVE_LINK_NAME[pyrsa-encrypt] = "${bindir}/pyrsa-encrypt"
> +ALTERNATIVE_LINK_NAME[pyrsa-encrypt-bigfile] = "${bindir}/pyrsa-encrypt-bigfile"
> +ALTERNATIVE_LINK_NAME[pyrsa-keygen] = "${bindir}/pyrsa-keygen"
> +ALTERNATIVE_LINK_NAME[pyrsa-priv2pub] = "${bindir}/pyrsa-priv2pub"
> +ALTERNATIVE_LINK_NAME[pyrsa-sign] = "${bindir}/pyrsa-sign"
> +ALTERNATIVE_LINK_NAME[pyrsa-verify] = "${bindir}/pyrsa-verify"
> +ALTERNATIVE_PRIORITY = "30"
> +
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-compression \
> +    ${PYTHON_PN}-crypt \
> +    ${PYTHON_PN}-doctest \
> +    ${PYTHON_PN}-logging \
> +    ${PYTHON_PN}-math \
> +    ${PYTHON_PN}-multiprocessing \
> +    ${PYTHON_PN}-netclient \
> +    ${PYTHON_PN}-pickle \
> +"
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-pyasn1"
>
> 

--------------D928B9FA2D432F60674EBD0D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/10/20 11:19 PM, akuster wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200711031932.5883-3-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200711031932.5883-3-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-rsa_3.4.2.bb               | 44 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 44 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb b/meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb
new file mode 100644
index 0000000000..759214fa38
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb
@@ -0,0 &#43;1,44 @@
&#43;SUMMARY = &quot;Pure-Python RSA implementation&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;AUTHOR = &quot;Sybren A. Stuvel&quot;
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634">&quot;file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634&quot;</a>
&#43;
&#43;SRC_URI[sha256sum] = &quot;25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5&quot;
&#43;
&#43;inherit pypi setuptools3 update-alternatives
&#43;
&#43;ALTERNATIVE_${PN} = &quot;\
&#43;    pyrsa-decrypt \
&#43;    pyrsa-decrypt-bigfile \
&#43;    pyrsa-encrypt \
&#43;    pyrsa-encrypt-bigfile \
&#43;    pyrsa-keygen \
&#43;    pyrsa-priv2pub \
&#43;    pyrsa-sign \
&#43;    pyrsa-verify \
&#43;&quot;
&#43;
&#43;ALTERNATIVE_LINK_NAME[pyrsa-decrypt] = &quot;${bindir}/pyrsa-decrypt&quot;
&#43;ALTERNATIVE_LINK_NAME[pyrsa-decrypt-bigfile] = &quot;${bindir}/pyrsa-decrypt-bigfile&quot;
&#43;ALTERNATIVE_LINK_NAME[pyrsa-encrypt] = &quot;${bindir}/pyrsa-encrypt&quot;
&#43;ALTERNATIVE_LINK_NAME[pyrsa-encrypt-bigfile] = &quot;${bindir}/pyrsa-encrypt-bigfile&quot;
&#43;ALTERNATIVE_LINK_NAME[pyrsa-keygen] = &quot;${bindir}/pyrsa-keygen&quot;
&#43;ALTERNATIVE_LINK_NAME[pyrsa-priv2pub] = &quot;${bindir}/pyrsa-priv2pub&quot;
&#43;ALTERNATIVE_LINK_NAME[pyrsa-sign] = &quot;${bindir}/pyrsa-sign&quot;
&#43;ALTERNATIVE_LINK_NAME[pyrsa-verify] = &quot;${bindir}/pyrsa-verify&quot;
&#43;ALTERNATIVE_PRIORITY = &quot;30&quot;
&#43;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;    ${PYTHON_PN}-compression \
&#43;    ${PYTHON_PN}-crypt \
&#43;    ${PYTHON_PN}-doctest \
&#43;    ${PYTHON_PN}-logging \
&#43;    ${PYTHON_PN}-math \
&#43;    ${PYTHON_PN}-multiprocessing \
&#43;    ${PYTHON_PN}-netclient \
&#43;    ${PYTHON_PN}-pickle \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-pyasn1&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D928B9FA2D432F60674EBD0D--
