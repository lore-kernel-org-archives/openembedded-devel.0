Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.89])
 by mx.groups.io with SMTP id smtpd.web12.4857.1594857206714149360
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2020 16:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=S7JZO5b1;
 spf=pass (domain: windriver.com, ip: 40.107.223.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cX3eToTSI7iv9MLZo1C0yeSbugPzdrOENoKLwEmm2u2k7JW9nl+18/eQEuFjiKvkj/2i3rly5divTDmcSMTpB5YGjdBFCU/mA8WF4XvX2E93P9zcuxHs/CMdNlbQJJ49L9C8OXZQ9LhZMZVZyzjBUEGTWuUVVpflaTCKwKxIRMbYYKo4OSHRR86o5rOIbiXfPyKGP0nh5tZlQ2fub+NhdKgi79ibHGf1TyKsCgiwDH79rjJppx4JYJtJuj7fJNlk0TfjaMJNeWm67F2l2MckHmFGFH6TH288dS3GkjSlUSsvZn8/8G9iF1b0w/PgNDpV4skuJWUNdhPfITAnMD6Yew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AFoT6WzPsPRMcCuI8CJXUlGI4mlZQeqDpMK3h2ML+s=;
 b=IwOvJysW6HPw6/yZ8b2I/qyN8eiKnEOh0C8eHqECb0boqGPUGiCl9FiHPGhghoNTDg78WJ+tAPiVh0CEN6J1BOZTN4im6UYZdSmDNT3Qgd69H2B0J96U+XRlrs3OXczVLWpt9oFQLh/vUPSV8Zl4PlOSk04CWlIcuMENBsRglkw26MFjaXyYvSnNlc9EZJNTyXJN55PlQ6KWrf2bTIFic3d9+KnUw4b9+g+3NRRcFyZ1Lgh06c1cltNkNKGFXcmufXGulJgFnLAUgkcvu2A981RLTkB9Ci/kq7EVRXQa/zIzLxltWrIxfwc++xgBMV95hbPGQhsGvHiiTkTSThgsGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AFoT6WzPsPRMcCuI8CJXUlGI4mlZQeqDpMK3h2ML+s=;
 b=S7JZO5b1v1osVEPv4rWgh6Dv3PwnIC0yqlDb8+2CAyBso1QCi9mRKMmh4S2ukisijfjC1X5H9A0LC1JLlgdnepieSyfHuhumWGD/OuXyxwVwLSX/5Eq9xbZN5eNA+HfUfS+vXNLBI4CmJ2eCoeBdVbQw+HZ7gbNbIUbanxpVebI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB0007.namprd11.prod.outlook.com (2603:10b6:910:79::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 15 Jul
 2020 23:53:25 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.018; Wed, 15 Jul 2020
 23:53:25 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-qrcode: add package
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200711031932.5883-1-akuster808@gmail.com>
 <20200711031932.5883-5-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ceeb3c6e-fe6e-98cd-3671-8746dd42993f@windriver.com>
Date: Wed, 15 Jul 2020 19:53:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200711031932.5883-5-akuster808@gmail.com>
X-ClientProxiedBy: YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::6) To CY4PR11MB0006.namprd11.prod.outlook.com
 (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0067.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Wed, 15 Jul 2020 23:53:24 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 123ad435-81ec-416d-d4e8-08d8291a432d
X-MS-TrafficTypeDiagnostic: CY4PR11MB0007:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB000722E96A5941718E1B85729F7E0@CY4PR11MB0007.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NVyyjqQ+XMMVmBbYJ7d9lpg4g94gfWGcMWo7l2YAmTK3vyYCSmL2K0sor4DpVACx79nBNndyJr4ot5ubmHoT/D7yh1U81NUEppQhm6y+ZMtOKn7Sf0k0D3wcWe4LU/t7JTU9g3x5ZtrNlepB2ACBjseaFut16GNlbfJc3M7M1VHgQsujLebaRuzXhZkxJkxkR0x56P27Sgif0nuQ446eLViCLwUyc18kBWwp/OsEmEPmPckrNzYIlNbgkzkF1vr2G/vTG9lS4G12V+TKqQCYfEt7HllG5QwjQuu+qlWLdk/mKl/+EOOXsamCHuRIrb/v0xgfTrxjRmz4xMRC9duqWVV+/ZSHLvocn/3osn/KRp82RlhPNTDiPNeifCG8byhNGqy3xhN/9ZSHCAN5vz2cnAkxGbyiK8FADPF/QHfQ3er1BAbjRqZQvCeVC7d2Vk3qt6Nqp32saD4oRbK4kMXfNw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(39850400004)(366004)(396003)(376002)(966005)(5660300002)(8676002)(8936002)(31696002)(36756003)(166002)(86362001)(83380400001)(478600001)(66556008)(66476007)(66946007)(2906002)(956004)(53546011)(16526019)(186003)(26005)(33964004)(52116002)(44832011)(6486002)(16576012)(2616005)(316002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	WzbXV+8KlSWzyQnuivAi8gmBUtawocuZGH5FKEfZqYiIcJ5PGI2Hd8nK99DVO+3jy5edOFa0UZ6a6j8iLzF9BWZ5qUmhDYFbOnXAg9/KDZlUzR/hjiQzOuH1oKbIlqqktPV8P4ZgESDe0KEyNBwSkr54tPiJa7cr6N3W98aMMl7i9AxQfwvNJojiQjRfdqoNBOb+s2Ipq+b2BDodUYQNAlPKjEEnibROT04ZKbN7UpWkQhc25KomULIPfIhG5sUtW8Ojtg0WlzXC7aRtkCaoFaLhU+/cOJrsuuXsCC7ULv8SxQawb1YZdYUu92aCQ9ebjtFW9hTWSbgw4jGb/G4qCbiaHWJJkthZXXkRYc5z7Ll1ImPvugtZ+XkT7Lmr4aYxT8hJJYTFWLoztzDRUqnvo6wslxpXl/vpHYVeMwqdA8XTJ9aObxkBDmlY+AciEj+Xs+XW/0b9gzfUMlhqygM4eiHHgDutEZ4Octf3SQidNIs=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 123ad435-81ec-416d-d4e8-08d8291a432d
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 23:53:24.9598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ob/risq1lViA2oc5A0AF1QQO7bx0K+tNtnEBWduwMBNHsSZa5QxRJflDKJeCH36bU0nx75L67K4P7SqZ8DCu5Iz5af/q6umPJr7XtMPeSTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0007
Content-Type: multipart/alternative;
 boundary="------------DE35CAC19E50A0606A3B2A78"
Content-Language: en-US

--------------DE35CAC19E50A0606A3B2A78
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/20 11:19 PM, akuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-qrcode_6.1.bb     | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-qrcode_6.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-qrcode_6.1.bb b/meta-python/recipes-devtools/python/python3-qrcode_6.1.bb
> new file mode 100644
> index 0000000000..df99d403d1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-qrcode_6.1.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "QR Code image generator"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4b802d2a65df4626623c79757f486af9"
> +
> +PYPI_PACKAGE = "qrcode"
> +SRC_URI[sha256sum] = "505253854f607f2abf4d16092c61d4e9d511a3b4392e60bff957a68592b04369"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} = "python3-six python3-pillow"
>
> 

--------------DE35CAC19E50A0606A3B2A78
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/10/20 11:19 PM, akuster wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200711031932.5883-5-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200711031932.5883-5-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-qrcode_6.1.bb     | 11 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 1 file changed, 11 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-qrcode_6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-qrcode_6.1.bb b/meta-python/recipes-devtools/python/python3-qrcode_6.1.bb
new file mode 100644
index 0000000000..df99d403d1
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-qrcode_6.1.bb
@@ -0,0 &#43;1,11 @@
&#43;SUMMARY = &quot;QR Code image generator&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4b802d2a65df4626623c79757f486af9">&quot;file://LICENSE;md5=4b802d2a65df4626623c79757f486af9&quot;</a>
&#43;
&#43;PYPI_PACKAGE = &quot;qrcode&quot;
&#43;SRC_URI[sha256sum] = &quot;505253854f607f2abf4d16092c61d4e9d511a3b4392e60bff957a68592b04369&quot;
&#43;
&#43;inherit pypi setuptools3
&#43;
&#43;RDEPENDS_${PN} = &quot;python3-six python3-pillow&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DE35CAC19E50A0606A3B2A78--
