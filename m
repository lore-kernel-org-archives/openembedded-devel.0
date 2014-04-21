Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F349F65D2C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 06:21:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3L6LC66024850
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 23:21:12 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 20 Apr 2014 23:21:11 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Apr 2014 02:21:05 -0400
Message-ID: <7b5c97fb73b51a721e6c68da8c2f03b76931cb15.1398061002.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398061002.git.jackie.huang@windriver.com>
References: <cover.1398061002.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/4] rsyslog: add PACKAGECONFIG for optional features
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
X-List-Received-Date: Mon, 21 Apr 2014 06:21:13 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

rsyslog supports many optional features, add PACKAGECONFIG
for them to ensures that the dependency on related packages
is deterministic and so that we can easily enable/disable
features.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb |   34 +++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
index b1392e9..3801933 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
@@ -10,7 +10,6 @@ Rsyslog is an enhanced syslogd supporting, among others, MySQL,\
  very easy to setup for the novice user."
 
 DEPENDS = "zlib libestr json-c"
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3 & LGPLv3 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973 \
@@ -27,7 +26,38 @@ SRC_URI[sha256sum] = "276d094d1e4c62c770ec8a72723667f119eee038912b79cf3337d439bc
 
 inherit autotools pkgconfig systemd update-rc.d
 
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)} --enable-cached-man-pages"
+EXTRA_OECONF += "--enable-cached-man-pages"
+
+# first line is default yes in configure
+PACKAGECONFIG ??= " \
+    zlib rsyslogd rsyslogrt klog inet regexp uuid libgcrypt \
+    imdiag gnutls \
+    ${@base_contains('DISTRO_FEATURES', 'snmp', 'snmp', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+"
+
+# default yes in configure
+PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
+PACKAGECONFIG[rsyslogd] = "--enable-rsyslogd,--disable-rsyslogd,,"
+PACKAGECONFIG[rsyslogrt] = "--enable-rsyslogrt,--disable-rsyslogrt,,"
+PACKAGECONFIG[inet] = "--enable-inet,--disable-inet,,"
+PACKAGECONFIG[klog] = "--enable-klog,--disable-klog,,"
+PACKAGECONFIG[regexp] = "--enable-regexp,--disable-regexp,,"
+PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
+PACKAGECONFIG[libgcrypt] = "--enable-libgcrypt,--disable-libgcrypt,libgcrypt,"
+PACKAGECONFIG[testbench] = "--enable-testbench,--disable-testbench,,"
+
+# default no in configure
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
+PACKAGECONFIG[imdiag] = "--enable-imdiag,--disable-imdiag,,"
+PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp,"
+PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls,"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
+PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
+PACKAGECONFIG[postgresql] = "--enable-pgsql,--disable-pgsql,postgresql,"
+PACKAGECONFIG[libdbi] = "--enable-libdbi,--disable-libdbi,libdbi,"
+PACKAGECONFIG[mail] = "--enable-mail,--disable-mail,,"
+PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,,"
 
 do_install_append() {
     install -d "${D}${sysconfdir}/init.d"
-- 
1.7.9.5


