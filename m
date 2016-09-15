Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id CE405700F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 20:21:55 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id 1so4340032wmz.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 13:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=NWHYTNR7vbFttH/APdvRlE3B6cx6g4pI1UsjALb0Wf8=;
	b=12pq0KLfQEkDsyk5MkUBrkBlZqKkOsbuRmxJ+wl1AUlF4wsdV5ydmvLgMmgy4ABGZq
	iOXMBV916ZIC2sZkEYNWMdVU+7n+HxKezB6bO1Wl5FqJLnFE6Xv72Q5M1OUPm80sn1Oz
	UFaKvcpchlzW8Vr7z3CMcsn6QksRPJVCc8iFD38S/Bdo5TbAbNhWOY7Z0dHvoTbA6oft
	5HggLH/5hSxrn4zkvC4fFh++XopJTp7pqUhPyDPwk3XZisnydo/aAtWR7ErqFdQoZ92V
	BzcpeIpbl495cD4H5SoaggNnyNXrweujleSwffIAJ+BEcsQ6N1WfD9ZZ9YHzO+JQAMNc
	3qgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=NWHYTNR7vbFttH/APdvRlE3B6cx6g4pI1UsjALb0Wf8=;
	b=DYwbYLxyj0whAX0NEbTtSC+zwj6yh4jqoR5q5ce7DHZ32UHpO6PhXSF0vFNjZM6t8E
	cvMGQFU4xKlLCzqVD3Gbi6UTePyzzNXb6TkMCkTShc88aiV7R7jbwS/FILlVjZUNUfsI
	PpLEXio1w3lZnpVGejKS1NmoLME+o1jC2DfRiL8xRVBYZxRepv1OKLG11glnoTI05M7Q
	wTetyou5QFt2DAMM9bqplNN8E/BJqa4V1ODl62CPL0xSZIkYtCFJSkk2lrmiSqIj4lEp
	1eB00mXXvsC+/+ZZGm0UUTjdDALWKHuTKUFVzYDJX3cNz/SEc6vpvSd918ZUZmtAvK0o
	zwog==
X-Gm-Message-State: AE9vXwMiE02Zr13AMjqNxG5YZ2Ss9+sO+TCU8XKZheucS3md9zQEksP8Jao1f6lNsIdaFiJd
X-Received: by 10.194.88.137 with SMTP id bg9mr9437352wjb.155.1473970915622;
	Thu, 15 Sep 2016 13:21:55 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	lz5sm4994842wjb.24.2016.09.15.13.21.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Sep 2016 13:21:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2016 21:21:50 +0100
Message-Id: <1473970910-2046-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][meta-oe] portaudio: upgrade to latest release
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
X-List-Received-Date: Thu, 15 Sep 2016 20:21:59 -0000

PortAudio has moved from Subversion to Git, so the SRC_URI needs to be updated.
They also have stable tarballs so instead of taking a random git hash use the
latest release.  This was svn revision 1919 so to keep the version order correct
hard-code this into the PV.

