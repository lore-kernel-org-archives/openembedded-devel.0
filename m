Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8EA7F818
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 12:08:56 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id 18so10643816ion.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=90BL+iO2Xz+2RzOE1YwQMkMC9cOW1lCSma9M2ov1csI=;
	b=lMsM7gZMtYdupjUybkQff0klZb7ZuIQybtnFbUKGmg1CZEKTw4YXMPR8pHqb9Kejfw
	66ekUGjVxvkSdjrzyzAuVemfqqKEr+YHJsRcKBGdzpoy4C6Q/Jolc3I5oO6sHbW6Xy2m
	pAy+UBidj8gREcgzqSHxcNLaIK+eyKp9xoyj6ATjTBlpXUwVGjA9weYKtXg7gyZKJUAB
	JecoftG26Y+CivuMnVfGRVL+/YkZwSxV+4ok3B6xKc07szfJzHH6hQzYanmWaSQw3ag/
	yQvaCXMEBImiUWv0bgwRG4tFEEZQt9SbHYXsj1a6iluQr7mnihVj0Hdutea/iDhIYzYF
	zoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=90BL+iO2Xz+2RzOE1YwQMkMC9cOW1lCSma9M2ov1csI=;
	b=GHYr8xqfGyGniXwoEXtbG950wINP1iSa/7Pz0okUWyKUNTgs7/VpGBl+vs1LLia/uu
	fQFTxT3PQLL/r7lJoWEOykU5OUrFIqQPJKCz79jZ1K6jecrPyRHaFZoRorEltdAlkdop
	XFBMp2kmprOiQiKyrhpMFM7TDi1wZ8oLOpQY9aeJgYC2T5pqW/bAfL7VJKlxhh2TlyvP
	uuCx8tOlppD/2adpCBCB66gtgNmTO6bxFWkauE+n8w2Kc32XNbyrnonWK964ll3VJNqW
	5LSHD9gLwWXyOyDWvAXUOkdebc+s99bTgv0lnI1CQsxeDOKBkXhZGCxO8+dvRCfjrGX4
	vhyQ==
X-Gm-Message-State: APjAAAWxcGkBm6f3XG0XIv5HKjyZy4gg0YgPQN10dCwvuktdyexlGt74
	NTw9Pn/cXnUaSuXfcmfs46KrNj2ml7muHpBYfOE6URjf
X-Google-Smtp-Source: APXvYqyoFWHqcHmJbtub3XOZvWFLK7uPH94oEf9oks0wO9aGHy5E50XLn2Mz+CYlsHQkrI2TVacNHd7aWsDmylNDMfg=
X-Received: by 2002:a5d:8185:: with SMTP id u5mr9468362ion.147.1572610137771; 
	Fri, 01 Nov 2019 05:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <1572616775-69362-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CANNYZj_aty2tpJ6qttT3phqktydh_xz0sVPwv-n4hfYQjKHr-Q@mail.gmail.com>
In-Reply-To: <CANNYZj_aty2tpJ6qttT3phqktydh_xz0sVPwv-n4hfYQjKHr-Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 1 Nov 2019 13:08:45 +0100
Message-ID: <CALbNGRSOUYZyLs54vKNQV9PurhnxugMmjn6kj6cb1nkos5O+8Q@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] glibmm: upgrade 2.62.0 -> 2.63.1
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
X-List-Received-Date: Fri, 01 Nov 2019 12:08:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 1, 2019 at 11:55 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Is 2.63.1 a pre-release version? As a gnome project, it's probably
> following the odd-even scheme.
>
> Alex
>
form [1]

| 2.63.1: (unstable):
| Distro packagers should probably not package this yet.

So why should we?

[1] http://ftp.gnome.org/pub/gnome/sources/glibmm/2.63/glibmm-2.63.1.news

Andreas
> On Fri, 1 Nov 2019 at 11:20, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> wrote:
>
> > 1) Update DEPEND from libsigc++-2.0 to libsigc++-3.
> >
> > 2) Update install dir from glibmm-2.4 to glibmm-2.64.
> >
> > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > ---
> >  .../glib-2.0/{glibmm_2.62.0.bb => glibmm_2.63.1.bb}        | 14
> > +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >  rename meta-oe/recipes-core/glib-2.0/{glibmm_2.62.0.bb =>
> > glibmm_2.63.1.bb} (68%)
> >
> > diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
> > b/meta-oe/recipes-core/glib-2.0/glibmm_2.63.1.bb
> > similarity index 68%
> > rename from meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
> > rename to meta-oe/recipes-core/glib-2.0/glibmm_2.63.1.bb
> > index 75eea4e..99f5cf9 100644
> > --- a/meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
> > +++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.63.1.bb
> > @@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1 & GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
> >
> >  file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
> >
> > -DEPENDS = "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
> > +DEPENDS = "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
> >  inherit gnomebase
> >
> >  SHRT_VER =
> > "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
> > @@ -13,23 +13,23 @@ SHRT_VER =
> > "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
> >  SRC_URI += " \
> >      file://remove-examples.patch \
> >  "
> > -SRC_URI[archive.md5sum] = "7da228e3f0c6a10024b9a7708c53691e"
> > -SRC_URI[archive.sha256sum] =
> > "36659f13cc73282392d1305858f3bbca46fbd1ce2f078cc9db8b9f79b2e93cfe"
> > +SRC_URI[archive.md5sum] = "6d00da9e119d3cd1a27caaae4b00114e"
> > +SRC_URI[archive.sha256sum] =
> > "4f99e29bd0a67afd94c0d6fdad2b86bc5cd944cd5d4ff097520dc58b6c997ada"
> >
> >  do_install_append() {
> > -    install -d ${D}${datadir}/glibmm-2.4
> > +    install -d ${D}${datadir}/glibmm-2.64
> >      install -d ${D}${datadir}/aclocal
> >
> > -    install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.4/
> > +    install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.64/
> >      install -m 0644 scripts/glibmm_check_perl.m4 ${D}${datadir}/aclocal/
> > || true
> >
> >      for i in generate_wrap_init.pl gmmproc; do
> > -        sed -i -e '1s,.*,#!${bindir}/env perl,'
> > ${D}${libdir}/glibmm-2.4/proc/$i
> > +        sed -i -e '1s,.*,#!${bindir}/env perl,'
> > ${D}${libdir}/glibmm-2.64/proc/$i
> >      done
> >  }
> >
> >  FILES_${PN} = "${libdir}/lib*.so.*"
> > -FILES_${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/
> > ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
> > +FILES_${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.64/include/
> > ${libdir}/glibmm-2.64/proc/ ${libdir}/giomm-2.64/include/"
> >
> >  RDEPENDS_${PN}-dev = "perl"
> >  SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
> > --
> > 2.7.4
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

