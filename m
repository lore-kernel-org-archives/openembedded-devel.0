Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TzUbe-0005te-5z
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jan 2013 16:57:24 +0100
Received: by mail-ea0-f176.google.com with SMTP id a13so838842eaa.35
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jan 2013 07:41:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=YKmExdHGTLc4r4bITGmsGeo/ZiABw+td1/Px7MCIkLY=;
	b=gBd75aYcw2jrvawI+lnFR25A+/7wI31noyuDpseR47duYPEp+vMKP2IFTUohPGNACd
	Wopc8A0Ue4MGIDOZE+5UEyzB7BG4fCYPhLw/xuPGXpYlzolfgmjrjDyD/d8u65yRD2Pb
	m2t85dwyilRq41wecGcfoH4IYULUTVrYE2SIhvxPivgv1NNfGUhmtGlsnNiN8zoiaeLZ
	zRWdwh7urXQXo8FOV8CGgKEXlhHblMHUtgWBoeXvfAO01Piq8OCCjYLbrv3nW1xqT5s+
	uH1gThWosxpkAElrZkXK64TY+93Osq+gRfHV5qfKS8blI34TIssi/WssYNt8x+1sEg+K
	H1VA==
X-Received: by 10.14.223.135 with SMTP id v7mr41892860eep.41.1359301300853;
	Sun, 27 Jan 2013 07:41:40 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id q5sm11876147eeo.17.2013.01.27.07.41.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 27 Jan 2013 07:41:39 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Jan 2013 16:41:16 +0100
Message-Id: <1359301282-5470-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
X-Gm-Message-State: ALoCoQnzdt0+gjUi7A8HHSkzzfNzGR4WeSTiTmx0L0N4H8ADDLg+ddu19taS4b+9LzK3TcdDXEvC
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 1/7] libebml: add 1.2.2
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
X-List-Received-Date: Sun, 27 Jan 2013 15:57:37 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-mkv/libebml/libebml_1.2.2.bb           | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb

diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb
new file mode 100644
index 0000000..210a409
--- /dev/null
+++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.2.2.bb
@@ -0,0 +1,31 @@
+SUMMARY = "libebml is a C++ libary to parse EBML files."
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=f14599a2f089f6ff8c97e2baa4e3d575"
+
+SRC_URI = "http://dl.matroska.org/downloads/libebml/libebml-${PV}.tar.bz2"
+SRC_URI[md5sum] = "726cc2bd1a525929ff35ff9854c0ebab"
+SRC_URI[sha256sum] = "476b08c6436a96c024a53e788e7c945ce9b41cd8654165763444aa7e5245b7a5"
+
+do_compile() {
+	cd ${S}/make/linux
+	oe_runmake CROSS="${TARGET_PREFIX}"
+}
+
+do_install() {
+	cd ${S}/make/linux
+
+	install -d ${D}${libdir}
+	install -m 0644 libebml.a ${D}${libdir}
+	install -m 0755 libebml.so.* ${D}${libdir}
+	cp -a libebml.so ${D}${libdir}
+
+	install -d ${D}${includedir}/ebml
+	for i in ../../ebml/*.h; do
+		install -m 0644 $i ${D}${includedir}/ebml
+	done
+
+	install -d ${D}${includedir}/ebml/c
+	for i in ../../ebml/c/*.h; do
+		install -m 0644 $i ${D}${includedir}/ebml/c
+	done
+}
-- 
1.8.1



