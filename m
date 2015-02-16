Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AEC707352C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 03:20:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57701906"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Feb 2015 11:16:27 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1G3JEQg029295
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 11:19:14 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 16 Feb 2015 11:20:02 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Feb 2015 11:14:35 +0800
Message-ID: <1424056475-44818-3-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1424056475-44818-1-git-send-email-biannm@cn.fujitsu.com>
References: <1424056475-44818-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH 2/2] ipsec-tools: add systemd supported
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
X-List-Received-Date: Mon, 16 Feb 2015 03:20:02 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../recipes-support/ipsec-tools/ipsec-tools/racoon.conf   |  8 ++++++++
 .../ipsec-tools/ipsec-tools/racoon.service                | 11 +++++++++++
 .../recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb      | 15 ++++++++++++++-
 3 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.conf
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.service

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.conf b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.conf
new file mode 100644
index 0000000..6b50750
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.conf
@@ -0,0 +1,8 @@
+# Defaults for racoon service
+# sourced by racoon.service
+# installed at /etc/default/racoon by the maintainer scripts
+#
+# This is a POSIX shell fragment
+#
+# Arguments to pass to racoon
+RACOON_ARGS=""
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.service b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.service
new file mode 100644
index 0000000..a10e770
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/racoon.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Racoon IKEv1 key management daemon for IPSEC
+After=syslog.target network.target
+
+[Service]
+Type=forking
+EnvironmentFile=-@SYSCONFDIR@/default/racoon
+ExecStart=@SBINDIR@/racoon $RACOON_ARGS
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index 7519d83..9704b13 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -16,11 +16,13 @@ SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV
            file://glibc-2.20.patch \
            file://racoon-Resend-UPDATE-message-when-received-EINTR-message.patch \
            file://racoon.conf.sample \
+           file://racoon.conf \
+           file://racoon.service \
           "
 SRC_URI[md5sum] = "d53ec14a0a3ece64e09e5e34b3350b41"
 SRC_URI[sha256sum] = "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c9536792690564c74fe722f2d"
 
-inherit autotools
+inherit autotools systemd
 
 # Options:
 #  --enable-adminport      enable admin port
@@ -68,4 +70,15 @@ PACKAGECONFIG[selinux] = "--enable-security-context,--disable-security-context,l
 do_install_append() {
     install -d ${D}${sysconfdir}/racoon
     install -m 0644 ${WORKDIR}/racoon.conf.sample ${D}${sysconfdir}/racoon/racoon.conf
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/racoon.service ${D}${systemd_unitdir}/system
+
+        sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/racoon.service
+        sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/racoon.service
+
+        install -d ${D}${sysconfdir}/default/
+        install -m 0644 ${WORKDIR}/racoon.conf ${D}${sysconfdir}/default/racoon
+    fi
 }
-- 
1.9.1


