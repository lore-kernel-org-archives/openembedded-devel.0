Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.77])
 by mx.groups.io with SMTP id smtpd.web10.8088.1615813393155072145
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 06:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UhApzICG;
 spf=pass (domain: windriver.com, ip: 40.107.244.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ag90FXQsWSIqSGRPHUjV4D5Et75i+5sUzvX6ZvdEoC2XmiXYnAopeNnqsipY/0dFmlpibG5vmENqEVm8eVjPbvhwArr19yhtl6Oc145fnn9ejbOeD9Qp9XtbP1tLu77r06ByZZma/sDJONUpxtBpIH6IjujBNfW5wzddofu1/Qwz1JDVF1b6+pdsYs43qi9E2IIEMIY6bnY4PoF0dbgTHTEZoHCXj2vg0aQO6ggXs24Gck3LCaRRUbBcF+tBJpAMivuIgQBELEJ11YAzjjDEQW+rwQtiFc+bLGfjvNxuL5tWtdZEMuHQDrvh2ltIBfUnZEPsvh0YhpRotsZmfTGuuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WN8qo7CNB/x/ub6ReVnh0c9nm4Ma6Dnf32neMlRDfow=;
 b=iNfU1dXW+JZb+3EJ5GTVQkoQj2eQR/n0DikopyKIO5e9BN4WS9WlYvLFtIeU3+CmGEptO0IjWDXCkhOSSPNJu4KyMP8a8j6Uj1azHHHIbotqONmZ/kySrcskI+regELoX8t6VCsQDXO497KiAoih5GqiGvwZV6NiepIzDzEviE0fLhyhr6F/HTCoFzB/1BEtXj/pGTd+tZMd0ee2M4sZxe3B9FPoe6aGHWMtOmnOphizXfOhIyoRUxXunJIiEU/DcP8wFnuUx4tIOQxKBWBaaIPMBycMp33ANBpKLBM0p2eXMdAh1pZ9FNH837sbTviaJKCqDrgr6NFD9koBsW0Fmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WN8qo7CNB/x/ub6ReVnh0c9nm4Ma6Dnf32neMlRDfow=;
 b=UhApzICGlSYEjfD5gmeoDvc8vdoXTUR5nhynqC7R6AS+bNxx9fghJG47sAls/mDPYFxz4EXD6J6sbZ0FVq3HciC2mz2KWDFPVi1XyVp+g7cJeGBgR6wFpPaKIj8K8q069BjN4S5S1UWr52PHXBB7RAciWglFrADB/KJl5eyKFV0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2901.namprd11.prod.outlook.com (2603:10b6:a03:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 13:03:11 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 13:03:11 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-sentry-sdk: update to 1.0.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210312170915.567739-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e88a22db-c2ea-e66d-350b-1a0a995a0034@windriver.com>
Date: Mon, 15 Mar 2021 09:03:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210312170915.567739-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN0PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:408:e4::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN0PR02CA0012.namprd02.prod.outlook.com (2603:10b6:408:e4::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 13:03:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac8cffb5-6047-4974-4d52-08d8e7b2aff7
X-MS-TrafficTypeDiagnostic: BYAPR11MB2901:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB290191BDD79CE4DA3DDC4D839F6C9@BYAPR11MB2901.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PBnlxEa9XqogtxgJUNRY876mOWOSxRo/GgGb6MCS/Ujvfo5JdVI0DyYazWeN/3uAAYw38XQGgnDb2EbNkY5fHrpPg/m7FvwChL3sKrhzVZLKzXEVq1VTBdmzTd10n7R94vQnLLOlhUiu1aPGvurGO8jikxMBL2erilzh7p9VW8aIFoEmU6wT3gGmfXeW85c+3DBLqhhkOs+8NR8huKPRpFGHRACyUfv9mR9Dbd5RN8eSTFkgPmF9Nk/6gdLwQHy3dQq33ZitEfAnBXZZK907hq7pAIhyklEh7WKzS865G/M1gRlwb5hbx6oEXX4FAzlb7X8ki3m6BXu5KnlIQun+H7IVSq0wQgZNH56FkK32shSR56MSjZ134wD9+cL6FFCHIBIjS9Ai7cMGeMCU8+ayFf2gojc0lzBUk9G3m8TnDbYKWVwyEERvGEfNZtgToXOIGeKQFh82I9m1INmOTSg3Dl04N6/zSSQSAKjadfGalhfin+wD95keZxfVaSmTuNkgqgRs9J5wOnHJIoWunY4ebcMq6AFe6fvkU+G92OU7qNfMZlZjTI2vqW6mBIJQYgE3lCsgIM9K/lc/OYL1r8Yj5gdBuJKcNT0RD0edbXOVNz5VpeWg1pDWP0Ex2wmyKK5N0y0f+L6DNPi6o9SM6jRi3756yxqPTHkkZOoqjGb3W1TsDSfG3dTfi56UhQ9O/kcLSETpYlOMtWWIH8Q16fYSiGoSC8UriwOM74yPPe3fIc0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(136003)(366004)(396003)(26005)(36756003)(2616005)(8676002)(166002)(956004)(16576012)(186003)(15650500001)(966005)(31686004)(16526019)(478600001)(86362001)(83380400001)(66476007)(8936002)(66556008)(53546011)(5660300002)(33964004)(6486002)(2906002)(31696002)(44832011)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bllVYWVwUjlLUHEwWDFIeHA2eW9iZldQaTExR2pLMkxGMU9BZC85SG1oR1BG?=
 =?utf-8?B?dHFwSmsvdXBtOTVESWFRa202NksrMFpleHFQTHJ2eVJhdVJFdDhWR2ZJaDg4?=
 =?utf-8?B?QlFwU2QxRG5WYmt6NXZFWVdOVXc2V1RSZ1o3QWhCdDdwcWNTdUtzYmc2aXVi?=
 =?utf-8?B?VXZxcEkraDhrRmRTSjZScjMwSVNOelAyYytvKzVGcUpKaXRNdUt5VnBSb0g3?=
 =?utf-8?B?cjE4VXlCSVRCVXJPaXMxSG5qcFZ4czl4L09LeDJwQkkrTjRlMlVMbno2RGFz?=
 =?utf-8?B?MHlSKzdMblgrTEpEMWUzNnlBdUt4c2UwbjRQaDg3YlFvSFRPTGNyUnNhcElP?=
 =?utf-8?B?UFgyYjlYRUU5VU5yZEtuUkprL2YvREtLYjJlR3NCQU54V2l1eDUzKzVFZSs1?=
 =?utf-8?B?NUFvVytIcHVTb3Y1NEdpdWMreFRqQVBkRDVZU1cwTkE3MTFFMWNFcTRQRWJ0?=
 =?utf-8?B?VjRtK0xBMmVFem5Uc2FrWG43cS9ocm5mMWpqYWEwbTJnNXcwMElNRVJ2RTJB?=
 =?utf-8?B?V2JqckY1dzVHbk9aQWtld09BRHpPSm5FQ0d0amhqWHRGNERRcFg2Yit3VW5R?=
 =?utf-8?B?KzhlSFJmSWNvcmx5WkR0TkFQN0NCUEViKzJFV09Oc2VwVVNFT1RnTEhHQTY4?=
 =?utf-8?B?OFFldmtsc3RBNjRqNTdtdUdnenBZcDVpYWd5bzZ5OHVDeGltcmZqWkJCcHB2?=
 =?utf-8?B?aVBvWjE1VHFyZFYveG50QjRyWFQ1V1JuRks0NGY3eG9mNnZoUnVVai91VElu?=
 =?utf-8?B?K244dFRCRUJIN2JmQVJ0SktNdHNpaDdoN1FKSkFrVW11aEdJaTM0WWVkVDdW?=
 =?utf-8?B?YXg1aUVXSnFqZjlkQkRqdTJNU1JrMnJOUTBXbzJ5U1NhcVdRakd2VVFjUFRT?=
 =?utf-8?B?TEtDSWtSN2hvSjNtZDJzNEhwckZQMjlIdFBmclZza3ZOdjFCSDEyYjdMRHlZ?=
 =?utf-8?B?SE5Zejl0dTlxdGhZV1dHTmZoMjdoc0FqK0JOVFZJMnBVYmh0TDloS05VV1Bo?=
 =?utf-8?B?UjdncTZkODh2UzhDZS9lUWhKLytDVko3UGtMQVpIMUIxSllNbHJiYkRubXkz?=
 =?utf-8?B?T1VQTUVNdEtMbXdRUDFKNzhVcGRSajVndit6VlBjV29Ddi9EblJZZnNEVmUy?=
 =?utf-8?B?ejh4VW1KSjQ5UWlWSUhkTXQrR0NoM05GamYrV0VDUWYwcHdESXloTjhWMWpJ?=
 =?utf-8?B?V21ScDJaWFVSUUFndFJUeVFnWG5jZFlldG55TUNLWDIvWWIyelVkeXJzZm5M?=
 =?utf-8?B?dTMvWjRjK1lrckNNWENpdUd6LzltTWhZWHpCTXVwZlVYVzZzWGxhSDBnVjJH?=
 =?utf-8?B?bXpRVmRGckVxOS9LZ3I3Szd3SU1PbmRDVFdvVWp0VEQrZ2diR05Cd1hjekpj?=
 =?utf-8?B?YWNic0I0c1BnZ3JOWnFSNmZCa1p1dGJTdmhOZ1krVXBMTDlqT2M1TkEvdVF0?=
 =?utf-8?B?TXFYOGNiellwK0o0MlRDY2pOZCtSKzFCdmVOV3QxT2V0Y1dSeHRxRm0zQ21x?=
 =?utf-8?B?bkloRnZmeU5FcG5sUjBCdlR1QmRONjYwVEQxaFNQWnRUdGhMQnJ6cCs0ZSt4?=
 =?utf-8?B?ZWdqMlhVQ1VXNkpSby9IYmEwYWJYN3FKZHRydERnZEpkcG1EY2w5ZEJUWWx4?=
 =?utf-8?B?a2o4OUFLWUVlTkRXZHdlL3BmZ1o1ZGdrMVdsNDhDd2l6aVFNbnVDdVUrV3Mr?=
 =?utf-8?B?RjFtL1JCRVBrbGhLSDZDOUhwN0YzbUlrMDM2T2ZZc05peS9zQjc2MFhLcHha?=
 =?utf-8?Q?5rQTPbc6UyuwfBHB9U+HrgtGB9sE6i4uMeNBNG0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8cffb5-6047-4974-4d52-08d8e7b2aff7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 13:03:11.7039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MPOViy+7mlTlWG8Zwo3rAHILzfapSaN8UwsdupnYNasieVFbtA/TdmaVppdwKLjuwtqMGXqITrX2ZGvBieTN0J+Cam+n1HFzjTRVCq4AFPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2901
Content-Type: multipart/alternative;
 boundary="------------F869424AEA7D715773C110E0"
Content-Language: en-US

--------------F869424AEA7D715773C110E0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-12 12:09 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-sentry-sdk_0.20.3.bb => python3-sentry-sdk_1.0.0.bb} | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.20.3.bb => python3-sentry-sdk_1.0.0.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.0.0.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb
> rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.0.0.bb
> index 13ba1e6fa..22b9f55dd 100644
> --- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.0.0.bb
> @@ -5,7 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
>
> -SRC_URI[sha256sum] = "4ae8d1ced6c67f1c8ea51d82a16721c166c489b76876c9f2c202b8a50334b237"
> +SRC_URI[sha256sum] = "71de00c9711926816f750bc0f57ef2abbcb1bfbdf5378c601df7ec978f44857a"
>
>   PYPI_PACKAGE = "sentry-sdk"
> +
>   inherit pypi setuptools3
> --
> 2.25.1
>
>
> 
>

--------------F869424AEA7D715773C110E0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-12 12:09 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210312170915.567739-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210312170915.567739-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-sentry-sdk_0.20.3.bb =&gt; python3-sentry-sdk_1.0.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.20.3.bb =&gt; python3-sentry-sdk_1.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.0.0.bb
index 13ba1e6fa..22b9f55dd 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.0.0.bb
@@ -5,7 +5,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/getsentry/sentry-python">&quot;https://github.com/getsentry/sentry-python&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341">&quot;file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341&quot;</a>

-SRC_URI[sha256sum] = &quot;4ae8d1ced6c67f1c8ea51d82a16721c166c489b76876c9f2c202b8a50334b237&quot;
+SRC_URI[sha256sum] = &quot;71de00c9711926816f750bc0f57ef2abbcb1bfbdf5378c601df7ec978f44857a&quot;

 PYPI_PACKAGE = &quot;sentry-sdk&quot;
+
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

--------------F869424AEA7D715773C110E0--
