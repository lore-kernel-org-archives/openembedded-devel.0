Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Ow69S-0005po-PK
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 06:33:01 +0200
Received: by pvg6 with SMTP id 6so261790pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 21:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=jz4xkBYMv9LtErraYelQJXpkwTfVrGhXFvn8aSwgzt4=;
	b=hrEwPGKlGfdaJBEIzAlnqKeP9eS54r7S6wbxYTJA4NVePHZ9lLW2NnXY62QShcbCIC
	9QMRp6l8FMy3REngyVP36PKJUMirkqUBaj8d/rluElxidzrMw1CxuFflctlNUfxZ3D7G
	sxzsMw9wkzPL3enHIxhqnTeeWCgP/+Kz2Rzyk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=mqR9oKPkBPRuHXa4KN1IohRK6rycstyUEhn1eFKMbZgbiQMm3OrjMN+4sM2FGRHpQW
	H6Kf9t9gnDdIUcp+wp2k9Ka6RbVxJzoAxojigQPlA40nYLspnKU645ILktByw91kvxYs
	CWWS4JstZYQCAqeFofOaeU5O9JnITnV6MUXXU=
Received: by 10.142.254.21 with SMTP id b21mr2287050wfi.139.1284611515277;
	Wed, 15 Sep 2010 21:31:55 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id n35sm2537834wfa.3.2010.09.15.21.31.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Sep 2010 21:31:54 -0700 (PDT)
Message-ID: <4C919DB6.4010603@gmail.com>
Date: Thu, 16 Sep 2010 14:01:50 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] zziplib_0.13.59.bb: add new recipe.
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
X-List-Received-Date: Thu, 16 Sep 2010 04:33:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/zziplib/zziplib-0.13.59/makefile.am.patch |  140 +++++++++++++++++++++
 recipes/zziplib/zziplib_0.13.59.bb                |   29 +++++
 2 files changed, 169 insertions(+), 0 deletions(-)
 create mode 100644 recipes/zziplib/zziplib-0.13.59/makefile.am.patch
 create mode 100644 recipes/zziplib/zziplib_0.13.59.bb

