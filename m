Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 14B7472651
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 13:54:45 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so24037170wiw.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 05:54:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/ZJZXRsNUObOHM5SM4lkhK9PFoWx+XzbG7a7u2Z6t2s=;
	b=WzGOqgOFSvZYtxlBzYO6ergENoWKGYebwTM32oi1yhZz1sNDdHKheD1S6lOPp7l14N
	8pSfZOiefE1BtYEwI+jQyaTT4GDD1yDDenDJKIi09xN3nIfUnAUeZYPJ9D0384+mpVid
	PLkEEfV/fMoh1GEbiq/hZeJzDJQAEtuP3fXVpIWxtovwJY+g7qnd6Po2CM/FxrUbayzz
	ml35CIa+XI6fgETAr/fNQc2dGgX9BRZyz2cZsKuL9ARjIubAQITb8K4dbRz3nfMRCzAb
	/64Bbc//6GonqKO5Wc8JKhXxpGChdd2miDNTH3dChLBxfKiZS8g/bP8WNjykhJE7TRZ/
	6v0w==
X-Gm-Message-State: ALoCoQlpGtcPY34uXCYW1MTUkSfZi9UXqB0v5L7EBRRlApcRz48X7WFAhUGFjUSAkBsuRhVrhJ8B
X-Received: by 10.194.110.69 with SMTP id hy5mr123234075wjb.121.1419947685213; 
	Tue, 30 Dec 2014 05:54:45 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	gb10sm28759925wjb.21.2014.12.30.05.54.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 05:54:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Dec 2014 13:53:35 +0000
Message-Id: <1419947615-27947-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1419947615-27947-1-git-send-email-ross.burton@intel.com>
References: <1419947615-27947-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/5] telepathy-mission-control: add (moved from oe-core)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Dec 2014 13:54:48 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../tmc-Makefile-fix-race.patch                    |   76 ++++++++++++++++++++
 .../telepathy/telepathy-mission-control_5.16.1.bb  |   51 +++++++++++++
 2 files changed, 127 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch
 create mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch
