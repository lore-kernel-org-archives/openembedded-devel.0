Return-Path: <chen_heyun@163.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688B7C47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 13:08:27 +0000 (UTC)
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by mx.groups.io with SMTP id smtpd.web10.37137.1711544904078216004
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Mar 2024 06:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@163.com header.s=s110527 header.b=Sa02L3sO;
 spf=pass (domain: 163.com, ip: 45.254.50.219, mailfrom: chen_heyun@163.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=JHsXK
	LnGKcOVQ6Wt+yd/Rqp0dKi9vpTzpMdG/iRzWVE=; b=Sa02L3sON0ZGEhSe2ylwk
	4BKCltWA2whSO3QZB0oHHVDRlktm6XMJL+nj4+kvK7/RFew0QX+ySflz0V2+8/Yu
	AmXqJovrHd1bolz9ule+UlYGcQUy4z1UO1eABVXtoE0AVjq5uB40Mf1SNRMbsSNp
	zME97+WrbBgEztdnpM/nVI=
Received: from ubuntu.localdomain (unknown [119.86.40.242])
	by gzga-smtp-mta-g0-1 (Coremail) with SMTP id _____wD3f1g_GgRmNZNMCQ--.43515S2;
	Wed, 27 Mar 2024 21:08:15 +0800 (CST)
From: chenheyun <chen_heyun@163.com>
To: openembedded-devel@lists.openembedded.org,
	819869652@qq.com
Cc: chenheyun <chen_heyun@163.com>
Subject: [PATCH] [[meta-oe][PATCH]aer-inject:add new recipe]
Date: Wed, 27 Mar 2024 06:08:12 -0700
Message-Id: <20240327130812.556232-1-chen_heyun@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3f1g_GgRmNZNMCQ--.43515S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWkZryDtrWUtw4kXryDGFg_yoW8CFWkpa
	yfGws5Jr40q34fJ3Z3uFWUWFy5Wr95Ar1fG3W3ur1Sva4qvwn8Xw109Fy2kFsFkrZagr4U
	Aa1kXrsFk34fuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUHUfUUUUU=
X-Originating-IP: [119.86.40.242]
X-CM-SenderInfo: xfkh0spkh130i6rwjhhfrp/1tbiYwOuRmV4HYbDbgAAsj
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 13:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109642

aer-inject allows to inject PCIE AER errors on the software
level into a running Linux kernel. This is intended for validation of the
PCIE driver error recovery handler and CIE AER core handler.

References:
    https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/

Signed-off-by: chenheyun <chen_heyun@163.com>
---
 .../aer-inject/aer-inject_1.0.bb              | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb

diff --git a/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb b/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
new file mode 100644
index 000000000..fbc6bdfbe
--- /dev/null
+++ b/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Inject PCIE AER errors on the software level into a running Linux kernel."
+DESCRIPTION = "\
+aer-inject allows to inject PCIE AER errors on the software \
+level into a running Linux kernel. This is intended for \
+validation of the PCIE driver error recovery handler and \
+PCIE AER core handler."
+HOMEPAGE = "https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/"
+SECTION = "pcie/misc"
+LICENSE = "GPL-2.0-only"
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
+do_compile() {
+    oe_runmake CFLAGS="-Wall -D_GNU_SOURCE"
+}
+
+do_install() {
+    oe_runmake 'DESTDIR=${D}' 'PREFIX=/usr/' install
+}
+FILES:${PN} += "/usr/aer-inject"
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
-- 
2.25.1


