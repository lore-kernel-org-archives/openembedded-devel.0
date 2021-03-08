Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.64])
 by mx.groups.io with SMTP id smtpd.web08.36336.1615212426066311978
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:07:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MP+vX26r;
 spf=pass (domain: windriver.com, ip: 40.107.102.64, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Onala1e/vH2Ff1mby2+sFHxOyHSHNGoyIUTjihTnfrPrfTpziGnWsDo4v4jIfstOIBLy2pu+5XkImBjz930xpTexJFC9PWV7SIJfO93KFiOnyV2RN9e6xiuvpJn2brzPpjx8TdJhPovnBDf2CJOT0pe3Kk0s0Yquf/7axo7vJ7tn/agFIBQkPP7vm3jDgMqZRtpafGnMzsjtK4dYLoimXkKrJzXYqa3QobFznp2WOjG5ItTax1GUusO8aAKAf2P005SqMPVdnf5xt/McWk06fjMsYU9xPPEPuwQnn0hkKHBwkSPUWyg62QlpOtsrJZC3+QEgnxrA0LA0hWrA/Dkhlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56AlAnVFNrxGjZYVv/9WmajqajlOWXHvrlAxppFrpD4=;
 b=FekHeOuRAhfA/4zt5SIY09wC4y0c5tmcrI3BFAeaXd1o+flgzX1d3PrsEIIlcG6k3A82jB7zR562qgRx6SWysWXKrhdaPJPrEE+K7TnLCdIqGnLZi8wxPmvzFJKH3zpejI9oQA7ouLiO568/eWa2MvcKElymLmH2Ed3B5DrJqRE1M63kQ7lMGAmc4pengdMDpiX0nL5A7LOdCBkK5NkofeRoiRa1wcNuET92eTGHYUfEIieiASK47OSYvPVJpGUpEoJ7U1FOVdaCPRr+nTrYZKORxhz95cDu7QzGh0XlEEnTOjTJPWTho7EVT/WL6R/3f81GB0h7AW0f5otgquXQYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56AlAnVFNrxGjZYVv/9WmajqajlOWXHvrlAxppFrpD4=;
 b=MP+vX26rjEMe0xq1mpbwe7l+4oxi6zsMP/n8+9XUmodq4X2d8hWjAS/7YEfuNGOvomdJoR4nKn4AstBzPw1oXSSHUxuvI5+XjBlCMdIpuxa3Gng6GCvCfpR2pRGJ/1Z//XDR45I/qjXPVX0h1LIs9AFD6d50Rc8nQOxigy+AyIE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3446.namprd11.prod.outlook.com (2603:10b6:a03:1a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 8 Mar
 2021 14:07:03 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:07:03 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-yamlloader: update to 1.0.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210307162451.974014-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3fc60db1-94c1-f43c-e64c-74887fbe4f6d@windriver.com>
Date: Mon, 8 Mar 2021 09:07:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210307162451.974014-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN8PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:408:70::38) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN8PR04CA0025.namprd04.prod.outlook.com (2603:10b6:408:70::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:07:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a06a3740-e33e-425c-614a-08d8e23b72dc
X-MS-TrafficTypeDiagnostic: BYAPR11MB3446:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB34465BBEB974322C87E77CCA9F939@BYAPR11MB3446.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9mV75BUboj1AlE0W2XOMzWQdiym19yWG15lTjRVomU3HluzJVPMO1HIEpUALDLuKUsuz43yvilRUr+xajoza/tVVn2NjChbpOhB2oRmlZu0IS73piMJhD8Xj+g41w3WtlYBXkvrX2xEgp2FfGup5FlZ9sfVRoY38Zf2w9W3uRxjs3hLXSU6vZBGfI6Ag87v+wFN88tsZGFuv1exkNGxRjbjfkl6KcwVf/9cFmLwLDoCmSc5y7M8x5uMtrurrDkhy6MziF5KjI3MIqdb/BYLtGMKVOWI4WX6mlxwO2z6fJsYpPVf6mzXuFXmfOzUzc7nb2k13FxX/rBilKB7e72Sq9i6CCioLioH3pPN0cRbYQFsWkKJqw/jO4dJmM9Ri17hFfSxVyWNLp0s8Wi5fh8BpWA97hqsYZ6BIN2uEwSe4WKc7+ngDWB0ZC1nUgamhNupBXiTUoXBsXtg3dGecWzKbbSHgdd2jH1vN4xaipISqmptdzxhX4MksmqIN5md/Nqy+L9HhLBpYSm0uze/0o6mAyJOBMlEv7N0LFwlgLj+k7GwQsyq16AwpLnndDaNgcQHugTthMy2yHbCDU4Fh4y9qcHch35oVAeSBmciuHPC/p/HiTtVCMp6OvvWD+XEsG5b5q7PXTO8MDasiovcWW31AXUutJILN4WkrZSxOuVRPl7UPREtY/DmNKyNbD6LQHpkt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39850400004)(396003)(376002)(53546011)(478600001)(26005)(6486002)(15650500001)(31686004)(31696002)(166002)(2906002)(66476007)(966005)(5660300002)(316002)(66946007)(86362001)(8936002)(44832011)(83380400001)(16576012)(8676002)(956004)(186003)(2616005)(33964004)(36756003)(66556008)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bWRvdkZSUzVONHFyS1VUdGwxeW1OOHNRaXZ5dHJwL0FPZ3B2MW12ekhhcGxV?=
 =?utf-8?B?UWVIOEM1WXltNFhVQjRETnk0STZXRVdNclIrclU1akV1OXNmdWp1Z2NtT2JJ?=
 =?utf-8?B?bHdzWFgxRk1CbytNZGNmcUw4REQ3cy9pUlN5OHBoMHl5a210eUVNL0VHRVJn?=
 =?utf-8?B?cVcyb0tHbE5EbzNxVldUK050aGxSMEVYNlRySHN5Q0tjNnBqd2NDY0lZUGN4?=
 =?utf-8?B?WXIwakhlMEhCRlRRQVhwWWc0U21WeVgzSDJaUXp1QjdHV2NXZndYQWJFQ0xy?=
 =?utf-8?B?cWNiOEQrcmJrdkNLektUVDZpZFNwYkpKeExPcjJrcGZBNHgzaXZ1NFByU25t?=
 =?utf-8?B?b252Q0lsSmVQdXpMZW90VHljdkQ2ZVpOdVBZTzVHYmRwMmkzQm5zUkxkT3dU?=
 =?utf-8?B?di9KcFkzZ1ZtQ3Z6V1Q1eXBMU3c0cHVWb29vRW1IUHl4enJuTzNtVGFJbUsy?=
 =?utf-8?B?ZFU4TDNVdG5Jd25EM1I2N0ZJOEMyMUpLYXpNc0xCRExHOXd4ZTR6U0ZBM1hm?=
 =?utf-8?B?K0pCVUZUSnNNdUtydmxWemg5ZnVaaFZMaDh5TFRVUmZEaUc5WG1DWDB0TGlG?=
 =?utf-8?B?NzUrUHdCeGZLaVRmUUwwVG94aFhmVlA4bVEwY3V1dDhKRzRiYXI2Nm1KdU1C?=
 =?utf-8?B?aVFROWFndzlzOVAvTXMwZCthWWhPN3pydWluaExuL1RHanNsWldjTGRRRGhQ?=
 =?utf-8?B?cUx4R3NFOXFBTUMyL2E5a2Y5QVZCR1RsNk96OG5tNDllR2ZLZ3RuaGlXNEhC?=
 =?utf-8?B?UmZERmhIRk9Ld3RoTmNzb0ZHNjJ4eVVockY5aWFSckRLUGh2VGlocE5PbSt1?=
 =?utf-8?B?ZnBzTFdoNHZBZFh5NmVkNTRLQ1h1QlkrRTFiQzRsbEpndHAwbkhxcUFXVHJy?=
 =?utf-8?B?QlNjS1VpZXF1WU82dkUwTTRVR2dxS1BycWhiMUEzLzdRZGtPZ2VQRDk0OXBS?=
 =?utf-8?B?R3hSWFhUbW5Sblc5Zk0vdHM2MVR3cStwVFBGcTA0Y2VkVDhjVncyQytCOFdI?=
 =?utf-8?B?SFd3WkZOMGNQTVFxdjByL2Vpc0szOGVud2pSTU01WG1lWjhTeXlZVDdnaFRp?=
 =?utf-8?B?TnhyRmlSWXZMMDRFak95MjRPRkpBdDdTbGEydGdneW5rUVljYmhKR2UvKyth?=
 =?utf-8?B?MGlzV2Juc2plWGh0NlpNMzdpNm56L2ZLaHlxMlRVcEQ4MFdNYnlhSW51Z0pS?=
 =?utf-8?B?dkwrWmVaZUNiNGhZRHlhbWV0QzRBUmVZN0U0cXA3Nm40ays5bXhBSGREOVZk?=
 =?utf-8?B?NDdoVTlHSzNrZTNnZ2EwQUJHREhjaFhPUHlvWHFtK2RiRTZ2dWhUZHdZZjdL?=
 =?utf-8?B?R25lcjdRWXJPejRTQWtkbWwxM0g1TFVGZGtpaGEwTUMzMnBzbXAxWGdmWGNE?=
 =?utf-8?B?QXdPMHN3ODRBRXBWa05ZdXNtb3E2V29tSWhVbk9RWDFOZjU1M0NLTmpxRyta?=
 =?utf-8?B?dkZaS0dsQ1lkc2JoaktRc2NSY0NsQ2R4TmlPbFpIWTZvTEd0VS96V2xHYlBv?=
 =?utf-8?B?UXlqWFd2bUNGcDNaek5sMXZZYi9UNjQ3RlN4eFJlZEU0WGdwbGl1Uy9oM1Ns?=
 =?utf-8?B?bDEvTC9xWHJQWXpxV09mOGZPYjBWZ1JIWEtXY2dqdmNqZmUwaEpGb3FSM2c2?=
 =?utf-8?B?cXpjRWt3ejBEOUF4NzB2RUFRSnZMWWc5dkZhdE5JM2J4Ym5YaFptdjV1RkVT?=
 =?utf-8?B?V2hXTjJURVRXdDRGaU91M1RSNStHNjlYaitCbmJScUd4U1Vnb21Zc04vNFIv?=
 =?utf-8?Q?SdB3CuRbkxmPMVu6+4FUX6Q5E2V3h36gRoY5x7y?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a06a3740-e33e-425c-614a-08d8e23b72dc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:07:03.5016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2g5nYiGYmSssXmhbZk04hM26lawgeiZXBp/v8+Ls6Mg0nufwgMqVizfEav/k1YEahnbBjJuGoD9rKNJSD7wWr3ljQQzsaOcSJyjzdildRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3446
