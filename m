Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.67])
 by mx.groups.io with SMTP id smtpd.web10.5265.1606918300022675690
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Utpw/cYs;
 spf=pass (domain: windriver.com, ip: 40.107.69.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnnLEVzi1KbZshgZ5JeX3MiKMOB/wtCnegNCMVd2sb89EPQ32uMxVNBD62M988HWQDfAT/2OsWPK7hIJOysBA+5EFnvpI4dej8ZW6hU0faGjkY5R3NSvNSKJI3Js/61focQ+EEugr4SUceatl5RR/z7R0XqIiTdm5AKG/BuNYrBug8RAG5MHJPYMEe9Lyq/EfcDeQxckLJM2MWlUnLciUY9FwM+E/1u8l+8bELoVHauX4HrKfQXN4b7Fwb5kan6r8EzZRTTv9q6Omrs8tHZ2/y9UYSsPAxAmb19OFNFZJVE7lhDaOiS+1ioaP+kv2dbR2vDnWEKVm/mqsnJAT4A8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vpiONXmLhYF9+FyhGfmIEjdJikG/S0OuK0M8jXpnjM=;
 b=VqNIjVnUVv52KGOYrAf4YwM9cA8ckExAp89sPQBvCq98K1bWWJ9AIIaN4Lh3sP3vhO6jKPSDiTQMU1wW+0gVb8j/jWNs8lPIbbRDYJoSS1wewdBZO4mPpZCJGPOCMvTSAbwl5LqLK3e7qqnRzihJ0QSqoou3bldeMLGwOc1/rcr44NkNX20JXHGYw1oz1DiOLA6y9YhobinI/qF/8nGATqgUejVeAsXcIeJy5x+mmNkc7d5EpMmCkSggJep8ag9m+dUJd6rfBxiv05DH4TNkbt7t6ve4v/zQqosDfRRKGdLNiRN7E569Xoyb6zSheN/5Z9U7pAPGi8fiaB3YpQkb4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vpiONXmLhYF9+FyhGfmIEjdJikG/S0OuK0M8jXpnjM=;
 b=Utpw/cYs+9PQhgaM0m63SZN+ZOfU3wzsMQGLyMLsTVlLg02Pmn60KPGRU6RGSNVsrTSZEstbz87fT9M4z9pOeO+DyKwtTgAj0FGom39yB0k6Fuk6KmPslNTXEFvXRD0pqcfO3YMR+h78RQ0xfQCPmEEcqytHJPl/iUAwX7bcXjM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:11:38 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:11:37 +0000
Subject: Re: [oe] [meta-python][PATCH 14/16] python3-pytest: drop (moved to oe-core)
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
 <3b068dbee56cd4fa70fabc89f2fd860a57c0163d.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <eda9af08-f639-ca6f-0eca-592d44e5f1ce@windriver.com>
Date: Wed, 2 Dec 2020 09:11:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <3b068dbee56cd4fa70fabc89f2fd860a57c0163d.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:11:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfe118a7-0764-4d29-05f5-08d896cc2e7d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4864227EEEA972A6890BD33D9FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	efNG/SiDmRI5FP/VxvTGKpQzsAqnCa9hCbm/on/OjGzg3hDGfX0q8am1YlC+FZDntYhXlF5GBxgGbg7KcK9bvxw5fOIuMcsGv9UPg5F48YpPrXbyes3rVQzRaMHnOCdSvP3OUv77NAtUAZegeICKN3vKCgM/692tY7kQQLvrY3bcRgtco0CvJkNJeObGqlxqATKG5vMso3rKMGFguGVVKDzLatLlhTf78l+n6O7IBimWSpX9LXPLiN+j8Zz6e8JFqUdbJCKjj/Zz7wLy/3q126PcVnqA1QTNcQGWWlDvr/nxhKnRv7ly+Mnltvdz9lioagNSYe8folUqvRUJn1rBO3jX7N30VJgARczzDJho6wwNJUaQQau8x4O9/ExK7b4wdAeDmCYd0tNwNfw+mzpAJrSikCUIP4vCHwHzYHPEi79zQCpucDhGhm5FQQmlHOcJRNU1enXzK+QjH+FDAmjK0PZiUv1lu5lN9HGqywl/mUiaVpH8rXAABwN5qH7KhdWv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(956004)(8676002)(53546011)(4001150100001)(33964004)(52116002)(44832011)(6486002)(16576012)(316002)(86362001)(166002)(36756003)(26005)(83380400001)(2616005)(2906002)(66476007)(5660300002)(186003)(8936002)(966005)(478600001)(66946007)(31686004)(31696002)(66556008)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?b3BqbEZOMjNJczB4eWR1dzYwdFR3WWVKNzFpLzN0b01iL2pOL2xORzk2aU5s?=
 =?utf-8?B?Rzdta1ladVFXUDRuS3pTQXRJVVBMQnlqQk9EZ1FvWFNSNUtFaFJzdUpSZmht?=
 =?utf-8?B?RzM4b2NJcGdFNFgweTVvaDBsL3ExdXVxNmp0OHNMNXpqbGhvMmlIWkV2bFNh?=
 =?utf-8?B?TUU3a3hnQlAyeGNSakNyck5VZWhkV1dob1ZiY3hzbmhDUUY4MHdqa205TWRJ?=
 =?utf-8?B?VTF5aWhzV2lqWXJEZWlLVkQwTmgxcGVkcCttekFQenVJK0EyWFdDUWwyT3Rw?=
 =?utf-8?B?dlBRRHZGMitCK3czZDNsZlFHTmhCdnpRYkVkUGwwajhlZ2RaQ29EbzN0bmF1?=
 =?utf-8?B?bkd2cHI1bERoRkpZcXFXOUo5d2t2eThJMTF2NWd5UzQ0anAzSWlQT2tyRno3?=
 =?utf-8?B?ZGh3bTV1NU1rRFY4SmNBRVQ1OHB2T1hSRlh2QXVBQzRXeVBwMUJ4Q1pQREtr?=
 =?utf-8?B?dGRmSWFKR0gzelRqNG1RdHNidEI4LzhlY0dSc0VPVXVYc3lXaFdROGVYNkhs?=
 =?utf-8?B?WmVRQTFKUmxleG56SmJHaExNTk1RVHk5Wm5mVkRpN21BeDRyZXo1WGQ5N08w?=
 =?utf-8?B?aVl6c29hL1NQc3k3d0F5eE8wTk1wRXJlMDVuTldjS2ZkdW9ISmF0QXoyRjlR?=
 =?utf-8?B?OXhFWWZLckdOc3NVdjBTREtuZUR6STZQNzI4QUh3N2pPck9GcmloK3p2QWNO?=
 =?utf-8?B?WTh2dDJEdk9kV2lEVW1CMDh0c2ZNWVBFVGFFQ29Fb2hDSWJrVlFpMTZQNnR4?=
 =?utf-8?B?OG5lemFUZjhIa3VZREpRMlFkZWZuMmNXQUVYcWd1emxjWThOVUdyeWFscktM?=
 =?utf-8?B?eDEraWRwMHJZcWVlV3cvaithdGJpWGczVnlQZlJacFEvQjM0cklodXFXbUZ5?=
 =?utf-8?B?SCsxNVFkTGRON0ZPMTlWVVV0d0RjTTBrMXZHQ3pWWHE4T28zZUN5eE9iQ092?=
 =?utf-8?B?bndLL3Y1SlhLZ216YTgrR0JHdjUrNDB1VVdPbVFnclphZDF6czJOVHEvcGVm?=
 =?utf-8?B?QTFXMy9WVHBDODIrYzlXOWE3RnNhTmp4NThwY1g0dnllbWV0dFQzVXFYaG0x?=
 =?utf-8?B?eUo3UlYrcnROcUtGdkVyMzg2d09UZHh5UU5qQ21kdmQxdmpGOVgzamtHZHJL?=
 =?utf-8?B?TjkxbG5VNjVlcUE4QUJFeVpiSnNMVFd5cmVmYTlRWWRBTk1JUzk2OGpzUnJC?=
 =?utf-8?B?MXdCQkxXSHhGQ09DampPVHlJTU91UXhiRHBzQU8xVUhzT3ZwSFVaT2dtd0dm?=
 =?utf-8?B?cHZNTHEvV054QXhuTUh6ZUppbm9iUjZmbXNWU0VrQmgvK1Q3ZFg5ZzRlcEtT?=
 =?utf-8?Q?sAzGqjRoniqUc5pKdaZ69C/755blF/WqY7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe118a7-0764-4d29-05f5-08d896cc2e7d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:11:37.3363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLaLqKHBLww3KiUzoVPvOa0dRj4b7WZnel//VyVlOTcvK293Ny/w4ldymM+Tu/myOFQUnx81MIxKWuGcY2Yklo4lqWAZJrTY3aAWleOSA+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------76FE48921F8F26E4B17FCFC9"
Content-Language: en-US

--------------76FE48921F8F26E4B17FCFC9
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
>   ...he-setup_requires-for-setuptools-scm.patch | 39 -------------------
>   .../python/python3-pytest_6.1.2.bb            | 38 ------------------
>   2 files changed, 77 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
> deleted file mode 100644
> index 8c5c17247e..0000000000
> --- a/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From ff784f4803ab33f5e3389e40d038d52d1e211843 Mon Sep 17 00:00:00 2001
> -From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> -Date: Wed, 28 Aug 2019 16:12:27 +0900
> -Subject: [PATCH] [PATCH] setup.py: remove the setup_requires for
> - setuptools-scm
> -
> -The setup_requires argument forces the download of the egg file for setuptools-scm
> -during the do_compile phase.  This download is incompatible with the typical fetch
> -and mirror structure.  The only usage of scm is the generation of the _version.py
> -file and in the release tarball it is already correctly created
> -
> -Upstream-Status: Inappropriate [oe specific]
> -
> -Signed-off-by: Derek Straka <derek@asterius.io>
> -
> -Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> -
> -Rebase for pytest 6.1.0.
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - setup.cfg | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/setup.cfg b/setup.cfg
> -index 60f6564..c4d1471 100644
> ---- a/setup.cfg
> -+++ b/setup.cfg
> -@@ -55,7 +55,6 @@ package_dir =
> -       =src
> - setup_requires =
> -       setuptools>=40.0
> --      setuptools-scm
> - zip_safe = no
> -
> - [options.entry_points]
> ---
> -2.17.1
> -
> diff --git a/meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb b/meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
> deleted file mode 100644
> index 6872da5cfa..0000000000
> --- a/meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -SUMMARY = "Simple powerful testing with python"
> -
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
> -
> -SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
> -
> -SRC_URI[sha256sum] = "c0a7e94a8cdbc5422a51ccdad8e6f1024795939cc89159a0ae7f0b316ad3823e"
> -
> -inherit update-alternatives pypi setuptools3
> -
> -RDEPENDS_${PN}_class-target += " \
> -    ${PYTHON_PN}-attrs \
> -    ${PYTHON_PN}-debugger \
> -    ${PYTHON_PN}-doctest \
> -    ${PYTHON_PN}-iniconfig \
> -    ${PYTHON_PN}-json \
> -    ${PYTHON_PN}-pluggy \
> -    ${PYTHON_PN}-py \
> -    ${PYTHON_PN}-setuptools \
> -    ${PYTHON_PN}-six \
> -    ${PYTHON_PN}-atomicwrites \
> -    ${PYTHON_PN}-importlib-metadata \
> -    ${PYTHON_PN}-pathlib2 \
> -    ${PYTHON_PN}-wcwidth \
> -    ${PYTHON_PN}-more-itertools \
> -    ${PYTHON_PN}-packaging \
> -"
> -
> -ALTERNATIVE_${PN} += "py.test pytest"
> -
> -NATIVE_LINK_NAME[pytest] = "${bindir}/pytest"
> -ALTERNATIVE_TARGET[pytest] = "${bindir}/pytest"
> -
> -ALTERNATIVE_LINK_NAME[py.test] = "${bindir}/py.test"
> -ALTERNATIVE_TARGET[py.test] = "${bindir}/py.test"
> -
> -BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.0
>
>
> 
>

--------------76FE48921F8F26E4B17FCFC9
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
    <blockquote type="cite" cite="mid:3b068dbee56cd4fa70fabc89f2fd860a57c0163d.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a>

Signed-off-by: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:3b068dbee56cd4fa70fabc89f2fd860a57c0163d.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...he-setup_requires-for-setuptools-scm.patch | 39 -------------------
 .../python/python3-pytest_6.1.2.bb            | 38 ------------------
 2 files changed, 77 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
deleted file mode 100644
index 8c5c17247e..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From ff784f4803ab33f5e3389e40d038d52d1e211843 Mon Sep 17 00:00:00 2001
-From: Yuan Chao <a class="moz-txt-link-rfc2396E" href="mailto:yuanc.fnst@cn.fujitsu.com">&lt;yuanc.fnst@cn.fujitsu.com&gt;</a>
-Date: Wed, 28 Aug 2019 16:12:27 +0900
-Subject: [PATCH] [PATCH] setup.py: remove the setup_requires for
- setuptools-scm
-
-The setup_requires argument forces the download of the egg file for setuptools-scm
-during the do_compile phase.  This download is incompatible with the typical fetch
-and mirror structure.  The only usage of scm is the generation of the _version.py
-file and in the release tarball it is already correctly created
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Derek Straka <a class="moz-txt-link-rfc2396E" href="mailto:derek@asterius.io">&lt;derek@asterius.io&gt;</a>
-
-Signed-off-by: Yuan Chao <a class="moz-txt-link-rfc2396E" href="mailto:yuanc.fnst@cn.fujitsu.com">&lt;yuanc.fnst@cn.fujitsu.com&gt;</a>
-
-Rebase for pytest 6.1.0.
-
-Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
----
- setup.cfg | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/setup.cfg b/setup.cfg
-index 60f6564..c4d1471 100644
---- a/setup.cfg
-+++ b/setup.cfg
-@@ -55,7 +55,6 @@ package_dir =
-       =src
- setup_requires =
-       setuptools&gt;=40.0
--      setuptools-scm
- zip_safe = no
-
- [options.entry_points]
---
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb b/meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
deleted file mode 100644
index 6872da5cfa..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = &quot;Simple powerful testing with python&quot;
-
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b">&quot;file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b&quot;</a>
-
-SRC_URI_append = <a class="moz-txt-link-rfc2396E" href="file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch">&quot; file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch &quot;</a>
-
-SRC_URI[sha256sum] = &quot;c0a7e94a8cdbc5422a51ccdad8e6f1024795939cc89159a0ae7f0b316ad3823e&quot;
-
-inherit update-alternatives pypi setuptools3
-
-RDEPENDS_${PN}_class-target += &quot; \
-    ${PYTHON_PN}-attrs \
-    ${PYTHON_PN}-debugger \
-    ${PYTHON_PN}-doctest \
-    ${PYTHON_PN}-iniconfig \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-pluggy \
-    ${PYTHON_PN}-py \
-    ${PYTHON_PN}-setuptools \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-atomicwrites \
-    ${PYTHON_PN}-importlib-metadata \
-    ${PYTHON_PN}-pathlib2 \
-    ${PYTHON_PN}-wcwidth \
-    ${PYTHON_PN}-more-itertools \
-    ${PYTHON_PN}-packaging \
-&quot;
-
-ALTERNATIVE_${PN} += &quot;py.test pytest&quot;
-
-NATIVE_LINK_NAME[pytest] = &quot;${bindir}/pytest&quot;
-ALTERNATIVE_TARGET[pytest] = &quot;${bindir}/pytest&quot;
-
-ALTERNATIVE_LINK_NAME[py.test] = &quot;${bindir}/py.test&quot;
-ALTERNATIVE_TARGET[py.test] = &quot;${bindir}/py.test&quot;
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

--------------76FE48921F8F26E4B17FCFC9--
