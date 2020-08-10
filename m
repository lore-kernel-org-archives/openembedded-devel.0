Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.67])
 by mx.groups.io with SMTP id smtpd.web11.44452.1597065105533339823
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 06:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KnvTodmB;
 spf=pass (domain: windriver.com, ip: 40.107.92.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hg+yYPkf073x0zZD9aWnXkoELGtvxS3N5OfyPmCHC7xxlrl79ShPTKERTnso6QhM5MPtK66KoqZBZeu4L4z+hVQlCTYR8Xe9NAcFT2I/lbmxOdYPoZKOIUI2SMMYEZTGLQJOrnMO0hR9jYAgVEboRpT68s7aNleCrH3XMhbzagnxkbiF2vtbCFa1zuqdbePqGmJJsz5h51//5vcG7/AnCaxQlteOZuvpkh56ShB5Idfd++F4evhYcpFul5899uZXN7oGJmUkbmwmMX8a3ik2QGaYrxOtsl3h7YuftgyWZ4cbyquEU5yprFKurPtreyjNLFD8I/g120phYVN5QtDWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7XEAo3U7NcX3bX5ulYmxH8rIp+feJ6yKJ/gU+0rHVU=;
 b=Y9RiypaiW0Hdu5So49bcSPO20CElhZw76PcUwg5zF34+BNa5fMayIQPZxsMrzOLG6Bkh164dMazmRJcOYVTXebBteGeTRyCpf/1GZdHuBP9HT8eV40Xc2wKy7SzHBr/xnNkRfEXyMOkooSUnA03kwV7zS2fPn9L/FvdQgWsVAOJO4UoB/QAv/r/29v38boOwGpjZv/1Jo5NHx+QhmSdckKp4lWjgSAPmHkZXODwCCCzClPngHiDmFANPgYjz5+RXedNeMJACu+17Yuqo+iM0fodsJzY1NIRRG7SQK9GJjj3iwxQretCeFrKrbSYQEnavK3s8o7EUrITplNqCHfKmaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7XEAo3U7NcX3bX5ulYmxH8rIp+feJ6yKJ/gU+0rHVU=;
 b=KnvTodmBtlSwzlVeH+ffL2SO9Hf6Ug3HqyqRFYXN0LIrD5HWIVgtRDfAGhm79lZTNxtrNyXP9Er4SjfoBHythEpwCQt+kYddZ4kqSf1dpqG0JrL/DOH0a2ROkM2PvOXb3ExYAH8XjXpp1VGXdPkCxJv8PEgHBFjADb6jxTUNQUQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2728.namprd11.prod.outlook.com (2603:10b6:a02:ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 13:11:43 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 13:11:43 +0000
Subject: Re: [oe] [meta-python][ 4/9] python3-ipython-genutils: add recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
 <20200808170407.2326879-4-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0c523cad-e165-9f82-0871-39e3317f553f@windriver.com>
Date: Mon, 10 Aug 2020 09:11:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200808170407.2326879-4-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::10) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0041.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 13:11:42 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abf1cce7-21db-43c1-12bd-08d83d2eed51
X-MS-TrafficTypeDiagnostic: BYAPR11MB2728:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB27281997293B4A34E4A2BFED9F440@BYAPR11MB2728.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	21tirGnLry8TlAWPvyyYbkWgZn9OTlKhDGkaWXy/gEA57CT/77dtZt4VQTdptXnFRper1g/uFV1Sj8FntmWYHxDU/qXo5F8ngD1lHyJTb76nFdOJQokLGdrVyzvIqunIbAfT7F2rruAIrUbOg0zC7FBvVTFYSgSEtHHSPMAJPp2v7mwioLN2/TYSC5DwsBicC0tnZdwRPBdM5OT4fqzzbDEWtfAad7tUyVcTYr8ace2GTbn5XWaWUH1O/UWf0cM/ci+26hY9G1UmnNTyWQ2k+8KqWE6Uz+6+H4vw91YXiluTqIX084i6SM50/OfbDUYKsv+kZkLPaFXrM2EE8K4IKrH7MAbcz2cvsABWsCKOsoB31KiCD9yZ2xtQuX0uZRb35oEa/IlkK5BlyjuLyYElsjb5IbefqY5SNqC6jEuPjskxV6tFf2yId42kF/Zr2ITTqMGqTwT1rTd638242/sYvg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39840400004)(366004)(346002)(376002)(396003)(136003)(36756003)(956004)(8936002)(16576012)(8676002)(33964004)(478600001)(83380400001)(2616005)(316002)(6486002)(31686004)(66476007)(66556008)(66946007)(4326008)(52116002)(166002)(31696002)(16526019)(186003)(44832011)(2906002)(53546011)(26005)(5660300002)(966005)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	I5NpFid2L+4LJx1u4wG8GzMBA2agCJNF2fNgMW9tyHQlBPOykHRjehoLqteJHb+QvA3TkLwhWaF0saGhE39mDs7Cwa9/y54j8nwxRCj2uU6B478T6vNt2MW0GXa0U9AuRtcSA0N4dscwqwLmzuDOKp3e9zNFq23Cdazrh7NXfnpzVHnRz07pt/A7pDIn7ZbOZ9HQV80HfMTnUWUcMRBYLFMBL00HlbqqGaJAmKJI2KyMXsBiubG1K4Lx9s8b7oIMNYhySBtGhD0iTlW0i2DieXtQHq4GfK/08ZU1jZ5HhZWWIq2yY6BnH5azft5WXLMmBxAVdLRrVwQE9Uhb0X58uYNAg5YN7S1xpwL2vH8otksrSDq5gpUIa09CO9I5DKvndHJXCjTf+OQjU4U6HT1TvspeVTAhcUJIZ39uLlURTmMwvuW82qBwGaTZadJmsD5lZAuUqSVw4/qsYYANQddRPz7WkXRUTolkdic0ZGV6ARVeX1NxXuzux0N+hroio+9pDATsPk71B1n6tE2vjDhHPG8TKcZEmrFsZH0q3IPWcl9rATd8paWFyhmJ+CgdkoU9uxLdmIg1cORVnSuEiEvD+BLi+EqrOcu3G98c7JhkE+m5vYf+3iY+xPfQfLAtyA/K2FeMwNJvm2aIuTbP6rjXdA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf1cce7-21db-43c1-12bd-08d83d2eed51
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 13:11:43.5136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRXViD1lKuSo947dsO+NU5ZixCjnp+04crAQhgbaKoKdKYFGZoKhr5960acPM60sJFXSYk4w8SspFEhRpVXGjZCcNgvjYvCo+iioizVN0iY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2728
Content-Type: multipart/alternative;
 boundary="------------AE4A59BBAC52C9A277B7B51A"
