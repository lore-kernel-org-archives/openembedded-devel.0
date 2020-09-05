Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.42])
 by mx.groups.io with SMTP id smtpd.web10.5601.1599332602014823596
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 12:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=c1CYVc9t;
 spf=pass (domain: windriver.com, ip: 40.107.102.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kr1B4BT+G5CaVZmX6wNShE1X89Hy7LohgcEhfQKk3gAN3apxE5eFNETQwAHrj0eAUYdifxYgTq7tlYB26iMFDbzdKDhU468x8UtVj0jF3fHzBstIwfQmaCUT3a1WlkBHXqOfGY6+dHlSOz+nph+gzF0s90mgqn9sSUJbHXskFCi4CAS6X04pL4TNfJX5tOfzpsT5PXdpOFWors9R3nMtMaypOiIrvnQuWSkyxMZYnFrmdylQ+NLXm6H4EXiOFEDyUT89UkdEEnVlhznoHf2EjKNR5UuC2eXtRBDhqB0kckOsRuPaQB+oxT97m2282DTyy6RBOUmkbPK5uGaHNc8ANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEX8bpe+00R9dSVAtoGo5Oqe9Nt+PRbWC/Y6ATa/2Co=;
 b=EKohw5c6bgxijQcVHJj2Ix4q1boWMhcx05DgUHBm78ZN213gCxMULMwBbuT89UhcKz+kdFv/in2yhXiYzJrd/oZk3OTebAncYZifOaJ1s7/e9BW2K4CE2AIwLn/R5dosaTNv9hDUCOn2kQZ69UX5ynxcGQvDrxQ+rEAnjyaLF5pkWRR5GxSQ0tJizCtpS2Vv64LVbOsLTM6sf+mz99A0fLH+Dgvg73K3Xbo0ERGV/HGnKMBGAG2kTXiZPKr8RP1XfzMgI5iihVGtdzXclslCGW0OJBzhkw/NW5yIOEYe7AchPFHP/kzHYM1C2NkcJhP3X8SFLakjahIy8MyRRBUodw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEX8bpe+00R9dSVAtoGo5Oqe9Nt+PRbWC/Y6ATa/2Co=;
 b=c1CYVc9tdCVOVLn/AWRKBpqK7Yy8IsANWCI+8d9+F80b6q1Vm7Och3ZzNuuN/r3qqtewREm+km0ZXvYSywTm/T+kDbNImX+MSLMtgc/VX8EtgfQLVz+ie1lmGrKQJx3dsWvDnSy1I1prUJrrEoJamoSRm6cUABwhq8JHf08u2Qo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Sat, 5 Sep
 2020 19:03:20 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Sat, 5 Sep 2020
 19:03:20 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-gevent: Consolidate in a single file
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200902112808.18547-1-leon.anavi@konsulko.com>
 <20200902112808.18547-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d8e006be-0f1c-9669-1683-f053b844e93e@windriver.com>
Date: Sat, 5 Sep 2020 15:03:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200902112808.18547-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 19:03:19 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b43d334b-4278-4a1e-8892-08d851ce5abe
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29522C06B5450420BEBDD0BB9F2A0@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lSSkyud/o9P0UXijxuJ8g96pM0cRJPo8dxLWxDmF2YgcAZkWbJcOl6YJ9uVqrTgL3xvzkrHzn2yf1muFoz5r5dwX3l+4mOk1bYy4v2k0BNwAR00D7oURVQO+OsupSZRpnQgs/ORp+rEZ4GzrFmBtshB9nI0RFV7nxViSWd8w94upInUKB3fTLTMUXNpEQEfCNNe2zgAM4SiB7kT5VysOvB0stGPTKiV2+QbWe6HtVkBIErmiCD8Y3meKkwSiBwlBQ4MGfLntDEcLJs7hvgw24sInBo6dFpWOyTPfjwkS4koJAV015A6a6wOqEaqW3qVj6TSzIPbiA/kqV7bbBjP5eLrlMErLY+VTlgZh3RPV6EtbFcErOLGOXFuHG1Qfr8YLXbHj+oI19sXRQg9gjA33Owago6wKl93sQ00WHVZA/ClW/YdJSVi8LL9DVjRtXQMASnqIlNi602MiO1aG0U2HWA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39840400004)(376002)(346002)(396003)(53546011)(66556008)(66946007)(8936002)(16526019)(26005)(186003)(166002)(8676002)(16576012)(83380400001)(316002)(31686004)(36756003)(86362001)(33964004)(31696002)(2616005)(5660300002)(2906002)(966005)(66476007)(44832011)(52116002)(478600001)(956004)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2h0dXl/GBbOtttYZw7JqFtGyK9OK1OlOMM2XqpB4lrw+ZX1Eyvuj6UbccBvH0ZCx5/BZODAV1W//F3Tv3p5NpFZSMz4iwGk0k4uBYUYAndsvEKMwPVWL6uCOhQcEnak4SmDMQLpHIBPRmQKViNCNVQkF9gS4f07EypfQ3Ci188aTV1Jpd+YcpaIJDmApBCDPt1Wzi8T30ylMXqZiU1hJqlEtH5hHY0uvgXq3zlljdc7pdsh7Ey2L+nmO0juP7oihal01b/ZkSHbZdKu9wzLZrk9zJPH1bFSC5o1G0sajCMTi0sdidsAFr7ErQsapRlGC7rms/UGOurOoaQNclEsVQ+DE2HphT3miZK/yCjag0FWt6+GpAZD5flGS0kE4+METvGRiT7XOgfnmoGWCd7+/OQyF3JEacMg4xeoGFaJWZF2m6RGi53qSusXTXgDasp/9luMYs+4nvZvu0lu8rS3yD8qGsfqZMvmRMiSoV9iDRbOhTcnNq5n7l1IVaIbxCAJcYiRiSlp7wXxLthoZ86o8pOiTJnP0kijPnQykFTl/46FoLckproDaKHsTXON+5LF5HMY7c6f0QRxvS74xI3e5hp4Vdfx96gLA1qvIJYesesxguiqC1fk7Mqa7G3Uu6hZkQhfF0vP9xxGCnAoiCnhY+Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b43d334b-4278-4a1e-8892-08d851ce5abe
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 19:03:20.2433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdaQbdnWrWyPv3tysW1Qzr4t8WDG0LerNJKO08LvD/UqhyZM5oJOhRTxu1JBa0yJVZ5xItxoaOhCeqE63KRx5R/uH7it3DefmyxqxzWLGJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Content-Type: multipart/alternative;
 boundary="------------F30C86F654921F95215369C7"
