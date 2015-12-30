Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 24FCF6FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 18:41:59 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id o67so357616567iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 10:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VLMvZGjHpPXzTpwnSrxJmLt9DHI9Mre6UPSHzGfk5sE=;
	b=RkmpCqBzuNudtp0pCPpTmJI94RqifViCigCRl9ruGZ2Ki8tLW9zx2pP3gxw1kB3HvI
	HWSOpOmTk46fl+iiZLL/2iARrQG4/kKLLf3TuTmuTc9OQtrPUIkKQ0Rm9PRpwLkaNWZP
	MYhbt0C+llfLuafCQ8iCSoDSbcoo+zUf0taY5fYaBRp8AlfJzYy1L4FTgcj8IZ4TFrF1
	OKQCvkiZX+e4X5ZOw4KT3rHeyK0CZPJXeVdGF1wY5A1ry+8BHCplcRwbnKP+cQNENHPb
	b70XZEZHUbxj+MRjctWcXf48ze3qxBNdz9dDU34pdDrMGGi6ha56knnxHeebLWEkazbA
	Y2IA==
X-Received: by 10.107.165.14 with SMTP id o14mr7209401ioe.49.1451500920482;
	Wed, 30 Dec 2015 10:42:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Wed, 30 Dec 2015 10:41:30 -0800 (PST)
In-Reply-To: <1451500652-26600-1-git-send-email-cleitonrbueno@gmail.com>
References: <1451500652-26600-1-git-send-email-cleitonrbueno@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Dec 2015 10:41:30 -0800
Message-ID: <CAMKF1sreX+tnzJmXMAxTdLKizCYwuxfjjSa6bf0Br3MZj4cJkg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Cleiton Bueno <cleitonrbueno@gmail.com>
Subject: Re: [meta-qt5][PATH] qtwebengine: Fix build codec jpeg_codec.cc error: invalid conversion from 'int' to 'boolean' [-fpermissive], media_capture_devices_dispatcher.cpp FIX 'QCoreApplication' has not been declared and file API qquickwebengineview_p_p.h field 'm_backgroundColor' has incomplete type 'QColor'
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
X-List-Received-Date: Wed, 30 Dec 2015 18:42:02 -0000
Content-Type: text/plain; charset=UTF-8

while the patches are fine, subject line is too long, please resend by
making the subject summary smaller and crisper
you can put the details in the commit message after one line summary on top

