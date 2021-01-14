Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.61])
 by mx.groups.io with SMTP id smtpd.web11.281.1610649936646949659
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 10:45:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=a4aPPI47;
 spf=pass (domain: windriver.com, ip: 40.107.93.61, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UILwPUHdkPPKuonNI4qPPFwthFjPQeIhbf1mPK4mEwjdGaWbbLomHCp4MFAyQmK4vmsJlRaUTF79JMJ0i5n0XJyD11MFgIh/nsbwWktDxgaUTtB4F5ytEY0+uamC7E+LHf3Nk4EgJsW3bGVRiS13X1BlhdqQrIkEn3+M2TeMBJ41smWEVb81IFrJqMH9zUgTTEwdoxrtyhrjJcbN2iJPMAubJYFbWaINtVWwTOcSnWWeax9c8lAwT5n0cmCMNiFXoeb/Rs6uDr3NuY0oTdsIfxYt8+hIG9nHiWR8S4HqEqjJbon6186ACp4iA6Wwtv11ll2SHsuWn6n03kuRGVIq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjmeCZciQkv8CUSmBq/G8yaDlne4EucCDdrlba3JIeI=;
 b=UcjRDYOK4TMy7iwYqBKC8ROM8lRSuEfMBZSmd6FfP4J7GmvznDif+8dSM8JIWNG5/VnN1bfphqX3fWEWwAitmr9lmC+FVkSB/sy1oJLEHbJmBr8EYNESwJ4H0WFXQoe7lW3Htu4YRXjse4UujPs5UO7ls7uoyMtB4FRSD6cY/cWju/djEu/Uu51xHCiCwEF8d1YgQUoN/LpFuLvEKO13RjhuSC5KF1Pm81BxwEo+vyR+FI1tP/VjGLwae0NU5tmx3TmLN3MXhYpghEhPNNlKplkJ6nBBUtjvSYatQSLIi4eKQAjFFT0Ovyqf2Ga4ma/ucqa0SkwMZoAdybgrcUdJlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjmeCZciQkv8CUSmBq/G8yaDlne4EucCDdrlba3JIeI=;
 b=a4aPPI47dsjxAeIWmjlA+LYgkD5Z2/fAczGwUqsrLoGB4/bib9l7sAshcJuolX+uN19v3m5gjCe0/xRJIt5v401T8erXhA3vp4JavSMib0JCYnO2btNFEk+QqR1ZnNJexIlGqfQIWxHRAfzKKLHWidEmz4k41vuza9eTC/XR7m0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3479.namprd11.prod.outlook.com (2603:10b6:a03:1e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 18:45:35 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 18:45:35 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-wheel: Upgrade 0.35.1 -> 0.36.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
 <20210113142626.27599-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1ed315f8-36e6-641a-c460-41692f065ba6@windriver.com>
Date: Thu, 14 Jan 2021 13:45:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210113142626.27599-9-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BLAPR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:208:329::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BLAPR03CA0077.namprd03.prod.outlook.com (2603:10b6:208:329::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 18:45:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f7aab84-dd75-40df-3001-08d8b8bc9445
X-MS-TrafficTypeDiagnostic: BYAPR11MB3479:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB34797871909FB0F493628E269FA80@BYAPR11MB3479.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QQ/JYth2q0Bs+dAB7d+nZ+oLuKN5b9ZlT/MJ2bdjKlsKxSAPiqf6P7B+CJ3d9myy5BLB4s50rXYAzrG5kNGWuK91eDswLBSxcmGpP44q13ope4cFlVwCvmOaLZehTu+T7g2NoKzYduyBaefDk9GGtct2DM5gOKzUcU0T0uL31NTpp2lldKrPxwwb/kXw2Fj+Nfu9y3QrZTtofkBPC69BwYWVTtQyJuSrjdO67/jExFTpQSSKxC6jB2pVx6t8SfnEJrqgiCWAREThTQ7D9Aiqrze1skgZEIDBOL1LWOVBhX3f12CunM3+ZTWtbv02IHwrRya7UEY8X8I+uiKnwspZhbcQ1jzfaR7Nqo+gtvbWGBWN/BTPTIaT4p9+Nagtj1/YsCiXutcd6hNCNxJbujPKYDiKa4l8JakZYDvXnliuWjjhLC16l1RJX/F4NlkoAtS1kBbJvh3YqgsTkr7SZ7a4YnXoP99kfxsU2dqaH88RqAGvL10STdBVdj+kbcEnbrzRf7QVpeNEWHJ0ies0D7nhT39k4Ym5q7iVOOKZ8K/p4XiA4wUQ0kqoThAUOuG+aDaY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39850400004)(316002)(6486002)(186003)(44832011)(83380400001)(36756003)(478600001)(966005)(33964004)(16526019)(956004)(52116002)(26005)(31686004)(5660300002)(2616005)(8676002)(66476007)(2906002)(86362001)(166002)(31696002)(66556008)(53546011)(66946007)(16576012)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZGRxbHBlMzh6ZjMrRVJDRkdpbmlKaDUwZnlZRFdma3VyT2NybUQ3VUZQOXJs?=
 =?utf-8?B?V1o2L1E2QTRwbEpWWnQrbStxeHM1NUpzbVFNdkxaSXYzMlllN3p4VkhyYStk?=
 =?utf-8?B?U2ttK05VcDFaNVVkVWdkUy9EbXo0UWlaZkJ4VzVSSXBjb0dNcXB3ejF0UkJX?=
 =?utf-8?B?VHd0RzhrM2RhQzZjVGxOemxEZG4vc0wwOHBZdlNLcFNOaHRGVmNmTkhLeUJE?=
 =?utf-8?B?UlZpN0RkdUpEUEZYTThJUDZ0M1VsTXhkN2dDUzB4T1VNQjhVMDhCTDlwbFFI?=
 =?utf-8?B?SkxYZU9YNEg3Z0ZOOExSZUp2TUpZQmxBTUdvVWFXKzJwTG0wNW10bnZpRjFK?=
 =?utf-8?B?M2JoOXYrZXl6ZTF0VU8rZFQwQmh2dnFSRi9Qak4wRlJoL3dKbVNPa3ZNRXY4?=
 =?utf-8?B?VEJSU1U3b1V3RFVHTjhYV3V5RTBPZVNFcjRPQ0pWdkZXdnpsQkthcUs1RzNF?=
 =?utf-8?B?VXArc0lHUjROYzFoOVNuQXdydURhL2xuV1FlNG1sNk1CWnVBclEyUmF0Sk1p?=
 =?utf-8?B?Tm4rS21CYTQwd1VhYm5IOUdZN2JHN1BDVUZCNWZ6b2FDWTJYTlV6bnUzU01x?=
 =?utf-8?B?dW5CeldMSWU3WGI5OXVJTHVRU2IwOVpKMUY0c3N1SkowckpRbS83WmFpc2xs?=
 =?utf-8?B?SE1BWWlGUTJuajN5Z1Z1bnFaZU16UlNFbGhnZkE0RVVJclN3MGJVQlRjRldL?=
 =?utf-8?B?NlVDdCtXQzArM1ZzTnNVSUdaU2JyL1d6TnpiMmRpQTZ5Z0RMa2lFTEtlNkN1?=
 =?utf-8?B?bi9rVUZGZzdMSCs3N2ppdXpZS0FtZnpSK3o4Y3NOMXA0ai9idEtJSlFIN3hU?=
 =?utf-8?B?V21LamllUnNDVFpFYk1ReDNWRU9WZ05yNlBjSm1YbllMQXFyaHA5eGc3WTRl?=
 =?utf-8?B?K09Sbk16SWNmNnVCaEVoZ21NZTJ4UVo0UmJrSnFsVHdidUhWT0dKdXloZzFN?=
 =?utf-8?B?TVltR05ybklGTW9VanlnQlU0ekNKY08xNFpqMC9mQ3JpS2ZrYkhSUDJjZmF2?=
 =?utf-8?B?Qm52QzdyZXVjWEhRWU1hZ0N5Ym90c1M0bmUwRnA1aHNoYmhKeUI2amtGRWpl?=
 =?utf-8?B?MjhkRiszVE04cFpGOFJ6dEJZY1NXMEZCRmlGNUljUDZHSHZ2SDNidU5GcVNt?=
 =?utf-8?B?Qkh3RzFPd0tmSHBZVXlNQkNvUUJyTm1SNFhKMDZKaVRiUUxnV21GemI5MzRC?=
 =?utf-8?B?YmJiZTh0dUhjbmZ0NFdwRVJzYi93bGhrMWgrMjlRS1RLczQ3WW5QL3pEQno3?=
 =?utf-8?B?V3J4SGE0elNYWDdLcUJKMGJickxRMkh0V2lEZXU3cFRzdU9KcDlTQ3p0SWlI?=
 =?utf-8?Q?qBjlWiEC2TsrEQ99HyapRFJALcKg4oa54P?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 18:45:35.2950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7aab84-dd75-40df-3001-08d8b8bc9445
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMg6di/FDBHoFvOYwgmspyzj84IQkDPz9SA6l7SZc862CzqU1fJYK3Ch64PCj+eS9cOnN8duGvPoKRfkQBts6abnZfIm3NlJkIkFiquJi5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3479
Content-Type: multipart/alternative;
 boundary="------------A5A327908BC0D292C6FF7B2A"
Content-Language: en-US

--------------A5A327908BC0D292C6FF7B2A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-13 9:26 a.m., Leon Anavi wrote:
> - Updated vendored packaging library to v20.8
> - Fixed wheel sdist missing LICENSE.txt
> - Don't use default macos/arm64 deployment target in calculating
>    the platform tag for fat binaries
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-wheel_0.35.1.bb => python3-wheel_0.36.2.bb}       | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-wheel_0.35.1.bb => python3-wheel_0.36.2.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb b/meta-python/recipes-devtools/python/python3-wheel_0.36.2.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb
> rename to meta-python/recipes-devtools/python/python3-wheel_0.36.2.bb
> index b4e77ea84..9d9a441c0 100644
> --- a/meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-wheel_0.36.2.bb
> @@ -4,8 +4,7 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
>   
> -SRC_URI[md5sum] = "7ec7c435cc73eefebd9f0af43c120044"
> -SRC_URI[sha256sum] = "99a22d87add3f634ff917310a3d87e499f19e663413a52eb9232c447aa646c9f"
> +SRC_URI[sha256sum] = "e11eefd162658ea59a60a0f6c7d493a7190ea4b9a85e335b33489d9f17e0245e"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------A5A327908BC0D292C6FF7B2A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-13 9:26 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210113142626.27599-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Updated vendored packaging library to v20.8
- Fixed wheel sdist missing LICENSE.txt
- Don't use default macos/arm64 deployment target in calculating
  the platform tag for fat binaries

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210113142626.27599-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-wheel_0.35.1.bb =&gt; python3-wheel_0.36.2.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wheel_0.35.1.bb =&gt; python3-wheel_0.36.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb b/meta-python/recipes-devtools/python/python3-wheel_0.36.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb
rename to meta-python/recipes-devtools/python/python3-wheel_0.36.2.bb
index b4e77ea84..9d9a441c0 100644
--- a/meta-python/recipes-devtools/python/python3-wheel_0.35.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wheel_0.36.2.bb
@@ -4,8 +4,7 @@ SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489&quot;</a>
 
-SRC_URI[md5sum] = &quot;7ec7c435cc73eefebd9f0af43c120044&quot;
-SRC_URI[sha256sum] = &quot;99a22d87add3f634ff917310a3d87e499f19e663413a52eb9232c447aa646c9f&quot;
+SRC_URI[sha256sum] = &quot;e11eefd162658ea59a60a0f6c7d493a7190ea4b9a85e335b33489d9f17e0245e&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------A5A327908BC0D292C6FF7B2A--
