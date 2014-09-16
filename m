Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0D8236BBAB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 09:36:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8G9ai7o000808
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 02:36:44 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Sep 2014 02:36:43 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Sep 2014 17:36:36 +0800
Message-ID: <1410860196-30191-2-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1410860196-30191-1-git-send-email-Chong.Lu@windriver.com>
References: <1410860196-30191-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] postgresql: add systemd unit file
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
X-List-Received-Date: Tue, 16 Sep 2014 09:36:46 -0000
Content-Type: text/plain

Add systemd unit file for postgresql.
When 'sysvinit' and 'systemd' are both in DISTRO_FEATURES, we need to prevent
the init script from running via systemd.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../postgresql/files/postgresql.service            | 27 ++++++++++++++++++++++
 meta-oe/recipes-support/postgresql/postgresql.inc  | 22 +++++++++++++++++-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/postgresql/files/postgresql.service

diff --git a/meta-oe/recipes-support/postgresql/files/postgresql.service b/meta-oe/recipes-support/postgresql/files/postgresql.service
new file mode 100644
index 0000000..4ec959e
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/files/postgresql.service
@@ -0,0 +1,27 @@
+[Unit]
+Description=PostgreSQL database server
+After=network.target
+
+[Service]
+Type=forking
+User=postgres
+Group=postgres
+
+# Port number for server to listen on
+Environment=PGPORT=5432
+
+# Location of database directory
+Environment=PGDATA=/var/lib/postgresql/data
+
+# Disable OOM kill on the postmaster
+OOMScoreAdjust=-17
+
+ExecStart=@BINDIR@/pg_ctl start -D ${PGDATA} -s -o "-p ${PGPORT}" -w -t 300
+ExecStop=@BINDIR@/pg_ctl stop -D ${PGDATA} -s -m fast
+ExecReload=@BINDIR@/pg_ctl reload -D ${PGDATA} -s
+
+# Give a reasonable amount of time for the server to start up/shut down
+TimeoutSec=300
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 774c8fd..d45f4b5 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -30,6 +30,7 @@ SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
            file://postgresql.pam \
            file://0001-Use-pkg-config-for-libxml2-detection.patch \
            file://postgresql-setup \
+           file://postgresql.service \
 "
 
 LEAD_SONAME = "libpq.so"
@@ -37,7 +38,20 @@ LEAD_SONAME = "libpq.so"
 # LDFLAGS for shared libraries
 export LDFLAGS_SL = "${LDFLAGS}"
 
-inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d
+inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d systemd
+
+SYSTEMD_SERVICE_${PN} = "postgresql.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+
+DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-systemctl-native', '', d)}"
+pkg_postinst_${PN} () {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd sysvinit', 'true', 'false', d)}; then
+        if [ -n "$D" ]; then
+            OPTS="--root=$D"
+        fi
+        systemctl $OPTS mask postgresql-server.service
+    fi
+}
 
 enable_pam = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG ??= "${enable_pam} openssl python uuid libxml tcl nls libxml perl"
@@ -184,6 +198,12 @@ do_install_append() {
         install -d ${D}${sysconfdir}/pam.d
         install -m 644 ${WORKDIR}/postgresql.pam ${D}${sysconfdir}/pam.d/postgresql
     fi
+
+    # Install systemd unit files
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/postgresql.service ${D}${systemd_unitdir}/system
+    sed -i -e 's,@BINDIR@,${bindir},g' \
+        ${D}${systemd_unitdir}/system/postgresql.service
 }
 
 SSTATE_SCAN_FILES += "Makefile.global"
-- 
1.9.1


