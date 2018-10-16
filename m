Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id EC21E65CF3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 22:18:49 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [40.117.90.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E6C7E2145D;
	Tue, 16 Oct 2018 22:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1539728331;
	bh=B0C5WUPDScTS+KzpNpZneFDnzIdsUuA3PrVFoIrK6yI=;
	h=From:To:Cc:Subject:Date:From;
	b=JrETO7AW/KUB0Qn4+NIAz/xdwwjGTG5dS5PBk5DNO5a2GvvcNJbx/jxFgd9D5jSIz
	Cz8ZFac9k3WS0ZFsW6PoDzp/SKgILashPowRidzQwfMmQDKGTsy8s/yQJZ+EKXOKbx
	YBoZb/GRmEvmaLcS7km4m+lhprZW+TlZb91kccfA=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Oct 2018 22:18:45 +0000
Message-Id: <20181016221846.5170-1-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [sumo][meta-oe][PATCH v1] sharutils: CVE-2018-1000097
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Oct 2018 22:18:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

*CVE
Sharutils (unshar command) version 4.15.2 contains a Buffer Overflow
vulnerability in Affected component on the file unshar.c at line 75,
function looks_like_c_code. Failure to perform checking of the buffer
containing input line. that can result in Could lead to code execution.
This attack appear to be exploitable via Victim have to run unshar command
on a specially crafted file..

Affects = 4.15.2

CVE: CVE-2018-1000097
Ref: https://people.canonical.com/~ubuntu-security/cve/2018/CVE-2018-1000097.html?_ga=2.104716162.363845622.1539703460-954328166.1533363715
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../sharutils/CVE-2018-1000097.patch          | 61 +++++++++++++++++++
 .../sharutils/sharutils_4.15.2.bb             |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch

diff --git a/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch
new file mode 100644
index 000000000..99dc4e304
--- /dev/null
+++ b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch
@@ -0,0 +1,61 @@
+From bd68ae1271598e8fdc72f2adb457e6882604582d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
+Date: Thu, 22 Feb 2018 16:39:43 +0100
+Subject: [PATCH] Fix a heap-buffer-overflow in find_archive()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+rw_buffer has allocated rw_base_size bytes. But subsequend fgets() in
+find_archive() reads up-to BUFSIZ bytes.
+
+On my system, BUFSIZ is 8192. rw_base_size is usually equaled to
+a memory page size, 4096 on my system. Thus find_archive() can write
+beyonded allocated memmory for rw_buffer array:
+
+$ valgrind -- ./unshar /tmp/id\:000000\,sig\:06\,src\:000005+000030\,op\:splice\,rep\:4
+==30582== Memcheck, a memory error detector
+==30582== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
+==30582== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
+==30582== Command: ./unshar /tmp/id:000000,sig:06,src:000005+000030,op:splice,rep:4
+==30582==
+==30582== Invalid write of size 1
+==30582==    at 0x4EAB480: _IO_getline_info (in /usr/lib64/libc-2.27.so)
+==30582==    by 0x4EB47C2: fgets_unlocked (in /usr/lib64/libc-2.27.so)
+==30582==    by 0x10BF60: fgets_unlocked (stdio2.h:320)
+==30582==    by 0x10BF60: find_archive (unshar.c:243)
+==30582==    by 0x10BF60: unshar_file (unshar.c:379)
+==30582==    by 0x10BCCC: validate_fname (unshar-opts.c:604)
+==30582==    by 0x10BCCC: main (unshar-opts.c:639)
+==30582==  Address 0x523a790 is 0 bytes after a block of size 4,096 alloc'd
+==30582==    at 0x4C2DBBB: malloc (vg_replace_malloc.c:299)
+==30582==    by 0x10C670: init_unshar (unshar.c:450)
+==30582==    by 0x10BC55: main (unshar-opts.c:630)
+
+This was reported in
+<http://lists.gnu.org/archive/html/bug-gnu-utils/2018-02/msg00004.html>.
+
+CVE: CVE-2018-1000097
+Upstream-Status: no upstream [http://lists.gnu.org/archive/html/bug-gnu-utils/2018-02/msg00004.html]
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+---
+ src/unshar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/unshar.c b/src/unshar.c
+index 80bc3a9..0fc3773 100644
+--- a/src/unshar.c
++++ b/src/unshar.c
+@@ -240,7 +240,7 @@ find_archive (char const * name, FILE * file, off_t start)
+       off_t position = ftello (file);
+ 
+       /* Read next line, fail if no more and no previous process.  */
+-      if (!fgets (rw_buffer, BUFSIZ, file))
++      if (!fgets (rw_buffer, rw_base_size, file))
+ 	{
+ 	  if (!start)
+ 	    error (0, 0, _("Found no shell commands in %s"), name);
+-- 
+2.19.0
+
diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
index 812fee955..c12289b5d 100644
--- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
@@ -8,6 +8,7 @@ inherit gettext autotools
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/${BPN}/${BP}.tar.gz \
            file://0001-Fix-build-with-clang.patch \
+           file://CVE-2018-1000097.patch \
 "
 SRC_URI[md5sum] = "32a51b23e25ad5e6af4b89f228be1800"
 SRC_URI[sha256sum] = "ee336e68549664e7a19b117adf02edfdeac6307f22e5ba78baca457116914637"
-- 
2.19.0


