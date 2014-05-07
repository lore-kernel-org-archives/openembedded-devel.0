Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2E7D360DD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 02:08:11 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id p10so337306pdj.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 19:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1t+3cAW+DIU2500tcaMCpRiYT96naqBkpvIgAXhXbk0=;
	b=fnaz/Hl7FJForRhs5qPOnsnVdroUGPakCEASkmsizGHq7IoO1iPdczkP6hli3W581r
	OM6vzPJm5kQDvZPMZxJMTo+7V/D47doXueCB86aUBXK0Wsoq+Irsb3YU/QWp1HYnpiTg
	TfnZhGjNPufr0qfJw/sXaQAkBlp0elLx72W9B2BwEv0qEobVf5qmt5EXMVzR703NRHne
	DwS5uoqfajfjfJx8J7LfZ43UHvwkHejLYEvVrD6e358IzILgw69tZxU5RyX9b0Hzetk3
	MzXbBzeoVKIw2pP0VsDhSQOqAwP9krOLtz9drKLo4VR7ejGMbMaZdfs3NQrlc6xKMTE8
	yIPg==
X-Received: by 10.66.121.131 with SMTP id lk3mr13070471pab.61.1399428492413;
	Tue, 06 May 2014 19:08:12 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id ec2sm142236pbc.63.2014.05.06.19.08.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 19:08:11 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 May 2014 19:09:23 -0700
Message-Id: <1399428565-30499-8-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
References: <1399428565-30499-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH v3 7/9] libmodule-build-tiny-perl: add 0.030
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
X-List-Received-Date: Wed, 07 May 2014 02:08:11 -0000

From: Tim Orling <TicoTimo@gmail.com>

[Description from CPAN]
Many Perl distributions use a Build.PL file instead of a
Makefile.PL file to drive distribution configuration, build, test and
installation. Traditionally, Build.PL uses Module::Build as the
underlying
build system. This module provides a simple, lightweight, drop-in
replacement.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../libmodule/libmodule-build-tiny-perl_0.030.bb   | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.030.bb

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.030.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.030.bb
new file mode 100644
index 0000000..687fb8a
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
+DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
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
1.8.3.2


