Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.51])
 by mx.groups.io with SMTP id smtpd.web11.17846.1592833528209942232
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 06:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ApFmjs9f;
 spf=pass (domain: windriver.com, ip: 40.107.92.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lq39WR5cFWBrgoLd97voVt0gYZLa6e+pPY+hp6ypxFb9nXqPiQW96PRs5MTfkG0vXfmi6pgZBOAn5WqJBiMShMyC+Y0NdGU/klP9vFtm1tE9sXBcuto7gWSVD/T9YAz0rFKK2VFPlNP1hjzun37VAy6fTNX+C08agAa6XRHdOBSYKkPdLST6lqFpshyzgG2et9SFTBsFl4fYvMG/jSR1wmJCNgqhlvakMgkDijBwsMreUZmZz+daMEhy4o/spCDs1Qk307HgkGuYT35Q/tm1/MpGU16LucWZvkxMY7mJ5OAPZjEYaugOhDmjUKFJAo2BpPuZCkculwJ0F4/k0o29mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efuIT306gLHtU7lgsVlvDN1SUoBV46zu3bLW6m3vALE=;
 b=nJ50czC2uvCy+9/ylJD6Srbd8eYdufezCAD5mg6o7MGd+LiBnnyihk1FF4ZigNrUGB94QuyPplSCAawEPcl2XLS2PfCp38AAX0AWav/mgoT27tFVwCXVR3TUdZXxcehVaGHcJF4trHH7MHDJAcx/HplAiUiUHGVO7ZfUPUnadoKpO7cK6il+bCnzoA3661/JROIGIUa56cAcv8oWpXIy/wDAmcreqEELeQkv4vODE/fXUtfY+808qgCQDDOGOycNouoy0Bdt+SJ0aJtfQS0hqTD3V92GH6nT/pOdW+VSvbKF3CX/UztyXDGNav3m3lxDW+ZLcrbCGpNCKAGWL0/miw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efuIT306gLHtU7lgsVlvDN1SUoBV46zu3bLW6m3vALE=;
 b=ApFmjs9f5s3EhUrX9jw+OMznqFONOYn1P3vg5Qgnxo7h4q8gToy4sBYh5n94wq7ZIw9LuaPPZwXqRQIixojE0iiyfrXC+RblQCJvbIzbwH7EsiKwegD6CMAh+jG1izggaROS6E75yFdRc0aNo6R+8XMs8QyU+3TNQZSx98zCnhY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1779.namprd11.prod.outlook.com (2603:10b6:404:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 13:45:27 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 13:45:27 +0000
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-pathlib2: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200619081011.25051-1-leon.anavi@konsulko.com>
 <20200619081011.25051-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3a182367-f2b8-4be5-74c8-78bd23db4f58@windriver.com>
Date: Mon, 22 Jun 2020 09:45:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200619081011.25051-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::31) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 13:45:26 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81a9fbf0-88c0-4ec2-edb8-08d816b28527
X-MS-TrafficTypeDiagnostic: BN6PR11MB1779:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1779DEC732A6DA49D19603CA9F970@BN6PR11MB1779.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oPBkDmc+e2OKWVCFSEm8LdNCuNfQsda48hkIz+DVt6aNJRyxoAOVqrdvGdUyZ9ifl7yNi5A7lPbmS6m0a6UEFBED0LIEA1fWt6HCZG4O0xxcPH0KqFvgeI31Qj4iOgYPIjwlexRtkEKx+Kzb1Ud4jsVopxfHJfO+IpAK7SfhQ4oY3t1z7XPBexzVjFBxKsiytI+CT5JazCxZ8iGfVJKJc/YqlvJVHeo9fkLTt0KwiqMlVEuTszh5SYW9ZqwyBfTyE7PxQqrGKUimGBhHRN75OfjtGrCGL3ijElxVRGMnuwNiVGPfyXIXbtjwO5Kd9UAfgVcoxwczwD+ynt2Vo858Br71zr8EKSUwJ93goRFOCdVR5F39pLvmdQyPawAZILFgWuxQbP8iUPAdowuGs+9k7dvquJh/+vXSA7yPb6mZ+DKZH/v0Kq7lqRMUSE0SFb9j5INjWQfE0lRCZrryXzYrYg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(39850400004)(136003)(396003)(53546011)(44832011)(66476007)(66556008)(2906002)(83380400001)(26005)(86362001)(166002)(33964004)(8676002)(36756003)(8936002)(31696002)(6486002)(16576012)(5660300002)(966005)(478600001)(31686004)(66946007)(2616005)(186003)(16526019)(52116002)(316002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	3vMUjnQm/8VcmkgPOQLkKoKyRLGsWUkikF2rzJp4RbBfqtfuyL4baBrvqZkQ7BAHHXGMWJnIan7L2PUmiaLhfFlGUFedQPqMbo9cZQZKgzKammVHVT68KoKtXJMU0wJ55dzDLLxf2+BSzH8Wqa7reccSuPSyNzaHCQ4vJHOkK7Ig9nCx1WbYnrjCgMwQZejAF+SjHylBPr5szCLzDBmJj2OpOLQjaTh5lzP1pI5mgb3pA946w07ou9jUYaWgy3oryoNP/29Yn7ohA3wPaGfhP9fTlqSTTNkTiOj1PuhBD0RCSyqq+Pv3wq5b33oGAPNV5PsG1ajgfwZD/WirYFRhwGi5IHKfI+uYqatbDtaPewzOuXVt37AF+YYK/WXNkpMCmx3ipXfHhInaxu2jXxi0uUtEZDQJyL41e0WqNOoZTeObDEe2+lG8afnUY1nVjAZWmhS0mDyaoJuqXhAMO4rduvEVBYQ3ZFl7lfDD5DHPNr0=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a9fbf0-88c0-4ec2-edb8-08d816b28527
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 13:45:26.9411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vNH8PKMYW+DL8hq6OxQvipVpCaqukk9ugf9qi1lFto6/LEwGb9ZvXXeLtZIzDWajyk1jZauyWIbvpdHFTnvmxqTwo+qrW6ZyLDHbakEmo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1779
Content-Type: multipart/alternative;
 boundary="------------B488220E7F09D9080AA31F1D"
Content-Language: en-US

--------------B488220E7F09D9080AA31F1D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/19/20 4:10 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-pathlib2.inc     | 11 -----------
>   .../python/python3-pathlib2_2.3.5.bb                | 13 ++++++++++++-
>   2 files changed, 12 insertions(+), 12 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-pathlib2.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-pathlib2.inc b/meta-python/recipes-devtools/python/python-pathlib2.inc
> deleted file mode 100644
> index d69d5273a..000000000
> --- a/meta-python/recipes-devtools/python/python-pathlib2.inc
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -DESCRIPTION = "Object-oriented filesystem paths"
> -HOMEPAGE = "https://github.com/mcmtroffaes/pathlib2"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a"
> -
> -SRC_URI[md5sum] = "f2bd0a363eb0f8fa0556f35c1d9e66fb"
> -SRC_URI[sha256sum] = "6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868"
> -
> -RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-ctypes"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb b/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
> index 66f71e57a..a022701ad 100644
> --- a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
> @@ -1,2 +1,13 @@
> +DESCRIPTION = "Object-oriented filesystem paths"
> +HOMEPAGE = "https://github.com/mcmtroffaes/pathlib2"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a"
> +
> +SRC_URI[md5sum] = "f2bd0a363eb0f8fa0556f35c1d9e66fb"
> +SRC_URI[sha256sum] = "6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868"
> +
>   inherit pypi setuptools3
> -require python-pathlib2.inc
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-six ${PYTHON_PN}-ctypes"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 

--------------B488220E7F09D9080AA31F1D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/19/20 4:10 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200619081011.25051-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200619081011.25051-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-pathlib2.inc     | 11 -----------
 .../python/python3-pathlib2_2.3.5.bb                | 13 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 2 files changed, 12 insertions(&#43;), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pathlib2.inc

diff --git a/meta-python/recipes-devtools/python/python-pathlib2.inc b/meta-python/recipes-devtools/python/python-pathlib2.inc
deleted file mode 100644
index d69d5273a..000000000
--- a/meta-python/recipes-devtools/python/python-pathlib2.inc
&#43;&#43;&#43; /dev/null
@@ -1,11 &#43;0,0 @@
-DESCRIPTION = &quot;Object-oriented filesystem paths&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/mcmtroffaes/pathlib2">&quot;https://github.com/mcmtroffaes/pathlib2&quot;</a>
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a">&quot;file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a&quot;</a>
-
-SRC_URI[md5sum] = &quot;f2bd0a363eb0f8fa0556f35c1d9e66fb&quot;
-SRC_URI[sha256sum] = &quot;6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868&quot;
-
-RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-six ${PYTHON_PN}-ctypes&quot;
-
-BBCLASSEXTEND = &quot;native nativesdk&quot;
diff --git a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb b/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
index 66f71e57a..a022701ad 100644
--- a/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
@@ -1,2 &#43;1,13 @@
&#43;DESCRIPTION = &quot;Object-oriented filesystem paths&quot;
&#43;HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/mcmtroffaes/pathlib2">&quot;https://github.com/mcmtroffaes/pathlib2&quot;</a>
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a">&quot;file://LICENSE.rst;md5=042856c23a3e903b33bf361ea1cbe29a&quot;</a>
&#43;
&#43;SRC_URI[md5sum] = &quot;f2bd0a363eb0f8fa0556f35c1d9e66fb&quot;
&#43;SRC_URI[sha256sum] = &quot;6cd9a47b597b37cc57de1c05e56fb1a1c9cc9fab04fe78c29acd090418529868&quot;
&#43;
 inherit pypi setuptools3
-require python-pathlib2.inc
&#43;
&#43;RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-six ${PYTHON_PN}-ctypes&quot;
&#43;
&#43;BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B488220E7F09D9080AA31F1D--
