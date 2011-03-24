Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2iKE-0004eR-QR for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 12:03:35 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2iIS-0002OY-On for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 12:01:44 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 12:01:44 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 12:01:44 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 24 Mar 2011 12:01:32 +0100
Message-ID: <imf8ac$l91$1@dough.gmane.org>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 01/12] libnl: rename libnl2 to libnl as used in openembedded-core
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
X-List-Received-Date: Thu, 24 Mar 2011 11:03:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-03-11 15:00, Martin Jansa wrote:
> * libnl1/libnl2 still conflicts even when using separate includedir so
>   it will be easier for distro maintainers to use only libnl1 or libnl2
>   by PREFERRED_VERSION
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I added this into my maintenance staging branch:
http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance

If testing shows no regressions I'm going to do a pull request for it
next week.

> ---
>  .../libnl/files/dont-link-libnl-from-sysroot.patch |   26 -------------------
>  recipes/libnl/files/fix-includes.patch             |   13 ---------
>  recipes/libnl/files/fix-pc-file.patch              |   11 --------
>  recipes/libnl/files/local-includes.patch           |   12 ---------
>  recipes/libnl/files/netlink-local-fix.patch        |   12 ---------
>  recipes/libnl/files/respect-ldflags.patch          |   12 ---------
>  .../libnl-1.1/dont-link-libnl-from-sysroot.patch   |   26 +++++++++++++++++++
>  recipes/libnl/libnl-1.1/fix-includes.patch         |   13 +++++++++
>  recipes/libnl/libnl-1.1/local-includes.patch       |   12 +++++++++
>  recipes/libnl/libnl-1.1/netlink-local-fix.patch    |   12 +++++++++
>  recipes/libnl/libnl-1.1/respect-ldflags.patch      |   12 +++++++++
>  recipes/libnl/libnl/fix-pc-file.patch              |   11 ++++++++
>  recipes/libnl/libnl/fix-pktloc-dep-race.patch      |   20 ++++++++++++++
>  recipes/libnl/libnl2/fix-pc-file.patch             |   11 --------
>  recipes/libnl/libnl2/fix-pktloc-dep-race.patch     |   20 --------------
>  recipes/libnl/libnl2_2.0.bb                        |   27 --------------------
>  recipes/libnl/libnl2_git.bb                        |   27 --------------------
>  recipes/libnl/libnl_2.0.bb                         |   27 ++++++++++++++++++++
>  recipes/libnl/libnl_git.bb                         |   27 ++++++++++++++++++++
>  19 files changed, 160 insertions(+), 171 deletions(-)
>  delete mode 100644 recipes/libnl/files/dont-link-libnl-from-sysroot.patch
>  delete mode 100644 recipes/libnl/files/fix-includes.patch
>  delete mode 100644 recipes/libnl/files/fix-pc-file.patch
>  delete mode 100644 recipes/libnl/files/local-includes.patch
>  delete mode 100644 recipes/libnl/files/netlink-local-fix.patch
>  delete mode 100644 recipes/libnl/files/respect-ldflags.patch
>  create mode 100644 recipes/libnl/libnl-1.1/dont-link-libnl-from-sysroot.patch
>  create mode 100644 recipes/libnl/libnl-1.1/fix-includes.patch
>  create mode 100644 recipes/libnl/libnl-1.1/local-includes.patch
>  create mode 100644 recipes/libnl/libnl-1.1/netlink-local-fix.patch
>  create mode 100644 recipes/libnl/libnl-1.1/respect-ldflags.patch
>  create mode 100644 recipes/libnl/libnl/fix-pc-file.patch
>  create mode 100644 recipes/libnl/libnl/fix-pktloc-dep-race.patch
>  delete mode 100644 recipes/libnl/libnl2/fix-pc-file.patch
>  delete mode 100644 recipes/libnl/libnl2/fix-pktloc-dep-race.patch
>  delete mode 100644 recipes/libnl/libnl2_2.0.bb
>  delete mode 100644 recipes/libnl/libnl2_git.bb
>  create mode 100644 recipes/libnl/libnl_2.0.bb
>  create mode 100644 recipes/libnl/libnl_git.bb
> 
> diff --git a/recipes/libnl/files/dont-link-libnl-from-sysroot.patch b/recipes/libnl/files/dont-link-libnl-from-sysroot.patch
> deleted file mode 100644
> index beb6361..0000000
> --- a/recipes/libnl/files/dont-link-libnl-from-sysroot.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Index: libnl-1.1/src/Makefile
> -===================================================================
> ---- libnl-1.1.orig/src/Makefile	2008-01-14 07:48:45.000000000 -0800
> -+++ libnl-1.1/src/Makefile	2010-09-22 14:58:46.820826001 -0700
> -@@ -13,7 +13,7 @@ ifeq ($(shell [ ! -r ../Makefile.opts ]
> -     include ../Makefile.opts
> - endif
> - 
> --LDFLAGS	+= -L../lib -lnl utils.o
> -+LDFLAGS	+= ../lib/libnl.so utils.o
> - CIN 	:= $(wildcard nl-*.c) $(wildcard genl-*.c) $(wildcard nf-*.c)
> - TOOLS	:= $(CIN:%.c=%)
> - 
> -Index: libnl-1.1/tests/Makefile
> -===================================================================
> ---- libnl-1.1.orig/tests/Makefile	2008-01-14 07:48:45.000000000 -0800
> -+++ libnl-1.1/tests/Makefile	2010-09-22 14:58:46.820826001 -0700
> -@@ -13,7 +13,7 @@ ifeq ($(shell [ ! -r ../Makefile.opts ]
> -     include ../Makefile.opts
> - endif
> - 
> --LDFLAGS	+= -L../lib -lnl ../src/utils.o
> -+LDFLAGS	+= ../lib/libnl.so ../src/utils.o
> - CIN 	:= $(wildcard test-*.c)
> - TOOLS	:= $(CIN:%.c=%)
> - 
> diff --git a/recipes/libnl/files/fix-includes.patch b/recipes/libnl/files/fix-includes.patch
> deleted file mode 100644
> index b172fd2..0000000
> --- a/recipes/libnl/files/fix-includes.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -diff -ruN libnl-1.1/lib/route/link/vlan.c libnl-1.1-new/lib/route/link/vlan.c
> ---- libnl-1.1/lib/route/link/vlan.c	2008-01-14 18:48:45.000000000 +0300
> -+++ libnl-1.1-new/lib/route/link/vlan.c	2009-01-30 10:55:09.000000000 +0300
> -@@ -26,7 +26,9 @@
> - #include <netlink/route/link/info-api.h>
> - #include <netlink/route/link/vlan.h>
> - 
> -+#ifndef VLAN_FLAG_REORDER_HDR
> - #include <linux/if_vlan.h>
> -+#endif
> - 
> - /** @cond SKIP */
> - #define VLAN_HAS_ID		(1<<0)
> diff --git a/recipes/libnl/files/fix-pc-file.patch b/recipes/libnl/files/fix-pc-file.patch
> deleted file mode 100644
> index 77f3e88..0000000
> --- a/recipes/libnl/files/fix-pc-file.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -Index: git/libnl-2.0.pc.in
> -===================================================================
> ---- git.orig/libnl-2.0.pc.in
> -+++ git/libnl-2.0.pc.in
> -@@ -6,5 +6,5 @@
> - Name: libnl
> - Description: Convenience library for netlink sockets
> - Version: @PACKAGE_VERSION@
> --Libs: -L${libdir} -lnl
> -+Libs: -L${libdir} -lnl -lnl-genl -lnl-nf -lnl-route
> - Cflags: -I${includedir}
> diff --git a/recipes/libnl/files/local-includes.patch b/recipes/libnl/files/local-includes.patch
> deleted file mode 100644
> index 85659db..0000000
> --- a/recipes/libnl/files/local-includes.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -diff -urN libnl-1.1.orig/Makefile.opts.in libnl-1.1/Makefile.opts.in
> ---- libnl-1.1.orig/Makefile.opts.in	2008-01-14 15:48:45.000000000 +0000
> -+++ libnl-1.1/Makefile.opts.in	2009-04-06 10:20:40.000000000 +0000
> -@@ -10,7 +10,7 @@
> - #
> - 
> - CC               := @CC@
> --CFLAGS           := @CFLAGS@
> -+CFLAGS           := -I./include -I. -I../include @CFLAGS@
> - LDFLAGS          := @LDFLAGS@
> - CPPFLAGS         := @CPPFLAGS@
> - PACKAGE_NAME     := @PACKAGE_NAME@
> diff --git a/recipes/libnl/files/netlink-local-fix.patch b/recipes/libnl/files/netlink-local-fix.patch
> deleted file mode 100644
> index 51c6736..0000000
> --- a/recipes/libnl/files/netlink-local-fix.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -Index: libnl-1.1/include/netlink-local.h
> -===================================================================
> ---- libnl-1.1.orig/include/netlink-local.h	2009-06-18 15:28:32.614209645 +0400
> -+++ libnl-1.1/include/netlink-local.h	2009-06-18 15:28:44.094190518 +0400
> -@@ -26,6 +26,7 @@
> - #include <sys/socket.h>
> - #include <inttypes.h>
> - #include <assert.h>
> -+#include <limits.h>
> - 
> - #include <arpa/inet.h>
> - #include <netdb.h>
> diff --git a/recipes/libnl/files/respect-ldflags.patch b/recipes/libnl/files/respect-ldflags.patch
> deleted file mode 100644
> index ba97dc6..0000000
> --- a/recipes/libnl/files/respect-ldflags.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -diff -urN libnl-1.1.orig/lib/Makefile libnl-1.1/lib/Makefile
> ---- libnl-1.1.orig/lib/Makefile	2008-01-14 15:48:45.000000000 +0000
> -+++ libnl-1.1/lib/Makefile	2009-04-06 10:16:21.000000000 +0000
> -@@ -48,7 +48,7 @@
> - 
> - $(OUT_SLIB): ../Makefile.opts $(OBJ)
> - 	@echo "  LD $(OUT_SLIB)"; \
> --	$(CC) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
> -+	$(CC) $(LDFLAGS) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
> - 	@echo "  LN $(OUT_SLIB) $(LN1_SLIB)"; \
> - 	rm -f $(LN1_SLIB) ; $(LN) -s $(OUT_SLIB) $(LN1_SLIB)
> - 	@echo "  LN $(LN1_SLIB) $(LN_SLIB)"; \
> diff --git a/recipes/libnl/libnl-1.1/dont-link-libnl-from-sysroot.patch b/recipes/libnl/libnl-1.1/dont-link-libnl-from-sysroot.patch
> new file mode 100644
> index 0000000..beb6361
> --- /dev/null
> +++ b/recipes/libnl/libnl-1.1/dont-link-libnl-from-sysroot.patch
> @@ -0,0 +1,26 @@
> +Index: libnl-1.1/src/Makefile
> +===================================================================
> +--- libnl-1.1.orig/src/Makefile	2008-01-14 07:48:45.000000000 -0800
> ++++ libnl-1.1/src/Makefile	2010-09-22 14:58:46.820826001 -0700
> +@@ -13,7 +13,7 @@ ifeq ($(shell [ ! -r ../Makefile.opts ]
> +     include ../Makefile.opts
> + endif
> + 
> +-LDFLAGS	+= -L../lib -lnl utils.o
> ++LDFLAGS	+= ../lib/libnl.so utils.o
> + CIN 	:= $(wildcard nl-*.c) $(wildcard genl-*.c) $(wildcard nf-*.c)
> + TOOLS	:= $(CIN:%.c=%)
> + 
> +Index: libnl-1.1/tests/Makefile
> +===================================================================
> +--- libnl-1.1.orig/tests/Makefile	2008-01-14 07:48:45.000000000 -0800
> ++++ libnl-1.1/tests/Makefile	2010-09-22 14:58:46.820826001 -0700
> +@@ -13,7 +13,7 @@ ifeq ($(shell [ ! -r ../Makefile.opts ]
> +     include ../Makefile.opts
> + endif
> + 
> +-LDFLAGS	+= -L../lib -lnl ../src/utils.o
> ++LDFLAGS	+= ../lib/libnl.so ../src/utils.o
> + CIN 	:= $(wildcard test-*.c)
> + TOOLS	:= $(CIN:%.c=%)
> + 
> diff --git a/recipes/libnl/libnl-1.1/fix-includes.patch b/recipes/libnl/libnl-1.1/fix-includes.patch
> new file mode 100644
> index 0000000..b172fd2
> --- /dev/null
> +++ b/recipes/libnl/libnl-1.1/fix-includes.patch
> @@ -0,0 +1,13 @@
> +diff -ruN libnl-1.1/lib/route/link/vlan.c libnl-1.1-new/lib/route/link/vlan.c
> +--- libnl-1.1/lib/route/link/vlan.c	2008-01-14 18:48:45.000000000 +0300
> ++++ libnl-1.1-new/lib/route/link/vlan.c	2009-01-30 10:55:09.000000000 +0300
> +@@ -26,7 +26,9 @@
> + #include <netlink/route/link/info-api.h>
> + #include <netlink/route/link/vlan.h>
> + 
> ++#ifndef VLAN_FLAG_REORDER_HDR
> + #include <linux/if_vlan.h>
> ++#endif
> + 
> + /** @cond SKIP */
> + #define VLAN_HAS_ID		(1<<0)
> diff --git a/recipes/libnl/libnl-1.1/local-includes.patch b/recipes/libnl/libnl-1.1/local-includes.patch
> new file mode 100644
> index 0000000..85659db
> --- /dev/null
> +++ b/recipes/libnl/libnl-1.1/local-includes.patch
> @@ -0,0 +1,12 @@
> +diff -urN libnl-1.1.orig/Makefile.opts.in libnl-1.1/Makefile.opts.in
> +--- libnl-1.1.orig/Makefile.opts.in	2008-01-14 15:48:45.000000000 +0000
> ++++ libnl-1.1/Makefile.opts.in	2009-04-06 10:20:40.000000000 +0000
> +@@ -10,7 +10,7 @@
> + #
> + 
> + CC               := @CC@
> +-CFLAGS           := @CFLAGS@
> ++CFLAGS           := -I./include -I. -I../include @CFLAGS@
> + LDFLAGS          := @LDFLAGS@
> + CPPFLAGS         := @CPPFLAGS@
> + PACKAGE_NAME     := @PACKAGE_NAME@
> diff --git a/recipes/libnl/libnl-1.1/netlink-local-fix.patch b/recipes/libnl/libnl-1.1/netlink-local-fix.patch
> new file mode 100644
> index 0000000..51c6736
> --- /dev/null
> +++ b/recipes/libnl/libnl-1.1/netlink-local-fix.patch
> @@ -0,0 +1,12 @@
> +Index: libnl-1.1/include/netlink-local.h
> +===================================================================
> +--- libnl-1.1.orig/include/netlink-local.h	2009-06-18 15:28:32.614209645 +0400
> ++++ libnl-1.1/include/netlink-local.h	2009-06-18 15:28:44.094190518 +0400
> +@@ -26,6 +26,7 @@
> + #include <sys/socket.h>
> + #include <inttypes.h>
> + #include <assert.h>
> ++#include <limits.h>
> + 
> + #include <arpa/inet.h>
> + #include <netdb.h>
> diff --git a/recipes/libnl/libnl-1.1/respect-ldflags.patch b/recipes/libnl/libnl-1.1/respect-ldflags.patch
> new file mode 100644
> index 0000000..ba97dc6
> --- /dev/null
> +++ b/recipes/libnl/libnl-1.1/respect-ldflags.patch
> @@ -0,0 +1,12 @@
> +diff -urN libnl-1.1.orig/lib/Makefile libnl-1.1/lib/Makefile
> +--- libnl-1.1.orig/lib/Makefile	2008-01-14 15:48:45.000000000 +0000
> ++++ libnl-1.1/lib/Makefile	2009-04-06 10:16:21.000000000 +0000
> +@@ -48,7 +48,7 @@
> + 
> + $(OUT_SLIB): ../Makefile.opts $(OBJ)
> + 	@echo "  LD $(OUT_SLIB)"; \
> +-	$(CC) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
> ++	$(CC) $(LDFLAGS) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
> + 	@echo "  LN $(OUT_SLIB) $(LN1_SLIB)"; \
> + 	rm -f $(LN1_SLIB) ; $(LN) -s $(OUT_SLIB) $(LN1_SLIB)
> + 	@echo "  LN $(LN1_SLIB) $(LN_SLIB)"; \
> diff --git a/recipes/libnl/libnl/fix-pc-file.patch b/recipes/libnl/libnl/fix-pc-file.patch
> new file mode 100644
> index 0000000..17666fb
> --- /dev/null
> +++ b/recipes/libnl/libnl/fix-pc-file.patch
> @@ -0,0 +1,11 @@
> +Index: libnl-2.0/libnl-2.0.pc.in
> +===================================================================
> +--- libnl-2.0.orig/libnl-2.0.pc.in
> ++++ libnl-2.0/libnl-2.0.pc.in
> +@@ -6,5 +6,5 @@
> + Name: libnl
> + Description: Convenience library for netlink sockets
> + Version: @PACKAGE_VERSION@
> +-Libs: -L${libdir} -lnl
> ++Libs: -L${libdir} -lnl -lnl-genl -lnl-nf -lnl-route
> + Cflags: -I${includedir}
> diff --git a/recipes/libnl/libnl/fix-pktloc-dep-race.patch b/recipes/libnl/libnl/fix-pktloc-dep-race.patch
> new file mode 100644
> index 0000000..ee21744
> --- /dev/null
> +++ b/recipes/libnl/libnl/fix-pktloc-dep-race.patch
> @@ -0,0 +1,20 @@
> +Index: libnl-2.0/lib/Makefile.am
> +===================================================================
> +--- libnl-2.0.orig/lib/Makefile.am
> ++++ libnl-2.0/lib/Makefile.am
> +@@ -27,11 +27,15 @@ CLEANFILES = \
> + 	route/pktloc_grammar.c route/pktloc_grammar.h \
> + 	route/pktloc_syntax.c route/pktloc_syntax.h
> + 
> ++BUILT_SOURCES = route/pktloc_syntax.h route/pktloc_grammar.h
> ++
> + # Hack to avoid using ylwrap. It does not function correctly in combination
> + # with --header-file=
> ++route/pktloc_grammar.h: route/pktloc_grammar.c
> + route/pktloc_grammar.c: route/pktloc_grammar.l
> + 	$(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
> + 
> ++route/pktloc_syntax.h: route/pktloc_syntax.c
> + route/pktloc_syntax.c: route/pktloc_syntax.y
> + 	$(YACC) -d $(YFLAGS) -o $@ $^
> + 
> diff --git a/recipes/libnl/libnl2/fix-pc-file.patch b/recipes/libnl/libnl2/fix-pc-file.patch
> deleted file mode 100644
> index 17666fb..0000000
> --- a/recipes/libnl/libnl2/fix-pc-file.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -Index: libnl-2.0/libnl-2.0.pc.in
> -===================================================================
> ---- libnl-2.0.orig/libnl-2.0.pc.in
> -+++ libnl-2.0/libnl-2.0.pc.in
> -@@ -6,5 +6,5 @@
> - Name: libnl
> - Description: Convenience library for netlink sockets
> - Version: @PACKAGE_VERSION@
> --Libs: -L${libdir} -lnl
> -+Libs: -L${libdir} -lnl -lnl-genl -lnl-nf -lnl-route
> - Cflags: -I${includedir}
> diff --git a/recipes/libnl/libnl2/fix-pktloc-dep-race.patch b/recipes/libnl/libnl2/fix-pktloc-dep-race.patch
> deleted file mode 100644
> index ee21744..0000000
> --- a/recipes/libnl/libnl2/fix-pktloc-dep-race.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Index: libnl-2.0/lib/Makefile.am
> -===================================================================
> ---- libnl-2.0.orig/lib/Makefile.am
> -+++ libnl-2.0/lib/Makefile.am
> -@@ -27,11 +27,15 @@ CLEANFILES = \
> - 	route/pktloc_grammar.c route/pktloc_grammar.h \
> - 	route/pktloc_syntax.c route/pktloc_syntax.h
> - 
> -+BUILT_SOURCES = route/pktloc_syntax.h route/pktloc_grammar.h
> -+
> - # Hack to avoid using ylwrap. It does not function correctly in combination
> - # with --header-file=
> -+route/pktloc_grammar.h: route/pktloc_grammar.c
> - route/pktloc_grammar.c: route/pktloc_grammar.l
> - 	$(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
> - 
> -+route/pktloc_syntax.h: route/pktloc_syntax.c
> - route/pktloc_syntax.c: route/pktloc_syntax.y
> - 	$(YACC) -d $(YFLAGS) -o $@ $^
> - 
> diff --git a/recipes/libnl/libnl2_2.0.bb b/recipes/libnl/libnl2_2.0.bb
> deleted file mode 100644
> index 7e9336e..0000000
> --- a/recipes/libnl/libnl2_2.0.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -DESCRIPTION = "libnl2 is a library for applications dealing with netlink sockets"
> -SECTION = "libs/network"
> -LICENSE = "LGPL"
> -HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
> -PE = "1"
> -PR = "r2"
> -
> -DEPENDS = "flex-native bison-native"
> -
> -inherit autotools pkgconfig
> -
> -includedir = ${prefix}/include/libnl2
> -
> -S = "${WORKDIR}/libnl-${PV}"
> -SRC_URI = "\
> -  http://www.infradead.org/~tgr/libnl/files/libnl-${PV}.tar.gz \
> -  file://fix-pc-file.patch \
> -  file://fix-pktloc-dep-race.patch \
> -"
> -SRC_URI[md5sum] = "6aaf1e9802a17a7d702bb0638044ffa7"
> -SRC_URI[sha256sum] = "5a40dc903d3ca1074da7424b908bec8ff16936484798c7e46e53e9db8bc87a9c"
> -
> -PACKAGES =+ "${PN}-route ${PN}-nf ${PN}-genl ${PN}-cli"
> -FILES_${PN}-route = "${libdir}/libnl-route.so.*"
> -FILES_${PN}-nf    = "${libdir}/libnl-nf.so.*"
> -FILES_${PN}-genl  = "${libdir}/libnl-genl.so.*"
> -FILES_${PN}-cli   = "${libdir}/libnl-cli.so.*"
> diff --git a/recipes/libnl/libnl2_git.bb b/recipes/libnl/libnl2_git.bb
> deleted file mode 100644
> index b667815..0000000
> --- a/recipes/libnl/libnl2_git.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -DESCRIPTION = "libnl2 is a library for applications dealing with netlink sockets"
> -SECTION = "libs/network"
> -LICENSE = "LGPL"
> -HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
> -SRCREV = "d378220c96c3c8b6f27dca33e7d8ba03318f9c2d"
> -PV = "1.9+gitr${SRCPV}"
> -PE = "1"
> -PR = "r3"
> -
> -DEPENDS = "flex-native bison-native"
> -
> -inherit autotools
> -
> -includedir = ${prefix}/include/libnl2
> -
> -SRC_URI = "\
> -  git://git.kernel.org/pub/scm/libs/netlink/libnl.git;protocol=git \
> -  file://fix-pc-file.patch \
> -  file://fix-pktloc-dep-race.patch \
> -"
> -S = "${WORKDIR}/git"
> -
> -PACKAGES =+ "${PN}-route ${PN}-nf ${PN}-genl ${PN}-cli"
> -FILES_${PN}-route = "${libdir}/libnl-route.so.*"
> -FILES_${PN}-nf    = "${libdir}/libnl-nf.so.*"
> -FILES_${PN}-genl  = "${libdir}/libnl-genl.so.*"
> -FILES_${PN}-cli   = "${libdir}/libnl-cli.so.*"
> diff --git a/recipes/libnl/libnl_2.0.bb b/recipes/libnl/libnl_2.0.bb
> new file mode 100644
> index 0000000..7e9336e
> --- /dev/null
> +++ b/recipes/libnl/libnl_2.0.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "libnl2 is a library for applications dealing with netlink sockets"
> +SECTION = "libs/network"
> +LICENSE = "LGPL"
> +HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
> +PE = "1"
> +PR = "r2"
> +
> +DEPENDS = "flex-native bison-native"
> +
> +inherit autotools pkgconfig
> +
> +includedir = ${prefix}/include/libnl2
> +
> +S = "${WORKDIR}/libnl-${PV}"
> +SRC_URI = "\
> +  http://www.infradead.org/~tgr/libnl/files/libnl-${PV}.tar.gz \
> +  file://fix-pc-file.patch \
> +  file://fix-pktloc-dep-race.patch \
> +"
> +SRC_URI[md5sum] = "6aaf1e9802a17a7d702bb0638044ffa7"
> +SRC_URI[sha256sum] = "5a40dc903d3ca1074da7424b908bec8ff16936484798c7e46e53e9db8bc87a9c"
> +
> +PACKAGES =+ "${PN}-route ${PN}-nf ${PN}-genl ${PN}-cli"
> +FILES_${PN}-route = "${libdir}/libnl-route.so.*"
> +FILES_${PN}-nf    = "${libdir}/libnl-nf.so.*"
> +FILES_${PN}-genl  = "${libdir}/libnl-genl.so.*"
> +FILES_${PN}-cli   = "${libdir}/libnl-cli.so.*"
> diff --git a/recipes/libnl/libnl_git.bb b/recipes/libnl/libnl_git.bb
> new file mode 100644
> index 0000000..b667815
> --- /dev/null
> +++ b/recipes/libnl/libnl_git.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "libnl2 is a library for applications dealing with netlink sockets"
> +SECTION = "libs/network"
> +LICENSE = "LGPL"
> +HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
> +SRCREV = "d378220c96c3c8b6f27dca33e7d8ba03318f9c2d"
> +PV = "1.9+gitr${SRCPV}"
> +PE = "1"
> +PR = "r3"
> +
> +DEPENDS = "flex-native bison-native"
> +
> +inherit autotools
> +
> +includedir = ${prefix}/include/libnl2
> +
> +SRC_URI = "\
> +  git://git.kernel.org/pub/scm/libs/netlink/libnl.git;protocol=git \
> +  file://fix-pc-file.patch \
> +  file://fix-pktloc-dep-race.patch \
> +"
> +S = "${WORKDIR}/git"
> +
> +PACKAGES =+ "${PN}-route ${PN}-nf ${PN}-genl ${PN}-cli"
> +FILES_${PN}-route = "${libdir}/libnl-route.so.*"
> +FILES_${PN}-nf    = "${libdir}/libnl-nf.so.*"
> +FILES_${PN}-genl  = "${libdir}/libnl-genl.so.*"
> +FILES_${PN}-cli   = "${libdir}/libnl-cli.so.*"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNiySLMkyGM64RGpERAlBLAJ99rLnVNbEI5Nr2Mik/tu/0Ofj24ACfeeJq
h8vHXjulSP/1A8KCvyHTGwA=
=hU1j
-----END PGP SIGNATURE-----



