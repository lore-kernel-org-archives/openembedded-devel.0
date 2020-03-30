Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web11.40498.1585528307604958226
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 17:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jhJ7I0Ng;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id g32so1817983pgb.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2020 17:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TlcsRhUxDRBKJw5IJWkqh6VkESspAXR/GftRJEGF7og=;
        b=jhJ7I0NgD/6euy0/Jw/Df3HkHlVE/YH7kGrsDGtudzV6qThIt5vD0nkjI5oIM1PW77
         mQiqLGjoOmHXng7yCKR0g34ASjs86whZFNZyD7k2Iufr9c+8mTr2+3RZoOYOjS2OvwJv
         DeQTh3VaPSXNjrzqh17JGQPAq8cOpyu/1xqC4dA1roGhE9FxnGYCGBDZXJ+mLyuAfe+G
         VkM3qh+XCYu21ZUl6LI4ZI0kIsbg7TOJt0ASydfcqHcnlWRRU1YFNBWPa/wvn6Rq9Dfy
         Ls1Ebfg3a/jR7rt3ePVowF5I7aGOdn1vRGsSqUZSo4/7yZUmgnmF/18qUwpEZB5n1y9T
         ZaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TlcsRhUxDRBKJw5IJWkqh6VkESspAXR/GftRJEGF7og=;
        b=aasUdajHI06b6Zbo1CvwZ4fNQEB6E3HHyc4C0Ftv7fQjnETKduIFH1S0C9JB0sVgrY
         YTcNZyVSKz2u7OTUq2J/Qc/GK98R7sp/rcRvW1OKMdhaIG/OaeimuSKd9pA6QskAfWv/
         Nk+bp8p9MWJpNuBfSnXxM9chR/23Qq35uD+YgI2Q3Om8uy2vBa+/3Orx6Bxu7rIBZBZU
         eWNERrpmRPm8T/8tlsBQng7yAycA/Bhg5+ZXk1wPcQTt22WoxbsOQPpDLajDZXHiSi2S
         bfgGs9TmeQD2UEbS64NIaQItU9gbay7IpnMBlF5qLUnJ4usxLNwR8bzk1uzH95esUuQ/
         gZtw==
X-Gm-Message-State: ANhLgQ0/TV7KEYLYXk/XfvEGHtWnk8da77IGXL9FTSMgdtusr5aspPkk
	s3qkhqmtzPKMF5jdDcc+MUOrGQDOYUc=
X-Google-Smtp-Source: ADFU+vuZ3gxBpTwjR15YoegGQsrCzON/BeSIryaKKhbiXCk8HQEKy92dMhlrBDGNCELkpXgX+EyAhg==
X-Received: by 2002:a63:f258:: with SMTP id d24mr10758353pgk.307.1585528306759;
        Sun, 29 Mar 2020 17:31:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49c5])
        by smtp.gmail.com with ESMTPSA id i13sm4662317pfa.113.2020.03.29.17.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 17:31:46 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 6/6] netkit-rwho: Add logic to apply patches from tarball
Date: Sun, 29 Mar 2020 17:31:55 -0700
Message-Id: <20200330003155.1670457-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330003155.1670457-1-raj.khem@gmail.com>
References: <20200330003155.1670457-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This recipe fetches from debian archives, therefore we need logic to
apply the patches which are part of tarball

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../netkit-rwho/netkit-rwho_0.17.bb           | 34 ++++++++++++++++---
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
index 60a8d95b06..ad543b0fbd 100644
--- a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://rwho/rwho.c;beginline=2;endline=3;md5=5a85f13c0142d72fc378e00f15da5b9e"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-rwho/netkit-rwho_${PV}.orig.tar.gz;name=archive \
-           ${DEBIAN_MIRROR}/main/n/netkit-rwho/netkit-rwho_${PV}-13.debian.tar.gz;name=patch13 \
+           ${DEBIAN_MIRROR}/main/n/netkit-rwho/netkit-rwho_${PV}-13.debian.tar.gz;subdir=${BP};name=patch13 \
            file://rwhod \
            file://rwhod.default \
            file://0001-Add-missing-include-path-to-I-options.patch \
@@ -20,13 +20,37 @@ inherit autotools-brokensep useradd update-rc.d update-alternatives
 
 CFLAGS += " -D_GNU_SOURCE"
 
-debian_do_patch() {
-    cd ${S}
-    while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line; done < ${WORKDIR}/debian/patches/series
+# Unlike other Debian packages, net-tools *.diff.gz contains another series of
+# patches maintained by quilt. So manually apply them before applying other local
+# patches. Also remove all temp files before leaving, because do_patch() will pop
+# up all previously applied patches in the start
+do_patch[depends] += "quilt-native:do_populate_sysroot"
+netkit_do_patch() {
+        cd ${S}
+        # it's important that we only pop the existing patches when they've
+        # been applied, otherwise quilt will climb the directory tree
+        # and reverse out some completely different set of patches
+        if [ -d ${S}/patches ]; then
+                # whilst this is the default directory, doing it like this
+                # defeats the directory climbing that quilt will otherwise
+                # do; note the directory must exist to defeat this, hence
+                # the test inside which we operate
+                QUILT_PATCHES=${S}/patches quilt pop -a
+        fi
+        if [ -d ${S}/.pc-${BPN} ]; then
+                rm -rf ${S}/.pc
+                mv ${S}/.pc-${BPN} ${S}/.pc
+                QUILT_PATCHES=${S}/debian/patches quilt pop -a
+                rm -rf ${S}/.pc ${S}/debian
+        fi
+        QUILT_PATCHES=${S}/debian/patches quilt push -a
+        mv ${S}/.pc ${S}/.pc-${BPN}
 }
 
+do_unpack[cleandirs] += "${S}"
+
 python do_patch() {
-    bb.build.exec_func('debian_do_patch', d)
+    bb.build.exec_func('netkit_do_patch', d)
     bb.build.exec_func('patch_do_patch', d)
 }
 
-- 
2.26.0

