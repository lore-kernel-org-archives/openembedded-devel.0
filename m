Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.82])
 by mx.groups.io with SMTP id smtpd.web12.23971.1611839224516607977
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Pj4/tUta;
 spf=pass (domain: windriver.com, ip: 40.107.244.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0cqvXq+bwT0GPDrOivmeW4o0Co+/QcfReWKkf5xNHtjt5m/RqT+w/7Da79AS8UcmOetB74ahl399SH5Klxlai1UwjR+WTd0pqN1KUtVhJRQa7GczN9IN5g29twjbWFtmoK4xB5DehpSqZBWBIAkp6qRD/l4DG9WwyLf5UggZzNLPMGPW3d7mYNvWxKvQAtfxv/K07q9/0IfVSKfXJMV+Cc/MrnWUQL9dAtHUg/Ly4fJtRK6eiXIbW+OfbGYTJ95fZ2w4idLbhz3HTHKqKhS8tzQzPjHR3H6YnjChMjew9VQKy4C9o3+SAyDDaOd6JWup7iJ8HmIMDLY6QFUKovSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjscpoD32LWxvfct7uD7TwYuugkNNbnErA1+KJPn7x8=;
 b=O5CgL+yPd2rqqZkQvX02c54kAS1xIsff5k8k5qP6nx5QqcvfbAb9rLt9O0b7p7xvNLhRAOSfiL1oLAMkbz0l+wIuqczHUIP0zz2MPa7GCLRbb4ainAQgFviUPK3huUoFk2pfz1rDXOkdxH6viPxZWBqu84sptiOGuuEAjjw798Dgx+nySdYhLsI/ZQE6SXBiggL7wZHBtIzmaXf1lgoJLZWQRYRceBEyHaPOEf6mMDOqkmC96QOgJa9oGEarxzLo76MrCaSWWiPcoaMPACZVKXLV+j7GT9Il4GGnWRjeTksIszC5FP7J6z+nc47CScitbaEat9vMD0n1G07WvZXUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjscpoD32LWxvfct7uD7TwYuugkNNbnErA1+KJPn7x8=;
 b=Pj4/tUtaztz3imGBUIi4Av6FYgDwqytVVCO4sVEav8d3tsW+L6tij+GdzYbQOis4sn5OwmaOmUFZYE3YqUx8VvuUz6u3H+ZLKcWKHw0Bi0UTLVpjTiCDYbSktEKj3svtpA1oeHUOt52lG/iM36LagVdGx7uVbfUS0NakJpURCNo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 13:07:03 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:07:03 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-ipy: upgrade 1.00 -> 1.01
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1611623616-94203-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <caea824a-2c7d-951f-5dfc-c4779c2e21d0@windriver.com>
Date: Thu, 28 Jan 2021 08:07:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <1611623616-94203-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR0102CA0066.prod.exchangelabs.com
 (2603:10b6:208:25::43) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR0102CA0066.prod.exchangelabs.com (2603:10b6:208:25::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 13:07:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f582875-5e4b-4f11-2fc6-08d8c38d9afa
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29510A3800EAD054DA8E8E0D9FBA9@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qOFGVrS3D/zRUM2Sz+UNhzPE9xrPCoR1Vw7lpqGudeDSff7che3p9w6TUgw31wh5qhmlUFABYl3lU5cn17VgRJWoeqI7L/8rW+9KivA6J8APLKJnDoxQ0c7R6xocgOkaFy0wGyzFpiwv7qTGXQM+N31EVDohD8mp+hBWB8SP6YQlW7Ik6RJYFRCFPCy06zn3Rj7PfPji2NUKGWcuon+ArvgMJM4lI+Unh2NyFWcjVfXGz2/PnBwsRbIRglMdKCPHYB8MuQovC2VhQ+BZ1lzZnsPtPw/qP92pOCg638nDi9yC6uMxV8iV0NykyxxucacHjMULzIQjlA6MFO/yCua3qrT1hVPOfOiqpvNEzRS8eIvNKYhbw5bXSDFEuAz465YCh/GOSxgisr5Eq9MKM2IaeEPGvPJ249iSsGFvDTg9/8nS7qP8xDZ2DgaaxXzVe6a9tmvu9uR/tH0qJSjmgfapwHQGuCk9IgMSeNelk957MM5WW4rcE8VbSJ5o17sc4G/byZCSqxGy1p7S/n0Ql9ysZKNKTU4feV376shfsV3eFGbpIfbjNTEJpn+Epos6eP/TLPKhMrEsRbF68KSDZEpgzuN4d7lajc82dqBb5oXxiAG5n7PzZ3tcle46SS+o0tMz4zHIjx9I9bFN67LhsZgmNI5B2uK3gha5KW+s0haFST8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39830400003)(376002)(396003)(36756003)(2906002)(33964004)(52116002)(83380400001)(166002)(8676002)(966005)(66946007)(478600001)(6486002)(66476007)(31686004)(66556008)(31696002)(5660300002)(8936002)(44832011)(53546011)(2616005)(956004)(16576012)(86362001)(186003)(16526019)(26005)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZC80bkFCU1l0QXc2TzdNaWYzS1N1ZTdsUVhYckxaS1I0bGlzKytTQ21UaHFM?=
 =?utf-8?B?UnE2T0pMejhwVXFKL1JsNjVxRTcyOFNWaDlVVWtXVjZVbTlobkdFNlFrTndV?=
 =?utf-8?B?Q1dQSnM5V2JaT2dtajkxeTlaZXB4b3g3MlJ0aG5IQWNUcDk2a0F1T3QrRkdr?=
 =?utf-8?B?bWkzZEROb2tJZDNKejQ5WDFmL2l4VVdFWXllSElNQ0xRZHhkbHBHWjhkQ2R6?=
 =?utf-8?B?aXVxb05CV1RtQzFTbzBFenM2MWZJQ0tHQ0pBS2U3VElCM0JhWWFITUg4NTEw?=
 =?utf-8?B?VTh3MU9Rc2xWdWZvd3RkWTgrYStJdXBwdXN6Y2FobHUxbVQreFJtTWtITjNR?=
 =?utf-8?B?RzVzNWpVajJnaVRIb3pkYm9pOS9WTVd3cWlnUzFVZ2p3ME9Sd1pOUVFDOWVW?=
 =?utf-8?B?U1N0TU1INEQzRU90dGo3Z1NwNFhRSkUzRlZIZGQ4dEVyRSs4V2xxOU01WlZW?=
 =?utf-8?B?eE9JbTAxbVhWNnl0cWdSc3FKek1kKzNHVDZBdlBMV085VVNGVXB6dXNNaGhV?=
 =?utf-8?B?UHcwMDRjQzE2S29nSEYxSXFDam9tSEk4Qk0wbXAzTzJ5bDU4OWVyNzFtdWdS?=
 =?utf-8?B?R09UNXhqU29ocUVYZmFBMGFOSnhldWxXRU45NnNWNjVTdnBCMCs3ZDdwTlZ1?=
 =?utf-8?B?Tnc2a1ZRYmpQcDY4dk5PU293bW5RUnNGdHZFUlgrWlFCaFZIZGRzcjJLYk9K?=
 =?utf-8?B?SHlNVFFDTURCTnJiWFhzSXpSUnhmajduR1ZXU3R2NnlFa21jVC9RRTJIeEN4?=
 =?utf-8?B?RE83a2lPdjJhVzBUUEk2VDlmSkpTdCtiMkQreGxDb1BKcXV5cVZ2dzVsWE9q?=
 =?utf-8?B?Zy9vRE0weEl2Ky9nR2c3YjQyQW1TVm1wbENYT1ljK0dMLzcycnkwWTcvNkJy?=
 =?utf-8?B?MzcvQy9BODAvOUlLc0U3NnU4Q3dzaUtMTC96Z1hsRlZ6U29YNm5QWHI3SXk3?=
 =?utf-8?B?b1JtTlNxemNib1JJK3FHS0U4a2xLUncwcjNzT09nNFpVMjNWMisvT0tJZjF5?=
 =?utf-8?B?am96Wkh3Y1FEc1laeWMyZ2xza3NJWDR5dEw0bVRZNS9SOWlYUFNaN1BuVVc3?=
 =?utf-8?B?dlpoWU5xTHZQMnJqeWtXNHhCeEpHS3c2bFhVTzROQjAvZHo3NTRvdmNkeHZD?=
 =?utf-8?B?WUlEcjlmSk1ZQzZJTklOcGVMSitUYmI4UlYvZXR6ZVg2WnQ2eEd6L3V4MHdV?=
 =?utf-8?B?bWZCYTlXZjl3WmhKMk9Fb1UvSm84emswaGZuczBmUDRWU0Y0ME9XK1JiRkl6?=
 =?utf-8?B?Zk52NDQzZ1V6eHJRU1FTN2QrcFlPSFBHRUFnNXV5M0JCZ2VuNC8wK2hCWm55?=
 =?utf-8?B?dFlnak5qOG9NTk01cXJaNENBdnNmbENwMFlBK0pqcWZTVGRQR05aeEx0VUJo?=
 =?utf-8?B?ZDlITjhBTTgzZXlZL2Y0WkFLWHJWNmR3SmxaYlFqdVpvVHdSUHoxK3d1anRP?=
 =?utf-8?Q?QIuBZ6L2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f582875-5e4b-4f11-2fc6-08d8c38d9afa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:07:03.5694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmAIruJVCA43E2+lZAQUeoLcC0pPS8t7vqWF/IoAtHPTAIrNh906tYIaDH9ewp8KpQuNUKHUzORBRWi13s5e90M+NUw/LJyXICn8PDlfnkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------93620513F3DA70A40561BEA4"
Content-Language: en-US

--------------93620513F3DA70A40561BEA4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-25 8:13 p.m., zhengruoqin wrote:
> Version 1.01 (2020-12-01)
> ------------
>   * Update to support up to Python 3.9
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-ipy_1.00.bb => python3-ipy_1.01.bb}       | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ipy_1.00.bb => python3-ipy_1.01.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.00.bb b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-ipy_1.00.bb
> rename to meta-python/recipes-devtools/python/python3-ipy_1.01.bb
> index 14931546e..c141f6865 100644
> --- a/meta-python/recipes-devtools/python/python3-ipy_1.00.bb
> +++ b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
> @@ -9,8 +9,8 @@ HOMEPAGE = "https://github.com/autocracy/python-ipy"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=848d24919845901b4f48bae5f13252e6"
>   
> -SRC_URI[md5sum] = "1a90c68174234672241a7e60c7ea0fb9"
> -SRC_URI[sha256sum] = "2f2bf658a858d43868d8a4352b3889cf78c66e2ce678b300dcf518c9149ba621"
> +SRC_URI[md5sum] = "d6cf83e7f418ebbd23324ba1c658b907"
> +SRC_URI[sha256sum] = "edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 
>

