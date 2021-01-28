Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.47])
 by mx.groups.io with SMTP id smtpd.web10.24156.1611839256741654411
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:07:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AYT0vyW+;
 spf=pass (domain: windriver.com, ip: 40.107.70.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvsSDaYruin8krR1MjE/XuoRzBvbawbEW9eO4dQXwwusuZjbIVRITOHb+QMO6HmaEbcyCtclOeHlf4C8ijjdN29tzEU8Vn2XtxSmlg8d9VhelwbdFE4YHaPXTL8hg1NcmzCo8Aov1p2JAqtJ2oTyw9FvwwKxYmb/g6PVVugctH8InnlZbSzH/craml3H6+joQDvbuUktSvkNxJ0J6mXMSiOajHr8azZNbN7Mk6e+pTSx1a4V0prIJfMRdJ5B+WPqy37OLK/WfropUHMngrYGqOWzydhN7HQm5vRdb6WIQhr5gv479VjJ23MMsDtYPUQ3SvcWeHBDJ0YuLB3OQvlynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOkb6aDSwvdyUpo7cW0GDlgr6vTmRgewgspoy51xePU=;
 b=d4iVdF3sSZrSqjnDfgyv3AMZWzqujq617MajnYdvPNsvcDX90+jqemXMOzXnxbCKtM4ii/za2KyUtGqy+88qaPpg2htG6FhRk+tVANUbkoSEqqU8tBPPhcvi/onvfUtaf/l+RGl4YbVS87BV18FeXZG9IU6P4m3OrhrP7d6/etT+6xoXz/yjc1DBRzC+IMgf6KQ5KTVRJ78fu2p85pyVYsdv0NiMDJVuPmuRyohVPYMgfTGg7kTsfaf03rckhq3RkDfCEifIk5F8RDGiCnl/maTWnYboAhjyO0P1R9YR9zOyvuwbFe2bJJhH/m/RShWlV40uS+CL78z+o4uPYMkROg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOkb6aDSwvdyUpo7cW0GDlgr6vTmRgewgspoy51xePU=;
 b=AYT0vyW+jnLl1Zkp0C0j9T9uK41KiZRQ3I17GY0QguPSb/OqGwz2uCvvfpBtog3qDldnreB7NWeBeXg+zhdcbWWI/UJOa/dzDEJPQ3aSnu3DQscvTRQse8jEHFLhYcOD4Iknr17Gtp1WAptzG+S7VpEQFXo++GTbNQtdp4XZClw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4184.namprd11.prod.outlook.com (2603:10b6:a03:192::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Thu, 28 Jan
 2021 13:07:35 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:07:35 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-cachetools: Upgrade 4.2.0 -> 4.2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210126125003.27620-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <839f1f43-01ce-7d0d-0945-2b6b9ae7d335@windriver.com>
Date: Thu, 28 Jan 2021 08:07:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210126125003.27620-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR01CA0057.prod.exchangelabs.com (2603:10b6:208:23f::26)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR01CA0057.prod.exchangelabs.com (2603:10b6:208:23f::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Thu, 28 Jan 2021 13:07:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e96211f-a689-41bb-47b3-08d8c38dae19
X-MS-TrafficTypeDiagnostic: BY5PR11MB4184:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB418468BD8180D1A40C70CE089FBA9@BY5PR11MB4184.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ptgslCNj2a9UsIQAsqKX8ygilhwE1Js86p4jpMY1ZlkPNBaSPzPXL0O/nPeUbcycNnbX63Vc8aace3JTn+89PRN5WPb9TVKdNSwolB+0GMIhNg4xR+s4DGa7luJ3iSooN3x6MBVjf00NUBovo4k5KELR9U+vrH+StN+WYAr6D68CH5+CoFQp40NM46B5fqO6PK8n8IbM6GKVh7Pk4kbB3eCpXniXGGgFu3w2x+tYJPrQuWUHeP+gdQ2BIUSNyR3OWeCV9RThXXz5nllChTeuLsQELlcLH7A73KrCPD37zVErQ2Rwi7mwj752ASi+JEVXkTw5M1Q/5RgWX3siOL8lVIm5X6f4BjAiLHaVp4efjCwjnGsUFHlejzNZ3FjUr2Fizh60PKKF3CrNe0umI2pJ2YNx4dYI3Ik3BOOQMEEMj23uDhIoqVLAHATHnR6tXwcCUrTFIm3vDhVO/+bLxRhMtwcsqAkzy8kdZAj1Ip8jEyOsscbcZ/Pw7kxLSUvInIhmhzg5O0cSlXaA2qglzESFH5Nrh5cM0BQWS2e83NYsfnHmXeB9oUCF18r9Fjv9enFjbq0l6fdYKhbZ0PF8mttyP5Jc9+DWYRBQrfI1PnA6itjc0N1HpJnLPPVMkWlsj0k9GvOcIyBlBZ98HmphMRTuSA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(366004)(396003)(346002)(2616005)(66946007)(966005)(53546011)(6486002)(2906002)(66476007)(33964004)(8936002)(166002)(478600001)(52116002)(5660300002)(44832011)(83380400001)(26005)(31696002)(16526019)(86362001)(8676002)(186003)(31686004)(36756003)(16576012)(316002)(956004)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?TTczejQ3R1NJVVl3cm9XRG8wNjBtckJhZ29Ub3dCYzVaQ2ErdnorMDJnV2ls?=
 =?utf-8?B?QlBGRTIrMm1wWDV1V2d3MU5PcjdBN0hWeEo3RUs0cTQwb2ZqbFlDWjVub21C?=
 =?utf-8?B?dzZjK3cwTWhYZytnWTU0ZEhzQUU0Y1lnQmNBUjdyRnAvekY2WmlRYnUvR0VU?=
 =?utf-8?B?R0tsR05XYUdWdml2bHFGRmRIbDJ1K3lZWTRXMUFOd3daUW4wTHZBWFpYdXBo?=
 =?utf-8?B?ZXY0eVVxNGJmRzJCNlJRbHdyZ0crYWxqdHpLeWtjcmIvQ1ZaR0lMdS9qVHdk?=
 =?utf-8?B?Q2ZQTTlFZEZSOXZ1bDZpekdOUnlqeHB5SWZBUXZnMVVqYXZLeU53S0VjTmRs?=
 =?utf-8?B?Vzc3bVlUWFYrVVNSZU42NHNmbFgzQ2x3cnRjSS9KcVpzV2xqMDh0R0EwNHlQ?=
 =?utf-8?B?YSt1T1FxRTRqdnlyVnBETzRPQXY3SVZ5K1JHYUhIN0FqTmRvWHFzbDJYOXo0?=
 =?utf-8?B?RGViVWRwV3NsSERBSkd2NTZNTkFFZThaZzZQL1Q1elk3WmZWT2NGYW4zMU1a?=
 =?utf-8?B?Q1haeVdYM3g1dXFMYThjckZ3a1h4US91N1V2QnJieTZpZC9oSUdIQ3UyMEd2?=
 =?utf-8?B?N0ZPeXNKT01PSXhxYjBFemtId2MrVk1ZQ01aWjVRMjZkZGhLd3phVERtS0c1?=
 =?utf-8?B?L21EWTByWDBLTVJ4MmNNcVB5cGpZcjZRaGdIclRIR014UlllY3l1STZad2dI?=
 =?utf-8?B?dUhoUEd4MmdyNGxSM2cwc3NsQ0NOSGQwL1N2KzR5MmhqQTVzekdPZGl2VXhZ?=
 =?utf-8?B?VjBkSnV0N3ZobysrMEJKVHcxU2Z5TkM5Vk56aHZySENyRENMWXlnWWRKU1NK?=
 =?utf-8?B?NHJ6YlNxMGhZSm1jMG9LQmNzVzBFMGNqYkVsellCNGEwcURRS3o3bWlwUWo4?=
 =?utf-8?B?SGVsRGpSaDlwZ0xubDhsYkJoZmFoV21LMkZXQjVuYUdqdVN2ekpkN3JQeW1y?=
 =?utf-8?B?NTQ4SFlPZjlDS0g0RnBHV1pRREtCb0hIOThMZkhlQTB6QU9qLzd5NkVJSllR?=
 =?utf-8?B?eXRPT0lQeHRmNnVBV0doRFhqSGpsaEprSUpTenJVaWtSYitKdnhydzJLaHM4?=
 =?utf-8?B?VnlBc1drcExjVUd3ZWVjUGg3cFR3MHNDSitkZTlQL2M5VGoxMlJ2enlFN3h1?=
 =?utf-8?B?VUVlUzlKaDkwb0hKLytsNkdqZHFkRjVFdnpZdVNVYlpNcHE5R1FNVkowYnpj?=
 =?utf-8?B?MTZUVEU5ODNVbXZNc2gvalQ1bjFXYlVJSU9OMGVVYTJKOSt1N25oRWxIdlUr?=
 =?utf-8?B?RzJGMmdzWkFHd3haVzdNaCtVSjZ4bHA0cTVpYnRYK0dlc3lUZXoxNGNzSEJN?=
 =?utf-8?B?OGVHMlZHMnlXaU5ISDM2aXBrR0tPcDI5akcwUUUwMkZZcXRlUGNPSS9Mb3lU?=
 =?utf-8?B?ZHJVSmgyS2NmaDV0c2dkTTcrdnNtbFBzeE92STNKekg3UU5UUkZPWEtmdXVP?=
 =?utf-8?Q?VHGIor47?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e96211f-a689-41bb-47b3-08d8c38dae19
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:07:35.3641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QO17H5hoBgnd8TDCB+fi+bIvTGmiaauprEbAoVLEL3t5tpjklgkfbqGBc9VL9LNg7DOyqc6wjUCKnRcTmJl135dg1ewm6uvpsKIhqeLqJX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4184
Content-Type: multipart/alternative;
 boundary="------------D0B9E7898E6DA2C1E49A290F"
Content-Language: en-US

--------------D0B9E7898E6DA2C1E49A290F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-26 7:49 a.m., Leon Anavi wrote:
> - Handle __missing__() not storing cache items.
> - Clean up __missing__() example.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-cachetools_4.2.0.bb => python3-cachetools_4.2.1.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cachetools_4.2.0.bb => python3-cachetools_4.2.1.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.2.1.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-cachetools_4.2.1.bb
> index cc697d5a9..616e88045 100644
> --- a/meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cachetools_4.2.1.bb
> @@ -27,7 +27,6 @@ do_install_ptest() {
>   	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>   }
>   
> -SRC_URI[md5sum] = "9d54dacd774e2af7e9a50741386f5455"
> -SRC_URI[sha256sum] = "3796e1de094f0eaca982441c92ce96c68c89cced4cd97721ab297ea4b16db90e"
> +SRC_URI[sha256sum] = "f469e29e7aa4cff64d8de4aad95ce76de8ea1125a16c68e0d93f65c3c3dc92e9"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------D0B9E7898E6DA2C1E49A290F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-26 7:49 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210126125003.27620-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Handle __missing__() not storing cache items.
- Clean up __missing__() example.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210126125003.27620-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-cachetools_4.2.0.bb =&gt; python3-cachetools_4.2.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_4.2.0.bb =&gt; python3-cachetools_4.2.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_4.2.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_4.2.1.bb
index cc697d5a9..616e88045 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_4.2.1.bb
@@ -27,7 +27,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[md5sum] = &quot;9d54dacd774e2af7e9a50741386f5455&quot;
-SRC_URI[sha256sum] = &quot;3796e1de094f0eaca982441c92ce96c68c89cced4cd97721ab297ea4b16db90e&quot;
+SRC_URI[sha256sum] = &quot;f469e29e7aa4cff64d8de4aad95ce76de8ea1125a16c68e0d93f65c3c3dc92e9&quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------D0B9E7898E6DA2C1E49A290F--
