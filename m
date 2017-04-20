Return-Path: <raj.khem@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 83FC06FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 16:39:38 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id 19so4482998ybl.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 09:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jqvzO00eCMWs0GENq9AqXcz7pojlNbPz7jGEnVPhYNI=;
	b=rO/Vf86FKE8EP0IqZBWj6DWUOTUji/KqpM3sNnMigPFEVae1chy2PkAUZSqqQt52jk
	4+R27e7nuZD+2vPGbDt+WyIkATWgwYRekptf+K1MexWesBdUU2SBjlj+iFH47zdRKu1U
	JWonuQpOeSE1kKtURAmOChsWU2IdqMdOSDb9tDnDKOxfqxrwJPB+1CDIS5XjOtMETaLO
	VMd0teOc8R/JD2uILWyWLQm+B25lJ18o7m0XaI6kVCzgGoH4UnFzr5OeE8d2KVnKy60t
	p2Y3dbkuBGkeFs4NDoWzxI6qGEfdTIvU97Zc1gtIDHQ6KsOBDejkzlti7xdGAdz6E4AK
	qAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jqvzO00eCMWs0GENq9AqXcz7pojlNbPz7jGEnVPhYNI=;
	b=nCXv0h72oQNzHgbG/CJLEcdSKZhyRQQ2Y8wAOOcnSUSbtyG2vQlFvEO+oGBKruc9ZT
	bLDZXPyfDul4cePPDuGcEHmaOCjoBuILUA/LPMZtL05b6dMWJAHvOG5lKUlnMrrTw/cj
	WdmuG/h5NIrlLkKZXGVD1/T128ECTkVy7CxnBglqs0mVNtyacjKQHdAOMyvdsLIztCbG
	pPHZ+b/iPGDE2YqUz8i0PveIezMOZNVzxKWx5TtqXPJSDwwO5qyAEt0UDIGsr3WT2hUr
	BaS1IIL1UroDSLP3NCfdcmDCTU/oNK/10h4a/zm8bm+f1JhhtTQm8m6R9BEky4Z4JIj7
	kK/w==
X-Gm-Message-State: AN3rC/5KiEKYoa9y6XoNzeQbvLvJODzNUBhTRQftQeRMiRCKMlMq8MDv
	ftbUxsxr5Vk1Ag==
X-Received: by 10.98.34.212 with SMTP id p81mr8784544pfj.118.1492706379442;
	Thu, 20 Apr 2017 09:39:39 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a21sm11501671pfc.60.2017.04.20.09.39.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Apr 2017 09:39:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Apr 2017 09:39:26 -0700
Message-Id: <20170420163926.20793-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170420163926.20793-1-raj.khem@gmail.com>
References: <20170420163926.20793-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] live555: Update from 20130430 to 20170410
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
X-List-Received-Date: Thu, 20 Apr 2017 16:39:38 -0000

license checksum changed due to annual update of the copyright years

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/live555/live555.inc         | 8 +++-----
 meta-oe/recipes-multimedia/live555/live555_20130430.bb | 7 -------
 meta-oe/recipes-multimedia/live555/live555_20170410.bb | 9 +++++++++
 3 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/live555/live555_20130430.bb
 create mode 100644 meta-oe/recipes-multimedia/live555/live555_20170410.bb

diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
index a51619350..daae8d786 100644
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -7,8 +7,6 @@ HOMEPAGE = "http://live.com/"
 LICENSE = "LGPLv3"
 SECTION = "devel"
 
-INC_PR = "r1"
-
 URLV = "${@d.getVar('PV')[0:4]}.${@d.getVar('PV')[4:6]}.${@d.getVar('PV')[6:8]}"
 SRC_URI = "http://www.live555.com/liveMedia/public/live.${URLV}.tar.gz \
            file://config.linux-cross"
