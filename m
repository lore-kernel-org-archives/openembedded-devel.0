Return-Path: <chen_heyun@163.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3BAC54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:54:43 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by mx.groups.io with SMTP id smtpd.web10.52759.1711374874582144267
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 06:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@163.com header.s=s110527 header.b=FdwDG0PH;
 spf=pass (domain: 163.com, ip: 220.197.31.2, mailfrom: chen_heyun@163.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=QBNTg
	p5/77H856sFw/qM+VhdIWFP5ym+aHTTx3WB/oA=; b=FdwDG0PHDq/KsrgJfVZ60
	iJ2uzxDXfd8mCc/x27PdlY1Od1cQp4AD5JOTh19bMODVeQOyEe45osUx49M8KzzJ
	pfuA0pUzyVg8Hf7smxtSPlAYMjfI+F8bt2r0sGXdmpoR0+4MxHgpf/g5raNWVFkJ
	MKWofEil23Rt25+bl7HCjM=
Received: from ubuntu.localdomain (unknown [119.86.40.242])
	by gzga-smtp-mta-g1-3 (Coremail) with SMTP id _____wBnblgSggFm6wb8Bw--.19028S2;
	Mon, 25 Mar 2024 21:54:27 +0800 (CST)
From: chenheyun <chen_heyun@163.com>
To: openembedded-devel@lists.openembedded.org,
	819869652@qq.com
Cc: chenheyun <chen_heyun@163.com>
Subject: [PATCH] [[meta-oe][PATCH]aer-inject:add new recipe]
Date: Mon, 25 Mar 2024 06:54:24 -0700
Message-Id: <20240325135424.279201-1-chen_heyun@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnblgSggFm6wb8Bw--.19028S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWkZryDtrW8Jry7JFWkWFg_yoW8Cr4kpa
	yfGwn5JrW8t34fA3Z3uFWUWFy5Wr95Ar15W3W7ur1Svas0vrn8Xw18uFy2kFsFkrZagr4U
	Aw4kXrsFk34fuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUHUfUUUUU=
X-Originating-IP: [119.86.40.242]
X-CM-SenderInfo: xfkh0spkh130i6rwjhhfrp/1tbiThasRmVOB6cmqwAAs0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 13:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109586

aer-inject allows to inject PCIE AER errors on the software
level into a running Linux kernel. This is intended for validation of the
PCIE driver error recovery handler and CIE AER core handler.

References:
    https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/

Signed-off-by: chenheyun <chen_heyun@163.com>
---
 .../aer-inject/aer-inject_1.0.bb              | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb

diff --git a/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb b/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
new file mode 100644
index 000000000..5d260567f
--- /dev/null
+++ b/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Inject PCIE AER errors on the software level into a running Linux kernel."
+DESCRIPTION = "\
+aer-inject allows to inject PCIE AER errors on the software \
+level into a running Linux kernel. This is intended for \
+validation of the PCIE driver error recovery handler and \
+PCIE AER core handler."
+HOMEPAGE = "https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/"
+SECTION = "pcie/misc"
+LICENSE = "GPL-2.0"
+
+LIC_FILES_CHKSUM = "file://README;beginline=25;endline=38;md5=643c2332ec702691a87ba6ea9499b2d6"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git;protocol=https;branch=master \
+"
+SRCREV = "9bd5e2c7886fca72f139cd8402488a2235957d41"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "bison-native"
+
+do_install() {
+    oe_runmake 'DESTDIR=${D}' 'PREFIX=/usr/' install
+}
+FILES:${PN} += "/usr/aer-inject"
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
-- 
2.25.1


