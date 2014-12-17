Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA7772643
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 07:42:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="45319498"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Dec 2014 15:39:35 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBH7gUfx022989
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Dec 2014 15:42:30 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 17 Dec 2014 15:43:05 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Dec 2014 15:42:42 +0800
Message-ID: <1418802162-26554-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-filesystems][PATCH] logfsprogs: Add new recipe
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
X-List-Received-Date: Wed, 17 Dec 2014 07:43:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LogFS is a Linux log-structured and scalable flash file system, intended
for use on large devices of flash memory. Logfsprogs is used to create
LogFS file system.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../recipes-filesystems/logfsprogs/logfsprogs.bb   | 28 ++++++++++++++++++=
++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/logfsprogs/logfspr=
ogs.bb

diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs.bb =
b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs.bb
new file mode 100644
index 0000000..7e9de01
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs.bb
@@ -0,0 +1,28 @@
+SUMMARY =3D "LogFS Programs: used to create LogFS file system"
+DESCRIPTION =3D "\
+LogFS is a Linux log-structured and scalable flash file system, intended \
+for use on large devices of flash memory. It is written by J=C3=B6rn Engel=
 and \
+in part sponsored by the CE Linux Forum. \
+LogFS is included in the mainline Linux kernel and was introduced in \
+version 2.6.34, released on May 16, 2010."
+SECTION =3D "base"
+HOMEPAGE =3D "https://github.com/prasad-joshi/logfsprogs"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://fsck.c;md5=3D3859dc73da97909ff1d0125e88a27e02=
"
+DEPENDS =3D "zlib"
+
+SRC_URI =3D "git://github.com/prasad-joshi/logfsprogs.git"
+SRCREV =3D "45b72c81ce3c6fa17ca19bafc207ea93e76312f4"
+
+S =3D "${WORKDIR}/git"
+
+do_compile () {
+    make CC=3D"${CC}" LD=3D"${LD}" AR=3D"${AR}"
+}
+
+do_install () {
+    mkdir -p ${D}${bindir}
+    install -m 0755 ${S}/mklogfs ${D}${bindir}/mklogfs
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
1.8.3.1


