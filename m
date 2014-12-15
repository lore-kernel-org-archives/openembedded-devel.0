Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4F4CC71790
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 16:55:58 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lf10so11564221pab.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 08:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2yfpXD4HBW5zFtlFe+qn9OmU32B5kj9kdB04nYjid6A=;
	b=ca605Jw0yd3T7qDGCqR2Gg/zMQUK38FmgT9puT+5GHao9NpC6UOh8MX4ZqMaQkoVyw
	MErQHHiVMi8m8FMABVhysZu8IpVrp2py5LZNFKwaqe+Jpqr6atozPESoth5qEnrwoOyh
	h5/o8sAHF0ZNE1g0w8jeOXMH/uFWGJIjxIXqrbluvchL4GheHFZB2+r+jwzjn+hdd09g
	uPOUrlGKlhutBVcF2F9cUgWLLmOwCWAh9/nlzXY/baUcUUHZ0esKzdz+Z411eYJEQ+Es
	iqgpWQ5PLHvImwXgskd2C3exFgrHr+O9HdvTLd1K5NRDp/Lc5MNQZbvz01MTBp8XvjE9
	xwXg==
X-Received: by 10.68.211.104 with SMTP id nb8mr52771924pbc.29.1418662559338;
	Mon, 15 Dec 2014 08:55:59 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id w4sm9789572pdq.28.2014.12.15.08.55.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Dec 2014 08:55:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Dec 2014 08:55:48 -0800
Message-Id: <1418662550-13436-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1418662550-13436-1-git-send-email-akuster808@gmail.com>
References: <1418662550-13436-1-git-send-email-akuster808@gmail.com>
Subject: [meta-perl][PATCH 2/4] libhtml-parser-perl: move package from meta-security to meta-perl
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
 .../libhtml/libhtml-parser-perl_3.71.bb            | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.71.bb

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.71.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.71.bb
new file mode 100644
index 0000000..be0f4b2
--- /dev/null
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.71.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "This package contains the Parser.pm module with friends."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+LIC_FILES_CHKSUM = "file://README;md5=6c3dacf9f405c7483870ab5f148770c3"
+
+DEPENDS += "perl"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/HTML-Parser-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "9128a45893097dfa3bf03301b19c5efe"
+SRC_URI[sha256sum] = "be918b3749d3ff93627f72ee4b825683332ecb4c81c67a3a8d72b0435ffbd802"
+
+S = "${WORKDIR}/HTML-Parser-${PV}"
+
+EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
+
+inherit cpan
+
+do_compile() {
+	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+	cpan_do_compile
+}
+BBCLASSEXTEND = "native"
-- 
1.9.1


