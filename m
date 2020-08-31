Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.56])
 by mx.groups.io with SMTP id smtpd.web12.52724.1598879506483121716
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 06:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Lm1Enaf5;
 spf=pass (domain: windriver.com, ip: 40.107.243.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heY2gfl2I/Rxbu34w7oEK+P0KdHjgUHn3J6oTsUKBp9KXrzPs8OG8cK36E/UJXhjDyaJt8qT7qvS66Z7vuxCD4+1ojbwIOsvlntki+dsRjTI7jHL2MxxYsWpByq+3LqwlZ5/1JZ5ejDKG/PbMe5tr7tvqxKocwETQvC8ViSCj+gzgQu+ilHbC7OQNH+MRUpYJgFYyEWenmBbfTp8SoOjcMIARfWP35oPvktzThlVjUkL35tjcgz/yD/j8A3QFy5WygyxvUfongb4ZdI+A93PRypGFDIXvqn2druKLqUNo6EZl3BhIT0ikxjA4lBzdtPzwyWhOFboboIPywVfyvuArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlqHUuKQ+W2AJZ+QP2L/M4DPJnB72bYpBDLrO2WZ23E=;
 b=ZikIk5OAsLgg4Byn6jbLRaZtdg2dDPALexanp6pjqYuQKgnb9sODXU/aALYxH8a+n4WbJJzWZuGyo7F2I0aH4YtbWTK5L/KFG2tUqBTomdKY9jv4j0LEbwNtR3Xso6nROPbFw0DbCM4ptqAd/0LdVLGp5AaOwkzBJh8RvapRIOZd2ymoxVSYePiwWndABpW3Ji+5jeCJ4xl4dKQ+ZqOfCfiD6PdGN40dpI8g4JVjjDCqKx78UjZiv0KZca3ojHDpkxBzBw38+aYOno/1fzefZYecXsdHdOGkmF/OfRsp7K+EZHqf1vDnbcEM5qWLMj3Cdo52ecfzrNgOD+7cVhIMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlqHUuKQ+W2AJZ+QP2L/M4DPJnB72bYpBDLrO2WZ23E=;
 b=Lm1Enaf5BKBkQoU+53pZTu0v3hmKG1jU+IL4eDLiF0Ig/QgzmC9Mqt2Dusxpf8+KQykZ0/CJGLwSeawr+YTyDzA29y6nPlq3+CkA6JjKd7pEsL2gTKA4TOHMey4lsuzQifUIZonxgXkNfujMsjnsI5DKcQMBLfzFyJxxkVOF7Iw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2807.namprd11.prod.outlook.com (2603:10b6:a02:c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Mon, 31 Aug
 2020 13:11:45 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 13:11:45 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-flask-babel: Upgrade 1.0.0 -> 2.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200827145504.29147-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <27b1ab8a-b5af-2577-b3fa-02c1fd78886c@windriver.com>
Date: Mon, 31 Aug 2020 09:11:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200827145504.29147-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 31 Aug 2020 13:11:44 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af93a9ff-f4d5-4d93-df56-08d84daf68ea
X-MS-TrafficTypeDiagnostic: BYAPR11MB2807:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB28079D5AAC22DB32EE8F153C9F510@BYAPR11MB2807.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	neaMcwMgzyYPmuyOdVHQ5xESWcAVIazzDWjXQRPAnLG6tGQeza/jfLbZL+rAzwQRMpCQz8hZdcSXQsVgyo1IKFyMVbHpW8WfHZElWFhFJtMlcOkMYn3+q4ML6LaZVRjObgyyEIxEg2BCGBGFyyiPKtWO61OX/OHzDdTeQ3Mr3YseBdtQZDJDoSqfWxF/5XOb0SXZWBmAxL1Jj6FNGQprYfK0vhspqAE5c20NiKDZECW2KVBTc5g6QNqE1HLAoBEnwA8nweH5VtPUf2YGQpI0mzBjAL6Di0IzZ7S/c7LiI8ajVWEhvvimHLT0UnboaaG3c1GLM7EOyXMib+M6D6W24fdRUCgQOSGiZHaKUo9B6OnwMHP3oYYc5kmKy7oABrextwvvK0xLCaDTf2eOcEgJh0RhNDvk6p3tUZE5xulmveeR+BNwrcfUFWFw46ENWbFAsqHhYyjhsteESlhGLPsrew==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39850400004)(376002)(346002)(316002)(2906002)(53546011)(33964004)(66556008)(166002)(478600001)(26005)(6666004)(186003)(6486002)(36756003)(956004)(83380400001)(8676002)(31696002)(8936002)(66476007)(966005)(31686004)(66946007)(86362001)(2616005)(5660300002)(52116002)(16576012)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	UchcpOx9Zo1VdV3pSMO3F6bPB91sW0ZPNmeOpOOQfKawUhq1UotADIIJ+0xtBcIPPjx9K45wX0+nb63PbN2dXfUHWQsJPvr4m+bAyZBExQHfHpjMXRl4yaOajxXGf7B7nrq/WnmVBAQ73jObQ1w1kdK77jde+XJ8FdUptRY3fSvRFxkqVL7kUd+3p1076O4QmDkL1uH+AUIS/6BWWN0qE7CEi3hWHCY6BgJ8RYMlGl+QWeVj9hfp/ahAEdr8FihTVEJjN09bds8tDmzHlVvLNoIwMZS0zRBxPuM70L8ZOt7x9bp4qiDwJFdHQsdg3egJOWUrunQ28C892CiaKmIDG6C+zijXMZ7xPu3d/m8iHUKqSQhnNdcNV1ObKxHInBbhuXsuqgpT38B9bBXqQPlc8DMpAEaF4BnvIzu3iGEZsbDu2JylMWg5eth/BqveT3GY0YT4Jvlo+VkjSWXUYBNsN5TWlLfrhtw7X6ge355qph4VLqME3OymlRIMNAGBLqiPkxtJJd/HN6znFBm0giQpeHrPj6G1P/8dDoFg7qNB/kgFdjRaVSLIsuCrMp9Jq3vuFCDhuzWd0tdlBjeBhyTepi6eVP3jaRGAjJrCBKRuIcNzs30SIxMPPPrwAZHzE3d5fdJQsfYf2Pk4hMgybFmfpg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af93a9ff-f4d5-4d93-df56-08d84daf68ea
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 13:11:45.3070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRjiVceDg8bSfoCc73aiRyHIQgM4Wg/GizILJqgxkKa650DcPZOIzhJbXEMHZ9ZI7X8EoLqq/a6xF4nlb0B+8HLcWqonTIcE/xIsiSpjglA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2807
Content-Type: multipart/alternative;
 boundary="------------845011BF9875F2E0D0ED1DC7"
Content-Language: en-US

--------------845011BF9875F2E0D0ED1DC7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/27/20 10:54 AM, Leon Anavi wrote:
> Upgrade to release 2.0.0:
>
> - Drop Python2 support
> - Tests moved from unittest to pytest
> - Domain and caching support from Flask-BabelEx
> - Documentation moved from python-hosted to Github Pages.
> - CI moved from Travisci to Github Actions
> - Small documentation improvements.
> - Removed uncessary checks on get_translations()
> - localeselector and timezoneselector can be changed after
>    creation.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-flask-babel_1.0.0.bb => python3-flask-babel_2.0.0.bb} | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-flask-babel_1.0.0.bb => python3-flask-babel_2.0.0.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb b/meta-python/recipes-devtools/python/python3-flask-babel_2.0.0.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-flask-babel_2.0.0.bb
> index d968be3ee..8a01b49b4 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-babel_2.0.0.bb
> @@ -2,7 +2,8 @@ DESCRIPTION = "i18n and l10n support for Flask based on babel and pytz"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=51917f3e8e858f5ae295a7d0e2eb3cc9"
>   
> -SRC_URI[sha256sum] = "d6a70468f9a8919d59fba2a291a003da3a05ff884275dddbd965f3b98b09ab3e"
> +SRC_URI[md5sum] = "50d5e92d96ef58787bf85b5a1b0a5567"
> +SRC_URI[sha256sum] = "f9faf45cdb2e1a32ea2ec14403587d4295108f35017a7821a2b1acb8cfd9257d"
>   
>   PYPI_PACKAGE = "Flask-Babel"
>   
>
> 

