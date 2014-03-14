Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38A346F815
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 08:36:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2E8arnI024101
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Mar 2014 01:36:53 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 14 Mar 2014 01:36:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Mar 2014 16:36:47 +0800
Message-ID: <b7b3910fc03d9f0fac1e6363eb6b0db24d50a635.1394785570.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1394785570.git.hongxu.jia@windriver.com>
References: <cover.1394785570.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] netcf: fix offline rebuilding failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Mar 2014 08:36:57 -0000
Content-Type: text/plain

The netcf downloaded gnulib source to ${S} at the configure time,
while the network disconnected, if sstate cache was cleaned, the
netcf rebuilding failed.

Added a new recipe named 'gnulib' to download gnulib source to
${GITDIR} and populate it to the staging data dir.

So netcf could specify this local directory where gnulib sources
reside to save the bandwidth downloading.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-support/netcf/gnulib_git.bb            | 35 ++++++++++++++++++++++
 meta-networking/recipes-support/netcf/netcf_git.bb |  5 ++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/netcf/gnulib_git.bb

diff --git a/meta-networking/recipes-support/netcf/gnulib_git.bb b/meta-networking/recipes-support/netcf/gnulib_git.bb
new file mode 100644
index 0000000..730f5cd
--- /dev/null
+++ b/meta-networking/recipes-support/netcf/gnulib_git.bb
@@ -0,0 +1,35 @@
+SUMMARY = "The GNU portability library"
+DESCRIPTION = "A collection of software subroutines which are designed to \
+be usable on many operating systems. The goal of the project \
+is to make it easy for free software authors to make their \
+software run on many operating systems. Since source is designed \
+to be copied from gnulib, it is not a library per-se, as much \
+as a collection of portable idioms to be used in other projects."
+
+HOMEPAGE = "http://www.gnu.org/software/gnulib/"
+SECTION = "libs"
+LICENSE = "LGPLv2+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=e4cf3810f33a067ea7ccd2cd889fed21"
+SRCREV = "24379a9217fa4bd62685795aaaa010fd90ced9e3"
+SRC_URI = "git://git.sv.gnu.org/gnulib;protocol=git \
+"
+S = "${WORKDIR}/git"
+
+# Git clone a copy of gnulib source to the staging data dir
+sysroot_stage_all () {
+    [ -d ${STAGING_DATADIR}/gnulib/ ] && rm -rf ${STAGING_DATADIR}/gnulib/
+    cd ${S}
+    git checkout master
+    git clone ${S} ${STAGING_DATADIR}/gnulib
+}
+
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_install[noexec] = "1"
+do_package[noexec] = "1"
+do_packagedata[noexec] = "1"
+do_package_write_ipk[noexec] = "1"
+do_package_write_deb[noexec] = "1"
+do_package_write_rpm[noexec] = "1"
diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index 93f8c70..6c36ce8 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -12,7 +12,7 @@ PV = "0.2.3+git${SRCPV}"
 SRC_URI = "git://git.fedorahosted.org/netcf.git;protocol=git \
 "
 
-DEPENDS += "augeas libnl libxslt libxml2"
+DEPENDS += "augeas libnl libxslt libxml2 gnulib"
 
 S = "${WORKDIR}/git"
 
@@ -21,6 +21,7 @@ inherit gettext autotools
 EXTRA_OECONF_append_class-target = " --with-driver=redhat"
 do_configure_prepend() {
 	cd ${S}
-	./bootstrap
+	rm -f .gitmodules
+	./bootstrap --gnulib-srcdir=${STAGING_DATADIR}/gnulib
 }
 
-- 
1.8.1.2


