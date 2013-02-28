Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UAvC2-0002R9-86
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Feb 2013 05:34:34 +0100
Received: by mail-oa0-f46.google.com with SMTP id k1so2826811oag.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2013 20:17:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=VbeIvXoAN+Lkq+nUsS6F2Dop1B37spgmQMgtx22KTNU=;
	b=f1jwyYJv1IzznHdZ6n504JuTwnaXoqaIzxWE4FlyZkIWdOwy79cMQjdxG7tkG7Eauf
	wgc+JAOhKDpAlKc8gP/0pojx1VSrPojItoKJ4qTGmaoc2ALLs6DFJdocICSYoXi1rmf5
	MsrlQMoha0E6vuxt7T2EoL4CL0hJ2S4bDRVqiAUFG2EcbUfweYDMUowmgKmwxE8lddpx
	4z/T2kySPenxGv/2XAGWW+QY1gJFAmZBvvHRePTILiUKWkCDfHGh/56v2AIXobqAcUbT
	lbaCjiEoZVTqd6PoC9QtCoUeEOm4Yl26sPKe7sFqaiKRhTpFaGMP/qXHtTAm/coD+7EW
	MFwQ==
X-Received: by 10.182.146.13 with SMTP id sy13mr4538761obb.45.1362024586042;
	Wed, 27 Feb 2013 20:09:46 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id hc8sm4754212obc.8.2013.02.27.20.09.44
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 20:09:44 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Feb 2013 20:09:49 -0800
Message-Id: <1362024589-13995-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlAbhfC7n0eubEB5BHdBqYGmUJvLsbMqqq05DWv2Ze27xos359xS4A1dyZSaltXycqx+JYV
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
X-List-Received-Date: Thu, 28 Feb 2013 04:34:35 -0000

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



