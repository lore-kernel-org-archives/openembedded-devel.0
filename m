Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f182.google.com (mail-wj0-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7C19371ABF
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jan 2017 01:19:34 +0000 (UTC)
Received: by mail-wj0-f182.google.com with SMTP id tn15so44463751wjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2017 17:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ksdTPGr9204nAfwK4ZHUBvMBtFWusLM3jB62mNRxa7Q=;
	b=YQC7pPNxH8LTJEj+V08Qxw3qW0Zhg8UTvLpyXpgsyMdZaAz4KJYU5bfPWb3mQFSetm
	Ag0q4bRSzl9TUfczx5XsptsXwwFQ9pbwDysQvQlpyIcZb4idfYzljapZkNA5UfKQTu2P
	tDbOpFdUMJ34D3aMCsiafNWPjSIbq209EATLsFon08ZFR2mzYJEdnoQtJlNsFhKx9E1u
	r1JDoeeXbwUB/g038TCnuLQRaSrPVGZk6YtvVpX6j3bgU5XzEBcqAeg8KY6RJV63JqG0
	/0oa9N+4t10t3qPTVqsLDMhwEkb779gASe22gn30nmMZq2oR+9wdtQmIVjWLsBiFqqGF
	/lnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ksdTPGr9204nAfwK4ZHUBvMBtFWusLM3jB62mNRxa7Q=;
	b=T+UB3JAFXRrxv+bn3RnucB9fHL2mkV5Fd5vMF1BRN1+ikyRbpCiSDny1ZwJCH9xG2o
	nSfoAlCUJDWFvnoYw2PgoTTwIbvGkWZDt7j1yZ9Fe2arcKARzNiO0GMGH9qzUOrmbLTI
	3b7TAVXhxFkSgM3KPqxL9LXRLAcUWyxU9vQDSqDuvyRzS1G1l5+JMFHkgGcnJCB4K3mO
	yfbw/L7OSq7GqRc3x/A+aFu2CkwNUhrQCgBVmL4mQt1xTLFVgD2+YlEuMC9t/IM1W9Tp
	n+dfHk3Ynb7cckDDQ13jzz6jIOmP5EUAhKeozhLeWx6dkUqCmBLD9aMqbW7L1jU6WzOu
	QLWQ==
X-Gm-Message-State: AIkVDXIq2+ZpxRVEz5M6qkcq5EzMUbCzAQzIDPLQNNc7yzGE4fbIMPb53Zkz991/kOaKZg==
X-Received: by 10.194.238.163 with SMTP id vl3mr60216430wjc.169.1483751974501; 
	Fri, 06 Jan 2017 17:19:34 -0800 (PST)
Received: from localhost.localdomain (p579CEF09.dip0.t-ipconnect.de.
	[87.156.239.9]) by smtp.googlemail.com with ESMTPSA id
	v202sm5880675wmv.8.2017.01.06.17.19.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jan 2017 17:19:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Jan 2017 02:19:17 +0100
Message-Id: <1483751957-32088-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] sip: re-add 4.19
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
X-List-Received-Date: Sat, 07 Jan 2017 01:19:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* This recipe is based upon the version in meta-qt4 but that one requires qmake
  for configuration and qt4-x11 in dependencies.
  It was tested by building sip-native and sip from scratch: There is no need for
  a dependency on Qt.
* Since pyqt5 will be added in meta-qt5-extra and meta-qt4
  needs sip too: add it to a more common place.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/sip/sip_4.19.bb | 42 ++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/sip/sip_4.19.bb

diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.bb b/meta-oe/recipes-devtools/sip/sip_4.19.bb
new file mode 100644
index 0000000..82feebb
--- /dev/null
+++ b/meta-oe/recipes-devtools/sip/sip_4.19.bb
@@ -0,0 +1,42 @@
+SUMMARY = "SIP is a C++/Python Wrapper Generator"
+HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
+SECTION = "devel"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
+
+inherit python-dir
+
+DEPENDS = "python"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz"
+SRC_URI[md5sum] = "be51a05065c9323b98a2ec2966c64e6a"
+SRC_URI[sha256sum] = "014bf55f653e0d8bcc582705ef4fbd61e0859a36e959ab46d8fa060cdf0b5e27"
+
+BBCLASSEXTEND = "native"
+
+PACKAGES += "python-sip"
+
+do_configure_prepend_class-target() {
+    echo "py_platform = linux" > sip.cfg
+    echo "py_inc_dir = %(sysroot)/${includedir}/python%(py_major).%(py_minor)" >> sip.cfg
+    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
+    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
+    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
+    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
+    python configure.py --configuration sip.cfg --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
+}
+do_configure_prepend_class-native() {
+    echo "py_platform = linux" > sip.cfg
+    echo "py_inc_dir = ${includedir}/python%(py_major).%(py_minor)" >> sip.cfg
+    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
+    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
+    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
+    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
+    python configure.py --configuration sip.cfg --sysroot ${STAGING_DIR_NATIVE}
+}
+do_install() {
+    oe_runmake install
+}
+
+FILES_python-sip = "${libdir}/${PYTHON_DIR}/site-packages/"
+FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
-- 
2.5.5


