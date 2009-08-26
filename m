Received: from [209.85.216.188] (helo=mail-px0-f188.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MgDER-0008Tl-TL
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 09:47:49 +0200
Received: by pxi26 with SMTP id 26so6565093pxi.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 00:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=OylD3nMctfgRzWaEaoFeQIXs7aiHOE09IU3Ve2kDjKc=;
	b=g0lKLwXnE2FFyQz8zp2XhGFXAqonqcsNHxg/y5Th08DnEANzWrxke4utaK9BhZzB5Z
	KO7YJBGgklgviMLO8zPDal/mu/TcUYlQSgJOGZatJ9OMOv8gneCj6F9JOLEN6mR0vr5c
	8j5NYG2KChWx+2FD9WCcnMK2WjRVpFpmDo9Ro=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=mEj0l7rRK28QYPPW1Q5oCF4mz1sDtKJDr8seCe3ryM8c4UqqBshTq3fgBZvDSj1LPm
	LlgDMlDwfUzLdVtRSSED2CmactQO4qc04IJCob9mbyQjJ8GAvcbJ5RmhIWSLuGpY4HJT
	Nv3NlFfMIm+DieDAxgkPzq/d2Z5AwTbhfJZuk=
Received: by 10.114.214.3 with SMTP id m3mr10448952wag.205.1251271789193;
	Wed, 26 Aug 2009 00:29:49 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id c26sm354246waa.50.2009.08.26.00.29.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Aug 2009 00:29:47 -0700 (PDT)
Message-ID: <4A94E45F.7030303@gmail.com>
Date: Wed, 26 Aug 2009 16:59:35 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] netsurf fixes for GCC-4.4, from netsurf svn.
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
X-List-Received-Date: Wed, 26 Aug 2009 07:47:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Netsurf appears to be statically linked with these libraries, so I
bumped its PR too.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/netsurf/files/hubbub-uninitialised.patch   |   35 ++++++++
 .../netsurf/files/libnsgif-strict-aliasing.patch   |   82 ++++++++++++++++++++
 recipes/netsurf/hubbub_0.0.1.bb                    |    5 +-
 recipes/netsurf/libnsgif_0.0.1.bb                  |    5 +-
 recipes/netsurf/netsurf_2.1.bb                     |    2 +
 5 files changed, 127 insertions(+), 2 deletions(-)
 create mode 100644 recipes/netsurf/files/hubbub-uninitialised.patch
 create mode 100644 recipes/netsurf/files/libnsgif-strict-aliasing.patch