new file mode 100644
index 0000000..ece1da6
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch
@@ -0,0 +1,76 @@
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 22 Sep 2013 23:21:01 -0400
+Subject: [PATCH] src/Makefile.am: fix race issue for _gen/gtypes.h and _gen/gtypes-body.h
+
+There might be an error when parallel build:
+
+[snip]
+Traceback (most recent call last):
+  File "/path/to/tools/glib-gtypes-generator.py", line 304, in <module>
+    GTypesGenerator(dom, argv[1], argv[2])()
+  File "/path/to/tools/glib-gtypes-generator.py", line 295, in __call__
+    file_set_contents(self.output + '.h', ''.join(self.header))
+  File "/path/to/tools/libtpcodegen.py", line 42, in file_set_contents
+    os.rename(filename + '.tmp', filename)
+OSError: [Errno 2] No such file or directory
+[snip]
+
+This is a race issue, the _gen/gtypes.h and _gen/gtypes-body.h may
+write(remove/rename) _gen/gtypes.tmp at the same time, then there would
+be the error.
+
+There was a similar bug in telepathy-glib which was already fixed, we use the
+similar patch to fix it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/Makefile.am |   18 +++++++++++++++---
+ 1 file changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -288,7 +288,11 @@ _gen/interfaces-body.h: _gen/mcd.xml \
+ 		$(tools_dir)/glib-interfaces-body-generator.xsl \
+ 		$< > $@
+ 
+-_gen/gtypes.h _gen/gtypes-body.h: _gen/mcd.xml \
++# do nothing, output as a side-effect
++_gen/gtypes.h: _gen/gtypes-body.h
++	@:
++
++_gen/gtypes-body.h: _gen/mcd.xml \
+ 	$(top_srcdir)/tools/glib-gtypes-generator.py
+ 	$(AM_V_GEN)$(PYTHON) $(top_srcdir)/tools/glib-gtypes-generator.py \
+ 		$< _gen/gtypes mc
+@@ -309,7 +313,11 @@ _gen/%.xml: %.xml $(wildcard $(top_srcdir)/xml/*.xml) Makefile.am
+ 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROCFLAGS) --xinclude $(tools_dir)/identity.xsl \
+ 		$< > $@
+ 
+-_gen/cli-%-body.h _gen/cli-%.h: _gen/%.xml \
++# do nothing, output as a side-effect
++_gen/cli-%.h: _gen/cli-%-body.h
++	@:
++
++_gen/cli-%-body.h: _gen/%.xml \
+ 	$(tools_dir)/glib-client-gen.py Makefile.am
+ 	$(AM_V_GEN)$(PYTHON) $(tools_dir)/glib-client-gen.py \
+ 		--group=`echo $* | tr x- x_` \
+@@ -317,7 +325,11 @@ _gen/cli-%-body.h _gen/cli-%.h: _gen/%.xml \
+ 		--tp-proxy-api=0.7.6 \
+ 		$< Mc_Cli _gen/cli-$*
+ 
+-_gen/svc-%.c _gen/svc-%.h: _gen/%.xml \
++# do nothing, output as a side-effect
++_gen/svc-%.h: _gen/svc-%.c
++	@:
++
++_gen/svc-%.c: _gen/%.xml \
+ 	$(tools_dir)/glib-ginterface-gen.py Makefile.am
+ 	$(AM_V_GEN)$(PYTHON) $(tools_dir)/glib-ginterface-gen.py \
+ 		--filename=_gen/svc-$* \
+-- 
+1.7.10.4
+
diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
new file mode 100644
index 0000000..9ae68dd
--- /dev/null
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
@@ -0,0 +1,51 @@
+SUMMARY = "Central control for Telepathy IM connection managers"
+HOMEPAGE = "http://telepathy.freedesktop.org/wiki/Mission_Control/"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
+                    file://src/request.h;beginline=1;endline=21;md5=f80534d9af1c33291b3b79609f196eb2"
+SECTION = "libs"
+DEPENDS = "libtelepathy dbus-glib gconf libxslt-native"
+
+SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/${BP}.tar.gz \
+           file://tmc-Makefile-fix-race.patch \
+          "
+SRC_URI[md5sum] = "421115a35b9e427807326877f86e7f43"
+SRC_URI[sha256sum] = "14ceb7d53535b43d44b8271ad11319d1d0fe6d193d154636b9e62b42799b9723"
+
+inherit autotools-brokensep pkgconfig pythonnative
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[upower] = "--enable-upower,--disable-upower,upower"
+
+# to select connman or nm you need to use "connectivity" and "connman" or "nm", default is to disable both
+PACKAGECONFIG[connectivity] = ",--with-connectivity=no"
+PACKAGECONFIG[connman] = "--with-connectivity=connman,,connman"
+PACKAGECONFIG[nm] = "--with-connectivity=nm,,networkmanager"
+
+PACKAGES =+ " \
+	libmissioncontrol \
+	libmissioncontrol-config \
+	libmissioncontrol-server \
+	libmissioncontrol-dev \
+	libmissioncontrol-config-dev \
+	libmissioncontrol-server-dev \
+	libmissioncontrol-dbg \
+	libmissioncontrol-config-dbg \
+	libmissioncontrol-server-dbg \
+"
+
+FILES_${PN} += "${datadir}/dbus* ${datadir}/glib-2.0/schemas"
+
+FILES_libmissioncontrol = "${libdir}/libmissioncontrol.so.*"
+FILES_libmissioncontrol-config = "${libdir}/libmissioncontrol-config.so.*"
+FILES_libmissioncontrol-server = "${libdir}/libmissioncontrol-server.so.*"
+
+FILES_libmissioncontrol-dev = "${libdir}/libmissioncontrol.* \
+                               ${includedir}/libmissioncontrol/ \
+                               ${libdir}/pkgconfig/libmissioncontrol.pc"
+FILES_libmissioncontrol-config-dev = "${libdir}/libmissioncontrol-config.*"
+FILES_libmissioncontrol-server-dev = "${libdir}/libmissioncontrol-server.*"
+
+FILES_libmissioncontrol-dbg = "${libdir}/.debug/libmissioncontrol.so.*"
+FILES_libmissioncontrol-config-dbg = "${libdir}/.debug/libmissioncontrol-config.so.*"
+FILES_libmissioncontrol-server-dbg = "${libdir}/.debug/libmissioncontrol-server.so.*"
-- 
1.7.10.4


