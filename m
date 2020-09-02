Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.87])
 by mx.groups.io with SMTP id smtpd.web11.10245.1599060605464577147
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WlLlg8+k;
 spf=pass (domain: windriver.com, ip: 40.107.236.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQZ167dX6aI8uegHG9tTwiRc0mOExBFwfuADyNu2Fa+E2kdADo9+ASxAeoxnUf7eLhP8g8CssOTdoTG61E3kMhWXiGnWwoMAnnrfwgmVZ690FTbwQsY0bWlitdKnZ0xvLlGoQuJcPxWaGt4id4eeWIgzoSRB9YOuH0tUgn5KgvgxLN8DihUX3vLj6SjyPGFA9YzNosI9kbIisHhRZ3GSi5CeEb+1I5BiB0900ow+dFe+eXtbiTN3y2y6rnzRmgaLPJuBAh0tghxKsRQb5qXy1G10AWHIdR+aJboc7nXVftqQoNuMIE9w8HrCBxco7ilx4DXTSO1p/Ii8LSHu8iI3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOF7UDYZTat0ewIgmkogwcnU6T5MpPOWKc2nEpJw73E=;
 b=U392pzg2pymUJZIs6Y6K9eqtmUKSDWNsQHCwPmzJqJYAE1nzhWbAjVgWQbhE6KP7eKHTMoi0MtBmx27gGGeDoUVR6NoBBNvxO3suGj8FzV8gJVEzRsbHxmO7OTuXdORpLnJlxqqYUf1OmSO0T9r2rTzXOkCsSDjUcJWAnunqb4Z/2eVZcJKNq0lVpgMFdo5Jgd6ymO+c4lE2VA2zMqKeV6qEYjiSXqj/H4pOWquYOL2OHT3d+JO2kDN4Wog8s7bFuAwnWtv5X6cL9hSdXX29ca+sfdKUv0QkXgr4oQxIqXQL5qFz0p1p42qoj46dPPA73E04oHipIRiW7+68RJQsxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOF7UDYZTat0ewIgmkogwcnU6T5MpPOWKc2nEpJw73E=;
 b=WlLlg8+ko8Y5I49X4/cpqEXXi9Fh5sO2cLVhTrK5HfInjhDUhkPhdbBfT5FCi5Q3HHXDz3uirYAMCz5TnLBHQii/ZeQlSsye1PuWFbVQHjSBWeO1d4jyE9egagM2V+9baPxno9NyESkDKLPVPTppt87wP0pjlo24pSplQb5TDLA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3030.namprd11.prod.outlook.com (2603:10b6:a03:87::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Wed, 2 Sep
 2020 15:30:03 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:30:03 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-ipython: Upgrade 7.17.0 -> 7.18.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200831070318.6573-1-leon.anavi@konsulko.com>
 <20200831070318.6573-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <90309dfe-5279-5927-f4f1-111995a0a86f@windriver.com>
Date: Wed, 2 Sep 2020 11:30:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200831070318.6573-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTXPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:30:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f49b4cb6-3e99-41a3-5bbb-08d84f550fd9
X-MS-TrafficTypeDiagnostic: BYAPR11MB3030:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3030DD7528280EC9EB2D664B9F2F0@BYAPR11MB3030.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:239;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KVN6W51XsxqHkF8sZIx0AwojTn24T8XF6r4a28bXtOasLdzlNih3rFuh9bDBRSu3StpP6QVMFYwA4l8bfqGnDq0jooqJtYUvlC5YotOOiECyn8e7ddbTAtAINJymHRl5I6mhS+LtBS1i2hXAPo6KWfuowtn9Du0HKWTB74nmxJVes++eY2hehTUODc9QdGDBfra6q3V50ntJT8IpWU4E73gjjglWeU5NUw741klN5JNP+z+FPV1BJ7Td1QDVLBuDYbGtMtP+wfm8oAPeEDRR+sipnTryEyFvxJAEOM5H4yMg7r7qZ0v4pBoFobNOWGQaPOqDut4HMH/dviNTw1/bWAftAj7mbaa92XgLYiInxpq5UyR9GigjrDh1p6DIdNDE8HUEHIjOApOwXp4L9smQwVSnoxKZg5Pb7p0GY5Jpg+nLlgHhMJOUOROPmjE4RusDiAqPN5wBZuxbkXI4fSDpUA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(6486002)(316002)(966005)(31686004)(86362001)(5660300002)(16576012)(2906002)(2616005)(52116002)(66476007)(8936002)(478600001)(186003)(66946007)(44832011)(36756003)(8676002)(26005)(53546011)(956004)(83380400001)(166002)(66556008)(31696002)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	hfZJjikce+uhXf15665D4LNGIOeFPOaavJ5jYy4tkoOaCtvmqZV65S001DBCSliQ0DWFkdFx1m+0HIB3KfCog7SFkWXua+q3KFsEPQu6GBFCgnxiXUKgFOgkpKdDyR+Ef8fa4zaZqbb9/hshIzRVXjDcnPOROZo6xkJHcf8ZFF0HRdRqFCkojh4+7ajBcgHJKEGjH3fmVzFS1fvF3XZOXBFi922Rosmv6xem4tZhfSlL4IH2q8zTff4CniYsPFZQBiolldtxNb0ECzCXITTxOipHMz+Ni1E0lar+GKWSUMHhMqj03jLNff/Egj0tTRzKmqemHrPOQW8zFe5xEOcQak4O0eRnxeG4pbBzjrrvZF2SBxDkk2NAWOkpSyAbAdi+7LpY7mcHqPZ/iXqxSzW+Dhk2RD+QPf0osNItjCJUJDKVIfnEWtX4G3TC4uyfKPX+94VKucr31kQ9tGp14TWmOB1Nx7PwIwvi0cY8UBbb2Vc7hWyxGM+VCEcIISZVl9t1vm4xzJNY1KYeQKFrj++1kMod9UZwRDgzsFw5JwwGLw1d5iK8OtyWSyLR4tjvNkUhZ7MgwmVN6pldw4hbc0OossnPv2cT93EXyxl8Owd3H8PS3KskkRE+f7I3LbRq7cAlgA3fwkkHWYfinfn/DWIgLQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f49b4cb6-3e99-41a3-5bbb-08d84f550fd9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:30:03.2081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLtmcALL8jcjQaJiUmIqE1ESrjF15w5l1CVbI927rNYQ869e+6X0dgKCPECRbRo3t+oLLtyG8pmkFGeWX5JdIJ+YVisLrO55utlW8S2Ziqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3030
Content-Type: multipart/alternative;
 boundary="------------7A9EA63D122937826180F175"
Content-Language: en-US

--------------7A9EA63D122937826180F175
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/31/20 3:03 AM, Leon Anavi wrote:
> Upgrade to release 7.18.1:
>
> - CRLF is now handled by magics my default; solving some issues
>    due to copy pasting on windows.
> - Requiring pexpect >=4.3 as we are Python 3.7+ only and earlier
>    version of pexpect will be incompatible.
> - Minimum jedi version is now 0.16.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-ipython_7.17.0.bb => python3-ipython_7.18.1.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ipython_7.17.0.bb => python3-ipython_7.18.1.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb
> rename to meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb
> index ddcddd60b..8ee92167d 100644
> --- a/meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
>   
>   PYPI_PACKAGE = "ipython"
>   
> -SRC_URI[md5sum] = "1f2257d771de9d2fb40d9e3cfcea429d"
> -SRC_URI[sha256sum] = "b70974aaa2674b05eb86a910c02ed09956a33f2dd6c71afc60f0b128a77e7f28"
> +SRC_URI[md5sum] = "f2db1158dc40d70a31b6bbef86e74789"
> +SRC_URI[sha256sum] = "a331e78086001931de9424940699691ad49dfb457cea31f5471eae7b78222d5e"
>   
>   RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-setuptools \
>
> 

--------------7A9EA63D122937826180F175
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/31/20 3:03 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200831070318.6573-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 7.18.1:

- CRLF is now handled by magics my default; solving some issues
  due to copy pasting on windows.
- Requiring pexpect &gt;=4.3 as we are Python 3.7+ only and earlier
  version of pexpect will be incompatible.
- Minimum jedi version is now 0.16.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200831070318.6573-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-ipython_7.17.0.bb =&gt; python3-ipython_7.18.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.17.0.bb =&gt; python3-ipython_7.18.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb
index ddcddd60b..8ee92167d 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.18.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f">&quot;file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f&quot;</a>
 
 PYPI_PACKAGE = &quot;ipython&quot;
 
-SRC_URI[md5sum] = &quot;1f2257d771de9d2fb40d9e3cfcea429d&quot;
-SRC_URI[sha256sum] = &quot;b70974aaa2674b05eb86a910c02ed09956a33f2dd6c71afc60f0b128a77e7f28&quot;
+SRC_URI[md5sum] = &quot;f2db1158dc40d70a31b6bbef86e74789&quot;
+SRC_URI[sha256sum] = &quot;a331e78086001931de9424940699691ad49dfb457cea31f5471eae7b78222d5e&quot;
 
 RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-setuptools \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7A9EA63D122937826180F175--
