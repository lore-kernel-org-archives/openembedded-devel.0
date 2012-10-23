Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQkMm-0007Lr-Py
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 21:42:21 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so3525250wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2012 12:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PTxkwiCZOl2YkWKeEXKRDPYygnWYpRguC8mePziJppo=;
	b=PGMZJgs7D3RLRdGJ3TirnNI7dKFCWWbiXFr81GG3OJ6yWbuaj1jfPr+U4U9nfEpLar
	AfLM37ye3dv9NN3msmnfFD8OBBFgQ8RPAZ6uB5/vMetYtNOsl4xjDqtusVqg2C1/nrx1
	frNXyfF5J5EyPOAw2SeNVf7VYBeqXrLgXF58MtZHWueiFzbG2BnvF6mfzAtfdKMegfsD
	MHQsHEs9kWe/J0ijidTn/AyuxcWnkHqENvzV4SzxQ2rW9C7+8pMWGLAZbEKmo254bJf7
	X+Mrj12qEaR4kiUnheA2KLsmKwSAmRRs3VDJVoul3st0vlWwrW/xYQhm/DC7NGPf1tF3
	ZhXg==
Received: by 10.216.90.129 with SMTP id e1mr8464654wef.87.1351020534538;
	Tue, 23 Oct 2012 12:28:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j8sm268658wiy.9.2012.10.23.12.28.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 12:28:53 -0700 (PDT)
Date: Tue, 23 Oct 2012 21:29:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121023192909.GU3269@jama.jama.net>
References: <1351020123-22871-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1351020123-22871-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/2] epdfview: Sync with Debian 0.1.8-3 patches
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
X-List-Received-Date: Tue, 23 Oct 2012 19:42:22 -0000
X-Groupsio-MsgNum: 41247
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dXvu6+ixFx2ZffE8"
Content-Disposition: inline

--dXvu6+ixFx2ZffE8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 23, 2012 at 05:22:02PM -0200, Otavio Salvador wrote:
> This includes the patches in use in Debian package to fix color
> inversion and other minor issues.

Looks good, will test it when I have efl 1.7.1 ready.

