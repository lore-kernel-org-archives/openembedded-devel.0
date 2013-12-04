Return-Path: <p.patat@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id F0DA16D915
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 10:59:13 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x12so15121306wgg.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 02:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=ytw1a7aPQYe0pFIh5h3jkJu5x2lHN0a3tHKTrsNXKxI=;
	b=Nx01BtendrvQteZzV654M7lO49thfIoY/MhrLPiqUVLEoMdYXk2+YE+rj+bjUON0f2
	bqtNzOjjKWobVop+0LeoSs0Ts9qQ+E4j/eX+zFQyWYnEJf+kMPIdWty7vv0ti+rLKWcR
	5s2JkgIxcKpQN3Q1FgtoYNXqSlod5UehrNB04IdUs+ovrq1KfLMdrLcJJ9Vf6eCg+35X
	QsqN2Jhg6ZZ1fvoR3WMGEvZedr5vYAbyrXk87JVjzu1+OW1JT++5JivkNoZxfmzzjoUI
	n+8Nwq1GZxgjth2XSZOEPPlRCpiPV3doixRuFvndXwwV9pW6U86/6CioxmG+D7dVHDcT
	mohw==
X-Received: by 10.180.189.6 with SMTP id ge6mr2170996wic.1.1386154753128;
	Wed, 04 Dec 2013 02:59:13 -0800 (PST)
Received: from ppatat-desktop.mpl.mstarsemi.fr ([94.103.137.126])
	by mx.google.com with ESMTPSA id e10sm5832970wiy.7.2013.12.04.02.59.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 02:59:12 -0800 (PST)
Sender: patrick patat <p.patat@gmail.com>
From: Patrick Patat <patrick.patat@innotis.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Dec 2013 11:59:07 +0100
Message-Id: <1386154747-14820-1-git-send-email-patrick.patat@innotis.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-perl][PATCH] add libcrypt-openssl-rsa-perl
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
X-List-Received-Date: Wed, 04 Dec 2013 10:59:14 -0000

This recipe build cpan module Crypt-OpenSSL-RSA

Signed-off-by: Patrick Patat <patrick.patat@innotis.org>
---
 .../libcrypt/libcrypt-openssl-rsa-perl_0.28.bb     |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
new file mode 100644
index 0000000..3d902a3
--- /dev/null
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Collection of Perl modules for working with shairport."
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz "
+
+SRC_URI[md5sum] = "86217a5036fc63779c30420b5fd84129"
+SRC_URI[sha256sum] = "5357f977464bb3a8184cf2d3341851a10d5515b4b2b0dfb88bf78995c0ded7be"
+
+DEPENDS += "perl openssl"
+
+EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR} -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'"
+
+S = "${WORKDIR}/Crypt-OpenSSL-RSA-${PV}"
+
+inherit cpan
+
+do_compile() {
+        export LIBC="$(find ${STAGING_DIR_TARGET}${base_libdir}/ -name 'libc-*.so')"
+	export OTHERLDFLAGS='-Wl,-rpath'
+        cpan_do_compile
+}
-- 
1.7.10.4


