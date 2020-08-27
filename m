Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.51])
 by mx.groups.io with SMTP id smtpd.web12.25577.1598552449767668013
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 11:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NiWIU8kK;
 spf=pass (domain: windriver.com, ip: 40.107.243.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmkyGxKY43xFlxiomVi4W4dlM2pEBWOKqTMjVk/RNzUlUWKx4CCDtnvsvL9mezGsUfCgB/E3W9OFEfppNbg5KDmGOBg5dWbnTRkMe2vGBBXUypJKtU9f8FYWazYniUS1A/N2cgGFoLhAyW+6Vi6x4f+Ir+F3mIZUBzB5vtNdOl2Ub7yzopWb4jZVCllfZw5JmcR7kMDEGrjZ9+L1v2aRlwe/LKAQpDxvsXjfxa17GbOQDwHWssUL+Pen9zwhSXakAPtlg43iDK9nhKeSl9RPJEqSfRI6Fh9zDug0NZ7ko7GQwUxj5LuoZeLsa9tARyqJssJMAiKAYXKiPyRroK8s3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2L9kKNq2n1GUbDZZr3W3I65AZdgX3Jy/fdkti6pzc+A=;
 b=WjzMFaL57Lsv1zo7SnQ86AYGNdUaBGdHpzJs9tH47kyeo1uESjVGdfWSXX6JiGjMevneJPIZKeXGezWZ7x6EMDyxVetvGAOjuAfkN+J69Yge9/k9nYVt6T22K9HKZjEvE+32vzO1KOwLc+OEBBrkpVbHAggHTBgpDA/3pt7bv6yWahyOd3h7n0OjsV756AsnWz04unelaOLwEwsrJo2F7k/o8NCLs4hni3b4LUpmNzthWAx6YGYArNZ12KBZz47znwfXMjJDYXOvci/o77MxK1S2ahNLC4inEPT6v8oY9sj64xmZvIrUEUwIaoIw0cjZQvTzqSgSxTMqgS9AZvy8ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2L9kKNq2n1GUbDZZr3W3I65AZdgX3Jy/fdkti6pzc+A=;
 b=NiWIU8kKB21XwLA4bzO1fSNNuZaQldJC1lMXeeyH0pPTIWJivEuwek7EZiVsSg0v/bxtqeZVDLWSaTXszNxPcZyP1qLATixWQ27OwTdAQ2qtk/CeNXGUv28aytA3uPmr7PS/PHYqjNP0zjtJAsxxBS6AkIs9gI0Urrt1c85Ui7w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2726.namprd11.prod.outlook.com (2603:10b6:a02:be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Thu, 27 Aug
 2020 18:20:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 18:20:48 +0000
Subject: Re: [oe] [meta-python][PATCH 5/6] python3-flask-socketio: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200826154020.29208-1-leon.anavi@konsulko.com>
 <20200826154020.29208-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <bf6e01a8-a2df-d63c-88ee-f2a50a9cac70@windriver.com>
Date: Thu, 27 Aug 2020 14:20:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200826154020.29208-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0065.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 18:20:47 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ed4d33f-5e65-4d3e-81ff-08d84ab5ec22
X-MS-TrafficTypeDiagnostic: BYAPR11MB2726:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB27263B53BAAA543B7F51FF139F550@BYAPR11MB2726.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LYzcN+tIdMuJ4tZGzhkIlzgoHKSFQbhY5XxTNgCFYwtqqPz7FvYIo4wsgBE29XzqNPbcdKUdDegWU7CBOrXYyR6MBYqXx/HUeXPqAf49bhkCSC/OIJ0b23uai1Fe8xGEQRryfhS3XTcdmbgEJ30WqM6zF4qCDAd4tsrMtArCv3ICtKvnf2K1HR1jjlyzzhCOhvMCct4vrqMWuAdS+ZxEtWU9HNSIe+yWUzkuHvrE55uTpmrWO74QRdSiXN8e0/VTB94u5B9ULz2WW8AuIPs3O8ZgvyA0FoNcX+JTjlPmuOhbv8/MvLZQ45MhjUAOZ4XrJWLE2aPXRYJf15LE2J6NOoA/GfI1X/4t108YYu9/fpcSS+4XJwpx833Op9f11xS8kcXXp7n41wZ1hv0xbt8WI6fDtRyE181dxtZY16plTgD2u6ANi9X5AF/iobUampa/zudzCPYZEnTdKdUUd0ypqQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(5660300002)(66556008)(6666004)(2616005)(956004)(26005)(31696002)(8936002)(6486002)(83380400001)(33964004)(966005)(66946007)(31686004)(86362001)(2906002)(186003)(66476007)(53546011)(52116002)(166002)(8676002)(36756003)(316002)(478600001)(44832011)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kAIT9lpqOKwlGXFYfRf7Z0KI4UpPQEasNaryJp1W01prjG2AUleIiu4Op7n6hROZHAjji7ENOEO9nWSFEYvh+saYUSEabGbQMQY8fWH9jMV8/QEVrwt6p1HBHsMl7FMxp3oZnmErBdXTeMWk8I1sLHtK1Ln9GBWo52l5ONOVQGtuOBrBP1P3zaOm6R2SsLcI/1cex7JY4TxWsildmenfPwUJvP+hcXl1e1q5OXJcxnzG7Zwib9ZfqH75QOS88c1ZjtDuF8QaU93QJdjco1zDBxUG6RH4mHIB4dN+mJXkkYbuSRVUminBZEFVA4L2LzbmN10JpcbkgizRzyzLV+CacpM/C2Lur/mUYRv57LgqfEDPkc6d+dons6vpS1ldmloGPfRtSupF/iNueCA0eLJW+TBYMBnaVrnHqGjhCKULY1osrVfGjzCY71qQJPYwnC2A0SK65mb+mVwLDDwWWDgwGJTcPF6gSTv0MP2N+RQeGll6vCSiPzz5kPpmAjZEbtz4kHESXrrjChpP1DjvvRzb48Xo7MvW14wqDwvkP+6mzzwGBpq3tHnZTxLDx98fMu4JXyN5fJrMd4r0YTs4emmbMHdWpxjG1V47dze5Vlwxe5Pb42WSFlftoVqCL49WuSUpUCbussDQi0ra0r3RoB4CYQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed4d33f-5e65-4d3e-81ff-08d84ab5ec22
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 18:20:48.5584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XN6ilTDfpe6HadDL+g6RH8wsdEhMfeYrB8IkP0G3HzvFDd+42ZN9/7mAlOJsHCJD5z10JjWT2z7usNIgFbHJtA+nOpNfnj/2/iKvUHJBMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2726
Content-Type: multipart/alternative;
 boundary="------------6A60E3772C548E8374973647"
Content-Language: en-US

--------------6A60E3772C548E8374973647
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/26/20 11:40 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python-flask-socketio.inc          | 18 -----------------
>   .../python/python3-flask-socketio_4.2.1.bb    | 20 +++++++++++++++++--
>   2 files changed, 18 insertions(+), 20 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-flask-socketio.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-socketio.inc b/meta-python/recipes-devtools/python/python-flask-socketio.inc
> deleted file mode 100644
> index 8d778d4bf..000000000
> --- a/meta-python/recipes-devtools/python/python-flask-socketio.inc
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY = "Socket.IO integration for Flask applications"
> -HOMEPAGE = "https://github.com/miguelgrinberg/Flask-SocketIO/"
> -SECTION = "devel/python"
> -
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=38cc21254909604298ce763a6e4440a0"
> -
> -inherit pypi
> -
> -PYPI_PACKAGE = "Flask-SocketIO"
> -
> -SRC_URI[md5sum] = "b23222fb7dd2f0676d78bbe24153fd80"
> -SRC_URI[sha256sum] = "2172dff1e42415ba480cee02c30c2fc833671ff326f1598ee3d69aa02cf768ec"
> -
> -RDEPENDS_${PN} += "\
> -    ${PYTHON_PN}-flask \
> -    ${PYTHON_PN}-socketio \
> -    "
> diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
> index ffc4aa7fd..e5fc54136 100644
> --- a/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
> @@ -1,2 +1,18 @@
> -inherit setuptools3
> -require python-flask-socketio.inc
> +SUMMARY = "Socket.IO integration for Flask applications"
> +HOMEPAGE = "https://github.com/miguelgrinberg/Flask-SocketIO/"
> +SECTION = "devel/python"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=38cc21254909604298ce763a6e4440a0"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "Flask-SocketIO"
> +
> +SRC_URI[md5sum] = "b23222fb7dd2f0676d78bbe24153fd80"
> +SRC_URI[sha256sum] = "2172dff1e42415ba480cee02c30c2fc833671ff326f1598ee3d69aa02cf768ec"
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-flask \
> +    ${PYTHON_PN}-socketio \
> +    "
>
> 

--------------6A60E3772C548E8374973647
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
    <blockquote type="cite" cite="mid:20200826154020.29208-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200826154020.29208-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python-flask-socketio.inc          | 18 -----------------
 .../python/python3-flask-socketio_4.2.1.bb    | 20 +++++++++++++++++--
 2 files changed, 18 insertions(+), 20 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-socketio.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-socketio.inc b/meta-python/recipes-devtools/python/python-flask-socketio.inc
deleted file mode 100644
index 8d778d4bf..000000000
--- a/meta-python/recipes-devtools/python/python-flask-socketio.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = &quot;Socket.IO integration for Flask applications&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/miguelgrinberg/Flask-SocketIO/">&quot;https://github.com/miguelgrinberg/Flask-SocketIO/&quot;</a>
-SECTION = &quot;devel/python&quot;
-
-LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=38cc21254909604298ce763a6e4440a0">&quot;file://LICENSE;md5=38cc21254909604298ce763a6e4440a0&quot;</a>
-
-inherit pypi
-
-PYPI_PACKAGE = &quot;Flask-SocketIO&quot;
-
-SRC_URI[md5sum] = &quot;b23222fb7dd2f0676d78bbe24153fd80&quot;
-SRC_URI[sha256sum] = &quot;2172dff1e42415ba480cee02c30c2fc833671ff326f1598ee3d69aa02cf768ec&quot;
-
-RDEPENDS_${PN} += &quot;\
-    ${PYTHON_PN}-flask \
-    ${PYTHON_PN}-socketio \
-    <a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bbb/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bbindexffc4aa7fd..e5fc54136100644---a/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb+++b/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb@@-1,2+1,18@@-inheritsetuptools3-requirepython-flask-socketio.inc+SUMMARY=">&quot;
diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
index ffc4aa7fd..e5fc54136 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
@@ -1,2 +1,18 @@
-inherit setuptools3
-require python-flask-socketio.inc
+SUMMARY = &quot;</a>Socket.IO integration for Flask applications&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/miguelgrinberg/Flask-SocketIO/">&quot;https://github.com/miguelgrinberg/Flask-SocketIO/&quot;</a>
+SECTION = &quot;devel/python&quot;
+
+LICENSE = &quot;MIT&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=38cc21254909604298ce763a6e4440a0">&quot;file://LICENSE;md5=38cc21254909604298ce763a6e4440a0&quot;</a>
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = &quot;Flask-SocketIO&quot;
+
+SRC_URI[md5sum] = &quot;b23222fb7dd2f0676d78bbe24153fd80&quot;
+SRC_URI[sha256sum] = &quot;2172dff1e42415ba480cee02c30c2fc833671ff326f1598ee3d69aa02cf768ec&quot;
+
+RDEPENDS_${PN} += &quot;\
+    ${PYTHON_PN}-flask \
+    ${PYTHON_PN}-socketio \
+    &quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6A60E3772C548E8374973647--
