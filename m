Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 220B974DD2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:33 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id z1-v6so5084310pgv.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=43MoM0V4D/wBLnLMyGAMOtHSp2hWWKPlP+iQOEibwo0=;
	b=t4NmWL1mepgc5q1soDqMwUG2RNOsglBbClr31GE5BPJFfeOvjOTKMOo9bkvb2WTPOn
	aU9yjC9vKX8AChHBCeHrWQ6WTZDxOiiDCS3Jej0GCNEVm09BGNwccyga0ucXDuAs92xm
	fVSvqOw8suJXfDRgP4HhrOyrLUb5mjO+5363B+gRc1TrEipAc8YQvHFJB5UvE+gbYsr1
	WGqFICrBwGnVWFxQ7MyOHLMDB51XMAvP41yy1aFnI7mCMaVh1kqGGx3/E168zgXM8eQX
	dRw/a1hxw52Bp/Mg5KPBNE1WXd+djgsVDo5J4/IEcTK46IJuJERnnOol3QYFElsZ4m/C
	yjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=43MoM0V4D/wBLnLMyGAMOtHSp2hWWKPlP+iQOEibwo0=;
	b=VQ44/VFzGvJGy/GLNNn34peAMbEfZTj7Xg6T6QRYMejUCVW5eymJvRxHuzQqZF6r0S
	BbovYV55cI/RBVs/olKKsZyzrkoo1it/o1YwcTK+/dk1jBtLWVTHqZyBjckKGL1bJaaW
	0yNz5cMHEAFFM7cuDrbKGg+sx/OEdxRYzcLZUF9fvnSZambbI+5yT+MUFta+05uUs6k/
	/YJgqi66ZcpZ6Ts09oR0UPxdGiJV3FYcbxtiKu3AP7uB2DXJxkbQAkAFCXhM83Ude503
	a7JUAC59CpQTMS4jbHFG7VroUCNAjPUxl/TDroRK/tjyypP9h0k2qe2dodF/5fHO6imT
	1DeQ==
X-Gm-Message-State: APt69E1E5r/0IZe83dPu9aO0CEO+5o/fbbUZJNt3dmzsLLeJCHxfgvQF
	MdsQMHoZBWPXGNGeR5aIBWaKeQ==
X-Google-Smtp-Source: ADUXVKISUeaoOybgcxXrs6K+pvvjsALUYHJg4Gbip0Cee/23V/GZFLUb/wT38LvHDadng2tJUZNcDQ==
X-Received: by 2002:a63:b543:: with SMTP id
	u3-v6mr8283465pgo.365.1529867974776; 
	Sun, 24 Jun 2018 12:19:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:31 -0700
Message-Id: <20180624191845.31082-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-python][PATCH 06/20] python-pywbem: update to version 0.11.0 and add a python3 recipe
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:34 -0000

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openlmi/openlmi-tools_0.10.5.bb           |  2 +-
 .../{pywbem_0.8.0.bb => python-pywbem.inc}    | 36 ++++++++++++-------
 .../pywbem/python-pywbem_0.11.0.bb            | 13 +++++++
 .../pywbem/python3-pywbem_0.11.0.bb           |  2 ++
 4 files changed, 40 insertions(+), 13 deletions(-)
 rename meta-python/recipes-extended/pywbem/{pywbem_0.8.0.bb => python-pywbem.inc} (59%)
 create mode 100644 meta-python/recipes-extended/pywbem/python-pywbem_0.11.0.bb
 create mode 100644 meta-python/recipes-extended/pywbem/python3-pywbem_0.11.0.bb

diff --git a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
index 13e67cba12..05dc854fca 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
@@ -7,7 +7,7 @@ SECTION = "System/Management"
 
 inherit setuptools
 
-DEPENDS = "python-native pywbem-native python-m2crypto pywbem"
+DEPENDS = "python-native python-pywbem-native python-m2crypto python-pywbem"
 
 SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
           "
diff --git a/meta-python/recipes-extended/pywbem/pywbem_0.8.0.bb b/meta-python/recipes-extended/pywbem/python-pywbem.inc
similarity index 59%
rename from meta-python/recipes-extended/pywbem/pywbem_0.8.0.bb
rename to meta-python/recipes-extended/pywbem/python-pywbem.inc
index 7f1986e516..5151c33ea9 100644
--- a/meta-python/recipes-extended/pywbem/pywbem_0.8.0.bb
+++ b/meta-python/recipes-extended/pywbem/python-pywbem.inc
@@ -12,25 +12,37 @@ at http://www.dmtf.org/standards/wbem. \
 \
 It also provides a Python provider interface, and is the fastest and easiest \
 way to write providers on the planet."
-HOMEPAGE = "http://pywbem.sf.net/"
-LICENSE = "LGPLv2"
+HOMEPAGE = "http://pywbem.github.io"
+LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://pywbem/LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
-SECTION = "Development/Libraries"
-DEPENDS = "python-m2crypto-native python-typing-native"
-SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BPN}/${BP}/${BP}-dev.r704.zip"
-SRC_URI[md5sum] = "84072451dcdd1aa9ee82363848faf7ad"
-SRC_URI[sha256sum] = "898035866d3cc741bbcd62c4ac26e633ad07b7c11d89db2472b9f923f3fd3ed8"
+SRC_URI[md5sum] = "1465dfa92e4cbe558c773838b9b00711"
+SRC_URI[sha256sum] = "2a05f2c1a6ab4b08560a6da55fdaabd0f52f4d1e6df6e288b9ed927bf5c289ed"
 
-S = "${WORKDIR}/${BP}-dev"
+inherit pypi 
 
-inherit setuptools python-dir
+DEPENDS += " \
+    ${PYTHON_PN}-ply-native \
+    ${PYTHON_PN}-pyyaml-native \
+    ${PYTHON_PN}-six-native \
+"
 
 do_install_append() {
     mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
-    mv ${D}${bindir}/mof_compiler.py ${D}${bindir}/mofcomp
 
-    rm ${D}${libdir}/python2.7/site-packages/${BPN}/wbemcli.py*
-    rm ${D}${libdir}/python2.7/site-packages/${BPN}/mof_compiler.py*
+    rm -f ${D}${bindir}/*.bat
 }
 
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-ply \
+    ${PYTHON_PN}-pyyaml \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-stringold \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-unixadmin \
+    ${PYTHON_PN}-xml \
+"
+
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-extended/pywbem/python-pywbem_0.11.0.bb b/meta-python/recipes-extended/pywbem/python-pywbem_0.11.0.bb
new file mode 100644
index 0000000000..7410749071
--- /dev/null
+++ b/meta-python/recipes-extended/pywbem/python-pywbem_0.11.0.bb
@@ -0,0 +1,13 @@
+require python-pywbem.inc
+inherit setuptools
+
+DEPENDS += " \
+    ${PYTHON_PN}-m2crypto-native \
+    ${PYTHON_PN}-typing-native \
+"
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-argparse \
+    ${PYTHON_PN}-m2crypto \
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.11.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.11.0.bb
new file mode 100644
index 0000000000..6a35a87442
--- /dev/null
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_0.11.0.bb
@@ -0,0 +1,2 @@
+require python-pywbem.inc
+inherit setuptools3
-- 
2.18.0


