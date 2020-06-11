Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.53])
 by mx.groups.io with SMTP id smtpd.web12.7229.1591881796316232159
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 06:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=m+nV927H;
 spf=pass (domain: windriver.com, ip: 40.107.69.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYM9DZ5ft2WsZEd9Ufv93teXJfayljQNlIggnOwa3xD5LsKFnQXks0hqJj8BSDaYqmQH4yRrhsgtaSMoyjhp9O/Yle+ewgQX0VunA83oIGEKc32JwLMdQQfibSQpqeani5LqQsdlDcQqfyyP6k3u1nxPhP4+qfimpiaZjgrswEAdSTXci/GfToU4R45qvNpA+pLSzlwO5YtT4jNLaDhu5t1REGksDJVrlk0YqUuqv7AaKEDctLvLkmf+ebO6nq8nhVujPA/TOOXxk1XJWUO3b4e35b9+WlIlnwNf2WWmo+Fjj84kQ40ksiOHq9iFpWoBmg/eoSPosW6Y9j/0Z6dXOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnYHv84ZmkAxcOL8wnlszxP10BFAz0f8CMwiZz23NAE=;
 b=DaVbnw3vGA0JFXckOGTz0sQTpkr04zfqmXjy4is7JZTHv+/OBeSDDhK1onX4Mk54gjbFBMW7xiccgeKD8OruHkz7U1u+CHG7tKT1/wgV9tvydMBc4peSUzM8YRPCxRNpY/gEwtNZmfAM9GXWcc1Ee2d3k9QAQlg90UPpzg3Apf/KjhtrzImUzvfaY51I/2coFQW8ZY63VQKh+P7Y2aQkOkgDZNm8b6NwGnZgrVDqibcwBV9uOjfuVPfT4ShcBHLY9QxXa9w+BeQXoyd6YwgnHn3qLMVafViskGO9j2HWlmvExmHNSwuTyXkJB71r+swGvewhxqs2PEL68KH28GECwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnYHv84ZmkAxcOL8wnlszxP10BFAz0f8CMwiZz23NAE=;
 b=m+nV927Hh7pExvx7csZKrbPD4vTaj2NivX14v8qigkmpK2xFyKaCEk6X8p0h4TDks78TtForbw8M6Lxs1AfjrXNcesJZQ3O2Niq441xF7zK3y75LZ6MNF9vJkgBb6oll/DfgYUHo25pdBtTC36gxGKjjxeCKk5zTVxfLzZ62ENQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1780.namprd11.prod.outlook.com (2603:10b6:404:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20; Thu, 11 Jun
 2020 13:23:15 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 13:23:15 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-more-itertools: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200610131536.31426-1-leon.anavi@konsulko.com>
 <20200610131536.31426-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d023d0e3-c875-51ae-a690-85939d1cb06e@windriver.com>
Date: Thu, 11 Jun 2020 09:23:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200610131536.31426-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::25) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0086.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 13:23:14 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5444c917-1c33-4679-b94e-08d80e0a98e9
X-MS-TrafficTypeDiagnostic: BN6PR11MB1780:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB178096112F815263A26764E59F800@BN6PR11MB1780.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PY1BxBZbyYdSdCRZSTtey5l9zl1CrxXecP+OzI+ftS6b7Td8cagWefhENtHcXyPn+catYogWmFDeFpu1X+bsBq5u9ileEfX1GI9EaVdv0SSrAxUesw5aiRO9f1Udn6wJ1JZm8KwSSLeOXuTjO7WeMHubBxcwnUyia+JvpReL9H0qWZhY3cMPN1dflUuaKuOba3RDmyEKSSLszOmqni6CKvwbq0Z1xGt1+Pnvou7QxD9UophEsic/xDwiMj6URaJRNQL1e07b4mFa8s759TijN48JcLqdh2HZJQhZZha0x0tPzhSC3codt+thDASkqKjoTedBRcTRf0CuM6YOtw2kncXbiCm3wIYvtt6fAJsxipZxVQVHW5kLV3lwjc+mzw6YsxOF5TT7LqmjCiSTIOsucrEpGHN/1PBOTnF/HxR0Rjto01u4FejA7O3qUMm6wzA6Ch5i7aZxxYnkVf4jcKY52A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(136003)(396003)(346002)(366004)(16526019)(186003)(5660300002)(2906002)(86362001)(6486002)(66556008)(66946007)(66476007)(52116002)(33964004)(16576012)(31696002)(316002)(53546011)(31686004)(36756003)(956004)(8676002)(478600001)(2616005)(8936002)(26005)(44832011)(966005)(83380400001)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	U4t+JzH+n62IhjswHNsehqPvj9iTDJydGnRowNgdPG6y7TOMuHzR6kZuf1fzu2uNOXXjryVxFsPzRjzHW9bw2rD9wrCyWT9m+E8UesTaTLMMZ64kUhRobh092d0wGbIxYQ3wVchMJHkRVKuR95/JDS8YeXoyimBgi2Os2nSvcJSP0aw7Qg7ZxIstLwpQHxnOF2oYq4x4YTh2705sTSJGCRuqLA6BfS637AjvbJiEKHDijWdzaFwuVR+M8SD3Y8QpUYGtsXNSeFgiA8d65URR2H7vLK+mztLIqj3jZFnRxMsRMGkXQmYLEc3stBfifvXSrTyxU1YRfLI8YuKXK8b6PEIQeEtIS6arMd4BSV+esyLiV6aXl6NOQiObAI0kgyez3aFcqUfLFyySKPpDxfi2Cuc9qniv8ORU8VBBO4ePABoXewHkPQVn1in/UvMp6xAzs0ICQ+v9vwa9rWxcADG2DrPCC6VLH3UrE4QtJSnQkxfnKOywHZutXSSNx9R3euK7
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5444c917-1c33-4679-b94e-08d80e0a98e9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 13:23:15.2909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /y9FI7mGiWDQa8Es03G+MOT03ARyFAoIr6G0Es0W1dpX+u/HtPxsbNc1PqywneMYPmv335TKTRAUp767Lae//oeR9HUVtRqT6AQj1gonWXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1780
Content-Type: multipart/alternative;
 boundary="------------341E506B5591DD6F3F714906"
Content-Language: en-US

--------------341E506B5591DD6F3F714906
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/10/20 9:15 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-more-itertools.inc          | 21 -----------------
>   .../python/python3-more-itertools_8.2.0.bb    | 23 +++++++++++++++++--
>   2 files changed, 21 insertions(+), 23 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-more-itertools.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-more-itertools.inc b/meta-python/recipes-devtools/python/python-more-itertools.inc
> deleted file mode 100644
> index 0b684c1b1..000000000
> --- a/meta-python/recipes-devtools/python/python-more-itertools.inc
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION = "More routines for operating on iterables, beyond itertools"
> -HOMEPAGE = "https://github.com/erikrose/more-itertools"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -inherit ptest
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
> -	install -d ${D}${PTEST_PATH}/tests
> -	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -}
> diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
> index c3b34d364..1718fdf93 100644
> --- a/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
> @@ -1,5 +1,24 @@
> -inherit pypi setuptools3
> -require python-more-itertools.inc
> +DESCRIPTION = "More routines for operating on iterables, beyond itertools"
> +HOMEPAGE = "https://github.com/erikrose/more-itertools"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
>   
>   SRC_URI[md5sum] = "55e7e0a5eabc5a57bc8353c65c6f9965"
>   SRC_URI[sha256sum] = "b1ddb932186d8a6ac451e1d95844b382f55e12686d51ca0c68b6f61f2ab7a507"
> +
> +inherit pypi setuptools3 ptest
> +
> +BBCLASSEXTEND = "native nativesdk"
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
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>
> 

