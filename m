Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C7317605BA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 06:17:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2U6HI9E017294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 23:17:19 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 29 Mar 2016 23:17:18 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Mar 2016 14:11:34 +0800
Message-ID: <1459318294-8974-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] minicoredumper: add the recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Mar 2016 06:17:19 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

minicoredumper provides an alternate core dump facility for Linux
to allow minimal and customized crash dumps

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../minicoredumper/files/minicoredumper.service    |  9 ++++++++
 .../minicoredumper/minicoredumper_1.0.2.bb         | 24 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
new file mode 100644
index 0000000..161ce88
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Enable minicoredumper.
+
+[Service]
+Type=oneshot
+ExecStart=/bin/sh -c '/bin/echo "|/usr/bin/minicoredumper %%p %%u %%g %%s %%t %%h %%e" > /proc/sys/kernel/core_pattern'
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb
new file mode 100644
index 0000000..6b55732
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb
@@ -0,0 +1,24 @@
+SUMMARY = "minicoredumper provides an alternate core dump facility for Linux \
+to allow minimal and customized crash dumps"
+LICENSE = " LGPLv2.1 & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=45445387350de96a0e70410470ee5cab"
+DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux"
+
+inherit autotools pkgconfig systemd
+
+SRC_URI = "https://linutronix.de/${BPN}/files/${BPN}-${PV}.tar.gz \
+           file://minicoredumper.service \
+"
+SRC_URI[md5sum] = "5ba9d116b52a8e2fb93456260644e753"
+SRC_URI[sha256sum] = "1b0eeb3d70dbd2ad6f2f673e4e3446e5dd784e132730e21d8f9dc0977e47dd9a"
+
+SYSTEMD_SERVICE_${PN} = "minicoredumper.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+do_install_append() {
+	install -d ${D}/${sysconfdir}/minicoredumper
+	cp -rf ${S}/etc/* ${D}/${sysconfdir}/
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/minicoredumper.service ${D}${systemd_unitdir}/system
+}
-- 
1.9.1


