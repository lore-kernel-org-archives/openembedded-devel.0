Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UFXdx-00046I-Jm
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Mar 2013 23:26:02 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Mar 2013 23:09:21 +0100
Message-Id: <1363126161-9828-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] libav: library packages shouldn't rdepend on libav package
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
X-List-Received-Date: Tue, 12 Mar 2013 22:26:16 -0000

Otherwise the libav executables (avplay, ffmpeg etc.) get dragged
into the image, along with all their dependencies (e.g. SDL).

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-multimedia/libav/libav.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index 388a567..54307af 100644
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ b/meta-oe/recipes-multimedia/libav/libav.inc
@@ -11,7 +11,7 @@ ARM_INSTRUCTION_SET = "arm"
 # faac faad2 lame schroedinger libgsm
 DEPENDS = "x264 virtual/libsdl zlib libogg libvorbis libvpx libtheora ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'liba52', d)}"
 
-INC_PR = "r7"
+INC_PR = "r8"
 
 inherit autotools pkgconfig
 
@@ -96,6 +96,7 @@ python populate_packages_prepend() {
     do_split_packages(d, av_libdir, '^lib(.*)\.so\..*',
                       output_pattern='lib%s',
                       description='libav %s library',
+                      extra_depends='',
                       prepend=True,
                       allow_links=True)
 
-- 
1.7.10.4



