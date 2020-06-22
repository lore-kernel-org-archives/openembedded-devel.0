Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.75])
 by mx.groups.io with SMTP id smtpd.web12.17789.1592833519507180942
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 06:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EeJ3D1EH;
 spf=pass (domain: windriver.com, ip: 40.107.93.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8lWcZAChXgViqiAD9O6hqKHAur4Xf54j4K6p4PpUJoF/PdMlfswcMQS5BUEhuAM5/YSP1vmeXF8UW9pVt6g7T5cg4/DcCnNwhS0lxSWQuNueZV1yvqi90PuFfCIEWS2U1FUbqyMqjy2YlZVxzOe/kC1NO7bG75wid1qBMuKCFQsfVQRpyLFfbYHDqNQjYFck+05td+S3fcTcROV1iYoIbVr8DU3vQTdfGWcmkVXLYxkP8emktoiT+Ex7ycD4ZVeBdYAxEIhqWwGWiDMVh0HwZtFEuaViH0BtZLTMSkfnbn5N7GksJ+xTTWtkmm8M/XGev2vJos/JJgde62APT5bLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iqn7KVoOU3itqGZXvSmrhaSOTe594c4kU1WUhOGYXnU=;
 b=Cokp6paM1in1ekBfuCB0WcNVwDzaWwwm6MfaIXFZWbzpLYoUI646Z4mZY9D34hgJoVHPhVku+1/4pzZtar9GSKjIVnZVwMAmVS2o/P53MHr3IiS4tKcaUo/lc7N8i+ID6ibuX9NSCXJi8McP20Hj50YPfupYoXr4bbSrAJ0PEsJe5G0PMuO/SX6zDff46gquckrjydW0ggky86sUZgBNWZiRT+x3jozI8MT4sRsSUT0DE1LTqtAayKd1unSTIWWA7KSbF5Ks1G038C1U4cJKBBaC69PyWDTpXvkPu4YESML5GzqMZXbaj6bsqlgD5CC3FubmZ6TxPnybpNkIrUKyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iqn7KVoOU3itqGZXvSmrhaSOTe594c4kU1WUhOGYXnU=;
 b=EeJ3D1EH3JuDfilJeEfu0hZ4CS6IX1o3MuiMUvJQTW2A+Us26/FCy750wwHcmII8CqkGsaEFI8c7+NTQGi+BjTskrfT0dtrXqytItD4QhhXravy/XyF3FvQjClVQHnw9mNowldYywmHfINVXcs6prtrIFvPNhSzaXAtu49+gbTI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN7PR11MB2546.namprd11.prod.outlook.com (2603:10b6:406:ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 13:45:15 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 13:45:15 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-passlib: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200619081011.25051-1-leon.anavi@konsulko.com>
 <20200619081011.25051-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <688100d1-90c3-6736-b8d3-2f7ff5cc398a@windriver.com>
Date: Mon, 22 Jun 2020 09:45:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200619081011.25051-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::15) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Mon, 22 Jun 2020 13:45:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1122fb66-902e-4bb8-0b3d-08d816b27e4f
X-MS-TrafficTypeDiagnostic: BN7PR11MB2546:
X-Microsoft-Antispam-PRVS: 
	<BN7PR11MB25462A198CFA2F1371048B2F9F970@BN7PR11MB2546.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ou31OkAwlDgsHpRQuQn6w3QgewV3HeiiKRYrBod89ff4V/avD9uRGMndo5IdcnjWNith4y01dBcXBjOiQSJHeTBObgs4XSQph8DbSEx1sSgck8cI5aYv6pf78GBN9MOd0qo/KkLl4Oma1ieuLe5J835rngSOi36FWXVMPON4FE7hR3wxAoFn6VpGfN+Vz6TBhJmdT8xDAOfLeHmBbZhVW60j2w/orJZEB6s11oQOENWv6Iz/n2ygnHAWGo3SZCC/+dn+pVps1py2bvvZz+Q0lntn59LNmS2QKfU2eeigPjul5EOHbh3a4cjJ1mtyJkqNZeIc9RRydzb0BRO9pCyQcOPtkMNuzl/OXJ9swO48VGHCg1XB432UW+MYX+TYX6FSSXBrw4w2A3xqwdh8XJ3ANlJUXb3Zdt0FGfv6eKWaCseMKh0s2UGCTpjoyt9DQSr9ndHb7N+XqbqzLnYHi3OUBw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(366004)(39850400004)(396003)(376002)(66556008)(36756003)(2906002)(53546011)(186003)(6486002)(166002)(16526019)(52116002)(31686004)(26005)(83380400001)(31696002)(5660300002)(86362001)(33964004)(16576012)(44832011)(316002)(66946007)(66476007)(8936002)(2616005)(956004)(478600001)(966005)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	RmIKNBhcWwn6rz21Qe9UAkU22fLsaJzS0oTchk9lTRUanSufaP48QQEgwsaftMvuHWcXnlUT9cs7GpDiG4rSLF+R2H96Aaj8h5xOMMOeLEOPJOYaiZ+00CCY2kwyke9NdN+eaWFrJaWJzLSwwHzx7goYl18r+rysqvwZ7FtJTMhnsRjbJijX18Kit08mxVYxZvwkodrDDrZHd95WLG1zA2iZp56WLkzGwlXhRJigxAkSW7lfcjiwgn5zdTvg2jmMA4gORSjRLitNDrMXN6tWXzXqPzxN6Nkf8K1Fey6/Jl35+iQ1WbT8wTNyGj3Q6vQ+m5Uzlpz7yvwhrKlSbLK6JsASlgPSzFYXWE8OKZ6z+5XoAL48Y1yaHIxyUL79M8YSeD2dHR0hAjtsT/PhyLXycBK0XzRWMeJA8mhajioSTneE+Y7kZbE28Ee6k4k6pXQJJsjmOsEMKDB8nn8kG02Sz1kW+20ZW3nlrRx8QdClLs8=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1122fb66-902e-4bb8-0b3d-08d816b27e4f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 13:45:15.5423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VymPS/EpeT8xgxgg9zz1mf+i09MD45gN80j6lFs/n6ZKvvu1eZ1Sn/oXTd+BeaRn/PJzA0ONCa1GmLQ2Vidi8cieWPDIfXxdRQz5QhnnusM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2546
Content-Type: multipart/alternative;
 boundary="------------AA7024BF1FEE6863DB098F40"
Content-Language: en-US

--------------AA7024BF1FEE6863DB098F40
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/19/20 4:10 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file. Update
> HOMEPAGE. Due to BitBucket deprecating Mercurial support,
> Passlib's public repository and issue tracker has moved to
> https://foss.heptapod.net/python-libs/passlib/wikis/home
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-passlib.inc                 | 19 -----------------
>   .../python/python3-passlib_1.7.2.bb           | 21 ++++++++++++++++++-
>   2 files changed, 20 insertions(+), 20 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-passlib.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-passlib.inc b/meta-python/recipes-devtools/python/python-passlib.inc
> deleted file mode 100644
> index 9cf02807a..000000000
> --- a/meta-python/recipes-devtools/python/python-passlib.inc
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -SUMMARY = "comprehensive password hashing framework supporting over 30 schemes"
> -DESCRIPTION = "\
> -Passlib is a password hashing library for Python 2 & 3, which provides cross-platform \
> -implementations of over 30 password hashing algorithms, as well as a framework for \
> -managing existing password hashes. It’s designed to be useful for a wide range of \
> -tasks, from verifying a hash found in /etc/shadow, to providing full-strength password \
> -hashing for multi-user applications."
> -HOMEPAGE = "https://bitbucket.org/ecollins/passlib"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=44fd7dcd5d42b48d6dea59ac643a0179"
> -
> -SRC_URI[md5sum] = "b908529cfd4c33057c244324c692eae7"
> -SRC_URI[sha256sum] = "8d666cef936198bc2ab47ee9b0410c94adf2ba798e5a84bf220be079ae7ab6a8"
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-crypt \
> -    ${PYTHON_PN}-logging \
> -    ${PYTHON_PN}-netclient \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb b/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
> index 18180a07a..b347163aa 100644
> --- a/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
> @@ -1,2 +1,21 @@
> +SUMMARY = "comprehensive password hashing framework supporting over 30 schemes"
> +DESCRIPTION = "\
> +Passlib is a password hashing library for Python 2 & 3, which provides cross-platform \
> +implementations of over 30 password hashing algorithms, as well as a framework for \
> +managing existing password hashes. It’s designed to be useful for a wide range of \
> +tasks, from verifying a hash found in /etc/shadow, to providing full-strength password \
> +hashing for multi-user applications."
> +HOMEPAGE = "https://foss.heptapod.net/python-libs/passlib/wikis/home"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=44fd7dcd5d42b48d6dea59ac643a0179"
> +
> +SRC_URI[md5sum] = "b908529cfd4c33057c244324c692eae7"
> +SRC_URI[sha256sum] = "8d666cef936198bc2ab47ee9b0410c94adf2ba798e5a84bf220be079ae7ab6a8"
> +
>   inherit pypi setuptools3
> -require python-passlib.inc
> \ No newline at end of file
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-crypt \
> +    ${PYTHON_PN}-logging \
> +    ${PYTHON_PN}-netclient \
> +"
>
> 

--------------AA7024BF1FEE6863DB098F40
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/19/20 4:10 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200619081011.25051-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file. Update
HOMEPAGE. Due to BitBucket deprecating Mercurial support,
Passlib's public repository and issue tracker has moved to
<a class="moz-txt-link-freetext" href="https://foss.heptapod.net/python-libs/passlib/wikis/home">https://foss.heptapod.net/python-libs/passlib/wikis/home</a>

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200619081011.25051-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-passlib.inc                 | 19 -----------------
 .../python/python3-passlib_1.7.2.bb           | 21 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 20 insertions(&#43;), 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-passlib.inc

diff --git a/meta-python/recipes-devtools/python/python-passlib.inc b/meta-python/recipes-devtools/python/python-passlib.inc
deleted file mode 100644
index 9cf02807a..000000000
--- a/meta-python/recipes-devtools/python/python-passlib.inc
&#43;&#43;&#43; /dev/null
@@ -1,19 &#43;0,0 @@
-SUMMARY = &quot;comprehensive password hashing framework supporting over 30 schemes&quot;
-DESCRIPTION = &quot;\
-Passlib is a password hashing library for Python 2 &amp; 3, which provides cross-platform \
-implementations of over 30 password hashing algorithms, as well as a framework for \
-managing existing password hashes. It’s designed to be useful for a wide range of \
-tasks, from verifying a hash found in /etc/shadow, to providing full-strength password \
-hashing for multi-user applications.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://bitbucket.org/ecollins/passlib">&quot;https://bitbucket.org/ecollins/passlib&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=44fd7dcd5d42b48d6dea59ac643a0179">&quot;file://LICENSE;md5=44fd7dcd5d42b48d6dea59ac643a0179&quot;</a>
-
-SRC_URI[md5sum] = &quot;b908529cfd4c33057c244324c692eae7&quot;
-SRC_URI[sha256sum] = &quot;8d666cef936198bc2ab47ee9b0410c94adf2ba798e5a84bf220be079ae7ab6a8&quot;
-
-RDEPENDS_${PN} &#43;= &quot;\
-    ${PYTHON_PN}-crypt \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-netclient \
-&quot;
diff --git a/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb b/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
index 18180a07a..b347163aa 100644
--- a/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-passlib_1.7.2.bb
@@ -1,2 &#43;1,21 @@
&#43;SUMMARY = &quot;comprehensive password hashing framework supporting over 30 schemes&quot;
&#43;DESCRIPTION = &quot;\
&#43;Passlib is a password hashing library for Python 2 &amp; 3, which provides cross-platform \
&#43;implementations of over 30 password hashing algorithms, as well as a framework for \
&#43;managing existing password hashes. It’s designed to be useful for a wide range of \
&#43;tasks, from verifying a hash found in /etc/shadow, to providing full-strength password \
&#43;hashing for multi-user applications.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://foss.heptapod.net/python-libs/passlib/wikis/home">&quot;https://foss.heptapod.net/python-libs/passlib/wikis/home&quot;</a>
&#43;LICENSE = &quot;BSD-3-Clause&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=44fd7dcd5d42b48d6dea59ac643a0179">&quot;file://LICENSE;md5=44fd7dcd5d42b48d6dea59ac643a0179&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;b908529cfd4c33057c244324c692eae7&quot;
&#43;SRC_URI[sha256sum] = &quot;8d666cef936198bc2ab47ee9b0410c94adf2ba798e5a84bf220be079ae7ab6a8&quot;
&#43;
 inherit pypi setuptools3
-require python-passlib.inc
\ No newline at end of file
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;\
&#43;    ${PYTHON_PN}-crypt \
&#43;    ${PYTHON_PN}-logging \
&#43;    ${PYTHON_PN}-netclient \
&#43;&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------AA7024BF1FEE6863DB098F40--
