Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.51])
 by mx.groups.io with SMTP id smtpd.web09.24355.1611839373626080609
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DaAt3A47;
 spf=pass (domain: windriver.com, ip: 40.107.223.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+pJY4m/iCjnU1dC3nfHmeJaOY2qKiKWmj+C1xPQ5lKmVbfYUbA/tfGQO0H/q39FedDg0+dYS+rHw2yznOVDWOCEPobzZ0PkoBCjntzY6P87nQQ2vLKGudVyMft89B4EDMLp86Dtr+iDzuemLQSEvPvfGy/dpYBATgUaGjzxyvMuIuJK8yP0tpI1o7LhjMK5nX2/vZJFaBRaBYdk3Edp8RjifWq8sTd/x9ysvduaAJPAvvZkJLMZlGzYJ0IJsSnu5GwT4L15Gum/nuVPX+bvQYuAQDAxfegmGTwn01hm8Y/TPQiPoF9qT6hXrtMMJ8jvyplMcUyt5CsDlSH1ffmcoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGrl8DyJ/pALQOWGhH1NIa8AGpcHj8bDJ5NQGUbB6s0=;
 b=A8gvvefa5tBo+qb8U9yml9C4Cc4h20jQ+fW8Q7GjTzN1HO6PdEshqnpQVZylHSkMDgpa+CV7N1PabqU9j2tM/A2iUzr7H2Q+aCAzbxvxGB3GD4QrLdv7N9t5B6F+farlSArabfR+ffnf/eSqlsQGHBcFM4rOPeJAuaNwX8nkuvaHHK3AaRl+YaqgbnJMpHfHNKRX9YElvssqbRRGuhlMBr9+aynmSzwMjUAO4Dk5zOy/1agK0//RSp/tEwj63k3ePBD7K6fPUsa5YfH7L2OFkdPXLzY828MqfGyyQ3OM9ddXIWLaOHK6yWdtXnDid4qHtXHuKSGVEJvJ9zVJb0vWIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGrl8DyJ/pALQOWGhH1NIa8AGpcHj8bDJ5NQGUbB6s0=;
 b=DaAt3A47xYCH3OG2NNqT9sH8oe6NAHZDHyPj2LoCOhut/tEwJdatmZ1Xvi5ZbeRkW8izUgaxu9deOAogIDuFDiUCFui6aUbR9BA0LxQg9zCLEXfOE5cRr/HVhU/QTY0FScuKwGSUfcm3jA7WgF5CTSj/UwjhPBPHsOf3U972f6w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 13:09:32 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:09:32 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-pako: Upgrade 0.2.3 -> 0.3.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210127155538.12229-1-leon.anavi@konsulko.com>
 <20210127155538.12229-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <30341e77-285d-7815-6860-a556917acb70@windriver.com>
Date: Thu, 28 Jan 2021 08:09:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210127155538.12229-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0093.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::8) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0093.namprd13.prod.outlook.com (2603:10b6:208:2b9::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend Transport; Thu, 28 Jan 2021 13:09:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4487cbde-0039-46ed-940a-08d8c38df3d8
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2951A48C51BF261D72AD67559FBA9@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5uDcOOSoO7d4WPBiphnM1XSkB+kTOh9AoBkwvOCSHP1bQRySUf+GP4ZBheEHlxcqvaonqx7FW7olZGccIKrMCh8MiwU2Ei/aSoB+6T+t4IIlDGISkxiZQkeJFzPX1YMnjlqoRcsLg5dnFwS5E8J7v3gzmgrJ+0+POEWiP3DWYsJDMW1k5p9ZWwhuFpWA2KlxORYaC3sW5UXozqmcC4NxXKpWHbN9OB0sA6RTnV84A3aHqHEvgxB7Zd/MNMdzzrbIH/Vl/ghzcjPGl+M1vuUFOgn/md6RLvJqKvzxR6K0+0ATNjoOMXdLTsD0Dxprejr9Lf9CgQYVFP2U5tuNNeqfHYfjAsNEf1qyPjcwdD8fHEo1uWwoclLIcBNWrncY3yyvSOfridVo2Y7ObFw7+OpO0D76gBQb/ZWZnQx5LqWQYrFcWznr1O5I3fZrg+wbZjd6KDvYAA62RNMw/czLKkcXHUon2yZn41fvRB5GLvL9N6CAV5Vgg5jA68FVV+vaWKPkJcFS++aJ9+vqeS9NXrybjbKoHi7udRNPrio5jB/njnFWjWpm6XB1/OfK5qYxlRwA58dN6o4xwdWZLNs0Dioix2wQT4UAQOc03on7yyLOuWdh/yPWAdkMg0bSOI4oqlQ8K7cXoKqQyWBXLa0kxj20cwEuAHK1fqud8YiMs6OWeAjRz2jSEFTnR0rZhP5Yk+/X
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39830400003)(376002)(396003)(36756003)(2906002)(33964004)(52116002)(83380400001)(166002)(8676002)(966005)(66946007)(478600001)(6486002)(66476007)(31686004)(66556008)(31696002)(5660300002)(8936002)(44832011)(53546011)(2616005)(956004)(16576012)(86362001)(186003)(16526019)(26005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cytpeUNaRTVLMWNTUnlzOFZlZTlXdEpST1JON1liMy8rMXBENlRDZjFpcXhm?=
 =?utf-8?B?c2k0cG9wQUZGemV4MzZIS1JZZGlCdlE2VDlLazJ6WkZwdDdWOCtZNEY1Ly9i?=
 =?utf-8?B?ZHJ1blZKcStCcml0c0d5K0pIQkQra1RELy9pQjJmQlA3YkFMYWhFYkdNd1hx?=
 =?utf-8?B?WlJwRTdVNUoyR0c5UWNqMUR1ckV2VnlWR1ZGUGVWMEh3NFh4ZE1wYmdoN1B4?=
 =?utf-8?B?Y1hBNWJwbEtLVUpmdFZJWGVuK0tNQ3ViUUJsd1JGUWVnNFpOSGtMdWtBdzhZ?=
 =?utf-8?B?Rnd2SXA4Mm43b1ZJZnJXVzlFSFB0N0ZJUG43TFdRM2NBRUxDTnNOWFo2THpw?=
 =?utf-8?B?T0JmTkFyM3B4QnFPeVNvNEF2TTdoUDlRRXJkZTNHdU0yZUhBTGlDa3lKR2dx?=
 =?utf-8?B?VnRBK3Y4eFZHczk0dEF4M01sbEV1R1VFUmpCRktkQjBaNmR1RHJTbXNJd2hr?=
 =?utf-8?B?QjhVeEM0VXVvb0E0bktTRDRmR1U2bU16cVdNM21JUjQvczNicC9TZ2lMR2Jn?=
 =?utf-8?B?MkJxQ0k0YkxvcHl2Y2hlWmdVaThEaXhvZmZZN1FNdUdwdEg0ZDhVSzd0Wkdz?=
 =?utf-8?B?Y0xNZUdDNG5wRFl0UkRGWktzRXRrWXIwSHFEUy9MNkRCTnU3WGZNSjlyb0dB?=
 =?utf-8?B?Y3JNQUJGUHhJZjJNOW56VE8rcFRTbkkrbkVLZTRNRU9LK0tlRmwvUkJzdkkr?=
 =?utf-8?B?UHN1dnpxbXkwZTAyYkVVb2lOcHlrT3hTL1pxMTBuRjIvS3NrNExHd3F0OUZE?=
 =?utf-8?B?RHhucVdnU01RUGFjM1NhRm92ZmZ2b3Y5WFBmd0VVSzl1WHN6bUN1SzA4REhX?=
 =?utf-8?B?NnVmaVBkS1IrTVF5eFFmN1JsN21wZ3grOFRBTG9pSDJoQzRXdld3VGZJZ1RM?=
 =?utf-8?B?a0pVaDVDb3pveW14NVVOODh0RkhabUM1UzFkYjd5aUJUa0dvcG5iVDdKYk1u?=
 =?utf-8?B?YzVqZmsrOStKdTV0R1NmWEEyTGwvcDVpcmhwaE42NGRjU0orc1A1WitqOGVa?=
 =?utf-8?B?c3RYeHdPeDJPT2JIQUtIdWtGR3d4R0JQNzZtU2FraXpTNUp1aEJOVkd2RXN1?=
 =?utf-8?B?U3hiMVdzaU02eTg1bzZnZXNBbTJFN1VVL0RuWURkNzVuTiszUGhrV0Y1TGVt?=
 =?utf-8?B?VzdzeWxldWlGRVV1QjlISEU5UG9ZU0hXM2pDYjZDTkhHSW5aek5YY0VqTG5z?=
 =?utf-8?B?OGhSdHlkQytQaDQ0RmhyMU9kL0FZRkZ6QkJvb0lyZk1oNU53aEcxUnpIWjJ2?=
 =?utf-8?B?QldoSkViUlpjRk9YUVVDMDNSZ1BqOWNDeGlFcnJVZmcyOGVpM3NEWklCSVh2?=
 =?utf-8?B?RzZsbEJjRDNkN24rOHRXUHFOcG1nQTNhQWFTNTNLS3RXUXcyS1MrMSszQmNL?=
 =?utf-8?B?L2dER3IyMjEwWkNmTy90dWtLcjk0V1lTc3FNREEvd1ladHFkdENzOFhBdU92?=
 =?utf-8?Q?aSYdXEfC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4487cbde-0039-46ed-940a-08d8c38df3d8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:09:32.3266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Bp4G7N11pIqg7kBVoT6OWYYytZVmAVe+r9W36YjowBrfcIRy6/EJw5VTa5jspH7WWT0wKWHiN0ycrssvoWJbUdo5i7XIRT4x1wg8LklBR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------F40F0CDB484363CEAFD4B9EE"
Content-Language: en-US

--------------F40F0CDB484363CEAFD4B9EE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-27 10:55 a.m., Leon Anavi wrote:
> - DNF (as used by RPM based distributions)
> - RPM-ostree (as used by Fedora CoreOS and RHEL CoreOS)
> - Pacman (as used by Arch based distributions)
> - Yum (as used by some RPM based distributions)
> - Zypper (as used by OpenSUSE based distributions)
> - APK (as used by Alpine Linux and postmarketOS)
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pako_0.2.3.bb => python3-pako_0.3.0.bb}    | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pako_0.2.3.bb => python3-pako_0.3.0.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb b/meta-python/recipes-devtools/python/python3-pako_0.3.0.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
> rename to meta-python/recipes-devtools/python/python3-pako_0.3.0.bb
> index 21c48fca6..3eacd0bdd 100644
> --- a/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pako_0.3.0.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/MycroftAI/pako"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
>   
> -SRC_URI[md5sum] = "8eb7077075091c50e4b8a9f939607277"
> -SRC_URI[sha256sum] = "6be55fd8c5a2a6f02974f37438c1c47a3d9e764ce81c9d0a1a8c9a1815a59778"
> +SRC_URI[sha256sum] = "eabd1c121d6701069d1a10132f197ee2b5f4e75a3d68a93b07f69214ab0ff9c7"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------F40F0CDB484363CEAFD4B9EE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-27 10:55 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210127155538.12229-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- DNF (as used by RPM based distributions)
- RPM-ostree (as used by Fedora CoreOS and RHEL CoreOS)
- Pacman (as used by Arch based distributions)
- Yum (as used by some RPM based distributions)
- Zypper (as used by OpenSUSE based distributions)
- APK (as used by Alpine Linux and postmarketOS)

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210127155538.12229-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pako_0.2.3.bb =&gt; python3-pako_0.3.0.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pako_0.2.3.bb =&gt; python3-pako_0.3.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb b/meta-python/recipes-devtools/python/python3-pako_0.3.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pako_0.3.0.bb
index 21c48fca6..3eacd0bdd 100644
--- a/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pako_0.3.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/MycroftAI/pako">&quot;https://github.com/MycroftAI/pako&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa">&quot;file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa&quot;</a>
 
-SRC_URI[md5sum] = &quot;8eb7077075091c50e4b8a9f939607277&quot;
-SRC_URI[sha256sum] = &quot;6be55fd8c5a2a6f02974f37438c1c47a3d9e764ce81c9d0a1a8c9a1815a59778&quot;
+SRC_URI[sha256sum] = &quot;eabd1c121d6701069d1a10132f197ee2b5f4e75a3d68a93b07f69214ab0ff9c7&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------F40F0CDB484363CEAFD4B9EE--
