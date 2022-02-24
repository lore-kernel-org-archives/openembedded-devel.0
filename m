Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1A6C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 20:21:35 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.529.1645734094782439469
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 12:21:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i5Kcs4fs;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 75so2706103pgb.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 12:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ovhe4ffNxRkWdpoDGHNJJm2lSHQEsnPfFJvVByXGPiE=;
        b=i5Kcs4fsGF3zwlB1Kb/jUgbdE64QJNeDBJIpwVITV7KSclwQu0D/NvTBBYIvjKJ4hu
         ThEJk5Xe5WI9DJuUXIGN3pXyZfvjr2RG5ykIu5zX80N2WzEYVyEnWH63bEfSNhiiGtTu
         2HJ6Bo42K39YIbUmnKdUj06Z+jN3jh0W7O1yvVQ9726bsacP3MxbLPp1Flr0YW4xanQ1
         uX41A2FN4EuuJX7EHGg0dNuB4hJtAeku8yiQt2BR8MnxGhcR+qZ0MTeR7uxWEmt1Fwwd
         UMrDl6m3yB4bCFlFIg5DcpXaQMDQIjX/qpnEMxmVbVWpHO6mC5LsdgIgmHNJfEUrf6wq
         rMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ovhe4ffNxRkWdpoDGHNJJm2lSHQEsnPfFJvVByXGPiE=;
        b=VyUCYjg8g0oWoukKXeYMb3MpEy57Ve7tP64DIl/L//9nY4LEbDdj+kQtkytod98w5m
         dGDn/QFZXLnf6TKBH7oOLUs0g1BMDq1yqIPamuc6BU4lp5zHbt567VKIpxkqPriWFmfN
         b9K6/LHWJWZsiO04a8QKaGQJOpkXYHF/4Cs6sbhZdAGRLcE9lOKRzmAU9SInhU2/YsJa
         cjdopav/upd4T4v/P6dF86nM/IFVf8dlCBTFtb8GPv19uHw/d65rTSRXQD0pIucIlUM4
         5ILhw4WOR7tNVSLHFuwg0MCM8QNW0viphHS4rwVw/nN/Cf+aJ3Cps1Dlq+uiEIXCcouN
         X9gA==
X-Gm-Message-State: AOAM533kgOfBWRe0KLlUDliF4zzlImbb3zFZKeRnOmBDo1kG58mNXU+w
	QjPetQ8fK1OYeC0l4UBy9MArw//95Ukdrg==
X-Google-Smtp-Source: 
 ABdhPJwR5ONn9SHEEZQrgTlqWJYFgdnyWkJJ7wC4lz1ZiMt1X3uN58UYK68P/Du2pPz2kN9SVZ29Sg==
X-Received: by 2002:a63:d30f:0:b0:376:a7b2:98a3 with SMTP id
 b15-20020a63d30f000000b00376a7b298a3mr189352pgg.376.1645734093666;
        Thu, 24 Feb 2022 12:21:33 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:263d:523e:139c:a040])
        by smtp.gmail.com with ESMTPSA id
 d6-20020a056a0024c600b004ecc812de56sm273548pfv.199.2022.02.24.12.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 12:21:33 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] distutils*.bbclass: move from oe-core
Date: Thu, 24 Feb 2022 12:21:29 -0800
Message-Id: <20220224202129.1885384-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 20:21:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95514

distutils has been deprecated in Python 3.10 and will be removed in
Python 3.12 (predicted release date October 2023). For now, move these
classes from oe-core to allow users to migrate.

A deprecation warning has been added to each class.

Documentation is also being dropped in oe-core, but users can refer to
3.4 documentation for the legacy variables and classes.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../classes/distutils-common-base.bbclass     | 28 ++++++++
 meta-python/classes/distutils3-base.bbclass   |  9 +++
 meta-python/classes/distutils3.bbclass        | 71 +++++++++++++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 meta-python/classes/distutils-common-base.bbclass
 create mode 100644 meta-python/classes/distutils3-base.bbclass
 create mode 100644 meta-python/classes/distutils3.bbclass

