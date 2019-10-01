Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7A47F30B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2019 00:19:55 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id q24so4560426plr.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2019 17:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qbcMWtW/bVlcGEUTyiQOkrataAvS5LdFuWKAFkxLJt4=;
	b=fGkuqewRjTbFW7MZ/e/uiJyzP52TC6Rmfo6mL0gal6NeeRZNEafzb2Qz6CtwX7w6SF
	psSnyk/lGsabMHCjzRS0fG+BH5banlF+/cQag7pLN8An0C6mgVi0FQ+YJCXIrBbhK3vh
	K+afnv1ptB/71oJUUtUzJJp1MOwIO0B5x7j7HbQFotqWCR+ur+mj8tDJa9Sbp+HuKiYj
	bBg95L97QrJBerTxb4fZKdQnOAa7n98WJ6d9MCaZOD7g52tSqTjXNXueLxYEgZe8ABzg
	C1qvAQaxX0xdJfBRtW7O0gIk3JNc5z9QcAQGQR80Yl+FtLCuSF2ww7GzT3+d2GBpTn1N
	A1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qbcMWtW/bVlcGEUTyiQOkrataAvS5LdFuWKAFkxLJt4=;
	b=iIRR0rnoh2STJ5WycArMqtec5C6m9Rx5K4XDjNaQTUtJ1yVrQ9QAVzGa+r29ayf+VT
	Sj6bU39yeG9Togs2KpoXKVt3dbqszedJlEjNvVX5PFlKQ7oX4afND/7rvjwPyacWJMwY
	FDLMAwFzHKfdmPi/bwrw6pokZcyz3lzE/7oR3ef/hUzVzaQYf81PmUJAVScPU210Ozqf
	9i5bESpuwM25Mc61C1hbTjBXl+4eLa10GgyvpW84rPcAaTxr25SK3E3kupvIV3l7P5RV
	FB5T4j4ay3IOZP5u77mv1bntkmw1ex0yv7iIjGBmrn/7Kq2ZVyXHRPven3F/dgJBiYYE
	Iqaw==
X-Gm-Message-State: APjAAAURQ8cpJyJgepb+5baa8SlxQOxahHMVZvinG6PP1+ILeiZbmgFG
	57KswkVWxbGiwEMOZvryLCT4bMxojbg=
X-Google-Smtp-Source: APXvYqx4/vJzCwmW35IGfb9MpLCydDwGTpiC9vLummFbUaGWiIt4ZKIdacujpChx4M4D5a4Uaz9uFA==
X-Received: by 2002:a17:902:b109:: with SMTP id
	q9mr22973305plr.306.1569889196216; 
	Mon, 30 Sep 2019 17:19:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	b5sm15373051pfp.38.2019.09.30.17.19.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Sep 2019 17:19:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Sep 2019 17:19:47 -0700
Message-Id: <20191001001947.1286689-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH V2] opensaf: Fix duplicate copies of shared libs in package
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
X-List-Received-Date: Tue, 01 Oct 2019 00:19:56 -0000
Content-Transfer-Encoding: 8bit

some plugins are installed into libdir/opensaf but we were making a copy
into libdir as well, this patch changes that so the packaged files are
appearing only once

create_empty_library should be using cross compiler with linker flags,
existig code in this area is not cross compile friendly

skip dev-so QA test since some .so are stubs which are packages in PN

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Reset FILES_SOLIBSDEV since some stub .so files should be in main package

 ...rary-Use-CC-variable-intead-of-hardc.patch | 23 +++++++++++++++++++
 .../opensaf/opensaf_5.19.07.bb                |  8 ++++---
 2 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-create_empty_library-Use-CC-variable-intead-of-hardc.patch

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-create_empty_library-Use-CC-variable-intead-of-hardc.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-create_empty_library-Use-CC-variable-intead-of-hardc.patch
new file mode 100644
index 0000000000..21abcf75b5
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-create_empty_library-Use-CC-variable-intead-of-hardc.patch
@@ -0,0 +1,23 @@
+From 300fd3e27e71a91fc52d3f985ed4fde548852853 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 27 Sep 2019 12:50:11 -0700
+Subject: [PATCH] create_empty_library: Use CC variable intead of hardcoding
+ gcc
+
+This ensures that cross-compiles can succeed, otherwise we get wrong
+architecture on these stub libraries
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scripts/create_empty_library | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/scripts/create_empty_library
++++ b/scripts/create_empty_library
+@@ -66,4 +66,4 @@ for s in $symbols; do
+     echo "SaAisErrorT $s() { return SA_AIS_ERR_UNAVAILABLE; }" >> "$tmpdir/lib.c"
+ done
+ rm -f "$1"
+-gcc -O2 -shared -fPIC "$tmpdir/lib.c" -Wl,-version-script="$2" -Wl,-soname="$libbase.so.$version1" -o "$1"
++$CC -O2 -shared -fPIC "$tmpdir/lib.c" -Wl,-version-script="$2" -Wl,-soname="$libbase.so.$version1" -o "$1" $LDFLAGS
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb
index 3df6824ff3..efa2bf5eb5 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb
@@ -25,6 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch \
            file://0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch \
            file://0001-Add-configure-time-check-for-gettid-API.patch \
+           file://0001-create_empty_library-Use-CC-variable-intead-of-hardc.patch \
            "
 SRC_URI[md5sum] = "e9ae9de803a99b7ab33757a49858542f"
 SRC_URI[sha256sum] = "caed672d03ab1fe3f27d333429c7ca03022714e7c6350500208b7bd7349f03ce"
@@ -44,13 +45,11 @@ PACKAGECONFIG[plm] = "--enable-ais-plm,--disable-ais-plm,libvirt openhpi"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '', d)}"
 
-PKGLIBDIR="${libdir}"
 CPPFLAGS += "-Wno-error=stringop-overflow= -Wno-error=stringop-truncation"
 CXXFLAGS += "-Wno-error=stringop-overflow= -Wno-error=stringop-truncation -Wno-error=format-truncation="
 LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
 
 do_install_append() {
-    cp -av --no-preserve=ownership ${B}/lib/.libs/*.so* ${D}${libdir}
     rm -fr "${D}${localstatedir}/lock"
     rm -fr "${D}${localstatedir}/run"
     rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
@@ -61,7 +60,8 @@ do_install_append() {
     fi
 }
 
-FILES_${PN} += "${systemd_unitdir}/system/*.service"
+FILES_${PN} += "${libdir}/libSa*.so ${systemd_unitdir}/system/*.service"
+FILES_${PN}-dev += "${libdir}/libopensaf_core.so"
 FILES_${PN}-staticdev += "${PKGLIBDIR}/*.a"
 
 INSANE_SKIP_${PN} = "dev-so"
@@ -70,3 +70,5 @@ RDEPENDS_${PN} += "bash python"
 
 # http://errors.yoctoproject.org/Errors/Details/186970/
 COMPATIBLE_HOST_libc-musl = 'null'
+
+FILES_SOLIBSDEV = ""
-- 
2.23.0


