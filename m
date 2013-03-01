Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UBV5x-0007lC-3K
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Mar 2013 19:54:19 +0100
Received: by mail-oa0-f43.google.com with SMTP id l10so6194067oag.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2013 10:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=QBZmuDzw/PUumj7uQ2JK56qn5wZrHn34DyYc25vTq1A=;
	b=jfaUUHLZDnV/bu/fqA+tM3L8hk9CDWnEncmLOnNXHIqeDacd0oLjFJuhfitgmmiSSA
	lCgmajrD7dV82U1l5rFXn39Gh33LIZGVrzMtQ0bzVJhrVnjK17oI6/OtULFe06ThdUh9
	thU80WVtno0Uv3yTTuyFcRBw61NbQn2N1iRnbpup6wluIhH27UwQu4KyDQ3o62zRRyrJ
	GoBYdrCwQjCyY3lCgovh9H2NSDNBRf0Q1uo6CzFNPa1e/JStMjb19qqxhSjM64aY8lUG
	93ObmPjs5pF0wR06EB3QFUk7FdxOKyVHyoPpNmZC3h9tg2We9Hm9OTubbt+lUnLnbFTK
	Pw3g==
X-Received: by 10.182.185.37 with SMTP id ez5mr9384596obc.73.1362163068843;
	Fri, 01 Mar 2013 10:37:48 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id v3sm18796162oev.5.2013.03.01.10.37.47
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 10:37:48 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Mar 2013 10:37:46 -0800
Message-Id: <1362163066-376-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmEeX3Hd1UsP9ruwst0T1YBmtslHGvva5N3rB/8cJgb8xtU0CLb7dAmjs0W7X5rzCQ21MYL
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [meta-oe][PATCH v2] fingerterm: Added 1.0.2 recipe
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
X-List-Received-Date: Fri, 01 Mar 2013 18:54:26 -0000

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
index 0000000..e828672
--- /dev/null
+++ b/meta-oe/recipes-qt/fingerterm/fingerterm_1.0.2.bb
@@ -0,0 +1,30 @@
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



