Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.46])
 by mx.groups.io with SMTP id smtpd.web10.6849.1596491731920820161
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MYmjLrh9;
 spf=pass (domain: windriver.com, ip: 40.107.70.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDLQLxioDAl/LcokWz6CqnFalRRnlbr3hYE9Ta17f0S+GP+qD3bTxJXmZjQq7tMKtT5dA8kXrk/O7QMwMFGFYLrpRdUOUr8czV9JTmQ4eY5EaQyYV8tSpaib86+te4SeVl48AMVrYw28qNfqnnHOLaoLoQ//zDSO77CrFjz4dQwezcPqi9zUUqVqgbsuMzKJljMAb5Z/F9Zh121Bdp+NwxDHQR4Isl3uK0WVPkY8katOJZKRB6Qi7AFO3CxHRjLhIp8SjL8PAQj8z/zo1OwkrMu6P3/7OctemDl+p1bqEJGv/nHIo6pkzFE9XRy2ADY/OAAwmwaM5q0AhikgBYgo6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxHjYVwHbXdZWpRsGduO37W5L15EBlap1fLFC+f4ib8=;
 b=WcJCdHQiqbXQgrpnZCzhfsWeL27kRUeaDzi5250a2YdCbx5L9G6rZCiAOytkLGwoq7wXJZcMMI89rHYGAlQhusELvVDH3O6j/iEPAIb38dlE3d50YCm67F3B78qnw4QmtVXDpdAXwYQ+1k7uzdjSf6jYCrtVsj9OmFN+xhH1rAtLbGgCk4c8ruxYpM2+FbnDstdTJIhmDJK8LOJ2OGPR4PRT283sIeVchrV+peZ/14aI4MUojD61SU3dnslENie+9I4covNNq7vL5UYno2w2JnixMKhqRqEom0ofXz9woD2kmO87iyvffmyPYWqaRqjw8RQcHXdDI3D2FByyJR8tOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxHjYVwHbXdZWpRsGduO37W5L15EBlap1fLFC+f4ib8=;
 b=MYmjLrh9KFl71vrIApEIWkbM0NxDv2FvHmqrv7CAuDq24jNcRtL7IKNtus9H9E9Gbu47J1WfI30/jc0BVtbcH/SuEYU7Tw1MGLpDN/3CPXDpXzKvhxsqjawCsbK5szFfhrlYSlICQlXhtDJ9ctle5kZuyZtnWmD/0cgWd471e24=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3352.namprd11.prod.outlook.com (2603:10b6:a03:1d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Mon, 3 Aug
 2020 21:55:30 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:55:30 +0000
Subject: Re: [oe] [meta-python][PATCH 11/15] python3-xlsxwriter: Upgrade 1.2.9 -> 1.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
 <20200731132230.20031-11-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9d5e1a67-247f-67d1-af5c-773b91dcbd39@windriver.com>
Date: Mon, 3 Aug 2020 17:55:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731132230.20031-11-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0150.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Mon, 3 Aug 2020 21:55:29 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c587a2c-1a3f-43fb-5ef7-08d837f7f01f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3352:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3352E2DEE1BFFD652B64A14C9F4D0@BYAPR11MB3352.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PZq36h/l+X8e0pwnNVdYxCcF3UFgsxM1OEaZBTwWzJg9dXMjF/4pme7/ZEpZMN8n/oeMKHMZsEPIEE0c+jWTIIAUnSWbh8kYsnxjcPS55lXv81b3zUx249XoNVRG7Ry6BAMf82PzLZBWHwj02qnf1qOxX/fzKiZuh1PIevvnzatcFA+SOPdR4wV4oGdza9Wdwh+gcd8TL4ILd6aRkK5G/z6tm3Xzf8arb7ccLLQnbJFnTNzCmwPnGr63NCl7Ws6GTuGCuPDZdEBbaOOJ4eVnfzbNkfRXnvemx/qBbgbXWJb23BMI78bWR4piwF6F1Vu7BXA6yeTBv1j+Kugoy2OWRO9wrigTR559iIxEckYhIqAAwgqFVcaXk+wTAe4YNSi+4BYo3Wd+2mS5hx6I0/2+zMqL+kKpuUe6xeUyi6CdW6RmAWfsmETglamDOBwI5PoqhDEzPGwn9PErsILiawm9dA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39850400004)(346002)(376002)(396003)(366004)(478600001)(166002)(33964004)(66556008)(66476007)(52116002)(31686004)(66946007)(316002)(16576012)(966005)(44832011)(2906002)(53546011)(36756003)(8936002)(86362001)(5660300002)(8676002)(31696002)(2616005)(83380400001)(16526019)(186003)(26005)(956004)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	sk8clzTWP+JFVfqc5PXHy8ANc7Zknpr/GeiPhScSboMvGdBIF22ulpcn+UTAOkuJoKu/GO4VSPGsJ7RQKPn5PoxK5qODs+0ty1CtcaHewGu50Vp3Uys/J7TgrQMCh7HYNZ8ppBO2RiFNFQSHzvpYhBvC0jLsUKiiAtf31/Kw2bxqEphh7W02AYU+UIjR2bz0kE5Q2bKtzpYDJSCaT9BqZLcV2ooIjjQN1Y/PdR+tO6IxRrJGJL3QhuDw0aAO6TNwvAbAGR23wdKmD7xCdfsNp19r9GwWbM0+zxBTuvrvYB8yNAkNXVt01LI58kTv2Ly3XDNk9qQBfduw45te2uagP9cRI2cCJjIdqZyeOeqRJCc4amgOkRGRcR8aXfec9th2y1CI+KOpXwtGEcrlH2l97h9yPHXT5l/edH/cL4XGBtzt90xu3gfK8oyWptPRK46w+/EtFGMkYWH2Qyb5iNYVgHU4l70u7J9XlmcR36Wy6NRCljjigujx3rZQYTQC+Gio6KtcP9bI86eSAEfZygVQ+Jg6fJH1VzVxsMMHQTYpYfLSoqQN4pIJTQ1fCtEwtMglk+LumlHk3kgaD3iFAQ2GbG0eliOyqUCCv4Hxm6fDR97Yj8CND/IT5BEPj7A9TOIQMvtYxK08zOZkYFzjIuBqYQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c587a2c-1a3f-43fb-5ef7-08d837f7f01f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:55:30.0361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /O40Le2XpmnOXgNUwBElYpyZzebdUCpV20+Mf8aa2S8b5IJyNcA4uTkx0y1xowa8vOx9vvLeRxl29kmqhUlSjI80VZIAMxFFBlHlyytJrdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3352
Content-Type: multipart/alternative;
 boundary="------------5E75525056C65E9875191D6A"
Content-Language: en-US

--------------5E75525056C65E9875191D6A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 9:22 AM, Leon Anavi wrote:
> Upgrade to release 1.3.0:
>
> - Added support for custom chart :ref:`custom data labels
>    <chart_series_option_custom_data_labels>`.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-xlsxwriter_1.2.9.bb => python3-xlsxwriter_1.3.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.2.9.bb => python3-xlsxwriter_1.3.0.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
> rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb
> index 114f48214..3b4e89d04 100644
> --- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
> +++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb
> @@ -8,7 +8,7 @@ inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "XlsxWriter"
>   
> -SRC_URI[md5sum] = "20f8b7df7f1705fa2f7ac3f84789d2ca"
> -SRC_URI[sha256sum] = "828b3285fc95105f5b1946a6a015b31cf388bd5378fdc6604e4d1b7839df2e77"
> +SRC_URI[md5sum] = "80ac0ccf43435739c4afa5e0bfff8580"
> +SRC_URI[sha256sum] = "3015f707cf237d277cf1b2d7805f409f0387e32bc52f3c76db9f85098980e828"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 

--------------5E75525056C65E9875191D6A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/20 9:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200731132230.20031-11-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.0:

- Added support for custom chart :ref:`custom data labels
  &lt;chart_series_option_custom_data_labels&gt;`.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731132230.20031-11-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-xlsxwriter_1.2.9.bb =&gt; python3-xlsxwriter_1.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.2.9.bb =&gt; python3-xlsxwriter_1.3.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb
index 114f48214..3b4e89d04 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;XlsxWriter&quot;
 
-SRC_URI[md5sum] = &quot;20f8b7df7f1705fa2f7ac3f84789d2ca&quot;
-SRC_URI[sha256sum] = &quot;828b3285fc95105f5b1946a6a015b31cf388bd5378fdc6604e4d1b7839df2e77&quot;
+SRC_URI[md5sum] = &quot;80ac0ccf43435739c4afa5e0bfff8580&quot;
+SRC_URI[sha256sum] = &quot;3015f707cf237d277cf1b2d7805f409f0387e32bc52f3c76db9f85098980e828&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5E75525056C65E9875191D6A--
