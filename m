Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.69])
 by mx.groups.io with SMTP id smtpd.web08.36312.1615212344097158281
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:05:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ELXM2Ajw;
 spf=pass (domain: windriver.com, ip: 40.107.68.69, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZONiJLGpOy3vGSzpRno5FKdqgiGrnIArrVfPJ5Z5SUG6aD+kUjjaye7tUvZt+Xc2zaz0onJJ64+7lJ+FpFt9tYRaK/NeLYtqU5bPxxotAcJColS+6GX1C0ArSiDMw9udPgSgOmUDLEIdhl9Dj6NW1oj9Qym6HQP6EcLZZcBvM/APBrXHoDmvVCRMpkAvrqFFW+rleSdyO8bRlF2fFFZVHQfCsnZwfXIOao4OU+DkOcEnMbzLDjwxWqZJYuGbUYRBO0enf3sXI+I7riYxRVrrN/0vvuBoFkw6u1l78RJFWnPFLR6plZRINAfnxdZK2EH5ThVCKc+czs/XeqsQj0pPlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbqSUl/Br2nOL3r/mEvMQUkGVBWfXSvwqnbo9rKELck=;
 b=OkTDYgIFxPyjKIMbE9fknzGKmPjyURbcp1JEOTvdhwGZfCgcrHZ/Vbn6XtolQtxq8kt4DIqxynIV7QmJdhGtmrsOk8CQr+xLSfpwpoPM+7lycNxytM0yRKiI3bLFchmRMSOhkKBYryY7ZeE8FHYgzYTlaqyJszMXqnkVRNs+nl778Jh3MMMKodN9nhFIY4vJIKRvo2RnfBFV9JwQ8BVinM/i10dVn7ymDBdTM+yjO/HD6LgwcP9US/Nao9wAICQtOM4cSOa/Ji9MrcDBKC/rKtYM0OyNtqpB5b7DBXn0GsNf/sjvGkt41AVzUorabB/9cxLktAAuOusxE8CZ5fx4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbqSUl/Br2nOL3r/mEvMQUkGVBWfXSvwqnbo9rKELck=;
 b=ELXM2Ajw/CRFvHCL8azEa98XOA597eksT+kvM2tGh55VH/A6zBVWruGsEmCsNhytn24kGH265scgsqo2TpkN0BIXXwJI3vdNf7m6hzOVPOfhe23Hd2T1iRuNEcoWIEy5cCuwQWpRolwwOQiklT20gjuou8QKiZeHKMAId6o2QXc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3030.namprd11.prod.outlook.com (2603:10b6:a03:87::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 8 Mar
 2021 14:05:41 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:05:41 +0000
Subject: Re: [oe] [meta-python][PATCH v3 5/6] python3-pep8: Fix HOMEPAGE
To: Andrei Gherzan <andrei@gherzan.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20210305160256.3333334-1-andrei@gherzan.com>
 <20210305160256.3333334-5-andrei@gherzan.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c32ff75e-5e28-1958-6ca4-6423c06f0ed0@windriver.com>
Date: Mon, 8 Mar 2021 09:05:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210305160256.3333334-5-andrei@gherzan.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR22CA0056.namprd22.prod.outlook.com
 (2603:10b6:404:ca::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR22CA0056.namprd22.prod.outlook.com (2603:10b6:404:ca::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:05:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a10b7e10-942e-4ad1-89b7-08d8e23b422d
X-MS-TrafficTypeDiagnostic: BYAPR11MB3030:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB30302569514C1442647429DA9F939@BYAPR11MB3030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4RvBdA/4jojIljmZz5q4QUka69JI+N6cZBo+jfI62PXyj65AodT4Nk+BEqBj2iTcBnRa+FMKMtPkvuYThbWp98VFJp3JxQjUqeldwSkCos/k+k86r5lOgUeygejWA3sdoC/5fqOOakWbMlDQ+eVW6hJQAE2qKRZmEJp8J09NlddFb4g7xv07Gpjx7JqO0Cy0AUsU7D9VcvB0buN4fjsuA30cYPGkhbXxLMeCe78pCAdaFzOaOBaPsADwV+7DGJdF31lD/AUpiPKpdpS+9qQl0mzhOYpwsJm2IdoDVCkR4ftNpT6diWYrFeo5AYIKE0NNwIM2lYGThe2Le2OcZ9QCFpilb2WmzhvkltN85Hyoz6bq7KgeYsF53KnicjsY+g8CBe/zhPRwNovSTOu5/kyeck1DznpPQqu9tyRn1viTgAwJcoB+BgDtGqe4+R5uY5YABLSQShQojSURrmi+W3FUdUil0T7Xa/2VcwnBNzyKw6jMySJDQk6QR1HwUzzGfUAjF0QRJ/joA9Zm7IUUG2OucFC9bugArfW/Z3k0mmBLOvVi8bLX1LTWjWYKDmrBnudkviXGBcoOIhuRpvxv41vOHa8N+aLuCEDcWaL4YCoVXBdxDT8rU8NuQ27eGjvPqa12kpixi7xM+WMN3nyYzq4hzpGPestr2pwYmQkUPAQ03LhDmGvYyeuUjZ/BF4iRtMqd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(396003)(136003)(376002)(44832011)(8936002)(956004)(2616005)(316002)(26005)(83380400001)(16576012)(4326008)(66476007)(478600001)(66946007)(66556008)(31696002)(8676002)(33964004)(31686004)(53546011)(6486002)(86362001)(166002)(36756003)(186003)(16526019)(2906002)(966005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?enhvYkNncXAzRllPMk5ZaDlTOGdDZzNPeUpZMWxKT3FVWCs5QTZzNVBONWpR?=
 =?utf-8?B?SUZvUHlyUEQ2eURhV2hOSWYrVHgwRWhuYTVJSDdVUGRNbElDMGo4VllRaVRF?=
 =?utf-8?B?NmZyNUdBYkpTOWlLemQ3OVNkMS84eFBxaXk5REQvV1ZQdG5nR3gwRTIxZHZS?=
 =?utf-8?B?cTNBUU9YYjk3SDk5bDVBMVF6a2VGWVV6VlVCNFFON2JpZ09rUjdDZjg5K3Bx?=
 =?utf-8?B?UDBEN0NudmJVZVl3dWRXN0l4RXV2ZElvUmlYSjZnUFV4bFdtSk1YMzR2MWVQ?=
 =?utf-8?B?aE90VVdlbEFXekN5K1d0a2o2cDF3SVY4K1o0bTBabXp3RkZWaDZHL1k5c2dM?=
 =?utf-8?B?bjA4WkdQYlJNWDljd0hmaGFENFdtT3F2QWlSR2xsbDB1cXFBc2FST2dZOTA1?=
 =?utf-8?B?cjkyY3VSVVl6YmNaNWxFM2xaa1dJNUpjeTJLcWRQSVp1VFJMQXhJRzNFcmdk?=
 =?utf-8?B?Y1hnNCtub1BrTlpLRndpbUJ2d0Uyb0VabFZBVGMybGVmRnJ3cHVrNGduTk5m?=
 =?utf-8?B?K0ZaRXMvYXNHS1NIZ2dXTjJ0ZCsvSnBwM2kyS21MaTR2Z1ZCSUE0WFhlTCtW?=
 =?utf-8?B?SWtNakNrL2ZMcURJL1hVMnF1dGtFeHIzRDZweno0aXN0dGMrcG1PNS9PeHpi?=
 =?utf-8?B?bW5uaXUxYnNLYXVnMnMxeHhSMUdqeUswdTdxdGloVThISFpIbDlGT2hOMS9X?=
 =?utf-8?B?ZkFNYVBxSGY0U0kvaTNxYVNkYzFaZ0N2Y0EyYUhjTEs1ZjQ5akJuR2J3b3hT?=
 =?utf-8?B?dGFrRHEreSs3dFpEeTEyOUkyQis0VHlMeWJWdGtEb01DQzRFd0s0eGVoK2RB?=
 =?utf-8?B?L3JrRC9oV3RlNCtzVFlUVlVSL2ZMeEJVemJJdDR2b3V4ZHpjRnhxQngxcGFa?=
 =?utf-8?B?Z3g4OTFYbWlFS05rampzM3pNZUJQODdCOFN2RHJOdEtkdjc5MVFnc09qRlN5?=
 =?utf-8?B?M0J1dTVVVlYyTmlTbXU2eDRPWEtDcXNKOHQxZEp3S3NIVEFPRFZNYnZHdGVs?=
 =?utf-8?B?UUVQQUtKdHhlQXJRaWNJSVZiTnkxSVZmcWUxdjJjbFJyRmN2ZUxQRGJ5dzdp?=
 =?utf-8?B?NzlqWkljdXVpNUJKWTBlTjllYUh4SjVpS3RQZXhBeXRMcCtUd280YmpSRG8v?=
 =?utf-8?B?ck1uTzZIV0VWYk9Jdm5oR3UyMnR5SEpibnZocWxnd29mM2lLRTFOMkVsMUdF?=
 =?utf-8?B?bmhwVUUwRnhwaEQ0Y1hJN0hncmI5eVRJNUJYa3c5dmp5a0RKNC9sem8zYlRI?=
 =?utf-8?B?d0ZsU1AwNnlMTmZleE5PbEdZbThQVmJBYXZGcDY3NW9nL3llN1c0ZWpaU1VG?=
 =?utf-8?B?M0ZGRU42ZEJyTDZ1b2FaZ0hmKzJqUUZacWtKdS9RRXo0QnZXV09TNmRkeWp0?=
 =?utf-8?B?RnZFdmIxV0NmOUVkQ2MzN0xYWDZyU1p1UERBeHE5dDZDQktHbzJIZ2pIKytG?=
 =?utf-8?B?VnZ4S0RMQTFleWhGWTZZbWlrazJyby9Fa1pFUjdGMHhzZjRXR3ZtS1BNWkdj?=
 =?utf-8?B?bUZyeE1JR1JlcWNRS29OOGcwVEw1ODZOZGRUcitBRjFnZUVtUndVVjUwVVc5?=
 =?utf-8?B?bHpWUmpodjRMYWtZd0xzSkMvOUppZW9ORXlET2k1VzhqYUFpL2N3VE1wV0dy?=
 =?utf-8?B?NE9Fd0ZDRVNRTlN4MFVTa2xxRzV0NkxFYUxpSVNMRUFmTnNoVld0ejcrZUUz?=
 =?utf-8?B?TDNFRWZZYS9zQWVlM1VQRXBOYTl4cHpFaWxuQU41Y3NyU2Z4MHpHajhsMXdG?=
 =?utf-8?Q?PUGLq/iCMJRkMCX832QyYisUmFbqBoSZbR0n2WW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a10b7e10-942e-4ad1-89b7-08d8e23b422d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:05:41.7121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZ9yUvkoh/o/wCMerLM+cy1arFWGz8KdG84g0Q3m+Z6d/26mmMedzNU4ltIkF9E5xrtBcDb8frD4Q9dI+ai7TqasRcQd1Ufgqv7bjST1fgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3030
Content-Type: multipart/alternative;
 boundary="------------8D545F7083A19D40CFC42AF0"
Content-Language: en-US

--------------8D545F7083A19D40CFC42AF0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-05 11:02 a.m., Andrei Gherzan wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
> index 8291281ca..e8587c832 100644
> --- a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
> @@ -1,5 +1,5 @@
>   DESCRIPTION = "Python style guide checker"
> -HOMEPAGE = "https://github.com/dreamhost/cliff"
> +HOMEPAGE = "https://github.com/PyCQA/pycodestyle"
>   SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e"
> --
> 2.30.1
>
>
> 
>

--------------8D545F7083A19D40CFC42AF0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-05 11:02 a.m., Andrei
      Gherzan wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210305160256.3333334-5-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Andrei Gherzan <a class="moz-txt-link-rfc2396E" href="mailto:andrei@gherzan.com">&lt;andrei@gherzan.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210305160256.3333334-5-andrei@gherzan.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
index 8291281ca..e8587c832 100644
--- a/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = &quot;Python style guide checker&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/dreamhost/cliff">&quot;https://github.com/dreamhost/cliff&quot;</a>
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/PyCQA/pycodestyle">&quot;https://github.com/PyCQA/pycodestyle&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e">&quot;file://README.rst;md5=d8ebbbe831259ce010179d2f310b0f3e&quot;</a>
--
2.30.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------8D545F7083A19D40CFC42AF0--
