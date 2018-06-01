Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9F71E6025E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 15:10:16 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id v63-v6so12651015pfk.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2018 08:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nLWMtNMuL62kybLrKdHDMdUKgZoVwXZG5hbllxWfttg=;
	b=afOfbfYgpI1UO9W9rzhAIdYzuMdOEyY7AolyVDD3df1bh2QogSYQ+AYoOSzwgxR3In
	L98MffCLjLQqmakhk2DUIxAzgx3TFaNwGEQSursTsZYULiohzhGiudZD0asQNax7RvdM
	uuh4NB8stCy9xpAc+zPwK6AnhsGy2SbFDz2ACCKHWXZQY5IIi6lRBIeigK9dIZjM1K2p
	VQnylILiApSwTtJ1DzQI7CFy0vm6OdezesrnKH5BI40cs+eNZ17LPWQbcabJ2W9UJZjs
	AAJNkd67/rI/8mXK/w83yHFTTIOPZk7PLokq0EBeQTNNx91lRlpJwpiv/TU59Tu5Mewg
	4rNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nLWMtNMuL62kybLrKdHDMdUKgZoVwXZG5hbllxWfttg=;
	b=K8TysT33D2JOGMWG+ba9+R4Tr3N14+eswuJPnd9vgUNcVjRz5Otcx+JQY48o7iuOGV
	b6PncJas9ucl6YupNN7nzAHcQi8XakvKH9TILxwv3naUQjD588co9lKGX6qT3xeIUitR
	jTrQcQHsKh9EjCtpKFZy29zQND1ZJT9uWsf4zQmOAszTie2xaPtscqewcwsuaPMY4SYz
	Vlyko1I6WKTbRGjUGlDPwlabIg13Y9eaSKdZQmjrb/sVGT6be1+mpK4I6dgdo9JVN7xJ
	D5TYRz+4ri9d20yWR3OoEovgwla5SKz/SXWAIIzpOANKQdwna+95hHUKYZsz4FbGqZ63
	pr5A==
X-Gm-Message-State: ALKqPwdmy3Jd5jAIGJLuu8PkJlPnNkD8JpEIRKm1DOqWv5vOYWCKEtSp
	O87G/zug4R3IWaENTeQ+/vE=
X-Google-Smtp-Source: ADUXVKIDNmOA1be4hAzye1HaZhpw3UzozLyVqIkR95f3DcGSKYVoGgy09hMV7eUAW+wFdeDDC4jwvQ==
X-Received: by 2002:a62:93c8:: with SMTP id
	r69-v6mr11248158pfk.59.1527865817544; 
	Fri, 01 Jun 2018 08:10:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:cd69:7d4:a4bc:31b4])
	by smtp.gmail.com with ESMTPSA id
	u8-v6sm64924608pgq.7.2018.06.01.08.10.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jun 2018 08:10:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jun 2018 08:10:14 -0700
Message-Id: <1527865814-9027-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527865814-9027-1-git-send-email-akuster808@gmail.com>
References: <1527865814-9027-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/2] nmap: move recipe from meta-security to meta-oe
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
X-List-Received-Date: Fri, 01 Jun 2018 15:10:16 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nmap-redefine-the-python-library-dir.patch     | 37 +++++++++++++++
 ...shtool-mkdir-with-coreutils-mkdir-command.patch | 48 +++++++++++++++++++
 meta-oe/recipes-security/nmap/nmap_7.60.bb         | 54 ++++++++++++++++++++++
 3 files changed, 139 insertions(+)
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
index 0000000..a6616eb
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/nmap_7.60.bb
@@ -0,0 +1,54 @@
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
+inherit autotools-brokensep pkgconfig pythonnative distro_features_check
+
+PACKAGECONFIG ?= "ncat nping ndiff pcap"
+PACKAGECONFIG += " ${@bb.utils.contains('IMAGE_FEATURES', 'x11-base', 'zenmap', '', d)}"
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
+#Add gui
+PACKAGECONFIG[zenmap] = "--with-zenmap, --without-zenmap, gtk+ python-core python-codecs python-io python-logging python-unittest python-xml python-netclient python-doctest python-subprocess python-pygtk, python-core python-codecs python-io python-logging python-netclient python-xml python-unittest python-doctest python-subprocess  python-pygtk gtk+"
+
+EXTRA_OECONF = "--with-libdnet=included --with-liblinear=included --without-subversion --with-liblua=included"
+
+export PYTHON_SITEPACKAGES_DIR
+
+do_configure() {
+    # strip hard coded python2#
+    sed -i -e 's=python2\.*=python=g'  ${S}/configure.ac
+    sed -i -e 's=python2\.*=python=g'  ${S}/configure
+    autoconf
+    oe_runconf
+}
+
+PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'zenmap', '${PN}-zenmap', '', d)}"
+
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
+FILES_${PN}-zenmap = "${@bb.utils.contains("PACKAGECONFIG", "zenmap", "${bindir}/*zenmap ${bindir}/xnmap ${datadir}/applications/*  ${bindir}/nmapfe ${datadir}/zenmap/* ${PYTHON_SITEPACKAGES_DIR}/radialnet/* ${PYTHON_SITEPACKAGES_DIR}/zenmap*", "", d)}"
+
+RDEPENDS_${PN} = "python"
+RDEPENDS_${PN}-zenmap = "nmap"
-- 
2.7.4


