Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A995FC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 14:29:15 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web08.48827.1643725753992442480
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 06:29:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44,
 mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 769699C01A4;
	Tue,  1 Feb 2022 09:29:12 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
 port 10032)
	with ESMTP id En7pT7enzQ6G; Tue,  1 Feb 2022 09:29:11 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 344059C027B;
	Tue,  1 Feb 2022 09:29:11 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
 port 10026)
	with ESMTP id UHyfnzT7zPqo; Tue,  1 Feb 2022 09:29:11 -0500 (EST)
Received: from localhost.localdomain (85-170-128-172.rev.numericable.fr
 [85.170.128.172])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 5F1659C01A4;
	Tue,  1 Feb 2022 09:29:10 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	joe@deserted.net,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [meta-networking][PATCH V2] mdio-tools: add recipes
Date: Tue,  1 Feb 2022 15:26:10 +0100
Message-Id: 
 <20220201142608.186135-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <94691>
References: <94691>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 14:29:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95184

Self-description from the README: mdio-tools is a low-level debug tool
for communicating with devices attached to an MDIO bus.

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirf=
airelinux.com>
---
 .../mdio-tools/mdio-netlink_1.0.1.bb                | 13 +++++++++++++
 .../recipes-support/mdio-tools/mdio-tools.inc       |  8 ++++++++
 .../recipes-support/mdio-tools/mdio-tools_1.0.1.bb  |  9 +++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-support/mdio-tools/mdio-netli=
nk_1.0.1.bb
 create mode 100644 meta-networking/recipes-support/mdio-tools/mdio-tools=
.inc
 create mode 100644 meta-networking/recipes-support/mdio-tools/mdio-tools=
_1.0.1.bb

diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.0.=
1.bb b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.0.1.bb
new file mode 100644
index 000000000..b50d33f90
--- /dev/null
+++ b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.0.1.bb
@@ -0,0 +1,13 @@
+require mdio-tools.inc
+
+DEPENDS +=3D "virtual/kernel libmnl"
+# This module requires Linux 5.6 higher
+
+S =3D "${WORKDIR}/git/kernel"
+
+inherit module
+
+EXTRA_OEMAKE =3D "KDIR=3D${STAGING_KERNEL_DIR}"
+MODULES_INSTALL_TARGET =3D "install"
+
+RPROVIDES:${PN} +=3D "kernel-module-mdio-netlink"
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc b/=
meta-networking/recipes-support/mdio-tools/mdio-tools.inc
new file mode 100644
index 000000000..bba8960d8
--- /dev/null
+++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
@@ -0,0 +1,8 @@
+DESCRIPTION =3D "A low-level debug tool for communicating with devices a=
ttached to an MDIO bus"
+SECTION =3D "networking"
+HOMEPAGE =3D "https://github.com/wkz/mdio-tools"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://${WORKDIR}/git/COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
+
+SRC_URI =3D "git://github.com/wkz/mdio-tools.git;protocol=3Dhttps;branch=
=3Dmaster"
+SRCREV =3D "b40809dd59aa199d8afc307e228b55eeae06b17e"
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools_1.0.1.=
bb b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.0.1.bb
new file mode 100644
index 000000000..cd4df3da0
--- /dev/null
+++ b/meta-networking/recipes-support/mdio-tools/mdio-tools_1.0.1.bb
@@ -0,0 +1,9 @@
+require mdio-tools.inc
+
+DEPENDS +=3D "libmnl"
+
+S =3D "${WORKDIR}/git"
+
+inherit pkgconfig autotools
+
+RDEPENDS:${PN} =3D "kernel-module-mdio-netlink"
--
2.25.1

