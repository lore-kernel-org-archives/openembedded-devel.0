Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D66C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 19:02:19 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.50899.1677006134911322516
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Feb 2023 11:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=eAx6FF9Q;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 55C2B85A47;
	Tue, 21 Feb 2023 20:02:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1677006132;
	bh=5OWTmZQsIcYzhaMeUd7qbbRoDwxXYIhOr/LbgnJwdq4=;
	h=From:To:Cc:Subject:Date:From;
	b=eAx6FF9QjESq+8HC/D2LlQq3LgzUabJKvrJucdPW9V8j+ZmX4BKQRg2i9/BF49Y6Z
	 Za8eUvurZNGS6v1pw2sw5O8TaH6OpNsEw2YI3BN8kBOCjELOgkEm7PSKOaDRpGxSU+
	 8gSoXRizbgffg4AYRQazrjJsNgXTU5v59mFy3ckFwwhdK8NGRhEH6YfY/XJmOkuTTm
	 EEFxkTpnPoHA0GaR96EnRs33q0I+iKMLkdU/XIMZBlNd2zk/FAXcn/edG8sWIV2QmE
	 iKvGH88bzdOP42lRg0KOmuh97QOPQuGEyDvl7yXh2gCEcSN8kOzvMWAwEZLX0nCSAl
	 djxt1KyzUiMpA==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-python][kirkstone][PATCH] python3-pillow: add tk to RDEPENDS ptest pkg only if x11 in DISTRO_FEATURES
Date: Tue, 21 Feb 2023 20:02:01 +0100
Message-Id: <20230221190201.13924-1-marex@denx.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 19:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101195

From: Geoff Parker <geoffrey.parker@arthrex.com>

commit 7b0e71e00 ("python3-pillow: add ptest support", 2023-01-31)
added tk to RDEPENDS:${PN}-ptest. Which cause this error on non x11
builds:

    ERROR: Nothing RPROVIDES 'tk' (but meta-openembedded/meta-python/reci=
pes-devtools/python/python3-pillow_9.4.0.bb
           RDEPENDS on or otherwise requires it) tk was skipped: missing =
required
           distro feature 'x11' (not in DISTRO_FEATURES)
    NOTE: Runtime target 'tk' is unbuildable, removing...
          Missing or unbuildable dependency chain was: ['tk']
    NOTE: Runtime target 'iotmanager' is unbuildable, removing...
          Missing or unbuildable dependency chain was: ['iotmanager', 'py=
thon3-pillow', 'tk']
    ERROR: Required build target 'update-runtime' has no buildable provid=
ers.
           Missing or unbuildable dependency chain was:
           ['update-runtime', 'runtime-image', 'iotmanager', 'python3-pil=
low', 'tk']

Add tk dependency only if DISTRO_FEATURES includes x11

(cherry picked from commit 6e8c90560e0aa8fe2ebfb791985cb75fd7490527)
Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Cc: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb =
b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
index 5a466778c..86705d2d8 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
@@ -45,7 +45,7 @@ RDEPENDS:${PN}-ptest +=3D " \
     ${PYTHON_PN}-pytest-timeout \
     ${PYTHON_PN}-resource \
     ${PYTHON_PN}-unixadmin\
-    tk \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'tk', '', d)} \
 "
=20
 CVE_PRODUCT =3D "pillow"
--=20
2.39.1


