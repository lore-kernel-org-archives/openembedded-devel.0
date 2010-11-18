Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1PJ9dK-0002st-Nw
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 19:55:01 +0100
Received: by mate.hex (Postfix, from userid 1000)
	id 005F93D502; Thu, 18 Nov 2010 21:53:49 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Nov 2010 21:53:46 +0300
Message-Id: <1290106426-5974-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] openssl: update 1.0.0a to 1.0.0b
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
X-List-Received-Date: Thu, 18 Nov 2010 18:55:01 -0000

 * fixes CVE-2010-3864
 * considered as safe upgrade

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 .../include/angstrom-2008-preferred-versions.inc   |    4 +-
 .../include/angstrom-2010-preferred-versions.inc   |    4 +-
 conf/distro/include/preferred-shr-versions.inc     |    4 +-
 .../openssl/openssl-1.0.0a/configure-targets.patch |   25 -
 recipes/openssl/openssl-1.0.0a/debian.patch        |  515 --------------------
 .../engines-install-in-libdir-ssl.patch            |   53 --
 recipes/openssl/openssl-1.0.0a/libdeps-first.patch |   27 -
 recipes/openssl/openssl-1.0.0a/oe-ldflags.patch    |   22 -
 ...ssl-fix-ssl3_get_key_exchange-double-free.patch |   12 -
 recipes/openssl/openssl-1.0.0a/shared-libs.patch   |   48 --
 .../openssl/openssl-1.0.0b/configure-targets.patch |   25 +
 recipes/openssl/openssl-1.0.0b/debian.patch        |  515 ++++++++++++++++++++
 .../engines-install-in-libdir-ssl.patch            |   53 ++
 recipes/openssl/openssl-1.0.0b/libdeps-first.patch |   27 +
 recipes/openssl/openssl-1.0.0b/oe-ldflags.patch    |   22 +
 recipes/openssl/openssl-1.0.0b/shared-libs.patch   |   48 ++
 recipes/openssl/openssl-native_1.0.0a.bb           |   27 -
 recipes/openssl/openssl-native_1.0.0b.bb           |   27 +
 recipes/openssl/openssl_1.0.0a.bb                  |   31 --
 recipes/openssl/openssl_1.0.0b.bb                  |   30 ++
 20 files changed, 753 insertions(+), 766 deletions(-)
 delete mode 100644 recipes/openssl/openssl-1.0.0a/configure-targets.patch
 delete mode 100644 recipes/openssl/openssl-1.0.0a/debian.patch
 delete mode 100644 recipes/openssl/openssl-1.0.0a/engines-install-in-libdir-ssl.patch
 delete mode 100644 recipes/openssl/openssl-1.0.0a/libdeps-first.patch
 delete mode 100644 recipes/openssl/openssl-1.0.0a/oe-ldflags.patch
 delete mode 100644 recipes/openssl/openssl-1.0.0a/openssl-fix-ssl3_get_key_exchange-double-free.patch
 delete mode 100644 recipes/openssl/openssl-1.0.0a/shared-libs.patch
 create mode 100644 recipes/openssl/openssl-1.0.0b/configure-targets.patch
 create mode 100644 recipes/openssl/openssl-1.0.0b/debian.patch
 create mode 100644 recipes/openssl/openssl-1.0.0b/engines-install-in-libdir-ssl.patch
 create mode 100644 recipes/openssl/openssl-1.0.0b/libdeps-first.patch
 create mode 100644 recipes/openssl/openssl-1.0.0b/oe-ldflags.patch
 create mode 100644 recipes/openssl/openssl-1.0.0b/shared-libs.patch
 delete mode 100644 recipes/openssl/openssl-native_1.0.0a.bb
 create mode 100644 recipes/openssl/openssl-native_1.0.0b.bb
 delete mode 100644 recipes/openssl/openssl_1.0.0a.bb
 create mode 100644 recipes/openssl/openssl_1.0.0b.bb

diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/conf/distro/include/angstrom-2008-preferred-versions.inc
index fc86eef..f79e48b 100644
--- a/conf/distro/include/angstrom-2008-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
@@ -37,8 +37,8 @@ PREFERRED_VERSION_mythtv        = "0.22"
 PREFERRED_VERSION_mplayer       = "0.0+1.0rc3+svnr30165"
 PREFERRED_VERSION_network-manager-applet = "0.8.1"
 PREFERRED_VERSION_networkmanager = "0.8.1"
-PREFERRED_VERSION_openssl = "1.0.0a"
-PREFERRED_VERSION_openssl-native = "1.0.0a"
+PREFERRED_VERSION_openssl = "1.0.0b"
+PREFERRED_VERSION_openssl-native = "1.0.0b"
 PREFERRED_VERSION_pango 	= "1.24.4"
 PREFERRED_VERSION_pango-native     = "1.24.4"
 #PREFERRED_VERSION_pixman	= "0.13.2"
diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
index 36b26b1..12ee900 100644
--- a/conf/distro/include/angstrom-2010-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
@@ -45,8 +45,8 @@ PREFERRED_VERSION_mplayer       = "0.0+1.0rc3+svnr30165"
 PREFERRED_VERSION_network-manager-applet = "0.8.1"
 PREFERRED_VERSION_networkmanager = "0.8.1"
 PREFERRED_VERSION_networkmanager-openvpn = "0.8.1"
-PREFERRED_VERSION_openssl = "1.0.0a"
-PREFERRED_VERSION_openssl-native = "1.0.0a"
+PREFERRED_VERSION_openssl = "1.0.0b"
+PREFERRED_VERSION_openssl-native = "1.0.0b"
 PREFERRED_VERSION_pango 	= "1.28.3"
 PREFERRED_VERSION_pango-native     = "1.28.3"
 PREFERRED_VERSION_perl = "5.10.1"
diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro/include/preferred-shr-versions.inc
index 8089d2e..22e1c82 100644
--- a/conf/distro/include/preferred-shr-versions.inc
+++ b/conf/distro/include/preferred-shr-versions.inc
@@ -46,8 +46,8 @@ PREFERRED_VERSION_usbutils      = "0.86"
 PREFERRED_VERSION_wpa-supplicant = "0.6.9"
 PREFERRED_VERSION_glib-2.0      = "2.24.1"
 PREFERRED_VERSION_glib-2.0-native = "2.24.1"
-PREFERRED_VERSION_openssl = "1.0.0a"
-PREFERRED_VERSION_openssl-native = "1.0.0a"
+PREFERRED_VERSION_openssl = "1.0.0b"
+PREFERRED_VERSION_openssl-native = "1.0.0b"
 UDEV_GE_141 = "1"
 
 PREFERRED_VERSION_postgresql = "8.4.4"