Content-Language: en-US

--------------AE4A59BBAC52C9A277B7B51A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/8/20 1:04 PM, Khem Raj wrote:
> From: Shlomi Vaknin <shlomi.39sd@gmail.com>
>
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-ipython-genutils_0.2.0.bb         | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
> new file mode 100644
> index 0000000000..587aea1f05
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "Vestigial utilities from IPython"
> +HOMEPAGE = "http://ipython.org"
> +AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING.md;md5=f7c3032c3ac398265224533a0a333a35"
> +
> +PYPI_PACKAGE = "ipython_genutils"
> +
> +SRC_URI[md5sum] = "5a4f9781f78466da0ea1a648f3e1f79f"
> +SRC_URI[sha256sum] = "eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8"
> +
> +inherit setuptools3 pypi
>
> 

--------------AE4A59BBAC52C9A277B7B51A
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
    <blockquote type="cite" cite="mid:20200808170407.2326879-4-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>

Signed-off-by: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200808170407.2326879-4-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-ipython-genutils_0.2.0.bb         | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
new file mode 100644
index 0000000000..587aea1f05
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = &quot;Vestigial utilities from IPython&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://ipython.org">&quot;http://ipython.org&quot;</a>
+AUTHOR = &quot;IPython Development Team <a class="moz-txt-link-rfc2396E" href="mailto:ipython-dev@scipy.org">&lt;ipython-dev@scipy.org&gt;</a>&quot;
+LICENSE = &quot;BSD&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.md;md5=f7c3032c3ac398265224533a0a333a35">&quot;file://COPYING.md;md5=f7c3032c3ac398265224533a0a333a35&quot;</a>
+
+PYPI_PACKAGE = &quot;ipython_genutils&quot;
+
+SRC_URI[md5sum] = &quot;5a4f9781f78466da0ea1a648f3e1f79f&quot;
+SRC_URI[sha256sum] = &quot;eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8&quot;
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

--------------AE4A59BBAC52C9A277B7B51A--
