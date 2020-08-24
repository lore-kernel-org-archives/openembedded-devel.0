Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web10.189866.1598248987968359477
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2020 23:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=K9iZR2jF;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=498d700d9=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1598248988; x=1629784988;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s3J6pNVFwylkJmaxA5yFACdQOxMQcbpRN28EmHGP8MQ=;
  b=K9iZR2jF5ttSkVtNWdSFRDC4eGfXgg8f4O+QzhRgag15ctL2gHHAA4sg
   mk/R6nwppX5ZnBiiMosqIkpDSI+4AEKAoBC1F2QSwQBvws4Fveb98CSIk
   NhutICjc1v7byQy3eW98WaKBMeyFyT2B6ELNZofzIIO6EWjQQY5WsAqem
   DD0IPfWYxpdgVeAtquVTMr2xwZ1JkNK88uSt3SqKP7mUUSvTNWsARCsps
   x7lSIaePqwVKqDC81m/frWJ0V/xVOMX08NrJE6nVLzn2GwATMtEOji0qL
   Og0hwXueEr+/dA1H/s1XI1htwZmK1Rw5nIPUfYD9s9VZSbdDp4Wffkigb
   A==;
IronPort-SDR: +C3F25c842CdzK9EY39WdfrCPaUQvVEAsd5MrCqahkyfVOcIco2Pmog7WOOD342q9vpqh9iYGD
 2r5OVuBvFD8QfcSSOHMFscptYKHGxWmUUUf4NiPkYQ8gcl/LWnQkZFdKXgVYkn+uSCct/sV6Y0
 3VF99cgT0EA6XG+7rEsvxMVBqrFBufycJet7bFImv95RBC2sD88JsF7SByrPfF8F8efk60CDRA
 4Ck7UlcA7l2RIpwRtWSwT3tJvErANg/n6PK1TldrxC3l4ygSFmJDwKOoyLkyjt3Ru6abtS6DtF
 vpY=
X-IronPort-AV: E=Sophos;i="5.76,347,1592863200"; 
   d="scan'208";a="26326761"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, Richard Leitner <richard.leitner@skidata.com>
Subject: [meta-oe][PATCH] liburing: add v0.7
Date: Mon, 24 Aug 2020 08:02:35 +0200
Message-ID: <20200824060235.196568-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add initial support for liburing v0.7.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 .../recipes-support/liburing/liburing_git.bb  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/liburing/liburing_git.bb

diff --git a/meta-oe/recipes-support/liburing/liburing_git.bb b/meta-oe/recipes-support/liburing/liburing_git.bb
new file mode 100644
index 000000000..87c919e13
--- /dev/null
+++ b/meta-oe/recipes-support/liburing/liburing_git.bb
@@ -0,0 +1,21 @@
+SUMMARY = "This is the io_uring library, liburing."
+DESCRIPTION = "liburing provides helpers to setup and teardown io_uring \
+instances, and also a simplified interface for applications that don't need \
+(or want) to deal with the full kernel side implementation."
+HOMEPAGE = "https://github.com/axboe/liburing"
+BUGTRACKER = "https://github.com/axboe/liburing/issues"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1 | MIT"
+LIC_FILES_CHKSUM = "file://README;beginline=41;endline=44;md5=d51b5805e2a675685e6a66ca50904cf9"
+
+SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https;name=git"
+PV = "0.7"
+SRCREV_git = "45f0735219a615ae848033c47c7e2d85d101d43e"
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
+
+do_install () {
+    oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
+}
-- 
2.28.0

