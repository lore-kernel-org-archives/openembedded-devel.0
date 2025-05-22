Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A12C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:50:39 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.22960.1747918233151938210
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 05:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=SeDV4JRG;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5568355ffso716229185a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747918231; x=1748523031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AA6tG5ecxdDc6qnfzbXwgk7YB+Tk4LpTIgCMD1uQHow=;
        b=SeDV4JRGCwbUmXGzKt0QlII8bIYLUMZKZ7jpy922nMBO5eWn5DbktioBcPL8yJW2+C
         J2nlqu0j188p7s5iqtrTdXXdhW20UUu583R2AWwS5EZ8LJzGzPKWVA1Msp5EtxGoWruF
         qED6Y1BWn5TN3VdJc21Ky44vQHQ2czaBf2U62W1t/vRMflyN3exmJp0bLqNS/pxev9Ol
         luXBLXGfmpyvaJbGPe3JHsutOzhAI9+eppT4quc8soAPOZqr9ZMNaK6w9PmkmcY54Ayw
         /f3XQmYasCaDzMHHeWjnvfrdn7k/WTgY7d1iQzBH7YMnAw2j8jzHp1SKs/+KmP/IHeq7
         bkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918231; x=1748523031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AA6tG5ecxdDc6qnfzbXwgk7YB+Tk4LpTIgCMD1uQHow=;
        b=P9ZyvwdJEuvzAL8PxOUnT5HBYpSmmxxcafB5Yk56Zv3BQbr0I3Bo9Qova98CMviC4B
         i/EW2SNfecSG5I9bB0zF5hr+xXdlZsl9Fl8tvayMuos3/hdu8IzkKCCFsoM85VXx7hLN
         Ac3lEOP5Y/vG/VeQnsEK7PfI61j3TtUDNI/jyrNtzylKrEupsOWzViQPD/f31WXhzhwq
         SYQCO2tWh95pc/BmEasy7UcDdgHlhspEm9qMN82AD+dgicQIU5ECeYrMJ3kf/Tdhw3xa
         F7lmdVIjl7CNaxHh5jhGKBfEM5FXJc6aCK/ByUFtftakVnbaLrbXhGA15s36FUpVkfy6
         2L/Q==
X-Gm-Message-State: AOJu0YwcyPvbkZ8OI8vaTReFfhfCWCyONjhSdaV24EqYiRuAx0XnP1Yf
	aRHDxAuNQm4AoEHtiidLjoeBbXUVOCzGc9+eURB+klEpPsyzoHAWjOS92N5zd0z/MZ/lZdjp1gs
	tatCPRxQ=
X-Gm-Gg: ASbGncuGj6YQ09qNDM97FUUrETLtF1139CrN7VhinhUlyomTXa7A0naQrQUJTJ2PPuh
	jtd5AjhGadMA56UamRQePbtu7EK1GfmlJ6ntdIKQomrv11UdhUw99dEiUhwtVqvsqwPtto4skco
	EBbE0Sk3H9qKlu3wlfxvC9UoI3OaEHlOIYS61SVHEeQtIHw0SyHlBoRTfTqjMkuxSP0HEY/T27z
	ykk2olkOxvn131SekkD+LnMGJGM6zDXDj40EZNIlPwbqFcR8qMxe8NDmxUHHt0xHvlL4V2GdN9h
	WxWnjOeoFJixHHUBRUz1h5y3HULOjOJ8g9cwbgv6SsycmNCu+4+7749FdNFYe4X5HFOssmT6fkJ
	+bc0Y3PL7lB8=
X-Google-Smtp-Source: AGHT+IEyEfPAkOR2dZse03YL0JAcJgtIeeWbTaGcy8d1zOQM8lC8qAxV2gNHuuoQ+Lb32ApPEhudBA==
X-Received: by 2002:a05:620a:4248:b0:7c5:94e0:cafb with SMTP id af79cd13be357-7cd467ac226mr4129000385a.48.1747918231569;
        Thu, 22 May 2025 05:50:31 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468cc89fsm1015782485a.105.2025.05.22.05.50.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:50:31 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] distutils: remove classes
Date: Thu, 22 May 2025 08:50:29 -0400
Message-Id: <20250522125029.754490-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 12:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117592

distutils is no longer in Python as of 3.12. Nothing seems to be using
these classes in the layer, so remove them.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../classes/distutils-common-base.bbclass     | 28 --------
 meta-python/classes/distutils3-base.bbclass   |  9 ---
 meta-python/classes/distutils3.bbclass        | 71 -------------------
 3 files changed, 108 deletions(-)
 delete mode 100644 meta-python/classes/distutils-common-base.bbclass
 delete mode 100644 meta-python/classes/distutils3-base.bbclass
 delete mode 100644 meta-python/classes/distutils3.bbclass

