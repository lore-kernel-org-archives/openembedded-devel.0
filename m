Return-Path: <raj.khem@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id 019386041E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2013 20:21:39 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id l20so7334725oag.31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Aug 2013 13:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=3Iz7sCEC6PbIyfjnGH1XrFHXh+svDANL3/IoEHYTLJo=;
	b=CSKGgVTz29URFUSCP/pREaxN6MngSw2Vvl2LBLB828mHSD7jJ8DhiSdyCZC+LZKsWU
	eT0qFWEhTdS9b9hDWnSxz317G3p6HzVYOOtlyYdDCqb7e7UbgSPMuLLoQkLPAnaGybRP
	lNryPILSxi+t9VlwDjQTmh/dhsmzBkEXpmJwZKsKNqb9WoUW1z/TkHEstqUl1gH9WM1S
	CjpCsjanaXpSlN7demB+fIV7EqX8p/m7e/c0D0+bPnJXHw52jEd5d/GVNHsytcZbfl1t
	r2OjgH6JKbntTR/IJl6HP69Qqhuh0LZc6ChE8n4a0LPm9UmfKFPQElQiXsMq+egWOxbu
	O9Hg==
X-Received: by 10.50.103.3 with SMTP id fs3mr1286773igb.39.1375734100058; Mon,
	05 Aug 2013 13:21:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.137 with HTTP; Mon, 5 Aug 2013 13:21:09 -0700 (PDT)
In-Reply-To: <CAGiJk9cZrg5fChUMWstx188gP-UPSXn=rDA7EyWmWsRb-fgBng@mail.gmail.com>
References: <1375399572-4926-1-git-send-email-raj.khem@gmail.com>
	<CAGiJk9cZrg5fChUMWstx188gP-UPSXn=rDA7EyWmWsRb-fgBng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Aug 2013 13:21:09 -0700
Message-ID: <CAMKF1sqWmZChNCcHGt43V1XdtUeXmTPwJxpayEWvC=HUgoA6zA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-kde][PATCH] qt4: Rename bbappend to match oe-core
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
X-List-Received-Date: Mon, 05 Aug 2013 20:21:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2013 at 1:34 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com>wrote:

> 2013/8/2 Khem Raj <raj.khem@gmail.com>:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  recipes-misc-support/qt4-native_4.8.4.bbappend   |    9 ---------
> >  recipes-misc-support/qt4-native_4.8.5.bbappend   |    9 +++++++++
> >  recipes-misc-support/qt4-x11-free_4.8.4.bbappend |   11 -----------
> >  recipes-misc-support/qt4-x11-free_4.8.5.bbappend |   11 +++++++++++
> >  4 files changed, 20 insertions(+), 20 deletions(-)
> >  delete mode 100644 recipes-misc-support/qt4-native_4.8.4.bbappend
> >  create mode 100644 recipes-misc-support/qt4-native_4.8.5.bbappend
> >  delete mode 100644 recipes-misc-support/qt4-x11-free_4.8.4.bbappend
> >  create mode 100644 recipes-misc-support/qt4-x11-free_4.8.5.bbappend
> >
> > diff --git a/recipes-misc-support/qt4-native_4.8.4.bbappend
> b/recipes-misc-support/qt4-native_4.8.4.bbappend
> > deleted file mode 100644
> > index b6ee9f2..0000000
> > --- a/recipes-misc-support/qt4-native_4.8.4.bbappend
> > +++ /dev/null
> > @@ -1,9 +0,0 @@
> > -# Needed by kdelibs4-native
> > -DEPENDS +=3D "openssl-native"
> > -PRINC :=3D "${@int(PRINC) + 1}"
> > -
> > -EXTRA_OECONF +=3D "-no-pch -no-sm -openssl"
> > -
> > -TOBUILD +=3D "src/phonon"
> > -
> > -PRINC :=3D "${@int(PRINC) + 1}"
> > diff --git a/recipes-misc-support/qt4-native_4.8.5.bbappend
> b/recipes-misc-support/qt4-native_4.8.5.bbappend
> > new file mode 100644
> > index 0000000..b6ee9f2
> > --- /dev/null
> > +++ b/recipes-misc-support/qt4-native_4.8.5.bbappend
> > @@ -0,0 +1,9 @@
> > +# Needed by kdelibs4-native
> > +DEPENDS +=3D "openssl-native"
> > +PRINC :=3D "${@int(PRINC) + 1}"
> > +
> > +EXTRA_OECONF +=3D "-no-pch -no-sm -openssl"
> > +
> > +TOBUILD +=3D "src/phonon"
> > +
> > +PRINC :=3D "${@int(PRINC) + 1}"
> > diff --git a/recipes-misc-support/qt4-x11-free_4.8.4.bbappend
> b/recipes-misc-support/qt4-x11-free_4.8.4.bbappend
> > deleted file mode 100644
> > index 9d13ffa..0000000
> > --- a/recipes-misc-support/qt4-x11-free_4.8.4.bbappend
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -DEPENDS_append_omap3 =3D " libgles-omap3"
> > -DEPENDS_append_ti33x =3D " libgles-omap3"
> > -PRINC :=3D "${@int(PRINC) + 3}"
> > -
> > -#This will add reduced visibility to some exports on Qt, otherwise KDE
> plugins will fail
> > -QT_CONFIG_FLAGS_append =3D " --reduce-exports"
> > -
> > -# Build OpenGL/ES support if available
> > -QT_GLFLAGS_omap3 =3D "-opengl es2 "
> > -# Needed by kdelibs
> > -QT_DISTRO_FLAGS =3D "-accessibility -sm"
> > diff --git a/recipes-misc-support/qt4-x11-free_4.8.5.bbappend
> b/recipes-misc-support/qt4-x11-free_4.8.5.bbappend
> > new file mode 100644
> > index 0000000..9d13ffa
> > --- /dev/null
> > +++ b/recipes-misc-support/qt4-x11-free_4.8.5.bbappend
> > @@ -0,0 +1,11 @@
> > +DEPENDS_append_omap3 =3D " libgles-omap3"
> > +DEPENDS_append_ti33x =3D " libgles-omap3"
> > +PRINC :=3D "${@int(PRINC) + 3}"
> > +
> > +#This will add reduced visibility to some exports on Qt, otherwise KDE
> plugins will fail
> > +QT_CONFIG_FLAGS_append =3D " --reduce-exports"
> > +
> > +# Build OpenGL/ES support if available
> > +QT_GLFLAGS_omap3 =3D "-opengl es2 "
> > +# Needed by kdelibs
> > +QT_DISTRO_FLAGS =3D "-accessibility -sm"
> > --
> > 1.7.9.5
>
> Applied,
> thanks for the patch.
>
> In a follow up I have removed the platform dependent configuration, as
> it has become an unnecessary hurdle.
>
>
> Some questions towards meta-kde "users":
> Do you actually use (or try to use) meta-kde, or is it just enabled
> for tests like world builds?
>

=E2=80=8Bright now its in world builds for me.



> What are your expectations regarding this layer?
>


=E2=80=8B=E2=80=8BHowever I want to be
able to have a systemd-plasma-active-image as a possibility for
angstrom reference images.=E2=80=8B


I am asking since the feedback for this layer is very sparse (mostly
> because it is very uncommon for embedded devices and the recipes are
> incomplete).
>
> TBH it is unlikely that my priorities will shift back to meta-kde in this
> year.
>
>
>
> --
> Regards
> Samuel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

