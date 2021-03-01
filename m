Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.71])
 by mx.groups.io with SMTP id smtpd.web11.1050.1614620983932704793
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 09:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bp5w/zZH;
 spf=pass (domain: windriver.com, ip: 40.107.244.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVCEpP6BFA1P0lTyTDE0j6iWE6uI4nFYbRTDpVU4PyOO2HYMWCV0muPjeawm6L6Qq3tLOZyGBoIlQHp1r/aFv/Dtqyi2rKvIbBZsQGtZvEIkB9mcUmYXTpU2g2EroKE0AWLflZn17U3hHZ0RlKZdMio5nxtLxxRxQcmSl5pbzrZCkeprPhNda75KMkZXdUnC3lrfcPwB6wBadoI2Z4Q77dIgwqD4yB47Wm/iSVZzwtWgNgNzuW6McKbbjCNw0ssCrPM3eTcWf9WYZXmjQJ8QH742C2MGmdrCms96yL5N5OTm2UnLIbJZ30YPXJR2mAFWNt6mpCppYX4BvrxKii7ccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlcW1m6raOEdgzyHL9KIgMlWudBhVoO2Tc5w60VmaEo=;
 b=KLMjATBL5ltp14lOYlzbN1k3alfFcTNrEX2hJHHa1BwIXU6K0zwNtURHKuEWsZP0L2+S22jTV6bRdZwivGfe3t8kPHzxS5G+kOjS2aysKoNa5m+zmBH2ZON4vNCOrlr+wabgKE5CXHXWxoCJZyDOz3XsGaQoJ2wMszrEpdrg712/qFCwweERsorJJJdwpzvw0LQTTK++Tuh6FxGM7L39urKu+xOAYnaFWrJvs1yUD28KYoc8gpBCO6cCS/1L+RJkeutaPa184GKGfo7LpHPMAw4N30w12E8gjdV1M/2dBS+nfjTCmisD07C87AuJn/mTW2URntUh3hjjnshdM6wSwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlcW1m6raOEdgzyHL9KIgMlWudBhVoO2Tc5w60VmaEo=;
 b=bp5w/zZHV6mXKVAs/3vmIuw40UOT/gVvvD+t9qMmGpS+DontssmjgfFh1xRWQDwpkxIImVNeUtd9ev+JFRr6hKyiKrMP6Cgvo3wIOZSHQzwWh1myqaNJr9gfZGOawnXWKUlpFQWuuizJhqtwaKNF8PrVHRXKXcud8cZJ0UeRT6Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3765.namprd11.prod.outlook.com (2603:10b6:a03:f6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 17:49:42 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 17:49:42 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-markdown: Upgrade 3.3.3 -> 3.3.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210225160544.8994-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <881e564b-66b8-f69e-3d3e-265ed8919024@windriver.com>
Date: Mon, 1 Mar 2021 12:49:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210225160544.8994-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR15CA0061.namprd15.prod.outlook.com
 (2603:10b6:208:237::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR15CA0061.namprd15.prod.outlook.com (2603:10b6:208:237::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend Transport; Mon, 1 Mar 2021 17:49:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bea51a9-c999-4d05-57fa-08d8dcda64cb
X-MS-TrafficTypeDiagnostic: BYAPR11MB3765:
X-MS-Exchange-MinimumUrlDomainAge: openembedded.org#6614
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB376504BBF2FD4A38CBD26D6C9F9A9@BYAPR11MB3765.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dJSK+skzm8gbpXSh9/hVPzoBjV1lviOLQE23qSDoweGKJTEcw/bC4nngV+SBfCar07YFnnP1uZN3e2x3wDf7oGagjYa36q3lbk1TAeXVmaDwI87zghyKpPcxb4WqNXl+MgoMZR5xK+Xw70c1dFDdgdMeTU74RyLJFjB+y7g/asGLFfeZfQyaw54Uz1L7ZHBLBIO3STqiVYOfPN1ibEzXOal3N7JynevTJ+6xFJyGwf3Kc9fimtAyP/UXbd2VNzxBdEPaw8k4PLWhcmfKnsa2GFwvY4csB8CBo8g4ny2pC+FNR8k0Yvov0C921NJE3PVRV+tTIVdP9FAEc3XcoDG5sGeqRWYcqCFchYRpOhJ/8sYIAFHxnyJC7Q42FtG/X/HaL9IyOJT3X7eVn4HBLKopyjr1Jmbiw71hoxW2FfFVPOH7l969ceoxSYUMvwRYFClUuPrgbrzYoA19J8XGSQNaqB5z5Oqq5ZcpD1lqBhF8njvCvMr5CR3AUxE0836sN88yfB9P3UHIK9zdae5bVRzC6Bp1SpGLsd0NwV1x/NK2kYt+bdhRS3eE3eq4kLH51NeRFKWQJgSb455gRLJxtrOA0HMPbSKHwBNxRcgtm+SX0uXlSYiw65kaZeK7mcYzDl/XNnz06rMXMfNlRKLsRYzX3ux1VIY93t/WxHxas9KXhInpeiH/xJDV5IPpC9hLekxK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(956004)(31686004)(26005)(186003)(66946007)(44832011)(36756003)(2616005)(86362001)(6486002)(2906002)(16526019)(478600001)(6666004)(966005)(31696002)(66556008)(16576012)(5660300002)(316002)(83380400001)(66476007)(53546011)(8676002)(166002)(33964004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TnhyNjV1OVQ3dGZRamFJeVlJN3I4SURwRXk1b1VHVnlUVUNHcXBMRlhOT0pz?=
 =?utf-8?B?TkVlc3hqeElQc1VDdUc1aW93Z01sSUNvS3FKSlJCT0RtMGtwKzZHZEZyOHBu?=
 =?utf-8?B?MkVvbmxCM0R0Wll6ME9YUUhxYVZSUE84azZFem8yZmo5dFU0d0JWUnJuUkVz?=
 =?utf-8?B?cFUwdCtyNjlqOUNjWTU3dVEzdXFraFJVY1UxR3FDWEhLVHNncUxURnBGL3FT?=
 =?utf-8?B?MnJ4TXIxaVdZYlRXdGRHK20wVFVWYnFacFZOUlAvaUtibGFsa1ZqUGlkTWdI?=
 =?utf-8?B?aWJnejlYcTNQUVFDMXVLeitYUjllMkNpenc0cGJENC9SR1lFOHNaNk4zMzE0?=
 =?utf-8?B?Q3RRVFcyRVBQSmxjWFJmU2d5bkYwQmVYS25PQU5SeEhhaEh1OUlYcG8rek96?=
 =?utf-8?B?V3pWSTFmYWxmaWdkUEt3L00wY2EyZG1GeWVIbkszRWJOUHN2dS9odzd2WGZH?=
 =?utf-8?B?YmdIWDFtNEw5ZisydE5NVm0xSXBTWitublpRWmtDQXB1eFk1bm1kNmxrQjZi?=
 =?utf-8?B?aWxBZWdRUjhVRmtxV1pxbUdpYlBycDFJZzBVSGo5NnV1QkdYSS9XMzk1SVNI?=
 =?utf-8?B?NllmYWZaRnhzdjhkczJsbEwwVnJSeVN0K00xSkFSS0txaHhhbUhXaFA5cjdY?=
 =?utf-8?B?MGxvUktBSGhVUjRrMHNQSHI0aytqVnVaNjhlR3loeTVEOGF4NFhqS0Fyb0Nm?=
 =?utf-8?B?ZmVMc2MzdFhCZ1RhZ1ZXYXdqNWh3Q0F6ZE1ZRVUyUktsWVhaVm9rQmJYdXVu?=
 =?utf-8?B?cFFTT1d0SXZjanMvR0JDQmhFLzBPWFFjQUdnSks4K1NJakhSL1lZTzB6cnJH?=
 =?utf-8?B?OHE0Sit1M1pVcGtwbC82V0R2dTJqS2NXSVdOMmVmODhMNDRhVUUwUks2aSt3?=
 =?utf-8?B?NERzUnNReTBaZnhNWE1uMTh4RlF4WDBSM25jeVZRalBOV1FaYW1ncDB4bVNW?=
 =?utf-8?B?OWQ4dERvbWsra2xoZy9GV29rTnpmNUFLZERCcmFORDZzUWpDNk5JaUdmQjF2?=
 =?utf-8?B?ZmdTTmtsVkVBcVFqNVdZVVFVTFJ6WXgzaXpzZGc5TzFWVXhXZERZVU1mZTly?=
 =?utf-8?B?ZXBMQUlBcEtaNmt4VDJqcWZkTCtaUEJNOC9oRmJka3hYeGlOZTdkR2EyUk5J?=
 =?utf-8?B?TS9ZZjR4eUFoQTh4bFAxOFRtMzlXbWw0dGNKTVc3M24xNmRPS3pock83MFNY?=
 =?utf-8?B?eWJ4Rk9lQ1FxZnMyYlo0bEl1Q2o5c3lCUlp4S1NrOVNwY3V5KzdHQ1kyMVVu?=
 =?utf-8?B?WFM1dnBJOEQ4dVRIOWNhaUErTTcvMi9aSFQ3a21ta2tmODA4aU1PZ05tMGVh?=
 =?utf-8?B?T0N2Q3ZMMjlTb3h6QjZrS2Y3L042NmJrREQyWWZWM09XUXdTYjkxVDFoSWsz?=
 =?utf-8?B?NUo2Mlp3S1BjMzFNb3pkY3dxZWpuREI5V3doeHM0N1JUMmQ2WFNiOG9jSHdZ?=
 =?utf-8?B?T0tWeDVBaDdBb1Y4ZHZQVWphd3RwVkM2NEdreTZKTkVCYjFXdmpWWkhnS2Na?=
 =?utf-8?B?S3JsRXlXRm5oRUN0KzZaTHNwbnBpeE53T1JmeDNEVEUwUDZnQXNmUVdiR05Q?=
 =?utf-8?B?djFMdCt5WlNoMEVVN29OL0JpZllwVHlZSzhVSWhUVlgrU2tTbkk4Vy9zL1ZC?=
 =?utf-8?B?TVZXZHdmQUFDSnA0Y0lMbTdkQjdiTWJEbTNhdStFc2ZybTlYNHV4aC82aXBV?=
 =?utf-8?B?Mk9ETGQwN0YzUjZwVjB2cDZxQTNjZ3pQZ0srQm9IMTNLYjNIT1Fpd2owUm1Q?=
 =?utf-8?Q?sDyOI0bmi1Hye9zWuDRZaYZD4KMejIzB8pIZHNE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bea51a9-c999-4d05-57fa-08d8dcda64cb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:49:42.6633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmYO92sdIavEwvcOjSbFhoaCq5sAbjKao5F86mQEpW1OKBevwC0A/DeN6e3gKWbubAvYTly0E1fos1Zh+rsKfBtF168ZNOdLHaMbeGjuTpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3765
Content-Type: multipart/alternative;
 boundary="------------FD660AEE91EEFB52BD635AAD"
Content-Language: en-US

--------------FD660AEE91EEFB52BD635AAD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-25 11:05 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 3.3.4:
>
> - Properly parse unclosed tags in code spans
> - Properly parse processing instructions in md_in_html
> - Properly parse code spans in md_in_html
> - Preserve text immediately before an admonition
> - Simplified regex for HTML placeholders addressing
> - Ensure permalinks and ankorlinks are not restricted by toc_depth
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-markdown_3.3.3.bb => python3-markdown_3.3.4.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-markdown_3.3.3.bb => python3-markdown_3.3.4.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb b/meta-python/recipes-devtools/python/python3-markdown_3.3.4.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb
> rename to meta-python/recipes-devtools/python/python3-markdown_3.3.4.bb
> index 990544cf1b..b51e8eef17 100644
> --- a/meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-markdown_3.3.4.bb
> @@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
>   inherit pypi setuptools3
>
>   PYPI_PACKAGE = "Markdown"
> -SRC_URI[md5sum] = "034e3bccfde211d44b4a7a69cb290ba0"
> -SRC_URI[sha256sum] = "5d9f2b5ca24bc4c7a390d22323ca4bad200368612b5aaa7796babf971d2b2f18"
> +SRC_URI[sha256sum] = "31b5b491868dcc87d6c24b7e3d19a0d730d59d3e46f4eea6430a321bed387a49"
>
>   BBCLASSEXTEND = "native"
>
> --
> 2.17.1
>
>
> 
>

--------------FD660AEE91EEFB52BD635AAD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-25 11:05 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210225160544.8994-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 3.3.4:

- Properly parse unclosed tags in code spans
- Properly parse processing instructions in md_in_html
- Properly parse code spans in md_in_html
- Preserve text immediately before an admonition
- Simplified regex for HTML placeholders addressing
- Ensure permalinks and ankorlinks are not restricted by toc_depth

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210225160544.8994-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-markdown_3.3.3.bb =&gt; python3-markdown_3.3.4.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-markdown_3.3.3.bb =&gt; python3-markdown_3.3.4.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb b/meta-python/recipes-devtools/python/python3-markdown_3.3.4.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb
rename to meta-python/recipes-devtools/python/python3-markdown_3.3.4.bb
index 990544cf1b..b51e8eef17 100644
--- a/meta-python/recipes-devtools/python/python3-markdown_3.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown_3.3.4.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed">&quot;file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed&quot;</a>
 inherit pypi setuptools3

 PYPI_PACKAGE = &quot;Markdown&quot;
-SRC_URI[md5sum] = &quot;034e3bccfde211d44b4a7a69cb290ba0&quot;
-SRC_URI[sha256sum] = &quot;5d9f2b5ca24bc4c7a390d22323ca4bad200368612b5aaa7796babf971d2b2f18&quot;
+SRC_URI[sha256sum] = &quot;31b5b491868dcc87d6c24b7e3d19a0d730d59d3e46f4eea6430a321bed387a49&quot;

 BBCLASSEXTEND = &quot;native&quot;

--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------FD660AEE91EEFB52BD635AAD--
