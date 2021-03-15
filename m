Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.86])
 by mx.groups.io with SMTP id smtpd.web10.8079.1615813375910991579
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 06:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=H28KK7yq;
 spf=pass (domain: windriver.com, ip: 40.107.244.86, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrJjUjRCqG836CjybhOB01YcPWPzY0JYoSZsSoYfGIFzvP6bu7eIZ4kdNk1vkmer38ZcKqcjLCPAy112pl0s4L8G1YrF1UypDMHND2axocrV8u9cYOh0QfLo+O8Br5nERKIhoARC43hDDL3Zlv7XlTv6X1b0tVsD3soH4mfbWTFJydXLzGpNVffSIDcGe3433BKAU8TJtoqOpEaneqqE2EzRMvgahOAIAFLRzVvBVpedwQnlvhcNEfVdg1rs9lbQytZoVN0cGQTD8TeCYm8Tq3jzumOqgescDxdxBBm5XogU5/t2oXIqw9hfzYtme0jHkRpoIi0mY16ASWmDWJjbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXBWr0pf8VDD6tC28OCvuYcuvVbdqLlkpUW/n9SGpAE=;
 b=WgEld+NwKJgm5kT11e5QducubKTvJI7oXsbQZEyinXmB+leo1HU+3LHK7dpFZhtRV47g0lJLj8fqkHPsXPcEBDV1dtcv/LwhACc4b8df3iq/XBuxN8HVFOv7E8nyuxrfoOvcS7l/wgxGkLNFQwbezV/rpxkEpiL2Nei9DM6fPuZtzJeBlc9aAMWYebT8z9rCePSnS70RmYQs2bPccSSsv7Rm0eedxOA+ofNEuHLGIeYGrr6f95dj3g93JL0xp+B3tSjWvdtBIybN8pkfDXhTawXWVjF74Z0AaytEWK9/W2MFwM0IKYHMq8roWt6eRCUjbnqFOPBJTJC2IXdKMRPi7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXBWr0pf8VDD6tC28OCvuYcuvVbdqLlkpUW/n9SGpAE=;
 b=H28KK7yqvNFmZe9IvVAc8QKKED9Sm+P/67dhT7ZSbSgWFPBbMsJhfJUxYiHSwR8aoYM81ctu8rBTOv+azk3FgKalRNHIxoBfxQBzilYaKnTnw+weXa/x3dWiwT8YVdFszdzAD7/Io5QTJIc+AmPYZpD17Vo41LDw/gWMU7Oa8hU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2901.namprd11.prod.outlook.com (2603:10b6:a03:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 13:02:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 13:02:54 +0000
Subject: Re: [oe] [meta-python][PATCH v2] python3-grpcio,python3-grpcio-tools: Disable for ppc64le
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210312074700.1984018-1-raj.khem@gmail.com>
 <20210312074700.1984018-2-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1066a50e-3df0-436d-b3d7-1228f209550f@windriver.com>
Date: Mon, 15 Mar 2021 09:02:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210312074700.1984018-2-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN0PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:408:e4::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN0PR02CA0026.namprd02.prod.outlook.com (2603:10b6:408:e4::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 13:02:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1aa0baf-989c-468c-93b0-08d8e7b2a5b3
X-MS-TrafficTypeDiagnostic: BYAPR11MB2901:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29011904641F7E4B8A66A2209F6C9@BYAPR11MB2901.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KM1fKXdd7Gu3tnIx+xsLIrV2OAjBFGORpjEzhMYQw44kH/WE7Rf+NpbsDxRW0Ap3Tt0VHcMbvSqQJY5R25h1XjWC+4RtvwueRgzHkj4GObtTsLM4P6E7a3SiB1A45gtB676On78i0NRE31ADH/HDw9u9hjfIc7zDCo8OOH+iXrqYqVx5x7sYu8oHtTS5Nq/njlO6Y7W0hIaI6Dq3RdzN3KdJn95dLMAPUSoCiTnp6dHYqKZ+t7b8KkKNRziV/46/qGju3PC/FwtO5MD5YxG+ALZbrW+10sdJkJbbUAt+0WEm7b5d/u3pIJzxCQjsp8d2I0kQyYZdCzUPChKTJkh5AdR6S9n/CWfjiZRVZBI9IcVlyGu6+dXMhZpVx+gJ0u/IBJXbvD0JUNghutLi/+WtTMysjQ8Qmb7Ap8f8/Dh3JjrivO8cx8HO8ticujOOBmB7EtreV9OkfHd+SOdTOL1pdKRTEaiJoctLLRo2fdKVMCg2M7VavXgsCkzNE+eF3EHlyfPWsdzApGSewXPj1b3R+LeEP1CnQhxtO6VUZQTGRxE3g3Wl+Xke5TPUxxAVJrjnd8LxWsd2UGgxe27baenwMy/oK28gFSIttWZpew/wNve2MjyzmZVduH1TOWr8CypNR71p48FQAMiz1fdJZcxeoG/cffrQ0EUdw586S3d5+ZcC7fjFJqBRXFAKV7CWr31D7USDrjyIgxdopG0KdJdEzxOUPTWM5AjQTTuCxXQRgzc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(136003)(366004)(396003)(26005)(36756003)(2616005)(8676002)(166002)(956004)(16576012)(186003)(966005)(31686004)(16526019)(478600001)(86362001)(83380400001)(66476007)(8936002)(66556008)(53546011)(5660300002)(33964004)(6486002)(2906002)(31696002)(44832011)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?U3RjeFUrZkVLaGN6c0ljcTIzUk00OW53Qjd5S2xoQ1Z1REU0YS9RRGIwb2hU?=
 =?utf-8?B?Nko0NVhic29WMEhCNUFmZ3hqYnJ6WFhoMDIxSEljQkxuanRKOG9KcEc0eWp6?=
 =?utf-8?B?cTRvenZ4TVRpZ3ZjOEhKQml3eDhadTJHT3I2Z0pZRnZCa2l1ZnNhNE9yNFBN?=
 =?utf-8?B?NEpKRUJJZnFTWitOQ1dGZ3N4MVhzZ1FVeGc5Mi9RcnRWMHl1ZDdUSytUSHlR?=
 =?utf-8?B?ay8wVll5UjdaUy80VW1nanVQenZxTzV4NkNuWks5SGF1cTF0clR2RUpyZFRY?=
 =?utf-8?B?aU5CeG9FMTJWTUtRQitIaTBJNkRDN25sNTVuUGVhYXYwVTd1VFRwdnZObk8x?=
 =?utf-8?B?b0g4Y1l0WU1wdm5HeXozSmllZGlXUWI0T0svUzVxVFFaNmZBdXVWL0xqenll?=
 =?utf-8?B?eS9FdnFFWnFERjRMa1kxWi9qRFRXVUhlZUpRSHVNZTF2YjZhaVFYRVo1TVN4?=
 =?utf-8?B?bWtEaDJJN3BmL3prQWZWK3VKVmthNlp3aUNSVDNiMU4xWUVvQVBNN0lkeDkr?=
 =?utf-8?B?RUQrYmNBVFdpc28rN3ZhQTFzdW5MWEJXSWNRakx4dEY2Qjc1dUYxMitrVUlD?=
 =?utf-8?B?eWFIVkJxKzBBVWFjY0gyQ24rMHhUSFlsUXdvbnUvMFFVQTFhRjBmQUp0TlVv?=
 =?utf-8?B?V0syN0hkUzM4UlZyZ0F6RGF0Z0dXclZ2c1Uyc2dUb3J6SEVVdmNHOUJMV05h?=
 =?utf-8?B?Y1hGSGI5RVZtSXBjay9PSHU3ZkZOT0puVkhyNkFVbDFsZUhRY0hLQ1NXZlJO?=
 =?utf-8?B?TEhORHY2ZmlUTFo1WG9QNkF0cUhFTldiY1VpR0MvTjdKc3JwTS96amJsa1I5?=
 =?utf-8?B?SHhPUnc2WnlMOXYrbnFVbWxmbGZ0bHhLTmZZOXdocktPMEZ2bWFHU0FjQWdO?=
 =?utf-8?B?R2oydmpvUTVwMGtTaXlGeWdxL0p5RnFpaWpGdG1OVVlncjVlOUl5Y2NOdTlX?=
 =?utf-8?B?N0htZ3FQTi9yS284MjY3KzYxWkRwNDB5czd0dlJyckFjK3FURWxrRHJxYjFO?=
 =?utf-8?B?dEhVR3FFYmU3b3JWQmFZWmc1ckFNcTdKNVZiRm8xQmZNcS90K3AraFplYlYx?=
 =?utf-8?B?bENvS2RaN1NkcmNNc1RyWENtOGhieVBJSkRvaWlLaWdwQXlnRHNrd2JidGdz?=
 =?utf-8?B?aWg0OWxaUkw4NGhBci9CaENKTXE4a1dJY3dQbVdWejN3ZXRSbEhZREw1eTFu?=
 =?utf-8?B?S1VEMDN0SEZyUnl1ZkpQWUsrR2ZPUGR3OVlTUWdLYmhrWWdUYTArYWh1L1B2?=
 =?utf-8?B?SGJER0pqT0JXK1hXcW1nTFdNMThRdWUrQTROOWtvZE1zT3ZxcmxkQ1pJK2FK?=
 =?utf-8?B?bzEyTVRFdVFpYTU4RUVXSUNaOXlJZkVoVnl3ZmtzaUN2LzNwazRTZ1FDU3d2?=
 =?utf-8?B?SVZNeW9sWldMd0dIbWYxbXA0cE1MVXhUdlFJV1Q5QW9WTHBCa3BQRmk3UzRn?=
 =?utf-8?B?blNqdHVhSkJrYitGTTJQVFhJSFlac3JwWEVTMlkxN3VCQmx4dVpicW56SStk?=
 =?utf-8?B?Ty9nS0tScXpuOGdDaWhZa3EyWE5iNjhkcHR6ZkE1YldvajAwZ3p2MndoZW5r?=
 =?utf-8?B?UVhaR05JSGtMeFJhUDIxaVhTbFZ0a2x5SGV2V0FWa0c4SHE0eHBoRzJVaHEz?=
 =?utf-8?B?cS94eWd6R0ZyUStRbHArckdmS1ZSd085WkF5Vm1rMGQ3VnJkRDRsL1RKN1Ey?=
 =?utf-8?B?bzNWcUVOMTl4NERMdzM0MlgwQkF5Umh4R0VvTWIrZkRTNWVGZnJ3RGsvMkk3?=
 =?utf-8?Q?4WQpwMxnomyzgQTNii0OXw/Iuvo3hcC2dqIzuWt?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1aa0baf-989c-468c-93b0-08d8e7b2a5b3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 13:02:54.5588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtud9SQkqJwiDOhDJUcRqn3bipXwuI+PQt9/GonxIpSu3i1NEana4X8P7nzk9j4y3YoNsQY4eWbUwD6gLRmMtlUkbZ2iw0OLPoBu0XjpLO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2901
Content-Type: multipart/alternative;
 boundary="------------589F339300F788915BB291F6"
Content-Language: en-US

--------------589F339300F788915BB291F6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-12 2:47 a.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> abseil-cpp does not have support for ppc64le yet
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-core/packagegroups/packagegroup-meta-python.bb    | 1 +
>   .../recipes-devtools/python/python3-grpcio-tools_1.35.0.bb    | 4 ++++
>   meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb  | 4 ++++
>   3 files changed, 9 insertions(+)
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 4512f839f4..df4fcc8826 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -449,6 +449,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-zopeinterface \
>       telepathy-python3 \
>   "
> +RDEPENDS_packagegroup-meta-python3_remove_powerpc64le = "python3-grpcio python3-grpcio-tools"
>
>   RDEPENDS_packagegroup-meta-python3-ptest = "\
>       python3-cryptography-ptest \
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
> index 12b00cfa3f..475b4e6063 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
> @@ -16,3 +16,7 @@ SRC_URI[sha256sum] = "9e2a41cba9c5a20ae299d0fdd377fe231434fa04cbfbfb3807293c6ec1
>   RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
>
>   BBCLASSEXTEND = "native nativesdk"
> +
> +# Needs python3-grpcio which does not build for ppc64le
> +COMPATIBLE_HOST_powerpc64le = "null"
> +
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
> index 3d875bf4ba..fa030b99e2 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
> @@ -43,3 +43,7 @@ CLEANBROKEN = "1"
>   BBCLASSEXTEND = "native nativesdk"
>
>   CCACHE_DISABLE = "1"
> +
> +# abseil-cpp/absl/base/internal/unscaledcycleclock.cc:100:2: error: #error Must implement UnscaledCycleClock::Frequency()
> +COMPATIBLE_HOST_powerpc64le = "null"
> +
> --
> 2.30.2
>
>
> 
>

--------------589F339300F788915BB291F6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-12 2:47 a.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210312074700.1984018-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

abseil-cpp does not have support for ppc64le yet

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210312074700.1984018-2-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb    | 1 +
 .../recipes-devtools/python/python3-grpcio-tools_1.35.0.bb    | 4 ++++
 meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb  | 4 ++++
 3 files changed, 9 insertions(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 4512f839f4..df4fcc8826 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -449,6 +449,7 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
     python3-zopeinterface \
     telepathy-python3 \
 &quot;
+RDEPENDS_packagegroup-meta-python3_remove_powerpc64le = &quot;python3-grpcio python3-grpcio-tools&quot;

 RDEPENDS_packagegroup-meta-python3-ptest = &quot;\
     python3-cryptography-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
index 12b00cfa3f..475b4e6063 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
@@ -16,3 +16,7 @@ SRC_URI[sha256sum] = &quot;9e2a41cba9c5a20ae299d0fdd377fe231434fa04cbfbfb3807293c6ec1
 RDEPENDS_${PN} = &quot;${PYTHON_PN}-grpcio&quot;

 BBCLASSEXTEND = &quot;native nativesdk&quot;
+
+# Needs python3-grpcio which does not build for ppc64le
+COMPATIBLE_HOST_powerpc64le = &quot;null&quot;
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
index 3d875bf4ba..fa030b99e2 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
@@ -43,3 +43,7 @@ CLEANBROKEN = &quot;1&quot;
 BBCLASSEXTEND = &quot;native nativesdk&quot;

 CCACHE_DISABLE = &quot;1&quot;
+
+# abseil-cpp/absl/base/internal/unscaledcycleclock.cc:100:2: error: #error Must implement UnscaledCycleClock::Frequency()
+COMPATIBLE_HOST_powerpc64le = &quot;null&quot;
+
--
2.30.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------589F339300F788915BB291F6--
