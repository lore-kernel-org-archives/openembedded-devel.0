Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web12.189479.1598251457657305091
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2020 23:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=BDouAm62;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=498d700d9=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1598251457; x=1629787457;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iSExTwlQPL6KUBLzNfuRtwxjo0M/621EIZc7uxYeOyc=;
  b=BDouAm62iyiIVK5PdD+9GCN+w/DwVUsoz3G2sb1skS01BiFc86WGDe54
   ShbZi3rwMAb9PpeM7b2Ih3Lk93+VeVspOFx32HXPl8PIDpEzG1ZL9yZK9
   92Qcv4xqXM071IAZDrD5OKZHqHUnQ9ZoXMAPRRT3bOLJtpZiJ5i27skvf
   ea8FEwzKhqD+gQCnryWNm05DBHtKXK3X6MmvK4hhEWLeeeeOc0qeX5bnZ
   RZMn0kRreGTS4KUXn2ornSRLiCaAADWa3dCaE8xCInHJquGNr0Gl9J2do
   OaWfqe6iYpfp2rsUP6nnzBwsAq7Ekkg7NmfmmbSdod8VIBJPc5uq7Ofwx
   w==;
IronPort-SDR: hoJhE+65k0pNz4cFEzuXZGRLlsTOzijx9CT+Kk64Oo1vwXoykTiSzDBWQTIIZk468+lwOBk4WT
 fV/vCb0nqROEEW5tcxHch6jj+ywPCtmjSBR6X4qmDtZUhcNanev3qp4uJLZzym5835/c0S3g0e
 /lREweD+OTJiD4zWH9fY5t1/+DnJpkOJnJg5sijUxijCuJ9wWxKcWnGbbGGGty7GnOPzAfNMzB
 gZ+727NsuxvZM/eUz2iVEFv1gq9M9CzKyp5ZMFuLyewTh6eEmbkVUQcH9s3rTvsHavnV+bL/SU
 Mvk=
X-IronPort-AV: E=Sophos;i="5.76,347,1592863200"; 
   d="scan'208";a="26327515"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, Richard Leitner <richard.leitner@skidata.com>
Subject: [meta-oe][PATCH v2] liburing: add v0.7
Date: Mon, 24 Aug 2020 08:43:59 +0200
Message-ID: <20200824064359.199145-1-richard.leitner@skidata.com>
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
CHANGES v2:
  + rename recipe to include PV instead of "git"
  + remove "name=" from SRC_URI and SRCREV
---
 .../recipes-support/liburing/liburing_0.7.bb  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/liburing/liburing_0.7.bb

diff --git a/meta-oe/recipes-support/liburing/liburing_0.7.bb b/meta-oe/recipes-support/liburing/liburing_0.7.bb
new file mode 100644
index 000000000..9dfa0dfa1
--- /dev/null
+++ b/meta-oe/recipes-support/liburing/liburing_0.7.bb
@@ -0,0 +1,20 @@
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
+SRC_URI = "git://github.com/axboe/liburing.git;branch=master;protocol=https"
+SRCREV = "45f0735219a615ae848033c47c7e2d85d101d43e"
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
+
+do_install () {
+    oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
+}
-- 
2.28.0

