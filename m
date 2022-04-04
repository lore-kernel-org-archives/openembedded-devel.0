Return-Path: <stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92416C35280
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:41 +0000 (UTC)
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web12.34808.1649077452618164954
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 06:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185,
 mailfrom: stefan@datenfreihafen.org)
Received: from localhost.localdomain.datenfreihafen.local
 (p200300e9d74ad0b328e5b57aaa094595.dip0.t-ipconnect.de
 [IPv6:2003:e9:d74a:d0b3:28e5:b57a:aa09:4595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@sostec.de)
	by proxima.lasnet.de (Postfix) with ESMTPSA id 7417BC08B2;
	Mon,  4 Apr 2022 15:04:10 +0200 (CEST)
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Cc: Stefan Schmidt <stefan@datenfreihafen.org>,
	Stefan Schmidt <stefan.schmidt@huawei.com>
Subject: [meta-networking][PATCH 2/4] ot-daemon: add recipe for OpenThread
 daemon
Date: Mon,  4 Apr 2022 15:03:52 +0200
Message-Id: <20220404130354.2131131-2-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404130354.2131131-1-stefan@datenfreihafen.org>
References: <20220404130354.2131131-1-stefan@datenfreihafen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96379

From: Stefan Schmidt <stefan.schmidt@huawei.com>

The OpenThread daemon allows Linuxes devices to participate in a Thread
mesh network without acting as a full border router. The device
participates like any other child or router devices within the network.

This same repo is used for range of different modes to run the
OpenThread code. From bare metal over vendor SDKs to posix platforms.
For this recipe the focus is on the Linux posix implementation and we do
not pull in all the git submodules on purpose.

There are openthread enabled recipes in meta-zephyr for people who want
to also use OpenThread on MCU based platforms on top of Zephyr.

Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
---
 .../openthread/ot-daemon_git.bb               | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/openthread/ot-da=
emon_git.bb

diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon_gi=
t.bb b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
new file mode 100644
index 000000000..7bce46e22
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
@@ -0,0 +1,27 @@
+# SPDX-FileCopyrightText: Huawei Inc.
+#
+# SPDX-License-Identifier: Apache-2.0
+SUMMARY =3D "OpenThread Daemon is an OpenThread POSIX build mode that ru=
ns OpenThread as a service."
+SECTION =3D "net"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D543b6fe90ec5901a683320a36390c=
65f"
+DEPENDS =3D "readline"
+SRCREV =3D "7dfde1f12923f03c9680be4d838b94b7a2320324"
+PV =3D "0.1+git${SRCPV}"
+
+# We are not using the git submodules fetch on purpose. None the third_p=
arty
+# components are needed for the plain posix build and we can avoid all t=
he
+# differently licensed code.
+SRC_URI =3D "git://github.com/openthread/openthread.git;protocol=3Dhttps=
;branch=3Dmain \
+           "
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE =3D "-DOT_DAEMON=3DON \
+                 -DOT_SPINEL_RESET_CONNECTION=3DON \
+                 -DOT_THREAD_VERSION=3D1.2 \
+                 -DOT_COVERAGE=3DOFF \
+                 -DOT_PLATFORM=3Dposix \
+                 "
--=20
2.35.1


