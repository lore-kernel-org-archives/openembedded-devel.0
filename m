Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 20FB5713E0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 07:28:55 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id kq14so19079728pab.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2014 00:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GYVo3NqpvzALj7k21m61Wq7YEOD9SqD2Zcwi6tMfDY8=;
	b=ItZ4b6r+KxZNvQt0pJWtPMUtMJBrcJOgyr5iY+xsDEOwj74KHDZKudlzaDJp2AnP1H
	KiF9OuQOmHM39eq3hq/ArdDdH7LGkZ4Xg3D85+LNjl2+evVEP53SI8574gSvD9ClvFzJ
	2lP6ttUscm8fIeoEkcjthAMq1/TnKyEG9c2oyA20tzWgm580Ir7WURrq6RV7V5lrviHD
	0LsQpryOYpOD5nvowZJpb/CuxwLUkXPSefBaH+V7WqLpE7faQha9nGPdpMQPu0qfGEvA
	d6+ZD4fMpIjWo0vthWT7zrtFrs5qKHGwWF0g+ekUFS9vrH667GlxJLugYtlih14rFJ7J
	yLKA==
X-Received: by 10.70.96.142 with SMTP id ds14mr5425058pdb.45.1409815735128;
	Thu, 04 Sep 2014 00:28:55 -0700 (PDT)
Received: from haswell.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id pn13sm845213pdb.53.2014.09.04.00.28.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Sep 2014 00:28:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Sep 2014 00:32:34 -0700
Message-Id: <1409815958-24314-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1409815958-24314-1-git-send-email-raj.khem@gmail.com>
References: <1409815958-24314-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/6] ckermit: Update recipe ckermit_301.bb -> ckermit_302.bb
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
X-List-Received-Date: Thu, 04 Sep 2014 07:28:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/ckermit/ckermit_301.bb | 57 -------------------------
 meta-oe/recipes-support/ckermit/ckermit_302.bb | 58 ++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-support/ckermit/ckermit_301.bb
 create mode 100644 meta-oe/recipes-support/ckermit/ckermit_302.bb

