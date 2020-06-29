Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.82])
 by mx.groups.io with SMTP id smtpd.web10.20627.1593442529156736913
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ngyuo0x0;
 spf=pass (domain: windriver.com, ip: 40.107.92.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6WCmdo9iWHOHX1IXgtkphElrL/S7Jp7UnVHsbxFXhLbJxXuby4P4OYp9zb5EUHHh2c0VyB2ybEKB5DhjLRUWowRIqeAfmIAAXsYF27PqP24Cy4DlDQUmcwAtmiGHMfbnJA6S9T/vu8owQ7G2khnVVAy3blNDAbKiV0IAbAOR4m6lX+WTsmTPQndOOVWw+XZr5R0xRR4pyMiTiXsmwT5YAmpu0ZZZ8C8r+vl3mXWBCz+x9QILywl0gRrtqryXpghZkIWadxBjIwliHYTZ7mU0cbpSO6wL0s6YcX62ubCeQlc47DfD9dX9kg4DF1EC84bQyITxysWOpj/ai3GXiIZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4UPmrnyfiiG36hasV7B9azRmjtV1Gh3wqKOOt/31lk=;
 b=b0MTq42YgK523SgZq9SE5pTSe0o5jwu6EWI+681R76AT9Mch1IUWy1hAUVKpitOoz8DzTzo2EI/QbQozfAlY17wrOMgaQ6SEwSZPlA4opst5MHAcgzoM2XdUqK5gnomXyuOG4e8n2ckjmxYVReEppU0swzA+TBvdSjCfhLUCQZUik+iI432yFXNUZc7VEAeEJKvFRCjRCZmyHyJoALbMy0IASMIsuzj0QznyKSJlGURCmMFWtyqT9kJm4ZoAq18wDdmXQy0Y9uvk7Zi/Sv/O0ttHJHOWi/SD9mcgDBaz8rTAWwQGEAIo/wNv57xsypH3XnccWtWg79FpCzrosScCzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4UPmrnyfiiG36hasV7B9azRmjtV1Gh3wqKOOt/31lk=;
 b=ngyuo0x0IXvcEsRGO6EIRQyLt6U+GyDhOIKePcReJvwudjPxABrGjeSSlp+pzBS/PBrghOKNVjgpkhr2EJaIhLKvBEEL4GVaGL2SDh6KFRqYpn8zbjOUYu+9TQcV5V963f/WvPnVJ5qpe9YDDDhUr/xjqzxL/fljkqknYHDuPbQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1988.namprd11.prod.outlook.com (2603:10b6:404:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 14:55:27 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:55:27 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-ansicolors: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1593333924-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1ccd2177-fac1-3293-639b-692bb4492f6c@windriver.com>
Date: Mon, 29 Jun 2020 10:55:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593333924-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::24) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Mon, 29 Jun 2020 14:55:27 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77bf9e5f-6187-406c-1687-08d81c3c75e1
X-MS-TrafficTypeDiagnostic: BN6PR11MB1988:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1988B2A408DB8CE9F362DEC39F6E0@BN6PR11MB1988.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	omKg8SjJE4w+J7qfOW5wCbWTb+TNChtqZrIB2U9/6np44SmstcDrXfx8OAaPHjaR+ArzGOHd35rSifHAf15QoP1ImRJKeeJ2Ue2rZAXs7SobFK/RQ7vLyQJFr9ziId9mj1x0CM8b4PKOn+97lA/GyjXk96VOaMveAkWuVDsJbUgwaSwavTE+ZS6zn5pnG/PhZEM+QCK1vyk7xKOdQBw3JF0izfN1+Zo1F0eAL+Z3bXmTYRtpuIWuixbZc47yUZ6q1CNPbI1BScbDE4kmHp2kz7Cc2N5OTn+FKRosMnaXQqihmJHTOhBl5KxvfJuSEjHU75JSIXF8zyK4W9hguPvEqWNncz/oW1bymsjDnPsGk9310ROX7a70tGmnYjhUPspM2shTrEXRANOndLqeAa6SdeWck/pP6poM8Yo1+ykSBzyoLUJxEoTbPKm6R+AV4tqlZ9cDAhRIhmPk2mMopusomA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(366004)(396003)(39850400004)(186003)(33964004)(53546011)(26005)(52116002)(6486002)(31696002)(2616005)(44832011)(66946007)(66476007)(66556008)(956004)(5660300002)(2906002)(478600001)(966005)(36756003)(16526019)(166002)(83380400001)(8936002)(31686004)(316002)(16576012)(8676002)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0Y/z9g7EcS9IzvZaBxiL/tzK3qlZ0JvAwZ56T0UpOcEj9GUQ17fBnDX11vdDHUlV3P5mci0YClIcTPKbvldrPzTQ9Cq/G0+XI5oOwJq3YIjw9KZK0fhzBIvsQyuFWpIOR5C89Qx0THSoZOPGDw82Yp2AoKa7ZMKSPa9UgSSkdDr8O4an3KrICEAN4/C72bau+nCZsd0t9bbFoDABx08ia9aMiaFrSlwdR0GTrP6RdEgAk47b4Sx6tHcJxT8b3KA+kKwvMLABeGo+gh3mgPxh3yxvgvTrBKvLlaMA158CR/JJD3QTsT5w8ZTHy7bAW+YvG4MZhKoXqpuRBUMjYTrjFXGB6Nug8GC8juxGrk34YIS6oeaRDBm6bBa2GhGyHXrEMdvxcoaqhDYRitI0gVl4RLWlwFyyyNTG0VXU8xbSjmIHmZJlu1w1qQX4HlWGUfW1J5mgCSQfwtMPE4tcpibTsv5qwypaOD78jaUHaENYFiitCz2CIH7/pN1Z3oL6u8pU
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bf9e5f-6187-406c-1687-08d81c3c75e1
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:55:27.8024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O02hw55+s1UuUAmWrPNAMZagRntAy+yI4BvpTAjKE+Jeeo5s05MYOZOjlt/Cgi7RtiP+Z3JjBDp55TfREnjYxwQ5T6xSuJ5VSEGAUOGJClA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1988
Content-Type: multipart/alternative;
 boundary="------------57756B78AC12DEA796BFC68E"
Content-Language: en-US

--------------57756B78AC12DEA796BFC68E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/28/20 4:45 AM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-ansicolors/run-ptest            |  3 +++
>   .../python/python3-ansicolors_1.1.8.bb             | 14 +++++++++++++-
>   2 files changed, 16 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-ansicolors/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-ansicolors/run-ptest b/meta-python/recipes-devtools/python/python3-ansicolors/run-ptest
> new file mode 100644
> index 000000000..7dc3ef32b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-ansicolors/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO test.py| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
> index 9ba710cb7..a9ebebeef 100644
> --- a/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
> @@ -7,6 +7,18 @@ SRC_URI[sha256sum] = "99f94f5e3348a0bcd43c82e5fc4414013ccc19d70bd939ad71e0133ce9
>   
>   PYPI_PACKAGE_EXT = "zip"
>   
> -inherit pypi setuptools3
> +inherit pypi setuptools3 ptest
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
> +	cp -f ${S}/test/test.py ${D}${PTEST_PATH}/
> +}
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 

--------------57756B78AC12DEA796BFC68E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/28/20 4:45 AM, zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1593333924-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1593333924-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-ansicolors/run-ptest            |  3 &#43;&#43;&#43;
 .../python/python3-ansicolors_1.1.8.bb             | 14 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 16 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-ansicolors/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-ansicolors/run-ptest b/meta-python/recipes-devtools/python/python3-ansicolors/run-ptest
new file mode 100644
index 000000000..7dc3ef32b
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-ansicolors/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO test.py| sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
index 9ba710cb7..a9ebebeef 100644
--- a/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
@@ -7,6 &#43;7,18 @@ SRC_URI[sha256sum] = &quot;99f94f5e3348a0bcd43c82e5fc4414013ccc19d70bd939ad71e0133ce9
 
 PYPI_PACKAGE_EXT = &quot;zip&quot;
 
-inherit pypi setuptools3
&#43;inherit pypi setuptools3 ptest
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
&#43;	cp -f ${S}/test/test.py ${D}${PTEST_PATH}/
&#43;}
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------57756B78AC12DEA796BFC68E--
