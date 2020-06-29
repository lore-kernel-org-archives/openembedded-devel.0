Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.81])
 by mx.groups.io with SMTP id smtpd.web11.20706.1593442571145983674
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 07:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OtOZyJjg;
 spf=pass (domain: windriver.com, ip: 40.107.92.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUxuxLN0ecMO5Ubt18KCExirPX1xY9CIQhxXIzleUmjaxKRpJZsp4aCbIbzlh9PX4t33VQuHTqM14Vbz0fWtFdkjnaf+MITiCMEde6lSGh43j+BvQTwUeb6nAJ0P4U9OInQANSa7qIbfB0xOb0OnVxGDj5AnQJu7BVfxJkj8m8FYurhSLrqs9BM3yYhQ7KTjPY39HFZzH29SvNlOdceZi6vUk64ZTRk4bfQsjYCSsZNdKF3BjbVzIw74J2T8aFsq7OhOppPV6C9XxsC4N8jiM80VV6se5jSMY466YttRgAGB9qeZ1QnodebGsjlQr279y/lbLB4OixTylCCUcAfSRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mq+NOwzPvyrc2nHwFzd7SeFbLEK9g78u8hBtmjJq/U=;
 b=FOWOPJ+8WXxJH/20VIjyG9USXO0/XKMoiuPwXNzspIux4zvY3o0d8evMca9OcNt0DZDlvAIRWQf8OHKPcc0BloehNFqa0VeHi8LdN4+EteZnNwksN2zzoSVV8rnD0YR1583II6Khf59XM/7g65+nDGyLXEkG14I+z3eFmb4vrtpdivmus5pcwDZS7sIG3zUz7pOUQ2nPRmbXPPDBs668lsJG8KPygMoOQI68DXnmTZrtOqjeZrNoTxYRaf15MmSGcO+bYWiaJvzGh08folyTYdrdFJ4E40t7FuoTm8lqJlMCX6c2KPXX3m7VT5y7a1Y1ArmACb0SHQBIDOTyQeaMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mq+NOwzPvyrc2nHwFzd7SeFbLEK9g78u8hBtmjJq/U=;
 b=OtOZyJjg3AI6PLZOXdTemiUzI+lI4pPi/ZUxOyp420f0lE/lOgcvxSeYtrLki4vOUtsyRUMW3E0Yc5N1O1QF8CjxKM0vaqJw3qZZiieVC/DFNuwabCk5Yq7ISnZCLpuZcg8wEEsujS4tSN67bicqowj/b/nSJjgSRw6gJ06oQmE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1988.namprd11.prod.outlook.com (2603:10b6:404:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Mon, 29 Jun
 2020 14:56:10 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 14:56:10 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-bcrypt: Enable ptest
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1593333924-4040-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1593333924-4040-5-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <eb4d0d2a-da1d-6383-a052-eaa624be14af@windriver.com>
Date: Mon, 29 Jun 2020 10:56:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <1593333924-4040-5-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-ClientProxiedBy: YT1PR01CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::31) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0092.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Mon, 29 Jun 2020 14:56:09 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 254121b8-cebc-4783-ecca-08d81c3c8ef0
X-MS-TrafficTypeDiagnostic: BN6PR11MB1988:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1988008D679EDBF264FA69479F6E0@BN6PR11MB1988.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tf9iDGaknPoLUaN2fj37NHVacHlWr6ujizyRqiXtYCQj29QE5fs8GKH0Nugz9vN1ptSqp+zAjZIctyRv3xcryVzwqpVlZN5JopTJqFXCXz8NK7nBy4yry88jdCpTNG/XmM0tx+Rrzu/58yNPAUhiFIVp8EyMsvGeklYfEQDsmlHa4WXRMySgt5Y/HzWGht6PeQR5iBFJeFhbKxX7PM6JCFgzTHldQYLuJSEt4WkHC4CKphHDMgP9N66AgVnZzf4CAOrox+Oer/T6mRHkQpBl5AZo/cqeVN8lkbxrEa6fs54Sbycfwbph44IQrI4tjRj34Ej2U3DgVgiAyrsf5Jm76G/PVeP6B+LLMq34ebE3lUEN+0WQXnFbGUXnzdExIrcRmpy+CEKbcmMQXySeIFBq966TD/zDrruR6YuaeoOI6g//lZTSpRPhjnQ/xEfysd09XYAN/lRliujn+goXyuxnMA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(366004)(396003)(39850400004)(186003)(33964004)(53546011)(26005)(52116002)(6486002)(31696002)(2616005)(44832011)(66946007)(66476007)(66556008)(956004)(5660300002)(2906002)(478600001)(966005)(36756003)(16526019)(166002)(83380400001)(8936002)(31686004)(316002)(16576012)(8676002)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	OPeVJ6SIzqXpdd+DOlLZ0eojVFvO/O+PBV7TcUYYW1PYNp0n/tIC3pRVIBirknCjXOGG2leqivcaQxviy6tWwaxHjuE9PYaA+f4LzG62K0Xw190QlVUk6PESMlTFqL1EW1xhKDjIC3VCDABuO/pP079IwrmhpRET87Q4LcuYcTZSsKQ9leOLle7/Vysrn3iGBbS45KEidHVjOGstoLU+6psUhxFa+SUpRETAoO3qGuwddZRiNCE0ydioHI+PeDHf8ke9GkwrevMzbm2KiJeAg5dJzhkpc7zL42HhHqeKtNCi81o/dYrjzHpk7rEPvH5dff3qL1t0xMHfJYUq9Lr0egQQCvPfVO1IxwVMzbtoo7baN0cb8iPO12DKJhfQFymAr+swSID2Q2VbmmdNLVO7bpuFyn1Syy6daDB0Ma+9GH4uJ49XuUsDGXixr1LiX8WVTMDieRDaRRlITlmLlnRUS5RAKTqvCrS09otKKhTEwR4oxrjpYNOUrbIeiYBodqJX
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 254121b8-cebc-4783-ecca-08d81c3c8ef0
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 14:56:09.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PFQZrC9De72KubeQ1JENwizZlQFNIsInwVqO2krVuR7N/7kg1Jf+o3Bh/dA6EPQfcpw8NLsAvY9grJwNSCk6tbkR8OPNPsioF/6JMvcApE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1988
Content-Type: multipart/alternative;
 boundary="------------1C6CA7641E071830CED48256"
Content-Language: en-US

--------------1C6CA7641E071830CED48256
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/28/20 4:45 AM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-bcrypt/run-ptest               |  3 +++
>   .../python/python3-bcrypt_3.1.7.bb                | 15 ++++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-bcrypt/run-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-bcrypt/run-ptest b/meta-python/recipes-devtools/python/python3-bcrypt/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-bcrypt/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb b/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
> index 0f2d31f53..3b9cd52f2 100644
> --- a/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
> @@ -7,7 +7,20 @@ DEPENDS += "${PYTHON_PN}-cffi-native"
>   SRC_URI[md5sum] = "5d6f93b575ce52470af37a8e7dce76fe"
>   SRC_URI[sha256sum] = "0b0069c752ec14172c5f78208f1863d7ad6755a6fae6fe76ec2c80d13be41e42"
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
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
>   
>   RDEPENDS_${PN}_class-target += "\
>       ${PYTHON_PN}-cffi \
>
> 

--------------1C6CA7641E071830CED48256
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
    <blockquote type="cite" cite="mid:1593333924-4040-5-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1593333924-4040-5-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-bcrypt/run-ptest               |  3 &#43;&#43;&#43;
 .../python/python3-bcrypt_3.1.7.bb                | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 17 insertions(&#43;), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-bcrypt/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-bcrypt/run-ptest b/meta-python/recipes-devtools/python/python3-bcrypt/run-ptest
new file mode 100644
index 000000000..b63c4de0d
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-bcrypt/run-ptest
@@ -0,0 &#43;1,3 @@
&#43;#!/bin/sh
&#43;
&#43;pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $NF, $0}else{print}}'| awk '{if ($NF==&quot;PASS&quot; || $NF==&quot;FAIL&quot; || $NF==&quot;SKIP&quot; || $NF==&quot;XFAIL&quot; || $NF==&quot;XPASS&quot;) {$NF=&quot;&quot;;print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb b/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
index 0f2d31f53..3b9cd52f2 100644
--- a/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
@@ -7,7 &#43;7,20 @@ DEPENDS &#43;= &quot;${PYTHON_PN}-cffi-native&quot;
 SRC_URI[md5sum] = &quot;5d6f93b575ce52470af37a8e7dce76fe&quot;
 SRC_URI[sha256sum] = &quot;0b0069c752ec14172c5f78208f1863d7ad6755a6fae6fe76ec2c80d13be41e42&quot;
 
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
&#43;	install -d ${D}${PTEST_PATH}/tests
&#43;	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
&#43;}
 
 RDEPENDS_${PN}_class-target &#43;= &quot;\
     ${PYTHON_PN}-cffi \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------1C6CA7641E071830CED48256--