diff --git a/meta-python/classes/distutils-common-base.bbclass b/meta-python/classes/distutils-common-base.bbclass
new file mode 100644
index 0000000000..59c750a3cf
--- /dev/null
+++ b/meta-python/classes/distutils-common-base.bbclass
@@ -0,0 +1,28 @@
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+# LDSHARED is the ld *command* used to create shared library
+export LDSHARED  = "${CCLD} -shared"
+# LDXXSHARED is the ld *command* used to create shared library of C++
+# objects
+export LDCXXSHARED  = "${CXX} -shared"
+# CCSHARED are the C *flags* used to create objects to go into a shared
+# library (module)
+export CCSHARED  = "-fPIC -DPIC"
+# LINKFORSHARED are the flags passed to the $(CC) command that links
+# the python executable
+export LINKFORSHARED = "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
+
+FILES:${PN} += "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
+
+FILES:${PN}-staticdev += "\
+  ${PYTHON_SITEPACKAGES_DIR}/*.a \
+"
+FILES:${PN}-dev += "\
+  ${datadir}/pkgconfig \
+  ${libdir}/pkgconfig \
+  ${PYTHON_SITEPACKAGES_DIR}/*.la \
+"
+python __anonymous() {
+    bb.warn("distutils-common-base.bbclass is deprecated, please use setuptools3-base.bbclass instead")
+}
diff --git a/meta-python/classes/distutils3-base.bbclass b/meta-python/classes/distutils3-base.bbclass
new file mode 100644
index 0000000000..850c535bb1
--- /dev/null
+++ b/meta-python/classes/distutils3-base.bbclass
@@ -0,0 +1,9 @@
+DEPENDS:append:class-target = " ${PYTHON_PN}-native ${PYTHON_PN}"
+DEPENDS:append:class-nativesdk = " ${PYTHON_PN}-native ${PYTHON_PN}"
+RDEPENDS:${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
+
+inherit distutils-common-base python3native python3targetconfig
+
+python __anonymous() {
+    bb.warn("distutils3-base.bbclass is deprecated, please use setuptools3-base.bbclass instead")
+
diff --git a/meta-python/classes/distutils3.bbclass b/meta-python/classes/distutils3.bbclass
new file mode 100644
index 0000000000..a6d8e8763f
--- /dev/null
+++ b/meta-python/classes/distutils3.bbclass
@@ -0,0 +1,71 @@
+inherit distutils3-base
+
+B = "${WORKDIR}/build"
+distutils_do_configure[cleandirs] = "${B}"
+
+DISTUTILS_BUILD_ARGS ?= ""
+DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
+    --prefix=${prefix} \
+    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
+    --install-data=${datadir}"
+
+DISTUTILS_PYTHON = "python3"
+DISTUTILS_PYTHON:class-native = "nativepython3"
+
+DISTUTILS_SETUP_PATH ?= "${S}"
+
+python __anonymous() {
+    bb.warn("distutils3.bbclass is deprecated, please use setuptools3.bbclass instead")
+}
+
+distutils3_do_configure() {
+    :
+}
+
+distutils3_do_compile() {
+        cd ${DISTUTILS_SETUP_PATH}
+        NO_FETCH_BUILD=1 \
+        STAGING_INCDIR=${STAGING_INCDIR} \
+        STAGING_LIBDIR=${STAGING_LIBDIR} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
+        build --build-base=${B} ${DISTUTILS_BUILD_ARGS} || \
+        bbfatal_log "'${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS}' execution failed."
+}
+distutils3_do_compile[vardepsexclude] = "MACHINE"
+
+distutils3_do_install() {
+        cd ${DISTUTILS_SETUP_PATH}
+        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+        STAGING_INCDIR=${STAGING_INCDIR} \
+        STAGING_LIBDIR=${STAGING_LIBDIR} \
+        PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
+        build --build-base=${B} install --skip-build ${DISTUTILS_INSTALL_ARGS} || \
+        bbfatal_log "'${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS}' execution failed."
+
+        # support filenames with *spaces*
+        find ${D} -name "*.py" -exec grep -q ${D} {} \; \
+                               -exec sed -i -e s:${D}::g {} \;
+
+        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
+            if [ -f "$i" ]; then
+                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
+            fi
+        done
+
+        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
+
+        #
+        # FIXME: Bandaid against wrong datadir computation
+        #
+        if [ -e ${D}${datadir}/share ]; then
+            mv -f ${D}${datadir}/share/* ${D}${datadir}/
+            rmdir ${D}${datadir}/share
+        fi
+}
+distutils3_do_install[vardepsexclude] = "MACHINE"
+
+EXPORT_FUNCTIONS do_configure do_compile do_install
+
+export LDSHARED="${CCLD} -shared"
-- 
2.30.2


