Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OIJeP-0000S1-6H
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 May 2010 12:52:22 +0200
Received: from cpe002275e3273f-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.245.115] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OIJaM-0001eA-Ps for openembedded-devel@lists.openembedded.org;
	Sat, 29 May 2010 06:48:11 -0400
Date: Sat, 29 May 2010 06:48:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.2.00.1005290642240.19474@lynx>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] New recipe file for updated live555, version 20100528.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 May 2010 10:52:23 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  New file simply represents reference to new tarball and updated MD5
and SHA256 sums.  Appears to build fine with development branch for
Angstrom.  is this the proper format for a new recipe version patch?



diff --git a/recipes/live555/live555_20100528.bb b/recipes/live555/live555_20100528.bb
new file mode 100644
index 0000000..0160883
--- /dev/null
+++ b/recipes/live555/live555_20100528.bb
@@ -0,0 +1,55 @@
+# live555 OE build file
+# Copyright (C) 2005, Koninklijke Philips Electronics NV.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+DESCRIPTION = "LIVE555 Streaming Media libraries"
+HOMEPAGE = "http://live.com/"
+LICENSE = "LGPL"
+SECTION = "devel"
+
+PR = "r0"
+
+SRC_URI = "http://www.live555.com/liveMedia/public/live.2010.05.28.tar.gz \
+           file://config.linux-cross"
+
+S = "${WORKDIR}/live"
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_configure() {
+	cp ${WORKDIR}/config.linux-cross .
+	./genMakefiles linux-cross
+}
+
+do_compile() {
+	make
+}
+
+do_install() {
+	install -d ${D}${includedir}/BasicUsageEnvironment
+	install -d ${D}${includedir}/groupsock
+	install -d ${D}${includedir}/liveMedia
+	install -d ${D}${includedir}/UsageEnvironment
+	install -d ${D}${libdir}
+	cp -a ${S}/BasicUsageEnvironment/include/*.hh ${D}${includedir}/BasicUsageEnvironment/
+	cp -a ${S}/groupsock/include/*.h ${D}${includedir}/groupsock/
+	cp -a ${S}/groupsock/include/*.hh ${D}${includedir}/groupsock/
+	cp -a ${S}/liveMedia/include/*.hh ${D}${includedir}/liveMedia/
+	cp -a ${S}/UsageEnvironment/include/*.hh ${D}${includedir}/UsageEnvironment/
+	# Find all the headers
+	for i in $(find . -name "*.hh") $(find . -name "*.h") ; do
+		install ${i} ${D}${includedir}
+	done
+	cp ${S}/*/*.a ${D}${libdir}
+	install -d ${D}${bindir}
+	for i in MPEG2TransportStreamIndexer openRTSP playSIP sapWatch testMPEG1or2AudioVideoToDarwin testMPEG1or2ProgramToTransportStream testMPEG1or2Splitter testMPEG1or2VideoReceiver testMPEG2TransportStreamTrickPlay testMPEG4VideoToDarwin testOnDemandRTSPServer testRelay testAMRAudioStreamer testDVVideoStreamer testMP3Receiver testMP3Streamer testMPEG1or2AudioVideoStreamer testMPEG1or2VideoStreamer testMPEG2TransportStreamer testMPEG4VideoStreamer testWAVAudioStreamer vobStreamer; do
+		install -m 0755 ${S}/testProgs/${i} ${D}${bindir}/
+	done
+}
+
+SRC_URI[md5sum] = "c9f3e25d3abb1721af9ed664cedba756"
+SRC_URI[sha256sum] = "5f048e1276d473d4047d981bc70f5fef6143ff5241acd907534647f9cb28b107"
+
+PACKAGES =+ " live555-openrtsp live555-playsip"
+FILES_${PN} = "${bindir}/sapWatch ${bindir}/testMPEG1or2AudioVideoToDarwin ${bindir}/testMPEG1or2ProgramToTransportStream ${bindir}/testMPEG1or2Splitter ${bindir}/testMPEG1or2VideoReceiver ${bindir}/testMPEG2TransportStreamTrickPlay ${bindir}/testMPEG4VideoToDarwin ${bindir}/testOnDemandRTSPServer ${bindir}/testRelay ${bindir}/testAMRAudioStreamer ${bindir}/testDVVideoStreamer ${bindir}/testMP3Receiver ${bindir}/testMP3Streamer ${bindir}/testMPEG1or2AudioVideoStreamer ${bindir}/testMPEG1or2VideoStreamer ${bindir}/testMPEG2TransportStreamer ${bindir}/testMPEG4VideoStreamer ${bindir}/testWAVAudioStreamer ${bindir}/vobStreamer ${bindir}/MPEG2TransportStreamIndexer"
+FILES_live555-openrtsp = "${bindir}/openRTSP"
+FILES_live555-playsip = "${bindir}/playSIP"

rday

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


