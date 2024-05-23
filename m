Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD8CC25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 23:28:16 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.4507.1716506891852375431
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 May 2024 16:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QHpDTPbu;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a5ce2f0deffso798688666b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 16:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716506890; x=1717111690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tpM5FgEeCN67TMqFO/Woqyw0HXRYT5pRQbyavhGlrXI=;
        b=QHpDTPbueQ487YKciAFuPvEKp/20LDWtO/w92jS5NKaFnGcMTRQUGIsjSvsn7jl2dV
         1DB4mTMDa6R59zlsQs9ksIiwB/2dSYGcSMGDrePiFesAkZeGV+ELeL26hv5KGjTdTXyQ
         4DjXoICyZsStSzPDzqWR9kOMhwwxkENVwh0tf2rU52opAh7qTaeQZ/oWUEViUYbyCVrs
         P6vteunwYkDZn4FO/vM/MNdwfcW9bdvGXL2fnW7vd2JZXv9WqMEBY4nErLmXI8v2z9En
         5qflY7Z3yQlsXlP7b4FYqwHEGIj0sDnKLQ7Q7AvJd9P2aoqWgoo2VAnQrwDiHPrcPjbk
         eeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716506890; x=1717111690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpM5FgEeCN67TMqFO/Woqyw0HXRYT5pRQbyavhGlrXI=;
        b=QpxoALJpPX/jE4t2W8UuCBvl35tKuS8G9xVxvBDxmYeQ7Er4aNvu1LbWi1wfsYDL4u
         FkNB+2eJIPb4q2CPdnYG1VBCyNhDSHftVWhhZFmfE3maPjGkhVT/HEjpWn0mx/b3UrNL
         Xh59W1Odann1V8lJcWlvK12UnIAEyR3ZoFwRiHygoKX7rC5OEgxUs5HuDmT+k+ysUg3H
         z6zlq7UzfMzQ5FRLWKCcXlGjuTXDnPqYksCZ08DJL7HXtgNjzD0BGB7fovRsGsWMlRd1
         Emq9UaZ/v2OWBzfNIjqqil4P/A+rqO3NGSYxERJZ0N5+MQL99C0q+EB4Kr4IL89j85/K
         sWHA==
X-Gm-Message-State: AOJu0Yw4OUhZiYQx9Rx6qaGTCzCC12IayvRplDZ0aSqf7B6R/ky4OWpX
	+yhqgE946P4edIVX26dbQvmxyDLLqEY/Rj0SKvOikFi30ZPrx4NO+UqcPQ==
X-Google-Smtp-Source: AGHT+IFkjuv9IDn764Q7L7NWn6Y0BIru0npZdbkmoIpbtgmToPFg7eYEpg0QRa3PyxRukYRoWd5fhw==
X-Received: by 2002:a17:907:3557:b0:a55:8f2a:950d with SMTP id a640c23a62f3a-a62641a33f3mr34007566b.16.1716506890006;
        Thu, 23 May 2024 16:28:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda8cc5sm25903366b.222.2024.05.23.16.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 16:28:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][master-next][PATCH] source-han-sans-*-fonts: move common part to .inc file
Date: Fri, 24 May 2024 01:28:01 +0200
Message-ID: <20240523232801.3259062-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 May 2024 23:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110505

