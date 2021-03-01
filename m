Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.45])
 by mx.groups.io with SMTP id smtpd.web11.1076.1614621072196348202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 09:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Iv1r1ooQ;
 spf=pass (domain: windriver.com, ip: 40.107.243.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnVYVH92ZnEDYiK5k3KnO/rkYuXIPAjIUaz9g8vAe6hhGEifB3PslXT79leAazZUZo8U1+hWDYl6MYVbbxEkAb8Ks/EjLLjJwn3Usz+fdbKFz4glRBcaMn4LU0EI3FnTVRJpdH/ZsO1AkbMBpbJa1uPmrlStHh6toB5z0yTCvGBCmfoJXMtvJ8THTWl7DFn0wA+KmAeu/HCu2OZzOQyFr3fVW9rMOteojXFJq8AWNbByHt7N2I+dsZOz0V3HHyxKYhmgyTU9ZrOWX/AYE/CEDgkxSebwcVCxsUflKRSOMpNAB6j/inWeCIDhtYbYKyV4dsP/iT6uA7VZzyzYqSkrqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhGLjhBm/+T6mlsR7nBOkCCjdjZQoPo5a6Ij9Zv33sQ=;
 b=E23C6SJv3TJX8iN6+o3xb0W3jTS0+JixDytfDZ2mdyPeeoyZOJToZWMzBHm5DtC8joIFHMN4S9w7Pb+Q6eX83ILGXwiaEXIOPMeX1eqBPIPs2Hp3LSrf3Sj9glDY/STdUX1Z7jHU//j0bq33qLix7PS+0yVDQ8P7VQb6FBsM0ZU0jV4GCcB54JXyMUL14dYVKYzODLOXyDLrok9q/0o8g/c+2iLFXoen8u08kKyE65u90UDpaOZjnRdchgNP84GaIySYRuUHkdq5bYT948mzqrYv+b8gQjUKiBBJ5K6ZUHU2Wf4fP5+Vmz6bI6kW44zxDcbuApzW0F432jCzn1vnZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhGLjhBm/+T6mlsR7nBOkCCjdjZQoPo5a6Ij9Zv33sQ=;
 b=Iv1r1ooQg6Ggy7oxb9FSjaPk9ulq0ZPAabtV4Nw3pg6CywyBtNLiOzoFo8a4bKfvd/EcLrwkt1kfscvSMteLxgLCVsLPdXCqH8u2Nzn743r1WRunMiDdo5u/lWvZf7DAONS/94etct0/4Cd7+vmIvIIGc6M/Nh21X2r2JBUWucs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3557.namprd11.prod.outlook.com (2603:10b6:a03:b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 1 Mar
 2021 17:51:10 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 17:51:10 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-autobahn: Upgrade 21.2.1 -> 21.2.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210226110931.6287-1-leon.anavi@konsulko.com>
 <20210226110931.6287-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4878b5a7-bdb0-cd56-d016-fc70a1b6e275@windriver.com>
Date: Mon, 1 Mar 2021 12:51:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210226110931.6287-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN0PR04CA0195.namprd04.prod.outlook.com
 (2603:10b6:408:e9::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN0PR04CA0195.namprd04.prod.outlook.com (2603:10b6:408:e9::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 17:51:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 527507d8-a099-47cd-52a0-08d8dcda9914
X-MS-TrafficTypeDiagnostic: BYAPR11MB3557:
X-MS-Exchange-MinimumUrlDomainAge: crossbar.io#2699
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3557787DD2C86536770AE1AD9F9A9@BYAPR11MB3557.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:309;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7i20UYRNdA7JNCrO9C7qazw/r/yH/eIf0csaj8EQZ4CATCCcbYUqg2UerV29zwlbt4TXIImHJmMsXHMgm0xwi89+rQO7x0XgpKT41Zdr+hdNAyLEzZE4tWUMYzATp7weRKYhI4sx8N6i7YV/SxzgRDzy5mX0+AvDL0BMVq/0wa4OsWzReaOmwjRX0vl/yI4AkGUfeVY1s7E3+Gwc3z3XlfiBegFi/fD5SPa+BPJ2UP6z1hMoMk78DUGt0jM68+H9uff6N56DlzyFfgEIHauqxYPjElHyo3Y2MK0CLNi2wnbvf4D/cV0a0nE3zGpXrK7sUDnCVKnW0ZMhxe6SPMaFqjFFhjNTDt7BTRm9UepE1dUyiqdZzpprRM3DpocIeiQNIN4BMprXauMqHgiXm8eFQ2wN3j2VG/MOAaPHJ8pbyqOjrLRReSiHRHHSFvEE5uVQfzmGYMZzpnYQd7lUtuQziJh7ou9MTjAxLSYiML07ePiqCoZBNT6orU6EtQhs6ETVTb7r9Y+JyEOekYinti3jMcOoHg0QSLd1kG28HOUIaOI1A1MBOl5wLwq7xHCLkyKgDxB5XXa4rEmqTpwfQ689g7bouKGbPNXG1VXZE2f0sd00oOdchQ3tHHdQ4O9JeqLPpnxBwJzIvtKfg5hGMtJjF0Pjpar1Jz3LxlF+fTFn7/hEwqMdYKVt/RvJnFzGWq8z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39850400004)(44832011)(478600001)(8676002)(166002)(26005)(33964004)(53546011)(8936002)(16526019)(186003)(83380400001)(966005)(6486002)(66556008)(66946007)(956004)(31686004)(2616005)(16576012)(36756003)(31696002)(86362001)(316002)(5660300002)(2906002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZFFURXNoMHJ2MHc2ajlxVlZrZTMzV1licVYraHlka01WT0x1dEs4d2dRc05W?=
 =?utf-8?B?V1NqOVI4TGg3N0p2UmtVU1E0U2xwckIrLzNhMVBFZ0QrTTVxWkdwTWlmVVdE?=
 =?utf-8?B?YURNNXI0WURXRTJoUHg4NjZ5U0pLbkhDajZEWnFJZ3lyejN4L0NMbzNnNWRO?=
 =?utf-8?B?ck8xVlFZN2ZqWDFmZlZzTnZkQXZFd1EwajdXaGp3L1RYNEtRMXNMcVVXa2xB?=
 =?utf-8?B?Z0xWN0IyY3VhOGg0dURzenEyZEdiTUY2K05UMzhGSWxFU3NZQm84L01QZWUw?=
 =?utf-8?B?L2IwWnBzR05ab0RVVkVhYTVZZ082Z01wcU1UUGtOaFc5aGtQVkNNdzBEcXda?=
 =?utf-8?B?OFZuM29veW50VDdKaTNKT1F5NGVhWFNHZEt4WHN4cjg3RkJDc2gwYWZRb3dZ?=
 =?utf-8?B?STJ6dXNVVVF4Wktnbml0elVCVEJWR3pLcHk2NUpyTTgrWm4vZ3NmVjJkRUE4?=
 =?utf-8?B?eno2SjBKb0dxRUFWQ2pSOE5tTUkyUGVCNkdDek5aZ2Z1bHFNdHJpTEEwc1VN?=
 =?utf-8?B?UXlkUzV6ZU9kT1lDYzZBZU51OHNlNTlVTWNrbm5IeW5lbWNkejBKbVdNa2F3?=
 =?utf-8?B?ODV6NnRwRm04cDhpQUd1TUdUcGNQVlMyMFRXclB2Yll2d3JaMzNjb1NmYVBY?=
 =?utf-8?B?OWs2WXpwSWRaVzJNMGs1NDFvSWxqK1lZcURyb29wb2VCRGJnWmRNRUdFemkw?=
 =?utf-8?B?Q0Q3QWhpN3podkNSVXVSWk5xOEljT09LWkxxSDU2VlNZcWFrUUdjNkFXUS9V?=
 =?utf-8?B?aEw0dG5mdzlNT0N6Q3g1Y0lhRzFVYXZlRmlkekpxMXFYdFZnY0xZSUdmY3l3?=
 =?utf-8?B?L2dPOXEvYWNUSk4waHlNYldKM3hLL0JqZmpoR29ETlFxYlVHQ0NML2JDbTNU?=
 =?utf-8?B?RmFTS2EveTVPREtIKzNNNWxXOFJ4RkYzRXBwZ3lkR2dub3VqSXdKeDAwY0tH?=
 =?utf-8?B?a2xXVE1qWXVCSURrMDIxN1lMcURvSkE2WHdiaWZ4QkhGMjZYWXI4bWRqcEs3?=
 =?utf-8?B?L3RyVG00bzdNK1RiOHpmaFB1U25qRFJvN2c5czd3YXNYWW1PREJnZVI5b1Fl?=
 =?utf-8?B?eUxsbXAvemp3UnBBUTA0RjJYQzQrWW43akpwOU1DdHhDZ2RDck9rVjZFYVFM?=
 =?utf-8?B?SHBxUjJyMGp6VURwREE4dS81UkwzSHQ2UW52ekJZY2NhUzVOZHp6VmlOZ3hT?=
 =?utf-8?B?Nkw5WnJONldHK2tURlZCWVlGYjhQT29zYkdQMnJJODJLNzYyZW9MRUYxYm1Q?=
 =?utf-8?B?bGRMRVhDS2MrQm16T090NXN6TGhVWDAzM3k2VXl6T3loL0lRVTJPamxqc2Fq?=
 =?utf-8?B?TlNKT1MxRHFldFNWdHJVMFIwVC80UVpSdkNqVktaaTVKeXI1TkxKanlEOStt?=
 =?utf-8?B?Tmp5VjRGaHZFdTA0NmJEb1VEMmhrNW5lZm1tcmpNMzMrZDBLSXJDTDV0c1Y4?=
 =?utf-8?B?U09qSU9qaGhQNDBNbjNTNWRKZEgweEJRVWVwRjJocHJ4ZU1jNkFtWHU5bjIy?=
 =?utf-8?B?dlV4ZUNJNFFHbHcvY3JpMGlhYm9OUkEzc05jU0FVdWpZNWNEalhES2V6UVZM?=
 =?utf-8?B?K3dXMURTYmp0Q0M3S0RhRnp6THJ0Q3NuSjNwSnF1VVp5VGxDaHFKNnhQK082?=
 =?utf-8?B?czZ6enZ1djhza1VEVnNUNkU3NnNEWDFPYWtuZDcyMHhrdVVZQ0crRUpTVWMy?=
 =?utf-8?B?S0J6MGxKQWhyNmM1WmJMWExlMWNKRkJtS2N2RHFwUlVpcTRmNU0xSlI5OENy?=
 =?utf-8?Q?qwzAEJm29VxGdtPP0+luhj2UCxxOVAsysfZbS3o?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 527507d8-a099-47cd-52a0-08d8dcda9914
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:51:10.3911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKg8Fw4HQ8FsfqxfSX52VEU9YBqcTsCNtKiUXDNvfWiMAL/XqO8q3dL+vL/dFa1XOFFyLxhv6zj9VN7DW/e05jwRN85aRxSAI9iP6FU4DFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3557
Content-Type: multipart/alternative;
 boundary="------------758AA7C2F9D92EBA24AB740B"
Content-Language: en-US

--------------758AA7C2F9D92EBA24AB740B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-26 6:09 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 21.2.2:
>
> - fix: correct some sphinx doc references
> - new: minimum supported Python (language) version is now 3.7 (on
>    CPython and PyPy)
> - new: more XBR proxy/stub code generation capabilities (RPC
>    call/invoation handlers)
> - fix: wamp-cryptosign loading of keys from SSH agent
> - fix: update Docker image building and build Docker multi-arch
>    images
> - new: add more WAMP-cryptosign signature test vectors and unit
>    tests
> - fix: include XBR code rendering templates in package manifest
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-autobahn_21.2.1.bb => python3-autobahn_21.2.2.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-autobahn_21.2.1.bb => python3-autobahn_21.2.2.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb
> index 3af81d1dab..cc3773fc56 100644
> --- a/meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
>
> -SRC_URI[sha256sum] = "7e6b1bf95196b733978bab2d54a7ab8899c16ce11be369dc58422c07b7eea726"
> +SRC_URI[sha256sum] = "bf7a9d302a34d0f719d43c57f65ca1f2f5c982dd6ea0c11e1e190ef6f43710fe"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------758AA7C2F9D92EBA24AB740B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-26 6:09 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210226110931.6287-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 21.2.2:

- fix: correct some sphinx doc references
- new: minimum supported Python (language) version is now 3.7 (on
  CPython and PyPy)
- new: more XBR proxy/stub code generation capabilities (RPC
  call/invoation handlers)
- fix: wamp-cryptosign loading of keys from SSH agent
- fix: update Docker image building and build Docker multi-arch
  images
- new: add more WAMP-cryptosign signature test vectors and unit
  tests
- fix: include XBR code rendering templates in package manifest

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210226110931.6287-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-autobahn_21.2.1.bb =&gt; python3-autobahn_21.2.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_21.2.1.bb =&gt; python3-autobahn_21.2.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb
index 3af81d1dab..cc3773fc56 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_21.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://crossbar.io/autobahn">&quot;http://crossbar.io/autobahn&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98">&quot;file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98&quot;</a>

-SRC_URI[sha256sum] = &quot;7e6b1bf95196b733978bab2d54a7ab8899c16ce11be369dc58422c07b7eea726&quot;
+SRC_URI[sha256sum] = &quot;bf7a9d302a34d0f719d43c57f65ca1f2f5c982dd6ea0c11e1e190ef6f43710fe&quot;

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

--------------758AA7C2F9D92EBA24AB740B--