Cheers,

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../recipes-efl/efl/epdfview/browser_command.patch |   17 ++++++++
>  meta-efl/recipes-efl/efl/epdfview/fix-format.patch |   19 +++++++++
>  meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch  |   12 -----
>  .../efl/epdfview/glib-single-include.patch         |   17 ++++++++
>  .../recipes-efl/efl/epdfview/swap-colors.patch     |   43 ++++++++++++++=
++++++
>  meta-efl/recipes-efl/efl/epdfview_0.1.8.bb         |    7 ++-
>  6 files changed, 101 insertions(+), 14 deletions(-)
>  create mode 100644 meta-efl/recipes-efl/efl/epdfview/browser_command.pat=
ch
>  create mode 100644 meta-efl/recipes-efl/efl/epdfview/fix-format.patch
>  delete mode 100644 meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch
>  create mode 100644 meta-efl/recipes-efl/efl/epdfview/glib-single-include=
=2Epatch
>  create mode 100644 meta-efl/recipes-efl/efl/epdfview/swap-colors.patch
>=20
> diff --git a/meta-efl/recipes-efl/efl/epdfview/browser_command.patch b/me=
ta-efl/recipes-efl/efl/epdfview/browser_command.patch
> new file mode 100644
> index 0000000..75e45e0
> --- /dev/null
> +++ b/meta-efl/recipes-efl/efl/epdfview/browser_command.patch
> @@ -0,0 +1,17 @@
> +Imported from Debian 0.1.8-3
> +
> +Upstream-Status: Pending
> +
> +diff --git a/src/Config.cxx b/src/Config.cxx
> +index 28f37ab..bc58819 100644
> +--- a/src/Config.cxx
> ++++ b/src/Config.cxx
> +@@ -22,7 +22,7 @@
> + using namespace ePDFView;
> +=20
> + // Constants
> +-static const gchar *DEFAULT_EXTERNAL_BROWSER_COMMAND_LINE =3D "firefox =
%s";
> ++static const gchar *DEFAULT_EXTERNAL_BROWSER_COMMAND_LINE =3D "x-www-br=
owser %s";
> + static const gchar *DEFAULT_OPEN_FILE_FOLDER =3D NULL;
> + static const gchar *DEFAULT_SAVE_FILE_FOLDER =3D NULL;
> + static const gboolean DEFAULT_SHOW_STATUSBAR =3D TRUE;
> diff --git a/meta-efl/recipes-efl/efl/epdfview/fix-format.patch b/meta-ef=
l/recipes-efl/efl/epdfview/fix-format.patch
> new file mode 100644
> index 0000000..8ad5b97
> --- /dev/null
> +++ b/meta-efl/recipes-efl/efl/epdfview/fix-format.patch
> @@ -0,0 +1,19 @@
> +Imported from Debian 0.1.8-3
> +
> +Upstream-Status: Pending
> +
> +diff --git a/src/gtk/MainView.cxx b/src/gtk/MainView.cxx
> +index b983bff..f87de28 100644
> +--- a/src/gtk/MainView.cxx
> ++++ b/src/gtk/MainView.cxx
> +@@ -634,8 +634,9 @@ MainView::showErrorMessage (const gchar *title, cons=
t gchar *body)
> +             GTK_DIALOG_DESTROY_WITH_PARENT,
> +             GTK_MESSAGE_ERROR,
> +             GTK_BUTTONS_OK,
> ++            "%s",
> +             title);
> +-    gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG(errorD=
ialog),
> ++    gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG(errorD=
ialog), "%s",
> +                                               body);
> +     gtk_dialog_run (GTK_DIALOG (errorDialog));
> +     gtk_widget_destroy (errorDialog);
> diff --git a/meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch b/meta-efl=
/recipes-efl/efl/epdfview/glib-2.32.patch
> deleted file mode 100644
> index e08584c..0000000
> --- a/meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -diff -uNr epdfview-0.1.8.orig/src/gtk/StockIcons.h epdfview-0.1.8/src/gt=
k/StockIcons.h
> ---- epdfview-0.1.8.orig/src/gtk/StockIcons.h	2011-05-28 12:24:57.0000000=
00 +0200
> -+++ epdfview-0.1.8/src/gtk/StockIcons.h	2012-04-30 07:48:08.528285594 +0=
200
> -@@ -18,8 +18,6 @@
> - #if !defined (__STOCK_ICONS_H__)
> - #define __STOCK_ICONS_H__
> -=20
> --#include <glib/gmacros.h>
> --
> - G_BEGIN_DECLS
> -=20
> - // ePDFView stock icons.
> diff --git a/meta-efl/recipes-efl/efl/epdfview/glib-single-include.patch =
b/meta-efl/recipes-efl/efl/epdfview/glib-single-include.patch
> new file mode 100644
> index 0000000..84a4913
> --- /dev/null
> +++ b/meta-efl/recipes-efl/efl/epdfview/glib-single-include.patch
> @@ -0,0 +1,17 @@
> +Imported from Debian 0.1.8-3
> +
> +Upstream-Status: Pending
> +
> +diff --git a/src/gtk/StockIcons.h b/src/gtk/StockIcons.h
> +index c142a7a..58fcf2e 100644
> +--- a/src/gtk/StockIcons.h
> ++++ b/src/gtk/StockIcons.h
> +@@ -18,7 +18,7 @@
> + #if !defined (__STOCK_ICONS_H__)
> + #define __STOCK_ICONS_H__
> +=20
> +-#include <glib/gmacros.h>
> ++#include <glib.h>
> +=20
> + G_BEGIN_DECLS
> +=20
> diff --git a/meta-efl/recipes-efl/efl/epdfview/swap-colors.patch b/meta-e=
fl/recipes-efl/efl/epdfview/swap-colors.patch
> new file mode 100644
> index 0000000..2949c7b
> --- /dev/null
> +++ b/meta-efl/recipes-efl/efl/epdfview/swap-colors.patch
> @@ -0,0 +1,43 @@
> +Imported from Debian 0.1.8-3
> +
> +Upstream-Status: Pending
> +
> +Index: trunk/src/PDFDocument.cxx
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- trunk/src/PDFDocument.cxx	(revision 361)
> ++++ trunk/src/PDFDocument.cxx	(revision 367)
> +@@ -21,4 +21,5 @@
> + #include <poppler.h>
> + #include <unistd.h>
> ++#include <algorithm>
> + #include "epdfview.h"
> +=20
> +@@ -33,4 +34,22 @@
> + static PageMode convertPageMode (gint pageMode);
> + static gchar *getAbsoluteFileName (const gchar *fileName);
> ++
> ++namespace
> ++{
> ++    void
> ++    convert_bgra_to_rgba (guint8 *data, int width, int height)
> ++    {
> ++        using std::swap;
> ++
> ++        for (int y =3D 0; y < height; y++)
> ++        {
> ++            for (int x =3D 0; x < width; x++)
> ++            {
> ++                swap(data[0], data[2]);
> ++                data +=3D 4;
> ++            }
> ++        }
> ++    }
> ++}
> +=20
> + ///
> +@@ -651,4 +670,5 @@
> +         cairo_destroy(context);
> +         cairo_surface_destroy (surface);
> ++        convert_bgra_to_rgba(renderedPage->getData (), width, height);
> + #else // !HAVE_POPPLER_0_17_0
> +         // Create the pixbuf from the data and render to it.
> diff --git a/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb b/meta-efl/recipe=
s-efl/efl/epdfview_0.1.8.bb
> index c16137e..53951e1 100644
> --- a/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
> +++ b/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
> @@ -5,14 +5,17 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf3365=
9b29e73d4adb9f9f6552"
>  SECTION =3D "x11/applications"
>  DEPENDS =3D "gtk+ poppler"
> =20
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  EXTRA_OECONF +=3D "--without-cups"
> =20
>  inherit autotools gettext
> =20
>  SRC_URI =3D "http://www.emma-soft.com/projects/${BPN}/chrome/site/releas=
es/${BP}.tar.bz2 \
> -  file://glib-2.32.patch \
> +           file://browser_command.patch \
> +           file://fix-format.patch \
> +           file://glib-single-include.patch \
> +           file://swap-colors.patch \
>  "
>  SRC_URI[md5sum] =3D "e50285b01612169b2594fea375f53ae4"
>  SRC_URI[sha256sum] =3D "948648ae7c9d7b3b408d738bd4f48d87375b1196cae1129d=
6b846a8de0f2f8f0"
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dXvu6+ixFx2ZffE8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCG8AUACgkQN1Ujt2V2gByyZACfYHvPOrS0e2DeshtcWzyaFcSc
2yQAnjBEt94jlzwj+W5fjwQ2iobwAzGO
=/F/t
-----END PGP SIGNATURE-----

--dXvu6+ixFx2ZffE8--
