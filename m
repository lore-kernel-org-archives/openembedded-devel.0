Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.68])
 by mx.groups.io with SMTP id smtpd.web09.11423.1610468127216930360
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:15:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JN0LLoXY;
 spf=pass (domain: windriver.com, ip: 40.107.220.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dy8u4YSJVdo/zK7khTgOjHbv3HGbmIc2aA/Z1Q6q71/3+Volo2SGq6l+CqKv8T7wqSV6TkJNR3YcldHe9HnZvp2NIVkfHZneNdFeVGskSObbP0EGztIdhNTGouc6ezgXitrn5dOAgT37WI8CegvH7iYWdfVvLbQ4lV1qp23oT6VoxATE2keEppjkbOp43TIMDY6LtD0PtLLl6znsPKwD+p5wtZZKPUjc51Z2MjvHeeB0JjANPkY70Lgtih/HtFheeTqPap25o9R1se49XE9OrDx9CUgXTACCiVTlUF9a+ZHSBUXgO6gO69aU849SoipQjqQAHuwda0YSYsh5MfxEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLoVPst3IrD1eN1dWZLAwtYqPbWgSuMEcYZnGAUyCfs=;
 b=A4tq33p8n+I8UUnItY9KbcWwtdtKLJEW1hVx53ztvRyHBD2VfPVsslvydppjxncUIKUkNVr3xZl2R6yPbSZuiu4rynk2eL12mLg1pAu8eV2ttZUm+h9oyDC5rOfnZZxRGMafG2VkK24H5g5qF3xNd68/uNq3Z8rh3vF9ki0j/BmJBPmfzIu/SXYuA1wA1vG0zwHjp1V6ndSHth7dY21KvmIzDcR4VamK3ou9JUqv2PCdE+yoFl0+OfvtQMqxz9HvuoDX6t1xk2yXPYcRy68fyteHeQIeacLwioCd4hLivghG9qPJ+k6qLDv8vli61QXTlZHfyA5GVCaRBUzYNHU+8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLoVPst3IrD1eN1dWZLAwtYqPbWgSuMEcYZnGAUyCfs=;
 b=JN0LLoXYYZXt7fqxZ41AsznxFVDCEnq4twlG3wGuIirU+Z1cxGp8acChTg4aK8XrCW6N0oINgL6fpJF00euhzcvU8kB+pJ8y6OBAXBBTAcl9cB4EhpwrKaA3qKrFNRfbuXnpls9l8I0+E+zPRySwILVaD0QPUAcvsFW0b+CQImI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3719.namprd11.prod.outlook.com (2603:10b6:a03:fa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.10; Tue, 12 Jan
 2021 16:15:24 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 16:15:24 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-prompt-toolkit: Upgrade 3.0.9 -> 3.0.10
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
 <20210111152512.23506-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <025464c9-900c-8447-9bf2-2e03ddc78c51@windriver.com>
Date: Tue, 12 Jan 2021 11:15:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210111152512.23506-6-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:c0::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR05CA0003.namprd05.prod.outlook.com (2603:10b6:208:c0::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Tue, 12 Jan 2021 16:15:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f56d9aa-f43e-4c11-df97-08d8b71544c2
X-MS-TrafficTypeDiagnostic: BYAPR11MB3719:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3719BF2951ED54DBBCC3027D9FAA0@BYAPR11MB3719.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hT0zGAQjdGUldT8atYbqqqTWtlwBRUhS7DCyku9Q3xYk4sZ3+COleURMtLIvpfNybfmhq7LA7/e0f5DcofEz9P+wRlFBaoOSkjMPeFMZMJqy2Phg3NF57gMJwttMWBMFwzHs8X8DJvn59XBOLA2SL/iRPJGh2z4S3GxVBglNnJjZlPha7Ll79lcZpDQdGYrO2vmMhHySGRMT1fDuqFl7Zftg8TjAUutMP6AL4C0n+qYRKLxqdHnggvcDma7K3lLa6AHAvCaGATjHK9uCUEj1l47u1ayhaxtXk4Opb9eR56OwP2r6kJVfSVQRwXNW0kXzpHM97Llr5gr6QscN5FSPKChpcPxuZaFR0/2wU9cOXDDABTVBNo63sPtuH+4jQKlWgtP3GJWqiYV/Qa3QrmYbbGnlZ5UA6boo6XWEzSmzuBfNr0eqV66qiafTr3XWJs1UkN9nxl7eXjj63U4X9cWpx9R+7mpt0PHsjgnJIvSt6erX7fhGrrJXiPhXgqUDxMWeu0xHsXS/t0zRt5zrzSGfhPyTJfk0l3/FJIAL00CR2hOWc0yAQwg3qkZXlNqDHBKh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(396003)(346002)(376002)(31696002)(26005)(2906002)(316002)(8676002)(6486002)(66476007)(16576012)(83380400001)(52116002)(44832011)(966005)(478600001)(53546011)(166002)(8936002)(36756003)(86362001)(16526019)(33964004)(66946007)(5660300002)(31686004)(186003)(2616005)(66556008)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QlZKT3d5S3VWdTlYem43SGQrVzV0MHZ2NkZ2OVhGOUVRZHZGclY4T2tWWGRF?=
 =?utf-8?B?cFhLK0FNNnU1YmdaLy84blYxaERITUtKZjFQK2F6aXdBei9JcGxtQ2NJbDVx?=
 =?utf-8?B?T2VqNlE5c2tWNEd5SmFPVjd0czJaSnFRK2hFNGZWbjY1b2JaMFArOGtFRjM4?=
 =?utf-8?B?Wkd3eWFTZmRWNzFHL1BBOWpHcDBLc0RPNjJzNGRsOWtiUHNYc2EzaDVsWGFa?=
 =?utf-8?B?dkxtTlJkZlFBWVF5aGtrOEdwVzRodGcrV0Q2QlFCRVVzbXY4cVhwbXFrRlg3?=
 =?utf-8?B?VWZ4QXBHdEMrT0tOSUE0aEREaVFLb2NEanFYemdybWxObkVKUGhEcVRsM21M?=
 =?utf-8?B?VjAvQ2NOWCs3a1J3TlZUSmQ2NWJETnczTUJILyswMzN3czdobXAxUEIyQm5q?=
 =?utf-8?B?RlpyMEgvRjU3MldRZDZGcUZqaE85K0toU2xZcW1XWDhHWHU0NFUrU0RUaUJN?=
 =?utf-8?B?N3E0TElnQ2tMWlBWRmxhazFmY2RzSXlkVnJwWk0vaFBWcWdjbkNlY2pXOEtI?=
 =?utf-8?B?c0JpMmcwRXJmbnFlb0t4QlhXMlp2Zjd2VktUU0hTbkU2SVVGbW83RFdHa1Va?=
 =?utf-8?B?eWVGNWdCZENzbk9mS1JQVUpINkpNVXdVYnI3RWU0MHdRVklxVU45aGhFMlFs?=
 =?utf-8?B?SVdKZGR4VFBqN3pBeGU5M0FlS3NDc1FHckJEUUtRRFBGVk1mME1DNkEvS0hw?=
 =?utf-8?B?cEorSURMa2E0NThHWExURkdRNjJneUpJamtCQklTM2UxQ0ZXTTNWYlNFZG1V?=
 =?utf-8?B?aE5pMnFibkJDT3JFMmkva1BySWNuV2pIcEwyWmdiU1I5eVFQUFpMWFlrMVhr?=
 =?utf-8?B?UHl2d2U4V3hvSEdzeGFXUnVzTjhTaTYyYVVQQ2VmbExFUGhKaTAzLzc0ZkhF?=
 =?utf-8?B?WVRkd0JVNmVOSDE2WFlwbDFyNXBMWk9VNGxNR1oxNWpENmh3TzJqOGpNSUhL?=
 =?utf-8?B?M2o1R0dXZVMxVWZDZkorV0NpMzFvcmZPbnFqb1NhZ2toN3RWZDFvZDNRS3FJ?=
 =?utf-8?B?dEFPQkV5WkJheFg0S1FuS25FTU91YXlMUURFTjhhdHd3Y2FEMWtXWGlXSGlF?=
 =?utf-8?B?WlppcythakZNcnh6cnVnN3I5WlBWeStNWlE2YW1kcEZCeXlsc0VmWWQvZWVU?=
 =?utf-8?B?RTYxUnJadUl3blRtQURDOGljRld6c2hCQnRsUTJpbmkxcVo4MEtOT3o2d1Bt?=
 =?utf-8?B?S2MvRTV6SEdLenozQWpOOUhvdzRtWk4wMGRsaGx0WXlYc0k4bjhQNzY3alhT?=
 =?utf-8?B?VXF4Ry9jM2ZQOGZaR0s2THpsMmtRMzhGTGczbkR5RWlhUTQ3Q3FRcU5ucHZ1?=
 =?utf-8?Q?0UZ7ST9ZfHUJYb+s1N9waJl5p5n9EoCUGn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 16:15:24.7344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f56d9aa-f43e-4c11-df97-08d8b71544c2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCo0q927bp7nYwtcbjEaq8yxisaRsBIya+EtaezwiHPeg1Bk9THyLt6nToJ1W/STP7prTfJwuIpMFOaObPnOFQi/42IHYc0LEjV29VMjwFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3719
Content-Type: multipart/alternative;
 boundary="------------D0DEFB615408FCF1560E3F4A"
Content-Language: en-US

--------------D0DEFB615408FCF1560E3F4A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-11 10:25 a.m., Leon Anavi wrote:
> - Improved `WordCompleter`: accept `display_dict`. Also accept
>    formatted text for both `display_dict` and `meta_dict`.
> - Allow customization of button arrows.
> - Correctly recognize backtab on Windows.
> - Show original display text in fuzzy completer if no filtering
>    was done.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...prompt-toolkit_3.0.9.bb => python3-prompt-toolkit_3.0.10.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.9.bb => python3-prompt-toolkit_3.0.10.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb
> rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb
> index 589d9398d..abd9eb18c 100644
> --- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb
> +++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
>   
> -SRC_URI[sha256sum] = "c5eeab58dd31b541442825d7870777f2a2f764eb5fda03334d5219cd84b9722f"
> +SRC_URI[sha256sum] = "b8b3d0bde65da350290c46a8f54f336b3cbf5464a4ac11239668d986852e79d5"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------D0DEFB615408FCF1560E3F4A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-11 10:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210111152512.23506-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Improved `WordCompleter`: accept `display_dict`. Also accept
  formatted text for both `display_dict` and `meta_dict`.
- Allow customization of button arrows.
- Correctly recognize backtab on Windows.
- Show original display text in fuzzy completer if no filtering
  was done.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210111152512.23506-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...prompt-toolkit_3.0.9.bb =&gt; python3-prompt-toolkit_3.0.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.9.bb =&gt; python3-prompt-toolkit_3.0.10.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb
index 589d9398d..abd9eb18c 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://python-prompt-toolkit.readthedocs.io/">&quot;https://python-prompt-toolkit.readthedocs.io/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f">&quot;file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f&quot;</a>
 
-SRC_URI[sha256sum] = &quot;c5eeab58dd31b541442825d7870777f2a2f764eb5fda03334d5219cd84b9722f&quot;
+SRC_URI[sha256sum] = &quot;b8b3d0bde65da350290c46a8f54f336b3cbf5464a4ac11239668d986852e79d5&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------D0DEFB615408FCF1560E3F4A--
