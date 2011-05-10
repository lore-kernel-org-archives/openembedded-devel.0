Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJlLx-0005rZ-82
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:43:49 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so4758860fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 04:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=7lAvgFWNWsPHmK17od0qIpgYeyHn9cYX9yRaD/1xRJg=;
	b=hlg6fg1e1eQN3rz7Y+Cr8dFRxqm/kVJ4anXG6b9IgGmwGUoR2EJG2loUt5E2vPRFka
	2TClIORHogBUP6H6Uv5iU8k6bgZH3+h3U2TY/Kk1YT3cFpgUScxd9ub0Pu2su+2bBsha
	6cm2VU1ISU0ahk7hnsgQzsTRxw6C6wxHCRV+w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=o6Q6pDJGPliIeHwq2+RiJEiobGvmqd0/faPH5zIONDvcgIwzUIto2uKEDPixl24KkR
	2YADsZBIJ6HI2oRUxEfXM35OgIux+QPrAPIZ1QNWaPpMyryu0fDqb/aOQ8tHGXxAMOy5
	Z24EAbRNS6I+VranvVm+C96as5jAHoxLHhtME=
Received: by 10.223.121.96 with SMTP id g32mr1322097far.0.1305027666159;
	Tue, 10 May 2011 04:41:06 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id j18sm2347932faa.18.2011.05.10.04.41.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 04:41:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 13:41:04 +0200
Message-Id: <7c7ac5651bf5e94017d138abbf19101ecd78c179.1305027503.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305027503.git.Martin.Jansa@gmail.com>
References: <cover.1305027503.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 8/9] connman: add recipe for the latest released version 0.73
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
X-List-Received-Date: Tue, 10 May 2011 11:43:49 -0000

From: Simon Busch <morphis@gravedo.de>

* MJ merged connman.inc changes from oe.dev with it

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 meta-oe/recipes-connectivity/connman/connman.inc   |    5 +++
 .../recipes-connectivity/connman/connman_0.73.bb   |   31 ++++++++++++++++++++
 2 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/connman/connman_0.73.bb

diff --git a/meta-oe/recipes-connectivity/connman/connman.inc b/meta-oe/recipes-connectivity/connman/connman.inc
index 69f91b3..f50526a 100644
--- a/meta-oe/recipes-connectivity/connman/connman.inc
+++ b/meta-oe/recipes-connectivity/connman/connman.inc
@@ -71,6 +71,11 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${libdir}/bonobo/servers \
             ${datadir}/dbus-1/system-services/*"
 
+# Package up systemd files
+FILES_${PN} += "${base_libdir}/systemd"
+# Needed when using DNS proxy feature
+RRECOMMENDS_${PN} += "dnsmasq-dbus"
+
 FILES_${PN}-test-utils += "${libdir}/connman/test/*"
 
 FILES_${PN}-scripts += "${libdir}/connman/scripts"
diff --git a/meta-oe/recipes-connectivity/connman/connman_0.73.bb b/meta-oe/recipes-connectivity/connman/connman_0.73.bb
new file mode 100644
index 0000000..103b5b6
--- /dev/null
+++ b/meta-oe/recipes-connectivity/connman/connman_0.73.bb
@@ -0,0 +1,31 @@
+require connman.inc
+# connman requires libXtables now
+DEPENDS += "iptables"
+PR = "r0"
+
+EXTRA_OECONF += "\
+  --disable-gtk-doc \
+  --enable-debug \
+  --enable-threads \
+  --enable-loopback \
+  --enable-ethernet \
+  --enable-wifi \
+  --disable-wimax \
+  --enable-bluetooth \
+  --enable-ofono \
+  --enable-resolvconf \
+  --enable-dnsproxy \
+  --enable-tools \
+  --disable-polkit \
+  --enable-client \
+  --enable-fake \
+"
+
+SRC_URI  = "\
+  http://www.kernel.org/pub/linux/network/connman/connman-${PV}.tar.gz \
+  file://link-against-libnl2.patch \
+  file://connman \
+"
+
+SRC_URI[md5sum] = "01085b2ed8f7b11a41724f1528720cc7"
+SRC_URI[sha256sum] = "b71ff2c3925ea82a7ebf818685f809e595d5c47d767005dfb149c6264b098417"
-- 
1.7.5.rc3



