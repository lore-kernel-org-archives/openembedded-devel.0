Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id A20567199F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 May 2017 22:50:54 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id q4so7884946pga.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 May 2017 15:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=joGKH4trDn2fWHn0D8+u/zJ/H/rsJOIXj+auMxz/GF4=;
	b=vfnAPGhsVe7M2QHGFnNnN6J36yUw0sXYy+T2R2K08MdC3IZ4hoaYMGbCotEshG1Jt/
	E4vRfwOY29roZSqHvUvl+JgFInChJeQXQhuaawVsLaGw84y6n0OIP62WF1e3VoWcOt6R
	5dggX4o6/LZSU05EQ4856mXR603jtpjye+xYpM8ZN7H9zjWl7vi3n8bmZ3R1M4WvsF/J
	q3wk9SJ1/DQBxyukT8eMMCK4TVuhCl0S+Xe5Js/XUDalLxmtC52vhAvPvz/A4ELFqOi7
	8QAZw97fpJ/k9+O9InzseW9AHjdIRwXEmKgigMM/Bt9OJGA522rCcFUbaHm27iq7ULrU
	twhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=joGKH4trDn2fWHn0D8+u/zJ/H/rsJOIXj+auMxz/GF4=;
	b=V/gbLZ9f9jRO/s/m00a5rqKe2GWku2EzkxDQsfUUVlMv10fNHhDgP+A+6dxsCPb8BI
	KJ9j4E0+lUswNYFuxt5PMc4kws8/f2gLxOEchGsQ5AUYQbNjEX09M7QWgv5UUjv6vf3d
	YL2Bk8lw8NAUeXFPPvlLxkHbSl2Pfdp+mY/2neXwlqU1TUsKeZSkaVnKNJd43aSqeWCu
	kYvnLyEOiEsiuR3ENDZfNuiZbou/R3LmBihndR2/38rRU4zSgfabSrLdJBzyffbP+eoW
	7ikQmE2420vRNO6cOb4TLICAcFjr2bDsWHa5yfe1v/oGjx7VgkR8juo+RRMuZg4Eeyq8
	Fqfg==
X-Gm-Message-State: AN3rC/6DjZCDuSDbhiWe25EBy8ibhuvgqI9i+FZqXi0h498lQOZrx2pS
	h2QyxwY3iEPUYhIK
X-Received: by 10.84.248.8 with SMTP id p8mr61107041pll.32.1493938255958;
	Thu, 04 May 2017 15:50:55 -0700 (PDT)
Received: from tyrael.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	u15sm5550398pgc.66.2017.05.04.15.50.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 May 2017 15:50:54 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 May 2017 15:50:37 -0700
Message-Id: <1493938237-12242-1-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] openocd: Add recipe for openocd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 May 2017 22:50:56 -0000

Adds a recipe for openocd. Based on recipe found in meta-zephyr.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 44 +++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd_git.bb

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
new file mode 100644
index 0000000..783a6c7
--- /dev/null
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -0,0 +1,44 @@
+SUMMARY = "Free and Open On-Chip Debugging, In-System Programming and Boundary-Scan Testing"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "libusb-compat libftdi"
+RDEPENDS_${PN} = "libusb1"
+
+SRC_URI = "git://repo.or.cz/openocd.git \
+	"
+SRCREV = "cb317eabf2d162365467aeb89b564828e5e6d6f3"
+
+PV = "0.10+gitr${SRCPV}"
+S = "${WORKDIR}/git"
+
+inherit pkgconfig autotools-brokensep gettext
+
+BBCLASSEXTEND += "nativesdk"
+
+EXTRA_OECONF = "--enable-ftdi --disable-doxygen-html "
+
+do_configure() {
+    ./bootstrap
+    oe_runconf ${EXTRA_OECONF}
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+    if [ -e "${D}${infodir}" ]; then
+      rm -Rf ${D}${infodir}
+    fi
+    if [ -e "${D}${mandir}" ]; then
+      rm -Rf ${D}${mandir}
+    fi
+    if [ -e "${D}${bindir}/.debug" ]; then
+      rm -Rf ${D}${bindir}/.debug
+    fi
+}
+
+FILES_${PN} = " \
+  ${datadir}/openocd/* \
+  ${bindir}/openocd \
+  "
+
+PACKAGECONFIG[sysfsgpio] = "--enable-sysfsgpio,--disable-sysfsgpio"
+PACKAGECONFIG ??= "sysfsgpio"
-- 
2.7.4


