Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 242446CEB9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 11:47:50 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so2828310eae.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 04:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=H8fVVAJvpbFOXViPDXfbrw2WMh3/kLuOSeRArMCjg9U=;
	b=mxGTfTG7AIhbjKZg3tz2vjokPXp2N67u8cMGM3HeTq6hAaR1g6xjlqBOfwFvSjEECH
	6FFiIlJtbTSN4nESFLtMJbvLJ7eyQ7P6/dQp+T9YpMjZEaeNVBOiwMgLAxpRFd1Oa4FB
	50LF0b6JfA+xX1k+xnXOWP64MuhAZFtWuW8s/EO6X+WtGCSn4Jq0e/46rULJkIWA1N22
	sHFBUzi99BC6F+J71gubFsf1HluRAsAn+O83+beZZJrHqATwQDZctoT6wJPNreIcBRA4
	tqO7gfaLm+2Y0TrqOPfFTbDPazYH9zMe4JkAGxVP71LLWIzbfYtnyPD9V/pYOyUSVeEN
	3ETw==
X-Received: by 10.15.23.1 with SMTP id g1mr2323413eeu.63.1383047272532;
	Tue, 29 Oct 2013 04:47:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k7sm69360550eeg.13.2013.10.29.04.47.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Oct 2013 04:47:51 -0700 (PDT)
Date: Tue, 29 Oct 2013 11:48:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131029104806.GE3697@jama>
References: <1382612197-6440-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1382612197-6440-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH] qtbase: add upstream QTBUG-34218/QTBUG-34234 misaligned selection patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Oct 2013 11:47:52 -0000
X-Groupsio-MsgNum: 46917
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k3qmt+ucFURmlhDS"
Content-Disposition: inline

