Return-Path: <philip.balister@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id C52E9601F2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 15:29:31 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id t28so23766446qte.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 08:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=9rX4HX5VD3usY3dDgXHtOdH3KFU4jmHSDRuX0DE4Gu0=;
	b=YgA9r/vS4AhT1/pKk6A4ro7K3bWac8OyhmJL4fpJ+CeaRWk1EJNwLYlhsxSJnsGTp3
	RhzDr5ed182Lxn++XFixWKGMcjiTPX1PC3cr6wpEhzZCfkcHMxUSuzdVV/eLE2JgWgRG
	xxZaY6f8Wh3dgR8IDxxxk3/J4v8PuBUHqTs2TU6B0LZKgkJrx/w5BmnfiBmGrcs6OAWF
	vSXi4LfyPzg1WGiOk12J1fSHNUCZx6EG56hSMD9J4V/jbF/nNdIctajGH3ep1W3a7/nu
	LOXnMRrDPdzPavoweiqIwAjc1yKvtP2OVCQncTfLgGwbJJO3BfJ2tL+BounUl/9pl9ZZ
	bsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=9rX4HX5VD3usY3dDgXHtOdH3KFU4jmHSDRuX0DE4Gu0=;
	b=GIZ15NSyrO7CwMPRF9c96eJAtriS3Zeksw7s6Xu/q53kS7c0hIhUyBKuuWEC0dZLh/
	KDekAC+s0TH1ReBYbOXRb4gTSzH5rs0Ij3GAgf3BwigVj0RDXA6Xrv1afs/jPsw1qUSz
	Z3/2OTL99MthtLV5yKdkKBopSZyqKj/iScm/tD4zpoOFr8dKdtCxTV5x4hxRNXFV+YrD
	kUwzeSZBWcF6YczvGpbZTWWRIDxoA3saFxPxD2SPSJlxHzgQuXiS2wDkaHRg9ScFOQ9p
	HQ72wJTWyNB/u3+wE4qHah8n8aDOmRsb7LqGX2Jxj2Pwel2pKU+gTHPbvkNDEec36xNZ
	lioQ==
X-Gm-Message-State: APjAAAXFOEAp3KxaOOnk4aANYmIdPIecf7bkKSzA/xefANICDj5Xjb49
	HgP5YemizlXS8I5SZW5Paf3t16a+Wa0=
X-Google-Smtp-Source: APXvYqyu8Gx/kOFa2x9xGT6c/x+gEMrL6Mld/XCTl//Fcv+g1mePWgmoQanfL+UnmIXjtmX3ty9MTA==
X-Received: by 2002:a0c:87b3:: with SMTP id 48mr65749644qvj.199.1555428571999; 
	Tue, 16 Apr 2019 08:29:31 -0700 (PDT)
Received: from prague.hsd1.va.comcast.net
	([2601:5c0:c100:b84:c110:9e9e:8241:dfa])
	by smtp.gmail.com with ESMTPSA id
	n41sm38067914qtf.63.2019.04.16.08.29.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 Apr 2019 08:29:31 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
X-Google-Original-From: Philip Balister <philip@opensdr.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2019 11:29:27 -0400
Message-Id: <20190416152927.20043-1-philip@opensdr.com>
X-Mailer: git-send-email 2.13.6
Cc: Philip Balister <philip@opensdr.com>
Subject: [meta-oe][PATCH] sip: Update to 4.19.16.
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
X-List-Received-Date: Tue, 16 Apr 2019 15:29:33 -0000

 * Note SRC_URI changed from SourceForge to Riverbank

Signed-off-by: Philip Balister <philip@opensdr.com>
---
 meta-oe/recipes-devtools/sip/sip.inc                       | 14 +++++++-------
 meta-oe/recipes-devtools/sip/sip3_4.19.13.bb               | 11 -----------
 meta-oe/recipes-devtools/sip/sip3_4.19.16.bb               | 11 +++++++++++
 .../sip/{sip_4.19.13.bb => sip_4.19.16.bb}                 |  0
 4 files changed, 18 insertions(+), 18 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/sip/sip3_4.19.13.bb
 create mode 100644 meta-oe/recipes-devtools/sip/sip3_4.19.16.bb
 rename meta-oe/recipes-devtools/sip/{sip_4.19.13.bb => sip_4.19.16.bb} (100%)

