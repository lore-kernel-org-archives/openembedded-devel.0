Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42F7C43217
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 06:03:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.4308.1652940226815996617
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 23:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=GlN5vSDV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652940225; i=@fujitsu.com;
	bh=k5rz4sNo5KVnMqCPI48ShBWnZyBPe4QNJxzcETacOCs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=GlN5vSDVdldsEsbhnvM3XhUXutIxHAt3KD3mhqthGtN8N4i5sgL3o/EPiq5Tyjler
	 dGmVpa/y5vLSTCzQcktE6V1s/4bsLkLGYvkMbpIL1BHacP/ddSw92HGr32HLLv71ne
	 T40YYLikfwNY8B0Wn1Kt3C7lArBEZ1e8wAB25aw7Bo8ly/Ly3J0CA4mwO3UU5JRh5H
	 QIZG8P3/ENdxgIN+XEC6hRGB5eI7Y/Rgk5aKDqdScB6lQYXkcyum0ePzyFzbp2BXaQ
	 6QIzpe9Ajsk9ITbXKeFQJAMeWUAYFRxtB2AVhJxQ5qjDO4Y4kOIlhikxyYW1+RON+X
	 oSU6e/NGAQmhw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8ORqHvgbmu
  Swb6/yhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aLp+fZCqbwVKy8sYmxgfErVxcjF4eQwBNG
  iU0rdzFCOBeYJJo7bzJBOCcZJWZ/ms/SxcjJwSagLvH45mtGEFtEQF9i6ew9zCA2s4CqRPfFN
  exdjBwcwgI+EpufVoOEWYDC+yY9YAKxeQXcJL78OgNWLiGgIDHl4Xswm1PAXWLpjt9gI4WAau
  5ffc4GUS8ocXLmExaI8ZoSrdt/s0PY8hLNW2dDzVGSOLHiIxOEXSHx+vAlqLiaxNVzm5gnMAr
  NQjJqFpJRs5CMWsDIvIrRKqkoMz2jJDcxM0fX0MBA19DQVNfYUtfCSC+xSjdRL7VUtzy1uEQX
  yC0v1kstLtYrrsxNzknRy0st2cQIDPqUYvWgHYzfVvzUO8QoycGkJMrrfqQ1SYgvKT+lMiOxO
  CO+qDQntfgQowwHh5IE7+cbQDnBotT01Iq0zBxgBMKkJTh4lER4W3YBpXmLCxJzizPTIVKnGB
  WlxHkT7gAlBEASGaV5cG2wqL/EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3FWQKT2ZeCdz
  0V0CLmYAW31IGW1ySiJCSamCyfP8zK17ASIC74Usfm8X75l35i44UititlpMOPVcVN29C65Jl
  Po+ZJx7M0Ly60vjlNoXv855czU1xOvrTa/vZ+b7PHiyeJ/Kk0GzOhPcGe/5NLzJVqH2yql7LM
  Y4xtPcY86VpX9wmFNZ+vRqccG2a6b9HWzhiK/5fUv7o7ZKiunBu696zy/RUmz/6GM2c3r/dlX
  v3jLx12rfmc22VDFOwWL3GcMb6fTFZ4jsLhZOiS59lPfnp9Pn1o+df9iooXeUI2KK3Osfr8Sm
  bPQVS4WIumw1uycide9t74IOG05FCv7t3JH5Mvv7v18kVx/eGVXeXbFrf0SqbtPH8F87afNmS
  f40PavcqWPE4yOY9lD3JqcRSnJFoqMVcVJwIADBrq4Z1AwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1652940224!990416!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6300 invoked from network); 19 May 2022 06:03:44 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 May 2022 06:03:44 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 02D63100191
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:03:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C58B5100194
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:03:43 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 19 May 2022 07:03:31 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-werkzeug: upgrade 2.1.1 -> 2.1.2
Date: Thu, 19 May 2022 14:03:07 +0800
Message-ID: <1652940188-8005-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1652940188-8005-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1652940188-8005-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 06:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97178

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    The development server does not set Transfer-Encoding: chunked for 1xx, 204, 304, and HEAD responses.
    Response HTML for exceptions and redirects starts with <!doctype html> and <html lang=3Den>.
    Fix ability to set some cache_control attributes to False.
    Disable keep-alive connections in the development server, which are not supported sufficiently by Python=E2=80=99s http.server.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-werkzeug_2.1.1.bb =3D> python3-werkzeug_2.1.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_2.1.1.bb =3D> python3-werkzeug_2.1.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_2.1.2.bb
index 476a3a596..74796d896 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE =3D "Werkzeug"
 
-SRC_URI[sha256sum] =3D "f8e89a20aeabbe8a893c24a461d3ee5dad2123b05cc6abd73ceed01d39c3ae74"
+SRC_URI[sha256sum] =3D "1ce08e8093ed67d638d63879fd1ba3735817f7a80de3674d293f5984f25fb6e6"
 
 inherit pypi setuptools3
 
-- 
2.25.1