On Wed, Dec 30, 2015 at 10:37 AM, Cleiton Bueno <cleitonrbueno@gmail.com> wrote:
> Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
> ---
>  ...ec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch | 64 ++++++++++++++++++++++
>  ...cher.h-Include-QCoreApplication-translate.patch | 26 +++++++++
>  ...-qquickwebengineview_p_p.h-add-inc-QColor.patch | 26 +++++++++
>  recipes-qt/qt5/qtwebengine_git.bb                  |  4 ++
>  4 files changed, 120 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtwebengine/0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch
>  create mode 100644 recipes-qt/qt5/qtwebengine/0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch
>  create mode 100644 recipes-qt/qt5/qtwebengine/0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch
>
> diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch
> new file mode 100644
> index 0000000..3707cbe
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebengine/0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch
> @@ -0,0 +1,64 @@
> +From 54b183ada5b5ead1c4b6e6532e24d21f372d70d7 Mon Sep 17 00:00:00 2001
> +From: Cleiton Bueno <cleitonrbueno@gmail.com>
> +Date: Thu, 24 Dec 2015 12:46:58 -0200
> +Subject: [PATCH] Change false to FALSE and 1 to TRUE, FIX qtwebengine compile
> +
> +Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
> +---
> + src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc b/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
> +index 8a08fe0..32b2a05 100644
> +--- a/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
> ++++ b/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
> +@@ -120,7 +120,7 @@ boolean EmptyOutputBuffer(jpeg_compress_struct* cinfo) {
> +   // tell libjpeg where to write the next data
> +   cinfo->dest->next_output_byte = &(*state->out)[state->image_buffer_used];
> +   cinfo->dest->free_in_buffer = state->out->size() - state->image_buffer_used;
> +-  return 1;
> ++  return TRUE;
> + }
> +
> + // Cleans up the JpegEncoderState to prepare for returning in the final form.
> +@@ -261,7 +261,7 @@ bool JPEGCodec::Encode(const unsigned char* input, ColorFormat format,
> +   cinfo.data_precision = 8;
> +
> +   jpeg_set_defaults(&cinfo);
> +-  jpeg_set_quality(&cinfo, quality, 1);  // quality here is 0-100
> ++  jpeg_set_quality(&cinfo, quality, TRUE);  // quality here is 0-100
> +
> +   // set up the destination manager
> +   jpeg_destination_mgr destmgr;
> +@@ -273,7 +273,7 @@ bool JPEGCodec::Encode(const unsigned char* input, ColorFormat format,
> +   JpegEncoderState state(output);
> +   cinfo.client_data = &state;
> +
> +-  jpeg_start_compress(&cinfo, 1);
> ++  jpeg_start_compress(&cinfo, TRUE);
> +
> +   // feed it the rows, doing necessary conversions for the color format
> + #ifdef JCS_EXTENSIONS
> +@@ -359,7 +359,7 @@ void InitSource(j_decompress_ptr cinfo) {
> + //   set to a positive value if TRUE is returned. A FALSE return should only
> + //   be used when I/O suspension is desired."
> + boolean FillInputBuffer(j_decompress_ptr cinfo) {
> +-  return false;
> ++  return FALSE;
> + }
> +
> + // Skip data in the buffer. Since we have all the data at once, this operation
> +@@ -487,8 +487,8 @@ bool JPEGCodec::Decode(const unsigned char* input, size_t input_size,
> +   cinfo.client_data = &state;
> +
> +   // fill the file metadata into our buffer
> +-  if (jpeg_read_header(&cinfo, true) != JPEG_HEADER_OK)
> +-    return false;
> ++  if (jpeg_read_header(&cinfo, TRUE) != JPEG_HEADER_OK)
> ++    return FALSE;
> +
> +   // we want to always get RGB data out
> +   switch (cinfo.jpeg_color_space) {
> +--
> +1.8.1.2
> +
> diff --git a/recipes-qt/qt5/qtwebengine/0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch
> new file mode 100644
> index 0000000..1b637cb
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebengine/0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch
> @@ -0,0 +1,26 @@
> +From 23e391f08f36d9ab9c0030ae52b3821ec9f3c3ed Mon Sep 17 00:00:00 2001
> +From: Cleiton Bueno <cleitonrbueno@gmail.com>
> +Date: Thu, 24 Dec 2015 15:59:51 -0200
> +Subject: [PATCH] Include dependency to QCoreApplication::translate()
> +
> +Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
> +---
> + src/core/media_capture_devices_dispatcher.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/core/media_capture_devices_dispatcher.h b/src/core/media_capture_devices_dispatcher.h
> +index 500fe76..eda2824 100644
> +--- a/src/core/media_capture_devices_dispatcher.h
> ++++ b/src/core/media_capture_devices_dispatcher.h
> +@@ -43,6 +43,8 @@
> + #include <map>
> + #include <QtCore/qcompilerdetection.h>
> +
> ++#include <QCoreApplication>
> ++
> + #include "web_contents_adapter_client.h"
> +
> + #include "base/callback.h"
> +--
> +1.8.1.2
> +
> diff --git a/recipes-qt/qt5/qtwebengine/0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch b/recipes-qt/qt5/qtwebengine/0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch
> new file mode 100644
> index 0000000..544db3a
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebengine/0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch
> @@ -0,0 +1,26 @@
> +From 741f83397be4157cd34386f619f6d74fca4da149 Mon Sep 17 00:00:00 2001
> +From: Cleiton Bueno <cleitonrbueno@gmail.com>
> +Date: Fri, 25 Dec 2015 18:16:05 -0200
> +Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
> +
> +Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
> +---
> + qquickwebengineview_p_p.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
> +index c221085..d39aba7 100644
> +--- a/src/webengine/api/qquickwebengineview_p_p.h
> ++++ b/src/webengine/api/qquickwebengineview_p_p.h
> +@@ -56,6 +56,8 @@
> + #include <QString>
> + #include <QtCore/qcompilerdetection.h>
> + #include <QtGui/qaccessibleobject.h>
> ++#include <QColor>
> ++
> +
> + namespace QtWebEngineCore {
> + class WebContentsAdapter;
> +--
> +1.8.1.2
> +
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
> index 957931f..7660932 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -112,7 +112,11 @@ SRC_URI += " \
>      file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
>      file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
>      file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
> +    file://0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translate.patch \
> +    file://0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch \
> +    file://0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch \
>  "
> +
>  SRCREV_qtwebengine = "40ef43e0d69c4a86c9430b7f264d2cde6340ee0f"
>  SRCREV_chromium = "ec5b3304fc266dfdec7666b8b73d57a3971ea35f"
>  SRCREV = "${SRCREV_qtwebengine}"
> --
> 1.8.1.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

