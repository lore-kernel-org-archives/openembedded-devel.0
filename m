Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.41])
 by mx.groups.io with SMTP id smtpd.web10.12754.1598359402311733172
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fB+hyU32;
 spf=pass (domain: windriver.com, ip: 40.107.223.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWt2O7M9QR2ytAmhTvwWNpCZtpfV0x6E93cKKajvSNtd3idptQxvvN4uFWJ21c8g47YodYJ6eijvd1EENXc50cLeH09OPuOszjKh7WmnEvxX/WxqPS2FzJ5EU4MeMHw8zPGihgeio77DQjHG99kry94AVgky+2x1aBpSCMJmQYsoXJ6QKUuvh+VBaHPsLP033Ibmlk7AMfAC40fWfuX2OuW3sSGAjKsycwrJuTWYVAvvcGFrS5wY54rRVignAKZJXzjGqhvz6YmM42ikCA1JBOgs+NRYCq8lXwNSzCE98RZQOSpES6+DzpUaDc6bQMebrhZL4wWfbDLX/XYo59g/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ul6Ux9ugdX16wz0LDOU9hl055/BK5KQCKhrO881ugyU=;
 b=BkS/cXmJyiInY/PQ1/itlFDwKABbaCP/R+4B3qjojvt4Q0MEQuCLcGkU9P9vYVd/YknugswajTzTeg1Sp1QAG/h4ZuvGvu/zhlaB0oUnJF2LsVy3Uzx0tFdUFjV1Dh60ZKCC3u3SeK85gtaNCQ+IJal9+6lUpMxQqgW8uyJnWRua4nymsG2LAK+TTbR7/X08Gp0tTJQDthNMlDk7oyutk3RuQnn43ODA9t72wdicNIQvDFfST/16Pxgjvpg0Q1VH9WdfYD+yHomdk0aXGdnQUS5AVHBAeUiCsm5bIFReVGh3XABnnuLImYH0+3kTiZQxytgY1mKOU1Aa3I8ENXgPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ul6Ux9ugdX16wz0LDOU9hl055/BK5KQCKhrO881ugyU=;
 b=fB+hyU32gxGOfpwmnyla0OBih5mLo3PHwwOiUb/0SjBbmENuxRq2J9dN+NV137MPxZdROW9OsdRVWzioc2SilhiTOg9Vn7ys736WAeRjvg6KKitE7K804UABP2BOkAzYPfJVdM4k19uZzx/QvcJZQhrY0ZpdSzwQjvzhZYAJCww=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 12:43:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:43:21 +0000
Subject: Re: [oe] [meta-python][PATCH 11/11] python3-pywbemtools: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200821234504.719-1-leon.anavi@konsulko.com>
 <20200821234504.719-11-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9f63a5b1-9ecb-4912-3e7c-2f2e7a975b83@windriver.com>
Date: Tue, 25 Aug 2020 08:43:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200821234504.719-11-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 12:43:20 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a14072a-2d4a-4df9-0872-08d848f472c5
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB42604CF2148691A0642F3D3B9F570@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CUzOut+pw1trbO8b1O6xILJb/WSumM6+XaRny+gTiuJJOY1JZOqxn/OyQj5kq7f770SjpWFVGJxj/h0e2HswLJBHND3rrvpjiI4fBLUwj5TrwVVD4lXB35EeChy65NObFXAweWij1maVXe14j/Q3feQXPpDa9zEE7yZE2x0eN+B8ONMGGQEudyN5WwCV6ceoJRtM4FezcRZAyNvZBdAXFw53t3WbyL+TQrGhFxUJpaUaZ1qbSEl+IJYOn+Ltg1VLZfnsLxWmGY1NFRwE4Zv+io/P1wrZw4xdSMLXaZcSykqFYKrGW4zis3F2PIflNl9TaVnUewTrd6PEvCVUUW73suFzVPfOPr1iIWYC+5wlcZiLva5SHqPVd0UeH3HonhZ3emMOKnOFgs4ukfX4UYI5+Wa8mxhaGJptqZhf9aWSM8ZnsFSjvblQUTHuv8phM0CA3FM/vmrjztBY0rn3ArhM0Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(366004)(186003)(66556008)(66476007)(52116002)(66946007)(6486002)(966005)(8676002)(36756003)(33964004)(316002)(5660300002)(16576012)(31686004)(31696002)(26005)(86362001)(53546011)(2616005)(956004)(44832011)(166002)(478600001)(83380400001)(2906002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8jUy01YLqsR7y6EPgW/4c3EB9sR7S25uUO3bJRv+H0Oaadqw8WQcE++WFt1xAGU77jIFhf/ce/PKwsVUqei0OEzK1JQbo+H8ob/UK7wuVRwi0YxjSzXRX1uhkWWu9dURWeOiv9PoxHSNt1J+oodreTUBPOKqF0z0n/KILCPMelhaWzChXpN+4qnnpdUWABa2dWd876nl+eah8JliL9hNLgbojXUucaDdewgx9w6YJRJ39EP9Iir68WUh117TZyNdR+06GXJOIg3CbOK3iTTnDqBsuLLlIR94Dl1ac9r2aH+QFHtljuhcUjbpAA/sUb6HEXBOSRtEunvqe6+OekvE2tBJtd+YyVZbOM3zGu3mWDbi15poasihxDMgwiwtLdnaa9kDgQa65ULJFln7eQ+orekh7bSn6trJC25HbhIaefcgjcBD5xcZzUosyIW3uq28s1bVf2tys/zMZCFjBta8/OhM3SYAk8W+Bt8ATXUIdmEUCDM/lArSy/CSXGplvdtjc4IekrDBl/JEr7EEDipDmHiy1qTXmw0KolLQtXlWcfGvTqsQzR/Xtsr2VuMjolTv6TBGoPzNYM+EJRyMumRO3lSCQRt0ll8loruPxATNvU1W9Ki4RXTWVxsYpeBafguBPos3eMm3seDzGXh9eQ4+hg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a14072a-2d4a-4df9-0872-08d848f472c5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:43:21.1298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4h8eA7sO211g7IvZO+ao6RE5u5GSMHL4A9L2ylj6TM7qyGwyDtah2WiPH3ORYtQVpnaIJ/Ha4TLrqxEppPB5q2WzKcawO0rOdu0NxehVfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------4395A68E913DD5492776B5D8"
Content-Language: en-US

--------------4395A68E913DD5492776B5D8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/21/20 7:45 PM, Leon Anavi wrote:
> Add release 0.7.1 of the python client tools to work with WBEM
> Servers using the PyWBEM API:
>
> - Pinned prompt-toolkit to <3.0 on Python 3.8 on Windows to avoid
>    WinError 995
> - Fixed exception when command entered in interactive mode, on
>    Python 2
> - Test: Default connection file does not get restored in some
>    cases during test.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../pywbemtools/python3-pywbemtools_0.7.1.bb  | 40 +++++++++++++++++++
>   1 file changed, 40 insertions(+)
>   create mode 100644 meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb
>
> diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb
> new file mode 100644
> index 000000000..05f77288e
> --- /dev/null
> +++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb
> @@ -0,0 +1,40 @@
> +SUMMARY = "A set of tools using pywbem"
> +DESCRIPTION = "A set of tools using pywbem to communicate with WBEM servers"
> +HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
> +
> +SRC_URI[md5sum] = "a789da735c04ddc08ba828cd8022243e"
> +SRC_URI[sha256sum] = "d2fe776c78a740215142f4f033055093f2283fd9327440c59734716e51e19989"
> +
> +inherit pypi setuptools3
> +
> +DEPENDS += " \
> +    ${PYTHON_PN}-pyyaml-native \
> +    ${PYTHON_PN}-pywbem-native \
> +    ${PYTHON_PN}-six-native \
> +    ${PYTHON_PN}-click-native \
> +"
> +
> +RDEPENDS_${PN}_class-target += "\
> +    ${PYTHON_PN}-ply \
> +    ${PYTHON_PN}-pyyaml \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-pywbem \
> +    ${PYTHON_PN}-click \
> +    ${PYTHON_PN}-requests \
> +    ${PYTHON_PN}-prompt-toolkit \
> +    ${PYTHON_PN}-mock \
> +    ${PYTHON_PN}-packaging \
> +    ${PYTHON_PN}-nocasedict \
> +    ${PYTHON_PN}-yamlloader \
> +    ${PYTHON_PN}-click-repl \
> +    ${PYTHON_PN}-click-spinner \
> +    ${PYTHON_PN}-asciitree \
> +    ${PYTHON_PN}-tabulate \
> +    ${PYTHON_PN}-pydicti \
> +    ${PYTHON_PN}-nocaselist \
> +    ${PYTHON_PN}-custom-inherit \
> +"
> +
> +BBCLASSEXTEND = "native"
>
> 

--------------4395A68E913DD5492776B5D8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/21/20 7:45 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200821234504.719-11-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Add release 0.7.1 of the python client tools to work with WBEM
Servers using the PyWBEM API:

- Pinned prompt-toolkit to &lt;3.0 on Python 3.8 on Windows to avoid
  WinError 995
- Fixed exception when command entered in interactive mode, on
  Python 2
- Test: Default connection file does not get restored in some
  cases during test.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200821234504.719-11-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../pywbemtools/python3-pywbemtools_0.7.1.bb  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb
new file mode 100644
index 000000000..05f77288e
--- /dev/null
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.1.bb
@@ -0,0 +1,40 @@
+SUMMARY = &quot;A set of tools using pywbem&quot;
+DESCRIPTION = &quot;A set of tools using pywbem to communicate with WBEM servers&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pywbemtools.readthedocs.io/en/stable/">&quot;https://pywbemtools.readthedocs.io/en/stable/&quot;</a>
+LICENSE = &quot;Apache-2.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa">&quot;file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa&quot;</a>
+
+SRC_URI[md5sum] = &quot;a789da735c04ddc08ba828cd8022243e&quot;
+SRC_URI[sha256sum] = &quot;d2fe776c78a740215142f4f033055093f2283fd9327440c59734716e51e19989&quot;
+
+inherit pypi setuptools3
+
+DEPENDS += &quot; \
+    ${PYTHON_PN}-pyyaml-native \
+    ${PYTHON_PN}-pywbem-native \
+    ${PYTHON_PN}-six-native \
+    ${PYTHON_PN}-click-native \
+&quot;
+
+RDEPENDS_${PN}_class-target += &quot;\
+    ${PYTHON_PN}-ply \
+    ${PYTHON_PN}-pyyaml \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-pywbem \
+    ${PYTHON_PN}-click \
+    ${PYTHON_PN}-requests \
+    ${PYTHON_PN}-prompt-toolkit \
+    ${PYTHON_PN}-mock \
+    ${PYTHON_PN}-packaging \
+    ${PYTHON_PN}-nocasedict \
+    ${PYTHON_PN}-yamlloader \
+    ${PYTHON_PN}-click-repl \
+    ${PYTHON_PN}-click-spinner \
+    ${PYTHON_PN}-asciitree \
+    ${PYTHON_PN}-tabulate \
+    ${PYTHON_PN}-pydicti \
+    ${PYTHON_PN}-nocaselist \
+    ${PYTHON_PN}-custom-inherit \
+&quot;
+
+BBCLASSEXTEND = &quot;native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4395A68E913DD5492776B5D8--
