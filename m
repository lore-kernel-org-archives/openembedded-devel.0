Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by mail.openembedded.org (Postfix) with ESMTP id AA68265D90
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 11:24:40 +0000 (UTC)
Received: from localhost (2.71.147.210) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.279.1; Wed, 23 Apr 2014
	13:24:40 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Apr 2014 13:24:34 +0200
Message-ID: <8e20d75ce8b415b25ce0fffb196831096caf9ade.1398252166.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.0.0.rc0
In-Reply-To: <cover.1398252166.git.anders@chargestorm.se>
References: <cover.1398252166.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH 2/2] breakpad: update to latest svn
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
X-List-Received-Date: Wed, 23 Apr 2014 11:24:46 -0000
Content-Type: text/plain

The old license file, COPYING has been renamed to LICENSE. It has also been
appended with the the disclaimer from src/common/convert_UTF.h (see r1285).

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-devtools/breakpad/breakpad_svn.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb b/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
index 7c7024a..2c5941d 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
@@ -6,14 +6,14 @@ SUMMARY = "An open-source multi-platform crash reporting system"
 DESCRIPTION = "Breakpad is a library and tool suite that allows you to distribute an application to users with compiler-provided debugging information removed, record crashes in compact \"minidump\" files, send them back to your server, and produce C and C++ stack traces from these minidumps. "
 HOMEPAGE = "https://code.google.com/p/google-breakpad/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c80d1a3b623f72bb85a4c75b556551df"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=56c24a43c81c3af6fcf590851931489e"
 SECTION = "libs"
 
 inherit autotools
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "r1218"
+SRCREV = "r1318"
 SRC_URI = "svn://google-breakpad.googlecode.com/svn;module=trunk;protocol=http"
 S = "${WORKDIR}/trunk"
 
@@ -42,6 +42,7 @@ do_install_append() {
         install -m 0644 ${S}/src/google_breakpad/common/minidump_format.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_format.h
         install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_amd64.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_amd64.h
         install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_arm.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_arm.h
+        install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_arm.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_arm64.h
         install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_mips.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_mips.h
         install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_ppc64.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_ppc64.h
         install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_ppc.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_ppc.h
-- 
2.0.0.rc0


