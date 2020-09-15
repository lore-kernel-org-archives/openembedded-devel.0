Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.64])
 by mx.groups.io with SMTP id smtpd.web10.14844.1600180352006846902
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cWKibB4z;
 spf=pass (domain: windriver.com, ip: 40.107.236.64, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSXVND4m8+Vuhlqi9l8+VLuoM2EQuH8DItrvIRX8eYT2f+R0jwr2lWyQdvNol5kAZiyF5GnfhBUMMdrnfwo57eiNVujaDgEPu3Y/Ylgcr6yPb5lniP9normTbIHZBxOjmtX4x4oEjW17j8yAs/AX7XuZMXibx8PYbBe8hQh2tzBj5PxnfCMSZyNyXcr9LoU4UPAtVBNSfZqmVqT4VkeUJdOlGFy3pTi+mdHO1pWP0VK0LfS7ZUdlOCiaYMRvY/7vSBhrkIGecoHTDbkWGkBbLFGbEBCv5OUVk/Z33XHBDJbpuUWNE7OOtkd/LWTt72KnW4V5clRboaOx8+T6wRJnhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5ZrvGnGkKRsA16XRETel/yY53AuLqFKkZlrDlpnik8=;
 b=fjhoEm5Efb61ApLHa0ocxe1DdyBHnivFSX7iMfAwU2a0GzlTBQ6RXwOoilNOByOX1ywTBcxwrKDaO4auSK02JSpZt6KJ8KhaiL3F+xV2GZa8V5SuNut5rO93wCVBKrmw6vJfjdpS4OCyoHdDUZBVKv8qrD86VMkT0uREy6dP8C6ez4jTj+gTtyXD4cm2fl4h3ndPgPL5oDuhTIBVY9NYS6DXKz9+nC/fmJLhgvsfVNAO0xPq6hNUSyt7aVT3rahYBfiTa8oiKKAUSq8RksXiLo2LPT9NMZbDERaUihdUpmHiam0TGTEx/lyZLXAYhdQfUzYMNg5Y1bnIBk2KTaxpjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5ZrvGnGkKRsA16XRETel/yY53AuLqFKkZlrDlpnik8=;
 b=cWKibB4zldhoZdNX3CA1G9BILP2HClpFLR/Obtu5bKQhX+0SZs2K9WxG7jyg5TYXo1Gh/b4APY6dX2tN0PoEiiQxf7K9zygxsv0tyziTAD1H37O0bMnN1uzkffMEKTR9eNj40RooYCQ6nePV81Ji7Q1lLJM8FNog8AWYe79bBL0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3912.namprd11.prod.outlook.com (2603:10b6:a03:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Tue, 15 Sep
 2020 14:32:30 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:32:30 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-pyusb: Upgrade 1.0.2 -> 1.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
 <20200914131536.6072-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ec05a244-b427-a1a1-ebc9-ecbf93d96ec2@windriver.com>
Date: Tue, 15 Sep 2020 10:32:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914131536.6072-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Tue, 15 Sep 2020 14:32:29 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb590c30-39d6-4fa0-5121-08d859842d21
X-MS-TrafficTypeDiagnostic: BY5PR11MB3912:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3912FE656B0BFF63B7BEC1269F200@BY5PR11MB3912.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MqgP4gO9aQXCJRqpfK9GiFR4Dx5iP2FxaeJqLJxjujw7hRbNMPnqGoXAioHyBrMe+uecR6a9gxAO8oB2kSGUykdBCrUmWz0i6hzm7NiUXI0EfP8fkI4v9XzH1mtdpzyLL6bs4L52/rwATFaho3t2RVQhhF/F+fmC/jf/HmFVry4r1qiZNGsqorReB/qufmXCnBcqI6Kmq4Xh3xqMNb6azHsb+Fy3dCGqJwT9/dvQEmolAGxRz8cNGyWe+cLbA9v5aoTa9aKbr95G7D+A0e8lkUB5JFTbFUY4M4GJsRigwBXbi5cbP1JU0Ml+w4BgdBIrSiMzeFPoiN/UQMmA2OuJUjx2nJhcUHKsFT/+4Nja8F6vsme4Mv6KU6ZeuJbalAxUuqPhNfbgvmTwVNkkrnJ+SyB7+LMCclg81DDFMijnbK3fnBuNG+KDt1T/zDKfOoCmqO095dlGDb7itkb4OKFSRA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39850400004)(376002)(366004)(31696002)(8676002)(66556008)(66476007)(26005)(66946007)(2906002)(8936002)(53546011)(186003)(16526019)(6486002)(36756003)(166002)(478600001)(316002)(16576012)(2616005)(956004)(5660300002)(44832011)(52116002)(33964004)(31686004)(86362001)(83380400001)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	DijxPg8CWTwqgfalzRRxqP134Xbn3TIuOpVoPexckVhw/fXFbdU0xkymtAybnP1DUWo0oqfKE2VfIbRMXD6LbN4BXdIfAfS5kGp8dKD+Wo0mwWvN+RlF4Ha9ttNQ3WuW3VC1n2qJG8jI9PT7osWePAUC13dvH4Tcw2ebw8M2v27G4cOnniUE4cCXpn3VBmst4njcle0+Y3Zva0o9cx28Z402w4GnjoxIOaRQHund9esOj3F60ZFPyNcRzGmTPV9PiUnybbYYtoJhcfOanx9VPNk6z97JmLfG6JSenHAoSMUU3bNrcczUM7UwMgUCPyGFHeBlaSYE8xY8lWEcm4xPGesdXqIXg/Yfsb2hf+HmuRV4XS1ydyhukz0hTNdPy7D8MAUG/ABcZgJARRUb36THe8ALvu+Nj6fKMrucZAiE1+RlFS0cH7b5To53ycBepqj5rK/5nX5aM97CMF1B6Q9xMlNJkfsPxU0Q5cwfX9120pMB8UHeFewardlRBQouI/kz81wlnkML+8HfeSleiqYRSiD2triWR2IsMgkBc9fST2TlY4NpERc5qFb0Jx+ayx2JSFtLrz8DSpS7YCMfMsJ5sOO2/sNlaVSp0TpOhNxNthu6ryMg99XnwfGEPcpRxo8UfS6GZx9Hdb0wHC9y2KRIOA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb590c30-39d6-4fa0-5121-08d859842d21
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:32:30.3576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBQKqLFAC3ZBBd43V8A4SCRcnVvBNJAVI9H2XYyEv8k8Y/gvdjn25YBrsnsiOf3s2Xu3Sizx2Ypn2JYCNrb+TCiJ4VcqwBrPyVGk39sJGVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3912
Content-Type: multipart/alternative;
 boundary="------------CD0F2D4B7DEB3978DEF0EED8"
Content-Language: en-US

--------------CD0F2D4B7DEB3978DEF0EED8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 9:15 AM, Leon Anavi wrote:
> Upgrade to release 1.1.0:
>
> - Make deploy script compatible with setuptools_scm and add
>    prompts
> - tutorial: fix the description of the return of
>    find(find_all=True)
> - Fix broken link in tutorial to libusb caveats
> - Use setuptools_scm for versioning
> - simplify version_info regex
> - Bug fixes
>
> License-Update: Normalize all copyright disclaimers, update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-pyusb_1.0.2.bb   | 12 ------------
>   .../recipes-devtools/python/python3-pyusb_1.1.0.bb   | 12 ++++++++++++
>   2 files changed, 12 insertions(+), 12 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb
> deleted file mode 100644
> index 44c24f423..000000000
> --- a/meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -SUMMARY = "PyUSB provides USB access on the Python language"
> -HOMEPAGE = "http://pyusb.sourceforge.net/"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=51691ed11cc2c7ae93e383f60ed49b0f"
> -DEPENDS += "libusb1"
> -
> -SRC_URI[md5sum] = "862b56452c64948c787ad8ef9498590b"
> -SRC_URI[sha256sum] = "4e9b72cc4a4205ca64fbf1f3fff39a335512166c151ad103e55c8223ac147362"
> -
> -inherit pypi setuptools3
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
> new file mode 100644
> index 000000000..6b48d6a25
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "PyUSB provides USB access on the Python language"
> +HOMEPAGE = "http://pyusb.sourceforge.net/"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c52a96fd9a0cadcb9270904c8eb5416c"
> +DEPENDS += "libusb1 ${PYTHON_PN}-setuptools-scm-native"
> +
> +SRC_URI[md5sum] = "3b2e38e9f697d2f90d86376bd10a9505"
> +SRC_URI[sha256sum] = "d69ed64bff0e2102da11b3f49567256867853b861178689671a163d30865c298"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------CD0F2D4B7DEB3978DEF0EED8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914131536.6072-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.1.0:

- Make deploy script compatible with setuptools_scm and add
  prompts
- tutorial: fix the description of the return of
  find(find_all=True)
- Fix broken link in tutorial to libusb caveats
- Use setuptools_scm for versioning
- simplify version_info regex
- Bug fixes

License-Update: Normalize all copyright disclaimers, update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914131536.6072-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-pyusb_1.0.2.bb   | 12 ------------
 .../recipes-devtools/python/python3-pyusb_1.1.0.bb   | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb
deleted file mode 100644
index 44c24f423..000000000
--- a/meta-python/recipes-devtools/python/python3-pyusb_1.0.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = &quot;PyUSB provides USB access on the Python language&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pyusb.sourceforge.net/">&quot;http://pyusb.sourceforge.net/&quot;</a>
-LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=51691ed11cc2c7ae93e383f60ed49b0f">&quot;file://LICENSE;md5=51691ed11cc2c7ae93e383f60ed49b0f&quot;</a>
-DEPENDS += &quot;libusb1&quot;
-
-SRC_URI[md5sum] = &quot;862b56452c64948c787ad8ef9498590b&quot;
-SRC_URI[sha256sum] = &quot;4e9b72cc4a4205ca64fbf1f3fff39a335512166c151ad103e55c8223ac147362&quot;
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
new file mode 100644
index 000000000..6b48d6a25
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyusb_1.1.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = &quot;PyUSB provides USB access on the Python language&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pyusb.sourceforge.net/">&quot;http://pyusb.sourceforge.net/&quot;</a>
+LICENSE = &quot;BSD-3-Clause&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c52a96fd9a0cadcb9270904c8eb5416c">&quot;file://LICENSE;md5=c52a96fd9a0cadcb9270904c8eb5416c&quot;</a>
+DEPENDS += &quot;libusb1 ${PYTHON_PN}-setuptools-scm-native&quot;
+
+SRC_URI[md5sum] = &quot;3b2e38e9f697d2f90d86376bd10a9505&quot;
+SRC_URI[sha256sum] = &quot;d69ed64bff0e2102da11b3f49567256867853b861178689671a163d30865c298&quot;
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------CD0F2D4B7DEB3978DEF0EED8--
