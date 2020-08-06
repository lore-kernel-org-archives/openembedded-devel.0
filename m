Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.88])
 by mx.groups.io with SMTP id smtpd.web12.5640.1596718659932493230
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 05:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aNrlkyV9;
 spf=pass (domain: windriver.com, ip: 40.107.93.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mi30uqYRtdx3Xe4R7NMzs20TZToDyh2wVQcb467/aj7xJchsK7mfVqxJ7zvMAQfjGJEIojsxQ8EpgeDEeI6JN6OatI4O5YORnHsE+e41znb3DXsj0KZsa294ZdNuP6jkqvwysOjS+TTv1EDG6y1v4+U2T6cj1n5hQ5FqubTO6dgFiOgvxq6jHs981iQYfQK58cL9CtWIVj371g5HUnOVv90KcrP3i4sQdIMQWRszJVvrK/APCmsslLzdxUJfJpcNNXz0fWUQnJ69hI4fodm6gg0tD3tP5FtcLUnO22gtzn9mpebKTNkUU7xb7tPujWgWTvmAE/fTk712vnAZ5JGuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjYyctvhwiQkFozJdf//FGUoetKeDSY3oIYVRysnjOs=;
 b=DX0j2SloyJRZvRJj7nzCmU0LePda7fvUZsteRt91rO/5ojiF54zIPO2zPmOZQ49reXh4tn6wy08N3AycRXIU/Dk0tfJbmpy2c0S8X4qI9tLAfEPyuRNIEPDV28tV/mvgn7WCkW8S96lcZigYCeN9UsAKgFSsFKiQGfO0dU5M9zTnyhDnWicwzRxbNe3OKdT55qnwquUaUenuXAHZo5PipEHBhdFCWnUF5ifYKjTrhxQnVjFhJMM+C1SGB8jSP1rAdtZoagS6Ecf8Yrt0WGQiNHTIfwL1fUc8Am2xXL2zdsuT32Omfd4vWNuNurlUjKf6jl9e0kD8B9Bpzybv2t2oOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjYyctvhwiQkFozJdf//FGUoetKeDSY3oIYVRysnjOs=;
 b=aNrlkyV9ymJfp0KOQG88v8xUZMAM1lNu448pgT3vfs3OMXkgooZSqkv0Xg9fADwYp3g6R2FpGwDxaxsVQNDzG5g8XsCpYSqcdRuBNBp0YsfEMe7d46bbtj2bezkQeMGh71tsN4E6wKWWV9UHJuMmEjlR6ZzsbUSpoxDo8mlxaYA=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 12:57:37 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.016; Thu, 6 Aug 2020
 12:57:37 +0000
Subject: Re: [oe] [meta-python][PATCH 1/1] python3-cryptography: fix two tests
To: Joe Slater <joe.slater@windriver.com>,
 openembedded-devel@lists.openembedded.org
Cc: randy.macleod@windriver.com
References: <20200731164001.16113-1-joe.slater@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1e82b9e6-6825-6a75-2669-fe524a2ce250@windriver.com>
Date: Thu, 6 Aug 2020 08:57:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731164001.16113-1-joe.slater@windriver.com>
X-ClientProxiedBy: YTXPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend Transport; Thu, 6 Aug 2020 12:57:36 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22b0e8ff-02e1-4019-8108-08d83a084b12
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB430580C195ED57D3B55FCFC59F480@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oP4Waj5izNGkxMEa3v/XPCU3pW2rS4M+CydgXcc4DIdnT+dKRiEHVsORWT2J4wVrorc87SSxtqmusvK5vbgx9385dlfiQEBIKferTgHblvoEO37LqRLk0zx2n+nwY79yW3jSVBBSSGv+DtM/wW6LyXGHZuKx9TqioVzwnOl8jyiPta8eWjDFAVjfXMBPj2zr20DXnwcSjYd8qNBWuQx6g03Q4jbzOFSkLNAvOseaZP1oBiJaffVVm/YAX2F+VJYttmfQ6IeU0nLJvjk8HELLws3s4ypK2UQ2y+NSJ4wby/H+DoSgQaI/sc9CDsrbrRkZ1GpK3xQLIGmO8qQITglhP3keIE5EnTg0n8cZn4bdHV6QvI17jO1xQdj1PJTxeehdzXnP1ortlofK9EKl72yX+A0wSUBQjQ/XFkUWRa+s97jFH3DbmafE7VgH4oZtLfWHM67yg/WxBwNgN21RD58zwQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(346002)(366004)(396003)(136003)(2616005)(44832011)(26005)(86362001)(186003)(16526019)(31686004)(956004)(5660300002)(16576012)(316002)(478600001)(966005)(52116002)(2906002)(6486002)(4326008)(166002)(8676002)(8936002)(6666004)(36756003)(66556008)(66476007)(66946007)(107886003)(31696002)(33964004)(53546011)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	uUqBHqt/2V/CXFAfXyZuQsn9om9mCm81L1/Mu4RQxa/bGypouxCnoWO61fQh6vEwSm/N6whRL7w3ZIM3S0a5uI9g0E4wNgkhQjCEK68fyHUj0oBf4UFO6CvtgK2lg7WYmoSK1I7KvKD54XSFLnds/6l1bn9Z/fiCmX2WcF1G3tXzwXsk++ShO1pOm6WExTchhdM6BgVWjv/zJAS3bIRcZh24P77aUFwNfJuu7Ctse/sDH1+3eoQC/778rQwx3rrguuYNIKaSuGbMSKIvGzMZNdDkgUPgX+hNbL+kcB2EuDhjLE1vH+AlPDbM5I5TzejD1AIQEydlELj4vGw2nZ81HZamFptXnu1tyo06LkGWZMAGeW9dc5MGJHlc57+cjdMD8QIRDEXxCNguQ+z0fJPM55DQciaPOTlud79UMz18MTvEslrsbkIhNGumYdtqlQTUwaWM+Qpn3lujPYJjAwS1tFbF6XCoZEGyzmPddDYf2KJLlvJWagUYHKXPl2wV1gClBB5GbgqPTIISgABKnkILh9jLgf3VVoo1B0iHrYn8jiTyJlaadk3oqdIhts4ieQ9Fs8MZT3JOreJ/1wQWkSIGvT3cqaEliBvBCOTTVhylCPl0ZBLzN04W7yi1sw7n/y1R9MDrVBDGMWmgVEFXfjSNjQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b0e8ff-02e1-4019-8108-08d83a084b12
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 12:57:37.0356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emXgpS0x4Ydg26MybhxY80Ol1Tf5Mpn+4wYUUnEtM9NF4rSe0gOM48IHhoUmRiESpxMNWf2TO2YWNU0UamL/2o40zPmJwP565BJpOjdImMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: multipart/alternative;
 boundary="------------5667B19E9FF6996F8FFCF631"
Content-Language: en-US

--------------5667B19E9FF6996F8FFCF631
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 12:40 PM, Joe Slater wrote:
> Tests depending on the hypothesis module should be skipped
> if the module is not available.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-cryptography/h-test.patch  | 10 ++++++++++
>   .../recipes-devtools/python/python3-cryptography_2.8.bb        |  1 +
>   2 files changed, 11 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch b/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
> new file mode 100644
> index 0000000..9f07c73
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
> @@ -0,0 +1,10 @@
> +--- a/tests/hypothesis/__init__.py
> ++++ b/tests/hypothesis/__init__.py
> +@@ -3,3 +3,7 @@
> + # for complete details.
> +
> + from __future__ import absolute_import, division, print_function
> ++
> ++import pytest
> ++hypothesis = pytest.importorskip("hypothesis")
> ++
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
> index c75dabb..95e903b 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
> @@ -11,6 +11,7 @@ SRC_URI[sha256sum] = "3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02
>   
>   SRC_URI += " \
>       file://run-ptest \
> +    file://h-test.patch \
>   "
>   
>   inherit pypi setuptools3
>
> 

--------------5667B19E9FF6996F8FFCF631
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/20 12:40 PM, Joe Slater wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200731164001.16113-1-joe.slater@windriver.com">
      <pre class="moz-quote-pre" wrap="">Tests depending on the hypothesis module should be skipped
if the module is not available.

Signed-off-by: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200731164001.16113-1-joe.slater@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-cryptography/h-test.patch  | 10 ++++++++++
 .../recipes-devtools/python/python3-cryptography_2.8.bb        |  1 +
 2 files changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography/h-test.patch

diff --git a/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch b/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
new file mode 100644
index 0000000..9f07c73
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
@@ -0,0 +1,10 @@
+--- a/tests/hypothesis/__init__.py
++++ b/tests/hypothesis/__init__.py
+@@ -3,3 +3,7 @@
+ # for complete details.
+ 
+ from __future__ import absolute_import, division, print_function
++
++import pytest
++hypothesis = pytest.importorskip(&quot;hypothesis&quot;)
++
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
index c75dabb..95e903b 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_2.8.bb
@@ -11,6 +11,7 @@ SRC_URI[sha256sum] = &quot;3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02
 
 SRC_URI += &quot; \
     <a class="moz-txt-link-freetext" href="file://run-ptest">file://run-ptest</a> \
+    <a class="moz-txt-link-freetext" href="file://h-test.patch">file://h-test.patch</a> \
 &quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5667B19E9FF6996F8FFCF631--
