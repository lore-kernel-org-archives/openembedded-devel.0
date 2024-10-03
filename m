Return-Path: <katariina.lounento@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A663CF8565
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 08:11:42 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.24])
 by mx.groups.io with SMTP id smtpd.web10.6384.1727943097688349630
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 01:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kapsi.fi header.s=20161220 header.b=WtrMrCUR;
 spf=pass (domain: kapsi.fi, ip: 91.232.154.24, mailfrom: hlounent@kapsi.fi)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=08dQlxvvKeGoTH71h7BCOCf502ZSfUUsBnwvSC+1aPQ=; b=WtrMrCURTInX5aft/3g1I+n1wl
	WYEBGLDKEANol8gTgu/NjAVshg/RvcH/N1ymq74l2dRdCl9nWoiizonB9b/gz3aYk7iVyTU+TNZAs
	rR47ctzHoHFiXGoWQ2754jJ57zRf6E/xGEXUEdNYPyttPT6/FpDuGW6fILtyN4Vtzs+CwVe0eJuPn
	+t0jEvge/dcMniGfN+vKOI4XS5X6NPvA3yRh2xj/YCBrWFRo9nkBQMjtwrWszSV7k5vgqs0appNuM
	ND2YspCBZLv7jOmrLFW9L7JtZaLE7Yj6u4TA/bi27ejeMwW9BG4HPUrWrBa8kXnouEoacnkACw9WT
	MZNpGBag==;
Received: from hel-inetgw01.vaisala.com ([193.143.230.131] helo=hel-pw07200h.corp.vaisala.com)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <katariina.lounento@vaisala.com>)
	id 1swGvv-004CaN-0E;
	Thu, 03 Oct 2024 11:11:35 +0300
From: katariina.lounento@vaisala.com
To: openembedded-devel@lists.openembedded.org
Cc: Katariina Lounento <katariina.lounento@vaisala.com>
Subject: [meta-oe][PATCH] libtar: patch CVEs
Date: Thu,  3 Oct 2024 11:11:27 +0300
Message-ID: <20241003081127.216986-1-katariina.lounento@vaisala.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 193.143.230.131
X-SA-Exim-Mail-From: katariina.lounento@vaisala.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 08:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112645

From: Katariina Lounento <katariina.lounento@vaisala.com>

cve-check.bbclass reported unpatched vulnerabilities in libtar
[1,2,3,4,5]. The NIST assigned base score for the worst vulnerability
is 9.1 / critical.

The patches were taken from the libtar [6] master branch after the
latest tag v1.2.20 (the changes in libtar master mostly originate from
Fedora and their patches), and from the Fedora 41 libtar source package
[7] and the Debian libtar package 1.2.20-8 [8] where the patches were
not available in the libtar repository itself.

The Fedora patch series was taken in its entirety in order to minimize
differences to Fedora's source tree instead of cherry-picking only CVE
fixes. Minimizing the differences should avoid issues with potential
inter-dependencies between the patches, and hopefully provide better
confidence as even the newest patches have been in use in Fedora for
nearly 2 years (since December 2022; Fedora rpms/libtar.git commit
e25b692fc7ceaa387dafb865b472510754f51bd2). The series includes even the
Fedora patch libtar-1.2.20-no-static-buffer.patch, which contains
changes *) that match the libtar commit
ec613af2e9371d7a3e1f7c7a6822164a4255b4d1 ("decode: avoid using a static
buffer in th_get_pathname()") whose commit message says

    Note this can break programs that expect sizeof(TAR) to be fixed.

The patches applied cleanly except for the Fedora srpm patch
libtar-1.2.11-bz729009.patch, which is identical with the pre-existing
meta-oe patch 0002-Do-not-strip-libtar.patch and is thus omitted.

The meta-openembedded recipe does not include any of the patches in
Kirkstone [9] nor the current master [10].

libtar does not have newer releases, and the libtar master doesn't
contain all of the changes included in the patches. Fedora's
libtar.1.2.11-*.patch are not included in the libtar v1.2.20 release
either but only in the master branch after the tag v1.2.20. The version
number in the filename is supposedly due to the patches being created
originally against v1.2.11 but have been upstreamed or at least
committed to the master only after v1.2.20.

The commit metadata could not be practically completed in most of the
cases due to missing commit messages in the original commits and
patches. The informal note about the author ("Authored by") was added to
the patch commit messages where the commit message was missing the
original author(s)' Signed-off-by.

*) The patch also contains the changes split to the libtar commits
    495d0c0eabc5648186e7d58ad54b508d14af38f4 ("Check for NULL before
    freeing th_pathname") and 20aa09bd7775094a2beb0f136c2c7d9e9fd6c7e6
    ("Added stdlib.h for malloc() in lib/decode.c"))

[1] https://nvd.nist.gov/vuln/detail/CVE-2021-33643
[2] https://nvd.nist.gov/vuln/detail/CVE-2021-33644
[3] https://nvd.nist.gov/vuln/detail/CVE-2021-33645
[4] https://nvd.nist.gov/vuln/detail/CVE-2021-33646
[5] https://nvd.nist.gov/vuln/detail/CVE-2013-4420
[6] https://repo.or.cz/libtar.git
[7] https://src.fedoraproject.org/rpms/libtar/tree/f41
[8] https://sources.debian.org/patches/libtar/1.2.20-8/CVE-2013-4420.patch/
[9] https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libtar/libtar_1.2.20.bb?h=kirkstone&id=9a24b7679810628b594cc5a9b52f77f53d37004f
[10] https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libtar/libtar_1.2.20.bb?h=master&id=9356340655b3a4f87f98be88f2d167bb2514a54c

