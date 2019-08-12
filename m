Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 86FDF7ECB9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 16:12:04 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id z14so12492173pga.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 09:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T/GhR2QhzE/OkhfiNMy7RLufRw90UPs6JOde3jj3T0o=;
	b=he94b0t1YUCtOx1vBFvbdySERTqMoVxI5jzU2N9aYDRLfYcaD0yGykILmumgCqhpin
	ccydrKEpzP6Roqk10zSFMJPqa+E71q/e8jXpwDkkUoJidWrAjAodGqmX7QKTcXr/KZwH
	BBUkEjENc5CzSKzssXtVEHLoxMQIQ/Qdyi9rniHvptpy1YMh+k6QP5RusqGm86NnehFc
	7prikAbxOn2AXlFnFkGD9uIEd/ccyRLcPwyXCZVJYkqdgPovW2K1vXumjfiotB7nqyqa
	bGM04UXAFar0ihHUKVxsANG2fh9Mva6CPfUI2/DEQCL95iZCV6NoSPsPEguvt9gVNZhz
	WdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T/GhR2QhzE/OkhfiNMy7RLufRw90UPs6JOde3jj3T0o=;
	b=O0cpUYthdMA8jaacWiTtifYp9Lefod9Z9TXClc7WFHveKITFeEZE9M/gVZl4OahC4s
	quuVQVemNBw59EyIeBI4UNcXiRMNxkkb4JXQgYmaSQTlJhHlKP+JgsgsLbSoKdqzG9x6
	fUPnpi8i5WYVIwKlO+d62kffZnUvEhjfVHTXmwXwx3qroPynhLypMQv5lNAgXZUpQiKk
	HFUIBEbQcZb4c5T+h8LA7goSP/ZaTzwxgrLN0FhkYQSKbrC4Co0BJTrGx5C6gs2pC2Da
	ZBbbeFTX3jZmue/3fu6hWne5wrbo23/krlST/e/oFMFNrMtJ6TKRIlsuwhiJ2ddIQNFd
	/bog==
X-Gm-Message-State: APjAAAUpLx3mXoC28je3atWvYrrfP4eMAUwEx+PMDawTEKXsl3j8zwTf
	s7yl4owCJbKLCW1ZpYyFcTArRoC+02s=
X-Google-Smtp-Source: APXvYqwjOpTyBo9b+RCtDEG+4GLSMvIbUttwPGlDxE0NrJ1ifGq/FpFdAay0Np5jqzOgpGfXIriTdA==
X-Received: by 2002:a63:7b4d:: with SMTP id k13mr20887692pgn.182.1565626324871;
	Mon, 12 Aug 2019 09:12:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id r61sm22724pjb.7.2019.08.12.09.12.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 12 Aug 2019 09:12:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Aug 2019 09:11:52 -0700
Message-Id: <20190812161152.15643-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netkit-rusers: Fix cross-build after glibc dropped rpc
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
X-List-Received-Date: Mon, 12 Aug 2019 16:12:04 -0000
Content-Transfer-Encoding: 8bit

Remove runtime checks from configure script which wont run correctly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Link-with-libtirpc.patch             | 71 +++++++++++++++----
 .../netkit-rusers/netkit-rusers_0.17.bb       | 17 ++---
 2 files changed, 61 insertions(+), 27 deletions(-)

diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/0001-Link-with-libtirpc.patch b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/0001-Link-with-libtirpc.patch
index 55926468d9..3655a57162 100644
--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/0001-Link-with-libtirpc.patch
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/0001-Link-with-libtirpc.patch
@@ -13,21 +13,69 @@ Upstream-Status: Pending
  rup/rup.c                 | 2 +-
  4 files changed, 4 insertions(+), 13 deletions(-)
 
-diff --git a/configure b/configure
-index 85f6ca6..2d2d4b7 100755
 --- a/configure
 +++ b/configure
-@@ -147,7 +147,7 @@ else
+@@ -92,7 +92,6 @@ else
+     echo -n 'Checking if C compiler works... '
+     if (
+           $CC __conftest.c -o __conftest || exit 1
+-          ./__conftest || exit 1
+        ) >/dev/null 2>&1; then
+          echo 'yes'
+      else
+@@ -146,8 +145,7 @@ else
+ 
  fi
  
- LDFLAGS=
+-LDFLAGS=
 -LIBS=
-+LIBS="-ltirpc"
++LIBS="$LIBS -ltirpc"
  
  rm -f __conftest*
  
