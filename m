Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id D0FD66E991
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2014 06:50:45 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id jt11so6707838pbb.39
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Feb 2014 22:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/92uFb8oSWGrCQn0/H1yk6d6bUK35aK0YvLAPf1L0z0=;
	b=U8JYT29Qp1er6JLSsTuccfMxxT10rJvVt1IqfclGuDx5FWRWaMqJl+vqrIjItidaPQ
	gjLIav8UlJqhhfgClfLqV9ldwgyiKO+yG/ZwWUZgsvVRsKm6gRcdTR3QOzsE9zY4VqCg
	5yxb9pOio0CbO/SbBhmk1dyodF2Jrhr3007PYu9Na4n0rrjxSuCPYs0yZ4+r3SVQ9vfg
	TlAPbmv7M+pbckZq2tArTfCGniRe77967PJL/0D2Qfz/m0/2fKzUeRKqx8LQ67DLbItK
	ErLESBN7Jbk5la92Al5v0LJDH+pcYW63prShA4/QogSj/zs+zYEjRkaeMfYfGsCDDAJq
	qg5g==
X-Received: by 10.68.172.37 with SMTP id az5mr5797555pbc.139.1391410247195;
	Sun, 02 Feb 2014 22:50:47 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	i10sm137068968pat.11.2014.02.02.22.50.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Feb 2014 22:50:46 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Feb 2014 22:51:13 -0800
Message-Id: <1391410275-31251-9-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v2 08/10] libmodule-build-tiny-perl: add 0.030
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
X-List-Received-Date: Mon, 03 Feb 2014 06:50:45 -0000

[Description from CPAN]
Many Perl distributions use a Build.PL file instead of a
Makefile.PL file to drive distribution configuration, build, test and
installation. Traditionally, Build.PL uses Module::Build as the underlying
build system. This module provides a simple, lightweight, drop-in replacement.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../libmodule/libmodule-build-tiny-perl_0.030.bb   |   54 ++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.030.bb

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.030.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.030.bb
new file mode 100644
index 0000000..fadd9c7
--- /dev/null
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.030.bb
@@ -0,0 +1,54 @@
+SUMMARY = "Module::Build::Tiny - A tiny replacement for Module::Build"
+DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
+Makefile.PL file to drive distribution configuration, build, test and \
+installation. Traditionally, Build.PL uses Module::Build as the underlying \
+build system. This module provides a simple, lightweight, drop-in replacement. \
+Whereas Module::Build has over 6,700 lines of code; this module has less than \
+120, yet supports the features needed by most distributions."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aaca61412962cf972aec0cdad99d0a84"
+
+DEPENDS = "libextutils-config-native libextutils-helpers-native libextutils-installpaths-native"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
+SRC_URI[md5sum] = "1c54bf4c602eec87f98950314699402e"
+SRC_URI[sha256sum] = "dfd418ad0e8290cf645ab11be209a1bf6865e5a562c5a1592da99d5fd24718a8"
+
+S = "${WORKDIR}/Module-Build-Tiny-${PV}"
+
+inherit cpan_build
+
+do_install () {
+        cpan_build_do_install
+}
+
+RDEPENDS_${PN} = " libextutils-config-perl \
+                   libextutils-helpers-perl \
+                   libextutils-installpaths-perl \
+                   perl-module-xsloader \
+                   perl-module-file-spec \
+                   perl-module-io-handle \
+                   perl-module-tap-harness-env \
+                   perl-module-ipc-open3 \
+                   perl-module-file-path \
+                   perl-module-cpan-meta \
+                   perl-module-extutils-cbuilder \
+                   perl-module-getopt-long \
+                   perl-module-extutils-makemaker \
+                   perl-module-exporter \
+                   perl-module-carp \
+                   perl-module-test-more \
+                   perl-module-text-parsewords \
+                   perl-module-module-load \
+                   perl-module-file-temp \
+                   perl-module-data-dumper \
+                   perl-module-extutils-parsexs \
+                   perl-module-pod-man \
+                   perl-module-json-pp \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


