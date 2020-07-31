Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.8121.1596153625754671797
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2020 17:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uMoWR2Kj;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a26so3906950ejc.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2020 17:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2cpjwnXzcfzP8uhRRCo8+o1MDRxiegRYKqS4rKmIagI=;
        b=uMoWR2KjpoVPBKZTz0IfPi6iK+aBQ6i71qJtZWtps+xeozS7z11d65xgXWyPFksws2
         T4EWqFHlcu0tGJ2FWBhExxIGBgeQiPHpo/EHRutB+Z10VP+62uWhm0Xv8/2V3uQWB6GH
         HFc/rG0slJyFA2qmcIOlcbBnS02UqymvTPx8g7j+bAO4uIav4e9OeEDZW1sm7rZYXWm4
         NRnCCyl/e8SqO040+Ore+xdc5UXyuDkfRtr4fYh23R2em54XY8+FsH7zq6x48Po8T39E
         IBQ/ofE1qiduwB0kQhqWVk3DTUMQOQGAI8HwUy2IFrTfBiT09SDQZR72M1ma8hKf6Uus
         mVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2cpjwnXzcfzP8uhRRCo8+o1MDRxiegRYKqS4rKmIagI=;
        b=pvr/Yvfdesf4zqSeikGTmTbBEfE8RaCnf9zYnTpSXcn8+StX3ZsFe2CZz5rrLXEimj
         UvHeQj/NSOxr0t75JcMmPIQtWEdAg3KU82JDA5MxlpWMkSMIOsfT7wloIVY0TjNJKg95
         vPUTss/fSptAtZEJgmnprlJHGSynkl+PThSBKFW8/hFns65InhZjht79gOIErFlseAL6
         i76pxnQHiZAqxT9aig3S/PB9ogVxKJD3Ka5ivQmL0klPX3LRdBNZZ7T5kS55NR1AhFu4
         Ux4r+usCQ/WM5HAk+6J9po0A8baIR51cNdrM7ofRF5UyrfrUZvR/IcjU26iFZfyNBORL
         pyTQ==
X-Gm-Message-State: AOAM531hudTLadvLnwaYVaBCc2sOvddqcRlgP1De0To9/OWGNePW3ejY
	VRLYNuzr8l46vaDqe9BF+cnH387M
X-Google-Smtp-Source: ABdhPJzxZHM6JPg+CjNONDtdZj0+iH+TbKb6ladcviDqaI/SvOoobFCmbsmkfuPzo8/GjrO5o/GXnA==
X-Received: by 2002:a17:906:4e14:: with SMTP id z20mr1555346eju.541.1596153623940;
        Thu, 30 Jul 2020 17:00:23 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f120620ff8937d1a8714aa4.dip0.t-ipconnect.de. [2003:f0:7f12:620:ff89:37d1:a871:4aa4])
        by smtp.gmail.com with ESMTPSA id a19sm7687997ejg.116.2020.07.30.17.00.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 17:00:23 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/4] live555: merge recipe with inc
Date: Fri, 31 Jul 2020 02:00:06 +0200
Message-Id: <20200731000007.452878-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200731000007.452878-1-schnitzeltony@gmail.com>
References: <20200731000007.452878-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-multimedia/live555/live555.inc    | 56 ------------------
 .../live555/live555_20190828.bb               | 58 +++++++++++++++++--
 2 files changed, 53 insertions(+), 61 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/live555/live555.inc

diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
deleted file mode 100644
index e08d11b0c..000000000
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ /dev/null
@@ -1,56 +0,0 @@
-# live555 OE build file
-# Copyright (C) 2005, Koninklijke Philips Electronics NV.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-DESCRIPTION = "LIVE555 Streaming Media libraries"
-HOMEPAGE = "http://live.com/"
-LICENSE = "LGPLv3"
-SECTION = "devel"
-
-URLV = "${@d.getVar('PV')[0:4]}.${@d.getVar('PV')[4:6]}.${@d.getVar('PV')[6:8]}"
-SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz \
-           file://config.linux-cross"
-# only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
-MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
-
-S = "${WORKDIR}/live"
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_configure() {
-    cp ${WORKDIR}/config.linux-cross .
-    echo "COMPILE_OPTS+=" -fPIC -DXLOCALE_NOT_USED"" >> config.linux-cross
-    ./genMakefiles linux-cross
-}
-
-do_compile() {
-    oe_runmake
-}
-
-do_install() {
-    install -d ${D}${includedir}/BasicUsageEnvironment
-    install -d ${D}${includedir}/groupsock
-    install -d ${D}${includedir}/liveMedia
-    install -d ${D}${includedir}/UsageEnvironment
-    install -d ${D}${libdir}
-    cp -R --no-dereference --preserve=mode,links -v ${S}/BasicUsageEnvironment/include/*.hh ${D}${includedir}/BasicUsageEnvironment/
-    cp -R --no-dereference --preserve=mode,links -v ${S}/groupsock/include/*.h ${D}${includedir}/groupsock/
-    cp -R --no-dereference --preserve=mode,links -v ${S}/groupsock/include/*.hh ${D}${includedir}/groupsock/
-    cp -R --no-dereference --preserve=mode,links -v ${S}/liveMedia/include/*.hh ${D}${includedir}/liveMedia/
-    cp -R --no-dereference --preserve=mode,links -v ${S}/UsageEnvironment/include/*.hh ${D}${includedir}/UsageEnvironment/
-    # Find all the headers
-    for i in $(find . -name "*.hh") $(find . -name "*.h") ; do
-        install ${i} ${D}${includedir}
-    done
-    cp ${S}/*/*.a ${D}${libdir}
-    install -d ${D}${bindir}
-    for i in MPEG2TransportStreamIndexer openRTSP playSIP sapWatch testMPEG1or2ProgramToTransportStream testMPEG1or2Splitter testMPEG1or2VideoReceiver testMPEG2TransportStreamTrickPlay testOnDemandRTSPServer testRelay testAMRAudioStreamer testDVVideoStreamer testMP3Receiver testMP3Streamer testMPEG1or2AudioVideoStreamer testMPEG1or2VideoStreamer testMPEG2TransportStreamer testMPEG4VideoStreamer testWAVAudioStreamer vobStreamer; do
-        install -m 0755 ${S}/testProgs/${i} ${D}${bindir}/
-    done
-    install -m 0755 ${S}/mediaServer/live555MediaServer ${D}${bindir}/
-}
-
-PACKAGES =+ "live555-openrtsp live555-playsip live555-mediaserver live555-examples"
-FILES_live555-openrtsp = "${bindir}/openRTSP"
-FILES_live555-playsip = "${bindir}/playSIP"
-FILES_live555-mediaserver = "${bindir}/live555MediaServer"
-FILES_live555-examples = "${bindir}/*"
diff --git a/meta-oe/recipes-multimedia/live555/live555_20190828.bb b/meta-oe/recipes-multimedia/live555/live555_20190828.bb
index 1da61c0cf..39e1fddfc 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20190828.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20190828.bb
@@ -1,11 +1,59 @@
-require live555.inc
+# live555 OE build file
+# Copyright (C) 2005, Koninklijke Philips Electronics NV.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+DESCRIPTION = "LIVE555 Streaming Media libraries"
+HOMEPAGE = "http://live.com/"
+LICENSE = "LGPLv3"
+SECTION = "devel"
+
+URLV = "${@d.getVar('PV')[0:4]}.${@d.getVar('PV')[4:6]}.${@d.getVar('PV')[6:8]}"
+SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz \
+           file://config.linux-cross"
+# only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
+MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
+
+SRC_URI[sha256sum] = "a3dcd157865186cf883c3a80b4bb09637e91fff96b234b2c780a7f7dcc7a35dc"
+
+S = "${WORKDIR}/live"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                    "
-# SRC_URI[md5sum] = "a84ca3946d899f5592c7d31012ed2fe3"
-# SRC_URI[sha256sum] = "0bd0c26d980425d9a419d835193e292a08a968f175da1902da4b495f126d5abd"
 
-SRC_URI[md5sum] = "a593f915664793b3ba41299b17b8bedc"
-SRC_URI[sha256sum] = "a3dcd157865186cf883c3a80b4bb09637e91fff96b234b2c780a7f7dcc7a35dc"
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_configure() {
+    cp ${WORKDIR}/config.linux-cross .
+    echo "COMPILE_OPTS+=" -fPIC -DXLOCALE_NOT_USED"" >> config.linux-cross
+    ./genMakefiles linux-cross
+}
+
+do_install() {
+    install -d ${D}${includedir}/BasicUsageEnvironment
+    install -d ${D}${includedir}/groupsock
+    install -d ${D}${includedir}/liveMedia
+    install -d ${D}${includedir}/UsageEnvironment
+    install -d ${D}${libdir}
+    cp -R --no-dereference --preserve=mode,links -v ${S}/BasicUsageEnvironment/include/*.hh ${D}${includedir}/BasicUsageEnvironment/
+    cp -R --no-dereference --preserve=mode,links -v ${S}/groupsock/include/*.h ${D}${includedir}/groupsock/
+    cp -R --no-dereference --preserve=mode,links -v ${S}/groupsock/include/*.hh ${D}${includedir}/groupsock/
+    cp -R --no-dereference --preserve=mode,links -v ${S}/liveMedia/include/*.hh ${D}${includedir}/liveMedia/
+    cp -R --no-dereference --preserve=mode,links -v ${S}/UsageEnvironment/include/*.hh ${D}${includedir}/UsageEnvironment/
+    # Find all the headers
+    for i in $(find . -name "*.hh") $(find . -name "*.h") ; do
+        install ${i} ${D}${includedir}
+    done
+    cp ${S}/*/*.a ${D}${libdir}
+    install -d ${D}${bindir}
+    for i in MPEG2TransportStreamIndexer openRTSP playSIP sapWatch testMPEG1or2ProgramToTransportStream testMPEG1or2Splitter testMPEG1or2VideoReceiver testMPEG2TransportStreamTrickPlay testOnDemandRTSPServer testRelay testAMRAudioStreamer testDVVideoStreamer testMP3Receiver testMP3Streamer testMPEG1or2AudioVideoStreamer testMPEG1or2VideoStreamer testMPEG2TransportStreamer testMPEG4VideoStreamer testWAVAudioStreamer vobStreamer; do
+        install -m 0755 ${S}/testProgs/${i} ${D}${bindir}/
+    done
+    install -m 0755 ${S}/mediaServer/live555MediaServer ${D}${bindir}/
+}
 
+PACKAGES =+ "live555-openrtsp live555-playsip live555-mediaserver live555-examples"
+FILES_live555-openrtsp = "${bindir}/openRTSP"
+FILES_live555-playsip = "${bindir}/playSIP"
+FILES_live555-mediaserver = "${bindir}/live555MediaServer"
+FILES_live555-examples = "${bindir}/*"
-- 
2.26.2

