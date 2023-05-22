Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28256C77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 11:12:49 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.19127.1684753965672483160
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 04:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UARxQzFz;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: jan.vermaete@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6ad13a1fbceso4287551a34.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 04:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684753965; x=1687345965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZFxjQ2oUd0GHEk2NEnTw82QpM5DvR0+JowgvawTrlo=;
        b=UARxQzFzHdAOFQt73xN1XvD6tik2Qm4scbbi/gz82x7OCxPIl/IaXlUD5wnsDh0+pd
         erAXgV0dGMWJpLK7GkYVFic8IAuMyga/wG6XmLzoblUcWlDNZ7FiUpOSPNqSkJqZfK9L
         u6GKw6mdtEcyJ8Wr+ZvbZ80Gdye0kztppT9nC1kXUPveC7aS0M6q7Uq79M1IJRmzgJGt
         oMNi3DwRIcbGRP1XhLdU5kPsSxi7v52POdrmSEGH3u1T/oswm319D3gcrJcS7bOkK6dn
         Bg/J4Ex9du4bdi84rwdToN2lSWxQScyhnP69Y5ghCLo6EUyDZ1qmxd3Srbrmrs3XS4GK
         tSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684753965; x=1687345965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZFxjQ2oUd0GHEk2NEnTw82QpM5DvR0+JowgvawTrlo=;
        b=CbLNXyU57XUumAmw0qqAhTgp3Z9drBv6iEKCRL6WVNYW2Crf42BxK4oVetH58PPmMy
         uMYQcFnsHVw+6V534tdjkVhgKRC7SvcJNBxyYUmwa/nCzOpplziDkFc878nKWtmLeq9Q
         QY6ks6fpXjDiKxMigp44v+8d/+TO5SAwxEdxWvDICzMnysh+e1I8I8Q6h8IUNZrGUL6C
         fW7INDd5gp8GPJkZ2OwTYVINCezgluSOOlfPKmMZ9/oLGcP4NJwveW853/Tv71RQHFer
         oJ0tq4DOD/UAaNdvR6aBrSzV1rHYf4aV+j3J9QH7A/CKxLE51rdxh7bog3LhykS2NtX+
         7rYw==
X-Gm-Message-State: AC+VfDyVqRQj3UA2gmtOhE1ZpeyERPWIOZZ+Nx6gs7w2B0JOD2aq/1Sb
	twI/+3wLOeEbMB2xpuUzTjNmWP6XcaqWqaHGahg=
X-Google-Smtp-Source: ACHHUZ6L/lJ5k0tPhhU99IDDryVPGTztjgqVfOu/bZrol+bRmyDLa22Jh1HGwSgfCg2yEODuEfOxvb42K1tAVDdLAtQ=
X-Received: by 2002:a05:6870:7682:b0:196:275:59ba with SMTP id
 dx2-20020a056870768200b00196027559bamr7046066oab.7.1684753964781; Mon, 22 May
 2023 04:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230514035746.1550853-1-raj.khem@gmail.com>
In-Reply-To: <20230514035746.1550853-1-raj.khem@gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Mon, 22 May 2023 13:12:33 +0200
Message-ID: <CABF_=yifnMP5HbbpMj2jtc48TpHCCTE=KEUij2hLSQA2KpkiGQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fftw: Remove hardcoded sysroot into binaries
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 11:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102706

Hi,

Could it be this is causing a failure (see below)

Thanks,

DEBUG: Executing python function autotools_aclocals
DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']
DEBUG: Python function autotools_aclocals finished
DEBUG: Executing shell function do_compile
sed: -e expression #1, char 0: no previous regular expression
WARNING: .../build/tmp/work/x86_64-linux/fftw-native/3.3.10-r0/temp/run.do_=
compile.464684:153
exit 1 from 'sed -i -e 's|||g' config.h'
WARNING: Backtrace (BB generated script):
        #1: do_compile,
.../build/tmp/work/x86_64-linux/fftw-native/3.3.10-r0/temp/run.do_compile.4=
64684,
line 153
        #2: main,
.../build/tmp/work/x86_64-linux/fftw-native/3.3.10-r0/temp/run.do_compile.4=
64684,
line 199

On Sun, May 14, 2023 at 5:57=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> FFTW_CC is added to image via version.o and its CC + CFLAGS however CC
> in OE containes --syroot compiler option which encodes buildpaths into
> binary, therefore remove this option from FFTW_CC in config.h
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-support/fftw/fftw_3.3.10.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb b/meta-oe/recipe=
s-support/fftw/fftw_3.3.10.bb
> index cb45e2b91f..1fead4d029 100644
> --- a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
> +++ b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
> @@ -55,6 +55,7 @@ do_configure() {
>  do_compile() {
>      for lib in fftw fftwl fftwf; do
>          cd ${WORKDIR}/build-$lib
> +        sed -i -e 's|${TOOLCHAIN_OPTIONS}||g' config.h
>          autotools_do_compile
>      done
>  }
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102563): https://lists.openembedded.org/g/openembedde=
d-devel/message/102563
> Mute This Topic: https://lists.openembedded.org/mt/98879626/2167232
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [j=
an.vermaete@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

