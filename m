Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id B97A1736B6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 17:29:54 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id i7so7665351qkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 10:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Wppx0j7E3D/TbQB5jtKle6PWfHgVRsdc/6xBPMm2zJo=;
	b=Ilw9SEJz2fTHQ/VIznHeCpF+EbV+GIR8E1uvNFTSnVaRefaSrob83haDkPexCDpylF
	6GqCR343l59fgfTzwX5ikD8e4TRvwHPmB3LUj3ia258aqYaS3s6WAGM4mKJQKP0Auv+e
	euOEBe8Nyi3L4/ErwhLdQE1r+iLSDgE+yvNd64il43hVUio3GNWqmCAxDuzCDA/TyuYW
	IznBMDYD3kGg64mFgAoPqI1GSqdsEdyJQzSCYhJ9aQTyIIwzi8A3Z3u4Un8oJK1kmZwq
	GiZBrT9KLnaetw0Mj1I08Y2HtRUHfA7DTMqKpBDm/M+R2uwhDupXWK0Ist2SLFK+zKRD
	8rDA==
X-Gm-Message-State: AOPr4FXy337X64PtgSg2QfQbxYuFHLCd4hT9ZdKwjrNWllV7Vpz3DrTp7/ELUUblUgJrqQ==
X-Received: by 10.55.106.3 with SMTP id f3mr22565863qkc.177.1462555794832;
	Fri, 06 May 2016 10:29:54 -0700 (PDT)
