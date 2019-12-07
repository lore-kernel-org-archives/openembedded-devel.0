Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id BECDE7F278
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2019 21:23:06 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p9so11566156wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2019 13:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=veMOZYIf5TFAmsACQbgzzVqrJzeDUeUfl335RGGmRJ8=;
	b=Yd3zQLKBJZXhNrhdphusdLjhzqE6A30ssQx1HVYMKH33hA/8AvvfBfhxucXAQSr7cR
	bLA5VoqxDQBB/WgmHteZ6jFZov4Ov41Y4uYASqYVntuq3dUz/8UhNMA1PlE6+AjbGmoF
	dT76mu4knyXFDFP0f6dgr2y+j3X0Z1V9vIcqXYiUIIQGQ92n2T+1ByJ5FBhI6qKX45vf
	Ps5iN2Wj9x1VaDbOkmmBLTmUh/JVG+etrtVo7hNumKsHlVDdTkZ9Nn4zo+YfRNcuYNHQ
	8vEm2+Qp7qBlzxNVtbOF03yckdJgGiOqx/s9+mzOoB4gOXav8nQYmZehQw3vHMjNziBU
	oERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=veMOZYIf5TFAmsACQbgzzVqrJzeDUeUfl335RGGmRJ8=;
	b=krdUfosH2wncbRBe7yXPTikXA6fDTlmAEtHuLNuKSafbQCcgqtKGg94y1sgMm40Sj5
	G60Ul1NTNouo0VrfIs7qNPDAfit3oaTkgIKJ/9/iZAn2uCpVGu84Khvt3APr6h7ZNelE
	fUrSHpSs/I2EZafrX+CqyvepnaP6++V1dsxkHEVF38cFWZBLb90YvK2agKMVv5UeZS4I
	rKBO1P4aWX0uNXzM0WFOf73xSiw7BmPuP2nyQe7eT8SN5FQdQ3WX4ZaHIp0YT1qpVMYc
	9JoRnpqKzGVYq6EfTFmqzuiJwCNV+36m/M6xhnAFO/twGMYmaaUvpD/OyGf3VwH02oox
	8jRQ==
X-Gm-Message-State: APjAAAUr+gqfjCkPhvzbNyWdT4UpJLV3+gJcT8WdeTiYe/dLFJyk9uhG
	Cs5ltvpFFz5MDTSPb64ck0Keee7u5l17gS9m4PM=
X-Google-Smtp-Source: APXvYqwPkRHJrczVDagRZ8RBEA66gCLBBlgbSqEJB+wieipzNmclOrmuoqVN4dyfpD1Cu/X1mwCn3JDlOPzXpKxUnPQ=
X-Received: by 2002:a05:600c:2117:: with SMTP id
	u23mr16391862wml.18.1575753787160; 
	Sat, 07 Dec 2019 13:23:07 -0800 (PST)
MIME-Version: 1.0
References: <1575723834-22763-1-git-send-email-liu.ming50@gmail.com>
	<CAMKF1sphbUBWh3BTpoYcCyzH05dhm8yP+oOsh-wCdDAqXx7wpA@mail.gmail.com>
	<CAO5Uq5Sq-pGR9g+MrpUakieb=0sMvQmOb-C4VST_XX0vY3Sbvw@mail.gmail.com>
	<CAMKF1sp_AjmAakW1a1f5ZiS82ctBLqXvyi+GSM0jannSPwYAnA@mail.gmail.com>
In-Reply-To: <CAMKF1sp_AjmAakW1a1f5ZiS82ctBLqXvyi+GSM0jannSPwYAnA@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Sat, 7 Dec 2019 22:22:56 +0100
Message-ID: <CALatG=7OM-fcJ++dJOmz_9GCZzua8MuR-2T5J+4-VT6up3h_kQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: simon.bueler@toradex.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-oe] [PATCH] ostree: introduce OSTREE_PULL_TRANSPORT
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
X-List-Received-Date: Sat, 07 Dec 2019 21:23:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the explanation, I am on board too.