--------------93620513F3DA70A40561BEA4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-25 8:13 p.m., zhengruoqin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1611623616-94203-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Version 1.01 (2020-12-01)
------------
 * Update to support up to Python 3.9

Signed-off-by: Zheng Ruoqin <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@cn.fujitsu.com">&lt;zhengrq.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1611623616-94203-1-git-send-email-zhengrq.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-ipy_1.00.bb =&gt; python3-ipy_1.01.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ipy_1.00.bb =&gt; python3-ipy_1.01.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-ipy_1.00.bb b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-ipy_1.00.bb
rename to meta-python/recipes-devtools/python/python3-ipy_1.01.bb
index 14931546e..c141f6865 100644
--- a/meta-python/recipes-devtools/python/python3-ipy_1.00.bb
+++ b/meta-python/recipes-devtools/python/python3-ipy_1.01.bb
@@ -9,8 +9,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/autocracy/python-ipy">&quot;https://github.com/autocracy/python-ipy&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=848d24919845901b4f48bae5f13252e6">&quot;file://COPYING;md5=848d24919845901b4f48bae5f13252e6&quot;</a>
 
-SRC_URI[md5sum] = &quot;1a90c68174234672241a7e60c7ea0fb9&quot;
-SRC_URI[sha256sum] = &quot;2f2bf658a858d43868d8a4352b3889cf78c66e2ce678b300dcf518c9149ba621&quot;
+SRC_URI[md5sum] = &quot;d6cf83e7f418ebbd23324ba1c658b907&quot;
+SRC_URI[sha256sum] = &quot;edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------93620513F3DA70A40561BEA4--
