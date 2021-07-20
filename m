Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web09.94.1626800258995273957
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jul 2021 09:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tanous-net.20150623.gappssmtp.com header.s=20150623 header.b=WJyYqv2c;
 spf=none, err=permanent DNS error (domain: tanous.net, ip: 209.85.208.169, mailfrom: ed@tanous.net)
Received: by mail-lj1-f169.google.com with SMTP id d17so11821328ljq.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jul 2021 09:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J/bmhqg9AryU0SUj14gwlZwH/bm8tdVqXDbOvQ9fJqQ=;
        b=WJyYqv2c987KVAyHYH44M0/Ai5AEaeffumt+gk58bCYNE320aFdbuG7n3dYr9P22hK
         qxDFg+SwKyVVucrWCe8CIr+RgqIF2834fQqVfUxZCWpUKLnq3ClwTXP0LwZNkBcKN9D+
         ksp/Z3R3dtRJoPt71/40lw7MtCUnKd4qK3txI0h389Sxsp4CYi/Bbrlkg/M5be/AaR9L
         ncdHCqQiCLCKmFiI2yQHBiugk4K3QkCYyFgwgoAhqhx1lbVrL49aZswgFFU18j/yxfWT
         4VgxXnoopuuM6zqAh1aMzXNXo/Da897Ti8pR+Xcv+MHXZzd+NcuEWfb23uU5d5oi9nSC
         XQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J/bmhqg9AryU0SUj14gwlZwH/bm8tdVqXDbOvQ9fJqQ=;
        b=Q8m+Wu38N7imKQDFBGmOEMIIP3DWaFnSb/VOWo03n3+nnZj51Iawjf3yVOkLpgU54n
         U2R7WGCT7rREtt9HnABzEnbXeO2SbNojES0Lw+2+afKdNuT6ZyP2zXxc4kT3BZq3u/e7
         5JIpPqL7RmWX+oqmwzN/aGVClCHpAmnPKrGIBeiRmDnvzJ9BeFEt2CzA1atUPWr5F1fq
         MvkM9yjz1Rx2+Ns6U5c3ulrLFTPlJQaK762ZSyLQBJ7zIV9CCMXoqX70/9syXwCwxqe1
         VA6nPqOepIGSmJYlbSB6BBnjyWZYiBNGeHRN0H+sq6nwOq6uaO2FfLsv4UGIY3GdtvoX
         iN/A==
X-Gm-Message-State: AOAM533K+LohoG4z+oUmb1gzS7lWFNNl5E5bfRjLmcFmcfV1jjSFukHK
	KCKB6TPIFPan6rkXsG/6nmQOAhesYljbyPx7bey6CA==
X-Google-Smtp-Source: ABdhPJwMF3F6Oryik69SeoZK4pxjq1F80j2N2eCIueLX+Sqqh3X4fxKLOsCfIBtJR4qXchpxc+epyjLZia9XAa+oEFk=
X-Received: by 2002:a05:651c:1072:: with SMTP id y18mr14703588ljm.306.1626800257161;
 Tue, 20 Jul 2021 09:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210720035647.893435-1-ed@tanous.net> <12a32f2f-d1fe-6bab-d94e-baf6387d2e51@gmail.com>
In-Reply-To: <12a32f2f-d1fe-6bab-d94e-baf6387d2e51@gmail.com>
From: ed@tanous.net
Date: Tue, 20 Jul 2021 09:57:26 -0700
Message-ID: <CACWQX82WUJo+kFxH3YBrzbrntV_nW7zTHXNNvjfz2wpoEUW+EQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] nghttp2 Use the built-in options for removing pack tools
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 20, 2021 at 9:55 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 7/19/21 8:56 PM, ed@tanous.net wrote:
> > From: Ed Tanous <ed@tanous.net>
> >
> > For distros that want to use the ENABLE_LIB_ONLY option, the rm call in
> > the do_install_append() will fail, because ENABLE_HPACK_TOOLS (set
> > implicitly as part of ENABLE_LIB_ONLY) removes those two binaries from
> > the build, so they then can't be removed again.  It appears that nghttp2
> > has added explicit options for this use case, so this commit sets
> > ENABLE_HPACK_TOOLS=OFF, which not only allows for the option to be
> > overridden in other meta layers, also allows a simplified use of
> > ENABLE_LIB_ONLY in meta layers that don't want to ship any of the
> > binaries.
> >
>
> this is already applied to master via
> https://git.openembedded.org/meta-openembedded/commit/?id=df8ecfeacfc84a34a0696a48f3a1dc6d83496271

Apologies, I did not see it hit master and assumed it was being
ignored because I missed the extra subject line on my first
submission.  Feel free to ignore this second submission.

Thank you.

>
> so is it that you are proposing it for release branches.
> if so then indicate that in patch header.
>
> > Signed-off-by: Ed Tanous <ed@tanous.net>
> > ---
> >   meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb | 6 +-----
> >   1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
> > index 959cccf35..08b855262 100644
> > --- a/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
> > +++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.43.0.bb
> > @@ -18,11 +18,7 @@ PACKAGECONFIG[manpages] = ""
> >
> >   # examples are never installed, and don't need to be built in the
> >   # first place
> > -EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=ON"
> > -
> > -do_install_append() {
> > -     rm ${D}${bindir}/deflatehd ${D}${bindir}/inflatehd
> > -}
> > +EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=ON -DENABLE_HPACK_TOOLS=OFF"
> >
> >   PACKAGES =+ "lib${PN} ${PN}-client ${PN}-proxy ${PN}-server"
> >
> >
> >
> >
> > 
> >
