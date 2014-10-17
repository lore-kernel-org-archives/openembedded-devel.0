Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 83F9560DD7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Oct 2014 06:37:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9H6bTPj029443
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 23:37:34 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 23:37:26 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Oct 2014 14:38:44 +0800
Message-ID: <1413527924-4092-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] radvd: fix daemon start-up
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
X-List-Received-Date: Fri, 17 Oct 2014 06:37:35 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

1. Fix radvd.service to start daemon correctly.
2. Make the daemon run under 'radvd' user by default.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-daemons/radvd/files/radvd.default | 1 +
 meta-networking/recipes-daemons/radvd/files/radvd.service | 5 +----
 meta-networking/recipes-daemons/radvd/radvd.inc           | 6 +++++-
 3 files changed, 7 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/radvd/files/radvd.default

diff --git a/meta-networking/recipes-daemons/radvd/files/radvd.default b/meta-networking/recipes-daemons/radvd/files/radvd.default
new file mode 100644
index 0000000..7cb73c7
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/files/radvd.default
@@ -0,0 +1 @@
+OPTIONS="-u radvd"
diff --git a/meta-networking/recipes-daemons/radvd/files/radvd.service b/meta-networking/recipes-daemons/radvd/files/radvd.service
index 3aac7b2..e60798a 100644
--- a/meta-networking/recipes-daemons/radvd/files/radvd.service
+++ b/meta-networking/recipes-daemons/radvd/files/radvd.service
@@ -4,11 +4,8 @@ After=network.target
 ConditionPathExists=@SYSCONFDIR@/radvd.conf
 
 [Service]
-Type=forking
-PIDFile=/var/run/radvd/radvd.pid
 EnvironmentFile=-@SYSCONFDIR@/default/radvd
-ExecStartPre=@BASE_BINDIR@/mkdir -p /var/run/radvd
-ExecStart=@SBINDIR@/radvd $OPTIONS
+ExecStart=@SBINDIR@/radvd -n $OPTIONS
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
index 85d1a85..6b595b0 100644
--- a/meta-networking/recipes-daemons/radvd/radvd.inc
+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
@@ -17,7 +17,8 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=73ebbf7182ae996e65e8fadc9a8c45db"
 SRC_URI = "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
            file://radvd.init \
            file://radvd.service \
-           file://volatiles.03_radvd"
+           file://volatiles.03_radvd \
+           file://radvd.default"
 
 inherit autotools update-rc.d useradd pkgconfig systemd
 
@@ -44,6 +45,9 @@ do_install_append () {
            -e 's#@SBINDIR@#${sbindir}#g' \
            -e 's#@BASE_BINDIR@#${base_bindir}#g' ${D}${systemd_unitdir}/system/radvd.service
 
+    # Install default environment file
+    install -m 0644 ${WORKDIR}/radvd.default ${D}${sysconfdir}/default/radvd
+
     # Documentation
     for i in radvd.conf.example README; do \
         install -m 0644 ${S}/$i ${D}${docdir}/radvd; \
-- 
1.9.1


