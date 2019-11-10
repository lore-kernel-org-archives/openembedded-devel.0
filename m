Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id A499960720
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 14:51:41 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id D3411BE0AC6; Sun, 10 Nov 2019 15:51:38 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Nov 2019 15:51:38 +0100
Message-Id: <20191110145138.3192-1-obi@opendreambox.org>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] live555: Move test progams out of main package
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
X-List-Received-Date: Sun, 10 Nov 2019 14:51:41 -0000

All binaries previously listed in FILES_${PN} come from a
directory called 'testProgs' and will seldomly be used.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-multimedia/live555/live555.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
index cf4dc7f4fe..e08d11b0c2 100644
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -49,8 +49,8 @@ do_install() {
     install -m 0755 ${S}/mediaServer/live555MediaServer ${D}${bindir}/
 }
 
-PACKAGES =+ " live555-openrtsp live555-playsip live555-mediaserver"
-FILES_${PN} = "${bindir}/sapWatch ${bindir}/testMPEG1or2ProgramToTransportStream ${bindir}/testMPEG1or2Splitter ${bindir}/testMPEG1or2VideoReceiver ${bindir}/testMPEG2TransportStreamTrickPlay ${bindir}/testOnDemandRTSPServer ${bindir}/testRelay ${bindir}/testAMRAudioStreamer ${bindir}/testDVVideoStreamer ${bindir}/testMP3Receiver ${bindir}/testMP3Streamer ${bindir}/testMPEG1or2AudioVideoStreamer ${bindir}/testMPEG1or2VideoStreamer ${bindir}/testMPEG2TransportStreamer ${bindir}/testMPEG4VideoStreamer ${bindir}/testWAVAudioStreamer ${bindir}/vobStreamer ${bindir}/MPEG2TransportStreamIndexer"
+PACKAGES =+ "live555-openrtsp live555-playsip live555-mediaserver live555-examples"
 FILES_live555-openrtsp = "${bindir}/openRTSP"
 FILES_live555-playsip = "${bindir}/playSIP"
 FILES_live555-mediaserver = "${bindir}/live555MediaServer"
+FILES_live555-examples = "${bindir}/*"
-- 
2.17.1


