Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BCEFA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 16:46:52 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web08.332.1666889208668662721
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Oct 2022 09:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N8u6vD7E;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id g10so2829415oif.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 09:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1Q8aERGrCh1fn2r57PYOGzUkO53G3v4L8ay5FrwVb4=;
        b=N8u6vD7EtarnqJsPEjQfmHd1L6vAZHltrK2GmphrKWtGGNlJ9hiPC+8/xAgR0jcOiA
         YmpjgfsVKdfUWzd7voWYhUDU6ilbUeYScglcYAcXSK1pjuSVHnipeykSBJwL+6mUqors
         a5pU5AYprSKQmKW3CyxFmZGNFJDKJvEnFkHTEjqmV36pPVicrrDzlRL+o6+Z4o3UFO1H
         HLSt3dIVpe9fiTp1zbHQoa1mrm1dGpUcYTmZrxe0J6x4day+uKEIr8oqP9zDoBc9DUgb
         8ACH+XIaP04mwPlvPXEEactxEP+uYbJPzFvLeGr+ErFPe15kfMyaXXNGyJkp0UlOojJ9
         yzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1Q8aERGrCh1fn2r57PYOGzUkO53G3v4L8ay5FrwVb4=;
        b=0BkVGL/Vs+p63eV8QZ+C1Bvhystky87zURj3Lr2bh3kxb6ZXONre3RJYEo/oRLdgCp
         AQb3Fmz6IearXJQmYVzoGwZ0CU1IXzCZryh3Zh4U2wLGK+e0CIFhBNwjXcVj9V1gRPR0
         aysFk4YRDpXtme8t2vyA2v3qtx00Cp4bE5vg7A+9yjFgXv3DxErSb+oYc6L+ecBwsgjI
         B7quzijWhHTE5FRpyww01DwULP4Gub0PLbPVa9tgW71YOirtkl/FH/aevJkawnAJnwhd
         Ez62oexchw7YZoM9mGkg945uHHnVhLJ70vRxUme3fDpoNxiyAdSrI2/IFjKN5b0HupKs
         lvtg==
X-Gm-Message-State: ACrzQf2oMLmvLwuIjJpyXrSEIDMXzBuVOspqDSoQeMQWBSNpRIaznm33
	1hzSP5YLWLsW9sajC9Xp1H/pYOHfclmM6ra5d6M=
X-Google-Smtp-Source: AMsMyM6Ya9nnOfqZIu5F9EULbJBWcApfLfHm3Hv0TxYJl9WGvzmA1ZGVj+2G0Kxa2qg7C7l6FSY/Bb/Qvn63Cq8FrJY=
X-Received: by 2002:a05:6808:1902:b0:355:3420:6585 with SMTP id
 bf2-20020a056808190200b0035534206585mr5309147oib.262.1666889207923; Thu, 27
 Oct 2022 09:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221027142043.177983-1-JPEWhacker@gmail.com> <8459D7BE-DA2F-4EAB-9E61-2ED447F7EE6F@arm.com>
In-Reply-To: <8459D7BE-DA2F-4EAB-9E61-2ED447F7EE6F@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Oct 2022 09:46:21 -0700
Message-ID: <CAMKF1sp2X+qqEC-4-pKU0JyFoMqUCNPkXX4yZ7n-d9DRuKFFow@mail.gmail.com>
Subject: Re: [oe][meta-webserver][PATCH] meta-webserver: nginx: Add ipv6 support
To: Ross Burton <ross.burton@arm.com>
Cc: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 16:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99323

On Thu, Oct 27, 2022 at 9:11 AM Ross Burton <ross.burton@arm.com> wrote:
>
> IPv6 is the glorious future, shouldn=E2=80=99t we turn this on?
>
> (or at least, respect the ipv6 distro feature)

yes IPv6 enable under distro_feature knob seems a good thing.

>
> Ross
>
> > On 27 Oct 2022, at 15:20, Joshua Watt via lists.openembedded.org <JPEWh=
acker=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Adds a PACKAGECONFIG to enable ipv6 in nginx
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> > meta-webserver/recipes-httpd/nginx/nginx.inc | 1 +
> > 1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webser=
ver/recipes-httpd/nginx/nginx.inc
> > index dfced3330..33791ec6a 100644
> > --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> > @@ -43,6 +43,7 @@ PACKAGECONFIG[gunzip] =3D "--with-http_gunzip_module,=
,"
> > PACKAGECONFIG[http2] =3D "--with-http_v2_module,,"
> > PACKAGECONFIG[ssl] =3D "--with-http_ssl_module,,openssl"
> > PACKAGECONFIG[http-auth-request] =3D "--with-http_auth_request_module,,=
"
> > +PACKAGECONFIG[ipv6] =3D "--with-ipv6,,"
> >
> > do_configure () {
> >     if [ "${SITEINFO_BITS}" =3D "64" ]; then
> > --
> > 2.33.0
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99322): https://lists.openembedded.org/g/openembedded=
-devel/message/99322
> Mute This Topic: https://lists.openembedded.org/mt/94604935/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

