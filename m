Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.87])
 by mx.groups.io with SMTP id smtpd.web11.7794.1614177626222827020
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:40:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=L6R22rNN;
 spf=pass (domain: windriver.com, ip: 40.107.93.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDjbU1ri/06wPOw0hyploZxEyskt4Ncw4I01ad+zBDlN+U3b2w1RKlcjyphdSgXOzj5Wodgwn86J2btfzCyPK9H7pgla0WaIflUT4PBas02HhlQIsFWkvLYceVqqDpPl+0a9cA+vL8Ue7wwivTfdC0lgIkyzt7lEFzFDPfztXcWHRFSR5XbfJASbNtUuWyrBsRsgU2uh+L/AgSfHcbHgD4EfTkJAJz+fSo86CxZX6ZjdYz7G1VPuZc8shJXH7knaCFwcRJ6qNPNG6q0ZwAknfR1dTDN5bn1TqT3iVk9dicGLSmPhOPKHBoH0VHHss/LqTo2jk55ceaoBaTI8nMcpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGLEg/x/e++LBhVx7sl39Dxpuv+zGvol34X+CUuPBBQ=;
 b=cNYvQBI8F86L4Cwkd82d3Kqzvj6AlKG0vQN/+cago/vVbkbtg70rwiWhu/q9oeJRy5qbhmQFNsxvpGaq9NiTnDMJBIZlr297pmEHFE8ZZxkZlFytdodOpvhy5bu21y/J0baglMVgqEMD83aW0FS6vQkBr9zkv/mEfY+PujKL059fR8jtwr+48mm0Jsg5mEg3q7QM+hQcd70qU7x6uSPc0PNi3svPE1z1/gi48Je9rH+sp0uOGjSaCCfespp15Id9zSfwlpsEmrUeuuEzVFto73Y/Jxiz2yp20Rclr1OT+i5DdWt5JpX2TguiuuiiYKjKQlBZIYLbtJvVg2QjYgjYOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGLEg/x/e++LBhVx7sl39Dxpuv+zGvol34X+CUuPBBQ=;
 b=L6R22rNN7lCNbEZLa2CEcqTav9VieQ0B7/Ow+/Vza0WrJUCBtgC4r7y/2rqCT1sjQrnoKhiXcdPuBUxIJY/UW1/UtD3oERrPRzrtUw0E9fj5NFMKh3YvVC3froioXo3C9jRZOasl12UFH9KXuAKhckkahY+hRq57jPPNMZV5o0g=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2678.namprd11.prod.outlook.com (2603:10b6:a02:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Wed, 24 Feb
 2021 14:40:25 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 14:40:25 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-tabulate: Upgrade 0.8.7 -> 0.8.9
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210222175043.21231-1-leon.anavi@konsulko.com>
 <20210222175043.21231-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4d69e056-a91e-86d8-7f6f-ba7702bcd2a4@windriver.com>
Date: Wed, 24 Feb 2021 09:40:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210222175043.21231-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0902.namprd03.prod.outlook.com
 (2603:10b6:408:107::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0902.namprd03.prod.outlook.com (2603:10b6:408:107::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28 via Frontend Transport; Wed, 24 Feb 2021 14:40:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6b9e419-19fa-4407-d7a4-08d8d8d21ef0
X-MS-TrafficTypeDiagnostic: BYAPR11MB2678:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26780A678C7F9D5204C1C8CE9F9F9@BYAPR11MB2678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N/r9ynQFhH1LhsbhzkFf5lcjyR+CCv3r+f8hnLFAZf82712AJzS9C96TvAOTFW6D8uM9y+ZyAyRbaOb4osWhF6WrYy0ezCKcGz5b4uQAWLttf6jr4U5VqpgMEHufvox9xbGx6f4adiV6qxDfhWsY2KKrFF0dNjCDmBtBL+zih3+dhr1AQ++F1UJ+6rZQhzBlYcOEMFsuYUYRX96iXTE+EmeQXe/hD80r/+NggNJ65RuyNuXT1FOoki5/JB6aCSYYEKdt2GB8ZOqXBwcBlDFUT4kIppN9HC2LTkyClmVGfxwJe/ssp+OrK0ZhzUV4of85G4MyZVokvqqnHPPSRwsKcbxeI9N7tUtKLKfzG+sOCW5k9H3qvpJAZ0mxx6jRs4DGEjkiCTfWYKAdmUvE5mnbi5gk1EWU7nTH7HUDCd81YOqcjaludclGc9Mk5uSsYPrKe1P9sGLJsL+eGiGf8YmVAD+GM5Kpqor13HwSbdJSbiRdWUYGlFpnaF8tOA3fvl1cenzC+4zr2AL6KXNZAABW9rhGfZhoYyqfbpQPf7WYT9xJIhFT90H3gQHJaacXrdFh6BebrxLwSAf7JJkAGmNiawGfRATcvgBLfBwEu0c93Oi+8iLiqgPQsCA8t+jGSFysx35kVLYOfvMmDyeLQ14eWUtxOUuXOFv2kBFzQsTIkCM1P/qkL1AuajuABbtCKvY5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39830400003)(366004)(346002)(396003)(8676002)(31686004)(8936002)(36756003)(478600001)(86362001)(33964004)(31696002)(66556008)(16526019)(26005)(956004)(2906002)(44832011)(66946007)(66476007)(5660300002)(6486002)(83380400001)(316002)(53546011)(2616005)(166002)(186003)(966005)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?YmF1U2tUYXJWdWZKc1Q0ZTFZRnFKR2lUYzB5UFpENndqcVkvSksxTjJSYkQ5?=
 =?utf-8?B?VGFlaFllbTNRenM2SlNuT1FjMmo1OElOWUR1NTNWMWJYME00VFhpWStjWHVO?=
 =?utf-8?B?UTczaGJrZmE3bENRVXE3MmRNU3lmd05LQWZnOW9SL2U3TjU5VDM1VmlRVVA4?=
 =?utf-8?B?RlRIUFpqWnVZbWk2VUcvaTBQNzY1V1BRNjVhRWwrOWNhalB3V1RGNVZQTjJ2?=
 =?utf-8?B?L2FDSjg3dDFWVm45ZEphNDAvc1dWR1c2N21WTHB1MXJIRTVzclZYd20zemRp?=
 =?utf-8?B?NzNBbnNOWkY0SWpob0xENWY3UGdJeGl4clNsZUpZWCtTRkpZcjNMMnRlUVpF?=
 =?utf-8?B?WnY1RTBNSkZuVFlDaDIyQ3Y2SGhDVWQyeERlSFpEZjlhbFhxTjUzNVBOWVk4?=
 =?utf-8?B?OEhubU8zVVowUXFOdG50bytOb0lUbXlOb05FTU1GK08yUGJualR4ZFVpajZL?=
 =?utf-8?B?K1pTaWk2VHNhZTRBbThUbm4xUmIrRnc5WHhGazJXUm5kV1oydkd1eTVWbjRz?=
 =?utf-8?B?SW1lLzE5bUVHR3VwWTNGWUl4bnFOMWtiWGFVNG5LeWppWmxMQlFpLzZIemt0?=
 =?utf-8?B?QzkxcXRDZ29jaGF2Nkx3czV1c3VKL1B6c0NCbmRSTm5wektmL09MYjNOUjcy?=
 =?utf-8?B?RGVTV1hiTW1tMkRxWnZ2R3NGRTNDNjFpaXY2N3h0V1d2akRvYTZkNkErQ0F4?=
 =?utf-8?B?eDRPVno3VHdITTl3cU1DNituM3ZreUF1OW1WeFJFSExHNEJ5UkIxTFZTYjZy?=
 =?utf-8?B?UTVDYUhJODBLeE9xcjlzMFl2NGlJdlRJeW4wTE1ZQ0U3bU05VXhia3llUnNH?=
 =?utf-8?B?RENlUmNmclhVUGxnTkFCZlJ0MFc4bmQzOTBWdGJBdmI5K3RmRFcwaUZiNnAr?=
 =?utf-8?B?RldmeXgzSmNDeEVvYzk1QkQzMkIxN05zYWhrKzZZb1VJQW03REhPSDl1ZU5F?=
 =?utf-8?B?Q0Vmc3drbHcwRDdXSjZKSDhpWTdycVhBaXE5VytHWUVBajgvbUlrVjk5OG0r?=
 =?utf-8?B?YTBud3RTUGp5QXgzVEN0K09vaUw2cEJTS1JqN3V2WVp0a09wWmo3QXZOWmhI?=
 =?utf-8?B?Z1BuUEpMYTZ5cEZsYUZDT3VtNVpYZDdTSGNSUnFkM1VmaFlCaG9Hcm9qQXJO?=
 =?utf-8?B?eDd0Qyt0cVp5dFJ1SktZUVlCbE9OTCtHc0JyYnlQVUh1NEp5YXNLMEpyVlJm?=
 =?utf-8?B?Q0Y3R3BrdDhMTlVjWG1QelROcWhXMk43SWtVS3NSeml1Ykgvb1hCekpGOUk2?=
 =?utf-8?B?MGVSOHZQRXJPRjQwT3E5SEpnYXIwN3hkaUtVeEJNOTRvUVEvOEpwd0VJMkh3?=
 =?utf-8?B?Tmg3ajdPWHlpMVRjb2Z2aWp3NzArbzdLMVNkY1NFd1VTRC9xR3NhT05Rek9E?=
 =?utf-8?B?SW5Ic0dkYVBSUnZLNllnR1R6ZE4wSWd3L2NReGROWEJRREQ0TDRKb3BVVXpR?=
 =?utf-8?B?cGs5bklxL1FEUC9Pd3AzNXcxbHlBYXlvajFCOVByaU1wZUJWa3RBZzhFbzAz?=
 =?utf-8?B?TXlMY0hkZGF2L2tZVk14ZlV2blZKZnc3Zk0yakdIRVUvc2h4ckJSZ3o1UDVQ?=
 =?utf-8?B?bEc2YmNVRlpHR0xqakh2UHZsTnp5WWJKQ0QzeDR1NW9hOUNCU0c0V0hBbnZU?=
 =?utf-8?B?aW5PRW9jejI5RW9Hc0NSNVBwMUJlMGI1bUtNdE5RT3d3NlhYaTVIRjN2S0M4?=
 =?utf-8?B?VXZyNmxlVEM3ZitSRkNOK1NFb1A3Sk1US1IySHQ5YU9TZXlHYnFRRXdzd0xQ?=
 =?utf-8?Q?Rf3vtpfOPuqn3PINyau8v1CFoqbJtG/xYyxdfCw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b9e419-19fa-4407-d7a4-08d8d8d21ef0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 14:40:24.9145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ne5GRWibeYJQguXoyTeQSVfvEl0cpWZfAMmfiWTBdIAp9ihhcahxkDOqvRuFDnI5kvlbuOHfbYspDdvTRuVdDXzRLnqosZOQRu653B4nj2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2678
Content-Type: multipart/alternative;
 boundary="------------0F39F6F44CAF2F5C7BCFFB9C"
Content-Language: en-US

--------------0F39F6F44CAF2F5C7BCFFB9C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-22 12:50 p.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.8.9:
>
> - Bug fix: Revert support of decimal separators
> - Python 3.9 support, 3.10 ready
> - New formats: unsafehtml, latex_longtable, fancy_outline
> - Support lists of UserDicts as input
> - Support hyperlinks in terminal output
> - Improve testing on systems with proxies
> - Migrate to pytest
> - Various bug fixes and improvements
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-tabulate_0.8.7.bb => python3-tabulate_0.8.9.bb}   | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-tabulate_0.8.7.bb => python3-tabulate_0.8.9.bb} (59%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb b/meta-python/recipes-devtools/python/python3-tabulate_0.8.9.bb
> similarity index 59%
> rename from meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb
> rename to meta-python/recipes-devtools/python/python3-tabulate_0.8.9.bb
> index def35ff441..19261c3d1d 100644
> --- a/meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-tabulate_0.8.9.bb
> @@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/astanin/python-tabulate"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=fad5a39bdfe452b13775adda41023ba7"
>
> -SRC_URI[md5sum] = "a766c6eecfe3765821909c4ddf082b3b"
> -SRC_URI[sha256sum] = "db2723a20d04bcda8522165c73eea7c300eda74e0ce852d9022e0159d7895007"
> +SRC_URI[sha256sum] = "eb1d13f25760052e8931f2ef80aaf6045a6cceb47514db8beab24cded16f13a7"
>
>   inherit pypi setuptools3
> --
> 2.17.1
>
>
> 
>

--------------0F39F6F44CAF2F5C7BCFFB9C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-22 12:50 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210222175043.21231-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.8.9:

- Bug fix: Revert support of decimal separators
- Python 3.9 support, 3.10 ready
- New formats: unsafehtml, latex_longtable, fancy_outline
- Support lists of UserDicts as input
- Support hyperlinks in terminal output
- Improve testing on systems with proxies
- Migrate to pytest
- Various bug fixes and improvements

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210222175043.21231-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-tabulate_0.8.7.bb =&gt; python3-tabulate_0.8.9.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tabulate_0.8.7.bb =&gt; python3-tabulate_0.8.9.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb b/meta-python/recipes-devtools/python/python3-tabulate_0.8.9.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb
rename to meta-python/recipes-devtools/python/python3-tabulate_0.8.9.bb
index def35ff441..19261c3d1d 100644
--- a/meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb
+++ b/meta-python/recipes-devtools/python/python3-tabulate_0.8.9.bb
@@ -3,7 +3,6 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/astanin/python-tabulate">&quot;https://github.com/astanin/python-tabulate&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=fad5a39bdfe452b13775adda41023ba7">&quot;file://LICENSE;md5=fad5a39bdfe452b13775adda41023ba7&quot;</a>

-SRC_URI[md5sum] = &quot;a766c6eecfe3765821909c4ddf082b3b&quot;
-SRC_URI[sha256sum] = &quot;db2723a20d04bcda8522165c73eea7c300eda74e0ce852d9022e0159d7895007&quot;
+SRC_URI[sha256sum] = &quot;eb1d13f25760052e8931f2ef80aaf6045a6cceb47514db8beab24cded16f13a7&quot;

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

--------------0F39F6F44CAF2F5C7BCFFB9C--