Received: from lnx-dereks-laptop.minotaur.lab
	(c-73-172-178-168.hsd1.md.comcast.net. [73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 141sm6113089qhk.7.2016.05.06.10.29.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 May 2016 10:29:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 May 2016 13:29:26 -0400
Message-Id: <1462555768-3318-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-gnome][PATCH 1/3] tracker: add a patch to support giflib 5
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
X-List-Received-Date: Fri, 06 May 2016 17:29:56 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../tracker/tracker-0.14.2/giflib5-support.patch   | 126 +++++++++++++++++++++
 .../recipes-support/tracker/tracker_0.14.2.bb      |   3 +-
 2 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-support/tracker/tracker-0.14.2/giflib5-support.patch

diff --git a/meta-gnome/recipes-support/tracker/tracker-0.14.2/giflib5-support.patch b/meta-gnome/recipes-support/tracker/tracker-0.14.2/giflib5-support.patch
new file mode 100644
index 0000000..fab3371
--- /dev/null
+++ b/meta-gnome/recipes-support/tracker/tracker-0.14.2/giflib5-support.patch
@@ -0,0 +1,126 @@
+ src/tracker-extract/tracker-extract-gif.c |   36 +++++++++++++++++++++++++++++
+ 1 file changed, 36 insertions(+)
+--- a/src/tracker-extract/tracker-extract-gif.c	
++++ a/src/tracker-extract/tracker-extract-gif.c	
+@@ -75,6 +75,39 @@
+ 	return (GIF_OK);
+ }
+ 
++#if GIFLIB_MAJOR >= 5
++static inline void
++gif_error (const gchar *action, int err)
++{
++	const char *str = GifErrorString (err);
++	if (str != NULL) {
++		g_message ("%s, error: '%s'", action, str);
++	} else {
++		g_message ("%s, undefined error %d", action, err);
++	}
++}
++#else /* GIFLIB_MAJOR >= 5 */
++static inline void print_gif_error()
++{
++#if defined(GIFLIB_MAJOR) && defined(GIFLIB_MINOR) && ((GIFLIB_MAJOR == 4 && GIFLIB_MINOR >= 2) || GIFLIB_MAJOR > 4)
++	const char *str = GifErrorString ();
++	if (str != NULL) {
++		g_message ("GIF, error: '%s'", str);
++	} else {
++		g_message ("GIF, undefined error");
++	}
++#else
++	PrintGifError();
++#endif
++}
++#endif /* GIFLIB_MAJOR >= 5 */
++
++/* giflib 5.1 changed the API of DGifCloseFile to take two arguments */
++#if !defined(GIFLIB_MAJOR) || \
++    !(GIFLIB_MAJOR > 5 || (GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1))
++#define DGifCloseFile(a, b) DGifCloseFile(a)
++#endif
++
+ static void
+ read_metadata (TrackerSparqlBuilder *preupdate,
+                TrackerSparqlBuilder *metadata,
+@@ -100,14 +133,22 @@
+ 		ExtBlock extBlock;
+ 
+ 		if (DGifGetRecordType(gifFile, &RecordType) == GIF_ERROR) {
+-			PrintGifError();
++#if GIFLIB_MAJOR < 5
++			print_gif_error ();
++#else  /* GIFLIB_MAJOR < 5 */
++			gif_error ("Could not read next GIF record type", gifFile->Error);
++#endif /* GIFLIB_MAJOR < 5 */
+ 			return;
+ 		}
+ 
+ 		switch (RecordType) {
+ 			case IMAGE_DESC_RECORD_TYPE:
+ 			if (DGifGetImageDesc(gifFile) == GIF_ERROR) {
+-				PrintGifError();
++#if GIFLIB_MAJOR < 5
++				print_gif_error();
++#else  /* GIFLIB_MAJOR < 5 */
++				gif_error ("Could not get GIF record information", gifFile->Error);
++#endif /* GIFLIB_MAJOR < 5 */
+ 				return;
+ 			}
+ 
+@@ -117,7 +158,11 @@
+ 			framedata = g_malloc (framewidth*frameheight);
+ 
+ 			if (DGifGetLine(gifFile, framedata, framewidth*frameheight)==GIF_ERROR) {
+-				PrintGifError();
++#if GIFLIB_MAJOR < 5
++				print_gif_error();
++#else  /* GIFLIB_MAJOR < 5 */
++				gif_error ("Could not load a block of GIF pixes", gifFile->Error);
++#endif /* GIFLIB_MAJOR < 5 */
+ 				return;
+ 			}
+ 
+@@ -593,6 +638,9 @@
+ 	gchar *filename, *uri;
+ 	GFile *file;
+ 	int fd;
++#if GIFLIB_MAJOR >= 5
++	int err;
++#endif
+ 
+ 	preupdate = tracker_extract_info_get_preupdate_builder (info);
+ 	metadata = tracker_extract_info_get_metadata_builder (info);
+@@ -617,8 +665,14 @@
+ 		return FALSE;
+ 	}	
+ 
++#if GIFLIB_MAJOR < 5
+ 	if ((gifFile = DGifOpenFileHandle (fd)) == NULL) {
+-		PrintGifError ();
++		print_gif_error ();
++#else   /* GIFLIB_MAJOR < 5 */
++	if ((gifFile = DGifOpenFileHandle (fd, &err)) == NULL) {
++		gif_error ("Could not open GIF file with handle", err);
++#endif /* GIFLIB_MAJOR < 5 */
++		g_free (filename);
+ 		close (fd);
+ 		return FALSE;
+ 	}
+@@ -637,10 +691,15 @@
+ 	g_string_free (where, TRUE);
+ 
+ 	g_free (uri);
+-
++#if GIFLIB_MAJOR < 5
+ 	if (DGifCloseFile (gifFile) != GIF_OK) {
+-		PrintGifError ();
++		print_gif_error ();
++	}
++#else  /* GIFLIB_MAJOR < 5 */
++	if (DGifCloseFile (gifFile, NULL) != GIF_OK) {
++		gif_error ("Could not close GIF file", gifFile->Error);
+ 	}
++#endif /* GIFLIB_MAJOR < 5 */
+ 
+ 	return TRUE;
+ }
diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
index c52d95e..fa7fcd5 100644
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
@@ -13,7 +13,8 @@ inherit autotools pkgconfig gnomebase gettext gsettings systemd gobject-introspe
 VER_DIR = "${@gnome_verdir("${PV}")}"
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/tracker/${VER_DIR}/tracker-${PV}.tar.xz \
            file://enable-sqlite-crosscompile.patch \
-	   file://fix-removable-media-detection.patch \
+           file://fix-removable-media-detection.patch \
+           file://giflib5-support.patch \
            file://90tracker \
            file://tracker-store.service \
            file://tracker-miner-fs.service \
-- 
1.9.1


