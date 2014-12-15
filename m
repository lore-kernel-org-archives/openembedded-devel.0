Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2354672550
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 16:56:00 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id w10so11920574pde.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 08:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5r+9tVNa92MxLbb56GlxylQIOCiIYLLnrRKiFMXpBts=;
	b=gZE0+Ziu62vmXEhkC84mkj6qSP8b+FoiAupF6b7wGtZmRz3QiTi/uqMwxuSNroa4I9
	32vLMjxIUNB959Y+7krHlxEQQ5nuTWe5Xg75M9ZIZGYBXoNUNBtsIL4zbJ0RVV8JwZhI
	HWFSDwLHbH9mxH4V1T7QYRxqC+rqA7cPyvOiAgvKw7c2p2Rd7RA7v+L3sJ+IMGS1qnTE
	a+7WmkPiZVY4XWGvS7YTS0iZEp8nm2e9IlLEPt/+AMDAVwmfA1pB9B+KdYhrSaIT15Yi
	eA5wDhbfmwOvAr212ytOcLPIwacx7tEH+ASWeL9PW32pMUfCqLC4lNt8YJQELdpNRW1E
	bcow==
X-Received: by 10.70.36.236 with SMTP id t12mr52722605pdj.143.1418662561394;
	Mon, 15 Dec 2014 08:56:01 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id w4sm9789572pdq.28.2014.12.15.08.55.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Dec 2014 08:56:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Dec 2014 08:55:49 -0800
Message-Id: <1418662550-13436-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1418662550-13436-1-git-send-email-akuster808@gmail.com>
References: <1418662550-13436-1-git-send-email-akuster808@gmail.com>
Subject: [meta-perl][PATCH 3/4] libcurses-perl: move to meta-perl
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
X-List-Received-Date: Mon, 15 Dec 2014 16:56:03 -0000

please consider this for meta-perl. I would like to move it from
meta-security to common location. This also updates to latest.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-perl/libcurses/libcurses-perl_1.32.bb  | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libcurses/libcurses-perl_1.32.bb

diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.32.bb b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.32.bb
new file mode 100644
index 0000000..d78ca47
--- /dev/null
+++ b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.32.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "lib-curses provides an interface between Perl programs and \
+the curses library."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=0b37356c5e9e28080a3422d82af8af09"
+
+DEPENDS += "perl ncurses "
+
+SRC_URI = "http://www.cpan.org/authors/id/G/GI/GIRAFFED/Curses-${PV}.tgz"
+
+SRC_URI[md5sum] = "e4d9066bfc5a69cb2cee3e1dfc3209b3"
+SRC_URI[sha256sum] = "5dba44fd7964806d9765e6692bc7eb8eb30aeced2740f28b9a4070a5d14ba650"
+
+S = "${WORKDIR}/Curses-${PV}"
+
+EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR} LIBS=-L${STAGING_LIBDIR}"
+
+inherit cpan
+
+do_compile() {
+    export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+    cpan_do_compile
+}
+
-- 
1.9.1