Content-Language: en-US

--------------F30C86F654921F95215369C7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/20 7:28 AM, Leon Anavi wrote:
> Consolidate inc and bb files into a single bb file.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python-gevent.inc | 35 ------------------
>   .../python/python3-gevent_1.4.0.bb            | 37 ++++++++++++++++++-
>   2 files changed, 35 insertions(+), 37 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python-gevent.inc
>
> diff --git a/meta-python/recipes-devtools/python/python-gevent.inc b/meta-python/recipes-devtools/python/python-gevent.inc
> deleted file mode 100644
> index bc89d104a..000000000
> --- a/meta-python/recipes-devtools/python/python-gevent.inc
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -SUMMARY = "A coroutine-based Python networking library"
> -DESCRIPTION = "gevent is a coroutine-based Python networking library that uses greenlet to provide \
> -a high-level synchronous API on top of the libevent event loop."
> -HOMEPAGE = "http://www.gevent.org"
> -LICENSE = "MIT & Python-2.0 & BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65 \
> -                    file://NOTICE;md5=18108df3583462cafd457f024b9b09b5 \
> -                    file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347 \
> -                    "
> -DEPENDS += "libevent"
> -DEPENDS += "${PYTHON_PN}-greenlet"
> -RDEPENDS_${PN} = "${PYTHON_PN}-greenlet \
> -		  ${PYTHON_PN}-mime \
> -		  ${PYTHON_PN}-pprint \
> -		 "
> -
> -FILESEXTRAPATHS_prepend := "${THISDIR}/python-gevent:"
> -
> -SRC_URI_append = " \
> -    file://libev-conf.patch;patch=1;pnum=1 \
> -    file://0002-setup.py-do-not-query-for-include-dir.patch \
> -"
> -
> -SRC_URI[md5sum] = "6b9dd98917061803d9158e5258b8f412"
> -SRC_URI[sha256sum] = "1eb7fa3b9bd9174dfe9c3b59b7a09b768ecd496debfc4976a9530a3e15c990d1"
> -
> -# The python-gevent has no autoreconf ability
> -# and the logic for detecting a cross compile is flawed
> -# so always force a cross compile
> -do_configure_append() {
> -	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/libev/configure
> -	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/c-ares/configure
> -}
> -
> -inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb b/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
> index df688e424..e42980d38 100644
> --- a/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
> @@ -1,2 +1,35 @@
> -require python-gevent.inc
> -inherit setuptools3
> +SUMMARY = "A coroutine-based Python networking library"
> +DESCRIPTION = "gevent is a coroutine-based Python networking library that uses greenlet to provide \
> +a high-level synchronous API on top of the libevent event loop."
> +HOMEPAGE = "http://www.gevent.org"
> +LICENSE = "MIT & Python-2.0 & BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65 \
> +                    file://NOTICE;md5=18108df3583462cafd457f024b9b09b5 \
> +                    file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347 \
> +                    "
> +DEPENDS += "libevent"
> +DEPENDS += "${PYTHON_PN}-greenlet"
> +RDEPENDS_${PN} = "${PYTHON_PN}-greenlet \
> +		  ${PYTHON_PN}-mime \
> +		  ${PYTHON_PN}-pprint \
> +		 "
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/python-gevent:"
> +
> +SRC_URI_append = " \
> +    file://libev-conf.patch;patch=1;pnum=1 \
> +    file://0002-setup.py-do-not-query-for-include-dir.patch \
> +"
> +
> +SRC_URI[md5sum] = "6b9dd98917061803d9158e5258b8f412"
> +SRC_URI[sha256sum] = "1eb7fa3b9bd9174dfe9c3b59b7a09b768ecd496debfc4976a9530a3e15c990d1"
> +
> +# The python-gevent has no autoreconf ability
> +# and the logic for detecting a cross compile is flawed
> +# so always force a cross compile
> +do_configure_append() {
> +	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/libev/configure
> +	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/c-ares/configure
> +}
> +
> +inherit pypi setuptools3
>
> 