diff --git a/recipes/netsurf/files/hubbub-uninitialised.patch b/recipes/netsurf/files/hubbub-uninitialised.patch
new file mode 100644
index 0000000..4f87120
--- /dev/null
+++ b/recipes/netsurf/files/hubbub-uninitialised.patch
@@ -0,0 +1,35 @@
+http://source.netsurf-browser.org/?view=rev&revision=7398
+Initialise variables to stop GCC 4.4 complaining (credit: Jeroen Habraken)
+
+--- hubbub/src/tokeniser/tokeniser.c	2009/04/06 15:22:16	7052
++++ hubbub/src/tokeniser/tokeniser.c	2009/05/05 17:18:41	7398
+@@ -787,7 +787,7 @@
+ 							+ 1);
+ 		} else {
+ 			parserutils_error error;
+-			const uint8_t *cptr;
++			const uint8_t *cptr = NULL;
+ 			error = parserutils_inputstream_peek(
+ 					tokeniser->input,
+ 					tokeniser->context.pending,
+@@ -1590,8 +1590,8 @@
+ 					tokeniser->context.match_entity.length
+ 					+ 1;
+ 		} else {
+-			size_t len;
+-			const uint8_t *cptr;
++			size_t len = 0;
++			const uint8_t *cptr = NULL;
+ 			parserutils_error error;
+ 
+ 			error = parserutils_inputstream_peek(
+@@ -3137,7 +3137,7 @@
+ {
+ 	hubbub_token token;
+ 	size_t len;
+-	const uint8_t *cptr;
++	const uint8_t *cptr = NULL;
+ 	parserutils_error error;
+ 
+ 	/* Calling this with nothing to output is a probable bug */
+
diff --git a/recipes/netsurf/files/libnsgif-strict-aliasing.patch b/recipes/netsurf/files/libnsgif-strict-aliasing.patch
new file mode 100644
index 0000000..4fe913c
--- /dev/null
+++ b/recipes/netsurf/files/libnsgif-strict-aliasing.patch
@@ -0,0 +1,82 @@
+http://source.netsurf-browser.org/?view=rev&revision=9027
+Stop utterly insane palette entry population.
+Palette entries are always ABGR, regardless of platform endianness.
+This change probably breaks big-endian platforms which, under the old approach,
+had palette entries of the form RGBA (assuming I understood the code correctly).
+
+http://source.netsurf-browser.org/?view=rev&revision=9138
+Fix palette entry population some more. Hopefully, it's completely endian
+agnostic now and still builds with GCC 4.4
+
+--- libnsgif/src/libnsgif.c	2009/03/29 01:43:27	6984
++++ libnsgif/src/libnsgif.c	2009/08/09 22:24:14	9138
+@@ -319,19 +319,34 @@
+ 				return GIF_INSUFFICIENT_DATA;
+ 			}
+ 			for (index = 0; index < gif->colour_table_size; index++) {
+-				char colour[] = {0, 0, 0, (char)0xff};
+-				colour[0] = gif_data[0];
+-				colour[1] = gif_data[1];
+-				colour[2] = gif_data[2];
+-				gif->global_colour_table[index] = *((int *) (void *) colour);
++				/* Gif colour map contents are r,g,b.
++				 *
++				 * We want to pack them bytewise into the 
++				 * colour table, such that the red component
++				 * is in byte 0 and the alpha component is in
++				 * byte 3.
++				 */
++				unsigned char *entry = (unsigned char *) &gif->
++						global_colour_table[index];
++
++				entry[0] = gif_data[0];	/* r */
++				entry[1] = gif_data[1];	/* g */
++				entry[2] = gif_data[2];	/* b */
++				entry[3] = 0xff;	/* a */
++
+ 				gif_data += 3;
+ 			}
+ 			gif->buffer_position = (gif_data - gif->gif_data);
+ 		} else {
+ 			/*	Create a default colour table with the first two colours as black and white
+ 			*/
+-			gif->global_colour_table[0] = 0xff000000;
+-			gif->global_colour_table[1] = 0xffffffff;
++			unsigned int *entry = gif->global_colour_table;
++
++			entry[0] = 0x00000000;
++			/* Force Alpha channel to opaque */
++			((unsigned char *) entry)[3] = 0xff;
++
++			entry[1] = 0xffffffff;
+ 		}
+ 	}
+ 
+@@ -844,11 +859,21 @@
+ 		colour_table = gif->local_colour_table;
+ 		if (!clear_image) {
+ 			for (index = 0; index < colour_table_size; index++) {
+-				char colour[] = {0, 0, 0, (char)0xff};
+-				colour[0] = gif_data[0];
+-				colour[1] = gif_data[1];
+-				colour[2] = gif_data[2];
+-				colour_table[index] = *((int *) (void *) colour);
++				/* Gif colour map contents are r,g,b.
++				 *
++				 * We want to pack them bytewise into the 
++				 * colour table, such that the red component
++				 * is in byte 0 and the alpha component is in
++				 * byte 3.
++				 */
++				unsigned char *entry = 
++					(unsigned char *) &colour_table[index];
++
++				entry[0] = gif_data[0];	/* r */
++				entry[1] = gif_data[1];	/* g */
++				entry[2] = gif_data[2];	/* b */
++				entry[3] = 0xff;	/* a */
++
+ 				gif_data += 3;
+ 			}
+ 		} else {
+
diff --git a/recipes/netsurf/hubbub_0.0.1.bb b/recipes/netsurf/hubbub_0.0.1.bb
index 0d70b41..bfbe71f 100644
--- a/recipes/netsurf/hubbub_0.0.1.bb
+++ b/recipes/netsurf/hubbub_0.0.1.bb
@@ -5,7 +5,10 @@ PRIORITY = "optional"
 LICENSE = "MIT"
 DEPENDS = "libparserutils"
 
-SRC_URI = "http://www.netsurf-browser.org/projects/releases/hubbub-${PV}-src.tar.gz"
+SRC_URI = "http://www.netsurf-browser.org/projects/releases/hubbub-${PV}-src.tar.gz \
+           file://hubbub-uninitialised.patch;patch=1"
+
+PR = "r1"
 
 inherit pkgconfig
 
diff --git a/recipes/netsurf/libnsgif_0.0.1.bb b/recipes/netsurf/libnsgif_0.0.1.bb
index 3b9cfc2..f2b1138 100644
--- a/recipes/netsurf/libnsgif_0.0.1.bb
+++ b/recipes/netsurf/libnsgif_0.0.1.bb
@@ -4,7 +4,10 @@ SECTION = "libs"
 PRIORITY = "optional"
 LICENSE = "MIT"
 
-SRC_URI = "http://www.netsurf-browser.org/projects/releases/libnsgif-${PV}-src.tar.gz"
+SRC_URI = "http://www.netsurf-browser.org/projects/releases/libnsgif-${PV}-src.tar.gz \
+           file://libnsgif-strict-aliasing.patch;patch=1"
+
+PR = "r1"
 
 inherit pkgconfig
 
diff --git a/recipes/netsurf/netsurf_2.1.bb b/recipes/netsurf/netsurf_2.1.bb
index 073f17f..849a8e5 100644
--- a/recipes/netsurf/netsurf_2.1.bb
+++ b/recipes/netsurf/netsurf_2.1.bb
@@ -11,6 +11,8 @@ SRC_URI = "http://www.netsurf-browser.org/downloads/releases/netsurf-${PV}-src.t
 	   file://netsurf.desktop \
 	   file://Makefile.config"
 
+PR = "r1"
+
 # Workaround for 2.1 tarball (unpacks into netsurf/, not netsurf-2.1/ )
 S = "${WORKDIR}/netsurf"
 
-- 
1.6.0.3



