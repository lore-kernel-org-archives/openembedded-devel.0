Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P1cp5-0004A5-Ef
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 12:26:41 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 8673F491286
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Oct 2010 12:26:23 +0200 (CEST)
Received: from localhost.localdomain ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 1 Oct 2010 12:26:23 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Oct 2010 12:25:42 +0200
Message-Id: <1285928742-30435-1-git-send-email-t.fromm@dresearch.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285859228.3805.115.camel@mattotaupa>
References: <1285859228.3805.115.camel@mattotaupa>
X-OriginalArrivalTime: 01 Oct 2010 10:26:23.0410 (UTC)
	FILETIME=[18A90120:01CB6153]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] vim-7.2: remove quotes from CC in configure.in
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
X-List-Received-Date: Fri, 01 Oct 2010 10:26:41 -0000

configure.in features quotes around some calls to $CC (i.e. it calls
"$CC"). CC is, however, not always just the compiler name. In OpenEmbedded
CC looks more like "arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb".

configure executes tests in a form like
res=`"$CC" --some-arg`
The shell tries to run the whole contents of the CC variable - not just the first string
- as _one_ command, which will fail.

However, these errors remain unnoticed during the configure run:

...
configure: line 3707: arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb: command not found
...
checking for setjmp.h... yes
checking for GCC 3 or later... /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/vim-7.2-r7.1/vim72/src/configure: line 11329: test: : integer expression expected
no
checking whether we need -D_FORTIFY_SOURCE=1... /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/vim-7.2-r7.1/vim72/src/configure: line 11339: test: : integer expression expected
no
...

But finally:

...
configure: creating ./config.status
config.status: creating auto/config.mk
config.status: creating auto/config.h

So the configure step had errors, but didn't report any.

This patch removes the quotes around the CC variable in configure.in.

Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>
---
 .../vim/files/configure.in_remove_CC_quotes.patch  |   17 +++++++++++++++++
 recipes/vim/vim.inc                                |    2 +-
 recipes/vim/vim_7.2.bb                             |    2 ++
 3 files changed, 20 insertions(+), 1 deletions(-)
 create mode 100644 recipes/vim/files/configure.in_remove_CC_quotes.patch

diff --git a/recipes/vim/files/configure.in_remove_CC_quotes.patch b/recipes/vim/files/configure.in_remove_CC_quotes.patch
new file mode 100644
index 0000000..c8cfe8e
--- /dev/null
+++ b/recipes/vim/files/configure.in_remove_CC_quotes.patch
@@ -0,0 +1,17 @@
+upstream: http://groups.google.com/group/vim_dev/browse_thread/thread/5685c3b859e3c793# 
+status: reported upstream
+--- vim72-orig/src/configure.in	2010-09-29 19:13:33.000000000 +0200
++++ vim72/src/configure.in	2010-09-29 19:17:07.000000000 +0200
+@@ -35,10 +35,10 @@
+ fi
+ if test "$GCC" = yes; then
+   dnl method that should work for nearly all versions
+-  gccversion=`"$CC" -dumpversion`
++  gccversion=`$CC -dumpversion`
+   if test "x$gccversion" = "x"; then
+     dnl old method; fall-back for when -dumpversion doesn't work
+-    gccversion=`"$CC" --version | sed -e '2,$d' -e 's/darwin.//' -e 's/^[[^0-9]]*\([[0-9]]\.[[0-9.]]*\).*$/\1/g'`
++    gccversion=`$CC --version | sed -e '2,$d' -e 's/darwin.//' -e 's/^[[^0-9]]*\([[0-9]]\.[[0-9.]]*\).*$/\1/g'`
+   fi
+   dnl version 4.0.1 was reported to cause trouble on Macintosh by Marcin Dalecki
+   if test "$gccversion" = "3.0.1" -o "$gccversion" = "3.0.2" -o "$gccversion" = "4.0.1"; then
diff --git a/recipes/vim/vim.inc b/recipes/vim/vim.inc
index aa93527..1e71d52 100644
--- a/recipes/vim/vim.inc
+++ b/recipes/vim/vim.inc
@@ -5,7 +5,7 @@ DEPENDS = "ncurses"
 RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 SRC_URI = "ftp://ftp.vim.org/pub/vim/unix/vim-${PV}.tar.bz2;name=vim${PV}tarbz2 \
            ftp://ftp.vim.org/pub/vim/extra/vim-${PV}-extra.tar.gz;name=vim${PV}extratargz \
diff --git a/recipes/vim/vim_7.2.bb b/recipes/vim/vim_7.2.bb
index d79f787..eafbeef 100644
--- a/recipes/vim/vim_7.2.bb
+++ b/recipes/vim/vim_7.2.bb
@@ -15,11 +15,13 @@ PR = "${INC_PR}.1"
 
 # 001-411.diff contains 411 patches fetched from upstream
 SRC_URI += "file://001-411.diff;apply=no"
+SRC_URI += "file://configure.in_remove_CC_quotes.patch;apply=no"
 
 # we need to apply patches in other dir then ${S}
 do_applypatch() {
 	cd ${WORKDIR}/vim${VIMVER}
 	patch -p1 <${WORKDIR}/001-411.diff
+	patch -p1 <${WORKDIR}/configure.in_remove_CC_quotes.patch
 }
 
 addtask applypatch after do_unpack before do_patch
-- 
1.7.0.4



