Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7BE4760232
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 06:11:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="102545658"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Nov 2015 14:12:51 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id tA26A6ts013609
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 2 Nov 2015 14:10:06 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 2 Nov 2015 14:10:41 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Nov 2015 14:10:19 +0800
Message-ID: <1446444619-1677-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-networking][PATCH] opensaf: remove unused service file
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
X-List-Received-Date: Mon, 02 Nov 2015 06:11:20 -0000
Content-Type: text/plain

From: Li Xin <lixin.fnst@cn.fujitsu.com>

Upstream ships systemd service file plmcboot.service and plmcd.service now,
so we don't need this anymore.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-daemons/opensaf/opensaf/plmcboot.service      | 13 -------------
 .../recipes-daemons/opensaf/opensaf/plmcd.service         | 15 ---------------
 meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb  |  6 +-----
 3 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service b/meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service
deleted file mode 100644
index 76ec73a..0000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/plmcboot.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=PLMCBOOT Program
-After=network.target
-ConditionPathExists=@SYSCONFDIR@/plmcd.conf
-
-[Service]
-Type=oneshot
-ExecStart=@SBINDIR@/plmcd -c @SYSCONFDIR@/plmcd.conf -s
-ExecStop=@SBINDIR@/plmcd -c @SYSCONFDIR@/plmcd.conf -x
-RemainAfterExit=yes
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service b/meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service
deleted file mode 100644
index 1d48e77..0000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/plmcd.service
+++ /dev/null
@@ -1,15 +0,0 @@
-[Unit]
-Description=Plmcd Daemon
-Requires=plmcboot.service
-After=network.target plmcboot.service
-ConditionPathExists=@SYSCONFDIR@/plmcd.conf
-
-[Service]
-Type=forking
-ExecStart=@SBINDIR@/plmcd -c @SYSCONFDIR@/plmcd.conf
-ExecStartPost=/bin/touch /var/lock/subsys/plmcd
-ExecStopPost=/bin/rm -rf /var/lock/subsys/plmcd
-PIDFile=/var/run/plmcd.pid
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
index 28f4c00..9084524 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
@@ -15,8 +15,6 @@ inherit autotools useradd systemd pkgconfig
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://install-samples-from-srcdir.patch \
-           file://plmcd.service \
-           file://plmcboot.service \
            file://0001-plmcd-error-fix.patch \
            file://Revert_imma_client_node_replyPending_to_unsigned_char.patch \
            file://Fix_GCC_5.1.0_compiler_warning.patch \
@@ -65,8 +63,6 @@ do_install_append() {
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${B}/osaf/services/infrastructure/nid/config/opensafd.service \
         ${D}${systemd_unitdir}/system
-    install -m 644 ${WORKDIR}/plmc*.service ${D}/${systemd_unitdir}/system
-    sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/plmc*.service
-    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/plmc*.service
+    install -m 0644 ${B}/contrib/plmc/config/*.service ${D}/${systemd_unitdir}/system
 
 }
-- 
1.8.4.2


