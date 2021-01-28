Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.55])
 by mx.groups.io with SMTP id smtpd.web12.23999.1611839383908551662
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TWMLg01S;
 spf=pass (domain: windriver.com, ip: 40.107.223.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9Io3r/E4hm+NcFZHLuK/BppaSfZSa+oofTxqbPzo4e856IeFyNn/rfBIGBMeBg7MqPUYVGvvsIEKzHLHjsWMJelsIfwIR227eTPhXnl78vvMgJTuD0voIBwQqtqewCm+zwb6EmVxhOwDzM013PherLoCeBF7yM4FTQEOG1eHlkIddc1i9JwGEIj9o4gGbkiQdDAc7P2w3LNsiH/scRcfLBtZWaXdAS7mseteTWTZhPgF3ETsMqNWKDHS/8KfMDNwIUkZFYGILOQ4SLs59sTNs4AlHGbd5tsSMdC2KPuobj9McE83c307H2CMLzGeXJy+H8ly1xZ0EvJcr0svDeYIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tHCsHiincLde2O5Iwr/Dbw6DE4OjggmVyMjDiMTfdY=;
 b=HLWrtrbxJhVZq3Hz5j5sExkrDOUBJk/Re7ICRK7H+1tsLxP/TIN73fiEwTNRnX6YcD2JUV3QXqR4QTY816SfjZRoQEIijDienkSVA6uhfrhpYn+de/M2YIupicrOJWheto7W9dNeJyfbZ5k9aC5VArdVEI8UaPvSNcvRPph+4ntwBRHkLsgRxtcxMiVWwL8RNxM7HA7R3dwMcriZjyXyVcZNDZ6WWCKLFL/VT52YPy2DBKLBcxGjkh1Kpfc6VbVt4RVYhq0WmUWW2Mqxud1dx48jDIVlfsEyVkBFF1prDGYAQsNjKd8+HI8R+IA3pPk/U9ei7RRroNFS3ukgvx80gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tHCsHiincLde2O5Iwr/Dbw6DE4OjggmVyMjDiMTfdY=;
 b=TWMLg01SQLxpWNRS25cXDqUv6pRdzxibjgG4mN8zqInZ0iAqusWFmcDWtM200dOq8H7aHuxNA14iOA3XHyUlBqG7+DR+JgaGzQHfxIx0JzmvLdhpXvhHjOjfcu+f2sYS0XYx0zIZz5lLwtBkSN8xvULLuQdqsbjRpryfZ49l8ys=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2951.namprd11.prod.outlook.com (2603:10b6:a03:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 13:09:42 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Thu, 28 Jan 2021
 13:09:42 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-typed-ast: Upgrade 1.4.1 -> 1.4.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210127155538.12229-1-leon.anavi@konsulko.com>
 <20210127155538.12229-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <0e419433-75be-a83c-047e-3eb59c70409a@windriver.com>
Date: Thu, 28 Jan 2021 08:09:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210127155538.12229-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0107.namprd13.prod.outlook.com (2603:10b6:208:2b9::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend Transport; Thu, 28 Jan 2021 13:09:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4624dab-4b18-40fb-68f0-08d8c38dfa03
X-MS-TrafficTypeDiagnostic: BYAPR11MB2951:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2951060215028CE9438DC55E9FBA9@BYAPR11MB2951.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2Cp45bzZH7KnLoPow1FcDE6XGfCalKfD5mMPlN5mPI8zs6Prwny9hBMFxTGwobLxq4mMapcQbZhP07R8V9givwairh+LL+GZUg4gruat2DCK3xTa390OzsmkjTnO7TFU2DARnKfdtblqniDBVCQ2zryq8RjXcz3GpxCAJcP/T0gIBFxaJzu4DzHe+j+HBhXiIb/2C+Ix3AmhsLVk8kZeCR7PPpjLBqBrh0qNpQi4HoySx9Ek7zo4TTgqe5iLefBoFFAYHdHYybM8sP/kaR+HLyPn1IONTFBzLZiAUP+YsVi9atelMry15GhkJPApUb2hYbrc/h3PqAInMmbmMqCfqmG6v+nY4FfGk9IUF5ErcJlUQvELMY0hApVyiLauV39FVMFIel/TTS4vVPpc4nRnqPAGmBT83mDodfyPmZrzSSLqEqN6LvmvoE3TthPwi3r1VzVMbjQbNXfhBZK9FD0XOvU/TMQS7UINwoDiswt7/1VUu9cCoyP/X0V7xe0B09QDckRA4Bx8GJi1G7S1cK/cNiQXu542GzTiwYwq+y80/t0zVL/OZHl+p9vAvL8WKgIuCt9FCCySc86rAlFs4DvI2B8A2zwjLypfSE/GGpIwTlcK47+Kj/xVH1GPCop2x/yNcL9ZhZ58kQ0WlGiDu5TdNoNLLuX5B/T5CUDgG4cHGtAssnx/GJ5blpOD7exLlUeO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39830400003)(376002)(396003)(36756003)(2906002)(33964004)(52116002)(83380400001)(166002)(8676002)(966005)(66946007)(478600001)(6486002)(66476007)(31686004)(66556008)(31696002)(5660300002)(8936002)(44832011)(53546011)(2616005)(956004)(16576012)(86362001)(186003)(16526019)(26005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?b0dOa3dISk1aZ1RGOHpORXA4NHVmQUxTZU5tQk9nbmlsL213TDNOT1BTamxI?=
 =?utf-8?B?cWMrZzlDTk5reUwwZjRKbmJ0NHhHRnJybEVRSk43VlpMNU1NYTBrcVVrZmRJ?=
 =?utf-8?B?VEJJVEtPMExTK1JBVldpNTBsdnRrN0ZMYXFhV1BJQWZEbW9SaVMyWjVaWEdY?=
 =?utf-8?B?ODlWRlNES20ybURtcW1USURKUEFFamw2Ujc1cjdaMTRrbFV6RGFtQzZ3MGs5?=
 =?utf-8?B?NkFvdGpEbm5iL1REeVN3SWZLcnNvckFvc1JYSENnaVZGM0xSOUg1blY5K0tO?=
 =?utf-8?B?cW1VblNOVnY3ZXVteGJjR0xhRTFZdCtYUlZyUjAvSnhGOVN2Nk0zL01lMGcr?=
 =?utf-8?B?Q3NselFFZWUxTnVaRXBLRGlxU0M4MCtoK2RlZC81V3IxYks3b05rZWtubG9T?=
 =?utf-8?B?VmFmdkx1Zk5ueC91WDlNcVdPUEFDUzR3VlhobmdoWHN5WEtiQ3FOQ3pnTEx1?=
 =?utf-8?B?S1hjS0o0VDRvU2dteFpERlJ4cGZmVURuZW1RR3F5Z1QycW1jb1VleWlpTTBN?=
 =?utf-8?B?MEFyRENVMzZrOHRSVWRjS0hwR2hEandGNmFkcitycU1BTlJaY2E1UStSQUpz?=
 =?utf-8?B?am5tYk1JTmQ5L21hVCtBbHoxZEdjUFE5RThpTGJScFo0eHRSRFdOU1BRVnNW?=
 =?utf-8?B?b2FxOCtHM1ZHWWoxUUlzMUNiUW0vUHZ0WnhlWFRFbkRvbHIrakNiOVRjdk8w?=
 =?utf-8?B?MThnYmYxenkxSEtQUGw5TU5CZDVBUE9wMHB0aHg3bzEwaDR4WmZyNWd0dmx0?=
 =?utf-8?B?aHVGekUyMjljV2daT1FOdGJRenY2S28rbnlvUmRuai9HVkxSc2tXUkNIMk1V?=
 =?utf-8?B?c3dJNXpiS3NyWTVvckI4WWJ3YTBJdG05NzZRbnRYam13UjBlNmtFMCt0YUhH?=
 =?utf-8?B?aW81TXJlMTVDSVgwWXI3eWNxOWtjWUlPUk95QTI1Tm54aE5MbkMzcHl5Z1Qv?=
 =?utf-8?B?MUNuQmxUbEZyWTlwMURPN0plMmpPU1dpY2V4MHc3MVUvTWpIcVVTL2cvdnVx?=
 =?utf-8?B?WEtBbDFuYnZYUnd0RjdHM3EwWkQzYUpVRHI5ME00eWFEQ2lDd21WbC8xaS9u?=
 =?utf-8?B?VFpFSzBiclZIVDdDQkFJbXBZOE84YzlIaytvR0t3K21zdnZkMkpJb0xtdFc3?=
 =?utf-8?B?Si90Nko4dSsyY2hjekRrQy84MjNmRitNcGVENUZsV0NudzdzaGVCYXdZd0Rl?=
 =?utf-8?B?S29jcFk3bFNqdWM1dUEycWJERGNFRWVSUU9JcEZ4YUtuOHIvcjdEVzlSUldi?=
 =?utf-8?B?R2JkRldmTnNlajdxRUZTczNBWHkvSjk0R1FhR3VMOUdia2hWUCtVejF2S0ZM?=
 =?utf-8?B?SUo0THE0eExLQVNzczVLamtFbE04Y3NRdWtYYm9WSk9LOGNXUm5HeXprMko0?=
 =?utf-8?B?Qzdsa1dkYjA4Y2wvc2YxOGFxakFtS092YWtEc1VXYlBJYTN0d3B0OEkwYUta?=
 =?utf-8?Q?SdYqVUa7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4624dab-4b18-40fb-68f0-08d8c38dfa03
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 13:09:42.6447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyMR8nTfuSZhuE4moMnyiYthThzmQE2M8lrRmHTUimkl4IWjYewWW5KCuynffiGt1PnS8Yn9fnc8SiJDUMKTMIQKHzA/CFQsaQOS3DQbpy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2951
Content-Type: multipart/alternative;
 boundary="------------5141D26112EF9EFD6BBFB458"
Content-Language: en-US

--------------5141D26112EF9EFD6BBFB458
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-27 10:55 a.m., Leon Anavi wrote:
> - Fix linker error in debug build
> - Fix cross compile by adjusting includes
> - ast27: prefix exported symbols
> - Add 3.9 to supported versions
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-typed-ast_1.4.1.bb => python3-typed-ast_1.4.2.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-typed-ast_1.4.1.bb => python3-typed-ast_1.4.2.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb b/meta-python/recipes-devtools/python/python3-typed-ast_1.4.2.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb
> rename to meta-python/recipes-devtools/python/python3-typed-ast_1.4.2.bb
> index 2cc9f6c43..09f387ca6 100644
> --- a/meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-typed-ast_1.4.2.bb
> @@ -7,6 +7,6 @@ PYPI_PACKAGE = "typed_ast"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[sha256sum] = "8c8aaad94455178e3187ab22c8b01a3837f8ee50e09cf31f1ba129eb293ec30b"
> +SRC_URI[sha256sum] = "9fc0b3cb5d1720e7141d103cf4819aea239f7d136acf9ee4a69b047b7986175a"
>   
>   BBCLASSEXTEND = "native"
>
> 
>

--------------5141D26112EF9EFD6BBFB458
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
    <blockquote type="cite" cite="mid:20210127155538.12229-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Fix linker error in debug build
- Fix cross compile by adjusting includes
- ast27: prefix exported symbols
- Add 3.9 to supported versions

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210127155538.12229-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-typed-ast_1.4.1.bb =&gt; python3-typed-ast_1.4.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typed-ast_1.4.1.bb =&gt; python3-typed-ast_1.4.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb b/meta-python/recipes-devtools/python/python3-typed-ast_1.4.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-typed-ast_1.4.2.bb
index 2cc9f6c43..09f387ca6 100644
--- a/meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typed-ast_1.4.2.bb
@@ -7,6 +7,6 @@ PYPI_PACKAGE = &quot;typed_ast&quot;
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = &quot;8c8aaad94455178e3187ab22c8b01a3837f8ee50e09cf31f1ba129eb293ec30b&quot;
+SRC_URI[sha256sum] = &quot;9fc0b3cb5d1720e7141d103cf4819aea239f7d136acf9ee4a69b047b7986175a&quot;
 
 BBCLASSEXTEND = &quot;native&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------5141D26112EF9EFD6BBFB458--
