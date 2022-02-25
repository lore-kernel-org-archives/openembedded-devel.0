Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D53C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 11:06:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5456.1645787192726059264
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 03:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EF40ED1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 03:06:31 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 496C53F5A1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 03:06:31 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] layer.conf: change layer priority to match oe-core
Date: Fri, 25 Feb 2022 11:06:27 +0000
Message-Id: <20220225110627.1716960-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Feb 2022 11:06:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95519

Layer priority is the ultimate decider of what recipe is used: if layer
A has recipe foo_1 and layer B has recipe foo_2, if layer A's priority
is higher than B then foo_1 will be used, even though the version in B
is higher, and even if PREFERRED_VERSION_foo is set to 2.

This complicates recipes moving between layers, for example when a newer
version of a recipe (say, python3-wheel) is taken from a layer with a
higher priority (say, meta-python) and moved to a layer with a lower
priority (say, oe-core) then it has to be removed before it is added:
there is no way to have it in both layers and work correctly.

Higher priorities are useful in distribution layers where you may want
to override specific recipes without any other fuss.  However as all of
the layers in meta-oe simply add more recipes in defined areas, there's
no need to have a higher layer priority.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-filesystems/conf/layer.conf | 2 +-
 meta-gnome/conf/layer.conf       | 2 +-
 meta-initramfs/conf/layer.conf   | 2 +-
 meta-multimedia/conf/layer.conf  | 2 +-
 meta-oe/conf/layer.conf          | 2 +-
 meta-perl/conf/layer.conf        | 2 +-
 meta-python/conf/layer.conf      | 2 +-
 meta-webserver/conf/layer.conf   | 2 +-
 meta-xfce/conf/layer.conf        | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/lay=
er.conf
index b5f59d9bac..75a27d6654 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
=20
 BBFILE_COLLECTIONS +=3D "filesystems-layer"
 BBFILE_PATTERN_filesystems-layer =3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_filesystems-layer =3D "6"
+BBFILE_PRIORITY_filesystems-layer =3D "5"
=20
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 3f6b4f7b76..2fb3485155 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -6,7 +6,7 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/re=
cipes-*/*/*.bbappend"
=20
 BBFILE_COLLECTIONS +=3D "gnome-layer"
 BBFILE_PATTERN_gnome-layer :=3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_gnome-layer =3D "7"
+BBFILE_PRIORITY_gnome-layer =3D "5"
=20
 # auto-pack gnome help files
 IMAGE_LINGUAS_COMPLEMENTARY:append =3D " ${@bb.utils.contains('DISTRO_FE=
ATURES','helpfiles','*-help-%s','',d)}"
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.c=
onf
index 33e61d333f..c63383faf7 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -13,7 +13,7 @@ BBFILE_PATTERN_meta-initramfs :=3D "^${LAYERDIR}/"
 # choosing carefully how this layer interacts with all of the
 # other layers.
=20
-BBFILE_PRIORITY_meta-initramfs =3D "8"
+BBFILE_PRIORITY_meta-initramfs =3D "5"
 LAYERDEPENDS_meta-initramfs =3D "core"
=20
 LAYERSERIES_COMPAT_meta-initramfs =3D "kirkstone"
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer=
.conf
index 1fe9c80330..b5120bb539 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -23,7 +23,7 @@ LICENSE_PATH +=3D "${LAYERDIR}/licenses"
 # choosing carefully how this layer interacts with all of the
 # other layers.
=20
-BBFILE_PRIORITY_multimedia-layer =3D "6"
+BBFILE_PRIORITY_multimedia-layer =3D "5"
=20
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 93f3dc5807..88715d5e82 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -21,7 +21,7 @@ BBFILE_PATTERN_openembedded-layer :=3D "^${LAYERDIR}/"
 # choosing carefully how this layer interacts with all of the
 # other layers.
=20
-BBFILE_PRIORITY_openembedded-layer =3D "6"
+BBFILE_PRIORITY_openembedded-layer =3D "5"
=20
 # only activates content when identified layers are present,
 # to ensure yocto compatibility check pass
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 4f075e9a92..3cb9571d41 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
=20
 BBFILE_COLLECTIONS +=3D "perl-layer"
 BBFILE_PATTERN_perl-layer :=3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_perl-layer =3D "6"
+BBFILE_PRIORITY_perl-layer =3D "5"
=20
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 98f734152f..e444498ff0 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -6,7 +6,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/rec=
ipes*/*/*.bbappend"
=20
 BBFILE_COLLECTIONS +=3D "meta-python"
 BBFILE_PATTERN_meta-python :=3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-python =3D "7"
+BBFILE_PRIORITY_meta-python =3D "5"
=20
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.c=
onf
index 312c39b3b3..5ae5e796ae 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/re=
cipes-*/*/*.bbappend"
=20
 BBFILE_COLLECTIONS +=3D "webserver"
 BBFILE_PATTERN_webserver :=3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_webserver =3D "6"
+BBFILE_PRIORITY_webserver =3D "5"
=20
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index be58708679..28dfc5b340 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -6,7 +6,7 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/re=
cipes-*/*/*.bbappend"
=20
 BBFILE_COLLECTIONS +=3D "xfce-layer"
 BBFILE_PATTERN_xfce-layer :=3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_xfce-layer =3D "7"
+BBFILE_PRIORITY_xfce-layer =3D "5"
=20
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
--=20
2.25.1


