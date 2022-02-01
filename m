Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BEEC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:35:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.51076.1643733316744130031
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6476711B3
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 106373F40C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:15 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/14] spice-protocol: upgrade to 1.14.3
Date: Tue,  1 Feb 2022 16:35:06 +0000
Message-Id: <20220201163507.1320861-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201163507.1320861-1-ross.burton@arm.com>
References: <20220201163507.1320861-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 16:35:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95198

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../spice/spice-protocol_1.14.3.bb            | 19 +++++++++++++
 .../spice/spice-protocol_git.bb               | 28 -------------------
 2 files changed, 19 insertions(+), 28 deletions(-)
 create mode 100644 meta-networking/recipes-support/spice/spice-protocol_=
1.14.3.bb
 delete mode 100644 meta-networking/recipes-support/spice/spice-protocol_=
git.bb

diff --git a/meta-networking/recipes-support/spice/spice-protocol_1.14.3.=
bb b/meta-networking/recipes-support/spice/spice-protocol_1.14.3.bb
new file mode 100644
index 0000000000..1ea606bb6d
--- /dev/null
+++ b/meta-networking/recipes-support/spice/spice-protocol_1.14.3.bb
@@ -0,0 +1,19 @@
+#
+# Copyright (C) 2013 Wind River Systems, Inc.
+#
+
+SUMMARY =3D "Simple Protocol for Independent Computing Environments (pro=
tocol definition"
+HOMEPAGE =3D "https://spice-space.org"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db37311cb5604f3e5cc2fb0fd23527=
e95"
+
+SRCREV =3D "90b57dace404db564a8e034ad4427b9951071bcd"
+
+SRC_URI =3D "git://gitlab.freedesktop.org/spice/spice-protocol.git;proto=
col=3Dhttps;branch=3Dmaster"
+
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-networking/recipes-support/spice/spice-protocol_git.bb =
b/meta-networking/recipes-support/spice/spice-protocol_git.bb
deleted file mode 100644
index ca683bf220..0000000000
--- a/meta-networking/recipes-support/spice/spice-protocol_git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-#
-# Copyright (C) 2013 Wind River Systems, Inc.
-#
-
-SUMMARY =3D "Simple Protocol for Independent Computing Environments"
-DESCRIPTION =3D "SPICE (the Simple Protocol for Independent Computing \
-Environments) is a remote-display system built for virtual \
-environments which allows users to view a computing 'desktop' \=20
-environment - not only on its computer-server machine, but also from \
-anywhere on the Internet and using a wide variety of machine \
-architectures."
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db37311cb5604f3e5cc2fb0fd23527=
e95"
-
-PV =3D "0.14.1+git${SRCPV}"
-
-SRCREV =3D "e0ec178a72aa33e307ee5ac02b63bf336da921a5"
-
-SRC_URI =3D " \
-    git://anongit.freedesktop.org/spice/spice-protocol;branch=3Dmaster \
-"
-
-S =3D "${WORKDIR}/git"
-
-inherit autotools gettext pkgconfig
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


