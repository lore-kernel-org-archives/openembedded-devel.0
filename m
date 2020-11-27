Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.85])
 by mx.groups.io with SMTP id smtpd.web12.19130.1606484921981610248
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 05:48:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HhcsGsHy;
 spf=pass (domain: windriver.com, ip: 40.107.92.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jun8+QvjnQIdxWPIGA5Jdtl0aah90YimwI4wYLHx41+MiSXaXScXIWzgJkdNzJJBsQ4ESf/02knNqoHFIckArqAamEx+bGK8kORIGPxoyXbH9QQRXBBxaVfMcSOWEHy+rWIq9mdji03q4Fh28FnLw9g1RhCOmBQt8GlQCXH5KYUsKESkaj0xAGKV7BbifQ+uCSpyDDiWmGShvraQwN8lJtGUU2zjQsoJCsbmrQXwTRWRTDqWocYKlI6mNiioNQC9JLoAlm07FwOrgKkyzXfsrj2PKja+dF5GJ+ah1Li9VREjqrMYu73z+DHoeFQrPxmX0mVJG1/N3tRfgutwDMDMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XqVwv/DGq2BEcYXdbLDs9x1MgE1s6stUiJ94+NB6B4=;
 b=UazVzLuI8J3Yux0sUClSjxtvrt6KyEMwFwiFgk3bqL5zvWStWHpSnmoHkXvUB91adJedGtY7UAarUnhTsgKSACmtZ0yHEkv4pAsvgTiYl9PTbYqldpfX2o0nfmJlsh26g10fzjqnK4WDQNlJ+HNpfzAY76p8JbfZF5OlCXuGbUXdGhPNa5e7VQCj7X6ke9lrHamOzd3mRSFmYgQKL5CFpXpp1AS5qvu0tiqGWOJ0nXtcbQHC1Ozcf/KTo/TTy4CDKQnHd2LHr+DN1QKLbYGUAdtY/FuML/7QOF+Of1BmII65+ePSYB2qXKbQVbMEyXuky8qCa8F4uBvrKJJ0lmWRMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XqVwv/DGq2BEcYXdbLDs9x1MgE1s6stUiJ94+NB6B4=;
 b=HhcsGsHySXh3uDr1ZLC9wP/J+DDJAkMalaMRESrwjlFqmGRxSV11fHiyKc8Ju2bqA/MQo6h5GAYTbZzQtaQKzPfGTgzWwSk4aN/czoIl1J01ySLFYkMoTBhgVaq08gwok7YzaXINiiM2mr/d3fH7hxLdCsy34Fk8sHQ89DhiOhM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Fri, 27 Nov
 2020 13:48:40 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 13:48:40 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-fastnumbers: Upgrade 3.0.0 -> 3.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201126112215.11451-1-leon.anavi@konsulko.com>
 <20201126112215.11451-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b241f6b9-ac0a-6e02-c253-2bc956b081f3@windriver.com>
Date: Fri, 27 Nov 2020 08:48:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201126112215.11451-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0153.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0153.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 13:48:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eb433df-2ac7-4fda-4681-08d892db25e7
X-MS-TrafficTypeDiagnostic: BYAPR11MB2598:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2598A3A879B87E9BE9AF78E49FF80@BYAPR11MB2598.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v9fGIHNS8jAxiknEWGtZj4J0opWOCQMtvNeYPIK6XgIONHwRBFKl8mFlhuyaZ3pLwbD1+C1Vinz9RTZKEv6eiZHBtKZbsjHhRqTjFEeL4oRpeb97YX15PT+5Q004FWccqYJFnLuOniQ8IhVW+kpcWqfkAdrUCAz/b00lbXq2mCvBEcjk85DW5KWH7LELgBbBQLw+gBmgLshfN+yJcjbaCNlvp4G3XCp40dSsCWAP/c0XRyPot/SYxt9eRLu+ha/XRVZ/2GrRVGIjbQO4WehtEk4/A3fRx2ZutmacgCyO0t50/lYY/dFpY3rxb6KSZVhr+7r1oUOu025Ryd3z7UhyMrjUZQAZqzqc4yIo7nZMnSY+hVWY8JWQEO3tX3vati5T1RSXGmxuHR/LTbqFzlmQDaSwNaw/vWoGKCX55ZVH+RIa3j2sliIzrIXpharfGTE12734WFN5mwfdAKtXuToFEA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(136003)(366004)(346002)(396003)(186003)(2906002)(26005)(16526019)(52116002)(6486002)(8936002)(83380400001)(53546011)(478600001)(66946007)(33964004)(86362001)(966005)(5660300002)(2616005)(956004)(166002)(8676002)(316002)(31696002)(16576012)(4001150100001)(36756003)(66556008)(66476007)(31686004)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ckpidEtPOCtDVFdiK2Vub1pud01pZzg0L0pqdHRoMjdQQzZNMDY2TEhUZGZq?=
 =?utf-8?B?blJEUXpodHBRaGNucDNxR3FyNndXUXBycVZJV0NVZ0R1OElMUzRzOThDMVor?=
 =?utf-8?B?b2cwRmtUcDA1VG9tNU90NFJ6WlVLOHpPSkpMYW92MGY0akZVTytBQUNLak5U?=
 =?utf-8?B?UUxLTCtkOERpTC95K2hFdFdTQmJnZ2djNGVLYTVNVjN2R0Y3bWsyUUtvdmg5?=
 =?utf-8?B?R0U0UGM0SllTNmxJY2huU09BY0N2dHRBT05TaTRpNXRSOXpTb0VWNlZzWk1Y?=
 =?utf-8?B?RHlneEkvMEhSRkoyMmFNbUViSHUwaTZVYlRiK1l0NGc1RVdXMVdBOWFURklj?=
 =?utf-8?B?ZFZTak9RQ29oeEF2UXNkQmNMeGRYQVd5YUlub2llWGtqQzZuR3J5VEVZY1Zl?=
 =?utf-8?B?NWQ0V0ttMllCQ21sdXQ4d1VGc1huZVlNQ0dQdC9WdjJVSVl3d281Z1hRa0V0?=
 =?utf-8?B?ODJZdTR4NUhPZzF2c1g1TVR3SStHRDFmVkI0bStpVng3aVo5NjIrVnEyQVhk?=
 =?utf-8?B?MVFhZ3liK3k4N0k1eFdVVm4yMEJ6M0ZjYXlYNmNZdG5Zalpac2ppRThEZVRX?=
 =?utf-8?B?T1VyaDNiNVdMZ0swR0x5czBvZ1dhT1J3NXZSMG1NcjJRYkJHQXVtLzVqU0pP?=
 =?utf-8?B?K21iRGUrdHR3VjBoNmxMKzVsSXFqYUduREZtWW5zNVRzOU1PSUdxL0w4UHNm?=
 =?utf-8?B?VVBpS2ZhMzZjeDMzZVpnNDVIdnVlL0k1QzRrTk5GR1BOQjRYQTBucHFjS1N2?=
 =?utf-8?B?eFVIbXM0ZDFKNWVhc1poVVhEWmZLcmdrbTJ5MUkrbGRsWUY1UDhGQ3ZtT0ty?=
 =?utf-8?B?L2hlSTVqMWNkQUJzd0t5blloZHUxL0FIQW5YcVc3ZFhkTnJqTTl5cmtQSExI?=
 =?utf-8?B?aXpkUmpVL3dYSTRaeGlhYlhuM1htWjN3RjY1b24vYWtpRzBYQ2JzSktXOEpJ?=
 =?utf-8?B?SXIyWm0wdFJHUEExSWV5ZFNYMy9zVnpzVlMyVmVjYzNvcmxsNk9zalcrWHhS?=
 =?utf-8?B?eFUrNFFJQ0xmL2JYelNrUGM3UGxEQ3R5amVOcjJvWmlOZ1dWdUh3R2hXeVc3?=
 =?utf-8?B?K0hzR1owMmR1LzJXaFIwYUs2U0hzR2ExUE96VUZ1cW5lUkVtd1JUd0Q4T0Nn?=
 =?utf-8?B?Qk5oQk1xQ09nQVZTVnBSYUNNYmVCcGlMSW1wazIrR0FUMXBHWFBjbVNjbGg5?=
 =?utf-8?B?cThrRzFudlIrSEw4TnpzVE1tME9ZWHN4UmhsVjhkVkJocmYzY25FUVBjNUpF?=
 =?utf-8?B?bEtDUzc5Y254K3NaOGxqLzY4U0ViYTdlb3M4RUZPcXA5R1phdjU5RDhMay94?=
 =?utf-8?Q?q/C4v4b1lesDDKbpifEnx+I8yAXtaWUmaF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb433df-2ac7-4fda-4681-08d892db25e7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 13:48:40.5571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FU2MC6acgFydS6CNsp+v/vGA9ZwwaZwiMjj/nFlLJScdK7gIwR5tKlk8S4KCN3e+DhljGB6ISMWUTluCdXuxgWOnWp77KgFEG1eb3R9yHpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2598
Content-Type: multipart/alternative;
 boundary="------------B7B4130864DAD8C7953C7518"
Content-Language: en-US

--------------B7B4130864DAD8C7953C7518
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-26 6:22 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 3.1.0:
>
> - query_type function to determine what as type fastnumbers will
>    interpret a given input
> - Support for Python 3.9 (eliminate use of private Python C
>    function that is now hidden in 3.9)
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-fastnumbers_3.0.0.bb                |  9 ---------
>   .../python/python3-fastnumbers_3.1.0.bb                | 10 ++++++++++
>   2 files changed, 10 insertions(+), 9 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-fastnumbers_3.1.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
> deleted file mode 100644
> index b0ecb9d560..0000000000
> --- a/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -SUMMARY = "Super-fast and clean conversions to numbers."
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=f797665cf3d3e0fdc0d488f5200c6f55"
> -
> -PYPI_PACKAGE = "fastnumbers"
> -SRC_URI[sha256sum] = "93ce2f9516fbf2bbf46c85e4abef783cc569e5fbbc665352efb9cdddbae517ec"
> -
> -inherit pypi setuptools3
> diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_3.1.0.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_3.1.0.bb
> new file mode 100644
> index 0000000000..5c913ffef8
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-fastnumbers_3.1.0.bb
> @@ -0,0 +1,10 @@
> +SUMMARY = "Super-fast and clean conversions to numbers."
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517"
> +
> +PYPI_PACKAGE = "fastnumbers"
> +
> +SRC_URI[sha256sum] = "7cc4f96981ccd3cf212b6ea7b84ef621620b62da8b454f420aa2e81c8529e68f"
> +
> +inherit pypi setuptools3
> --
> 2.17.1
>
>
> 
>

--------------B7B4130864DAD8C7953C7518
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-26 6:22 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201126112215.11451-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 3.1.0:

- query_type function to determine what as type fastnumbers will
  interpret a given input
- Support for Python 3.9 (eliminate use of private Python C
  function that is now hidden in 3.9)

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201126112215.11451-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-fastnumbers_3.0.0.bb                |  9 ---------
 .../python/python3-fastnumbers_3.1.0.bb                | 10 ++++++++++
 2 files changed, 10 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-fastnumbers_3.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
deleted file mode 100644
index b0ecb9d560..0000000000
--- a/meta-python/recipes-devtools/python/python3-fastnumbers_3.0.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = &quot;Super-fast and clean conversions to numbers.&quot;
-SECTION = &quot;devel/python&quot;
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=f797665cf3d3e0fdc0d488f5200c6f55">&quot;file://LICENSE;md5=f797665cf3d3e0fdc0d488f5200c6f55&quot;</a>
-
-PYPI_PACKAGE = &quot;fastnumbers&quot;
-SRC_URI[sha256sum] = &quot;93ce2f9516fbf2bbf46c85e4abef783cc569e5fbbc665352efb9cdddbae517ec&quot;
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_3.1.0.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_3.1.0.bb
new file mode 100644
index 0000000000..5c913ffef8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fastnumbers_3.1.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = &quot;Super-fast and clean conversions to numbers.&quot;
+SECTION = &quot;devel/python&quot;
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517">&quot;file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517&quot;</a>
+
+PYPI_PACKAGE = &quot;fastnumbers&quot;
+
+SRC_URI[sha256sum] = &quot;7cc4f96981ccd3cf212b6ea7b84ef621620b62da8b454f420aa2e81c8529e68f&quot;
+
+inherit pypi setuptools3
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

--------------B7B4130864DAD8C7953C7518--
