Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQKil-0008En-7d
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 15:10:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 017F8314B863
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 15:08:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id etcmg1u1fHAn
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 15:08:41 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 43D16314B856
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 15:08:40 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 08 Dec 2010 14:08:40 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Dec 2010 14:08:39 +0000
Message-Id: <1291817320-5270-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] ffmpeg: set default license to GPLv2+, because --enable-gpl is used.
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
X-List-Received-Date: Wed, 08 Dec 2010 14:10:15 -0000

* See http://www.ffmpeg.org/legal.html

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/ffmpeg/ffmpeg.inc    |    4 ++--
 recipes/ffmpeg/ffmpeg_svn.bb |    3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/recipes/ffmpeg/ffmpeg.inc b/recipes/ffmpeg/ffmpeg.inc
index b6dfe53..9cfdc19 100644
--- a/recipes/ffmpeg/ffmpeg.inc
+++ b/recipes/ffmpeg/ffmpeg.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://ffmpeg.mplayerhq.hu/"
 AUTHOR = "Fabrice Bellard ffmpeg-devel@mplayerhq.hu"
 SECTION = "libs"
 PRIORITY = "optional"
-LICENSE = "LGPL"
+LICENSE = "GPLv2+"
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -12,7 +12,7 @@ PE = "2"
 DEPENDS = "zlib libogg libvorbis libtheora faac faad2 ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'lame liba52', d)}"
 RSUGGESTS_${PN} = "mplayer"
 
-INC_PR = "r16"
+INC_PR = "r17"
 
 inherit autotools pkgconfig
 
diff --git a/recipes/ffmpeg/ffmpeg_svn.bb b/recipes/ffmpeg/ffmpeg_svn.bb
index 6f51a60..573de03 100644
--- a/recipes/ffmpeg/ffmpeg_svn.bb
+++ b/recipes/ffmpeg/ffmpeg_svn.bb
@@ -1,8 +1,5 @@
 require ffmpeg.inc
 
-# The license depends on the configure option selected in this recipe 'non-free' is disabled and 'gpl' is enabled
-LICENSE = "GPLv2+"
-
 DEPENDS += "virtual/libsdl schroedinger libgsm libvpx"
 
 # When bumping SRCREV make sure you bump PR here and in dependant recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION changes
-- 
1.7.2.3



