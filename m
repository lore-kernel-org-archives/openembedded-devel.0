Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.74])
 by mx.groups.io with SMTP id smtpd.web10.2918.1608571069778408780
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Dec 2020 09:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QKty5Lx2;
 spf=pass (domain: windriver.com, ip: 40.107.68.74, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMMy6S6r3cwS4FCBr0fPwp8wqn69LXt3Nl58ypqiiNWjxJY7IbSU7cwUTr1otguka2kAqDe4x5nE5WUHIGuSfow7QMVUL4nMuOTckS+YIWri+Pp9Psx0fbjsdlK4LtfBEEnnJ844bUW/38OBCBGeIicNPBpSaCrxifA+NbuIh1eeaJLyHMnM0jSl+8n6k8GMOk65F9qoGe/uKUwnm9RdkczGtbSWfOwB4wvQCUTXpzglNwY1yIRFAsGF8NfM9vGNOkw7YtEE9skrnCrEbFd+6tbawiyz3LoyJeZ1KdUo2FXt7PPFSaI4YyNc4/Sf5slLX1DwrqOHDZtWm8Lm4+nl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrXYivnCIRKi2JvzQMA0AxkleXXjvE1u5LfdB7KAo7Q=;
 b=jjBKtsB6KUZndrYXIm0DfRVU2NwCkAsL+xNgSYUIVrCIFQpDWyofhijpnyPnN4Qa9F1EF+I+l9FUG/sFd/yCg8Uxn2Oos6p0T/OkeLolfulh9Qpvj3eRcnthkznNIJRqYQJifn3eb6jBkoMDuIkQBMmeCHwv3VegRemyVPgKcBQXns1oefS9ZP239XMVxg7MnNZlSvXNO4bWpdF1peTt9kbRsR3a33rbh8BYltGGcb6OpiPt/E5vsTybwK8PjXjKujWR9kMg+aHV7EmdfnIjwB1Mlmx1l6AkWLUU8rZoqtaCOWPvHONf9skMuCcgfUO4MU8DlJSGfqWZ0r3Oj51ZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrXYivnCIRKi2JvzQMA0AxkleXXjvE1u5LfdB7KAo7Q=;
 b=QKty5Lx2X27Zcp4BxgD/xt3Pj4QRBAEb51kg+prfaxeCVac2kRIx8QinxWNqHQ0LTymAuml4w3pkDC/aFjx7n7E5Lra64068GTEkPtnTap4WVzoGOJz1pcqNzkgBVyxozn1A04j66USUym1UxNVlb38WkUZRRy/eRPaOdsHDlrI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2917.namprd11.prod.outlook.com (2603:10b6:a03:89::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Mon, 21 Dec
 2020 17:17:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3654.033; Mon, 21 Dec 2020
 17:17:48 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-fasteners: Upgrade 0.15 -> 0.16
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201218214748.14563-1-leon.anavi@konsulko.com>
 <20201218214748.14563-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d5d13869-4328-e553-dbd9-f03536a7d670@windriver.com>
Date: Mon, 21 Dec 2020 12:17:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201218214748.14563-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:208:134::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR16CA0002.namprd16.prod.outlook.com (2603:10b6:208:134::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 17:17:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f4c7037-b1cd-4347-84f5-08d8a5d456e2
X-MS-TrafficTypeDiagnostic: BYAPR11MB2917:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB291739CBF5DB6FEAEDB6A26B9FC00@BYAPR11MB2917.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XBP1t3qYBHAE5uVREnsqKTcYCTEDFJvjK5pFSBGXrghyvvBf1vD7oXP8DW4BxARSDrn6Nqq79tefOOft7AGS1mkpgAXW8xVqf65mZfwbf5YWcIjxN3JG8y8wz83wyCoSHCm0q4x1JPwPE/AdBVRDMed71D9uyvTBMOn9VOnS9eRGTTZgGDXzTEQNBa3RAaRTMRWqgozEFL+mlC1miqtnTYI9ck1gV3tkN3yuR3gb/kzsdhUjdMpwLiaID/HQ1UjLD+ivZ5oHRjnITs6UQER5/QH6edrRnVFkMjDjRUOG0+GLLtkW/dgUTgaa278JUN4raTfgIS3wQArZGZ2z6ck1xhxqESf5qZpnmNGkEntBGZSxpNKAo0EPk0lZlIfXobvsdk1JSEDiTwVru4MPZJXc/qKLY4p10MtdbMCfRY9G8OfzFOHJcy7/rtqwsgBa7ZqI2CjFCzvx1RFPMsu8ye32gi7mc5xOsn+lf7J0GgClcCosRfRHRUbyAGqmlv9oBxLjqsrhqwFl7vejdVhhqmnESrWMN5gq6ru+/s7IPt2PGu0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39850400004)(366004)(16576012)(478600001)(52116002)(31686004)(966005)(16526019)(316002)(36756003)(4001150100001)(2616005)(66476007)(66946007)(83380400001)(66556008)(8936002)(6486002)(44832011)(166002)(26005)(53546011)(8676002)(2906002)(86362001)(956004)(31696002)(33964004)(186003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?b0tuOXRNeUtmVVFhaVVJNHFRZmpoRCtncXR6VURnSkNPdzd5KzdXME5GVCta?=
 =?utf-8?B?NjJPWXZQUVMzSmMyK2FHWVNuTUczT0M4SGNERTFhdDNiTVhNeHlROTJCUHlB?=
 =?utf-8?B?SkRQRzI5VzRoZHVERGFNUXJMbU5oNk42MG5NemNVR2NDdklDSXZJUkgvOFBQ?=
 =?utf-8?B?cWpVZXY2azBmTi91dVJsYzBlVUpWWGFjMWtkSVZydmVhbUx1bzA3c2NWZFla?=
 =?utf-8?B?NDlqWXQ2amNleDZLQndKeFFvVjg4K1JCUW4rbkp3NWVyOTRFSFIvUjJGMkVT?=
 =?utf-8?B?ckRiMWlNd3R0a2pkUkpTWEI3cmNoYlBoUnUxQUpZRlNwZ21ZWnByYjVhTzNB?=
 =?utf-8?B?cTk0dHdnYUlDVXdrbGJ2L2trakJuQ2IyNWJMSzlpc1dFUUo2NE5Pc1pxR0lu?=
 =?utf-8?B?dXEyWUR4bTErcmtlSzVFc0dXazZBWFR2UXg5SmhDazAwMVVMZkpvSThha2lU?=
 =?utf-8?B?aXV0YWh1bVk0Um5tR1JiMGU3eXk3WENpS3NtR1E1dVB1MWk1S3NGZlZDakNl?=
 =?utf-8?B?MUVMYTdFQWtsSlI5TkJvNGpoRHF3OXpVcGRMdFFIaEZYMjNoMTBpUDJ5bkhr?=
 =?utf-8?B?c04zQS94SkZ1aFcxV2MyR2R4NE5Gb29SSnVYeFpVMHBkNEp6TTlVVVpNSGZl?=
 =?utf-8?B?cWhHbE9nU2xnd3ZDUHcyQ042NWVwMHNyVUxraDBhVWVya2JtZDVuUWFvRlZq?=
 =?utf-8?B?Y0lYNys1MkcxSWJqVEZTTnVRVzlDV3lxV1U4Qy9MWHYzNTJ4NWJqTmFndTJm?=
 =?utf-8?B?UDhDdzBOM0FyUWZ5c1N3WGc1TFVucmdTWSswb0RBbzlURjUrTVpudEhEa3Uw?=
 =?utf-8?B?djNQcW8rUlI3MTJjamZ2ODMxTnRjYUdYSHlkWGpKd0RqanVzZ0g3MTRyZ1NY?=
 =?utf-8?B?RXNWdGZ2MzZreFljY3p6Yll5cGRWVUJzZTM3L0hicjFPN0dmYVZrNE9TR0Vw?=
 =?utf-8?B?M0hqZ2ZqdUtNQnNoai9XdGZtSytXeXJmM0R4eTR5VnNyUHBUTmhsa0xacnFK?=
 =?utf-8?B?OTZ0K3EvMk9kc0NHK01XaFNQb0xaQ1BMRUhSYk1EUWV0RHpQeTBrUWtJL3dR?=
 =?utf-8?B?Z0ZCNFovV1VKWTI4bC8xTjZZb1ZLRkZiRkxxckp4dE9OaWdTanRiUUd3SHds?=
 =?utf-8?B?UjJVWTVBdjdiQW5ncjNQdFB5K3pvVjZRK0YwRDVxU202aFVXREtRbG9CL3VW?=
 =?utf-8?B?bzhkQ2xNRUhraGQyK1kzeGszdk44dXMxOWtGUXZHVG85STVBdkRFSHBINmdP?=
 =?utf-8?B?QUcyV1ZGZnljK1pIRWxlcEdhNyt5dE9rdndSNFZ2TGpXWTBkT1NHNmFhQWFv?=
 =?utf-8?Q?RwtNG/3mlNvXFvIR+FkYXM0kG/+TSagXm5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 17:17:48.1231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4c7037-b1cd-4347-84f5-08d8a5d456e2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tiC7GGDpckx4yFi2OdokjwpfQDHzo/loneX49L2fWTHsV54PEslaXzOQNntXh2099NHGVx9YuKYxfjVpt6PaLZQ7Yg476Vh7I1dqnedPUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2917
Content-Type: multipart/alternative;
 boundary="------------9652AA97406F4D518BF9656E"
Content-Language: en-US

--------------9652AA97406F4D518BF9656E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-18 4:47 p.m., Leon Anavi wrote:
> - Move from travis and appveyor to github actions
> - Add interprocess reader writer lock
> - Improve README
> - remove unused eventlet import
> - use stdlib monotonic instead of external for python >= 3.4
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-fasteners_0.15.bb => python3-fasteners_0.16.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-fasteners_0.15.bb => python3-fasteners_0.16.bb} (62%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.15.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.16.bb
> similarity index 62%
> rename from meta-python/recipes-devtools/python/python3-fasteners_0.15.bb
> rename to meta-python/recipes-devtools/python/python3-fasteners_0.16.bb
> index 8786a14842..eed8d2c957 100644
> --- a/meta-python/recipes-devtools/python/python3-fasteners_0.15.bb
> +++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.bb
> @@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/harlowja/fasteners"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
>   
> -SRC_URI[md5sum] = "440f8ab461c8fed941355860d8669556"
> -SRC_URI[sha256sum] = "3a176da6b70df9bb88498e1a18a9e4a8579ed5b9141207762368a1017bf8f5ef"
> +SRC_URI[sha256sum] = "c995d8c26b017c5d6a6de9ad29a0f9cdd57de61ae1113d28fac26622b06a0933"
>   
>   inherit pypi setuptools3
>
> 
>

--------------9652AA97406F4D518BF9656E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-18 4:47 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201218214748.14563-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Move from travis and appveyor to github actions
- Add interprocess reader writer lock
- Improve README
- remove unused eventlet import
- use stdlib monotonic instead of external for python &gt;= 3.4

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201218214748.14563-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-fasteners_0.15.bb =&gt; python3-fasteners_0.16.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-fasteners_0.15.bb =&gt; python3-fasteners_0.16.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.15.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.16.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-fasteners_0.15.bb
rename to meta-python/recipes-devtools/python/python3-fasteners_0.16.bb
index 8786a14842..eed8d2c957 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.15.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.bb
@@ -3,7 +3,6 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/harlowja/fasteners">&quot;https://github.com/harlowja/fasteners&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52">&quot;file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52&quot;</a>
 
-SRC_URI[md5sum] = &quot;440f8ab461c8fed941355860d8669556&quot;
-SRC_URI[sha256sum] = &quot;3a176da6b70df9bb88498e1a18a9e4a8579ed5b9141207762368a1017bf8f5ef&quot;
+SRC_URI[sha256sum] = &quot;c995d8c26b017c5d6a6de9ad29a0f9cdd57de61ae1113d28fac26622b06a0933&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------9652AA97406F4D518BF9656E--
