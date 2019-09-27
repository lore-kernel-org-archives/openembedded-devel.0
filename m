Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF227D25F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2019 21:47:04 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id s1so4137681pgv.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2019 14:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A1hqHT2GS4lXFP/EM/3oYPkE+KY6Wnp3FAQ73PDxdHE=;
	b=OpfgdP2QR+PDOlUpl3QqRzBJe1pWO0UgDA8SIgHkEz3uXdzLx65hjiVQx06x89qJIr
	KuIGUKwyh+k6QvCG8d3vj9s5DoF85Pz7CiTS6AvP/JXCWpYQDy01uhsDfhB4SJsHaUdM
	38vewkMcfq5NfqdlixDAFLCS/h/vU1VsbX29rH9Cp9udVuMnmPnuXdp+5Qaf8eTHw/oO
	ww9jD/rvBQ9kT/inqkYyJy2ck2+z7fIHGExgcbWQE3onLoezjduhL4dCx5ZWVFSWbbT4
	LbjESOZ1eB0nXuYNPqTbzPE2sDE8r8hci92mDcGEf+1PidwheNje01auP1rsM4+4vp88
	WUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=A1hqHT2GS4lXFP/EM/3oYPkE+KY6Wnp3FAQ73PDxdHE=;
	b=A3YdO0gNqTh1CEtz77ZsJCkuibyXf1yupitzifmESPoe++0ZbqD+PdKVSWsgLbk8vM
	NIVLz3Z3Aqr6u3Z7CbNSazavro5WN90YDk/2YVCnh7tjiuFDA5vGdM9i5LlyoW7km5Fc
	bGaD3ireASUlW1K5A6+h7NkNSp8uXbcNSNzPEhbZHrpIg5/WP/9qGPXJxC3SiVoSFTIE
	bM6qKwcU1E/VykUim0oIkD4sDhgpkcjbCLO+bP3p3fUjIWWCCqmnntVffjIKrXu50GBx
	U05f1KLe+lysA4NKCYGr+hIT2iulXxn9OhIvpdvzLOm51nVIpKEfuyOe+fWfoEHFY3cn
	QxGw==
X-Gm-Message-State: APjAAAWiYEaWciNVHuCPUmii4pJVfvnnypat8E/CAb04UgUWeiaegZ6l
	3lfF97KiXRt8uQUDdM4p3tRKq25lfRc=
X-Google-Smtp-Source: APXvYqwO+xYAwUAopZ/qu2sP4HVVHzH3uvXN4akNupHbr8GK3GqUujT+Jo6aIAj0rAeFnZAqEW/lCw==
X-Received: by 2002:a62:cb:: with SMTP id 194mr7225189pfa.130.1569620824726;
	Fri, 27 Sep 2019 14:47:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	g20sm3352513pfo.73.2019.09.27.14.47.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 14:47:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Sep 2019 14:46:53 -0700
Message-Id: <20190927214653.2627591-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] opensaf: Fix duplicate copies of shared libs in package
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
X-List-Received-Date: Fri, 27 Sep 2019 21:47:05 -0000
Content-Transfer-Encoding: 8bit

some plugins are installed into libdir/opensaf but we were making a copy
into libdir as well, this patch changes that so the packaged files are
appearing only once

create_empty_library should be using cross compiler with linker flags,
existig code in this area is not cross compile friendly

skip dev-elf QA test since some .so are stubs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rary-Use-CC-variable-intead-of-hardc.patch | 23 +++++++++++++++++++
 .../opensaf/opensaf_5.19.07.bb                |  6 +++--
 2 files changed, 27 insertions(+), 2 deletions(-)
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
index 3df6824ff3..7ce54c3a31 100644
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
@@ -70,3 +69,6 @@ RDEPENDS_${PN} += "bash python"
 
 # http://errors.yoctoproject.org/Errors/Details/186970/
 COMPATIBLE_HOST_libc-musl = 'null'
+
+INSANE_SKIP_${PN}-dev += "dev-elf"
+
-- 
2.23.0


