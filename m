Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74B0C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 07:51:44 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.40441.1674633099106657429
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Jan 2023 23:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout03.t-online.de (Postfix) with SMTP id 724C9E76B
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 08:51:37 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.209]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pKaZF-1RFC770; Wed, 25 Jan 2023 08:51:37 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv3] cups-pk-helper: add recipe
Date: Wed, 25 Jan 2023 08:51:22 +0100
Message-Id: <20230125075122.74378-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1674633097-B9016A74-1D37A9F4/0/0 CLEAN NORMAL
X-TOI-MSGID: 1826e4c2-a11a-4f9f-a69c-03c1741cd7e0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 07:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100730

cups-pk-helper is a runtime dependency for gnome-control-center
or system-config-printer.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nsuse.CupsPkHelper.Mechanism.service.patch | 24 +++++++++++++++++++
 .../cups/cups-pk-helper_0.2.7.bb              | 23 ++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/cups-pk-helper/dont-loc=
alize-org.opensuse.CupsPkHelper.Mechanism.service.patch
 create mode 100644 meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb

diff --git a/meta-oe/recipes-printing/cups/cups-pk-helper/dont-localize-o=
rg.opensuse.CupsPkHelper.Mechanism.service.patch b/meta-oe/recipes-printi=
ng/cups/cups-pk-helper/dont-localize-org.opensuse.CupsPkHelper.Mechanism.=
service.patch
new file mode 100644
index 000000000..86c09c9f8
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-pk-helper/dont-localize-org.open=
suse.CupsPkHelper.Mechanism.service.patch
@@ -0,0 +1,24 @@
+--- a/src/meson.build	2023-01-24 09:22:59.874074134 +0100
++++ b/src/meson.build	2023-01-24 09:27:00.494627305 +0100
+@@ -73,12 +73,12 @@
+=20
+=20
+ # Translate and install policy file
+-i18n.merge_file (
+-  input: 'org.opensuse.cupspkhelper.mechanism.policy.in',
+-  output: 'org.opensuse.cupspkhelper.mechanism.policy',
+-  type: 'xml',
+-  data_dirs: join_paths (meson.source_root (), 'src'),
+-  po_dir: join_paths (meson.source_root (), 'po'),
+-  install: true,
+-  install_dir: join_paths (prefix, datadir, 'polkit-1', 'actions')
+-)
++#i18n.merge_file (
++#  input: 'org.opensuse.cupspkhelper.mechanism.policy.in',
++#  output: 'org.opensuse.cupspkhelper.mechanism.policy',
++#  type: 'xml',
++#  data_dirs: join_paths (meson.source_root (), 'src'),
++#  po_dir: join_paths (meson.source_root (), 'po'),
++#  install: true,
++#  install_dir: join_paths (prefix, datadir, 'polkit-1', 'actions')
++#)
diff --git a/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb b/meta=
-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
new file mode 100644
index 000000000..4bf62006f
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
@@ -0,0 +1,23 @@
+DESCRIPTION =3D "CUPS polkit helper"
+HOMEPAGE =3D "https://www.freedesktop.org/software/cups-pk-helper/releas=
es/"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+
+DEPENDS =3D "cups polkit glib-2.0"
+
+inherit meson pkgconfig gettext features_check
+
+REQUIRED_DISTRO_FEATURES =3D"polkit"
+
+SRC_URI =3D " \
+    https://www.freedesktop.org/software/cups-pk-helper/releases/cups-pk=
-helper-${PV}.tar.xz \
+    file://dont-localize-org.opensuse.CupsPkHelper.Mechanism.service.pat=
ch \
+"
+SRC_URI[sha256sum] =3D "66070ddb448fe9fcee76aa26be2ede5a80f85563e3a4afd5=
9d2bfd79fbe2e831"
+
+do_install:append() {
+    install -d ${D}${datadir}/polkit-1/actions
+    install -m 644 ${S}/src/org.opensuse.cupspkhelper.mechanism.policy.i=
n ${D}${datadir}/polkit-1/actions/org.opensuse.cupspkhelper.mechanism.pol=
icy
+}
+
+FILES:${PN} +=3D "${datadir}"
--=20
2.34.1


