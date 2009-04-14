Received: from [128.2.201.117] (helo=chokecherry.srv.cs.cmu.edu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dhuggins@cs.cmu.edu>) id 1LtowI-0001Z1-T2
	for openembedded-devel@openembedded.org; Tue, 14 Apr 2009 22:09:09 +0200
Received: from localhost.localdomain (LIMA-2.SPEECH.CS.CMU.EDU [128.2.222.132])
	by chokecherry.srv.cs.cmu.edu (8.13.6/8.13.6) with ESMTP id
	n3EK5IDU002959; Tue, 14 Apr 2009 16:05:19 -0400 (EDT)
From: David Huggins-Daines <dhuggins@cs.cmu.edu>
To: openembedded-devel@openembedded.org
Date: Tue, 14 Apr 2009 16:05:18 -0400
Message-Id: <1239739518-1325-1-git-send-email-dhuggins@cs.cmu.edu>
X-Mailer: git-send-email 1.5.6.3
X-Scanned-By: mimedefang-cmuscs on 128.2.201.117
X-SA-Exim-Connect-IP: 128.2.201.117
X-SA-Exim-Mail-From: dhuggins@cs.cmu.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: David Huggins-Daines <dhuggins@cs.cmu.edu>
Subject: [PATCH] Supply uclibc-thread-db package expected by task-sdk-base
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
X-List-Received-Date: Tue, 14 Apr 2009 20:09:10 -0000

Currently, building task-sdk-base (and by extension meta-toolchain) fails
for uclibc targets.  This is because task-sdk-base depends on the thread
debugging library uclibc-thread-db, but this is not built by the uclibc
recipe unless PTHREADS_DEBUG_SUPPORT is enabled.  In addition, once it is
built, if you are using Debian version numbers, it will be helpfully
renamed to "libthread-db1" and the build will still fail.

This patch fixes these problems, it's against stable/2009 but will also
apply to .dev

---
 recipes/uclibc/uclibc-0.9.30/uClibc.distro |    2 +-
 recipes/uclibc/uclibc.inc                  |    3 +++
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/uclibc/uclibc-0.9.30/uClibc.distro b/recipes/uclibc/uclibc-0.9.30/uClibc.distro
index b072b2f..d8eed91 100644
--- a/recipes/uclibc/uclibc-0.9.30/uClibc.distro
+++ b/recipes/uclibc/uclibc-0.9.30/uClibc.distro
@@ -17,7 +17,7 @@ UCLIBC_CTOR_DTOR=y
 LDSO_GNU_HASH_SUPPORT=y
 # HAS_NO_THREADS is not set
 UCLIBC_HAS_THREADS=y
-# PTHREADS_DEBUG_SUPPORT is not set
+PTHREADS_DEBUG_SUPPORT=y
 LINUXTHREADS_OLD=y
 UCLIBC_HAS_LFS=y
 # MALLOC is not set
diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
index be085ab..46d36d2 100644
--- a/recipes/uclibc/uclibc.inc
+++ b/recipes/uclibc/uclibc.inc
@@ -55,6 +55,9 @@ FILES_uclibc-gconv = "${libdir}/gconv"
 FILES_uclibc-thread-db = "/lib/libthread_db*"
 RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
 
+# uclibc-thread-db will get renamed to libthread-db1, which we do not want
+DEBIANNAME_uclibc-thread-db = "uclibc-thread-db"
+
 #
 # This locale file gets copied into uClibc-${PV}/extra/locale/ prior to
 # build, it does not need to be unpacked, but we can't inhibit the unpacking
-- 
1.5.6.3



