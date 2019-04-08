Return-Path: <Liwei.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B19DF7D6BC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 08:28:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x388SlpH024186
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 8 Apr 2019 01:28:47 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 8 Apr 2019 01:28:41 -0700
From: Liwei Song <liwei.song@windriver.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Apr 2019 04:26:20 -0400
Message-ID: <1554711980-84676-1-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] ledmon: control hard disk led for RAID arrays
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
X-List-Received-Date: Mon, 08 Apr 2019 08:28:46 -0000
Content-Type: text/plain

Enable LED support for Intel Virtual RAID On CPU.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta-oe/recipes-bsp/ledmon/ledmon_git.bb | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/ledmon/ledmon_git.bb

diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
new file mode 100644
index 000000000000..14d70e51f5cc
--- /dev/null
+++ b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Intel(R) Enclosure LED Utilities"
+
+DESCRIPTION = "The utilities are designed primarily to be used on storage servers \
+ utilizing MD devices (aka Linux Software RAID) for RAID arrays.\
+"
+HOMEPAGE = "https://github.com/intel/ledmon"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+"
+
+DEPENDS = " systemd sg3-utils"
+
+inherit systemd
+
+SYSTEMD_SERVICE_${PN} = "ledmon.service"
+
+SRC_URI = "git://github.com/intel/ledmon;branch=master \
+"
+
+SRCREV = "ad1304ca1363d727425a1f23703c523e21feae4f"
+
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+
+S = "${WORKDIR}/git"
+EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
+
+do_install_append() {
+	install -d ${D}/${systemd_unitdir}/system
+	oe_runmake  DESTDIR=${D}  install
+	oe_runmake  DESTDIR=${D}${systemd_unitdir}/system  install-systemd
+}
-- 
2.7.4


