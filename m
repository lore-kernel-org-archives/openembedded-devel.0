Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96B9C79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 15:51:26 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17844.1789055477367047946
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 08:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=NxMCZj63;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout08.t-online.de (Postfix) with SMTP id 32C73EAB7
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 17:51:15 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.57]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x4h3Q-0wRiV60; Thu, 10 Sep 2026 17:51:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cups-pk-helper: fix localization of the polkit policy
Date: Thu, 10 Sep 2026 17:51:05 +0200
Message-ID: <20260910155105.2207041-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789055472-03FFCADA-5386EFB6/0/0 CLEAN NORMAL
X-TOI-MSGID: b7aabb3e-1f63-463e-9bdf-36f68ec4981e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789055475; i=f_l_k@t-online.de;
	bh=5JMRcSrzDyXh30e/CC1XHyxGrs9IJvxjTxfbcj2F9Ik=;
	h=From:To:Subject:Date;
	b=NxMCZj63vumxkv9caECXAujZlaeEIxMPKDtY5D4//v3+KdBQa+M8YOEgRcI62jH/H
	 QKpjIf90z7H6xOaf8GiJdt6SoenMzGo99b/fDxfh5sAlAW8nLYYWP75HZs0fWCersM
	 pHTVt1nDvhQkjHdT17buKo3YQSGzxWO/5uFa/T6ctxw6eS9xy3u3QblzzU+zUzUT31
	 fFUu9g/xdxnUH13ntGhv822cO3Qn4jKYKb54Lahk4kDZ9MqkVPNBAAG+z7OH+CMK8c
	 xz9IxAOxQkhryjT5kSkdTbtZimgJZWPjsHhprprR3IDuh2cVL3oqDi/ksDpy9UfvY5
	 sgcSaLpd2UyTQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 15:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129915

The recipe carried a patch that commented out the i18n.merge_file()
call for org.opensuse.cupspkhelper.mechanism.policy and installed the
untranslated template in its place, so the polkit dialogs showed
English strings only and the 43 translations shipped in po/ were
discarded.

The merge failed because meson hands the data_dirs argument to its
msgfmthelper script, which replaces GETTEXTDATADIRS instead of
extending it. That hides the ITS rules polkit installs into the target
sysroot, which msgfmt needs to recognize the translatable elements of
a policy file, and which gettext.bbclass already points at.
cups-pk-helper ships no ITS rules of its own, so the argument has no
purpose beyond breaking the merge.

Replace the patch with one that drops data_dirs and keeps the merge
enabled, and remove the manual install of the template.

Tested by rebuilding for corei7-64: the installed policy file now
carries description and message elements for all 43 languages.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nsuse.CupsPkHelper.Mechanism.service.patch | 26 -----------------
 .../dont-override-gettextdatadirs.patch       | 28 +++++++++++++++++++
 .../cups/cups-pk-helper_0.2.7.bb              |  7 +----
 3 files changed, 29 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-printing/cups/cups-pk-helper/dont-loc=
alize-org.opensuse.CupsPkHelper.Mechanism.service.patch
 create mode 100644 meta-oe/recipes-printing/cups/cups-pk-helper/dont-ove=
rride-gettextdatadirs.patch

diff --git a/meta-oe/recipes-printing/cups/cups-pk-helper/dont-localize-o=
rg.opensuse.CupsPkHelper.Mechanism.service.patch b/meta-oe/recipes-printi=
ng/cups/cups-pk-helper/dont-localize-org.opensuse.CupsPkHelper.Mechanism.=
service.patch
deleted file mode 100644
index 371ce01181..0000000000
--- a/meta-oe/recipes-printing/cups/cups-pk-helper/dont-localize-org.open=
suse.CupsPkHelper.Mechanism.service.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Pending
-
---- a/src/meson.build	2023-01-24 09:22:59.874074134 +0100
-+++ b/src/meson.build	2023-01-24 09:27:00.494627305 +0100
-@@ -73,12 +73,12 @@
-=20
-=20
- # Translate and install policy file
--i18n.merge_file (
--  input: 'org.opensuse.cupspkhelper.mechanism.policy.in',
--  output: 'org.opensuse.cupspkhelper.mechanism.policy',
--  type: 'xml',
--  data_dirs: join_paths (meson.source_root (), 'src'),
--  po_dir: join_paths (meson.source_root (), 'po'),
--  install: true,
--  install_dir: join_paths (prefix, datadir, 'polkit-1', 'actions')
--)
-+#i18n.merge_file (
-+#  input: 'org.opensuse.cupspkhelper.mechanism.policy.in',
-+#  output: 'org.opensuse.cupspkhelper.mechanism.policy',
-+#  type: 'xml',
-+#  data_dirs: join_paths (meson.source_root (), 'src'),
-+#  po_dir: join_paths (meson.source_root (), 'po'),
-+#  install: true,
-+#  install_dir: join_paths (prefix, datadir, 'polkit-1', 'actions')
-+#)
diff --git a/meta-oe/recipes-printing/cups/cups-pk-helper/dont-override-g=
ettextdatadirs.patch b/meta-oe/recipes-printing/cups/cups-pk-helper/dont-=
override-gettextdatadirs.patch
new file mode 100644
index 0000000000..0926b302e4
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-pk-helper/dont-override-gettextd=
atadirs.patch
@@ -0,0 +1,28 @@
+meson: don't override GETTEXTDATADIRS for the policy file
+
+The translatable strings of a polkit policy file are described by ITS
+rules that polkit installs as gettext data, so msgfmt only finds them
+when GETTEXTDATADIRS points at the directory holding polkit.its. In a
+cross build that directory lives in the target sysroot, and
+gettext.bbclass exports GETTEXTDATADIRS accordingly.
+
+meson passes the data_dirs argument of i18n.merge_file() to its
+msgfmthelper script, which replaces GETTEXTDATADIRS instead of
+extending it. cups-pk-helper ships no ITS rules of its own, so the
+argument only serves to hide polkit.its from msgfmt and make the merge
+fail. Drop it and rely on the environment.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code (Claude Opus 5)
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -77,7 +77,6 @@
+   input: 'org.opensuse.cupspkhelper.mechanism.policy.in',
+   output: 'org.opensuse.cupspkhelper.mechanism.policy',
+   type: 'xml',
+-  data_dirs: join_paths (meson.source_root (), 'src'),
+   po_dir: join_paths (meson.source_root (), 'po'),
+   install: true,
+   install_dir: join_paths (prefix, datadir, 'polkit-1', 'actions')
diff --git a/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb b/meta=
-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
index 81fdf2a7fb..8b2be55354 100644
--- a/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
+++ b/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
@@ -11,13 +11,8 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
 SRC_URI =3D " \
     https://www.freedesktop.org/software/cups-pk-helper/releases/cups-pk=
-helper-${PV}.tar.xz \
-    file://dont-localize-org.opensuse.CupsPkHelper.Mechanism.service.pat=
ch \
+    file://dont-override-gettextdatadirs.patch \
 "
 SRC_URI[sha256sum] =3D "66070ddb448fe9fcee76aa26be2ede5a80f85563e3a4afd5=
9d2bfd79fbe2e831"
=20
-do_install:append() {
-    install -d ${D}${datadir}/polkit-1/actions
-    install -m 644 ${S}/src/org.opensuse.cupspkhelper.mechanism.policy.i=
n ${D}${datadir}/polkit-1/actions/org.opensuse.cupspkhelper.mechanism.pol=
icy
-}
-
 FILES:${PN} +=3D "${datadir}"
--=20
2.55.0


