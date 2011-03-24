Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2gLN-00008G-BV for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 09:56:37 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2gJW-0007He-C2 for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 09:54:42 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 09:54:42 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 09:54:42 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 24 Mar 2011 09:54:25 +0100
Message-ID: <imf0s2$atc$1@dough.gmane.org>
References: <20110323162552.GH3418@jama.jama.net>	<1300899470-10514-1-git-send-email-Martin.Jansa@gmail.com>	<imdiri$aic$1@dough.gmane.org>
	<20110323200206.GL3418@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110323200206.GL3418@jama.jama.net>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/2] libnl-1.1: rename to libnl1 and build only static lib
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
X-List-Received-Date: Thu, 24 Mar 2011 08:56:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-03-11 21:02, Martin Jansa wrote:
> On Wed, Mar 23, 2011 at 08:49:06PM +0100, Koen Kooi wrote:
> Can you regenerate this on top of .dev? I couldn't get it to apply, even
> after renaming files -> libnl-1.1
> 
>> Did you try to apply it on top of that 12patch series?
> 
>> Or you can apply top 14 from
>> http://gitorious.org/~jama/angstrom/jama-shr-experimental/

I applied the top 14, clean libnl* and nm, built libnl1 and libnl and I get:

ps/libip6_manager_la-nm-ip6-manager.Tpo -c nm-ip6-manager.c  -fPIC -DPIC
- -o .libs/libip6_manager_la-nm-ip6-manager.o
| nm-ip6-manager.c: In function 'process_addr':
| nm-ip6-manager.c:488:46: error: too few arguments to function
'nl_cache_include'
|
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/cache.h:64:14:
note: declared here
| nm-ip6-manager.c: In function 'process_route':
| nm-ip6-manager.c:528:47: error: too few arguments to function
'nl_cache_include'
|
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/cache.h:64:14:
note: declared here
| nm-ip6-manager.c: In function 'nm_ip6_manager_get_ip6_config':
| nm-ip6-manager.c:944:2: warning: passing argument 1 of
'nl_cache_refill' from incompatible pointer type
|
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/cache.h:56:14:
note: expected 'struct nl_sock *' but argument is of type 'struct
nl_handle *'
| nm-ip6-manager.c:945:2: warning: passing argument 1 of
'nl_cache_refill' from incompatible pointer type
|
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/cache.h:56:14:
note: expected 'struct nl_sock *' but argument is of type 'struct
nl_handle *'
| nm-ip6-manager.c:960:13: warning: assignment makes pointer from
integer without a cast
| nm-ip6-manager.c:985:3: error: too few arguments to function
'rtnl_route_get_metric'
|
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/route/route.h:83:12:
note: declared here
| nm-ip6-manager.c: In function 'nm_ip6_manager_init':
| nm-ip6-manager.c:1073:2: warning: passing argument 1 of
'rtnl_addr_alloc_cache' from incompatible pointer type
|
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/route/addr.h:31:12:
note: expected 'struct nl_sock *' but argument is ofERROR: Function
'do_compile' failed (see
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/temp/log.do_compile.20022
for further information)
|  type 'struct nl_handle *'
| nm-ip6-manager.c:1073:2: error: too few arguments to function
'rtnl_addr_alloc_cache'
|
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/route/addr.h:31:12:
note: declared here
| nm-ip6-manager.c:1074:2: warning: passing argument 1 of
'rtnl_route_alloc_cache' from incompatible pointer type
|
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/route/route.h:48:12:
note: expected 'struct nl_sock *' but argument is of type 'struct
nl_handle *'
| nm-ip6-manager.c:1074:2: error: too few arguments to function
'rtnl_route_alloc_cache'
|
/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/netlink/route/route.h:48:12:
note: declared here
| make[4]: *** [libip6_manager_la-nm-ip6-manager.lo] Error 1
| make[4]: Leaving directory
`/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src/ip6-manager'
| make[3]: *** [all-recursive] Error 1
| make[3]: Leaving directory
`/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory
`/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1

So there still is a header clash by the looks of it. Did I miss a patch?

regards,

Koen


> 
>> Cheers,
> 
> On 23-03-11 17:57, Martin Jansa wrote:
>>>> * static lib is enough to build nm and shouldn't conflict with libnl2
>>>> * this makes special case from libnl1 instead libnl2
>>>>
>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>> ---
>>>>  .../libnl-1.1/dont-link-libnl-from-sysroot.patch   |   26 -------
>>>>  recipes/libnl/libnl-1.1/fix-includes.patch         |   13 ---
>>>>  recipes/libnl/libnl-1.1/local-includes.patch       |   12 ---
>>>>  recipes/libnl/libnl-1.1/netlink-local-fix.patch    |   12 ---
>>>>  recipes/libnl/libnl-1.1/respect-ldflags.patch      |   12 ---
>>>>  .../libnl/libnl1-1.1/build.only.static.lib.patch   |   79 ++++++++++++++++++++
>>>>  .../libnl1-1.1/dont-link-libnl-from-sysroot.patch  |   26 +++++++
>>>>  recipes/libnl/libnl1-1.1/fix-includes.patch        |   13 +++
>>>>  recipes/libnl/libnl1-1.1/local-includes.patch      |   12 +++
>>>>  recipes/libnl/libnl1-1.1/netlink-local-fix.patch   |   12 +++
>>>>  recipes/libnl/libnl1-1.1/respect-ldflags.patch     |   12 +++
>>>>  recipes/libnl/libnl1_1.1.bb                        |   22 ++++++
>>>>  recipes/libnl/libnl_1.1.bb                         |   17 ----
>>>>  13 files changed, 176 insertions(+), 92 deletions(-)
>>>>  delete mode 100644 recipes/libnl/libnl-1.1/dont-link-libnl-from-sysroot.patch
>>>>  delete mode 100644 recipes/libnl/libnl-1.1/fix-includes.patch
>>>>  delete mode 100644 recipes/libnl/libnl-1.1/local-includes.patch
>>>>  delete mode 100644 recipes/libnl/libnl-1.1/netlink-local-fix.patch
>>>>  delete mode 100644 recipes/libnl/libnl-1.1/respect-ldflags.patch
>>>>  create mode 100644 recipes/libnl/libnl1-1.1/build.only.static.lib.patch
>>>>  create mode 100644 recipes/libnl/libnl1-1.1/dont-link-libnl-from-sysroot.patch
>>>>  create mode 100644 recipes/libnl/libnl1-1.1/fix-includes.patch
>>>>  create mode 100644 recipes/libnl/libnl1-1.1/local-includes.patch
>>>>  create mode 100644 recipes/libnl/libnl1-1.1/netlink-local-fix.patch
>>>>  create mode 100644 recipes/libnl/libnl1-1.1/respect-ldflags.patch
>>>>  create mode 100644 recipes/libnl/libnl1_1.1.bb
>>>>  delete mode 100644 recipes/libnl/libnl_1.1.bb
>>>>
>>>> diff --git a/recipes/libnl/libnl-1.1/dont-link-libnl-from-sysroot.patch b/recipes/libnl/libnl-1.1/dont-link-libnl-from-sysroot.patch
>>>> deleted file mode 100644
>>>> index beb6361..0000000
>>>> --- a/recipes/libnl/libnl-1.1/dont-link-libnl-from-sysroot.patch
>>>> +++ /dev/null
>>>> @@ -1,26 +0,0 @@
>>>> -Index: libnl-1.1/src/Makefile
>>>> -===================================================================
>>>> ---- libnl-1.1.orig/src/Makefile	2008-01-14 07:48:45.000000000 -0800
>>>> -+++ libnl-1.1/src/Makefile	2010-09-22 14:58:46.820826001 -0700
>>>> -@@ -13,7 +13,7 @@ ifeq ($(shell [ ! -r ../Makefile.opts ]
>>>> -     include ../Makefile.opts
>>>> - endif
>>>> - 
>>>> --LDFLAGS	+= -L../lib -lnl utils.o
>>>> -+LDFLAGS	+= ../lib/libnl.so utils.o
>>>> - CIN 	:= $(wildcard nl-*.c) $(wildcard genl-*.c) $(wildcard nf-*.c)
>>>> - TOOLS	:= $(CIN:%.c=%)
>>>> - 
>>>> -Index: libnl-1.1/tests/Makefile
>>>> -===================================================================
>>>> ---- libnl-1.1.orig/tests/Makefile	2008-01-14 07:48:45.000000000 -0800
>>>> -+++ libnl-1.1/tests/Makefile	2010-09-22 14:58:46.820826001 -0700
>>>> -@@ -13,7 +13,7 @@ ifeq ($(shell [ ! -r ../Makefile.opts ]
>>>> -     include ../Makefile.opts
>>>> - endif
>>>> - 
>>>> --LDFLAGS	+= -L../lib -lnl ../src/utils.o
>>>> -+LDFLAGS	+= ../lib/libnl.so ../src/utils.o
>>>> - CIN 	:= $(wildcard test-*.c)
>>>> - TOOLS	:= $(CIN:%.c=%)
>>>> - 
>>>> diff --git a/recipes/libnl/libnl-1.1/fix-includes.patch b/recipes/libnl/libnl-1.1/fix-includes.patch
>>>> deleted file mode 100644
>>>> index b172fd2..0000000
>>>> --- a/recipes/libnl/libnl-1.1/fix-includes.patch
>>>> +++ /dev/null
>>>> @@ -1,13 +0,0 @@
>>>> -diff -ruN libnl-1.1/lib/route/link/vlan.c libnl-1.1-new/lib/route/link/vlan.c
>>>> ---- libnl-1.1/lib/route/link/vlan.c	2008-01-14 18:48:45.000000000 +0300
>>>> -+++ libnl-1.1-new/lib/route/link/vlan.c	2009-01-30 10:55:09.000000000 +0300
>>>> -@@ -26,7 +26,9 @@
>>>> - #include <netlink/route/link/info-api.h>
>>>> - #include <netlink/route/link/vlan.h>
>>>> - 
>>>> -+#ifndef VLAN_FLAG_REORDER_HDR
>>>> - #include <linux/if_vlan.h>
>>>> -+#endif
>>>> - 
>>>> - /** @cond SKIP */
>>>> - #define VLAN_HAS_ID		(1<<0)
>>>> diff --git a/recipes/libnl/libnl-1.1/local-includes.patch b/recipes/libnl/libnl-1.1/local-includes.patch
>>>> deleted file mode 100644
>>>> index 85659db..0000000
>>>> --- a/recipes/libnl/libnl-1.1/local-includes.patch
>>>> +++ /dev/null
>>>> @@ -1,12 +0,0 @@
>>>> -diff -urN libnl-1.1.orig/Makefile.opts.in libnl-1.1/Makefile.opts.in
>>>> ---- libnl-1.1.orig/Makefile.opts.in	2008-01-14 15:48:45.000000000 +0000
>>>> -+++ libnl-1.1/Makefile.opts.in	2009-04-06 10:20:40.000000000 +0000
>>>> -@@ -10,7 +10,7 @@
>>>> - #
>>>> - 
>>>> - CC               := @CC@
>>>> --CFLAGS           := @CFLAGS@
>>>> -+CFLAGS           := -I./include -I. -I../include @CFLAGS@
>>>> - LDFLAGS          := @LDFLAGS@
>>>> - CPPFLAGS         := @CPPFLAGS@
>>>> - PACKAGE_NAME     := @PACKAGE_NAME@
>>>> diff --git a/recipes/libnl/libnl-1.1/netlink-local-fix.patch b/recipes/libnl/libnl-1.1/netlink-local-fix.patch
>>>> deleted file mode 100644
>>>> index 51c6736..0000000
>>>> --- a/recipes/libnl/libnl-1.1/netlink-local-fix.patch
>>>> +++ /dev/null
>>>> @@ -1,12 +0,0 @@
>>>> -Index: libnl-1.1/include/netlink-local.h
>>>> -===================================================================
>>>> ---- libnl-1.1.orig/include/netlink-local.h	2009-06-18 15:28:32.614209645 +0400
>>>> -+++ libnl-1.1/include/netlink-local.h	2009-06-18 15:28:44.094190518 +0400
>>>> -@@ -26,6 +26,7 @@
>>>> - #include <sys/socket.h>
>>>> - #include <inttypes.h>
>>>> - #include <assert.h>
>>>> -+#include <limits.h>
>>>> - 
>>>> - #include <arpa/inet.h>
>>>> - #include <netdb.h>
>>>> diff --git a/recipes/libnl/libnl-1.1/respect-ldflags.patch b/recipes/libnl/libnl-1.1/respect-ldflags.patch
>>>> deleted file mode 100644
>>>> index ba97dc6..0000000
>>>> --- a/recipes/libnl/libnl-1.1/respect-ldflags.patch
>>>> +++ /dev/null
>>>> @@ -1,12 +0,0 @@
>>>> -diff -urN libnl-1.1.orig/lib/Makefile libnl-1.1/lib/Makefile
>>>> ---- libnl-1.1.orig/lib/Makefile	2008-01-14 15:48:45.000000000 +0000
>>>> -+++ libnl-1.1/lib/Makefile	2009-04-06 10:16:21.000000000 +0000
>>>> -@@ -48,7 +48,7 @@
>>>> - 
>>>> - $(OUT_SLIB): ../Makefile.opts $(OBJ)
>>>> - 	@echo "  LD $(OUT_SLIB)"; \
>>>> --	$(CC) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
>>>> -+	$(CC) $(LDFLAGS) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
>>>> - 	@echo "  LN $(OUT_SLIB) $(LN1_SLIB)"; \
>>>> - 	rm -f $(LN1_SLIB) ; $(LN) -s $(OUT_SLIB) $(LN1_SLIB)
>>>> - 	@echo "  LN $(LN1_SLIB) $(LN_SLIB)"; \
>>>> diff --git a/recipes/libnl/libnl1-1.1/build.only.static.lib.patch b/recipes/libnl/libnl1-1.1/build.only.static.lib.patch
>>>> new file mode 100644
>>>> index 0000000..770a392
>>>> --- /dev/null
>>>> +++ b/recipes/libnl/libnl1-1.1/build.only.static.lib.patch
>>>> @@ -0,0 +1,79 @@
>>>> +diff -uNr libnl-1.1.orig//lib/Makefile libnl-1.1/lib/Makefile
>>>> +--- libnl-1.1.orig//lib/Makefile	2011-03-23 15:50:32.310534329 +0100
>>>> ++++ libnl-1.1/lib/Makefile	2011-03-23 15:50:43.926534326 +0100
>>>> +@@ -33,18 +33,24 @@
>>>> + DEPS     := $(CIN:%.c=%.d)
>>>> + OBJ      := $(CIN:%.c=%.o)
>>>> + CFLAGS   += -fPIC
>>>> ++OUT_LIB  := $(PACKAGE_NAME)1.a
>>>> + OUT_SLIB := $(PACKAGE_NAME).so.$(PACKAGE_VERSION)
>>>> + LN_SLIB  := $(PACKAGE_NAME).so
>>>> + LN1_SLIB := $(LN_SLIB).1
>>>> + 
>>>> + export
>>>> + 
>>>> +-.PHONY: all clean install librtn.a $(OUT_SLIB)
>>>> ++.PHONY: all clean install librtn.a $(OUT_SLIB) $(OUT_LIB)
>>>> + 
>>>> + 
>>>> + all:
>>>> +-	@echo "  MAKE $(OUT_SLIB)"; \
>>>> +-	$(MAKE) $(OUT_SLIB)
>>>> ++	@echo "  MAKE $(OUT_LIB)"; \
>>>> ++	$(MAKE) $(OUT_LIB)
>>>> ++
>>>> ++$(OUT_LIB): ../Makefile.opts $(OBJ)
>>>> ++	@echo "  LD $(OUT_LIB)"; \
>>>> ++	echo $(AR) rs $(OUT_LIB) $(OBJ)
>>>> ++	$(AR) rs $(OUT_LIB) $(OBJ)
>>>> + 
>>>> + $(OUT_SLIB): ../Makefile.opts $(OBJ)
>>>> + 	@echo "  LD $(OUT_SLIB)"; \
>>>> +@@ -56,8 +62,8 @@
>>>> + 
>>>> + clean:
>>>> + 	@echo "  CLEAN lib"; \
>>>> +-	$(RM) -f $(OBJ) $(OUT_SLIB) $(LN_SLIB) $(LN1_SLIB); \
>>>> +-	$(RM) -f $(DEPS) $(OUT_SLIB) $(LN_SLIB) $(LN1_SLIB)
>>>> ++	$(RM) -f $(OBJ) $(OUT_SLIB) $(OUT_LIB) $(LN_SLIB) $(LN1_SLIB); \
>>>> ++	$(RM) -f $(DEPS) $(OUT_SLIB) $(OUT_LIB) $(LN_SLIB) $(LN1_SLIB)
>>>> + 
>>>> + distclean:
>>>> + 	@echo "  DISTCLEAN lib"; \
>>>> +@@ -65,11 +71,7 @@
>>>> + 
>>>> + install:
>>>> +-	mkdir -p $(DESTDIR)$(libdir)/
>>>> +-	install -m 0644 $(OUT_SLIB) $(DESTDIR)$(libdir)
>>>> +-	rm -f $(DESTDIR)$(libdir)/$(LN1_SLIB)
>>>> +-	$(LN) -s $(OUT_SLIB) $(DESTDIR)$(libdir)/$(LN1_SLIB)
>>>> +-	rm -f $(DESTDIR)$(libdir)/$(LN_SLIB)
>>>> +-	$(LN) -s $(LN1_SLIB) $(DESTDIR)$(libdir)/$(LN_SLIB)
>>>> ++	mkdir -p $(DESTDIR)$(libdir)/libnl1
>>>> ++	install -m 0644 $(OUT_LIB) $(DESTDIR)$(libdir)/libnl1
>>>> + 
>>>> + $(DEPS): ../Makefile.opts
>>>> + 
>>>> +diff -uNr libnl-1.1.orig//Makefile libnl-1.1/Makefile
>>>> +--- libnl-1.1.orig//Makefile	2008-01-14 16:48:45.000000000 +0100
>>>> ++++ libnl-1.1/Makefile	2011-03-23 16:53:12.438533242 +0100
>>>> +@@ -13,7 +13,7 @@
>>>> +     include Makefile.opts
>>>> + endif
>>>> + 
>>>> +-SUBDIRS := lib include doc src tests
>>>> ++SUBDIRS := lib include doc 
>>>> + .PHONY: all clean distclean install gendoc $(SUBDIRS)
>>>> + 
>>>> + all: Makefile.opts
>>>> +diff -uNr libnl-1.1.orig//libnl-1.pc.in libnl-1.1/libnl-1.pc.in
>>>> +--- libnl-1.1.orig//libnl-1.pc.in	2008-01-14 16:48:45.000000000 +0100
>>>> ++++ libnl-1.1/libnl-1.pc.in	2011-03-23 16:57:18.084533174 +0100
>>>> +@@ -6,5 +6,5 @@
>>>> + Name: libnl
>>>> + Description: Convenience library for netlink sockets
>>>> + Version: @PACKAGE_VERSION@
>>>> +-Libs: -L${libdir} -lnl
>>>> +-Cflags:
>>>> ++Libs: -L${libdir}/libnl1 -lnl1 -lm
>>>> ++Cflags: -I${includedir}/libnl1
>>>> diff --git a/recipes/libnl/libnl1-1.1/dont-link-libnl-from-sysroot.patch b/recipes/libnl/libnl1-1.1/dont-link-libnl-from-sysroot.patch
>>>> new file mode 100644
>>>> index 0000000..beb6361
>>>> --- /dev/null
>>>> +++ b/recipes/libnl/libnl1-1.1/dont-link-libnl-from-sysroot.patch
>>>> @@ -0,0 +1,26 @@
>>>> +Index: libnl-1.1/src/Makefile
>>>> +===================================================================
>>>> +--- libnl-1.1.orig/src/Makefile	2008-01-14 07:48:45.000000000 -0800
>>>> ++++ libnl-1.1/src/Makefile	2010-09-22 14:58:46.820826001 -0700
>>>> +@@ -13,7 +13,7 @@ ifeq ($(shell [ ! -r ../Makefile.opts ]
>>>> +     include ../Makefile.opts
>>>> + endif
>>>> + 
>>>> +-LDFLAGS	+= -L../lib -lnl utils.o
>>>> ++LDFLAGS	+= ../lib/libnl.so utils.o
>>>> + CIN 	:= $(wildcard nl-*.c) $(wildcard genl-*.c) $(wildcard nf-*.c)
>>>> + TOOLS	:= $(CIN:%.c=%)
>>>> + 
>>>> +Index: libnl-1.1/tests/Makefile
>>>> +===================================================================
>>>> +--- libnl-1.1.orig/tests/Makefile	2008-01-14 07:48:45.000000000 -0800
>>>> ++++ libnl-1.1/tests/Makefile	2010-09-22 14:58:46.820826001 -0700
>>>> +@@ -13,7 +13,7 @@ ifeq ($(shell [ ! -r ../Makefile.opts ]
>>>> +     include ../Makefile.opts
>>>> + endif
>>>> + 
>>>> +-LDFLAGS	+= -L../lib -lnl ../src/utils.o
>>>> ++LDFLAGS	+= ../lib/libnl.so ../src/utils.o
>>>> + CIN 	:= $(wildcard test-*.c)
>>>> + TOOLS	:= $(CIN:%.c=%)
>>>> + 
>>>> diff --git a/recipes/libnl/libnl1-1.1/fix-includes.patch b/recipes/libnl/libnl1-1.1/fix-includes.patch
>>>> new file mode 100644
>>>> index 0000000..b172fd2
>>>> --- /dev/null
>>>> +++ b/recipes/libnl/libnl1-1.1/fix-includes.patch
>>>> @@ -0,0 +1,13 @@
>>>> +diff -ruN libnl-1.1/lib/route/link/vlan.c libnl-1.1-new/lib/route/link/vlan.c
>>>> +--- libnl-1.1/lib/route/link/vlan.c	2008-01-14 18:48:45.000000000 +0300
>>>> ++++ libnl-1.1-new/lib/route/link/vlan.c	2009-01-30 10:55:09.000000000 +0300
>>>> +@@ -26,7 +26,9 @@
>>>> + #include <netlink/route/link/info-api.h>
>>>> + #include <netlink/route/link/vlan.h>
>>>> + 
>>>> ++#ifndef VLAN_FLAG_REORDER_HDR
>>>> + #include <linux/if_vlan.h>
>>>> ++#endif
>>>> + 
>>>> + /** @cond SKIP */
>>>> + #define VLAN_HAS_ID		(1<<0)
>>>> diff --git a/recipes/libnl/libnl1-1.1/local-includes.patch b/recipes/libnl/libnl1-1.1/local-includes.patch
>>>> new file mode 100644
>>>> index 0000000..85659db
>>>> --- /dev/null
>>>> +++ b/recipes/libnl/libnl1-1.1/local-includes.patch
>>>> @@ -0,0 +1,12 @@
>>>> +diff -urN libnl-1.1.orig/Makefile.opts.in libnl-1.1/Makefile.opts.in
>>>> +--- libnl-1.1.orig/Makefile.opts.in	2008-01-14 15:48:45.000000000 +0000
>>>> ++++ libnl-1.1/Makefile.opts.in	2009-04-06 10:20:40.000000000 +0000
>>>> +@@ -10,7 +10,7 @@
>>>> + #
>>>> + 
>>>> + CC               := @CC@
>>>> +-CFLAGS           := @CFLAGS@
>>>> ++CFLAGS           := -I./include -I. -I../include @CFLAGS@
>>>> + LDFLAGS          := @LDFLAGS@
>>>> + CPPFLAGS         := @CPPFLAGS@
>>>> + PACKAGE_NAME     := @PACKAGE_NAME@
>>>> diff --git a/recipes/libnl/libnl1-1.1/netlink-local-fix.patch b/recipes/libnl/libnl1-1.1/netlink-local-fix.patch
>>>> new file mode 100644
>>>> index 0000000..51c6736
>>>> --- /dev/null
>>>> +++ b/recipes/libnl/libnl1-1.1/netlink-local-fix.patch
>>>> @@ -0,0 +1,12 @@
>>>> +Index: libnl-1.1/include/netlink-local.h
>>>> +===================================================================
>>>> +--- libnl-1.1.orig/include/netlink-local.h	2009-06-18 15:28:32.614209645 +0400
>>>> ++++ libnl-1.1/include/netlink-local.h	2009-06-18 15:28:44.094190518 +0400
>>>> +@@ -26,6 +26,7 @@
>>>> + #include <sys/socket.h>
>>>> + #include <inttypes.h>
>>>> + #include <assert.h>
>>>> ++#include <limits.h>
>>>> + 
>>>> + #include <arpa/inet.h>
>>>> + #include <netdb.h>
>>>> diff --git a/recipes/libnl/libnl1-1.1/respect-ldflags.patch b/recipes/libnl/libnl1-1.1/respect-ldflags.patch
>>>> new file mode 100644
>>>> index 0000000..ba97dc6
>>>> --- /dev/null
>>>> +++ b/recipes/libnl/libnl1-1.1/respect-ldflags.patch
>>>> @@ -0,0 +1,12 @@
>>>> +diff -urN libnl-1.1.orig/lib/Makefile libnl-1.1/lib/Makefile
>>>> +--- libnl-1.1.orig/lib/Makefile	2008-01-14 15:48:45.000000000 +0000
>>>> ++++ libnl-1.1/lib/Makefile	2009-04-06 10:16:21.000000000 +0000
>>>> +@@ -48,7 +48,7 @@
>>>> + 
>>>> + $(OUT_SLIB): ../Makefile.opts $(OBJ)
>>>> + 	@echo "  LD $(OUT_SLIB)"; \
>>>> +-	$(CC) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
>>>> ++	$(CC) $(LDFLAGS) -shared -Wl,-soname,libnl.so.1 -o $(OUT_SLIB) $(OBJ) $(LIBNL_LIB) -lc
>>>> + 	@echo "  LN $(OUT_SLIB) $(LN1_SLIB)"; \
>>>> + 	rm -f $(LN1_SLIB) ; $(LN) -s $(OUT_SLIB) $(LN1_SLIB)
>>>> + 	@echo "  LN $(LN1_SLIB) $(LN_SLIB)"; \
>>>> diff --git a/recipes/libnl/libnl1_1.1.bb b/recipes/libnl/libnl1_1.1.bb
>>>> new file mode 100644
>>>> index 0000000..3569867
>>>> --- /dev/null
>>>> +++ b/recipes/libnl/libnl1_1.1.bb
>>>> @@ -0,0 +1,22 @@
>>>> +require libnl.inc
>>>> +
>>>> +PR = "${INC_PR}.0"
>>>> +
>>>> +# move it to extra subdirectory
>>>> +includedir = "${prefix}/include/libnl1"
>>>> +
>>>> +CFLAGS += '-DVLAN_FLAG_REORDER_HDR=1'
>>>> +
>>>> +SRC_URI = "\
>>>> +  http://www.infradead.org/~tgr/libnl/files/libnl-${PV}.tar.gz \
>>>> +  file://local-includes.patch \
>>>> +  file://fix-includes.patch \
>>>> +  file://respect-ldflags.patch \
>>>> +  file://netlink-local-fix.patch \
>>>> +  file://dont-link-libnl-from-sysroot.patch \
>>>> +  file://build.only.static.lib.patch \
>>>> +"
>>>> +S = "${WORKDIR}/libnl-${PV}"
>>>> +
>>>> +SRC_URI[md5sum] = "ae970ccd9144e132b68664f98e7ceeb1"
>>>> +SRC_URI[sha256sum] = "35cea4cfb6cd8af0cafa0f34fff81def5a1f193b8b8384299b4b21883e22edc3"
>>>> diff --git a/recipes/libnl/libnl_1.1.bb b/recipes/libnl/libnl_1.1.bb
>>>> deleted file mode 100644
>>>> index d9f250e..0000000
>>>> --- a/recipes/libnl/libnl_1.1.bb
>>>> +++ /dev/null
>>>> @@ -1,17 +0,0 @@
>>>> -require libnl.inc
>>>> -
>>>> -PR = "${INC_PR}.0"
>>>> -
>>>> -CFLAGS += '-DVLAN_FLAG_REORDER_HDR=1'
>>>> -
>>>> -SRC_URI = "\
>>>> -  http://www.infradead.org/~tgr/libnl/files/libnl-${PV}.tar.gz \
>>>> -  file://local-includes.patch \
>>>> -  file://fix-includes.patch \
>>>> -  file://respect-ldflags.patch \
>>>> -  file://netlink-local-fix.patch \
>>>> -  file://dont-link-libnl-from-sysroot.patch \
>>>> -"
>>>> -
>>>> -SRC_URI[md5sum] = "ae970ccd9144e132b68664f98e7ceeb1"
>>>> -SRC_URI[sha256sum] = "35cea4cfb6cd8af0cafa0f34fff81def5a1f193b8b8384299b4b21883e22edc3"
> 
>>
>>
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNiwbBMkyGM64RGpERAmdbAJ9hrrjAfdIkvPUEjpSNnyYwF2uaAQCfX+sc
8n5+gtoCJVtfWvIeeDRyc5k=
=o9Ih
-----END PGP SIGNATURE-----



