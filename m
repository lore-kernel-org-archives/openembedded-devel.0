Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.79])
 by mx.groups.io with SMTP id smtpd.web11.1827.1610121675594172863
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=K5KvnvfH;
 spf=pass (domain: windriver.com, ip: 40.107.243.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mva4urOkJJsD/tjnpmoeYHCCO0NU7OuK5zoHf8F40baKyPEZJoFFT2GkUNJVsUVUomvgBSaGLS2qBd8pnM7G1hZf5FiRqA9wAMgFvak1cAGxsBu99L7u+VPtnP/iNDGwKmBvW8g43zelk0pDSBMrXnJzU6FInsSwbnhYjHptWHzkJ0NFA6Mh1Kh+TtIp2yldUTOsdstIHjJ34HP6s++WgFFmIC/ryw+TRtC6jFrXZBRsJVtSmUS13x0zhkwn1K8ibdaqLEBL7Q0D+Hgdj62+sQ+nnAjD/xN4hIh4Ij2kZUvpkZcFjdQW9+Tje82ULJ62yXsMdgSGNqvjqSxvGRnC+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvIn/dmjewQS+ivUPIlKT/IOoEcnkmop8cCIi3Gj1AY=;
 b=PMKOno3v6YGluvShi1mGsF2PUej1QaDq9h2AsN/nXUed1yZsTwywu9ha2k20WY8/LN8kuajYoE4/mlyHUF6HDKDYhGU20maxDutf/sGVX32hEhk/HFqHrFCqGZCQ61e3DXkxpJGf1UpNgZpDx9Jfk8IkS9x/U2V/g1/aGLSlZnK6DRAwphNrxqJnCs7NoFJUZCek/RNmNXEmQ1Beuf2OV1ScEQ2CGZYx6AFgc17NE6a7KPMJK25+OB4UGQsHYNZWsnZ1BbgJ31WBbpHilGjgGqHTREi6M3kZiI5aJCjk6PGUi9MZjy9MZBfXIUsx8AWToRxkg5NWG7SI0vNy+hma5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvIn/dmjewQS+ivUPIlKT/IOoEcnkmop8cCIi3Gj1AY=;
 b=K5KvnvfHxxpE3YZGs1P+TdFnL/KEo6Vb4yxP8YHMZ0VsD3WGN2MaI2WTti9N3VlX5HRhVm6Y9HhlS2UKvimfykryx7wfSu/ui15npTmbSBkFllQkAU18B9dSA7tk5EajWYD2NlzzHjiFR+hY/mHh0s6f5oItHzpTZtvxRPXtn18=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:01:14 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:01:14 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-requests: Upgrade 2.25.0 -> 2.25.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210104191916.7071-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b51f95a7-391a-1831-8438-720d04fe2c01@windriver.com>
Date: Fri, 8 Jan 2021 11:01:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210104191916.7071-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:208:236::21) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR05CA0052.namprd05.prod.outlook.com (2603:10b6:208:236::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.3 via Frontend Transport; Fri, 8 Jan 2021 16:01:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b43c91c1-d70a-4b05-3c00-08d8b3eea032
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48966243A39E1B7077C4D8869FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xAghZx+GzF42WwH62jji7lEdxJjSmtOxkwT0IQIm9eJ4JvB3u5OJ/1oUlywCsP+IVbGxa8seu/s+icQIpIKI09KqKcTJOz9edQZqMjXffqkraW94O3Vy+TpJvQJWiyvesgyKS8dZCULxM4kW5SizK106CcE6r3Ojio5Q/8hFl+Y0FFYkCCX53UL57gsFr5VjJe2iaOUf+qmEwD74eidCVkHNz7IdoTrhl3+agANi18CSavT1ZOyvhi4Qx8w+6n0cQ77t0auHoO2OOAFNr741SjThSuspzEkcg5iR91QMf6jZHHRU5l6H2tJJfhTyhXfSuYM8eQjtxwm7eIV8tgNluZZ/kFEPfS0edUC6vgbfDXQxrBkXH5R7QK1avLso0SvooxjHk44q0v5NJEjIXSjBm9bI4DYq8TIHd+z0yNWfIZGG/3gDCJ9Kv2s2JBR1wIb7me6jhXAYZEMlITf8T0KcmAbcVOKT3Hht6DGY12iYKQ+O6umaq9uS9jl3IYDnqdGAXCvqLcknm3kOG99W9f1cjqDTCVsCPaTx1jYSTCAxZY/vWdY1olqe4XbBM8dhkPFR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ZVlOL012K3BNWHZxZzRFN3NHQW8wUUFxSkZ5c2FIRDg3T2VPeS9mT1JXUVM4?=
 =?utf-8?B?bnJVczE3U3Rlem9QR1RscW1wSEtMUjdXclpJckVVUUxUYkR0cFlkMTRJYTRx?=
 =?utf-8?B?OWRGNlR5V0tkdDNUNUlIRkk3OWh6Y3VER2pReVZ0alVyeGhleU9TbEVBYi8y?=
 =?utf-8?B?ckVvN09lR0ZEd2w2OXZ3RExoV0IyQVBFcUZsRGVlbEQ4cSt3LzB0d2VrSEY1?=
 =?utf-8?B?cU9KUFYvUXZwbEhwYVVUYmk3QlJJbDRySVBzUGxuL3ZyTCtHSXFFYUlCQktM?=
 =?utf-8?B?MFQwTEtYZWVnbTQzdWpzZnRYS05UejZMWE5Mc1dSVVJOTEtxQWhZaDNlTVJ3?=
 =?utf-8?B?b054dmEyckwzS1BaMk9JUzB1S2IvTmhwekxPUkd1ODVIMVFYWTFNRHhqU3li?=
 =?utf-8?B?UW5HaTUzdEVRR3FidG1zZVUvbkFPeWZBQWNxRVBRTlZBL3BaTVRndHhBVjh5?=
 =?utf-8?B?ZnVRMkdiS1U1RnlEZk9qSzF6Qm9idi90d2d5eWxnR3lMRTZBcmpQdUNDV2lW?=
 =?utf-8?B?THl3NVJoWCtYK0x0Z3Q5MW5lMFB4aDYraFU3L1NlalhMOW4xSEJ6WDBtbnE1?=
 =?utf-8?B?T2p2K0hUSm1iRG9oTndSayt6YXd5STU4S3hKMTUzWkE2TWNYWHlqVG4yWVRG?=
 =?utf-8?B?aHFTelRuSHBhZkZBbW80TytzUm81b1lpVjAvVnRGZjUwdnZIS09aNys4MCti?=
 =?utf-8?B?dkdZZ2pueWlzNFBYdDhUd2lSaEg3S0JKdDdTTVRURjZ2RzNjSk5xK2tLVFVM?=
 =?utf-8?B?Qy9KSmc0YVExOENXdnBDYlcvLzdRSFFIZVVDVnk1UzNDYWdERStobitSQ2gx?=
 =?utf-8?B?ZXdEbG9vSHZTNnIybllRN1QvMGczZDFDYjdWOHZNT0xpV3V3YzVBenlrVkVI?=
 =?utf-8?B?TTNNRkZBQWl6QncreHJhTzczSVVzNzY2TVhmZEl1VnRLY0VqdHlCcjJrczNn?=
 =?utf-8?B?eDlVZ2s4Q3FTbTVtekNTVlpSZ3BHbjdxWnJ1ejN3L0JvR0RreUpYcDRIeStO?=
 =?utf-8?B?WXB3cFFmODZQWW5ncDB2QXJpNlZWeEQ2OE9XS20ybkJ4QVpqOVZSaUNuTUdO?=
 =?utf-8?B?clF3eURsNTZtb3NjeEU3KzB4VFR6WTlRRTdDQmw1SURrbzRNTmdmMXhzMmpZ?=
 =?utf-8?B?UTM0VjUzK3Z0Z1pIRkhmOXpLRWhsaE9HbHhueSt4dC85M0hlZW1vZlZBTDdu?=
 =?utf-8?B?ZGpNUWRwaWtRYVJiWDBjZmxROE1ob0l1cTlVUzE0M09TeEtIa2c4cjdORmpy?=
 =?utf-8?B?RHUyR0piUlkxZ2laZzdhMy82YlBDTGJxOVdEUGxDbnpYRDEzZ25vTjk2THQ3?=
 =?utf-8?Q?NLwqJA/PamtzXn1S3FX1rnBM2OxqGszzzR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:01:14.2711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: b43c91c1-d70a-4b05-3c00-08d8b3eea032
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mIOLsZFWth+olrw4iE5Aj3NCww6SO0Jbxm7ZpBN3bwjo1OuHoYM1BzZPhI5EWKcq5zvx0PwLdJ6UBvIWD10bUtuc/X1kEmd8T3bWedUT9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------DE1C79297D883ED13CCB2718"
Content-Language: en-US

--------------DE1C79297D883ED13CCB2718
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-04 2:19 p.m., Leon Anavi wrote:
> - Requests now treats application/json as utf8 by default.
>    Resolving inconsistencies between r.text and r.json output.
> - Requests now supports chardet v4.x.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-requests_2.25.0.bb => python3-requests_2.25.1.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-requests_2.25.0.bb => python3-requests_2.25.1.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-requests_2.25.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-requests_2.25.0.bb
> rename to meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
> index 5284f95982..6af836543b 100644
> --- a/meta-python/recipes-devtools/python/python3-requests_2.25.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://python-requests.org"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
>   
> -SRC_URI[sha256sum] = "7f1a0b932f4a60a1a65caa4263921bb7d9ee911957e0ae4a23a6dd08185ad5f8"
> +SRC_URI[sha256sum] = "27973dd4a904a4f13b263a19c866c13b92a39ed1c964655f025f3f8d3d75b804"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------DE1C79297D883ED13CCB2718
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-04 2:19 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210104191916.7071-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Requests now treats application/json as utf8 by default.
  Resolving inconsistencies between r.text and r.json output.
- Requests now supports chardet v4.x.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210104191916.7071-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-requests_2.25.0.bb =&gt; python3-requests_2.25.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-requests_2.25.0.bb =&gt; python3-requests_2.25.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-requests_2.25.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-requests_2.25.0.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
index 5284f95982..6af836543b 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://python-requests.org">&quot;http://python-requests.org&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658">&quot;file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658&quot;</a>
 
-SRC_URI[sha256sum] = &quot;7f1a0b932f4a60a1a65caa4263921bb7d9ee911957e0ae4a23a6dd08185ad5f8&quot;
+SRC_URI[sha256sum] = &quot;27973dd4a904a4f13b263a19c866c13b92a39ed1c964655f025f3f8d3d75b804&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------DE1C79297D883ED13CCB2718--