The license is in fact MIT, so use that in LICENSE instead of PortAudio (which
wasn't defined anywhere, resulting in QA warnings).

Add a patch to pass LDFLAGS to all the compiles.

Remove the useless assignment to TESTS.  Install the test suite manually using
libtool so that we don't install the wrapper scripts.

Explicitly disable ASIHPI to avoid floating dependencies.

Remove redundant commented-out lines.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-support/portaudio/files/ldflags.patch  | 51 ++++++++++++++++++++++
 .../portaudio/portaudio-v19_20140130.bb            | 32 ++++++++++++++
 .../recipes-support/portaudio/portaudio-v19_svn.bb | 32 --------------
 3 files changed, 83 insertions(+), 32 deletions(-)
 create mode 100644 meta-oe/recipes-support/portaudio/files/ldflags.patch
 create mode 100644 meta-oe/recipes-support/portaudio/portaudio-v19_20140130.bb
 delete mode 100644 meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb

diff --git a/meta-oe/recipes-support/portaudio/files/ldflags.patch b/meta-oe/recipes-support/portaudio/files/ldflags.patch
new file mode 100644
index 0000000..aca93a5
--- /dev/null
+++ b/meta-oe/recipes-support/portaudio/files/ldflags.patch
@@ -0,0 +1,51 @@
+Upstream forgot to pass LDFLAGS to everything apart from the main library.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/Makefile.in b/Makefile.in
+index 5e1a764..61ecdd1 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -171,20 +171,20 @@ lib/$(PALIB): lib-stamp $(LTOBJS) $(MAKEFILE) $(PAINC)
+ 	@WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) $(PA_LDFLAGS) -o lib/$(PALIB) $(LTOBJS) $(DLL_LIBS)
+ 
+ $(ALL_TESTS): bin/%: lib/$(PALIB) $(MAKEFILE) $(PAINC) test/%.c
+-	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(top_srcdir)/test/$*.c lib/$(PALIB) $(LIBS)
+-	@WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS) $(top_srcdir)/test/$*.c lib/$(PALIB) $(LIBS)
++	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(top_srcdir)/test/$*.c lib/$(PALIB) $(LIBS)
++	@WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS) $(LDFLAGS) $(top_srcdir)/test/$*.c lib/$(PALIB) $(LIBS)
+ 
+ $(EXAMPLES): bin/%: lib/$(PALIB) $(MAKEFILE) $(PAINC) examples/%.c
+-	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(top_srcdir)/examples/$*.c lib/$(PALIB) $(LIBS)
+-	@WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS) $(top_srcdir)/examples/$*.c lib/$(PALIB) $(LIBS)
++	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(top_srcdir)/examples/$*.c lib/$(PALIB) $(LIBS)
++	@WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS) $(LDFLAGS) $(top_srcdir)/examples/$*.c lib/$(PALIB) $(LIBS)
+ 
+ $(SELFTESTS): bin/%: lib/$(PALIB) $(MAKEFILE) $(PAINC) qa/%.c
+-	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(top_srcdir)/qa/$*.c lib/$(PALIB) $(LIBS)
+-	@WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS) $(top_srcdir)/qa/$*.c lib/$(PALIB) $(LIBS)
++	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(top_srcdir)/qa/$*.c lib/$(PALIB) $(LIBS)
++	@WITH_ASIO_TRUE@  $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS) $(LDFLAGS) $(top_srcdir)/qa/$*.c lib/$(PALIB) $(LIBS)
+ 
+ bin/paloopback: lib/$(PALIB) $(MAKEFILE) $(PAINC) $(LOOPBACK_OBJS)
+-	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(LOOPBACK_OBJS) lib/$(PALIB) $(LIBS)
+-	@WITH_ASIO_TRUE@ $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS)  $(LOOPBACK_OBJS) lib/$(PALIB) $(LIBS)
++	@WITH_ASIO_FALSE@ $(LIBTOOL) --mode=link $(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(LOOPBACK_OBJS) lib/$(PALIB) $(LIBS)
++	@WITH_ASIO_TRUE@ $(LIBTOOL) --mode=link --tag=CXX $(CXX) -o $@ $(CXXFLAGS) $(LDFLAGS) $(LOOPBACK_OBJS) lib/$(PALIB) $(LIBS)
+ 
+ install: lib/$(PALIB) portaudio-2.0.pc
+ 	$(INSTALL) -d $(DESTDIR)$(libdir)
+@@ -224,10 +224,10 @@ distclean: clean
+ 	$(CC) -c $(CFLAGS) $< -o $@
+ 
+ %.lo: %.c $(MAKEFILE) $(PAINC)
+-	$(LIBTOOL) --mode=compile $(CC) -c $(CFLAGS) $< -o $@
++	$(LIBTOOL) --mode=compile $(CC) -c $(CFLAGS) $(LDFLAGS) $< -o $@
+ 
+ %.lo: %.cpp $(MAKEFILE) $(PAINC)
+-	$(LIBTOOL) --mode=compile --tag=CXX $(CXX) -c $(CXXFLAGS) $< -o $@
++	$(LIBTOOL) --mode=compile --tag=CXX $(CXX) -c $(CXXFLAGS) $(LDFLAGS) $< -o $@
+ 
+ %.o: %.cpp $(MAKEFILE) $(PAINC)
+ 	$(CXX) -c $(CXXFLAGS) $< -o $@
diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_20140130.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_20140130.bb
new file mode 100644
index 0000000..8f2b0db
--- /dev/null
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_20140130.bb
@@ -0,0 +1,32 @@
+SUMMARY = "A portable audio library"
+SECTION = "libs/multimedia"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
+
+PV = "v19+svnr1919"
+
+SRC_URI = "http://www.portaudio.com/archives/pa_stable_v19_20140130.tgz \
+           file://ldflags.patch"
+SRC_URI[md5sum] = "7f220406902af9dca009668e198cbd23"
+SRC_URI[sha256sum] = "8fe024a5f0681e112c6979808f684c3516061cc51d3acc0b726af98fc96c8d57"
+
+S = "${WORKDIR}/portaudio"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= "alsa jack"
+PACKAGECONFIG[alsa] = "--with-alsa, --without-alsa, alsa-lib,"
+PACKAGECONFIG[jack] = "--with-jack, --without-jack, jack,"
+
+EXTRA_OECONF = "--without-oss --without-asihpi"
+
+do_install_append() {
+    mkdir --parents ${D}${bindir}
+    for b in ${B}/bin/pa*; do
+        # Bit nasty, should always work
+        ${B}/*-libtool --mode install install $b ${D}${bindir}
+    done
+}
+
+PACKAGES += "portaudio-examples"
+FILES_portaudio-examples = "${bindir}"
diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
deleted file mode 100644
index c8d7378..0000000
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "A portable audio library"
-SECTION = "libs/multimedia"
-LICENSE = "PortAudio"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
-
-PV = "v19+svnr${SRCPV}"
-
-SRCREV = "1387"
-SRC_URI = "svn://subversion.assembla.com/svn/portaudio/portaudio;module=trunk;protocol=http"
-S = "${WORKDIR}/trunk"
-
-inherit autotools pkgconfig
-
-PACKAGECONFIG ??= "alsa jack"
-PACKAGECONFIG[alsa] = "--with-alsa, --without-alsa, alsa-lib,"
-PACKAGECONFIG[jack] = "--with-jack, --without-jack, jack,"
-
-EXTRA_OECONF = "--without-oss"
-
-TESTS = "  pa_devs patest1      patest_hang patest_many                   patest_prime patest_sine patest_stop     patest_write_sine        \
-pa_fuzz    patest_buffer        patest_in_overflow  patest_maxsines       patest_read_record  patest_sine8         patest_sync              \
-pa_minlat  patest_callbackstop  patest_latency      patest_multi_sine     patest_record       patest_sine_formats  patest_toomanysines      \
-paqa_devs  patest_clip          patest_leftright    patest_out_underflow  patest_ringmix      patest_sine_time     patest_underflow         \
-paqa_errs  patest_dither        patest_longsine     patest_pink           patest_saw          patest_start_stop    patest_wire"
-
-# DEFINES = PA_USE_OSS=1 HAVE_LIBPTHREAD=1
-# DEFINES += PA_LITTLE_ENDIAN
-
-# INCLUDEPATH = ../pa_common
-
-PACKAGES += "portaudio-examples"
-FILES_portaudio-examples = "${bindir}"
-- 
2.8.1