diff --git a/recipes/zziplib/zziplib-0.13.59/makefile.am.patch b/recipes/zziplib/zziplib-0.13.59/makefile.am.patch
new file mode 100644
index 0000000..45fd04b
--- /dev/null
+++ b/recipes/zziplib/zziplib-0.13.59/makefile.am.patch
@@ -0,0 +1,140 @@
+--- zziplib-0.13.59/Makefile.am-orig	2010-09-16 13:29:36.000000000 +0930
++++ zziplib-0.13.59/Makefile.am	2010-09-16 13:31:56.000000000 +0930
+@@ -1,15 +1,10 @@
+-AUTOMAKE_OPTIONS = 1.4 foreign dist-bzip2
+ ACLOCAL_AMFLAGS = -I m4
+-WANT_AUTOMAKE = 1.7
+-WANT_AUTOCONF = 2.57
++WANT_AUTOMAKE = 1.96
++WANT_AUTOCONF = 2.61
+ 
+ DIST_SUBDIRS = zzip zzipwrap bins test docs  SDL
+ SUBDIRS =      zzip zzipwrap bins test docs @SDL@
+ 
+-rpm: dist-bzip2 $(PACKAGE).spec
+-	rpmbuild -ta $(PACKAGE)-$(VERSION).tar.bz2
+-	test -d ../pub && cp $(PACKAGE)-$(VERSION).tar.bz2 ../pub/
+-
+ OSC_ROOT = /my/own/osc
+ OSC_SRCDIR = $(OSC_ROOT)
+ OSC_PROJECT = home:guidod:zziplib-13
+@@ -59,118 +54,5 @@
+ 	&& rm -rf $(OSC_SRCDIR)/*
+ 		
+ 
+-indent-check:
+-	(cd zzip && $(MAKE) `basename $@`)
+-
+-doc docs docu clean-doc clean-docs clean-docu   zzip.html zzip.xml zzip.pdf \
+-man mans manpages htmpages unpack clean-unpack  changes.htm pdfs \
+-omf install-omf install-doc install-docs install-man3 install-mans \
+-upload-sourceforge www:
+-	(cd docs && $(MAKE) `basename $@`)
+-
+-sdl testsdl test-sdl install-sdl :
+-	(cd SDL && $(MAKE) `basename $@`)
+-
+-check-test0 check-test1 check-zzdir check-zzcat \
+-check-zzxor check-zzxordir check-zzxorcat \
+-check-sfx     check-readme : \
+-	(cd test && $(MAKE) `basename $@`)
+-
+-MSVC8 =   msvc8/README.TXT msvc8/zip.exe msvc8/test1.zip msvc8/test.zip \
+-msvc8/zzdir.vcproj    msvc8/zzipself.vcproj     msvc8/zzip.vcproj \
+-msvc8/zziplib.sln     msvc8/zzipsetstub.sln     msvc8/zzobfuscated.sln \
+-msvc8/zziplib.vcproj  msvc8/zzipsetstub.vcproj  msvc8/zzobfuscated.vcproj \
+-msvc8/zzcat.sln       msvc8/zzipself.bat        msvc8/zzip.sln \
+-msvc8/zzcat.vcproj    msvc8/zzipself.sln        msvc8/zziptest.sln \
+-msvc8/zzdir.sln       msvc8/zzipself.txt        msvc8/zziptest.vcproj \
+-                      msvc8/zzipfseeko.vcproj   msvc8/zzipmmapped.vcproj 
+-
+-MSVC7 =   msvc7/pkzip.exe msvc7/test1.zip msvc7/test.zip \
+-msvc7/zzdir.vcproj    msvc7/zzipself.vcproj     msvc7/zzip.vcproj \
+-msvc7/zziplib.sln     msvc7/zzipsetstub.sln     msvc7/zzobfuscated.sln \
+-msvc7/zziplib.vcproj  msvc7/zzipsetstub.vcproj  msvc7/zzobfuscated.vcproj \
+-msvc7/zzcat.sln       msvc7/zzipself.bat        msvc7/zzip.sln \
+-msvc7/zzcat.vcproj    msvc7/zzipself.sln        msvc7/zziptest.sln \
+-msvc7/zzdir.sln       msvc7/zzipself.txt        msvc7/zziptest.vcproj
+-
+-MSVC6 = \
+-msvc6/zzcat.dsp        msvc6/zziplib.dsp      msvc6/zzipwrap.dsp \
+-msvc6/zzdir.dsp        msvc6/zziplib.dsw      msvc6/zzobfuscated.dsp \
+-msvc6/zziptest.dsp     msvc6/zzip.dsp  
+-
+ EXTRA_DIST =   zziplib.spec zzipback.sed Makefile.mk \
+-               $(MSVC8) $(MSVC7) $(MSVC6) $(am__aclocal_m4_deps)
+-
+-PHONY = auto boottrap rpm doc docs man manpages htmpages sdl testsdl \
+-	comp compats msvc6 msvc7
+-# ------------------------------------------------------------------------
+-
+-test-comp:
+-	test ! -d testing || rm -r testing
+-	mkdir testing
+-	(cd testing && tar xzvf ../$(PACKAGE)-$(VERSION).tar.gz)
+-	(cd "testing/$(PACKAGE)-$(VERSION)/zziplib" && sh configure)
+-	$(MAKE) -C  "testing/$(PACKAGE)-$(VERSION)/zziplib"
+-	$(MAKE) -C  "testing/$(PACKAGE)-$(VERSION)/zziplib"  check
+-
+-clean-comp:
+-	test ! -d testing || rm -r testing
+-
+-msvc :
+-	mkdir bin
+-	mkdir lib
+-	mkdir include
+-	mkdir include/zzip
+-	cp $(srcdir)/msvc6/Release/*.exe bin/
+-	cp $(srcdir)/msvc6/Release/*.dll bin/
+-	cp $(srcdir)/msvc6/Release/*.lib lib/
+-	cp $(srcdir)/zzip/*.h include/zzip/
+-	zip -9r $(srcdir)/$(PACKAGE)-$(VERSION)-msvc6-bin.zip bin/
+-	zip -9r $(srcdir)/$(PACKAGE)-$(VERSION)-msvc6-lib.zip lib/ include/
+-	rm -r bin lib include
+-
+-# ------------------------------------------------------------------ zzip64
+-_FILE_OFFSET64 = -D_ZZIP_LARGEFILE -D_FILE_OFFSET_BITS=64
+-_RELEASEINFO64 = "RELEASE_INFO=-release 0-64"
+-
+-zzip64-setup: zzip64-setup.tmp
+-zzip64-setup.tmp : zzip/Makefile zzip/_config.h zzip/.deps/* zzip/zziplib.pc
+-	- mkdir zzip64
+-	cp -a zzip/Makefile zzip/_config.h zzip/.deps/ zzip/zziplib.pc zzip64/
+-	date > zzip64.dir
+-zzip64-build: zzip64-build.tmp
+-zzip64-build.tmp : zzip64-setup.tmp $(top_srcdir)/zzip/*
+-	cd zzip64 && $(MAKE) "AM_CFLAGS=$(_FILE_OFFSET64)" $(_RELEASEINFO64)
+-zzip64-install: zzip64-install.tmp
+-zzip64-install.tmp : zzip64-build.tmp
+-	cd zzip64 && $(MAKE) install $(_RELEASEINFO64)
+-	cd $(DESTDIR)$(libdir) && mv    libzzip.so   libzzip64.so
+-	cd $(DESTDIR)$(libdir) && mv    libzzip.a    libzzip64.a
+-	cd $(DESTDIR)$(libdir) && \
+-        sed -e 's/zzip.so/zzip64.so/' \
+-            -e 's/zzip.a/zzip64.a/'     libzzip.la > libzzip64.la
+-	cd $(DESTDIR)$(libdir)/pkgconfig && \
+-	sed -e 's/largefile=/largefile= %_FILE_OFFSET64/' \
+-	    -e 's/-lzzip/-lzzip64/' \
+-	    -e 's/zziplib/zziplib64/'   zziplib.pc > zziplib64.pc
+-zzip32-postinstall:
+-	cd $(DESTDIR)$(libdir) && mv    libzzip.so   libzzip32.so
+-	cd $(DESTDIR)$(libdir) && mv    libzzip.a    libzzip32.a
+-	cd $(DESTDIR)$(libdir) && ln -s libzzip32.so libzzip.so
+-	cd $(DESTDIR)$(libdir) && ln -s libzzip32.a  libzzip.a
+-	cd $(DESTDIR)$(libdir) && \
+-	sed -e 's/zzip.so/zzip32.so/' \
+-	    -e 's/zzip.a/zzip32.a/'     libzzip.la > libzzip32.la
+-	cd $(DESTDIR)$(libdir)/pkgconfig && \
+-	sed -e 's/-lzzip/-lzzip32/' \
+-	     -e 's/zziplib/zziplib32/'  zziplib.pc > zziplib32.pc
+-zzip-postinstall:
+-	: "the 12.8x and 11.8x and 10.8x packages are all the same actually"
+-	cd $(DESTDIR)$(libdir) || exit 1 \
+-	; for i in libzzip*.so.1? ; do : \
+-	; v10=`echo $$i | sed -e "s/.so.../.so.10/"` \
+-	; v11=`echo $$i | sed -e "s/.so.../.so.11/"` \
+-	; v12=`echo $$i | sed -e "s/.so.../.so.12/"` \
+-	; test ! -e "$$v10" && test -e "$$v12" && test "$$v10" != "$$v12" && ln -s "$$v12" "$$v10" \
+-	; test ! -e "$$v12" && test -e "$$v10" && test "$$v12" != "$$v10" && ln -s "$$v10" "$$v12" \
+-	; test "$$v10" != "$$v11" && ln -s "$$v10" "$$v11" || true; done
++               $(am__aclocal_m4_deps)
diff --git a/recipes/zziplib/zziplib_0.13.59.bb b/recipes/zziplib/zziplib_0.13.59.bb
new file mode 100644
index 0000000..310bed0
--- /dev/null
+++ b/recipes/zziplib/zziplib_0.13.59.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Support library for dealing with zip files"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPL MPL"
+DEPENDS = "zlib python-native"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/zziplib/zziplib-${PV}.tar.bz2 \
+		file://configure.ac.patch \
+"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--srcdir=${S}"
+
+BBCLASSEXTEND = "native"
+
+PR = "r0"
+
+SRC_URI[md5sum] = "14b5a6fc229afe9916d48358479568d3"
+SRC_URI[sha256sum] = "cbc90cef60ee498319258e464895f990bb2e6e08f245264d77e44b309c8c218f"
+
+do_compile_append() {
+	# Fix QA Issue with staging.
+	for i in ${S}/*/*.pc ; do
+		if [ ! -z "${STAGING_DIR_TARGET}" ]; then
+			sed -i -e s:${STAGING_DIR_TARGET}::g $i
+		fi
+	done
+}
-- 
1.7.1