--k3qmt+ucFURmlhDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 09:56:37PM +1100, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  ...ned-selection-region-with-text-when-cente.patch | 74 ++++++++++++++++=
++++++
>  ...ned-selection-region-with-text-when-cente.patch | 74 ++++++++++++++++=
++++++
>  recipes-qt/qt5/qtbase.inc                          |  1 +
>  3 files changed, 149 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtbase-5.1.1/0027-Fix-misaligned-selec=
tion-region-with-text-when-cente.patch
>  create mode 100644 recipes-qt/qt5/qtbase-git/0027-Fix-misaligned-selecti=
on-region-with-text-when-cente.patch
>=20
> diff --git a/recipes-qt/qt5/qtbase-5.1.1/0027-Fix-misaligned-selection-re=
gion-with-text-when-cente.patch b/recipes-qt/qt5/qtbase-5.1.1/0027-Fix-misa=
ligned-selection-region-with-text-when-cente.patch
> new file mode 100644
> index 0000000..d5e082e
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase-5.1.1/0027-Fix-misaligned-selection-region-wi=
th-text-when-cente.patch
> @@ -0,0 +1,74 @@
> +From 5d8a882c11201a29475c5ea71cfb76c9de6573f5 Mon Sep 17 00:00:00 2001
> +From: Jonathan Liu <net147@gmail.com>
> +Date: Wed, 23 Oct 2013 00:28:17 +1100
> +Subject: [PATCH] Fix misaligned selection region with text when centered
> +
> +If the text is centered, the x/y position in the selection QRectF may
> +be a multiple of 0.5 which is rounded up. This rounding causes
> +misalignment of the selection region with the text.
> +
> +The alignment is fixed by using qFloor on the x and y components.
> +
> +Upstream-Status: Accepted [https://codereview.qt-project.org/#change,688=
42]
> +Signed-off-by: Jonathan Liu <net147@gmail.com>
> +
> +Task-number: QTBUG-34218
> +Task-number: QTBUG-34234
> +Change-Id: I4f2fadeb38602f62a93773c6e5faecf03b28069f
> +Reviewed-by: Gunnar Sletta <gunnar.sletta@digia.com>
> +---
> + src/gui/text/qtextlayout.cpp | 19 ++++++++++++++-----
> + 1 file changed, 14 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/gui/text/qtextlayout.cpp b/src/gui/text/qtextlayout.cpp
> +index 54d337e..66341e1 100644
> +--- a/src/gui/text/qtextlayout.cpp
> ++++ b/src/gui/text/qtextlayout.cpp
> +@@ -44,6 +44,7 @@
> +=20
> + #include <qthread.h>
> + #include <qfont.h>
> ++#include <qmath.h>
> + #include <qpainter.h>
> + #include <qvarlengtharray.h>
> + #include <qtextformat.h>
> +@@ -946,15 +947,23 @@ static void addSelectedRegionsToPath(QTextEngine *=
eng, int lineNumber, const QPo
> +                 continue;
> +             }
> +=20
> +-            if (lastSelectionWidth > 0)
> +-                region->addRect(boundingRect & QRectF(lastSelectionX.to=
Real(), selectionY, lastSelectionWidth.toReal(), lineHeight));
> ++            if (lastSelectionWidth > 0) {
> ++                QRectF rect =3D boundingRect & QRectF(lastSelectionX.to=
Real(), selectionY, lastSelectionWidth.toReal(), lineHeight);
> ++                rect.moveLeft(qFloor(rect.left()));
> ++                rect.moveTop(qFloor(rect.top()));
> ++                region->addRect(rect);
> ++            }
> +=20
> +             lastSelectionX =3D selectionX;
> +             lastSelectionWidth =3D selectionWidth;
> +         }
> +     }
> +-    if (lastSelectionWidth > 0)
> +-        region->addRect(boundingRect & QRectF(lastSelectionX.toReal(), =
selectionY, lastSelectionWidth.toReal(), lineHeight));
> ++    if (lastSelectionWidth > 0) {
> ++        QRectF rect =3D boundingRect & QRectF(lastSelectionX.toReal(), =
selectionY, lastSelectionWidth.toReal(), lineHeight);
> ++        rect.moveLeft(qFloor(rect.left()));
> ++        rect.moveTop(qFloor(rect.top()));
> ++        region->addRect(rect);
> ++    }
> + }
> +=20
> + static inline QRectF clipIfValid(const QRectF &rect, const QRectF &clip)
> +@@ -2077,7 +2086,7 @@ static void setPenAndDrawBackground(QPainter *p, c=
onst QPen &defaultPen, const Q
> +=20
> +     QBrush bg =3D chf.background();
> +     if (bg.style() !=3D Qt::NoBrush && !chf.property(SuppressBackground=
).toBool())
> +-        p->fillRect(r, bg);
> ++        p->fillRect(QRectF(qFloor(r.x()), qFloor(r.y()), r.width(), r.h=
eight()), bg);
> +     if (c.style() !=3D Qt::NoBrush) {
> +         p->setPen(QPen(c, 0));
> +     }
> +--=20
> +1.8.4
> +
> diff --git a/recipes-qt/qt5/qtbase-git/0027-Fix-misaligned-selection-regi=
on-with-text-when-cente.patch b/recipes-qt/qt5/qtbase-git/0027-Fix-misalign=
ed-selection-region-with-text-when-cente.patch
> new file mode 100644
> index 0000000..d5e082e
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase-git/0027-Fix-misaligned-selection-region-with=
-text-when-cente.patch
> @@ -0,0 +1,74 @@
> +From 5d8a882c11201a29475c5ea71cfb76c9de6573f5 Mon Sep 17 00:00:00 2001
> +From: Jonathan Liu <net147@gmail.com>
> +Date: Wed, 23 Oct 2013 00:28:17 +1100
> +Subject: [PATCH] Fix misaligned selection region with text when centered
> +
> +If the text is centered, the x/y position in the selection QRectF may
> +be a multiple of 0.5 which is rounded up. This rounding causes
> +misalignment of the selection region with the text.
> +
> +The alignment is fixed by using qFloor on the x and y components.
> +
> +Upstream-Status: Accepted [https://codereview.qt-project.org/#change,688=
42]
> +Signed-off-by: Jonathan Liu <net147@gmail.com>
> +
> +Task-number: QTBUG-34218
> +Task-number: QTBUG-34234
> +Change-Id: I4f2fadeb38602f62a93773c6e5faecf03b28069f
> +Reviewed-by: Gunnar Sletta <gunnar.sletta@digia.com>
> +---
> + src/gui/text/qtextlayout.cpp | 19 ++++++++++++++-----
> + 1 file changed, 14 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/gui/text/qtextlayout.cpp b/src/gui/text/qtextlayout.cpp
> +index 54d337e..66341e1 100644
> +--- a/src/gui/text/qtextlayout.cpp
> ++++ b/src/gui/text/qtextlayout.cpp
> +@@ -44,6 +44,7 @@
> +=20
> + #include <qthread.h>
> + #include <qfont.h>
> ++#include <qmath.h>
> + #include <qpainter.h>
> + #include <qvarlengtharray.h>
> + #include <qtextformat.h>
> +@@ -946,15 +947,23 @@ static void addSelectedRegionsToPath(QTextEngine *=
eng, int lineNumber, const QPo
> +                 continue;
> +             }
> +=20
> +-            if (lastSelectionWidth > 0)
> +-                region->addRect(boundingRect & QRectF(lastSelectionX.to=
Real(), selectionY, lastSelectionWidth.toReal(), lineHeight));
> ++            if (lastSelectionWidth > 0) {
> ++                QRectF rect =3D boundingRect & QRectF(lastSelectionX.to=
Real(), selectionY, lastSelectionWidth.toReal(), lineHeight);
> ++                rect.moveLeft(qFloor(rect.left()));
> ++                rect.moveTop(qFloor(rect.top()));
> ++                region->addRect(rect);
> ++            }
> +=20
> +             lastSelectionX =3D selectionX;
> +             lastSelectionWidth =3D selectionWidth;
> +         }
> +     }
> +-    if (lastSelectionWidth > 0)
> +-        region->addRect(boundingRect & QRectF(lastSelectionX.toReal(), =
selectionY, lastSelectionWidth.toReal(), lineHeight));
> ++    if (lastSelectionWidth > 0) {
> ++        QRectF rect =3D boundingRect & QRectF(lastSelectionX.toReal(), =
selectionY, lastSelectionWidth.toReal(), lineHeight);
> ++        rect.moveLeft(qFloor(rect.left()));
> ++        rect.moveTop(qFloor(rect.top()));
> ++        region->addRect(rect);
> ++    }
> + }
> +=20
> + static inline QRectF clipIfValid(const QRectF &rect, const QRectF &clip)
> +@@ -2077,7 +2086,7 @@ static void setPenAndDrawBackground(QPainter *p, c=
onst QPen &defaultPen, const Q
> +=20
> +     QBrush bg =3D chf.background();
> +     if (bg.style() !=3D Qt::NoBrush && !chf.property(SuppressBackground=
).toBool())
> +-        p->fillRect(r, bg);
> ++        p->fillRect(QRectF(qFloor(r.x()), qFloor(r.y()), r.width(), r.h=
eight()), bg);
> +     if (c.style() !=3D Qt::NoBrush) {
> +         p->setPen(QPen(c, 0));
> +     }
> +--=20
> +1.8.4
> +
> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> index 889ab99..575621f 100644
> --- a/recipes-qt/qt5/qtbase.inc
> +++ b/recipes-qt/qt5/qtbase.inc
> @@ -23,6 +23,7 @@ SRC_URI +=3D " \
>      file://0023-configure-make-freetype-a-configurable-option.patch \
>      file://0024-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.pat=
ch \
>      file://0026-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.pat=
ch \
> +    file://0027-Fix-misaligned-selection-region-with-text-when-cente.pat=
ch

Missing \, but I've already fixed it locally, so you don't need to
resend.

>  "
> =20
>  DEPENDS +=3D "qtbase-native"
> --=20
> 1.8.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k3qmt+ucFURmlhDS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJvkmYACgkQN1Ujt2V2gByAlQCfX5TAW13GSC9iGaae13u9rGnJ
QSIAnAmcKXRxKdlXSdhhDHPsuzpG3s8b
=8gIF
-----END PGP SIGNATURE-----

--k3qmt+ucFURmlhDS--
