Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UFowW-0007uM-Jm
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:54:24 +0100
Received: by mail-oa0-f44.google.com with SMTP id h1so1320367oag.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=VbeIvXoAN+Lkq+nUsS6F2Dop1B37spgmQMgtx22KTNU=;
	b=URpsPRdvOr+Y9PXxtyurqox1MisKTdQ+leutdeirUpz4/B4f4Gg68E9uJUHpB1gAz0
	ldvldcBBcB9pqmZm3EEknThQn0eUvwmkLKu2dcdgNSPLjU7Zpc3UfRqGt6YPiAtDjrBg
	r0y+mV+0yaqM1iGQA9WRj99+MdP7A5CjDyPCQEg3rnK1TBHK82AyL3ffvCCdbKIvKDo9
	oOmtIjir9t0oCDaeLpq3jYgbbxG6JT/znGxpr0uFscaQi8kl0DSJH/pk5ootd2BGG4DT
	b+jDb+Wygm+wHb/5M9GW96NrplQIGsurALfn8hUJChgFB5rVQF13X7zrMMc024Xcj4q/
	C6/A==
X-Received: by 10.182.8.70 with SMTP id p6mr15995649oba.90.1363192659045;
	Wed, 13 Mar 2013 09:37:39 -0700 (PDT)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id a10sm24273377oez.1.2013.03.13.09.37.37
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:37:38 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Mar 2013 09:37:34 -0700
Message-Id: <1363192654-5856-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlJG/2cbWDyozkch1hvaEMAZQo3A4Xrev5kZ5yy0jsZ4mdLvRUM+AIr6HRISOus0vFoiSds
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [meta-oe][PATCH v3] fingerterm: Added 1.0.2 recipe
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
X-List-Received-Date: Wed, 13 Mar 2013 16:54:59 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

Fingerterm is a terminal emulator for Nokia Harmattan, but it works in any Qt4
environment.

This recipe can be extended by a .bbappend to add .desktop, icon and others to
the target device.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb |   30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb

diff --git a/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
new file mode 100644
index 0000000..7a0d0eb
--- /dev/null
+++ b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
@@ -0,0 +1,30 @@
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
+"
+
+do_install() {
+  install -d ${D}${bindir}
+  install -m 0744 ${S}/${PN} ${D}${bindir}
+}
\ No newline at end of file
-- 
1.7.9.5



