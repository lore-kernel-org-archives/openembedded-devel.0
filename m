Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id BA31F6FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 18:40:31 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id u188so47289509wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 10:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RWj/9wqalCNbwsQvdC7UY4IopeTmy80R8A9+86whdYk=;
	b=n8p+Be92Xef0j7Emq6346JKcFQYojeZM7NaEGpU2/YH77NYZ4+gA8KY2eWkInKjqes
	7lntoNWDhbR/pL4untcSbL+cKggzcfbPleTjbgMlgrhJqHNu85PavnIRKo3bPFAnV7Nt
	LHQNK3qPAEDXpNgCeDJ6GlIjKOTYnY1qCFsge66HXQJSuKVFU+PVBlU4AJHtz8WoAjX0
	uIrONywcxM402ZR1cbZykhXe5E9us9UZsPXbuu5zWfOo5QZLfXpY8VjcJuEoQIjtCqIX
	ARghOUJkPkJ5lMAMMAxyNm+nKRw6hU7UY5bb1AC97B16GVjyInVeafqMyw/axvk165nW
	EGrA==
X-Received: by 10.195.12.226 with SMTP id et2mr40028542wjd.34.1451500831826;
	Wed, 30 Dec 2015 10:40:31 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c203sm42130702wmd.5.2015.12.30.10.40.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Dec 2015 10:40:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Dec 2015 19:44:06 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151230184406.GK2263@jama>
References: <1451500652-26600-1-git-send-email-cleitonrbueno@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1451500652-26600-1-git-send-email-cleitonrbueno@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 30 Dec 2015 18:40:33 -0000
X-Groupsio-MsgNum: 59236
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2pR2RtFp0tAjF3C"
Content-Disposition: inline

--J2pR2RtFp0tAjF3C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 30, 2015 at 04:37:32PM -0200, Cleiton Bueno wrote:
> Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>

You need blank line after subject, otherwise it all ends in subject.

> ---
>  ...ec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch | 64 ++++++++++++++++=
++++++
>  ...cher.h-Include-QCoreApplication-translate.patch | 26 +++++++++
>  ...-qquickwebengineview_p_p.h-add-inc-QColor.patch | 26 +++++++++
>  recipes-qt/qt5/qtwebengine_git.bb                  |  4 ++
>  4 files changed, 120 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtwebengine/0001-chromium-jpeg_codec.c=
c_Change-false-to-FALSE-and-1-to-TRUE.patch
>  create mode 100644 recipes-qt/qt5/qtwebengine/0002-media_capture_devices=
_dispatcher.h-Include-QCoreApplication-translate.patch
>  create mode 100644 recipes-qt/qt5/qtwebengine/0003-WebEngine-qquickweben=
gineview_p_p.h-add-inc-QColor.patch
>=20
> diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-jpeg_codec.cc_Chang=
e-false-to-FALSE-and-1-to-TRUE.patch b/recipes-qt/qt5/qtwebengine/0001-chro=
mium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TRUE.patch
> new file mode 100644
> index 0000000..3707cbe
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebengine/0001-chromium-jpeg_codec.cc_Change-false=
-to-FALSE-and-1-to-TRUE.patch
> @@ -0,0 +1,64 @@
> +From 54b183ada5b5ead1c4b6e6532e24d21f372d70d7 Mon Sep 17 00:00:00 2001
> +From: Cleiton Bueno <cleitonrbueno@gmail.com>
> +Date: Thu, 24 Dec 2015 12:46:58 -0200
> +Subject: [PATCH] Change false to FALSE and 1 to TRUE, FIX qtwebengine co=
mpile
> +
> +Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
> +---
> + src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc b/src/3rdp=
arty/chromium/ui/gfx/codec/jpeg_codec.cc
> +index 8a08fe0..32b2a05 100644
> +--- a/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
> ++++ b/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
> +@@ -120,7 +120,7 @@ boolean EmptyOutputBuffer(jpeg_compress_struct* cinf=
o) {
> +   // tell libjpeg where to write the next data
> +   cinfo->dest->next_output_byte =3D &(*state->out)[state->image_buffer_=
used];
> +   cinfo->dest->free_in_buffer =3D state->out->size() - state->image_buf=
fer_used;
> +-  return 1;
> ++  return TRUE;
> + }
> +=20
> + // Cleans up the JpegEncoderState to prepare for returning in the final=
 form.
