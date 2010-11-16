Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <harvey.tim@gmail.com>) id 1PIQcR-0006EU-19
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 19:51:05 +0100
Received: by pvd12 with SMTP id 12so309434pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 10:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=nZQSZ5xacEcJRrTXl0kCmVxy9XY3sT/8d/J7+u9BzRo=;
	b=o4XN1rskPQ4r1q01PBfrkb8DDDc2ovi+o8XdCF8d9fGIMfPh8VEdWk7VyrvgdtDfpx
	cwgnvSwr1G44Wm6gU6BP5pj6gOKhpHN9b4BpDtOvmGnUFmqEmJ0YLoxsdLXt/B/amBiJ
	umxSfQgklvFtrcQ26myTx7EGVJIFLQMOv7qXg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=LlSBGHtBnivQOZhts/zmbyfKYsqCLS3hM4hUci8Cc1ZRoKLipdO6iMMMLd8gjI/16x
	aD+U57QSFmZTvCeKU9lgcNkOg6BIKcNfMGf6HSWIqlELJ5PO1wtqkrDQb7M+QySTGOqw
	pzj7GRBoMUVMzJ+k5OmP7BhS/im26ctjfUnso=
Received: by 10.142.170.6 with SMTP id s6mr5663702wfe.348.1289933395347;
	Tue, 16 Nov 2010 10:49:55 -0800 (PST)
Received: from localhost.localdomain
	(adsl-76-205-222-173.dsl.snlo01.sbcglobal.net [76.205.222.173])
	by mx.google.com with ESMTPS id y42sm1708385wfd.22.2010.11.16.10.49.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 16 Nov 2010 10:49:54 -0800 (PST)
From: Tim Harvey <harvey.tim@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Nov 2010 10:49:47 -0800
Message-Id: <1289933387-8912-1-git-send-email-harvey.tim@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: harvey.tim@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3] nuttcp: new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Nov 2010 18:51:05 -0000

Signed-off-by: Tim Harvey <harvey.tim@gmail.com>
---
 recipes/nuttcp/nuttcp/nuttcpd.init |   33 +++++++++++++++++++++++++++++++++
 recipes/nuttcp/nuttcp_7.1.3.bb     |   26 ++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 0 deletions(-)
 create mode 100644 recipes/nuttcp/nuttcp/nuttcpd.init
 create mode 100644 recipes/nuttcp/nuttcp_7.1.3.bb

diff --git a/recipes/nuttcp/nuttcp/nuttcpd.init b/recipes/nuttcp/nuttcp/nuttcpd.init
new file mode 100644
index 0000000..7a46622
--- /dev/null
+++ b/recipes/nuttcp/nuttcp/nuttcpd.init
@@ -0,0 +1,33 @@
+#! /bin/sh
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/nuttcpd and type
+# > update-rc.d nuttcpd defaults 60
+#
+
+
+test -f /usr/sbin/nuttcp || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting nuttcp background daemon"
+    nuttcp -S
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping nuttcp background daemon"
+    killall nuttcp
+    echo "."
+    ;;
+  restart)
+    stop
+    sleep 1
+    start
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/nuttcpd {start|stop|restart}"
+    exit 1
+esac
+
+exit 0
diff --git a/recipes/nuttcp/nuttcp_7.1.3.bb b/recipes/nuttcp/nuttcp_7.1.3.bb
new file mode 100644
index 0000000..a3bcd31
--- /dev/null
+++ b/recipes/nuttcp/nuttcp_7.1.3.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "TCP/UDP network testing tool, much like iperf"
+HOMEPAGE = "http://www.wcisd.hpc.mil/nuttcp/Nuttcp-HOWTO.html"
+SECTION = "console/network"
+LICENSE = "GPLv2+"
+
+SRC_URI = "http://www.wcisd.hpc.mil/nuttcp/nuttcp-${PV}.c \
+        file://nuttcpd.init"
+SRC_URI[md5sum] = "e5f360f8a4cb8f85754ca8708612c4a3"
+SRC_URI[sha256sum] = "b8915040e576abe8678713fba01125dd246821f4b426e095e5c9bb2c559a2384"
+
+S = "${WORKDIR}"
+
+inherit update-rc.d
+
+do_compile() {
+        ${CC} ${LDFLAGS} nuttcp-${PV}.c -o nuttcp
+}
+do_install() {
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/nuttcpd.init ${D}${sysconfdir}/init.d/nuttcp
+        install -d ${D}${sbindir}
+        install -m 0755 nuttcp ${D}${sbindir}
+}
+
+INITSCRIPT_NAME = "nuttcp"
+INITSCRIPT_PARAMS = "defaults 60"
-- 
1.7.0.4



