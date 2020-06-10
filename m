Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.85])
 by mx.groups.io with SMTP id smtpd.web11.2847.1591818701837107489
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ouTy7Vhs;
 spf=pass (domain: windriver.com, ip: 40.107.93.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Il3nfxPzBRFWc3+fLWjaY+2XeAwvfx1/thcmcCh2PbzkZVnwTSa7JZsFPDU+3d2zJpbxgB+0ePOlbQLVHmVSuBU0WkDbElXpjVLt1j6cmO9ttSQqLKATiXeerSjNFNpbNIDNhOSi6xUFfJsFIF9t6G21j5knS+Yakfu5M6VnNz9Li4RJ0MNMgXOf9EqA9fY/Aeb1+IHKH+vlZ6Frb2C29RkdQ1yhm9yEAqFPevcaHz1PhygLDyJDzSPEsyTqyzcKPmXVSb83/PJ+dappyw6UKSmMj6T9pTXpoddYb1bmbCn6peuxHEJHt7/aa79OewnylJAX8fwyYYYRUyd0CMQ6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elHdxlwa7uvfptcD1F/DG5YpHr8ZIRlSJxX9XPKbFhg=;
 b=cOUXktGn6LQ3/7yRWHXPhNNUPydMbgBJFtGb73SI0YrV49lprt/IXGgmqHeIakTCGwtEzzNJk8XGmNNaGHK3aLA7Jm+9VfInRkqA/6swD6LOY+dmx9UThLJH+rEP0ayC3JJGPZrucp6+M8Ss06mBCRZJXOrlCPMJ5oWAz1aQzQxKNzJW+yHxDsi2AKF+gCINhZTgDDpKEG5x5LlPJ0IOL1IhvAlP5XHiP/PIEH3liUv+nKdtCiviLNkDxPe+NLlmAJK4eYuafrMbh8K8oA9FtiGKDOxZSd1h+qIq2U7Kc/4Tmh5932T6FjaflGDl84JZdXWL6sc5A50VgDjX2ayxhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elHdxlwa7uvfptcD1F/DG5YpHr8ZIRlSJxX9XPKbFhg=;
 b=ouTy7Vhs/XSLcQGjyg8CnfTrKOEEbpkRr/p+F231xRZXh8WzdJdrOcbovfUUfeboatQB/oiHoKdI4kmMEsilVdEPXw94E/fRwrEkxjyzt34JpjsfHOZzTpJRZ7CBWxU1RNIZrr282dOTpI6t6LjT2aTx+/2phxEnVUZQ78QuixI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3924.namprd11.prod.outlook.com (2603:10b6:405:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 10 Jun
 2020 19:51:40 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:51:40 +0000
Subject: Re: [oe] [meta-python][PATCH 1/6] python3-tornado: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609111050.32307-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fe410a77-fb8e-6fae-8261-e3b495375ff5@windriver.com>
Date: Wed, 10 Jun 2020 15:51:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609111050.32307-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::48) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTBPR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Wed, 10 Jun 2020 19:51:40 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3eeb5d82-f362-4dee-5061-08d80d77b177
X-MS-TrafficTypeDiagnostic: BN6PR11MB3924:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB392473CAFB84267C019E187B9F830@BN6PR11MB3924.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8RWuMYTexo+gV3mwnv/+vaawXNAlFrUlkEZFUDwGi8ytp80Ma8sbrKVESlLbj2dhOlFPo3+nlAvU635MO1fy5t9geeZnqvi7NzE/vC0valywJj1vcVyRA+O4P1tKWrUj9AkATSAnAXlcgkDspwtgxkRxM1a8R71qJISTUnJyYH4lRsOZtLH9MNDf3Txg601KVZkI5eZWpmHWoR68gQSBk/OEDd1DSTKxfTPu2EQRbTQJjRv4bonhcn7D9MlnJVDOFD0TBgobYx8CL6yWnTGkmq1IuHpt+/qaadYDi3a7c2qGg97U7N6wv8RzevUel8S3VJQgNyiXpc8eQAnX9SFzRV66JP2iHrPiQBeg26Z23I+0L1bEubbxZVn40/0kgznlns2t87C0JPM7r6Tsi2tzqAZ3oXxyNQ1k4d/YR1KjLsvNlPZEHIgc/hFpZIHom2C+G3gFHTXz3ciSfibnFi/qFw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(39850400004)(136003)(366004)(376002)(316002)(6486002)(8936002)(16576012)(166002)(2616005)(956004)(31696002)(86362001)(31686004)(44832011)(83380400001)(966005)(66946007)(66556008)(5660300002)(53546011)(8676002)(16526019)(66476007)(36756003)(2906002)(478600001)(33964004)(186003)(52116002)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Lgvm7l3esAq/VtkCkNdTpB9Q3t+It/UdmJYeykR2d+U6ElkJhN1jpoXHThzPzAK/Opeoj7FB9hDYckQ13RdeY2rD0PzmHBFuClB94GbR8wop7yrhqIBQc0QPAsZm+6Lz0mmEA7E09U00G7P90eVzGrIEnKGv+2V4GnS+UZNGIMPNZUbtbEL2sehGRCW20Le4IbxRv7ZyFMNGfSp88Q//w8Uq+o0fSC8LFuLd3bcRVkLTT1OtqlizUJQVcgeg2BTmawq3033kuzd007HKA7KTqYgfnOk/lhy/C0qP8TgUBt1M07TWbB4Xnct+35hqTms+eKzBPgy+oqB/G1AFUD4z/OzZMlU3st8iXEaoyIIYtwhGyyJn4DbOwpU1LsoF+dRMeyrqZpU2reulydpui6ZC1s5N/iZfCJLscLNh6WtGKMCyuIPjhV1WmuZog+ZmA3ooTgW7pek5bACxx6ZYwdvoNHgwEAezbphh1Os1mIdc/m6ToNxAwIudJn0uIMiJ0Zcf
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eeb5d82-f362-4dee-5061-08d80d77b177
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:51:40.3580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qac4FZX8YNEq8hq3jrS9pWKv4nGfZrJr8NE0ZpGqZxHNs+Yu3KR2xv8Gho0esBiejcj+8+0t5vNINFreSVB7vH/iweNOAdSwJVvCX1kTeWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3924
Content-Type: multipart/alternative;
 boundary="------------AD901521A415839D13D63AE1"
Content-Language: en-US

--------------AD901521A415839D13D63AE1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 7:10 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-tornado.inc                 | 25 ----------------
>   .../python/python3-tornado_6.0.3.bb           | 29 ++++++++++++++++---
>   2 files changed, 25 insertions(+), 29 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-tornado.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
> deleted file mode 100644
> index 7cb61931a..000000000
> --- a/meta-python/recipes-devtools/python/python-tornado.inc
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -SUMMARY  = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
> -DESCRIPTION = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed. \
> -By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections, making it ideal for long \
> -polling, WebSockets, and other applications that require a long-lived connection to each user."
> -HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -
> -SRC_URI[md5sum] = "cab4b11480f6d032e46465586192d343"
> -SRC_URI[sha256sum] = "c845db36ba616912074c5b1ee897f8e0124df269468f25e4fe21fe72f6edd7a9"
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
> -                   ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
> -                   ${PYTHON_PN}-ctypes"
> -
> -RDEPENDS_${PN}-test += "${PN} ${PYTHON_PN}-unittest"
> -
> -PACKAGES =+ "\
> -    ${PN}-test \
> -"
> -
> -FILES_${PN}-test = " \
> -    ${libdir}/${PYTHON_DIR}/site-packages/*/test \
> -    ${libdir}/${PYTHON_DIR}/site-packages/*/testing.py* \
> -"
> diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
> index 77c9fb516..04f6314d0 100644
> --- a/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
> @@ -1,7 +1,28 @@
> +SUMMARY  = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
> +DESCRIPTION = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed. \
> +By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections, making it ideal for long \
> +polling, WebSockets, and other applications that require a long-lived connection to each user."
> +HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRC_URI[md5sum] = "cab4b11480f6d032e46465586192d343"
> +SRC_URI[sha256sum] = "c845db36ba616912074c5b1ee897f8e0124df269468f25e4fe21fe72f6edd7a9"
> +
>   inherit pypi setuptools3
> -require python-tornado.inc
>   
>   # Requires _compression which is currently located in misc
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-misc \
> -    "
> +RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
> +                   ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
> +                   ${PYTHON_PN}-ctypes ${PYTHON_PN}-misc"
> +
> +RDEPENDS_${PN}-test += "${PN} ${PYTHON_PN}-unittest"
> +
> +PACKAGES =+ "\
> +    ${PN}-test \
> +"
> +
> +FILES_${PN}-test = " \
> +    ${libdir}/${PYTHON_DIR}/site-packages/*/test \
> +    ${libdir}/${PYTHON_DIR}/site-packages/*/testing.py* \
> +"
>
> 

--------------AD901521A415839D13D63AE1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 7:10 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200609111050.32307-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200609111050.32307-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-tornado.inc                 | 25 ----------------
 .../python/python3-tornado_6.0.3.bb           | 29 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---
 2 files changed, 25 insertions(&#43;), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-tornado.inc

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
deleted file mode 100644
index 7cb61931a..000000000
--- a/meta-python/recipes-devtools/python/python-tornado.inc
&#43;&#43;&#43; /dev/null
@@ -1,25 &#43;0,0 @@
-SUMMARY  = &quot;Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed.&quot;
-DESCRIPTION = &quot;Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed. \
-By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections, making it ideal for long \
-polling, WebSockets, and other applications that require a long-lived connection to each user.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.tornadoweb.org/en/stable/">&quot;http://www.tornadoweb.org/en/stable/&quot;</a>
-LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
-
-SRC_URI[md5sum] = &quot;cab4b11480f6d032e46465586192d343&quot;
-SRC_URI[sha256sum] = &quot;c845db36ba616912074c5b1ee897f8e0124df269468f25e4fe21fe72f6edd7a9&quot;
-
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
-                   ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
-                   ${PYTHON_PN}-ctypes&quot;
-
-RDEPENDS_${PN}-test &#43;= &quot;${PN} ${PYTHON_PN}-unittest&quot;
-
-PACKAGES =&#43; &quot;\
-    ${PN}-test \
-&quot;
-
-FILES_${PN}-test = &quot; \
-    ${libdir}/${PYTHON_DIR}/site-packages/*/test \
-    ${libdir}/${PYTHON_DIR}/site-packages/*/testing.py* \
-&quot;
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb b/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
index 77c9fb516..04f6314d0 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-tornado_6.0.3.bb
@@ -1,7 &#43;1,28 @@
&#43;SUMMARY  = &quot;Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed.&quot;
&#43;DESCRIPTION = &quot;Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed. \
&#43;By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections, making it ideal for long \
&#43;polling, WebSockets, and other applications that require a long-lived connection to each user.&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.tornadoweb.org/en/stable/">&quot;http://www.tornadoweb.org/en/stable/&quot;</a>
&#43;LICENSE = &quot;Apache-2.0&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;cab4b11480f6d032e46465586192d343&quot;
&#43;SRC_URI[sha256sum] = &quot;c845db36ba616912074c5b1ee897f8e0124df269468f25e4fe21fe72f6edd7a9&quot;
&#43;
 inherit pypi setuptools3
-require python-tornado.inc
 
 # Requires _compression which is currently located in misc
-RDEPENDS_${PN} &#43;= &quot;\
-    ${PYTHON_PN}-misc \
-    &quot;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
&#43;                   ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
&#43;                   ${PYTHON_PN}-ctypes ${PYTHON_PN}-misc&quot;
&#43;
&#43;RDEPENDS_${PN}-test &#43;= &quot;${PN} ${PYTHON_PN}-unittest&quot;
&#43;
&#43;PACKAGES =&#43; &quot;\
&#43;    ${PN}-test \
&#43;&quot;
&#43;
&#43;FILES_${PN}-test = &quot; \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/*/test \
&#43;    ${libdir}/${PYTHON_DIR}/site-packages/*/testing.py* \
&#43;&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------AD901521A415839D13D63AE1--
