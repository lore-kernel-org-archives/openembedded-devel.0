Return-Path: <daniel.diaz@linaro.org>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id 706DC747F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Oct 2018 22:56:51 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id o8-v6so4639650ybk.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2018 15:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Rb7Idra7fy+Zq2rLQpHTbl3waRmxBwOyMDI40sAm59Y=;
	b=BYz0pGG0ouEsqpW3M/MC6OfbjPtoNHM8y1naDOYwNESNgJVw8jI7ENOKz0SydeELP2
	L8h2cW13XryihJEgmzmzMmoh5Yg0dDbxRbhUSi3LdZcqLYzhLXS+J2FhCLXf06bHOA+j
	gtp3mkQ9oG3ytEveXnbfEPZk8jcfBeWEd8RWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Rb7Idra7fy+Zq2rLQpHTbl3waRmxBwOyMDI40sAm59Y=;
	b=MUVp7IszaFfNSgao8eKn3Me4cPbXYgBDnwuGGhODsIfcse9APU6+U5xeacM3ZRmc7L
	4j+CSvW/j5Z46pECQsjQpFUjFcs1L1fviNOTmLOAnmLnAXdkKRJEp8/kTEU1xcbv7Vuv
	1K2Dj4IPZGw10Kn+YE0YmQllw8aT71iKFEaZJvbwvK5roDVapAr240dHXCnVTYtL5Nhs
	w8Hcj3OKZYUIEiIB1tBq4AmVhd1Cf6OrTfmkE9OJvWI40gM4s2GalO5RWAY5Qg8lOU/A
	nT/E/1g1Qq646hXj5dbKm5we9kf5v3TUMHIineE/PhAFBHQ73PJjgl4Npe8ZuPWpKRPZ
	Bgog==
X-Gm-Message-State: ABuFfoisI9N2m4Jqr4Zq78uvT0+u7aQ0vIYW6QaI2lLnHshNspw4de75
	4nM5SJ2j7kboDMy0KpUJFldXS6FwmXOL3Q==
X-Google-Smtp-Source: ACcGV61Zd+EFI8RCXLHLVKpo5lMM2hK+rhYGRCeXNgYnclZOuJkgQoIvzcOE2dSR8YinnspNNnVBXA==
X-Received: by 2002:a25:6342:: with SMTP id
	x63-v6mr4946816ybb.198.1538693811872; 
	Thu, 04 Oct 2018 15:56:51 -0700 (PDT)
Received: from localhost.localdomain
	(CableLink-187-161-144-121.PCs.InterCable.net. [187.161.144.121])
	by smtp.googlemail.com with ESMTPSA id
	q126-v6sm2222992ywf.7.2018.10.04.15.56.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Oct 2018 15:56:50 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Oct 2018 17:56:10 -0500
Message-Id: <20181004225610.13853-1-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libhugetlbfs: Update to 2.21
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
X-List-Received-Date: Thu, 04 Oct 2018 22:56:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Version 2.21 was released on 9/17 [1]. These changes update
the recipe to use that version.

Only one of the existing patches had been merged upstream
(as e3928d57 "Force text segment alignment to 0x08000000 for
i386 with gold linker") -- the rest of them is still needed
for proper cross-compilation.

Upstream commit c3e5cb22 ("Remove bit-rotting scripts") got
rid of the Perl stuff, due to it being "massively out of
date", so the Perl bits in the recipe have gone away too.

[1] https://github.com/libhugetlbfs/libhugetlbfs/releases/tag/2.21

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 .../libhugetlbfs/libhugetlbfs_git.bb          | 20 +++++--------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 14c909e75..66fd8e21d 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -3,14 +3,14 @@ HOMEPAGE = "https://github.com/libhugetlbfs/libhugetlbfs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-DEPENDS = "sysfsutils perl"
-RDEPENDS_${PN} += "bash perl python python-io python-lang python-subprocess python-resource ${PN}-perl"
+DEPENDS = "sysfsutils"
+RDEPENDS_${PN} += "bash python python-io python-lang python-subprocess python-resource"
 RDEPENDS_${PN}-tests += "bash"
 
-PV = "2.20"
+PV = "2.21"
 PE = "1"
 
-SRCREV = "e44180072b796c0e28e53c4d01ef6279caaa2a99"
+SRCREV = "73d06e69108f231696e9c5c44f4b42690fc5d752"
 SRC_URI = " \
     git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https \
     file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
@@ -18,7 +18,6 @@ SRC_URI = " \
     file://tests-Makefile-install-static-4G-edge-testcases.patch \
     file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
     file://libhugetlbfs-elf_i386-avoid-search-host-library-path.patch \
-    file://Force-text-segment-alignment-to-0x08000000-for-i386-.patch \
     file://0001-include-stddef.h-for-ptrdiff_t.patch \
     file://0002-Mark-glibc-specific-code-so.patch \
     file://0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch \
@@ -51,14 +50,6 @@ do_configure() {
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
       sed -i 's/CUSTOM_LDSCRIPTS = yes/CUSTOM_LDSCRIPTS = no/'  Makefile
     fi
-
-    # fixup perl module directory hardcoded to perl5
-    sed -i 's/perl5/perl/g'  Makefile
-
-    # fixup to install perl module under $(LIBDIR)/perl/${@get_perl_version(d)}/TLBC
-    # to avoid below error
-    # Can't locate TLBC/OpCollect.pm in @INC
-    sed -i '/^PMDIR/ s:perl:perl/${@get_perl_version(d)}:g' Makefile
 }
 
 do_install() {
@@ -69,11 +60,10 @@ do_install() {
 }
 
 
-PACKAGES =+ "${PN}-perl ${PN}-tests "
+PACKAGES =+ "${PN}-tests "
 FILES_${PN} += "${libdir}/*.so"
 FILES_${PN}-dev = "${includedir}"
 FILES_${PN}-dbg += "${libdir}/libhugetlbfs/tests/obj32/.debug ${libdir}/libhugetlbfs/tests/obj64/.debug"
-FILES_${PN}-perl = "${libdir}/perl"
 FILES_${PN}-tests += "${libdir}/libhugetlbfs/tests"
 
 INSANE_SKIP_${PN} = "dev-so"
-- 
2.17.1


