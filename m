Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB4061125
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 00:32:53 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z12so1496043wmi.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 16:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=R9HQ139vLz9t7T/KwdgFlhp9NDIbfAtutRCN6vYp93s=;
	b=MnebxJooDHxjkZ/DtCdtINln3kvX+4Yzaq6Mf6eIPAfh+TrEfB18rs8/RYb6tg7XEP
	KRg2e3ELGCYBET/7IYYx0D/WdGJ0Yj2EwaJaa2sK+bP10olzk7vkcYcwFiVUi4D+IqV2
	XQw+3+SpZ9NnfulFcTrVdKi9mIz5IvtnRbziM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=R9HQ139vLz9t7T/KwdgFlhp9NDIbfAtutRCN6vYp93s=;
	b=ggDE14xtSE1ww48gYDlbCxhySQJUBLa5aSnW/IrGlV7T1gRkiNVLbzIZI51Hhskwzs
	HbYnTRkDyn4AaICuKF/0BI7hjCeaDPEyF0rsiKvNzvl/DX75DsN53vw7x+gXi2JhOSAW
	BhAqWDzPR9bFW/GsLXXoJv0Yj9ndcSVmUvSgNdyDo4byIg9pLNGB+XtmWl6MLA7/W+jw
	JZXQM8UXJtvbZmh2iNmmumGc/1djPEI3/yY5Ive2ayztQkc/1tfS4mUuGgAqZhsNQ4CS
	ezG7x/My51T5p6uPwS1x3SoZa55R3Glj4PtM5Teqk8evDqa2PBxTD97AyfSL2+X8YmLe
	LQsw==
X-Gm-Message-State: APjAAAX9nx2Ge2LRJf9bePnxEd+awPGO9FrAQ4MlbtbtZLYn+PFT5WTF
	EWT9CakPkHbIZ2aG1A46YyDBX2HCkbs1Ka4zxa6nsNJ8bfwSxqfIEvfUG0RxnfnPTjE/p7Qktvf
	q05wGCwPpxS9LwkHyb+NkgX6juy2usW2DwP40UlVeknzdvxjiTCCkiYd5S5ubLG4EM8FRSPJH59
	BGCxHzGCm1S7V7EHQa1b650sP08fOV2zE=
X-Google-Smtp-Source: APXvYqyY4zzqeYpHcHpC7A1OUDD62PzGPr+3M2Icb89VxalbjvVkGNxWr1qk6DLPqQBOvsGwj7LrYQ==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr1625022wmi.31.1582763573663; 
	Wed, 26 Feb 2020 16:32:53 -0800 (PST)
Received: from lbrmn-lnxub108.ric.broadcom.com ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	m22sm4207829wmc.41.2020.02.26.16.32.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 26 Feb 2020 16:32:52 -0800 (PST)
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Feb 2020 16:32:40 -0800
Message-Id: <20200227003240.76088-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v3 1/1] open-lldp: Add initial version 1.0.1
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
X-List-Received-Date: Thu, 27 Feb 2020 00:32:54 -0000

Open-LLDP provides a Link Layer Discovery Protocol agent that supports
DCB (Data Center Bridging). The tc utility from iproute is needed to
manipulate  traffic control settings in the kernel.

Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 .../0001-Fix-musl-libc-build-issue.patch      | 26 +++++++++
 ...-include-path-to-generated-version.h.patch | 29 ++++++++++
 ...tion-to-disable-installation-of-syst.patch | 57 +++++++++++++++++++
 .../openlldp/openlldp_1.0.1.bb                | 33 +++++++++++
 4 files changed, 145 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch
 create mode 100644 meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-include-path-to-generated-version.h.patch
 create mode 100644 meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
 create mode 100644 meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb

