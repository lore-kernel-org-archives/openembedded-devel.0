Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 459D775126
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 23:44:54 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id n10-v6so16157406plp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2018 16:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=s9bkCGQyX5xVtTvIg2LH0hfFSImfjLd7xNtRGk2TNZs=;
	b=uDj4lY8fdpX8hl8JyKRdv7pg8jhbtFlRTjwjsNdMdz1MdOFIZvzlwU7GE9g0f8eeRE
	5w6mmSnCNT08ww4EvG0OyRIp2MdI0Lr5JB/MciHAcVh2EdiItgyj4hM0jLKptv3JsVk6
	lgABNFcmtEaQUK8+tws6han7QytpwmZld6U2l2CvzwzfE+lDiUuHb4+DxA4m2SSKpd+/
	dasvBvOuJH1qO43jaZ7SCenLXqziu5fFSi6rPapmSf/kAb7dX4sefQhQDMJBvhtKWjOK
	SrMnwJrEPS3SWaM5F5JpZydnKJxeOll7215OzSN/gfXK99yWseYQQTlPn6BFYzvXBlln
	RtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=s9bkCGQyX5xVtTvIg2LH0hfFSImfjLd7xNtRGk2TNZs=;
	b=aBPeSwI0mYiGvTJCyLu+2yTMplu5w3AyoGuFWADz0Fc25/oKIAwcQA9Bxu4umhJr8K
	j1g2MZQaGgmLatgNW6hXvGzNP9Ctr8dOtIoMWhgKXboizn44qJIDhfgcMxr1+wu5STUj
	/f8nH9EHi/RPJaE4hAfYS/XZW5yl0D+6OgXHe0m3t+tbqsU9R0eWZDxG74XVnujRXJ+P
	FXXkLIwnDlFhTglsTlVhE4cWWivH9Ayn7yOoL2/cpSUP1f6fT/RC13mTY6Bb29QWLknE
	yplkL85/vyPukPFob3eRwj3vtD4UdEstWAvO6l1mB4Gt5uRksqQUjr387hI7YyICo5ht
	DYrQ==
X-Gm-Message-State: ALKqPwcFqZhGCeR5Wume6k+mhoJJu2JQUVJIEPQ5kucsqnnoBB4IbZ7A
	7YEDP/QWXNhh3KQn5w+rjwA=
X-Google-Smtp-Source: ADUXVKKd0z6JRrv0CJIwWeN1MMJmHgUBNbKqfqmY05EexfVku4nFWWIB6TWEF9vflKkrUy59wBWPLQ==
X-Received: by 2002:a17:902:b417:: with SMTP id
	x23-v6mr13185499plr.388.1527896696239; 
	Fri, 01 Jun 2018 16:44:56 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:cd69:7d4:a4bc:31b4])
	by smtp.gmail.com with ESMTPSA id
	a4-v6sm92301797pfj.19.2018.06.01.16.44.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jun 2018 16:44:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jun 2018 16:44:54 -0700
Message-Id: <1527896694-9778-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [V2][meta-oe][PATCH] nmap: move recipe from meta-security to meta-oe
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
X-List-Received-Date: Fri, 01 Jun 2018 23:44:55 -0000

[V2]
Remove obsolete sed operations
Remove zenmap as python-pygtk was obsoleted in core

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nmap-redefine-the-python-library-dir.patch     | 37 +++++++++++++++++
 ...shtool-mkdir-with-coreutils-mkdir-command.patch | 48 ++++++++++++++++++++++
 meta-oe/recipes-security/nmap/nmap_7.60.bb         | 46 +++++++++++++++++++++
 3 files changed, 131 insertions(+)
 create mode 100644 meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch
 create mode 100644 meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
 create mode 100644 meta-oe/recipes-security/nmap/nmap_7.60.bb

