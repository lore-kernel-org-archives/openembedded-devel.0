Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RnSE9-0006uU-77
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jan 2012 10:54:45 +0100
Received: by wibhr14 with SMTP id hr14so393394wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2012 01:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=MZVnDY/CCiRMa9VgIF+/HipbZEc2HTkTKD7Ht0xgx3s=;
	b=oQl8sqHXYs3vuDYqaIpoUji3F0PBCKLfugEqMfavt7k6NdgCOsN6tXGv3sPBYJXGzH
	9TPKEXOs5VrVFQNTeq3hPkn04Y8Bc/qff8nDinsVENFEzn1Hde78dOysR9Mi4dk2s/Tr
	7k0xsI3SitOHsBgRoh+ab4FU/9lYfM/NC4q90=
MIME-Version: 1.0
Received: by 10.180.95.199 with SMTP id dm7mr35319037wib.9.1326880027292; Wed,
	18 Jan 2012 01:47:07 -0800 (PST)
Received: by 10.223.117.72 with HTTP; Wed, 18 Jan 2012 01:47:07 -0800 (PST)
In-Reply-To: <1326731540-15786-1-git-send-email-schnitzeltony@gmx.de>
References: <1326731540-15786-1-git-send-email-schnitzeltony@gmx.de>
Date: Wed, 18 Jan 2012 10:47:07 +0100
Message-ID: <CAGiJk9fyJdqkvJxAYL8RavNtyWETesehLPVFWuMtdC-uQgTzRw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome] evince: add cross-compile-fix.patch from classic oe to fix build error
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
X-List-Received-Date: Wed, 18 Jan 2012 09:54:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/1/16 Andreas M=C3=BCller <schnitzeltony@gmx.de>:
> error message was
>
> | warning: failed to load external entity "/usr/share/xml/gnome/xslt/docb=
ook/omf/db2omf.xsl"
> | cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
> | warning: failed to load external entity "/usr/share/xml/gnome/xslt/docb=
ook/omf/db2omf.xsl"
> | cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
> | make[2]: *** [evince-C.omf] Error 1
>
> [1] http://cgit.openembedded.org/openembedded/tree/recipes/evince/evince/=
cross-compile-fix.patch
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmx.de>
> ---
> =C2=A0.../evince/evince/cross-compile-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 25 ++++++++++++++++++++
> =C2=A0meta-gnome/recipes-gnome/evince/evince_2.32.0.bb =C2=A0 | =C2=A0 =
=C2=A04 +++
> =C2=A02 files changed, 29 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta-gnome/recipes-gnome/evince/evince/cross-com=
pile-fix.patch
>
> diff --git a/meta-gnome/recipes-gnome/evince/evince/cross-compile-fix.pat=
ch b/meta-gnome/recipes-gnome/evince/evince/cross-compile-fix.patch
> new file mode 100644
> index 0000000..6f5420a
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/evince/evince/cross-compile-fix.patch
> @@ -0,0 +1,25 @@
> +Index: evince-2.30.0/gnome-doc-utils.make
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- evince-2.30.0.orig/gnome-doc-utils.make =C2=A0 =C2=A02010-03-29 11:5=
2:47.000000000 -0700
> ++++ evince-2.30.0/gnome-doc-utils.make 2010-08-17 15:20:22.597646001 -07=
00
> +@@ -132,13 +132,12 @@ _DOC_ABS_SRCDIR =3D @abs_srcdir@
> +
> + _xml2po ?=3D `which xml2po`
> + _xml2po_mode =3D $(if $(DOC_ID),mallard,docbook)
> +-
> +-_db2html ?=3D `$(PKG_CONFIG) --variable db2html gnome-doc-utils`
> +-_db2omf =C2=A0?=3D `$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
> +-_malrng =C2=A0?=3D `$(PKG_CONFIG) --variable malrng gnome-doc-utils`
> +-_chunks =C2=A0?=3D `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gn=
ome/xslt/docbook/utils/chunks.xsl
> +-_credits ?=3D `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/x=
slt/docbook/utils/credits.xsl
> +-_ids ?=3D `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/=
docbook/utils/ids.xsl
> ++_db2html ?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2htm=
l gnome-doc-utils`
> ++_db2omf =C2=A0?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable d=
b2omf gnome-doc-utils`
> ++_malrng =C2=A0?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable m=
alrng gnome-doc-utils`
> ++_chunks =C2=A0?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable x=
mldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
> ++_credits ?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir=
 gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
> ++_ids ?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gno=
me-doc-utils`/gnome/xslt/docbook/utils/ids.xsl
> +
> + if ENABLE_SK
> + _ENABLE_SK =3D true
> +
> diff --git a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb b/meta-gnom=
e/recipes-gnome/evince/evince_2.32.0.bb
> index 899d416..ec54fbc 100644
> --- a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
> +++ b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
> @@ -4,8 +4,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D96f2f8d5ee576=
a2163977938ea36fa7b"
> =C2=A0SECTION =3D "x11/office"
> =C2=A0DEPENDS =3D "gnome-icon-theme gnome-doc-utils-native libgnome-keyri=
ng nautilus tiff libxt ghostscript poppler libxml2 gtk+ gconf libglade"
>
> +PR =3D "r1"
> +
> =C2=A0inherit gnome pkgconfig gtk-icon-cache
>
> +SRC_URI +=3D "file://cross-compile-fix.patch"
> +
> =C2=A0SRC_URI[archive.md5sum] =3D "ebc3ce6df8dcbf29cb9492f8dd031319"
> =C2=A0SRC_URI[archive.sha256sum] =3D "2a4c91ae38f8b5028cebb91b9da9ddc50ea=
8ae3f3d429df89ba351da2d787ff7"
>
> --
> 1.7.6.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Hi,
currently I'm facing the same problem here, any updates regarding the
status of this patch?

--=20
Regards
Samuel


