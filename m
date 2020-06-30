Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.76])
 by mx.groups.io with SMTP id smtpd.web10.15256.1593523416275823038
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 06:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QxRUQNAi;
 spf=pass (domain: windriver.com, ip: 40.107.93.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSQkYxA4Jl1xZEmS2jOz7EDzhHG2l+HaruW4ebfC0Vy28vCcU0YWEn19YBq3EH5B+D1H7en5uP4KhUlRQnXBdD0zvQJqe/Xai3UbPEEHjjJXblnZVmUwkxfxjULES/vqJX/k0XrA6gaxEn4hC3OcYl1e1hGdmz7LWgvqdgjlXP203tcKqDrsP1TimresdNp1I1bv6kuKq9wJz7vHDwIz77SvPyKbY7rXzLQTZ+D8AnW3EPdRUhbyJ5UhgQGT6KeFwhvqsgk9wM42heAJPJYeaRym5avasJnjnUrMK4kkBNCje/MIkbpM1XYAgrfCG4LlBA5/bkOyr3mg3satREvozA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAiWTSKgGlfjMeEnHwtwdhKXNFBkX/8r19Fuc7BPtjs=;
 b=KiHGncdk2vkwwES6oGrWEHfksQJxtgISHB1kmBnMM9FvPJqiEWClDSopRLYhMR3FOx/oytZ3RyTGdinNqlUFfqPqKTpKmb+0hjRvaX4SeIzxztC+jRZ+MAUKZMy4n3sISG4NI1ADcwWBzzht7PEuNrb8wTtcHh/6/uOubsk5wt43JkIaqZZbgTqLJsF2XAY/5VypTUG/Wwvl2/CdGwiQhcseNC8pW4Xw9EgwODr7dBCXLHMCuCi+BojcstnPQ/SVO1ZOrY9Z3m4RVxaxopTcLKEovRHvH5MrnTcq0tB6RGM37a3wVJNAE96BA4yZBg1jjbVh+QjWEflpqfEqBbTAKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAiWTSKgGlfjMeEnHwtwdhKXNFBkX/8r19Fuc7BPtjs=;
 b=QxRUQNAilG4Kza0tk3ijJogAPy+MBeoooCWPRB+xDKnBnSBY67axF/Vj7yyNWBP+CE+/41P9++Wqf71OTfh5EXm62/e98Sic1846H2DewJSguo2mEhcw+WCO8S6rpcPGDjOSxxsozY/otT4Smnt9msky1KSx8Tyt1F6J525Y/fU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB1286.namprd11.prod.outlook.com (2603:10b6:903:2e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Tue, 30 Jun
 2020 13:23:35 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 13:23:35 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-pyparted: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <986e91b7-76db-f9f1-8cf2-f77deb4d4150@windriver.com>
Date: Tue, 30 Jun 2020 09:23:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200629121233.27026-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::38) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Tue, 30 Jun 2020 13:23:34 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be1c3d22-3379-49fa-3cbe-08d81cf8ca77
X-MS-TrafficTypeDiagnostic: CY4PR11MB1286:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB12865CD0DD016B04856855A29F6F0@CY4PR11MB1286.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fO/4vgsQ+d3Cp3vBLOm4S2z2DRCMX7goU0vzSa5d14RoD63Kkc2NPtql/GjNdwdoCQMQf7RGORCF6ryw2jWcHLomoNZJ9KbFFm5duqs5Nsd0Y2VM3S9OQpyIFDOphw5krkxRoOOKXdQNuU0kG/Eei+FvpbaNeb7EIkV/OjXcMo/K9XWsj9LjmYUPt7MddZCMqsJw6Vrn3b8H+MENcgwgoq/focXKjofxbysuwd50/SgOFBL8HjPTn1gCFNeGW9qV2PU8SfEuA6I8OR+z+4YvXDBGbn0GPXIFp381c4weEamQ8nff7TFE7XgeVQLvG2MWaiexm+lIoK1xQChxAZhISwH0AalSXtGDN8dGLAWrymgTSJYugzW62qEiicn5TI4l6XFQpJhhs564NzisxQ4OXRXaFTX/+jnqQ7oRHxfQ7CtZFgbt11hHbO5qL7TY+COqCYnbTPHqP2SEBsrnLa+RIg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(498600001)(31696002)(86362001)(31686004)(166002)(2906002)(6666004)(966005)(5660300002)(83380400001)(26005)(33964004)(53546011)(186003)(52116002)(66476007)(16526019)(66946007)(66556008)(16576012)(956004)(2616005)(6486002)(8676002)(36756003)(8936002)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/n9jxTtvSIQlh0/pPGZh/nT+KZHEH+nwKjM0GcehMNHU6l3VoKIZoG8SiZYEWPP8dJp7tWPJMrLXXf19VV8Gtx2E7E18gFHu+QEMoLAvgoPYZuivZ+Uhu7M/ki+mo2yNpCYzYXaQW+Yy5eh0fV+BGj12YmMq2DHZ3a7+PsqbWzr469P5UXBw4Z3dN8cHBAiLopOb2oDQpdnZztN0RvQt8svecImhRFRtaGBdqBi7ydWBkZ4tEJdbd7lTt/rGi848ww5fJvnjolmFkhr4qOCs+R4mHqxlXzMe5SbL0I1pIaxLRAwZJc2iFSNDLJ3renzqtUmSVCR+6hePHtAToVojWzFToseV0JoQs2Ee3Od4bePYFZigEzc5SRKuJPjG/IwJCZnO3rH3Bc1SLfdDYxB6modBYS1RqqEnx+wtzaPaeXfQGTKcc8kyHKXlA+Lqd9u3H0VCC6De/T6DrJ2hH4mj+2+hWrXVsfg53AxFKt4ecEoPWAdpcUo5ivAvg4XsMkiZ
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be1c3d22-3379-49fa-3cbe-08d81cf8ca77
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 13:23:34.9323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emCkdB7kDYqpktzD+zWdU12GaBhnpcguueeA6IrAJajWgJ+ZmmGjgHtUrw1+Tr3lBPRaRBwksI6qn+02vHSPaWT9H+xu2jxnt2ZZIPI5uGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1286
Content-Type: multipart/alternative;
 boundary="------------4020A9C818B98F57BE03ED41"
Content-Language: en-US

--------------4020A9C818B98F57BE03ED41
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/29/20 8:12 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python-pyparted/python-pyparted.inc       | 22 ------------------
>   .../python3-pyparted_3.11.3.bb                | 23 +++++++++++++++++--
>   2 files changed, 21 insertions(+), 24 deletions(-)
>   delete mode 100644 meta-python/recipes-extended/python-pyparted/python-pyparted.inc
>
> diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted.inc b/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
> deleted file mode 100644
> index 97054487f..000000000
> --- a/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -DESCRIPTION = "pyparted is a set of Python modules that provide Python programmers \
> -an interface to libparted, the GNU parted library for disk partitioning and \
> -filesystem manipulation."
> -SUMMARY = "Python bindings for libparted"
> -HOMEPAGE = "https://github.com/rhinstaller/pyparted"
> -LICENSE = "GPL-2.0+"
> -LIC_FILES_CHKSUM = "\
> -    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
> -    file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2 \
> -"
> -DEPENDS += "parted"
> -
> -# upstream only publishes releases in github archives which are discouraged
> -SRCREV = "481510c10866851844b19f3d2ffcdaa37efc0cf8"
> -SRC_URI = "git://github.com/rhinstaller/pyparted.git;protocol=https"
> -
> -S = "${WORKDIR}/git"
> -
> -RDEPENDS_${PN}_class-target += " \
> -    parted (>= 2.3) \
> -"
> -RDEPENDS_${PN}_class-native = ""
> diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb
> index d83901ff3..a801920c0 100644
> --- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb
> +++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb
> @@ -1,8 +1,27 @@
> -require python-pyparted.inc
> +DESCRIPTION = "pyparted is a set of Python modules that provide Python programmers \
> +an interface to libparted, the GNU parted library for disk partitioning and \
> +filesystem manipulation."
> +SUMMARY = "Python bindings for libparted"
> +HOMEPAGE = "https://github.com/rhinstaller/pyparted"
> +LICENSE = "GPL-2.0+"
> +LIC_FILES_CHKSUM = "\
> +    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
> +    file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2 \
> +"
> +DEPENDS += "parted"
> +
> +# upstream only publishes releases in github archives which are discouraged
> +SRCREV = "481510c10866851844b19f3d2ffcdaa37efc0cf8"
> +SRC_URI = "git://github.com/rhinstaller/pyparted.git;protocol=https"
>   
>   inherit distutils3
>   
> -RDEPENDS_${PN} += "python3-stringold python3-codecs python3-math"
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN}_class-target += " \
> +    parted (>= 2.3) \
> +    python3-stringold python3-codecs python3-math \
> +"
>   RDEPENDS_${PN}_class-native = ""
>   
>   BBCLASSEXTEND = "native"
>
> 