--------------F30C86F654921F95215369C7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/2/20 7:28 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200902112808.18547-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200902112808.18547-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python-gevent.inc | 35 ------------------
 .../python/python3-gevent_1.4.0.bb            | 37 ++++++++++++++++++-
 2 files changed, 35 insertions(+), 37 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-gevent.inc

diff --git a/meta-python/recipes-devtools/python/python-gevent.inc b/meta-python/recipes-devtools/python/python-gevent.inc
deleted file mode 100644
index bc89d104a..000000000
--- a/meta-python/recipes-devtools/python/python-gevent.inc
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = &quot;A coroutine-based Python networking library&quot;
-DESCRIPTION = &quot;gevent is a coroutine-based Python networking library that uses greenlet to provide \
-a high-level synchronous API on top of the libevent event loop.&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.gevent.org">&quot;http://www.gevent.org&quot;</a>
-LICENSE = &quot;MIT &amp; Python-2.0 &amp; BSD&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65\-file://NOTICE;md5=18108df3583462cafd457f024b9b09b5\-file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347\-">&quot;file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65 \
-                    file://NOTICE;md5=18108df3583462cafd457f024b9b09b5 \
-                    file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347 \
-                    &quot;</a>
-DEPENDS += &quot;libevent&quot;
-DEPENDS += &quot;${PYTHON_PN}-greenlet&quot;
-RDEPENDS_${PN} = &quot;${PYTHON_PN}-greenlet \
-		  ${PYTHON_PN}-mime \
-		  ${PYTHON_PN}-pprint \
-		 &quot;
-
-FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-gevent:&quot;
-
-SRC_URI_append = &quot; \
-    <a class="moz-txt-link-freetext" href="file://libev-conf.patch;patch=1;pnum=1">file://libev-conf.patch;patch=1;pnum=1</a> \
-    <a class="moz-txt-link-freetext" href="file://0002-setup.py-do-not-query-for-include-dir.patch">file://0002-setup.py-do-not-query-for-include-dir.patch</a> \
-&quot;
-
-SRC_URI[md5sum] = &quot;6b9dd98917061803d9158e5258b8f412&quot;
-SRC_URI[sha256sum] = &quot;1eb7fa3b9bd9174dfe9c3b59b7a09b768ecd496debfc4976a9530a3e15c990d1&quot;
-
-# The python-gevent has no autoreconf ability
-# and the logic for detecting a cross compile is flawed
-# so always force a cross compile
-do_configure_append() {
-	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/libev/configure
-	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/c-ares/configure
-}
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb b/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
index df688e424..e42980d38 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
@@ -1,2 +1,35 @@
-require python-gevent.inc
-inherit setuptools3
+SUMMARY = &quot;A coroutine-based Python networking library&quot;
+DESCRIPTION = &quot;gevent is a coroutine-based Python networking library that uses greenlet to provide \
+a high-level synchronous API on top of the libevent event loop.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.gevent.org">&quot;http://www.gevent.org&quot;</a>
+LICENSE = &quot;MIT &amp; Python-2.0 &amp; BSD&quot;
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65\+file://NOTICE;md5=18108df3583462cafd457f024b9b09b5\+file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347\+">&quot;file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65 \
+                    file://NOTICE;md5=18108df3583462cafd457f024b9b09b5 \
+                    file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347 \
+                    &quot;</a>
+DEPENDS += &quot;libevent&quot;
+DEPENDS += &quot;${PYTHON_PN}-greenlet&quot;
+RDEPENDS_${PN} = &quot;${PYTHON_PN}-greenlet \
+		  ${PYTHON_PN}-mime \
+		  ${PYTHON_PN}-pprint \
+		 &quot;
+
+FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-gevent:&quot;
+
+SRC_URI_append = &quot; \
+    <a class="moz-txt-link-freetext" href="file://libev-conf.patch;patch=1;pnum=1">file://libev-conf.patch;patch=1;pnum=1</a> \
+    <a class="moz-txt-link-freetext" href="file://0002-setup.py-do-not-query-for-include-dir.patch">file://0002-setup.py-do-not-query-for-include-dir.patch</a> \
+&quot;
+
+SRC_URI[md5sum] = &quot;6b9dd98917061803d9158e5258b8f412&quot;
+SRC_URI[sha256sum] = &quot;1eb7fa3b9bd9174dfe9c3b59b7a09b768ecd496debfc4976a9530a3e15c990d1&quot;
+
+# The python-gevent has no autoreconf ability
+# and the logic for detecting a cross compile is flawed
+# so always force a cross compile
+do_configure_append() {
+	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/libev/configure
+	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/deps/c-ares/configure
+}
+
+inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F30C86F654921F95215369C7--