diff --git a/meta-oe/recipes-devtools/sip/sip.inc b/meta-oe/recipes-devtools/sip/sip.inc
index d0795454e..092531b32 100644
--- a/meta-oe/recipes-devtools/sip/sip.inc
+++ b/meta-oe/recipes-devtools/sip/sip.inc
@@ -4,10 +4,10 @@ SECTION = "devel"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz \
+SRC_URI = "https://www.riverbankcomputing.com/static/Downloads/sip/${PV}/sip-${PV}.tar.gz \
           "
-SRC_URI[md5sum] = "9124cb8978742685747a5415179a9890"                           
-SRC_URI[sha256sum] = "e353a7056599bf5fbd5d3ff9842a6ab2ea3cf4e0304a0f925ec5862907c0d15e"
+SRC_URI[md5sum] = "7e854b0da395ddc8fb5da82d0321994d"                           
+SRC_URI[sha256sum] = "184c790d58e9527fc6bdac2bbf8638f3d1b41dea922cad8eb83172b4ba70c620"
 
 S = "${WORKDIR}/sip-${PV}"
 
@@ -15,19 +15,19 @@ BBCLASSEXTEND = "native"
 
 do_configure_prepend_class-target() {
     echo "py_platform = linux" > sip.cfg
-    echo "py_inc_dir = %(sysroot)/${includedir}/python${PYTHON_BASEVERSION}${PYTHON_ABI}" >> sip.cfg
+    echo "py_inc_dir = %(sysroot)/${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
     echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
     echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
-    echo "sip_module_dir = ${D}/${libdir}/python${PYTHON_BASEVERSION}${PYTHON_ABI}/site-packages" >> sip.cfg
+    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
     echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
     ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
 }
 do_configure_prepend_class-native() {
     echo "py_platform = linux" > sip.cfg
-    echo "py_inc_dir = ${includedir}/python${PYTHON_BASEVERSION}${PYTHON_ABI}" >> sip.cfg
+    echo "py_inc_dir = ${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
     echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
     echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
-    echo "sip_module_dir = ${D}/${libdir}/python${PYTHON_BASEVERSION}${PYTHON_ABI}/site-packages" >> sip.cfg
+    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
     echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
     ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot=${STAGING_DIR_NATIVE}
 }
diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.13.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.13.bb
deleted file mode 100644
index dc15bc2e2..000000000
--- a/meta-oe/recipes-devtools/sip/sip3_4.19.13.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require sip.inc
-
-DEPENDS = "python3"
-
-inherit python3-dir python3native
-
-PACKAGES += "python3-sip3"
-
-FILES_python3-sip3 = "${libdir}/${PYTHON_DIR}${PYTHON_ABI}/site-packages/"
-FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}${PYTHON_ABI}/site-packages/.debug"
-
diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.16.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.16.bb
new file mode 100644
index 000000000..010fa30fe
--- /dev/null
+++ b/meta-oe/recipes-devtools/sip/sip3_4.19.16.bb
@@ -0,0 +1,11 @@
+require sip.inc
+
+DEPENDS = "python3"
+
+inherit python3-dir python3native
+
+PACKAGES += "python3-sip3"
+
+FILES_python3-sip3 = "${libdir}/${PYTHON_DIR}/site-packages/"
+FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
+
diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.13.bb b/meta-oe/recipes-devtools/sip/sip_4.19.16.bb
similarity index 100%
rename from meta-oe/recipes-devtools/sip/sip_4.19.13.bb
rename to meta-oe/recipes-devtools/sip/sip_4.19.16.bb
-- 
2.13.6


