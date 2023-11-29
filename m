Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26ADBC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 19:42:17 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.48586.1701286928674735180
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 11:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id C080EBEE5
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 20:41:49 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.216]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r8QRO-1GJMYb0; Wed, 29 Nov 2023 20:41:46 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/3] libcacard: set meson version based on PV
Date: Wed, 29 Nov 2023 20:42:19 +0100
Message-ID: <20231129194221.5853-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1701286906-E560B93F-D2E6ECC8/0/0 CLEAN NORMAL
X-TOI-MSGID: b315aa7f-7c67-40de-b80b-f3e0dba06752
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 19:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107147

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-meson.build-set-hardcoded-version-string.patch       | 2 +-
 meta-networking/recipes-support/spice/libcacard_2.8.1.bb      | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/spice/libcacard/0001-meson.b=
uild-set-hardcoded-version-string.patch b/meta-networking/recipes-support=
/spice/libcacard/0001-meson.build-set-hardcoded-version-string.patch
index b9d31c458..68b900577 100644
--- a/meta-networking/recipes-support/spice/libcacard/0001-meson.build-se=
t-hardcoded-version-string.patch
+++ b/meta-networking/recipes-support/spice/libcacard/0001-meson.build-se=
t-hardcoded-version-string.patch
@@ -25,7 +25,7 @@ index 9cfe248..00745e5 100644
 @@ -1,5 +1,5 @@
  project('libcacard', 'c', 'cpp',
 -  version: run_command('build-aux/git-version-gen', '@0@/.tarball-versi=
on'.format(meson.source_root()), check: true).stdout().strip(),
-+  version: '2.8.1',
++  version: '@version@',
    license: 'LGPLv2.1',
    default_options: ['warning_level=3D2'],
  )
diff --git a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb b/m=
eta-networking/recipes-support/spice/libcacard_2.8.1.bb
index 44cccba9d..77bd72dd3 100644
--- a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
+++ b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
@@ -14,3 +14,7 @@ SRC_URI =3D " \
 S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig
+
+do_configure:prepend() {
+    sed -i "s|@version@|${PV}|" ${S}/meson.build
+}
--=20
2.42.1


