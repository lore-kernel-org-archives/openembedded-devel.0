Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D556F60144
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2014 08:47:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8P8lsSF006934
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2014 01:47:54 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 25 Sep 2014 01:47:53 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Sep 2014 16:48:37 +0800
Message-ID: <1411634918-22497-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] smartmontools: fix for its SysV init script
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
X-List-Received-Date: Thu, 25 Sep 2014 08:47:56 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Changes include:
1. Make it run at runlevel 2, 3, 4 and 5 by default.
2. Add /etc/default/smartmontools, just as Ubuntu does.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../smartmontools/files/initd.smartd               |    8 ++++++--
 .../smartmontools/files/smartmontools.default      |    6 ++++++
 .../smartmontools/smartmontools_6.2.bb             |    5 ++++-
 3 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/smartmontools/files/smartmontools.default

diff --git a/meta-oe/recipes-extended/smartmontools/files/initd.smartd b/meta-oe/recipes-extended/smartmontools/files/initd.smartd
index 29c27e4..54adcb4 100755
--- a/meta-oe/recipes-extended/smartmontools/files/initd.smartd
+++ b/meta-oe/recipes-extended/smartmontools/files/initd.smartd
@@ -16,8 +16,8 @@
 # Should-Start:               sendmail
 # Required-Stop:              $syslog $remote_fs
 # Should-Stop:                sendmail
-# Default-Start:              
-# Default-Stop:	              0 1 2 3 4 5 6
+# Default-Start:              2 3 4 5
+# Default-Stop:               0 1 6
 # Short-Description:          Monitors disk and tape health via S.M.A.R.T.
 # Description:                Start S.M.A.R.T. disk and tape monitor.
 ### END INIT INFO
@@ -52,6 +52,10 @@ smartd_opts="--pidfile $SMARTDPID $smartd_opts"
 
 case "$1" in
 	start)
+		if [ "$start_smartd" != "yes" ]; then
+			[ "$VERBOSE" != "no" ] && echo "Not starting S.M.A.R.T. daemon smartd, disabled via /etc/default/smartmontools"
+			exit 0
+		fi
 		echo -n "Starting S.M.A.R.T. daemon: smartd"
 		if start-stop-daemon --start --quiet --pidfile $SMARTDPID \
 			--exec $SMARTD_BIN -- $smartd_opts; then
diff --git a/meta-oe/recipes-extended/smartmontools/files/smartmontools.default b/meta-oe/recipes-extended/smartmontools/files/smartmontools.default
new file mode 100644
index 0000000..602e00b
--- /dev/null
+++ b/meta-oe/recipes-extended/smartmontools/files/smartmontools.default
@@ -0,0 +1,6 @@
+# uncomment to start smartd on system startup for SysV init script
+# For systemd service file, use `systemctl enable smartd'.
+#start_smartd=yes
+
+# uncomment to pass additional options to smartd on startup
+#smartd_opts="--interval=1800"
diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
index 9b9454c..b64b961 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz \
            file://initd.smartd \
+           file://smartmontools.default \
           "
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'libcap-ng', 'libcap-ng', '', d)} \
@@ -31,9 +32,11 @@ do_install_append () {
 	#install the init.d/smartd
 	install -d ${D}${sysconfdir}/init.d
 	install -p -m 0755 ${WORKDIR}/initd.smartd ${D}${sysconfdir}/init.d/smartd
+	install -d ${D}${sysconfdir}/default
+	install -p -m 0644 ${WORKDIR}/smartmontools.default ${D}${sysconfdir}/default/smartmontools
 }
 
 INITSCRIPT_NAME = "smartd"
-INITSCRIPT_PARAMS = "start 60 . stop 60 0 1 2 3 4 5 6 ."
+INITSCRIPT_PARAMS = "start 60 2 3 4 5 . stop 60 0 1 6 ."
 
 RDEPENDS_${PN} += "mailx"
-- 
1.7.9.5