Signed-off-by: Katariina Lounento <katariina.lounento@vaisala.com>
---
 ...-missing-prototype-compiler-warnings.patch |  53 ++++++
 ...ix-invalid-memory-de-reference-issue.patch |  44 +++++
 ...escriptor-leaks-reported-by-cppcheck.patch | 101 +++++++++++
 ...0006-fix-memleak-on-tar_open-failure.patch |  26 +++
 ...ix-memleaks-in-libtar-sample-program.patch | 119 +++++++++++++
 ...ng-a-static-buffer-in-th_get_pathnam.patch |  89 ++++++++++
 ...-for-NULL-before-freeing-th_pathname.patch |  30 ++++
 ...-stdlib.h-for-malloc-in-lib-decode.c.patch |  26 +++
 ...amming-mistakes-detected-by-static-a.patch | 100 +++++++++++
 .../libtar/files/CVE-2013-4420.patch          | 160 ++++++++++++++++++
 ...-33640-CVE-2021-33645-CVE-2021-33646.patch |  42 +++++
 .../files/CVE-2021-33643-CVE-2021-33644.patch |  52 ++++++
 .../recipes-support/libtar/libtar_1.2.20.bb   |  12 ++
 13 files changed, 854 insertions(+)
 create mode 100644 meta-oe/recipes-support/libtar/files/0003-Fix-missing-prototype-compiler-warnings.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0004-Fix-invalid-memory-de-reference-issue.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0005-fix-file-descriptor-leaks-reported-by-cppcheck.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0006-fix-memleak-on-tar_open-failure.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0007-fix-memleaks-in-libtar-sample-program.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0008-decode-avoid-using-a-static-buffer-in-th_get_pathnam.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0009-Check-for-NULL-before-freeing-th_pathname.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0010-Added-stdlib.h-for-malloc-in-lib-decode.c.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0011-libtar-fix-programming-mistakes-detected-by-static-a.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2013-4420.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2021-33640-CVE-2021-33645-CVE-2021-33646.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2021-33643-CVE-2021-33644.patch

