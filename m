Received: from mail-ob0-f172.google.com ([209.85.214.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UI4qV-0002Xr-Ai
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Mar 2013 23:17:31 +0100
Received: by mail-ob0-f172.google.com with SMTP id tb18so1004731obb.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Mar 2013 15:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=rXCP7gd69qPYQmLpLBCt4cu2hDnlSuhpbWZzSw8T7iY=;
	b=lcKP5FYkf7brUEv78lsFCIlDiCRAkqceCiD8LBh3ElVuOoS+Km7bGp5er1NUM7m///
	e7EkPfWlro4bR3zCXo23OMl53fxTt4Y5WoMuQa/Itqhs2jqf+RJmEMc07lTo54a+rpm+
	FIWMlEqmsDMVyJkrgmexyn8evbLcVZbupqsr5Wytn7pv52pkROBBWGvnzG0aQv9KptuM
	KnRyzL4s9+bp6Es47cLARwYy6w75jvdtswZE9Tn1JrTypeigtNhGaF8d+dYwiNE1x9Ly
	fH5UZtXRztzprNtXiIvY+uygbWzjzClmOjhU0xq3gs1zlSWiQqDe5cuMSOJ6N0XDNhv3
	5Uxg==
X-Received: by 10.182.156.103 with SMTP id wd7mr2622118obb.33.1363730436838;
	Tue, 19 Mar 2013 15:00:36 -0700 (PDT)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id bq8sm13451676obc.9.2013.03.19.15.00.35
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Mar 2013 15:00:35 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Mar 2013 15:00:33 -0700
Message-Id: <1363730433-8555-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmKMZAiIOxQ3WvtyP9pw5Bl/mT0YKec8xpX0Dv1SCdF3bFlhtUqWpz1A0t5lc+/a9o/b50B
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [meta-oe][PATCH v4] fingerterm: Added 1.0.2 recipe
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
X-List-Received-Date: Tue, 19 Mar 2013 22:17:33 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

Fingerterm is a terminal emulator for Nokia Harmattan, but it works in any Qt4
environment.

This recipe can be extended by a .bbappend to add .desktop, icon and others to
the target device.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb |   44 +++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb

diff --git a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
new file mode 100644
index 0000000..59533a4
--- /dev/null
+++ b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "A terminal emulator for Harmattan (Nokia N9/N950) with a custom \
+virtual keyboard and usability-enhancing features such as URL grabber, pan \
+gestures and customizable shortcut menu. Designed especially to be used with \
+screen and irssi."
+HOMEPAGE = "http://hqh.unlink.org/harmattan"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+SECTION = "qt/app"
+
+PR = "r0"
+
+inherit qt4x11 pkgconfig
+
+SRC_URI = " \
+  http://hqh.unlink.org/harmattan/fingerterm-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "d53b0f463c025583cd52accf95715448"
+SRC_URI[sha256sum] = "c21a07cc411d09739bd7fa248eba2bf96427b3f032382a044b6674dd82d95150"
+
+S = "${WORKDIR}/${PN}"
+
+FILES_${PN} = " \
+  ${bindir}/${PN} \
+  ${datadir}/applications/${PN}.desktop \
+  ${datadir}/pixmaps/${PN}.png \
+"
+
+do_install() {
+  install -d ${D}${bindir}
+  install -m 0744 ${S}/${PN} ${D}${bindir}
+
+  sed -i -e '/Exec.*/d' fingerterm.desktop
+  sed -i -e '/Icon.*/d' fingerterm.desktop
+
+  echo 'Exec=${bindir}/${PN}' >> fingerterm.desktop
+  echo 'Icon=${PN}' >> fingerterm.desktop
+
+  install -d ${D}${datadir}/applications
+  install -m 0644 ${S}/${PN}.desktop ${D}${datadir}/applications
+
+  install -d ${D}${datadir}/pixmaps
+  install -m 0644 ${S}/${PN}.png ${D}${datadir}/pixmaps
+}
\ No newline at end of file
-- 
1.7.9.5



