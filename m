Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJcrF-0006pK-8k
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2012 06:16:21 +0200
Received: by mail-gh0-f175.google.com with SMTP id z2so14105ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 21:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=qLfkq/dYp0GKgktBqTV2TVOPJgrIwKfxAfyO1P2jW94=;
	b=lYaa8bnZ14+53JmXiP0xXwquTvs06RgRf9fhCwLfpxxMOzbVlBWcozX/3pNNX95mIw
	0ruqhpFcXAIKlW4j+rIqcURPishJpPTwT32hxV+apa1SnRWu7G9C9J0SotuG9kF9Jepb
	cWIaVvu3z3fSh5B9xhYZrZ2HYOaU7zBMMM2xipVAcagx2RwsOcyCIuLtaxguAYzYk160
	nVMWq2P1lXfzeAoPDk2BoLZep+MD+HQhh9f5YHh3JbnJpDy7kjoxLFwYX0E24jTuySEL
	MpMjDe2x+aEhJ1ZcM39In82B+yNaPaUgwzr7pxew6aAWcMlRZL02OuY/B/wx93Oln4FY
	bwqA==
Received: by 10.236.155.10 with SMTP id i10mr3944825yhk.91.1349323400600;
	Wed, 03 Oct 2012 21:03:20 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h22sm8519798yhk.13.2012.10.03.21.03.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 21:03:19 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Oct 2012 01:03:01 -0300
Message-Id: <1349323389-16520-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
References: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/9] libav: Convert to use dynamic packages to split libraries
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
X-List-Received-Date: Thu, 04 Oct 2012 04:16:21 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-multimedia/libav/libav.inc |   76 ++++++++++++----------------
 1 files changed, 33 insertions(+), 43 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index fc0b021..21b57b7 100644
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ b/meta-oe/recipes-multimedia/libav/libav.inc
@@ -11,7 +11,7 @@ ARM_INSTRUCTION_SET = "arm"
 # faac faad2 lame schroedinger libgsm
 DEPENDS = "virtual/libsdl zlib libogg libvorbis libvpx libtheora ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'liba52', d)}"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 inherit autotools pkgconfig
 
@@ -73,7 +73,7 @@ do_install_append() {
 FFMPEG_LIBS = "libavcodec libavdevice libavformat \
                libavutil libpostproc libswscale libavfilter"
 
-PACKAGES += "${PN}-vhook-dbg ${PN}-vhook"
+PACKAGES += "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
 
 RSUGGESTS_${PN} = "mplayer"
 FILES_${PN} = "${bindir}"
@@ -82,51 +82,41 @@ FILES_${PN}-dev = "${includedir}/${PN}"
 FILES_${PN}-vhook = "${libdir}/vhook"
 FILES_${PN}-vhook-dbg += "${libdir}/vhook/.debug"
 
-
-PACKAGES += "ffmpeg-x264-presets \
-             libavcodec  libavcodec-dev  libavcodec-dbg \
-             libavdevice libavdevice-dev libavdevice-dbg \
-             libavformat libavformat-dev libavformat-dbg \
-             libavutil   libavutil-dev   libavutil-dbg \
-             libpostproc libpostproc-dev libpostproc-dbg \
-             libswscale  libswscale-dev  libswscale-dbg \
-             libavfilter libavfilter-dev libavfilter-dbg \
-             libavcore   libavcore-dev   libavcore-dbg \
-            "
-
 FILES_ffmpeg-x264-presets = "${datadir}/*.ffpreset"
 
 LEAD_SONAME = "libavcodec.so"
 
 FILES_${PN}-dev = "${includedir}"
-FILES_libavcodec = "${libdir}/libavcodec*.so.*"
-FILES_libavcodec-dev = "${libdir}/libavcodec*.so ${libdir}/pkgconfig/libavcodec.pc ${libdir}/libavcodec*.a"
-FILES_libavcodec-dbg += "${libdir}/.debug/libavcodec*"
-
-FILES_libavdevice = "${libdir}/libavdevice*.so.*"
-FILES_libavdevice-dev = "${libdir}/libavdevice*.so ${libdir}/pkgconfig/libavdevice.pc ${libdir}/libavdevice*.a"
-FILES_libavdevice-dbg += "${libdir}/.debug/libavdevice*"
-
-FILES_libavformat = "${libdir}/libavformat*.so.*"
-FILES_libavformat-dev = "${libdir}/libavformat*.so ${libdir}/pkgconfig/libavformat.pc ${libdir}/libavformat*.a"
-FILES_libavformat-dbg += "${libdir}/.debug/libavformat*"
 
-FILES_libavutil = "${libdir}/libavutil*.so.*"
-FILES_libavutil-dev = "${libdir}/libavutil*.so ${libdir}/pkgconfig/libavutil.pc ${libdir}/libavutil*.a"
-FILES_libavutil-dbg += "${libdir}/.debug/libavutil*"
-
-FILES_libpostproc = "${libdir}/libpostproc*.so.*"
-FILES_libpostproc-dev = "${libdir}/libpostproc*.so  ${libdir}/pkgconfig/libpostproc.pc ${libdir}/libpostproc*.a ${includedir}/postproc"
-FILES_libpostproc-dbg += "${libdir}/.debug/libpostproc*"
-
-FILES_libswscale = "${libdir}/libswscale*.so.*"
-FILES_libswscale-dev = "${libdir}/libswscale*.so ${libdir}/pkgconfig/libswscale.pc ${libdir}/libswscale*.a"
-FILES_libswscale-dbg += "${libdir}/.debug/libswscale*"
-
-FILES_libavfilter = "${libdir}/libavfilter*.so.*"
-FILES_libavfilter-dev = "${libdir}/libavfilter*.so ${libdir}/pkgconfig/libavfilter.pc ${libdir}/libavfilter*.a"
-FILES_libavfilter-dbg += "${libdir}/.debug/libavfilter*"
+python populate_packages_prepend() {
+    av_libdir = bb.data.expand('${libdir}', d)
+    av_pkgconfig = bb.data.expand('${libdir}/pkgconfig', d)
+
+    # Runtime package
+    do_split_packages(d, av_libdir, '^lib(.*)\.so\..*',
+                      output_pattern='lib%s',
+                      description='libav %s library',
+                      prepend=True,
+                      allow_links=True)
+
+    # Development packages (-dev, -staticdev)
+    do_split_packages(d, av_libdir, '^lib(.*)\.so$',
+                      output_pattern='lib%s-dev',
+                      description='libav %s development package',
+                      extra_depends='${PN}-dev',
+                      prepend=True,
+                      allow_links=True)
+    do_split_packages(d, av_pkgconfig, '^lib(.*)\.pc$',
+                      output_pattern='lib%s-dev',
+                      description='libav %s development package',
+                      extra_depends='${PN}-dev',
+                      prepend=True)
+    do_split_packages(d, av_libdir, '^lib(.*)\.a$',
+                      output_pattern='lib%s-staticdev',
+                      description='libav %s development package - static library',
+                      extra_depends='${PN}-dev',
+                      prepend=True,
+                      allow_links=True)
+}
 
-FILES_libavcore = "${libdir}/libavcore*.so.*"
-FILES_libavcore-dev = "${libdir}/libavcore*.so ${libdir}/pkgconfig/libavcore.pc ${libdir}/libavcore*.a"
-FILES_libavcore-dbg += "${libdir}/.debug/libavcore*"
+PACKAGES_DYNAMIC = "lib*"
-- 
1.7.2.5



