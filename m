Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 474BF7C0BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2019 03:38:37 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id r14so1599912qtp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2019 19:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Vv/B70iZgjh0gNpPZhBHoCoXksD1I+kri15q2s1n0tQ=;
	b=pwSdTqdXN6vv4tbLJFlSdwEyh3LsFjQJdGGmvJdkGyENxSyaxMdxvvuZKVynCGczw3
	6ZErU8qjvp/3Vm47lrgY34ZwBi1uQsBHStE3NyBD1i5hVhjXzm+S1rHqxkdrgQ4/+w40
	IFVFQFbRPvgbtgqXkldBjD1i231xr9CbaTzMEs16BMPpE6lktHx6vwJ8hQTjK0l8jmhf
	O1lI1q/M4c0po201S+TEmY+NMsGLruleyz82UsU07C/WbCpaDMV5d45gdpDhrRCAt4Lk
	efF7OI19fOjW7L0fJPKGlJkJ1MNy11cvbmVz5hfxYBXnl7hdH0miCt2KD/2wBf2CR9Q6
	tNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Vv/B70iZgjh0gNpPZhBHoCoXksD1I+kri15q2s1n0tQ=;
	b=U4O8p3xE122RNPwBMDSQNBdoXcThDLu/v7pVdlkNHY7LkdByGL2oz8BBnYNT+tlN+g
	P+VlIHyEcYsMtHcLzDbt7JBdsJ/FWUqRYeP0JdWw42MusNt3DxA+YJ542jIIHqPHNG2J
	yOStkDqOIQr5dkdQ0wLkt211ieh5cMGGYOgRmsDGpZiuO4GR2rvq1J9NXuFXU8My+gLr
	Zudi5Mu7/h0zU1cPYZFwaRhZR7GLkCMlDzuXRFbjDxnwRkSl+A2E6apdZqlg/wfbFe2v
	cXkIXLEI7PwhaegAse0sYO6fAwm+91lCuOolhEoqrs6V1jWdJzVLTXh3AjrQmKTtPJqm
	wCCA==
X-Gm-Message-State: AJcUukfSzxLq/0TIhepO3mwo5aMNM3H8d+Kr5o8vjQSiNiZiP1l02bp5
	YLM3cni29QkSzmVRnlLWvBBPIDQxeKDYGbjHhwU=
X-Google-Smtp-Source: ALg8bN7XVn1bQPKIqZ0VI9+nr0eccPzWUbB9Gl4/CS4znN/yjPPUX1ItfuV9s7qHghKRns5Evoae0LcoQ+ygMBgsxkE=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr1340621qte.29.1547523517886; 
	Mon, 14 Jan 2019 19:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20190110053633.40604-1-yongxin.liu@windriver.com>
	<CALbNGRQoS517_VZR081ZYTJOj=hzxJeMuNw2tBo0WqOBcUbTgg@mail.gmail.com>
	<597B109EC20B76429F71A8A97770610D129EDEF0@ALA-MBD.corp.ad.wrs.com>
	<CAMKF1sr4vvxS=9zNJn2ZYLh4-9=7pjFbiBUEvLFDdims86eUgg@mail.gmail.com>
	<597B109EC20B76429F71A8A97770610D129EF610@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <597B109EC20B76429F71A8A97770610D129EF610@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Jan 2019 19:38:11 -0800
Message-ID: <CAMKF1sr6cQuEqEoaGvWPCP6Q93eU+DYHcbkVkmtRdRt5LRo0Hg@mail.gmail.com>
To: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2] pmdk: fix install error
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
X-List-Received-Date: Tue, 15 Jan 2019 03:38:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yes you can do that

