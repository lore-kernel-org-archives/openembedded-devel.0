Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 192CC7F27C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2019 07:42:29 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id c4so1519877edl.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2019 00:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yaQQw54lJjBOfUaPgTJ+M+243L8W2CW3LGEH3XIYEAU=;
	b=avOaq5wpkhfE0y/pXgPdiSA0dJqblY8BrwbEkEn7YXZ0HYTa7mkykKidg5SpO/TNxN
	jM0INw7XM4LfhCbg2zTYHfjGJticgaWAs3wnJZlFebrqseFL5hmNHOs7mmIyYB1bRl25
	TImelKRnSs+/qVhIGoKaDuYmIqeacEu8Pn8/7d4aPdxswAvwKzfPFjCZPkwmVI1JWX/1
	fKkpjhE/1k7Qlx6Im5bmRrM+lTGABkHDsvExMMgSmprSQB3c4mOPFAsx1eXCKkDhqr8L
	xgAtlPWiIQCK0hDQq42BIgm3ejEdr6SkRGCl6AUFbrwtp7ZmkL9k0sooJg0gUCqqQ9bz
	fg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yaQQw54lJjBOfUaPgTJ+M+243L8W2CW3LGEH3XIYEAU=;
	b=jEjBOrVf2J/pbQMA5QsvZuvJnTmI2Zw4P6uv6bF8rUgISIYkhZ2nFnlDFDDZe9HVLc
	FbwUbVrA9tmJqGWPhbOUTTx6WAahcavxRbfO39p7cArQgFo6B7Fi9/p9b08ei150oduh
	InNVcTYgwrrJmoQ6hwPhS5iMuXOAgoSYoLSAaTvFE/KmIMYoj3o10Sywh9fWCMn76Qsc
	rF5mol4JL1OmqYUoSQFD2SfsGJXJN3ojkS8HddoWF49Shm+jsEPVmytXCO5MPWz/RYPM
	smmIGf9yBVsCVHKtOoypZsJ9Wa8M5pQ41k+254D/J/wdfMs24aF2GhV+r0k+T+4tk8Wc
	7UBg==
X-Gm-Message-State: APjAAAUVW/eLM+NOHwcuzskRSrBJw6X5MbdRLUM2MTt+rSAdOmiFrF9P
	YtIuxdnTERih9UetLlV8NyE3fKskE8RHIW4RYCk=
X-Google-Smtp-Source: APXvYqzbgTVS31p+MUYlZWcTZftpGOsB9gcLg4lgiW08E7TtpUQqFehvJfiKorV8LYUQB+LzW5jzVRJcnRh2dz+UgVw=
X-Received: by 2002:a05:6402:696:: with SMTP id
	f22mr2972950edy.216.1569570150650; 
	Fri, 27 Sep 2019 00:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190926162655.375600-1-Martin.Jansa@gmail.com>
	<20190926194855.GA27652@localhost>
	<3a37c354-dfca-d7e3-70c3-842d13fae466@windriver.com>
	<b8fc2607-3244-84be-82a5-c27d942155ad@windriver.com>
In-Reply-To: <b8fc2607-3244-84be-82a5-c27d942155ad@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 27 Sep 2019 09:42:19 +0200
Message-ID: <CA+chaQe4ozUnBNE4qQX3io1LjBtEZ8CSYxX+wQohQ4kxzTJ5_Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-networking][PATCH 1/2] spice: append -Wno-error=address-of-packed-member only for target
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
X-List-Received-Date: Fri, 27 Sep 2019 07:42:30 -0000
Content-Type: text/plain; charset="UTF-8"

Why? there are many PACKAGECONFIGs for optional dependencies which aren't
in the same layer as the recipe with that PACKAGECONFIG.

As long as it's not enabled by default it is correct to have the
PACKAGECONFIG to control the dependency explicitly.

Cheers,

On Fri, Sep 27, 2019 at 9:20 AM Robert Yang <liezhi.yang@windriver.com>
wrote:

> Hi Martin,
>
> We found another problem on spice_git.bb:
>
> PACKAGECONFIG[smartcard] =
> "--enable-smartcard,--disable-smartcard,libcacard,"
>
> I can't find libcacard:
>
>
> http://layers.openembedded.org/layerindex/branch/master/recipes/?q=libcacard
>
>
> So it seems that this PACKAGECONFIG is invalid, should we remove it?
>
> // Robert
>
> On 9/27/19 11:56 AM, Robert Yang wrote:
> >
> >
> > On 9/27/19 3:48 AM, Adrian Bunk wrote:
> >> On Thu, Sep 26, 2019 at 04:26:54PM +0000, Martin Jansa wrote:
> >>> * with older native gcc on host this will break spice-native with:
> >>>    cc1: error: -Werror=address-of-packed-member: no option
> >>> -Waddress-of-packed-member
> >>>
> >>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>> ---
> >>>   meta-networking/recipes-support/spice/spice_git.bb | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta-networking/recipes-support/spice/spice_git.bb
> >>> b/meta-networking/recipes-support/spice/spice_git.bb
> >>> index 30e939ac07..2829a59d15 100644
> >>> --- a/meta-networking/recipes-support/spice/spice_git.bb
> >>> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> >>> @@ -37,7 +37,7 @@ DEPENDS_append_class-nativesdk = "nativesdk-openssl"
> >>>   export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
> >>>   export
> PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
> >>> -CFLAGS_append = " -Wno-error=address-of-packed-member"
> >>> +CFLAGS_append_class-target = " -Wno-error=address-of-packed-member"
> >
> > Yes, the error was the same as you mentioned in the commit message, and
> > "bitbake spice-native" works with this change.
> >
> >>> ...
> >>
> >> Least hassle would be
> >>    CFLAGS_append = " -Wno-error"
> >
> > "bitbake nativesdk-spice" works with this change, otherwise, it doesn't
> work.
> >
> > This patch works for me.
> >
> > // Robert
> >
> >>
> >> cu
> >> Adrian
> >>
>

