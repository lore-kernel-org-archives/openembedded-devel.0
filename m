Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id F3C716E987
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 15:11:34 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id un15so4524773pbc.38
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 07:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0wZOnXJsqFSbnKlPl8N/RHwJJcRhMglnXb50nNqW2/I=;
	b=G1tp1dwmNLx7z3ydkRUQAf8A/dbTtSX6qEiO0AP/oM4QY33dn90V8iLCQVSik6ctbY
	GxjGNDgFJNWD06DhS1Ka0eTAAN/Lya6fUuvY44W7dpatv2GPe+IgQlmBTHcaEOEMjs9m
	tiGHb+mC47e0MKzlBbKies5b0IISoNzgFiKK509c15z6CHOvDDD6xkoO2GebyYfohM9Q
	g+on7ykv+oVo9WiwazVCTclVhyb4bqg3GgHzpb4RQCE9oxtmHuHMcaSwD6yt7rLV5V+A
	z4FME7nmuD+7OH4dTgiOJjhaWLDqgJiP8bCnZ4WOENHWbpzhzpfvMljVzSMUztVb8iXs
	+AtA==
X-Received: by 10.66.121.164 with SMTP id ll4mr21697611pab.48.1391181096201;
	Fri, 31 Jan 2014 07:11:36 -0800 (PST)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	zc6sm69486700pab.18.2014.01.31.07.11.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Jan 2014 07:11:35 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Jan 2014 07:11:39 -0800
Message-Id: <1391181100-32525-8-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
References: <1391181100-32525-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-perl][PATCH 8/9] perl-module-build-tiny: add 0.030
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
X-List-Received-Date: Fri, 31 Jan 2014 15:11:35 -0000

[Description from CPAN]
Many Perl distributions use a Build.PL file instead of a Makefile.PL file to drive distribution configuration, build, test and installation. Traditionally, Build.PL uses Module::Build as the underlying build system. This module provides a simple, lightweight, drop-in replacement.

Whereas Module::Build has over 6,700 lines of code; this module has less than 120, yet supports the features needed by most distributions.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../module-build/perl-module-build-tiny_0.030.bb   |   54 ++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta-perl/recipes-perl/module-build/perl-module-build-tiny_0.030.bb

diff --git a/meta-perl/recipes-perl/module-build/perl-module-build-tiny_0.030.bb b/meta-perl/recipes-perl/module-build/perl-module-build-tiny_0.030.bb
new file mode 100644
index 0000000..f024415
--- /dev/null
+++ b/meta-perl/recipes-perl/module-build/perl-module-build-tiny_0.030.bb
@@ -0,0 +1,54 @@
+SUMMARY = "Module::Build::Tiny - A tiny replacement for Module::Build"
+DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a \
+Makefile.PL file to drive distribution configuration, build, test and \
+installation. Traditionally, Build.PL uses Module::Build as the underlying \
+build system. This module provides a simple, lightweight, drop-in replacement. \
+Whereas Module::Build has over 6,700 lines of code; this module has less than \
+120, yet supports the features needed by most distributions."
+
+HOMEPAGE = "http://search.cpan.org/~leont/Module-Build-Tiny/"
+
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aaca61412962cf972aec0cdad99d0a84"
+
+DEPENDS = "perl-module-extutils-config-native perl-module-extutils-helpers-native perl-module-extutils-installpaths-native"
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
+RDEPENDS_${PN} = " perl-module-xsloader \
+                   perl-module-file-spec \
+                   perl-module-io-handle \
+                   perl-module-tap-harness-env \
+                   perl-module-extutils-install \
+                   perl-module-ipc-open3 \
+                   perl-module-file-path \
+                   perl-module-cpan-meta \
+                   perl-module-extutils-cbuilder \
+                   perl-module-getopt-long \
+                   perl-module-extutils-helpers \
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
+                   perl-module-extutils-installpaths \
+                   perl-module-extutils-config \
+                   perl-module-json-pp \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