--------------845011BF9875F2E0D0ED1DC7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/27/20 10:54 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200827145504.29147-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.0.0:

- Drop Python2 support
- Tests moved from unittest to pytest
- Domain and caching support from Flask-BabelEx
- Documentation moved from python-hosted to Github Pages.
- CI moved from Travisci to Github Actions
- Small documentation improvements.
- Removed uncessary checks on get_translations()
- localeselector and timezoneselector can be changed after
  creation.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200827145504.29147-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-flask-babel_1.0.0.bb =&gt; python3-flask-babel_2.0.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-babel_1.0.0.bb =&gt; python3-flask-babel_2.0.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb b/meta-python/recipes-devtools/python/python3-flask-babel_2.0.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-babel_2.0.0.bb
index d968be3ee..8a01b49b4 100644
--- a/meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-babel_2.0.0.bb
@@ -2,7 +2,8 @@ DESCRIPTION = &quot;i18n and l10n support for Flask based on babel and pytz&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=51917f3e8e858f5ae295a7d0e2eb3cc9">&quot;file://LICENSE;md5=51917f3e8e858f5ae295a7d0e2eb3cc9&quot;</a>
 
-SRC_URI[sha256sum] = &quot;d6a70468f9a8919d59fba2a291a003da3a05ff884275dddbd965f3b98b09ab3e&quot;
+SRC_URI[md5sum] = &quot;50d5e92d96ef58787bf85b5a1b0a5567&quot;
+SRC_URI[sha256sum] = &quot;f9faf45cdb2e1a32ea2ec14403587d4295108f35017a7821a2b1acb8cfd9257d&quot;
 
 PYPI_PACKAGE = &quot;Flask-Babel&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------845011BF9875F2E0D0ED1DC7--
