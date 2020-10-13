Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.48])
 by mx.groups.io with SMTP id smtpd.web11.9176.1602632642021897974
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 16:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UBGpQNat;
 spf=pass (domain: windriver.com, ip: 40.107.244.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVEzIC36b9gr4iMcXUOlqO7CyGmqy608PZv2S/OODYUiS9fevw/q+JDWIH3jKZpctDpWyQpRAsrS6Skw9sOi28ICcl9/61xlLrJ8y7jq/AaAqPB8U+LyyOuDofKOmZWWFfX0UDNM8Mno3YrXK0NXG5RI1rBxOYIK83rrIAknF1bjPpfrUSyAMl/0/sErhvUh+eg7+F63RBFsxK9lRLiL4OoYgOmmuOo1Tsya+lh2jV+qPS9SSN4mk+TgYazby8mGjPREKD17vylLkb61cnt2t2lnBfbfpIIRtIGPdvPZQX8ruEVdvNqdPkIyzfLr1sFTqeG1aQPybatEMpOGLxOLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dFPkFSuePab4dR2dnjWUkQy2cRNJrnyN4ktkpFqqXI=;
 b=iSjw8VNEgKPtVER7LVLLKMYsp764/1YGl60S+oSMRfklriheE96KvioDvYCDQhfMEK/otsJmRVOMsQLdATilG2OWdfsN2LDV6vFlFS6uZDvfuZQGr3UfuILnS/dYJS96JQdofwuRWJmmi1Z0SF5FAs9FxTPZMsJeC67mowMFELL7lbsbZRp7pCmDiAXc0SpT3dg2NjLKe7k9vn3qBMm0X7C+sznpGXvJuN+Fve+cTDcjuX+g6SzhidQ52uQDX4/1OGJ41+PCcMhT5OVm2Pw+eZzRSLhSejaqPJRl6G5+cEpLOd6iJsY7ycUJMF4CFz6ajStogKV8Pwf5qjEzD+4oDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dFPkFSuePab4dR2dnjWUkQy2cRNJrnyN4ktkpFqqXI=;
 b=UBGpQNat7lkpyd+RYlsgr4Q39Hbf3Rm3NDbmku133hc8wIcEIvEXOQwbe+WXpEVvtR7WbS+LNROXqrdZ26YG3EWLWZMNTjpRtTHiY7ZE3poZpksyLfa0MNXe/0kERtVPm67S0RcwNSaAWEk1m7TuHaxkCjJwbXmOLT19HwxHBSs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Tue, 13 Oct
 2020 23:44:01 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 23:44:01 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-colorlog: Upgrade 4.2.1 -> 4.4.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201009103535.31339-1-leon.anavi@konsulko.com>
 <20201009103535.31339-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f0f02488-f92c-a2d1-9bf4-e03500d38741@windriver.com>
Date: Tue, 13 Oct 2020 19:43:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201009103535.31339-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR07CA0042.namprd07.prod.outlook.com
 (2603:10b6:a03:60::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR07CA0042.namprd07.prod.outlook.com (2603:10b6:a03:60::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Tue, 13 Oct 2020 23:44:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d136ed4-eaee-4d60-01ba-08d86fd1dc5c
X-MS-TrafficTypeDiagnostic: BYAPR11MB3816:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3816A936FA0E1E06F0EB6F8D9F040@BYAPR11MB3816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s5658V2K3mcjgs/Hf3UVBKeyaPyGUyJIqcUOgCBQGkaG6JA0WFq6Pa+ZNaD5aSq2PbuHwtbQo39MfcycPAeQrkXFIVniFZufsSsb+5b7UbPKbOB0eavzsMXHCxFW2+Cmi8riuB36TBsVx7XJu2043cA/+Eqg5rUARRhx+NzVrm20f4wEt3JP+DAVqZ/izSHykq6kN6qCPqXZFLXSOEoHxsi1ROuj2wUoK20FlJQLyQtFk2QpmxDEq+8mNakkx6dWbOQ1A1GyJkN+zSFuDsUa1CcphTDPuKsKEEltlH0azbmWBHAn6ZEIX6JAgsbcXI2OeDisxPuTurXERE40ZbHumy7GrYgriGvVXpVP/zKt97NWAAf9b3NmQUDneWUjd9WJgpE99kp2kkNGxqo7dZ3qaafetkbmEtnGe5BytqA7mV86ZqyYee0C5YefPMgjrL6AeJ0m9W+23P8oRWR3h85ppg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39850400004)(316002)(66476007)(66556008)(44832011)(166002)(478600001)(2906002)(66946007)(52116002)(33964004)(16576012)(26005)(36756003)(53546011)(16526019)(186003)(83380400001)(8936002)(956004)(83080400001)(5660300002)(2616005)(86362001)(31696002)(31686004)(8676002)(966005)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	KsRnOCgQn/y3ocTb8hcm5FieDEcdgFcMDqxo70xEwpi8vsBhDViPaBqKt84b1xiQKt7b28PImEnOB6nCu9bs1vnbTujBGZkpQrWLXGhdul1/4udFPGauit7PCFKWP8dlW+fXsUIIUQhoC59iqTWtsejTiE2wTq11VyLcBLkGyXdHC9TjDwsRh/twtKq9hyoJLjbHFoJNd+rrkb9azuBjxe2QeaFPhLWwU1dDrIwrlTPlyhplzm0tmBUUPupFbEGf40FJALniZs74FnBXSv9f1AiaEDfGzKLm0mPpy8XmWZmj/P9kAXkulTtk4sn1WNDtwr9Rf/QfV9SGRC+/hTIWoxaF5xRSXY02qGNERIBFd0RRTIhG1EgAWuXXbe4hY+GfTIGqpFZEq7+Lqw8mAfWtHNzGA6NbFq26+oUVgFHsqfKvlhxis+OdceXWXKgjttkaJOaZiZuFoEgXCGyLeT+FjSVW6PRrzdTPRdm2jpLIYiTF+Y2uhZ97yURAJLoksVH6mpQHqkWSwWBHHMpg3NKzL2+cSzyH4FjbOTvDzAtsf/ktr7dHpbPMGi9u/2zM5LakFd/fnpvfWQd8ScGYsgbEqMMBh7ERLalyY2JVkwNDDAkDALvoN8l9IWVGCrGk6E1fHrooPdPUgrVImkMIbgZQag==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d136ed4-eaee-4d60-01ba-08d86fd1dc5c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 23:44:01.0039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9NEYdkvYRBrzsGHpS6FTuCuoc+LzfdmO1okRg8gbq206aUjhQzo7Dh7yFlvXVhcPHGqDj2hUdSWd5nfNuiike5liATrirZeXKjKlxYdodU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
Content-Type: multipart/alternative;
 boundary="------------42F4AB39EFD40D5FE98E6D77"
Content-Language: en-US

--------------42F4AB39EFD40D5FE98E6D77
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/9/20 6:35 AM, Leon Anavi wrote:
> - Add parameters to basic config
> - Update README
> - Init colorama with strip=False to avoid unanticipated behavior
>    differences dependent on whether or not colorama is installed.
>
> License-Update: Use file LICENSE
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-colorlog_4.2.1.bb | 11 -----------
>   .../recipes-devtools/python/python3-colorlog_4.4.0.bb | 11 +++++++++++
>   2 files changed, 11 insertions(+), 11 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
> deleted file mode 100644
> index a4aaa3cb6c..0000000000
> --- a/meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -DESCRIPTION = "A colored formatter for the python logging module"
> -HOMEPAGE = "https://github.com/borntyping/python-colorlog"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://README.md;md5=05592f7a5b83bfc756f62dbd70a9b9b5"
> -
> -inherit pypi setuptools3
> -
> -PYPI_PACKAGE = "colorlog"
> -
> -SRC_URI[md5sum] = "a01336efc6f54e58e3ed4f331d76c2f0"
> -SRC_URI[sha256sum] = "75e55822c3a3387d721579241e776de2cf089c9ef9528b1f09e8b04d403ad118"
> diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb
> new file mode 100644
> index 0000000000..4a40ef38cf
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "A colored formatter for the python logging module"
> +HOMEPAGE = "https://github.com/borntyping/python-colorlog"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=85a1d478cd35d62763a1419e948bdde4"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "colorlog"
> +
> +SRC_URI[md5sum] = "0997566a87c6fdec0baa88055adc06c3"
> +SRC_URI[sha256sum] = "0272c537469ab1e63b9915535874d15b671963c9325db0c4891a2aeff97ce3d1"
>
> 
>

--------------42F4AB39EFD40D5FE98E6D77
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/9/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201009103535.31339-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Add parameters to basic config
- Update README
- Init colorama with strip=False to avoid unanticipated behavior
  differences dependent on whether or not colorama is installed.

License-Update: Use file LICENSE

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201009103535.31339-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-colorlog_4.2.1.bb | 11 -----------
 .../recipes-devtools/python/python3-colorlog_4.4.0.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
deleted file mode 100644
index a4aaa3cb6c..0000000000
--- a/meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = &quot;A colored formatter for the python logging module&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/borntyping/python-colorlog">&quot;https://github.com/borntyping/python-colorlog&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.md;md5=05592f7a5b83bfc756f62dbd70a9b9b5">&quot;file://README.md;md5=05592f7a5b83bfc756f62dbd70a9b9b5&quot;</a>
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE = &quot;colorlog&quot;
-
-SRC_URI[md5sum] = &quot;a01336efc6f54e58e3ed4f331d76c2f0&quot;
-SRC_URI[sha256sum] = &quot;75e55822c3a3387d721579241e776de2cf089c9ef9528b1f09e8b04d403ad118&quot;
diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb
new file mode 100644
index 0000000000..4a40ef38cf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = &quot;A colored formatter for the python logging module&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/borntyping/python-colorlog">&quot;https://github.com/borntyping/python-colorlog&quot;</a>
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=85a1d478cd35d62763a1419e948bdde4">&quot;file://LICENSE;md5=85a1d478cd35d62763a1419e948bdde4&quot;</a>
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = &quot;colorlog&quot;
+
+SRC_URI[md5sum] = &quot;0997566a87c6fdec0baa88055adc06c3&quot;
+SRC_URI[sha256sum] = &quot;0272c537469ab1e63b9915535874d15b671963c9325db0c4891a2aeff97ce3d1&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------42F4AB39EFD40D5FE98E6D77--
