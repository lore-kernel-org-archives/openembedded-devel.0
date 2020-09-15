Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.53])
 by mx.groups.io with SMTP id smtpd.web11.14645.1600179948620777584
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XfD241I/;
 spf=pass (domain: windriver.com, ip: 40.107.75.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=En8E1pJdV3zF5J/yUHGO61Lca15YO0g5YyEPupQMyoG6g4FQjgXDKVPBtCiMNsbve7guXj2lYOjGAVvtM+8syvwlG1Drqu8NdIV0JQtvKBP/Cfk+9czSsi9D5TDTADVHzfZrPCRsjOMjNE+OGWSUXE64E/F0vT6s9vFp3Nvwe2GPyp6d6PATwBBKUzdga3dMXsIpfN5+2ch1LlCcXvHKxjIG2ae4DABi72raEa4eV9CA6b82oYCmHBJ0TOTAzglQJDH9jbMZ/KU9xMHJGfUmBia9zyCJP+zUN6tl1+kY70c9Cw8GJIKxw6WsL4Fir+0NQSbcDBlAWZxmY47FpMSfaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8twj9miUo+9rBwbwMtzsbZ4Q6w41oJ1rzd7lQD5Ke8=;
 b=jmf7JWlTEc7cld1Ltzg32xu5fNV7AEqlDwYcJPwlij6rvnES/SymcmGV2gk/qaQkAT47AfW9RP9uU/hB/YyQAlxrhNGrE5e4tjkZUR+BWStynZMLHdjm2QXs7IIxKkb6HnA+6d/yNR81gVYeVVmCUPZNq2gXNd6U1egG0/olAJKMHAmXTyXNgcB5sCRWcc60y+0yvFxPpvmX2SvvKHquRaDJOshoizwnRAfW+aRK8cN0msyTX4J5MMRIUGM+jefvnTehztKO0OeBvIEOWM8bE6MlmezCa/lFa0HY0TvyT/oGYP6g9D1wNIySTifq2bFOGq8ns+sQvVQl+XVdPTp9+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8twj9miUo+9rBwbwMtzsbZ4Q6w41oJ1rzd7lQD5Ke8=;
 b=XfD241I/Z5GnBorlVd3nphXCJa4+VDNvN/ka+Oz+8KcRgYuQ/RWDmLPUSx7vL1q/jIBEAhOjtjWqifVNHxIZFnf0H834vtMlUWalDQW9RVDA+2MQsSoI3c6firZAOQgQydWvQVxt8Alyq3zy+8SwkN846+2Qm/Tg6XtMVkwER6s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3447.namprd11.prod.outlook.com (2603:10b6:a03:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 14:25:45 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:25:44 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-hyperframe: Upgrade 5.2.0 -> 6.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <329b6083-f06c-a9ea-e5b2-6f9d8a708d9d@windriver.com>
Date: Tue, 15 Sep 2020 10:25:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914090419.19171-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0147.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.19 via Frontend Transport; Tue, 15 Sep 2020 14:25:42 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 508c38c6-f4e8-4f31-27a4-08d859833aad
X-MS-TrafficTypeDiagnostic: BYAPR11MB3447:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3447281877ACAAC28FCB66679F200@BYAPR11MB3447.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:425;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qmvPGw2IjbR8wPVRwe5V4ftc/3yxfzxDxHp4pnFiw3CJa2F7bgBAXKB4IzppKZdi5xThh/7A7s84koWK1nbNz5+rdQU2LAdow4iw9VcT+w6WxFHlJFGqdUjRMVtQ1Wt+yqVzppLS4lYdgddZjWIDVxola4LNiEf32Ri+RwFVZtncRGy2rCvn+nvvj7rGtM9I1VKT2N4myFoGwXt1yRiGWNYorPSS9ynf+4tOzmJ07/lCgfms56rdcgVS93ZnmkjR025avlFZPLf85yzEYUl2fv0zrl+QEQ4UsIx3E0QfQF93B7j0l1OXyuk1QSOFQLSjIPywIKpvRLtoHEc/CCvMJUmpGHuPB0PFEBRhsGlKqfyO9EyiWivYq45sIjkIYrQIZ3uWLgzmscggdGRyKEK6HL2g5kGfOTdcBUNw+6Zq4WPap1DOHEmisPxSiAbvRFGiDzK05efcrDH7UF/7YolrTg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39850400004)(396003)(136003)(16576012)(186003)(956004)(44832011)(86362001)(16526019)(5660300002)(36756003)(53546011)(8936002)(66556008)(66476007)(66946007)(52116002)(2616005)(33964004)(6486002)(478600001)(8676002)(31686004)(31696002)(83380400001)(26005)(316002)(2906002)(966005)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	oXjoLSK+1glf76dIVk2/vBExcZ1laUoUfRjb+ythbn7YZMk4eofbY0aT08OH9C9+YdVse/8tUeglF98Sa+Njde8QpPkMlAwtCpizy3xBXlfULHnX6YN0Ry1rgfhL99vvjv6VXcGcbuzxnBih6Zo6GKJzNDJtIhYlAjPJXQ2VP/JzOFkHBKGkrZwgKEOKJebfvwLMSvWKvrA9dMgC2Jkwu+tN+eLFdOOu/xyJJMd2CrUWFTAUm8MqRBu7edjeW1iM8k+pZO1pdm189SLpc5tOhxI+41AD1T2v4D6zs7DlbsoXNyfSoPk/yDl9oVZ1qq1NL0t2UieIT5tH7gID8alja/syVHVaXk8sZwdsQprEyrH3KQ+og4zz5riCBe4O62qSDZ+kQB8w30O5JjUWQQO5/VvDQAb1080iWxuNs+RFiawO9BCkhh2nWZGzmosqz03jH+wibjchXpF2IDveczVljqlPq9MDD1bYIy5TY6w3XsQ0md5Pz7GcChHV3C+UtYyMf4TFWt/tlm3RSnJfozbW5q9wTmDfjsMHAObfHc0pi8Sz7oQKTHiH+qmmiRmuX4igTRIkKj4dpgYetvGKBs1T1joj7KvlMPhvduRpMMdYGwSGQ5/j+f75X3m+U06kW0Xq5eOHmrTEMe/uGf1vDbuNLA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508c38c6-f4e8-4f31-27a4-08d859833aad
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:25:44.6051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yH9Qa4aUmWgLWX3xcDgSH1stFfXIk9XswHwAE5VwaOBeFYDo/AGHoiET78XXizVdlJhJdPXdGZvfQtgF6lclkb/xZQUs1iyDXWo/9eQOVtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3447
Content-Type: multipart/alternative;
 boundary="------------0F5E5C0D97BB31B051FA3F18"
Content-Language: en-US

--------------0F5E5C0D97BB31B051FA3F18
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 5:04 AM, Leon Anavi wrote:
> Upgrade to release 6.0.0:
>
> API Changes (Backward-incompatible):
> - Introduce HyperframeError base exception class for all errors
>    raised within hyperframe.
> - Change exception base class of UnknownFrameError to
>    HyperframeError
> - Change exception base class of InvalidPaddingError to
>    HyperframeError
> - Change exception base class of InvalidFrameError to
>    HyperframeError
> - Invalid frames with wrong stream id (zero vs. non-zero) now
>    raise InvalidDataError.
> - Invalid SETTINGS frames (non-empty but ACK) now raise
>    InvalidDataError.
> - Invalid ALTSVC frames with non-bytestring field or origin now
>    raise InvalidDataError.
>
> API Changes (Backward-compatible)
> - Deprecate total_padding - use pad_length instead.
> - Improve repr() output for all frame classes.
> - Introduce Frame.explain(data) for quick introspection of raw
>    data.
>
> Bugfixes
> - Fixed padding parsing for PushPromiseFrame.
> - Fixed unchecked frame length for PriorityFrame. It now correctly
>    raises InvalidFrameError.
> - Fixed promised stream id validation for PushPromiseFrame. It now
>    raises InvalidDataError.
> - Fixed unchecked frame length for WindowUpdateFrame. It now
>    correctly raises InvalidFrameError.
> - Fixed window increment value range validation. It now raises
>    InvalidDataError.
> - Fixed parsing of SettingsFrame with mutual exclusion of ACK flag
>    and payload.
>
> Other Changes
> - Removed support for Python 2.7, 3.4, 3.5, pypy.
> - Added support for Python 3.8.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-hyperframe_5.2.0.bb => python3-hyperframe_6.0.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-connectivity/python-hyperframe/{python3-hyperframe_5.2.0.bb => python3-hyperframe_6.0.0.bb} (61%)
>
> diff --git a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.0.bb
> similarity index 61%
> rename from meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
> rename to meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.0.bb
> index e5ef1ff38..4a936b49a 100644
> --- a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
> +++ b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.0.bb
> @@ -4,7 +4,7 @@ LICENSE = "MIT"
>   
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
>   
> -SRC_URI[md5sum] = "6919183242feb26d8bce3b4cba81defd"
> -SRC_URI[sha256sum] = "a9f5c17f2cc3c719b917c4f33ed1c61bd1f8dfac4b1bd23b7c80b3400971b41f"
> +SRC_URI[md5sum] = "30136a712e092b1a45ae3cad3ae93131"
> +SRC_URI[sha256sum] = "742d2a4bc3152a340a49d59f32e33ec420aa8e7054c1444ef5c7efff255842f1"
>   
>   inherit pypi setuptools3
>
> 

--------------0F5E5C0D97BB31B051FA3F18
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 5:04 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914090419.19171-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 6.0.0:

API Changes (Backward-incompatible):
- Introduce HyperframeError base exception class for all errors
  raised within hyperframe.
- Change exception base class of UnknownFrameError to
  HyperframeError
- Change exception base class of InvalidPaddingError to
  HyperframeError
- Change exception base class of InvalidFrameError to
  HyperframeError
- Invalid frames with wrong stream id (zero vs. non-zero) now
  raise InvalidDataError.
- Invalid SETTINGS frames (non-empty but ACK) now raise
  InvalidDataError.
- Invalid ALTSVC frames with non-bytestring field or origin now
  raise InvalidDataError.

API Changes (Backward-compatible)
- Deprecate total_padding - use pad_length instead.
- Improve repr() output for all frame classes.
- Introduce Frame.explain(data) for quick introspection of raw
  data.

Bugfixes
- Fixed padding parsing for PushPromiseFrame.
- Fixed unchecked frame length for PriorityFrame. It now correctly
  raises InvalidFrameError.
- Fixed promised stream id validation for PushPromiseFrame. It now
  raises InvalidDataError.
- Fixed unchecked frame length for WindowUpdateFrame. It now
  correctly raises InvalidFrameError.
- Fixed window increment value range validation. It now raises
  InvalidDataError.
- Fixed parsing of SettingsFrame with mutual exclusion of ACK flag
  and payload.

Other Changes
- Removed support for Python 2.7, 3.4, 3.5, pypy.
- Added support for Python 3.8.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200914090419.19171-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-hyperframe_5.2.0.bb =&gt; python3-hyperframe_6.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-hyperframe/{python3-hyperframe_5.2.0.bb =&gt; python3-hyperframe_6.0.0.bb} (61%)

diff --git a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.0.bb
similarity index 61%
rename from meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
rename to meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.0.bb
index e5ef1ff38..4a936b49a 100644
--- a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
+++ b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = &quot;MIT&quot;
 
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393">&quot;file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393&quot;</a>
 
-SRC_URI[md5sum] = &quot;6919183242feb26d8bce3b4cba81defd&quot;
-SRC_URI[sha256sum] = &quot;a9f5c17f2cc3c719b917c4f33ed1c61bd1f8dfac4b1bd23b7c80b3400971b41f&quot;
+SRC_URI[md5sum] = &quot;30136a712e092b1a45ae3cad3ae93131&quot;
+SRC_URI[sha256sum] = &quot;742d2a4bc3152a340a49d59f32e33ec420aa8e7054c1444ef5c7efff255842f1&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0F5E5C0D97BB31B051FA3F18--
