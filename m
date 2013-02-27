Received: from mail-oa0-f54.google.com ([209.85.219.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UAl8O-0001Ax-O8
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Feb 2013 18:49:44 +0100
Received: by mail-oa0-f54.google.com with SMTP id n12so1689903oag.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2013 09:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=+3lY9oXmiR57JQrRCs6ONhtIZCqaSEUdPfNJ+ewSCLw=;
	b=cxKK1P9RbUxoxruEe5yKFbAVPsMrup95YsNyT/1DN6n5tf87J13bgBQliifVEd+Jad
	t0uHZn7nwx9hYgx/eK+Y3UxOnE9i1F5rVpzK8VW5njui0SsOsYP4ytZSMdFR6cMFxLsV
	QbgonHiBMgdyE3xz4LYPpdmtk23NpfqQShux3T9jONFTIizJVT84bDWpoNiNkhmkFqNF
	/Fq1jjC1wka3Mcf7IttQNX1ZoyxuuAD+XkCQioa0xU7UUGP2oDoTVaScIdPih8Yrsak/
	dTkd4V6VpVAFG76EVxKAMQupVjUg/c2iCEfNmhZXoGgzYv3ktMZA9wcDfrrDVe1gxLLm
	NEaA==
X-Received: by 10.60.18.136 with SMTP id w8mr3050650oed.84.1361986399163;
	Wed, 27 Feb 2013 09:33:19 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id j10sm8978196obg.4.2013.02.27.09.33.17
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 09:33:18 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Feb 2013 09:33:22 -0800
Message-Id: <1361986402-32739-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQklPFxFm7DFMYe5ZX+9fWoV5OEUJHLRYBOwmsbFwJviy/2PZWsbJb5OYpj3EqXbRJdOaF0f
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [meta-oe][PATCH] fingerterm: Added 1.0.2 recipe
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
X-List-Received-Date: Wed, 27 Feb 2013 17:49:46 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

Fingerterm is a terminal emulator for Nokia Harmattan, but it works in any Qt4
environment.

This recipe can be extended by a .bbappend to add .desktop, icon and others to
the target device.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb |   29 +++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb

diff --git a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
new file mode 100644
index 0000000..a900b97
--- /dev/null
+++ b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "A terminal emulator for Harmattan (Nokia N9/N950) with a custom \
+virtual keyboard and usability-enhancing features such as URL grabber, pan \
+gestures and customizable shortcut menu. Designed especially to be used with \
+screen and irssi."
+HOMEPAGE = "http://hqh.unlink.org/harmattan"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+SECTION = "qt/app"
+
+PR = "r0"
+
+inherit qt4x11 pkgconfig
+
+SRC_URI = " \
+  http://hqh.unlink.org/harmattan/fingerterm-${PV}.tar.gz \
+"
+SRC_URI[md5sum] = "d53b0f463c025583cd52accf95715448"
+SRC_URI[sha256sum] = "c21a07cc411d09739bd7fa248eba2bf96427b3f032382a044b6674dd82d95150"
+
+S = "${WORKDIR}/${PN}"
+
+FILES_${PN} = " \
+  ${bindir}/${PN} \
+"
+
+do_install() {
+  install -d ${D}${bindir}
+  install -m 0744 ${S}/${PN} ${D}${bindir}
+}
\ No newline at end of file
-- 
1.7.9.5



