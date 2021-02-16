Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.77])
 by mx.groups.io with SMTP id smtpd.web12.7340.1613480249016976814
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 04:57:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dqZktdQB;
 spf=pass (domain: windriver.com, ip: 40.107.70.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfoNO0AnwSEuIuVDzFjnm3LYWyto8QaNEnH0EiZJpmYzNs1kgqyjEeeYCg2noiWVRV863EF/oI10wwUOS87XY7kCUSrLvRi89RVXe24LHprzj0YZ/d/HUJhWLn043dpyhVSWaZ1UK92EqJeqa5AdLkVSy5CrbvhMo3f/yuELVwEQqNLphjLa/b75KREOTDXpdfrYTe7709HrxgXl1wtu1e2f7l8FRQxFdYJKTBbz+59xbNb1MZpatGkMK1IBdrhl00gi793wNAnbBZTKakLhijC5mpw2lcUnSbtSbGBbThZdDwTg8TFiLdWm3Dl7Xu/gDeV62YwrcGBA7ocxceTwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3Urzanm80jTp6ilUHMLkNrRnZO7G4gdvWQolTR/PiA=;
 b=lsLG2cQZeaZ85Z0aTTLyf3iBL3No+VZu3E7GYhKw3bgoqHxpjWDJZLi9HUIRc5Kcv+NrGR4socZprpnn8+UNprAD+8qRyAxCJfpJPl3R63kbXmy7O3WnnzQjg0uapHrGKRIj6T3GNCpczM8ZRy/jtbVJRw8eqXaFk829RBOAHo+c+7nKOtDlppqVyuPAFKqY7R9U96XGLPmRBRLfckeP0oXP7OXZwsCsIVv/WS8IEjmguwAWCYoadEhUEZMWh5kiEJynhSj86I9kSTlF8fdS3xzWPlnXBt0Rlt8iGEukf4f5h1cm2aXn7kbuCREizie8clSgdtt4h6qFpBZBxpy+DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3Urzanm80jTp6ilUHMLkNrRnZO7G4gdvWQolTR/PiA=;
 b=dqZktdQBddIfLEtKgv59UripT6TnL3hNGkc3qqiBR7E67MNyLrIDXey62Fj6WbTLxHugdaiXLMxnej73H5vAXVe3Zk4ahw5S/S6J8VUWhwYfvB/udpWHtAmd+p/BhJc3pCeItghCtEtKUIGwF+LM4LpCk/VZMEWswV8CkmJTOiY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4418.namprd11.prod.outlook.com (2603:10b6:a03:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 16 Feb
 2021 12:57:28 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 12:57:28 +0000
Subject: Re: [oe] [meta-python[PATCH v2] python3-idna: update to 3.1
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20210211183437.2215328-1-open.source@oleksandr-kravchuk.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f074194b-6d60-089c-a5a8-539e57713386@windriver.com>
Date: Tue, 16 Feb 2021 07:57:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210211183437.2215328-1-open.source@oleksandr-kravchuk.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:91::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR05CA0019.namprd05.prod.outlook.com (2603:10b6:208:91::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.12 via Frontend Transport; Tue, 16 Feb 2021 12:57:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f18e390-295a-4ed9-5248-08d8d27a69d7
X-MS-TrafficTypeDiagnostic: BY5PR11MB4418:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB44182D0A6B5EFF41EA993B169F879@BY5PR11MB4418.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RDKN8elhXFxnLXCcZsS1OYxLJh8g7JwCI2DWgcC9lIZbuFpGwV6vCP5eUYgf6rnjymYzE+Y/2lwXCFgYSoieVXdQ8xRP8+5aTRwMfWxcUAdaEh8XiV9GozmxG4WQ0e6bcbrqPVnHwtZyWSfP9D1dK2zFxgA9GX3uKt9ocfd81ZjnJTtpq2lnkRZJzMEanKAvR9vDjSc9GFTcYJplS0y+uZ3DcbDqbYLjhZmHtNpT7+Lo+kPyX1v71FIATtGuEj2oHKUP236zGp9Q+h6Q37BKaaUDf+KciSnaFswXcy9I1fYKWxvh8VhJ47LZYNM9SrzniC2BS4s1LSCFXCjGKvcY4pbVjgFjTSeTj47hA+BF4Kwt9xfJtQwdnW4EhQC8WfV9rY9wMvUFzt0YtPQqN7jYK0C5cBMJr+Xkk64zGD7Nkk8xFFqjClhRfLWiTaCVqz3yFeeD1/xSb3hWaRY+52DBZ+Q5BL2EaiVo4WuRj0ApTSzsEkNWG44B/hPsCAlWa2+5lMoW50wDwDOEDlJn1RplM1biNH775TzKqf8ULMoaPurBhbX6k8oA3P9qmaGq1mMrYgTAdCgFz2tTx8pZ0pc8VRpt37oLvQE4tTahWeMIFI+Q+pUDVLzgWcgJrupUWk8jtEgtLCVs1Tezc9RV2kMZFVP3m0zupKjwhrO3yS/lJ6LiSJnsX8oquPobRiP+2QRC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(366004)(83380400001)(44832011)(2906002)(2616005)(186003)(478600001)(86362001)(33964004)(53546011)(31696002)(6486002)(52116002)(36756003)(31686004)(16526019)(8676002)(316002)(16576012)(8936002)(66556008)(66476007)(166002)(26005)(66946007)(966005)(5660300002)(956004)(15650500001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QnVXSUE1Z0VReEFzdkRpWjZoR3g0VVF5aHJyaHdUWFJkR0ZSckJKcTVOSDdS?=
 =?utf-8?B?OUtKNmxPQXo4SEFONzdWM2xFVXdwVHg4R2xrUjM0Ynp2Sk9Rd2xCNTFUY0lm?=
 =?utf-8?B?TllyTGhET3JWNmhoT3BDbjJ0Z0dWQk9EQlJ1SUx1cm5MV0ZNa0xBRFYzYmF0?=
 =?utf-8?B?QXZ1NGFiaVRtZWI4ZXJyY0dNQlF2blBGckQyU1hCemh1Q3UraWxmNVl4RU1Z?=
 =?utf-8?B?aTBrS0NtdkUzaEEyaXpnMzJodWZNdEJsODNMM0V0UkpjeXFWMGtjQ3gwdFEw?=
 =?utf-8?B?Sk1jRlFlYjMvQXp3SUZ2UWMwZC80aUpnOEtDakM5b25Xb2crbzRQN3A5ZVhY?=
 =?utf-8?B?Tk9adlNOVlVsNTdWdzYwU1pQa1BKM1dhcnEranlLMmhRQTlvR3ZGelFEWElp?=
 =?utf-8?B?QUR4cEs4UWdnMDlvYyt4cEZnUXBVamZGa3JOaldhN0NNaDlZMUhQbXJpRWhX?=
 =?utf-8?B?Z2ppSVBwUlUwa1NjZ2Ztc0N1VHJUdENSYmNTZEZUbmNZUUZad0QxdWp4RGdY?=
 =?utf-8?B?RU9jaDZXQ1cwcENqbFlSWHVWdU5IU3BrQ1haNEU4V3pQOGxnNGR5NGU1N2g4?=
 =?utf-8?B?amUvUldVMDZMNU13eEVqMlF3ZmNtVzRxbkxJU0FLdGFySWRvL1hFbFFNdlJj?=
 =?utf-8?B?dDZPT0JGL1dualVzWTQ3TUhabktwNFZRa1hTMDd6YkhZVld2WS9PZ0x1YW9P?=
 =?utf-8?B?QzErUkp5V3pyTVk4a3ByU2V4cGFGaUZteXNJVnorK0hmRzZtYlU3V2dDYUF6?=
 =?utf-8?B?QkkzMDk1UWtDU3NpY3ZQbnludHhlMDhQNUJyNXRkdU5QZzZCNm40WkRheTNT?=
 =?utf-8?B?WldqVStSTzJtU2ZSOGcyRkF4RE9oOFNHSzRwMUNsS3RKbnJEdnJpU0FsMkRy?=
 =?utf-8?B?aUJpSVNDQzFRbkZJZzRjdEtMaWxRNkxsL2thUkVPVkNWazY3N2RmbzdNbnV0?=
 =?utf-8?B?VUZNMGdPUFZiTy9MOHlpSmQ1dDY2UVowK3VHYkN1aXJGdjc2ZnBLUStsY1F0?=
 =?utf-8?B?RW1ZL1NFTjlqcWsxSEZESDB3TUZmL1pKQU91YzRlckNjbXVwdUNKdFNXZEQ5?=
 =?utf-8?B?U3BhU2FyclE5MHVEMmI4L25ieGYxalpWN0cwRnZkUmxBQm15UWZTaFpURDY4?=
 =?utf-8?B?TUxwd1Q4NGNxN0N4NnNpQkY4LzJ6bng1YmFFcFg0S2hRbVFWdjA4N3pvV3R5?=
 =?utf-8?B?VjJWVkcxQjE1NXY3M3NQRHFmNlR6S1d3V0xDZkcwSkdHYjNLb3JrQVZ3RUwz?=
 =?utf-8?B?Q1hNNTNsRW5QMForYWRqaDZGaWJMOUtZUzZBVEFnZ2VWUzA5cnJ4eTk5ZVdL?=
 =?utf-8?B?MEhFL0JoSTg3UVdJZEk5Vzc5Q2E0cHRaMGxDazBld2RVQ1luNmJGSU1tdSs5?=
 =?utf-8?B?ODhzTi9xTUxvbXM5cDZQTXovNzN2YnFDS3h1WmJneFBKT1RzakU3Y2VoMFlO?=
 =?utf-8?B?K1RPMDZOZW5TOWt4OGxaV0QxWnhJZVZ6ZjhKdUhRVXZQOUxPeUFsa3BKVWpo?=
 =?utf-8?B?OHlvdFoyRE1iVi85VHpnMlNMWmVDNmRtTnlyOWVpekxqNU1jTnZKbWZMamh6?=
 =?utf-8?B?T2FxWVNpTXZOSEVMMU90Z0VPZEd1ejZtdXEvYlNZdlcrRjFNSUdxUGRYaUZG?=
 =?utf-8?B?cWo3U08zODg5SnJ6VXJ4ZUJQeDlmN2JNM3hCQTlVT1d0Z3NsS0d1R0tJbGdv?=
 =?utf-8?B?aG1FQjZzOWtGSWFLbkJ6cVQ1cGo5NThGK0hkR0ZEZzJjL2dodVk5a28wcTFm?=
 =?utf-8?Q?UjOgdTFN/2K826BvQwvF/6JcKmI9YCRmQVc5u8W?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f18e390-295a-4ed9-5248-08d8d27a69d7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 12:57:27.8546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ay1AEuo22jGJ83zKsxxqMjkcawPGsL49ttqCxmBb94T/V29oIdzow12cOmL1RBxYbH/mDRWuLR9bAT1THoeKqQK/uUDQkjEPF5xFqXBkzfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4418
Content-Type: multipart/alternative;
 boundary="------------93F4F2C5B918A91D844009DF"
Content-Language: en-US

--------------93F4F2C5B918A91D844009DF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-11 1:34 p.m., Oleksandr Kravchuk wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> License-Update: copyright years.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-idna_2.10.bb   | 2 --
>   .../python/{python-idna.inc => python3-idna_3.1.bb}        | 7 ++++---
>   2 files changed, 4 insertions(+), 5 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-idna_2.10.bb
>   rename meta-python/recipes-devtools/python/{python-idna.inc => python3-idna_3.1.bb} (60%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-idna_2.10.bb b/meta-python/recipes-devtools/python/python3-idna_2.10.bb
> deleted file mode 100644
> index a08ca714ac..0000000000
> --- a/meta-python/recipes-devtools/python/python3-idna_2.10.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit pypi setuptools3
> -require python-idna.inc
> diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python3-idna_3.1.bb
> similarity index 60%
> rename from meta-python/recipes-devtools/python/python-idna.inc
> rename to meta-python/recipes-devtools/python/python3-idna_3.1.bb
> index 4968f10726..fab5445954 100644
> --- a/meta-python/recipes-devtools/python/python-idna.inc
> +++ b/meta-python/recipes-devtools/python/python3-idna_3.1.bb
> @@ -1,15 +1,16 @@
>   SUMMARY = "Internationalised Domain Names in Applications"
>   HOMEPAGE = "https://github.com/kjd/idna"
>   LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=cf36c8682cc154d2d4aa57bd6246b9a1"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
>
> -SRC_URI[md5sum] = "7a910c706db30d758f377db2762c0f9a"
> -SRC_URI[sha256sum] = "b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6"
> +SRC_URI[sha256sum] = "c5b02147e01ea9920e6b0a3f1f7bb833612d507592c837a6c49552768f4054e1"
>
>   RDEPENDS_${PN}_class-target = "\
>       ${PYTHON_PN}-codecs \
>   "
>
> +inherit pypi setuptools3
> +
>   # Remove bundled egg-info
>   do_compile_prepend() {
>       rm -rf ${S}/idna.egg-info
> --
> 2.25.1
>
>
> 
>

--------------93F4F2C5B918A91D844009DF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-11 1:34 p.m., Oleksandr
      Kravchuk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210211183437.2215328-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

License-Update: copyright years.

Signed-off-by: Oleksandr Kravchuk <a class="moz-txt-link-rfc2396E" href="mailto:open.source@oleksandr-kravchuk.com">&lt;open.source@oleksandr-kravchuk.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210211183437.2215328-1-open.source@oleksandr-kravchuk.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-idna_2.10.bb   | 2 --
 .../python/{python-idna.inc =&gt; python3-idna_3.1.bb}        | 7 ++++---
 2 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-idna_2.10.bb
 rename meta-python/recipes-devtools/python/{python-idna.inc =&gt; python3-idna_3.1.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-idna_2.10.bb b/meta-python/recipes-devtools/python/python3-idna_2.10.bb
deleted file mode 100644
index a08ca714ac..0000000000
--- a/meta-python/recipes-devtools/python/python3-idna_2.10.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-idna.inc
diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python3-idna_3.1.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python-idna.inc
rename to meta-python/recipes-devtools/python/python3-idna_3.1.bb
index 4968f10726..fab5445954 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python3-idna_3.1.bb
@@ -1,15 +1,16 @@
 SUMMARY = &quot;Internationalised Domain Names in Applications&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/kjd/idna">&quot;https://github.com/kjd/idna&quot;</a>
 LICENSE = &quot;BSD-3-Clause &amp; Python-2.0 &amp; Unicode&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=cf36c8682cc154d2d4aa57bd6246b9a1">&quot;file://LICENSE.rst;md5=cf36c8682cc154d2d4aa57bd6246b9a1&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1">&quot;file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1&quot;</a>

-SRC_URI[md5sum] = &quot;7a910c706db30d758f377db2762c0f9a&quot;
-SRC_URI[sha256sum] = &quot;b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6&quot;
+SRC_URI[sha256sum] = &quot;c5b02147e01ea9920e6b0a3f1f7bb833612d507592c837a6c49552768f4054e1&quot;

 RDEPENDS_${PN}_class-target = &quot;\
     ${PYTHON_PN}-codecs \
 &quot;

+inherit pypi setuptools3
+
 # Remove bundled egg-info
 do_compile_prepend() {
     rm -rf ${S}/idna.egg-info
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

--------------93F4F2C5B918A91D844009DF--
