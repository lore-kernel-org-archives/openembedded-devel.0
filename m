Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web10.35622.1615211697947901445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 05:54:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (unknown [81.20.119.6])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 4DCFB5FC11
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Mar 2021 14:54:55 +0100 (CET)
From: dwagenknecht@emlix.com
To: openembedded-devel@lists.openembedded.org
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>
Subject: [meta-gnome][PATCH] gnome-keyring: set file capabilities in pkg_postinst
Date: Mon,  8 Mar 2021 14:53:18 +0100
Message-Id: <20210308135318.1651724-1-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

file capabilities need to be set on gnome-keyring-daemon. This is now
possible using pkg_postinst function on the build host. Previous
workarounds are not needed anymore.

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---
 .../recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb   | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.=
bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
index 52c254b28..be6d922bc 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
@@ -43,9 +43,7 @@ FILES_${PN} +=3D " \
     ${libdir}/pkcs11/gnome-keyring-pkcs11.so \
 "
=20
-# fix | gnome-keyring-daemon: insufficient process capabilities, unsecur=
e memory might get used
-# This does not make it through pseudo so perform on-target - sigh
-pkg_postinst_ontarget_${PN} () {
-    setcap cap_ipc_lock+ep `which gnome-keyring-daemon`
+pkg_postinst_${PN} () {
+    setcap cap_ipc_lock+ep $D/${bindir}/gnome-keyring-daemon
 }
-RDEPENDS_${PN} +=3D "libcap-bin"
+PACKAGE_WRITE_DEPS +=3D "libcap-native"
--=20
2.25.1

