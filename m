Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SxN1X-00051A-UC
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 20:55:09 +0200
Received: by yenl13 with SMTP id l13so1111777yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2012 11:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=/ZcvbTbLydfb2lCh6w/KcdWyqnvjfDDurWDYIwFyYmY=;
	b=gaBQ5lHqHdlc+wOjB1g545ij+TjiSqCsxLnSZvs+d3XD7/nDcTjM1pa1JtnT+8znPu
	Dx9SqEESRucMbsGAh5iB+K/kjtA2cw+ArCz3lwCJGeKe5mDFF+OWR/R3Qt3g5otSxZU1
	l++S88MgHyBjN51IXC6ynJhUe9gXpawG6CywysaJGs6Ov9B9KfBi1oMTRSks/dCzdnGn
	pbLMSDI9iYxGQ/33SrFMEq5+050H3fn+RsI83Im6s0jXj2AwkJ9ZgNdrZeJw32/Y8cLI
	hZN6mm+G1Uuo9R+NiIKGOqqH790p34B3qQtE/gdd0VYXSBsoXkr3o807aD5KDpZEyIOy
	+Y/w==
Received: by 10.236.76.3 with SMTP id a3mr2992027yhe.86.1344019388915;
	Fri, 03 Aug 2012 11:43:08 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id g46sm17541139yhm.19.2012.08.03.11.43.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 11:43:08 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Aug 2012 15:43:00 -0300
Message-Id: <1344019380-29691-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] tiobench: fix aligned allocation method clash with newer glibc
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
X-List-Received-Date: Fri, 03 Aug 2012 18:55:09 -0000

glibc 2.16 added aligned allocation support to stdlib and those
function clashes with the local implementation done in tiobench. We
fix it using a '_' prefix on those.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../tiobench-0.3.3/avoid-glibc-clashes.patch       |   57 ++++++++++++++++++++
 .../recipes-benchmark/tiobench/tiobench_0.3.3.bb   |    3 +
 2 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/avoid-glibc-clashes.patch

diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/avoid-glibc-clashes.patch b/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/avoid-glibc-clashes.patch
new file mode 100644
index 0000000..321d299
--- /dev/null
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/avoid-glibc-clashes.patch
@@ -0,0 +1,57 @@
+From: Otavio Salvador <otavio@ossystems.com.br>
+Subject: [PATCH] Avoid aligned allocation function name clashes
+
+glibc added new methods for aligned allocation and it clashes with the
+local version used by 'tiobench'. To fix it, we prefix the methods
+with '_'.
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ tiotest.c |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tiotest.c b/tiotest.c
+index 38f54e7..6b3d0c3 100644
+--- a/tiotest.c
++++ b/tiotest.c
+@@ -31,7 +31,7 @@ static const char* versionStr = "tiotest v0.3.3 (C) 1999-2000 Mika Kuoppala <mik
+ */
+ ArgumentOptions args;
+ 
+-static void * aligned_alloc(ssize_t size)
++static void * _aligned_alloc(ssize_t size)
+ {
+ 	caddr_t a;
+ 	a = mmap((caddr_t )0, size, 
+@@ -41,7 +41,7 @@ static void * aligned_alloc(ssize_t size)
+ 	return a;
+ }
+ 
+-static int aligned_free(caddr_t a, ssize_t size)
++static int _aligned_free(caddr_t a, ssize_t size)
+ {
+ 	return munmap(a, size);
+ }
+@@ -281,7 +281,7 @@ void initialize_test( ThreadTest *d )
+ 		pthread_attr_setscope(&(d->threads[i].thread_attr),
+ 				      PTHREAD_SCOPE_SYSTEM);
+ 
+-		d->threads[i].buffer = aligned_alloc( d->threads[i].blockSize );
++		d->threads[i].buffer = _aligned_alloc( d->threads[i].blockSize );
+ 		if( d->threads[i].buffer == NULL )
+ 		{
+ 			perror("Error allocating memory");
+@@ -383,7 +383,7 @@ void cleanup_test( ThreadTest *d )
+ 	{
+ 		if (!args.rawDrives)
+ 		unlink(d->threads[i].fileName);
+-		aligned_free( d->threads[i].buffer, d->threads[i].blockSize );
++		_aligned_free( d->threads[i].buffer, d->threads[i].blockSize );
+ 		d->threads[i].buffer = 0;
+ 	
+ 		pthread_attr_destroy( &(d->threads[i].thread_attr) );
+-- 
+1.7.7
+
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
index 3b77b38..5b95ac0 100644
--- a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
@@ -3,9 +3,12 @@ HOMEPAGE = "http://sourceforge.net/projects/tiobench/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
+PR = "r1"
+
 SRC_URI = "\
     http://sourceforge.net/projects/tiobench/files/tiobench/${PV}/${P}.tar.gz \
     file://tiobench-makefile.patch \
+    file://avoid-glibc-clashes.patch \
     "
 SRC_URI[md5sum] = "bf485bf820e693c79e6bd2a38702a128"
 SRC_URI[sha256sum] = "8ad011059a35ac70cdb5e3d3999ceee44a8e8e9078926844b0685b7ea9db2bcc"
-- 
1.7.2.5



