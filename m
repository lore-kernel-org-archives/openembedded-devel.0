Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.47])
 by mx.groups.io with SMTP id smtpd.web12.44204.1597065071554498805
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 06:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=F/G4wjnl;
 spf=pass (domain: windriver.com, ip: 40.107.237.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QknaAG8P91esEr+3CMWBtbcR4VxmDUAlpizx+qtj3+bo5bzxicxs/wjM0DFKJpBS5lO5cJ9a0hTKqdhWkNDEixXIToJ/a6cGbKRgIHzhLrGRrDhD35gvGeZqhRZE186aljGXsLC5nwSHf8Ai9X7kn7+e5F3S1pujl6Tomn+oDckfPezKtT+I2XIyMkbFkRXc0rQiugTrmlvpt2WgkO+hzJi7T/BQpG74aSPVWBJWncr80nqSZrhyq206hZ+noTZXebUNKnhQbPDq/LKDAQI6dgcCLt9hGdAX/WH/j8c6IA//NGHTm5HJxFFSauEjffqG9YW/8Yl/rB8ucdPNX7P7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJv/1Q9kkT+EJ44y5VZt9hF3Bc+GoMGwSKTv0rs7gIo=;
 b=M0tv6KrbaX7rnzFtdrWNxm1IcKKEtNt6zegvTl3pPkAIVcxAkZiK97GSJIIFDyzQvLAD39i/JEagfXMuoS7nvNdh6NozN2H6WaqeMyYb/hdnMRwrs2H8m+7RXeuRw3pk60FoDOVVZglGadEyshy3pxkis0uB+bAL7LnZ5sUyvG+GYdeQHKu0JzDipfzn2wTDbE47vGCXS42cdN6m8Lgv+n05Ty+DOLy1ySGKBA0TpfPCkjZPmcaUQ7Wn9ZGWN2crW1NbVhvHQdu4pmyNSG6IOC4eCrHkPeMcu/yvqfmAQHsgfVlAD9Aoa8A8191Yt13xFMWg0+D5b3XDyOTRaySHZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJv/1Q9kkT+EJ44y5VZt9hF3Bc+GoMGwSKTv0rs7gIo=;
 b=F/G4wjnlZd40zwsycwWXu0pGQ18/WjpbT0AJ96YT8XZgT6YtBm5Xoo59au0sz0o3BA+xVpOQxaCAFcL1b6S//nvWlQcWTSRhMdrgGe2cq6IQ/2vzJLwWr1iESnHoGzXG7mTGOlW2oF138HLBPtGVP4EgRa9615Jrrm6a18H0QyU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 13:11:09 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 13:11:09 +0000
Subject: Re: [oe] [meta-python][ 1/9] python3-ipython: add recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <788b6abb-97ac-38e9-061a-25006a59d9ab@windriver.com>
Date: Mon, 10 Aug 2020 09:11:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200808170407.2326879-1-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 13:11:08 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8869bc1b-313f-495e-8069-08d83d2ed8ce
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4226B8A2D31447AD5E42B7779F440@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4fxvvGMiZNRLgp3CCsE/+KFcrQkkCdcTc1ZP9fHqJ/F87rSQwEhGeiB/L/GxxqzLEodAeIKo8hVEfKAmIjapfZnWRQ6V0HnSIPQ26wZTn4Tcwjw1CBuuLd6bMuKNjm1XtP/L/a94+DYWka2gQEDB9g1hPvTSvvOtw/0DE/ZcdHOEFyLD+GYQ+XBWXwo7rolpXm+KpEkDh3VxVUVq9Rxu/E0k+PdmO//5hjC5YPwvnavUqBzRsUVLOHU+e8gUeD8DlbExq/tOdAqp2qREYfWUwaDPgwtbVXsi74xZW7LEsapcDOkya2Ud//CPuZJm8uG75UzY8Vz7RPB3PP8o2Hrg713BrDWTaCJ6sHGzm47jYLkdOG/102LbMyyYIjJ7iC4lVGgwOV8/HIFN3fYaqmQhb6Z6EAR+LzC9rRD+zo0//3ZTZJjbLfEZWSCAv68j8iaEN+kl0jJXJhaWKLaJq6/1vg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(396003)(366004)(376002)(39850400004)(26005)(186003)(16576012)(5660300002)(16526019)(316002)(86362001)(66476007)(966005)(8936002)(31696002)(52116002)(6486002)(33964004)(36756003)(8676002)(2906002)(53546011)(31686004)(66946007)(83380400001)(956004)(478600001)(4326008)(166002)(66556008)(2616005)(6666004)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	s/iF+UJdOTG9QkNEIu/KzvRpVURDmPg9ZKOeEfg2HVCJFh6iJlVjsRZEhoNXA5Vj/xM5+QUkq0Czg5YYSWPKzT/JQCB6kvSnynFriIZFhQY2dLsf1zRVgc3NRz5+ec2sGSt3vawjp3rWHzN/faCJD1NjJHFBfrVR9ci0Jz0+fhVRKFdoM0Ob8aBVC4dpA/n+pJInTFpC32h9H4Z3Q+jYoRHdnffVpKF4CV6+DfTrHK8dGwolduLOA/IIINs28iBKO9OsUzn5aJ12qW58Lj0bX9Pft6DqiJzrx53EEvEN15nfMZVTPHCi/7pNRztaKhZTqZfs+K0Jtlk7+mSLbU4/dAQ43CdAoal+n+DXuaq7iKqae0sfWw2sSJxtxFU7C9vgzTRPBU2TTpshDeI9Ld91HG0hh8/fD9gmF7d5MlOk2rDnyGkdk6rJEJ8pVMm3F1Cj4n95OIn9tookeaaTSHem6VKBzNkpPjxXFtWn8en/he8O3/A63ofT/ZXI8PWvX7OmNifZ4g4ufcCrLUhaD/JJBZuPwZTLlKFO4VFSQEGHrF43PCPU0tz9gfo2ERkDyqgNqWZ62Gi7qwWMf5IoQZ+y9JjdtRtH3syyRS+yR4qiIKmDElKg3vzgFhEJjuscv1/sRnxixw1qBt476rrC9yrnIQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8869bc1b-313f-495e-8069-08d83d2ed8ce
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 13:11:09.1385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IrbfHzI60wZChdfn1Xzddqeo/Ci/KVvCS+FUxJttujR32epRS0V397bdisCMJ5hM2Z8R6HOZMFEarffEgfhf3rxNZWNVKiPfsy0e+iI337Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: multipart/alternative;
 boundary="------------BBCB28A6E329AE47BB01791E"
Content-Language: en-US

--------------BBCB28A6E329AE47BB01791E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/8/20 1:03 PM, Khem Raj wrote:
> From: Shlomi Vaknin <shlomi.39sd@gmail.com>
>
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-ipython_7.17.0.bb          | 29 +++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb
> new file mode 100644
> index 0000000000..ddcddd60b8
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "IPython: Productive Interactive Computing"
> +HOMEPAGE = "https://ipython.org"
> +AUTHOR = "The IPython Development Team <ipython-dev@python.org>"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
> +
> +PYPI_PACKAGE = "ipython"
> +
> +SRC_URI[md5sum] = "1f2257d771de9d2fb40d9e3cfcea429d"
> +SRC_URI[sha256sum] = "b70974aaa2674b05eb86a910c02ed09956a33f2dd6c71afc60f0b128a77e7f28"
> +
> +RDEPENDS_${PN} = "\
> +    ${PYTHON_PN}-setuptools \
> +    ${PYTHON_PN}-jedi \
> +    ${PYTHON_PN}-decorator \
> +    ${PYTHON_PN}-pickleshare \
> +    ${PYTHON_PN}-traitlets \
> +    ${PYTHON_PN}-prompt-toolkit \
> +    ${PYTHON_PN}-pygments \
> +    ${PYTHON_PN}-backcall \
> +    ${PYTHON_PN}-pydoc \
> +    ${PYTHON_PN}-debugger \
> +    ${PYTHON_PN}-pexpect \
> +    ${PYTHON_PN}-unixadmin \
> +    ${PYTHON_PN}-misc \
> +    ${PYTHON_PN}-sqlite3 \
> +"
> +
> +inherit setuptools3 pypi
>
> 

--------------BBCB28A6E329AE47BB01791E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/8/20 1:03 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200808170407.2326879-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>

Signed-off-by: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200808170407.2326879-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-ipython_7.17.0.bb          | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb
new file mode 100644
index 0000000000..ddcddd60b8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb
@@ -0,0 +1,29 @@
+SUMMARY = &quot;IPython: Productive Interactive Computing&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://ipython.org">&quot;https://ipython.org&quot;</a>
+AUTHOR = &quot;The IPython Development Team <a class="moz-txt-link-rfc2396E" href="mailto:ipython-dev@python.org">&lt;ipython-dev@python.org&gt;</a>&quot;
+LICENSE = &quot;BSD&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f">&quot;file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f&quot;</a>
+
+PYPI_PACKAGE = &quot;ipython&quot;
+
+SRC_URI[md5sum] = &quot;1f2257d771de9d2fb40d9e3cfcea429d&quot;
+SRC_URI[sha256sum] = &quot;b70974aaa2674b05eb86a910c02ed09956a33f2dd6c71afc60f0b128a77e7f28&quot;
+
+RDEPENDS_${PN} = &quot;\
+    ${PYTHON_PN}-setuptools \
+    ${PYTHON_PN}-jedi \
+    ${PYTHON_PN}-decorator \
+    ${PYTHON_PN}-pickleshare \
+    ${PYTHON_PN}-traitlets \
+    ${PYTHON_PN}-prompt-toolkit \
+    ${PYTHON_PN}-pygments \
+    ${PYTHON_PN}-backcall \
+    ${PYTHON_PN}-pydoc \
+    ${PYTHON_PN}-debugger \
+    ${PYTHON_PN}-pexpect \
+    ${PYTHON_PN}-unixadmin \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-sqlite3 \
+&quot;
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

--------------BBCB28A6E329AE47BB01791E--
