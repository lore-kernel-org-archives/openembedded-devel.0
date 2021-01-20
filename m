Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.72])
 by mx.groups.io with SMTP id smtpd.web09.27848.1611149596681502954
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hGWgm9Ae;
 spf=pass (domain: windriver.com, ip: 40.107.93.72, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/nKMLj0W1+j+85IiaUTDk6cg1Yj1xDPAsVNZCov5kohuydJxNRzb7ywnkHwW287jDAnbWYJgLPXi1bf2EaWhX+8OqkpdoWsmye+arRu37SlgrYiqLV9RjqiwEqvpP16es8ayyBrzB2mHOaIX5nQKQuWxAfGFligIGZ4ie+599vHz/E8lys0ipzSuE0mUc4aaEtOMxFvsfb4rk7qlOjD6n00xkxQok/VYhim5gD+0Q6dK4TwNU6ecIrET+a+cCCZU2gLJZNoA6MvMF3ISrJwMAWAEdCnABz60h5bWEVYbfM74D9eQz/r2l57PXRE0ESBh/qtRst0IiKAJexXn2Dx9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3a8Yc4XKlfJ9JtVA2zbwYNr6+k/IgkkdkWtQ8zIlfA=;
 b=QTguL1a1MZDKOeJRH8tSNrckXE+QgxZUHQqixK9QBXSqqxfw85M3SMcvQ2CQvEik9qp3kKCBc0gdrUHFUbD/wCj3U/YlwRjDuWgOFnSIBm0Q8FIZxMZYEzg+52325xkd+Sa4bIGf8X4xiQS2DNvdIxKBnDTW3BgBraFoPvPwaPvuwg6O4ns7hnFnA9LYhFCwCsolW3jxiukwLp7Hl5LIbyFjW0BXow32HvgSfjke7E5+0msQ53OXbKDj7jaacMWT4auxFzqjdjh/44WzXoITiGqLo4OWhJxW3k1lm2AKVH+GVwFSgciVeB47hB+FF8TaDnfNRdWhME0HgHSjPitrAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3a8Yc4XKlfJ9JtVA2zbwYNr6+k/IgkkdkWtQ8zIlfA=;
 b=hGWgm9AeFKxwZZeXR9zuG6gn7OJ2W2tYflfyRxLsBHlCIK72wn/kOX0aoIGrSaLV450MKlyf+6MBrGDOuI3Q6Oda3iyrsI+kC+ZS49DNsyc3rEQG2Mcw/uAqRsePcEQEUqCTBsKI6rbdugxgvhplSWnPI9xDuvED3Ozp88QA3rg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3190.namprd11.prod.outlook.com (2603:10b6:a03:7b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 13:33:14 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:33:14 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-greenlet: Upgrade 0.4.17 -> 1.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210118173007.20996-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <64c7098c-f480-9dfc-2a62-c280550d1995@windriver.com>
Date: Wed, 20 Jan 2021 08:33:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210118173007.20996-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH2PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:610:4e::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH2PR02CA0010.namprd02.prod.outlook.com (2603:10b6:610:4e::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 13:33:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c80293d-2d65-4e59-837f-08d8bd47f015
X-MS-TrafficTypeDiagnostic: BYAPR11MB3190:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB31904A2C4384EA6B5456DD169FA20@BYAPR11MB3190.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uZzd9Vah9CkJj/lgdUtCe5w1Rmu3h9Pe1kSoRz8Ng9LAUqhZclqRteNe0fSQECJr0Zz+LxQ/MhbESop1pX6xgW7rlrLa/bI0mZrQA5gXYbCLAE06bmmQ4PUWy1BxdfW3YfRfnRTbJ19VMFkuDPfK0TSwKjLaN/LfPgsvv6PQ1F5k3x+JtFFPtrNK8MlMf3AjYYRHcVJUK3LisqbNUwXPq7IeL+G8192eFaCL6Bb1ad0N/OGDGCTRSOkKaFcZzHpxcVkjuH3PfZ+gzFqkH65Q7LQ0dMRuoQlssfV8/Uu54Es7qKJOc44w2kyZsEx3ToFyBncQPaKxXtuuFFm3LK4LB5SyagsDfRZv37o88HgBYWfvFJEbsl2HxM93LXbTpowIgDpKCtxUuBYVO4UgvCpFlnsD6jzXYpOYYg9IUDMs6SpWM9cH7b96NIX6tgSK1ddCFKs8UQ6lbuVI5BT9cvN1HLSkEtywM254mzk6pZlpVLRI6fRtefWadWgOTYcpHm4xzRj1wtCCmP0LOcQyJ+9BWItCc2azXzPNOi93p/GxQP444aJ4g/xvXBO6/ka3pKxL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39850400004)(83380400001)(6486002)(26005)(31686004)(166002)(16526019)(52116002)(44832011)(478600001)(186003)(316002)(31696002)(16576012)(2616005)(66946007)(2906002)(33964004)(36756003)(53546011)(8676002)(966005)(5660300002)(66556008)(86362001)(8936002)(66476007)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eDJ0NlZsYXZmWUVuaVR3akp6SkYyWDY1M2JYSFFkanJCY1E0N3QyTEdISnkv?=
 =?utf-8?B?Z0xDdWMrSG4wRjBFYVRFcnJXTm1PRVNnNW0yTlZZRSs4Nld2UTVsdVNWWnVQ?=
 =?utf-8?B?MUkvaUJCNlc1aHBQT3ZrbkloK21xUG0wOHlEbmo1eDFuRTZGSnR2Z2ZPdHk5?=
 =?utf-8?B?WndHbUlMTWFpcFRQS1BhSXdrUHFhblV2S2YxVUlTMzMweHpudjNnemlhcnhB?=
 =?utf-8?B?R0JmVDVpbmRSZ3MzZjVPeFFuQnZaa3dGVFhrUFZKSTFWOXVOTVg3VEhlWFB1?=
 =?utf-8?B?cWJpUXpFN2c2Rk9SVzIzZ2V5QzFDSVJkdlFZOXc5RkVmQk5qQkNnOWhtcVgv?=
 =?utf-8?B?MzdBZ2R4dXkyYWhqQWNqQ2hVTys1QXJhd1prb0dteEE1NmpPeE9idW0zWjFU?=
 =?utf-8?B?NWR6VjdQQjN0K2swZHQ5bldYRVE3LytsMyt2RTRNWG9OVzlJK2h3Nk93L0VY?=
 =?utf-8?B?NFM3Q0FQV0FQQ0hDMXF6TzlsTXF4a0xidnBwVEJDUzd6dUorLzV6U05qSnFv?=
 =?utf-8?B?MHFMSWxtbHZTbW42STE4eE1nbGpSOXFSUno1cEM3cnppaGNNb2oxbCt6MG9p?=
 =?utf-8?B?SFZoT2ZBTm9NQnNMNlIvSjJLQlRkTk1wY3dzZWloVnNwRk1IYnBOcGFRUWtZ?=
 =?utf-8?B?TnE0ZFdCSDc4UDdmakVHMTM2dkd6bEMzMVFpeGRUVnlwZ2wxZk92bG1uNTcx?=
 =?utf-8?B?NGxWQkErYmlNaWRFZ3NTMVk1M08yd2IvSU9pTWRVZHJPb1JiQkZjWWxyUStw?=
 =?utf-8?B?QVNOVTVJTnQrYzBEY1dsdHd6L1RSeVRWejIxa3VIT21uTU1IbnZsNGlSN05m?=
 =?utf-8?B?bldZNC9abWFmOGlzQnJtMXNxSHV1VmRJL04wVGFhNnZDRUd5Y2JlS0ZDWGRK?=
 =?utf-8?B?SmVzcTdCY0VON2EvU21YMGNiK3dPMTdkTGtkcnR3UGxOTlJIc01iY1Irbk1r?=
 =?utf-8?B?VWNJTGpxLzYveTNUS3kvcGtnZUlZanVGM0cwZkFMaG1QMHh5Q1pNQjhqUHpp?=
 =?utf-8?B?ZWVWZnR3bEczc0FwSUdMdFBwU0hHZVVobE5ydnhvVXpXYjZkV2xSNUhIZnhM?=
 =?utf-8?B?STdBUEV0QjV1Q1pEOHhoSlVESFBtaUZRYWxiRVF0NFpjYlVSMG1WdkMraml1?=
 =?utf-8?B?MlF6M0oxV2NMTFZyOUs1eTlPbXF1TkJQbFNiV0E1RFN6d1VsS1lMMldyMmVx?=
 =?utf-8?B?RWd3anczTW5OVjY0Rzd0TmxHeGRCVWg4cUttM0pVRDZuWkppT1BUdFIxSG0w?=
 =?utf-8?B?aVlzUXQwaW1raUdnbFFYSkIycDR1UVVGK1VLNjNJa3Y1M0tiUXhJd0ZuN1Q5?=
 =?utf-8?Q?td5N0lc0vFfSlKrEjxuAEpKM81kF8yfCpG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c80293d-2d65-4e59-837f-08d8bd47f015
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:33:14.5901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJQAxOvFNQ4FOFJt3bPp1WL1/FMKlsc3Ym8quw7PDihVCLTaIjmOG00/BFq/xuIgebQrjBNPedwEmS9eZ/9FTPBgNwOPQZZDclo42/vJjeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3190
Content-Type: multipart/alternative;
 boundary="------------CA0985C9BC3847A1CD389E0C"
Content-Language: en-US

--------------CA0985C9BC3847A1CD389E0C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-18 12:30 p.m., Leon Anavi wrote:
> - Add the ability to set a greenlet's PEP 567 contextvars context
>    directly, by assigning to the greenlet's gr_context attribute.
>    This restores support for some patterns of using greenlets atop
>    an async environment that became more challenging in 0.4.17.
> - The repr of greenlet objects now includes extra information
>    about its state. This is purely informative and the details are
>    subject to change.
> - The greenlet module is now a package. There are no API changes,
>    so all existing imports, including from C code, should continue
>    to work.
> - (C API) The undocumented GREENLET_VERSION macro that defined a
>    string giving the greenlet version is now deprecated and will
>    not be updated.
> - Fix %s and %r formatting of a greenlet on Python 2. Previously
>    it would result in a Unicode string instead of a native string.
> - Move continuous integration from Travis CI to Github Actions.
>
> License-Update: move to the src/ layout and this affects the note
> in LICENSE about Stackless Python
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-greenlet_0.4.17.bb   | 9 ---------
>   .../recipes-devtools/python/python3-greenlet_1.0.0.bb    | 8 ++++++++
>   2 files changed, 8 insertions(+), 9 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
>   create mode 100644 meta-python/recipes-devtools/python/python3-greenlet_1.0.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
> deleted file mode 100644
> index 744265e1f..000000000
> --- a/meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -SUMMARY = "Python lightweight in-process concurrent programming"
> -LICENSE = "MIT & PSF"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
> -                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
> -
> -SRC_URI[md5sum] = "d964c95c2d2f0f02f36c75e158d8e3dc"
> -SRC_URI[sha256sum] = "41d8835c69a78de718e466dd0e6bfd4b46125f21a67c3ff6d76d8d8059868d6b"
> -
> -inherit pypi distutils3
> diff --git a/meta-python/recipes-devtools/python/python3-greenlet_1.0.0.bb b/meta-python/recipes-devtools/python/python3-greenlet_1.0.0.bb
> new file mode 100644
> index 000000000..32194dba7
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-greenlet_1.0.0.bb
> @@ -0,0 +1,8 @@
> +SUMMARY = "Python lightweight in-process concurrent programming"
> +LICENSE = "MIT & PSF"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
> +                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
> +
> +SRC_URI[sha256sum] = "719e169c79255816cdcf6dccd9ed2d089a72a9f6c42273aae12d55e8d35bdcf8"
> +
> +inherit pypi distutils3 setuptools3
>
> 
>

--------------CA0985C9BC3847A1CD389E0C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-18 12:30 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210118173007.20996-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Add the ability to set a greenlet's PEP 567 contextvars context
  directly, by assigning to the greenlet's gr_context attribute.
  This restores support for some patterns of using greenlets atop
  an async environment that became more challenging in 0.4.17.
- The repr of greenlet objects now includes extra information
  about its state. This is purely informative and the details are
  subject to change.
- The greenlet module is now a package. There are no API changes,
  so all existing imports, including from C code, should continue
  to work.
- (C API) The undocumented GREENLET_VERSION macro that defined a
  string giving the greenlet version is now deprecated and will
  not be updated.
- Fix %s and %r formatting of a greenlet on Python 2. Previously
  it would result in a Unicode string instead of a native string.
- Move continuous integration from Travis CI to Github Actions.

License-Update: move to the src/ layout and this affects the note
in LICENSE about Stackless Python

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210118173007.20996-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-greenlet_0.4.17.bb   | 9 ---------
 .../recipes-devtools/python/python3-greenlet_1.0.0.bb    | 8 ++++++++
 2 files changed, 8 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-greenlet_1.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
deleted file mode 100644
index 744265e1f..000000000
--- a/meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = &quot;Python lightweight in-process concurrent programming&quot;
-LICENSE = &quot;MIT &amp; PSF&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36\-file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a">&quot;file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
-                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a&quot;</a>
-
-SRC_URI[md5sum] = &quot;d964c95c2d2f0f02f36c75e158d8e3dc&quot;
-SRC_URI[sha256sum] = &quot;41d8835c69a78de718e466dd0e6bfd4b46125f21a67c3ff6d76d8d8059868d6b&quot;
-
-inherit pypi distutils3
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_1.0.0.bb b/meta-python/recipes-devtools/python/python3-greenlet_1.0.0.bb
new file mode 100644
index 000000000..32194dba7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-greenlet_1.0.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = &quot;Python lightweight in-process concurrent programming&quot;
+LICENSE = &quot;MIT &amp; PSF&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee\+file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a">&quot;file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
+                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a&quot;</a>
+
+SRC_URI[sha256sum] = &quot;719e169c79255816cdcf6dccd9ed2d089a72a9f6c42273aae12d55e8d35bdcf8&quot;
+
+inherit pypi distutils3 setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CA0985C9BC3847A1CD389E0C--
