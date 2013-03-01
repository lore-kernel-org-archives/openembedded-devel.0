Received: from mail-oa0-f51.google.com ([209.85.219.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UBUuO-0007Gi-5u
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Mar 2013 19:42:17 +0100
Received: by mail-oa0-f51.google.com with SMTP id h2so6163989oag.38
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2013 10:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=s14XtPe25xl14BaZKApFWu7hmH1H2755mTHrlRmmfeY=;
	b=bAbC2GRckIyTo3mDT/SAJFcXeaBW2uAc042KW+O0NMGqBCSfYimQfRskfkl/lguyCI
	RYjiTdMqiu+YaRX92phwcZpmMqkv/pBMhq9TmKKQfXwyNMdCrai7wzUMK1fxJpVmb3u1
	/Sguu90HjjEpg+5nR2/M2MMi5JkFx6jg6u7azbx5+CmeOtr4w+AnJ+DKjQAPHqqyJ8tx
	QgDcfF39CnaO6vquvUG4ark0muMd0zB2IXv7CKbYbIF2hD/mL9YJIQ8G0Ndj4tlAwFtQ
	sQGpL+9KU5uDOtGepAy+SrG1k0oodJKplauDkohZG2rIx6hfR7vNxaBubichhkCiS+da
	+xng==
X-Received: by 10.182.40.71 with SMTP id v7mr9005138obk.85.1362162351949;
	Fri, 01 Mar 2013 10:25:51 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id v8sm18754506oea.4.2013.03.01.10.25.50
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 10:25:51 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Mar 2013 10:25:56 -0800
Message-Id: <1362162356-25168-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlWPva3SRtSWUILbcy1CN4d6Fgd3OsE2dVJqUJstspvrfHspRVkuO/ZjlVtJehwo2cjKrkV
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [meta-oe][PATCH] gsoap: added gsoap 2.8.12 recipe
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
X-List-Received-Date: Fri, 01 Mar 2013 18:42:17 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

This recipe was inspired on the gsoap recipe in oe-classic.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 .../recipes-support/gsoap/gsoap-native_2.8.12.bb   |   14 ++++++++++++
 meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb      |   17 +++++++++++++++
 meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc     |   23 ++++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
 create mode 100644 meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
 create mode 100644 meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc

diff --git a/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb b/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
new file mode 100644
index 0000000..46fabbb
--- /dev/null
+++ b/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
@@ -0,0 +1,14 @@
+require gsoap_${PV}.inc
+
+DEPENDS = ""
+EXTRA_OEMAKE = ""
+
+inherit native
+
+do_install() {
+    oe_runmake DESTDIR=${D} BINDIR=${D}${bindir} install
+}
+
+
+SRC_URI[md5sum] = "5700d26fc6fe3073d038349e19c3640d"
+SRC_URI[sha256sum] = "51eef118544fa846f4d2dea2eedf91c84c46a1abeafc5eee3dcff783f4015a00"
diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
new file mode 100644
index 0000000..5db2e61
--- /dev/null
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
@@ -0,0 +1,17 @@
+require gsoap_${PV}.inc
+
+DEPENDS = "gsoap-native openssl"
+
+do_install_append() {
+   install -d ${D}${libdir}
+   for lib in libgsoapssl libgsoapssl++ libgsoap libgsoapck++ libgsoap++ libgsoapck
+   do
+       oe_libinstall -C gsoap $lib ${D}${libdir}
+   done
+}
+
+FILES_${PN} = "${bindir}/wsdl2h ${bindir}/soapcpp2"
+FILES_${PN} += "${datadir}"
+
+SRC_URI[md5sum] = "5700d26fc6fe3073d038349e19c3640d"
+SRC_URI[sha256sum] = "51eef118544fa846f4d2dea2eedf91c84c46a1abeafc5eee3dcff783f4015a00"
diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc b/meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc
new file mode 100644
index 0000000..30cf9a6
--- /dev/null
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc
@@ -0,0 +1,23 @@
+DESCRIPTION = "The gSOAP toolkit provides a unique SOAP-to-C/C++ language binding \
+for the development of SOAP Web Services and clients."
+SECTION = "devel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b338b08b1b61e028e0f399a4de25e58f"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.zip \
+        "
+
+inherit autotools
+
+PR = "r1"
+
+S = "${WORKDIR}/gsoap-2.8"
+
+FILES_${PN}-dev = "${includedir}"
+RRECOMMENDS_${PN}-dev = "${PN}-staticdev"
+
+FILES_${PN}-staticdev = "${libdir}"
+
+PARALLEL_MAKE = ""
+
+EXTRA_OEMAKE = "SOAP=${STAGING_BINDIR_NATIVE}/soapcpp2"
-- 
1.7.9.5



