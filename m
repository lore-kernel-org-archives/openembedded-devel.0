Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DB5E173689
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 16:09:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1RG9viI010825
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Feb 2015 08:09:57 -0800 (PST)
Received: from op3-window.wrs.com (128.224.56.222) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 27 Feb 2015 08:09:57 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Feb 2015 11:08:59 -0500
Message-ID: <1425053339-17979-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.2.1
MIME-Version: 1.0
Cc: Peter Urbanec <openembedded-devel@urbanec.net>
Subject: [PATCH v2] mozjs: fix build failure due to failed X11 configure test
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
X-List-Received-Date: Fri, 27 Feb 2015 16:09:59 -0000
Content-Type: text/plain

The failure intermittently shows up as follows:

ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
Rerun configure task after fixing this. The path was 'poky/build/tmp/work/core2-64-poky-linux/mozjs/17.0.0-r0/build'
ERROR: Function failed: do_qa_configure
ERROR: Logfile of failure stored in: poky/build/tmp/work/core2-64-poky-linux/mozjs/17.0.0-r0/temp/log.do_configure.8047
ERROR: Task 5 (poky/meta-openembedded/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb, do_configure) failed with exit code '1'

The configure log has:

configure:5494: checking for IceConnectionNumber in -lICE
configure:5513: x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse --sysroot=poky/build/tmp/sysroots/genericx86-64 -o conftest  -O2 -pipe -g -feliminate-unused-debug-types  -Wl, -O1 -Wl,--hash-style=gnu -Wl,--as-needed -L/usr/lib conftest.c -lICE   1>&5
poky/build/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.1/ld: warning: library search path "/usr/lib" is unsafe for cross-compilation

Checking build/config/autoconf.mk we find:

X_CFLAGS =  -I/usr/include
X_EXTRA_LIBS =
X_LIBS =  -L/usr/lib

Looking at the configure script, we see these invalid values are output
when the autoconf test for X11 fails.  That test fails in the following
fashion:

configure:4768:27: fatal error: X11/Intrinsic.h: No such file or directory

This header in turn gets put in the sysroot by our build of libxt.  So we
get build fails whenever mozjs is built before libxt.

Aside from the configure test, it doesn't appear that mozjs really has
a hard dependency on libxt in order to compile.  So we can avoid the
problem by simply avoiding the configure test - and here we do that by
looking for X11 in the distro features.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[apologies if anyone gets this 2x ; the mailing list is misconfigured and
 currently operating in subscriber-only mode; someone please fix that.]

[v2: change depends on libxt to distro features solution]

[v1: http://patchwork.openembedded.org/patch/88625/  ]

 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 174f6fe0a89b..0a4cf6b03cc4 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -27,6 +27,8 @@ EXTRA_OECONF = " \
     --libdir=${libdir} \
 "
 
+EXTRA_OECONF_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
+
 # mozjs requires autoreconf 2.13
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
-- 
2.2.1


