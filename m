Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id B8A547F27C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2019 07:44:11 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id w14so6109642qto.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2019 00:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XaRGVKckPdmDnYX+9CQQen9mEzsP+JYg4X0R8n92OLw=;
	b=nUFgGmdKqcvfBbu1OwbwORo0k2rcmtdaUgKrr1cVKdNKH+inBVhkiMYv1IKcUTee9v
	VeATxuoj9EPWC7/M7TVkmWCy6/yjRj/pVM13zrfRaLW1WxdgSt6Un4D7SQQHY21g9OGK
	uWyFXxCrbPq63VDjGL95Wo2Zz5ni2ZDxL06xgVdQBxV4xqeklMfvK55AZyi3iX2cuXfO
	fpSuWQOAp2IMhJ2WGeIypHQRTli0x2FSih6gLdsdxHfgdYiW7CEm8OCG+xrbWWoN9NBx
	DoA6/c9qNnr68OF5HJKoIUIGQI/Ck67nKBxHj+y/iIAoG5eZ/j3EU875ua7lQlAJ0RUv
	73HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XaRGVKckPdmDnYX+9CQQen9mEzsP+JYg4X0R8n92OLw=;
	b=iILD14DxXKLmwNwYM1QOPy2Av9LFzwj/0qMOiDxJUs0WT+pnSQ4eiyIc2rbqkVUZHo
	fLfhf5hJSL0mtbwNt9Bqk8cqrA8+X8BGxxoMyZYuGPf8KWPMNgBdIAzX8koUjwyDiz06
	uVYEQSWLJaT4wtIWYCSjTkG1FXrqG/k8baEu3C3kykNn3m7ryDR3PAHdx52nhrUKTgUU
	VnJ27cV7QCuHQy/pv+VBcll46NnjG+HHhxa5VZMj+eoUSUYXmwoufHYVRabFWqL76h0H
	oCURJXnVPmZDH3L4Tspd6eYWhu8pyXY3M2Rh5gq2fAAG25Sp92/UAQeYyaHOtnVkBQFk
	rbCg==
X-Gm-Message-State: APjAAAXCdKv47QXQrbjMMaTilp/d7vgFTAHoDw7VHIU9dshfhI7+3rvo
	d2KLxY+3VG4zMDNeqcTKXC9ZRci3eljbbDgOE0U=
X-Google-Smtp-Source: APXvYqzU/d04cZvIbTL8aXWA3E0J+njfdqA6I2+8O7bwYD83GTbhG9b838+QPf5BkwgDG907fZvi3CoKEgBsJDNm2Xo=
X-Received: by 2002:ac8:5306:: with SMTP id t6mr8604984qtn.53.1569570252102;
	Fri, 27 Sep 2019 00:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190926162655.375600-1-Martin.Jansa@gmail.com>
	<20190926194855.GA27652@localhost>
	<3a37c354-dfca-d7e3-70c3-842d13fae466@windriver.com>
	<b8fc2607-3244-84be-82a5-c27d942155ad@windriver.com>
	<CA+chaQe4ozUnBNE4qQX3io1LjBtEZ8CSYxX+wQohQ4kxzTJ5_Q@mail.gmail.com>
In-Reply-To: <CA+chaQe4ozUnBNE4qQX3io1LjBtEZ8CSYxX+wQohQ4kxzTJ5_Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Sep 2019 00:43:45 -0700
Message-ID: <CAMKF1sp5CC7pYsOLQhCNgAePf5-_0dKB=js+cYZ6w-myB30vpA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Fri, 27 Sep 2019 07:44:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 27, 2019 at 12:42 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Why? there are many PACKAGECONFIGs for optional dependencies which aren't
> in the same layer as the recipe with that PACKAGECONFIG.
>
> As long as it's not enabled by default it is correct to have the
> PACKAGECONFIG to control the dependency explicitly.
>

right

> Cheers,
>
> On Fri, Sep 27, 2019 at 9:20 AM Robert Yang <liezhi.yang@windriver.com>
> wrote:
>
> > Hi Martin,
> >
> > We found another problem on spice_git.bb:
> >
> > PACKAGECONFIG[smartcard] =
> > "--enable-smartcard,--disable-smartcard,libcacard,"
> >
> > I can't find libcacard:
> >
> >
> > http://layers.openembedded.org/layerindex/branch/master/recipes/?q=libcacard
> >
> >
> > So it seems that this PACKAGECONFIG is invalid, should we remove it?
> >
> > // Robert
> >
> > On 9/27/19 11:56 AM, Robert Yang wrote:
> > >
> > >
> > > On 9/27/19 3:48 AM, Adrian Bunk wrote:
> > >> On Thu, Sep 26, 2019 at 04:26:54PM +0000, Martin Jansa wrote:
> > >>> * with older native gcc on host this will break spice-native with:
> > >>>    cc1: error: -Werror=address-of-packed-member: no option
> > >>> -Waddress-of-packed-member
> > >>>
> > >>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > >>> ---
> > >>>   meta-networking/recipes-support/spice/spice_git.bb | 2 +-
> > >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/meta-networking/recipes-support/spice/spice_git.bb
> > >>> b/meta-networking/recipes-support/spice/spice_git.bb
> > >>> index 30e939ac07..2829a59d15 100644
> > >>> --- a/meta-networking/recipes-support/spice/spice_git.bb
> > >>> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> > >>> @@ -37,7 +37,7 @@ DEPENDS_append_class-nativesdk = "nativesdk-openssl"
> > >>>   export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
> > >>>   export
> > PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
> > >>> -CFLAGS_append = " -Wno-error=address-of-packed-member"
> > >>> +CFLAGS_append_class-target = " -Wno-error=address-of-packed-member"
> > >
> > > Yes, the error was the same as you mentioned in the commit message, and
> > > "bitbake spice-native" works with this change.
> > >
> > >>> ...
> > >>
> > >> Least hassle would be
> > >>    CFLAGS_append = " -Wno-error"
> > >
> > > "bitbake nativesdk-spice" works with this change, otherwise, it doesn't
> > work.
> > >
> > > This patch works for me.
> > >
> > > // Robert
> > >
> > >>
> > >> cu
> > >> Adrian
> > >>
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

