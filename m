Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.66])
 by mx.groups.io with SMTP id smtpd.web12.1889.1610121796078457477
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:03:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kw5jI68a;
 spf=pass (domain: windriver.com, ip: 40.107.243.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIbVjCa450nOzl+yV4rFQEPwzDGLzC+fjoxl14GfGXHsI1D3GQEr0lL/DBwDdZ+XtQR3rPwhNDfnnUWd9CJx7HAbrQMo/aXldfF4yr2KR+2n6GVK7iq9VUgiiXlWLRORvHYw2VNPH6va/wkhn4RSpwZAidkKHGMk3+Kf7odP+irv0n6jVIviRsts/nIJC/f8ogOoEHUWLFNAeJqjvrFnonIr1STkPh0dh7IWtbBwkhuLwa1R5xyTpcHQLoZ97Y93ZRvvonVb0eYrnkfnSpdRybhGw3M8PuULdTs3iLJMewhFbPnY3MPZaPQ8ES191+/5i0E/IWZCWHbFrLCRdwjV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0+F+OIusnpfRrcBbiQUm2HKXmQzWBK4UKROw42qclo=;
 b=PLNrDWaj++MdUgBX99F2ISvV7a5Qe+QydOCb/+oEAQUCxNbldMLKr5ElwbeOvyVDlVEXMfCBsjWmmvPG3YEvgn8oDv4OBTfNUuZI7OeceuGUII8W4OMyPHlL/eOjtVY34BCnFG8xBGwkOH4JMJhOoVkqGMGfeHIyQpIB/jPvd0RCTUMSHNAuI4uNKhUzYzvKIE8jXFTEO3S0xtKYqTZXlrWUU+Er/fWse+OKRJJM+bhsiSIzGOvsPDTk4ktvueSV7zvJ3jc0IltZSEhxDJXFfy0ZcAmqTG2IBo8ZvgP/sPOR/MWx0GwbYQNfs206mCUxygTz3erqiLFjLxmVX7y6Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0+F+OIusnpfRrcBbiQUm2HKXmQzWBK4UKROw42qclo=;
 b=kw5jI68a8imQv6ox1O5o0IIz9n4tvrKhPldzuDWy8IzcAIyOGLi6aL91kahcPulYXiG0yo3UraaAoeiZYHfL/DtNpUcFIo99J/V9jjGJioPxEf9e8xi1vIVwFazH6q+guoWGhS0eq5rPVN7wg1Ham7y5742czIEB5RVSTTu3fVU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:03:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:03:15 +0000
Subject: Re: [oe] [meta-python][PATCH 05/10] python3-nocaselist: Upgrade 1.0.3 -> 1.0.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
 <20210105151638.15700-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <64cf0372-07f8-56c4-c8fc-3a9a6421c33e@windriver.com>
Date: Fri, 8 Jan 2021 11:03:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210105151638.15700-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR18CA0030.namprd18.prod.outlook.com
 (2603:10b6:208:23c::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR18CA0030.namprd18.prod.outlook.com (2603:10b6:208:23c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 16:03:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9faccbb-75c2-4be7-e54e-08d8b3eee822
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB489673C249D141A0203040579FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LlewHlwMh66sm041ox3BwEjVZCD9F776nItobD8ckL4qVBeRxtjPZyKIA8FX1kbdpUeCaF8Msupm08ZGdSfTh4ibMT9xBmJJj15LaG9acJapMODTe1wwYa6Z0VHzms2wzcFu/aHOhg2p1I2QiGi+SrUGX4pd0lv6gFdXJBclJWxdrlX81dAcPy3OxBgDVVZ0xh5/r9Z3fBcK84jZsgrdRPfqgD821yD7mfXlUa7s1islvuZOvqA0ezFWymocmsUBRl46zOgsUo6kUH8Zm1gKoM3JJH4Ae/JHeRUrCyrssT49kyGIqqw0O8rs3rIDKjECgIySgKteNTcl0wYmgBVWxEGvnn43JwVrlMI8HF9HTq+wu7SJuqsj1IK1PE44ivGkP5FRpsMtR1/v79BP4mMq6j1PDrfSlPYRdB51zeIILlZu8GfgP24S2M3UjwrtEKsqQj1Fy/97qwQsQ3ABO/SDGPR99MXoImgHnZBxGvjGl4Y4sz9vAyjNNZbXbDA8a/dKjdZuW/ySN1IPpDeLgJKVjEK8D9AWe1oBYNprtPHMqk0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SWZtUmhCR0ZxbVFWNjM0c2IxSGJjMjg1K2RMcEV2OEFvQk5JTDNSVm4zLzFD?=
 =?utf-8?B?bk4zV3RkeEk5YndlWkx6VXd6aU1MY1NrRCtaZm1KUWxyai93cnNmRTZ3Ujkx?=
 =?utf-8?B?UWlYZS9VeGNpU3ZSaGdLdW9GNmJRNEpHUkRVMy8yQnFqSDBLeWZIbUhMZFV1?=
 =?utf-8?B?VytGZUV1UTUvbjgxYWdQM2JMbEFncGlvdUQ0bWRYclJiT1BKaXMzSWZ1eTdt?=
 =?utf-8?B?WEIwSlRVNHVqVmRGd2xWY2FvZWRKZWdFbEErKzJJd2pZVEc1a2ZrUll2MGFu?=
 =?utf-8?B?eWJCT1RicTY4blNmSVYxeUlONUhIOFE3WnV6bkw2ZUdkN0xjaENRU2FQYUpV?=
 =?utf-8?B?eHYybkRaUmNlampGeUp6UUNBZVF3eEpvK3lyNFR3TmdOZ283dVdQOGwreXYy?=
 =?utf-8?B?YmhwZGxnUGJsZDM3T2RVRUJ5SGhIeG1MUjZCS2g1Q0I2QXFjeWlEWE9CUWNE?=
 =?utf-8?B?V2tUMkd1N3hOS1NmV1UyNllteG91WUEzaGgzNkxsOHZZSGI3TEpoenREeXE4?=
 =?utf-8?B?Tzg1QnhhNXJxWUtKSzNzOXRXeHhUcXlBMnovRUl6Vk1qblZ4TVdKdHM0dHZk?=
 =?utf-8?B?NEhaRUZlTFJSSGxlbW5tTXNVMWs5M1dRekZ1RjhPdzVhaEU2cGRQOHc4WWtO?=
 =?utf-8?B?bndhVjg4anhicld1dnAxWFhSbU44ZEVOcko5WHRIWXd6OVZWeWZrREJVV1M2?=
 =?utf-8?B?a3pCS2ZoZ2d2NTJhM2FWQWMrd0U5UXlySzcxWGRYL0E5NklkNStOeDNtS1FZ?=
 =?utf-8?B?T3Z5SDBibUxDYitMNUVjckJjL04zckVJTnFSQVRINWlCdzFFWEN5ZlJWWi85?=
 =?utf-8?B?SzRvZlZ2WDFSR2QzOGw4Z1NIUHk1dHN3OUFtZkJqYkJaR0dmTGZoNVpMYkh5?=
 =?utf-8?B?dzA3UTJqcDc2bVB5eE9CK2Q1OCtsQkFkRTlKWUx5bWduREN4eUEvL3NDeHgx?=
 =?utf-8?B?dnNUby9mc2VRb0dLVE1JL1ZYWjV2cU1qeDBYaEJtMXFHMHNia3JMQkJoOGtt?=
 =?utf-8?B?MTdCT1BwQVMzdmNXc3JOd2pMRGNoVkJsZk9XaUwveDBuVzNXcThiRG9kNXpx?=
 =?utf-8?B?OXBHSVZudVhQZS9GVnRmdFA3N1F1NW11NmZxSVdaWXFkYmpMd3kzOTlIME5W?=
 =?utf-8?B?Qm5kbTNLU2wwZlVyd0czbGl5UHhmbS9oREEzYkxINmQ4b2JIb2RxMnlsZ3dH?=
 =?utf-8?B?Um10bDNCZEd2N3RncVBlamlnbGJ3STI5ME4ydC91WnMrK3N1a0w0em5BL0Q3?=
 =?utf-8?B?YTkrenE0OVJJWEpPK3c4bisxWUkxL2NEaU5ZR3JJOThSNjErSUhnOHphL0FO?=
 =?utf-8?Q?05MtNrJBzDL+CCiRnRUy/L/TVNkV7W+pxP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:03:15.0205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: b9faccbb-75c2-4be7-e54e-08d8b3eee822
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kWEz6aHqUXZEmRb8M8PqZmNtpFdxaOXXFBv3pnDOWx+UGvmQ0nhvI6j6VUYSWVfc62f3IZ+rK040P+e9fjmWdS9QGGov45hcdhaxd9GEoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------DF5C3143C76D0116F90EE2FB"
Content-Language: en-US

--------------DF5C3143C76D0116F90EE2FB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-05 10:16 a.m., Leon Anavi wrote:
> - Migrated from Travis and Appveyor to GitHub Actions. This
>    required changes in several areas including dependent packages
>    used for testing and coverage. This did not cause any changes
>    on dependent packages used for the installation of the package.
>
> License-Update: File changed but the licence remains the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-nocaselist_1.0.3.bb  | 9 ---------
>   .../recipes-devtools/python/python3-nocaselist_1.0.4.bb  | 8 ++++++++
>   2 files changed, 8 insertions(+), 9 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
> deleted file mode 100644
> index 1119c7f38e..0000000000
> --- a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -SUMMARY = "A case-insensitive list for Python"
> -HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> -
> -SRC_URI[md5sum] = "42ba878fd70611cf345c61edd83f5fb0"
> -SRC_URI[sha256sum] = "7e6decb7d85563b9044913c9087ef4b691bc3da4d7ad1d88968cdea409553326"
> -
> -inherit pypi setuptools3
> diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb
> new file mode 100644
> index 0000000000..60c79c22a8
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb
> @@ -0,0 +1,8 @@
> +SUMMARY = "A case-insensitive list for Python"
> +HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d229da563da18fe5d58cd95a6467d584"
> +
> +SRC_URI[sha256sum] = "73a9c0659e7135c66e46a6ab06e2cb637ce9248d73c690ebd31afb72a4e03ac0"
> +
> +inherit pypi setuptools3
>
> 
>

--------------DF5C3143C76D0116F90EE2FB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-05 10:16 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210105151638.15700-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Migrated from Travis and Appveyor to GitHub Actions. This
  required changes in several areas including dependent packages
  used for testing and coverage. This did not cause any changes
  on dependent packages used for the installation of the package.

License-Update: File changed but the licence remains the same.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210105151638.15700-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-nocaselist_1.0.3.bb  | 9 ---------
 .../recipes-devtools/python/python3-nocaselist_1.0.4.bb  | 8 ++++++++
 2 files changed, 8 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
deleted file mode 100644
index 1119c7f38e..0000000000
--- a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = &quot;A case-insensitive list for Python&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://nocaselist.readthedocs.io/en/latest/">&quot;https://nocaselist.readthedocs.io/en/latest/&quot;</a>
-LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327">&quot;file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327&quot;</a>
-
-SRC_URI[md5sum] = &quot;42ba878fd70611cf345c61edd83f5fb0&quot;
-SRC_URI[sha256sum] = &quot;7e6decb7d85563b9044913c9087ef4b691bc3da4d7ad1d88968cdea409553326&quot;
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb
new file mode 100644
index 0000000000..60c79c22a8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb
@@ -0,0 +1,8 @@
+SUMMARY = &quot;A case-insensitive list for Python&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://nocaselist.readthedocs.io/en/latest/">&quot;https://nocaselist.readthedocs.io/en/latest/&quot;</a>
+LICENSE = &quot;Apache-2.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d229da563da18fe5d58cd95a6467d584">&quot;file://LICENSE;md5=d229da563da18fe5d58cd95a6467d584&quot;</a>
+
+SRC_URI[sha256sum] = &quot;73a9c0659e7135c66e46a6ab06e2cb637ce9248d73c690ebd31afb72a4e03ac0&quot;
+
+inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------DF5C3143C76D0116F90EE2FB--
