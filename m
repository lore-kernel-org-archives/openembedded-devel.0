Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US3nX-0006dI-Ly
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 13:12:03 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Apr 2013 03:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,485,1363158000"; d="scan'208";a="319811880"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2013 03:54:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 11:53:55 +0100
Message-Id: <cdf2bf56540ba5fad18d22e9ca2959075e1ba205.1366109533.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking, meta-oe][PATCH 1/9] vsftpd: move from meta-oe to meta-networking and tweak
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
X-List-Received-Date: Tue, 16 Apr 2013 11:12:51 -0000
X-List-Received-Date: Tue, 16 Apr 2013 11:12:51 -0000

* Fix stripped file QA warning
* Add proper headers to patches (and split makefile.patch into two
  parts, one of which may be upstreamable)
* Use PV in SRC_URI instead of hardcoded version
* Move SRC_URI checksums up next to SRC_URI
* Set SUMMARY instead of DESCRIPTION

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-daemons}/vsftpd/files/init             |    0
 .../recipes-daemons}/vsftpd/files/vsftpd.conf      |    0
 .../vsftpd/vsftpd-2.3.5/makefile-destdir.patch     |   25 +++++++++-----------
 .../vsftpd/vsftpd-2.3.5/makefile-libs.patch        |   21 ++++++++++++++++
 .../vsftpd/vsftpd-2.3.5/makefile-strip.patch       |   17 +++++++++++++
 .../vsftpd/vsftpd-2.3.5/nopam.patch                |    4 ++++
 .../recipes-daemons}/vsftpd/vsftpd_2.3.5.bb        |   17 +++++++------
 7 files changed, 63 insertions(+), 21 deletions(-)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-daemons}/vsftpd/files/init (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-daemons}/vsftpd/files/vsftpd.conf (100%)
 rename meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/makefile.patch => meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-destdir.patch (75%)
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-libs.patch
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-strip.patch
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-daemons}/vsftpd/vsftpd-2.3.5/nopam.patch (87%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-daemons}/vsftpd/vsftpd_2.3.5.bb (83%)

