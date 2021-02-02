Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.53])
 by mx.groups.io with SMTP id smtpd.web12.16.1612303790912706225
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 14:09:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KC+r+zVC;
 spf=pass (domain: windriver.com, ip: 40.107.93.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEN4yYx7HNQVDvhR8+uZKmaeiLINmF7oRMfTkKvMwQuVf1PwzP4cLi6X01o+WV+KM80m+fELOcvAU1DOMLRL2rvxtwEbG++BetKoMoXiMk6Un+fC0a5qfTQitm7SWOsc2Zt24RJr6xo7+DLQ7XeJrfoa9WQpEAQ1iOPRC8w2JM8ekpV3/6PRhgMxA+J8arX47P714QcJ+jOpUUXUuQobFSM7MJ/4+ZvWyIK2dA6HHc6KMJWCdPGOx8zjVy6FYhNY3Si3RMHFznlokt96WaKoMBdrqQICkoLf3UZWBDTo0bgSs1tuUZUEE26BAVYTpHIuG7UOMUli3X/HooqqpBeRjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFILAVj3FsyDgOcB3pVaAq7RmfwIlhHRX5BVBXoZLY0=;
 b=VnTr5UJDXIshz7+NkuaGDHBMQQISXH8NvCzTWr5E6D4sTu/pEsFeK0RF/qffJX3EqPmWvH/O11UYjUjpeFMuT+zbL9GUqA2jnZ6Zg8WYCcJ8fG81+WmQw1399fZLOCl0tU8FaJO5Q6823bJAvRu4kb90WCRwFFouJOvkqE+1IlDxeunqYfJ97jNohCEJOTL4YFQRkre0y/2DrwhC456JDCL0/gy3+CRFgVpdjaZc+gb/Km+q64SvWQWziQXb6Vb9ud7ncwOeFXs/zzkeqiCS5qNptl9i1lcs2zAy0GImYSWuMVojQSY7v7j0NxDbhc99LHAOl9JbY3eRdS4XXJkmzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFILAVj3FsyDgOcB3pVaAq7RmfwIlhHRX5BVBXoZLY0=;
 b=KC+r+zVC+c6BSEHg91mVKnKp/VtVv3GsZJsowaHALW4FInueORka2EzBOH9DhwRud7tQwjSwXoBXcEr4D5nSTO4ke0cbIIV8i8rNdvwicmpQNl2vtQPtC/6wGQN9B5bYBMemmGQNaPjlUyJ61MYIT5R5c2n8vEVWCrNCpKMzAXk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3448.namprd11.prod.outlook.com (2603:10b6:a03:76::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Tue, 2 Feb
 2021 22:09:49 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Tue, 2 Feb 2021
 22:09:49 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-elementpath: Upgrade 2.1.2 -> 2.1.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210201124516.30135-1-leon.anavi@konsulko.com>
 <20210201124516.30135-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b9a45f3a-ce3f-c1fb-9cf5-ac9894968fd9@windriver.com>
Date: Tue, 2 Feb 2021 17:09:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210201124516.30135-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR01CA0012.prod.exchangelabs.com (2603:10b6:208:71::25)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR01CA0012.prod.exchangelabs.com (2603:10b6:208:71::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 22:09:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cf68609-8d1a-43bc-bfd4-08d8c7c741f8
X-MS-TrafficTypeDiagnostic: BYAPR11MB3448:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3448CF7B31DEFBE329D089109FB59@BYAPR11MB3448.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8a8YAT5JMhkm+j7+yIQGpd9a3tMQ/J6jLmctqGz3xkND+KEVeyaySdCVMt7HGHUJrfNGSg8kp+uto4vH8k3Wo2vb+ae0333d+bGrW7KFxEM6g+ZISpQ20tHI9WisWKP2FIiN8m8AMLzBH2TV8zlA5BqDRKr212LIsKnMiy8nUYnzLMso7CPDtCnsbP/Uxjfn/8zT/Xx8hZWWOvo69Jrz4zrWmeozdakG9KpTInekav1GUarvFzyB3d2Ysz8jdpcY4FkgbtWrEva8z4LYZP+uFSCWFkzCALyBUb3FwjzNqQKpkTPOfEqkxIkJynzpc9IuorYYLJawtBt4SPtnyUxBPN5EDke6QWtxNL3lpGuxlq1nF8gRxQNowl8cvF2OICGlSO+3A9KcNYRtO9EJZDydey9ubM3s0mwsm6iXpXHwJxZCaAujqCp0BaTVsqdYldzDh6oS7k5Cqoe9qhHPqIhDvkcxjZlLRHCerMO/rDVNV+c+TA4aRr20McKSs5jQiB7Lpneth1+rLxkRBm0u/LcNDRzQeyORNHh2+WxPfPPiEa4ULZNDV4Vv1pbMlLg84wkDgfY/eBzMMvr71qMcu1GdmqkJ0zTNnk/zxp3KUJfww7rWDVXNbMQOki/p/5n/urWNJSJCnQ/GN5Rod8m1qvjCUA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(66946007)(31696002)(186003)(86362001)(26005)(33964004)(8936002)(31686004)(8676002)(478600001)(52116002)(83380400001)(316002)(16526019)(966005)(5660300002)(956004)(2906002)(166002)(6486002)(2616005)(53546011)(16576012)(66556008)(66476007)(36756003)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Y1hxaUlSV3NYVUVveVgwVk9UMnIvTDJzcW0rQ1RBMnlmWHNXTXd1QklBSHpF?=
 =?utf-8?B?anpEY3lwZURJa2xFYlI0djF6amZiSkt2U1dhZE5QaDUxb3NsOW1YN3IvdTl3?=
 =?utf-8?B?VVh1bFIrdEkxdTViN0VubG8yWGdOMEhwcEcwc3FISTN1TEdWVHBxTWhZSU5J?=
 =?utf-8?B?RjJCdFNHdXZGNjdGdCsxMGpmVHNtQjhLOGI1c0JKMkgzWTNGelBadDU4dlFk?=
 =?utf-8?B?OW1QTEVGK2xVRVNpTHUrWWFHR2IxSmNDTkY2QzVSU0NvN3k1RDBoU280K1RK?=
 =?utf-8?B?Nnd4dEZzNGtUbi9kSnlUbUpkSUkvMXltOGFKamgxZGRheS9DeU5HdEtqcjVW?=
 =?utf-8?B?YjlJUmt1NU5yQVVXTGNGbVllU1pTUEZET3N0WjEwRTYzdXk5dnMzY1Jxc0FK?=
 =?utf-8?B?andHREw1YkF2eTJQRVVWMUdiTk5DUlB3cjBQakJVdzJCUzZyaVY0OW96cmJz?=
 =?utf-8?B?M3A4MERSTFE1T1hkUjdpYldBZVZGaVdWNVRZZHdPSGNsL0ZoQlg1YlpSOEZx?=
 =?utf-8?B?YmM2amxHZnFTL21yTlZFTWFJNm1JNGFQV2gwc0RRVlNqRUFQcUZiL0UrQys3?=
 =?utf-8?B?T2hlaU8zeGNLVUQ4VnBsWDFDYkxTVC9XYzNjdTZMMStNOHF5M05SSHB3MDlL?=
 =?utf-8?B?YmI2UGtlTDhnbzRRZzcwOTBneG5qbTQzbXdNbEl1RXZhczBPdDdJRWJlNkdi?=
 =?utf-8?B?TVZCSnNKM2hvRlZSejR1bVZpenEwcE9UL05zVHNIQ3Z6Z3JoTitQOVRrZ05o?=
 =?utf-8?B?WldkQW5FVElRUHhjRE5hbWVsOWd6ZmQ4VE9IV1V6cXMvR3FLZk1VdlJ0MWFP?=
 =?utf-8?B?WkJpQlFWVFczRlh1eVAvRXBBbTAxNnZEdWFqcFlRTTZUYjFwQ2pjZ3NCVjNs?=
 =?utf-8?B?MnpJS1YyQlY1bTJDbUd2MDdmYWw5M285d2Y2RFg3MVhTOEFXQnNJYTFWSG5P?=
 =?utf-8?B?RVFuTkZ0MDBVUENVQUdkQ0lSOE1iYitCM1FWU0l0aER6MXhXZFNnQlNZcVhj?=
 =?utf-8?B?QXlXT29xd0R6QjkzSHVYeHRKcFc2RDhMbkJDbzVTT1hBVTVYaU5LNmZMSHlv?=
 =?utf-8?B?b1VSNjErWjlmSkQxcndVRXh2eEMwK3ZWd1NqaFF5TVBNaDgzR21jeDc1ZzhY?=
 =?utf-8?B?RnAwVTZWVCtJNXF2dzBkYkVFeFBiVDUwNlhUalVjMlpFdElUUXFwaFoza1Jr?=
 =?utf-8?B?clB3cW84NzNXNHRTUExnUi96aXJGdWx5V1N2REpsOEcwRlNEK3BjVHAyaldU?=
 =?utf-8?B?UVJ2UGIyaFFFYkZLMnpYMTVEaTFyVmphbGVIcGNreE5URTdJemhjamd2TmY3?=
 =?utf-8?B?aEVWanhEMFV4anQxU0lhZ1hudTltSlhUMW8wRWVYMENNTWsyNDN6VnpKejdh?=
 =?utf-8?B?REdWaVlDVTd4OFMxZ0JwVXBmSW5Yak9Vb09ONkpWNHVtMmsrdFBhU1FNemdt?=
 =?utf-8?B?ajl5VmFzMjB1SmY2RzZqekk5b1RFbnN5dHFndXZRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf68609-8d1a-43bc-bfd4-08d8c7c741f8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 22:09:49.3744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yZTe6/QDWPKGuI90mbTPKgNLENQz6gJRt6Y5GVrikUqozt15q5YmXL3qAGuaoRkZB9weoTTK6cfexPCpapq3xY8ky4yRasjm6NoXNgm4EU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3448
Content-Type: multipart/alternative;
 boundary="------------A120050FA182FE7DDF4549B2"
Content-Language: en-US

--------------A120050FA182FE7DDF4549B2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-01 7:45 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.1.3:
>
> - Extend tests for XPath 2.0 with minor fixes
> - Fix fn:round-half-to-even
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-elementpath_2.1.2.bb => python3-elementpath_2.1.3.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-elementpath_2.1.2.bb => python3-elementpath_2.1.3.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
> rename to meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb
> index f47f15222..2cba4fb5c 100644
> --- a/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
>
> -SRC_URI[md5sum] = "887f60e9c4fb9b0804a38372b2798101"
> -SRC_URI[sha256sum] = "23e1fed8d196d9a6cc4d220ef11fbe7eb8cff3a27848621c447e9d96134b2085"
> +SRC_URI[sha256sum] = "b729d9376cc0f76479c9b0cef30cc0d3c9082ccb4507caa0da1a5e4964926960"
>
>   PYPI_PACKAGE = "elementpath"
>   inherit pypi setuptools3
> --
> 2.17.1
>
>
> 
>

--------------A120050FA182FE7DDF4549B2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-01 7:45 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210201124516.30135-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.1.3:

- Extend tests for XPath 2.0 with minor fixes
- Fix fn:round-half-to-even

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210201124516.30135-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-elementpath_2.1.2.bb =&gt; python3-elementpath_2.1.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_2.1.2.bb =&gt; python3-elementpath_2.1.3.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb
index f47f15222..2cba4fb5c 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_2.1.3.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/sissaschool/elementpath">&quot;https://github.com/sissaschool/elementpath&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf">&quot;file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf&quot;</a>

-SRC_URI[md5sum] = &quot;887f60e9c4fb9b0804a38372b2798101&quot;
-SRC_URI[sha256sum] = &quot;23e1fed8d196d9a6cc4d220ef11fbe7eb8cff3a27848621c447e9d96134b2085&quot;
+SRC_URI[sha256sum] = &quot;b729d9376cc0f76479c9b0cef30cc0d3c9082ccb4507caa0da1a5e4964926960&quot;

 PYPI_PACKAGE = &quot;elementpath&quot;
 inherit pypi setuptools3
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

--------------A120050FA182FE7DDF4549B2--
