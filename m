Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62974EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 22:47:22 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.5515.1688510839869194415
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jul 2023 15:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=b3xnkQa/;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-565db466671so86961eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 15:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688510839; x=1691102839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KY9mDHmHqlz52xk5t+5d5gLm+w4WTB40lmQh97eyUGY=;
        b=b3xnkQa/DEh9Z8FymPXeWYxH8JnVGDqwAp7WBmeFfAlwBU3i4/AgT1/zewmqpvl7tt
         +H/l8iOzzCfcBYuS/nmGSVZ01wrjcyuIjHMHvdcktRCpCpufoV8c1xbda7+NL2s+A/e2
         Dol1PVcVfzAkYM+YCzLbpDnvP04752tFLZL1Qv2XWLlSk/AB7m2CHbfFpNNWkUZY0z9A
         TfzLM/p569eBQpf9CMwALPJ+8gsD5/RWsXYDIkY9kpR5q677TvbWNiH9tcIUHgKgPUq+
         DhvcdSUuD9TJojPhFeN76TC6I/ZjIUSTL6ciTQjk7PHQaAhIZeyyvQKr1ef9rqD85seo
         M1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688510839; x=1691102839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KY9mDHmHqlz52xk5t+5d5gLm+w4WTB40lmQh97eyUGY=;
        b=OIPur0E+0Zaw30GKXiEGpXGTQrdcQgRCxv7zfDRmDR7q4UjWokoHQLQ+Y6Q7RPkHmT
         IJyX9wP1wl20eqq61cGOP9jwDP24tQ9KmM7VmjA/ClxLkKADq1aqI/oHrzvDhyqY9w3K
         vVu152KOmYnn13w/ZYGbwEv+BIageIHHPZFNIzQPR1cN6NM/Xpm7qxbQtOa2PeGP7+8a
         EZ78LosSQfBbSPohNtEVnWsS+sRAFnr333ybcJkOHKQGr8btB7pmvXP7I8zizc1kooZ6
         HO1A9sV9HEVhWZzjEnGn3+e+I+/O+D4YrEXwMFjQsGEjugoa1p9RVFujgp4weB7OEKBh
         rHvA==
X-Gm-Message-State: ABy/qLZFy8qYdXpQ3zn4y+GzREa7am/l6zD0zB0N2XR0ZxLJyqNA82Hy
	fXRkyPcTvVVMLWYzBcDlHslO7OcjSi4yJSUzh6c=
X-Google-Smtp-Source: APBJJlEAmz3gFSPTsWGT0y+k6iLVY2JHKJG7wDwFTaNQjCoiKRwVaAbeiUA/ZjnakTHqGIafyHAPrBS1/ZmcbDru3sU=
X-Received: by 2002:a05:6808:2083:b0:39e:c32d:1c8f with SMTP id
 s3-20020a056808208300b0039ec32d1c8fmr250274oiw.22.1688510839066; Tue, 04 Jul
 2023 15:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230704142816.2295084-1-akuster808@gmail.com> <DB5PR02MB102138E958E1A7EAA05282353EF2EA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102138E958E1A7EAA05282353EF2EA@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Jul 2023 15:46:53 -0700
Message-ID: <CAMKF1sq_pGmE4VWN+TkFyP1CHo8cgyUz1SfoomokQ0DO7UkVRg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] webserver: nginx: Add stream
 Signed-off-by: Luke Schaefer <lukeschafer17@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Armin Kuster <akuster808@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	Luke Schaefer <lukeschafer17@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 22:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103665

On Tue, Jul 4, 2023 at 9:12=E2=80=AFAM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Armin Kuster
> > Sent: den 4 juli 2023 16:28
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Luke Schaefer <lukeschafer17@gmail.com>
> > Subject: [oe] [meta-oe][kirkstone][PATCH] webserver: nginx: Add stream =
Signed-off-by: Luke Schaefer <lukeschafer17@gmail.com>
>
> Why is the Signed-off-by in the subject?

Its my mistake since I did not realize the newline was missing and I
accepted it into master.
this is a simple backport of that.

>
> >
> > From: Luke Schaefer <lukeschafer17@gmail.com>
> >
> > Add stream support to nginx PACKAGECONFIG
> >
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >  meta-webserver/recipes-httpd/nginx/nginx.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webser=
ver/recipes-httpd/nginx/nginx.inc
> > index dfced33300..231c1d1ec9 100644
> > --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> > @@ -43,6 +43,7 @@ PACKAGECONFIG[gunzip] =3D "--with-http_gunzip_module,=
,"
> >  PACKAGECONFIG[http2] =3D "--with-http_v2_module,,"
> >  PACKAGECONFIG[ssl] =3D "--with-http_ssl_module,,openssl"
> >  PACKAGECONFIG[http-auth-request] =3D "--with-http_auth_request_module,=
,"
> > +PACKAGECONFIG[stream] =3D "--with-stream,,"
> >
> >  do_configure () {
> >      if [ "${SITEINFO_BITS}" =3D "64" ]; then
> > --
> > 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103660): https://lists.openembedded.org/g/openembedde=
d-devel/message/103660
> Mute This Topic: https://lists.openembedded.org/mt/99947525/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

