Return-Path: <prvs=919dac7a6=Richard.Leitner@skidata.com>
X-Greylist: delayed 690 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 28 Apr 2016 12:42:08 UTC
Received: from mail2.skidata.com (mail2.skidata.com [80.120.57.43])
	by mail.openembedded.org (Postfix) with ESMTP id 92EE575E2D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 12:42:08 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CdBQAiAiJX/0oKEKxehAt9BqYjkTyEExqFdYF0AQEBAQEBgQ2FEwEtKIEWDgW/eQGLUgEBAQcghiGIcmKFCgWNVIVLhHGBVYQniB2CM4cchUCPMIJoGhaBN2oBhmh/AQEB
X-IPAS-Result: A2CdBQAiAiJX/0oKEKxehAt9BqYjkTyEExqFdYF0AQEBAQEBgQ2FEwEtKIEWDgW/eQGLUgEBAQcghiGIcmKFCgWNVIVLhHGBVYQniB2CM4cchUCPMIJoGhaBN2oBhmh/AQEB
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Apr 2016 14:30:39 +0200
Message-ID: <1461846639-9563-1-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
X-ClientProxiedBy: sdex1srv.skidata.net (172.16.10.92) To sdex1srv.skidata.net
	(172.16.10.92)
Subject: [meta-networking][PATCH][jethro] samba: fix smbd and nmbd paths in sysv initscript
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
X-List-Received-Date: Thu, 28 Apr 2016 12:42:12 -0000
Content-Type: text/plain

For the jethro branch.

The sysv initscript provided by samba assumes smbd and nmbd are
installed in /opt/samba/bin/. In our case both binaries are installed to
/usr/sbin/ by default. Therefore fix these paths.

Furthermore fix the name of the initscript in its usage text.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 .../samba-4.1.12/22-fix-sysv-init-script.patch     | 23 ++++++++++++++++++++++
 .../recipes-connectivity/samba/samba_4.1.12.bb     |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba-4.1.12/22-fix-sysv-init-script.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba-4.1.12/22-fix-sysv-init-script.patch b/meta-networking/recipes-connectivity/samba/samba-4.1.12/22-fix-sysv-init-script.patch
new file mode 100644
index 0000000..aec3262
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba-4.1.12/22-fix-sysv-init-script.patch
@@ -0,0 +1,23 @@
+--- a/packaging/sysv/samba.init
++++ b/packaging/sysv/samba.init
+@@ -21,17 +21,14 @@
+ case "$1" in
+ 
+ 'start')
+-#
+-# Edit these lines to suit your installation (paths, workgroup, host)
+-#
+-   /opt/samba/bin/smbd -D -s/opt/samba/smb.conf
+-   /opt/samba/bin/nmbd -D -l/opt/samba/log -s/opt/samba/smb.conf
++   /usr/sbin/smbd -D -s/etc/samba/smb.conf
++   /usr/sbin/nmbd -D -l/var/volatile/log/samba -s/etc/samba/smb.conf
+    ;;
+ 'stop')
+    killproc nmbd
+    killproc smbd
+    ;;
+ *)
+-   echo "Usage: /etc/init.d/samba.server { start | stop }"
++   echo "Usage: /etc/init.d/samba.sh { start | stop }"
+    ;;
+ esac
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index 863d783..a6c5935 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -34,6 +34,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://19-systemd-daemon-is-contained-by-libsystemd.patch \
            file://20-do-not-import-target-module-while-cross-compile.patch \
            file://21-add-config-option-without-valgrind.patch \
+           file://22-fix-sysv-init-script.patch \
           "
 
 SRC_URI[md5sum] = "232016d7581a1ba11e991ec2674553c4"
-- 
2.1.4


