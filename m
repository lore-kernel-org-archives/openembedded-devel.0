Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L29MM-0005LA-Ld
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 20:02:07 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20081117185942.IJEA23774.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 17 Nov 2008 13:59:42 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id gJzi1a00P1E665w04Jzi5w; Mon, 17 Nov 2008 13:59:43 -0500
X-Authority-Analysis: v=1.0 c=1 a=PfJKAhaLNuEA:10 a=09wlrRp3oBwA:10
	a=HM_2q3QZwszI4YwK7DIA:9 a=2vX9VYTEHTma5cNk8nH2uUvB94kA:4
	a=k-kO48AawpMA:10 a=e0fhMjvlNPMA:10
X-CM-Score: 0.00
Date: Mon, 17 Nov 2008 11:59:42 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20081117185942.GN15695@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: [BUG 4797] task-sdk.bb and task-sdk-bare.bb duplicate some	functionality
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Nov 2008 19:02:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[ Both patches are also attached to bug 4797 ]

Currently, we have task-sdk.bb, which provides task-sdk-bare, and will
bring in just abstracted ${LIBC}, $[LIBC}-dev and libgcc-dev.  We also
have task-sdk-bare.bb which brings in a number of glibc packages, libgcc
and libstdc++/libstdc++-dev and as far as I can tell is the only
task-sdk-bare actually used.  The attached patch consolidates both so
that task-sdk-bare.bb will be useful on both glibc and uclibc.

Signed-off-by: Tom Rini <trini@embeddedalley.com>

task-sdk-bare: Update and abstract to support uclibc
task-sdk.bb provided a task-sdk-bare version that supported uclibc, but
this wasn't used anymore.  Update task-sdk-bare.bb to have glibc / uclibc
abstractions and delete the unused file.

diff --git a/packages/tasks/task-sdk-bare.bb b/packages/tasks/task-sdk-bare.bb
index d2d40f6..ea0ab31 100644
--- a/packages/tasks/task-sdk-bare.bb
+++ b/packages/tasks/task-sdk-bare.bb
@@ -5,7 +5,7 @@ ALLOW_EMPTY = "1"
 
 PACKAGES = "${PN}"
 
-RDEPENDS_${PN} = "\
+GLIBC_PKGS = "\
     glibc \
     glibc-dbg \
     glibc-dev \
@@ -18,6 +18,16 @@ RDEPENDS_${PN} = "\
     glibc-gconv-iso8859-1 \
     glibc-gconv-iso8859-15 \
     locale-base-en-gb \
+    "
+
+LIBC_PKGS_linux = "${GLIBC_PKGS}"
+LIBC_PKGS_linux-gnueabi = "${GLIBC_PKGS}"
+LIBC_PKGS_linux-uclibc = "uclibc uclibc-dev"
+LIBC_PKGS_linux-uclibcgnueabi = "uclibc uclibc-dev"
+
+RDEPENDS_${PN} = "\
+    ${LIBC_PKGS} \
     libgcc \
     libstdc++ \
+    libstdc++-dev \
 "
diff --git a/packages/tasks/task-sdk.bb b/packages/tasks/task-sdk.bb
deleted file mode 100644
index 79e9fef..0000000
--- a/packages/tasks/task-sdk.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "SDK packages"
-PR = "r8"
-LICENSE = "MIT"
-ALLOW_EMPTY = "1"
-
-PACKAGES = "\
-    task-sdk-bare \
-    "
-
-DEPENDS = "virtual/libc"
-
-LIBC_linux = "glibc"
-LIBC_linux-uclibc = "uclibc"
-LIBC_linux-gnueabi = "glibc"
-LIBC_linux-uclibcgnueabi = "uclibc"
-
-
-RDEPENDS_task-sdk-bare = "\
-    ${LIBC} \
-    ${LIBC}-dev \
-    libgcc \
-    "
-- 
1.5.2.5

As an addition to the previous patch, add uclibc-thread-db to the list
of uclibc packages to install, based on glibc bringing in
glibc-thread-db.
diff --git a/packages/tasks/task-sdk-bare.bb b/packages/tasks/task-sdk-bare.bb
index ea0ab31..ab338e6 100644
--- a/packages/tasks/task-sdk-bare.bb
+++ b/packages/tasks/task-sdk-bare.bb
@@ -22,8 +22,8 @@ GLIBC_PKGS = "\
 
 LIBC_PKGS_linux = "${GLIBC_PKGS}"
 LIBC_PKGS_linux-gnueabi = "${GLIBC_PKGS}"
-LIBC_PKGS_linux-uclibc = "uclibc uclibc-dev"
-LIBC_PKGS_linux-uclibcgnueabi = "uclibc uclibc-dev"
+LIBC_PKGS_linux-uclibc = "uclibc uclibc-dev uclibc-thread-db"
+LIBC_PKGS_linux-uclibcgnueabi = "uclibc uclibc-dev uclibc-thread-db"
 
 RDEPENDS_${PN} = "\
     ${LIBC_PKGS} \

-- 
Tom Rini


