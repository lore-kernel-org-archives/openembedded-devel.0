Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.11502.1603108073420804437
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 04:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=SWfhAyq3;
 spf=pass (domain: burtonini.com, ip: 209.85.167.67, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f67.google.com with SMTP id d24so13755289lfa.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2020 04:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=iVNKn6gZid8So3s8IQT8JV0995jy4QeEsqV2KuDxnko=;
        b=SWfhAyq3mJFxTQ0bERITvVWHow8cU6kmt6xV9t9gJdKQaG6N12HmTkWDZpB9yrTkVu
         whPEk9yvP3deMgpRWmSFYuBihhHIgp2qC50qQsKI//BoCwF4NiAiwxvfh2RchBUst4oS
         xvXsAlFEsqeJYEOytoFEteL0YMAaq1Bk77JCFuzsJg/aWa8k8RQV9PjvzOYTI1aNzFV5
         RzsSSQpTUxfNRNxqdiQFrZO6V7gCRiwODXztySDY7/aEmKx9SeUd7iAWhEj8q5dZgJWs
         jzNp4qs5BNnyD/0Rnd5ot0byvPcOp4POf+tNhtLuYUV3YKeI6bt0OmZCHnHTdJeBl+U9
         rdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=iVNKn6gZid8So3s8IQT8JV0995jy4QeEsqV2KuDxnko=;
        b=U79oryr7M+rFDtpBpAfeddspxeCN5o1CcXFoVisiQhR4j4oCg8Jej4H48xc1xj7Hi0
         T+Y89M/YTSdsvrtpX1nxF/6LNKFo7HX1dcOn0DWS+47ZLYqof/oIqYg8W948EOQjdEAw
         VcegxWR9sQkPg0nMm5pLn+J7kb4ZfXU+IMEIrn7eDRoEkujFe2sGg99ZUZ7zOUHLM1Ba
         YuMIigMy81+XIeEpHfn3+7oaGlK4DmGPS2RxjUxgLlKUR9Wd4xR0F/daSElrH2PG81FP
         NqBnjTxlqXOemWwXo/oAoWUFE58wjVpynmqp6dWRDgjnI8ILjtL9eJzNLv04Cw680qoq
         Q68A==
X-Gm-Message-State: AOAM531it6i5QFM/ryLXY9IZtsAyaaoml4aMKMipJ0uGZlkG2axQIriI
	gXfGtCCMPBx3Df8TS3MUBRWmYOsGwa5k0MhJkvFRBYNZrniAaP4b
X-Google-Smtp-Source: ABdhPJyCOxXNSp3wLBUgtfhtvITl4SVET/krkIpronen1xwFAlSX22gszbFQpIiiu5S5lGfPL3XPI8lg1ZVv4CeKR/A=
X-Received: by 2002:a19:4281:: with SMTP id p123mr5231471lfa.398.1603108070977;
 Mon, 19 Oct 2020 04:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201008161850.3097336-1-ross.burton@arm.com> <CAAnfSTuaLNpSAdLHLMAa9LEQsHp8AAoN+5ZzeWhjk=HdSoukAg@mail.gmail.com>
In-Reply-To: <CAAnfSTuaLNpSAdLHLMAa9LEQsHp8AAoN+5ZzeWhjk=HdSoukAg@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 19 Oct 2020 12:47:39 +0100
Message-ID: <CAAnfSTvGDpim26Jty7voLVDdCwarp_K506C5swh-upE9ECPU-A@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] mpv: fetch waf in do_fetch
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

The waf changes have been integrated into master now, so these can be merged.

Ross

On Thu, 8 Oct 2020 at 17:26, Ross Burton <ross@burtonini.com> wrote:
>
> Note that this and the related glmark2 patch both depend on a change I
> just submitted to oe-core[1].
>
> Ross
> [1] https://patchwork.openembedded.org/patch/177061/
>
> On Thu, 8 Oct 2020 at 17:18, Ross Burton via lists.openembedded.org
> <ross=burtonini.com@lists.openembedded.org> wrote:
> >
> > The mpv git repository doesn't include a copy of waf, instead there is a
> > bootstrap script to fetch it.
> >
> > This recipe calls the bootstrap script in a do_patch postfunc, but
> > downloading should be done in do_fetch. Instead of calling
> > ./bootstrap.sh simply add waf to the SRC_URI so that Bitbake can use the
> > mirrors/proxies/caching/checksum functionality.
> >
> > This is both better code and also works in buildtools environments
> > where urllib2 can't make secure connections without configuration.
> >
> > [ YOCTO #14073 ]
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
> > index e5f1096b6..5273fc040 100644
> > --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
> > +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
> > @@ -18,7 +18,9 @@ LICENSE_FLAGS = "commercial"
> >  SRCREV_mpv = "70b991749df389bcc0a4e145b5687233a03b4ed7"
> >  SRC_URI = " \
> >      git://github.com/mpv-player/mpv;name=mpv \
> > +    https://waf.io/waf-2.0.20;name=waf;subdir=git \
> >  "
> > +SRC_URI[waf.sha256sum] = "bf971e98edc2414968a262c6aa6b88541a26c3cd248689c89f4c57370955ee7f"
> >
> >  S = "${WORKDIR}/git"
> >
> > @@ -101,14 +103,10 @@ EXTRA_OECONF = " \
> >      ${PACKAGECONFIG_CONFARGS} \
> >  "
> >
> > -do_patch[postfuncs] += "get_waf"
> > -
> > -get_waf() {
> > -    cd ${S}
> > -    ./bootstrap.py
> > -    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/waf
> > -    cd -
> > +link_waf() {
> > +    ln -s waf-2.0.20 ${S}/waf
> >  }
> > +do_unpack[postfuncs] += "link_waf"
> >
> >  FILES_${PN} += " \
> >      ${datadir}/icons \
> > --
> > 2.25.1
> >
> >
> > 
> >
