Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 32E6E7163F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 07:14:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44791994"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Dec 2014 15:11:18 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBA7EEhm012244
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 15:14:14 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 10 Dec 2014 15:14:43 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Dec 2014 15:14:24 +0800
Message-ID: <1418195664-2742-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20141209101837.GC2470@jama>
References: <20141209101837.GC2470@jama>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-oe][PATCH v2] logwatch: Add new recipe
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
X-List-Received-Date: Wed, 10 Dec 2014 07:14:45 -0000
Content-Type: text/plain

Logwatch is a customizable, pluggable log-monitoring system. It will go
through your logs for a given period of time and make a report in the areas
that you wish with the detail that you wish. Easy to use - works right out of
the package on many systems.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../recipes-extended/logwatch/logwatch_7.4.1.bb    | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb
new file mode 100644
index 0000000..650d6f8
--- /dev/null
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.4.1.bb
@@ -0,0 +1,58 @@
+SUMMARY = "A log file analysis program"
+DESCRIPTION = "\
+Logwatch is a customizable, pluggable log-monitoring system. It will go \
+through your logs for a given period of time and make a report in the areas \
+that you wish with the detail that you wish. Easy to use - works right out of \
+the package on many systems.\
+"
+SECTION = "devel"
+HOMEPAGE = "http://www.logwatch.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f2566bb12b16d2d80d90ebc533261aa7"
+RDEPENDS_${PN} = "perl"
+
+SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BP}/${BP}.tar.gz"
+SRC_URI[md5sum] = "a0c3d8721f877bdcd4a9089eb1b4691b"
+SRC_URI[sha256sum] = "35ec31f9fe981aaa727b144ab3ff2eb655997d8ccabaf66586458f5dfc3a56eb"
+
+do_install() {
+    install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts
+    install -m 0755 -d ${D}${datadir}/logwatch/dist.conf/logfiles
+    install -m 0755 -d ${D}${datadir}/logwatch/dist.conf/services
+    install -m 0755 -d ${D}${localstatedir}/cache/logwatch
+    mv conf/ ${D}${datadir}/logwatch/default.conf
+    mv scripts/ ${D}${datadir}/logwatch/scripts
+    mv lib ${D}${datadir}/logwatch/lib
+
+    install -m 0755 -d ${D}${mandir}/man1
+    install -m 0755 -d ${D}${mandir}/man5
+    install -m 0755 -d ${D}${mandir}/man8
+    install -m 0644 amavis-logwatch.1 ${D}${mandir}/man1
+    install -m 0644 postfix-logwatch.1 ${D}${mandir}/man1
+    install -m 0644 ignore.conf.5 ${D}${mandir}/man5
+    install -m 0644 override.conf.5 ${D}${mandir}/man5
+    install -m 0644 logwatch.conf.5 ${D}${mandir}/man5
+    install -m 0644 logwatch.8 ${D}${mandir}/man8
+
+    install -m 0755 -d ${D}${sysconfdir}/cron.daily
+    install -m 0755 -d ${D}${sbindir}
+    ln -sf ../..${datadir}/logwatch/scripts/logwatch.pl ${D}${sysconfdir}/cron.daily/0logwatch
+    ln -sf ../..${datadir}/logwatch/scripts/logwatch.pl ${D}${sbindir}/logwatch
+    cat > ${D}${sysconfdir}/cron.daily/0logwatch <<EOF
+    DailyReport=\`grep -e "^[[:space:]]*DailyReport[[:space:]]*=[[:space:]]*" /usr/share/logwatch/default.conf/logwatch.conf | head -n1 | sed -e "s|^\s*DailyReport\s*=\s*||"\`
+    if [ "\$DailyReport" != "No" ] && [ "\$DailyReport" != "no" ]
+    then
+            logwatch
+    fi
+EOF
+    chmod 755 ${D}${sysconfdir}/cron.daily/0logwatch
+
+    install -m 0755 -d ${D}${sysconfdir}/logwatch/conf/logfiles
+    install -m 0755 -d ${D}${sysconfdir}/logwatch/conf/services
+    touch ${D}${sysconfdir}/logwatch/conf/logwatch.conf
+    touch ${D}${sysconfdir}/logwatch/conf/ignore.conf
+    touch ${D}${sysconfdir}/logwatch/conf/override.conf
+    echo "# Local configuration options go here (defaults are in /usr/share/logwatch/default.conf/logwatch.conf)" > ${D}${sysconfdir}/logwatch/conf/logwatch.conf
+    echo "###### REGULAR EXPRESSIONS IN THIS FILE WILL BE TRIMMED FROM REPORT OUTPUT #####" > ${D}${sysconfdir}/logwatch/conf/ignore.conf
+    echo "# Configuration overrides for specific logfiles/services may be placed here." > ${D}${sysconfdir}/logwatch/conf/override.conf
+}
-- 
1.8.3.1


