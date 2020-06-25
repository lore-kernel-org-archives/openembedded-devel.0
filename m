Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.85])
 by mx.groups.io with SMTP id smtpd.web10.9971.1593090074826738664
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JsSg/1Pe;
 spf=pass (domain: windriver.com, ip: 40.107.223.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmMr68huYZf1tfR5/RcpKexngB50ateuv74oyW2ruSwnjuuIUFuhdFabs8fkO6BkIqoJsQNhbmdilIpJ0+xM1kHP3V7gB97D/7TpxJiSdBvD4N9w59l1WCm9J2JIqOOJTu58T6k6DDxLyD3FIDANyp243d3aoIgXySusGMntLwMN8+5Q3zVx1NBoSDB3RUJKDffjqDNd+WVbZncth8KI3c/VxQx5M7WGVUnu0eYFe1qm2KFoDxDqSJUtmInGG46XY/i29Z8MP/fU8uvoKQ1TDYtKd54/ueCRHZXN+vY9XRVljtIhfhEkuouOuzwuD7cO2+N/o4vMMm8h1N9UedJNuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhvK5DWk29OvuMX3AlB0sFEqqLyHZywBLudVNdFPsZw=;
 b=FsSQKXFoPiLom8oogWd+mX5vhRBwa6RDgDJPcKeolJWHko3/kl0NZL+tionbYhK0mqXA/zdNWi+huan1zR/ii3Sfg8hE2mcZcde4eff91Isv63o+7jsxRXQj7mWA8lvONy3OiRL98Dw09ig+/85Snd3o+Yj5DF63BUUrA658sSnJ4p3NQ9WtDTlbNgCMrsJIwZLuJGkTFIHHaZiyKPpb7rlfBsXb4i+IPRknx0xMpXvPY4F2B4RX8BdGHLwmnVoAm4mrrZjKVxbXW7HHJgMUEocYKxnVPlc0NI+Y16dL3C938bMj5p3dqydsD7ONWsTguGhEddfBHCLZpjfEUcNPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhvK5DWk29OvuMX3AlB0sFEqqLyHZywBLudVNdFPsZw=;
 b=JsSg/1Peg0ILawkLevDrLpOgS2GX3qz36FhOJumC5W0K3zmTric+6dhafKT5vAeFPjF2t39bEEIz2G1lyYxXDK0+2KP3VCYNj+0RM5j0JQoxmw0E78yacibP7E8Px7nLF6yE27drwQNEqX7TfPjZGFnkpxSMl0RKeXevglWQb6k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Thu, 25 Jun
 2020 13:01:13 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 13:01:13 +0000
Subject: Re: [oe] [meta-python][PATCH 04/11] python3-setuptools-scm: Upgrade 3.5.0 -> 4.1.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
 <20200623095136.24854-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <94d68188-a392-5a46-3f7f-c424577ac4b7@windriver.com>
Date: Thu, 25 Jun 2020 09:01:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200623095136.24854-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Thu, 25 Jun 2020 13:01:13 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66ca8951-26f7-4c4e-7798-08d81907d6d2
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3954D0C145716650F7BEE8889F920@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EkPHtNeJq7okzjMF9plGsRPgBr8kcQLg0+UFngqVoskPLjcjYgw9iqlPZCyruDboyBCtQc+YKPkbLGxixDc5DslKT3ROrOoTDIjrBWJJ1SDS0VN0mYbS53Mu5trZutvPzYy4Zw8EA2JeNpTkpZvkwEZyBqAqUVSG4BHOiKC8gBzbWHlsSi0k2kU/spBI2uuVoV9gTe2CUug7vE0xU5KblfCpiAM2z7ABEy2bMbGXkRPdoNNAMAv7MDX7qRWtaCe8nstlOXSsMWHbNCWAzMxdGO05RKi1DY0+gu0/KmoX2LR1xBj90j5xqF423k1x4Q1hxwyfAHE/WxrLBy5dy3S707wuYAFSPsGZT9/bBV6umX5TrLtBSKBppDLLpbxY9o375wFIx/5tYs2rZ9dgBYzsiWBUuqF6xhUX9tXWhQpYrHfC64elAtLRyKZ2iK9LwsKgTXmQjSzZG8EU96mp6nJjDA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(39850400004)(366004)(396003)(346002)(52116002)(44832011)(83380400001)(86362001)(26005)(31696002)(186003)(36756003)(5660300002)(53546011)(8936002)(16526019)(966005)(16576012)(166002)(66946007)(66476007)(33964004)(66556008)(956004)(478600001)(2616005)(6486002)(316002)(8676002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	R27+BhCcwP1+CJe/IPyP1yozFvYWpIp+sD9+mKI+VlBJVnoM1k6KnFSgyRZ0BZum2F8hB5Vic3dFzF0WKO697SnbuB0abOPfzPfQJ09/XA4qQPUVU+8ifrDEpqEIUKwkm6JA2bDm3b+pfE3XYGMOWTSOSTm8EQAtdaDPkStAgWp6Cn+UdGtmiIWYrw0+Qx9mQ0sqER1NaXIvfJcPhxkxrVyiyR6PB9u1NbS3k1zmy5j6MAGfDQy8Uw9syhdX3pLtTrMeHRvFFe3mDobiDf7hYuxfSEvrw/iH0oWIE40Bkf3iv7hGqOz7tVbUZR5dgyN37HabkHPXNqVG9binZyvfxgi4KcU28X2sH/XGOpUa0yfOvwtYQO9Xoc4LpU9ZFC020wemK2h521owH9TpK8fpob7ArlAMsHWXfNuwGW0npCqXRuCyJLZknRKCA3uc4SqvHG+K5SgjiBqW2orhW1pWrFBV75YEe0LTTmn187m69DbZ7hx77yQiSlQrjoXOwVjV
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ca8951-26f7-4c4e-7798-08d81907d6d2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 13:01:13.5417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/cTJTrBR3YsoTRMNntvnFiiBdQQSOCmNF3YL0lTzcwaKD4gAeXWA+38aj4Y49o9AsO5qKFgVeUUqbwgrXY2RPBEb67ga2EiFBHSvQzYCJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------B0BA87B4BAAFD889FDFF2C23"
Content-Language: en-US

--------------B0BA87B4BAAFD889FDFF2C23
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/23/20 5:51 AM, Leon Anavi wrote:
> Upgrade to release 4.1.2:
>
> - disallow git tags without dots by default again
> - drop jaraco.windows from pyproject.toml, allows for wheel builds
>    on python2
> - include python 3.9 via the deadsnakes action
> - return release_branch_semver scheme
> - undo the devendoring of the samefile backport for python2.7
>    on windows
> - re-enable the building of universal wheels
> - fix handling of missing git/hg on python2.7 (python 3 exceptions
>    where used)
> - correct the tox flake8 invocation
> - trigger builds on tags again
> - Add parentdir_project_version to support installs from GitHub
>    release tarballs.
> - use Coordinated Universal Time (UTC)
> - switch to github actions for ci
> - fix documentation for tag_regex and add support for single digit
>    versions
> - document handling of enterprise distros with unsupported
>    setuptools versions
> - switch to declarative metadata
> - drop the internal copy of samefile and use a dependency on
>    jaraco.windows on legacy systems
> - select git tags based on the presence of numbers instead of dots
> - enable getting a version form a parent folder prefix
> - add release-branch-semver version scheme
> - make global configuration available to version metadata
> - drop official support for python 3.4
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...etuptools-scm_3.5.0.bb => python3-setuptools-scm_4.1.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-setuptools-scm_3.5.0.bb => python3-setuptools-scm_4.1.2.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.5.0.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-setuptools-scm_3.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
> index 036477d1e..4ebbac6b6 100644
> --- a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
> @@ -2,8 +2,8 @@ SUMMARY = "the blessed package to manage your versions by scm tags"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
>   
> -SRC_URI[md5sum] = "86ec1eb9ec02ba018b097787e98897c5"
> -SRC_URI[sha256sum] = "5bdf21a05792903cafe7ae0c9501182ab52497614fa6b1750d9dbae7b60c1a87"
> +SRC_URI[md5sum] = "e6c9fad17c90516d640868eb833d5150"
> +SRC_URI[sha256sum] = "a8994582e716ec690f33fec70cca0f85bd23ec974e3f783233e4879090a7faa8"
>   
>   PYPI_PACKAGE = "setuptools_scm"
>   inherit pypi setuptools3
>
> 

--------------B0BA87B4BAAFD889FDFF2C23
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/23/20 5:51 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200623095136.24854-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.1.2:

- disallow git tags without dots by default again
- drop jaraco.windows from pyproject.toml, allows for wheel builds
  on python2
- include python 3.9 via the deadsnakes action
- return release_branch_semver scheme
- undo the devendoring of the samefile backport for python2.7
  on windows
- re-enable the building of universal wheels
- fix handling of missing git/hg on python2.7 (python 3 exceptions
  where used)
- correct the tox flake8 invocation
- trigger builds on tags again
- Add parentdir_project_version to support installs from GitHub
  release tarballs.
- use Coordinated Universal Time (UTC)
- switch to github actions for ci
- fix documentation for tag_regex and add support for single digit
  versions
- document handling of enterprise distros with unsupported
  setuptools versions
- switch to declarative metadata
- drop the internal copy of samefile and use a dependency on
  jaraco.windows on legacy systems
- select git tags based on the presence of numbers instead of dots
- enable getting a version form a parent folder prefix
- add release-branch-semver version scheme
- make global configuration available to version metadata
- drop official support for python 3.4

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200623095136.24854-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...etuptools-scm_3.5.0.bb =&gt; python3-setuptools-scm_4.1.2.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-setuptools-scm_3.5.0.bb =&gt; python3-setuptools-scm_4.1.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.5.0.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-setuptools-scm_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
index 036477d1e..4ebbac6b6 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.5.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
@@ -2,8 &#43;2,8 @@ SUMMARY = &quot;the blessed package to manage your versions by scm tags&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489&quot;</a>
 
-SRC_URI[md5sum] = &quot;86ec1eb9ec02ba018b097787e98897c5&quot;
-SRC_URI[sha256sum] = &quot;5bdf21a05792903cafe7ae0c9501182ab52497614fa6b1750d9dbae7b60c1a87&quot;
&#43;SRC_URI[md5sum] = &quot;e6c9fad17c90516d640868eb833d5150&quot;
&#43;SRC_URI[sha256sum] = &quot;a8994582e716ec690f33fec70cca0f85bd23ec974e3f783233e4879090a7faa8&quot;
 
 PYPI_PACKAGE = &quot;setuptools_scm&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B0BA87B4BAAFD889FDFF2C23--
