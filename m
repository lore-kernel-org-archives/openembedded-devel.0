Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 038DE60809
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 08:23:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8T8NudO007919
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 01:23:56 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 29 Sep 2014 01:23:55 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Sep 2014 16:22:54 +0800
Message-ID: <1411978974-17996-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] samba: add systemd service file
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
X-List-Received-Date: Mon, 29 Sep 2014 08:24:03 -0000
Content-Type: text/plain

Add systemd service for samba.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc       | 32 +++++++++++++++++++++-
 .../recipes-connectivity/samba/samba/nmb.service   | 12 ++++++++
 .../recipes-connectivity/samba/samba/smb.service   | 13 +++++++++
 .../samba/samba/winbind.service                    | 12 ++++++++
 4 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/samba/samba/nmb.service
 create mode 100644 meta-oe/recipes-connectivity/samba/samba/smb.service
 create mode 100644 meta-oe/recipes-connectivity/samba/samba/winbind.service

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index 3da0562..4392821 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -8,11 +8,18 @@ SRC_URI = "http://samba.org/samba/ftp/stable/samba-${PV}.tar.gz \
            file://init.samba \
            file://init.winbind \
            file://tdb.pc \
+           file://nmb.service \
+           file://smb.service \
+           file://winbind.service \
 "
 
 S = "${WORKDIR}/samba-${PV}/source"
 
-inherit autotools-brokensep update-rc.d
+inherit autotools-brokensep update-rc.d systemd
+
+SYSTEMD_PACKAGES = "${PN} winbind"
+SYSTEMD_SERVICE_${PN} = "nmb.service smb.service"
+SYSTEMD_SERVICE_winbind = "winbind.service"
 
 SAMBAMMAP = "no"
 SAMBAMMAP_libc-glibc = "yes"
@@ -103,6 +110,29 @@ do_install_append() {
 
     # usershare mount place
     mkdir -p ${D}${localstatedir}/lib/samba/usershares
+
+    # Remove sysinit script if sysvinit is not in DISTRO_FEATURES
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
+        rm -rf ${D}${sysconfdir}/init.d/
+    fi
+
+    install -d ${D}${systemd_unitdir}/system
+    for i in nmb smb winbind; do
+        install -m 0644 ${WORKDIR}/$i.service ${D}${systemd_unitdir}/system
+    done
+    sed -e 's,@BASE_BINDIR@,${base_bindir},g' \
+        -e 's,@SBINDIR@,${sbindir},g' \
+        -i ${D}${systemd_unitdir}/system/*.service
+}
+
+DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-systemctl-native', '', d)}"
+pkg_postinst_${PN} () {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd sysvinit', 'true', 'false', d)}; then
+        if [ -n "$D" ]; then
+            OPTS="--root=$D"
+        fi
+        systemctl $OPTS mask samba.service
+    fi
 }
 
 pkg_postinst_libnss-winbind () {
diff --git a/meta-oe/recipes-connectivity/samba/samba/nmb.service b/meta-oe/recipes-connectivity/samba/samba/nmb.service
new file mode 100644
index 0000000..91b9975
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba/nmb.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Samba NMB Daemon
+After=syslog.target network.target
+
+[Service]
+Type=forking
+PIDFile=/var/run/nmbd.pid
+ExecStart=@SBINDIR@/nmbd
+ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-connectivity/samba/samba/smb.service b/meta-oe/recipes-connectivity/samba/samba/smb.service
new file mode 100644
index 0000000..bc0707a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba/smb.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Samba SMB Daemon
+After=syslog.target network.target nmb.service winbind.service
+
+[Service]
+Type=forking
+PIDFile=/var/run/smbd.pid
+LimitNOFILE=16384
+ExecStart=@SBINDIR@/smbd
+ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-connectivity/samba/samba/winbind.service b/meta-oe/recipes-connectivity/samba/samba/winbind.service
new file mode 100644
index 0000000..bff6fb8
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba/winbind.service
@@ -0,0 +1,12 @@
+i[Unit]
+Description=Samba Winbind Daemon
+After=syslog.target network.target nmb.service
+
+[Service]
+Type=forking
+PIDFile=/var/run/winbindd.pid
+ExecStart=@SBINDIR@/winbindd
+ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
-- 
1.9.1