--------------341E506B5591DD6F3F714906
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/10/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200610131536.31426-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200610131536.31426-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-more-itertools.inc          | 21 -----------------
 .../python/python3-more-itertools_8.2.0.bb    | 23 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 2 files changed, 21 insertions(&#43;), 23 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-more-itertools.inc

diff --git a/meta-python/recipes-devtools/python/python-more-itertools.inc b/meta-python/recipes-devtools/python/python-more-itertools.inc
deleted file mode 100644
index 0b684c1b1..000000000
--- a/meta-python/recipes-devtools/python/python-more-itertools.inc
&#43;&#43;&#43; /dev/null
@@ -1,21 &#43;0,0 @@
-DESCRIPTION = &quot;More routines for operating on iterables, beyond itertools&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/erikrose/more-itertools">&quot;https://github.com/erikrose/more-itertools&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5">&quot;file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5&quot;</a>
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
-
-inherit ptest
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
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
index c3b34d364..1718fdf93 100644
--- a/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-more-itertools_8.2.0.bb
@@ -1,5 &#43;1,24 @@
-inherit pypi setuptools3
-require python-more-itertools.inc
&#43;DESCRIPTION = &quot;More routines for operating on iterables, beyond itertools&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/erikrose/more-itertools">&quot;https://github.com/erikrose/more-itertools&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5">&quot;file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5&quot;</a>
 
 SRC_URI[md5sum] = &quot;55e7e0a5eabc5a57bc8353c65c6f9965&quot;
 SRC_URI[sha256sum] = &quot;b1ddb932186d8a6ac451e1d95844b382f55e12686d51ca0c68b6f61f2ab7a507&quot;
&#43;
&#43;inherit pypi setuptools3 ptest
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
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
&#43;	install -d ${D}${PTEST_PATH}/tests
&#43;	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
&#43;}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------341E506B5591DD6F3F714906--