-diff --git a/rpc.rusersd/rusers_proc.c b/rpc.rusersd/rusers_proc.c
-index 9ae6306..f9e237c 100644
+@@ -172,13 +170,11 @@ int main() {
+ EOF
+ if (
+       $CC $CFLAGS  __conftest.c  -o __conftest || exit 1
+-      ./__conftest || exit 1
+    ) >/dev/null 2>&1; then
+     echo 'yes'
+ else
+     if (
+           $CC $CFLAGS -D__USE_BSD_SIGNAL __conftest.c  -o __conftest || exit 1
+-          ./__conftest || exit 1
+        ) >/dev/null 2>&1; then
+         echo '-D__USE_BSD_SIGNAL'
+         CFLAGS="$CFLAGS -D__USE_BSD_SIGNAL"
+@@ -231,7 +227,6 @@ if (
+ else
+     if (
+           $CC $CFLAGS -D_GNU_SOURCE __conftest.c  -o __conftest || exit 1
+-          ./__conftest || exit 1
+        ) >/dev/null 2>&1; then
+         echo '-D_GNU_SOURCE'
+         CFLAGS="$CFLAGS -D_GNU_SOURCE"
+@@ -262,20 +257,17 @@ int main() {
+ EOF
+ if (
+       $CC $CFLAGS  __conftest.c $LIBBSD -o __conftest || exit 1
+-      ./__conftest || exit 1
+    ) >/dev/null 2>&1; then
+     echo 'ok'
+ else
+     if (
+           $CC $CFLAGS  __conftest.c -lsnprintf $LIBBSD -o __conftest || exit 1
+-          ./__conftest || exit 1
+        ) >/dev/null 2>&1; then
+         echo '-lsnprintf'
+         LIBS="$LIBS -lsnprintf"
+     else
+         if (
+               $CC $CFLAGS  __conftest.c -ldb $LIBBSD -o __conftest || exit 1
+-              ./__conftest || exit 1
+            ) >/dev/null 2>&1; then
+             echo '-ldb'
+             LIBS="$LIBS -ldb"
 --- a/rpc.rusersd/rusers_proc.c
 +++ b/rpc.rusersd/rusers_proc.c
 @@ -57,12 +57,7 @@ char rp_rcsid[] =
@@ -44,8 +92,6 @@ index 9ae6306..f9e237c 100644
  
  void rusers_service(struct svc_req *rqstp, SVCXPRT *transp);
  
-diff --git a/rpc.rusersd/rusersd.c b/rpc.rusersd/rusersd.c
-index 762be9b..dd355ac 100644
 --- a/rpc.rusersd/rusersd.c
 +++ b/rpc.rusersd/rusersd.c
 @@ -38,11 +38,7 @@ char rusersd_rcsid[] =
@@ -61,11 +107,9 @@ index 762be9b..dd355ac 100644
  
  #include "../version.h"
  
-diff --git a/rup/rup.c b/rup/rup.c
-index e5669ff..887f89d 100644
 --- a/rup/rup.c
 +++ b/rup/rup.c
-@@ -48,7 +48,7 @@ char rcsid[] = "$Id: rup.c,v 1.8 2000/07/22 19:51:40 dholland Exp $";
+@@ -48,7 +48,7 @@ char rcsid[] = "$Id: rup.c,v 1.8 2000/07
  
  #undef FSHIFT			/* Use protocol's shift and scale values */
  #undef FSCALE
@@ -74,6 +118,3 @@ index e5669ff..887f89d 100644
  
  #include "../version.h"
  
--- 
-2.17.0
-
diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
index 77d739d722..296ebcad29 100644
--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
 SECTION = "net"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://rusers/rusers.c;beginline=2;endline=3;md5=f4fc634a4ce8c569911196b72b10770e"
-DEPENDS = " tcp-wrappers libtirpc rpcbind rpcsvc-proto-native"
+DEPENDS = " tcp-wrappers libtirpc rpcbind rpcsvc-proto rpcsvc-proto-native"
 
 SRC_URI = "http://http.debian.net/debian/pool/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
            http://http.debian.net/debian/pool/main/n/${BPN}/${BPN}_${PV}-8.diff.gz;name=patch8 \
@@ -17,16 +17,12 @@ SRC_URI[archive.sha256sum] = "f00138651865ad2dcfec5dedda0cda403cb80c4ab68efcc3bb
 SRC_URI[patch8.md5sum] = "1ff498113e0f920d92088092e5570bdc"
 SRC_URI[patch8.sha256sum] = "14882dbdda4e37baa84d55b54b46c7e063a20fc9e04d1be1a2807643cd0f3067"
 
-inherit autotools-brokensep
-
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
-LIBS += "-ltirpc"
+
+EXTRA_OEMAKE = "RUSERSX=${STAGING_INCDIR}/rpcsvc/rusers.x"
 
 do_configure () {
-    ./configure --prefix=${prefix}
-    echo "LDFLAGS=${LDFLAGS}" >> MCONFIG
-    echo "USE_GLIBC=1" >> MCONFIG
-    echo "LIBS=${LIBS}" >> MCONFIG
+    ./configure --prefix=${prefix} --installroot=${D} --with-c-compiler="${CC}"
 }
 
 do_install () {
@@ -62,9 +58,6 @@ EOF
     install rusersd.conf ${D}/${sysconfdir}/xinetd.d/rusersd
 }
 
-
-INSANE_SKIP_${PN} = "already-stripped"
-
 PACKAGES = "${PN}-client ${PN}-server ${PN}-doc ${BPN}-dbg"
 FILES_${PN}-client = "${bindir}/*"
 FILES_${PN}-server = "${sbindir}/* ${sysconfdir}"
@@ -72,7 +65,7 @@ FILES_${PN}-doc = "${mandir}"
 FILES_${PN}-dbg = "${prefix}/src/debug \
             ${bindir}/.debug ${sbindir}/.debug"
 
-RDEPENDS_${PN}-server = "tcp-wrappers xinetd rpcbind"
+RDEPENDS_${PN}-server += "tcp-wrappers xinetd rpcbind"
 
 # http://errors.yoctoproject.org/Errors/Details/186962/
 EXCLUDE_FROM_WORLD_libc-musl = "1"
-- 
2.22.0