@@ -28,7 +26,7 @@ do_configure() {
 }
 
 do_compile() {
-    make
+    oe_runmake
 }
 
 do_install() {
@@ -48,14 +46,14 @@ do_install() {
     done
     cp ${S}/*/*.a ${D}${libdir}
     install -d ${D}${bindir}
-    for i in MPEG2TransportStreamIndexer openRTSP playSIP sapWatch testMPEG1or2AudioVideoToDarwin testMPEG1or2ProgramToTransportStream testMPEG1or2Splitter testMPEG1or2VideoReceiver testMPEG2TransportStreamTrickPlay testMPEG4VideoToDarwin testOnDemandRTSPServer testRelay testAMRAudioStreamer testDVVideoStreamer testMP3Receiver testMP3Streamer testMPEG1or2AudioVideoStreamer testMPEG1or2VideoStreamer testMPEG2TransportStreamer testMPEG4VideoStreamer testWAVAudioStreamer vobStreamer; do
+    for i in MPEG2TransportStreamIndexer openRTSP playSIP sapWatch testMPEG1or2ProgramToTransportStream testMPEG1or2Splitter testMPEG1or2VideoReceiver testMPEG2TransportStreamTrickPlay testOnDemandRTSPServer testRelay testAMRAudioStreamer testDVVideoStreamer testMP3Receiver testMP3Streamer testMPEG1or2AudioVideoStreamer testMPEG1or2VideoStreamer testMPEG2TransportStreamer testMPEG4VideoStreamer testWAVAudioStreamer vobStreamer; do
         install -m 0755 ${S}/testProgs/${i} ${D}${bindir}/
     done
     install -m 0755 ${S}/mediaServer/live555MediaServer ${D}${bindir}/
 }
 
 PACKAGES =+ " live555-openrtsp live555-playsip live555-mediaserver"
-FILES_${PN} = "${bindir}/sapWatch ${bindir}/testMPEG1or2AudioVideoToDarwin ${bindir}/testMPEG1or2ProgramToTransportStream ${bindir}/testMPEG1or2Splitter ${bindir}/testMPEG1or2VideoReceiver ${bindir}/testMPEG2TransportStreamTrickPlay ${bindir}/testMPEG4VideoToDarwin ${bindir}/testOnDemandRTSPServer ${bindir}/testRelay ${bindir}/testAMRAudioStreamer ${bindir}/testDVVideoStreamer ${bindir}/testMP3Receiver ${bindir}/testMP3Streamer ${bindir}/testMPEG1or2AudioVideoStreamer ${bindir}/testMPEG1or2VideoStreamer ${bindir}/testMPEG2TransportStreamer ${bindir}/testMPEG4VideoStreamer ${bindir}/testWAVAudioStreamer ${bindir}/vobStreamer ${bindir}/MPEG2TransportStreamIndexer"
+FILES_${PN} = "${bindir}/sapWatch ${bindir}/testMPEG1or2ProgramToTransportStream ${bindir}/testMPEG1or2Splitter ${bindir}/testMPEG1or2VideoReceiver ${bindir}/testMPEG2TransportStreamTrickPlay ${bindir}/testOnDemandRTSPServer ${bindir}/testRelay ${bindir}/testAMRAudioStreamer ${bindir}/testDVVideoStreamer ${bindir}/testMP3Receiver ${bindir}/testMP3Streamer ${bindir}/testMPEG1or2AudioVideoStreamer ${bindir}/testMPEG1or2VideoStreamer ${bindir}/testMPEG2TransportStreamer ${bindir}/testMPEG4VideoStreamer ${bindir}/testWAVAudioStreamer ${bindir}/vobStreamer ${bindir}/MPEG2TransportStreamIndexer"
 FILES_live555-openrtsp = "${bindir}/openRTSP"
 FILES_live555-playsip = "${bindir}/playSIP"
 FILES_live555-mediaserver = "${bindir}/live555MediaServer"
diff --git a/meta-oe/recipes-multimedia/live555/live555_20130430.bb b/meta-oe/recipes-multimedia/live555/live555_20130430.bb
deleted file mode 100644
index f83285cff..000000000
--- a/meta-oe/recipes-multimedia/live555/live555_20130430.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require live555.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
-
-SRC_URI[md5sum] = "95533d91bd196e42fd748076dc244b09"
-SRC_URI[sha256sum] = "e549af608c9961d85cb647bc3b99804fec0fbaf5338c1b72d057558ae5cd2aea"
-
diff --git a/meta-oe/recipes-multimedia/live555/live555_20170410.bb b/meta-oe/recipes-multimedia/live555/live555_20170410.bb
new file mode 100644
index 000000000..27fc42987
--- /dev/null
+++ b/meta-oe/recipes-multimedia/live555/live555_20170410.bb
@@ -0,0 +1,9 @@
+require live555.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+                   "
+
+SRC_URI[md5sum] = "b7084a72aeb09549c8b248f8cc308841"
+SRC_URI[sha256sum] = "4c37d9c828f9028403997272e49968c260385dbbaef62e28ba24faef0dda868b"
+
-- 
2.12.2


