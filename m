Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.41])
 by mx.groups.io with SMTP id smtpd.web10.15669.1597154640155203318
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 07:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NX+s/qxE;
 spf=pass (domain: windriver.com, ip: 40.107.94.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5oC1MBhF1uNMKh5HhsX3cRcsgjX4IAB2IkjtmH4QZq2BVKyyyHZ7cUI2DfJYIVndP3DEyKIBUFOnVXMen3mYOQ6urRZH+frBPO41/vJlA4+KAp5yi0BSB6CQlkMWvixEo+pYOKnSjp5U68nx+PAUgx7SUPPFdpzbPz5HGBL3h0GvPr23Hf/DbUty9sfXf47ETgxId9MI7nMsLCYZoMi/3XASF3gUzO5jTVPUyA5u1x6wZ/G1pKWyRiRhvdoHICaUpQrTHLIzfZohxeiG0tekWJvcmb9mnlfXrqBA0wVa9DllzyG7V4AIt1vJg/h1uNnPEeIUYxzDB6jyuKwazXDhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iem2Gj5x+JjUYcFghol2MB/wCKyV50KEHFr9uyqfYgw=;
 b=WrUjVf65OV5RsEW3g+5c3bGiv3pNj8FNFwsCDxTWZh0YRol3p8sZllzDfcUFo2KcPZ+nQOWmPZu1NI7dQsc6KR3KcwDpBv+A1X1RDZrhMWwjipxxT2scKF8G9xD6JHwjlXb+a5s3zdUHgbZArVQoN9RnnNqn6MEpAxZW3XeawVkLfoK2+xWKKu1MEbi5PpjVNneoie/1BBQrx8ee8llV8LWajooiMEEvGRSs8knOn3+Woa7Y2O5GBnTx7EwSProREiPqwTUk64hB5BScePN7nMQRakOYMPNhHV9VLm0zt81mUDHqX6srC+Qsh3vbexDdXCo9ILjxLAwbYcSLVJ+EBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iem2Gj5x+JjUYcFghol2MB/wCKyV50KEHFr9uyqfYgw=;
 b=NX+s/qxEqXBpyz1vsgC/J5AV/OkgJnVkyV7ruKbEUGM4gNDP+foqsbh5Xf2s3KD/dyszTU7O/my7kHJIuGCqxDv7FJU3ppV7ZJGuFShB/nF0k0wR79JIHkryBlzEXgEJAdO3Kg2un93UZPeHDYsb1mqseZG5zGCEcmVTTPa/+9k=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Tue, 11 Aug
 2020 14:03:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 14:03:57 +0000
Subject: Re: [oe] [meta-python][PATCH v2] python3-pynacl: Added recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
References: <20200809200207.2328601-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <bbdc1004-e4c9-c1bd-4057-bc270dd10f64@windriver.com>
Date: Tue, 11 Aug 2020 10:03:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200809200207.2328601-1-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::11) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0042.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Tue, 11 Aug 2020 14:03:57 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d022a4c8-3040-42e4-9274-08d83dff63d9
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB424316F79F355881DC7D39B29F450@BY5PR11MB4243.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7QhBTVMpGZZn1mchm5prwUWaMjSsh970G1UZVefGLt8BbbL0IB/08X7JiV6fUAsjn3VDrxpNBOUb+QN8ddul1Nt1wtzwx9o0ZLOCJIZ+vl+86RHfnGrSimW5Z7es/YdXpqU1P5dEC8bqwbW1AMXcFueAqCVI8plCXbzegBbUQCBZWcYVy1kOXnRjzexVJGZKL2uBIMaP5D+d4HqeyJKYYeF/TBYCzP9JrWpysVJCrr8TA0SeYaLijczEclAC/VutYundizaUjWarQ5LdFhAtZjZSM5xEdpVktgOOCWl0epjYQJQWCR1IsMkGQOy1o+NC4LHkJg1odC1oivrplETWNT5cwLM5nBKlKuKMuYCj9mAiErVy7iA8eyFC0Rku4pGF16yvwC1aw8Va9s/W9a6XWRdzHzJwBM8jML9e6Vg/kNpkdcbWVhUQeGT8onfyceFyfMBemGXdSYftHjCVB/8prQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(396003)(39850400004)(376002)(346002)(44832011)(53546011)(52116002)(16526019)(186003)(26005)(956004)(8676002)(33964004)(2906002)(2616005)(31686004)(36756003)(6486002)(4326008)(16576012)(8936002)(966005)(66476007)(478600001)(5660300002)(66556008)(66946007)(83380400001)(6666004)(166002)(31696002)(86362001)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	bmu8BVwNF25eEc4/AiDSXIYK38tP01UT74EiV4+J4OlNgY9WZATHoxHtZG0vMTTds4quU2XFprxfgYlMO1XdEyup9MDFt+k+T2WW1x4PmauwUXa65T8LwPxuSi4blW4je5BbIFpH9tgigkzok0GOnoo38DRCbW2Qcwfgq2WiUM07I+PDKr2lT7Ps2Jg0eW+OCj3yM+Ak1RxiZkyn3TgPE9dubrAZy/TfFRRU6X+w0pU8H6KK4UzUavGKtZ8NdbNm98M3q84RGT3YiKqv3MOnYGj4hRis/jlVh4MXLntQ0t4wRgwr4yI8Wo07n7AG0WyDtq/Xhc+FVsheq2PjmCElgf8vU5zQc4q+PjLM8cmbmFjSUfhlh8WXPMO3j1NI8q6MrAfpPAywzt7Vi4ElvQGL/daJjm+XvHks5NxakqCtj+lZYhn2wxtCJaAkCv7MuXOw+KOt6V5Sa9ECRxmzA9BMBffZnjRnYkqNYEz69yXntfW5/OnHrvz3j7LcOh2frjfzB0SOr6RsgoC2pbKjl+v3M7IuSE/RXSDwH8MRiAzXC/a9DLPpgMc3qJUB50iPfh4x4m7DQgUTWS2GijEWY4FirkpbwEyPaBg7m3lygt+tIxDQg+polUcldXLV4kkJ8ahxfSxLMzKw0eEaPpaGNxmqpQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d022a4c8-3040-42e4-9274-08d83dff63d9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 14:03:57.7571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x54y9oWucmgA3zBykbub3sFigw5ByWnyJTOkgwlKq2Ae9sYCeeOvmmzaW7pzoRinjegETUnTl22/fC5HUpycM2emmeAMAG0K8LKFy39+6Jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4243
Content-Type: multipart/alternative;
 boundary="------------AB338EC58020B3C7F018C315"
