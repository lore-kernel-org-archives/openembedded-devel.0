Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 61357745A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 02:48:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6K2m1n5000946
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 19:48:01 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 19 Jul 2018 19:48:00 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20180720024535.20159-1-mingli.yu@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B514C08.1000702@windriver.com>
Date: Fri, 20 Jul 2018 10:42:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20180720024535.20159-1-mingli.yu@windriver.com>
X-Originating-IP: [128.224.162.173]
Subject: Re: [meta-oe][PATCH] liblockfile: Upgrade to 1.14
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
X-List-Received-Date: Fri, 20 Jul 2018 02:48:00 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Please ignore this patch.

Thanks,

On 2018年07月20日 10:45, mingli.yu@windriver.com wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> * Licence-Update:
>    - Copyright years are updated from 2011 to 2016
>    - The text as below
>      "On Debian GNU/Linux systems, the complete text of the GNU Lesser General \
>       Public License can be found in `/usr/share/common-licenses/LGPL-2'. You can \
>       also find a copy on the GNU website at http://www.gnu.org"
>      updated to
>      "The complete LGPL-2 license is included in the licenses/ directory."
> * Compared to liblockfile_1.09.orig.tar.gz unpack to
>    ${WORKDIR}/${BPN}-${PV}, liblockfile_1.14.orig.tar.gz
>    unpack to ${WORKDIR}/${BPN} now.
>    Add S = "${WORKDIR}/${BPN}" to fix the gap
> * Remove two backported patch
>    - install.patch
>    - ldflags.patch
> * Use DESTDIR instead of the previous ROOT and add
>    patch 0001-Makefile.in-add-DESTDIR.patch to fix
>    below issue:
>    | install -d -m 755 -g root -p /usr/include
>    | install -d -m 755 -g root -p /usr/lib
>    | install -d -m 755 -g root -p /usr/bin
>    | install -m 755 nfslock.so.0.1 /usr/lib
>    | install -d -m 755 -g root -p /usr/share/man/man1
>    | install: cannot create regular file '/usr/lib/nfslock.so.0.1': Permission denied
>    | Makefile:78: recipe for target 'install_nfslib' failed
>    | make: *** [install_nfslib] Error 1
>    | make: *** Waiting for unfinished jobs....
>    | install -d -m 755 -g root -p /usr/share/man/man3
>    | install -m 644 lockfile.h maillock.h /usr/include
>    | install: cannot create regular file '/usr/include/lockfile.h': Permission denied
>    | install: cannot create regular file '/usr/include/maillock.h': Permission denied
>    | Makefile:64: recipe for target 'install_common' failed
>    | make: *** [install_common] Error 1
> * Rework patch:
>    - Rework liblockfile-fix-nfslib-and-soname.patch to
>      0001-Makefile.in-install-nfslock.so-and-nfslock.so.0.patch
>      as the previous patch partly in upstream
>    - liblockfile-fix-install-so-to-man-dir.patch
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   .../liblockfile-1.09/install.patch            | 48 -----------------
>   .../liblockfile-1.09/ldflags.patch            | 21 --------
>   ...iblockfile-fix-install-so-to-man-dir.patch | 20 -------
>   .../liblockfile-fix-nfslib-and-soname.patch   | 54 -------------------
>   .../0001-Makefile.in-add-DESTDIR.patch        | 54 +++++++++++++++++++
>   ...-install-nfslock.so-and-nfslock.so.0.patch | 31 +++++++++++
>   .../configure.patch                           |  0
>   ...iblockfile-fix-install-so-to-man-dir.patch | 33 ++++++++++++
>   .../liblockfile/liblockfile_1.09.bb           | 35 ------------
>   .../liblockfile/liblockfile_1.14.bb           | 37 +++++++++++++
>   10 files changed, 155 insertions(+), 178 deletions(-)
>   delete mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.09/install.patch
>   delete mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.09/ldflags.patch
>   delete mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-install-so-to-man-dir.patch
>   delete mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-nfslib-and-soname.patch
>   create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-add-DESTDIR.patch
>   create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-install-nfslock.so-and-nfslock.so.0.patch
>   rename meta-oe/recipes-extended/liblockfile/{liblockfile-1.09 => liblockfile}/configure.patch (100%)
>   create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile/liblockfile-fix-install-so-to-man-dir.patch
>   delete mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
>   create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
>
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/install.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/install.patch
> deleted file mode 100644
> index a9319ff1e..000000000
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/install.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -
> -#
> -# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
> -#
> -
> ---- liblockfile-1.05/Makefile.in~install
> -+++ liblockfile-1.05/Makefile.in
> -@@ -20,6 +20,7 @@
> - includedir	= @includedir@
> -
> - MAILGROUP	= @MAILGROUP@
> -+INSTGRP		= $(if $(MAILGROUP),-g $(MAILGROUP))
> -
> - all:		@TARGETS@
> - install:	@INSTALL_TARGETS@
> -@@ -50,25 +51,27 @@
> - 		$(CC) $(CFLAGS) -c lockfile.c -o xlockfile.o
> -
> - install_static:	static install_common
> -+		install -d $(ROOT)$(libdir)
> - 		install -m 644 liblockfile.a $(ROOT)$(libdir)
> -
> - install_shared:	shared install_common
> -+		install -d $(ROOT)$(libdir)
> - 		install -m 755 liblockfile.so \
> - 			$(ROOT)$(libdir)/liblockfile.so.$(VER)
> - 		ln -s liblockfile.so.$(VER) $(ROOT)$(libdir)/liblockfile.so
> - 		if test "$(ROOT)" = ""; then @LDCONFIG@; fi
> -
> - install_common:
> -+		install -d $(ROOT)$(includedir)
> - 		install -m 644 lockfile.h maillock.h $(ROOT)$(includedir)
> --		if [ "$(MAILGROUP)" != "" ]; then\
> --		  install -g $(MAILGROUP) -m 2755 dotlockfile $(ROOT)$(bindir);\
> --		else \
> --		  install -g root -m 755 dotlockfile $(ROOT)$(bindir); \
> --		fi
> -+		install -d $(ROOT)$(bindir)
> -+		install -m 755 $(INSTGRP) dotlockfile $(ROOT)$(bindir)
> -+		install -d $(ROOT)$(mandir)/man1 $(ROOT)$(mandir)/man3
> - 		install -m 644 *.1 $(ROOT)$(mandir)/man1
> - 		install -m 644 *.3 $(ROOT)$(mandir)/man3
> -
> - install_nfslib:	nfslib
> -+		install -d $(ROOT)$(nfslockdir)
> - 		install -m 755 nfslock.so.$(VER) $(ROOT)$(nfslockdir)
> - 		if test "$(ROOT)" = ""; then @LDCONFIG@; fi
> -
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/ldflags.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/ldflags.patch
> deleted file mode 100644
> index eb1d1478b..000000000
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/ldflags.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -
> -#
> -# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
> -#
> -
> ---- liblockfile-1.05/Makefile.in~ldflags
> -+++ liblockfile-1.05/Makefile.in
> -@@ -34,11 +34,11 @@
> -
> - liblockfile.so: liblockfile.a
> - 		$(CC) -fPIC -shared -Wl,-soname,liblockfile.so.1 \
> --			-o liblockfile.so lockfile.o -lc
> -+			-o liblockfile.so lockfile.o $(LDFLAGS) -lc
> -
> - nfslock.so.$(VER):	nfslock.o
> - 		$(CC) -fPIC -shared -Wl,-soname,nfslock.so.0 \
> --			-o nfslock.so.$(NVER) nfslock.o
> -+			-o nfslock.so.$(NVER) nfslock.o $(LDFLAGS)
> -
> - dotlockfile:	dotlockfile.o xlockfile.o
> - 		$(CC) $(LDFLAGS) -o dotlockfile dotlockfile.o xlockfile.o
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-install-so-to-man-dir.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-install-so-to-man-dir.patch
> deleted file mode 100644
> index 27f760c83..000000000
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-install-so-to-man-dir.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Upstream-Status: Inappropriate [no upstream]
> -
> -The extend so file is rename from nfslock.so.$(VER) to nfslock.so.$(NVER). That
> -causes file nfslock.so.0.1 is installed into manual directory. Fix it.
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index a589fb8..46a57e8 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -68,7 +68,7 @@ install_common:
> - 		install -d $(ROOT)$(bindir)
> - 		install -m 755 $(INSTGRP) dotlockfile $(ROOT)$(bindir)
> - 		install -d $(ROOT)$(mandir)/man1 $(ROOT)$(mandir)/man3
> --		install -m 644 *.1 $(ROOT)$(mandir)/man1
> -+		install -m 644 dotlockfile.1 $(ROOT)$(mandir)/man1
> - 		install -m 644 *.3 $(ROOT)$(mandir)/man3
> -
> - install_nfslib:	nfslib
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-nfslib-and-soname.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-nfslib-and-soname.patch
> deleted file mode 100644
> index ffd7a40fa..000000000
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/liblockfile-fix-nfslib-and-soname.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -Upstream-Status: Inappropriate [no upstream]
> -
> -* nfslib should use NVER instead of VER
> -* install the missing soname library
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - Makefile.in         |    9 ++++++---
> - 1 files changed, 5 insertions(+), 3 deletions(-)
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index 836ca9b..a589fb8 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -27,7 +27,7 @@ install:	@INSTALL_TARGETS@
> -
> - static:		liblockfile.a dotlockfile
> - shared:		liblockfile.so dotlockfile
> --nfslib:		nfslock.so.$(VER)
> -+nfslib:		nfslock.so.$(NVER)
> -
> - liblockfile.a:	lockfile.o
> - 		$(AR) rv liblockfile.a lockfile.o
> -@@ -36,7 +36,7 @@ liblockfile.so: liblockfile.a
> - 		$(CC) -fPIC -shared -Wl,-soname,liblockfile.so.1 \
> - 			-o liblockfile.so lockfile.o $(LDFLAGS) -lc
> -
> --nfslock.so.$(VER):	nfslock.o
> -+nfslock.so.$(NVER):	nfslock.o
> - 		$(CC) -fPIC -shared -Wl,-soname,nfslock.so.0 \
> - 			-o nfslock.so.$(NVER) nfslock.o $(LDFLAGS)
> -
> -@@ -59,6 +59,7 @@ install_shared:	shared install_common
> - 		install -m 755 liblockfile.so \
> - 			$(ROOT)$(libdir)/liblockfile.so.$(VER)
> - 		ln -s liblockfile.so.$(VER) $(ROOT)$(libdir)/liblockfile.so
> -+		ln -s liblockfile.so.$(VER) $(ROOT)$(libdir)/liblockfile.so.1
> - 		if test "$(ROOT)" = ""; then @LDCONFIG@; fi
> -
> - install_common:
> -@@ -72,7 +73,9 @@ install_common:
> -
> - install_nfslib:	nfslib
> - 		install -d $(ROOT)$(nfslockdir)
> --		install -m 755 nfslock.so.$(VER) $(ROOT)$(nfslockdir)
> -+		install -m 755 nfslock.so.$(NVER) $(ROOT)$(nfslockdir)
> -+		ln -sf nfslock.so.$(NVER) $(ROOT)$(libdir)/nfslock.so
> -+		ln -sf nfslock.so.$(NVER) $(ROOT)$(libdir)/nfslock.so.0
> - 		if test "$(ROOT)" = ""; then @LDCONFIG@; fi
> -
> - clean:
> ---
> -1.7.9.5
> -
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-add-DESTDIR.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-add-DESTDIR.patch
> new file mode 100644
> index 000000000..ea415dd8b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-add-DESTDIR.patch
> @@ -0,0 +1,54 @@
> +From 67843dabe1177840697839b916fd899218893ec7 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Thu, 19 Jul 2018 00:25:23 -0700
> +Subject: [PATCH] Makefile.in: add DESTDIR
> +
> +Add DESTDIR to fix below error during do_install
> +
> +| install -d -m 755 -g root -p /usr/include
> +| install -d -m 755 -g root -p /usr/lib
> +| install -d -m 755 -g root -p /usr/bin
> +| install -m 755 nfslock.so.0.1 /usr/lib
> +| install -d -m 755 -g root -p /usr/share/man/man1
> +| install: cannot create regular file '/usr/lib/nfslock.so.0.1': Permission denied
> +| Makefile:78: recipe for target 'install_nfslib' failed
> +| make: *** [install_nfslib] Error 1
> +| make: *** Waiting for unfinished jobs....
> +| install -d -m 755 -g root -p /usr/share/man/man3
> +| install -m 644 lockfile.h maillock.h /usr/include
> +| install: cannot create regular file '/usr/include/lockfile.h': Permission denied
> +| install: cannot create regular file '/usr/include/maillock.h': Permission denied
> +| Makefile:64: recipe for target 'install_common' failed
> +| make: *** [install_common] Error 1
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + Makefile.in | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 36a6d23..1e4130e 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -12,11 +12,11 @@ CC		= @CC@
> +
> + prefix		= $(DESTDIR)@prefix@
> + exec_prefix	= @exec_prefix@
> +-bindir		= @bindir@
> +-libdir		= @libdir@
> +-mandir		= @mandir@
> +-nfslockdir	= @nfslockdir@
> +-includedir	= @includedir@
> ++bindir		= $(DESTDIR)@bindir@
> ++libdir		= $(DESTDIR)@libdir@
> ++mandir		= $(DESTDIR)@mandir@
> ++nfslockdir	= $(DESTDIR)@nfslockdir@
> ++includedir	= $(DESTDIR)@includedir@
> + datarootdir	= @datarootdir@
> + MAILGROUP	= @MAILGROUP@
> +
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-install-nfslock.so-and-nfslock.so.0.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-install-nfslock.so-and-nfslock.so.0.patch
> new file mode 100644
> index 000000000..a6b297b59
> --- /dev/null
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-install-nfslock.so-and-nfslock.so.0.patch
> @@ -0,0 +1,31 @@
> +From 631d46efff2a6d8970e202ba5422ebedd17a8d2f Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Thu, 19 Jul 2018 01:00:10 -0700
> +Subject: [PATCH] Makefile.in: install nfslock.so and nfslock.so.0
> +
> +* install the missing soname library
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + Makefile.in | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 1e4130e..0f1b506 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -77,6 +77,8 @@ install_common:
> + install_nfslib:	nfslib
> + 		install -d -m 755 -g root -p $(nfslockdir)
> + 		install -m 755 nfslock.so.$(NFSVER) $(nfslockdir)
> ++		ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so
> ++		ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so.0
> + 		if test "$(DESTDIR)" = ""; then @LDCONFIG@; fi
> +
> + clean:
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/configure.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/configure.patch
> similarity index 100%
> rename from meta-oe/recipes-extended/liblockfile/liblockfile-1.09/configure.patch
> rename to meta-oe/recipes-extended/liblockfile/liblockfile/configure.patch
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/liblockfile-fix-install-so-to-man-dir.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/liblockfile-fix-install-so-to-man-dir.patch
> new file mode 100644
> index 000000000..da2503339
> --- /dev/null
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/liblockfile-fix-install-so-to-man-dir.patch
> @@ -0,0 +1,33 @@
> +From 363eb1aaeca914c7d36a2cdaf1417e4f87af4c22 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Thu, 19 Jul 2018 01:12:47 -0700
> +Subject: [PATCH] Makefile.in: define dotlockfile.1 installed to man
> +
> +Explicitly define dotlockfile.1 installed to man
> +dir to avoid nfslock.so.0.1 is installed into man
> +directory
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 0f1b506..6e53179 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -71,7 +71,7 @@ install_common:
> + 		else \
> + 		  install -g root -m 755 dotlockfile $(bindir); \
> + 		fi
> +-		install -m 644 *.1 $(mandir)/man1
> ++		install -m 644 dotlockfile.1 $(mandir)/man1
> + 		install -m 644 *.3 $(mandir)/man3
> +
> + install_nfslib:	nfslib
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
> deleted file mode 100644
> index 0c41afa3c..000000000
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -SUMMARY = "File locking library"
> -HOMEPAGE = "http://packages.qa.debian.org/libl/liblockfile.html"
> -SECTION = "libs"
> -LICENSE = "LGPLv2+ & GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=ac284a60d48eaa4bc811cddc377fa341"
> -
> -SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.09.orig.tar.gz \
> -    ${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.09-6.debian.tar.bz2;name=1.09-6 \
> -    file://install.patch \
> -    file://configure.patch \
> -    file://ldflags.patch \
> -    file://liblockfile-fix-nfslib-and-soname.patch \
> -    file://liblockfile-fix-install-so-to-man-dir.patch \
> -"
> -
> -SRC_URI[md5sum] = "2aa269e4405ee8235ff17d1b357c6ae8"
> -SRC_URI[sha256sum] = "16979eba05396365e1d6af7100431ae9d32f9bc063930d1de66298a0695f1b7f"
> -
> -SRC_URI[1.09-6.md5sum] = "a2811807e63a526c07b0f60626e329a2"
> -SRC_URI[1.09-6.sha256sum] = "d45eacb7c637c16d03c777c55989d98da494ae9584a0783fe6dbf0db60fa290f"
> -
> -inherit autotools-brokensep
> -
> -# set default mailgroup to mail
> -# --with-libnfslock specify where to install nfslock.so.NVER
> -EXTRA_OECONF = "--enable-shared \
> -                --with-mailgroup=mail \
> -                --with-libnfslock=${libdir} \
> -"
> -
> -# Makefile using ROOT not DESTDIR
> -EXTRA_OEMAKE += "ROOT=${D}"
> -
> -FILES_${PN} += "${libdir}/nfslock.so.*"
> -FILES_${PN}-dev += "${libdir}/nfslock.so"
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
> new file mode 100644
> index 000000000..de2c1e36d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
> @@ -0,0 +1,37 @@
> +SUMMARY = "File locking library"
> +HOMEPAGE = "http://packages.qa.debian.org/libl/liblockfile.html"
> +SECTION = "libs"
> +LICENSE = "LGPLv2+ & GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f4ba6ad04fcb05cc30a4cfa5062c55a3"
> +
> +SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14.orig.tar.gz \
> +    ${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14-1.debian.tar.bz2;name=1.14-1 \
> +    file://configure.patch \
> +    file://0001-Makefile.in-add-DESTDIR.patch \
> +    file://0001-Makefile.in-install-nfslock.so-and-nfslock.so.0.patch \
> +    file://liblockfile-fix-install-so-to-man-dir.patch \
> +"
> +
> +SRC_URI[md5sum] = "420c056ba0cc4d1477e402f70ba2f5eb"
> +SRC_URI[sha256sum] = "ab40d4a3e8cbc204f7e87fea637a4e4ddf9a1149aaa0a723a4267febd0b1d060"
> +
> +SRC_URI[1.14-1.md5sum] = "f9a44928c3477d218c56252712ebc479"
> +SRC_URI[1.14-1.sha256sum] = "73f9be769e602149391588c28f0f4f5cda131e30fb94c0777dbb23d811ac21ff"
> +
> +S = "${WORKDIR}/${BPN}"
> +
> +inherit autotools-brokensep
> +
> +# set default mailgroup to mail
> +# --with-libnfslock specify where to install nfslock.so.NVER
> +EXTRA_OECONF = "--enable-shared \
> +                --with-mailgroup=mail \
> +                --with-libnfslock=${libdir} \
> +"
> +
> +# Makefile using DESTDIR as the change in e35f9eabcbba224ecc70b145d5d2a2d81064c195
> +# at https://github.com/miquels/liblockfile.git
> +EXTRA_OEMAKE += "DESTDIR=${D}"
> +
> +FILES_${PN} += "${libdir}/nfslock.so.*"
> +FILES_${PN}-dev += "${libdir}/nfslock.so"
>

