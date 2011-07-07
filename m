Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1Qeonp-0008Vc-HK
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 15:39:37 +0200
Received: by mail-bw0-f47.google.com with SMTP id 20so1009142bwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 06:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=0HiMZQDXw/5Lnm6hXD6pmNyTzLBA7QLPsdC2bO9rsC8=;
	b=vFhuJ/Vx7eLUWiQVBUUnGDw08M4zsitQqov5ZaceAisboUWjVn1vBFoEa3JlCPil3a
	tbDSZ8vQn5jriZzxBowmKsTIjfbrILkI4ZO3YMaW+67j0gnPmyEltL1qkJE5Tj43WsHg
	WCp8bX1oZwUithq3kMO+JA+cIOgx2pWkAlnEo=
Received: by 10.204.33.73 with SMTP id g9mr716507bkd.171.1310045748070;
	Thu, 07 Jul 2011 06:35:48 -0700 (PDT)
Received: from localhost.localdomain (wgr614v6.plus.sbg.ac.at
	[141.201.137.156])
	by mx.google.com with ESMTPS id l24sm8546993bkw.15.2011.07.07.06.35.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jul 2011 06:35:47 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jul 2011 15:36:06 +0200
Message-Id: <63b36c917be1783ac90da4fc87ac8353f4146721.1310045515.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310045515.git.michael.lippautz@gmail.com>
References: <cover.1310045515.git.michael.lippautz@gmail.com>
Subject: [meta-oe][PATCHv2 3/4] audiofile: Update 0.2.6 to 0.2.7
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
X-List-Received-Date: Thu, 07 Jul 2011 13:39:37 -0000

0.2.7 fixes various bugs of 0.2.6 and adds further support for WAVE and AIFF-C
formats.

Drop patches:
* CVE-2008-5824 is already fixed in 0.2.7 (patch has just been a workaround):
  https://github.com/mpruett/audiofile/commit/e8cf0095b3f319739f9aa1ab5a1aa52b76be8cdd
* oldstyle patch is not needed , since current toolchain compiles C files
  with old style function declarations
