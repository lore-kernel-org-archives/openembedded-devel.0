Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.77])
 by mx.groups.io with SMTP id smtpd.web10.25682.1598552432058644701
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 11:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bDtM3A9d;
 spf=pass (domain: windriver.com, ip: 40.107.93.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSL0IaBFhpqGkTz5DKLfCv32fTLm+r9advoksGFm/O029vURz1Hk4MEwBWy+n7a+pfoQcgYOTGT9Tir7zx346dBoK/nr2nvg1o8KfPD4IzuH7+5iRNPIob8FrzRoSj4vO5AC7NrynmjQ2/4SMKGCean5Gn2ve2ZcpbVUZ4I2PHIgMEfesGxBjf62h5wrRY/uNnIl9J+3sSSA8RWDxHizupkNRDgCK+o9dje04hDTKCKPqwbn5D7TB/F9gqDqc3fV76RBIDpyctdpgd6ba2MNhdeoaGlXcgs7i73nmZTIvEuXOikpzLg8KPUZjwIYA8TKDUykopJehQg5xvLBefpI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIcayycOKB3Yjmc53St+lsQZvNORTguQfhF9Z696aXI=;
 b=iais6AFrYJdzksph8ryG9AW+KfWVnJbqy78coZgxFYecA9NWXySw1OAMUyUX3kyxfNxLQJq3lhmOrSoHwNCqt8yraSmVCDxN1DyXnC5er4KO1aR9rlimVH3sTplZG/iz+7Ngog9R81q26CdKNLEgYBhY6q3FnZXz9Zzi6pT+4n8Ys5h3ui7S9ZnFMzZnf/mjOFf15RExMPOivcT8QIiru316pO+DtLqCkdyzO2P+PLORoZCSA5QYorP2vVeiqbDn/j/e0friOFmxlKDKB/oofRw1+CrYm3MPsNBnXqjjAOE/U8J9lFdLYPRde3iARCd6OUSXXxHNq1F0h21jL3Z99w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIcayycOKB3Yjmc53St+lsQZvNORTguQfhF9Z696aXI=;
 b=bDtM3A9dGw+g4oiwBvuXE6XZTChajRMk07T/+FlDYmJeid3nhDa2ThPWnps1ZEU5ZFbYhjkFdPmMrOqc8tDs/WjUTu4cTjd4aHOAaPTdOiui4EC60rL1XRel3b2ZbLQ+mQ8cQAnlAUt7mM/06fC/Op9tyxTWPw3RvUtAEE0nIrA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2726.namprd11.prod.outlook.com (2603:10b6:a02:be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Thu, 27 Aug
 2020 18:20:31 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 18:20:31 +0000
Subject: Re: [oe] [meta-python][PATCH 4/6] python3-flask-wtf: Upgrade 0.14.2 -> 0.14.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200826154020.29208-1-leon.anavi@konsulko.com>
 <20200826154020.29208-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e6615822-8d4b-2c94-220b-e9d92282a97f@windriver.com>
Date: Thu, 27 Aug 2020 14:20:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200826154020.29208-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::32)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 18:20:30 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fa468e2-428f-4106-8761-08d84ab5e19b
X-MS-TrafficTypeDiagnostic: BYAPR11MB2726:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB272614BB2DA0B5C5AA8CD31A9F550@BYAPR11MB2726.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:22;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xinMMPYY6fIol7oO4m5xv+dVjm8d03QtsjRdKhWwYogrn5RrAUr4WfV31pgxmoOLugWbKSAjtn4AUee22apH44o07GvCOgXgL3Os0z/VmGE4Z68YqO9E9+3yx9e/KdwV0C3IyjT/0U1VZkTp8weKBNyr2CapP0cjT9oa54KI4PAKsT31BazklLnsl/hmZZ7pLLoQ5KrWMWUZuEUsiJ47X0+7azF/eHcL+l2GY9ZIO4YJCun4xAC31ZAQM7tMzfHya9qVYurlmDJKPI1qsmNov1J0KZrGcl1mf8AR/FmJFY9qwGnYjr5BwG29r4H8UCwCBB0od8D8A8J24+x4QHGr1AszRyFy9l+ZSYZWtJOqqH7VQysd0yhr5VxFHCqEn2Q5E4gvWQcsHf2hmMAbnQI2Yu2jYAPx8EHzKY2FnhiBvf2RqfYjYg6YWLCQ9TmuGdeeKCpVE8U7JHhmr79Kl0vnQw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(5660300002)(66556008)(2616005)(956004)(26005)(31696002)(8936002)(6486002)(83380400001)(33964004)(966005)(66946007)(31686004)(86362001)(2906002)(186003)(66476007)(53546011)(52116002)(166002)(8676002)(36756003)(316002)(478600001)(44832011)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	TOjK3xW33hWUnVXkwV3sgHkg38gCZWHBpgJuDAz4FUo/V+ZFobazi1j1dW2B0shHIJGcp4zQO6lWumEC6LSrfMKXDxOuytrpcCy6br/RvXCwNqZFhgNN6eWGjOXAe1stx1mMogGAYV/VruGC9JH4T/eq1zOJCVfwjOEfcun6hTTvHpZrUs96c7rsqw9j9/4Vi/d3Vdl209DgmzHNaYK/fbC9j6SoBlapPy0gv09ER7bQbiMPWfcqkQY5aaKA6nZ7LqiO+f98Ikl3DytvspKm31fntslezUr53LnlzHYSa9klM7bLTQ6ms5hUEhqBa/EWWjzPmHwSXaxIOHxpHk9X5xV+6JAplE94fXj8E9QyBdgHsWe+fvUoAPaz9KgJNqfBM9xiQQxJxI+FJ2kXkmG4l2j7KtYNrgGi+zxU8cjM5+44GdmxqE4PMG/BELe/sjynzI8OFR+RE8x3OBk+PwEc57mIxW0bLBBnYogrRp1pW720oxIh7YloD2OESOp56yNgAVCmOx1eSXq2l1lY5azTs4giXOsJrV4PMhT+2trQdxVLRsu/0RRhiHQbRMVe8JjyOU0WYsjg5bBxTRoFgV5QuJDRz0DHqYEsq++Su2PCQheQAsSHHzb6tVzt1RqACxRJZoEqUCtxyXHS9pHH79CLSQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa468e2-428f-4106-8761-08d84ab5e19b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 18:20:30.8706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRZRSvZ9oL1l2cVPoXtZ/HMo8tz0SfzAMtODVv5LIhMkeIzyLfhBJ7knE54XeswXukpdx90/j9BrBfVktJDTlUiwpqzaBiqtFRXIQZnGuLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2726
Content-Type: multipart/alternative;
 boundary="------------2E9C966D28774C96ECDC152E"
Content-Language: en-US

--------------2E9C966D28774C96ECDC152E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/26/20 11:40 AM, Leon Anavi wrote:
> Upgrade to release 0.14.3:
>
> - xrange changed to range, python3 compatible
> - Move Iterable import to _compat module
> - Fix deprecation warning
> - Remove flaskr example
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-flask-wtf_0.14.2.bb => python3-flask-wtf_0.14.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-flask-wtf_0.14.2.bb => python3-flask-wtf_0.14.3.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.3.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
> rename to meta-python/recipes-devtools/python/python3-flask-wtf_0.14.3.bb
> index 33387045e..213a0b58b 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.3.bb
> @@ -2,8 +2,8 @@ DESCRIPTION = "Simple integration of Flask and WTForms."
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3ca6bb31670492f791e6a9f2fb9f8a80"
>   
> -SRC_URI[md5sum] = "586f50f233926cade42e3d744aca3e8f"
> -SRC_URI[sha256sum] = "5d14d55cfd35f613d99ee7cba0fc3fbbe63ba02f544d349158c14ca15561cc36"
> +SRC_URI[md5sum] = "1b60b7dd1245b0d0173c21123717af61"
> +SRC_URI[sha256sum] = "d417e3a0008b5ba583da1763e4db0f55a1269d9dd91dcc3eb3c026d3c5dbd720"
>   
>   PYPI_PACKAGE = "Flask-WTF"
>   
>
> 

--------------2E9C966D28774C96ECDC152E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/26/20 11:40 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200826154020.29208-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.14.3:

- xrange changed to range, python3 compatible
- Move Iterable import to _compat module
- Fix deprecation warning
- Remove flaskr example

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200826154020.29208-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-flask-wtf_0.14.2.bb =&gt; python3-flask-wtf_0.14.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-wtf_0.14.2.bb =&gt; python3-flask-wtf_0.14.3.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.3.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
rename to meta-python/recipes-devtools/python/python3-flask-wtf_0.14.3.bb
index 33387045e..213a0b58b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.3.bb
@@ -2,8 +2,8 @@ DESCRIPTION = &quot;Simple integration of Flask and WTForms.&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3ca6bb31670492f791e6a9f2fb9f8a80">&quot;file://LICENSE;md5=3ca6bb31670492f791e6a9f2fb9f8a80&quot;</a>
 
-SRC_URI[md5sum] = &quot;586f50f233926cade42e3d744aca3e8f&quot;
-SRC_URI[sha256sum] = &quot;5d14d55cfd35f613d99ee7cba0fc3fbbe63ba02f544d349158c14ca15561cc36&quot;
+SRC_URI[md5sum] = &quot;1b60b7dd1245b0d0173c21123717af61&quot;
+SRC_URI[sha256sum] = &quot;d417e3a0008b5ba583da1763e4db0f55a1269d9dd91dcc3eb3c026d3c5dbd720&quot;
 
 PYPI_PACKAGE = &quot;Flask-WTF&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2E9C966D28774C96ECDC152E--
