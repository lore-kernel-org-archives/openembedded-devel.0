Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id AADAB7547F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 02:05:32 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id e22-v6so4031478qto.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2018 19:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U8II52NPlTUq+hn3GIQKW50BlMLGswQlGuYa0GomtgI=;
	b=ZDangdlmwkGhqHVaJR/rZK6W7XFbCakRr3ypud/Hwe6xxIxy12qAIwJu9gjUTqp8rv
	WssUdiYM3GasRirmVmQm2bJzf72mB/a6j4IWtJ/9XM2+8d4sl7Ubvx2ooF799VZQ1cjJ
	gjXnQIr5l6JtR6UwNKGZrhY8zofB6S2nuYdLayH2xNBTBfOXBQ6ekV/E5WtroKuc1EVJ
	qepkrVQ/N7sn20wayJSuBDho4Vv/qTteCO9t58VVygvglYXQUAFkK62iTraHNpBe+CWT
	wZKxkaA/TPWgu7uX5sMS5qfZtF7jbjddw6zsiDJIeDehJ1au5SJnW+ry0BgITyrS9aQR
	tL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U8II52NPlTUq+hn3GIQKW50BlMLGswQlGuYa0GomtgI=;
	b=ERD++hJJkYJx3SHSx7Ltazyxw5vgokP9PTDyuEMcz+GKKNHb2Fy4wOHy+Yc8XtfwPn
	DeBPNHK+UAPWNXD6U0NkXrtE6qdTaRf+ZsC4yr0rVJl6IPV53VlfAhAzzHPQdiwGn/U2
	Zsi+ZkGsMVQ4u7/Tc0VzwhC0pGCY+9sj+XIMTKeV3u3QEg2xfknOD6ehry/AUGERZ6ER
	ubJbBbPXgSBH7ciAeUdRNrZvXTyB8lvmjG5DfQvYNOcJ8my6Kl5GwIFSZ2rI+pp6mD+S
	gNkJjYuhJwUJohnySsZ5SefW7xocOUkcfNqzliUZgN+HQ1eAndnrWBt/zN96nr8OHtgZ
	87VQ==
X-Gm-Message-State: ABuFfogtlS+aNK8F/OZ1JEA776umMRRbqVsgx6/DOAE1QXtfgNKoqYHT
	x2LVI/Bruccjgp5ltcTjKOepF1/3OhESon6zk/A=
X-Google-Smtp-Source: ACcGV62fYDsLSFn6MsOj983mLjHbcSmXs8zMluzKJ9MRH6xdZTxeDlw9FjwKbTYXlYV1RlwSRyXCKLOMJen/a2TloII=
X-Received: by 2002:aed:3031:: with SMTP id
	46-v6mr25272573qte.29.1539137133373; 
	Tue, 09 Oct 2018 19:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <1539109670-43001-1-git-send-email-eajames@linux.ibm.com>
	<79b03cc8-41cf-f27e-c4ea-45f57f4a7ac9@gmail.com>
In-Reply-To: <79b03cc8-41cf-f27e-c4ea-45f57f4a7ac9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Oct 2018 19:05:07 -0700
Message-ID: <CAMKF1srBmwc75qXH2mvLoQ3Lav74E1yD+r5-_nTm0LiRWx+rKw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libvncserver: Update to latest version
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
X-List-Received-Date: Wed, 10 Oct 2018 02:05:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 9, 2018 at 5:31 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 10/09/2018 11:27 AM, Eddie James wrote:
> > The latest release of libvncserver is almost two years old. A number of
> > security fixes and enhancements have recently been committed. Since the repo
> > is stable, point the recipe to the latest commit.
> >
> > libvncserver switched from autotools to cmake, so update the recipe as
> > necessary, and add PACKAGECONFIG options to allow a more minimal build and
> > install.
> >
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > ---
> >  .../libvncserver/libvncserver_0.9.11.bb            | 25 ----------------------
> >  .../libvncserver/libvncserver_git.bb               | 23 ++++++++++++++++++++
> >  2 files changed, 23 insertions(+), 25 deletions(-)
> >  delete mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
> >  create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> >
> > diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
> > deleted file mode 100644
> > index 38dac06..0000000
> > --- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -DESCRIPTION = "library for easy implementation of a RDP/VNC server"
> > -HOMEPAGE = "https://libvnc.github.io"
> > -SECTION = "libs"
> > -PRIORITY = "optional"
> > -LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
> > -
> > -DEPENDS += "zlib libsdl jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
> > -
> > -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
> > -PACKAGECONFIG[systemd] = ",,systemd"
> > -
> > -RDEPENDS_${PN} += "libpng gtk+ libgcrypt"
> > -
> > -inherit distro_features_check autotools binconfig pkgconfig
> > -
> > -REQUIRED_DISTRO_FEATURES = "x11"
> > -
> > -SRC_URI = "https://github.com/LibVNC/libvncserver/archive/LibVNCServer-${PV}.tar.gz"
> > -SRC_URI[md5sum] = "7f06104d5c009813e95142932c4ddb06"
> > -SRC_URI[sha256sum] = "193d630372722a532136fd25c5326b2ca1a636cbb8bf9bb115ef869c804d2894"
> > -
> > -S = "${WORKDIR}/${BPN}-LibVNCServer-${PV}"
> > -
> > -TARGET_LDFLAGS += "-lgcrypt"
> > diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> > new file mode 100644
> > index 0000000..9fb2c09
>
> This removes any notion of a version. I think that is not ideal.
>
> Does the git hash equate to version ?
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> > @@ -0,0 +1,23 @@
> > +DESCRIPTION = "library for easy implementation of a RDP/VNC server"
> > +HOMEPAGE = "https://libvnc.github.io"
> > +SECTION = "libs"
> > +PRIORITY = "optional"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
> > +
> > +PACKAGECONFIG ??= "gcrypt gnutls jpeg png ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} sdl zlib"
> > +PACKAGECONFIG[gcrypt] = ",,libgcrypt,libgcrypt"
> > +PACKAGECONFIG[gnutls] = ",,gnutls"
> > +PACKAGECONFIG[jpeg] = ",-DWITH_JPEG=OFF,jpeg"
> > +PACKAGECONFIG[openssl] = ",,openssl"
> > +PACKAGECONFIG[png] = ",-DWITH_PNG=OFF,libpng,libpng"
> > +PACKAGECONFIG[systemd] = ",,systemd"
> > +PACKAGECONFIG[sdl] = ",,libsdl2"
> > +PACKAGECONFIG[zlib] = ",,zlib"
> > +
> > +inherit cmake
> > +
>
>
> Have you run " yocto-check-layer"  with this?
>
> I had to add 'REQUIRED_DISTRO_FEATURES = "x11" ' to make it pass on the
> previous version.

seemingly its still needed.

>
>
> > +SRC_URI = "git://github.com/LibVNC/libvncserver"
> > +SRCREV = "7b1ef0ffc4815cab9a96c7278394152bdc89dc4d"
> > +
> > +S = "${WORKDIR}/git"
> - Armin
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

