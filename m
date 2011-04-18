Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QBuDb-0004wk-0K
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 21:34:43 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so4533947bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 12:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=UbJg1dVgb584uu4fRJ2T5qmbiGprOUY3gXe5rkjI6Kg=;
	b=aOsH+YuQn+kTmdOIYINTND8KrXA7q2gjPIMtjebbVhBB3n25JtBWNDbsSZOAlec8vs
	a/A98kdFZTCiuGbMIRFefvH73hUX1bSggK+K50CYztrlIygrcV+3X7q66i8mfwtNClmL
	uPgv4HvumSKhTfRXdWHsWyDJhKY/Ycdw7jqDs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=u1qS250z784KK1wVqnFgbQMZE8NMkMRj8dHnQRB/FddP9hg+IO+rMHWY4i1KLQgZsq
	GCNGMNViHVdNtFHm0iUzy4WlYtM6vHrlu4TCLNXcckmwbzKsd18UK9hvIWj5oCS7xtUG
	RFsMBYqxklpSP/m451+zHFsbw8jQeDQowdU+s=
Received: by 10.204.23.194 with SMTP id s2mr1245623bkb.160.1303155143630;
	Mon, 18 Apr 2011 12:32:23 -0700 (PDT)
Received: from localhost.localdomain
	(85-127-150-236.dynamic.xdsl-line.inode.at [85.127.150.236])
	by mx.google.com with ESMTPS id c11sm3438284bkc.2.2011.04.18.12.32.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 12:32:22 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 21:32:20 +0200
Message-Id: <02e3e6814c3c74050c9cdca48523a2496772bc4a.1303154850.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1303154850.git.michael.lippautz@gmail.com>
References: <cover.1303154850.git.michael.lippautz@gmail.com>
Subject: [oe-meta 1/2] wget: Add version 1.11.4
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
X-List-Received-Date: Mon, 18 Apr 2011 19:34:43 -0000

* Changes from org.oe.dev: ssl autodetection uses staging dirs

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 meta-oe/recipes-connectivity/wget/wget.inc       |   30 ++++++++++++++++++++++
 meta-oe/recipes-connectivity/wget/wget_1.11.4.bb |    7 +++++
 2 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/wget/wget.inc
 create mode 100644 meta-oe/recipes-connectivity/wget/wget_1.11.4.bb

diff --git a/meta-oe/recipes-connectivity/wget/wget.inc b/meta-oe/recipes-connectivity/wget/wget.inc
new file mode 100644
index 0000000..8903fee
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wget/wget.inc
@@ -0,0 +1,30 @@
+DESCRIPTION = "A console URL download utility featuring HTTP, FTP, and more."
+SECTION = "console/network"
+LICENSE = "GPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+INC_PR = "r10"
+
+S = "${WORKDIR}/wget-${PV}"
+
+inherit autotools gettext
+
+EXTRA_OECONF = " \
+  --enable-ipv6 
+  --with-libssl-prefix=${STAGING_DIR}${HOST_SYS}"
+
+# The unslung kernel does not support ipv6
+EXTRA_OECONF_unslung = "--without-ssl"
+# SlugOS kernels do not support ipv6. Can be loaded as a module.
+EXTRA_OECONF_slugos = "--without-ssl"
+
+do_install_append () {
+  mv ${D}${bindir}/wget ${D}${bindir}/wget.${PN}
+}
+
+pkg_postinst_${PN} () {
+  update-alternatives --install ${bindir}/wget wget wget.${PN} 100
+}
+
+pkg_prerm_${PN} () {
+  update-alternatives --remove wget wget.${PN}
+}
diff --git a/meta-oe/recipes-connectivity/wget/wget_1.11.4.bb b/meta-oe/recipes-connectivity/wget/wget_1.11.4.bb
new file mode 100644
index 0000000..b9f27f8
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wget/wget_1.11.4.bb
@@ -0,0 +1,7 @@
+PR="${INC_PR}.0"
+
+SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz"
+SRC_URI[md5sum] = "69e8a7296c0e12c53bd9ffd786462e87"
+SRC_URI[sha256sum] = "7315963b6eefb7530b4a4f63a5d5ccdab30078784cf41ccb5297873f9adea2f3"
+
+require wget.inc
-- 
1.7.3.4



