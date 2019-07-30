Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A48F47F278
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 02:12:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,324,1559491200"; d="scan'208";a="72490933"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jul 2019 10:12:31 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 698744CDE93D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 10:12:33 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 10:12:33 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Jul 2019 10:11:48 +0800
Message-ID: <20190730021148.7932-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 698744CDE93D.A8829
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] syslog-ng: append syslog-ng.service
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
X-List-Received-Date: Tue, 30 Jul 2019 02:12:32 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Append syslog-ng.service.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index c183f05e0..b00cb91ee 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -86,6 +86,7 @@ do_install_append() {
 
         install -d ${D}${systemd_unitdir}/system/
         install -m 0644 ${S}/contrib/systemd/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@.service
+        install -m 0644 ${S}/${BPN}.service ${D}${systemd_unitdir}/system/${BPN}.service
         install -m 0644 ${S}/contrib/systemd/${BPN}@default ${D}${sysconfdir}/default/${BPN}@default
 
         sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
@@ -117,6 +118,7 @@ RPROVIDES_${PN}-dbg += "${PN}-libs-dbg"
 FILES_${PN}-libs = "${libdir}/${BPN}/*.so ${libdir}/libsyslog-ng-*.so*"
 FILES_${PN}-libs-dev = "${libdir}/${BPN}/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/libtest/*.a"
+FILES_${PN} += "${systemd_unitdir}/system/*.service"
 INSANE_SKIP_${PN}-libs = "dev-so"
 RDEPENDS_${PN} += "${PN}-libs"
 
-- 
2.20.1




