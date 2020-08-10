Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.63])
 by mx.groups.io with SMTP id smtpd.web11.44473.1597065140414491594
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 06:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GbGorfUU;
 spf=pass (domain: windriver.com, ip: 40.107.92.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C94KhoXTvN+IpZSV0O2Qx3ZtwDwnGn5LI4LFHjhiNup9NvilyAW2stsT78yKlyvNf8NhtLH+E56byK1cBA9DOwxptcQE97LNYcWrkNAaNUV01/IDPxfmi4u1HtMl6WwU3ENjiZgfAr3QkBogotSGUk9pFP29Rvl+Hq92hhL6VTbcKv0ou0Rx1KejHTCIj8joX+d5lmDvoJDeKwJOxQxXMYLvfXrqoMnIXplV9Ug/vIjvlzgbyzAC4vt08diHP8g2qObEsU15WSeorVdcUI49hJrswFJ0uU8CajrQs28t2NhG3dSy9mw2gc2JsvFrKCfb5/UPdj3X3jAy8ToKM6K0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNI5LOc7KKQDc1p82tQZjcz5urmrvbRuaZ59Jl95K6s=;
 b=RKYcMGc2unQyDsRxzCDPwGw9Sil00I3uoIbhnso+N/aK3XOPxlAgLy+zg+yCDZ/01PFNraCGD7Jz19aWSMtMAR1eIdE9TjfhnhKwN2psMhxvbTORB5/DZfdpn/yYXoXGCk+YbXEkggfC2gJNh6Xi1rp6QWg08SgiNZGi9mow7FJlwQWgNBSf2L8zdBFHPVbOP7CjoONvepMprO9u+im9BQhzt/F5Fd4QT8+ltphzNiUdrYWjBR0O8ixuoTrXmIkYOV3dt/Olq50ZAsjsDvvuEzFIZhDbGsBQ1OIHL//8TInbgHNk8l1JuTEA0sEGGu/GLISr8zbW7bR7BOLRRVygwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNI5LOc7KKQDc1p82tQZjcz5urmrvbRuaZ59Jl95K6s=;
 b=GbGorfUUUTkBemiJzFAewdGbfOK/ox1FukzAvDu6h84/wdpzKZ3cxbGK/AcMR6C036q6Y+7iWJs5hyoJQsH3XEGS6uRk7o8Klj47AVSCdcJCUslKx236XlTTvC1/i/vl6Oa6wJMdRYA1ZFUrDPX03/QTrMIlr8r3KrUNV7ytuAU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 13:12:17 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 13:12:17 +0000
Subject: Re: [oe] [meta-python][ 7/9] python3-backcall: add recipe
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
 <20200808170407.2326879-7-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <559edb3c-6358-d5a8-b892-bd643eeb0a3f@windriver.com>
Date: Mon, 10 Aug 2020 09:12:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200808170407.2326879-7-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0045.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 13:12:16 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77d9c66a-4e80-4367-d09c-08d83d2f0194
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4226959837B75700CC77EF6E9F440@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:457;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iPFJwEWDCDf6robGF9YubZ6utDmRIrtswOx1Vsqa22vz37bqX4pqEXqix7FfRdyrgYMdu+CeRC/OSYunABA9cUboqAxJCa18HsH9HCmi96meac8/IYLhaAEhLrolAji975Ip6lQoRdSTiaXAxggCSDjALoy/KRNRSf1IW3x6KC04zCHCESDuCi+im5zqrBSxDKO+mIob1lnJKmo/Oher2OKF8y410ozZLCYX4XxlDNf6VcjKVlBlM51f1Q+Q+5OJ0YDraKsObTxbVkvwHzrSNz2pJ5MgQREG0AR6Pp+fI+zwIya2k+IyANW/aA62LibUmBEyHqkofQLB6AW55SUDEFkeI3CVKb2Fgxr8v59lyzzZnqi4wb48Yos31wqgM/7OQ8JOd+Bhed9ixQkjyW5ITIxDGeLFf+hFjG/YFThIue+mGugKrbxt6PEtN78TO2hDGoixH9/3TGa2bdFcv+XdJw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(396003)(366004)(376002)(39840400004)(26005)(186003)(16576012)(5660300002)(16526019)(316002)(86362001)(66476007)(966005)(8936002)(31696002)(52116002)(6486002)(33964004)(36756003)(8676002)(2906002)(53546011)(31686004)(66946007)(83380400001)(956004)(478600001)(4326008)(166002)(66556008)(2616005)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	GfjKZO8H+JYpOzMWozc+AyXYOFFjZeZlr6Fq5991QHXh+SPXp//LPde4sgpwsK9k85NGrYu2dbkeXNEPdRM/MmelvPMcUG8AChXKPs+HcvHT7qBPAz9nbqSc2dOiDNe44s5QN7VhlO89E3hxVttyOl+H4yuQobZZJq6nqKKVEW5Kc4gyD7d9VmuuFNNj3JyGflFGke2tIHiy67P1iz3CZ8/Kj3bOskusxu+mclMfV7JhfohbvSmDvaOpR3Da3V5BaGXywT5MuRxjTpkkbxVM6cQOOL1osA49NhGoIIx7CRjUXbD7ULVWNKAOxa9o59YT/u3sPQx4T+GXm+/ehEpfM5zKjEjQ4JhS+uwrLFVcqUIw1HGrS+UpKqbjl5rVl/Nyx10ltc4XMKn85foQHKdMoiZPmwkHmD09GOirDIyPy5wimPzjRyHRrdQzoJrsC15ezVICrvcPZ+aABzN7n5tX24lnoXYF5Y5DX1hHQ0maqa5unoWATtTfkEecA2wyqbApLA2SAryJlitSdfHyEoOFLCvqO+iRYAeZLVC1C53a1/bYLcWfYfWVw9dJum9hTgMGL38H4FWhca0xaQtMtb2FVlqhiDSDy5ncknV8E2IZbGVTS5+BAZfjHp8jfvLYJXFsq8jfwTgSZoQrqtiKwZVs2w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d9c66a-4e80-4367-d09c-08d83d2f0194
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 13:12:17.5360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftfHvOpM9S5ePQY6UbwO9H+QWzrNvZsYxUWEgKAr08rdeeKcptV7F/L5uj0ZnaB5Ll3O5eyyNePHHbhHxl1ylxkikddvj2JTWdoG1i7X3lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
Content-Type: multipart/alternative;
 boundary="------------B370D5F56E7526FCB2CF2149"
Content-Language: en-US

--------------B370D5F56E7526FCB2CF2149
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/8/20 1:04 PM, Khem Raj wrote:
> From: Shlomi Vaknin <shlomi.39sd@gmail.com>
>
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-backcall_0.2.0.bb                 | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
> new file mode 100644
> index 0000000000..56b1485342
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "Specifications for callback functions passed in to an API"
> +HOMEPAGE = "https://github.com/takluyver/backcall"
> +AUTHOR = "Thomas Kluyver <thomas@kluyver.me.uk>"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=40e56b724d016484a7f790ec826d3ffc"
> +
> +PYPI_PACKAGE = "backcall"
> +
> +SRC_URI[md5sum] = "1f4c9a370c78743406296f48e56e8821"
> +SRC_URI[sha256sum] = "5cbdbf27be5e7cfadb448baf0aa95508f91f2bbc6c6437cd9cd06e2a4c215e1e"
> +
> +inherit setuptools3 pypi
>
> 

--------------B370D5F56E7526FCB2CF2149
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
    <blockquote type="cite" cite="mid:20200808170407.2326879-7-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>

Signed-off-by: Shlomi Vaknin <a class="moz-txt-link-rfc2396E" href="mailto:shlomi.39sd@gmail.com">&lt;shlomi.39sd@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200808170407.2326879-7-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-backcall_0.2.0.bb                 | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
new file mode 100644
index 0000000000..56b1485342
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = &quot;Specifications for callback functions passed in to an API&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/takluyver/backcall">&quot;https://github.com/takluyver/backcall&quot;</a>
+AUTHOR = &quot;Thomas Kluyver <a class="moz-txt-link-rfc2396E" href="mailto:thomas@kluyver.me.uk">&lt;thomas@kluyver.me.uk&gt;</a>&quot;
+LICENSE = &quot;BSD-3-Clause&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=40e56b724d016484a7f790ec826d3ffc">&quot;file://LICENSE;md5=40e56b724d016484a7f790ec826d3ffc&quot;</a>
+
+PYPI_PACKAGE = &quot;backcall&quot;
+
+SRC_URI[md5sum] = &quot;1f4c9a370c78743406296f48e56e8821&quot;
+SRC_URI[sha256sum] = &quot;5cbdbf27be5e7cfadb448baf0aa95508f91f2bbc6c6437cd9cd06e2a4c215e1e&quot;
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

--------------B370D5F56E7526FCB2CF2149--