diff --git a/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch b/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch
new file mode 100644
index 000000000..40b082e77
--- /dev/null
+++ b/meta-networking/recipes-protocols/openlldp/files/0001-Fix-musl-libc-build-issue.patch
@@ -0,0 +1,26 @@
+From a64e52f9b58519aa2b8a1073fa6c04da04933428 Mon Sep 17 00:00:00 2001
+From: Jonathan Richardson <jonathan.richardson@broadcom.com>
+Date: Wed, 26 Feb 2020 12:16:38 -0800
+Subject: [PATCH] Fix musl libc build issue
+
+clif.h should include sys/types.h for the definition of pid_t. It fails
+to compile when using musl libc.
+
+Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
+
+---
+ include/clif.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/clif.h b/include/clif.h
+index 648eedf..92f4fd8 100644
+--- a/include/clif.h
++++ b/include/clif.h
+@@ -32,6 +32,7 @@
+ #ifndef CLIF_H
+ #define CLIF_H
+ 
++#include <sys/types.h>
+ #include <sys/un.h>
+ #include "clif_sock.h"
+ 
diff --git a/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-include-path-to-generated-version.h.patch b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-include-path-to-generated-version.h.patch
new file mode 100644
index 000000000..b58fc104d
--- /dev/null
+++ b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-include-path-to-generated-version.h.patch
@@ -0,0 +1,29 @@
+From eb14aa66dc0384071af401cced8c02993b55502e Mon Sep 17 00:00:00 2001
+From: Jonathan Richardson <jonathan.richardson@broadcom.com>
+Date: Wed, 26 Feb 2020 15:54:51 -0800
+Subject: [PATCH] autotools: Add include path to generated version.h
+
+When the build dir isn't the same as source dir it fails to compile
+because the generated version.h from AC_CONFIG_FILES is always in build
+dir. Include the path to it in AM_CPPFLAGS.
+
+Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
+
+---
+ Makefile.am | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 0fb9bb0..2952019 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -14,6 +14,9 @@ endif
+ AM_CPPFLAGS = -I${srcdir}/include -DSYSCONFDIR="\"${sysconfdir}\"" \
+ 	-D_FORTIFY_SOURCE=2
+ 
++# Required for the generated version.h when build dir is not the same as srcdir.
++AM_CPPFLAGS += -I${top_builddir}/include
++
+ ACLOCAL_AMFLAGS = -I m4
+ 
+ parse_cli.o: CFLAGS+=-U_FORTIFY_SOURCE -Wno-error
diff --git a/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
new file mode 100644
index 000000000..a26a5299a
--- /dev/null
+++ b/meta-networking/recipes-protocols/openlldp/files/0001-autotools-Add-option-to-disable-installation-of-syst.patch
@@ -0,0 +1,57 @@
+From dc3f2250908587710f109c80ddf8a94f0bc40b82 Mon Sep 17 00:00:00 2001
+From: Jonathan Richardson <jonathan.richardson@broadcom.com>
+Date: Fri, 6 Apr 2018 10:49:04 -0700
+Subject: [PATCH] autotools: Add option to disable installation of systemd conf
+ files
+
+Add option to configure.ac to enable or disable install of systemd conf
+files. If --with-systemdsystemunitdir is passed to configure then the
+files will be installed to the provided directory. If the option isn't
+provided then the value is determined from the systemd pkgconfig file,
+if found in PKG_CONFIG_PATH.
+
+This change is required because Makefile.am always installed the files
+to a hard coded path that couldn't be changed.
+
+
+Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
+---
+ Makefile.am  | 3 ++-
+ configure.ac | 9 +++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 292c0fd..0fb9bb0 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -138,8 +138,9 @@ install-data-hook:	installdirs-local
+ pkgconfigdir = ${libdir}/pkgconfig
+ pkgconfig_DATA = lldpad.pc liblldp_clif.pc
+ 
+-systemdsystemunitdir = $(prefix)/lib/systemd/system
++if HAVE_SYSTEMD
+ dist_systemdsystemunit_DATA = lldpad.service lldpad.socket
++endif
+ 
+ bashcompletiondir = $(sysconfdir)/bash_completion.d
+ dist_bashcompletion_DATA = contrib/bash_completion/lldpad contrib/bash_completion/lldptool
+diff --git a/configure.ac b/configure.ac
+index 0667446..f75f433 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -95,6 +95,15 @@ AC_TYPE_UINT16_T
+ AC_TYPE_UINT32_T
+ AC_TYPE_UINT8_T
+ 
++# Support for systemd unit files.
++AC_ARG_WITH([systemdsystemunitdir],
++        AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [Directory for systemd service files]),
++        [], [with_systemdsystemunitdir=$($PKG_CONFIG --variable=systemdsystemunitdir systemd)])
++if test "x$with_systemdsystemunitdir" != xno; then
++        AC_SUBST([systemdsystemunitdir], [$with_systemdsystemunitdir])
++fi
++AM_CONDITIONAL(HAVE_SYSTEMD, [test -n "$with_systemdsystemunitdir" -a "x$with_systemdsystemunitdir" != xno ])
++
+ AC_CONFIG_FILES([Makefile include/version.h lldpad.spec lldpad.pc liblldp_clif.pc])
+ AC_CONFIG_MACRO_DIR([m4])
+ AC_OUTPUT
diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb b/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
new file mode 100644
index 000000000..5fbf0645e
--- /dev/null
+++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.0.1.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Open-LLDP"
+DESCRIPTION = "Link Layer Discovery Protocol for Linux that includes support for DCBX"
+HOMEPAGE = "http://open-lldp.org/start"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8c2bc283e65df398ced5f5b747e78162"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig autotools
+inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
+
+DEPENDS = "libnl libconfig readline"
+
+SRCREV = "36d729de7ce5b56cf061d94d610cf0510154820c"
+SRC_URI = "git://github.com/intel/openlldp.git;protocol=https;branch=master \
+           file://0001-Fix-musl-libc-build-issue.patch \
+           file://0001-autotools-Add-include-path-to-generated-version.h.patch \
+           file://0001-autotools-Add-option-to-disable-installation-of-syst.patch \
+           "
+
+# Makefile.am adds -Werror to AM_CFLAGS. There are warnings so disable it.
+TARGET_CFLAGS += "-Wno-error"
+
+# Enable install of systemd conf files.
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_system_unitdir}', '', d)}"
+
+SYSTEMD_SERVICE_${PN} = "lldpad.service lldpad.socket"
+
+# To enable service at boot set to enable in local.conf.
+SYSTEMD_AUTO_ENABLE ?= "disable"
+
+RRECOMMENDS_${PN} = "iproute2-tc"
-- 
2.17.1