On Mon, Jan 14, 2019 at 7:22 PM Liu, Yongxin <Yongxin.Liu@windriver.com> wr=
ote:
>
>
> > -----Original Message-----
> > From: Khem Raj [mailto:raj.khem@gmail.com]
> > Sent: Tuesday, January 15, 2019 06:47
> > To: Liu, Yongxin
> > Cc: Andreas M=C3=BCller; openembeded-devel
> > Subject: Re: [oe] [meta-oe][PATCH V2] pmdk: fix install error
> >
> > On Wed, Jan 9, 2019 at 11:43 PM Liu, Yongxin <Yongxin.Liu@windriver.com=
>
> > wrote:
> > >
> > > > -----Original Message-----
> > > > From: Andreas M=C3=BCller [mailto:schnitzeltony@gmail.com]
> > > > Sent: Thursday, January 10, 2019 14:46
> > > > To: Liu, Yongxin
> > > > Cc: openembeded-devel
> > > > Subject: Re: [oe] [meta-oe][PATCH V2] pmdk: fix install error
> > > >
> > > > On Thu, Jan 10, 2019 at 6:40 AM Yongxin Liu
> > <yongxin.liu@windriver.com>
> > > > wrote:
> > > > >
> > > > > Install files to /usr instead of /usr/local by replacing
> > > > > PREFIX=3D${prefix} with prefix=3D${prefix}.
> > > > > Remove unnecessary files which are only for debugging.
> > > > > Set FILES to package /usr/etc/bash_completion.d/pmempool.
> > > > >
> > > > > Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> > > > > ---
> > > > >  meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb | 20 ++++-----------=
--
> > ---
> > > > >  1 file changed, 4 insertions(+), 16 deletions(-)
> > > > >
> > > > > diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb b/meta-
> > > > oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> > > > > index 3da22a970..8c3ead2ef 100644
> > > > > --- a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> > > > > +++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> > > > > @@ -34,25 +34,13 @@ EXTRA_OEMAKE =3D "HOST_SYS=3D'${HOST_SYS}'
> > > > EXTRA_CFLAGS=3D'${SELECTED_OPTIMIZATION}'"
> > > > >  # Fix the missing fts libs when using musl
> > > > >  EXTRA_OEMAKE_append_libc-musl =3D " EXTRA_LIBS=3D'-lfts'"
> > > > >
> > > > > -do_install() {
> > > > > -       oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install
> > > > > -
> > > > > -       # Copy these into the standard directories
> > > > > -       install -d ${D}${bindir}/
> > > > > -       mv ${D}/usr/local/bin/pmempool ${D}${bindir}/
> > > > > -       mv ${D}/usr/local/bin/daxio ${D}${bindir}/
> > > > > -
> > > > > -       install -d ${D}${libdir}
> > > > > -       mv ${D}/usr/local/lib/*so* ${D}${libdir}/
> > > > > +FILES_${PN} =3D "/usr/etc"
> > > > ^ This looks wrong: Seems config path is prefixed too
> > >
> > > Without this I got the following warning.
> > >
> > >     WARNING: pmdk-1.4.2-r0 do_package: QA Issue: pmdk:
> > Files/directories were installed but not shipped in any package:
> > >       /usr/etc
> > >       /usr/etc/bash_completion.d
> > >       /usr/etc/bash_completion.d/pmempool
> > >     Please set FILES such that these items are packaged. Alternativel=
y
> > if they are unneeded, avoid installing them or delete them within
> > do_install.
> > >     pmdk: 3 installed and not shipped files. [installed-vs-shipped]
> > >
> > > With it, the issue is gone. And those files can be shipped in RPM
> > packages.
> > >
> > >     $ rpm -qpl pmdk-1.4.2-r0.skylake_avx512_64.rpm
> > >     /usr
> > >     /usr/bin
> > >     /usr/bin/daxio
> > >     /usr/bin/pmempool
> > >     /usr/etc
> > >     /usr/etc/bash_completion.d
> > >     /usr/etc/bash_completion.d/pmempool
> > >
> >
> > Its better to move bash_completion files under usr/share in
> > do_install
> >
>
> How about install bash_completion files directly to /etc?
> It seems /etc/bash_completion.d is the more common place to hold such fil=
es.
>
> All I need to do is to specify sysconfdir in install command,
> such as " oe_runmake prefix=3D${prefix} DESTDIR=3D${D} sysconfdir=3D/etc =
install".
> And add FILES_${PN} +=3D "${sysconfdir}" to avoid QA issue.
>
> What do you think?
>
>
> --Yongxin
>
> > > I see similar usage, such as "meta-openembedded/meta-oe/recipes-
> > support/lio-utils/lio-utils_4.1.bb:FILES_${PN} +=3D "${sbindir}/*
> > /etc/init.d/* /etc/target/*""
> > >
> > >
> > > Thanks,
> > > Yongxin
> > >
> > > > >
> > > > > -       install -d ${D}${libdir}/pkgconfig
> > > > > -       mv ${D}/usr/local/lib/pkgconfig/*.pc
> > ${D}${libdir}/pkgconfig/
> > > > > -
> > > > > -       install -d ${D}${includedir}
> > > > > -       mv ${D}/usr/local/include/* ${D}${includedir}/
> > > > > +do_install() {
> > > > > +       oe_runmake prefix=3D${prefix} DESTDIR=3D${D} install
> > > > >
> > > > >         # Remove uneeded files
> > > > > -       rm -rf ${D}/usr/local/
> > > > > +       rm -rf ${D}/usr/lib64/pmdk_debug
> > > > >  }
> > > > >
> > > > >  # Include these by default otherwise the SDK is not very useful
> > > > > --
> > > > > 2.14.4
> > > > Andreas
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