Content-Language: en-US

--------------AB338EC58020B3C7F018C315
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/9/20 4:02 PM, Khem Raj wrote:
> From: Colin McAllister <colinmca242@gmail.com>
>
> Created Python3 recipe for PyNaCl.
>
> Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-pynacl_1.4.0.bb            | 32 +++++++++++++++++++
>   1 file changed, 32 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb
> new file mode 100644
> index 0000000000..6fd42ebf81
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "Python binding to the Networking and Cryptography (NaCl) library"
> +DESCRIPTION = "Python binding to the Networking and Cryptography (NaCl) library"
> +HOMEPAGE = "https://github.com/pyca/pynacl"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8cc789b082b3d97e1ccc5261f8594d3f"
> +
> +SRC_URI[md5sum] = "8c6c57893327a694c72510fb620e4744"
> +SRC_URI[sha256sum] = "54e9a2c849c742006516ad56a88f5c74bf2ce92c9f67435187c3c5953b346505"
> +
> +PYPI_PACKAGE = "PyNaCl"
> +
> +inherit pypi setuptools3
> +
> +DEPENDS += "\
> +    ${PYTHON_PN}-wheel-native \
> +    ${PYTHON_PN}-cffi-native \
> +    libsodium \
> +"
> +
> +RDEPENDS_${PN} = "\
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-cffi \
> +    libsodium \
> +"
> +
> +do_compile_prepend() {
> +    export SODIUM_INSTALL=system
> +}
> +
> +do_install_prepend() {
> +    export SODIUM_INSTALL=system
> +}
>
> 

--------------AB338EC58020B3C7F018C315
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/9/20 4:02 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200809200207.2328601-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>

Created Python3 recipe for PyNaCl.

Signed-off-by: Colin McAllister <a class="moz-txt-link-rfc2396E" href="mailto:colinmca242@gmail.com">&lt;colinmca242@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200809200207.2328601-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-pynacl_1.4.0.bb            | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb b/meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb
new file mode 100644
index 0000000000..6fd42ebf81
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.4.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = &quot;Python binding to the Networking and Cryptography (NaCl) library&quot;
+DESCRIPTION = &quot;Python binding to the Networking and Cryptography (NaCl) library&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pyca/pynacl">&quot;https://github.com/pyca/pynacl&quot;</a>
+LICENSE = &quot;Apache-2.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=8cc789b082b3d97e1ccc5261f8594d3f">&quot;file://LICENSE;md5=8cc789b082b3d97e1ccc5261f8594d3f&quot;</a>
+
+SRC_URI[md5sum] = &quot;8c6c57893327a694c72510fb620e4744&quot;
+SRC_URI[sha256sum] = &quot;54e9a2c849c742006516ad56a88f5c74bf2ce92c9f67435187c3c5953b346505&quot;
+
+PYPI_PACKAGE = &quot;PyNaCl&quot;
+
+inherit pypi setuptools3
+
+DEPENDS += &quot;\
+    ${PYTHON_PN}-wheel-native \
+    ${PYTHON_PN}-cffi-native \
+    libsodium \
+&quot;
+
+RDEPENDS_${PN} = &quot;\
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-cffi \
+    libsodium \
+&quot;
+
+do_compile_prepend() {
+    export SODIUM_INSTALL=system
+}
+
+do_install_prepend() {
+    export SODIUM_INSTALL=system
+}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------AB338EC58020B3C7F018C315--