diff --git a/recipes/openssl/openssl-1.0.0a/configure-targets.patch b/recipes/openssl/openssl-1.0.0a/configure-targets.patch
deleted file mode 100644
index 112732b..0000000
--- a/recipes/openssl/openssl-1.0.0a/configure-targets.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-
-The number of colons are important :)
-
-
-Index: openssl-1.0.0/Configure
-===================================================================
---- openssl-1.0.0.orig/Configure	2010-01-19 13:40:54.000000000 -0800
-+++ openssl-1.0.0/Configure	2010-05-26 22:58:01.238104854 -0700
-@@ -380,6 +380,16 @@ my %table=(
- "linux-alpha-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
- "linux-alpha+bwx-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
- 
-+ # Linux on ARM
-+"linux-elf-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-elf-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-gnueabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+
-+"linux-avr32","$ENV{'CC'}:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
-+
- #### *BSD [do see comment about ${BSDthreads} above!]
- "BSD-generic32","gcc:-DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "BSD-x86",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_asm}:a.out:dlfcn:bsd-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
diff --git a/recipes/openssl/openssl-1.0.0a/debian.patch b/recipes/openssl/openssl-1.0.0a/debian.patch
deleted file mode 100644
index 1cd6e11..0000000
--- a/recipes/openssl/openssl-1.0.0a/debian.patch
+++ /dev/null
@@ -1,515 +0,0 @@
-Index: openssl-1.0.0/Makefile
-===================================================================
---- openssl-1.0.0.orig/Makefile
-+++ openssl-1.0.0/Makefile
-@@ -26,10 +26,10 @@ HERE=.
- # for, say, /usr/ and yet have everything installed to /tmp/somedir/usr/.
- # Normally it is left empty.
- INSTALL_PREFIX=
--INSTALLTOP=/usr/local/ssl
-+INSTALLTOP=/usr
- 
- # Do not edit this manually. Use Configure --openssldir=DIR do change this!
--OPENSSLDIR=/usr/local/ssl
-+OPENSSLDIR=/usr/lib/ssl
- 
- # NO_IDEA - Define to build without the IDEA algorithm
- # NO_RC4  - Define to build without the RC4 algorithm
-@@ -133,12 +133,13 @@ TESTS = alltests
- 
- MAKEFILE= Makefile
- 
--MANDIR=$(OPENSSLDIR)/man
-+MANDIR=/usr/share/man
- MAN1=1
- MAN3=3
--MANSUFFIX=
-+MANSUFFIX=ssl
-+MANSECTION=SSL
- HTMLSUFFIX=html
--HTMLDIR=$(OPENSSLDIR)/html
-+HTMLDIR=/usr/share/doc/openssl/html
- SHELL=/bin/sh
- 
- TOP=    .
-@@ -149,8 +150,8 @@ LIBS=   libcrypto.a libssl.a
- SHARED_CRYPTO=libcrypto$(SHLIB_EXT)
- SHARED_SSL=libssl$(SHLIB_EXT)
- SHARED_LIBS=
--SHARED_LIBS_LINK_EXTS=
--SHARED_LDFLAGS=
-+SHARED_LIBS_LINK_EXTS=.so
-+SHARED_LDFLAGS=-m64 -Wl,--version-script=openssl.ld
- 
- GENERAL=        Makefile
- BASENAME=       openssl
-@@ -324,7 +325,8 @@ libcrypto.pc: Makefile
- 	    echo 'Description: OpenSSL cryptography library'; \
- 	    echo 'Version: '$(VERSION); \
- 	    echo 'Requires: '; \
--	    echo 'Libs: -L$${libdir} -lcrypto $(EX_LIBS)'; \
-+	    echo 'Libs: -L$${libdir} -lcrypto'; \
-+	    echo 'Libs.private: $(EX_LIBS)'; \
- 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libcrypto.pc
- 
- libssl.pc: Makefile
-@@ -337,7 +339,8 @@ libssl.pc: Makefile
- 	    echo 'Description: Secure Sockets Layer and cryptography libraries'; \
- 	    echo 'Version: '$(VERSION); \
- 	    echo 'Requires: '; \
--	    echo 'Libs: -L$${libdir} -lssl -lcrypto $(EX_LIBS)'; \
-+	    echo 'Libs: -L$${libdir} -lssl'; \
-+	    echo 'Libs.private: -lcrypto $(EX_LIBS)'; \
- 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libssl.pc
- 
- openssl.pc: Makefile
-@@ -350,7 +353,8 @@ openssl.pc: Makefile
- 	    echo 'Description: Secure Sockets Layer and cryptography libraries and tools'; \
- 	    echo 'Version: '$(VERSION); \
- 	    echo 'Requires: '; \
--	    echo 'Libs: -L$${libdir} -lssl -lcrypto $(EX_LIBS)'; \
-+	    echo 'Libs: -L$${libdir} -lssl -lcrypto'; \
-+	    echo 'Libs.private: $(EX_LIBS)'; \
- 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > openssl.pc
- 
- Makefile: Makefile.org Configure config
-@@ -499,7 +503,7 @@ install: all install_docs install_sw
- install_sw:
- 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
- 		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR) \
--		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines \
-+		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines \
- 		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/pkgconfig \
- 		$(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl \
- 		$(INSTALL_PREFIX)$(OPENSSLDIR)/misc \
-@@ -608,7 +612,7 @@ install_docs:
- 		echo "installing man$$sec/$$fn.$${sec}$(MANSUFFIX)"; \
- 		(cd `$(PERL) util/dirname.pl $$i`; \
- 		sh -c "$$pod2man \
--			--section=$$sec --center=OpenSSL \
-+			--section=$${sec}$(MANSECTION) --center=OpenSSL \
- 			--release=$(VERSION) `basename $$i`") \
- 			>  $(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX); \
- 		$(PERL) util/extract-names.pl < $$i | \
-@@ -625,7 +629,7 @@ install_docs:
- 		echo "installing man$$sec/$$fn.$${sec}$(MANSUFFIX)"; \
- 		(cd `$(PERL) util/dirname.pl $$i`; \
- 		sh -c "$$pod2man \
--			--section=$$sec --center=OpenSSL \
-+			--section=$${sec}$(MANSECTION) --center=OpenSSL \
- 			--release=$(VERSION) `basename $$i`") \
- 			>  $(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX); \
- 		$(PERL) util/extract-names.pl < $$i | \
-Index: openssl-1.0.0/Configure
-===================================================================
---- openssl-1.0.0.orig/Configure
-+++ openssl-1.0.0/Configure
-@@ -1,4 +1,4 @@
--:
-+#!/usr/local/bin/perl
- eval 'exec perl -S $0 ${1+"$@"}'
-     if $running_under_some_shell;
- ##
-@@ -331,6 +331,44 @@ my %table=(
- "osf1-alpha-cc",  "cc:-std1 -tune host -O4 -readonly_strings::(unknown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared:::.so",
- "tru64-alpha-cc", "cc:-std1 -tune host -fast -readonly_strings::-pthread:::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared::-msym:.so",
- 
-+# Debian GNU/* (various architectures)
-+"debian-alpha","gcc:-DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-alpha-ev4","gcc:-DTERMIO -O3 -Wa,--noexecstack -mcpu=ev4 -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-alpha-ev5","gcc:-DTERMIO -O3 -Wa,--noexecstack -mcpu=ev5 -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-arm","gcc:-DL_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-armeb","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-armel","gcc:-DL_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-amd64", "gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK RC4_CHAR BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-kfreebsd-amd64","gcc:-m64 -DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-kfreebsd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-hppa","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-hurd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-ia64","gcc:-DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK RC4_CHAR:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-i386","gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-i386-i486","gcc:-DL_ENDIAN 	-DTERMIO -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-i386-i586","gcc:-DL_ENDIAN -DTERMIO -O3 -march=i586 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-i386-i686/cmov","gcc:-DL_ENDIAN -DTERMIO -O3 -march=i686 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-m68k","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-mips",   "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-mipsel",   "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-netbsd-i386",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -m486 -Wall::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:::::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-netbsd-m68k",	"gcc:-DB_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -Wall::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL:::::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-netbsd-sparc",	"gcc:-DB_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -mv8 -Wall::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL:::::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-openbsd-alpha","gcc:-DTERMIOS -O3 -Wa,--noexecstack -g::(unknown):::SIXTY_FOUR_BIT_LONG DES_INT DES_PTR DES_RISC2:::::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-openbsd-i386",  "gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -m486::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-openbsd-mips","gcc:-O2 -Wa,--noexecstack -g -DL_ENDIAN::(unknown)::BN_LLONG MD2_CHAR RC4_INDEX RC4_CHAR DES_UNROLL DES_RISC2 DES_PTR BF_PTR::::::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-powerpc","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_UNROLL DES_RISC2 DES_PTR MD2_CHAR RC4_INDEX::linux_ppc32.o:::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-ppc64","gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL::linux_ppc64.o:::::::::::::dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-s390","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)", 
-+"debian-sh3",   "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sh4",   "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sh3eb",   "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sh4eb",   "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-m32r","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sparc","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sparc-v8","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -mcpu=v8 -g -Wall -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::sparcv8.o:des_enc-sparc.o fcrypt_b.o::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sparc-v9","gcc:-DB_ENDIAN -DTERMIO -O3 -mcpu=v9 -Wa,--noexecstack -Wa,-Av8plus -g -Wall -DULTRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::sparcv8plus.o:des_enc-sparc.o fcrypt_b.o:::md5-sparcv8plus.o:::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+
- ####
- #### Variety of LINUX:-)
- ####
-@@ -529,7 +567,7 @@ my %table=(
- # Cygwin
- "Cygwin-pre1.3", "gcc:-DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O3 -m486 -Wall::(unknown):CYGWIN32::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${no_asm}:win32",
- "Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O3 -march=i486 -Wall:::CYGWIN32::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_asm}:coff:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
--"debug-Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -march=i486 -Wall -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DOPENSSL_NO_ASM -g -Wformat -Wshadow -Wmissing-prototypes -Wmissing-declarations -Werror:::CYGWIN32:::${no_asm}:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
-+-"debug-Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -march=i486 -Wall -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DOPENSSL_NO_ASM -g -Wformat -Wshadow -Wmissing-prototypes -Wmissing-declarations -Werror:::CYGWIN32:::${no_asm}:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
- 
- # NetWare from David Ward (dsward@novell.com)
- # requires either MetroWerks NLM development tools, or gcc / nlmconv
-@@ -1465,6 +1503,8 @@ if ($strict_warnings)
- 		}
- 	}
- 
-+$shared_ldflag .= " -Wl,--version-script=openssl.ld";
-+
- open(IN,'<Makefile.org') || die "unable to read Makefile.org:$!\n";
- unlink("$Makefile.new") || die "unable to remove old $Makefile.new:$!\n" if -e "$Makefile.new";
- open(OUT,">$Makefile.new") || die "unable to create $Makefile.new:$!\n";
-@@ -1555,7 +1595,8 @@ while (<IN>)
- 	elsif ($shared_extension ne "" && $shared_extension =~ /^\.s([ol])\.[^\.]*\.[^\.]*$/)
- 		{
- 		my $sotmp = $1;
--		s/^SHARED_LIBS_LINK_EXTS=.*/SHARED_LIBS_LINK_EXTS=.s$sotmp.\$(SHLIB_MAJOR) .s$sotmp/;
-+#		s/^SHARED_LIBS_LINK_EXTS=.*/SHARED_LIBS_LINK_EXTS=.s$sotmp.\$(SHLIB_MAJOR) .s$sotmp/;
-+		s/^SHARED_LIBS_LINK_EXTS=.*/SHARED_LIBS_LINK_EXTS=.s$sotmp/;
- 		}
- 	elsif ($shared_extension ne "" && $shared_extension =~ /^\.[^\.]*\.[^\.]*\.dylib$/)
- 		{
-@@ -1683,7 +1724,7 @@ while (<IN>)
- 		}
- 	elsif	(/^#define\s+ENGINESDIR/)
- 		{
--		my $foo = "$prefix/$libdir/engines";
-+		my $foo = "$prefix/lib/ssl/engines";
- 		$foo =~ s/\\/\\\\/g;
- 		print OUT "#define ENGINESDIR \"$foo\"\n";
- 		}
-Index: openssl-1.0.0/config
-===================================================================
---- openssl-1.0.0.orig/config
-+++ openssl-1.0.0/config
-@@ -170,8 +170,8 @@ case "${SYSTEM}:${RELEASE}:${VERSION}:${
- 	echo "${MACHINE}-whatever-linux1"; exit 0
- 	;;
- 
--    GNU*)
--	echo "hurd-x86"; exit 0;
-+    GNU:*|GNU/*:*)
-+	echo "${MACHINE}-gnuish"; exit 0;
- 	;;
- 
-     LynxOS:*)
-Index: openssl-1.0.0/Makefile.org
-===================================================================
---- openssl-1.0.0.orig/Makefile.org
-+++ openssl-1.0.0/Makefile.org
-@@ -131,12 +131,13 @@ TESTS = alltests
- 
- MAKEFILE= Makefile
- 
--MANDIR=$(OPENSSLDIR)/man
-+MANDIR=/usr/share/man
- MAN1=1
- MAN3=3
--MANSUFFIX=
-+MANSUFFIX=ssl
-+MANSECTION=SSL
- HTMLSUFFIX=html
--HTMLDIR=$(OPENSSLDIR)/html
-+HTMLDIR=/usr/share/doc/openssl/html
- SHELL=/bin/sh
- 
- TOP=    .
-@@ -322,7 +323,8 @@ libcrypto.pc: Makefile
- 	    echo 'Description: OpenSSL cryptography library'; \
- 	    echo 'Version: '$(VERSION); \
- 	    echo 'Requires: '; \
--	    echo 'Libs: -L$${libdir} -lcrypto $(EX_LIBS)'; \
-+	    echo 'Libs: -L$${libdir} -lcrypto'; \
-+	    echo 'Libs.private: $(EX_LIBS)'; \
- 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libcrypto.pc
- 
- libssl.pc: Makefile
-@@ -335,7 +337,8 @@ libssl.pc: Makefile
- 	    echo 'Description: Secure Sockets Layer and cryptography libraries'; \
- 	    echo 'Version: '$(VERSION); \
- 	    echo 'Requires: '; \
--	    echo 'Libs: -L$${libdir} -lssl -lcrypto $(EX_LIBS)'; \
-+	    echo 'Libs: -L$${libdir} -lssl'; \
-+	    echo 'Libs.private: -lcrypto $(EX_LIBS)'; \
- 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libssl.pc
- 
- openssl.pc: Makefile
-@@ -348,7 +351,8 @@ openssl.pc: Makefile
- 	    echo 'Description: Secure Sockets Layer and cryptography libraries and tools'; \
- 	    echo 'Version: '$(VERSION); \
- 	    echo 'Requires: '; \
--	    echo 'Libs: -L$${libdir} -lssl -lcrypto $(EX_LIBS)'; \
-+	    echo 'Libs: -L$${libdir} -lssl -lcrypto'; \
-+	    echo 'Libs.private: $(EX_LIBS)'; \
- 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > openssl.pc
- 
- Makefile: Makefile.org Configure config
-@@ -497,7 +501,7 @@ install: all install_docs install_sw
- install_sw:
- 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
- 		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR) \
--		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines \
-+		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines \
- 		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/pkgconfig \
- 		$(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl \
- 		$(INSTALL_PREFIX)$(OPENSSLDIR)/misc \
-@@ -606,7 +610,7 @@ install_docs:
- 		echo "installing man$$sec/$$fn.$${sec}$(MANSUFFIX)"; \
- 		(cd `$(PERL) util/dirname.pl $$i`; \
- 		sh -c "$$pod2man \
--			--section=$$sec --center=OpenSSL \
-+			--section=$${sec}$(MANSECTION) --center=OpenSSL \
- 			--release=$(VERSION) `basename $$i`") \
- 			>  $(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX); \
- 		$(PERL) util/extract-names.pl < $$i | \
-@@ -623,7 +627,7 @@ install_docs:
- 		echo "installing man$$sec/$$fn.$${sec}$(MANSUFFIX)"; \
- 		(cd `$(PERL) util/dirname.pl $$i`; \
- 		sh -c "$$pod2man \
--			--section=$$sec --center=OpenSSL \
-+			--section=$${sec}$(MANSECTION) --center=OpenSSL \
- 			--release=$(VERSION) `basename $$i`") \
- 			>  $(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX); \
- 		$(PERL) util/extract-names.pl < $$i | \
-Index: openssl-1.0.0/openssl.ld
-===================================================================
---- /dev/null
-+++ openssl-1.0.0/openssl.ld
-@@ -0,0 +1,5 @@
-+OPENSSL_0.9.8 {
-+	 global:
-+		 *;
-+};
-+
-Index: openssl-1.0.0/engines/openssl.ld
-===================================================================
---- /dev/null
-+++ openssl-1.0.0/engines/openssl.ld
-@@ -0,0 +1,5 @@
-+OPENSSL_0.9.8 {
-+	 global:
-+		 *;
-+};
-+
-Index: openssl-1.0.0/doc/Makefile
-===================================================================
---- /dev/null
-+++ openssl-1.0.0/doc/Makefile
-@@ -0,0 +1,40 @@
-+VERSION =
-+
-+#PODS = $(wildcard *.pod)
-+#MANS = $(addsuffix .man, $(basename $(PODS)))
-+
-+MANS = openssl.1 ssl.3 crypto.3
-+
-+P2M = pod2man --center='OpenSSL Documentation' --release="OpenSSL $(VERSION)"
-+
-+all: manpages
-+
-+.PHONY: manpages 
-+
-+manpages: openssl.1 crypto.3 ssl.3
-+
-+openssl.1:
-+	$(P2M) --section=1 openssl.pod > openssl.1
-+
-+crypto.3:
-+	$(P2M) --section=3 crypto.pod > crypto.3
-+
-+ssl.3:
-+	$(P2M) --section=3 ssl.pod > ssl.3
-+
-+.PHONY: install
-+install:
-+	mkdir -p $(INSTALL_PREFIX)$(INSTALLTOP)/share/man/man1
-+	mkdir -p $(INSTALL_PREFIX)$(INSTALLTOP)/share/man/man3
-+	install -m 644 -p openssl.1 $(INSTALL_PREFIX)$(INSTALLTOP)/share/man/man1
-+	install -m 644 -p crypto.3 $(INSTALL_PREFIX)$(INSTALLTOP)/share/man/man3
-+	install -m 644 -p ssl.3 $(INSTALL_PREFIX)$(INSTALLTOP)/share/man/man3
-+	rm -f $(MANS)
-+
-+.PHONY: clean
-+clean:
-+	rm -f $(MANS)
-+
-+.PHONY: realclean
-+realclean:
-+	-$(MAKE) clean
-Index: openssl-1.0.0/doc/apps/c_rehash.pod
-===================================================================
---- /dev/null
-+++ openssl-1.0.0/doc/apps/c_rehash.pod
-@@ -0,0 +1,55 @@
-+
-+=pod
-+
-+=head1 NAME
-+
-+c_rehash - Create symbolic links to files named by the hash values
-+
-+=head1 SYNOPSIS
-+
-+B<c_rehash>
-+[directory] ...
-+
-+=head1 DESCRIPTION
-+
-+c_rehash scans directories and takes a hash value of each .pem and .crt file in the directory. It then creates symbolic links for each of the files named by the hash value. This is useful as many programs require directories to be set up like this in order to find the certificates they require. 
-+
-+If any directories are named on the command line then these directories are processed in turn. If not then and the environment variable SSL_CERT_DIR is defined then that is consulted. This variable should be a colon (:) separated list of directories, all of which will be processed. If neither of these conditions are true then /usr/lib/ssl/certs is processed. 
-+
-+For each directory that is to be processed he user must have write permissions on the directory, if they do not then nothing will be printed for that directory.
-+
-+Note that this program deletes all the symbolic links that look like ones that it creates before processing a directory. Beware that if you run the program on a directory that contains symbolic links for other purposes that are named in the same format as those created by this program they will be lost.
-+
-+The hashes for certificate files are of the form <hash>.<n> where n is an integer. If the hash value already exists then n will be incremented, unless the file is a duplicate. Duplicates are detected using the fingerprint of the certificate. A warning will be printed if a duplicate is detected. The hashes for CRL files are of the form <hash>.r<n> and have the same behavior.
-+
-+The program will also warn if there are files with extension .pem which are not certificate or CRL files.
-+
-+The program uses the openssl program to compute the hashes and fingerprints. It expects the executable to be named openssl and be on the PATH, or in the /usr/lib/ssl/bin directory. If the OPENSSL environment variable is defined then this is used instead as the executable that provides the hashes and fingerprints. When called as $OPENSSL x509 -hash -fingerprint -noout -in $file it must output the hash of $file on the first line followed by the fingerprint on the second line, optionally prefixed with some text and an equals sign (=). 
-+
-+=head1 OPTIONS
-+
-+None
-+
-+=head1 ENVIRONMENT
-+
-+=over 4
-+
-+=item B<OPENSSL>
-+
-+The name (and path) of an executable to use to generate hashes and fingerprints (see above).
-+
-+=item B<SSL_CERT_DIR>
-+
-+Colon separated list of directories to operate on. Ignored if directories are listed on the command line.
-+
-+=head1 SEE ALSO
-+
-+L<openssl(1)|openssl(1)>, L<x509(1)|x509(1)>
-+
-+=back
-+
-+=head1 BUGS
-+
-+No known bugs
-+
-+=cut
-Index: openssl-1.0.0/crypto/opensslconf.h
-===================================================================
---- openssl-1.0.0.orig/crypto/opensslconf.h
-+++ openssl-1.0.0/crypto/opensslconf.h
-@@ -11,6 +11,9 @@
- #ifndef OPENSSL_NO_JPAKE
- # define OPENSSL_NO_JPAKE
- #endif
-+#ifndef OPENSSL_NO_IDEA
-+# define OPENSSL_NO_IDEA
-+#endif
- #ifndef OPENSSL_NO_KRB5
- # define OPENSSL_NO_KRB5
- #endif
-@@ -44,6 +47,9 @@
- # if defined(OPENSSL_NO_JPAKE) && !defined(NO_JPAKE)
- #  define NO_JPAKE
- # endif
-+# if defined(OPENSSL_NO_IDEA) && !defined(NO_IDEA)
-+#  define NO_IDEA
-+# endif
- # if defined(OPENSSL_NO_KRB5) && !defined(NO_KRB5)
- #  define NO_KRB5
- # endif
-@@ -68,8 +74,8 @@
- 
- #if !(defined(VMS) || defined(__VMS)) /* VMS uses logical names instead */
- #if defined(HEADER_CRYPTLIB_H) && !defined(OPENSSLDIR)
--#define ENGINESDIR "/usr/local/ssl/lib/engines"
--#define OPENSSLDIR "/usr/local/ssl"
-+#define ENGINESDIR "/usr/lib/ssl/engines"
-+#define OPENSSLDIR "/usr/lib/ssl"
- #endif
- #endif
- 
-@@ -100,14 +106,14 @@
-  * - Intel P6 because partial register stalls are very expensive;
-  * - elder Alpha because it lacks byte load/store instructions;
-  */
--#define RC4_INT unsigned int
-+#define RC4_INT unsigned char
- #endif
- #if !defined(RC4_CHUNK)
- /*
-  * This enables code handling data aligned at natural CPU word
-  * boundary. See crypto/rc4/rc4_enc.c for further details.
-  */
--#undef RC4_CHUNK
-+#define RC4_CHUNK unsigned long
- #endif
- #endif
- 
-@@ -115,7 +121,7 @@
- /* If this is set to 'unsigned int' on a DEC Alpha, this gives about a
-  * %20 speed up (longs are 8 bytes, int's are 4). */
- #ifndef DES_LONG
--#define DES_LONG unsigned long
-+#define DES_LONG unsigned int
- #endif
- #endif
- 
-@@ -126,9 +132,9 @@
- /* Should we define BN_DIV2W here? */
- 
- /* Only one for the following should be defined */
--#undef SIXTY_FOUR_BIT_LONG
-+#define SIXTY_FOUR_BIT_LONG
- #undef SIXTY_FOUR_BIT
--#define THIRTY_TWO_BIT
-+#undef THIRTY_TWO_BIT
- #endif
- 
- #if defined(HEADER_RC4_LOCL_H) && !defined(CONFIG_HEADER_RC4_LOCL_H)
-@@ -140,7 +146,7 @@
- 
- #if defined(HEADER_BF_LOCL_H) && !defined(CONFIG_HEADER_BF_LOCL_H)
- #define CONFIG_HEADER_BF_LOCL_H
--#undef BF_PTR
-+#define BF_PTR2
- #endif /* HEADER_BF_LOCL_H */
- 
- #if defined(HEADER_DES_LOCL_H) && !defined(CONFIG_HEADER_DES_LOCL_H)
-@@ -170,7 +176,7 @@ YOU SHOULD NOT HAVE BOTH DES_RISC1 AND D
- /* Unroll the inner loop, this sometimes helps, sometimes hinders.
-  * Very mucy CPU dependant */
- #ifndef DES_UNROLL
--#undef DES_UNROLL
-+#define DES_UNROLL
- #endif
- 
- /* These default values were supplied by
-Index: openssl-1.0.0/crypto/sha/sha.h
-===================================================================
---- openssl-1.0.0.orig/crypto/sha/sha.h
-+++ openssl-1.0.0/crypto/sha/sha.h
-@@ -59,6 +59,7 @@
- #ifndef HEADER_SHA_H
- #define HEADER_SHA_H
- 
-+#include <stddef.h>
- #include <openssl/e_os2.h>
- #include <stddef.h>
- 
diff --git a/recipes/openssl/openssl-1.0.0a/engines-install-in-libdir-ssl.patch b/recipes/openssl/openssl-1.0.0a/engines-install-in-libdir-ssl.patch
deleted file mode 100644
index 949d6ad..0000000
--- a/recipes/openssl/openssl-1.0.0a/engines-install-in-libdir-ssl.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Index: openssl-1.0.0/engines/Makefile
-===================================================================
---- openssl-1.0.0.orig/engines/Makefile
-+++ openssl-1.0.0/engines/Makefile
-@@ -107,7 +107,7 @@
- 	@[ -n "$(INSTALLTOP)" ] # should be set by top Makefile...
- 	@if [ -n "$(SHARED_LIBS)" ]; then \
- 		set -e; \
--		$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines; \
-+		$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines; \
- 		for l in $(LIBNAMES); do \
- 			( echo installing $$l; \
- 			  pfx=lib; \
-@@ -119,13 +119,13 @@
- 				*DSO_WIN32*)	sfx="eay32.dll"; pfx=;;	\
- 				*)		sfx=".bad";;	\
- 				esac; \
--				cp $$pfx$$l$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new; \
-+				cp $$pfx$$l$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx.new; \
- 			  else \
- 				sfx=".so"; \
--				cp cyg$$l.dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new; \
-+				cp cyg$$l.dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx.new; \
- 			  fi; \
--			  chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new; \
--			  mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx ); \
-+			  chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx.new; \
-+			  mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx ); \
- 		done; \
- 	fi
- 	@target=install; $(RECURSIVE_MAKE)
-Index: openssl-1.0.0/engines/ccgost/Makefile
-===================================================================
---- openssl-1.0.0.orig/engines/ccgost/Makefile
-+++ openssl-1.0.0/engines/ccgost/Makefile
-@@ -53,13 +53,13 @@
- 			*DSO_WIN32*) sfx="eay32.dll"; pfx=;; \
- 			*) sfx=".bad";; \
- 			esac; \
--			cp $${pfx}$(LIBNAME)$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx.new; \
-+			cp $${pfx}$(LIBNAME)$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx.new; \
- 		else \
- 			sfx=".so"; \
--			cp cyg$(LIBNAME).dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx.new; \
-+			cp cyg$(LIBNAME).dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx.new; \
- 		fi; \
--		chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx.new; \
--		mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx; \
-+		chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx.new; \
-+		mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx; \
- 	fi
- 
- links:
diff --git a/recipes/openssl/openssl-1.0.0a/libdeps-first.patch b/recipes/openssl/openssl-1.0.0a/libdeps-first.patch
deleted file mode 100644
index 1fda69b..0000000
--- a/recipes/openssl/openssl-1.0.0a/libdeps-first.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Links to previously staged 0.9.8* easily otherwise
-
-Index: openssl-1.0.0/Makefile.shared
-===================================================================
---- openssl-1.0.0.orig/Makefile.shared
-+++ openssl-1.0.0/Makefile.shared
-@@ -96,7 +96,7 @@
-     LIBPATH=`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;t' -e d | uniq`; \
-     LIBPATH=`echo $$LIBPATH | sed -e 's/ /:/g'`; \
-     LD_LIBRARY_PATH=$$LIBPATH:$$LD_LIBRARY_PATH \
--    $${LDCMD} $${LDFLAGS} -o $${APPNAME:=$(APPNAME)} $(OBJECTS) $${LIBDEPS} )
-+    $${LDCMD} $${LIBDEPS} $${LDFLAGS} -o $${APPNAME:=$(APPNAME)} $(OBJECTS) )
- 
- LINK_SO=	\
-   ( $(SET_X);   \
-@@ -106,9 +106,9 @@
-     LIBPATH=`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;t' -e d | uniq`; \
-     LIBPATH=`echo $$LIBPATH | sed -e 's/ /:/g'`; \
-     LD_LIBRARY_PATH=$$LIBPATH:$$LD_LIBRARY_PATH \
--    $${SHAREDCMD} $${SHAREDFLAGS} \
-+    $${SHAREDCMD} $$LIBDEPS $${SHAREDFLAGS} \
- 	-o $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX \
--	$$ALLSYMSFLAGS $$SHOBJECTS $$NOALLSYMSFLAGS $$LIBDEPS \
-+	$$ALLSYMSFLAGS $$SHOBJECTS $$NOALLSYMSFLAGS \
-   ) && $(SYMLINK_SO)
- 
- SYMLINK_SO=	\
diff --git a/recipes/openssl/openssl-1.0.0a/oe-ldflags.patch b/recipes/openssl/openssl-1.0.0a/oe-ldflags.patch
deleted file mode 100644
index 3dd3bed..0000000
--- a/recipes/openssl/openssl-1.0.0a/oe-ldflags.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: openssl-1.0.0/Makefile.shared
-===================================================================
---- openssl-1.0.0.orig/Makefile.shared
-+++ openssl-1.0.0/Makefile.shared
-@@ -92,7 +92,7 @@
- LINK_APP=	\
-   ( $(SET_X);   \
-     LIBDEPS="$${LIBDEPS:-$(LIBDEPS)}"; \
--    LDCMD="$${LDCMD:-$(CC)}"; LDFLAGS="$${LDFLAGS:-$(CFLAGS)}"; \
-+    LDCMD="$${LDCMD:-$(CC)}"; LDFLAGS="$(OE_LDFLAGS) $${LDFLAGS:-$(CFLAGS)}"; \
-     LIBPATH=`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;t' -e d | uniq`; \
-     LIBPATH=`echo $$LIBPATH | sed -e 's/ /:/g'`; \
-     LD_LIBRARY_PATH=$$LIBPATH:$$LD_LIBRARY_PATH \
-@@ -102,7 +102,7 @@
-   ( $(SET_X);   \
-     LIBDEPS="$${LIBDEPS:-$(LIBDEPS)}"; \
-     SHAREDCMD="$${SHAREDCMD:-$(CC)}"; \
--    SHAREDFLAGS="$${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDFLAGS)}"; \
-+    SHAREDFLAGS="$(OE_LDFLAGS) $${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDFLAGS)}"; \
-     LIBPATH=`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;t' -e d | uniq`; \
-     LIBPATH=`echo $$LIBPATH | sed -e 's/ /:/g'`; \
-     LD_LIBRARY_PATH=$$LIBPATH:$$LD_LIBRARY_PATH \
diff --git a/recipes/openssl/openssl-1.0.0a/openssl-fix-ssl3_get_key_exchange-double-free.patch b/recipes/openssl/openssl-1.0.0a/openssl-fix-ssl3_get_key_exchange-double-free.patch
deleted file mode 100644
index 4e98849..0000000
--- a/recipes/openssl/openssl-1.0.0a/openssl-fix-ssl3_get_key_exchange-double-free.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: openssl-1.0.0a/ssl/s3_clnt.c
-===================================================================
---- openssl-1.0.0a.orig/ssl/s3_clnt.c	2010-09-13 18:38:01.000000000 +0400
-+++ openssl-1.0.0a/ssl/s3_clnt.c	2010-09-13 18:38:35.000000000 +0400
-@@ -1508,6 +1508,7 @@
- 		s->session->sess_cert->peer_ecdh_tmp=ecdh;
- 		ecdh=NULL;
- 		BN_CTX_free(bn_ctx);
-+		bn_ctx = NULL;
- 		EC_POINT_free(srvr_ecpoint);
- 		srvr_ecpoint = NULL;
- 		}
diff --git a/recipes/openssl/openssl-1.0.0a/shared-libs.patch b/recipes/openssl/openssl-1.0.0a/shared-libs.patch
deleted file mode 100644
index 7cd70d8..0000000
--- a/recipes/openssl/openssl-1.0.0a/shared-libs.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Index: openssl-1.0.0/crypto/Makefile
-===================================================================
---- openssl-1.0.0.orig/crypto/Makefile
-+++ openssl-1.0.0/crypto/Makefile
-@@ -104,7 +104,7 @@
- 
- shared: buildinf.h lib subdirs
- 	if [ -n "$(SHARED_LIBS)" ]; then \
--		(cd ..; $(MAKE) $(SHARED_LIB)); \
-+		(cd ..; $(MAKE) -e $(SHARED_LIB)); \
- 	fi
- 
- libs:
-Index: openssl-1.0.0/Makefile.org
-===================================================================
---- openssl-1.0.0.orig/Makefile.org
-+++ openssl-1.0.0/Makefile.org
-@@ -260,7 +260,7 @@
- 
- libcrypto$(SHLIB_EXT): libcrypto.a
- 	@if [ "$(SHLIB_TARGET)" != "" ]; then \
--		$(MAKE) SHLIBDIRS=crypto build-shared; \
-+		$(MAKE) -e SHLIBDIRS=crypto build-shared; \
- 	else \
- 		echo "There's no support for shared libraries on this platform" >&2; \
- 		exit 1; \
-@@ -268,7 +268,7 @@
- 
- libssl$(SHLIB_EXT): libcrypto$(SHLIB_EXT) libssl.a
- 	@if [ "$(SHLIB_TARGET)" != "" ]; then \
--		$(MAKE) SHLIBDIRS=ssl SHLIBDEPS='-lcrypto' build-shared; \
-+		$(MAKE) -e SHLIBDIRS=ssl SHLIBDEPS='-lcrypto' build-shared; \
- 	else \
- 		echo "There's no support for shared libraries on this platform" >&2; \
- 		exit 1; \
-Index: openssl-1.0.0/ssl/Makefile
-===================================================================
---- openssl-1.0.0.orig/ssl/Makefile
-+++ openssl-1.0.0/ssl/Makefile
-@@ -62,7 +62,7 @@
- 
- shared: lib
- 	if [ -n "$(SHARED_LIBS)" ]; then \
--		(cd ..; $(MAKE) $(SHARED_LIB)); \
-+		(cd ..; $(MAKE) -e $(SHARED_LIB)); \
- 	fi
- 
- files:
diff --git a/recipes/openssl/openssl-1.0.0b/configure-targets.patch b/recipes/openssl/openssl-1.0.0b/configure-targets.patch
new file mode 100644
index 0000000..112732b
--- /dev/null
+++ b/recipes/openssl/openssl-1.0.0b/configure-targets.patch
@@ -0,0 +1,25 @@
+
+The number of colons are important :)
+
+
+Index: openssl-1.0.0/Configure
+===================================================================
+--- openssl-1.0.0.orig/Configure	2010-01-19 13:40:54.000000000 -0800
++++ openssl-1.0.0/Configure	2010-05-26 22:58:01.238104854 -0700
+@@ -380,6 +380,16 @@ my %table=(
+ "linux-alpha-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
+ "linux-alpha+bwx-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
+ 
++ # Linux on ARM
++"linux-elf-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-elf-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-gnueabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++
++"linux-avr32","$ENV{'CC'}:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
++
+ #### *BSD [do see comment about ${BSDthreads} above!]
+ "BSD-generic32","gcc:-DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "BSD-x86",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_asm}:a.out:dlfcn:bsd-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
diff --git a/recipes/openssl/openssl-1.0.0b/debian.patch b/recipes/openssl/openssl-1.0.0b/debian.patch
new file mode 100644
index 0000000..1cd6e11
--- /dev/null
+++ b/recipes/openssl/openssl-1.0.0b/debian.patch
@@ -0,0 +1,515 @@
+Index: openssl-1.0.0/Makefile
+===================================================================
+--- openssl-1.0.0.orig/Makefile
++++ openssl-1.0.0/Makefile
+@@ -26,10 +26,10 @@ HERE=.
+ # for, say, /usr/ and yet have everything installed to /tmp/somedir/usr/.
+ # Normally it is left empty.
+ INSTALL_PREFIX=
+-INSTALLTOP=/usr/local/ssl
++INSTALLTOP=/usr
+ 
+ # Do not edit this manually. Use Configure --openssldir=DIR do change this!
+-OPENSSLDIR=/usr/local/ssl
++OPENSSLDIR=/usr/lib/ssl
+ 
+ # NO_IDEA - Define to build without the IDEA algorithm
+ # NO_RC4  - Define to build without the RC4 algorithm
+@@ -133,12 +133,13 @@ TESTS = alltests
+ 
+ MAKEFILE= Makefile
+ 
+-MANDIR=$(OPENSSLDIR)/man
++MANDIR=/usr/share/man
+ MAN1=1
+ MAN3=3
+-MANSUFFIX=
++MANSUFFIX=ssl
++MANSECTION=SSL
+ HTMLSUFFIX=html
+-HTMLDIR=$(OPENSSLDIR)/html
++HTMLDIR=/usr/share/doc/openssl/html
+ SHELL=/bin/sh
+ 
+ TOP=    .
+@@ -149,8 +150,8 @@ LIBS=   libcrypto.a libssl.a
+ SHARED_CRYPTO=libcrypto$(SHLIB_EXT)
+ SHARED_SSL=libssl$(SHLIB_EXT)
+ SHARED_LIBS=
+-SHARED_LIBS_LINK_EXTS=
+-SHARED_LDFLAGS=
++SHARED_LIBS_LINK_EXTS=.so
++SHARED_LDFLAGS=-m64 -Wl,--version-script=openssl.ld
+ 
+ GENERAL=        Makefile
+ BASENAME=       openssl
+@@ -324,7 +325,8 @@ libcrypto.pc: Makefile
+ 	    echo 'Description: OpenSSL cryptography library'; \
+ 	    echo 'Version: '$(VERSION); \
+ 	    echo 'Requires: '; \
+-	    echo 'Libs: -L$${libdir} -lcrypto $(EX_LIBS)'; \
++	    echo 'Libs: -L$${libdir} -lcrypto'; \
++	    echo 'Libs.private: $(EX_LIBS)'; \
+ 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libcrypto.pc
+ 
+ libssl.pc: Makefile
+@@ -337,7 +339,8 @@ libssl.pc: Makefile
+ 	    echo 'Description: Secure Sockets Layer and cryptography libraries'; \
+ 	    echo 'Version: '$(VERSION); \
+ 	    echo 'Requires: '; \
+-	    echo 'Libs: -L$${libdir} -lssl -lcrypto $(EX_LIBS)'; \
++	    echo 'Libs: -L$${libdir} -lssl'; \
++	    echo 'Libs.private: -lcrypto $(EX_LIBS)'; \
+ 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libssl.pc
+ 
+ openssl.pc: Makefile
+@@ -350,7 +353,8 @@ openssl.pc: Makefile
+ 	    echo 'Description: Secure Sockets Layer and cryptography libraries and tools'; \
+ 	    echo 'Version: '$(VERSION); \
+ 	    echo 'Requires: '; \
+-	    echo 'Libs: -L$${libdir} -lssl -lcrypto $(EX_LIBS)'; \
++	    echo 'Libs: -L$${libdir} -lssl -lcrypto'; \
++	    echo 'Libs.private: $(EX_LIBS)'; \
+ 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > openssl.pc
+ 
+ Makefile: Makefile.org Configure config
+@@ -499,7 +503,7 @@ install: all install_docs install_sw
+ install_sw:
+ 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
+ 		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR) \
+-		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines \
++		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines \
+ 		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/pkgconfig \
+ 		$(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl \
+ 		$(INSTALL_PREFIX)$(OPENSSLDIR)/misc \
+@@ -608,7 +612,7 @@ install_docs:
+ 		echo "installing man$$sec/$$fn.$${sec}$(MANSUFFIX)"; \
+ 		(cd `$(PERL) util/dirname.pl $$i`; \
+ 		sh -c "$$pod2man \
+-			--section=$$sec --center=OpenSSL \
++			--section=$${sec}$(MANSECTION) --center=OpenSSL \
+ 			--release=$(VERSION) `basename $$i`") \
+ 			>  $(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX); \
+ 		$(PERL) util/extract-names.pl < $$i | \
+@@ -625,7 +629,7 @@ install_docs:
+ 		echo "installing man$$sec/$$fn.$${sec}$(MANSUFFIX)"; \
+ 		(cd `$(PERL) util/dirname.pl $$i`; \
+ 		sh -c "$$pod2man \
+-			--section=$$sec --center=OpenSSL \
++			--section=$${sec}$(MANSECTION) --center=OpenSSL \
+ 			--release=$(VERSION) `basename $$i`") \
+ 			>  $(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX); \
+ 		$(PERL) util/extract-names.pl < $$i | \
+Index: openssl-1.0.0/Configure
+===================================================================
+--- openssl-1.0.0.orig/Configure
++++ openssl-1.0.0/Configure
+@@ -1,4 +1,4 @@
+-:
++#!/usr/local/bin/perl
+ eval 'exec perl -S $0 ${1+"$@"}'
+     if $running_under_some_shell;
+ ##
+@@ -331,6 +331,44 @@ my %table=(
+ "osf1-alpha-cc",  "cc:-std1 -tune host -O4 -readonly_strings::(unknown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared:::.so",
+ "tru64-alpha-cc", "cc:-std1 -tune host -fast -readonly_strings::-pthread:::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared::-msym:.so",
+ 
++# Debian GNU/* (various architectures)
++"debian-alpha","gcc:-DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-alpha-ev4","gcc:-DTERMIO -O3 -Wa,--noexecstack -mcpu=ev4 -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-alpha-ev5","gcc:-DTERMIO -O3 -Wa,--noexecstack -mcpu=ev5 -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-arm","gcc:-DL_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-armeb","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-armel","gcc:-DL_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-amd64", "gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK RC4_CHAR BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-kfreebsd-amd64","gcc:-m64 -DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-kfreebsd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-hppa","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-hurd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-ia64","gcc:-DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK RC4_CHAR:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-i386","gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-i386-i486","gcc:-DL_ENDIAN 	-DTERMIO -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-i386-i586","gcc:-DL_ENDIAN -DTERMIO -O3 -march=i586 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-i386-i686/cmov","gcc:-DL_ENDIAN -DTERMIO -O3 -march=i686 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-m68k","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-mips",   "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-mipsel",   "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-netbsd-i386",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -m486 -Wall::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:::::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-netbsd-m68k",	"gcc:-DB_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -Wall::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL:::::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-netbsd-sparc",	"gcc:-DB_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -mv8 -Wall::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL:::::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-openbsd-alpha","gcc:-DTERMIOS -O3 -Wa,--noexecstack -g::(unknown):::SIXTY_FOUR_BIT_LONG DES_INT DES_PTR DES_RISC2:::::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-openbsd-i386",  "gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -m486::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-openbsd-mips","gcc:-O2 -Wa,--noexecstack -g -DL_ENDIAN::(unknown)::BN_LLONG MD2_CHAR RC4_INDEX RC4_CHAR DES_UNROLL DES_RISC2 DES_PTR BF_PTR::::::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-powerpc","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_UNROLL DES_RISC2 DES_PTR MD2_CHAR RC4_INDEX::linux_ppc32.o:::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-ppc64","gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL::linux_ppc64.o:::::::::::::dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-s390","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)", 
++"debian-sh3",   "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sh4",   "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sh3eb",   "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sh4eb",   "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-m32r","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sparc","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR:::::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sparc-v8","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -mcpu=v8 -g -Wall -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::sparcv8.o:des_enc-sparc.o fcrypt_b.o::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"debian-sparc-v9","gcc:-DB_ENDIAN -DTERMIO -O3 -mcpu=v9 -Wa,--noexecstack -Wa,-Av8plus -g -Wall -DULTRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::sparcv8plus.o:des_enc-sparc.o fcrypt_b.o:::md5-sparcv8plus.o:::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++
+ ####
+ #### Variety of LINUX:-)
+ ####
+@@ -529,7 +567,7 @@ my %table=(
+ # Cygwin
+ "Cygwin-pre1.3", "gcc:-DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O3 -m486 -Wall::(unknown):CYGWIN32::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${no_asm}:win32",
+ "Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O3 -march=i486 -Wall:::CYGWIN32::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_asm}:coff:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
+-"debug-Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -march=i486 -Wall -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DOPENSSL_NO_ASM -g -Wformat -Wshadow -Wmissing-prototypes -Wmissing-declarations -Werror:::CYGWIN32:::${no_asm}:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
++-"debug-Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -march=i486 -Wall -DBN_DEBUG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DOPENSSL_NO_ASM -g -Wformat -Wshadow -Wmissing-prototypes -Wmissing-declarations -Werror:::CYGWIN32:::${no_asm}:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
+ 
+ # NetWare from David Ward (dsward@novell.com)
+ # requires either MetroWerks NLM development tools, or gcc / nlmconv
+@@ -1465,6 +1503,8 @@ if ($strict_warnings)
+ 		}
+ 	}
+ 
++$shared_ldflag .= " -Wl,--version-script=openssl.ld";
++
+ open(IN,'<Makefile.org') || die "unable to read Makefile.org:$!\n";
+ unlink("$Makefile.new") || die "unable to remove old $Makefile.new:$!\n" if -e "$Makefile.new";
+ open(OUT,">$Makefile.new") || die "unable to create $Makefile.new:$!\n";
+@@ -1555,7 +1595,8 @@ while (<IN>)
+ 	elsif ($shared_extension ne "" && $shared_extension =~ /^\.s([ol])\.[^\.]*\.[^\.]*$/)
+ 		{
+ 		my $sotmp = $1;
+-		s/^SHARED_LIBS_LINK_EXTS=.*/SHARED_LIBS_LINK_EXTS=.s$sotmp.\$(SHLIB_MAJOR) .s$sotmp/;
++#		s/^SHARED_LIBS_LINK_EXTS=.*/SHARED_LIBS_LINK_EXTS=.s$sotmp.\$(SHLIB_MAJOR) .s$sotmp/;
++		s/^SHARED_LIBS_LINK_EXTS=.*/SHARED_LIBS_LINK_EXTS=.s$sotmp/;
+ 		}
+ 	elsif ($shared_extension ne "" && $shared_extension =~ /^\.[^\.]*\.[^\.]*\.dylib$/)
+ 		{
+@@ -1683,7 +1724,7 @@ while (<IN>)
+ 		}
+ 	elsif	(/^#define\s+ENGINESDIR/)
+ 		{
+-		my $foo = "$prefix/$libdir/engines";
++		my $foo = "$prefix/lib/ssl/engines";
+ 		$foo =~ s/\\/\\\\/g;
+ 		print OUT "#define ENGINESDIR \"$foo\"\n";
+ 		}
+Index: openssl-1.0.0/config
+===================================================================
+--- openssl-1.0.0.orig/config
++++ openssl-1.0.0/config
+@@ -170,8 +170,8 @@ case "${SYSTEM}:${RELEASE}:${VERSION}:${
+ 	echo "${MACHINE}-whatever-linux1"; exit 0
+ 	;;
+ 
+-    GNU*)
+-	echo "hurd-x86"; exit 0;
++    GNU:*|GNU/*:*)
++	echo "${MACHINE}-gnuish"; exit 0;
+ 	;;
+ 
+     LynxOS:*)
+Index: openssl-1.0.0/Makefile.org
+===================================================================
+--- openssl-1.0.0.orig/Makefile.org
++++ openssl-1.0.0/Makefile.org
+@@ -131,12 +131,13 @@ TESTS = alltests
+ 
+ MAKEFILE= Makefile
+ 
+-MANDIR=$(OPENSSLDIR)/man
++MANDIR=/usr/share/man
+ MAN1=1
+ MAN3=3
+-MANSUFFIX=
++MANSUFFIX=ssl
++MANSECTION=SSL
+ HTMLSUFFIX=html
+-HTMLDIR=$(OPENSSLDIR)/html
++HTMLDIR=/usr/share/doc/openssl/html
+ SHELL=/bin/sh
+ 
+ TOP=    .
+@@ -322,7 +323,8 @@ libcrypto.pc: Makefile
+ 	    echo 'Description: OpenSSL cryptography library'; \
+ 	    echo 'Version: '$(VERSION); \
+ 	    echo 'Requires: '; \
+-	    echo 'Libs: -L$${libdir} -lcrypto $(EX_LIBS)'; \
++	    echo 'Libs: -L$${libdir} -lcrypto'; \
++	    echo 'Libs.private: $(EX_LIBS)'; \
+ 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libcrypto.pc
+ 
+ libssl.pc: Makefile
+@@ -335,7 +337,8 @@ libssl.pc: Makefile
+ 	    echo 'Description: Secure Sockets Layer and cryptography libraries'; \
+ 	    echo 'Version: '$(VERSION); \
+ 	    echo 'Requires: '; \
+-	    echo 'Libs: -L$${libdir} -lssl -lcrypto $(EX_LIBS)'; \
++	    echo 'Libs: -L$${libdir} -lssl'; \
++	    echo 'Libs.private: -lcrypto $(EX_LIBS)'; \
+ 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libssl.pc
+ 
+ openssl.pc: Makefile
+@@ -348,7 +351,8 @@ openssl.pc: Makefile
+ 	    echo 'Description: Secure Sockets Layer and cryptography libraries and tools'; \
+ 	    echo 'Version: '$(VERSION); \
+ 	    echo 'Requires: '; \
+-	    echo 'Libs: -L$${libdir} -lssl -lcrypto $(EX_LIBS)'; \
++	    echo 'Libs: -L$${libdir} -lssl -lcrypto'; \
++	    echo 'Libs.private: $(EX_LIBS)'; \
+ 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > openssl.pc
+ 
+ Makefile: Makefile.org Configure config
+@@ -497,7 +501,7 @@ install: all install_docs install_sw
+ install_sw:
+ 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
+ 		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR) \
+-		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines \
++		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines \
+ 		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/pkgconfig \
+ 		$(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl \
+ 		$(INSTALL_PREFIX)$(OPENSSLDIR)/misc \
+@@ -606,7 +610,7 @@ install_docs:
+ 		echo "installing man$$sec/$$fn.$${sec}$(MANSUFFIX)"; \
+ 		(cd `$(PERL) util/dirname.pl $$i`; \
+ 		sh -c "$$pod2man \
+-			--section=$$sec --center=OpenSSL \
++			--section=$${sec}$(MANSECTION) --center=OpenSSL \
+ 			--release=$(VERSION) `basename $$i`") \
+ 			>  $(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX); \
+ 		$(PERL) util/extract-names.pl < $$i | \
+@@ -623,7 +627,7 @@ install_docs:
+ 		echo "installing man$$sec/$$fn.$${sec}$(MANSUFFIX)"; \
+ 		(cd `$(PERL) util/dirname.pl $$i`; \
+ 		sh -c "$$pod2man \
+-			--section=$$sec --center=OpenSSL \
++			--section=$${sec}$(MANSECTION) --center=OpenSSL \
+ 			--release=$(VERSION) `basename $$i`") \
+ 			>  $(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX); \
+ 		$(PERL) util/extract-names.pl < $$i | \
+Index: openssl-1.0.0/openssl.ld
+===================================================================
+--- /dev/null
++++ openssl-1.0.0/openssl.ld
+@@ -0,0 +1,5 @@
++OPENSSL_0.9.8 {
++	 global:
++		 *;
++};
++
+Index: openssl-1.0.0/engines/openssl.ld
+===================================================================
+--- /dev/null
++++ openssl-1.0.0/engines/openssl.ld
+@@ -0,0 +1,5 @@
++OPENSSL_0.9.8 {
++	 global:
++		 *;
++};
++
+Index: openssl-1.0.0/doc/Makefile
+===================================================================
+--- /dev/null
++++ openssl-1.0.0/doc/Makefile
+@@ -0,0 +1,40 @@
++VERSION =
++
++#PODS = $(wildcard *.pod)
++#MANS = $(addsuffix .man, $(basename $(PODS)))
++
++MANS = openssl.1 ssl.3 crypto.3
++
++P2M = pod2man --center='OpenSSL Documentation' --release="OpenSSL $(VERSION)"
++
++all: manpages
++
++.PHONY: manpages 
++
++manpages: openssl.1 crypto.3 ssl.3
++
++openssl.1:
++	$(P2M) --section=1 openssl.pod > openssl.1
++
++crypto.3:
++	$(P2M) --section=3 crypto.pod > crypto.3
++
++ssl.3:
++	$(P2M) --section=3 ssl.pod > ssl.3
++
++.PHONY: install
++install:
++	mkdir -p $(INSTALL_PREFIX)$(INSTALLTOP)/share/man/man1
++	mkdir -p $(INSTALL_PREFIX)$(INSTALLTOP)/share/man/man3
++	install -m 644 -p openssl.1 $(INSTALL_PREFIX)$(INSTALLTOP)/share/man/man1
++	install -m 644 -p crypto.3 $(INSTALL_PREFIX)$(INSTALLTOP)/share/man/man3
++	install -m 644 -p ssl.3 $(INSTALL_PREFIX)$(INSTALLTOP)/share/man/man3
++	rm -f $(MANS)
++
++.PHONY: clean
++clean:
++	rm -f $(MANS)
++
++.PHONY: realclean
++realclean:
++	-$(MAKE) clean
+Index: openssl-1.0.0/doc/apps/c_rehash.pod
+===================================================================
+--- /dev/null
++++ openssl-1.0.0/doc/apps/c_rehash.pod
+@@ -0,0 +1,55 @@
++
++=pod
++
++=head1 NAME
++
++c_rehash - Create symbolic links to files named by the hash values
++
++=head1 SYNOPSIS
++
++B<c_rehash>
++[directory] ...
++
++=head1 DESCRIPTION
++
++c_rehash scans directories and takes a hash value of each .pem and .crt file in the directory. It then creates symbolic links for each of the files named by the hash value. This is useful as many programs require directories to be set up like this in order to find the certificates they require. 
++
++If any directories are named on the command line then these directories are processed in turn. If not then and the environment variable SSL_CERT_DIR is defined then that is consulted. This variable should be a colon (:) separated list of directories, all of which will be processed. If neither of these conditions are true then /usr/lib/ssl/certs is processed. 
++
++For each directory that is to be processed he user must have write permissions on the directory, if they do not then nothing will be printed for that directory.
++
++Note that this program deletes all the symbolic links that look like ones that it creates before processing a directory. Beware that if you run the program on a directory that contains symbolic links for other purposes that are named in the same format as those created by this program they will be lost.
++
++The hashes for certificate files are of the form <hash>.<n> where n is an integer. If the hash value already exists then n will be incremented, unless the file is a duplicate. Duplicates are detected using the fingerprint of the certificate. A warning will be printed if a duplicate is detected. The hashes for CRL files are of the form <hash>.r<n> and have the same behavior.
++
++The program will also warn if there are files with extension .pem which are not certificate or CRL files.
++
++The program uses the openssl program to compute the hashes and fingerprints. It expects the executable to be named openssl and be on the PATH, or in the /usr/lib/ssl/bin directory. If the OPENSSL environment variable is defined then this is used instead as the executable that provides the hashes and fingerprints. When called as $OPENSSL x509 -hash -fingerprint -noout -in $file it must output the hash of $file on the first line followed by the fingerprint on the second line, optionally prefixed with some text and an equals sign (=). 
++
++=head1 OPTIONS
++
++None
++
++=head1 ENVIRONMENT
++
++=over 4
++
++=item B<OPENSSL>
++
++The name (and path) of an executable to use to generate hashes and fingerprints (see above).
++
++=item B<SSL_CERT_DIR>
++
++Colon separated list of directories to operate on. Ignored if directories are listed on the command line.
++
++=head1 SEE ALSO
++
++L<openssl(1)|openssl(1)>, L<x509(1)|x509(1)>
++
++=back
++
++=head1 BUGS
++
++No known bugs
++
++=cut
+Index: openssl-1.0.0/crypto/opensslconf.h
+===================================================================
+--- openssl-1.0.0.orig/crypto/opensslconf.h
++++ openssl-1.0.0/crypto/opensslconf.h
+@@ -11,6 +11,9 @@
+ #ifndef OPENSSL_NO_JPAKE
+ # define OPENSSL_NO_JPAKE
+ #endif
++#ifndef OPENSSL_NO_IDEA
++# define OPENSSL_NO_IDEA
++#endif
+ #ifndef OPENSSL_NO_KRB5
+ # define OPENSSL_NO_KRB5
+ #endif
+@@ -44,6 +47,9 @@
+ # if defined(OPENSSL_NO_JPAKE) && !defined(NO_JPAKE)
+ #  define NO_JPAKE
+ # endif
++# if defined(OPENSSL_NO_IDEA) && !defined(NO_IDEA)
++#  define NO_IDEA
++# endif
+ # if defined(OPENSSL_NO_KRB5) && !defined(NO_KRB5)
+ #  define NO_KRB5
+ # endif
+@@ -68,8 +74,8 @@
+ 
+ #if !(defined(VMS) || defined(__VMS)) /* VMS uses logical names instead */
+ #if defined(HEADER_CRYPTLIB_H) && !defined(OPENSSLDIR)
+-#define ENGINESDIR "/usr/local/ssl/lib/engines"
+-#define OPENSSLDIR "/usr/local/ssl"
++#define ENGINESDIR "/usr/lib/ssl/engines"
++#define OPENSSLDIR "/usr/lib/ssl"
+ #endif
+ #endif
+ 
+@@ -100,14 +106,14 @@
+  * - Intel P6 because partial register stalls are very expensive;
+  * - elder Alpha because it lacks byte load/store instructions;
+  */
+-#define RC4_INT unsigned int
++#define RC4_INT unsigned char
+ #endif
+ #if !defined(RC4_CHUNK)
+ /*
+  * This enables code handling data aligned at natural CPU word
+  * boundary. See crypto/rc4/rc4_enc.c for further details.
+  */
+-#undef RC4_CHUNK
++#define RC4_CHUNK unsigned long
+ #endif
+ #endif
+ 
+@@ -115,7 +121,7 @@
+ /* If this is set to 'unsigned int' on a DEC Alpha, this gives about a
+  * %20 speed up (longs are 8 bytes, int's are 4). */
+ #ifndef DES_LONG
+-#define DES_LONG unsigned long
++#define DES_LONG unsigned int
+ #endif
+ #endif
+ 
+@@ -126,9 +132,9 @@
+ /* Should we define BN_DIV2W here? */
+ 
+ /* Only one for the following should be defined */
+-#undef SIXTY_FOUR_BIT_LONG
++#define SIXTY_FOUR_BIT_LONG
+ #undef SIXTY_FOUR_BIT
+-#define THIRTY_TWO_BIT
++#undef THIRTY_TWO_BIT
+ #endif
+ 
+ #if defined(HEADER_RC4_LOCL_H) && !defined(CONFIG_HEADER_RC4_LOCL_H)
+@@ -140,7 +146,7 @@
+ 
+ #if defined(HEADER_BF_LOCL_H) && !defined(CONFIG_HEADER_BF_LOCL_H)
+ #define CONFIG_HEADER_BF_LOCL_H
+-#undef BF_PTR
++#define BF_PTR2
+ #endif /* HEADER_BF_LOCL_H */
+ 
+ #if defined(HEADER_DES_LOCL_H) && !defined(CONFIG_HEADER_DES_LOCL_H)
+@@ -170,7 +176,7 @@ YOU SHOULD NOT HAVE BOTH DES_RISC1 AND D
+ /* Unroll the inner loop, this sometimes helps, sometimes hinders.
+  * Very mucy CPU dependant */
+ #ifndef DES_UNROLL
+-#undef DES_UNROLL
++#define DES_UNROLL
+ #endif
+ 
+ /* These default values were supplied by
+Index: openssl-1.0.0/crypto/sha/sha.h
+===================================================================
+--- openssl-1.0.0.orig/crypto/sha/sha.h
++++ openssl-1.0.0/crypto/sha/sha.h
+@@ -59,6 +59,7 @@
+ #ifndef HEADER_SHA_H
+ #define HEADER_SHA_H
+ 
++#include <stddef.h>
+ #include <openssl/e_os2.h>
+ #include <stddef.h>
+ 
diff --git a/recipes/openssl/openssl-1.0.0b/engines-install-in-libdir-ssl.patch b/recipes/openssl/openssl-1.0.0b/engines-install-in-libdir-ssl.patch
new file mode 100644
index 0000000..949d6ad
--- /dev/null
+++ b/recipes/openssl/openssl-1.0.0b/engines-install-in-libdir-ssl.patch
@@ -0,0 +1,53 @@
+Index: openssl-1.0.0/engines/Makefile
+===================================================================
+--- openssl-1.0.0.orig/engines/Makefile
++++ openssl-1.0.0/engines/Makefile
+@@ -107,7 +107,7 @@
+ 	@[ -n "$(INSTALLTOP)" ] # should be set by top Makefile...
+ 	@if [ -n "$(SHARED_LIBS)" ]; then \
+ 		set -e; \
+-		$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines; \
++		$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines; \
+ 		for l in $(LIBNAMES); do \
+ 			( echo installing $$l; \
+ 			  pfx=lib; \
+@@ -119,13 +119,13 @@
+ 				*DSO_WIN32*)	sfx="eay32.dll"; pfx=;;	\
+ 				*)		sfx=".bad";;	\
+ 				esac; \
+-				cp $$pfx$$l$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new; \
++				cp $$pfx$$l$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx.new; \
+ 			  else \
+ 				sfx=".so"; \
+-				cp cyg$$l.dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new; \
++				cp cyg$$l.dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx.new; \
+ 			  fi; \
+-			  chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new; \
+-			  mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx ); \
++			  chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx.new; \
++			  mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx ); \
+ 		done; \
+ 	fi
+ 	@target=install; $(RECURSIVE_MAKE)
+Index: openssl-1.0.0/engines/ccgost/Makefile
+===================================================================
+--- openssl-1.0.0.orig/engines/ccgost/Makefile
++++ openssl-1.0.0/engines/ccgost/Makefile
+@@ -53,13 +53,13 @@
+ 			*DSO_WIN32*) sfx="eay32.dll"; pfx=;; \
+ 			*) sfx=".bad";; \
+ 			esac; \
+-			cp $${pfx}$(LIBNAME)$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx.new; \
++			cp $${pfx}$(LIBNAME)$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx.new; \
+ 		else \
+ 			sfx=".so"; \
+-			cp cyg$(LIBNAME).dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx.new; \
++			cp cyg$(LIBNAME).dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx.new; \
+ 		fi; \
+-		chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx.new; \
+-		mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LIBNAME)$$sfx; \
++		chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx.new; \
++		mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$${pfx}$(LIBNAME)$$sfx; \
+ 	fi
+ 
+ links:
diff --git a/recipes/openssl/openssl-1.0.0b/libdeps-first.patch b/recipes/openssl/openssl-1.0.0b/libdeps-first.patch
new file mode 100644
index 0000000..1fda69b
--- /dev/null
+++ b/recipes/openssl/openssl-1.0.0b/libdeps-first.patch
@@ -0,0 +1,27 @@
+Links to previously staged 0.9.8* easily otherwise
+
+Index: openssl-1.0.0/Makefile.shared
+===================================================================
+--- openssl-1.0.0.orig/Makefile.shared
++++ openssl-1.0.0/Makefile.shared
+@@ -96,7 +96,7 @@
+     LIBPATH=`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;t' -e d | uniq`; \
+     LIBPATH=`echo $$LIBPATH | sed -e 's/ /:/g'`; \
+     LD_LIBRARY_PATH=$$LIBPATH:$$LD_LIBRARY_PATH \
+-    $${LDCMD} $${LDFLAGS} -o $${APPNAME:=$(APPNAME)} $(OBJECTS) $${LIBDEPS} )
++    $${LDCMD} $${LIBDEPS} $${LDFLAGS} -o $${APPNAME:=$(APPNAME)} $(OBJECTS) )
+ 
+ LINK_SO=	\
+   ( $(SET_X);   \
+@@ -106,9 +106,9 @@
+     LIBPATH=`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;t' -e d | uniq`; \
+     LIBPATH=`echo $$LIBPATH | sed -e 's/ /:/g'`; \
+     LD_LIBRARY_PATH=$$LIBPATH:$$LD_LIBRARY_PATH \
+-    $${SHAREDCMD} $${SHAREDFLAGS} \
++    $${SHAREDCMD} $$LIBDEPS $${SHAREDFLAGS} \
+ 	-o $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX \
+-	$$ALLSYMSFLAGS $$SHOBJECTS $$NOALLSYMSFLAGS $$LIBDEPS \
++	$$ALLSYMSFLAGS $$SHOBJECTS $$NOALLSYMSFLAGS \
+   ) && $(SYMLINK_SO)
+ 
+ SYMLINK_SO=	\
diff --git a/recipes/openssl/openssl-1.0.0b/oe-ldflags.patch b/recipes/openssl/openssl-1.0.0b/oe-ldflags.patch
new file mode 100644
index 0000000..3dd3bed
--- /dev/null
+++ b/recipes/openssl/openssl-1.0.0b/oe-ldflags.patch
@@ -0,0 +1,22 @@
+Index: openssl-1.0.0/Makefile.shared
+===================================================================
+--- openssl-1.0.0.orig/Makefile.shared
++++ openssl-1.0.0/Makefile.shared
+@@ -92,7 +92,7 @@
+ LINK_APP=	\
+   ( $(SET_X);   \
+     LIBDEPS="$${LIBDEPS:-$(LIBDEPS)}"; \
+-    LDCMD="$${LDCMD:-$(CC)}"; LDFLAGS="$${LDFLAGS:-$(CFLAGS)}"; \
++    LDCMD="$${LDCMD:-$(CC)}"; LDFLAGS="$(OE_LDFLAGS) $${LDFLAGS:-$(CFLAGS)}"; \
+     LIBPATH=`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;t' -e d | uniq`; \
+     LIBPATH=`echo $$LIBPATH | sed -e 's/ /:/g'`; \
+     LD_LIBRARY_PATH=$$LIBPATH:$$LD_LIBRARY_PATH \
+@@ -102,7 +102,7 @@
+   ( $(SET_X);   \
+     LIBDEPS="$${LIBDEPS:-$(LIBDEPS)}"; \
+     SHAREDCMD="$${SHAREDCMD:-$(CC)}"; \
+-    SHAREDFLAGS="$${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDFLAGS)}"; \
++    SHAREDFLAGS="$(OE_LDFLAGS) $${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDFLAGS)}"; \
+     LIBPATH=`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;t' -e d | uniq`; \
+     LIBPATH=`echo $$LIBPATH | sed -e 's/ /:/g'`; \
+     LD_LIBRARY_PATH=$$LIBPATH:$$LD_LIBRARY_PATH \
diff --git a/recipes/openssl/openssl-1.0.0b/shared-libs.patch b/recipes/openssl/openssl-1.0.0b/shared-libs.patch
new file mode 100644
index 0000000..7cd70d8
--- /dev/null
+++ b/recipes/openssl/openssl-1.0.0b/shared-libs.patch
@@ -0,0 +1,48 @@
+Index: openssl-1.0.0/crypto/Makefile
+===================================================================
+--- openssl-1.0.0.orig/crypto/Makefile
++++ openssl-1.0.0/crypto/Makefile
+@@ -104,7 +104,7 @@
+ 
+ shared: buildinf.h lib subdirs
+ 	if [ -n "$(SHARED_LIBS)" ]; then \
+-		(cd ..; $(MAKE) $(SHARED_LIB)); \
++		(cd ..; $(MAKE) -e $(SHARED_LIB)); \
+ 	fi
+ 
+ libs:
+Index: openssl-1.0.0/Makefile.org
+===================================================================
+--- openssl-1.0.0.orig/Makefile.org
++++ openssl-1.0.0/Makefile.org
+@@ -260,7 +260,7 @@
+ 
+ libcrypto$(SHLIB_EXT): libcrypto.a
+ 	@if [ "$(SHLIB_TARGET)" != "" ]; then \
+-		$(MAKE) SHLIBDIRS=crypto build-shared; \
++		$(MAKE) -e SHLIBDIRS=crypto build-shared; \
+ 	else \
+ 		echo "There's no support for shared libraries on this platform" >&2; \
+ 		exit 1; \
+@@ -268,7 +268,7 @@
+ 
+ libssl$(SHLIB_EXT): libcrypto$(SHLIB_EXT) libssl.a
+ 	@if [ "$(SHLIB_TARGET)" != "" ]; then \
+-		$(MAKE) SHLIBDIRS=ssl SHLIBDEPS='-lcrypto' build-shared; \
++		$(MAKE) -e SHLIBDIRS=ssl SHLIBDEPS='-lcrypto' build-shared; \
+ 	else \
+ 		echo "There's no support for shared libraries on this platform" >&2; \
+ 		exit 1; \
+Index: openssl-1.0.0/ssl/Makefile
+===================================================================
+--- openssl-1.0.0.orig/ssl/Makefile
++++ openssl-1.0.0/ssl/Makefile
+@@ -62,7 +62,7 @@
+ 
+ shared: lib
+ 	if [ -n "$(SHARED_LIBS)" ]; then \
+-		(cd ..; $(MAKE) $(SHARED_LIB)); \
++		(cd ..; $(MAKE) -e $(SHARED_LIB)); \
+ 	fi
+ 
+ files:
diff --git a/recipes/openssl/openssl-native_1.0.0a.bb b/recipes/openssl/openssl-native_1.0.0a.bb
deleted file mode 100644
index bb471b0..0000000
--- a/recipes/openssl/openssl-native_1.0.0a.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-require openssl.inc
-
-inherit pkgconfig native
-
-SRC_URI[src.md5sum] = "e3873edfffc783624cfbdb65e2249cbd"
-SRC_URI[src.sha256sum] = "18a9bd1fc02b8ef90dded34fafaa9089baaafef278a19fc4e89c2ab0dcf70f63"
-PR = "${INC_PR}.0"
-
-DEFAULT_PREFERENCE = "-1"
-
-export DIRS = "crypto ssl apps engines"
-
-# This flag can contain target options (e.g -mfpu=neon for armv7-a systems)
-export FULL_OPTIMIZATION = " "
-export BUILD_OPTIMIZATION = " "
-
-SRC_URI += "file://configure-targets.patch \
-            file://shared-libs.patch \
-            file://debian.patch \
-	    file://libdeps-first.patch \
-	   "
-
-PARALLEL_MAKE = ""
-
-CFLAG += " -Wa,--noexecstack "
-
-NATIVE_INSTALL_WORKS = "1"
diff --git a/recipes/openssl/openssl-native_1.0.0b.bb b/recipes/openssl/openssl-native_1.0.0b.bb
new file mode 100644
index 0000000..4ad4936
--- /dev/null
+++ b/recipes/openssl/openssl-native_1.0.0b.bb
@@ -0,0 +1,27 @@
+require openssl.inc
+
+inherit pkgconfig native
+
+SRC_URI[src.md5sum] = "104deb3b7e6820cae6de3f49ba0ff2b0"
+SRC_URI[src.sha256sum] = "4e7b4e2fb33ee2d97c5e143561ab495dbbfc08f0a863e617a0c7adca19017331"
+PR = "${INC_PR}.0"
+
+DEFAULT_PREFERENCE = "-1"
+
+export DIRS = "crypto ssl apps engines"
+
+# This flag can contain target options (e.g -mfpu=neon for armv7-a systems)
+export FULL_OPTIMIZATION = " "
+export BUILD_OPTIMIZATION = " "
+
+SRC_URI += "file://configure-targets.patch \
+            file://shared-libs.patch \
+            file://debian.patch \
+	    file://libdeps-first.patch \
+	   "
+
+PARALLEL_MAKE = ""
+
+CFLAG += " -Wa,--noexecstack "
+
+NATIVE_INSTALL_WORKS = "1"
diff --git a/recipes/openssl/openssl_1.0.0a.bb b/recipes/openssl/openssl_1.0.0a.bb
deleted file mode 100644
index cc3a8ab..0000000
--- a/recipes/openssl/openssl_1.0.0a.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-inherit pkgconfig
-
-require openssl.inc
-SRC_URI[src.md5sum] = "e3873edfffc783624cfbdb65e2249cbd"
-SRC_URI[src.sha256sum] = "18a9bd1fc02b8ef90dded34fafaa9089baaafef278a19fc4e89c2ab0dcf70f63"
-
-PR = "${INC_PR}.1"
-
-DEFAULT_PREFERENCE = "-1"
-
-export DIRS = "crypto ssl apps engines"
-export OE_LDFLAGS="${LDFLAGS}"
-
-SRC_URI += "file://configure-targets.patch \
-            file://shared-libs.patch \
-            file://debian.patch \
-            file://oe-ldflags.patch \
-	    file://libdeps-first.patch \
-	    file://engines-install-in-libdir-ssl.patch \
-	    file://openssl-fix-ssl3_get_key_exchange-double-free.patch \
-	   "
-
-PARALLEL_MAKE = ""
-
-PACKAGES += " \
-	${PN}-engines \
-	${PN}-engines-dbg \
-	"
-
-FILES_${PN}-engines = "${libdir}/ssl/engines/*.so"
-FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
diff --git a/recipes/openssl/openssl_1.0.0b.bb b/recipes/openssl/openssl_1.0.0b.bb
new file mode 100644
index 0000000..13236a4
--- /dev/null
+++ b/recipes/openssl/openssl_1.0.0b.bb
@@ -0,0 +1,30 @@
+inherit pkgconfig
+
+require openssl.inc
+SRC_URI[src.md5sum] = "104deb3b7e6820cae6de3f49ba0ff2b0"
+SRC_URI[src.sha256sum] = "4e7b4e2fb33ee2d97c5e143561ab495dbbfc08f0a863e617a0c7adca19017331"
+
+PR = "${INC_PR}.0"
+
+DEFAULT_PREFERENCE = "-1"
+
+export DIRS = "crypto ssl apps engines"
+export OE_LDFLAGS="${LDFLAGS}"
+
+SRC_URI += "file://configure-targets.patch \
+            file://shared-libs.patch \
+            file://debian.patch \
+            file://oe-ldflags.patch \
+	    file://libdeps-first.patch \
+	    file://engines-install-in-libdir-ssl.patch \
+	   "
+
+PARALLEL_MAKE = ""
+
+PACKAGES += " \
+	${PN}-engines \
+	${PN}-engines-dbg \
+	"
+
+FILES_${PN}-engines = "${libdir}/ssl/engines/*.so"
+FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
-- 
1.6.4.2