diff --git a/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch b/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch
new file mode 100644
index 0000000..356b507
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/nmap-redefine-the-python-library-dir.patch
@@ -0,0 +1,37 @@
+[PATCH] redefine the python library install dir
+
+Upstream-Status: Pending
+
+If install-lib is not defined, it is always /usr/lib/, but it
+maybe /usr/lib64 for multilib
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 1bb062c..cced2fb 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -311,7 +311,7 @@ build-zenmap: $(ZENMAPDIR)/setup.py $(ZENMAPDIR)/zenmapCore/Version.py
+ 
+ install-zenmap: $(ZENMAPDIR)/setup.py
+ 	$(INSTALL) -d $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
+-	cd $(ZENMAPDIR) && $(PYTHON) setup.py --quiet install --prefix "$(prefix)" --force $(if $(DESTDIR),--root "$(DESTDIR)")
++	cd $(ZENMAPDIR) && $(PYTHON) setup.py --quiet install --prefix "$(prefix)" --install-lib="${PYTHON_SITEPACKAGES_DIR}" --force $(if $(DESTDIR),--root "$(DESTDIR)")
+ 	$(INSTALL) -c -m 644 docs/zenmap.1 $(DESTDIR)$(mandir)/man1/
+ # Create a symlink from nmapfe to zenmap if nmapfe doesn't exist or is
+ # already a link.
+@@ -328,7 +328,7 @@ build-nping: $(NPINGDIR)/Makefile nbase_build nsock_build netutil_build $(NPINGD
+ 	@cd $(NPINGDIR) && $(MAKE)
+ 
+ install-ndiff:
+-	cd $(NDIFFDIR) && $(PYTHON) setup.py install --prefix "$(prefix)" $(if $(DESTDIR),--root "$(DESTDIR)")
++	cd $(NDIFFDIR) && $(PYTHON) setup.py install --prefix "$(prefix)" --install-lib="${PYTHON_SITEPACKAGES_DIR}" $(if $(DESTDIR),--root "$(DESTDIR)")
+ 
+ NSE_FILES = scripts/script.db scripts/*.nse
+ NSE_LIB_LUA_FILES = nselib/*.lua nselib/*.luadoc
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch b/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
new file mode 100644
index 0000000..cfe043a
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch
@@ -0,0 +1,48 @@
+[PATCH] replace "./shtool mkdir" with coreutils mkdir command
+
+Upstream-Status: Pending
+
+"./shtool mkdir" is used when mkdir has not -p parameter, but mkdir in today
+most release has supportted the -p parameter, not need to use shtool, and it
+can not fix the race if two process are running mkdir to create same dir
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ ncat/Makefile.in        | 4 ++--
+ nmap-update/Makefile.in | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ncat/Makefile.in b/ncat/Makefile.in
+index cfd306d..2166e08 100644
+--- a/ncat/Makefile.in
++++ b/ncat/Makefile.in
+@@ -163,11 +163,11 @@ $(NSOCKDIR)/libnsock.a: $(NSOCKDIR)/Makefile
+ 
+ install: $(TARGET)
+ 	@echo Installing Ncat;
+-	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
++	mkdir -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
+ 	$(INSTALL) -c -m 755 ncat $(DESTDIR)$(bindir)/ncat
+ 	$(STRIP) -x $(DESTDIR)$(bindir)/ncat
+ 	if [ -n "$(DATAFILES)" ]; then \
+-		$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(pkgdatadir); \
++		mkdir -p -m 755 $(DESTDIR)$(pkgdatadir); \
+ 		$(INSTALL) -c -m 644 $(DATAFILES) $(DESTDIR)$(pkgdatadir)/; \
+ 	fi
+ 	$(INSTALL) -c -m 644 docs/$(TARGET).1 $(DESTDIR)$(mandir)/man1/$(TARGET).1
+diff --git a/nmap-update/Makefile.in b/nmap-update/Makefile.in
+index 89ff928..93f48d8 100644
+--- a/nmap-update/Makefile.in
++++ b/nmap-update/Makefile.in
+@@ -37,7 +37,7 @@ $(NBASELIB):
+ 	cd $(NBASEDIR) && $(MAKE)
+ 
+ install: nmap-update
+-	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
++	mkdir -p -m 755 $(DESTDIR)$(bindir) $(DESTDIR)$(mandir)/man1
+ 	$(INSTALL) -c -m 755 nmap-update $(DESTDIR)$(bindir)
+ 	$(STRIP) -x $(DESTDIR)$(bindir)/nmap-update
+ 	$(INSTALL) -c -m 644 ../docs/nmap-update.1 $(DESTDIR)$(mandir)/man1/
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-security/nmap/nmap_7.60.bb b/meta-oe/recipes-security/nmap/nmap_7.60.bb
new file mode 100644
index 0000000..74b4388
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap_7.60.bb
@@ -0,0 +1,46 @@
+SUMMARY = "network auditing tool"
+DESCRIPTION = "Nmap ("Network Mapper") is a free and open source (license) utility for network discovery and security auditing.\nGui support via appending to IMAGE_FEATURES x11-base in local.conf"
+SECTION = "security"
+LICENSE = "GPL-2.0"
+
+LIC_FILES_CHKSUM = "file://COPYING;beginline=7;endline=12;md5=700c690f4ca6b1754f3f1db8645e42d9"
+
+SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
+           file://nmap-redefine-the-python-library-dir.patch \
+           file://nmap-replace-shtool-mkdir-with-coreutils-mkdir-command.patch \
+"
+
+SRC_URI[md5sum] = "4e454266559ddf2c4e2109866c62560c"
+SRC_URI[sha256sum] = "a8796ecc4fa6c38aad6139d9515dc8113023a82e9d787e5a5fb5fa1b05516f21"
+
+inherit autotools-brokensep pkgconfig python3native
+
+PACKAGECONFIG ?= "ncat nping ndiff pcap"
+
+PACKAGECONFIG[pcap] = "--with-pcap=linux, --without-pcap, libpcap, libpcap"
+PACKAGECONFIG[pcre] = "--with-libpcre=${STAGING_LIBDIR}/.., --with-libpcre=included, libpre"
+PACKAGECONFIG[ssl] = "--with-openssl=${STAGING_LIBDIR}/.., --without-openssl, openssl, openssl"
+PACKAGECONFIG[ssh2] = "--with-openssh2=${STAGING_LIBDIR}/.., --without-openssh2, libssh2, libssh2"
+PACKAGECONFIG[libz] = "--with-libz=${STAGING_LIBDIR}/.., --without-libz, zlib, zlib"
+
+#disable/enable packages
+PACKAGECONFIG[nping] = ",--without-nping,"
+PACKAGECONFIG[ncat] = ",--without-ncat,"
+PACKAGECONFIG[ndiff] = ",--without-ndiff,python"
+PACKAGECONFIG[update] = ",--without-nmap-update,"
+
+EXTRA_OECONF = "--with-libdnet=included --with-liblinear=included --without-subversion --with-liblua=included"
+
+# zenmap needs python-pygtk which has been removed
+# it also only works with python2
+# disable for now until py3 is supported
+EXTRA_OECONF += "--without-zenmap"
+
+do_configure() {
+    autoconf
+    oe_runconf
+}
+
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
+
+RDEPENDS_${PN} = "python"
-- 
2.7.4


