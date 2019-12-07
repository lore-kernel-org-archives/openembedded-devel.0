Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 15C477F8AC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2019 17:23:57 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id t9so9087164iln.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2019 09:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZU4ZBKoGTpTPGO0Xi/ruYHtB1sS8yDkOygO6ikEGO8Y=;
	b=InXG2BmcFTleQUqIFyjSSIJwPZ2LZx4iPkaClE0NxHcyo2gIYXPVdtANShvLwk3Ddz
	rdCwDsPsA1MpMd1Aq9BT/g7QTP+oahvhVuit+899PUPufbMofMGfCMjBDo7g0iTQau11
	lBPno/O3OvQ2vfiG6CmPbvQAQwnkFVuiPdxt90x9vJcnAfmkFn6ZpiZHhQlWCBudqSy4
	nIkO4Nu+rotAtgv5/Xis4AB8B1CNRkoqohUHZkAYKjYQGXlppUATSvVdQb0D8OIndJT7
	BTzkcqTh9l7eWjfmooaZGceQE7VcE9vr4Rghb7fMvphmYVvo+QXUAlFv0ph6XAWCVnLd
	Hxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZU4ZBKoGTpTPGO0Xi/ruYHtB1sS8yDkOygO6ikEGO8Y=;
	b=GY25jLGne4gCdz3hJsXVA9NkHJznsaH6KfZSNSdRMMVbHX2VzNJe5AdBPL0YpGLCS/
	ZeN+5StUBdCy0GcigHNDp3orXjyRXSo+U9Km3NnjyYjdfTlLsnGR4+vemcuEEF2peo7m
	bW08MRjzII/CuLiQz78Z42aaArEYtqII9r8X+FbhchVfmv0w+jE/UetehNgkzhvBtYYd
	De6yMa1DYTJKPkTPcV6xe8rPhXxl3MmeQsC0GbGqTKw1DFeYuNtkger8JQEeZ4NcHOfm
	61BjcGe3O0Mgjh83esK/tnJkXjfvSbfdBl2g0PaGVziYVq4IY141ezhvVBf4NQkqQ2G5
	tc2Q==
X-Gm-Message-State: APjAAAXRwbl12eNh6M03mGGuihQhAXmB98iJbQFk4Zc9RNr6fmeOvPmj
	hT8hSe1LWwgTSRFVmfNBbmwtXO0lq7EkXYv5eZg=
X-Google-Smtp-Source: APXvYqzXYalwSV1d80m80wV0i77sBv1itl2CyHzxWq6EZktrthGG7TRAySunpgZw76H+msvZyNR+fQvb2+MjEhs5Ymw=
X-Received: by 2002:a92:1e0c:: with SMTP id e12mr2612970ile.115.1575739438792; 
	Sat, 07 Dec 2019 09:23:58 -0800 (PST)
MIME-Version: 1.0
References: <1575723834-22763-1-git-send-email-liu.ming50@gmail.com>
	<CAMKF1sphbUBWh3BTpoYcCyzH05dhm8yP+oOsh-wCdDAqXx7wpA@mail.gmail.com>
In-Reply-To: <CAMKF1sphbUBWh3BTpoYcCyzH05dhm8yP+oOsh-wCdDAqXx7wpA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 7 Dec 2019 17:23:47 +0000
Message-ID: <CAO5Uq5Sq-pGR9g+MrpUakieb=0sMvQmOb-C4VST_XX0vY3Sbvw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Ming Liu <liu.ming50@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Stefan Agner <stefan.agner@toradex.com>, simon.bueler@toradex.com
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
X-List-Received-Date: Sat, 07 Dec 2019 17:23:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 7, 2019 at 3:25 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Dec 7, 2019 at 5:04 AM <liu.ming50@gmail.com> wrote:
> >
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > It could be soup or curl, for convenience to be overridden by other
> > meta layers, like in meta-updater, it is choosing curl as the pull
> > transport.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta-oe/recipes-extended/ostree/ostree_2019.5.bb | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> > index 4f437f3..c3e3a12 100644
> > --- a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> > +++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> > @@ -43,6 +43,11 @@ S = "${WORKDIR}/git"
> >
> >  inherit autotools bash-completion gobject-introspection gtk-doc manpages pkgconfig ptest-gnome systemd
> >
> > +# Value: soup or curl
> > +# We include soup because ostree can't (currently) be built without
> > +# soup or curl - https://github.com/ostreedev/ostree/issues/1897
> > +OSTREE_PULL_TRANSPORT ??= "soup"
>
> are these options exclusive? then we need a check as well to ensure
> both are not used
>

They're not exclusive, selecting both is fine, in fact required if you
want trivial-httpd (which is a prerequisite for ptest). If you choose
both then curl takes precedence in the client and won't be linked
against libsoup:

root@tmt-561:~# ostree --version
libostree:
 Version: '2019.5'
 Git: v2019.5
 Features:
  - libcurl
  - libsoup
  - gpgme
  - libmount
  - release
  - p2p
root@tmt-561:~# ldd /usr/bin/ostree | grep soup
root@tmt-561:~#

I have to admit to not being a fan of this change as (IMO) it just
confuses what's part of PACKAGECONFIG and what's not.

> > +
> >  # Package configuration - match ostree defaults, but without rofiles-fuse
> >  # otherwise we introduce a dependendency on meta-filesystems
> >  #
> > @@ -50,15 +55,13 @@ inherit autotools bash-completion gobject-introspection gtk-doc manpages pkgconf
> >  PACKAGECONFIG ??= " \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd libmount', '', d)} \
> > -    soup \
> > +    ${OSTREE_PULL_TRANSPORT} \
> >  "
> >
> > -# We include soup because ostree can't (currently) be built without
> > -# soup or curl - https://github.com/ostreedev/ostree/issues/1897
> >  PACKAGECONFIG_class-native ??= " \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
> >      builtin-grub2-mkconfig \
> > -    soup \
> > +    ${OSTREE_PULL_TRANSPORT} \
> >  "
> >
> >  PACKAGECONFIG[avahi] = "--with-avahi, --without-avahi, avahi"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Alex Kiernan