* audiofile-0.2.6 patch is already applied in 0.2.7
* audiofile-m4_quote_fix is already applied in 0.2.7

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../audiofile/audiofile-0.2.6/CVE-2008-5824.patch  |   23 -------
 .../audiofile-0.2.6/audiofile-0.2.6.patch          |   67 --------------------
 .../audiofile-0.2.6/audiofile-m4_quote_fix.diff    |   11 ---
 .../audiofile-0.2.6/audiofile-oldstyle.patch       |   55 ----------------
 .../{audiofile_0.2.6.bb => audiofile_0.2.7.bb}     |   14 ++---
 5 files changed, 5 insertions(+), 165 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/CVE-2008-5824.patch
 delete mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/audiofile-0.2.6.patch
 delete mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/audiofile-m4_quote_fix.diff
 delete mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/audiofile-oldstyle.patch
 rename meta-oe/recipes-multimedia/audiofile/{audiofile_0.2.6.bb => audiofile_0.2.7.bb} (55%)

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/CVE-2008-5824.patch b/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/CVE-2008-5824.patch
deleted file mode 100644
index 31233d2..0000000
--- a/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/CVE-2008-5824.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-diff -Naur audiofile-0.2.6/libaudiofile/modules/msadpcm.c audiofile-0.2.6-mp/libaudiofile/modules/msadpcm.c
---- audiofile-0.2.6/libaudiofile/modules/msadpcm.c	2004-03-06 07:39:23.000000000 +0100
-+++ audiofile-0.2.6-mp/libaudiofile/modules/msadpcm.c	2009-01-20 20:05:14.919961000 +0100
-@@ -129,8 +129,7 @@
- 	ms_adpcm_state	*state[2];
- 
- 	/* Calculate the number of bytes needed for decoded data. */
--	outputLength = msadpcm->samplesPerBlock * sizeof (int16_t) *
--		msadpcm->track->f.channelCount;
-+	outputLength = msadpcm->samplesPerBlock * sizeof (int16_t);
- 
- 	channelCount = msadpcm->track->f.channelCount;
- 
-@@ -180,8 +179,7 @@
- 		The first two samples have already been 'decoded' in
- 		the block header.
- 	*/
--	samplesRemaining = (msadpcm->samplesPerBlock - 2) *
--		msadpcm->track->f.channelCount;
-+	samplesRemaining = msadpcm->samplesPerBlock - 2; 
- 
- 	while (samplesRemaining > 0)
- 	{
diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/audiofile-0.2.6.patch b/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/audiofile-0.2.6.patch
deleted file mode 100644
index b73db7e..0000000
--- a/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/audiofile-0.2.6.patch
+++ /dev/null
@@ -1,67 +0,0 @@
---- test/instparamtest.c
-+++ test/instparamtest.c
-@@ -74,4 +74,5 @@
- 	printf("release loop id: %ld\n", result);
- 
- 	afCloseFile(file);
-+	return 0;
- }
---- test/instparamwrite.c
-+++ test/instparamwrite.c
-@@ -52,4 +52,5 @@
- 	afSetInstParamLong(file, AF_DEFAULT_INST, AF_INST_NUMCENTS_DETUNE, -30);
- 
- 	afCloseFile(file);
-+	return 0;
- }
---- test/loop.c
-+++ test/loop.c
-@@ -34,4 +34,5 @@
- 	afSetLoopEnd(file, AF_DEFAULT_INST, 2, 4);
- 
- 	afCloseFile(file);
-+	return 0;
- }
---- test/twentyfour.c.xx	2005-09-16 22:38:59.000000000 +0200
-+++ test/twentyfour.c	2005-09-16 22:39:53.000000000 +0200
-@@ -36,7 +36,9 @@
- #endif
- 
- #include <stdio.h>
-+#include <string.h>
- #include <stdlib.h>
-+#include <unistd.h>
- #include <audiofile.h>
- #include <assert.h>
- 
---- test/pipe.c.xx	2005-09-16 22:39:36.000000000 +0200
-+++ test/pipe.c	2005-09-16 22:39:42.000000000 +0200
-@@ -36,6 +36,7 @@
- 
- #include <audiofile.h>
- #include <stdio.h>
-+#include <string.h>
- #include <stdlib.h>
- 
- #define SAMPLE_COUNT 12
---- test/error.c.xx	2005-09-16 22:40:02.000000000 +0200
-+++ test/error.c	2005-09-16 22:40:11.000000000 +0200
-@@ -25,6 +25,7 @@
- 
- #include <stdio.h>
- #include <stdlib.h>
-+#include <string.h>
- #include <audiofile.h>
- 
- int expectedError;
---- test/testmarkers.c.xx	2005-09-16 22:40:21.000000000 +0200
-+++ test/testmarkers.c	2005-09-16 22:40:41.000000000 +0200
-@@ -25,6 +25,8 @@
- 
- #include <stdio.h>
- #include <stdlib.h>
-+#include <string.h>
-+#include <unistd.h>
- #include <assert.h>
- #include <audiofile.h>
- 
diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/audiofile-m4_quote_fix.diff b/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/audiofile-m4_quote_fix.diff
deleted file mode 100644
index 1c02bf8..0000000
--- a/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/audiofile-m4_quote_fix.diff
+++ /dev/null
@@ -1,11 +0,0 @@
---- audiofile.m4
-+++ audiofile.m4
-@@ -9,7 +9,7 @@
- dnl AM_PATH_AUDIOFILE([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]]])
- dnl Test for Audio File Library, and define AUDIOFILE_CFLAGS and AUDIOFILE_LIBS.
- dnl
--AC_DEFUN(AM_PATH_AUDIOFILE,
-+AC_DEFUN([AM_PATH_AUDIOFILE],
- [dnl 
- dnl Get compiler flags and libraries from the audiofile-config script.
- dnl
diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/audiofile-oldstyle.patch b/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/audiofile-oldstyle.patch
deleted file mode 100644
index 1b21150..0000000
--- a/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.6/audiofile-oldstyle.patch
+++ /dev/null
@@ -1,55 +0,0 @@
---- libaudiofile/g711.c
-+++ libaudiofile/g711.c
-@@ -81,10 +81,7 @@
- 			    0xFFF, 0x1FFF, 0x3FFF, 0x7FFF};
- 
- static int
--search(val, table, size)
--	int		val;
--	short		*table;
--	int		size;
-+search(int val, short int *table, int size)
- {
- 	int		i;
- 
-@@ -115,8 +112,8 @@
-  * John Wiley & Sons, pps 98-111 and 472-476.
-  */
- unsigned char
--_af_linear2alaw(pcm_val)
--	int		pcm_val;	/* 2's complement (16-bit range) */
-+_af_linear2alaw(int pcm_val)
-+                                       /* 2's complement (16-bit range) */
- {
- 	int		mask;
- 	int		seg;
-@@ -151,8 +148,7 @@
-  *
-  */
- int
--_af_alaw2linear(a_val)
--	unsigned char	a_val;
-+_af_alaw2linear(unsigned char a_val)
- {
- 	int		t;
- 	int		seg;
-@@ -269,8 +265,7 @@
- 
- /* A-law to u-law conversion */
- static unsigned char
--alaw2ulaw(aval)
--	unsigned char	aval;
-+alaw2ulaw(unsigned char aval)
- {
- 	aval &= 0xff;
- 	return ((aval & 0x80) ? (0xFF ^ _a2u[aval ^ 0xD5]) :
-@@ -279,8 +274,7 @@
- 
- /* u-law to A-law conversion */
- static unsigned char
--ulaw2alaw(uval)
--	unsigned char	uval;
-+ulaw2alaw(unsigned char uval)
- {
- 	uval &= 0xff;
- 	return ((uval & 0x80) ? (0xD5 ^ (_u2a[0xFF ^ uval] - 1)) :
diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
similarity index 55%
rename from meta-oe/recipes-multimedia/audiofile/audiofile_0.2.6.bb
rename to meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
index ed273c8..a21bec6 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
@@ -2,19 +2,15 @@ DESCRIPTION = "The Audio File Library provides a uniform and elegant \
 API for accessing a variety of audio file formats, such as AIFF/AIFF-C, \
 WAVE, NeXT/Sun .snd/.au, Berkeley/IRCAM/CARL Sound File, Audio Visual \
 Research, Amiga IFF/8SVX, and NIST SPHERE."
+HOMEPAGE = "http://www.68k.org/~michael/audiofile/"
 SECTION = "libs"
 LICENSE = "LGPLv2 && GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
+PR = "r0"
 
-SRC_URI = "http://www.68k.org/~michael/audiofile/audiofile-${PV}.tar.gz \
-	   file://audiofile-m4_quote_fix.diff;striplevel=0 \
-	   file://audiofile-oldstyle.patch;striplevel=0 \
-	   file://audiofile-0.2.6.patch;striplevel=0 \
-	   file://CVE-2008-5824.patch \
-"
+SRC_URI = "http://www.68k.org/~michael/audiofile/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "a39be317a7b1971b408805dc5e371862"
+SRC_URI[sha256sum] = "a61c4036c2600a645843f16bec4be166093a9df5f15b02c85291213aa9cf15a2"
 
 inherit autotools lib_package binconfig
-
-SRC_URI[md5sum] = "9c1049876cd51c0f1b12c2886cce4d42"
-SRC_URI[sha256sum] = "4b6167b56e21556fb07c9ef06962fe32817064c62181ba47afd3322e0d0f22a9"
-- 
1.7.3.4