diff --git a/meta-oe/recipes-support/libtar/files/0003-Fix-missing-prototype-compiler-warnings.patch b/meta-oe/recipes-support/libtar/files/0003-Fix-missing-prototype-compiler-warnings.patch
new file mode 100644
index 0000000000..f0fd2a4aa1
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/files/0003-Fix-missing-prototype-compiler-warnings.patch
@@ -0,0 +1,53 @@
+From 9426ac3d232e2f90c571979a2166c5e1328967d1 Mon Sep 17 00:00:00 2001
+From: Hans de Goede <j.w.r.degoede@hhs.nl>
+Date: Tue, 15 Oct 2013 14:39:04 +0200
+Subject: [PATCH] Fix missing prototype compiler warnings
+
+Signed-off-by: Kamil Dudka <kdudka@redhat.com>
+
+Upstream-Status: Backport [https://repo.or.cz/libtar.git/commit/30e5556d1c9323e9f1887b28d42581c2954b53c9]
+
+Signed-off-by: Katariina Lounento <katariina.lounento@vaisala.com>
+---
+ lib/append.c  | 2 ++
+ lib/output.c  | 1 +
+ lib/wrapper.c | 1 +
+ 3 files changed, 4 insertions(+)
+
+diff --git a/lib/append.c b/lib/append.c
+index 13e1ace..e8bd89d 100644
+--- a/lib/append.c
++++ b/lib/append.c
+@@ -13,6 +13,8 @@
+ #include <internal.h>
+ 
+ #include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <sys/param.h>
+diff --git a/lib/output.c b/lib/output.c
+index a2db929..a5262ee 100644
+--- a/lib/output.c
++++ b/lib/output.c
+@@ -13,6 +13,7 @@
+ #include <internal.h>
+ 
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <pwd.h>
+ #include <grp.h>
+ #include <time.h>
+diff --git a/lib/wrapper.c b/lib/wrapper.c
+index 4cd0652..44cc435 100644
+--- a/lib/wrapper.c
++++ b/lib/wrapper.c
+@@ -13,6 +13,7 @@
+ #include <internal.h>
+ 
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <sys/param.h>
+ #include <dirent.h>
+ #include <errno.h>
diff --git a/meta-oe/recipes-support/libtar/files/0004-Fix-invalid-memory-de-reference-issue.patch b/meta-oe/recipes-support/libtar/files/0004-Fix-invalid-memory-de-reference-issue.patch
new file mode 100644
index 0000000000..b1ecb552bc
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/files/0004-Fix-invalid-memory-de-reference-issue.patch
@@ -0,0 +1,44 @@
+From c0a89709860acae5ef67727db7b23db385703bf6 Mon Sep 17 00:00:00 2001
+From: Huzaifa Sidhpurwala <huzaifas@fedoraproject.org>
+Date: Tue, 15 Oct 2013 14:39:05 +0200
+Subject: [PATCH] Fix invalid memory de-reference issue
+
+Bug: https://bugzilla.redhat.com/551415
+
+Signed-off-by: Kamil Dudka <kdudka@redhat.com>
+
+Upstream-Status: Backport [https://repo.or.cz/libtar.git/commit/560911b694055b0c677431cf85d4d0d5ebd1a3fd]
+
+Signed-off-by: Katariina Lounento <katariina.lounento@vaisala.com>
+---
+ lib/libtar.h | 1 +
+ lib/util.c   | 4 +---
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/lib/libtar.h b/lib/libtar.h
+index 55f509a..7fc4d03 100644
+--- a/lib/libtar.h
++++ b/lib/libtar.h
+@@ -172,6 +172,7 @@ int th_write(TAR *t);
+ #define TH_ISDIR(t)	((t)->th_buf.typeflag == DIRTYPE \
+ 			 || S_ISDIR((mode_t)oct_to_int((t)->th_buf.mode)) \
+ 			 || ((t)->th_buf.typeflag == AREGTYPE \
++			     && strlen((t)->th_buf.name) \
+ 			     && ((t)->th_buf.name[strlen((t)->th_buf.name) - 1] == '/')))
+ #define TH_ISFIFO(t)	((t)->th_buf.typeflag == FIFOTYPE \
+ 			 || S_ISFIFO((mode_t)oct_to_int((t)->th_buf.mode)))
+diff --git a/lib/util.c b/lib/util.c
+index 31e8315..11438ef 100644
+--- a/lib/util.c
++++ b/lib/util.c
+@@ -148,9 +148,7 @@ oct_to_int(char *oct)
+ {
+ 	int i;
+ 
+-	sscanf(oct, "%o", &i);
+-
+-	return i;
++	return sscanf(oct, "%o", &i) == 1 ? i : 0;
+ }
+ 
+ 
diff --git a/meta-oe/recipes-support/libtar/files/0005-fix-file-descriptor-leaks-reported-by-cppcheck.patch b/meta-oe/recipes-support/libtar/files/0005-fix-file-descriptor-leaks-reported-by-cppcheck.patch
new file mode 100644
index 0000000000..627c270163
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/files/0005-fix-file-descriptor-leaks-reported-by-cppcheck.patch
@@ -0,0 +1,101 @@
+From d998b9f75c79aab68255dace641dd30db239eff6 Mon Sep 17 00:00:00 2001
+From: Kamil Dudka <kdudka@redhat.com>
+Date: Tue, 15 Oct 2013 19:48:41 -0400
+Subject: [PATCH] fix file descriptor leaks reported by cppcheck
+
+Bug: https://bugzilla.redhat.com/785760
+
+Authored by Kamil Dudka <kdudka@redhat.com>.
+
+Upstream-Status: Backport [https://repo.or.cz/libtar.git/commit/abd0274e6b2f708e9eaa29414b07b3f542cec694]
+
+Signed-off-by: Katariina Lounento <katariina.lounento@vaisala.com>
+---
+ lib/append.c    | 14 +++++++++-----
+ lib/extract.c   |  4 ++++
+ libtar/libtar.c |  3 +++
+ 3 files changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/lib/append.c b/lib/append.c
+index e8bd89d..ff58532 100644
+--- a/lib/append.c
++++ b/lib/append.c
+@@ -216,6 +216,7 @@ tar_append_regfile(TAR *t, const char *realname)
+ 	int filefd;
+ 	int i, j;
+ 	size_t size;
++	int rv = -1;
+ 
+ 	filefd = open(realname, O_RDONLY);
+ 	if (filefd == -1)
+@@ -234,25 +235,28 @@ tar_append_regfile(TAR *t, const char *realname)
+ 		{
+ 			if (j != -1)
+ 				errno = EINVAL;
+-			return -1;
++			goto fail;
+ 		}
+ 		if (tar_block_write(t, &block) == -1)
+-			return -1;
++			goto fail;
+ 	}
+ 
+ 	if (i > 0)
+ 	{
+ 		j = read(filefd, &block, i);
+ 		if (j == -1)
+-			return -1;
++			goto fail;
+ 		memset(&(block[i]), 0, T_BLOCKSIZE - i);
+ 		if (tar_block_write(t, &block) == -1)
+-			return -1;
++			goto fail;
+ 	}
+ 
++	/* success! */
++	rv = 0;
++fail:
+ 	close(filefd);
+ 
+-	return 0;
++	return rv;
+ }
+ 
+ 
+diff --git a/lib/extract.c b/lib/extract.c
+index 36357e7..9fc6ad5 100644
+--- a/lib/extract.c
++++ b/lib/extract.c
+@@ -228,13 +228,17 @@ tar_extract_regfile(TAR *t, char *realname)
+ 		{
+ 			if (k != -1)
+ 				errno = EINVAL;
++			close(fdout);
+ 			return -1;
+ 		}
+ 
+ 		/* write block to output file */
+ 		if (write(fdout, buf,
+ 			  ((i > T_BLOCKSIZE) ? T_BLOCKSIZE : i)) == -1)
++		{
++			close(fdout);
+ 			return -1;
++		}
+ 	}
+ 
+ 	/* close output file */
+diff --git a/libtar/libtar.c b/libtar/libtar.c
+index 9fa92b2..bb5644c 100644
+--- a/libtar/libtar.c
++++ b/libtar/libtar.c
+@@ -83,7 +83,10 @@ gzopen_frontend(char *pathname, int oflags, int mode)
+ 		return -1;
+ 
+ 	if ((oflags & O_CREAT) && fchmod(fd, mode))
++	{
++		close(fd);
+ 		return -1;
++	}
+ 
+ 	gzf = gzdopen(fd, gzoflags);
+ 	if (!gzf)
diff --git a/meta-oe/recipes-support/libtar/files/0006-fix-memleak-on-tar_open-failure.patch b/meta-oe/recipes-support/libtar/files/0006-fix-memleak-on-tar_open-failure.patch
new file mode 100644
index 0000000000..90809ad846
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/files/0006-fix-memleak-on-tar_open-failure.patch
@@ -0,0 +1,26 @@
+From f6c5cba59444ecda9bbc22b8e8e57fd1015a688d Mon Sep 17 00:00:00 2001
+From: Huzaifa Sidhpurwala <huzaifas@fedoraproject.org>
+Date: Tue, 15 Oct 2013 20:02:58 -0400
+Subject: [PATCH] fix memleak on tar_open() failure
+
+Authored by Huzaifa Sidhpurwala <huzaifas@fedoraproject.org>.
+
+Upstream-Status: Backport [https://repo.or.cz/libtar.git/commit/36629a41208375f5105427e98078127551692028]
+
+Signed-off-by: Katariina Lounento <katariina.lounento@vaisala.com>
+---
+ lib/handle.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/handle.c b/lib/handle.c
+index 33a262c..002d23c 100644
+--- a/lib/handle.c
++++ b/lib/handle.c
+@@ -82,6 +82,7 @@ tar_open(TAR **t, const char *pathname, tartype_t *type,
+ 	(*t)->fd = (*((*t)->type->openfunc))(pathname, oflags, mode);
+ 	if ((*t)->fd == -1)
+ 	{
++		libtar_hash_free((*t)->h, NULL);
+ 		free(*t);
+ 		return -1;
+ 	}
diff --git a/meta-oe/recipes-support/libtar/files/0007-fix-memleaks-in-libtar-sample-program.patch b/meta-oe/recipes-support/libtar/files/0007-fix-memleaks-in-libtar-sample-program.patch
new file mode 100644
index 0000000000..f88bcbf9cf
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/files/0007-fix-memleaks-in-libtar-sample-program.patch
@@ -0,0 +1,119 @@
+From e3888e452aee72e0d658185ac20e8e63bed1aff8 Mon Sep 17 00:00:00 2001
+From: Huzaifa Sidhpurwala <huzaifas@fedoraproject.org>
+Date: Tue, 15 Oct 2013 20:05:04 -0400
+Subject: [PATCH] fix memleaks in libtar sample program
+
+Authored by Huzaifa Sidhpurwala <huzaifas@fedoraproject.org>.
+
+Upstream-Status: Backport [https://repo.or.cz/libtar.git/commit/f3c711cf3054ff366a1a3500cdc8c64ecc2d2da6]
+
+Signed-off-by: Katariina Lounento <katariina.lounento@vaisala.com>
+---
+ libtar/libtar.c | 29 ++++++++++++++++++-----------
+ 1 file changed, 18 insertions(+), 11 deletions(-)
+
+diff --git a/libtar/libtar.c b/libtar/libtar.c
+index bb5644c..23f8741 100644
+--- a/libtar/libtar.c
++++ b/libtar/libtar.c
+@@ -253,6 +253,7 @@ extract(char *tarfile, char *rootdir)
+ 	if (tar_extract_all(t, rootdir) != 0)
+ 	{
+ 		fprintf(stderr, "tar_extract_all(): %s\n", strerror(errno));
++		tar_close(t);
+ 		return -1;
+ 	}
+ 
+@@ -270,12 +271,13 @@ extract(char *tarfile, char *rootdir)
+ 
+ 
+ void
+-usage()
++usage(void *rootdir)
+ {
+ 	printf("Usage: %s [-C rootdir] [-g] [-z] -x|-t filename.tar\n",
+ 	       progname);
+ 	printf("       %s [-C rootdir] [-g] [-z] -c filename.tar ...\n",
+ 	       progname);
++	free(rootdir);
+ 	exit(-1);
+ }
+ 
+@@ -292,6 +294,7 @@ main(int argc, char *argv[])
+ 	int c;
+ 	int mode = 0;
+ 	libtar_list_t *l;
++	int return_code = -2;
+ 
+ 	progname = basename(argv[0]);
+ 
+@@ -313,17 +316,17 @@ main(int argc, char *argv[])
+ 			break;
+ 		case 'c':
+ 			if (mode)
+-				usage();
++				usage(rootdir);
+ 			mode = MODE_CREATE;
+ 			break;
+ 		case 'x':
+ 			if (mode)
+-				usage();
++				usage(rootdir);
+ 			mode = MODE_EXTRACT;
+ 			break;
+ 		case 't':
+ 			if (mode)
+-				usage();
++				usage(rootdir);
+ 			mode = MODE_LIST;
+ 			break;
+ #ifdef HAVE_LIBZ
+@@ -332,7 +335,7 @@ main(int argc, char *argv[])
+ 			break;
+ #endif /* HAVE_LIBZ */
+ 		default:
+-			usage();
++			usage(rootdir);
+ 		}
+ 
+ 	if (!mode || ((argc - optind) < (mode == MODE_CREATE ? 2 : 1)))
+@@ -341,7 +344,7 @@ main(int argc, char *argv[])
+ 		printf("argc - optind == %d\tmode == %d\n", argc - optind,
+ 		       mode);
+ #endif
+-		usage();
++		usage(rootdir);
+ 	}
+ 
+ #ifdef DEBUG
+@@ -351,21 +354,25 @@ main(int argc, char *argv[])
+ 	switch (mode)
+ 	{
+ 	case MODE_EXTRACT:
+-		return extract(argv[optind], rootdir);
++		return_code = extract(argv[optind], rootdir);
++		break;
+ 	case MODE_CREATE:
+ 		tarfile = argv[optind];
+ 		l = libtar_list_new(LIST_QUEUE, NULL);
+ 		for (c = optind + 1; c < argc; c++)
+ 			libtar_list_add(l, argv[c]);
+-		return create(tarfile, rootdir, l);
++		return_code = create(tarfile, rootdir, l);
++		libtar_list_free(l, NULL);
++		break;
+ 	case MODE_LIST:
+-		return list(argv[optind]);
++		return_code = list(argv[optind]);
++		break;
+ 	default:
+ 		break;
+ 	}
+ 
+-	/* NOTREACHED */
+-	return -2;
++	free(rootdir);
++	return return_code;
+ }
+ 
+ 
diff --git a/meta-oe/recipes-support/libtar/files/0008-decode-avoid-using-a-static-buffer-in-th_get_pathnam.patch b/meta-oe/recipes-support/libtar/files/0008-decode-avoid-using-a-static-buffer-in-th_get_pathnam.patch
new file mode 100644
index 0000000000..beba45405e
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/files/0008-decode-avoid-using-a-static-buffer-in-th_get_pathnam.patch
@@ -0,0 +1,89 @@
+From edbee9832475347183a841a8fd5be71f74e10392 Mon Sep 17 00:00:00 2001
+From: Kamil Dudka <kdudka@redhat.com>
+Date: Wed, 23 Oct 2013 15:04:22 +0200
+Subject: [PATCH] decode: avoid using a static buffer in th_get_pathname()
+
+A solution suggested by Chris Frey:
+https://lists.feep.net:8080/pipermail/libtar/2013-October/000377.html
+
+Note this can break programs that expect sizeof(TAR) to be fixed.
+
+Authored by Kamil Dudka <kdudka@redhat.com>.
+
+Upstream-Status: Backport [https://repo.or.cz/libtar.git/commit/ec613af2e9371d7a3e1f7c7a6822164a4255b4d1]
+
+Signed-off-by: Katariina Lounento <katariina.lounento@vaisala.com>
+---
+ lib/decode.c | 24 +++++++++++++++++-------
+ lib/handle.c |  1 +
+ lib/libtar.h |  3 +++
+ 3 files changed, 21 insertions(+), 7 deletions(-)
+
+diff --git a/lib/decode.c b/lib/decode.c
+index c16ea2d..edb2185 100644
+--- a/lib/decode.c
++++ b/lib/decode.c
+@@ -26,20 +26,30 @@
+ char *
+ th_get_pathname(TAR *t)
+ {
+-	static TLS_THREAD char filename[MAXPATHLEN];
+-
+ 	if (t->th_buf.gnu_longname)
+ 		return t->th_buf.gnu_longname;
+ 
+-	if (t->th_buf.prefix[0] != '\0')
++	/* allocate the th_pathname buffer if not already */
++	if (t->th_pathname == NULL)
++	{
++		t->th_pathname = malloc(MAXPATHLEN * sizeof(char));
++		if (t->th_pathname == NULL)
++			/* out of memory */
++			return NULL;
++	}
++
++	if (t->th_buf.prefix[0] == '\0')
++	{
++		snprintf(t->th_pathname, MAXPATHLEN, "%.100s", t->th_buf.name);
++	}
++	else
+ 	{
+-		snprintf(filename, sizeof(filename), "%.155s/%.100s",
++		snprintf(t->th_pathname, MAXPATHLEN, "%.155s/%.100s",
+ 			 t->th_buf.prefix, t->th_buf.name);
+-		return filename;
+ 	}
+ 
+-	snprintf(filename, sizeof(filename), "%.100s", t->th_buf.name);
+-	return filename;
++	/* will be deallocated in tar_close() */
++	return t->th_pathname;
+ }
+ 
+ 
+diff --git a/lib/handle.c b/lib/handle.c
+index 002d23c..a19c046 100644
+--- a/lib/handle.c
++++ b/lib/handle.c
+@@ -122,6 +122,7 @@ tar_close(TAR *t)
+ 		libtar_hash_free(t->h, ((t->oflags & O_ACCMODE) == O_RDONLY
+ 					? free
+ 					: (libtar_freefunc_t)tar_dev_free));
++	free(t->th_pathname);
+ 	free(t);
+ 
+ 	return i;
+diff --git a/lib/libtar.h b/lib/libtar.h
+index 7fc4d03..08a8e0f 100644
+--- a/lib/libtar.h
++++ b/lib/libtar.h
+@@ -85,6 +85,9 @@ typedef struct
+ 	int options;
+ 	struct tar_header th_buf;
+ 	libtar_hash_t *h;
++
++	/* introduced in libtar 1.2.21 */
++	char *th_pathname;
+ }
+ TAR;
+ 
diff --git a/meta-oe/recipes-support/libtar/files/0009-Check-for-NULL-before-freeing-th_pathname.patch b/meta-oe/recipes-support/libtar/files/0009-Check-for-NULL-before-freeing-th_pathname.patch
new file mode 100644
index 0000000000..2d8f21171b
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/files/0009-Check-for-NULL-before-freeing-th_pathname.patch
@@ -0,0 +1,30 @@
+From bc8ec7d940d7ffc870638521bd134098d2efa5df Mon Sep 17 00:00:00 2001
+From: Chris Frey <cdfrey@foursquare.net>
+Date: Thu, 24 Oct 2013 17:55:12 -0400
+Subject: [PATCH] Check for NULL before freeing th_pathname
+
+Thanks to Harald Koch for pointing out that AIX 4 and 5 still need this.
+
+Authored by Chris Frey <cdfrey@foursquare.net>.
+
+Upstream-Status: Backport [https://repo.or.cz/libtar.git/commit/495d0c0eabc5648186e7d58ad54b508d14af38f4]
+
+Signed-off-by: Katariina Lounento <katariina.lounento@vaisala.com>
+---
+ lib/handle.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/handle.c b/lib/handle.c
+index a19c046..28a7dc2 100644
+--- a/lib/handle.c
++++ b/lib/handle.c
+@@ -122,7 +122,8 @@ tar_close(TAR *t)
+ 		libtar_hash_free(t->h, ((t->oflags & O_ACCMODE) == O_RDONLY
+ 					? free
+ 					: (libtar_freefunc_t)tar_dev_free));
+-	free(t->th_pathname);
++	if (t->th_pathname != NULL)
++		free(t->th_pathname);
+ 	free(t);
+ 
+ 	return i;
diff --git a/meta-oe/recipes-support/libtar/files/0010-Added-stdlib.h-for-malloc-in-lib-decode.c.patch b/meta-oe/recipes-support/libtar/files/0010-Added-stdlib.h-for-malloc-in-lib-decode.c.patch
new file mode 100644
index 0000000000..edbd636b23
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/files/0010-Added-stdlib.h-for-malloc-in-lib-decode.c.patch
@@ -0,0 +1,26 @@
+From c64dfdc6ec5bc752aafd1ac16a380f47602197c4 Mon Sep 17 00:00:00 2001
+From: Chris Frey <cdfrey@foursquare.net>
+Date: Thu, 24 Oct 2013 17:58:47 -0400
+Subject: [PATCH] Added stdlib.h for malloc() in lib/decode.c
+
+Authored by Chris Frey <cdfrey@foursquare.net>.
+
+Upstream-Status: Backport [https://repo.or.cz/libtar.git/commit/20aa09bd7775094a2beb0f136c2c7d9e9fd6c7e6]
+
+Signed-off-by: Katariina Lounento <katariina.lounento@vaisala.com>
+---
+ lib/decode.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/decode.c b/lib/decode.c
+index edb2185..35312be 100644
+--- a/lib/decode.c
++++ b/lib/decode.c
+@@ -13,6 +13,7 @@
+ #include <internal.h>
+ 
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <sys/param.h>
+ #include <pwd.h>
+ #include <grp.h>
diff --git a/meta-oe/recipes-support/libtar/files/0011-libtar-fix-programming-mistakes-detected-by-static-a.patch b/meta-oe/recipes-support/libtar/files/0011-libtar-fix-programming-mistakes-detected-by-static-a.patch
new file mode 100644
index 0000000000..7b39df4254
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/files/0011-libtar-fix-programming-mistakes-detected-by-static-a.patch
@@ -0,0 +1,100 @@
+From b469d621c0143e652c51bb238fd2060135aa2009 Mon Sep 17 00:00:00 2001
+From: Kamil Dudka <kdudka@redhat.com>
+Date: Tue, 6 Nov 2018 17:24:05 +0100
+Subject: [PATCH] libtar: fix programming mistakes detected by static analysis
+
+Authored by Kamil Dudka <kdudka@redhat.com>.
+
+meta-openembedded uses Debian's release tarball [1]. Debian uses
+repo.or.cz/libtar.git as their upstream [2]. repo.or.cz/libtar.git has
+been inactive since 2013 [3].
+
+Upstream-Status: Inactive-Upstream [lastrelease: 2013 lastcommit: 2013]
+
+[1] https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libtar/libtar_1.2.20.bb?h=master#n8
+[2] http://svn.kibibyte.se/libtar/trunk/debian/control (rev 51; not tagged)
+[3] https://repo.or.cz/libtar.git/shortlog/refs/heads/master
+
+Signed-off-by: Katariina Lounento <katariina.lounento@vaisala.com>
+---
+ lib/append.c    |  7 +++++++
+ lib/wrapper.c   | 11 +++++++----
+ libtar/libtar.c |  1 +
+ 3 files changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/lib/append.c b/lib/append.c
+index ff58532..6386a50 100644
+--- a/lib/append.c
++++ b/lib/append.c
+@@ -110,9 +110,16 @@ tar_append_file(TAR *t, const char *realname, const char *savename)
+ 		td->td_dev = s.st_dev;
+ 		td->td_h = libtar_hash_new(256, (libtar_hashfunc_t)ino_hash);
+ 		if (td->td_h == NULL)
++		{
++			free(td);
+ 			return -1;
++		}
+ 		if (libtar_hash_add(t->h, td) == -1)
++		{
++			libtar_hash_free(td->td_h, free);
++			free(td);
+ 			return -1;
++		}
+ 	}
+ 	libtar_hashptr_reset(&hp);
+ 	if (libtar_hash_getkey(td->td_h, &hp, &(s.st_ino),
+diff --git a/lib/wrapper.c b/lib/wrapper.c
+index 44cc435..2d3f5b9 100644
+--- a/lib/wrapper.c
++++ b/lib/wrapper.c
+@@ -97,6 +97,7 @@ tar_append_tree(TAR *t, char *realdir, char *savedir)
+ 	struct dirent *dent;
+ 	DIR *dp;
+ 	struct stat s;
++	int ret = -1;
+ 
+ #ifdef DEBUG
+ 	printf("==> tar_append_tree(0x%lx, \"%s\", \"%s\")\n",
+@@ -130,24 +131,26 @@ tar_append_tree(TAR *t, char *realdir, char *savedir)
+ 				 dent->d_name);
+ 
+ 		if (lstat(realpath, &s) != 0)
+-			return -1;
++			goto fail;
+ 
+ 		if (S_ISDIR(s.st_mode))
+ 		{
+ 			if (tar_append_tree(t, realpath,
+ 					    (savedir ? savepath : NULL)) != 0)
+-				return -1;
++				goto fail;
+ 			continue;
+ 		}
+ 
+ 		if (tar_append_file(t, realpath,
+ 				    (savedir ? savepath : NULL)) != 0)
+-			return -1;
++			goto fail;
+ 	}
+ 
++	ret = 0;
++fail:
+ 	closedir(dp);
+ 
+-	return 0;
++	return ret;
+ }
+ 
+ 
+diff --git a/libtar/libtar.c b/libtar/libtar.c
+index 23f8741..ac339e7 100644
+--- a/libtar/libtar.c
++++ b/libtar/libtar.c
+@@ -92,6 +92,7 @@ gzopen_frontend(char *pathname, int oflags, int mode)
+ 	if (!gzf)
+ 	{
+ 		errno = ENOMEM;
++		close(fd);
+ 		return -1;
+ 	}
+ 
diff --git a/meta-oe/recipes-support/libtar/files/CVE-2013-4420.patch b/meta-oe/recipes-support/libtar/files/CVE-2013-4420.patch
new file mode 100644
index 0000000000..93b35cbcd3
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/files/CVE-2013-4420.patch
@@ -0,0 +1,160 @@
+From 2c81f47508fa6bce9df84e3b43dfb16dffb742a0 Mon Sep 17 00:00:00 2001
+From: Raphael Geissert <geissert@debian.org>
+Date: Thu, 12 Sep 2024 15:51:05 +0300
+Subject: [PATCH] Avoid directory traversal when extracting archives
+
+Description of the vulnerability from the NIST CVE tracker [1]:
+
+    Multiple directory traversal vulnerabilities in the (1)
+    tar_extract_glob and (2) tar_extract_all functions in libtar 1.2.20
+    and earlier allow remote attackers to overwrite arbitrary files via
+    a .. (dot dot) in a crafted tar file.
+
+Imported from the Debian libtar package 1.2.20-8 [2]. Original Debian
+description:
+
+    Author: Raphael Geissert <geissert@debian.org>
+    Bug-Debian: https://bugs.debian.org/731860
+    Description: Avoid directory traversal when extracting archives
+    by skipping over leading slashes and any prefix containing ".." components.
+    Forwarded: yes
+
+meta-openembedded uses Debian's release tarball [3]. Debian uses
+repo.or.cz/libtar.git as their upstream [4]. repo.or.cz/libtar.git has
+been inactive since 2013 [5].
+
+CVE: CVE-2013-4420
+
+Upstream-Status: Inactive-Upstream [lastrelease: 2013 lastcommit: 2013]
+
+Comments: Added the commit message
+
+[1] https://nvd.nist.gov/vuln/detail/CVE-2013-4420
+[2] https://sources.debian.org/patches/libtar/1.2.20-8/CVE-2013-4420.patch/
+[3] https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libtar/libtar_1.2.20.bb?h=master#n8
+[4] http://svn.kibibyte.se/libtar/trunk/debian/control (rev 51; not tagged)
+[5] https://repo.or.cz/libtar.git/shortlog/refs/heads/master
+
+Signed-off-by: Katariina Lounento <katariina.lounento@vaisala.com>
+---
+ lib/decode.c   | 33 +++++++++++++++++++++++++++++++--
+ lib/extract.c  |  8 ++++----
+ lib/internal.h |  1 +
+ lib/output.c   |  4 ++--
+ 4 files changed, 38 insertions(+), 8 deletions(-)
+
+diff --git a/lib/decode.c b/lib/decode.c
+index 35312be..edd5f2e 100644
+--- a/lib/decode.c
++++ b/lib/decode.c
+@@ -22,13 +22,42 @@
+ # include <string.h>
+ #endif
+ 
++char *
++safer_name_suffix (char const *file_name)
++{
++	char const *p, *t;
++	p = t = file_name;
++	while (*p == '/') t = ++p;
++	while (*p)
++	{
++		while (p[0] == '.' && p[0] == p[1] && p[2] == '/')
++		{
++			p += 3;
++			t = p;
++		}
++		/* advance pointer past the next slash */
++		while (*p && (p++)[0] != '/');
++	}
++
++	if (!*t)
++	{
++		t = ".";
++	}
++
++	if (t != file_name)
++	{
++		/* TODO: warn somehow that the path was modified */
++	}
++	return (char*)t;
++}
++
+ 
+ /* determine full path name */
+ char *
+ th_get_pathname(TAR *t)
+ {
+ 	if (t->th_buf.gnu_longname)
+-		return t->th_buf.gnu_longname;
++		return safer_name_suffix(t->th_buf.gnu_longname);
+ 
+ 	/* allocate the th_pathname buffer if not already */
+ 	if (t->th_pathname == NULL)
+@@ -50,7 +79,7 @@ th_get_pathname(TAR *t)
+ 	}
+ 
+ 	/* will be deallocated in tar_close() */
+-	return t->th_pathname;
++	return safer_name_suffix(t->th_pathname);
+ }
+ 
+ 
+diff --git a/lib/extract.c b/lib/extract.c
+index 9fc6ad5..4ff1a95 100644
+--- a/lib/extract.c
++++ b/lib/extract.c
+@@ -302,14 +302,14 @@ tar_extract_hardlink(TAR * t, char *realname)
+ 	if (mkdirhier(dirname(filename)) == -1)
+ 		return -1;
+ 	libtar_hashptr_reset(&hp);
+-	if (libtar_hash_getkey(t->h, &hp, th_get_linkname(t),
++	if (libtar_hash_getkey(t->h, &hp, safer_name_suffix(th_get_linkname(t)),
+ 			       (libtar_matchfunc_t)libtar_str_match) != 0)
+ 	{
+ 		lnp = (char *)libtar_hashptr_data(&hp);
+ 		linktgt = &lnp[strlen(lnp) + 1];
+ 	}
+ 	else
+-		linktgt = th_get_linkname(t);
++		linktgt = safer_name_suffix(th_get_linkname(t));
+ 
+ #ifdef DEBUG
+ 	printf("  ==> extracting: %s (link to %s)\n", filename, linktgt);
+@@ -347,9 +347,9 @@ tar_extract_symlink(TAR *t, char *realname)
+ 
+ #ifdef DEBUG
+ 	printf("  ==> extracting: %s (symlink to %s)\n",
+-	       filename, th_get_linkname(t));
++	       filename, safer_name_suffix(th_get_linkname(t)));
+ #endif
+-	if (symlink(th_get_linkname(t), filename) == -1)
++	if (symlink(safer_name_suffix(th_get_linkname(t)), filename) == -1)
+ 	{
+ #ifdef DEBUG
+ 		perror("symlink()");
+diff --git a/lib/internal.h b/lib/internal.h
+index da7be7f..f05ca4f 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -21,3 +21,4 @@
+ #define TLS_THREAD
+ #endif
+ 
++char* safer_name_suffix(char const*);
+diff --git a/lib/output.c b/lib/output.c
+index a5262ee..af754f1 100644
+--- a/lib/output.c
++++ b/lib/output.c
+@@ -124,9 +124,9 @@ th_print_long_ls(TAR *t)
+ 		else
+ 			printf(" link to ");
+ 		if ((t->options & TAR_GNU) && t->th_buf.gnu_longlink != NULL)
+-			printf("%s", t->th_buf.gnu_longlink);
++			printf("%s", safer_name_suffix(t->th_buf.gnu_longlink));
+ 		else
+-			printf("%.100s", t->th_buf.linkname);
++			printf("%.100s", safer_name_suffix(t->th_buf.linkname));
+ 	}
+ 
+ 	putchar('\n');
diff --git a/meta-oe/recipes-support/libtar/files/CVE-2021-33640-CVE-2021-33645-CVE-2021-33646.patch b/meta-oe/recipes-support/libtar/files/CVE-2021-33640-CVE-2021-33645-CVE-2021-33646.patch
new file mode 100644
index 0000000000..0a2773fae2
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/files/CVE-2021-33640-CVE-2021-33645-CVE-2021-33646.patch
@@ -0,0 +1,42 @@
+From e590423f62cf5bc922ff4a1f7eab9bf7d65ee472 Mon Sep 17 00:00:00 2001
+From: Kamil Dudka <kdudka@redhat.com>
+Date: Tue, 4 Oct 2022 10:39:35 +0200
+Subject: [PATCH] free memory allocated by gnu_long* fields
+
+Authored by Kamil Dudka <kdudka@redhat.com>.
+
+meta-openembedded uses Debian's release tarball [1]. Debian uses
+repo.or.cz/libtar.git as their upstream [2]. repo.or.cz/libtar.git has
+been inactive since 2013 [3].
+
+CVE: CVE-2021-33640 CVE-2021-33645 CVE-2021-33646
+
+Upstream-Status: Inactive-Upstream [lastrelease: 2013 lastcommit: 2013]
+
+[1] https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libtar/libtar_1.2.20.bb?h=master#n8
+[2] http://svn.kibibyte.se/libtar/trunk/debian/control (rev 51; not tagged)
+[3] https://repo.or.cz/libtar.git/shortlog/refs/heads/master
+
+Signed-off-by: Katariina Lounento <katariina.lounento@vaisala.com>
+---
+ lib/handle.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/lib/handle.c b/lib/handle.c
+index 28a7dc2..18bd8dc 100644
+--- a/lib/handle.c
++++ b/lib/handle.c
+@@ -122,8 +122,11 @@ tar_close(TAR *t)
+ 		libtar_hash_free(t->h, ((t->oflags & O_ACCMODE) == O_RDONLY
+ 					? free
+ 					: (libtar_freefunc_t)tar_dev_free));
+-	if (t->th_pathname != NULL)
+-		free(t->th_pathname);
++
++	free(t->th_pathname);
++	free(t->th_buf.gnu_longname);
++	free(t->th_buf.gnu_longlink);
++
+ 	free(t);
+ 
+ 	return i;
diff --git a/meta-oe/recipes-support/libtar/files/CVE-2021-33643-CVE-2021-33644.patch b/meta-oe/recipes-support/libtar/files/CVE-2021-33643-CVE-2021-33644.patch
new file mode 100644
index 0000000000..a61cc3b6a9
--- /dev/null
+++ b/meta-oe/recipes-support/libtar/files/CVE-2021-33643-CVE-2021-33644.patch
@@ -0,0 +1,52 @@
+From c778d234c396e78bacef7c9bff0dd2bb9fb6aac8 Mon Sep 17 00:00:00 2001
+From: shixuantong <1726671442@qq.com>
+Date: Wed, 6 Apr 2022 17:40:57 +0800
+Subject: [PATCH] Ensure that sz is greater than 0.
+
+Authored by shixuantong <1726671442@qq.com>.
+
+meta-openembedded uses Debian's release tarball [1]. Debian uses
+repo.or.cz/libtar.git as their upstream [2]. repo.or.cz/libtar.git has
+been inactive since 2013 [3].
+
+CVE: CVE-2021-33643 CVE-2021-33644
+
+Upstream-Status: Inactive-Upstream [lastrelease: 2013 lastcommit: 2013]
+
+[1] https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libtar/libtar_1.2.20.bb?h=master#n8
+[2] http://svn.kibibyte.se/libtar/trunk/debian/control (rev 51; not tagged)
+[3] https://repo.or.cz/libtar.git/shortlog/refs/heads/master
+
+Signed-off-by: Katariina Lounento <katariina.lounento@vaisala.com>
+---
+ lib/block.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/lib/block.c b/lib/block.c
+index 092bc28..f12c4bc 100644
+--- a/lib/block.c
++++ b/lib/block.c
+@@ -118,6 +118,11 @@ th_read(TAR *t)
+ 	if (TH_ISLONGLINK(t))
+ 	{
+ 		sz = th_get_size(t);
++		if ((int)sz <= 0)
++		{
++			errno = EINVAL;
++			return -1;
++		}
+ 		blocks = (sz / T_BLOCKSIZE) + (sz % T_BLOCKSIZE ? 1 : 0);
+ 		if (blocks > ((size_t)-1 / T_BLOCKSIZE))
+ 		{
+@@ -168,6 +173,11 @@ th_read(TAR *t)
+ 	if (TH_ISLONGNAME(t))
+ 	{
+ 		sz = th_get_size(t);
++		if ((int)sz <= 0)
++		{
++			errno = EINVAL;
++			return -1;
++		}
+ 		blocks = (sz / T_BLOCKSIZE) + (sz % T_BLOCKSIZE ? 1 : 0);
+ 		if (blocks > ((size_t)-1 / T_BLOCKSIZE))
+ 		{
diff --git a/meta-oe/recipes-support/libtar/libtar_1.2.20.bb b/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
index f93d9c09a5..c7501ac684 100644
--- a/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
+++ b/meta-oe/recipes-support/libtar/libtar_1.2.20.bb
@@ -8,6 +8,18 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=61cbac6719ae682ce6cd45b5c11e21af"
 SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://fix_libtool_sysroot.patch \
            file://0002-Do-not-strip-libtar.patch \
+           file://0003-Fix-missing-prototype-compiler-warnings.patch \
+           file://0004-Fix-invalid-memory-de-reference-issue.patch \
+           file://0005-fix-file-descriptor-leaks-reported-by-cppcheck.patch \
+           file://0006-fix-memleak-on-tar_open-failure.patch \
+           file://0007-fix-memleaks-in-libtar-sample-program.patch \
+           file://0008-decode-avoid-using-a-static-buffer-in-th_get_pathnam.patch \
+           file://0009-Check-for-NULL-before-freeing-th_pathname.patch \
+           file://0010-Added-stdlib.h-for-malloc-in-lib-decode.c.patch \
+           file://0011-libtar-fix-programming-mistakes-detected-by-static-a.patch \
+           file://CVE-2021-33643-CVE-2021-33644.patch \
+           file://CVE-2021-33640-CVE-2021-33645-CVE-2021-33646.patch \
+           file://CVE-2013-4420.patch \
            "
 
 S = "${WORKDIR}/${BPN}"
-- 
2.46.1