Content-Type: multipart/alternative;
 boundary="------------5061D311A1A7058C0A642FC8"
Content-Language: en-US

--------------5061D311A1A7058C0A642FC8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-07 11:24 a.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-yamlloader_0.5.5.bb => python3-yamlloader_1.0.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-yamlloader_0.5.5.bb => python3-yamlloader_1.0.0.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
> rename to meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
> index dbf84d413..a2483a6f4 100644
> --- a/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/Phynix/yamlloader"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e"
>
> -SRC_URI[md5sum] = "2e0750ace81235f750c072833d79c4c3"
> -SRC_URI[sha256sum] = "dcab5f16b39bb03d10dda4cd4f30c943675ec4c7771807fc67e7f1bb319bf4c8"
> +SRC_URI[sha256sum] = "e96dc3dc6895d814c330c054c966d993fc81ef1dbf5a30a4bdafeb256359e058"
>
>   inherit pypi setuptools3
>
> --
> 2.25.1
>
>
> 
>

--------------5061D311A1A7058C0A642FC8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-07 11:24 a.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210307162451.974014-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210307162451.974014-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-yamlloader_0.5.5.bb =&gt; python3-yamlloader_1.0.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yamlloader_0.5.5.bb =&gt; python3-yamlloader_1.0.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
rename to meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
index dbf84d413..a2483a6f4 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/Phynix/yamlloader">&quot;https://github.com/Phynix/yamlloader&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e">&quot;file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e&quot;</a>

-SRC_URI[md5sum] = &quot;2e0750ace81235f750c072833d79c4c3&quot;
-SRC_URI[sha256sum] = &quot;dcab5f16b39bb03d10dda4cd4f30c943675ec4c7771807fc67e7f1bb319bf4c8&quot;
+SRC_URI[sha256sum] = &quot;e96dc3dc6895d814c330c054c966d993fc81ef1dbf5a30a4bdafeb256359e058&quot;

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

--------------5061D311A1A7058C0A642FC8--
