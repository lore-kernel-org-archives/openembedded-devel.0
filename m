Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.62])
 by mx.groups.io with SMTP id smtpd.web11.1043.1614620947956018253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 09:49:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nx3QLX5e;
 spf=pass (domain: windriver.com, ip: 40.107.244.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gASfx5l8ZyiefuilykKqd4tV1D9MkjSuGHGEapyrewOZ2UWYaDpHiZWk/9h2GWNGvPxbCv+OKoQjMaxkesAD8aoSRxEunmDfnbiTRNvPMG4jjcJnl9M0q8mFyU6i8/IZu9MajWNmLNZODJ/j2/i4mlrMHIK/Y8n3B5gCzGNiLcCaW2Bt+trR6ihLR2458VU0WmN3oKCE0B3x/YcnXlOEMyZyH6BqaRdqzV9sX35mdaDnTLQbrohq7iZWCprBNrdw1ebF6pan01+VGrVsBa8bsL47Ud47v2eSvtGHozGbdhokxtHWa7he/7Yi13Ns7EGYvp0kh3sceaxtMrfXpTAyYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXyVKDuQuwDshgQO1ciVA+GzzSjQC5tGLVW3YAc3seM=;
 b=abdw4mScNQi40PP5qsy5r+IkheDuG8hu5BcmdufqIwBqhrusP6NACuub/hHNoY8NUXJhE/KkbiGexOtIv4kPSy77tjg3izZAmfxBoQC352BUZfK0VivV3JS2133tZJQk8771xXi8D7gNWMugrxN+/8p5bzDxjirVg4T/mK3tC+3qKxbZjh+ORQd0o78ETUDiC4BzMjOtF3RlftTRbPXfqt6K0Dzgio2iGKavxfjJTEyK+7BCtqvYvPMhh6LHgoTx13C28Jnk/bmdJHluEIQ7vpAHJzP6U1ak/DJLvHnxdpY8qywfjMrC7K2Eh+pDw2m09J93kFmI/3KDAWfpnHuJmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXyVKDuQuwDshgQO1ciVA+GzzSjQC5tGLVW3YAc3seM=;
 b=nx3QLX5eITGE2gtpit6oovI8NZ5d8eSTLVAZ+Tg66/uN62wX3fqRsb41HolAzrSlvIBfFWcypxu53e0Jer/gTaXTvjSfU6Ab0C39JpbwHzmwI8VMgVvdwpxxSIeYP9QF1o8uaPHzs9ppfQe02AYhBDoc2ogZVScJKcoQ6hw045w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3765.namprd11.prod.outlook.com (2603:10b6:a03:f6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 17:49:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 17:49:05 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-pymisp: Upgrade 2.4.137.3 -> 2.4.138
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210224112512.31406-1-leon.anavi@konsulko.com>
 <20210224112512.31406-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <36bb6fb8-0777-9b5d-6ad4-6b05899a6c1e@windriver.com>
Date: Mon, 1 Mar 2021 12:49:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210224112512.31406-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR15CA0043.namprd15.prod.outlook.com
 (2603:10b6:208:237::12) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR15CA0043.namprd15.prod.outlook.com (2603:10b6:208:237::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 17:49:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40635fc2-e15d-4216-3d09-08d8dcda4e87
X-MS-TrafficTypeDiagnostic: BYAPR11MB3765:
X-MS-Exchange-MinimumUrlDomainAge: openembedded.org#6614
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB37654A2FE501BC5F9FEC71B09F9A9@BYAPR11MB3765.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6/U9mMErI5w5TuBUMa7bN1e6rFxWegpX1nbECMS6ZBHtZ90QPRF1cl2asRBowJ6Kqgyq0oovbURWN+/M7mfE6d2n2rRKRL37H/YW7fKk3fjWGoe4oavJk84YlBq7kf2vEGl7hcWfxc6f6VZ49BNOhUpw657Wx3dkDuwupiVmbcbtIHyybDKjoahefLjKdeIXXOgYg9waf8MusUUOrCcwadj3/xoJlFpb2KxISDd12/NTeE8s+E9FbEZtpv0BsJxxK+BubdsUQCj7X/I6h2+DinxjH9Q7wJBORKnQCWyOPsJer3UUFNS3+VZ1UBwQ/fs+ZRLIx0h87MlN2tpZfHbeo657+I6wInGowDckFTx+oobtoKChBrwYS8rIzWforRx2WNNSnOjkFOqVMxU6nkee97kiIAwkzrsGecyNLuz8xPliGgacKDUSwuTYvHM/Jn9VqGdGG43msZI7xETg61oHh0IcV6UpCnGwXFTKX3407A5h12A4LWuxhkBsGv5fRNBlrQumTT21MWEcL3nFZa4kk6XtoQgTgpFOZNt61HNvXF5FTHAxX/d47YsnKowneWfQEkcVpHXp9/imr4lzPp5/cOjZysh+rExzN1cAZorU340rdlKrH1i/7fJBAcaFtYaRy/xPZjJIaMg7MgUVtnMlJWlK18Si51Zc+yV6FcqJH3NXlydUfnLUA9qeIL8Ef2M1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(956004)(31686004)(26005)(186003)(66946007)(44832011)(36756003)(2616005)(86362001)(6486002)(2906002)(16526019)(478600001)(966005)(31696002)(66556008)(16576012)(5660300002)(316002)(83380400001)(66476007)(53546011)(8676002)(166002)(33964004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?d3JpVVVkV3lyNXgyK2cyUG0zUWhxRGtQeGFiMzgvVXN2NVJPOTZXeHhRUWlU?=
 =?utf-8?B?RVRjY1ZBSE5mbitFR3BwRlpuWWhPUDc0UHplWWJKaGdVRzIrOFp0U0tYaVRx?=
 =?utf-8?B?K3lsaXJMZHdIQitMcTlnbUJkZXROdENwZStrOTNIc0FKbmhlMGxlQVZBc2lL?=
 =?utf-8?B?OGc5cldWbWZub0E1S1dkQUx4ZFViMHZTM2RMaDNrQTBCZWh5L1dxL3VNWTho?=
 =?utf-8?B?OUV6VlcyeWx0SkhvT1pqeWM2bW5IMlV5cGhHTXJGaFNqK2VMcGxnTGttMmxI?=
 =?utf-8?B?Z3ZOb2I0WGo3L3JxNEFLTitOYTVsSzlpZ1BIbkptWVp4R2ZIQXJlY0ZpVWpT?=
 =?utf-8?B?blg4L3oxa0dlNjB0N3NkVHVnODhXODdmcXZyWnArMVZJZVRPdEJ3RGxoSFVL?=
 =?utf-8?B?R1JQTzNZMkg4cndCVDVKMWhsK0QxOHdINi9NUEk4dGgwMVhoVXZjMmVYKzJL?=
 =?utf-8?B?cTh6RUUxWEtMOE5CMmIxMmRjRVpWOENGNFFla3NHNExIUURnVk1XVFNWM05X?=
 =?utf-8?B?U2xBdUhOZmF3UDlNQjYyZEJHcTMrbUkvdTNMMU8wUjI3QWdOQmpNMXU3OHoz?=
 =?utf-8?B?U0VQMk0zMU1maXdEZVA4VFJEWVZmWTQyNEFpbW1XaHZxcjNpdXJ4dVpITFhu?=
 =?utf-8?B?TElUTWJXcGhBeUN4cjVHdjVqQ1NtN2grMGNQdXAwRjFadTFHdEExQmMwVkpH?=
 =?utf-8?B?Z3B5QVV0dTN4WHVhaE4wbHpWbGhhNC9kL1IyNzRFcDhzbnQrZVRabjBHdldM?=
 =?utf-8?B?RUVtZnRQZnFuR3RSNVdyODBXK241QndBc1lRMUV3SWNuNEgxYXJ4V3JtK2tz?=
 =?utf-8?B?Z21BRnR4MmdjL1NIRFNYbUh6dkdCaGNvWmsrek92eTRQcjJFV2w3VUsycG1k?=
 =?utf-8?B?Q0pZc2wwQkQyTmpodmtrODBaU0pid2ExZThUd3c2R0lvWTBwWGZnZ3ZRUlUv?=
 =?utf-8?B?NDA2bTdubUtiTGF2MHNXbS9zMFFPMm81TGdOS2VRdGNYSUYxcWJpREtTc2tL?=
 =?utf-8?B?QUJpV1h2Rzg3bE4xZFJNcXd3TVF2MzFycVlUcUhuZURtcENldWl6ODltQndt?=
 =?utf-8?B?a2NlczhMSHVIYm5oUW16V0pMMllQZjZwdlJEanIxc3VmbmdFWFFlb04rNHZB?=
 =?utf-8?B?V3AxYWFodDVqM1ZlQ2VwMWVJcFN0U2c0M01rLzNuYkxkaVVDSlhjblNGam9z?=
 =?utf-8?B?bGxNTC9qdTJxdVQvSE9ndEpsekN0VkJ0RkpyOWRRTEducFRQODFvV3FZZ3Fw?=
 =?utf-8?B?R0liVFh2eGU5NWVuVzFoTG5KYy9taGlqQ0pTZm9obDlUOXNBOVNtc0FFcVN6?=
 =?utf-8?B?UjU0VnBZQjIybTcxSFRSeXBTSk5SdWVONkYwazlrWGllakdnQ05pU2FuWDJm?=
 =?utf-8?B?SUNrbi93THJYSEpZT0Z6bytZUkJNZkhjSlBIMFpDTU5nUmlCV0pkaVlWWmVW?=
 =?utf-8?B?a0hPTkNmcTFLQmVybEliQ1daaFl0aGdvMHMzNFNSL0tqOHF0VzA3M1ZrR0V3?=
 =?utf-8?B?Ny96YzJsQXdDWVVDYVkxMk00UzRXV1NVOVFCTysvdUNXN0wwRnV2Q1hLdXBk?=
 =?utf-8?B?dWl0c0R6UHlsYmFLRS80YXRPNDlRTndlZ3dlYVRXRmFIa3R1Nkk4Z0RuQjRC?=
 =?utf-8?B?LzMxMUY5cmIzT3BOSm5pN2xmVzUxZ09SQWI4aWdQemdxaFVvaWplaU16SzR3?=
 =?utf-8?B?b1RadUgzN2Q2QXF4MHBlTmdzM2lWUGsxTUpYYlR2OHNGRExJWjQxdDVia0Zs?=
 =?utf-8?Q?qnHYa5U1DkzyiEHUHFJgm8pjQzEZGBBr7Z5ETDJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40635fc2-e15d-4216-3d09-08d8dcda4e87
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:49:05.3211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWNu7I8709n6w6QlRjisDuXP0FHWXfEb/wnZaQybmHEStFjRqTrmSgZAV4ilhGo1NYe4adK2AbglxYyMbtjrUFs4ZgViu+jEhb5GjS/NwTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3765
Content-Type: multipart/alternative;
 boundary="------------C7C31DE61FEE01E674C371BC"
Content-Language: en-US

--------------C7C31DE61FEE01E674C371BC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-24 6:25 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.4.138:
>
> - Bump version
> - Bump deps
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-pymisp_2.4.137.3.bb => python3-pymisp_2.4.138.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.137.3.bb => python3-pymisp_2.4.138.bb} (82%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb
> similarity index 82%
> rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb
> rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb
> index e363729fd8..eb7bea8348 100644
> --- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb
> @@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
>
>   SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
> -SRCREV = "f675e2096182532bb5870e4f773476b2d8065986"
> +SRCREV = "9316420dc028a1ffc541986fc08793e669f2165e"
>   S = "${WORKDIR}/git"
>
>   inherit setuptools3
> @@ -18,5 +18,5 @@ RDEPENDS_${PN} += " \
>   "
>
>   # Fixes: python3-pymisp requires /bin/bash, but no
> -# providers found in RDEPENDS_python3-pymisp? [file-rdep
> +# providers found in RDEPENDS_python3-pymisp? [file-rdep]
>   RDEPENDS_${PN} += "bash"
> --
> 2.17.1
>
>
> 
>

--------------C7C31DE61FEE01E674C371BC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-24 6:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210224112512.31406-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.4.138:

- Bump version
- Bump deps

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210224112512.31406-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-pymisp_2.4.137.3.bb =&gt; python3-pymisp_2.4.138.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.137.3.bb =&gt; python3-pymisp_2.4.138.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb
index e363729fd8..eb7bea8348 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb
@@ -4,7 +4,7 @@ LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20">&quot;file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20&quot;</a>

 SRC_URI = &quot;git://github.com/MISP/PyMISP.git;protocol=https;branch=main&quot;
-SRCREV = &quot;f675e2096182532bb5870e4f773476b2d8065986&quot;
+SRCREV = &quot;9316420dc028a1ffc541986fc08793e669f2165e&quot;
 S = &quot;${WORKDIR}/git&quot;

 inherit setuptools3
@@ -18,5 +18,5 @@ RDEPENDS_${PN} += &quot; \
 &quot;

 # Fixes: python3-pymisp requires /bin/bash, but no
-# providers found in RDEPENDS_python3-pymisp? [file-rdep
+# providers found in RDEPENDS_python3-pymisp? [file-rdep]
 RDEPENDS_${PN} += &quot;bash&quot;
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

--------------C7C31DE61FEE01E674C371BC--
