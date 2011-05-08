Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIu0k-0007uD-JR
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 04:46:22 +0200
Received: by yia13 with SMTP id 13so1671036yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 19:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=3EoLhPx5gwUjR4Psh+MXNFEsfd/lYcOPv1Yco/Wu+tc=;
	b=Q3lb5M3yP+wfGYFV/ZfNp89WXJlv/MSc4qgjlFR0KNxr+zVFjFBuuu5WlBaoWYWc88
	DenUzJu58vpjMghBwdLlmHDlMVt7JlHF+iyZG5gz4cpg2dT/4MkNW04dq1iO03lSEAds
	j95RyNM5TB964RWojxWDaOIY38vFgUi3WUYF0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=GzBEzicvYJnYgo8lXr1Xq25YUhNZSEeLXM5S0xFvKhXEXkb/imozXec+9EsRf2LoSL
	3hhtCysFyGW1nmuaLsLHZgTAFjOD3JuChxB61cYJ2MmUsnbJCYHw/WAdc/LKlUIH67iN
	i4jAiNs0yAi9lg1uKZZbPp3dMRbr+vl3AYkHs=
Received: by 10.91.69.37 with SMTP id w37mr4659099agk.196.1304822618660;
	Sat, 07 May 2011 19:43:38 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v1sm4837128anh.25.2011.05.07.19.43.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 19:43:37 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 02:43:01 +0000
Message-Id: <1304822586-14872-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
References: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 06/11] p910nd: add 0.95 version
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
X-List-Received-Date: Sun, 08 May 2011 02:46:22 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/p910nd/files/p910nd.init |   31 ++++++++++++++++++++++
 meta-oe/recipes-support/p910nd/p910nd_0.95.bb    |   30 +++++++++++++++++++++
 2 files changed, 61 insertions(+), 0 deletions(-)
 create mode 100755 meta-oe/recipes-support/p910nd/files/p910nd.init
 create mode 100644 meta-oe/recipes-support/p910nd/p910nd_0.95.bb

diff --git a/meta-oe/recipes-support/p910nd/files/p910nd.init b/meta-oe/recipes-support/p910nd/files/p910nd.init
new file mode 100755
index 0000000..a19c09e
--- /dev/null
+++ b/meta-oe/recipes-support/p910nd/files/p910nd.init
@@ -0,0 +1,31 @@
+#! /bin/sh
+
+test -f /usr/sbin/p910nd || exit 0
+
+test -d /var/spool/p910nd || mkdir -p /var/spool/p910nd
+
+case "$1" in
+  start)
+    echo -n "Starting p910nd printer daemon: p910nd"
+    /usr/sbin/p910nd -b -f /dev/usb/lp0 0
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping p910nd printer daemon: p910nd"
+    start-stop-daemon --stop --quiet --exec /usr/sbin/p9100d
+   echo "."
+    ;;
+  restart)
+    echo -n "Stopping p910nd printer daemon: p910nd"
+    start-stop-daemon --stop --quiet --exec /usr/sbin/p9100d
+    sleep 2
+    echo -n " ... Starting p910nd printer daemon: p910nd " 
+    /usr/sbin/p910nd -b -f /dev/usb/lp0 0
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/p910nd {start|stop|restart}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-oe/recipes-support/p910nd/p910nd_0.95.bb b/meta-oe/recipes-support/p910nd/p910nd_0.95.bb
new file mode 100644
index 0000000..8330c33
--- /dev/null
+++ b/meta-oe/recipes-support/p910nd/p910nd_0.95.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "A small network printer daemon for embedded situations that passes the job directly to the printer"
+SECTION = "console/utils"
+HOMEPAGE = "http://p910nd.sourceforge.net/"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+PR = "r0"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "p910nd"
+INITSCRIPT_PARAMS = "defaults 60 "
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/p910nd/p910nd-${PV}.tar.bz2 \
+           file://p910nd.init"
+
+SRC_URI[md5sum] = "c7ac6afdf7730ac8387a8e87198d4491"
+SRC_URI[sha256sum] = "7d78642c86dc247fbdef1ff85c56629dcdc6b2a457c786420299e284fffcb029"
+
+do_compile () {
+	${CC} ${LDFLAGS} -o p910nd p910nd.c
+}
+
+# The avahi stuff makes it work with bonjour printing
+do_install () {
+	install -D -m 0755 ${S}/p910nd ${D}${sbindir}/p910nd
+	install -D -m 0644 ${S}/p910nd.conf ${D}${sysconfdir}/p910nd.conf
+	install -D -m 0755 ${WORKDIR}/p910nd.init ${D}${sysconfdir}/init.d/p910nd
+}
-- 
1.7.2.5



