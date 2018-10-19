Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 580F378CE4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2018 09:40:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9J9ej3T028744
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2018 02:40:45 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 19 Oct 2018 02:40:44 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Oct 2018 16:59:19 +0800
Message-ID: <20181019085919.18767-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] openipmi: not install .pyc and .pyo files
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
X-List-Received-Date: Fri, 19 Oct 2018 09:40:47 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

openipmi load swig/python/.libs/_OpenIPMI.so to create .pyc and .pyo
files. It fails when multilib is enable:

| ImportError: .../lib32-openipmi/2.0.25-r0/OpenIPMI-2.0.25/swig/python/.libs/_OpenIPMI.so:
| wrong ELF class: ELFCLASS32

Don't compile and install .pyc and .pyo files to fix the failure.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../openipmigui-not-compile-pyc-pyo.patch     | 26 +++++++++++++++++++
 .../openipmi/openipmi_2.0.25.bb               |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-networking/recipes-support/openipmi/files/openipmigui-not-compile-pyc-pyo.patch

diff --git a/meta-networking/recipes-support/openipmi/files/openipmigui-not-compile-pyc-pyo.patch b/meta-networking/recipes-support/openipmi/files/openipmigui-not-compile-pyc-pyo.patch
new file mode 100644
index 000000000..389407590
--- /dev/null
+++ b/meta-networking/recipes-support/openipmi/files/openipmigui-not-compile-pyc-pyo.patch
@@ -0,0 +1,26 @@
+openipmi load swig/python/.libs/_OpenIPMI.so to create .pyc and .pyo files.
+It fails when multilib is enable:
+
+| ImportError: .../lib32-openipmi/2.0.25-r0/OpenIPMI-2.0.25/swig/python/.libs/_OpenIPMI.so: wrong ELF class: ELFCLASS32
+
+Don't compile and install .pyc and .pyo files to fix the failure.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+diff --git a/swig/python/openipmigui/Makefile.am b/swig/python/openipmigui/Makefile.am
+index 570e7b9..88258bf 100644
+--- a/swig/python/openipmigui/Makefile.am
++++ b/swig/python/openipmigui/Makefile.am
+@@ -34,9 +34,9 @@ localcopy:
+ 		fi \
+ 	done
+ 
+-all-local: localcopy $(PYC_FILES) $(PYO_FILES)
++all-local: localcopy
+ 
+-install-exec-local: $(EXTRA_DIST) $(PYC_FILES) $(PYO_FILES)
++install-exec-local: $(EXTRA_DIST)
+ 	$(INSTALL) -d $(DESTDIR)$(PYTHON_INSTALL_DIR)/openipmigui
+ 	$(INSTALL_DATA) $^ $(DESTDIR)$(PYTHON_INSTALL_DIR)/openipmigui
+ 
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.25.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.25.bb
index a1f26edb4..d28ebd484 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.25.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.25.bb
@@ -29,6 +29,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
            file://ipmi-init-fix-the-arguments.patch \
            file://do-not-install-pyc-and-pyo.patch \
            file://include_sys_types.patch \
+           file://openipmigui-not-compile-pyc-pyo.patch \
            file://openipmi-helper \
            file://ipmi.service \
            "
-- 
2.19.0.rc2