> +@@ -261,7 +261,7 @@ bool JPEGCodec::Encode(const unsigned char* input, C=
olorFormat format,
> +   cinfo.data_precision =3D 8;
> +=20
> +   jpeg_set_defaults(&cinfo);
> +-  jpeg_set_quality(&cinfo, quality, 1);  // quality here is 0-100
> ++  jpeg_set_quality(&cinfo, quality, TRUE);  // quality here is 0-100
> +=20
> +   // set up the destination manager
> +   jpeg_destination_mgr destmgr;
> +@@ -273,7 +273,7 @@ bool JPEGCodec::Encode(const unsigned char* input, C=
olorFormat format,
> +   JpegEncoderState state(output);
> +   cinfo.client_data =3D &state;
> +=20
> +-  jpeg_start_compress(&cinfo, 1);
> ++  jpeg_start_compress(&cinfo, TRUE);
> +=20
> +   // feed it the rows, doing necessary conversions for the color format
> + #ifdef JCS_EXTENSIONS
> +@@ -359,7 +359,7 @@ void InitSource(j_decompress_ptr cinfo) {
> + //   set to a positive value if TRUE is returned. A FALSE return should=
 only
> + //   be used when I/O suspension is desired."
> + boolean FillInputBuffer(j_decompress_ptr cinfo) {
> +-  return false;
> ++  return FALSE;
> + }
> +=20
> + // Skip data in the buffer. Since we have all the data at once, this op=
eration
> +@@ -487,8 +487,8 @@ bool JPEGCodec::Decode(const unsigned char* input, s=
ize_t input_size,
> +   cinfo.client_data =3D &state;
> +=20
> +   // fill the file metadata into our buffer
> +-  if (jpeg_read_header(&cinfo, true) !=3D JPEG_HEADER_OK)
> +-    return false;
> ++  if (jpeg_read_header(&cinfo, TRUE) !=3D JPEG_HEADER_OK)
> ++    return FALSE;
> +=20
> +   // we want to always get RGB data out
> +   switch (cinfo.jpeg_color_space) {
> +--=20
> +1.8.1.2
> +
> diff --git a/recipes-qt/qt5/qtwebengine/0002-media_capture_devices_dispat=
cher.h-Include-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengin=
e/0002-media_capture_devices_dispatcher.h-Include-QCoreApplication-translat=
e.patch
> new file mode 100644
> index 0000000..1b637cb
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebengine/0002-media_capture_devices_dispatcher.h-=
Include-QCoreApplication-translate.patch
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
> +diff --git a/src/core/media_capture_devices_dispatcher.h b/src/core/medi=
a_capture_devices_dispatcher.h
> +index 500fe76..eda2824 100644
> +--- a/src/core/media_capture_devices_dispatcher.h
> ++++ b/src/core/media_capture_devices_dispatcher.h
> +@@ -43,6 +43,8 @@
> + #include <map>
> + #include <QtCore/qcompilerdetection.h>
> +=20
> ++#include <QCoreApplication>
> ++
> + #include "web_contents_adapter_client.h"
> +=20
> + #include "base/callback.h"
> +--=20
> +1.8.1.2
> +
> diff --git a/recipes-qt/qt5/qtwebengine/0003-WebEngine-qquickwebenginevie=
w_p_p.h-add-inc-QColor.patch b/recipes-qt/qt5/qtwebengine/0003-WebEngine-qq=
uickwebengineview_p_p.h-add-inc-QColor.patch
> new file mode 100644
> index 0000000..544db3a
> --- /dev/null
> +++ b/recipes-qt/qt5/qtwebengine/0003-WebEngine-qquickwebengineview_p_p.h=
-add-inc-QColor.patch
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
> +diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine=
/api/qquickwebengineview_p_p.h
> +index c221085..d39aba7 100644
> +--- a/src/webengine/api/qquickwebengineview_p_p.h
> ++++ b/src/webengine/api/qquickwebengineview_p_p.h
> +@@ -56,6 +56,8 @@
> + #include <QString>
> + #include <QtCore/qcompilerdetection.h>
> + #include <QtGui/qaccessibleobject.h>
> ++#include <QColor>
> ++
> +=20
> + namespace QtWebEngineCore {
> + class WebContentsAdapter;
> +--=20
> +1.8.1.2
> +
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengi=
ne_git.bb
> index 957931f..7660932 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -112,7 +112,11 @@ SRC_URI +=3D " \
>      file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.pat=
ch \
>      file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
>      file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.pat=
ch \
> +    file://0002-media_capture_devices_dispatcher.h-Include-QCoreApplicat=
ion-translate.patch \
> +    file://0003-WebEngine-qquickwebengineview_p_p.h-add-inc-QColor.patch=
 \
> +    file://0001-chromium-jpeg_codec.cc_Change-false-to-FALSE-and-1-to-TR=
UE.patch \
>  "
> +
>  SRCREV_qtwebengine =3D "40ef43e0d69c4a86c9430b7f264d2cde6340ee0f"
>  SRCREV_chromium =3D "ec5b3304fc266dfdec7666b8b73d57a3971ea35f"
>  SRCREV =3D "${SRCREV_qtwebengine}"
> --=20
> 1.8.1.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J2pR2RtFp0tAjF3C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaEJfUACgkQN1Ujt2V2gBzWxACbBaq8Q44aYKdkHN/rY0w1BTxb
mWEAn0eJJe9hHM6ErDBiv/pRmtbznPe1
=UKgS
-----END PGP SIGNATURE-----

--J2pR2RtFp0tAjF3C--
