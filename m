Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 439DD78268
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Dec 2017 06:05:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBT654Lb001936
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 22:05:04 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 28 Dec 2017 22:05:03 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Dec 2017 13:44:35 +0800
Message-ID: <20171229054435.31450-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH] corosync: add corosync.conf.example
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
X-List-Received-Date: Fri, 29 Dec 2017 06:05:04 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add corosync.conf.example as the template for
  /etc/corosync/corosync.conf to make the cluster
  works as the previous default config doesn't work
  as below output:

  root@host1:/# crm status
  Stack: unknown
  Current DC: NONE
  Last updated: Mon Dec 25 05:30:59 2017
  Last change: Mon Dec 25 05:30:32 2017 by root via cibadmin on host1

  0 nodes configured
  1 resource configured

  Full list of resources:

  WebSite	(ocf::heartbeat:apache):	Stopped

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../corosync/corosync/corosync.conf                | 58 ++++++++++++++++++++++
 .../recipes-extended/corosync/corosync_2.4.2.bb    |  2 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/corosync.conf

diff --git a/meta-networking/recipes-extended/corosync/corosync/corosync.conf b/meta-networking/recipes-extended/corosync/corosync/corosync.conf
new file mode 100644
index 000000000..e65b89426
--- /dev/null
+++ b/meta-networking/recipes-extended/corosync/corosync/corosync.conf
@@ -0,0 +1,58 @@
+# Starting point for cluster with pacemaker/openais
+compatibility: none
+
+corosync {
+	 user:  root
+	 group: root
+}
+
+aisexec {
+	with Pacemaker
+	user:  root
+	group: root
+}
+
+service {
+	name: pacemaker
+	ver: 1
+}
+
+totem {
+	version: 2
+	secauth: off
+	threads: 0
+	interface {
+		ringnumber: 0
+		# Cluster network address
+		bindnetaddr: 192.168.10.0
+		# Should be fine in most cases, don't forget to allow
+		# packets for this address/port in netfilter if there
+		# is restrictive policy set for cluster network
+		mcastaddr: 226.94.1.1
+		mcastport: 5405
+	}
+}
+
+logging {
+	fileline: off
+	to_stderr: no
+	to_logfile: yes
+	to_syslog: yes
+	logfile: /var/log/cluster/corosync.log
+	debug: off
+	timestamp: on
+	logger_subsys {
+		subsys: AMF
+		debug: off
+	}
+}
+
+amf {
+	mode: disabled
+}
+
+quorum {
+        # Quorum for the Pacemaker Cluster Resource Manager
+        provider: corosync_votequorum
+        expected_votes: 1
+}
diff --git a/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb b/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb
index 33e74e2ff..20dbcd8ab 100644
--- a/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb
@@ -9,6 +9,7 @@ inherit autotools pkgconfig systemd useradd
 
 SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz \
            file://0001-Include-fcntl.h-for-F_-and-O_-defines.patch \
+           file://corosync.conf \
           "
 SRC_URI[md5sum] = "547fa78704da53aa35912be58d31035f"
 SRC_URI[sha256sum] = "f26e3011309fe4bcce94b1dc20ea8c462f19483a73f3ca62f13b925d011a4ba9"
@@ -46,6 +47,7 @@ do_configure_prepend() {
 }
 
 do_install_append() {
+    install -D -m 0644 ${WORKDIR}/corosync.conf ${D}/${sysconfdir}/corosync/corosync.conf.example
     install -d ${D}${sysconfdir}/sysconfig/
     install -m 0644 ${S}/init/corosync.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync
     install -m 0644 ${S}/tools/corosync-notifyd.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync-notifyd
-- 
2.13.3


