Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.53])
 by mx.groups.io with SMTP id smtpd.web08.8304.1612533801037966599
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:03:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Tep6qn/x;
 spf=pass (domain: windriver.com, ip: 40.107.75.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcCUBdVt/Obh9CGxO8GO688YcSejDrOhrKSGk/82L8jV3Ti6UQq++YdgELyVlp1RMMzasksMVSMeaTZv1bMPOneq7GRRnhSHdSj4ZryCaq+jX9jVZMWyZyRhNaoxKZJikx87SE5NeF1yfV9V4OStK0OtHWZpLdzX2f8sfm+ALapPNGVxLWE6frwzqnkv5Cyy/crzJIjEfKFYtBN0Um6DJ9e7nkRo9P0XbaENoYwL1HyUNoGGiII5XQ5Bq38zDIziZRnaRUaToRjofT0jZsjY89v+8uZZtngAR6PXx6dcPLJhIBRO3t3wXcjNS+/rz/X7vYMUg/TYd7Uor6K0iAsQSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xg+vU0BgaYd4x8Xnw9PO+Y1MW6PB+I61kwAVkhxSXY=;
 b=XjGAjjbEjAPI+xMi17lPdFX1B9DMzapmBCEfARJqZMhE1gllJvDlIS5gzPVjGyso+gFOWX83w/Z+TEQ0q5qGMrKnh/wLtiuEJFhBro9BVjAJ1LKExyDAx5CNIsbqMo3OIkF50B312BoiWseZ422kBxijJ5IYr/j5zXPHtHwD0MORivp0u+ynbEybOYJAihD1bzhNhSILCOjmQUADfugQwwhL9vTemU0NFnDGkhwo9ZzOFoKtL9LUC32wFMu9cdf6B5nshIYeB58NJ/W0Nc7xH/v+G3qvp4hFjHieD4E/umqFridonO2B69lwPcaeOqpdLoiLyA8jEnepfo65O7cgvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xg+vU0BgaYd4x8Xnw9PO+Y1MW6PB+I61kwAVkhxSXY=;
 b=Tep6qn/xt5Eorbv311MbDlBvxl5HnP0sUHHmIKVLJo0WZxQw2SDGyPvTZ1roWXWj3gZ9mon3KJBYF10n7/vQ4S84iwiwJK0EyzJR/RRP+EG9cqUTYOLgM+IOzq+b6D9S8EgzXsTKLTnKuQVHHo8tDGGtylKgcdCSiwDUERLJfxw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (10.255.163.77) by
 SJ0PR11MB4830.namprd11.prod.outlook.com (20.182.113.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17; Fri, 5 Feb 2021 14:03:19 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:03:19 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-pytest-html: Upgrade 2.1.1 -> 3.1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210203153822.25077-1-leon.anavi@konsulko.com>
 <20210203153822.25077-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a1dafd14-7325-c008-a3ef-08485f979ca5@windriver.com>
Date: Fri, 5 Feb 2021 09:03:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210203153822.25077-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0564.namprd03.prod.outlook.com
 (2603:10b6:408:138::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0564.namprd03.prod.outlook.com (2603:10b6:408:138::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 14:03:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e5d8518-82e1-4ee0-9539-08d8c9decac7
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4830:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB483061675E1964BD388E14229FB29@SJ0PR11MB4830.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F3kxjetHFzv7/LZMUvKmRWCL0HuODyCj7R40w+up9aKy7WMQskz8ibO10b6+YThX/p8pAQPm0/+NIVT6CIN7Y2Fd1qyKB851jJfzQnp6Fvz+MjzcZNjaGXuMw3pfU5cIVcYMF3FGU+5JSt21LJ2fXteQI6ABCjBYSp+/wYzHOaQUQ6V99RChNa6Y+oh1tJdxtGdtXdw3fwyiwnix//vpgYqDl3UkomlARf9CLNec0Bq9wQ6Y1eJdPC2P5DMl1HfyrdBTKHPd9NKTXCVcJzoky4oCOkumPhEe0mV7ldVO0n+PyFwR0mXWolZro3uGp1nCWlrkx/q1OLGMTKuiSSsENLtQi99HKLJvE9lI13MFRXCBkLI0DPSLLUc7Kx6Z3+ZIEB1yr4iEGaVRoEldmHqwH0zjcIQQN/90j/BltNhQkFOwDyT9/sS3wx1jUSud0J0ZuKFlj9ioOAY1dVf34TqjGhIGXkUacZwtiVgcnFIi4ODVlQU4Grx4lpRwa9MU9FBOg8q+XrLg6HynFhTOfHJNFZlXSM0oiC7i0M26mdilj5OSd2eVZ5V4tP46EC+mt0xnlUs2LEcsIzjJZiqSoE2sPmuumIa+7U+WEHG3GrXHg+TfLxfiJQRqYxL4cQ8NUOkAAwtAO4YgHDFePQZysHSq6TADMhCVcgwbrRh5zbCLktrNxQQTTVz5EKGsF6WZR5XG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(136003)(376002)(346002)(86362001)(6486002)(83380400001)(6666004)(44832011)(8676002)(16576012)(316002)(36756003)(66946007)(53546011)(5660300002)(8936002)(478600001)(31696002)(2906002)(66476007)(166002)(66556008)(26005)(31686004)(186003)(52116002)(2616005)(33964004)(16526019)(966005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?akFNYThLaU9CRTcrVGtVRGxFaVRONEgwMlFMamZzT3BPdGl4aWl4elBpWEk0?=
 =?utf-8?B?QnB1ZW5MY1AzUk5wWFNqMmdocFBwZDhLUGRHbkJHZnFCNWFQUHVrQngwQTd0?=
 =?utf-8?B?Ni9IeGZQR2Ria2t5ajU1N0JWYWdHd3ptbVM0WDhoUFJ2b0dYN1RiazdtV09N?=
 =?utf-8?B?UlZCcXRDQmJrbmhqaDBsSWdZa2ZvamhJR2wyaG1ZNzhtKzRUMmhqWXB5Q1ZI?=
 =?utf-8?B?MTlBMVhlQWNGRVZYOEg5dDkrK1h5bVg4RXdzbkl6eGVkcUVIZ1ZYK05GcHBL?=
 =?utf-8?B?UzdWbU1pQU5QejMxNXVydVJ1MjY5UmZJY2F3MmxSUUxXZ2RDak5SY081cWxi?=
 =?utf-8?B?MVZYUFZzM0plZ2hWQWxvUFo1L2hkYnRrQTF4aTZ2THFNaXpmazhQaDY5TFFD?=
 =?utf-8?B?M0lHQThnK2ZkVTRLcTZLcEx6RkRIOExaODNLazJKR09vbC9CcDVxMDQ4cHo4?=
 =?utf-8?B?UVFqL1VNMlZFWUZ4eVpOV2xCYVNyVmVwR0E2Wi9jcFhJYzZvVU1rMXJ1bzd6?=
 =?utf-8?B?dEV6Yzc3cytHK0hLenphYTRLQmU0RXNUd3czcHBWRVJjd2xTRFczcTlSVHVj?=
 =?utf-8?B?WWdjaEU5RFlaVFVFVk5seUp5cFdwVGYrMEdYUHBIYzBiOUtUVGJPNzY4TkdU?=
 =?utf-8?B?eWdCMGx1bjdVdGN6VGRWeUhibnQ1QWNrd2dqOVN2NGpOOXZKRUxqWVl2WGwr?=
 =?utf-8?B?ZDAwczVHc1E3RU9lNkRnMFQ5enBzMHU5Q3dvR2FFZi9wN01WbGkwaDk0VWpR?=
 =?utf-8?B?NjhJTWtNUEN5QnRJOUJieTlQdDlDM3pyQXlMZk8zdHVJOHFiWXBZa2ZHSy9y?=
 =?utf-8?B?dktQWUpKcTY1cUNOSFg3OTY2VmVDbXRLYmlCeU5nWGRRY2wyMkwvVXhOTHZr?=
 =?utf-8?B?V296WkZjRGp2bTlJQzVJZmJKaUlHY1h1Z3h1TFZQWEtsQlAwZnZkQWZjV254?=
 =?utf-8?B?WFJJL1gvNHR5SHJUL2N0dUxnTTlGWEFzUTlaNldQZEFSUFB2VnJuZXk0a1Z1?=
 =?utf-8?B?b3U2M1c2aW4zSjdJVUN2ZE80N09YbWtiRFJ0WXNiMENoSXl6b1VFcG5UZWll?=
 =?utf-8?B?eThmUkowb3h4VTdNNURyRVdmbXBwbTRyVXVBTGZnbkFZWTN6RWxhSll0OEd5?=
 =?utf-8?B?YitNRUo4bzdyRGVQSCtBM2o1NHVZNm9kSUhEMGhsNkJjcXlQSHdqRmdGdW9F?=
 =?utf-8?B?eGE3Ym1FV2k4VVdZQXIxcTU2NW5IQnE3VmtZeVNGeHVQWDcraERQVUJEY081?=
 =?utf-8?B?K3h2eVZwTGZiYzFZd1Z4aFZzK0tra0wzNWx5amlTclRkeENWc1JhUmhLanhO?=
 =?utf-8?B?UEhzMUNjbC9VbUVCakdoSDZaVzdvYXN5UVJRQjRLOEtBOCthT3JHdkNUNjF6?=
 =?utf-8?B?V0RkLytqRDJzMVcyZnRnSmg3eWZ4SHVVNGFoYWFZbENFYmYrRWRRVnQ0Mlov?=
 =?utf-8?B?dFZoVFBBNDhGT0laSGNockFmSlYwcW9BTzJia3hQaGY0Qm9iV00yeFVxWkZp?=
 =?utf-8?B?Ty9MT1BERWlVWXVOZDZJdFN3RXdPTDgvMVIzWVFWT3JaZmV5R1kvNGFYeTJC?=
 =?utf-8?B?bWhwekJteUtWZlM4bFR5VnJvTHpRUzFaa2h2T2NFdDIySVhkMWEwV3U1US80?=
 =?utf-8?B?WE5yUDRYeE1reTY3UFphRzZSdUt4SkxSNFZNNXpSSUJXVjFYYWI5OG9jVjBk?=
 =?utf-8?B?dUN6L0drTkdubWM0NWZHbkVVRUdYdzFkM015djVDaURGNzFiTlVDa1pDelZE?=
 =?utf-8?Q?3vYO+1nMOYytb1wmIOxpUfwS0eUrC2ju5KStH0z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5d8518-82e1-4ee0-9539-08d8c9decac7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:03:19.6054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uzmzWF3uJGKm8rHlw+hZ9BmMH0wBVZp8l+t55tAPgo5hMSB0LqqljYA4Fkll7yaY46J6Utv8Rr8tSK6dzov31aFzupIWpZCwpCUgbAe83dI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
Content-Type: multipart/alternative;
 boundary="------------28063C017BA09590D2FE1935"
Content-Language: en-US

--------------28063C017BA09590D2FE1935
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-03 10:38 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 3.1.1:
>
> - Fix issue with reporting of missing CSS files
> - Stop attaching test reruns to final test report entries
> - Allow for report duration formatting
> - Respect --capture=no, --show-capture=no, and -s pytest flags
> - Make the Results table Links column sortable
> - Fix issue with missing image or video in extras
> - Fix attribute name for compatibility with pytest-xdist 2
> - Post process HTML generation to allow teardown to appear in the
>    HTML output
>
> License-Update: Following recent changes to README.rst, just use
> LICENSE downloaded from PyPI.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-pytest-html_2.1.1.bb       | 24 -------------------
>   .../python/python3-pytest-html_3.1.1.bb       | 18 ++++++++++++++
>   2 files changed, 18 insertions(+), 24 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
> deleted file mode 100644
> index 27b768155..000000000
> --- a/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -DESCRIPTION = "pytest plugin for generating html reports from test results"
> -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> -
> -LICENSE = "MPL-2.0"
> -LIC_FILES_CHKSUM = "file://../pytest-html.LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
> -
> -# Per README.rst the license statement is fetched from
> -# https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE
> -SRC_URI += "https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE;name=license;downloadfilename=pytest-html.LICENSE"
> -SRC_URI[license.md5sum] = "5d425c8f3157dbf212db2ec53d9e5132"
> -SRC_URI[license.sha256sum] = "2bfdca60adf803108d4c7f009000bea76ad00e621e163197881b0eaae91b530e"
> -
> -SRC_URI[sha256sum] = "6a4ac391e105e391208e3eb9bd294a60dd336447fd8e1acddff3a6de7f4e57c5"
> -
> -
> -PYPI_PACKAGE = "pytest-html"
> -
> -inherit pypi setuptools3
> -
> -RDEPENDS_${PN} += " \
> -    ${PYTHON_PN}-pytest \
> -"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
> new file mode 100644
> index 000000000..bd543d2f0
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "pytest plugin for generating html reports from test results"
> +DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> +
> +LICENSE = "MPL-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
> +
> +SRC_URI[sha256sum] = "3ee1cf319c913d19fe53aeb0bc400e7b0bc2dbeb477553733db1dad12eb75ee3"
> +
> +
> +PYPI_PACKAGE = "pytest-html"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-pytest \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
> 
>

--------------28063C017BA09590D2FE1935
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-03 10:38 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210203153822.25077-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 3.1.1:

- Fix issue with reporting of missing CSS files
- Stop attaching test reruns to final test report entries
- Allow for report duration formatting
- Respect --capture=no, --show-capture=no, and -s pytest flags
- Make the Results table Links column sortable
- Fix issue with missing image or video in extras
- Fix attribute name for compatibility with pytest-xdist 2
- Post process HTML generation to allow teardown to appear in the
  HTML output

License-Update: Following recent changes to README.rst, just use
LICENSE downloaded from PyPI.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210203153822.25077-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-pytest-html_2.1.1.bb       | 24 -------------------
 .../python/python3-pytest-html_3.1.1.bb       | 18 ++++++++++++++
 2 files changed, 18 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
deleted file mode 100644
index 27b768155..000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-html_2.1.1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = &quot;pytest plugin for generating html reports from test results&quot;
-DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
-
-LICENSE = &quot;MPL-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://../pytest-html.LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132">&quot;file://../pytest-html.LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132&quot;</a>
-
-# Per README.rst the license statement is fetched from
-# <a class="moz-txt-link-freetext" href="https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE">https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE</a>
-SRC_URI += <a class="moz-txt-link-rfc2396E" href="https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE;name=license;downloadfilename=pytest-html.LICENSE">&quot;https://raw.githubusercontent.com/davehunt/pytest-html/master/LICENSE;name=license;downloadfilename=pytest-html.LICENSE&quot;</a>
-SRC_URI[license.md5sum] = &quot;5d425c8f3157dbf212db2ec53d9e5132&quot;
-SRC_URI[license.sha256sum] = &quot;2bfdca60adf803108d4c7f009000bea76ad00e621e163197881b0eaae91b530e&quot;
-
-SRC_URI[sha256sum] = &quot;6a4ac391e105e391208e3eb9bd294a60dd336447fd8e1acddff3a6de7f4e57c5&quot;
-
-
-PYPI_PACKAGE = &quot;pytest-html&quot;
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} += &quot; \
-    ${PYTHON_PN}-pytest \
-&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb b/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
new file mode 100644
index 000000000..bd543d2f0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-html_3.1.1.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = &quot;pytest plugin for generating html reports from test results&quot;
+DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
+
+LICENSE = &quot;MPL-2.0&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132">&quot;file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132&quot;</a>
+
+SRC_URI[sha256sum] = &quot;3ee1cf319c913d19fe53aeb0bc400e7b0bc2dbeb477553733db1dad12eb75ee3&quot;
+
+
+PYPI_PACKAGE = &quot;pytest-html&quot;
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += &quot; \
+    ${PYTHON_PN}-pytest \
+&quot;
+
+BBCLASSEXTEND = &quot;native nativesdk&quot;
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

--------------28063C017BA09590D2FE1935--
