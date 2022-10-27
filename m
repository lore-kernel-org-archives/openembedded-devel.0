Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5892C67871
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 07:26:17 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.3884.1666855567272265342
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Oct 2022 00:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ot69vn4E;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id a5so1209366edb.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 00:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tj1OwTeSLD2R1YgnEuC9K4KFVOGeGqEYmMqjUjpXll4=;
        b=ot69vn4El6FYdq++zEDjjX6UHWqwi4PHcUfdpOL82Dft6SJgTqllMdl0MkFmKu+9qo
         4zqowdsETfGMPLiqLwl3HNVIvODOF8ugqsBD5t9BFXNpF2qxA4CGzmfSZn02OqqS+8tq
         IajEu3UT9KsfrHhCLe5sy+4JN4gtlccWBPFq4c3vVX8EJGKn2Z58Xy0loCJJVkcnqhqk
         9sLkXJhDCRceGY9wOdtz7yl32zwqnolkTPrxXX1cHD7+D6DyA2tQ1HRHbZp+fn2PYNgY
         9PGvn71vcuFvg1z0RAxM9124C5dl+JgnFH/83XoAiGyKQGFARWy4egaHeqrkSQi0/5Ca
         uPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tj1OwTeSLD2R1YgnEuC9K4KFVOGeGqEYmMqjUjpXll4=;
        b=ratn+DbThZV3hmxkA2VAh6YWPhFKq0HgdPKwKcZjyZlvpPDfwkjJbMY5t+61nGrRrq
         FwnEdRsYpju0F8vj1wQYQBs8vhm/4csYpCZWU6PVFNWmZHmEkn3T/1bQFjgThev1sl2p
         4CNmw+UAq5gHHji2sLeaKoml9c4neXWIAHqVQEyUw4FigeKbVkPIDaHGUuFi56p+02m8
         rsTn4cwn7QnPESvIm/qha+q+wq64LVy4sgPHjyQfvylcsQuZP+xR9sffxotf4KjirbOp
         eUL1NCiex36HWqevKcNbDw/4LGlvoH7RTRV/4tg0NSpvGZ8WToPMD1AIDsR63Zkh0zDS
         Q8pw==
X-Gm-Message-State: ACrzQf1wULLQiur6i2Yvg0bfH7ovQ35PZAt8ruDgYrv0aUirxaC9jpzj
	Nw2EfmTvZ+gfBII6v5olOL/1IiNdYbo=
X-Google-Smtp-Source: AMsMyM68qOCVi1sGlVhZqaIO/Fbol7Wngn6OvZ+2TJyMlF6hi5TNFfMEbXvOOErRfKapgL20HPV4Uw==
X-Received: by 2002:a05:6402:1e8d:b0:454:79a9:201f with SMTP id f13-20020a0564021e8d00b0045479a9201fmr45116777edf.176.1666855565593;
        Thu, 27 Oct 2022 00:26:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id f22-20020a170906561600b0078d9c2c8250sm356238ejq.84.2022.10.27.00.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 00:26:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] sip3: remove the recipe
Date: Thu, 27 Oct 2022 09:25:47 +0200
Message-Id: <20221027072549.3525217-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 07:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99315

It is not compatible with python 3.11, and all
development on that series has ceased:
https://riverbankcomputing.com/software/sip/download

There is an actively maintained version
https://www.riverbankcomputing.com/news/SIP_v6.6.2_Released
https://pypi.org/project/sip/
but it probably needs a newly written recipe if someone has interest in it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb  | 40 -------------------
 2 files changed, 41 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index cd99fb48c..a5a033cae 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -300,7 +300,6 @@ RDEPENDS:packagegroup-meta-oe-devtools ="\
     python3-distutils-extra \
     python3-pycups \
     rapidjson \
-    sip3 \
     squashfs-tools-ng \
     uftrace \
     unifex \
diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
deleted file mode 100644
index d6335585e..000000000
--- a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "SIP is a C++/Python Wrapper Generator"
-HOMEPAGE = "https://riverbankcomputing.com/software/sip/"
-SECTION = "devel"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
-
-SRC_URI = "https://www.riverbankcomputing.com/static/Downloads/sip/${PV}/sip-${PV}.tar.gz \
-"
-SRC_URI[md5sum] = "70adc0c9734e2d9dcd241d3f931dfc74"
-SRC_URI[sha256sum] = "22ca9bcec5388114e40d4aafd7ccd0c4fe072297b628d0c5cdfa2f010c0bc7e7"
-
-inherit python3-dir python3native
-
-S = "${WORKDIR}/sip-${PV}"
-
-DEPENDS = "python3"
-
-PACKAGES += "python3-sip3"
-
-BBCLASSEXTEND = "native"
-
-CONFIGURE_SYSROOT = "${STAGING_DIR_HOST}"
-CONFIGURE_SYSROOT:class-native = "${STAGING_DIR_NATIVE}"
-
-do_configure:prepend() {
-    echo "py_platform = linux" > sip.cfg
-    echo "py_inc_dir = ${STAGING_INCDIR}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
-    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
-    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
-    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
-    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
-    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${CONFIGURE_SYSROOT} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
-}
-
-do_install() {
-    oe_runmake install
-}
-
-FILES:python3-sip3 = "${libdir}/${PYTHON_DIR}/site-packages/"
-FILES:${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
-- 
2.30.2


