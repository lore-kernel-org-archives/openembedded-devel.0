Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF5872324
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 07:23:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44792591"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Dec 2014 15:20:23 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBA7NJKe013009
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 15:23:19 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 10 Dec 2014 15:23:49 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Dec 2014 15:23:32 +0800
Message-ID: <1418196212-12010-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20141209102344.GD2470@jama>
References: <20141209102344.GD2470@jama>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-oe][PATCH v2] logcheck: Add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Dec 2014 07:23:45 -0000
Content-Type: text/plain

Logcheck is a simple utility which is designed to allow a system administrator
to view the log-files which are produced upon hosts under their control.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../recipes-extended/logcheck/logcheck_1.3.17.bb   | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb

diff --git a/meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb b/meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb
new file mode 100644
index 0000000..ba4c2ab
--- /dev/null
+++ b/meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Analyzes log files and sends noticeable events as email"
+DESCRIPTION = "\
+Logcheck is a simple utility which is designed to allow a system administrator \
+to view the log-files which are produced upon hosts under their control. \
+It does this by mailing summaries of the log-files to them, after first \
+filtering out "normal" entries. \
+Normal entries are entries which match one of the many included regular \
+expression files contain in the database."
+SECTION = "Applications/System"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
+
+SRC_URI = "git://git.debian.org/git/logcheck/logcheck.git"
+SRCREV = "2429e67ad875fee8a0234c64d504277b038c89cd"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    # Fix QA Issue
+    sed -i '/install -d $(DESTDIR)\/var\/lock\/logcheck/s/^/#/' Makefile
+
+    # "make install" do not install the manpages. Install them manually.
+    install -m 755 -d ${D}${mandir}/man1
+    install -m 755 -d ${D}${mandir}/man8
+    install -m 644 docs/logcheck-test.1 ${D}${mandir}/man1/
+    install -m 644 docs/logtail.8 ${D}${mandir}/man8/
+    install -m 644 docs/logtail2.8 ${D}${mandir}/man8/
+    sed -i "s/syslog/messages/" etc/logcheck.logfiles
+    sed -i "s/auth\.log/secure/" etc/logcheck.logfiles
+    install -m 755 -d ${D}${sysconfdir}/cron.d
+    install -m 644 debian/logcheck.cron.d ${D}${sysconfdir}/cron.d/logcheck
+    install -m 755 -d ${D}/var/lib/logcheck
+    oe_runmake install DESTDIR=${D}
+}
+
+RDEPENDS_${PN} = "perl"
+
+FILES_${PN} += "${datadir}/logtail"
-- 
1.8.3.1


