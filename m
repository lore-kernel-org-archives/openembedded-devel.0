Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781C7CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=DfPyWNGr;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628673; x=1790164673;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oxRMss0baKfr+J42Hi+Zy8HFywzxf+cGTvE5KoFLQu0=;
  b=DfPyWNGrvQvaiE1+UCSxfBIwPdF3DGciVCRZ9bf5bvsbcOvI88evTAub
   JioeHkhkyTFr7FN35eYjlU5ZyCT3eZgEYaBGaKegZGTByUa4x9dQbZW6P
   8vI7n+Fdrl2TuCIISj+BgjobFn1kRl/2YI3H3RJw3+m7aZoebTZpgYmjU
   TsVcPaPchGZgkWlA2xHzPJcbEr683Z1dC90NWz7aURl4fQJoZK4TchnyW
   IjgCld/ndLeG9c47mzTrbSn6UAmAkZ4tXdh7ctG0O+VdEyrNQMOwUoTKV
   eov/mMRqmZ4Pesnwupxhd0I63C9kF42dR0RXMIBiWbG9fCcItHmXgW4fg
   g==;
X-CSE-ConnectionGUID: e8eZDK0HRGacUF1Jcwm5Qw==
X-CSE-MsgGUID: IuNsARWcSOmzwMGghT7hQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821783"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821783"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:53 -0700
X-CSE-ConnectionGUID: cMgx7/dFQJqhdZiY9LFgGA==
X-CSE-MsgGUID: g61x517nToKvERhf6Z/Bfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875177"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:52 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 08/24] gutenprint: fix a build race-condition
Date: Tue, 23 Sep 2025 19:57:11 +0800
Message-ID: <c85ecb6a4393cddfc0208ca36a90cd75b0d82166.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119697

From: Yoann Congal <yoann.congal@smile.fr>

Gutenprint install hooks run in parallel but depend on each other. This
is a race condition and might trigger a build failure (e.g on AB [0]):
| chmod 700 $WORKDIR/image/usr/libexec/cups/backend/backend_gutenprint
| chmod: cannot access '$WORKDIR/image/usr/libexec/cups/backend/backend_gutenprint': Not a directory
| make[5]: *** [Makefile:2166: install-exec-hook] Error 1

Fixes this by adding an explicit dependency between the dependent
targets.

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/46/steps/33/logs/stdio

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...-race-condition-around-empty-directo.patch | 60 +++++++++++++++++++
 .../gutenprint/gutenprint_5.3.4.bb            |  4 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint/0001-cups-fix-a-build-race-condition-around-empty-directo.patch

diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint/0001-cups-fix-a-build-race-condition-around-empty-directo.patch b/meta-oe/recipes-printing/gutenprint/gutenprint/0001-cups-fix-a-build-race-condition-around-empty-directo.patch
new file mode 100644
index 0000000000..758acfe6be
--- /dev/null
+++ b/meta-oe/recipes-printing/gutenprint/gutenprint/0001-cups-fix-a-build-race-condition-around-empty-directo.patch
@@ -0,0 +1,60 @@
+From e3b0952fe936f90cfda9cbed368fae2143b72089 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Thu, 3 Jul 2025 15:27:04 +0200
+Subject: [PATCH] cups: fix a build race-condition around empty directories
+ removal
+
+In automake, install-exec and install-data happen in parallel.
+install-exec installs executables and install-data finishes with
+install-data-hook that removes empty directories. If install-data-hook
+happen before install-exec finishes, it might remove a directory while
+it is used by the install process and make it fail.
+
+Fix this by adding an explicit dependency between install-data-hook and
+install-exec.
+
+For example, here is the log of such a failure:
+| make  install-data-hook
+|  hosttools/mkdir -p 'image/usr/libexec/cups/backend'
+| make[5]: Entering directory '$WORKDIR/build/src/cups'
+| Expect a number of "rmdir: Directory not empty" warnings
+|   /bin/bash ../../libtool   --mode=install $HOSTTOOLS/install -c backend_gutenprint '$WORKDIR/image/usr/libexec/cups/backend'
+ # Start of the install process (from install-exec)
+| These messages are harmless and should be ignored.
+...
+| rmdir $WORKDIR/image/usr/libexec/cups/backend
+ # empty /usr/libexec/cups/backend is removed (from install-data-hook)
+...
+| libtool: install: $HOSTTOOLS/install -c backend_gutenprint $WORKDIR/image/usr/libexec/cups/backend
+ # install in a non-existing directory: backend_gutenprint is installed
+ # as /usr/libexec/cups/backend (this is now a file instead of a
+ # directory)
+| make  install-exec-hook
+| make[5]: Entering directory '$WORKDIR/build/src/cups'
+| chmod 700 $WORKDIR/image/usr/libexec/cups/backend/backend_gutenprint
+| chmod: cannot access '$WORKDIR/image/usr/libexec/cups/backend/backend_gutenprint': Not a directory
+ # chmod fails because /usr/libexec/cups/backend is a file and not a
+ # directory
+| make[5]: *** [Makefile:2166: install-exec-hook] Error 1
+
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+Upstream-Status: Submitted [https://sourceforge.net/p/gimp-print/mailman/gimp-print-devel/thread/20250703164244.1120340-1-yoann.congal%40smile.fr/#msg59202153]
+---
+ src/cups/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/cups/Makefile.am b/src/cups/Makefile.am
+index 7928ee3..fe45c92 100644
+--- a/src/cups/Makefile.am
++++ b/src/cups/Makefile.am
+@@ -206,8 +206,9 @@ uninstall-local: $(INSTALL_DATA_LOCAL_DEPS) $(INSTALL_BLACKLIST)
+ 	$(RM) -f "$(DESTDIR)$(cupsdata_blacklistdir)/net.sf.gimp-print.usb-quirks"
+ 	$(RM) -f "$(DESTDIR)$(pkglibdir)/backend/gutenprint$(GUTENPRINT_MAJOR_VERSION)$(GUTENPRINT_MINOR_VERSION)+usb"
+ 
+-install-data-hook:
++install-data-hook: install-exec
+ # Remove unused directories in install tree
++# Note: it removes "exec" directories, so it must happen after install-exec.
+ 	-@echo 'Expect a number of "rmdir: Directory not empty" warnings'
+ 	-@echo 'These messages are harmless and should be ignored.'
+ 	-rmdir $(DESTDIR)$(cups_modeldir)
diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
index 5263890239..f90a123293 100644
--- a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
+++ b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
@@ -14,7 +14,9 @@ HOMEPAGE = "http://gimp-print.sourceforge.net/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRC_URI = "https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz"
+SRC_URI = "https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz \
+           file://0001-cups-fix-a-build-race-condition-around-empty-directo.patch \
+           "
 SRC_URI[sha256sum] = "db44a701d2b8e6a8931c83cec06c91226be266d23e5c189d20a39dd175f2023b"
 
 inherit autotools gettext pkgconfig