diff --git a/meta-oe/recipes-support/ckermit/ckermit_301.bb b/meta-oe/recipes-support/ckermit/ckermit_301.bb
deleted file mode 100644
index b255f5e..0000000
--- a/meta-oe/recipes-support/ckermit/ckermit_301.bb
+++ /dev/null
@@ -1,57 +0,0 @@
-DESCRIPTION = "C-Kermit is a combined serial and network communication \
-software package offering a consistent, medium-independent, \
-cross-platform approach to connection establishment, terminal \
-sessions, file transfer, character-set translation, and automation \
-of communication tasks."
-HOMEPAGE = "http://www.columbia.edu/kermit/"
-SECTION = "console/network"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.TXT;md5=932ca542d6c6cb8a59a0bcd76ab67cc3"
-SRC_URI = "ftp://kermit.columbia.edu/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV}"
-
-export CC2 = "${CC}"
-export BINDIR = "${bindir}"
-export MANDIR = "${mandir}/man1"
-export INFODIR = "${infodir}"
-
-# Additional flags. For uclibc we add -DNOARROWKEYS which stops ckermit
-# trying to look inside the stdio headers.
-CKERMIT_ADDITIONAL = ""
-CKERMIT_ADDITIONAL_libc-uclibc = "-DNOARROWKEYS"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_compile () {
-    # The original makefile doesn't differentiate between CC and CC_FOR_BUILD,
-    # so we build wart manually. Note that you need a ckwart.o with the proper
-    # timestamp to make this hack work:
-    ${BUILD_CC} -c ckwart.c
-    ${BUILD_CC} -o wart ckwart.o
-    ./wart ckcpro.w ckcpro.c
-
-    # read ${S}/ckccfg.txt to understand this :-)
-    oe_runmake wermit CFLAGS="${CFLAGS} -DLINUX -DCK_POSIX_SIG \
-        -DNOTCPOPTS -DLINUXFSSTND -DNOCOTFMC -DPOSIX -DUSE_STRERROR \
-        -DNOSYSLOG -DHAVE_PTMX -DNO_DNS_SRV -DNOGFTIMER \
-        -DNOB_50 -DNOB_75 -DNOB_134 -DNOB_150 -DNOB_200 \
-        -DNOB_1800 -DNOB_3600 -DNOB_7200 -DNOB_76K -DNOB_230K \
-        -DNOB_460K -DNOB_921K \
-        -DNOCSETS -DNONET -DNOUNICODE -DNOHELP -DNODEBUG \
-        -DNOFRILLS -DNOFTP -DNODIAL -DNOPUSH -DNOIKSD -DNOHTTP -DNOFLOAT \
-        -DNOSERVER -DNOSEXP -DNORLOGIN -DNOOLDMODEMS -DNOSSH -DNOLISTEN \
-        -DNORESEND -DNOAUTODL -DNOSTREAMING -DNOHINTS -DNOCKXYZ -DNOLEARN \
-        -DNOMKDIR -DNOPERMS -DNOCKTIMERS -DNOCKREGEX -DNOREALPATH \
-        -DCK_SMALL -DNOLOGDIAL -DNORENAME -DNOWHATAMI \
-        ${CKERMIT_ADDITIONAL}"
-}
-
-do_install () {
-    install -d ${D}${BINDIR} ${D}${MANDIR} ${D}${INFODIR}
-    oe_runmake 'DESTDIR=${D}' install
-    # Fix up dangling symlink
-    rm ${D}${BINDIR}/kermit-sshsub
-    (cd ${D}${BINDIR} && ln -s ${BINDIR}/kermit kermit-sshusb)
-}
-
-SRC_URI[md5sum] = "59e80f909edf305933af8e0348dcc5d7"
-SRC_URI[sha256sum] = "9793eb125f8936b079c6d7e5c3d2ff885cfedc07f9d2dd1e7db928e3029a211a"
diff --git a/meta-oe/recipes-support/ckermit/ckermit_302.bb b/meta-oe/recipes-support/ckermit/ckermit_302.bb
new file mode 100644
index 0000000..32a6c03
--- /dev/null
+++ b/meta-oe/recipes-support/ckermit/ckermit_302.bb
@@ -0,0 +1,58 @@
+DESCRIPTION = "C-Kermit is a combined serial and network communication \
+software package offering a consistent, medium-independent, \
+cross-platform approach to connection establishment, terminal \
+sessions, file transfer, character-set translation, and automation \
+of communication tasks."
+HOMEPAGE = "http://www.columbia.edu/kermit/"
+SECTION = "console/network"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING.TXT;md5=932ca542d6c6cb8a59a0bcd76ab67cc3"
+
+SRC_URI = "ftp://ftp.kermitproject.org/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV}"
+SRC_URI[md5sum] = "eac4dbf18b45775e4cdee5a7c74762b0"
+SRC_URI[sha256sum] = "0d5f2cd12bdab9401b4c836854ebbf241675051875557783c332a6a40dac0711"
+
+
+export CC2 = "${CC}"
+export BINDIR = "${bindir}"
+export MANDIR = "${mandir}/man1"
+export INFODIR = "${infodir}"
+
+# Additional flags. For uclibc we add -DNOARROWKEYS which stops ckermit
+# trying to look inside the stdio headers.
+CKERMIT_ADDITIONAL = ""
+CKERMIT_ADDITIONAL_libc-uclibc = "-DNOARROWKEYS"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_compile () {
+    # The original makefile doesn't differentiate between CC and CC_FOR_BUILD,
+    # so we build wart manually. Note that you need a ckwart.o with the proper
+    # timestamp to make this hack work:
+    ${BUILD_CC} -c ckwart.c
+    ${BUILD_CC} -o wart ckwart.o
+    ./wart ckcpro.w ckcpro.c
+
+    # read ${S}/ckccfg.txt to understand this :-)
+    oe_runmake wermit CFLAGS="${CFLAGS} -DLINUX -DCK_POSIX_SIG \
+        -DNOTCPOPTS -DLINUXFSSTND -DNOCOTFMC -DPOSIX -DUSE_STRERROR \
+        -DNOSYSLOG -DHAVE_PTMX -DNO_DNS_SRV -DNOGFTIMER \
+        -DNOB_50 -DNOB_75 -DNOB_134 -DNOB_150 -DNOB_200 \
+        -DNOB_1800 -DNOB_3600 -DNOB_7200 -DNOB_76K -DNOB_230K \
+        -DNOB_460K -DNOB_921K \
+        -DNOCSETS -DNONET -DNOUNICODE -DNOHELP -DNODEBUG \
+        -DNOFRILLS -DNOFTP -DNODIAL -DNOPUSH -DNOIKSD -DNOHTTP -DNOFLOAT \
+        -DNOSERVER -DNOSEXP -DNORLOGIN -DNOOLDMODEMS -DNOSSH -DNOLISTEN \
+        -DNORESEND -DNOAUTODL -DNOSTREAMING -DNOHINTS -DNOCKXYZ -DNOLEARN \
+        -DNOMKDIR -DNOPERMS -DNOCKTIMERS -DNOCKREGEX -DNOREALPATH \
+        -DCK_SMALL -DNOLOGDIAL -DNORENAME -DNOWHATAMI \
+        ${CKERMIT_ADDITIONAL}"
+}
+
+do_install () {
+    install -d ${D}${BINDIR} ${D}${MANDIR} ${D}${INFODIR}
+    oe_runmake 'DESTDIR=${D}' install
+    # Fix up dangling symlink
+    rm ${D}${BINDIR}/kermit-sshsub
+    (cd ${D}${BINDIR} && ln -s ${BINDIR}/kermit kermit-sshusb)
+}
-- 
2.1.0


