Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.55])
 by mx.groups.io with SMTP id smtpd.web12.5599.1599332459370901398
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 12:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lS/zFS5q;
 spf=pass (domain: windriver.com, ip: 40.107.243.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwY/iwVYKTF5h+cp9+CrLe4oedZtBFggDBV4t47b8XNjlyhHBfMk19le5D6ZFnDKr6Jy5zquV8YOJvXoTtFggQ+3wsFq0EvGCj2uhIan9PnY3JGY5KZ1XPFLODJKUm5Wxmggiwl7AX+RpMb90xrQnV3gIKKNpF+Ziqh/fqnYAERbvyb2uB7TRQFC+hja7CPE0s/7URnS5TiSAjQgoUvREC+vI9QtoogDJZBKDwNax9IgbCC9APw6irsJuCdBrxpwdwGl0WpfSAQ+2mByia7fj7ezn5GFekHmTjD6AxNWed8Q9VFZ8HbFwfiquX2B+AimRhOWBODZY5D0xBAksZxjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjDBVbajjiaRIcDdEqbKenm93RZ97pGQnE2xD9N14R8=;
 b=GEeW29bFh1Az1rsyFlc7dzyLN7+0ZsqxnkkK2yvSl5tuRRW2qMS8NCnlhfn1RfzV+dgCSqbwJdaSSGVe5UsCdDLghORhG/xycrOhBif6qkeUX2pl6Xr10Bg5uM+Dd1mm68uRSjUsFUjjmbBO3nbvm1k2lgOk2MpYdyLDfgo9TYZxXov2KJJEpQswArLVKDIl2wWYKD0OaC7M2moZmKdWxaY9tUeuFyKVPJ9uFjGUiP0kQM7j3bC0ZXb9d7GlIne7EwZzW64Ie5gqpTZiCVFnWHwXEK403wRA+byGmgojtepL31kZSjwsMiMeNtgz7EJgJCTQLJ1nurMhpgU4S6qyvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjDBVbajjiaRIcDdEqbKenm93RZ97pGQnE2xD9N14R8=;
 b=lS/zFS5qTa58n+vmfZtRwPVtkgcR8L6Z39fBx+q088N0ne8WhlH3wLKdKfPv71P4SE4w5J4gfJWd4cXI1Wb89pfm1F+whv7mKI+PCKnyGw8Ri5lB+Hgyu+vWhq00IuQGULZkF0bWlmdRY+MK4wVswE5jqNGG5gKvBcqYkVxQggU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2837.namprd11.prod.outlook.com (2603:10b6:a02:c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Sat, 5 Sep
 2020 19:00:56 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Sat, 5 Sep 2020
 19:00:56 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-meh: Upgrade 0.48 -> 0.49
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200902083342.22101-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2bc11f86-2ece-a05b-835b-e81ce7346ebf@windriver.com>
Date: Sat, 5 Sep 2020 15:00:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200902083342.22101-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::33) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 19:00:55 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 361810d6-71f1-46b6-4dc4-08d851ce04cc
X-MS-TrafficTypeDiagnostic: BYAPR11MB2837:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2837275321DE3A37159D773E9F2A0@BYAPR11MB2837.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gYuZVKj+o2F7YY+qh0bzO0y40On8MRYk3wDyli790y+iWIYLFQZuUHKFXyCYLayYFHols833FIj08nCWbrHWgXcMVg4ZjdbAd+/U3ja8zVKGnuqOh/1w16yfUMBattFAHuHNUUcPOQpo2PXhzvws0NEbVnGqC5zmPNZD6WCtlmwx5lTWhP/CN8topPwkrVhw4igycWDpniBpOowsNTY5NPQHMQ/OVLKYDVQQ/NkDuNOpRrAll0jrW+3UlBEvYC7pti7enlFWpZxJfNADZxg2ciobcMeh4Yj0H1a2PpH4Gi25cYFv01b47NCauSjAjOrMckLbsPw4WanCLSEJ6sDd+0/Am4EJJAFiQF/UbK73h6IKKbodC92ek0zfGiBO6ke/u0EEuXJDz6fUL8MOYpVwldxnLn7jvdgVVdyKvE476wodN/Y1nH9Sl+5Z8uTM3BsZMLjBNdNs0aBYSwtRsfshHQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39840400004)(396003)(366004)(52116002)(186003)(53546011)(5660300002)(66476007)(6486002)(16576012)(16526019)(66946007)(966005)(31686004)(33964004)(478600001)(83380400001)(66556008)(166002)(36756003)(2616005)(31696002)(8676002)(44832011)(2906002)(6666004)(26005)(956004)(86362001)(8936002)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Hw5QCij/Fq4+bgljDhNFOLiR5SSQJ5GDyIvWDOa6cKqba78QSMgSsZy66VXaMXsk8Qt484Amf8Uk1QahANuwBc7ictt2lT82SxYlsi3mSvlcsa6oYZTTsOZ4zIhIPAuwXNR8lttXxoWRG8PmZi03rfz/VwjMmu+NBZ1A+N1xizeN2FdQp+KzHFZq30e6tGuAnqnuyuCffh8qTsfTu2oUQQvvXqstzx+OpPfqTulq4YOjgCIpiBoutKzwaMJ5VlyI+I20d4lMYoH9hw+SUyQEFGjS093NnUbzUxmouUzZpDMdtif66bdIeTsDj3uB2mCpGvuQ5uTLaKNRAqzdvZ6+9mPCHQMVNlrgOf8bUyD47FJhbNSgmqn6jByyjb+vdhSgBVZ4xkGvf9myFxGihaf6+RUglBChFhn7YtOkAUj8hBrG7lldaCdUoeKtD7jkVB/w43NxzD8T7LJJSxPcSKRfbS9VMaVlS+jlpRgAVthsQIo67MvI8J+HSQRcVNLfeBkwrv08FTzuECAV6Sh6DCZRtCYDIFEVEpjuf+jb2qQlRMnmN59l6LdrFvp3M+ssfJMme6uTWaqfJEQSYxuMvcloD+mJQCYne7VIpuuptnVF9s+UeyY0dt7Z8o3DLNruny9xT1u4rFnvXIMPilPi1suYpw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361810d6-71f1-46b6-4dc4-08d851ce04cc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 19:00:56.0974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7MK6JxkAYIhSRnmOmoAmNiJf8mZnyoEPjmB88PqQVO7gCxpgC+vxXBcXvq0BHiUnofGEo9dvIU+S5/tUoBaO41zl6Do+SL6kszsZ64/bwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2837
Content-Type: multipart/alternative;
 boundary="------------2F636B31C1AB4746D3FCBCF4"