--------------4020A9C818B98F57BE03ED41
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/29/20 8:12 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200629121233.27026-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200629121233.27026-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python-pyparted/python-pyparted.inc       | 22 ------------------
 .../python3-pyparted_3.11.3.bb                | 23 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 21 insertions(&#43;), 24 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python-pyparted/python-pyparted.inc

diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted.inc b/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
deleted file mode 100644
index 97054487f..000000000
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted.inc
&#43;&#43;&#43; /dev/null
@@ -1,22 &#43;0,0 @@
-DESCRIPTION = &quot;pyparted is a set of Python modules that provide Python programmers \
-an interface to libparted, the GNU parted library for disk partitioning and \
-filesystem manipulation.&quot;
-SUMMARY = &quot;Python bindings for libparted&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/rhinstaller/pyparted">&quot;https://github.com/rhinstaller/pyparted&quot;</a>
-LICENSE = &quot;GPL-2.0&#43;&quot;
-LIC_FILES_CHKSUM = &quot;\
-    <a class="moz-txt-link-freetext" href="file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b">file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b</a> \
-    <a class="moz-txt-link-freetext" href="file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2">file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2</a> \
-&quot;
-DEPENDS &#43;= &quot;parted&quot;
-
-# upstream only publishes releases in github archives which are discouraged
-SRCREV = &quot;481510c10866851844b19f3d2ffcdaa37efc0cf8&quot;
-SRC_URI = &quot;git://github.com/rhinstaller/pyparted.git;protocol=https&quot;
-
-S = &quot;${WORKDIR}/git&quot;
-
-RDEPENDS_${PN}_class-target &#43;= &quot; \
-    parted (&gt;= 2.3) \
-&quot;
-RDEPENDS_${PN}_class-native = &quot;<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bbb/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bbindexd83901ff3..a801920c0100644---a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb&#43;&#43;&#43;b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb@@-1,8&#43;1,27@@-requirepython-pyparted.inc&#43;DESCRIPTION=">&quot;
diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb
index d83901ff3..a801920c0 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb
&#43;&#43;&#43; b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.3.bb
@@ -1,8 &#43;1,27 @@
-require python-pyparted.inc
&#43;DESCRIPTION = &quot;</a>pyparted is a set of Python modules that provide Python programmers \
&#43;an interface to libparted, the GNU parted library for disk partitioning and \
&#43;filesystem manipulation.&quot;
&#43;SUMMARY = &quot;Python bindings for libparted&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/rhinstaller/pyparted">&quot;https://github.com/rhinstaller/pyparted&quot;</a>
&#43;LICENSE = &quot;GPL-2.0&#43;&quot;
&#43;LIC_FILES_CHKSUM = &quot;\
&#43;    <a class="moz-txt-link-freetext" href="file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b">file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b</a> \
&#43;    <a class="moz-txt-link-freetext" href="file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2">file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2</a> \
&#43;&quot;
&#43;DEPENDS &#43;= &quot;parted&quot;
&#43;
&#43;# upstream only publishes releases in github archives which are discouraged
&#43;SRCREV = &quot;481510c10866851844b19f3d2ffcdaa37efc0cf8&quot;
&#43;SRC_URI = &quot;git://github.com/rhinstaller/pyparted.git;protocol=https&quot;
 
 inherit distutils3
 
-RDEPENDS_${PN} &#43;= &quot;python3-stringold python3-codecs python3-math&quot;
&#43;S = &quot;${WORKDIR}/git&quot;
&#43;
&#43;RDEPENDS_${PN}_class-target &#43;= &quot; \
&#43;    parted (&gt;= 2.3) \
&#43;    python3-stringold python3-codecs python3-math \
&#43;&quot;
 RDEPENDS_${PN}_class-native = &quot;&quot;
 
 BBCLASSEXTEND = &quot;native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4020A9C818B98F57BE03ED41--
