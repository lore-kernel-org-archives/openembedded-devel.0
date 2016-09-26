Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC3C60103
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 02:24:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8Q2Odt3001456
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Sep 2016 19:24:39 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.294.0; Sun, 25 Sep 2016 19:24:38 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Sep 2016 10:24:28 +0800
Message-ID: <20160926022428.6682-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [meta-networking][PATCH] arptables: add arptables systemd service file
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
X-List-Received-Date: Mon, 26 Sep 2016 02:24:40 -0000
Content-Type: text/plain

Add arptables systemd service file.
If there isn't any configuration file (/etc/sysconfig/arptables),
add a default configuration file.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../arptables/arptables-0.0.3-4/arptables.service        | 16 ++++++++++++++++
 .../recipes-support/arptables/arptables_0.0.3-4.bb       | 10 ++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables.service

diff --git a/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables.service b/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables.service
new file mode 100644
index 0000000..fa64342
--- /dev/null
+++ b/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables.service
@@ -0,0 +1,16 @@
+[Unit]
+Description=Arp filtering arptables
+After=network.target
+Requires=network.target
+
+[Service]
+Type=oneshot
+ExecStartPre=/bin/sh -c "if [ ! -f /etc/sysconfig/arptables ]; then /usr/sbin/arptables-save > /etc/sysconfig/arptables; fi"
+ExecStart=/bin/sh -c "/usr/sbin/arptables-restore < /etc/sysconfig/arptables"
+ExecStartPost=/bin/sh -c "touch /var/lock/subsys/arptables"
+RemainAfterExit=yes
+ExecStop=/bin/sh -c "/usr/sbin/arptables-restore < /dev/null"
+ExecStopPost=/bin/sh -c "rm -f /var/lock/subsys/arptables"
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
index be2ac66..f536408 100644
--- a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
+++ b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     file://arptables-init-busybox.patch \
     file://arptables-arpt-get-target-fix.patch \
     file://arptables-remove-bashism.patch \
+    file://arptables.service \
 "
 SRC_URI[arptables.md5sum] = "1d4ab05761f063b0751645d8f2b8f8e5"
 SRC_URI[arptables.sha256sum] = "e529fd465c67d69ad335299a043516e6b38cdcd337a5ed21718413e96073f928"
@@ -31,3 +32,12 @@ PARALLEL_MAKEINST = "-j1"
 fakeroot do_install () {
     oe_runmake 'BINDIR=${sbindir}' 'MANDIR=${mandir}/' 'DESTDIR=${D}' install
 }
+
+do_install_append() {
+    install -d ${D}${systemd_unitdir}/system
+    install -m 644 ${WORKDIR}/arptables.service ${D}${systemd_unitdir}/system
+}
+
+inherit systemd
+
+SYSTEMD_SERVICE_${PN} = "arptables.service"
-- 
2.9.3