//Ming Liu

Khem Raj <raj.khem@gmail.com> =E6=96=BC 2019=E5=B9=B412=E6=9C=887=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=887:46=E5=AF=AB=E9=81=93=EF=BC=9A

> On Sat, Dec 7, 2019 at 9:23 AM Alex Kiernan <alex.kiernan@gmail.com>
> wrote:
> >
> > On Sat, Dec 7, 2019 at 3:25 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Sat, Dec 7, 2019 at 5:04 AM <liu.ming50@gmail.com> wrote:
> > > >
> > > > From: Ming Liu <liu.ming50@gmail.com>
> > > >
> > > > It could be soup or curl, for convenience to be overridden by other
> > > > meta layers, like in meta-updater, it is choosing curl as the pull
> > > > transport.
> > > >
> > > > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > > > ---
> > > >  meta-oe/recipes-extended/ostree/ostree_2019.5.bb | 11 +++++++----
> > > >  1 file changed, 7 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> > > > index 4f437f3..c3e3a12 100644
> > > > --- a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> > > > +++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> > > > @@ -43,6 +43,11 @@ S =3D "${WORKDIR}/git"
> > > >
> > > >  inherit autotools bash-completion gobject-introspection gtk-doc
> manpages pkgconfig ptest-gnome systemd
> > > >
> > > > +# Value: soup or curl
> > > > +# We include soup because ostree can't (currently) be built withou=
t
> > > > +# soup or curl - https://github.com/ostreedev/ostree/issues/1897
> > > > +OSTREE_PULL_TRANSPORT ??=3D "soup"
> > >
> > > are these options exclusive? then we need a check as well to ensure
> > > both are not used
> > >
> >
> > They're not exclusive, selecting both is fine, in fact required if you
> > want trivial-httpd (which is a prerequisite for ptest). If you choose
> > both then curl takes precedence in the client and won't be linked
> > against libsoup:
> >
> > root@tmt-561:~# ostree --version
> > libostree:
> >  Version: '2019.5'
> >  Git: v2019.5
> >  Features:
> >   - libcurl
> >   - libsoup
> >   - gpgme
> >   - libmount
> >   - release
> >   - p2p
> > root@tmt-561:~# ldd /usr/bin/ostree | grep soup
> > root@tmt-561:~#
> >
> > I have to admit to not being a fan of this change as (IMO) it just
> > confuses what's part of PACKAGECONFIG and what's not.
> >
>
> Thanks for chiming in Alex. I would agree that given that they are not
> exclusive it's probably
> not going to help to have another variable abstraction.
>
> > > > +
> > > >  # Package configuration - match ostree defaults, but without
> rofiles-fuse
> > > >  # otherwise we introduce a dependendency on meta-filesystems
> > > >  #
> > > > @@ -50,15 +55,13 @@ inherit autotools bash-completion
> gobject-introspection gtk-doc manpages pkgconf
> > > >  PACKAGECONFIG ??=3D " \
> > > >      ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
> > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd
> libmount', '', d)} \
> > > > -    soup \
> > > > +    ${OSTREE_PULL_TRANSPORT} \
> > > >  "
> > > >
> > > > -# We include soup because ostree can't (currently) be built withou=
t
> > > > -# soup or curl - https://github.com/ostreedev/ostree/issues/1897
> > > >  PACKAGECONFIG_class-native ??=3D " \
> > > >      ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
> > > >      builtin-grub2-mkconfig \
> > > > -    soup \
> > > > +    ${OSTREE_PULL_TRANSPORT} \
> > > >  "
> > > >
> > > >  PACKAGECONFIG[avahi] =3D "--with-avahi, --without-avahi, avahi"
> > > > --
> > > > 2.7.4
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> > --
> > Alex Kiernan
>

