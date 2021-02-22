Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.58])
 by mx.groups.io with SMTP id smtpd.web10.34349.1613999930536982726
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 05:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=p4qFQPtD;
 spf=pass (domain: windriver.com, ip: 40.107.237.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXMGXtHiJzqV9G+3Ip6XK23EVXaPsHsrTKgX6X1D/T9QFYOfZU4MxExCPjlLyDzVAGy6b0vVpD/gPDjcRMrIxZ4pAjJmXfmyhjZrlplSwnLBuqDlprspgaO0YenIAWzH8BEoPgwMF90LRK4Dlx1vedFmP5QrynqjKVg5Rpi8kylPJ6WZFXBrK9otZS6f0GpeH2vK0AFc5ScKfjVCV8UIRJAxsshQAaFbTsfkHMVfcKKazH1AtN1xsu+x/QlmL5YEana7+k1fnfJMt9NlaQ5Ck2gFNWMiQ2aDdQQkOSpvDw3yNiAXyFLw6jJxnMA9gXyPKIV/dG/z0vXO9XWUxMheJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yo7V6k0CjGMOIW8PZzpZKNWHYAlMSqoBz0mCyT7Dllc=;
 b=OhVl6rGNZrgruhAnDihuCStZHTGHdPyIFPZe6NaUPDYDgv/SN+KGXsMmbINJrJkoFeCtFgp5Xs4t5VMfNEuTxN+OlhtraErupq7fk4iJCWNIv65bhJkHAq7do06hgS0YAbVVe+ei86kwjDYVhVvJ7fHGRph4VGcal6ZDyUuzYPwsBNSS70TQYNQl/S3CbO9SfYvnR1ywWKdZhzMoka26ebPt3e7YMpBWlNFecTq2U2gQFSCO4RcjDkRMGG+lS20tQiBHFCXP/TawJAh8F2s/jTpjFLA1Blzw77wxlZNhWLgkDeXs6oORIyBmE4wr6keCiPmi3+otI4hLvb7KCuAOOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yo7V6k0CjGMOIW8PZzpZKNWHYAlMSqoBz0mCyT7Dllc=;
 b=p4qFQPtDoE3gIjoxffC1Azjg2aM9Xuu+jU3EDkmvi85npl/lM3Qi8v4Ea5VPAUnzLCbiLm2qVS/jZeofcWEHw+INaO85rgaSyzXgazQF/lP0HtVU99Rfym0cWOyz+r8lpnnchF4mZmKpjYgijzeHIpjIM6wGb4210t28MZe8tJ0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3893.namprd11.prod.outlook.com (2603:10b6:a03:183::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Mon, 22 Feb
 2021 13:18:49 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 13:18:49 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-sentry-sdk: update to 0.20.3
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210219215450.2368194-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f6d5c154-aca2-0873-8e8e-debe5ab8df8b@windriver.com>
Date: Mon, 22 Feb 2021 08:18:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210219215450.2368194-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR16CA0015.namprd16.prod.outlook.com
 (2603:10b6:208:134::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR16CA0015.namprd16.prod.outlook.com (2603:10b6:208:134::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 13:18:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 974e50b0-c833-4826-1445-08d8d7346403
X-MS-TrafficTypeDiagnostic: BY5PR11MB3893:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB389357EB163980ACCFD9302E9F819@BY5PR11MB3893.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7qmDbi9JjKCGjIVgaq+1uLIcmPrKiQzp+jFzrHB2fpz6bO9uuU3Uf25MrKc3FWdRc3gRHFObxVqm+aWH1o8OypAMfNLEGgyCNENuDdJkEYeQ/Xk+HOCxjdHpAocn6J90n6CVtqls3p0UtGQ34mZMjcI6Y6myXu5tGxrWKigG0PD72t/YutfIF5Zz/FvO/43vtHIHHy3PZ7OzSx+iUkJ9KJVzFM8xFGLfAX80pbZ8RQYgW4lDsjvw5gOduo+ilnXMYYe/ARpAoU1XKB84vaY8VyMsxkbUR7jJm/J+wrj6dQoiRw0Cqx9TdR5B+u4bHhloG+a9F7R9EudkIeldkcBl12dQbMssf3qm6eGsSpxpcDk6X+fwVXmIYz+RV4QbieLsusjXKnUReIIG88rOCSlWR0Yyeps57JPe2SKOgF3p99UeXlLVMjoh2Xa+xBLb/5AAzsoSCKqy8gQPvKFWaRrVXgf/LxhsArm2iD8kruF+DN51fRQzUYFjB0kBjysLUnp08GBjYgXjJL+YbALVvKakYzd32C2YbIxbbLtEjboWfjr+tTiPt8JNphvW0nlPQOGW3EeIK+x+6RB9bCQSoRL0Aj/Kj0Gjm44OS2NJ9OE06uAVtpg1FNN4hO647yscwukZjMD093HJzytvULyEv3wlQZuTw0X6+3kyQ89wxendL725MDCqso9g94nX+h5hAphn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(376002)(396003)(366004)(478600001)(186003)(36756003)(86362001)(31686004)(956004)(316002)(15650500001)(16526019)(6486002)(66556008)(66946007)(66476007)(16576012)(8936002)(44832011)(53546011)(2906002)(31696002)(8676002)(5660300002)(33964004)(166002)(2616005)(83380400001)(966005)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MlhiU1FoZXVNT2xaWTRvTXltbE11VFZIeENmRXpFbk16M212K2NJd2dUbUl4?=
 =?utf-8?B?TkdOUldjenNmRGEra3M5OEtYVmFpay9ML1NrVDNxOWpyTnE5Z1BlcS8xUzR4?=
 =?utf-8?B?ODFRUWJIRlR6M0dzR2ZyRWNQaXdqcVdydldBUnlVRjVtRXJ0RmtYNEdqNFla?=
 =?utf-8?B?Q3BYSkg2bXo1ZzFsSHdncUlQT0ROR0FxNHd2dnlxaER1RGRielIwNW9tVmpm?=
 =?utf-8?B?aUpBSnlac0tIYm15MCtVd3RyMktjUmd0ZTI4RllIZklxK0Y4YXNSdE16c2Jm?=
 =?utf-8?B?RmRSeEEvZ0FlMEtjdldRakVTZkhYaHd6U2NtbWV1ZE82ZjhxWUtQSWZ6Uk5S?=
 =?utf-8?B?SGZkczNTYWVtVUtQVERDMHQ4SlhqOUpqSTM1WUgyRld1WlJWL0pOU0gxU091?=
 =?utf-8?B?R1ZMcHJ0ZVpBVDJwVFZQSzRkWWFWL3o5R3NrWEt5b0VkbmRIY0ZUOGZsR0Ns?=
 =?utf-8?B?V1dubDJYYndMSkNkdTZFc1Z2cWQvZEkwOWhtUUptUHhKSDBvUjVKa09TclpU?=
 =?utf-8?B?K3BzWEM5dURneGt0K1lzTEovM1l4cWpHdjgxcDkra0NuZUFpeFBabHBjWTcy?=
 =?utf-8?B?RThlMmRSQnpPU3RzYzRyYXpDb0lEVWpSL3NjOFFiRGwxUVU3RnA1enFZU0gx?=
 =?utf-8?B?Wm9DbFc3SThmSUhhMkhzK1FNZFRLNHgxYjVieEExU0FxTTFabUJyQVZBRHRk?=
 =?utf-8?B?dWFna0xVL0swZzMvT2RUa2NUazRyWEhzdVJqUTR1SFU1b1FoNFdKUWVnMXJJ?=
 =?utf-8?B?U0Z3OUcyelBVc0JOajJrQUpmVzd2Und2Y2YrK3FWTm1TcXk0cUs2czF1R3M3?=
 =?utf-8?B?NitjYkM0b0NDQ1pNOVBjemVPc29ETWNRaWdtSEZ5SXBReElndWU3THhVNFRz?=
 =?utf-8?B?cStEMWVWbkFpKzFLL0xDY1ZNbmlPVGhZYU1NKzRtaE94OUYvZ2Y0MHFMMHpu?=
 =?utf-8?B?c3EyazM3K2lUYXBTQlVoU0JENVE3dGtVTkw2WHEvSUR6eXZCd3NMSEVpVVVO?=
 =?utf-8?B?NG5sa1ZLK0liUjBhSFVUVHZSTGVzUmptN1R1RWNvQVRIZ2hwT0h6WGZoRUJP?=
 =?utf-8?B?ZlkzYUxEaEkrQUVUNWx5NFZ0MDRYVDJZNitPOG1Sak5IL2NpaXVtQ1lSb05y?=
 =?utf-8?B?M3JFZ29pRVFqZDZBdFlsWE92V3dpYkNINTFGMUZiTi9lYWIyOVgyZHFkOFZN?=
 =?utf-8?B?SDV4VFVpbzE0d0JEOW1xTGc0VThadEF5blFiZTI4cWVuQnUxZ0xTdEw1b05X?=
 =?utf-8?B?TDgzeWltQytnQWwrL0FxUXVUcGNtU2QxSnkwTEpGUVVSNjRYcTliS1I2SW1x?=
 =?utf-8?B?V1plV2dWUTFTQ2N1cm1nZDRQMXRvaWlhcWtqOG9tVXF1UU9QQ3hEYWZ3OWpI?=
 =?utf-8?B?dmlEKzN3SEFTK1dpMkM5ditxTndtOUxoMmU5dzBpSzYyL0ZHZkJDSHFiekFP?=
 =?utf-8?B?ZE9XdEtIRXNRRzltUDBxRmE0U1NnYXV2Y2Vab2Z1aUhFdnJ5b1dMdll2WHI5?=
 =?utf-8?B?Q3EzaUZjUDZSMXVtaE5GNllsbFlHN1NZOEE4MEVRbjJDY2NsNXZkdnpWR1Q4?=
 =?utf-8?B?TEYxVTB0eFBnTFVGMzkvSjFkZVJVVlJFZys4M1kwVll1MzhVNC85MFU0NlBG?=
 =?utf-8?B?M1pzS2FYYTlvS0hhQ0QvN1NyZFRWM0cvRjJIMUFOQ2p0L3N4ZEJnSERPc3A1?=
 =?utf-8?B?eE10bG1tYWI3ekhLaWYvaUJ4aEE4SVVTZlBjdDFZSDV2TnpQM2txaG11cEhZ?=
 =?utf-8?Q?UZBDJP414Jy9YUL0ACPsi56Rtf93PJsUInqJKSP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 974e50b0-c833-4826-1445-08d8d7346403
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 13:18:49.0868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGq3GEulGD2H1A07zwgDdXnREZWYH2ONgHv7CiHN261kRHsNONOps9aLlsVw5CQ1X1IVzIInS8k4+IM8Z5zd6/1DyQZSEUuuNwXhm2Tvbis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3893
Content-Type: multipart/alternative;
 boundary="------------51305FF5CBD805A4A504C913"
Content-Language: en-US

--------------51305FF5CBD805A4A504C913
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-19 4:54 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-sentry-sdk_0.19.5.bb => python3-sentry-sdk_0.20.3.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.19.5.bb => python3-sentry-sdk_0.20.3.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb
> index bb960eed0..13ba1e6fa 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>
> -SRC_URI[sha256sum] = "737a094e49a529dd0fdcaafa9e97cf7c3d5eb964bd229821d640bc77f3502b3f"
> +SRC_URI[sha256sum] = "4ae8d1ced6c67f1c8ea51d82a16721c166c489b76876c9f2c202b8a50334b237"
>
>   PYPI_PACKAGE = "sentry-sdk"
>   inherit pypi setuptools3
> --
> 2.25.1
>
>
> 
>

--------------51305FF5CBD805A4A504C913
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-19 4:54 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210219215450.2368194-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210219215450.2368194-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-sentry-sdk_0.19.5.bb =&gt; python3-sentry-sdk_0.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.19.5.bb =&gt; python3-sentry-sdk_0.20.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb
index bb960eed0..13ba1e6fa 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.19.5.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb
@@ -5,7 +5,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>

-SRC_URI[sha256sum] = &quot;737a094e49a529dd0fdcaafa9e97cf7c3d5eb964bd229821d640bc77f3502b3f&quot;
+SRC_URI[sha256sum] = &quot;4ae8d1ced6c67f1c8ea51d82a16721c166c489b76876c9f2c202b8a50334b237&quot;

 PYPI_PACKAGE = &quot;sentry-sdk&quot;
 inherit pypi setuptools3
--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------51305FF5CBD805A4A504C913--
