Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 38B307477C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 17:55:21 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id o18-v6so3138866pll.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 10:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=43MoM0V4D/wBLnLMyGAMOtHSp2hWWKPlP+iQOEibwo0=;
	b=W33EJJ8Rsgwhffgok98D7p7yo57GlTSFTe542AcEOvn2YIWEKUBTBT/3GzIDcvpW13
	0wnD6FlTFXa9Tc7zHSM3dsqJva2uqTTFgZCU5098OskbwxfugAt15SJpNp8IaarZCsc4
	z4gxJeza2l1geuC8kJlNICOnHsxH0OQyvCtE4bhOJJdkRu04iQGhRva6gkmtBmJ8hjFK
	nD2htLj9BsT/C7zCe38q58Y1H/zUXzEOXFuPaqPcUpXoR9LBATMraA/bbLIVuuybdTdK
	qZv0WjVhQfdlmLlhcHDFQnMS73hqcZ/gmmvOU98U5/wfgMyT05woKxGBdEAw+/LlsPbr
	FZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=43MoM0V4D/wBLnLMyGAMOtHSp2hWWKPlP+iQOEibwo0=;
	b=PO4t962vjoVBH9jPkMTRbbwmdOflCfxAVYNlFPjzyi59msCk7blA+NEHt1Mix+7ekB
	EGpLM8ewb4SFUgznMdbgwcWEMDExY3qbiWvdMm1ACv8sCymlDwcy7LRMOtY2/9aYVy7Y
	SCjc4OE8Md84f8wcySpHn7KrL1cntXLoFgPyaJnfFHQzccd0oY4yyOrDuKwEj/PgBqkK
	XDDS1msgKq7fGVyiYzMd3zk1X9/54c08Z8xxQqPNhkTE7yr6Y9jlnwjN/sWCxUMl1P+s
	zZh7VuIHwhcEkA99G7LkpceZ1JnTfmijSasdwacbnSR7/FHD+YVy6H+At78tPGDHODTZ
	v0lg==
X-Gm-Message-State: APt69E1S+CEJ+GvZGqSf9xebIbq3Ni5nzti+jCu1a0oMLLdMTG7HNuOz
	znAM/hfXSAMV2ffo/Rw13l7rLQ==
X-Google-Smtp-Source: ADUXVKIQLwSE2CYTT0pfvEjQt6J1p02xRu+3yAd2azVr0E2z6vIT4JPj57uGWolEVBhPyCw7yreeZA==
X-Received: by 2002:a17:902:8549:: with SMTP id
	d9-v6mr2696488plo.81.1529690121942; 
	Fri, 22 Jun 2018 10:55:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	n83-v6sm23758992pfi.147.2018.06.22.10.55.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 10:55:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2018 10:55:20 -0700
Message-Id: <20180622175521.21628-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180622175521.21628-1-raj.khem@gmail.com>
References: <20180622175521.21628-1-raj.khem@gmail.com>
Subject: [meta-python, meta-oe][PATCH 4/5] python-pywbem: update to version 0.11.0 and add a python3 recipe
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
X-List-Received-Date: Fri, 22 Jun 2018 17:55:21 -0000

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


