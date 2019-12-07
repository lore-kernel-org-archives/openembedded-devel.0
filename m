Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id 332157C89C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2019 18:46:53 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id t5so1180421qvs.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2019 10:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=36IbR2KTlj9AxLcUyQHXnc0TuTo5XuXG3fYpFe/JDOk=;
	b=J64vISA4wOXWr5ZM4KGYE4HOBinkFxtU//FhT485EV4wAWLElXGCmkoqMszQE+O0zi
	9xIdyG48zcrwJKgJWyAecJ8JxuTzn/AtT/SZSgsnwm/0NwAy8ZIbdfXC6yVOP3w/riP/
	UnEMlRISuJhkxd+fQmaCjdBjpC9yaBC/Md/zCU3wMjLp1c7htfY8EEB4oaES+HjjrsYV
	xaPlX7IxPdtpjiHR5BBlv8WA5+wP7TwZYpEaJ2nGEWOSjVmcaCwLw4QH/cIg9NItslTI
	oSpNY2p/1Gx8HGGVWKsfsDTRGcWLqzFNGm6/u7jx9Z0lbO1QfV67fzckzRTIE4Y0PkBA
	7nTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=36IbR2KTlj9AxLcUyQHXnc0TuTo5XuXG3fYpFe/JDOk=;
	b=oSFRhSLTswdo5b/yITN9klDJZUdCdQRujDdmP7b3i8s0GrZVorow6rvVI1Szgrrmt5
	PMFy3yfBbvWf9UlrQRXaZ50EVDi4tMEyXRztXTc2audY/j8ghdhMGsElYsxzu+x06Mg7
	tvXq2kbERIQdSGn27D+Wh0DRXh/8lFvvLPTdaMvG2CDOOJwP24GZRWC8ESUW/fkgqCvU
	zNvNJhW7n/GSSEuUuh4A0jRfjIr7wRVSQg65ve+C1AQDMJ4wvDoesq87nN7HmWLBQ07M
	u1bY6qm0998OFx83T+FKGHhRQQC0dSFG4ir9pa79HgIXib/9bHHpLvqK6fGxEffhK1sg
	tTsg==
X-Gm-Message-State: APjAAAWTM4E6jYynwWAOBJ2ImLa4jRfF15hBD2Vivucq/vrdQJfHnsP8
	s9sIRGICRqG1LY1+YMXM7azDQ35XxVtqb7edF90Esr0C
X-Google-Smtp-Source: APXvYqzEdirlIhZW1sEtc1mG3cij8e++BoEjEM5/mIeig5tJgXfr9DLOwuGVzBB8sJH+DTR9FHT3jTPFb6tF6LbIuo4=
X-Received: by 2002:a0c:8605:: with SMTP id p5mr17800835qva.109.1575744413692; 
	Sat, 07 Dec 2019 10:46:53 -0800 (PST)
MIME-Version: 1.0
References: <1575723834-22763-1-git-send-email-liu.ming50@gmail.com>
	<CAMKF1sphbUBWh3BTpoYcCyzH05dhm8yP+oOsh-wCdDAqXx7wpA@mail.gmail.com>
	<CAO5Uq5Sq-pGR9g+MrpUakieb=0sMvQmOb-C4VST_XX0vY3Sbvw@mail.gmail.com>
In-Reply-To: <CAO5Uq5Sq-pGR9g+MrpUakieb=0sMvQmOb-C4VST_XX0vY3Sbvw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Dec 2019 10:46:27 -0800
Message-ID: <CAMKF1sp_AjmAakW1a1f5ZiS82ctBLqXvyi+GSM0jannSPwYAnA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: simon.bueler@toradex.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Stefan Agner <stefan.agner@toradex.com>, Ming Liu <liu.ming50@gmail.com>
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
X-List-Received-Date: Sat, 07 Dec 2019 18:46:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 7, 2019 at 9:23 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Sat, Dec 7, 2019 at 3:25 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sat, Dec 7, 2019 at 5:04 AM <liu.ming50@gmail.com> wrote:
> > >
> > > From: Ming Liu <liu.ming50@gmail.com>
> > >
> > > It could be soup or curl, for convenience to be overridden by other
> > > meta layers, like in meta-updater, it is choosing curl as the pull
> > > transport.
> > >
> > > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > > ---
> > >  meta-oe/recipes-extended/ostree/ostree_2019.5.bb | 11 +++++++----
> > >  1 file changed, 7 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> > > index 4f437f3..c3e3a12 100644
> > > --- a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> > > +++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> > > @@ -43,6 +43,11 @@ S = "${WORKDIR}/git"
> > >
> > >  inherit autotools bash-completion gobject-introspection gtk-doc manpages pkgconfig ptest-gnome systemd
> > >
> > > +# Value: soup or curl
> > > +# We include soup because ostree can't (currently) be built without
> > > +# soup or curl - https://github.com/ostreedev/ostree/issues/1897
> > > +OSTREE_PULL_TRANSPORT ??= "soup"
> >
> > are these options exclusive? then we need a check as well to ensure
> > both are not used
> >
>
> They're not exclusive, selecting both is fine, in fact required if you
> want trivial-httpd (which is a prerequisite for ptest). If you choose
> both then curl takes precedence in the client and won't be linked
> against libsoup:
>
> root@tmt-561:~# ostree --version
> libostree:
>  Version: '2019.5'
>  Git: v2019.5
>  Features:
>   - libcurl
>   - libsoup
>   - gpgme
>   - libmount
>   - release
>   - p2p
> root@tmt-561:~# ldd /usr/bin/ostree | grep soup
> root@tmt-561:~#
>
> I have to admit to not being a fan of this change as (IMO) it just
> confuses what's part of PACKAGECONFIG and what's not.
>

Thanks for chiming in Alex. I would agree that given that they are not
exclusive it's probably
not going to help to have another variable abstraction.

> > > +
> > >  # Package configuration - match ostree defaults, but without rofiles-fuse
> > >  # otherwise we introduce a dependendency on meta-filesystems
> > >  #
> > > @@ -50,15 +55,13 @@ inherit autotools bash-completion gobject-introspection gtk-doc manpages pkgconf
> > >  PACKAGECONFIG ??= " \
> > >      ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
> > >      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd libmount', '', d)} \
> > > -    soup \
> > > +    ${OSTREE_PULL_TRANSPORT} \
> > >  "
> > >
> > > -# We include soup because ostree can't (currently) be built without
> > > -# soup or curl - https://github.com/ostreedev/ostree/issues/1897
> > >  PACKAGECONFIG_class-native ??= " \
> > >      ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
> > >      builtin-grub2-mkconfig \
> > > -    soup \
> > > +    ${OSTREE_PULL_TRANSPORT} \
> > >  "
> > >
> > >  PACKAGECONFIG[avahi] = "--with-avahi, --without-avahi, avahi"
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
> --
> Alex Kiernan