diff --git a/meta-python/classes/distutils-common-base.bbclass b/meta-python/classes/distutils-common-base.bbclass
deleted file mode 100644
index 59c750a3cf..0000000000
--- a/meta-python/classes/distutils-common-base.bbclass
+++ /dev/null
@@ -1,28 +0,0 @@
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
-# LDSHARED is the ld *command* used to create shared library
-export LDSHARED  = "${CCLD} -shared"
-# LDXXSHARED is the ld *command* used to create shared library of C++
-# objects
-export LDCXXSHARED  = "${CXX} -shared"
-# CCSHARED are the C *flags* used to create objects to go into a shared
-# library (module)
-export CCSHARED  = "-fPIC -DPIC"
-# LINKFORSHARED are the flags passed to the $(CC) command that links
-# the python executable
-export LINKFORSHARED = "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
-
-FILES:${PN} += "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
-
-FILES:${PN}-staticdev += "\
-  ${PYTHON_SITEPACKAGES_DIR}/*.a \
-"
-FILES:${PN}-dev += "\
-  ${datadir}/pkgconfig \
-  ${libdir}/pkgconfig \
-  ${PYTHON_SITEPACKAGES_DIR}/*.la \
-"
-python __anonymous() {
-    bb.warn("distutils-common-base.bbclass is deprecated, please use setuptools3-base.bbclass instead")
-}
diff --git a/meta-python/classes/distutils3-base.bbclass b/meta-python/classes/distutils3-base.bbclass
deleted file mode 100644
index d36b4c4a3e..0000000000
--- a/meta-python/classes/distutils3-base.bbclass
+++ /dev/null
@@ -1,9 +0,0 @@
-DEPENDS:append:class-target = " python3-native python3"
-DEPENDS:append:class-nativesdk = " python3-native python3"
-RDEPENDS:${PN} += "${@['', 'python3-core']['${CLASSOVERRIDE}' == 'class-target']}"
-
-inherit distutils-common-base python3native python3targetconfig
-
-python __anonymous() {
-    bb.warn("distutils3-base.bbclass is deprecated, please use setuptools3-base.bbclass instead")
-}
diff --git a/meta-python/classes/distutils3.bbclass b/meta-python/classes/distutils3.bbclass
deleted file mode 100644
index 909415efa0..0000000000
--- a/meta-python/classes/distutils3.bbclass
+++ /dev/null
@@ -1,71 +0,0 @@
-inherit distutils3-base
-
-B = "${WORKDIR}/build"
-distutils_do_configure[cleandirs] = "${B}"
-
-DISTUTILS_BUILD_ARGS ?= ""
-DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
-    --prefix=${prefix} \
-    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=${datadir}"
-
-DISTUTILS_PYTHON = "python3"
-DISTUTILS_PYTHON:class-native = "nativepython3"
-
-DISTUTILS_SETUP_PATH ?= "${S}"
-
-python __anonymous() {
-    bb.warn("distutils3.bbclass is deprecated, please use setuptools3.bbclass instead")
-}
-
-distutils3_do_configure() {
-    :
-}
-
-distutils3_do_compile() {
-        cd ${DISTUTILS_SETUP_PATH}
-        NO_FETCH_BUILD=1 \
-        STAGING_INCDIR=${STAGING_INCDIR} \
-        STAGING_LIBDIR=${STAGING_LIBDIR} \
-        ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py \
-        build --build-base=${B} ${DISTUTILS_BUILD_ARGS} || \
-        bbfatal_log "'python3 setup.py build ${DISTUTILS_BUILD_ARGS}' execution failed."
-}
-distutils3_do_compile[vardepsexclude] = "MACHINE"
-
-distutils3_do_install() {
-        cd ${DISTUTILS_SETUP_PATH}
-        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-        STAGING_INCDIR=${STAGING_INCDIR} \
-        STAGING_LIBDIR=${STAGING_LIBDIR} \
-        PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
-        ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py \
-        build --build-base=${B} install --skip-build ${DISTUTILS_INSTALL_ARGS} || \
-        bbfatal_log "'python3 setup.py install ${DISTUTILS_INSTALL_ARGS}' execution failed."
-
-        # support filenames with *spaces*
-        find ${D} -name "*.py" -exec grep -q ${D} {} \; \
-                               -exec sed -i -e s:${D}::g {} \;
-
-        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
-            if [ -f "$i" ]; then
-                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
-                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
-            fi
-        done
-
-        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
-
-        #
-        # FIXME: Bandaid against wrong datadir computation
-        #
-        if [ -e ${D}${datadir}/share ]; then
-            mv -f ${D}${datadir}/share/* ${D}${datadir}/
-            rmdir ${D}${datadir}/share
-        fi
-}
-distutils3_do_install[vardepsexclude] = "MACHINE"
-
-EXPORT_FUNCTIONS do_configure do_compile do_install
-
-export LDSHARED="${CCLD} -shared"
-- 
2.39.5


