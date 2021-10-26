Return-Path: <jk@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42589C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 02:40:06 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web12.6944.1635216004684546856
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 19:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: codeconstruct.com.au,
 ip: 203.29.241.158, mailfrom: jk@codeconstruct.com.au)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id BFD8D20297; Tue, 26 Oct 2021 10:39:59 +0800 (AWST)
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] mctp: Add MCTP control utilities
Date: Tue, 26 Oct 2021 10:39:50 +0800
Message-Id: <20211026023950.3389460-1-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 02:40:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93583

This change adds a recipe for the Management Component Transport
Protocol userspace utilities. This contains:

- the command-line 'mctp' tool, similar to 'ip', for setting up links,
  assigning local address and configuring routing.

- an optional 'mctpd' daemon, which implements the MCTP control
  protocol, and manages remote address assignment.

The latter depends on systemd (for sdbus), so use a
PACKAGECONFIG[systemd] for the conditional service installation.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 .../recipes-support/mctp/mctp_git.bb          | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-support/mctp/mctp_git.bb

diff --git a/meta-networking/recipes-support/mctp/mctp_git.bb b/meta-netw=
orking/recipes-support/mctp/mctp_git.bb
new file mode 100644
index 000000000..cab5d6c13
--- /dev/null
+++ b/meta-networking/recipes-support/mctp/mctp_git.bb
@@ -0,0 +1,31 @@
+SUMMARY =3D "Management Component Control Protocol utilities"
+HOMEPAGE =3D "http://www.github.com/CodeConstruct/mctp"
+SECTION =3D "net"
+LICENSE =3D "GPLv2"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
+
+SRCREV =3D "a8658290b7914f67146a982671b09f2270ba1654"
+
+SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain"
+
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig systemd
+
+PACKAGECONFIG ??=3D " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+"
+
+# mctpd will only be built if pkg-config detects libsystemd; in which ca=
se
+# we'll want to declare the dep and install the service.
+PACKAGECONFIG[systemd] =3D ",,systemd,libsystemd"
+SYSTEMD_SERVICE:${PN} =3D "mctpd.service"
+
+do_install:append () {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false',=
 d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${S}/conf/mctpd.service \
+                ${D}${systemd_system_unitdir}/mctpd.service
+    fi
+}
--=20
2.33.0


