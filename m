Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1LwIfl-0001Ii-FI
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 18:18:13 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B3FF4DB0E1C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 18:13:44 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B3320DB07A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 18:13:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (g225145114.adsl.alicedsl.de
	[92.225.145.114]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 18:13:43 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id E0BC73C244; Tue, 21 Apr 2009 18:13:42 +0200 (CEST)
Date: Tue, 21 Apr 2009 18:13:42 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090421161342.GA5630@rhein.zuhause.netz>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Ack for ffmpeg patch
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
X-List-Received-Date: Tue, 21 Apr 2009 16:18:13 -0000
X-Groupsio-MsgNum: 9587
Content-Type: multipart/mixed; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

is the attached patch okay for dev. The patch removes the install
of the headers to the legacy directories. Without the patch it is very complicated
to compile xine 1.1.16.3.

Bye Henning

--ReaqsoxgOBHFXBhH
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-ffmpeg-0.5-install-the-header-to-staging-only-to-th.patch"

 recipes/ffmpeg/ffmpeg_0.5.bb |   34 +++++++++++++++++++++++++++++++++-
 1 files changed, 33 insertions(+), 1 deletions(-)

diff --git a/recipes/ffmpeg/ffmpeg_0.5.bb b/recipes/ffmpeg/ffmpeg_0.5.bb
index 54db004..244dba1 100644
--- a/recipes/ffmpeg/ffmpeg_0.5.bb
+++ b/recipes/ffmpeg/ffmpeg_0.5.bb
@@ -3,7 +3,7 @@ require ffmpeg.inc
 DEPENDS += "schroedinger libgsm"
 
 PE = "1"
-PR = "r1"
+PR = "r2"
 
 DEFAULT_PREFERENCE = "1"
 
@@ -59,3 +59,35 @@ do_configure() {
 		sed -i -e s:Os:O4:g ${B}/config.h
 }
 
+do_stage() {
+        for lib in libavcodec libavdevice libavformat \
+                   libavutil libpostproc libswscale
+        do
+            oe_libinstall -a -so -C $lib $lib ${STAGING_LIBDIR} || true
+            install -d ${STAGING_INCDIR}/$lib 
+        done 
+
+        install -m 0644 ${S}/libavcodec/avcodec.h ${STAGING_INCDIR}/libavcodec/avcodec.h
+        install -m 0644 ${S}/libavcodec/opt.h ${STAGING_INCDIR}/libavcodec/opt.h
+
+        
+        for h in avformat.h avio.h rtp.h rtsp.h rtspcodes.h
+        do
+           install -m 0644 ${S}/libavformat/$h  ${STAGING_INCDIR}/libavformat/$h        
+        done
+
+                for h in adler32.h avstring.h avutil.h base64.h bswap.h \
+                 common.h crc.h fifo.h integer.h intfloat_readwrite.h \
+                 log.h lzo.h mathematics.h md5.h mem.h pixfmt.h random.h \
+                 rational.h sha1.h
+                do
+           install -m 0644 ${S}/libavutil/$h        ${STAGING_INCDIR}/libavutil/$h 
+        done
+
+        install -d ${STAGING_INCDIR}/libswscale/ 
+        install -m 0644 ${S}/libswscale/*.h ${STAGING_INCDIR}/libswscale/
+
+        install -d ${STAGING_INCDIR}/libpostproc
+        install -m 0644 ${S}/libpostproc/postprocess.h ${STAGING_INCDIR}/libpostproc/postprocess.h
+}
+
-- 
1.6.2.3


--ReaqsoxgOBHFXBhH--
