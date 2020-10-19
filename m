Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.7576.1603147316230770925
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 15:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AAae4mYp;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id z6so39338qkz.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2020 15:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VhUhOXezlgq1jXnPPIPAf3jl/obqL7DKi1BHxj+xQ0o=;
        b=AAae4mYpORO7dtdgTHHdzfL2WNOyeqgnr7amv5t1mgv37V1MOezpkFo1ZX5GHXflhH
         lehMGHsDkcWzJ2+Kje1p3G3co6G/32hXLUWh6Z4Ul90gfWJbuOMt8pVE9UG2Ydoq9Wbu
         KLnzxOXMWYm9jsBAGlNUzFqduBPUJQ09A65Fl1GyjAnWgm0QdE5dIzu8aWji9I43l6yw
         mUVQI22/29VJIFf+j4MeIjuB/G2hG3KsPCKXlzthFFazfjahvfya1C/tN9R3x4osnqqB
         vmEN8ooRuX/p/e3r02Uti6jibI7nvIp3d7yFyarjzGyHX/NXKjpK2M2W5UvwlqYgWg9k
         ERKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VhUhOXezlgq1jXnPPIPAf3jl/obqL7DKi1BHxj+xQ0o=;
        b=LwmcZxVIVYjSgYHnLN0qDC206nNhO5NWcm3X9TgrXNU8g8UVhz6JRIV7/i6vRHZatp
         Yp1J3LVvPu31HvA1OIMGO49WC2j+aVq77EMoFFo3B/TTm2Ft3uYGY06fd8CU80p4hvYV
         MQr8k/DF463COhwnKTncqyxlhOsZMRwxWxwFY/HLV1j8v6JPEL8jp0Sp3/MSPom+MQP+
         Ulj2DMuQ5cBfipodIAjpMTWJ0xyMFV8h3WpnXRy5H5ZD6czuiox6C0KKIIhqTAcNb0NX
         La6aoEa7d8uhcBtlTx+tvE41zfxGQULl4rPBqcOyDFIr3wTJ8XIpjRdjS11GGzqEu8rG
         bdWQ==
X-Gm-Message-State: AOAM5313t5sbf8JmtrRh0BHWFKnOZnh9fWO/qSnrQ6+tx86TRGRwJW08
	o2EBV1Ic+nRMeY25vlYFObQm7Jig40rQhSVuyDg=
X-Google-Smtp-Source: ABdhPJwlT7O/d7Tl7bieXoBkK3jQPYduBELdLBXy1gR88MArUITys3fp6pV2YN9UKUpsJVUfEHOb89kjB5F1em22Gzg=
X-Received: by 2002:a05:620a:16cb:: with SMTP id a11mr1991774qkn.474.1603147315220;
 Mon, 19 Oct 2020 15:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201008161850.3097336-1-ross.burton@arm.com> <CAAnfSTuaLNpSAdLHLMAa9LEQsHp8AAoN+5ZzeWhjk=HdSoukAg@mail.gmail.com>
 <CAAnfSTvGDpim26Jty7voLVDdCwarp_K506C5swh-upE9ECPU-A@mail.gmail.com>
In-Reply-To: <CAAnfSTvGDpim26Jty7voLVDdCwarp_K506C5swh-upE9ECPU-A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 19 Oct 2020 15:41:29 -0700
Message-ID: <CAMKF1soW3e1h-Aj8dqYkgC9fnuR0VzO44fariSnZesvhq2oy7A@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] mpv: fetch waf in do_fetch
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

thanks yes they are already in master-next now

On Mon, Oct 19, 2020 at 4:48 AM Ross Burton <ross@burtonini.com> wrote:
>
> The waf changes have been integrated into master now, so these can be merged.
>
> Ross
>
> On Thu, 8 Oct 2020 at 17:26, Ross Burton <ross@burtonini.com> wrote:
> >
> > Note that this and the related glmark2 patch both depend on a change I
> > just submitted to oe-core[1].
> >
> > Ross
> > [1] https://patchwork.openembedded.org/patch/177061/
> >
> > On Thu, 8 Oct 2020 at 17:18, Ross Burton via lists.openembedded.org
> > <ross=burtonini.com@lists.openembedded.org> wrote:
> > >
> > > The mpv git repository doesn't include a copy of waf, instead there is a
> > > bootstrap script to fetch it.
> > >
> > > This recipe calls the bootstrap script in a do_patch postfunc, but
> > > downloading should be done in do_fetch. Instead of calling
> > > ./bootstrap.sh simply add waf to the SRC_URI so that Bitbake can use the
> > > mirrors/proxies/caching/checksum functionality.
> > >
> > > This is both better code and also works in buildtools environments
> > > where urllib2 can't make secure connections without configuration.
> > >
> > > [ YOCTO #14073 ]
> > >
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> > >  meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb | 12 +++++-------
> > >  1 file changed, 5 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
> > > index e5f1096b6..5273fc040 100644
> > > --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
> > > +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
> > > @@ -18,7 +18,9 @@ LICENSE_FLAGS = "commercial"
> > >  SRCREV_mpv = "70b991749df389bcc0a4e145b5687233a03b4ed7"
> > >  SRC_URI = " \
> > >      git://github.com/mpv-player/mpv;name=mpv \
> > > +    https://waf.io/waf-2.0.20;name=waf;subdir=git \
> > >  "
> > > +SRC_URI[waf.sha256sum] = "bf971e98edc2414968a262c6aa6b88541a26c3cd248689c89f4c57370955ee7f"
> > >
> > >  S = "${WORKDIR}/git"
> > >
> > > @@ -101,14 +103,10 @@ EXTRA_OECONF = " \
> > >      ${PACKAGECONFIG_CONFARGS} \
> > >  "
> > >
> > > -do_patch[postfuncs] += "get_waf"
> > > -
> > > -get_waf() {
> > > -    cd ${S}
> > > -    ./bootstrap.py
> > > -    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/waf
> > > -    cd -
> > > +link_waf() {
> > > +    ln -s waf-2.0.20 ${S}/waf
> > >  }
> > > +do_unpack[postfuncs] += "link_waf"
> > >
> > >  FILES_${PN} += " \
> > >      ${datadir}/icons \
> > > --
> > > 2.25.1
> > >
> > >
> > >
> > >
>
> 
>
