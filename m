Return-Path: <pespin.shar@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id C65C673243
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 09:09:58 +0000 (UTC)
Received: by lanb10 with SMTP id b10so63375449lan.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2015 02:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=m1eOGa6XX82MJSfnXZhl5kQsqws1ob3ohRiHeCEHU4s=;
	b=oU67MeMir3BG5EbrYSirHtJLjlwZoPftzi+VZUbMrau1kLWc4NvjbTijmS65mgX7la
	V/6Olm3pYrqarssG9GLDqkC1uolDQDMNfnYIzLwVnB72zFbOz9/H/O4Rx1yGfk2uzLL4
	LdfyXkaNBDwbjlREr77uWfkuEOlRludn/RjowG47RmzIgFLweBJKLsZHoMXAaM7s0rnD
	+56rjxM8UbZAzuvTDjuAiCeYTah+kCHuLv3MLj8gxCKvV6E/9yhLXr+KKe778/KM3Wfe
	+OlJY6DHUqVkx8MGFw8db8D8J8fXTmm4qdAk3328NJhqnP+0BVc1/3KYtPnhT2TjJ+l2
	m5QA==
MIME-Version: 1.0
X-Received: by 10.112.161.137 with SMTP id xs9mr7226832lbb.4.1442826596828;
	Mon, 21 Sep 2015 02:09:56 -0700 (PDT)
Received: by 10.25.1.207 with HTTP; Mon, 21 Sep 2015 02:09:56 -0700 (PDT)
In-Reply-To: <CALbNGRQLGvYmdsxTGMPMeyQ8Edj-9Buvzz6cpr4gT9JS1DhgYA@mail.gmail.com>
References: <1442687436-29326-1-git-send-email-andrei.kholodnyi@gmail.com>
	<1442687436-29326-2-git-send-email-andrei.kholodnyi@gmail.com>
	<CALbNGRQLGvYmdsxTGMPMeyQ8Edj-9Buvzz6cpr4gT9JS1DhgYA@mail.gmail.com>
Date: Mon, 21 Sep 2015 11:09:56 +0200
Message-ID: <CAEGpDua0yjiMYz9K=qxF=K4n=NvjLwej6F5s1PJQPRYRdC4coA@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] add --with-systemdsystemunitdir in configuration
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
X-List-Received-Date: Mon, 21 Sep 2015 09:10:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

How about using "systemd_system_unitdir" instead of
"systemd_unitdir/system" ? You can find it in bitbake.conf

Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

2015-09-19 21:19 GMT+02:00 Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>:

> On Sat, Sep 19, 2015 at 8:30 PM, Andrei Kholodnyi
> <andrei.kholodnyi@gmail.com> wrote:
> > Otherwise sed command for blk-availability.service may fail.
> > It will look for the service file in a wrong location
> > ---
> >  meta-oe/recipes-support/lvm2/lvm2.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc
> b/meta-oe/recipes-support/lvm2/lvm2.inc
> > index 2b2d8ed..8114d5f 100644
> > --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> > +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> > @@ -27,6 +27,7 @@ EXTRA_OECONF =3D "--with-user=3D \
> >                  --enable-lvmetad \
> >                  --with-udev-prefix=3D \
> >                  --with-usrlibdir=3D${libdir} \
> > +                --with-systemdsystemunitdir=3D${systemd_unitdir}/syste=
m \
> >  "
> >
> >  PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'selinux',
> 'selinux', '', d)}"
> > --
> > 2.1.4
> >
> Please mention lvm2 in commit message.
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

