Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B91C7EE2D
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 04:47:27 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.13908.1684817246841595346
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 21:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qGdE2z5w;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-541f4ee6f89so1868778eaf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 21:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684817246; x=1687409246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdlNY6GZaY03mNsVTNnV/L9nmYF5npUyO0XrXqZsYm4=;
        b=qGdE2z5wHrL+lP9Qa53+SGbCyccEFiqLyUgRAmMwtkcnuJVWidnvcl8r71bKLXKYs1
         keAS4l8xFnwnWol0nChll3UkBIJAvEsmC3MBNvoYahQjfB86NBjkgVLop9lvE7pauasG
         GULFlQS74RgexsJZjEahprFFReOTIf8H+PQgyfM0+O4E3u7TPQw93YfLJL2NPdF7fMCC
         mb7tvMmw0Kkif0cLtw/jwZU/JogCPI5pdo26t48PHUloLoNCOge8qH5zuqC+ojVEGW9k
         LxwSD7Q0Uk5fg/KUvHJ1vb7jqTFOL7hxZwGEtGXf2ecauJ3v4Ws1A/8qM4HiP6WGPWM+
         7kEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684817246; x=1687409246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdlNY6GZaY03mNsVTNnV/L9nmYF5npUyO0XrXqZsYm4=;
        b=Cu8il9W4g4w/zQqhkYSgc6fS65+lWjkxnDYIQ1xh57ELuGvu24Zv++7BE+1f8TO+dt
         yUO4/2i4L1KRaibLeM7eepjfsD+iYOvQggAIXBKL5Vhpl3Xo2KR20+oB9PVTh0w2YQul
         KJWoMsc9gN8UC4rB8Iev0PJ3dEFkU9H7m4psWqEBuouKPzeMGeVQM4gLdnlEFYDTyUSZ
         7q6SMmqojBpHp6tmGl2DngWlcsdSdrAOM6vnhJHm1H0xSyZkadnCw2CRXfh2jyoDzIbb
         J+1L80mK7IJOq4hG2s4O8sr/M4gJc1GSADxm6iz3C5P3SS/lz/T6upIjt4QV5a+MlpLn
         UZsw==
X-Gm-Message-State: AC+VfDxxekaZtkNXP9/ygUJvRIghAIphJyoUnugnAcjPgs3fnRPsvGrF
	s0JUfpsBnuTasfc64SYjLTCGfcPMyDixlmz46cI=
X-Google-Smtp-Source: ACHHUZ5gMciKYhcWf+EJhEdCBbccJVCsijcySC45+ZNCN9XzecH5C5W/5zYis3FEvy9flZMOutP45VRDKFesk5sGSvc=
X-Received: by 2002:a4a:d1c2:0:b0:555:7682:7644 with SMTP id
 a2-20020a4ad1c2000000b0055576827644mr325731oos.2.1684817245869; Mon, 22 May
 2023 21:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230514035746.1550853-1-raj.khem@gmail.com> <CABF_=yifnMP5HbbpMj2jtc48TpHCCTE=KEUij2hLSQA2KpkiGQ@mail.gmail.com>
In-Reply-To: <CABF_=yifnMP5HbbpMj2jtc48TpHCCTE=KEUij2hLSQA2KpkiGQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 May 2023 21:46:59 -0700
Message-ID: <CAMKF1sq3nwWxAGSW41_xGRiV-BFLqXEAND4Hb92qmuzjcxe+Hw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fftw: Remove hardcoded sysroot into binaries
To: jan vermaete <jan.vermaete@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 04:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102728

On Mon, May 22, 2023 at 4:12=E2=80=AFAM jan vermaete <jan.vermaete@gmail.co=
m> wrote:
>
> Hi,
>
> Could it be this is causing a failure (see below)
>

Yes, it seems that we need to check for TOOLCHAIN_OPTIONS to be not
empty which is the case when
building the native recipe.

> Thanks,
>
> DEBUG: Executing python function autotools_aclocals
> DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> 'bit-64', 'x86_64-linux', 'common']
> DEBUG: Python function autotools_aclocals finished
> DEBUG: Executing shell function do_compile
> sed: -e expression #1, char 0: no previous regular expression
> WARNING: .../build/tmp/work/x86_64-linux/fftw-native/3.3.10-r0/temp/run.d=
o_compile.464684:153
> exit 1 from 'sed -i -e 's|||g' config.h'
> WARNING: Backtrace (BB generated script):
>         #1: do_compile,
> .../build/tmp/work/x86_64-linux/fftw-native/3.3.10-r0/temp/run.do_compile=
.464684,
> line 153
>         #2: main,
> .../build/tmp/work/x86_64-linux/fftw-native/3.3.10-r0/temp/run.do_compile=
.464684,
> line 199
>
> On Sun, May 14, 2023 at 5:57=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > FFTW_CC is added to image via version.o and its CC + CFLAGS however CC
> > in OE containes --syroot compiler option which encodes buildpaths into
> > binary, therefore remove this option from FFTW_CC in config.h
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/recipes-support/fftw/fftw_3.3.10.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb b/meta-oe/reci=
pes-support/fftw/fftw_3.3.10.bb
> > index cb45e2b91f..1fead4d029 100644
> > --- a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
> > +++ b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
> > @@ -55,6 +55,7 @@ do_configure() {
> >  do_compile() {
> >      for lib in fftw fftwl fftwf; do
> >          cd ${WORKDIR}/build-$lib
> > +        sed -i -e 's|${TOOLCHAIN_OPTIONS}||g' config.h
> >          autotools_do_compile
> >      done
> >  }
> > --
> > 2.40.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#102563): https://lists.openembedded.org/g/openembed=
ded-devel/message/102563
> > Mute This Topic: https://lists.openembedded.org/mt/98879626/2167232
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[jan.vermaete@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

