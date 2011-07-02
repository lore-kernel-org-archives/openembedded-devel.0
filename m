Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QczFL-0005kz-DX
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 14:24:31 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so4286957fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jul 2011 05:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=MRdRtcb2KX3JwJozyZBqnPH1KEpJ7F//YQshjAPoa7g=;
	b=x0eyCY2Azu1AbIjguGV7l839+qKxqbBai6jgDJXcwuuaxIMLt+R7d+AV6Ih2d0GrAj
	HiHmdrblP8JxtO7PmG+KXYfwNoVKyDIq1y3gmo7KZDqZNC7NcF+/JaauPeB3+dfptgTf
	ZVdEp+JJ5WEuXxt75AkYY4CUqUiI6YXHWy5DE=
Received: by 10.223.5.212 with SMTP id 20mr6420466faw.40.1309609242568;
	Sat, 02 Jul 2011 05:20:42 -0700 (PDT)
Received: from localhost.localdomain
	(85-127-149-243.dynamic.xdsl-line.inode.at [85.127.149.243])
	by mx.google.com with ESMTPS id j23sm3042570fai.39.2011.07.02.05.20.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jul 2011 05:20:42 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jul 2011 14:20:59 +0200
Message-Id: <e7293cb1cd6b1853e4ff3f9fe653142f7fb1cb06.1309608953.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1309608953.git.michael.lippautz@gmail.com>
References: <cover.1309608953.git.michael.lippautz@gmail.com>
Subject: [meta-oe][PATCH 3/4] audiofile: 0.2.6 -> 0.2.7
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
X-List-Received-Date: Sat, 02 Jul 2011 12:24:32 -0000

0.2.7 fixes various bugs of 0.2.6 and adds further support for WAVE and AIFF-C
formats.

* Rebase CVE-2008-5824 to apply again
* Drop patches already applied by upstream

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../audiofile-0.2.7/CVE-2008-5824-rebased.patch    |   22 ++++++++
 .../audiofile-0.2.7/audiofile-oldstyle.patch       |   55 ++++++++++++++++++++
 .../audiofile/audiofile_0.2.7.bb                   |   20 +++++++
 3 files changed, 97 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile-0.2.7/CVE-2008-5824-rebased.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile-0.2.7/audiofile-oldstyle.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.7/CVE-2008-5824-rebased.patch b/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.7/CVE-2008-5824-rebased.patch
new file mode 100644
index 0000000..66c4dc7
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.7/CVE-2008-5824-rebased.patch
@@ -0,0 +1,22 @@
+--- a/libaudiofile/modules/msadpcm.c	2011-04-20 18:49:58.000000000 +0200
++++ b/libaudiofile/modules/msadpcm.c	2011-04-20 18:52:07.993001282 +0200
+@@ -129,8 +129,7 @@ static int ms_adpcm_decode_block (ms_adp
+ 	ms_adpcm_state	*state[2];
+ 
+ 	/* Calculate the number of bytes needed for decoded data. */
+-	outputLength = msadpcm->framesPerBlock * sizeof (int16_t) *
+-		msadpcm->track->f.channelCount;
++	outputLength = msadpcm->framesPerBlock * sizeof (int16_t);
+ 
+ 	channelCount = msadpcm->track->f.channelCount;
+ 
+@@ -180,8 +179,7 @@ static int ms_adpcm_decode_block (ms_adp
+ 		The first two samples have already been 'decoded' in
+ 		the block header.
+ 	*/
+-	samplesRemaining = (msadpcm->framesPerBlock - 2) *
+-		msadpcm->track->f.channelCount;
++	samplesRemaining = (msadpcm->framesPerBlock - 2);
+ 
+ 	while (samplesRemaining > 0)
+ 	{
diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.7/audiofile-oldstyle.patch b/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.7/audiofile-oldstyle.patch
new file mode 100644
index 0000000..1b21150
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile-0.2.7/audiofile-oldstyle.patch
@@ -0,0 +1,55 @@
+--- libaudiofile/g711.c
++++ libaudiofile/g711.c
+@@ -81,10 +81,7 @@
+ 			    0xFFF, 0x1FFF, 0x3FFF, 0x7FFF};
+ 
+ static int
+-search(val, table, size)
+-	int		val;
+-	short		*table;
+-	int		size;
++search(int val, short int *table, int size)
+ {
+ 	int		i;
+ 
+@@ -115,8 +112,8 @@
+  * John Wiley & Sons, pps 98-111 and 472-476.
+  */
+ unsigned char
+-_af_linear2alaw(pcm_val)
+-	int		pcm_val;	/* 2's complement (16-bit range) */
++_af_linear2alaw(int pcm_val)
++                                       /* 2's complement (16-bit range) */
+ {
+ 	int		mask;
+ 	int		seg;
+@@ -151,8 +148,7 @@
+  *
+  */
+ int
+-_af_alaw2linear(a_val)
+-	unsigned char	a_val;
++_af_alaw2linear(unsigned char a_val)
+ {
+ 	int		t;
+ 	int		seg;
+@@ -269,8 +265,7 @@
+ 
+ /* A-law to u-law conversion */
+ static unsigned char
+-alaw2ulaw(aval)
+-	unsigned char	aval;
++alaw2ulaw(unsigned char aval)
+ {
+ 	aval &= 0xff;
+ 	return ((aval & 0x80) ? (0xFF ^ _a2u[aval ^ 0xD5]) :
+@@ -279,8 +274,7 @@
+ 
+ /* u-law to A-law conversion */
+ static unsigned char
+-ulaw2alaw(uval)
+-	unsigned char	uval;
++ulaw2alaw(unsigned char uval)
+ {
+ 	uval &= 0xff;
+ 	return ((uval & 0x80) ? (0xD5 ^ (_u2a[0xFF ^ uval] - 1)) :
diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
new file mode 100644
index 0000000..80ad132
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "The Audio File Library provides a uniform and elegant \
+API for accessing a variety of audio file formats, such as AIFF/AIFF-C, \
+WAVE, NeXT/Sun .snd/.au, Berkeley/IRCAM/CARL Sound File, Audio Visual \
+Research, Amiga IFF/8SVX, and NIST SPHERE."
+SECTION = "libs"
+LICENSE = "LGPLv2 && GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
+PR = "r0"
+
+SRC_URI = " \
+  http://www.68k.org/~michael/audiofile/${PN}-${PV}.tar.gz \
+  file://audiofile-oldstyle.patch;striplevel=0 \
+  file://CVE-2008-5824-rebased.patch \
+"
+
+inherit autotools lib_package binconfig
+
+SRC_URI[md5sum] = "a39be317a7b1971b408805dc5e371862"
+SRC_URI[sha256sum] = "a61c4036c2600a645843f16bec4be166093a9df5f15b02c85291213aa9cf15a2"
-- 
1.7.3.4



