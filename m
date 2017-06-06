Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3502B78071
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jun 2017 14:50:39 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id a70so4994515pge.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jun 2017 07:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=paUisDBY63U94anT0fwf6c6HSmbklUWfTOTyCwvANEY=;
	b=qh/fqUXYN++oYE3x1sIDO2t0BV16ogUacxbKGDO1yKP3QMMDMijoZTuo7F2+z7cIDZ
	wHWk5EX51229UiBxEaG5dPfRCED6rtfzp/tGouxx4D4xzmKjr68ZLTRx/NC7GX9D5E9I
	SdtjsNtDYEekTBcamm36sU4h4/IDKySrCC7GQsKywGBH0vHXW1zzfxkQQ3cu73XnV7jl
	6DuccsxOiVOrKbmWKkoSH1QT9tx+9FE8BRkuTd3fSp1HHmRUqG2I2+A920hHIpDmUyd4
	J95DESwxBxLHcNXJk9dboGIQW1RxFIb1IQi4nbwVmLS8DtAVjlJ2STfXERN6489ttAut
	gWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=paUisDBY63U94anT0fwf6c6HSmbklUWfTOTyCwvANEY=;
	b=X8UCZNv+PbeuzRKo5hsU1EQAW1FtaPw5xzd3Jryqoz5W5dfBd8706Fs5w06/UeU7JD
	y2uxXeS9SBZA9j/4LyPrcRype2HnSiaGdgRiJSWNpfCnVwX3oBbGqqu9OwgGF7jXbHVU
	TxnB/VX9cNrfm+9B1wt+7FjqjIk76JaVK+3dNzMpIU2lV09hrTD518ZqxGHUu9es417P
	L7Js+xPwe7orCUa3RIp5mN971+leoZhELtIwPO9pGGkJRPiyw75aBd8pKD8RAhGUgtRS
	XfOkoDXdrb/2JMP+VT6z1+1+Q9pOjuoCJTz0BedfILT4pAElGqmJKSgFw4lhsKHfLaTH
	ubJg==
X-Gm-Message-State: AODbwcA3CX0zd0c4iwAA89xIZivsHXMxWh/3BXuCzD62bccMmeuV0SgT
	yjRlf01jyAu0jIFH
X-Received: by 10.99.165.78 with SMTP id r14mr5559927pgu.74.1496760640754;
	Tue, 06 Jun 2017 07:50:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::748])
	by smtp.gmail.com with ESMTPSA id
	p89sm64412683pfk.67.2017.06.06.07.50.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jun 2017 07:50:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jun 2017 07:50:25 -0700
Message-Id: <20170606145026.4204-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170606145026.4204-1-raj.khem@gmail.com>
References: <20170606145026.4204-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] konkretcmpi: Update and fix build with latest oe-core
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
X-List-Received-Date: Tue, 06 Jun 2017 14:50:40 -0000

Drop already upstreamed patch
Use bbclassextend for deriving native recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../konkretcmpi/konkretcmpi-native_0.9.2.bb        | 28 ----------------------
 .../konkretcmpi/konkretcmpi_0.9.2.bb               |  6 ++++-
 2 files changed, 5 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.2.bb

diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.2.bb b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.2.bb
deleted file mode 100644
index 9b2ace9c4..000000000
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi-native_0.9.2.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "Tool for rapid CMPI providers development"
-DESCRIPTION = "\
-KonkretCMPI makes CMPI provider development easier by generating type-safe \
-concrete CIM interfaces from MOF definitions and by providing default \
-implementations for many of the provider operations."
-HOMEPAGE = "https://github.com/rnovacek/konkretcmpi"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f673270bfc350d9ce1efc8724c6c1873"
-DEPENDS = "cmake-native cmpi-bindings-native"
-
-SRC_URI = "git://github.com/rnovacek/konkretcmpi.git \
-           file://konkretcmpi-0.9.2-fix-returning-instance-from-method.patch \
-           file://0001-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch "
-
-SRCREV = "460e6421c16a8216d29ccd1b7490f814dab8b769"
-S = "${WORKDIR}/git"
-
-inherit native cmake
-LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-
-EXTRA_OECMAKE = "-DWITH_PYTHON=ON \
-                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
-                "
-
-do_install_append() {
-    rm -rf ${D}${datadir}
-}
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
index 4e4aa6cde..cbf04734e 100644
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
@@ -6,7 +6,8 @@ implementations for many of the provider operations."
 HOMEPAGE = "https://github.com/rnovacek/konkretcmpi"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f673270bfc350d9ce1efc8724c6c1873"
-DEPENDS = "swig-native sblim-cmpi-devel python"
+DEPENDS_append_class-target = " swig-native sblim-cmpi-devel python"
+DEPENDS_append_class-native = " cmpi-bindings-native"
 
 SRC_URI = "git://github.com/rnovacek/konkretcmpi.git \
            file://0001-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch \
@@ -23,6 +24,8 @@ EXTRA_OECMAKE = "-DWITH_PYTHON=ON \
                  ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
                 "
 
+LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+
 do_install_append() {
     rm -rf ${D}${datadir}
 }
@@ -32,3 +35,4 @@ PACKAGES =+ "${PN}-python ${PN}-python-dbg"
 FILES_${PN}-python = "${libdir}/python2.7/site-packages/konkretmof.py* ${libdir}/python2.7/site-packages/_konkretmof.so"
 FILES_${PN}-python-dbg = "${libdir}/python2.7/site-packages/.debug/*"
 
+BBCLASSEXTEND = "native"
-- 
2.13.0


