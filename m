Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQlYS-0007aA-Cv
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 21:21:40 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so2753022bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 12:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=nORm4L6qQaKV7OBNz0UvAoB0tsKHwgducqb//cFtwrU=;
	b=rm5b52Ey6AIoeas4DA9ZRNWa89YKAeWePNxdpEi6rnizcs94kAy7u7gmbceyT1qN6D
	/orAg3HCSbXEK7/4BijTVnryOA4g0mmZeXdgpy4PnSkQZk7JDO/gdppOqU/EbcfxlQoH
	AJ6U00iw5pP856xOmZayDyEm14cwGRQ4II2pw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=iS7z5Fna4GFZOFf4Od1L/nX/dKMnv11edV5V3t5l3gBKe/F7NfioD4PWcQsIHRFMZF
	Vv3y5mILqAUYo9hg6G1rcUY10GKfCd2EL0WXElfnfRUy2uHI6Cr+7scqApuO9mOmZqhM
	HDJCzi/7xgiMeaA/kdQeC0VnVlTN/fUskRs0g=
Received: by 10.204.7.209 with SMTP id e17mr1204295bke.162.1306696714563;
	Sun, 29 May 2011 12:18:34 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 5sm340329faz.2.2011.05.29.12.18.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 12:18:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 21:17:25 +0200
Message-Id: <0808f66c3fbde87c3c62c359614c0e5194a30d7b.1306696348.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
References: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306696348.git.Martin.Jansa@gmail.com>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 15/16] espeak: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 19:21:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/espeak/espeak-data_1.37.bb |   27 +++++++++++++
 meta-oe/recipes-support/espeak/espeak.inc          |   10 +++++
 meta-oe/recipes-support/espeak/espeak_1.37.bb      |   42 ++++++++++++++++++++
 3 files changed, 79 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/espeak/espeak-data_1.37.bb
 create mode 100644 meta-oe/recipes-support/espeak/espeak.inc
 create mode 100644 meta-oe/recipes-support/espeak/espeak_1.37.bb

diff --git a/meta-oe/recipes-support/espeak/espeak-data_1.37.bb b/meta-oe/recipes-support/espeak/espeak-data_1.37.bb
new file mode 100644
index 0000000..d15d496
--- /dev/null
+++ b/meta-oe/recipes-support/espeak/espeak-data_1.37.bb
@@ -0,0 +1,27 @@
+require espeak.inc
+
+inherit native
+
+PACKAGES = "${PN}"
+FILES_${PN} = "${layout_datadir}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+TARGET_ARCH = "${MACHINE_ARCH}"
+
+do_compile() {
+        # Fixing byte order of phoneme data files
+        cd "${S}/platforms/big_endian"
+        sed -i '/^ *CC *=/d' Makefile
+        sed -i 's/\(.*BYTE_ORDER\)/#undef BYTE_ORDER\n#define BYTE_ORDER BIG_ENDIAN\n\1/' espeak-phoneme-data.c
+        oe_runmake
+        ./espeak-phoneme-data "${S}/espeak-data"
+        cp -f phondata phonindex phontab "${S}/espeak-data"
+}
+
+do_install() {
+        install -d ${D}${layout_datadir}/espeak-data
+        install -m 0644 ${S}/espeak-data/phon* ${D}${layout_datadir}/espeak-data
+}
+
+SRC_URI[md5sum] = "5c7b292d0537232868b4ac1317d76c02"
+SRC_URI[sha256sum] = "77f406c345362185ec4f362bf49f61d202e01ac9b9cd5c14f803195a544ce6d3"
diff --git a/meta-oe/recipes-support/espeak/espeak.inc b/meta-oe/recipes-support/espeak/espeak.inc
new file mode 100644
index 0000000..98a1765
--- /dev/null
+++ b/meta-oe/recipes-support/espeak/espeak.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "eSpeak is a compact open source software speech synthesizer"
+SECTION = "base"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://License.txt;md5=cb7a20edb4c9f5f478de6523dcd7362c"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/espeak/espeak-${PV}-source.zip"
+
+S = "${WORKDIR}/espeak-${PV}-source"
+
+DEPENDS = "portaudio-v19"
diff --git a/meta-oe/recipes-support/espeak/espeak_1.37.bb b/meta-oe/recipes-support/espeak/espeak_1.37.bb
new file mode 100644
index 0000000..6cc4cd4
--- /dev/null
+++ b/meta-oe/recipes-support/espeak/espeak_1.37.bb
@@ -0,0 +1,42 @@
+require espeak.inc
+inherit siteinfo
+
+EXTRA_PHONEMES = '${@base_contains("SITEINFO_ENDIANNESS", "be",  "espeak-data (= ${PV})", "", d)}'
+RDEPENDS_${PN} = "portaudio-v19 ${EXTRA_PHONEMES}"
+
+SRC_URI[md5sum] = "5c7b292d0537232868b4ac1317d76c02"
+SRC_URI[sha256sum] = "77f406c345362185ec4f362bf49f61d202e01ac9b9cd5c14f803195a544ce6d3"
+
+CXXFLAGS += "-DUSE_PORTAUDIO"
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+FILES_${PN} += "${datadir}/espeak-data"
+
+do_configure() {
+       #  "speak" binary, a TTS engine, uses portaudio in either APIs V18 or V19, use V19
+       cp "${S}/src/portaudio19.h" "${S}/src/portaudio.h"
+}
+
+do_compile() {
+       cd src
+       oe_runmake
+}
+
+do_install() {
+        install -d ${D}${bindir}
+        install -d ${D}${libdir}
+        install -d ${D}${includedir}
+        install -d ${D}${datadir}/espeak-data
+
+        # we do not ship "speak" binary though.
+        install -m 0755 ${S}/src/espeak ${D}${bindir}
+        install -m 0644 ${S}/src/speak_lib.h ${D}${includedir}
+        oe_libinstall -so -C src libespeak ${D}${libdir}
+
+	if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
+		# the big-endian phon* files are provided by the package espeak-data
+		rm -f ${S}/espeak-data/phon*
+	fi
+
+        cp -prf ${S}/espeak-data/* ${D}${datadir}/espeak-data
+}
-- 
1.7.5.rc3