* only SUMMARY, ZIPNAME and SRC_URI checksums are different
* rename the .conf file to match BPN to simplify even more

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ....conf => 44-source-han-sans-cn-fonts.conf} |  0
 .../source-han-sans-cn-fonts_2.004.bb         | 29 ++----------------
 .../ttf-fonts/source-han-sans-fonts.inc       | 26 ++++++++++++++++
 ....conf => 44-source-han-sans-jp-fonts.conf} |  0
 .../source-han-sans-jp-fonts_2.004.bb         | 29 ++----------------
 ....conf => 44-source-han-sans-kr-fonts.conf} |  0
 .../source-han-sans-kr-fonts_2.004.bb         | 30 ++-----------------
 ....conf => 44-source-han-sans-tw-fonts.conf} |  0
 .../source-han-sans-tw-fonts_2.004.bb         | 30 ++-----------------
 9 files changed, 34 insertions(+), 110 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts/{44-source-han-sans-cn.conf => 44-source-han-sans-cn-fonts.conf} (100%)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/source-han-sans-fonts.inc
 rename meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts/{44-source-han-sans-jp.conf => 44-source-han-sans-jp-fonts.conf} (100%)
 rename meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts/{44-source-han-sans-kr.conf => 44-source-han-sans-kr-fonts.conf} (100%)
 rename meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts/{44-source-han-sans-tw.conf => 44-source-han-sans-tw-fonts.conf} (100%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts/44-source-han-sans-cn.conf b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts/44-source-han-sans-cn-fonts.conf
similarity index 100%
rename from meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts/44-source-han-sans-cn.conf
rename to meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts/44-source-han-sans-cn-fonts.conf
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
index 0eeae9c2ee..c46952cce0 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
@@ -1,31 +1,6 @@
-require ttf.inc
+require source-han-sans-fonts.inc
 
 SUMMARY = "Adobe OpenType Pan-CJK font family for Simplified Chinese"
-HOMEPAGE = "https://github.com/adobe-fonts/source-han-sans"
-LICENSE = "OFL-1.1"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/${LICENSE};md5=fac3a519e5e9eb96316656e0ca4f2b90"
+ZIPNAME = "SourceHanSansCN"
 
-inherit allarch fontcache
-
-# Download tends to break - so - or not?
-#EXCLUDE_FROM_WORLD = "1"
-
-SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansCN.zip;subdir=${BP};downloadfilename=${BP}.zip \
-    file://44-source-han-sans-cn.conf \
-"
 SRC_URI[sha256sum] = "6841fc13f1c0d255cfeb33d2a2c68d24bbebd94ae2c070347a2b2b200a1db4d6"
-
-do_install() {
-    install -d ${D}${sysconfdir}/fonts/conf.d/
-    install -m 0644 ${UNPACKDIR}/44-source-han-sans-cn.conf ${D}${sysconfdir}/fonts/conf.d/
-
-    install -d ${D}${datadir}/fonts/truetype/
-    find ./ -name '*.otf' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
-}
-
-FILES:${PN} = " \
-    ${sysconfdir}/fonts \
-    ${datadir}/fonts \
-"
-
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-fonts.inc b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-fonts.inc
new file mode 100644
index 0000000000..03ca4c0902
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-fonts.inc
@@ -0,0 +1,26 @@
+require ttf.inc
+
+HOMEPAGE = "https://github.com/adobe-fonts/source-han-sans"
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/${LICENSE};md5=fac3a519e5e9eb96316656e0ca4f2b90"
+
+inherit allarch fontcache
+
+SRC_URI = " \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/${PV}R/${ZIPNAME}.zip;subdir=${BP};downloadfilename=${BP}.zip \
+    file://44-${BPN}.conf \
+"
+
+do_install() {
+    install -d ${D}${sysconfdir}/fonts/conf.d/
+    install -m 0644 ${UNPACKDIR}/44-${BPN}.conf ${D}${sysconfdir}/fonts/conf.d/
+
+    install -d ${D}${datadir}/fonts/truetype/
+    find ./ -name '*.otf' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
+}
+
+FILES:${PN} = " \
+    ${sysconfdir}/fonts \
+    ${datadir}/fonts \
+"
+
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts/44-source-han-sans-jp.conf b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts/44-source-han-sans-jp-fonts.conf
similarity index 100%
rename from meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts/44-source-han-sans-jp.conf
rename to meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts/44-source-han-sans-jp-fonts.conf
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
index d75de154cd..40128f97d3 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
@@ -1,31 +1,6 @@
-require ttf.inc
+require source-han-sans-fonts.inc
 
 SUMMARY = "Adobe OpenType Pan-CJK font family for Japanese"
-HOMEPAGE = "https://github.com/adobe-fonts/source-han-sans"
-LICENSE = "OFL-1.1"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/${LICENSE};md5=fac3a519e5e9eb96316656e0ca4f2b90"
+ZIPNAME = "SourceHanSansJP"
 
-inherit allarch fontcache
-
-# Download tends to break - so - or not?
-#EXCLUDE_FROM_WORLD = "1"
-
-SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansJP.zip;subdir=${BP};downloadfilename=${BP}.zip \
-    file://44-source-han-sans-jp.conf \
-"
 SRC_URI[sha256sum] = "1ae9f62ad620d686c4a049ce25cf54e3afd8fefc954a678c644cf9802750c17e"
-
-do_install() {
-    install -d ${D}${sysconfdir}/fonts/conf.d/
-    install -m 0644 ${UNPACKDIR}/44-source-han-sans-jp.conf ${D}${sysconfdir}/fonts/conf.d/
-
-    install -d ${D}${datadir}/fonts/truetype/
-    find ./ -name '*.otf' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
-}
-
-FILES:${PN} = " \
-    ${sysconfdir}/fonts \
-    ${datadir}/fonts \
-"
-
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts/44-source-han-sans-kr.conf b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts/44-source-han-sans-kr-fonts.conf
similarity index 100%
rename from meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts/44-source-han-sans-kr.conf
rename to meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts/44-source-han-sans-kr-fonts.conf
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
index 582de03bdb..8b32ab82d2 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
@@ -1,32 +1,6 @@
-require ttf.inc
+require source-han-sans-fonts.inc
 
 SUMMARY = "Adobe OpenType Pan-CJK font family for Korean"
-HOMEPAGE = "https://github.com/adobe-fonts/source-han-sans"
-LICENSE = "OFL-1.1"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/${LICENSE};md5=fac3a519e5e9eb96316656e0ca4f2b90"
+ZIPNAME = "SourceHanSansKR"
 
-inherit allarch fontcache
-
-# Download tends to break - so - or not?
-#EXCLUDE_FROM_WORLD = "1"
-
-SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansKR.zip;subdir=${BP};downloadfilename=${BP}.zip \
-    file://44-source-han-sans-kr.conf \
-"
 SRC_URI[sha256sum] = "02fe28a48c6381c49d61c27a1b173c77f0e6f2b9f2b68e79f076f10a6a8f4bfe"
-S = "${UNPACKDIR}/branches"
-
-do_install() {
-    install -d ${D}${sysconfdir}/fonts/conf.d/
-    install -m 0644 ${UNPACKDIR}/44-source-han-sans-kr.conf ${D}${sysconfdir}/fonts/conf.d/
-
-    install -d ${D}${datadir}/fonts/truetype/
-    find ./ -name '*.otf' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
-}
-
-FILES:${PN} = " \
-    ${sysconfdir}/fonts \
-    ${datadir}/fonts \
-"
-
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts/44-source-han-sans-tw.conf b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts/44-source-han-sans-tw-fonts.conf
similarity index 100%
rename from meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts/44-source-han-sans-tw.conf
rename to meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts/44-source-han-sans-tw-fonts.conf
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
index 011d434190..b841660efd 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
@@ -1,32 +1,6 @@
-require ttf.inc
+require source-han-sans-fonts.inc
 
 SUMMARY = "Adobe OpenType Pan-CJK font family for Traditional Chinese"
-HOMEPAGE = "https://github.com/adobe-fonts/source-han-sans"
-LICENSE = "OFL-1.1"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/${LICENSE};md5=fac3a519e5e9eb96316656e0ca4f2b90"
+ZIPNAME = "SourceHanSansTW"
 
-inherit allarch fontcache
-
-# Download tends to break - so - or not?
-#EXCLUDE_FROM_WORLD = "1"
-
-SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansTW.zip;subdir=${BP};downloadfilename=${BP}.zip \
-    file://44-source-han-sans-tw.conf \
-"
 SRC_URI[sha256sum] = "11d78c8fbc1a4bb04a453cdd65c99db8d41ec5cd6ba6d68c8638e6ba170de806"
-S = "${UNPACKDIR}/SourceHanSansTW"
-
-do_install() {
-    install -d ${D}${sysconfdir}/fonts/conf.d/
-    install -m 0644 ${UNPACKDIR}/44-source-han-sans-tw.conf ${D}${sysconfdir}/fonts/conf.d/
-
-    install -d ${D}${datadir}/fonts/truetype/
-    find ./ -name '*.otf' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
-}
-
-FILES:${PN} = " \
-    ${sysconfdir}/fonts \
-    ${datadir}/fonts \
-"
-
-- 
2.45.1


