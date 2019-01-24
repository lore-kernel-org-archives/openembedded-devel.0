Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 149CB60807
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 18:18:01 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l12so7716442qtf.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 10:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=L9Og5y4jY6KIPvhYybvrEkx0F3timeGxmCjYLTLVzHk=;
	b=nlQJFgLLF13Dyb4HEVVOIj5xlSvE8raGfQDIB6sdSvMj/uAtTd0SUOwVm2GWBJlxUZ
	20sCNwIVbMJfWzIjwkDMe9sIs2fOxg6cyVEFM9XCxVNzKOADFpTw6l2pBG17FEDPe9mK
	SQHrRHVNFbwfZiYYZ5JyudleT0c3/rImOXFzO1fA9U0JMOBX5zM9iD9Lq4WfwlybxV8y
	BVPKWNGPLNDw2+s82bb2Jj/Gk7csDhN79doal2QxnmkCmR7yFtyrNJBOaZQlZ4nGhutN
	/96KV4Vvjq9DRaDKl64dWyL3IzxlZfGW26fUJp5+XNY7MCu2K/nrxqQLmc4qf1Iz10A1
	yE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=L9Og5y4jY6KIPvhYybvrEkx0F3timeGxmCjYLTLVzHk=;
	b=Ld0BrVj/oGYwF7ioO155XA9dkLU/Y76asYS2vwOfBiwhWWzH5Iz42568h1TSoPvS67
	nzSVQ8tvkzIBSorhkySGDNYLJlbk93lCeWgXfUjmOiQUOT5kOY2/5Y9U8oXoQttRytsj
	db2sk5w0XQY0vXCB3QlKwVxVUq0GpraxyV/VqU/Cut0wG8BYOz/W7NIMQtZimSESuS2r
	bx7IhSAx5fbjlfHR6cCwAbVU5dqrmgfRN8SbBR/EmIIDnGR4uIz8VnMscwS3yrVdGJyF
	ijXaG7LI9VkZkePPAPe764iqb2JM9iOlW9Wx53nnpTSUWrL5LI+zUWznjaDbpDlUZahE
	Ks9A==
X-Gm-Message-State: AJcUukf5VjG4XqevDSEt/MzDxzVsiEiLfzAxHmofYaqeluqDlm9OVFO1
	D5IOl0Bwr7V7SByepsPME/sFbpsHKcnz+G/asOk=
X-Google-Smtp-Source: ALg8bN7qnGvlLqg0JohXwohaFHNKnL3JTgj86+M++SU/Nz9jrSmLgxup/jQ5XE243kNf04hwH5aTyaGrUTLShn4AJtw=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr7214649qva.50.1548353882643; 
	Thu, 24 Jan 2019 10:18:02 -0800 (PST)
MIME-Version: 1.0
References: <20190124035832.14257-1-Randy.MacLeod@windriver.com>
	<4dec5db8-8391-9c4f-74b0-a06c974358fc@windriver.com>
In-Reply-To: <4dec5db8-8391-9c4f-74b0-a06c974358fc@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jan 2019 13:17:36 -0500
Message-ID: <CAMKF1spnopnSTz0BH2J7cJcpRRhd0ZdwWWSBFc3XKWm7FF553g@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] libvncserver: Update to latest commit post 0.9.12
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
X-List-Received-Date: Thu, 24 Jan 2019 18:18:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 23, 2019 at 11:28 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 1/23/19 10:58 PM, Randy MacLeod wrote:
> > Update to latest git HEAD which includes a fix for CVE-2018-15127.
> >
> > Support for lzo in addition to a bundled minilzo was added so
> > add a PACKAGECONFIG[lzo] and add it to the default config.
> >
> > Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> > ---
> >   meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> > index 25917756f..b789055bb 100644
> > --- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> > +++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
> > @@ -5,10 +5,11 @@ PRIORITY = "optional"
> >   LICENSE = "GPLv2"
> >   LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
> >
> > -PACKAGECONFIG ??= "gcrypt gnutls jpeg png ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} sdl zlib"
> > +PACKAGECONFIG ??= "gcrypt gnutls jpeg png lzo ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} sdl zlib"
> >   PACKAGECONFIG[gcrypt] = ",,libgcrypt,libgcrypt"
> >   PACKAGECONFIG[gnutls] = ",,gnutls"
> >   PACKAGECONFIG[jpeg] = ",-DWITH_JPEG=OFF,jpeg"
> > +PACKAGECONFIG[lzo] = ",,lzo"
> >   PACKAGECONFIG[openssl] = ",,openssl"
> >   PACKAGECONFIG[png] = ",-DWITH_PNG=OFF,libpng,libpng"
> >   PACKAGECONFIG[systemd] = ",,systemd"
> > @@ -18,6 +19,6 @@ PACKAGECONFIG[zlib] = ",,zlib"
> >   inherit cmake
> >
> >   SRC_URI = "git://github.com/LibVNC/libvncserver"
> > -SRCREV = "f997b5a75fa171d79c5e568b7157fba83c8d8355"
> > +SRCREV = "c0a23857a5c42b45b6d22ccf7218becd1fa69402"
> >
> >   S = "${WORKDIR}/git"
> >
>
> glibc builds are fine,
> musl builds are underway.
>
>
> There are some packaging warnings that I haven't fixed.
>
> It would seem to me that the .so files should be separated
> into:
> libvncserver
> libvncclient
> along with a single -dev/dgb package just like debian does:
>
> $ apt show libvnc<TAB>
> libvncclient1        libvncclient1-dbg    libvncserver1
> libvncserver1-dbg    libvncserver-config  libvncserver-dev
>
> I'm not sure what's in the -config package yet.
>
> I'll make these packaging changes in another commit in a few days
> unless someone objects or beats me to it.
>

I will wait for v2 but give it a shot in local build but this patch
does not apply on master.
> --
> # Randy MacLeod
> # Wind River Linux
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

