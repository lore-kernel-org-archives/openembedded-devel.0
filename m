Received: from mail-gg0-f171.google.com ([209.85.161.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U8Eow-0002UE-I5
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 19:55:10 +0100
Received: by mail-gg0-f171.google.com with SMTP id j1so1437424ggn.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 10:38:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=EzDAnPvo+D4febUfqoIG+/ZQuhpMFGOYBvN1nJtbYG8=;
	b=RG84J9hvVForBGj8SHndSEnLcL++pTbn9j8G8q4bCCabf5eOnBJM2WyQoz7P3VrsRR
	nyrCXLdsZT+TqbIg1n9EcmQapxS94metSZFNVmWQsxG3fIFi7BLufmRwm0jYzasMdWaC
	ftb91vQbejPbFxdpt5tdbYJFK0+XoE+syigEUmXBMbeT7DxnLm11CcOW6sfqCKmwNiQ8
	1odJMUwhi8swXz6rdr2THqJdsx2cwX4aiu7oK+Iap59SawZ9fwR7tT3KPDIQunXy8CLI
	GiP22YMHT4eR65iTGCtnkfBB/8Sf8Pf91xjGqqVzMwttv+OEfnYcvAD32ixf5hVXL5a7
	YWzA==
X-Received: by 10.101.175.18 with SMTP id c18mr11630534anp.3.1361385539204;
	Wed, 20 Feb 2013 10:38:59 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id u2sm19584213anm.12.2013.02.20.10.38.57
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 10:38:58 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2013 10:38:50 -0800
Message-Id: <1361385530-2248-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlfbV6WRUQTYN1e3tlsqe69rIvNkPxQPYaN2znYueJbql8VD4FG1bWGo7c+WWjniiWbL8bW
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
X-List-Received-Date: Wed, 20 Feb 2013 18:55:10 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

This recipe was inspired on the gsoap recipe in oe-classic.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 .../recipes-support/gsoap/gsoap-native_2.8.12.bb   |   17 +++++++++++++++
 meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb      |   17 +++++++++++++++
 meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc     |   23 ++++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
 create mode 100644 meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
 create mode 100644 meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc

diff --git a/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb b/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
new file mode 100644
index 0000000..a83eb26
--- /dev/null
+++ b/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
@@ -0,0 +1,17 @@
+require gsoap_${PV}.inc
+
+DEPENDS = ""
+
+EXTRA_OEMAKE = ""
+
+inherit native
+
+do_install() {
+    oe_runmake DESTDIR=${D} BINDIR=${D}${bindir} install
+
+    install -m 0755 ${S}/gsoap/src/soapcpp2 ${STAGING_BINDIR_NATIVE}/
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



