Received: from mail-yh0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U8Fbf-0003xt-Va
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 20:45:32 +0100
Received: by mail-yh0-f47.google.com with SMTP id w68so1478177yhw.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 11:29:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=d7dYHtGwq1B6ZBW0rrea1ThN8N3wopMVvu8Nxf4Naho=;
	b=g9SYIi9eFpMrxa6XrKvvAuqOW1cYfgCnFCIXEsaFyXCglvuHIbo9VEvIhGNOZnXXOk
	/XNydj47PzAqexOfbayut1AhAgKhPGgqSC+JKatw3bB+/AJJ0i2gtcpzxAIcYxjo/cyu
	dzehLGHKfgx/Mcgom/R0ROYGqHMGB/bxHneQfnlHq3/MtNrdVy47aj8ZlT4qWMa2AWwl
	aeR68OtGe/VPwynocmOaZV/8Cps/sLhBa3xEhWWi8el1QZ37HGzTEpPyed01sQo9mmAL
	mcAihl4pPhSJeCrvXBEkO0oyURDfe6btCa/qY3TAznYt+tYJp0q6hEdREOrWHXs0amuV
	eyig==
X-Received: by 10.100.244.17 with SMTP id r17mr11666440anh.65.1361388560372;
	Wed, 20 Feb 2013 11:29:20 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id c10sm46011065ang.8.2013.02.20.11.29.18
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 11:29:19 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2013 11:29:15 -0800
Message-Id: <1361388555-28107-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkurPsU0TaklDvbSTz9l6/D9B0Dtp7MDQc9Yte7ZDte+RLO/Xh7GIhDPTI342FZievhGcXI
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
X-List-Received-Date: Wed, 20 Feb 2013 19:45:33 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

Fingerterm is a terminal emulator for Nokia Harmattan, but it works in any Qt4
environment.

This recipe can be extended by a .bbappend to add .desktop, icon and others to
the target device.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb |   27 +++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb

diff --git a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
new file mode 100644
index 0000000..e345131
--- /dev/null
+++ b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
@@ -0,0 +1,27 @@
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



