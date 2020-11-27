Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.46])
 by mx.groups.io with SMTP id smtpd.web12.19139.1606484943267232238
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 05:49:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oq6RM3JT;
 spf=pass (domain: windriver.com, ip: 40.107.237.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cT0EFJXGmQmLlIDnhdMbLmRNBBZy27MnfZtZb2MTNvuF7nCGOSCQuXmSkl2atVP15cvZC0Vx9bftD5IP99WNdr/0yOXZZAhyii/WR7lNLEFFziVQ3JJQY47+0XSjt69oeliCIsPQQlvGTm9i+H+Nbqh4TdNDwMmsLpvLdmCSIEJM15vYnQuUuKEnTFQboveYAKnsN1UZSDj//4L7NylBix7KJw+pkBHnlqgJEb8VQo4LPL/PIDfte4cNyKDAYZJ8pRXqGy/KcJkeUzeYT2aSJb9o/iFiMCO6wHir0nRLOEt7bFbXsvqn8CCI/N0ww5uKQXwKp6/ACbB9sGVBSXJn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwkpIr9qi6cLBtTxz1s6a85+r2Qu0JXJPUvads9KUCE=;
 b=DdDRTibmUsza3L14VJUAsJM/9fhQevwkswgo6PMlAPAFsgujrqr0OEHXeXf9lVHEWDe6DQ4vSMPEudIhO7fRnSg83zUd1Dc2w0dow7s9pAT/ggeamqpUO1WGiv8z0mANDe0KJDZrJryXSB3the1NxrjR2Bmc85KBgcTXhGCrQUgw8b4amUCZagvsjg0o8lHd7wB8J0+JElEcrGEJ7jvG0FfAX86v0c+0C/3sPAVWJwKQanE9uIBWBxhxYJSQflrdtr0ANLspUMsFN/lmrhiP+FDRufrevov7NhxpI1RHS6T+Lp+6+Gw3kHZWSbLZWY8w0Ha3JM3LbM41WBfTpe2Tgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwkpIr9qi6cLBtTxz1s6a85+r2Qu0JXJPUvads9KUCE=;
 b=oq6RM3JTX6AhbxJoo0Fp3JI1v4tnMSO5VbGtLvaurJ5JHYtEgJzSKvPQTNHBxu0RC/iB13+IwuS72cBEY41E3UUbPSKS4LfgKOt1E/Ek6r8YWkBIDPnCy/lY6QGw+C6PpYAYZYhu4zS4W2RJRu3Zt6V0c986v1Z37ZlvWqi6MUk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Fri, 27 Nov
 2020 13:49:02 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Fri, 27 Nov 2020
 13:49:02 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-luma-core: Upgrade 1.17.3 -> 2.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201126112215.11451-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9a0805fd-63ca-1bb1-4e83-1d2989c5767d@windriver.com>
Date: Fri, 27 Nov 2020 08:48:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201126112215.11451-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0053.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0053.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 13:49:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10575696-61eb-42d5-72fe-08d892db32a8
X-MS-TrafficTypeDiagnostic: BYAPR11MB2598:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB259849CE03C947E7C070B8E69FF80@BYAPR11MB2598.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lw2rsYWck5ISnvmq7zt1U+ppMVwWXiHGnp+o4CSwanytIO9AC62oBm5wOBJlHU3Xi9hwIliam0v5UP2yhrDbbgKnZ/E7aC8U77lU1qFv488hU35WhVW7a3qKgmJU0YyA6kncV+A+sRKxaHttrRzry832cjp3+NZFtONVivV6VsAoDg5n5qE+vFDFqmW+vwqn8DFo0xGhY2+tx4Y0dM5XGPdgAo9izp8vvnK2S/cDXjYw6kxdnD8de8wmHLKJhcS9aP+G4snMlrSeA+6yhwUnWdc9h3ePc81Jjo+Kjy4nSdazrVAdi3a13+mhwYJpHoNxKblaw3Sldd8lC32eUHC/7aV6gRpV/C3BTH7xcQEzdBU65QlF4Qi/F1kQrzxlauKiGJMl50IX6tLMiedrMYcbcYKQXCKycP1J/Orbk48XkftMecZYlXCIgQxp8y90RlgdODNJ97ohea2qJ1jyOthyYg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(136003)(366004)(346002)(396003)(186003)(2906002)(26005)(16526019)(52116002)(6486002)(8936002)(83380400001)(53546011)(478600001)(66946007)(33964004)(86362001)(966005)(5660300002)(2616005)(956004)(166002)(8676002)(316002)(31696002)(16576012)(4001150100001)(36756003)(66556008)(66476007)(31686004)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NTN6R3RQK0RFNWZ6Tzg2SStBaGV4SGFwZDc2RjZoM2Y2d0dCZ1BZbHE5L2ho?=
 =?utf-8?B?ZVpIcEtyalc3SU5zaCtSb3RXcFFIaHlsOW1wZVd5UVJVTWh0Q28xeVNzT3BZ?=
 =?utf-8?B?cTFhd1BYME5zNThnYnVPNnpVVkdwZjVVYlpKaGJzTnpybTBya2pYckhLTk02?=
 =?utf-8?B?akllUllhTE15aHhDK2JqTzhPMzg3OGxwZ2ZlS3ByYlNVTzlmQWJueFE4c2V1?=
 =?utf-8?B?Q21QWmhtR0k3eklsTjB1UC9YRTV3OEJaUDZScTJBN1padTB3bzRQczl3QmhK?=
 =?utf-8?B?WVNza2Z3NUh2c0pRZ1hjbDdmdTM4c1VwTmw1OXp3L05uR0FPSzVuSFYvSHdD?=
 =?utf-8?B?YU1iQXZDR2x6K2tzVjR5bzNRRStYS3N2dEJFVkY4emlQbUMrWk1IQnRYS09p?=
 =?utf-8?B?eUQ2S1F1aFJoY2FkT25FMm16UDAydlFIT3VBQytvTEdHM0hPMFVtYWJMRktv?=
 =?utf-8?B?L0ZqSHNGQ0R5R3gyU2FnMTZwSWVWTUZ6a0JOY0ZyN2hRUlV0ZG8wQ0c5bVJ4?=
 =?utf-8?B?bzVtTjFrZGhjdHJUZkZiWWRMS0tPbGxSUVhyOENaQWtHekFMZUM0akREL09P?=
 =?utf-8?B?N00xSmJXWXRQL0FMdHVUaEtqVU5semRkMldLMlVZRGZacDNjeEUvL1NRc2hL?=
 =?utf-8?B?UGRYZmlNcm5OL1FLRC9FOFQwWEhNUTcySjQzL3B1Vnd2THVQRmZrU29WQ29O?=
 =?utf-8?B?OHh2STYrc2VwVDZWbTZkL0VRRHBCZEt3WmZvanp2M1N0OE9vdlRIam0wanRt?=
 =?utf-8?B?UjNqeXNRbnN4UDZvVTJ6S1dtQ0xEVVRrMWZ1MXB2NHhJYXFDd3JacWJ3M0RF?=
 =?utf-8?B?SEQ4bFpQd3FjT2dySkdrd0ZJN3ZSY3E2ZlBKWXgzMkZ3RDN1OC93MXhHL2ZC?=
 =?utf-8?B?enVmbEp5ZnNFaGxQZDMxVENkUHA3MTFSZGE3c2hIVEJYbCtHcjhqakowT2Vk?=
 =?utf-8?B?MEoxdlhDSXhBUVpISEhSeldjTFpsS3E0U0lFUXdaQlJUK0ltUmk0NUhldkty?=
 =?utf-8?B?V0M4V1lBYXJXYUJSN2l5bm5wUm10RUwyVjNydnhObmVraHNFVEpTS3hGdWg4?=
 =?utf-8?B?L29LN09ZTVkzTzc1R2tIMXI2SDEwM0tzYURpZ29NVFB1LzlhREpmMGpHZzN2?=
 =?utf-8?B?RjYySW14YzRSNzFIdUlMRThRWmQxZEZtekFNSzBTditva1pOZGhFQ2dmNUto?=
 =?utf-8?B?TVZvaEtGdTcrYkN4TDltUXhKK3B3OHVocTdFMjhxdmFrc2c3MnFPR1FGaS95?=
 =?utf-8?B?b0ZLaWdmbU1lcnlTa3ZjcXVnYU1GTDh5Y2EydkVBVUo3ZlAweFhzYmNCRDRp?=
 =?utf-8?Q?gfsrMOA7bt5ESYkRLmfODBNCX02PeFFcl4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10575696-61eb-42d5-72fe-08d892db32a8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 13:49:01.9467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fBC5+LdpGhHi8LmpLfX8FCq8hS0wK8AhHnbjM7XuWjY8tqawbgjYt2ak2Xu9yy5DePRBlnu+Egre3dJSxk7GKFzYHMjp0q22ChC6YtFbS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2598
Content-Type: multipart/alternative;
 boundary="------------9DDB7A23FB1E9B62AAFA537F"
Content-Language: en-US

--------------9DDB7A23FB1E9B62AAFA537F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-26 6:22 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.0.1:
>
> - Improved diff_to_previous framebuffer performance
> - Add Linux framebuffer pseudo-device
> - Allow a wider range of SPI bus speeds
> - Fix to allow cmdline args to dynamically create a full_frame()
>    instance
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-luma-core_1.17.3.bb => python3-luma-core_2.0.1.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-core_1.17.3.bb => python3-luma-core_2.0.1.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb
> rename to meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb
> index 8301d7f77a..fad7432132 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb
> @@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1"
>
>   inherit pypi setuptools3
>
> -SRC_URI[md5sum] = "c13303a123c32c1a8dc5bc089a920822"
> -SRC_URI[sha256sum] = "1c928ad8e42af5fd395260176f89eb68a8af61911971f94124fabc9c6b550689"
> +SRC_URI[sha256sum] = "a0bc18c03cfb293c9c1b1d8883c2ec7c29d167e4af99f795b5698c8a864332df"
>
>   CLEANBROKEN = "1"
>
> --
> 2.17.1
>
>
> 
>

--------------9DDB7A23FB1E9B62AAFA537F
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
    <blockquote type="cite" cite="mid:20201126112215.11451-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.0.1:

- Improved diff_to_previous framebuffer performance
- Add Linux framebuffer pseudo-device
- Allow a wider range of SPI bus speeds
- Fix to allow cmdline args to dynamically create a full_frame()
  instance

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201126112215.11451-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-luma-core_1.17.3.bb =&gt; python3-luma-core_2.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.17.3.bb =&gt; python3-luma-core_2.0.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb
index 8301d7f77a..fad7432132 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1">&quot;file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1&quot;</a>

 inherit pypi setuptools3

-SRC_URI[md5sum] = &quot;c13303a123c32c1a8dc5bc089a920822&quot;
-SRC_URI[sha256sum] = &quot;1c928ad8e42af5fd395260176f89eb68a8af61911971f94124fabc9c6b550689&quot;
+SRC_URI[sha256sum] = &quot;a0bc18c03cfb293c9c1b1d8883c2ec7c29d167e4af99f795b5698c8a864332df&quot;

 CLEANBROKEN = &quot;1&quot;

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

--------------9DDB7A23FB1E9B62AAFA537F--