Content-Language: en-US

--------------2F636B31C1AB4746D3FCBCF4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/20 4:33 AM, Leon Anavi wrote:
> Upgrade to release 0.49:
>
> - Fix make archive command after pot file removal
> - Add Readme with description and translation badge
> - Add pot file to the git ignore
> - Pause release when making bumpver to check and solve
>    translations
> - Remove unused PREFIX from Makefile
> - Remove Zanata
> - Push translations to our translation repository
> - Download translations from Weblate
> - Remove pot file
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python-meh/{python3-meh_0.48.bb => python3-meh_0.49.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-extended/python-meh/{python3-meh_0.48.bb => python3-meh_0.49.bb} (90%)
>
> diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.48.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.49.bb
> similarity index 90%
> rename from meta-python/recipes-extended/python-meh/python3-meh_0.48.bb
> rename to meta-python/recipes-extended/python-meh/python3-meh_0.49.bb
> index 9ca7a56bd..7fba21f7d 100644
> --- a/meta-python/recipes-extended/python-meh/python3-meh_0.48.bb
> +++ b/meta-python/recipes-extended/python-meh/python3-meh_0.49.bb
> @@ -3,6 +3,7 @@ DESCRIPTION = "The python-meh package is a python library for handling, saving,
>   exceptions."
>   HOMEPAGE = "http://git.fedorahosted.org/git/?p=python-meh.git"
>   LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   
>   inherit setuptools3
>   
> @@ -10,8 +11,7 @@ S = "${WORKDIR}/git"
>   
>   SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master \
>   "
> -SRCREV = "760f78a634ecf0e2380abcbd751bc233d29300ef"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +SRCREV = "50c09e5c4c76757099d686c316b4bf42f72db71b"
>   
>   FILES_${PN} += "${datadir}/*"
>   
>
> 

--------------2F636B31C1AB4746D3FCBCF4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/2/20 4:33 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200902083342.22101-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.49:

- Fix make archive command after pot file removal
- Add Readme with description and translation badge
- Add pot file to the git ignore
- Pause release when making bumpver to check and solve
  translations
- Remove unused PREFIX from Makefile
- Remove Zanata
- Push translations to our translation repository
- Download translations from Weblate
- Remove pot file

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200902083342.22101-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python-meh/{python3-meh_0.48.bb =&gt; python3-meh_0.49.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/python-meh/{python3-meh_0.48.bb =&gt; python3-meh_0.49.bb} (90%)

diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.48.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.49.bb
similarity index 90%
rename from meta-python/recipes-extended/python-meh/python3-meh_0.48.bb
rename to meta-python/recipes-extended/python-meh/python3-meh_0.49.bb
index 9ca7a56bd..7fba21f7d 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.48.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.49.bb
@@ -3,6 +3,7 @@ DESCRIPTION = &quot;The python-meh package is a python library for handling, saving,
 exceptions.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://git.fedorahosted.org/git/?p=python-meh.git">&quot;http://git.fedorahosted.org/git/?p=python-meh.git&quot;</a>
 LICENSE = &quot;GPLv2+&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263">&quot;file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263&quot;</a>
 
 inherit setuptools3
 
@@ -10,8 +11,7 @@ S = &quot;${WORKDIR}/git&quot;
 
 SRC_URI = &quot;git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master \
 &quot;
-SRCREV = &quot;760f78a634ecf0e2380abcbd751bc233d29300ef&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263">&quot;file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263&quot;</a>
+SRCREV = &quot;50c09e5c4c76757099d686c316b4bf42f72db71b&quot;
 
 FILES_${PN} += &quot;${datadir}/*&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2F636B31C1AB4746D3FCBCF4--
