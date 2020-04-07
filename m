Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.5777.1586251445560839105
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 02:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: przemyslaw.hawrylewicz.czarnowski@intel.com)
IronPort-SDR: Bys8bvyKr5/KPdHAC9X/QtCSny74VI/19ENgld1xIkC/Jv8mN9Hwds+dWT7oyNaCuTi5+zvrXp
 MYOMmMdxdBhA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 02:24:05 -0700
IronPort-SDR: tSqvtAfZ1bZGYnSu+uQ1nuMhYD66IGzIyA2onhwVYwOOnFhjatNMD1xoTcpgmMDljaRd2fN70M
 lUj11yeNA/5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,353,1580803200"; 
   d="scan'208";a="452371934"
Received: from opensps-ubuntu.igk.intel.com ([10.91.127.55])
  by fmsmga006.fm.intel.com with ESMTP; 07 Apr 2020 02:24:04 -0700
From: przemyslaw.hawrylewicz.czarnowski@intel.com
To: openembedded-devel@lists.openembedded.org
Cc: Przemyslaw Czarnowski <przemyslaw.hawrylewicz.czarnowski@intel.com>
Subject: [PATCH] Add nbdkit to extend backend possibilities of nbd.
Date: Tue,  7 Apr 2020 11:23:47 +0200
Message-Id: <20200407092347.5634-1-przemyslaw.hawrylewicz.czarnowski@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Nbdkit uses plugins to add more sources of data for nbd client.
Nbdkit can also spawn nbd-client, uses unix or network socket to
communicate with client, uses different plugins to serve data for nbd
device eg. curl, file, custom plugins in many languages (perl, python)
and some others.

Signed-off-by: Przemyslaw Czarnowski <przemyslaw.hawrylewicz.czarnowski@intel.com>
---
 .../recipes-support/nbdkit/nbdkit_git.bb      | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-support/nbdkit/nbdkit_git.bb

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_git.bb b/meta-networking/recipes-support/nbdkit/nbdkit_git.bb
new file mode 100644
index 000000000..0f7653d9c
--- /dev/null
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_git.bb
@@ -0,0 +1,43 @@
+SUMMARY = "nbdkit is a toolkit for creating NBD servers."
+DESCRIPTION = "NBD — Network Block Device — is a protocol \
+for accessing Block Devices (hard disks and disk-like things) \
+over a Network. \
+\
+nbdkit is a toolkit for creating NBD servers."
+
+HOMEPAGE = "https://github.com/libguestfs/nbdkit"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4332a97808994cf2133a65b6c6f33eaf"
+
+SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https"
+
+PV = "1.19.6+git${SRCPV}"
+SRCREV = "257561bc9f2f01eb9f21686bcec4b863d17a26c4"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "curl xz e2fsprogs zlib"
+
+inherit pkgconfig python3native perlnative pythonnative autotools
+# needed as nbdkit does not support build in external directory
+inherit autotools-brokensep
+
+# Those are required to build standalone
+EXTRA_OECONF = " --without-libvirt --without-libguestfs --disable-perl"
+
+# Old python2.x not suitable for nbdkit >= 1.16
+EXTRA_OECONF += " --disable-python"
+
+# Disable some extended support (not desired for small embedded systems)
+#EXTRA_OECONF += " --disable-ocaml"
+#EXTRA_OECONF += " --disable-rust"
+#EXTRA_OECONF += " --disable-ruby"
+#EXTRA_OECONF += " --disable-tcl"
+#EXTRA_OECONF += " --disable-lua"
+#EXTRA_OECONF += " --disable-vddk"
+
+do_install_append() {
+    rm -f ${D}/usr/share/bash-completion/completions/nbdkit
+    rmdir ${D}/usr/share/bash-completion/completions
+    rmdir ${D}/usr/share/bash-completion
+}
-- 
2.20.1

