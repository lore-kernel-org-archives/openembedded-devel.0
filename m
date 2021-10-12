Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661A3C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 05:26:54 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web08.9541.1634016413013617883
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 22:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=e+GmI6jm;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634016411; i=@fujitsu.com;
	bh=HUPqltUDpd0kudSR4+ZeufS97dpQjIxcHRBaL7iwzdg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=e+GmI6jmgxiYzigEQFGk2vY2Qw40wiPUexA3QX7fkm0fwIHGos/bn03dI5/6TkIVA
	 zPX9dsi3ONi6Cjb6L5dR1mHMuhmpXS3Y/qnqbhAk2ohECWzlTTtjdUmkxhLfzrhYJF
	 7TxZFoX24BO/5m/F+COyYvWeYmzybT8TmRpZ6MbooiqAGlO8n2q62MfmYhwsOnHfHr
	 D4Ti/hAHIJNTsJDS9weVKzG6RXzs39T+rKgMvYx/WxexLDmdltO/YYDWuseW3hcvCG
	 oMje5ptdaSc/CRAddDWdeQChs5ylxqv97NT20kmtgzWsbOtE+dv8HB9cBG2Sp+S7ll
	 RSzq+HBD4Bdlw==
Received: from [100.112.199.201] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 7B/D3-20159-A9C15616;
 Tue, 12 Oct 2021 05:26:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8MRqjtLJjX
  RYMVFZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNl62qWgrV8FU19X1kaGF/ydDFycQgJzGaS
  2PZ4BzOEc4JR4v+cuyxdjJwcbAI6Eh0vusFsEQF9iaWz9zCD2MICvhIfDp1iBbFZBFQlOudeZ
  AexeQXcJQ7tOwVmSwgoSEx5+J4ZIi4ocXLmE7A5zAKaEq3bf7ND2PISzVtnM0PUK0ps33mGBc
  KukHh9+BLzBEbeWUjaZyFpn4WkfQEj8ypGi6SizPSMktzEzBxdQwMDXUNDI11DSwtdI0NTvcQ
  q3SS91FLd8tTiEl1DvcTyYr3iytzknBS9vNSSTYzAwEspOHZ9B+PV1x/0DjFKcjApifIGnUpJ
  FOJLyk+pzEgszogvKs1JLT7EKMPBoSTB28mXmigkWJSanlqRlpkDjAKYtAQHj5IIb6ckUJq3u
  CAxtzgzHSJ1ilFRSpz3hxBQQgAkkVGaB9cGi7xLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlY
  R5z4KM58nMK4Gb/gpoMRPQ4sCoFJDFJYkIKakGpkblz4XyHHv3/w1+9sPv2J445nZHRsc3nqU
  T8np6yo///Mov8PDwloSKN15ze34cnbF2RsVseZ2dfreN216Y/fBx9ObpWvXxjo32HKefStxS
  vN8u7IqvelyYFru3WDSnT8m4o3GzdNMr7c/Zgk9UYvK7Tr4XmBY9/d4r9pWHf/+Ufrv/YL7aP
  Sdb5zfXz3Z+XdEWrM945rpihsne3+uOX7slOe+GwxkzvbXWvI8uXYlUWKDE26YWUrNYb3Kt8w
  0L78TnGsfeBC2u2rFG0rnHZZusSMDvmvdZ3BM/mSQGTvu04slpLm/Jl/XMF1SnqrPGfs+7puF
  1w0ZFR+2ahfS6hD+HCvQ+Bddv5uhWzpQtVGIpzkg01GIuKk4EADVkP6M3AwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-291.messagelabs.com!1634016410!695639!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21778 invoked from network); 12 Oct 2021 05:26:50 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-9.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Oct 2021 05:26:50 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19C5Qgdr012344
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 06:26:50 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 12 Oct 2021 06:26:41 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 7.27.0 -> 7.28.0
Date: Tue, 12 Oct 2021 13:26:35 +0800
Message-ID: <1634016395-17011-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Oct 2021 05:26:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93246

Here is a non-exhaustive list of changes,

Fixes:
async with doesn=E2=80=99t allow newlines PR #13090
Dynamically changing to vi mode via %config magic) PR #13091
Virtualenv handling fixes:
init_virtualenv now uses Pathlib PR #12548
Fix Improper path comparison of virtualenv directories PR #13140
Fix virtual environment user warning for lower case pathes PR #13094
Adapt to all sorts of drive names for cygwin PR #13153

New Features:
enable autoplay in embed YouTube player PR #13133

Documentation:
Fix formatting for the core.interactiveshell documentation PR #13118
Fix broken ipyparallel=E2=80=99s refs PR #13138
Improve formatting of %time documentation PR #13125
Reword the YouTubeVideo autoplay WN PR #13147

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-ipython_7.27.0.bb =3D> python3-ipython_7.28.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.27.0.bb =3D> python3-ipython_7.28.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.27.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.28.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_7.27.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.28.0.bb
index 3c64b82c2d..c5d05a8dad 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.28.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.rst;md5=3D59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE =3D "ipython"
 
-SRC_URI[sha256sum] =3D "58b55ebfdfa260dad10d509702dc2857cb25ad82609506b070cf2d7b7df5af13"
+SRC_URI[sha256sum] =3D "2097be5c814d1b974aea57673176a924c4c8c9583890e7a5f082f547b9975b11"
 
 RDEPENDS:${PN} =3D "\
     ${PYTHON_PN}-setuptools \
-- 
2.25.1