diff --git a/meta-oe/recipes-connectivity/vsftpd/files/init b/meta-networking/recipes-daemons/vsftpd/files/init
similarity index 100%
rename from meta-oe/recipes-connectivity/vsftpd/files/init
rename to meta-networking/recipes-daemons/vsftpd/files/init
diff --git a/meta-oe/recipes-connectivity/vsftpd/files/vsftpd.conf b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf
similarity index 100%
rename from meta-oe/recipes-connectivity/vsftpd/files/vsftpd.conf
rename to meta-networking/recipes-daemons/vsftpd/files/vsftpd.conf
diff --git a/meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/makefile.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-destdir.patch
similarity index 75%
rename from meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/makefile.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-destdir.patch
index 3bf8f97..ee37f26 100644
--- a/meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/makefile.patch
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-destdir.patch
@@ -1,17 +1,14 @@
-diff -ur vsftpd-2.0.1_org/Makefile vsftpd-2.0.1_patch/Makefile
---- vsftpd-2.0.1_org/Makefile	2004-06-06 18:21:27.000000000 +0200
-+++ vsftpd-2.0.1_patch/Makefile	2004-07-21 09:50:25.245576352 +0200
-@@ -5,7 +5,7 @@
- #CFLAGS = -g
- CFLAGS	=	-O2 -Wall -W -Wshadow #-pedantic -Werror -Wconversion
- 
--LIBS	=	`./vsf_findlibs.sh`
-+LIBS	=	-lssl -lcrypto -lnsl -lresolv
- LINK	=	-Wl,-s
- 
- OBJS	=	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o \
-@@ -24,21 +24,21 @@
- 	$(CC) -o vsftpd $(OBJS) $(LINK) $(LIBS)
+Use DESTDIR within install to allow installing under a prefix
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/Makefile b/Makefile
+--- a/Makefile
++++ b/Makefile
+@@ -24,21 +24,21 @@ vsftpd: $(OBJS)
+ 	$(CC) -o vsftpd $(OBJS) $(LINK) $(LIBS) $(LDFLAGS)
  
  install:
 -	if [ -x /usr/local/sbin ]; then \
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-libs.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-libs.patch
new file mode 100644
index 0000000..6a419db
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-libs.patch
@@ -0,0 +1,21 @@
+Hardcode LIBS instead of using a script to determine available libs
+
+We want to avoid this dynamic detection so we have a deterministic
+build.
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/Makefile b/Makefile
+--- a/Makefile
++++ b/Makefile
+@@ -5,7 +5,7 @@ IFLAGS  = -idirafter dummyinc
+ #CFLAGS = -g
+ CFLAGS	=	-O2 -Wall -W -Wshadow #-pedantic -Werror -Wconversion
+ 
+-LIBS	=	`./vsf_findlibs.sh`
++LIBS	=	-lssl -lcrypto -lnsl -lresolv
+ LINK	=	-Wl,-s
+ 
+ OBJS	=	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o \
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-strip.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-strip.patch
new file mode 100644
index 0000000..a2e0cd0
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/makefile-strip.patch
@@ -0,0 +1,17 @@
+Disable stripping at link time
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/Makefile b/Makefile
+--- a/Makefile
++++ b/Makefile
+@@ -6,7 +6,6 @@ IFLAGS  = -idirafter dummyinc
+ CFLAGS	=	-O2 -Wall -W -Wshadow #-pedantic -Werror -Wconversion
+ 
+ LIBS	=	-lssl -lcrypto -lnsl -lresolv
+-LINK	=	-Wl,-s
+ 
+ OBJS	=	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o \
+ 		tunables.o ftpdataio.o secbuf.o ls.o \
diff --git a/meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/nopam.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/nopam.patch
similarity index 87%
rename from meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/nopam.patch
rename to meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/nopam.patch
index 8e0559c..cf0d68e 100644
--- a/meta-oe/recipes-connectivity/vsftpd/vsftpd-2.3.5/nopam.patch
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-2.3.5/nopam.patch
@@ -1,3 +1,7 @@
+Disable PAM
+
+Upstream-Status: Inappropriate [config]
+
 diff -ur vsftpd-2.0.1_org/builddefs.h vsftpd-2.0.1_patch/builddefs.h
 --- vsftpd-2.0.1_org/builddefs.h	2004-07-02 16:36:59.000000000 +0200
 +++ vsftpd-2.0.1_patch/builddefs.h	2004-07-21 09:34:49.044900488 +0200
diff --git a/meta-oe/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
similarity index 83%
rename from meta-oe/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb
rename to meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
index 1669d96..c02ee9c 100644
--- a/meta-oe/recipes-connectivity/vsftpd/vsftpd_2.3.5.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
@@ -1,17 +1,22 @@
-DESCRIPTION = "Secure ftp server"
-HOMEPAGE="https://security.appspot.com/vsftpd.html"
+SUMMARY = "Very Secure FTP server"
+HOMEPAGE = "https://security.appspot.com/vsftpd.html"
 SECTION = "network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271"
 
 DEPENDS = "libcap"
 
-SRC_URI = "https://security.appspot.com/downloads/vsftpd-2.3.5.tar.gz \
-           file://makefile.patch \
+SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
+           file://makefile-destdir.patch \
+           file://makefile-libs.patch \
+           file://makefile-strip.patch \
            file://nopam.patch \
            file://init \
            file://vsftpd.conf"
 
+SRC_URI[md5sum] = "01398a5bef8e85b6cf2c213a4b011eca"
+SRC_URI[sha256sum] = "d87ee2987df8f03e1dbe294905f7907b2798deb89c67ca965f6e2f60879e54f1"
+
 inherit update-rc.d useradd
 
 CONFFILES_${PN} = "${sysconfdir}/vsftpd.conf"
@@ -43,6 +48,4 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home-dir /var/lib/ftp --no-create-home -g ftp \
                        --shell /bin/false ftp "
 GROUPADD_PARAM_${PN} = "-r ftp"
-                     
-SRC_URI[md5sum] = "01398a5bef8e85b6cf2c213a4b011eca"
-SRC_URI[sha256sum] = "d87ee2987df8f03e1dbe294905f7907b2798deb89c67ca965f6e2f60879e54f1"
+
-- 
1.7.10.4



