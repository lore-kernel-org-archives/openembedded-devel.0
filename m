Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.76])
 by mx.groups.io with SMTP id smtpd.web08.5265.1606918266392972091
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ndy0eRn+;
 spf=pass (domain: windriver.com, ip: 40.107.102.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUjUQlJGcDqIfgdxsS6sy/VDFftQmT4sng3nqkK/DzhY9F1FNOJ89VktZM5xjdVvW53ENYDuzi/kg4XZcUIB7DVAlc1agCqOMQhsgYBytqIiSVbqAsTTg9SYZtSOgmFGLVvScBPK2K6jq3/IAye89sxT7z+QtqQuRm1NGYpVInT2Mwz1a+AKcZCzFuPCVTw02jxMctrMrWzDKbDCljP8kbf/AbaVjoiTQD1J26zFc14tsUk55xE1hqtlEhr5TaQiL5dKF6p6AMKsX/otrUnvGWm90C7b9zTBljufD2uEjaqBvOzAaWxER0HmV9ZswUsILkqDXZnhAVIPVGdT7okXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCp9C5SmHO2PvCa358iWdnt/z1ys+hFD4SLbxY+cMY0=;
 b=eVXi+URFyfMaHHWmEg0DzexsW9LjERPOCAoZhPLyaScSsTdW0bfFAktjxvd/k5D8ki7jc5r0Xj9SXifbV8raMtIDslfd0m/tuP1U/XF4WkDnfr+W0oUwuMylMhnLmvBJ/jmDiYlryMhobzwxK/QlWjdXhL86GRe3k8EaCztqHaOs3Amf0ur+P9Z7PtVMpkPq8RolSuOn/n5NCGfzgspR8n/IwHvbTHBQfdxSLs235y9zLQBnbvKLzRLYTPqTAdF827/nFXmbwpEjvHraweAWc+HhcXKbSDnZz7xzC86LohoA11PBUD61ScMhtMtKt/KQ0TzEQT9JyeTk/rDjTzIKpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCp9C5SmHO2PvCa358iWdnt/z1ys+hFD4SLbxY+cMY0=;
 b=Ndy0eRn+133SywyQyUciN+Pir2/x54QWYbL/zQxKAaS0cAaWQdyYx2iaYdbk128y2haZNIplpsEE/MHTX6kdFogfRF6QG3TjNKVKV7xGgauNN1siaX+TmkdEbTC977HXKk1AaJca93Sv+8Nn73DIE/F9wDG4LA3C4WiQ2N0OpLs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:11:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:11:05 +0000
Subject: Re: [oe] [meta-python][PATCH 11/16] python3-zipp: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <572b266df2481b53b3cc562999ef3ac26cdea457.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5201914a-519f-2bf4-d768-37c4144c8336@windriver.com>
Date: Wed, 2 Dec 2020 09:11:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <572b266df2481b53b3cc562999ef3ac26cdea457.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:11:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5719952-33b7-4589-e486-08d896cc1b73
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4864BBF64AAAC475AE17016B9FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nY7e2i+vfpg2Nc86mZcUNTAmshQKKetsloJCagX4gmO44cotIHyvvOMOs6XXrhuMg6Pm6ImINzuyZdErqLfQQlycTWwiWl9Jk+Kvv1o5tM1yakG+PKBlB7ldSJVl58yEUGXZjpw/x68A0NJCv204iaJWnbzmndwvX7lN89DoFw7gCKqVyYFDA1fkgDSmKU1xD6RpDCVKW/2hyfhKII0fLkJv08emAfzos7THgb1O3BRYMRPqhEbUmzPzUvvfw0Kk94MapEO9J3pZ2zPdVGDn+MwhhPzWnKQ1hN4SE+Xl/eIyD4Qf3zaxp+Qa7+FmnMmDrDUHPseUZc1Ds3+x0ZOymvydXQKRp/5bPIaTtt60svfRKszSn19jVcleeSSJ4LJz23EfRZEtUTSO5f9ux5MJc2gYivHwGh7+6buYUV2UqDp6//JfU76nZMc3RxO9iFh6jRX5G2PuQwX9GlzDrMBU82zZu8Keol1UQKaBK/LAo4o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(956004)(8676002)(53546011)(4001150100001)(33964004)(52116002)(44832011)(6486002)(16576012)(316002)(86362001)(166002)(36756003)(26005)(83380400001)(2616005)(2906002)(66476007)(5660300002)(186003)(8936002)(966005)(478600001)(66946007)(31686004)(31696002)(66556008)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?YnpjQ0ZPWVI0N1hXcnBwdDhBbFNQMWpPOEVaeG9pUmNzaEFDRlQwSXJ0VFRp?=
 =?utf-8?B?NERySGwwSEZHK2tPdWd6TU5YWUowbU9IWVlGZklnOWRqWFZWMFl5dU9YckND?=
 =?utf-8?B?OU1SdFZuNzNTV0N6K1pWOHIvSnJBckRjazFlOHZBYmUyRUZNVjIxaFVUcUVk?=
 =?utf-8?B?WDdmTG41NGRyS3cxRWJJVjUyR2h3ZHhwSHZ6emVoS0hZWmlqRDJSZ1Rvd25o?=
 =?utf-8?B?NkwyblhuSjJzU2U1K28ySU9Sa3V5d1Zzck9DclQxV1plSmNSemM1K3J0eXFS?=
 =?utf-8?B?bkU3a05HeERPSHV6VldJeEFmT3hLMHBrUzBTanVLZDdjYVJxalhCRVdXVnor?=
 =?utf-8?B?L0E1MDBWS3RUSjZNMFFmUjgxV0U4WjlTNUU1WGdrVng5aVNqdDNLVXdOVXdF?=
 =?utf-8?B?NzE0c0phanV6c0E0aVVMSjRzUVhka1ZvVk9mdG5yajdvSldmQ0NpOEZra3E2?=
 =?utf-8?B?b002NWtyK3BDa3JpQnZoNzFQV2NIcERFV1ExSytCOTBOUVBXZTVnNmVsNjEv?=
 =?utf-8?B?MDNTSEVxc3IvZjN2T2RZWFZjeEtqWHA0d3BVbUwvN3FTTld0aU1uQm9sT1Nk?=
 =?utf-8?B?Kzh0a3ZJd2ZKUk5lbXM2T3M3Tkd5aE1yN1lVeHY0eUxNT0lqRk5HdVNVQ2Zw?=
 =?utf-8?B?alRpQWNtNTlCM0I3UzJ0NUczUzRBK21SbFYzTU92YmphWnZaWXNlQjY5dlQ1?=
 =?utf-8?B?aGhlSWJ4U1FqNUdOTzBObTR4c2t5T1NldFNycFE2VUdyTkVuMGZ0eTVVVllz?=
 =?utf-8?B?V0NWcml2NXJXMm5HSUFyUUlKQ3hhbzBFRVMvUzg4WWdlZDJwMTIxTWRxdFdj?=
 =?utf-8?B?Z0VSRDQ3VFFtZ3Y4aURiaDVsdzlqanhPa0JDaFc0WHFYTEtEYVllc0VCc1I2?=
 =?utf-8?B?R3BxUzdDZ283dldZSloxLy90em96K3JXa1RlZFRpNEorY3pUeFlZRk5UMWJa?=
 =?utf-8?B?TjFuWFBQS2hQb1A0Rnp3ZWJzOTZNRWVRUEhrR3o2aGlQS2lUSjRIUGFKS1lC?=
 =?utf-8?B?bDhRMXJjYU9GNGxwa0M5cUkrSmwybUp6dGtkOHF1YkkvWDY0WUloOGdLbXNC?=
 =?utf-8?B?WE9oajN6NjE0c2lrU2FjeXBhTlh5UlZxVkVLN2ZLWCt4U2szMUZiL1FjZFlr?=
 =?utf-8?B?cEJhNkxKUVB1eGRSTVlPcVl5cUdmenF5OVlCN1A0ejJDU0hFMCs3Z1BMcG1h?=
 =?utf-8?B?bU9CSDhpSDR0Mi8xMHRqZjBoRXZxTm03OE5VUGFsbnZhNS81OXh1UXgwa2NN?=
 =?utf-8?B?NTlQZDMxSm95djZpd1FWQ2o1QW1jOFdJVjFHNG1QSVp4WXdqRVpqY3I1WTVN?=
 =?utf-8?Q?KWyOkl7jSrfoED4izUDOkTfptcYkYpT3ko?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5719952-33b7-4589-e486-08d896cc1b73
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:11:05.3008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kp2kXEVGuX7/oGm0gqdrdcPP3ickEYl+CfDpErihfZmKMKdtPhUbDyNX6D5hoZq+/bB8JzgrZSgvpFMcme0ZBPIQ1n2ELmMIDd6eIB/LxCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------C47A416B337ACDAE77CA7485"
Content-Language: en-US

--------------C47A416B337ACDAE77CA7485
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-28 2:46 p.m., Tim Orling wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: Tim Orling <ticotimo@gmail.com>
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-zipp_3.4.0.bb              | 19 -------------------
>   1 file changed, 19 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb b/meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
> deleted file mode 100644
> index 97523e8e7c..0000000000
> --- a/meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION = "Backport of pathlib-compatible object wrapper for zip files"
> -HOMEPAGE = "https://github.com/jaraco/zipp"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
> -
> -SRC_URI[md5sum] = "ae81f228995578b840d76d1b7d87fede"
> -SRC_URI[sha256sum] = "ed5eee1974372595f9e416cc7bbeeb12335201d8081ca8a0743c954d4446e5cb"
> -
> -DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
> -
> -inherit pypi setuptools3
> -
> -DEPENDS += "${PYTHON_PN}-toml-native"
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-compression \
> -                   ${PYTHON_PN}-math \
> -                   ${PYTHON_PN}-more-itertools"
> -
> -BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.0
>
>
> 
>

--------------C47A416B337ACDAE77CA7485
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-28 2:46 p.m., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:572b266df2481b53b3cc562999ef3ac26cdea457.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:572b266df2481b53b3cc562999ef3ac26cdea457.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-zipp_3.4.0.bb              | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb b/meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
deleted file mode 100644
index 97523e8e7c..0000000000
--- a/meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = &quot;Backport of pathlib-compatible object wrapper for zip files&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/jaraco/zipp">&quot;https://github.com/jaraco/zipp&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6">&quot;file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6&quot;</a>
-
-SRC_URI[md5sum] = &quot;ae81f228995578b840d76d1b7d87fede&quot;
-SRC_URI[sha256sum] = &quot;ed5eee1974372595f9e416cc7bbeeb12335201d8081ca8a0743c954d4446e5cb&quot;
-
-DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
-
-inherit pypi setuptools3
-
-DEPENDS += &quot;${PYTHON_PN}-toml-native&quot;
-
-RDEPENDS_${PN} += &quot;${PYTHON_PN}-compression \
-                   ${PYTHON_PN}-math \
-                   ${PYTHON_PN}-more-itertools&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.25.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C47A416B337ACDAE77CA7485--
