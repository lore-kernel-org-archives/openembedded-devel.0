Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.49])
 by mx.groups.io with SMTP id smtpd.web12.17780.1592833505051184090
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 06:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RlQUamfh;
 spf=pass (domain: windriver.com, ip: 40.107.92.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoQiWV8VCtJzeuXFzY29wCKp4mGT7z5EP+HVNvhHQ1OLV5hxKMl6iyS+kz1e4MGzg9rqb0W8tljEu2NB40Icuu9iuNosdroN9oIH0rm9QeJQcjRvtHXBvDU95x0X/dz0cfW17qL3L4K7fgyE5wGjf/8QdhpbASjTOjL2pIUcIVd4u2Qvysiz8ByxBnxNi6OOoKD+T1R6VZW7NViXd3y5aKhPmzmimtE2btvHaVrghf9au0qbbg10OzgERcgaaSvpylDngBVlMruIfXmTavdqk+VBpyxdFig/+d6VBnJ9rPm7bQ7j4XLPLPpRTiCA5Y8twd5YZZiNsvgDZOAutb8WSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbR2Q/gu7WPDLlQjVbC1QEYYM0do+CgontHobnfRiZE=;
 b=GDQDyNeVyATiZLF/VA/UdLRGruL1e4Rktzh4TkpeLdXS5HjeDkqgVQfARd0KGc+azlWq30lOXpeMlsX8OltLTzYNs0peQl3zU+D5OKja3d9hYMKMiaT2SJiC0VDtb0+DXn0XpyRnod5kmDaZDodnPoe6/DBUF5S0JtbksjREXHC2Y7OyR3gFwaYUD9vNpRZxCKBvS+WxjDevS3RsGXiCOJHpGJXIehkSqrgFH8BASHkHXEpMRj1zZcpyYjeqVzLP8EdTHYiKkGX2RF/ImP3nwV42XrrQkwP55HpfRKFuNPiV0Dorid9H5bpQPRqT/tRwBbimwIrQRyy4AVJUNhYfWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbR2Q/gu7WPDLlQjVbC1QEYYM0do+CgontHobnfRiZE=;
 b=RlQUamfhZXcAF9uPPfnK915LD6LLhOG4Nzm8gaJ2HsJ4w6bTpEfn1gYQ2J+9ri1tmK49kqPD42IOZnf5xmJxx5gcXcsRQd9w618suWqYppFQGrn8ajAUbXZbA5PFi/Mhb2r+wAgq830S2CGn3Bwk8gbINb0RHT6OyOWgHarJbE8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1779.namprd11.prod.outlook.com (2603:10b6:404:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 13:45:01 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 13:45:01 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-parse: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200619081011.25051-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fec0f437-bc29-dcd8-39d6-c982ca03ea21@windriver.com>
Date: Mon, 22 Jun 2020 09:44:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200619081011.25051-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::48) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 13:45:00 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fa8e693-3fe3-4ffb-13e3-08d816b275c5
X-MS-TrafficTypeDiagnostic: BN6PR11MB1779:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1779B2C7A5C93BD0B76B13E39F970@BN6PR11MB1779.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GFu5ucsO5C46xQSF+dJ3ymA8w+eyYHnxudyhv2MkHGWgixDDWPOdTgfreXPcbEBaC3lTP9wMW7tHY072/xZDYObOIqXKrVyfEEx9vC2HqXXfh6VkE7dbu586xYGBw3nn/t+Lo3F/IcbCVDZ4xraB/0rCMscCZ9INh/yjLMKQJX/4YfWtVVNII7Z97yIqDtHNkZInmIr6UVFC0DnrUZ/MuprFIR/0gi27rq+heRXidJPPvNdAMBlF1bGlO9Y0DPWpzisf+V/EVLmhP0kgUnXp7V6HrF8lNisMpDj4SVT3sYrGWYZfiFSICQtG1yENI/zx3fvLaVCoSNAc58GnyewMlmLsE6G4VwD2UraUQ3prjdLZyGbw+Pfg/C9ilePup+2Mj8iOerp9nk1O4dDRwAnZysHHNw040Jeo/M/PmTtZpIEgT3MkOH4MI0A53bT6gjODCmvvawTGdH+libZ/1Hoy6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(39850400004)(136003)(396003)(53546011)(44832011)(66476007)(66556008)(2906002)(83380400001)(26005)(86362001)(166002)(33964004)(8676002)(36756003)(8936002)(31696002)(6486002)(16576012)(5660300002)(966005)(478600001)(31686004)(66946007)(2616005)(186003)(16526019)(52116002)(316002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	GoWQsfni4Oubc7zwjl5YVLeFmgUDjP3qton0x+BVXC/ueQJUYuAJruWmXunZAxr68BxGRdfKDAF6ekFxDZR9lVDs9NRWmxSNPRKniaCttsfzeGlMVq3FNKf8yXHv2NQnC0F56X8wiG6R/tlJ9VXvuBRuxZps4Hy4fj5fSxT8lfP2xCin/We4acd/Izj4wgOS0+3+WnCyfsA+qcrK4XHjD7upCRFsmW1wDX1zs75WHc6g4/kNqiwcsTK7czMSpQty5GmL2A0zLUreFysw9UIj1NGf5ycxCsl5GyKbkMYykkh5r9d+kcfvSOOliGnBQrt6NJUhGbrr27JrCirliV74z9CEn+nVO0+d904PNHMd4ltJd0DJ1tABykvr3xHob/7dltpnUjOjPs+9U06thduzwt/PosDCeiqg/4N7eZBeL5vQGQCb1G/m2//g//hclLx4C7GcYgepyVr1lDmxtRL+MiX/B/xBtjwUfLcwkPi0Uuo=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa8e693-3fe3-4ffb-13e3-08d816b275c5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 13:45:01.3391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvgQ4ks9VqSJt1YCzBQtVlfV07WkAjdiEv1PofYbFkC6+3mwWl5JJ9cMknYzU4BtRn+IWMJqWyV89KcqfI9WhJyLp0TstSHtYCSFe3F1cAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1779
Content-Type: multipart/alternative;
 boundary="------------60EE7FD0027E8D6619829203"
Content-Language: en-US

--------------60EE7FD0027E8D6619829203
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/19/20 4:10 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-parse.inc  | 26 -----------------
>   .../python/python3-parse_1.15.0.bb            | 28 +++++++++++++++++--
>   2 files changed, 26 insertions(+), 28 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-parse.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-parse.inc b/meta-python/recipes-devtools/python/python-parse.inc
> deleted file mode 100644
> index ecfd67172..000000000
> --- a/meta-python/recipes-devtools/python/python-parse.inc
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -SUMMARY = "Parse strings using a specification based on the Python format() syntax"
> -HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://parse.py;beginline=1325;endline=1345;md5=3d987b2e73881bbce768a80f9cdd23d9"
> -
> -SRC_URI[md5sum] = "a5aa82b2b8b4d733d227e3c99d7d01b4"
> -SRC_URI[sha256sum] = "a6d4e2c2f1fbde6717d28084a191a052950f758c0cbd83805357e6575c2b95c0"
> -
> -inherit pypi ptest
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-logging \
> -    "
> -
> -SRC_URI += " \
> -	file://run-ptest \
> -"
> -
> -RDEPENDS_${PN}-ptest += " \
> -	${PYTHON_PN}-pytest \
> -"
> -
> -do_install_ptest() {
> -	cp -f ${S}/test_parse.py ${D}${PTEST_PATH}/
> -}
> diff --git a/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb
> index b1242545c..bff41449c 100644
> --- a/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb
> @@ -1,2 +1,26 @@
> -inherit setuptools3
> -require python-parse.inc
> +SUMMARY = "Parse strings using a specification based on the Python format() syntax"
> +HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://parse.py;beginline=1325;endline=1345;md5=3d987b2e73881bbce768a80f9cdd23d9"
> +
> +SRC_URI[md5sum] = "a5aa82b2b8b4d733d227e3c99d7d01b4"
> +SRC_URI[sha256sum] = "a6d4e2c2f1fbde6717d28084a191a052950f758c0cbd83805357e6575c2b95c0"
> +
> +inherit pypi setuptools3 ptest
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-logging \
> +    "
> +
> +SRC_URI += " \
> +	file://run-ptest \
> +"
> +
> +RDEPENDS_${PN}-ptest += " \
> +	${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +	cp -f ${S}/test_parse.py ${D}${PTEST_PATH}/
> +}
>
> 

--------------60EE7FD0027E8D6619829203
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
    <blockquote type="cite" cite="mid:20200619081011.25051-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200619081011.25051-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-parse.inc  | 26 -----------------
 .../python/python3-parse_1.15.0.bb            | 28 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 26 insertions(&#43;), 28 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-parse.inc

diff --git a/meta-python/recipes-devtools/python/python-parse.inc b/meta-python/recipes-devtools/python/python-parse.inc
deleted file mode 100644
index ecfd67172..000000000
--- a/meta-python/recipes-devtools/python/python-parse.inc
&#43;&#43;&#43; /dev/null
@@ -1,26 &#43;0,0 @@
-SUMMARY = &quot;Parse strings using a specification based on the Python format() syntax&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/r1chardj0n3s/parse">&quot;https://github.com/r1chardj0n3s/parse&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://parse.py;beginline=1325;endline=1345;md5=3d987b2e73881bbce768a80f9cdd23d9">&quot;file://parse.py;beginline=1325;endline=1345;md5=3d987b2e73881bbce768a80f9cdd23d9&quot;</a>
-
-SRC_URI[md5sum] = &quot;a5aa82b2b8b4d733d227e3c99d7d01b4&quot;
-SRC_URI[sha256sum] = &quot;a6d4e2c2f1fbde6717d28084a191a052950f758c0cbd83805357e6575c2b95c0&quot;
-
-inherit pypi ptest
-
-RDEPENDS_${PN} &#43;= &quot;\
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-logging \
-    &quot;
-
-SRC_URI &#43;= &quot; \
-	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
-&quot;
-
-RDEPENDS_${PN}-ptest &#43;= &quot; \
-	${PYTHON_PN}-pytest \
-&quot;
-
-do_install_ptest() {
-	cp -f ${S}/test_parse.py ${D}${PTEST_PATH}/
-}
diff --git a/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb
index b1242545c..bff41449c 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb
@@ -1,2 &#43;1,26 @@
-inherit setuptools3
-require python-parse.inc
&#43;SUMMARY = &quot;Parse strings using a specification based on the Python format() syntax&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/r1chardj0n3s/parse">&quot;https://github.com/r1chardj0n3s/parse&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://parse.py;beginline=1325;endline=1345;md5=3d987b2e73881bbce768a80f9cdd23d9">&quot;file://parse.py;beginline=1325;endline=1345;md5=3d987b2e73881bbce768a80f9cdd23d9&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;a5aa82b2b8b4d733d227e3c99d7d01b4&quot;
&#43;SRC_URI[sha256sum] = &quot;a6d4e2c2f1fbde6717d28084a191a052950f758c0cbd83805357e6575c2b95c0&quot;
&#43;
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;    ${PYTHON_PN}-datetime \
&#43;    ${PYTHON_PN}-logging \
&#43;    &quot;
&#43;
&#43;SRC_URI &#43;= &quot; \
&#43;	<a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
&#43;&quot;
&#43;
&#43;RDEPENDS_${PN}-ptest &#43;= &quot; \
&#43;	${PYTHON_PN}-pytest \
&#43;&quot;
&#43;
&#43;do_install_ptest() {
&#43;	cp -f ${S}/test_parse.py ${D}${PTEST_PATH}/
&#43;}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------60EE7FD0027E8D6619829203--
