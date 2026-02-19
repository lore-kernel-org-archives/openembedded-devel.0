Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26D2E9A05F
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 19:41:46 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.189.191.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22821.1771530099985394465
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 11:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=gQlzezop;
 spf=pass (domain: tafhub.de, ip: 5.189.191.204, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E15D1880265;
	Thu, 19 Feb 2026 20:41:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1771530097; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=3nFFT/uC59i6TBD5ndc77mVELq6RWs3CKgalHJojA/Q=;
	b=gQlzezopkc/5DYCmLjkPkgXSX4eDRskhlIO4VL0g+Ew8of23ztvNRgVp3ncYzgOHmQ/1Tz
	m4vxooheY6Q7KnwlSYGf3zSU8gJ1mKoPgDhR5rQ01KhlSDKhuXXaxg/6pGXhogpuiLIFNS
	VrC/aWfA8RtiC8DpkgOLXj2Kg2WE4L9IqxMrVw10pSP3gIy0rW59FRWo6E/TxqZ103lvz9
	knK/9t7WtKfuphLwnUcxP1O4v5Bd0gokdLm+eaHE+bGU/0AiR0biAQbF8A1nG3zYNKeR1T
	311P39CLA/zDcIL+E1guxqiNnbG9dAcVdSvTJ8NUQYvnEIhndt30yu2NkvXdWA==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-devel@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [meta-oe][scarthgap][PATCH] polkit: Backport switching PAM files to common-*
Date: Thu, 19 Feb 2026 20:40:30 +0100
Message-ID: <20260219194030.1691894-1-tafil@tafhub.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 19:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124514

This backports 9bdff5feb60994d4ed3a0123b9977c6c6643a242 which fixed [1].
The patch didn't make it back into scarthgap and had to be reapplied
for polkit 124.

[1]: https://github.com/openembedded/meta-openembedded/issues/860

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
---
 ...penembedded-OS-for-PAM-configuration.patch | 47 +++++++++++++++++++
 meta-oe/recipes-extended/polkit/polkit_124.bb |  5 ++
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/files/0001-meson-Supp=
ort-openembedded-OS-for-PAM-configuration.patch

diff --git a/meta-oe/recipes-extended/polkit/files/0001-meson-Support-ope=
nembedded-OS-for-PAM-configuration.patch b/meta-oe/recipes-extended/polki=
t/files/0001-meson-Support-openembedded-OS-for-PAM-configuration.patch
new file mode 100644
index 0000000000..26ec537daf
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/0001-meson-Support-openembedd=
ed-OS-for-PAM-configuration.patch
@@ -0,0 +1,47 @@
+From a318e9cb2beae02a2e23394ba200c4493dc0b53a Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Tue, 3 Sep 2024 12:17:42 +0200
+Subject: [PATCH] meson: Support "openembedded" OS for PAM configuration
+
+In Openembedded, same as Suse/Solaris: PAM files are common-*:
+* PAM_FILE_INCLUDE_AUTH: common-auth
+* PAM_FILE_INCLUDE_ACCOUNT: common-account
+* PAM_FILE_INCLUDE_PASSWORD: common-password
+* PAM_FILE_INCLUDE_SESSION: common-session
+
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+(cherry picked from commit 1d4f7f4d9f3d74fb2649c96faa8677416c1aefc2)
+
+Upstream-Status: Backport [https://github.com/polkit-org/polkit/commit/1=
d4f7f4d9f3d74fb2649c96faa8677416c1aefc2]
+Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
+---
+ meson.build       | 2 +-
+ meson_options.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 2f81c90..0ca1276 100644
+--- a/meson.build
++++ b/meson.build
+@@ -314,7 +314,7 @@ endif
+=20
+ pam_include =3D get_option('pam_include')
+ if pam_include =3D=3D ''
+-  if ['suse', 'solaris'].contains(os_type)
++  if ['suse', 'solaris', 'openembedded'].contains(os_type)
+     pam_conf =3D {
+       'PAM_FILE_INCLUDE_AUTH': 'common-auth',
+       'PAM_FILE_INCLUDE_ACCOUNT': 'common-account',
+diff --git a/meson_options.txt b/meson_options.txt
+index 71588ba..5af7e4c 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -6,7 +6,7 @@ option('polkitd_user', type: 'string', value: 'polkitd',=
 description: 'User for
+ option('polkitd_uid', type: 'string', value: '-', description: 'Fixed U=
ID for user running polkitd (polkitd)')
+=20
+ option('authfw', type: 'combo', choices: ['pam', 'shadow', 'bsdauth'], =
value: 'pam', description: 'Authentication framework (pam/shadow)')
+-option('os_type', type: 'combo', choices: ['redhat', 'suse', 'gentoo', =
'pardus', 'solaris', 'netbsd', 'lfs', ''], value: '', description: 'distr=
ibution or OS')
++option('os_type', type: 'combo', choices: ['redhat', 'suse', 'gentoo', =
'pardus', 'solaris', 'netbsd', 'lfs', 'openembedded', ''], value: '', des=
cription: 'distribution or OS')
+=20
+ option('pam_include', type: 'string', value: '', description: 'pam file=
 to include')
+ option('pam_module_dir', type: 'string', value: '', description: 'direc=
tory to install PAM security module')
diff --git a/meta-oe/recipes-extended/polkit/polkit_124.bb b/meta-oe/reci=
pes-extended/polkit/polkit_124.bb
index 3709aa0ef4..6cf75b920f 100644
--- a/meta-oe/recipes-extended/polkit/polkit_124.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_124.bb
@@ -8,6 +8,7 @@ BUGTRACKER =3D "https://github.com/polkit-org/polkit/issu=
es"
 SRC_URI =3D "\
      git://github.com/polkit-org/polkit.git;protocol=3Dhttps;branch=3Dma=
in \
      file://CVE-2025-7519.patch \
+	 file://0001-meson-Support-openembedded-OS-for-PAM-configuration.patch =
\
 "
=20
 S =3D "${WORKDIR}/git"
@@ -19,6 +20,10 @@ inherit meson pkgconfig useradd systemd gettext gobjec=
t-introspection features_c
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
+# Prevent meson.build to try to autodetect host OS (which could lead to
+# non-reproducibility)
+EXTRA_OEMESON =3D "-Dos_type=3Dopenembedded"
+
 PACKAGECONFIG =3D " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolek=
it', d)} \

