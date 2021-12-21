Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5458EC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 21:49:09 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.11636.1640123348286674774
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 13:49:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FyQIGkXV;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: claus.stovgaard@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id by39so521019ljb.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 13:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qTEoihkgNR4tc6SGzlxNEAJhXOhqIPIeW0bSgKXynxk=;
        b=FyQIGkXVZCfLnMPtV8MO2RL0X+HKsuEnYP2L3CsUz/DtC9N7zhyqUaNL7bLKP3eJpQ
         cpHYr//hA9EgnNXwBVQu8She+RZ8LEDznsA2Wv3zDBWmcEI1Pky94RzBRENjPZI6G2ww
         9+QZCyKeL7RsmjTMHbrmhFzszTiCxwF/9q7ABDY8kdpVDfv6HuAGO46SK3w1cNbatmn2
         TrnIrGivd2qhzR3JfzuctewaYD4xtDS92D1btoPJkp15aAHVo140cUFOgJMPcTwxlqHx
         c4j1gX6XmFpWXDWMllgt/7iAE9vGP6r5A7jfBCVKXWy3VDnRkT6TentfAkA4oprxlfVm
         YNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qTEoihkgNR4tc6SGzlxNEAJhXOhqIPIeW0bSgKXynxk=;
        b=dUZWFJCMeMOK04VhDez8BRc7Avpl0Om8eYntUzmmlpbLXHXqGVhi324IpTilWTzPNz
         4c0wnGKECu9/zx6Jx1Iju7VwkdQWQ3Ks1gTNnGkYBK/8TofpVkGrY4ea+KNsPGuTy1pq
         RPG+c/Yjf3WptetcLn7lo0F2rVqS/1drYPQMtTqRHlUn0Cq/rG1C68un4I3zmApZEG3B
         8KuJQUUPyJfBxZVEfRTKNtR7k8JBZTnS8GMdDZQfW8AMs/+VfjpkWRxlzgpT9H87tpA/
         GsI54YnxAwjDaK5ZAUNqoUg+VJNAXibPTUxv0mQxLXWQD8Cx49sh5eb1Q1fQWjMj5imY
         S8lg==
X-Gm-Message-State: AOAM531im7DS49PYOldMMwFRQEm+GL4EonTwHLA8jWE8KrjqsJi9yeQi
	uTzhZjLVmYis8OB3KqZoF3TEo+6TwFj3Hg==
X-Google-Smtp-Source: 
 ABdhPJzniWtv/HpiLj8PfTGHEDIilVe17nqsQDGnFn6Mel1pshAbsydVu5qxEevd8peeP8seGlJSfw==
X-Received: by 2002:a2e:a786:: with SMTP id c6mr229150ljf.161.1640123346413;
        Tue, 21 Dec 2021 13:49:06 -0800 (PST)
Received: from nova.home (2-108-107-206-static.dk.customer.tdc.net.
 [2.108.107.206])
        by smtp.gmail.com with ESMTPSA id
 c13sm19373lfv.293.2021.12.21.13.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 13:49:06 -0800 (PST)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Claus Stovgaard <clst@ambu.com>
Subject: [meta-oe][PATCH] Add gutenprint to meta-oe
Date: Tue, 21 Dec 2021 22:49:03 +0100
Message-Id: <20211221214903.1882008-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Dec 2021 21:49:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94469

From: Claus Stovgaard <clst@ambu.com>

According to wiki more than 1300 printer drivers.
Specifically the CUPS dye-sublimation backend, used in industrial and
medical is a nice fit when using Yocto for embedded solutions targeting
this segment.

As the gutenprint code generate a tool for string management, the native
recipe is designed to just create the output from this tool (a header
file). So the cross compatible version is depending on native version.

Thought about using BBCLASSEXTEND instead of separate files. Though as
the purpose of the two recipes is different (one for generating header
file, the other for generating the actual lib) and different
dependencies I decided to keep it as two recipes.

Signed-off-by: Claus Stovgaard <clst@ambu.com>
---
 .../gutenprint/gutenprint-native_git.bb       | 42 +++++++++++++++++
 .../gutenprint/gutenprint.inc                 | 22 +++++++++
 .../gutenprint/gutenprint_git.bb              | 46 +++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint-native_git.bb
 create mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint.inc
 create mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint_git.bb

diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint-native_git.bb b/meta-oe/recipes-printing/gutenprint/gutenprint-native_git.bb
new file mode 100644
index 000000000..c6e00c340
--- /dev/null
+++ b/meta-oe/recipes-printing/gutenprint/gutenprint-native_git.bb
@@ -0,0 +1,42 @@
+# Recipe for building gutenprint-native
+#
+# Native part is for generating strings - xmli18n-tmp.h used by target recipe
+# We don't depend on cups as this is for generating the string header.
+#
+# Copyright (c) Ambu A/S - All rights reserved
+# SPDX-License-Identifier: MIT
+#
+# Author(s)
+#   clst@ambu.com (Claus Stovgaard)
+#
+
+require gutenprint.inc
+
+# We could consider switching to BBCLASSEXTEND native instead of inherit
+# Using devtool with this results in warning, as devtool append externalsrc to
+# inheritance, making native not being inherited last.
+inherit autotools-brokensep pkgconfig native
+
+SECTION = "libs"
+
+# binutils is for xz etc.
+# gettext-native for configuration
+# flex-native is used for compilation
+# byacc-native is for yacc command (compilation)
+DEPENDS += "binutils-native gettext-native flex-native byacc-native"
+
+EXTRA_OECONF = "--without-doc --without-cups"
+
+# gutenprint does not have a configure file in its root folder.
+# Rather it has a autogen.sh in its root folder. We just use it
+do_configure() {
+    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
+    oe_runconf
+}
+
+# Currently we only uses the string header, even though we compile the complete
+# native version of the library. So we limit the install to the needed.
+do_install() {
+    install -d ${D}${datadir}/gutenprint/
+    install -m644 ${B}/src/xml/xmli18n-tmp.h ${D}${datadir}/gutenprint/
+}
\ No newline at end of file
diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint.inc b/meta-oe/recipes-printing/gutenprint/gutenprint.inc
new file mode 100644
index 000000000..0a162d2b5
--- /dev/null
+++ b/meta-oe/recipes-printing/gutenprint/gutenprint.inc
@@ -0,0 +1,22 @@
+# common part for gutenprint-native / gutenprint
+#
+# As we are using the native part for generating string header to the target
+# version, it is important they use the same version.
+# So we set the SRC_URI and SRCREV here.
+#
+# Copyright (c) Ambu A/S - All rights reserved
+# SPDX-License-Identifier: MIT
+#
+# Author(s)
+#   clst@ambu.com (Claus Stovgaard)
+#
+
+DESCRIPTION = "Gutenprint printer drivers"
+HOMEPAGE = "http://gimp-print.sourceforge.net/"
+LICENSE = "GPLv2+"
+
+SRC_URI = "git://git.code.sf.net/p/gimp-print/source;protocol=https;branch=master"
+SRCREV = "8e47dc44dd7738302ba9e8fbc1f918461fed0236"
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
\ No newline at end of file
diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_git.bb b/meta-oe/recipes-printing/gutenprint/gutenprint_git.bb
new file mode 100644
index 000000000..777979394
--- /dev/null
+++ b/meta-oe/recipes-printing/gutenprint/gutenprint_git.bb
@@ -0,0 +1,46 @@
+# Recipe for building gutenprint
+#
+# Uses the gutenprint-native extracted strings and disable local build stuff
+#
+# Copyright (c) Ambu A/S - All rights reserved
+# SPDX-License-Identifier: MIT
+#
+# Author(s)
+#   clst@ambu.com (Claus Stovgaard)
+#
+
+require gutenprint.inc
+
+inherit autotools-brokensep pkgconfig
+
+DEPENDS += "cups gutenprint-native"
+
+# cups-genppdupdate depend on perl
+# We also set the path to PERL as else the version in hosttools would be used
+# with full path
+RDEPENDS:${PN} = "perl "
+
+EXTRA_OECONF = "--without-doc --disable-test --disable-nls PERL=/usr/bin/perl"
+
+# gutenprint does not have a configure file in its root folder.
+# Rather it has a autogen.sh in its root folder. We just use it
+# together with adapting for cross compilation
+do_configure() {
+    # Disable the xmli18n-tmp.h rule
+    # It depend on the local build extract-strings, we are not able to run this
+    # So we are using the xmli18n-tmp.h created by gutenprint-native
+    sed -i 's/all-local: xmli18n-tmp.h xml-stamp/all-local: xml-stamp/'  ${S}/src/xml/Makefile.am
+    sed -i 's/dist-hook: xmli18n-tmp.h xml-stamp/dist-hook: xml-stamp/'  ${S}/src/xml/Makefile.am
+    cp ${RECIPE_SYSROOT_NATIVE}${datadir}/gutenprint/xmli18n-tmp.h ${S}/src/xml/
+
+    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
+    oe_runconf
+}
+
+# gutenprint install the calibrate.ppm and net.sf.gimp-print.usb-quirks in
+# /usr/share/cups
+FILES:${PN} += "${datadir}/cups/*"
+
+# Install in /etc/cups when RPM needs DIRFILES to not conflict
+# https://stackoverflow.com/questions/44762430/why-do-i-get-etc-cups-conflicts-between-attempted-installs-in-yocto
+DIRFILES = "1"
\ No newline at end of file
-- 
2.25.1


