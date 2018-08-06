Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 046C260116
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 02:19:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w762JfnW009138
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Aug 2018 19:19:41 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Sun, 5 Aug 2018 19:19:40 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Aug 2018 10:23:47 +0800
Message-ID: <1533522227-18078-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] rsyslog: add PACKAGECONFIG for imjournal
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
X-List-Received-Date: Mon, 06 Aug 2018 02:19:41 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add PACKAGECONFIG for imjournal, and add corresponding configuration
to /etc/rsyslog.d/imjournal.conf when it's enabled. Default to disable it.

This patch also enables rsyslog.conf to include configuration files
/etc/rsyslog.d/*.conf.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf | 5 +++++
 meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb    | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
index 324ae6d82..dbfefb759 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
@@ -84,3 +84,8 @@ $ActionQueueMaxDiskSpace 10m   # 1gb space limit (use as much as possible)
 # UDP Syslog Server:
 #$ModLoad imudp.so  # provides UDP syslog reception
 #$UDPServerRun 514 # start a UDP syslog server at standard port 514
+
+#
+# Include all config files in /etc/rsyslog.d/
+#
+$IncludeConfig /etc/rsyslog.d/*.conf
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
index d90695a60..13c1f56ee 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
@@ -67,6 +67,7 @@ PACKAGECONFIG[imfile] = "--enable-imfile,--disable-imfile,,"
 PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp,"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls,"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
+PACKAGECONFIG[imjournal] = "--enable-imjournal,--disable-imjournal,"
 PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
 PACKAGECONFIG[postgresql] = "--enable-pgsql,--disable-pgsql,postgresql,"
 PACKAGECONFIG[libdbi] = "--enable-libdbi,--disable-libdbi,libdbi,"
@@ -126,6 +127,11 @@ do_install_append() {
     install -m 644 ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
     install -m 644 ${WORKDIR}/rsyslog.logrotate ${D}${sysconfdir}/logrotate.d/logrotate.rsyslog
     sed -i -e "s#@BINDIR@#${bindir}#g" ${D}${sysconfdir}/logrotate.d/logrotate.rsyslog
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'imjournal', 'true', 'false', d)}; then
+        install -d 0755 ${D}${sysconfdir}/rsyslog.d
+        echo '$ModLoad imjournal' >> ${D}${sysconfdir}/rsyslog.d/imjournal.conf
+    fi
 }
 
 FILES_${PN} += "${bindir}"
-- 
2.11.0


