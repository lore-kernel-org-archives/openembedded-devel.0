Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <harvey.tim@gmail.com>) id 1PH0rO-0007ua-6O
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 22:08:43 +0100
Received: by pxi17 with SMTP id 17so690517pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 13:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=zONDkXEYwcXyFxWU1YUiZi1pHyWcRlbVCwktOavnHrA=;
	b=dTVl9YzT6XaHC9mEkHcO9DPTPHB8NRrG+Lyu/FuhEdifDHhthhI7AZ1AuTiw9hVp91
	/CU5UJILwg3kw6sSI6oOznFV0aQmG/s/v/ok8xfDSTGSeCLGxSxuUhWyvKelreKx50nX
	2oVDIFs1mmJ/bEbVtovLBnCba23hDJyz2HAnY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=hEaQpRnFkNGRS6SRWN72kT6rR9QW7k43z7PFfZy+AyKwN6Rk+r11N3iLUvRDn+Vt7z
	eZLD3Lcx3cnN03vp0DHtwiNDUDc/EjG0jvBA65nEKXYozmIYX5AitNMuT+kTbJQ6ubsj
	GwUSiflt/LZr8puY9jym72xIT6EFMg1CSl1vA=
Received: by 10.142.158.16 with SMTP id g16mr2375559wfe.222.1289596056103;
	Fri, 12 Nov 2010 13:07:36 -0800 (PST)
Received: from localhost.localdomain
	(adsl-76-205-222-173.dsl.snlo01.sbcglobal.net [76.205.222.173])
	by mx.google.com with ESMTPS id w27sm2011122wfd.9.2010.11.12.13.07.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 12 Nov 2010 13:07:35 -0800 (PST)
From: Tim Harvey <harvey.tim@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Nov 2010 13:07:10 -0800
Message-Id: <1289596030-8386-1-git-send-email-harvey.tim@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: harvey.tim@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] nuttcp: new recipe
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
X-List-Received-Date: Fri, 12 Nov 2010 21:08:43 -0000

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
+LICENSE = "GPL"
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



