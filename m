Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.84])
 by mx.groups.io with SMTP id smtpd.web11.44463.1597065117409934425
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 06:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lERymiBp;
 spf=pass (domain: windriver.com, ip: 40.107.237.84, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfr5vUMpuxcdbhAk4SHlPxybrS80g3f8gODXDeJS7LGFzHr2i3sCCrOz//mAzBCRzNf2yA8kH0SCg2DTno+GXrHymaOm72CgiicXclVUxu3hxbSenfAC2oJ+/V8L+9gmyos4vwTtRSSpSRNF85dc2OBZzc4Ocu5F/fgV+S+ZOTO/z2u03uCdzm6bbRDN7pJ5d7HSRtwAfdR+yyp7WZedIxXaadr8hi+mz4qQBMZ8GIzqHVmvpZnkMLlJ2kjv7AscfNMTofewruW2Orh+Ytaaa9q2KKdvobLX+f42B0rxEx5I4inFGRLNTjRPkPG5ZG5JRKQ7LU77jEAuDd4CdYEZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxBdNQLiAzHUeTgzimOKLgjI4FvgJJ1bJiLpRo4HAQs=;
 b=T6p5TRmjAXPiXuPsQd74FWNH7ci/cwFnmfsoLXFCGKx/+ctoIOMRa5ToZD9eDn1tQYTUEeS75NLdMIyEY6gdyCOZku0F0bQkko6jc0lucv6Vu52JH1BTV1oS+Gs7QMvhlRjxTjPYS0NjddNYMXqCwf7hg8UjOqntbO7mNkgX0U0RsRsq4ITkSqabkrui5f022V2TsRaUkKS69IHTnBBdZu9tehDvxHC5yLawfopM/OmQv5dgs7NOZnzQIBOvDsW1jEgbpPA6q1a2MFgrxyYe7qpzaCaW6c7mNxGIl9UW+EQVNmzdHFXi3yHBZF+aLpQTKjQwdOFiqIv+SAoHaRP1Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxBdNQLiAzHUeTgzimOKLgjI4FvgJJ1bJiLpRo4HAQs=;
 b=lERymiBpFpc6u75pSLOhdCiDRttIBr/60wBT3Jadt4n+mS2jpwJCsivE/d5ffQ7y8bn8uNp5cFuhTubsmORsnVpb63q2Q7jrfTqPlOGmMih7yz1VdbZQG7kStPoET333tcrwrIronLPVaqCiKxMgSjthllHT/qYb7QT+rpr8r7c=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 13:11:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 13:11:55 +0000
Subject: Re: [oe] [meta-python][ 5/9] python3-jedi: add recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
 <20200808170407.2326879-5-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <67fb9293-6366-7cba-face-08805f97eaf2@windriver.com>
Date: Mon, 10 Aug 2020 09:11:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200808170407.2326879-5-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0050.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 13:11:55 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c72498c-93a2-4d2c-2085-08d83d2ef4a5
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4226432C54A67CDBB50D257B9F440@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6AjAu/fGCogqItw90mYyZ80yDvisaKDQPTbr8wUJ7yVnnYYIVJriVfE67YgupODHozFW3UNsy+rMfGJdiT0ctBuYUvudZKln/9DFYjTSMK/kuts/bpzqpi/GEdttb1rpcYTL7pyhcXgWqXacqVeYwSi3+/T1scZ1km4WNwgRS4np8gYZ5n2ijtzM1Cm0HYbbHvRQvEsY9OQvQg8H7XnF62u2NIq4pEg+1tX2O/ryKTZb2xI8EOvRmMocYIc8IVRFkP2pen3bsbnCzi81VZ0k/pVrFTWXSrZrqJDI3PrIB/VV7VNLJBYKY+tW+uOhcvDkZe6eX0yAz3i374wPxIpvel1njM9JJzBymXbi2rmDZxWAxoHkFQsGZ444qN4VBxESaz6EfkrDJqPI6vrhr/0KF3JCcApppoz2CCOPO/BOU3Xcd9vgrnYgcKCpDwtFNcev2VQPDBgkC/7u091WVzp4bw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(396003)(366004)(376002)(39850400004)(26005)(186003)(16576012)(5660300002)(16526019)(316002)(86362001)(66476007)(966005)(8936002)(31696002)(52116002)(6486002)(33964004)(36756003)(8676002)(2906002)(53546011)(31686004)(66946007)(83380400001)(956004)(478600001)(4326008)(166002)(66556008)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	toaz5YJsrcYbelp6HCzd2JE6R6PxxoaKFu1cBl7Ikb98pRMgB9eRLiH9yBnH3ZoJ2nPbf0KiOgNJaCh6dd5wqWKIa0vupI8pMnKIludwbdEj/tso/ril9FhpJHW0assIRLuz5SOH1W2D8C8kzp20Ngxkiuxkwj+Xz4gjeWscw68Bd73Edi3I7bz83t+NPvzz9rJGm3QGIDYaAEF2U9rFMspgo0st9zUueWsPsfSkItalYB4Eft/F33moKxt2CNZcyZT41o0v0EKW8PQd1wrt8nLgsxPO8kgrGUXLkfz2ZLbJ3Hs6mnTh1H1Jr4s3EY8OLfjye6U8qfT16Rr2AkGwDFtIxcn9FHgxCGnMmGn/9kUHMyPs/edIxbgNJ+4nZcO82qV0WYRdldyC0FfAobVbqjy/MhzTj2y6AFA0oP0O3W6wWq8BOBXtyek4OKyrtbPYDGsWyMZ8moptBMNQbm/+bPZ85D+WUmy4tXWbDY3mG5TFcsKmR+4Zfbb3xdc+vL4rwXSQ0m/qNT2HGN9BcY8gHbdeEpezrwfyMQ+iNkXRi/YfWfOipWmmzsEo8IpGwAtTPx/BSqVoYTcwoEnCJcf4rrUYmpT8x1OwHWO3EEGdkgj8xyr9F870Dr72aYEui57/LYduLL0kYrvB7/ON05fgXQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c72498c-93a2-4d2c-2085-08d83d2ef4a5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 13:11:55.8465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbTB/qhlRZH01O243bahcXh1DDm6J0tPR+ZULJkgcX0qeS13GBS+VbfrKqWF1TTWCW6ZSA0TZwqjv2Lf+GlvV8tunozo5Hk+3rFcEveX2Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: multipart/alternative;
 boundary="------------E08B4A0CF6B95C5F0C881363"
Content-Language: en-US

--------------E08B4A0CF6B95C5F0C881363
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/8/20 1:04 PM, Khem Raj wrote:
> From: Shlomi Vaknin <shlomi.39sd@gmail.com>
>
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-jedi_0.17.2.bb | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb b/meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb
> new file mode 100644
> index 0000000000..aa5e698740
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "An autocompletion tool for Python that can be used for text editors."
> +HOMEPAGE = "https://github.com/davidhalter/jedi"
> +AUTHOR = "David Halter <davidhalter88@gmail.com>"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4"
> +
> +PYPI_PACKAGE = "jedi"
> +
> +SRC_URI[md5sum] = "f012668907d76cebe9c4766f3b806fcf"
> +SRC_URI[sha256sum] = "86ed7d9b750603e4ba582ea8edc678657fb4007894a12bcf6f4bb97892f31d20"
> +
> +RDEPENDS_${PN} = "${PYTHON_PN}-parso"
> +
> +inherit setuptools3 pypi
>
> 

--------------E08B4A0CF6B95C5F0C881363
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/8/20 1:04 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200808170407.2326879-5-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>

Signed-off-by: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200808170407.2326879-5-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-jedi_0.17.2.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb b/meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb
new file mode 100644
index 0000000000..aa5e698740
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jedi_0.17.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = &quot;An autocompletion tool for Python that can be used for text editors.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/davidhalter/jedi">&quot;https://github.com/davidhalter/jedi&quot;</a>
+AUTHOR = &quot;David Halter <a class="moz-txt-link-rfc2396E" href="mailto:davidhalter88@gmail.com">&lt;davidhalter88@gmail.com&gt;</a>&quot;
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4">&quot;file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4&quot;</a>
+
+PYPI_PACKAGE = &quot;jedi&quot;
+
+SRC_URI[md5sum] = &quot;f012668907d76cebe9c4766f3b806fcf&quot;
+SRC_URI[sha256sum] = &quot;86ed7d9b750603e4ba582ea8edc678657fb4007894a12bcf6f4bb97892f31d20&quot;
+
+RDEPENDS_${PN} = &quot;${PYTHON_PN}-parso&quot;
+
+inherit setuptools3 pypi
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E08B4A0CF6B95C5F0C881363--
