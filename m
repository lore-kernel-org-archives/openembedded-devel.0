Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id C6A54607A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 18:31:21 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id y62so106055726pgy.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 10:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=peKSkEd/aghy9/crFNZlCLRXpSgavrneiSGLQeg374s=;
	b=D/F+Pcg5prtl3luctCzESCzHKYK4VeIWbk4gYIGyU88025VdzPCDkwftOBvFV2OXYU
	fXcWoUxN4hPy9OSBl66/l68cJGFjZMdfWU7XKZE7yy3isnUK/1A53G9q2VPJwogPSBPr
	OfZuyZmnmD5npVClADq31M1Xi1WoDTx1Iy3ERWak+gfjyhwhv7qSSBanDE3drNGXdclx
	irPBfGqjojXkNz87iRJavba9rB9B8gzOMirVuxQZfXknj4qki84EwYHGJDouUjwic07p
	aAkX6QN++MADo6rsGY03/b5RJsOWNNu3/XhyJ4vCjZCAgaorcAqcpFQFs0fBYKAt/SUg
	9ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=peKSkEd/aghy9/crFNZlCLRXpSgavrneiSGLQeg374s=;
	b=tc7K5Mej+M8VishNjx/OpTbpqPRCJXtfZE0OV+ujyLC6w+m9aCBDLjxHk5iWc/Q4k+
	n/1zZarMBUUBYehL13RtZD3vcCfEBPscZiQpozzWw3tWBVC0rei65Z31+/vW/rSwiNJs
	RKigGNeWhZG62ixzyE7td0/ra8k0woQ+mNwaK5w9QEBLE7hT3+0PsfOmjS0iOHeaDA6r
	FCOTeqbF0hEf06cV8p4IFVtameNOQZmutczSiI1Ar4+nH4At9xLMoso0+ll/fmShnAgA
	j6mVWXYlbe7u+2+AkTa63fxb/47ciAsKiCDrlQR+6LGhvDfezFa5cU+YmG1xkSn/NgQk
	oFSA==
X-Gm-Message-State: AIkVDXIZ7V0TTZV62IgLPpfpe2qOI0mR9a+INXyEaw1746U+ycRHwuiX5a3ZOSIwGS6Y25Qc
X-Received: by 10.84.241.66 with SMTP id u2mr80262497plm.107.1482949883366;
	Wed, 28 Dec 2016 10:31:23 -0800 (PST)
Received: from tyrael.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	c64sm54726536pfa.91.2016.12.28.10.31.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Dec 2016 10:31:22 -0800 (PST)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Dec 2016 10:31:08 -0800
Message-Id: <1482949868-19842-1-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
Cc: mdf@kernel.org, philip@opensdr.com
Subject: [PATCH] devtools: Add recipe for Chromium Embedded Controller utilities
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
X-List-Received-Date: Wed, 28 Dec 2016 18:31:23 -0000

Add a recipe to build 'ectool', a utility to interact with the embedded
controller on Google's Chromebooks (and other platforms using it).

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 .../chromium-utils/chromium-utils.bb               | 26 ++++++++++++++++++++++
 .../0001-build-Add-HOST_LDFLAGS.patch              | 26 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/chromium-utils/chromium-utils.bb
 create mode 100644 meta/recipes-devtools/chromium-utils/chromium-utils/0001-build-Add-HOST_LDFLAGS.patch

diff --git a/meta/recipes-devtools/chromium-utils/chromium-utils.bb b/meta/recipes-devtools/chromium-utils/chromium-utils.bb
new file mode 100644
index 0000000..c351717
--- /dev/null
+++ b/meta/recipes-devtools/chromium-utils/chromium-utils.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Chromium EC utilities"
+DEPENDS = "libftdi"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=562c740877935f40b262db8af30bca36"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"
+
+SRCREV = "b19bb1f22a3fd0102030485d324c0321a18827e8"
+SRC_URI = "git://chromium.googlesource.com/chromiumos/platform/ec;protocol=https \
+           file://0001-build-Add-HOST_LDFLAGS.patch \
+	  "
+
+PV="1.1.9999-${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+	oe_runmake HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS}" HOST_LDFLAGS="${LDFLAGS}" utils
+}
+
+do_install() {
+	install -m 0755 -d ${D}${bindir}
+	install -m 0755 ${S}/build/bds/util/ectool ${D}${bindir}/ectool
+}
+
+FILES_${PN} = "${bindir}"
diff --git a/meta/recipes-devtools/chromium-utils/chromium-utils/0001-build-Add-HOST_LDFLAGS.patch b/meta/recipes-devtools/chromium-utils/chromium-utils/0001-build-Add-HOST_LDFLAGS.patch
new file mode 100644
index 0000000..46e8cad
--- /dev/null
+++ b/meta/recipes-devtools/chromium-utils/chromium-utils/0001-build-Add-HOST_LDFLAGS.patch
@@ -0,0 +1,26 @@
+From 56ffeeffea735a6a8f69fc111278ebabe3c7e2d8 Mon Sep 17 00:00:00 2001
+From: Moritz Fischer <moritz.fischer@ettus.com>
+Date: Tue, 27 Dec 2016 22:24:07 -0800
+Subject: [PATCH] build Add HOST_LDFLAGS
+
+Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
+---
+ Makefile.rules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.rules b/Makefile.rules
+index 404454d..0057ba9 100644
+--- a/Makefile.rules
++++ b/Makefile.rules
+@@ -60,7 +60,7 @@ cmd_c_to_build = $(BUILDCC) $(BUILD_CFLAGS) \
+ 	         $(sort $(foreach c,$($(*F)-objs),util/$(c:%.o=%.c)) $*.c) \
+ 	         $(BUILD_LDFLAGS) \
+ 	         -MMD -MF $@.d -o $@
+-cmd_c_to_host = $(HOSTCC) $(HOST_CFLAGS) -MMD -MF $@.d  -o $@ \
++cmd_c_to_host = $(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) -MMD -MF $@.d  -o $@ \
+ 	         $(sort $(foreach c,$($(*F)-objs),util/$(c:%.o=%.c)) $*.c)
+ cmd_cxx_to_host = $(HOSTCXX) -std=c++0x $(COMMON_WARN) $(HOST_CXXFLAGS)\
+ 	-I ./$($(notdir $@)_ROOT) -o $@ $(filter %.cc,$^) $($(notdir $@)_LIBS)
+-- 
+2.4.11
+
-- 
2.7.4


