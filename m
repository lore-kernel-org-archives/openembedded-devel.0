Return-Path: <chen_heyun@163.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28A2C47DD9
	for <webhook@archiver.kernel.org>; Sun, 24 Mar 2024 14:07:25 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by mx.groups.io with SMTP id smtpd.web11.29903.1711289235134112037
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Mar 2024 07:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@163.com header.s=s110527 header.b=R+GkpHY6;
 spf=pass (domain: 163.com, ip: 117.135.210.3, mailfrom: chen_heyun@163.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=0KPwL
	E8HCf134EaDTQLX/bMym7+HYIC297fura6Qplg=; b=R+GkpHY6DR26somr+EHhH
	Yntr2IV0grORtcsaAgIhk73XoijwX7wHwCdODfnjDgdldw7Now1E8WpRRzo56R6h
	3m/k+tznj3EET4DwBlSaQrrsC7ejgtNMbfe3p/OUp2mhLKFa0C+BpGR936WDSTVy
	2ehxIJUwNsKh/VPubGK9X0=
Received: from ubuntu.localdomain (unknown [119.86.40.242])
	by gzga-smtp-mta-g1-4 (Coremail) with SMTP id _____wDXP1mHMwBmKdfNBA--.22316S2;
	Sun, 24 Mar 2024 22:07:04 +0800 (CST)
From: chenheyun <chen_heyun@163.com>
To: openembedded-devel@lists.openembedded.org,
	819869652@qq.com
Cc: chenheyun <chen_heyun@163.com>
Subject: [[meta-oe][PATCH]aer-inject:add new recipe]  [[meta-oe][PATCH]aer-inject:add new recipe]
Date: Sun, 24 Mar 2024 07:06:59 -0700
Message-Id: <20240324140659.237067-1-chen_heyun@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXP1mHMwBmKdfNBA--.22316S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWkZryDtrW8Jry7JFWkWFg_yoW8Aw43pa
	yfGwn5Jr48t34fAanxuFWUWFy5Wr95Ar15W3W3uw1Svas09wn8Xw109Fy29FsFkrZagr4U
	Aw4kXrsFk3s3uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUHUfUUUUU=
X-Originating-IP: [119.86.40.242]
X-CM-SenderInfo: xfkh0spkh130i6rwjhhfrp/1tbiZRWrRmXAktjrpAABs8
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 14:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109565

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
index 000000000..4b1b5e093
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
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git;branch=master \
+"
+SRCREV = "9bd5e2c7886fca72f139cd8402488a2235957d41"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "bison-native"
+
+do_install() {
+    oe_runmake 'DESTDIR=${D}' install
+}
+FILES:${PN} += "/usr/local/aer-inject"
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
-- 
2.25.1


