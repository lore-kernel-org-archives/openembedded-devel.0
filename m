Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E8EC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 09:11:49 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.6922.1634807508293328690
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 02:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HQyTRd0a;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634807506; i=@fujitsu.com;
	bh=MKQSHaEqfhpbIQkzuineql6dzqF9g/ol9NERbXl5aE0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=HQyTRd0aZrQGhpV2lZTraVB3h+xyRIS0Td4uICy1FWTzBLYa9ngZ2MXPpDZyU2qDz
	 nb+njwOjk9YXKG//pm0GNdjkR7ZB3qjSAUxIPHECL15r+xX/mFHdsRp/J+5MRV0Eqr
	 is9DItEtAgqoW7cFOp7+pDLu1CaashgGNfLzkb19MhTbfjMC93wo5490kc3Y1g9db1
	 u/198kcJ9F6L40jc3oNd64KMPWpeNib1tiC6MSMQ8qzwWo34+b+hzBmI/IgrIUCnyO
	 C/FRj6TkVRXPSQyCuhFhPOm9h8ATg9Cl/9X6QOusaI+/PrAmh0DCSWFZuREi6aK8Vt
	 cRpCHQJi1rBJA==
Received: from [100.113.0.18] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 1A/DD-08252-1DE21716;
 Thu, 21 Oct 2021 09:11:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8ORqHtBrzD
  RYP5lIYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPVol+sBW1SFWuPfWBuYJwi1sXIxSEk8IRR
  om/PJeYuRk4g5wKTxI2pDhCJE4wSS3adBkuwCehIdLzoZgGxRQT0JZbO3gMWFxbwkWiZfIQdx
  GYRUJVY+v4fUA0HB6+Am8T3FhOQsISAgsSUh+/BynkFBCVOznwCNoZZQELi4IsXzBA1ihLbd5
  5hgbArJF4fvgQVV5O4em4T8wRGvllI2mchaV/AyLSK0TKpKDM9oyQ3MTNH19DAQNfQ0FjXUNf
  IwFwvsUo3US+1VDc5Na+kKBEoq5dYXqxXXJmbnJOil5dasokRGHgphYzndzBOffNB7xCjJAeT
  kiivzq+CRCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvDvVCxOFBItS01Mr0jJzgFEAk5bg4FES4
  fVXBkrzFhck5hZnpkOkTjEqSonzvpMHSgiAJDJK8+DaYJF3iVFWSpiXkYGBQYinILUoN7MEVf
  4VozgHo5Iwb5cu0BSezLwSuOmvgBYzAS0usCgAWVySiJCSamASknmSKlJluTuzeAG71KJstdd
  /Q3wu8b47JTFvn7KfFY/BPLcktlWMWSGlzXG79H+/uauvPzssb5/ppf/n7nS1zTXp4Tmu9mZy
  +e+yU+UM8/QuPaiIOmnwvrrOs7/55YxNdotYjn+TnrCT85LeliP1Mv/e5k3ZvH/LLXFWIb7z8
  sxFj957OKlqxQqIMRVvyNz148HnDSlTG0/t1fgXv7Lcz6ez/EVD81OVmXND5AviPn6O4J8n/t
  f5wI6dB7ZnaFz1mzE3fkIwm+IGfla++68PNSdOWPv99eT3fzldap+wlIk5/nZkW7LSR0gjrfB
  N8quDbxvF94ux/9C3Uz+xdN2ZagWbd4X/X5vntnN0//NVYinOSDTUYi4qTgQAaHM3PTcDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-232.messagelabs.com!1634807500!11550!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17296 invoked from network); 21 Oct 2021 09:11:42 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Oct 2021 09:11:42 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E6CAE100244
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 10:11:39 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DAC1810023D
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 10:11:39 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Thu, 21 Oct 2021 10:11:37 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-werkzeug: upgrade 2.0.1 -> 2.0.2
Date: Fri, 22 Oct 2021 05:11:32 +0800
Message-ID: <1634850692-4820-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Oct 2021 09:11:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93516

Version 2.0.2
-------------
Released 2021-10-05
-   Handle multiple tokens in ``Connection`` header when routing
    WebSocket requests. :issue:`2131`
-   Set the debugger pin cookie secure flag when on https. :pr:`2150`
-   Fix type annotation for ``MultiDict.update`` to accept iterable
    values :pr:`2142`
-   Prevent double encoding of redirect URL when ``merge_slash=True``
    for ``Rule.match``. :issue:`2157`
-   ``CombinedMultiDict.to_dict`` with ``flat=False`` considers all
    component dicts when building value lists. :issue:`2189`
-   ``send_file`` only sets a detected ``Content-Encoding`` if
    ``as_attachment`` is disabled to avoid browsers saving
    decompressed ``.tar.gz`` files. :issue:`2149`
-   Fix type annotations for ``TypeConversionDict.get`` to not return an
    ``Optional`` value if both ``default`` and ``type`` are not
    ``None``. :issue:`2169`
-   Fix type annotation for routing rule factories to accept
    ``Iterable[RuleFactory]`` instead of ``Iterable[Rule]`` for the
    ``rules`` parameter. :issue:`2183`
-   Add missing type annotation for ``FileStorage.__getattr__``
    :issue:`2155`
-   The debugger pin cookie is set with ``SameSite`` set to ``Strict``
    instead of ``None`` to be compatible with modern browser security.
    :issue:`2156`
-   Type annotations use ``IO[bytes]`` and ``IO[str]`` instead of
    ``BinaryIO`` and ``TextIO`` for wider type compatibility.
    :issue:`2130`
-   Ad-hoc TLS certs are generated with SAN matching CN. :issue:`2158`
-   Fix memory usage for locals when using Python 3.6 or pre 0.4.17
    greenlet versions. :pr:`2212`
-   Fix type annotation in ``CallbackDict``, because it is not
    utilizing a bound TypeVar. :issue:`2235`
-   Fix setting CSP header options on the response. :pr:`2237`
-   Fix an issue with with the interactive debugger where lines would
    not expand on click for very long tracebacks. :pr:`2239`
-   The interactive debugger handles displaying an exception that does
    not have a traceback, such as from ``ProcessPoolExecutor``.
    :issue:`2217`

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-werkzeug_2.0.1.bb => python3-werkzeug_2.0.2.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_2.0.1.bb => python3-werkzeug_2.0.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.0.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.0.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_2.0.2.bb
index 57db20464..4c221cc41 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.0.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Werkzeug"
 
-SRC_URI[sha256sum] = "1de1db30d010ff1af14a009224ec49ab2329ad2cde454c8a708130642d579c42"
+SRC_URI[sha256sum] = "aa2bb6fc8dee8d6c504c0ac1e7f5f7dc5810a9903e793b6f715a9f015bdadb9a"
 
 inherit pypi setuptools3
 
@@ -35,4 +35,5 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-unixadmin \
     ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-profile \
 "
-- 
2.25.1


