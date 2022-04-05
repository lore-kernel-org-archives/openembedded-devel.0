Return-Path: <stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D182C54F46
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web10.3907.1649149956943304133
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 02:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185,
 mailfrom: stefan@datenfreihafen.org)
Received: from localhost.localdomain.datenfreihafen.local
 (p200300e9d721c7079954505100d3e401.dip0.t-ipconnect.de
 [IPv6:2003:e9:d721:c707:9954:5051:d3:e401])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@sostec.de)
	by proxima.lasnet.de (Postfix) with ESMTPSA id 41866C0E25;
	Tue,  5 Apr 2022 11:12:35 +0200 (CEST)
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Cc: Stefan Schmidt <stefan@datenfreihafen.org>,
	Stefan Schmidt <stefan.schmidt@huawei.com>
Subject: [meta-networking][PATCH v2 3/4] wpantund: add new recipe
Date: Tue,  5 Apr 2022 11:12:18 +0200
Message-Id: <20220405091219.1593707-3-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405091219.1593707-1-stefan@datenfreihafen.org>
References: <20220405091219.1593707-1-stefan@datenfreihafen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96423

From: Stefan Schmidt <stefan.schmidt@huawei.com>

Wpantund is part of the OpenThread project. It is used in a scenario
where the Thread radio operates as a network co-processor (NCP) that is
connected over SPI/UART/USB to the host.

The project itself is in maintenance-only mode right now as the NCP
architecture has been replaced with radio co-processor (RCP) which is
implemented directly in openthread and ot-br-posix. None the less there
might still be project and products out there using it.

Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
---
 .../openthread/wpantund_git.bb                | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/openthread/wpant=
und_git.bb

diff --git a/meta-networking/recipes-connectivity/openthread/wpantund_git=
.bb b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
new file mode 100644
index 000000000..d8baacbb3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openthread/wpantund_git.bb
@@ -0,0 +1,27 @@
+# SPDX-FileCopyrightText: Huawei Inc.
+#
+# SPDX-License-Identifier: Apache-2.0
+SUMMARY =3D "wpantund, Userspace WPAN Network Daemon"
+SECTION =3D "net"
+LICENSE =3D "Apache-2.0 & MIT & BSL-1.0 & BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De7820bc7f7d1638a6b54fc2e8d7fb=
103 \
+                    file://third_party/assert-macros/LICENSE;md5=3Dcbf35=
ecdc8161026afe4da2906fab204 \
+                    file://third_party/boost/LICENSE;md5=3De4224ccaecb14=
d942c71d31bef20d78c \
+                    file://third_party/fgetln/LICENSE;md5=3D389e03d2254e=
cad45d0d9bbdefef7129 \
+                    file://third_party/openthread/LICENSE;md5=3D543b6fe9=
0ec5901a683320a36390c65f \
+                    file://third_party/pt/LICENSE;md5=3Ddcd598b69cad786b=
eea33da7b1ae14b7 \
+                    "
+DEPENDS =3D "autoconf-archive dbus readline"
+SRCREV =3D "0fb1f57e4224e2df3e630e146702bfcf63fbf07a"
+PV =3D "0.07.01+git${SRCPV}"
+
+SRC_URI =3D "gitsm://github.com/openthread/wpantund.git;protocol=3Dhttps=
;branch=3Dmaster \
+           "
+
+S =3D "${WORKDIR}/git"
+
+inherit pkgconfig perlnative autotools
+
+# CVE-2020-8916 has been fixed in commit
+# 3f108441e23e033b936e85be5b6877dd0a1fbf1c which is included in the SRCR=
EV
+CVE_CHECK_IGNORE =3D "CVE-2020-8916"
--=20
2.35.1


