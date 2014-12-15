Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id D49AE72523
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 16:55:56 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lf10so11532647pab.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 08:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MM15NDBGZSvx9ndoclmlXNP3RBPB5+FAPFszsqybZqs=;
	b=nWKZglkZWN/gyRpxE6CkKe+8d+1NnT99qGlr8yfBQrpkQ4YBS6SAvC7ynlu5YUCVc3
	iuw/ukWBAp092ZQF1Nav8WEthO/CxJ8AiRbMSG73CAXAjSkGQxnt/x31eoby18vKR3U2
	QMwxPBuQQVg3E6ge0pDKjvmWZMMQgjMNh5P+tS+m41nON+dvJnYEFgHRcqnZ4QZmcXdW
	xBfaSGCHfrmbSR7sZ/8oowFEthTJFzYjjjg7Gs3f/1cxJzk0eypNQ3eSx8EwtjPDQlBR
	77hPqbDizCNwR9ZEYjkpGz3cVUFFNjoae+DGfPeg+wypHcE1GYTL7mG2LZBoE6Qx13N4
	ZUGQ==
X-Received: by 10.68.201.201 with SMTP id kc9mr52019703pbc.149.1418662557050; 
	Mon, 15 Dec 2014 08:55:57 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id w4sm9789572pdq.28.2014.12.15.08.55.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Dec 2014 08:55:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Dec 2014 08:55:47 -0800
Message-Id: <1418662550-13436-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-perl][PATCH 1/4] lib-perl: move package from meta-security to meta-perl
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
X-List-Received-Date: Mon, 15 Dec 2014 16:56:02 -0000

please consider this common package for meta-perl.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-perl/recipes-perl/libperl/lib-perl_0.63.bb | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libperl/lib-perl_0.63.bb

diff --git a/meta-perl/recipes-perl/libperl/lib-perl_0.63.bb b/meta-perl/recipes-perl/libperl/lib-perl_0.63.bb
new file mode 100644
index 0000000..7895864
--- /dev/null
+++ b/meta-perl/recipes-perl/libperl/lib-perl_0.63.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "This is a small simple module which simplifies the \
+manipulation of @INC at compile time. It is typically used to add extra \
+directories to Perl's search path so that later 'use' or 'require' statements \
+will find modules which are not located in the default search path."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=94b119f1a7b8d611efc89b5d562a1a50"
+
+DEPENDS += "perl"
+
+SRC_URI = "http://www.cpan.org/authors/id/S/SM/SMUELLER/lib-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "8607ac4e0d9d43585ec28312f52df67c"
+SRC_URI[sha256sum] = "72f63db9220098e834d7a38231626bd0c9b802c1ec54a628e2df35f3818e5a00"
+
+S = "${WORKDIR}/lib-${PV}"
+
+EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
+
+inherit cpan
+
+do_compile() {
+	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+	cpan_do_compile
+}
-- 
1.9.1


