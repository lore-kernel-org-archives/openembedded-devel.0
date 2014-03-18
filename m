Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3C10E6F8D2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 09:19:05 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so3350415wiv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 02:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=KXzFrVyDIcaIQUmJXGs4Z1GuQLa3tQey6lFLyHlR42A=;
	b=vHsuqbLRCYSBJFwQCwBgik/XB4Ip/bEoa3U6ppVBPh2IaeyKLdboWePFn/cGsuyUq6
	sEQiw5BX31hua06gUTeT3KTiH5Zwt/pUGDcN7N3IIIoa7aoh48loA54Yt3zE2QDl9LUh
	GcqfESWGEtEB13xFYBglCgkAueMpR9yXChOkroQ2NWZlYqXv8j0j2SsvC01eQG8tlGNo
	crr2FjwpkxnGF2wnuj0QbyNkicbtADu8eD88HB2qvWH+sjmKFQMTkiYf53q2NMcw2VhZ
	cbzJWAY6z65C7pRxZCNRkQcfDoUHLpfHFxz2thfKZUJPgIR2zYJU/fOJ9gRdN7WJ13UN
	Y0YQ==
MIME-Version: 1.0
X-Received: by 10.180.164.229 with SMTP id yt5mr13621061wib.49.1395134345907; 
	Tue, 18 Mar 2014 02:19:05 -0700 (PDT)
Received: by 10.194.59.228 with HTTP; Tue, 18 Mar 2014 02:19:05 -0700 (PDT)
In-Reply-To: <CALbNGRTeZrrDcSLQ8fQ7YOp4kK=e0dp1oAQBRR7D-6MYRQDXYg@mail.gmail.com>
References: <1395117284-22655-1-git-send-email-stephen.arnold42@gmail.com>
	<CALbNGRTeZrrDcSLQ8fQ7YOp4kK=e0dp1oAQBRR7D-6MYRQDXYg@mail.gmail.com>
Date: Tue, 18 Mar 2014 02:19:05 -0700
Message-ID: <CAOLEWZVbSV6bLKTXih01cfmyec4uvmO1PUc6OM02=Fub68OsRg@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-xfce][PATCH v3] recipes-xfce/libxfce4ui: depends and autotools fixes
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
X-List-Received-Date: Tue, 18 Mar 2014 09:19:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Because it only works in a separate task (see previous email).



On Tue, Mar 18, 2014 at 1:46 AM, Andreas M=FCller <
schnitzeltony@googlemail.com> wrote:

> On Tue, Mar 18, 2014 at 5:34 AM, Stephen Arnold
> <stephen.arnold42@gmail.com> wrote:
> > Note: this patch (v3) obseletes previous versions
> >
> > libxfce4ui_4.10.0.bb: Upstream changes required autotools and gettext
> (intl)
> > fixes, as well as moving the autogen stuff to a separate task.  Full
> depends
> > were also added (2 were converted to PACKAGECONFIG options) along with =
a
> > vendor config option.
> >
> > Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
> >
> > ---
> >  meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb | 14
> ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bbb/me=
ta-xfce/recipes-xfce/libxfce4ui/
> libxfce4ui_4.10.0.bb
> > index cc63a9f..1e141c4 100644
> > --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
> > +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
> > @@ -2,9 +2,9 @@ SUMMARY =3D "Xfce4 Widget library and X Window System
> interaction"
> >  SECTION =3D "x11/libs"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D252890d9eee26aab7b432e8b8a6=
16475"
> > -DEPENDS =3D "gtk+ intltool libxfce4util startup-notification xfconf
> glade3"
> > +DEPENDS =3D "perl-native glib-2.0 gtk+ intltool libxfce4util xfconf
> xfce4-dev-tools virtual/libx11 libsm libice"
> >
> > -inherit xfce
> > +inherit autotools gettext xfce
> >
> >  SRC_URI =3D " \
> >      git://git.xfce.org/xfce/libxfce4ui;protocol=3Dgit \
> > @@ -15,9 +15,13 @@ SRCREV =3D "530b72f50fcbd8cb4b970fcc97be0321bf78183e=
"
> >  PV =3D "4.10.0+git${SRCPV}"
> >  S =3D "${WORKDIR}/git"
> >
> > -EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"
> > +EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug
>  --with-vendor-info=3D${DISTRO}"
> >
> > -do_configure_prepend() {
> > +PACKAGECONFIG ??=3D ""
> > +PACKAGECONFIG[gladeui] =3D "--enable-gladeui,--disable-gladeui,glade3"
> > +PACKAGECONFIG[startup-notification] =3D
> "--enable-startup-notification,--disable-startup-notification,startup-not=
ification"
> > +
> > +do_src_prepare() {
> >         NOCONFIGURE=3Dyes ./autogen.sh
> >  }
> >
> > @@ -27,3 +31,5 @@ FILES_${PN}-dev +=3D "${libdir}/glade3/modules/*.la \
> >  PACKAGES +=3D "${PN}-glade"
> >  FILES_${PN}-glade =3D "${libdir}/glade3 \
> >                       ${datadir}/glade3"
> > +
> > +addtask do_src_prepare before do_configure after do_patch
> > --
> I asked that for lxdm already - maybe I missed something: Why do you
> create an extra task and do not use do_configure_prepend() ?
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

