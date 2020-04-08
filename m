Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.1934.1586389179529128496
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2020 16:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: przemyslaw.hawrylewicz.czarnowski@intel.com)
IronPort-SDR: 3MGybZVwaMCb/mPG0WmIlBVGUAGTc6dQbppz1NftwsPbze14D6qokTbodLtDTnrLpppp0U+DB7
 B8nlXy66+7zw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 16:39:39 -0700
IronPort-SDR: 3o2OZ87QebiHMvOm6cVicHURmhaBDCYkFJoRJI3Y7IGURxNMS8QAoRo/DtusD2FeYBMAc/Cnq7
 JIHgfPyMHvMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,360,1580803200"; 
   d="scan'208";a="251719449"
Received: from opensps-ubuntu.igk.intel.com ([10.91.127.55])
  by orsmga003.jf.intel.com with ESMTP; 08 Apr 2020 16:39:38 -0700
From: "Przemyslaw Czarnowski" <przemyslaw.hawrylewicz.czarnowski@intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Przemyslaw Czarnowski <przemyslaw.hawrylewicz.czarnowski@intel.com>
Subject: [PATCH v2] Add nbdkit to extend backend possibilities of nbd.
Date: Thu,  9 Apr 2020 01:39:13 +0200
Message-Id: <20200408233913.6491-1-przemyslaw.hawrylewicz.czarnowski@intel.com>
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
 .../recipes-support/nbdkit/nbdkit_git.bb      | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-networking/recipes-support/nbdkit/nbdkit_git.bb

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_git.bb b/meta-networking/recipes-support/nbdkit/nbdkit_git.bb
new file mode 100644
index 000000000..5f03bf823
--- /dev/null
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_git.bb
@@ -0,0 +1,41 @@
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
+inherit pkgconfig python3native perlnative autotools
+# needed as nbdkit does not support build in external directory
+inherit autotools-brokensep
+
+# Those are required to build standalone
+EXTRA_OECONF = " --without-libvirt --without-libguestfs --disable-perl"
+
+# Disable some extended support (not desired for small embedded systems)
+#EXTRA_OECONF += " --disable-python"
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

