Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.47])
 by mx.groups.io with SMTP id smtpd.web08.8348.1612533966168265176
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:06:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KVeCvYIA;
 spf=pass (domain: windriver.com, ip: 40.107.243.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICBeN+PvuFKAlnnuoIi2HdKeA7bupZq0ZQlLzg9InLM/tODk5/sBcGCFUvm+8BUvJJNOuF1Rr9uf2Cfmrf/ogyeEqI7wIxFXdqFeZqUhOLgF/4MMeNTfjxGaBUxDewa/7IS5uKNR7BEg4B3sEWmZmik7fduLOtwypd13fSsNbcP7NRxtAcwnI7MXelcjCB6C8rgaHfKAmJQ9tFmEhvoa9bhXHq+LtwmBKBTV7Bm56NtUAMZCAaa0tJC+6MkZOoi+TifvVQJg0vdGrStdo+9yDFFomnOHack4cqQqzp+iy0j4RZ+VAtzxbjIPe6fgK1+4TswfAUtf0cFvKgB3GQKc1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2GgcK7A17FRNnf2ETSYEz8pvvipkodIOxNShQUEiGA=;
 b=XL4B64TdN/6cbyika31LEkLfeo30nYMz1ljpQy9y9Bl4L6VrfBhT2Zs7ZTO1aGrQjOdbOjsSwsXFdWByo0aBdlewbxxwoGOidvP3yqV16MCIoCpBs0PnMcuzNiIt1v7nmOY7CwFoFy7QrjWsoO390e4A/2DO6gNxcAPLVPY3gHxZfuM9fvWfxJ3IKYFWuWn0qmfBpU24HmxffFvb0biPvitd7myPQMb53KVHcI5EfXSNYS5EETA0xCdVH8U0dj0hX0JJGHQtMHRnyrCu3pSmAgz0HAEu+4x7XdyemVCEtYU0dPY5FYIaHIcovuhB2LcenHOiYUQH7CO7fcIALCP+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2GgcK7A17FRNnf2ETSYEz8pvvipkodIOxNShQUEiGA=;
 b=KVeCvYIAb1DZ1PD/2zcke+DzBw2/Fz+T9JrBw6/syMRP9pAicnBKjCym11PtwWlgnTKm4OeuQfD66SQUlrytm1x8ViCIayM7eiV2nu/4OrEfClWQ+PdA71W/3xny0dps+L1GEQj9/lYoE/bbdBw/Mj2PWYzH80Sh+qddp4Entws=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3352.namprd11.prod.outlook.com (2603:10b6:a03:1d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 14:06:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 14:06:05 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pykwalify: fix RDEPENDS
To: Ross Burton <ross@burtonini.com>,
 openembedded-devel@lists.openembedded.org
References: <20210205092437.3099545-1-ross.burton@arm.com>
 <20210205092437.3099545-2-ross.burton@arm.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a33a9791-a2c3-3494-22e8-c82f0fae9284@windriver.com>
Date: Fri, 5 Feb 2021 09:06:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210205092437.3099545-2-ross.burton@arm.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0459.namprd13.prod.outlook.com
 (2603:10b6:208:2c4::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0459.namprd13.prod.outlook.com (2603:10b6:208:2c4::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.15 via Frontend Transport; Fri, 5 Feb 2021 14:06:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f980ea93-fe52-4553-784e-08d8c9df2d60
X-MS-TrafficTypeDiagnostic: BYAPR11MB3352:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB335289D80B1883DDABFEC0B79FB29@BYAPR11MB3352.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ScLwdqhhD8gS92WEHhqD4FToS8QwUY//5MlgwrXsojY5Hx+cRwXHwLMWMy5tqWTSYyyck8vdIj3tZOZvv8NaMWfa3IG9P0xGcyYujfyhEsO+laqCPSTxH2quvqYzT1gAUsdyr4L+tg5OMB6/Ge/1+oHh+0nCGraRVNQdDcid01cxJhaQq+pabyi/r3pjhootFvQCdr+44AqMhSb2EWyEGidrHu4mG2b1rWkqVanrJHSjkYsESZU7Gk9ezl/AfcdgNkRvg80q3BnQwtcbzGFVDJLSNzIGBfxssifpx/BZzz47sZvSABj8lxXXtcz26Pd0k92fAysgM9cZ14hDutrTJCn55cRZU43D6pXfqiIYQ1J+9ZpbdkcwnjvrxYCODY5Pc3MiNvJY9x543maURsmQX+It9U6QxOvtzALWbZHsZqw8RetFiJr2iZUdzyQ9Mva07GkSxqGvMmBD8Lp7TWfYCWWNx1wtyD59rLm2GwIuX0eDE1ZAMOtlAmmuBjPfqIbQc9PkXBSGRzEpYkBjDQaMNh7rm/eWJeBQRC6fwlc43Rp6ViZPkPWA9TKOy4bj+FJ7ZKLXGrsEWiZBzM0eY11yzFLZ1Dt4q/403z12EcUYAjT+KqAiS+dsutKA/U25nqqQFNDx5L4mZ64lHz7CiH9uJBXbmdGl58dsUoXwluWBhTwb4Q3uLi8Hpt57GwC6+KNF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39850400004)(396003)(346002)(8936002)(83380400001)(966005)(44832011)(5660300002)(16576012)(8676002)(36756003)(166002)(33964004)(478600001)(66476007)(66556008)(31686004)(52116002)(2906002)(53546011)(186003)(26005)(16526019)(31696002)(66946007)(6486002)(86362001)(316002)(2616005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?clpyd0NVNFJpTms0SzdYWm1IN3Z5dGpCZk1ad05tUmp0c1dvMmIxN2FXY1pr?=
 =?utf-8?B?YU1jMnJSZng3R0p5blpIR3FpdTJEVTc3WjJsaXFNYlY3WnZwZ3JZdTNQTFEr?=
 =?utf-8?B?ak82dkZsWWRQMmZ4ZzU5SFJqcnk0VmM2RVlXQkUyeklWUlpEVzNWclFKRzBY?=
 =?utf-8?B?eXlaZzFFZ1I0dDcvUG0vMzdlcktvaTFtem9mdmpuS3pnVjN4SUpKcjdPOFZW?=
 =?utf-8?B?blJLY1FZMXRtUUxoMlI3cnZWRkpmZkE5ZE9FeE1STm1HQUVTdk04cUtxMkY3?=
 =?utf-8?B?ZjMzTy95UFB2MFMwTlpVcGpLVjNoS0FvNDdjcVo2c2R0VXNmS2lvK2hLOTE5?=
 =?utf-8?B?d29jQXRWVDVuMWI1T01KanUzTDkwdVZPUWZPb2lUUm8ySHdudW4rditnTGlv?=
 =?utf-8?B?K1dDM3pOd3ZnRko1eVJmU0xiZURSYXY3RE1GWjRmdVRXRUFHNjJidVNDbVhm?=
 =?utf-8?B?bTJBejltUndYL0hRWkVDc09LNi9yek1sajMvK0IyNk8yTUJUbEx0cGJKa3dz?=
 =?utf-8?B?Sm1uM2RtU2d6S1h6NlFONUVCRWRsWFdTdVhIc20weXkyMzNVVkp3MzNnb2xy?=
 =?utf-8?B?dzFwWDAxTlNmSEhaaUtFcXNKVVhjeVhxdElhTDZTend2aVpaS1Q3Q2NlRXpu?=
 =?utf-8?B?UnZHL3YzTkJnUStvOXFjWXJ1R1oycmg1ak84WGRMUGdqY3M2RlFSY053YjRV?=
 =?utf-8?B?aHN5eHBFVkgvcUJ2M2REU3lPT3FLZGdXTEdXV3BpMW9jL3BNditSV3ZGVkUw?=
 =?utf-8?B?ZE1HNG5FVWhVekFBTDF4STE4Z01CODlOWjgyNWdYSEc0dTB1dzFZYU1ycDhI?=
 =?utf-8?B?VFBISldoL0U2VWRla3hKaGdYNmNQUldtRHR5Rm5ad0dMUmFOQ3hXcjhhR2J3?=
 =?utf-8?B?dEtTTzRDZ1pzKzB3TjFWMzRjejZKSHRMNTJhYnZzZmNrcXVVSHVBVUVSNzFU?=
 =?utf-8?B?d2pNcEN5RXlkRmhWSkNTYVBEdXEzY0hBRDV6Mis1dStpdmtvblVBMHI4aVF0?=
 =?utf-8?B?NXVQcVBENnRjN1g5L0VJdWZmNGJuSHJjbDBXYkJ3SnRGSmpXd0dLVGViQW5O?=
 =?utf-8?B?ZEIzUG9WY3R2THVzSTAzKzd3UW95QnlxOHZmMHRyV2dRVk0wQ2RtTThSTnR0?=
 =?utf-8?B?VjN6U2dRT2Q4VzVzbytRMHlCZGxDWGw2NFRsWGFETUpOS2daOVVuQVBBVFJG?=
 =?utf-8?B?OTlsUjNSRG9WV1J2Z1RER1VYUXRLR3BJMmpkYU44dkdIZUlzc0MxR2hIdG41?=
 =?utf-8?B?b3VXeWdrTU5DOC8yYWh1UWFkMCsyRk53YzVNZlFWQWpHRHoyNmdIU1JpanNO?=
 =?utf-8?B?TVZXd0FHZ2hJYVVyN0Z3NHMxY3dGWjFSNE5zanVSdHlmUExGUUllU3ZpTkQ2?=
 =?utf-8?B?RXdPUlJ0RHBUTVhNTWlNMnhMblZML2JXLzhVbWRkNnNyMmhLQVU4VUlqbGln?=
 =?utf-8?B?eTZvOHZJL3RvQnVhUWo3QWxLbVNKMGpqdWtHQytTdDA0T1BhZUlBTlVpU0dB?=
 =?utf-8?B?SFBIYW9ldnFpVEQwOEhSNVloM2VKUUlleEdES29TQTRETlRKVEp1dEl1Nkg2?=
 =?utf-8?B?TFh1UmFlR3NyVnR5TExQVDIyZzJPU3BNTWlkZGQzZDNuYkhiMU5MdGcvMHBC?=
 =?utf-8?B?VThMVFZRaVhkN1h6SXJBc0haUytYdk9jUm80WENlV2hhY01sYVdVOXFIM2NI?=
 =?utf-8?B?Q2M3aEcxK1pWMnh2ekhCRXhSbmNjMWJjM1JySEljUXZOa2x0RENnVlZrck1W?=
 =?utf-8?Q?WPv7zLqzniIDKctq/+pIU1hR3mhcbHr1GHELvVY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f980ea93-fe52-4553-784e-08d8c9df2d60
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 14:06:05.0871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZkebomnedGWT+/z/389FNMF4tlMWrJ/JwGRQ5PBitKBD1pRpy4GcAe/oJZh1fk5KbNHVBQdgc73Kec1Odq26+O3Or1/l0uk6sBxrEAtaGS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3352
Content-Type: multipart/alternative;
 boundary="------------23E0CF13DA351FFA24764EDD"
Content-Language: en-US

--------------23E0CF13DA351FFA24764EDD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-05 4:24 a.m., Ross Burton wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Version 1.8.0 dropped pyyaml and moved to ruamel, so update the RDEPENDS
> so that this package continues to work.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
> index aa14cdd4b6..4d4d2b79cf 100644
> --- a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
> @@ -13,7 +13,7 @@ inherit setuptools3 pypi
>   RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-docopt \
>       ${PYTHON_PN}-dateutil \
> -    ${PYTHON_PN}-pyyaml \
> +    ${PYTHON_PN}-ruamel-yaml \
>   "
>
>   BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.1
>
>
> 
>

--------------23E0CF13DA351FFA24764EDD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-05 4:24 a.m., Ross Burton
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210205092437.3099545-2-ross.burton@arm.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Version 1.8.0 dropped pyyaml and moved to ruamel, so update the RDEPENDS
so that this package continues to work.

Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210205092437.3099545-2-ross.burton@arm.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
index aa14cdd4b6..4d4d2b79cf 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
@@ -13,7 +13,7 @@ inherit setuptools3 pypi
 RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-docopt \
     ${PYTHON_PN}-dateutil \
-    ${PYTHON_PN}-pyyaml \
+    ${PYTHON_PN}-ruamel-yaml \
 &quot;

 BBCLASSEXTEND = &quot;native nativesdk&quot;
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

--------------23E0CF13DA351FFA24764EDD--
